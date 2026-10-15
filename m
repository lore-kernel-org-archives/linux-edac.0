Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FCF23A564
	for <linux-edac@vger.kernel.org>; Thu, 15 Oct 2026 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078439; cv=none; b=WjSMg6/zRsOYPoTbcqk7k+AJnxTYx7b6SBcQ2MOmLun7bCx8H+vtr2skxy+ATsXiFRNDkaLw++WMX0j/ru9BWg2PQ79H173Yo4uqK7LR/TaFiNq6Iz2kj2b53BntNCpSK0w3MIgEFvUZ0MQwFTBCwWhqC8N80eI53ej//x2aa9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078439; c=relaxed/simple;
	bh=81o7s3CUvlSCXr3p0MxpjLPpSp0FVkEo/IZ61TiLCvo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTLHSyQkTOf9CVKW7WjVC2x2umApkqnvBnTSZ7kPD3TSRSlB1UT7dp5R+D1GFLM58uuVq8kj9H4W/ngJ4LU+rb2lErQhBynvybfJOyWkwL377Wda7PFsEjyPrDBLEufyMaG9zArrQtWDthyV6X93T9akWFEhfAkb9OHEunItjWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=YpDIp1L2; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="YpDIp1L2"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7bec5112765so986492137.1
        for <linux-edac@vger.kernel.org>; Thu, 15 Oct 2026 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792078423; x=1792683223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VRVjYPIptXeZue/0tQ2bv1jjJkRW9EshCpZbkUsbSi8=;
        b=YpDIp1L2J2PuIF8czyfFdCPl2VjF+BXIkZE1r3RFgK6YXxABxwPTaSDkkRxegqUSFv
         aFHfv/8yeZqOPDi8K/GIaoyML7Laq5UvClwfOoDFacDWWpkPEn9G50Nyv04LtjL7nxFB
         HPCZRocDNyZVhqDfPsBkNYHaUR9qKsdcdfd2gQwN4a55aqxCG+aUIC8Us2vgKak/zUPq
         WRVUidU6MC8yurOWpCxfCrZ0CM/rRxNn5SyxMtKUC5blFKQk65aUESIXZWfRFcbZlwi9
         uKpi3ZkPyikOhycN1HsAZ+2orqu2231lyqtvSwXKoIXPm4U5aYix5XFkE96UW3TiiIdi
         dxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078423; x=1792683223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VRVjYPIptXeZue/0tQ2bv1jjJkRW9EshCpZbkUsbSi8=;
        b=PGjU+AZ0eOX+C3Lzq/TgDY6L7tMsDLAr1xxZZ7UeCo5SR6yZHDzAGGN+XXeRZyZUfl
         z/8YJ6BLB48jn29DOkyYZXVAVdDqvCKQahH5v/w72gBDDb4Ep+AWaNkiV3UmX6KxxwrA
         xbNuCuLwW8Mekyx/uiN1N95vhcBnoY4L/ZKdfQskE76fDwzdbrv51Wc+hc/MHmuJuMnc
         lHwYtegCJTOL8b3P0baTN+aLueo0gaTT7lcpsL+EVKWn3kfm8yFvLLm7qUdSAQOdYhNu
         bn6pb48AEMr5kXOvbgyW0RAu8fom9XMhDVJl8QDFniinOgWm9MNkNdxXx7V58bLCRSck
         DLZg==
X-Forwarded-Encrypted: i=1; AKwUvBwLHIVzitNuzh2HIiBi1H2UhcuE34DOL0ExVx0HoafotKOJ+fNQ8yXBde6s41hg7F5uizeFZRMz7JL7@vger.kernel.org
X-Gm-Message-State: AFq9FYIL1yzydJHyRoLznW7yid95Hc9NGaf+nOHb5NljsAmWUo9UPC1O
	C3bdwQmsRs6dIY0+WeEP0GUM4BjBENc15XJmJZvVj3zi8JxlHQc6HInGgr/GpOI/MPo=
X-Gm-Gg: AYBFou2Js3UkbUbBJqK6X1UQ0zQXaB98Myp8oee9IdaIICn+Zl+nZ3E8QD9gA9YmdIA
	LHaiXDRMghbcR9rUguaL4qtToRA8Tl+pyqTBZ7S/mE5+GQ/f3UkfsfmGxpDBBdf9Sn6/3Evz1hS
	/gkJ0upbU2kp6+Uw5SN8ksDgM50sckFTTw5DZ7TaTgVaRx88FgZJPY5xmvH/dufg4/Rk0doSX2m
	tAa46w4qdKAcncx36kCOsPBynFStrxEJW2HzOouMV31gPHS1a+gUjzR0E1mfvYlg3EVf1lGWFcS
	0aUAp+xoJJzZSMNbPf9XsyE7nltFZcfAroJk2U5v9VJxIQA4p9YhJUjo5mZwQT/+xBfwd3hHAFQ
	xFSJ2RZGYMLJMy9Mv1Y4MluLQFlmY2y8p00VW2heweTLUHnzHvtl5sJ3coO6J2uS9hcvqBlT1MW
	LAFAiR54lhI0rZBk8riA+VZezwpHGh6bouMzEXcBbWF2Q3/WuLzH9+KQANsfJxbCplwxVaCdPG9
	LIywoOcZ0Y3Bg3dI0mY9sPHGJReQvsoe23pxqNn7cgoUVdaT2FhpEOfOlG0mB2DsiZfTq2jMFoj
	Qcb2qjGN7nddJZWlL+8=
X-Received: by 2002:a05:6102:4427:b0:7a7:19aa:8a88 with SMTP id ada2fe7eead31-7cb3750190amr5949566137.35.1792078423308;
        Thu, 15 Oct 2026 08:33:43 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f66ad9sm12986347241.10.2026.10.15.08.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:33:42 -0700 (PDT)
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
Subject: [PATCH v1 5/8] sched/topology: Avoid redundant O(N^3) group capacity walks and unused allocations in build_sched_domains()
Date: Thu, 15 Oct 2026 11:33:28 -0400
Message-ID: <20261015153331.1872641-6-pasha.tatashin@soleen.com>
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

During sequential CPU hotplug on large systems, build_sched_domains() is
invoked for every CPU offline and online step. Two bottlenecks in the
domain construction path scale poorly with CPU count:

1. On non-overlapping topology levels, all CPUs sharing a domain span
   share the same circular ring of sched_group instances, and on
   overlapping NUMA levels, groups with identical spans share
   sched_group_capacity (sgc). However, init_sched_groups_capacity()
   walks the entire group ring for every CPU in the domain and repeatedly
   recomputes group_weight, cores (walking the group cpumask and clearing
   cpu_smt_mask), and asym_prefer_cpu (O(N^3) bitmap operations per
   hotplug step). Similarly, init_overlap_sched_group() recomputes
   build_balance_mask() and cpumask_weight(sg_span) even when the shared
   sgc was already initialized.

2. __sdt_alloc() and __sds_alloc() upfront-allocate a sched_group,
   sched_group_capacity, and sched_domain_shared for every CPU in cpu_map
   at every topology level, even though get_group() only uses the entry
   for the first CPU of each child domain and d.sds is only used once per
   LLC (plus at most once per SD_ASYM_CPUCAPACITY_FULL domain). All other
   per-CPU allocations are immediately freed unused by
   __free_domain_allocs().

Cache group_weight, cores, and asym_prefer_cpu on struct
sched_group_capacity so init_sched_groups_capacity() computes them once
per shared group capacity, reuse already-initialized sgc instances in
init_overlap_sched_group(), and allocate sdd->sg, sdd->sgc, and d->sds
lazily on demand.

2-socket, 480-CPU Intel Xeon 6985P-C (N=479, mean of 10 runs):
  Offline:   9.85 s ->  5.15 s (-47.7%)
  Online:    8.69 s ->  4.05 s (-53.4%)
  Total:    18.54 s ->  9.20 s (-50.4%)
  build_sched_domains() (cpu479 offline / online):
    35.65 ms -> 10.39 ms (-70.9%) / 35.68 ms -> 9.58 ms (-73.2%)

2-socket, 512-CPU AMD EPYC 9B45 (N=511, mean of 10 runs):
  Offline:   4.51 s ->  3.26 s (-27.7%)
  Online:    3.15 s ->  2.03 s (-35.6%)
  Total:     7.66 s ->  5.29 s (-30.9%)
  build_sched_domains() (cpu511 offline / online):
    11.69 ms -> 5.61 ms (-52.0%) / 12.24 ms -> 5.84 ms (-52.3%)

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/sched/sched.h    |   9 ++
 kernel/sched/topology.c | 183 ++++++++++++++++++++++++----------------
 2 files changed, 117 insertions(+), 75 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf86..b76e2cd695025 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2261,6 +2261,15 @@ struct sched_group_capacity {
 
 	int			id;
 
+	/*
+	 * Build-time cache shared by all groups using this sgc while
+	 * build_sched_domains() runs; not maintained afterwards (e.g. by
+	 * sched_update_asym_prefer_cpu()). Use the sched_group copies.
+	 */
+	unsigned int		group_weight;
+	unsigned int		cores;
+	int			asym_prefer_cpu;
+
 	unsigned long		cpumask[];		/* Balance mask */
 };
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227d983a7..02c38089a80c9 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1259,32 +1259,49 @@ build_group_from_child_sched_domain(struct sched_domain *sd, int cpu)
 	return sg;
 }
 
-static void init_overlap_sched_group(struct sched_domain *sd,
-				     struct sched_group *sg)
+static int init_overlap_sched_group(struct sched_domain *sd,
+				    struct sched_group *sg)
 {
 	struct cpumask *mask = sched_domains_tmpmask2;
 	struct sd_data *sdd = sd->private;
-	struct cpumask *sg_span;
-	int cpu;
+	struct cpumask *sg_span = sched_group_span(sg);
+	struct sched_group_capacity *sgc;
+	int cpu = cpumask_first(sg_span);
+	struct sched_domain *first_sd = *per_cpu_ptr(sdd->sd, cpu);
+
+	sgc = *per_cpu_ptr(sdd->sgc, cpu);
+	if (sgc && atomic_read(&sgc->ref) > 0 &&
+	    first_sd && first_sd->child &&
+	    cpumask_equal(sg_span, sched_domain_span(first_sd->child))) {
+		atomic_inc(&sgc->ref);
+		sg->sgc = sgc;
+		return 0;
+	}
 
 	build_balance_mask(sd, sg, mask);
 	cpu = cpumask_first(mask);
 
-	sg->sgc = *per_cpu_ptr(sdd->sgc, cpu);
-	if (atomic_inc_return(&sg->sgc->ref) == 1)
+	sgc = *per_cpu_ptr(sdd->sgc, cpu);
+	if (!sgc) {
+		sgc = kzalloc_node(sizeof(*sgc) + cpumask_size(),
+				   GFP_KERNEL, cpu_to_node(cpu));
+		if (!sgc)
+			return -ENOMEM;
+		sgc->id = cpu;
+		*per_cpu_ptr(sdd->sgc, cpu) = sgc;
+	}
+
+	sg->sgc = sgc;
+	if (atomic_inc_return(&sg->sgc->ref) == 1) {
 		cpumask_copy(group_balance_mask(sg), mask);
-	else
+		sg->sgc->capacity = SCHED_CAPACITY_SCALE * cpumask_weight(sg_span);
+		sg->sgc->min_capacity = SCHED_CAPACITY_SCALE;
+		sg->sgc->max_capacity = SCHED_CAPACITY_SCALE;
+	} else {
 		WARN_ON_ONCE(!cpumask_equal(group_balance_mask(sg), mask));
+	}
 
-	/*
-	 * Initialize sgc->capacity such that even if we mess up the
-	 * domains and no possible iteration will get us here, we won't
-	 * die on a /0 trap.
-	 */
-	sg_span = sched_group_span(sg);
-	sg->sgc->capacity = SCHED_CAPACITY_SCALE * cpumask_weight(sg_span);
-	sg->sgc->min_capacity = SCHED_CAPACITY_SCALE;
-	sg->sgc->max_capacity = SCHED_CAPACITY_SCALE;
+	return 0;
 }
 
 static struct sched_domain *
@@ -1387,7 +1404,10 @@ build_overlap_sched_groups(struct sched_domain *sd, int cpu)
 		sg_span = sched_group_span(sg);
 		cpumask_or(covered, covered, sg_span);
 
-		init_overlap_sched_group(sibling, sg);
+		if (init_overlap_sched_group(sibling, sg)) {
+			kfree(sg);
+			goto fail;
+		}
 
 		if (!first)
 			first = sg;
@@ -1489,6 +1509,25 @@ static struct sched_group *get_group(int cpu, struct sd_data *sdd)
 		cpu = cpumask_first(sched_domain_span(child));
 
 	sg = *per_cpu_ptr(sdd->sg, cpu);
+	if (!sg) {
+		sg = kzalloc_node(sizeof(*sg) + cpumask_size(),
+				  GFP_KERNEL, cpu_to_node(cpu));
+		if (!sg)
+			return NULL;
+		sg->next = sg;
+		*per_cpu_ptr(sdd->sg, cpu) = sg;
+	}
+
+	if (!*per_cpu_ptr(sdd->sgc, cpu)) {
+		struct sched_group_capacity *sgc;
+
+		sgc = kzalloc_node(sizeof(*sgc) + cpumask_size(),
+				   GFP_KERNEL, cpu_to_node(cpu));
+		if (!sgc)
+			return NULL;
+		sgc->id = cpu;
+		*per_cpu_ptr(sdd->sgc, cpu) = sgc;
+	}
 	sg->sgc = *per_cpu_ptr(sdd->sgc, cpu);
 
 	/* Increase refcounts for claim_allocations: */
@@ -1544,6 +1583,8 @@ build_sched_groups(struct sched_domain *sd, int cpu)
 			continue;
 
 		sg = get_group(i, sdd);
+		if (!sg)
+			return -ENOMEM;
 
 		cpumask_or(covered, covered, sched_group_span(sg));
 
@@ -1577,27 +1618,40 @@ static void init_sched_groups_capacity(int cpu, struct sched_domain *sd)
 	WARN_ON(!sg);
 
 	do {
-		int cpu, cores = 0, max_cpu = -1;
+		int i, cores = 0, max_cpu = -1;
+
+		if (sg->group_weight)
+			goto next;
+
+		if (sg->sgc->group_weight) {
+			sg->group_weight = sg->sgc->group_weight;
+			sg->cores = sg->sgc->cores;
+			sg->asym_prefer_cpu = sg->sgc->asym_prefer_cpu;
+			goto next;
+		}
 
 		sg->group_weight = cpumask_weight(sched_group_span(sg));
 
 		cpumask_copy(mask, sched_group_span(sg));
-		for_each_cpu(cpu, mask) {
+		for_each_cpu(i, mask) {
 			cores++;
-			cpumask_andnot(mask, mask, cpu_smt_mask(cpu));
+			cpumask_andnot(mask, mask, cpu_smt_mask(i));
 		}
 		sg->cores = cores;
 
-		if (!(sd->flags & SD_ASYM_PACKING))
-			goto next;
-
-		for_each_cpu(cpu, sched_group_span(sg)) {
-			if (max_cpu < 0)
-				max_cpu = cpu;
-			else if (sched_asym_prefer(cpu, max_cpu))
-				max_cpu = cpu;
+		if (sd->flags & SD_ASYM_PACKING) {
+			for_each_cpu(i, sched_group_span(sg)) {
+				if (max_cpu < 0)
+					max_cpu = i;
+				else if (sched_asym_prefer(i, max_cpu))
+					max_cpu = i;
+			}
+			sg->asym_prefer_cpu = max_cpu;
 		}
-		sg->asym_prefer_cpu = max_cpu;
+
+		sg->sgc->group_weight = sg->group_weight;
+		sg->sgc->cores = sg->cores;
+		sg->sgc->asym_prefer_cpu = sg->asym_prefer_cpu;
 
 next:
 		sg = sg->next;
@@ -1871,7 +1925,8 @@ static void claim_allocations(int cpu, struct s_data *d)
 {
 	struct sched_domain *sd;
 
-	if (atomic_read(&(*per_cpu_ptr(d->sds, cpu))->ref))
+	if (*per_cpu_ptr(d->sds, cpu) &&
+	    atomic_read(&(*per_cpu_ptr(d->sds, cpu))->ref))
 		*per_cpu_ptr(d->sds, cpu) = NULL;
 
 	for (sd = *per_cpu_ptr(d->sd, cpu); sd; sd = sd->parent) {
@@ -1880,10 +1935,12 @@ static void claim_allocations(int cpu, struct s_data *d)
 		WARN_ON_ONCE(*per_cpu_ptr(sdd->sd, cpu) != sd);
 		*per_cpu_ptr(sdd->sd, cpu) = NULL;
 
-		if (atomic_read(&(*per_cpu_ptr(sdd->sg, cpu))->ref))
+		if (*per_cpu_ptr(sdd->sg, cpu) &&
+		    atomic_read(&(*per_cpu_ptr(sdd->sg, cpu))->ref))
 			*per_cpu_ptr(sdd->sg, cpu) = NULL;
 
-		if (atomic_read(&(*per_cpu_ptr(sdd->sgc, cpu))->ref))
+		if (*per_cpu_ptr(sdd->sgc, cpu) &&
+		    atomic_read(&(*per_cpu_ptr(sdd->sgc, cpu))->ref))
 			*per_cpu_ptr(sdd->sgc, cpu) = NULL;
 	}
 }
@@ -2678,8 +2735,6 @@ static int __sdt_alloc(const struct cpumask *cpu_map)
 
 		for_each_cpu(j, cpu_map) {
 			struct sched_domain *sd;
-			struct sched_group *sg;
-			struct sched_group_capacity *sgc;
 
 			sd = kzalloc_node(sizeof(struct sched_domain) + cpumask_size(),
 					GFP_KERNEL, cpu_to_node(j));
@@ -2687,24 +2742,6 @@ static int __sdt_alloc(const struct cpumask *cpu_map)
 				return -ENOMEM;
 
 			*per_cpu_ptr(sdd->sd, j) = sd;
-
-			sg = kzalloc_node(sizeof(struct sched_group) + cpumask_size(),
-					GFP_KERNEL, cpu_to_node(j));
-			if (!sg)
-				return -ENOMEM;
-
-			sg->next = sg;
-
-			*per_cpu_ptr(sdd->sg, j) = sg;
-
-			sgc = kzalloc_node(sizeof(struct sched_group_capacity) + cpumask_size(),
-					GFP_KERNEL, cpu_to_node(j));
-			if (!sgc)
-				return -ENOMEM;
-
-			sgc->id = j;
-
-			*per_cpu_ptr(sdd->sgc, j) = sgc;
 		}
 	}
 
@@ -2745,23 +2782,10 @@ static void __sdt_free(const struct cpumask *cpu_map)
 
 static int __sds_alloc(struct s_data *d, const struct cpumask *cpu_map)
 {
-	int j;
-
 	d->sds = alloc_percpu(struct sched_domain_shared *);
 	if (!d->sds)
 		return -ENOMEM;
 
-	for_each_cpu(j, cpu_map) {
-		struct sched_domain_shared *sds;
-
-		sds = kzalloc_node(sizeof(struct sched_domain_shared),
-				GFP_KERNEL, cpu_to_node(j));
-		if (!sds)
-			return -ENOMEM;
-
-		*per_cpu_ptr(d->sds, j) = sds;
-	}
-
 	return 0;
 }
 
@@ -2932,7 +2956,7 @@ static void adjust_numa_imbalance(struct sched_domain *sd_llc)
 	}
 }
 
-static void
+static int
 init_sched_domain_shared(struct s_data *d, struct sched_domain *sd, int flags)
 {
 	struct sched_domain_shared *sds = NULL;
@@ -2954,6 +2978,13 @@ init_sched_domain_shared(struct s_data *d, struct sched_domain *sd, int flags)
 	 */
 	for_each_cpu(cpu, sched_domain_span(sd)) {
 		sds = *per_cpu_ptr(d->sds, cpu);
+		if (!sds) {
+			sds = kzalloc_node(sizeof(*sds),
+					   GFP_KERNEL, cpu_to_node(cpu));
+			if (!sds)
+				return -ENOMEM;
+			*per_cpu_ptr(d->sds, cpu) = sds;
+		}
 
 		if (!sds->alloc_flags ||
 		    sd->span_weight == 1 ||
@@ -2978,6 +3009,8 @@ init_sched_domain_shared(struct s_data *d, struct sched_domain *sd, int flags)
 	 */
 	atomic_set(&sd->shared->nr_busy_cpus, sd->span_weight);
 	atomic_inc(&sd->shared->ref);
+
+	return 0;
 }
 
 /*
@@ -2993,25 +3026,24 @@ init_sched_domain_shared(struct s_data *d, struct sched_domain *sd, int flags)
  * degenerate into a single-capacity group. The relevant edge cases are instead
  * covered by the caveats above.
  *
- * Return true if this CPU's asym path claimed sd->shared, false otherwise.
+ * Return 0 on success or if not claimed, -ENOMEM on allocation failure.
  */
-static bool claim_asym_sched_domain_shared(struct s_data *d, int cpu)
+static int claim_asym_sched_domain_shared(struct s_data *d, int cpu)
 {
 	struct sched_domain *sd = *per_cpu_ptr(d->sd, cpu);
 	struct sched_domain *sd_asym;
 
 	if (!sd)
-		return false;
+		return 0;
 
 	sd_asym = sd;
 	while (sd_asym && !(sd_asym->flags & SD_ASYM_CPUCAPACITY_FULL))
 		sd_asym = sd_asym->parent;
 
 	if (!sd_asym || (sd_asym->flags & SD_NUMA))
-		return false;
+		return 0;
 
-	init_sched_domain_shared(d, sd_asym, SD_ASYM_CPUCAPACITY);
-	return true;
+	return init_sched_domain_shared(d, sd_asym, SD_ASYM_CPUCAPACITY);
 }
 
 static int __sched_domains_alloc_llc_id(void)
@@ -3157,15 +3189,16 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 		if (!sd)
 			continue;
 
-		if (has_asym)
-			claim_asym_sched_domain_shared(&d, i);
+		if (has_asym && claim_asym_sched_domain_shared(&d, i))
+			goto error;
 
 		/* First, find the topmost SD_SHARE_LLC domain */
 		while (sd->parent && (sd->parent->flags & SD_SHARE_LLC))
 			sd = sd->parent;
 
 		if (sd->flags & SD_SHARE_LLC) {
-			init_sched_domain_shared(&d, sd, SD_SHARE_LLC);
+			if (init_sched_domain_shared(&d, sd, SD_SHARE_LLC))
+				goto error;
 
 			/*
 			 * In presence of higher domains, adjust the
-- 
2.56.0.385.gd3acb90ef8-goog

