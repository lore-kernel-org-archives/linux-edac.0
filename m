Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F23E172F
	for <linux-edac@vger.kernel.org>; Thu, 15 Oct 2026 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078432; cv=none; b=kQgu7k2flPffOns1onIT8be03hTJek4c9G0GD0db1OOCx+PWHs0+Gk65agTMQbmpSoNxS1ewK7r3tmnp4PFGQVk9ksBDpQ/JWoLKTSS6OAoVM+FMzsn8Js6CoPRla43tono3E9ou1/cFATAhKzCwY6tm+uG/RLurSqKCqT2rGrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078432; c=relaxed/simple;
	bh=xIsKSaZ15J6nRnEfuzzXZSdo/Z37NoDAuoNVv8bXw50=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9uTmzu+0OtbuxTCwffTInl+5lK0eOngVP6EA8jHlNK48hZWh7MsX7Y677N5sZR9QM3q1Da5tGM9dgXYY+8ev2UtlWgsq9LmdF7m1SrIh83/H0AdrKKvw1aI3ydxDRMLNrXZEgGz5ejfkoCtTqe24mvXWsMRPR5C4dW5sJqKNaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=hpop1ysz; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="hpop1ysz"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7cbcba26055so157967137.2
        for <linux-edac@vger.kernel.org>; Thu, 15 Oct 2026 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792078420; x=1792683220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IofewvjhR0Ae8pfrPVVge9u/2aO2fEHS91BGZ9RvoVo=;
        b=hpop1yszrAQaeSTB0MZVTOzYTkVZrx3j9OjOGRY3TmG9Cl9j4KFfz/jRcajzYK56qR
         d5QxHIkMohTZ1xGq/Ru3nToRSU2gdfTL2NVA/RXP8oQZGo0Ec2Hnj3xOaG9HXaRdbc0p
         YlBr/cLku4oBzI7INa4Bp7Aj1d+XXTHAFl6HZVm6Yus12Vv4XKB8/u3oeCWFr1amTQkZ
         xNas1Nyy4FNp/zwoxSc9ZaIpLpxwMyH94dfUg9RYYik+uYlCNRUfov0xxQxABu/txv3j
         i2KjWMjMIG+TpLOzEeb0oOUclfp7p+2pZmZGrG1zWAUE5qRmzBXHHNtq4Dj4jkZBYhsY
         JdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078420; x=1792683220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IofewvjhR0Ae8pfrPVVge9u/2aO2fEHS91BGZ9RvoVo=;
        b=T/h30U776FJzhsc6yjg4D2lKosAhdkNHf53eH4ZI949rJLbwfD2xDIlFA3qREhsJyn
         FM2Bd1NhyVUrNJhgDtnfP2dDdp8O7JTGieByod0Kx4IGiUhhAoByuj/tjmxSXS3APH5y
         Bm+L0gL57W7W+3GSPVGcs/XGVdNT35O9r5mgBU9alaggUuwZ0gEL6wSFl7DtNCG10bnm
         B8pK29YykoxXOXuITWNdEULfjChqszY0bwdSD8HpXWonPUNcTyGyWBZi42A5++rR1s+b
         FqEoI16WBx9Sk+prvHIyyY5aatvElIewwpDZRMf67Tdj+npjsrsUdxLiJ0f6tpMJPYly
         cbug==
X-Forwarded-Encrypted: i=1; AKwUvBzIvFxG1jcvbixMd+23eF+noW/OLZKKw5NmXi4y89134LTlaWoFgx882uF4mZPI/tYuvOHTkAnJd9Gb@vger.kernel.org
X-Gm-Message-State: AFq9FYIRv0cqrGZ6rGminKIgFstLDdPt8egb3YuJh2WfhD/BZ0A4GQeN
	qsWtYlCsFGJ7MnhZxM9P5tyL9Ljmrr3R0q0fGh0o8rzaV0NbmN/UCRUwcRO6RZJ6nh4=
X-Gm-Gg: AYBFou3xxmVHTSPQKQjmBF93vF9ufhrqgDZaEIfPvr4LcYSJQTDhiWs/zIbzrof2KvR
	TnsOsIdmykOkdYCVHqhOKKxE9fNOH5R0FwHbkqYbJG3EdfnbCDTD3xps86oM1L4y2gni9wky/+/
	5zHcAiFFY5ERItZpYwJ5wuoeejJolCPGQn3Zq1/lKa6eVe7jeItiyqjfz3mFkCMc/jinH5+MfV6
	Gbzu1csL8/Uwr0mjlJOrsEPRJUBCoTewYEUIJ1fm5jAk1wmgIhr+1SONpvbGcb3ge8dWjl3YYae
	ZLbCXp9DM/OLl4FtQeJXSgJzBUEmikKSVd5Kuvk3nR/Fdl6oPD2dYj9qV9qj772decRqwWmXZKk
	0F/49ORHxmy8xdJHKcXcysv1BgYgu+sGXmCqM9VAD5PgS996xw8qzVIsogEeqqe3GHq+9qduQNN
	oVPlHxcgG/IR6q7rYj7fnNCt5HjMHqmgOTYgjOvhPqNAcEo1vkFvgGAOWf+F5SSXCAZeV/fR9vR
	gyj4LZeXsI7mO6HEVea9SfzRBhMChQxq1/oXqUV9hrhn9Cru9pa7Bw4qdlhS7PUVVQZ6SSZzhwA
	sUG6KMV5nc8OA5rmoJQ=
X-Received: by 2002:a05:6102:8088:b0:7c1:62d2:e18a with SMTP id ada2fe7eead31-7cb372f3a68mr6949040137.16.1792078420419;
        Thu, 15 Oct 2026 08:33:40 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f66ad9sm12986347241.10.2026.10.15.08.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:33:39 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: kees@kernel.org,
	rppt@kernel.org,
	juri.lelli@redhat.com,
	nik.borisov@suse.com,
	tglx@kernel.org,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	vincent.guittot@linaro.org,
	bp@alien8.de,
	thorsten.blum@linux.dev,
	cgroups@vger.kernel.org,
	tony.luck@intel.com,
	david@kernel.org,
	mingo@redhat.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	seanjc@google.com,
	ljs@kernel.org,
	zhangguopeng@kylinos.cn,
	dietmar.eggemann@arm.com,
	mhocko@suse.com,
	vinicius.gomes@intel.com,
	tj@kernel.org,
	vbabka@kernel.org,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	surenb@google.com,
	hpa@zytor.com,
	x86@kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	tim.c.chen@linux.intel.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rostedt@goodmis.org,
	gmonaco@redhat.com,
	jgross@suse.com,
	mgorman@suse.de,
	graf@amazon.com,
	linux-edac@vger.kernel.org,
	liam@infradead.org,
	ridong.chen@linux.dev,
	longman@redhat.com,
	bsegall@google.com
Subject: [PATCH v1 3/8] x86/mce/intel: Bound cmci_rediscover() to a single topology peer
Date: Thu, 15 Oct 2026 11:33:26 -0400
Message-ID: <20261015153331.1872641-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261015153331.1872641-1-pasha.tatashin@soleen.com>
References: <20261015153331.1872641-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a CPU goes offline, cmci_clear() disables CMCI on any MCA banks
owned by that CPU, and mce_cpu_dead() calls cmci_rediscover(). Currently
cmci_rediscover() invokes on_each_cpu(cmci_rediscover_work_func, NULL, 1),
sending a synchronous broadcast IPI to every online CPU in the system,
all of which contend on the global cmci_discover_lock while reading up
to 32 MSR_IA32_MCx_CTL2 MSRs.

Any bank disabled by cmci_clear() is either thread-private, core-scoped
(shared between SMT threads of the same physical core), L2-cluster-scoped,
die-scoped, or package-scoped:
1. Any bank index that is already owned by the target peer in its own
   mce_banks_owned bitmap is private to a narrower scope than the shared
   level and will be skipped by cmci_skip_bank() on the target anyway.
2. Core- or cluster-shared MCA banks can only be claimed by an online
   SMT sibling or L2 cluster peer.
3. Shared die-scoped or package-scoped uncore banks can be claimed in a
   single pass by one online peer on the same die or package.

Record the bitmap of banks disabled by __cmci_disable_bank() in
cmci_orphaned_banks, select a single online topology peer
cmci_orphaned_target (SMT sibling, L2 cluster peer, die peer, or package
peer) in cmci_clear(), and mask out any bank indices already owned by
that target peer. In cmci_rediscover(), return immediately when
cmci_orphaned_banks is empty; otherwise probe only cmci_orphaned_target
via a single smp_call_function_single() call.

2-socket, 480-CPU Intel Xeon 6985P-C (N=479, mean of 10 runs):
  Offline:  11.42 s ->  9.63 s (-15.7%)
  Online:   11.08 s -> 11.11 s
  Total:    22.50 s -> 20.74 s (-7.8%)
  cmci_rediscover() (cpu479 offline):
    7,720.6 us -> 0.6 us (-99.99%)

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/kernel/cpu/mce/intel.c | 57 +++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/intel.c b/arch/x86/kernel/cpu/mce/intel.c
index 4655223ba5606..f57718b097d9b 100644
--- a/arch/x86/kernel/cpu/mce/intel.c
+++ b/arch/x86/kernel/cpu/mce/intel.c
@@ -11,6 +11,7 @@
 #include <linux/percpu.h>
 #include <linux/sched.h>
 #include <linux/cpumask.h>
+#include <linux/topology.h>
 #include <asm/apic.h>
 #include <asm/cpufeature.h>
 #include <asm/cpu_device_id.h>
@@ -40,6 +41,8 @@
  * owned by the offlined cpu.
  */
 static DEFINE_PER_CPU(mce_banks_t, mce_banks_owned);
+static mce_banks_t cmci_orphaned_banks;
+static unsigned int cmci_orphaned_target;
 
 /*
  * cmci_discover_lock protects against parallel discovery attempts
@@ -244,6 +247,7 @@ static void cmci_claim_bank(int bank, u64 val, int bios_zero_thresh, int *bios_w
 
 	/* This CPU successfully set the enable bit. */
 	set_bit(bank, (void *)this_cpu_ptr(&mce_banks_owned));
+	__clear_bit(bank, cmci_orphaned_banks);
 
 	if ((val & MCI_CTL2_CMCI_THRESHOLD_MASK) == CMCI_STORM_THRESHOLD) {
 		pr_notice("CPU%d BANK%d CMCI inherited storm\n", smp_processor_id(), bank);
@@ -328,6 +332,7 @@ static void __cmci_disable_bank(int bank)
 	val &= ~MCI_CTL2_CMCI_EN;
 	wrmsrq(MSR_IA32_MCx_CTL2(bank), val);
 	__clear_bit(bank, this_cpu_ptr(mce_banks_owned));
+	__set_bit(bank, cmci_orphaned_banks);
 
 	if ((val & MCI_CTL2_CMCI_THRESHOLD_MASK) == CMCI_STORM_THRESHOLD)
 		cmci_storm_end(bank);
@@ -339,6 +344,8 @@ static void __cmci_disable_bank(int bank)
  */
 void cmci_clear(void)
 {
+	unsigned int cpu = smp_processor_id();
+	unsigned int target;
 	unsigned long flags;
 	int i;
 	int banks;
@@ -346,8 +353,31 @@ void cmci_clear(void)
 	if (!cmci_supported(&banks))
 		return;
 	raw_spin_lock_irqsave(&cmci_discover_lock, flags);
+	bitmap_zero(cmci_orphaned_banks, MAX_NR_BANKS);
+	/*
+	 * A bank is shared by the CPUs of one SMT core, L2 cluster, die or
+	 * package, and these scopes nest. The first online peer found from
+	 * the innermost scope outwards is therefore part of every sharing
+	 * scope that still has an online CPU, so it alone can claim every
+	 * orphaned bank that is still claimable. If it already owns an index,
+	 * the instance released here is not shared with it, hence not with
+	 * any online CPU, and that index can be dropped from the rediscovery.
+	 */
+	target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
+	if (target >= nr_cpu_ids)
+		target = cpumask_any_but(topology_cluster_cpumask(cpu), cpu);
+	if (target >= nr_cpu_ids)
+		target = cpumask_any_but(topology_die_cpumask(cpu), cpu);
+	if (target >= nr_cpu_ids)
+		target = cpumask_any_but(topology_core_cpumask(cpu), cpu);
+	cmci_orphaned_target = target;
 	for (i = 0; i < banks; i++)
 		__cmci_disable_bank(i);
+	if (target < nr_cpu_ids)
+		bitmap_andnot(cmci_orphaned_banks, cmci_orphaned_banks,
+			      per_cpu(mce_banks_owned, target), MAX_NR_BANKS);
+	else
+		bitmap_zero(cmci_orphaned_banks, MAX_NR_BANKS);
 	raw_spin_unlock_irqrestore(&cmci_discover_lock, flags);
 }
 
@@ -360,15 +390,38 @@ static void cmci_rediscover_work_func(void *arg)
 		cmci_discover(banks);
 }
 
-/* After a CPU went down cycle through all the others and rediscover */
+/*
+ * After a CPU went down, rediscover orphaned shared banks on a single
+ * topology peer (SMT sibling, L2 cluster peer, die peer, or package peer)
+ * selected in cmci_clear(). Core-private banks whose core is now completely
+ * offline cannot be claimed by any other core, so probing more than one
+ * peer is redundant.
+ */
 void cmci_rediscover(void)
 {
+	unsigned int target;
+	unsigned long flags;
+	bool orphaned;
 	int banks;
 
 	if (!cmci_supported(&banks))
 		return;
 
-	on_each_cpu(cmci_rediscover_work_func, NULL, 1);
+	raw_spin_lock_irqsave(&cmci_discover_lock, flags);
+	orphaned = !bitmap_empty(cmci_orphaned_banks, MAX_NR_BANKS);
+	target = cmci_orphaned_target;
+	raw_spin_unlock_irqrestore(&cmci_discover_lock, flags);
+
+	if (!orphaned)
+		return;
+
+	if (target < nr_cpu_ids && cpu_online(target))
+		smp_call_function_single(target, cmci_rediscover_work_func,
+					 NULL, 1);
+
+	raw_spin_lock_irqsave(&cmci_discover_lock, flags);
+	bitmap_zero(cmci_orphaned_banks, MAX_NR_BANKS);
+	raw_spin_unlock_irqrestore(&cmci_discover_lock, flags);
 }
 
 /*
-- 
2.56.0.385.gd3acb90ef8-goog

