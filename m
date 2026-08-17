Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36D018E02A;
	Mon, 17 Aug 2026 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001280; cv=none; b=b9H6z3MGj7npE1ft/ikbeIPVzLGumq6xS8p7f05Gdr1CBL/0FtVClL5Vd5yMri+60eUXtO8FPYV6/ukeRrUt4Q56ruFuA+k8Ttx/8257uAQPkdewt/NdciZf3eLDd6BHSqXfg6RsNz9yk4pPjJ+fcN/axl4ICsx/mNVwqOvpmGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001280; c=relaxed/simple;
	bh=0Rv7NdQtmQ4fepQ/E0KbzEogFZNNWDMAwEM+R8MvYC8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fjozm1siocXLdqQ6iM5FdQ3ryI76nZJ+Fy+9N39ulk7/Nso14AVnvdhQqw/lfX8t3kVJJAP76w8P+YrL83XqGsrrsJzQ9kt9SgppoVyM5RKf/l+hnt8CZ1S5GgDL+Lv9kBqiyWgCTI9NDqxUd/Vv5Kb5vpf/WlzhIcc6VFNkVGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHFZPn5G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHFZPn5G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C899C1F00A3A;
	Mon, 17 Aug 2026 21:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787001278;
	bh=XpWrrCf/UZVHJqT72sHUOhaWn2YvJkh2BjXNlpOff08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lHFZPn5GqqaibcwBmiBHx87G7Do5IB3D4dPMP9mRKNdTReqxw6g4mhYwdymgxG2nM
	 syFtBMarb6sq3vQIDjF8nbTBnkeCRMvuoktQ02k/X8K0p8fxue0b3fnHocs01mgphT
	 11sIE1AezTkUjWovRDKdYKt7BUmfCq99sQwXbBXxJAfQSIVu6ok98PBzC3O5khSg0o
	 d98nWgQt1lY2cp6Rc6KHaiAdC+TM80bOP5rDBhr6/eL/P4AJ9UlOdYKBX93ZgHcti5
	 SrU0mvR61Jmi5rRLQf9nCBUfAfUQl88gPubxWyInYvcxVyaKMLq7ETnd4vkb8czJ9a
	 nOscO5/9F8qBg==
From: Thomas Gleixner <tglx@kernel.org>
To: syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org
Subject: Re: [syzbot] [kernel?] general protection fault in timers_dead_cpu
In-Reply-To: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
Date: Mon, 17 Aug 2026 23:14:35 +0200
Message-ID: <87ik58la9w.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 14 2026 at 00:28, syzbot wrote:
> HEAD commit:    db2ddb871435 Linux 7.2-rc7
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14ec2149580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307

This has NUMA_EMU=y. Either turn it off or add '-smp 2,sockets=2' to the
qemu command line. Otherwise the topology code is unhappy.

> dashboard link: https://syzkaller.appspot.com/bug?extid=74de56995244fe32ffe2
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ec2149580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16d962c6580000
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-db2ddb87.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/698def9fcf7a/vmlinux-db2ddb87.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/fd8b6091a563/bzImage-db2ddb87.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com
>
> smpboot: CPU 1 is now offline
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> CPU: 2 UID: 0 PID: 6237 Comm: syz.2.92 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:__hlist_del include/linux/list.h:1029 [inline]
> RIP: 0010:detach_timer kernel/time/timer.c:891 [inline]
> RIP: 0010:migrate_timer_list kernel/time/timer.c:2493 [inline]
> RIP: 0010:timers_dead_cpu+0x326/0x860 kernel/time/timer.c:2541

This happens because the reproducer does two things in parallel:

  1) Hotplug CPU1

  2) Toggle /sys/devices/system/machinecheck/machinecheck0/ignore_ce

#2 is not serialized against CPU hotplug so it can end up interfering
with the hotplug operation:

CPU0                    CPU1

hotplug
 kick_ap()
 wait_for_ap()
                        hotplug
                        mce_cpu_pre_down()
                          mce_disable_cpu();
                          timer_delete_sync();

                        // CPU is still marked online

set_ignore_ce()
  on_each_cpu(mce_enable_ce, (void *)1, 1);

                        IPI
                          timer_start()

                        ....

hotplug

 timers_dead_cpu()
   migrate timer to CPU0
   
   // Migrates the MCE timer of CPU1, which is a bug in itself

...

hotplug
  bringup_ap()
                        ...
                        identify_secondary_cpu()
                           mcheck_cpu_init()
                             __mcheck_cpu_setup_timer()
                                timer_setup() <- FAIL

That re-initializes the active timer, which is now queued on CPU0.

What puzzled me was that debugobjects did not catch that issue. It
turned out that during some rework the debug_activate() invocation for
the timer migration case got lost. So debugobjects carries the wrong
state. That's easy to fix:

--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -2492,6 +2492,7 @@ static void migrate_timer_list(struct timer_base *new_base, struct hlist_head *h
 		timer = hlist_entry(head->first, struct timer_list, entry);
 		detach_timer(timer, false);
 		timer->flags = (timer->flags & ~TIMER_BASEMASK) | cpu;
+		debug_timer_activate(timer);
 		internal_add_timer(new_base, timer);
 	}
 }

With that it catches the culprit as expected:

 ODEBUG: init active (active state 0) object: ffff88827be234a0 object type: timer_list hint: mce_timer_fn+0x0/0x280
 WARNING: lib/debugobjects.c:632 at debug_print_object+0xec/0x230, CPU#1: swapper/1/0
 CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 7.2.0-dirty #274 PREEMPT(full)
 RIP: 0010:debug_print_object+0x18a/0x230
 Call Trace:
  __debug_object_init+0x230/0x3c0
  timer_init_key+0x5c/0x2e0
  mcheck_cpu_init+0x3e1/0x600
  identify_cpu+0x1e03/0x3660
  identify_secondary_cpu+0xaa/0x160
  ap_starting+0xa1/0x150
  start_secondary+0x66/0x110
  common_startup_64+0x13e/0x157

The knee jerk "fix" is to serialize against CPU hotplug in
set_ignore_ce() and the other sysfs write functions which can result in
exactly the same problem. It's not only the timer. CMCI suffers from the
same issue that it can be reenabled via sysfs between the
"x86/mce:online" state and going completely offline. Haven't looked
further, but that seems to be a general design problem in that code.

But guarding against hotplug alone solves it only partially because with
partial hotplug the same issue happens when:

   1) a partial hotplug goes below the "x86/mce:online" state which
      disarms the timer, but stops before the CPU is marked offline

   2) set_ignore_ce() or one of the other sysfs write functions
      reenables it

   3) a subsequent hotplug operation brings the CPU completely down.

The below quick hack, which I'm not proud of, cures it. I let the MCE
wizards think about the underlying design problem and let them come up
with a hopefully nicer solution.

Thanks,

        tglx
---

--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -68,6 +68,8 @@ static DEFINE_MUTEX(mce_sysfs_mutex);
 
 #define SPINUNIT		100	/* 100ns */
 
+static struct cpumask mce_active_cpus;
+
 DEFINE_PER_CPU_READ_MOSTLY(unsigned int, mce_num_banks);
 
 DEFINE_PER_CPU_READ_MOSTLY(struct mce_bank[MAX_NR_BANKS], mce_banks_array);
@@ -2459,6 +2461,8 @@ static void mce_cpu_restart(void *data)
 {
 	if (!mce_available(raw_cpu_ptr(&cpu_info)))
 		return;
+	if (!cpumask_test_cpu(smp_processor_id(), &mce_active_cpus))
+		return;
 	__mcheck_cpu_init_generic();
 	__mcheck_cpu_init_prepare_banks();
 	__mcheck_cpu_init_timer();
@@ -2478,6 +2482,8 @@ static void mce_disable_cmci(void *data)
 {
 	if (!mce_available(raw_cpu_ptr(&cpu_info)))
 		return;
+	if (!cpumask_test_cpu(smp_processor_id(), &mce_active_cpus))
+		return;
 	cmci_clear();
 }
 
@@ -2485,6 +2491,8 @@ static void mce_enable_ce(void *all)
 {
 	if (!mce_available(raw_cpu_ptr(&cpu_info)))
 		return;
+	if (!cpumask_test_cpu(smp_processor_id(), &mce_active_cpus))
+		return;
 	cmci_reenable();
 	cmci_recheck();
 	if (all)
@@ -2540,6 +2548,7 @@ static ssize_t set_bank(struct device *s
 	b->ctl = new;
 
 	mutex_lock(&mce_sysfs_mutex);
+	guard(cpus_read_lock)();
 	mce_restart();
 	mutex_unlock(&mce_sysfs_mutex);
 
@@ -2557,6 +2566,7 @@ static ssize_t set_ignore_ce(struct devi
 
 	mutex_lock(&mce_sysfs_mutex);
 	if (mca_cfg.ignore_ce ^ !!new) {
+		guard(cpus_read_lock)();
 		if (new) {
 			/* disable ce features */
 			mce_timer_delete_all();
@@ -2584,6 +2594,7 @@ static ssize_t set_cmci_disabled(struct
 
 	mutex_lock(&mce_sysfs_mutex);
 	if (mca_cfg.cmci_disabled ^ !!new) {
+		guard(cpus_read_lock)();
 		if (new) {
 			/* disable cmci */
 			on_each_cpu(mce_disable_cmci, NULL, 1);
@@ -2610,6 +2621,7 @@ static ssize_t store_int_with_restart(st
 		return ret;
 
 	mutex_lock(&mce_sysfs_mutex);
+	guard(cpus_read_lock)();
 	mce_restart();
 	mutex_unlock(&mce_sysfs_mutex);
 
@@ -2730,6 +2742,8 @@ static void mce_disable_cpu(void)
 	if (!mce_available(raw_cpu_ptr(&cpu_info)))
 		return;
 
+	cpumask_clear_cpu(smp_processor_id(), &mce_active_cpus);
+
 	if (!cpuhp_tasks_frozen)
 		cmci_clear();
 
@@ -2752,6 +2766,8 @@ static void mce_reenable_cpu(void)
 		if (b->init)
 			wrmsrq(mca_msr_reg(i, MCA_CTL), b->ctl);
 	}
+
+	cpumask_set_cpu(smp_processor_id(), &mce_active_cpus);
 }
 
 static int mce_cpu_dead(unsigned int cpu)
