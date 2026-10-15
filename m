Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7A535DA7B
	for <linux-edac@vger.kernel.org>; Thu, 15 Oct 2026 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078439; cv=none; b=C3AQC9tnvZUHTaTT7ZLJRWj6u/h8lyD+8QR48wvwfNlgDcgt3/g58ipqojCzHMutoRAx+igVrLdB7GAe/0mDDnGUgGWkHBtEtliNg7wB8ZV47Dfq6cMvTampZK6SiURsZxgVR1EfaQFtweqwTq1mt4XtdkQnHfPPQ34otOpQA24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078439; c=relaxed/simple;
	bh=pInOOQJmC+exJgomtDsmGTSAzIbtk8stOtgVAuykFHo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOYhHIA6fkYbVfjc/NItAdKhiIBCjjeBdXZtUKVJILHUElP8+apCSJhqCEhmlR8LiA7nGCveEL6JrHYElazZkKIvc+l1Oat8xSyWjaDlIBVjUj12Y7x4NwLxrOkrlAiW+l0p1cIR+yss2/nmFAwJ7uaWcdFbJtAL/I3cZHHe3Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=arfBvT7y; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="arfBvT7y"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7c03744ef27so535269137.1
        for <linux-edac@vger.kernel.org>; Thu, 15 Oct 2026 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792078423; x=1792683223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=72zF3yLWX3oeYl+y53VRvYROQBmMjAwdTi7nEp+9VUA=;
        b=arfBvT7yf0Oauqa4m7owwqeUgbXiELvgnoqsScp23YRc5e2hGrN6dmnMb0cieqh5NI
         3e0aG0sUxPNyYpiMzpVlL7wSgjipjYozuFkZZIH6Tmhr9RSln40oTPRZ72/b4y5RR9QJ
         FBryxvAHc7fz6G7LLZuveqOd2mZWKIiKaFriwIURcngaoQ6RJAQ7Bl8nSqCd6myTwoEL
         IHfn1pJDMd5AM+QAZFGFG2bspCJzVGdeMKirjLGZFedWdoV2zZKO8E7MihLZVvdL1Ag5
         lr1oDkcEzkiED73U1KMWpf+m6w3eR3YqNlzbgNbziCraVO+HrKuWBWBFI2sItjUFBP4o
         9/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078423; x=1792683223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=72zF3yLWX3oeYl+y53VRvYROQBmMjAwdTi7nEp+9VUA=;
        b=OFs3ol80aYHL303xBQLQmwKoaU/uvoZoLSkLiWLQA9WVq4pI6Bjze9aI85L7tWkoqq
         2UIqf6o/ZLZ0/MESgZyySWsivPLosxl5hy01UVTqnKWy5Recf2pJwPC5HBVyI+XdYFsY
         7sCtLEgLU8OGlV7xY6/QOaL4zR4iIpHnyFt58OcLPf6Dio/c59ukKcKrXksk6MeVLdIh
         pzWrX7FMI9xtXxcFmlIaUAUtIeIIVMxFfPGjqXm1+5YOexaUuqERC70PrXRmRZbopO/I
         pnlxaEAfg/0tpEO7ikPQoYkzNkxMQFFG4aPk9BbvYa0w+dwMkwxiVFkybWpGknZC3f0E
         dN8g==
X-Forwarded-Encrypted: i=1; AKwUvBzeTU691UprsyZdNDHQoBe+8gJUQbpxZtAdQn7TLLgCrLjL3ecyaeIz68k4xIcGDD4X8hgKxOukxb06@vger.kernel.org
X-Gm-Message-State: AFq9FYJp5gaCTy44YT5rLRCP825EUFYNSARTAqwckF8GZ8gCql7Vu0Qs
	2peJXNDVLV0ZZ989RBmUw9fOWfnblrgwjo1S2mc9r3EkwSD9P8qCqTT4CR9/mTNTU2w=
X-Gm-Gg: AYBFou1TVxxOo9Oqlw8LqrDDnz0DNTQWvhMiGOw2qKVbkEO5376lCXJN5z0eILrMngM
	XP5WNcUcSrYS8Wdjo8rSA8caXRuKBIeS7vMXBWZCf9aSLdyFA8i+gFD7xFyJb6Di5XLXXefvhRm
	z4820czvz29oi4Kz8C9yW/Ykan5Vcp9uSiFaghfVmI7N/DHrWIADqMj1VqOmIIfAiot8mjcWjeN
	eyMehRjnjmtMWPx7F2nSrwg0U6XZLOaRw9363lJeZVuM9kVE0UEyhTfWxZ9g8GKJTo/TFgbacyM
	QjradTe1WR3WUKIhs9pyxYri/ARHz9lX87OygQj4bX7nrVdAlzbEKQaZl8I1Vzab1TEF3M0+/rr
	dlTogaRUJ47Yx2o6AwOZY8BYWHW4/5osJMAjKkHg8gjpmo396yPj6dpqm3SmxCSYOP1WUgFpK8l
	lH4Q+nJikRivzgylDELZS0x3yMck9MG+rBtEWGrfgOB/VMRu66WaI6BgIWGoWHqT0UoTfmp0fQv
	2ihcOTE2C5HnwpdclY1vj747H4a0PJB9aQTOr3d2FZnHEHoftqYBo+slwOpsVB1QNdyPPeoyjfa
	2FUPr9BO6gxR+dIZe3k=
X-Received: by 2002:a05:6102:c4a:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7cb37b3015cmr4260402137.37.1792078421907;
        Thu, 15 Oct 2026 08:33:41 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f66ad9sm12986347241.10.2026.10.15.08.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:33:41 -0700 (PDT)
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
Subject: [PATCH v1 4/8] x86/cacheinfo, mtrr: Skip stop_machine rendezvous in cache_ap_online() when MTRRs match
Date: Thu, 15 Oct 2026 11:33:27 -0400
Message-ID: <20261015153331.1872641-5-pasha.tatashin@soleen.com>
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

When a single CPU is brought online at runtime
(cache_aps_delayed_init == false), cache_ap_online() unconditionally
calls stop_machine_from_inactive_cpu() to rendezvous all online CPUs
while the incoming AP runs cache_cpu_init() to disable caches
(CR0.CD = 1, plus wbinvd() when X86_FEATURE_SELFSNOOP is not set),
reprogram MTRRs via mtrr_generic_set_state(), and re-enable caches.

During initial boot (cache_aps_init()) and across warm CPU offline/online
cycles, the AP's hardware MTRR MSRs have already been programmed to match
the saved mtrr_state. Stopping all online CPUs in stop_machine (and
flushing caches on the AP) when the AP's MTRRs already match mtrr_state
is unnecessary.

Add mtrr_generic_state_matches() to compare the local CPU's
MSR_MTRRdefType, variable MTRR ranges, and fixed MTRR ranges against
mtrr_state (including k8_check_syscfg_dram_mod_en() on AMD), and check it
on the AP in cache_ap_online() before invoking
stop_machine_from_inactive_cpu(). If the hardware MTRRs already match
mtrr_state, initialize PAT locally on the AP and return.

2-socket, 480-CPU Intel Xeon 6985P-C (N=479, mean of 10 runs):
  Offline:   9.63 s ->  9.85 s
  Online:   11.11 s ->  8.69 s (-21.8%)
  Total:    20.74 s -> 18.54 s (-10.6%)
  cache_ap_online() (cpu479 online):
    7,704.0 us -> 4.7 us (-99.94%)

2-socket, 512-CPU AMD EPYC 9B45 (N=511, mean of 10 runs):
  Offline:   4.53 s ->  4.51 s (-0.4%)
  Online:    3.92 s ->  3.15 s (-19.6%)
  Total:     8.45 s ->  7.66 s (-9.3%)
  cache_ap_online() (cpu511 online):
    1,354.6 us -> 6.4 us (-99.53%)

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/include/asm/mtrr.h        |  2 ++
 arch/x86/kernel/cpu/cacheinfo.c    |  7 +++++
 arch/x86/kernel/cpu/mtrr/generic.c | 49 ++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/arch/x86/include/asm/mtrr.h b/arch/x86/include/asm/mtrr.h
index 76b95bd1a4058..0527e216808c4 100644
--- a/arch/x86/include/asm/mtrr.h
+++ b/arch/x86/include/asm/mtrr.h
@@ -61,6 +61,7 @@ extern int amd_special_default_mtrr(void);
 void mtrr_disable(void);
 void mtrr_enable(void);
 void mtrr_generic_set_state(void);
+bool mtrr_generic_state_matches(void);
 #  else
 static inline void guest_force_mtrr_state(struct mtrr_var_range *var,
 					  unsigned int num_var,
@@ -106,6 +107,7 @@ static inline int mtrr_trim_uncached_memory(unsigned long end_pfn)
 #define mtrr_disable() do {} while (0)
 #define mtrr_enable() do {} while (0)
 #define mtrr_generic_set_state() do {} while (0)
+static inline bool mtrr_generic_state_matches(void) { return true; }
 #  endif
 
 #ifdef CONFIG_COMPAT
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 13ed16527905f..64796d5b34fdc 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -770,6 +770,13 @@ static int cache_ap_online(unsigned int cpu)
 	if (!memory_caching_control || get_cache_aps_delayed_init())
 		return 0;
 
+	if (!(memory_caching_control & CACHE_MTRR) ||
+	    mtrr_generic_state_matches()) {
+		if (memory_caching_control & CACHE_PAT)
+			pat_cpu_init();
+		return 0;
+	}
+
 	/*
 	 * Ideally we should hold mtrr_mutex here to avoid MTRR entries
 	 * changed, but this routine will be called in CPU boot time,
diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index 67cf69f24b005..8760a7b4dc38b 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -981,6 +981,55 @@ void mtrr_generic_set_state(void)
 	}
 }
 
+bool mtrr_generic_state_matches(void)
+{
+	struct msr val;
+	unsigned int i;
+
+	if (!cpu_feature_enabled(X86_FEATURE_MTRR))
+		return true;
+
+	rdmsrq(MSR_MTRRdefType, val.q);
+	if ((val.l & MTRR_DEF_TYPE_TYPE) != mtrr_state.def_type ||
+	    ((val.l & MTRR_DEF_TYPE_ENABLE) >> MTRR_STATE_SHIFT) != mtrr_state.enabled)
+		return false;
+
+	for (i = 0; i < num_var_ranges; i++) {
+		struct mtrr_var_range *vr = &mtrr_state.var_ranges[i];
+
+		rdmsrq(MTRRphysBase_MSR(i), val.q);
+		if ((vr->base_lo & ~MTRR_PHYSBASE_RSVD) != (val.l & ~MTRR_PHYSBASE_RSVD) ||
+		    (vr->base_hi & ~phys_hi_rsvd) != (val.h & ~phys_hi_rsvd))
+			return false;
+
+		rdmsrq(MTRRphysMask_MSR(i), val.q);
+		if ((vr->mask_lo & ~MTRR_PHYSMASK_RSVD) != (val.l & ~MTRR_PHYSMASK_RSVD) ||
+		    (vr->mask_hi & ~phys_hi_rsvd) != (val.h & ~phys_hi_rsvd))
+			return false;
+	}
+
+	if (mtrr_state.have_fixed) {
+		u64 *saved = (u64 *)mtrr_state.fixed_ranges;
+		int block = -1, range;
+
+		/*
+		 * Ensure MtrrFixDramModEn is clear so fixed MTRR reads do not
+		 * expose K8 RdMem/WrMem bits and cause false mismatches.
+		 */
+		k8_check_syscfg_dram_mod_en();
+
+		while (fixed_range_blocks[++block].ranges) {
+			for (range = 0; range < fixed_range_blocks[block].ranges; range++) {
+				rdmsrq(fixed_range_blocks[block].base_msr + range, val.q);
+				if (val.q != *saved++)
+					return false;
+			}
+		}
+	}
+
+	return true;
+}
+
 /**
  * generic_set_mtrr - set variable MTRR register on the local CPU.
  *
-- 
2.56.0.385.gd3acb90ef8-goog

