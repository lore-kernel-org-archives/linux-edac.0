Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB3C264F80;
	Mon, 17 Aug 2026 22:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787004770; cv=none; b=UvkWXI/OokxkzvpJtN5fT/+GjXtTS+MJUT4aO5L8O1dUxxnInlkz8fhu6faYr6oqBDaiZe5qPs3qGzVK81Iws64SQSjXYb30r8ly5yMcaJjgFLQFKc38kM+jz/NpRXnRrfg65qhmFanAcEkQ2M7XTJz6Ogj5Wb/Q62J7xHqY2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787004770; c=relaxed/simple;
	bh=HU8UCG2w5F4nEKXpBPX/2gaWQ02f8Uz6EZwi9/Vvaxo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZOanzQNkWiaZFk309OSjH0cN9Y9KGtShvnjRwNt02WsSHxUv6Rd9Leoks0fXBApxPc3UCCFdTSw4Rzj0RSMiax8wVoJB/lStUqyQjdRK+KEN/lyNo8/YSn1kAccBpt5FkWcMXyiuCm+uSISp0RYjZTfZq578XO9M+vnIWDsw2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLijFkkX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLijFkkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73B51F000E9;
	Mon, 17 Aug 2026 22:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787004768;
	bh=HppbxtXqoI6ZhlpyjFwf8sp50jXvjGSQAmhx2Qnme7w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WLijFkkXLbRQeoy+r0zG9wRu/2gkZxHZNSH175cA5AsgAKKS/LZpmXce3NzIDAoXE
	 Mf8FwsjD6Acg1JxmrT7SJYeeDQ3qJxfWNr8OItDx/UQySlKqE+qahffFYZeSybtMvI
	 ZRchMF2ZVWzzL9iDAbW3KC4EXX/Dizbm3cyYVbI5lutD8GDuwzy29FCRNxBjfcDT02
	 INyYxVpw5PsbzkKiKc2yUk603mdBimOrhESrUhNhgdauUkEONjxJgh3Jag0dbty3e8
	 WYzfjJbK3Eeriozj1eXwZclyhOroZeuqdf6ALONMaynjbIZy/5uikNUn9q92ZrACb7
	 12lP+iwFRyySw==
From: Thomas Gleixner <tglx@kernel.org>
To: syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org
Subject: Re: [syzbot] [kernel?] general protection fault in timers_dead_cpu
In-Reply-To: <87ik58la9w.ffs@fw13>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13>
Date: Tue, 18 Aug 2026 00:12:45 +0200
Message-ID: <87fr0cl7ky.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Aug 17 2026 at 23:14, Thomas Gleixner wrote:
> The below quick hack, which I'm not proud of, cures it. I let the MCE
> wizards think about the underlying design problem and let them come up
> with a hopefully nicer solution.

After talking to Borislav briefly, I came up with less ugly one.

Thanks,

        tglx
---
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1734,8 +1734,13 @@ int memory_failure(unsigned long pfn, in
  */
 static unsigned long check_interval = INITIAL_CHECK_INTERVAL;
 
-static DEFINE_PER_CPU(unsigned long, mce_next_interval); /* in jiffies */
-static DEFINE_PER_CPU(struct timer_list, mce_timer);
+struct mce_poll_state {
+	struct timer_list	timer;
+	unsigned long		next_interval;
+	bool			active;
+};
+
+static DEFINE_PER_CPU(struct mce_poll_state, mce_poll_state);
 
 static void __start_timer(struct timer_list *t, unsigned long interval)
 {
@@ -1764,12 +1769,12 @@ static bool should_enable_timer(unsigned
 
 static void mce_timer_fn(struct timer_list *t)
 {
-	struct timer_list *cpu_t = this_cpu_ptr(&mce_timer);
+	struct mce_poll_state *pst = this_cpu_ptr(&mce_poll_state);
 	unsigned long iv;
 
-	WARN_ON(cpu_t != t);
+	WARN_ON(&pst->timer != t);
 
-	iv = __this_cpu_read(mce_next_interval);
+	iv = pst->next_interval;
 
 	if (mce_available(this_cpu_ptr(&cpu_info)))
 		mc_poll_banks();
@@ -1786,7 +1791,7 @@ static void mce_timer_fn(struct timer_li
 	if (mce_get_storm_mode()) {
 		__start_timer(t, HZ);
 	} else if (should_enable_timer(iv)) {
-		__this_cpu_write(mce_next_interval, iv);
+		pst->next_interval = iv;
 		__start_timer(t, iv);
 	}
 }
@@ -1798,14 +1803,14 @@ static void mce_timer_fn(struct timer_li
  */
 void mce_timer_kick(bool storm)
 {
-	struct timer_list *t = this_cpu_ptr(&mce_timer);
+	struct mce_poll_state *pst = this_cpu_ptr(&mce_poll_state);
 
 	mce_set_storm_mode(storm);
 
 	if (storm)
-		__start_timer(t, HZ);
+		__start_timer(&pst->timer, HZ);
 	else
-		__this_cpu_write(mce_next_interval, check_interval * HZ);
+		pst->next_interval = check_interval * HZ;
 }
 
 /* Must not be called in IRQ context where timer_delete_sync() can deadlock */
@@ -1814,7 +1819,7 @@ static void mce_timer_delete_all(void)
 	int cpu;
 
 	for_each_online_cpu(cpu)
-		timer_delete_sync(&per_cpu(mce_timer, cpu));
+		timer_delete_sync(&per_cpu(mce_poll_state.timer, cpu));
 }
 
 static void __mcheck_cpu_mce_banks_init(void)
@@ -2070,29 +2075,29 @@ static void __mcheck_cpu_clear_vendor(st
 	}
 }
 
-static void mce_start_timer(struct timer_list *t)
+static void mce_start_timer(struct mce_poll_state *pst)
 {
 	unsigned long iv = check_interval * HZ;
 
 	if (should_enable_timer(iv)) {
-		this_cpu_write(mce_next_interval, iv);
-		__start_timer(t, iv);
+		pst->next_interval = iv;
+		__start_timer(&pst->timer, iv);
 	}
 }
 
 static void __mcheck_cpu_setup_timer(void)
 {
-	struct timer_list *t = this_cpu_ptr(&mce_timer);
+	struct mce_poll_state *pst = this_cpu_ptr(&mce_poll_state);
 
-	timer_setup(t, mce_timer_fn, TIMER_PINNED);
+	timer_setup(&pst->timer, mce_timer_fn, TIMER_PINNED);
 }
 
 static void __mcheck_cpu_init_timer(void)
 {
-	struct timer_list *t = this_cpu_ptr(&mce_timer);
+	struct mce_poll_state *pst = this_cpu_ptr(&mce_poll_state);
 
-	timer_setup(t, mce_timer_fn, TIMER_PINNED);
-	mce_start_timer(t);
+	timer_setup(&pst->timer, mce_timer_fn, TIMER_PINNED);
+	mce_start_timer(pst);
 }
 
 bool filter_mce(struct mce *m)
@@ -2459,6 +2464,8 @@ static void mce_cpu_restart(void *data)
 {
 	if (!mce_available(raw_cpu_ptr(&cpu_info)))
 		return;
+	if (!this_cpu_read(mce_poll_state.active))
+		return;
 	__mcheck_cpu_init_generic();
 	__mcheck_cpu_init_prepare_banks();
 	__mcheck_cpu_init_timer();
@@ -2478,6 +2485,8 @@ static void mce_disable_cmci(void *data)
 {
 	if (!mce_available(raw_cpu_ptr(&cpu_info)))
 		return;
+	if (!this_cpu_read(mce_poll_state.active))
+		return;
 	cmci_clear();
 }
 
@@ -2485,6 +2494,8 @@ static void mce_enable_ce(void *all)
 {
 	if (!mce_available(raw_cpu_ptr(&cpu_info)))
 		return;
+	if (!this_cpu_read(mce_poll_state.active))
+		return;
 	cmci_reenable();
 	cmci_recheck();
 	if (all)
@@ -2540,6 +2551,7 @@ static ssize_t set_bank(struct device *s
 	b->ctl = new;
 
 	mutex_lock(&mce_sysfs_mutex);
+	guard(cpus_read_lock)();
 	mce_restart();
 	mutex_unlock(&mce_sysfs_mutex);
 
@@ -2557,6 +2569,7 @@ static ssize_t set_ignore_ce(struct devi
 
 	mutex_lock(&mce_sysfs_mutex);
 	if (mca_cfg.ignore_ce ^ !!new) {
+		guard(cpus_read_lock)();
 		if (new) {
 			/* disable ce features */
 			mce_timer_delete_all();
@@ -2584,6 +2597,7 @@ static ssize_t set_cmci_disabled(struct
 
 	mutex_lock(&mce_sysfs_mutex);
 	if (mca_cfg.cmci_disabled ^ !!new) {
+		guard(cpus_read_lock)();
 		if (new) {
 			/* disable cmci */
 			on_each_cpu(mce_disable_cmci, NULL, 1);
@@ -2610,6 +2624,7 @@ static ssize_t store_int_with_restart(st
 		return ret;
 
 	mutex_lock(&mce_sysfs_mutex);
+	guard(cpus_read_lock)();
 	mce_restart();
 	mutex_unlock(&mce_sysfs_mutex);
 
@@ -2764,21 +2779,23 @@ static int mce_cpu_dead(unsigned int cpu
 
 static int mce_cpu_online(unsigned int cpu)
 {
-	struct timer_list *t = this_cpu_ptr(&mce_timer);
+	struct mce_poll_state *pst = this_cpu_ptr(&mce_poll_state);
 
 	mce_device_create(cpu);
 	mce_threshold_create_device(cpu);
 	mce_reenable_cpu();
-	mce_start_timer(t);
+	mce_start_timer(pst);
+	pst->active = true;
 	return 0;
 }
 
 static int mce_cpu_pre_down(unsigned int cpu)
 {
-	struct timer_list *t = this_cpu_ptr(&mce_timer);
+	struct mce_poll_state *pst = this_cpu_ptr(&mce_poll_state);
 
+	pst->active = false;
 	mce_disable_cpu();
-	timer_delete_sync(t);
+	timer_delete_sync(&pst->timer);
 	mce_threshold_remove_device(cpu);
 	mce_device_remove(cpu);
 	return 0;
