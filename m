Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA88B311977
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 01:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792372498; cv=none; b=j6K2TRn7n79BctCAzeooA2bd8JNWC4/SgGcHPw1KH7yxGEjdOn5fBCi21O8JLgU73lRpMBCsB9wDqFFNZuZBVudspc1gMQcLhLpWHEXh9AXlkpKVhmN3umSDrDynjeawIhcW4iCi33+no9cBr6ddEzBd2/x4rDKuHDdrUG3xVxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792372498; c=relaxed/simple;
	bh=fBWRLRNFXx1jULKjcR84Zfp5/L4R5O4BrM1N22Cd79c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjSRrCCnReI5xC6FNvW/nH4s4rMpdtqlo7tVPo69/L/+phQrag1VeyQbN3a1z6FjCtPT3aHkjkNlizbynV+foRMAQM4XxnmgiOq4lWuia+uUsecFX6FvjHL21i2CvSk9d5WTra/ZDj9eA5GMHCYvy5Q0K170SAY8hTWQ50+GBIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=TtiyUY+W; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="TtiyUY+W"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso627352e0c.0
        for <linux-edac@vger.kernel.org>; Sun, 18 Oct 2026 18:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792372495; x=1792977295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5Uh0UovwmV8EFz8GLwox5sAAEwyuEzq/FgIh/SpVjc=;
        b=TtiyUY+W3wKdAl1zxH7RF3/wmZikaG7G3SqMM10WVJqn++e5zRQ+cV6W/VAzLtJez/
         cYxrDo7k1/fiqUG06SZZKTQ+GTRcas650A8MqFOjxqjaXnT4OCPKTN3QeSvy8WJRgA8T
         RiCvxZghTE6hgczYvffYnj+h6LotNFwEyO597c4Ep5rlSItA7eKkIa3/aJOcY/vamIM6
         JtnyONA8lcZpjzG7C9TkbVPl63JCN+QU9vkpjJX3jk2gKgOPj/+RGRluhPj1vLA8bL4g
         SmvOMwDA2u2QaI9aw7PW/AMDLFTTU0l1ucT+tlPOzDRcHnh9kT9s6TiaYfBg8rkyVbxA
         r8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792372495; x=1792977295;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5Uh0UovwmV8EFz8GLwox5sAAEwyuEzq/FgIh/SpVjc=;
        b=N2m6LjGCgYaP+rtD7YqJZIyCDMDIyvuz3SGYeaJ6CBHqW9Rx/A2S2mzf/7FAbc6O6V
         Ltx+V7S3zN6cFiTeg/D/wOw8wlVp3yX2AcRtic9q5I4ZUsUrUaFDz4hjvbFdL5qplI4J
         o8EuOIAejLhBpFRxPXXJOi7IcFNydfVu1npbi+HV+6G/GcBxXCKfsraBLg5G5I+t46LU
         HST4ULTFlVMp4oEIS9bjhgVdlHOaBS49HLZParm9rHYEGNWfJZmCxm/o8kWskE64y6b8
         UKjafGpy77R2DrgUyHezqvun5Fv4uOqZMFHYVK4vACFncJK+5DA3S9qyEwFNMVrzPKxy
         nnnA==
X-Forwarded-Encrypted: i=1; AKwUvBwAtr4+6pp8IXGEYjFE1lv0y+EbkIjbSQtzcUWROf1bWG1hi0fggjDTAYEq95o4Rfsx7eVDBRTdpqd7@vger.kernel.org
X-Gm-Message-State: AFq9FYKRBlfV6STi/9ovhpooL7XuF6p/qwL9hHJ/Lgo95vGBwBj8/hyx
	MYyRs8q/YlhhJW8K1lWxFyuxcf8X4tTVaOclRWGik2FlSbdmSg18K0o/ueEWcBaA1iU=
X-Gm-Gg: AYBFou1hi2dupigm0eNl8L5V58q550Uky/acRXtgXEce7xDvqdeoOwRLdNy5IM46V0l
	Seu/9RPQBci3EPKc325wL070R8uoX5UX98XxusuRGz3E+DTybi3AHiy9/ItrbJgpBFeLLADQZQO
	yd4HCjs040eR9qy0QBzRPf+IVBPAicxgLa6Dm01YcAKHKFZhlEP+jKnzEyAQnPQmIQvCORORjVX
	e5Hzb1uD9JbnxF4RELbsk83dtTyAawRtdcLscef17iTRlAxgv7JYRjTz+mT/NrwJ/zwEk3/lQq6
	BTyMJqJ4oPq+PWmaOw7898h5bi3KYHA8imxCUOqjfrR1RHKi8+/MxcvrbQPW4m3Gn1O1tUKbILT
	pnc9IXxiTMoPCKT6FbvVOwTxWVhGtLghclEHVo7geBL/PEX6kVCclXKWxnDsnU1dx4dl7ffrKPt
	nfyo3t9nQS78sHLKj2hpMHX79Xyq31Lr4LGFHInHwyLFhg4s+XXMpqv3vIv1KrVHqxS42kImVKH
	/duJ51fcw2nFDySdriEtQlELF2PQ4d7uTfgw6RvV2aFTrNWkLgcipc20zWp6RHIMkHMv48rqMHe
	6zQ6lecT0qlYF/oqci8=
X-Received: by 2002:a05:6122:10e7:b0:5e7:e3f9:1322 with SMTP id 71dfb90a1353d-5eaaa4183dbmr1605940e0c.9.1792372495503;
        Sun, 18 Oct 2026 18:14:55 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b474b2asm8039142e0c.4.2026.10.18.18.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:14:54 -0700 (PDT)
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
	jpoimboe@kernel.org,
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
	blum@kernel.org,
	longman@redhat.com,
	bsegall@google.com
Subject: [PATCH v2 2/8] x86/smp: Remove unnecessary WBINVD from mwait_play_dead()
Date: Sun, 18 Oct 2026 21:14:40 -0400
Message-ID: <20261019011446.834487-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019011446.834487-1-pasha.tatashin@soleen.com>
References: <20261019011446.834487-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a logical CPU goes offline via mwait_play_dead(), it executes
WBINVD before entering the MWAIT loop. On processors with large shared
last-level caches (such as Intel Xeon 6985P-C with 504 MB L3 per
socket), each WBINVD takes ~85-115 ms, flushes and invalidates the
entire socket's shared caches, and stalls the physical core (including
any online SMT sibling on that core) for the duration of the flush.

mwait_play_dead() places the logical processor into an architectural
MWAIT C-state—the same hardware C-states entered by intel_idle during
normal idle without executing WBINVD—where C-states deeper than C1/C1E
flush core-private L1/L2 caches to the coherent LLC on C-state entry
and maintain cache coherency while the package remains powered.

As long as at least one CPU sharing the same LLC on the package remains
online, system-wide cache flushes (wbinvd_on_all_cpus()), system sleep,
and kexec will still flush that shared LLC via the online CPU(s).
However, when the last online CPU in an LLC goes offline, no online CPU
remains to service wbinvd_on_all_cpus() or flush the package before
S3/S4 power removal. Similarly, if the target MWAIT state is C1/C1E
(which does not flush core-private caches) or cache_state_incoherent is
set (e.g., SME), the CPU must flush its caches before entering MWAIT.

Skip WBINVD in mwait_play_dead() when entering a C-state deeper than
C1/C1E while another CPU sharing the same package and LLC remains
online (unless cache_state_incoherent is set).

2-socket, 480-CPU Intel Xeon 6985P-C (N=479, mean of 10 runs):
  Offline:  40.46 s -> 11.42 s (-71.8%)
  Online:   11.14 s -> 11.08 s (-0.5%)
  Total:    51.60 s -> 22.50 s (-56.4%)

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/kernel/smpboot.c | 46 +++++++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index ba01a9e919b7..0dccd2f927bb 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1414,10 +1414,28 @@ void play_dead_common(void)
 	local_irq_disable();
 }
 
-/*
- * We need to flush the caches before going to sleep, lest we have
- * dirty data in our caches when we come back up.
- */
+static bool mwait_play_dead_needs_wbinvd(unsigned int eax_hint)
+{
+	unsigned int cpu = smp_processor_id();
+	u32 pkg_id = topology_physical_package_id(cpu);
+	u32 llc_id = per_cpu_llc_id(cpu);
+	unsigned int i;
+
+	if (cpuhp_tasks_frozen || MWAIT_HINT2CSTATE(eax_hint) < 2 ||
+	    llc_id == BAD_APICID || this_cpu_read(cache_state_incoherent)) {
+		return true;
+	}
+
+	for_each_online_cpu(i) {
+		if (topology_physical_package_id(i) == pkg_id &&
+		    per_cpu_llc_id(i) == llc_id) {
+			return false;
+		}
+	}
+
+	return true;
+}
+
 void __noreturn mwait_play_dead(unsigned int eax_hint)
 {
 	struct mwait_cpu_dead *md = this_cpu_ptr(&mwait_cpu_dead);
@@ -1426,15 +1444,29 @@ void __noreturn mwait_play_dead(unsigned int eax_hint)
 	md->status = CPUDEAD_MWAIT_WAIT;
 	md->control = CPUDEAD_MWAIT_WAIT;
 
-	wbinvd();
+	/*
+	 * Entering MWAIT C-states deeper than C1/C1E/C2 writes back and
+	 * invalidates core-private L1/L2 caches into the shared LLC before
+	 * power-gating the core. While the CPU is still in C0 prior to MWAIT,
+	 * its L1/L2 caches remain coherent and snoop external cache flushes,
+	 * and once in MWAIT its L1/L2 caches are empty and all dirty lines
+	 * reside in the shared LLC. Thus, as long as at least one CPU sharing
+	 * this LLC remains online, any concurrent or subsequent
+	 * wbinvd_on_all_cpus(), system sleep, or kexec will flush the shared
+	 * LLC to memory.
+	 *
+	 * Only flush here during system sleep (cpuhp_tasks_frozen), when
+	 * entering C1/C1E/C2, when the last online CPU in the LLC goes
+	 * offline, or if the CPU's cache state is marked incoherent (e.g. SME).
+	 */
+	if (mwait_play_dead_needs_wbinvd(eax_hint))
+		wbinvd();
 
 	while (1) {
 		/*
 		 * The CLFLUSH is a workaround for erratum AAI65 for
 		 * the Xeon 7400 series.  It's not clear it is actually
 		 * needed, but it should be harmless in either case.
-		 * The WBINVD is insufficient due to the spurious-wakeup
-		 * case where we return around the loop.
 		 */
 		mb();
 		clflush(md);
-- 
2.56.0.176.g3575e65682-goog

