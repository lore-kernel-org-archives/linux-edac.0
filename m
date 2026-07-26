Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9C437F312
	for <linux-edac@vger.kernel.org>; Sun, 26 Jul 2026 12:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785068599; cv=none; b=EWEtw+zujHvUCiC8bZ6AFV3UoAm/Aild+79CmZtELenIvEB60geJuBCO3aZgi5jMY+XUPtZsT2/5PgDKx9TgdsTS7aflUS017dR5/qvdWo1b3sxm8zL+OT/mDnUN6x7XbL89VQjp13t52u08pMAVZTtFBCRIcU4CDvK8o66u90M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785068599; c=relaxed/simple;
	bh=9TRu9Q4LwBRql71odhvuw1OhgUcZ5BnFekHOedMS968=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2Nlq9nmsRCzHUja+yRMRUt8B14/HV8464o+P8rpEM4CzEpfIIYiazbLfgtQviWXxEOXjXv3QaE+Mf7mZ9OPbBU2e5lPmyO1mZv5lYNuTH0tQplito9K8zWU7OpoeIrZ7lIvbsJI2esms8rw+nYuocF+YbejmjAH9kNoeuwsGJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUUlswz7; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUUlswz7"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9ecb1e13bso665131a34.2
        for <linux-edac@vger.kernel.org>; Sun, 26 Jul 2026 05:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785068597; x=1785673397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVtWee8zloihupxojDwrCEq5aoRBKaK6smjn2VfvwR4=;
        b=HUUlswz7It/qUg9RMzY3/dsC87Hq++LN4erbo3UcENowdxckqGLJHhX1nB6BQkl9da
         gLHScj1wRZHAYu7uYnrA2nUV6/wOPSHZQPfCv6PKLMir4mEKXhU9ePJEIZ1cqESICz41
         eefzNdPRMu2+joii2pXpDRSe4SemT+5YG67FWXVwCF0ojmH8O5f4rVo2x2R3xXfLqgqM
         QyhxBuAhmfhRJtv8y9Pi/QN+vY4qFczn+iUC51h47OXk4hsSMbOL4zt3rmkWRW/HtqBr
         f5qJsimx4+zIo7+YK4ZzyQ/fIrSTcrGq4LwCFLL7dxQDRuaI7dPdLbQy8qq7vUUrSwMR
         g1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785068597; x=1785673397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uVtWee8zloihupxojDwrCEq5aoRBKaK6smjn2VfvwR4=;
        b=BUW8lCvsOE3/1WGbF8wuz6rx9/dq3UB1daEVsMJwnkZp6YLEV9thHOWa9csUKi4CWy
         Xotxwx3GMe4aFxrprMa/rqvLqhUdbp6t9+pc9ATLJDzKqO6imeA+vOvZjGJJu008qXiP
         8WXedHCt9P5bosJ2j0Fa4JNPf1xkVTzgNRvKu4Md0aC1sRHR7Ae/es4orEK5Oca7eQK1
         oAfwkaI0eYNAiKuj919IhqL6TkfFNGptDO18RRHZeL/bbdys1Qj0eN9un7W3Lo+8exWI
         Q8iz/drSE08RtJL9HSB6ktZvKPi5NY+dyztdw9wAN3WcVxNLQVq/soLASm3GSCQcc9Re
         mxeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHeO4g8uWmMwSnt95yzXfLDJVXQikYdhuUYoL7vlckVI8SV2NYAsj/ucKXVWJ+12yoN7BOG2JJP0w2@vger.kernel.org
X-Gm-Message-State: AOJu0YyjcyNZwegiN+6Ly1zxpYpaxUHAKVnQeFZ66NnHUjL4flGEsoHC
	t3rzACvu+pMGwFKoAsycD1XKKpudGGHxdOzox7uRNm1oT3MnETwhw60H
X-Gm-Gg: AR+sD10vmT5B3nQCj8KWISqEEgc2dJYexmWhkLbgcMe8lIbuNIplK4OE7G6UWqSqmzB
	geU3NGjljCnrK8m3D+LoBLuli6qktDAT0kxaS4q9wKzcIko+OOyUgFnzM1i130rPes6szIU6V4H
	K7OWVoOOJMhqSMaBmia27NP0903YKvn8Za4y2fd8m3MxV2DPAK5irp+7+BVZZ4AwOj0yWK8dS9S
	gmBMzy7ew1TJNbRM4R4aMiqUJKcRTXVJaJRNt7JCuQhc6htMGArIrtyGZ8SM28dZXbXXrd7jDzB
	vGGKO2iyUl3rWQ/YkRGyXrStuv5YrcfG1L5XJxMUW6XgAxoeMA/RaPBhQIma8hwlnRznaU1S6AF
	pZT96P5pQJp2Hf275oPBqVGqC0EcebiQ7oSyVDJ4XHpzi3NnyttcwXzQjJS0ueDNJ84s8kNPV6x
	sQUecaFAWM0gF4
X-Received: by 2002:a05:6820:1a05:b0:6a3:1dc5:356e with SMTP id 006d021491bc7-6aaffa6232fmr3807138eaf.36.1785068597387;
        Sun, 26 Jul 2026 05:23:17 -0700 (PDT)
Received: from localhost ([144.24.58.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-457673d267dsm13112356fac.11.2026.07.26.05.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 05:23:17 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	x86@kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-edac@vger.kernel.org,
	Jinchao Wang <wangjinchao600@gmail.com>
Subject: [PATCH 2/3] x86/hw_breakpoints: Add arch_modify_local_hw_breakpoint_addr() API
Date: Sun, 26 Jul 2026 20:22:31 +0800
Message-ID: <59637b96946653393a7ad3c7de094094796b39c2.1785067572.git.wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785067572.git.wangjinchao600@gmail.com>
References: <178476143000.26117.9810509272687580410.stgit@devnote2> <cover.1785067572.git.wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wprobe needs to move an active per-CPU watchpoint without releasing and
reserving its hardware slot.

Add arch_modify_local_hw_breakpoint_addr() to find the installed local
slot and update only its address shadow and hardware debug address
register. Publish the shadow first so hw_breakpoint_restore() observes
the new address if an NMI interrupts the update.

The caller must provide an installed local event and a valid address.
Slot ownership, breakpoint type, length, mask and DR7 remain unchanged.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 arch/x86/include/asm/hw_breakpoint.h |  2 ++
 arch/x86/kernel/hw_breakpoint.c      | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/x86/include/asm/hw_breakpoint.h b/arch/x86/include/asm/hw_breakpoint.h
index 0bc931cd0698..a1ecce536074 100644
--- a/arch/x86/include/asm/hw_breakpoint.h
+++ b/arch/x86/include/asm/hw_breakpoint.h
@@ -59,6 +59,8 @@ extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
 
 
 int arch_install_hw_breakpoint(struct perf_event *bp);
+void arch_modify_local_hw_breakpoint_addr(struct perf_event *bp,
+					  unsigned long addr);
 void arch_uninstall_hw_breakpoint(struct perf_event *bp);
 void hw_breakpoint_pmu_read(struct perf_event *bp);
 void hw_breakpoint_pmu_unthrottle(struct perf_event *bp);
diff --git a/arch/x86/kernel/hw_breakpoint.c b/arch/x86/kernel/hw_breakpoint.c
index 9ef24b55737f..ff1b9b78f78c 100644
--- a/arch/x86/kernel/hw_breakpoint.c
+++ b/arch/x86/kernel/hw_breakpoint.c
@@ -128,6 +128,26 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
 	return 0;
 }
 
+void arch_modify_local_hw_breakpoint_addr(struct perf_event *bp,
+					  unsigned long addr)
+{
+	int i;
+
+	lockdep_assert_irqs_disabled();
+
+	for (i = 0; i < HBP_NUM; i++) {
+		if (this_cpu_read(bp_per_reg[i]) == bp)
+			break;
+	}
+
+	if (WARN_ONCE(i == HBP_NUM, "Can't find any breakpoint slot"))
+		return;
+
+	this_cpu_write(cpu_debugreg[i], addr);
+	barrier();
+	set_debugreg(addr, i);
+}
+
 /*
  * Uninstall the breakpoint contained in the given counter.
  *
-- 
2.53.0

