Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACF819D07A
	for <linux-edac@vger.kernel.org>; Sun, 26 Jul 2026 12:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785068884; cv=none; b=NpAQelgFnvk1lfmjQ6omwH9k/U77DVGDKF+NHzOt7CjHW/NHe+4YNAyT0I0DuHRqUJqTMTMYcpqL2e3dOUBdSIBU5We8AI4vPr+gJ7UhUWoGH2gbIg8SHsi9BR8yEJ6TFhJEFbO4Ub8FGbmZ5ygvibRI7E1KYzCe4M/lulkEGzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785068884; c=relaxed/simple;
	bh=ccoLxXcVCAekN8O5gMgLDn7JdMt0YqOZNIb3h7ismYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGSIKHgJ+96gsoRvwHoYK6iLPngpdcHYHcNKtZmFltvo8Ec9rBvbgqtajPCtrq8ytSe9JExdGd9ntZ3dV1maVqr2ReQ5hj+NGSyQ3Z+9t1I3eivx+YU0vb2dnJ6QsMQfXjvRbrHb2x+JklZIbIuddCqOmxjehRNghHNnt/o8cME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tg7jnPX6; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tg7jnPX6"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6aaf3f54dbfso721286eaf.0
        for <linux-edac@vger.kernel.org>; Sun, 26 Jul 2026 05:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785068880; x=1785673680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oVEf5/gSaD+al9Pequ5m2rnhtlrO+HvKfH1QE9WEkQ=;
        b=Tg7jnPX6RNUuQtCqe7gQKvbuo6uI020ByxoFuHeWAOAbYS2hErTrgS+Y5/0dCezjUm
         4ZjOowfwrAVKNIPjgVoA9ToN3jH3hEoJ5tkfiJO4E9CSdo6KqN+sYAG/ebAw/JxgELUK
         kd1eS6MMcRyadlidxsg3eNfvNojzxbvxtwfu5VC3Pyz3wXwkD1lJ3CkFN5d0u4NPaFaT
         Lw8qlYf1ui294361LVlQsrRUI4N+aa9McMklfjIXCHvVCRzDoaw/nM00TSHC4FU4WDNH
         NtyA/7aBT0XWbAm5mWaJLEhe9Y5d+E934uLS3TLjBz6lzTUNgSkGFwX8D7Y3NSHxM4Ed
         tzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785068880; x=1785673680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0oVEf5/gSaD+al9Pequ5m2rnhtlrO+HvKfH1QE9WEkQ=;
        b=SbWBSA8G8P8oWU6x7LfAYfTKSX9V0jCqEclXZJBwjNJ8uahXkrCLjnQ0rgwr4U6vqP
         p3E+W4MhouXjCCxJHRGmsze8Xozqw5lj/er/rnhXKf51K6KFtWHAfzezUfA2uZPwRvOC
         1ICgU7tZoVmfIbNCeYPTeyI3thRaJ3J9IUV4kN6HmWwNkmZ7JU+B7icOw4xhaG+yrsw3
         vJjAtMeBMHSb/ZJY7r1Ilfkp0lNV1C4s7fvmbgT7vz/iTa42I6kH5vrcnO4QeUKaRi/c
         86dLrjIARTZIkJy9eps6WeDAOS3i5qwG3MbWyx8crbzWHe2eJiX4+rD06LPOXVSPid84
         Vr1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrsXJnuY1nQEbOQ7sYgnlc0zZC9YX9XOLhq7s0Q37M9PJ6nei2il9v9ZIxGIZOZlkvwHWiN8kAfEh/v@vger.kernel.org
X-Gm-Message-State: AOJu0YyggJl8WetPifJAZ39nDgCcvF1aXeIg39ptUAvKz7V2Bu+klyVo
	uCiGaGtLnJ2QmmSwidDvGhCmDbR+PLuHczxt32flDXHA0TVNDtzBlz9b
X-Gm-Gg: AR+sD12eqHiEgEkFIdji+g26YH/KErvMWfMidm7jNeqclaI4Bl1rURurH/LNTthUDVl
	jyBBbi7kCFPyTPSB5iVJRjjNc2+Bnqk9ujDPET2T8qVsPzprIdkfleUCLVIcB0zOg4gd+HXc/UO
	4hCaPPFurm0VFg3CZtz4U7CK46pZcoTIQk5VdHSvW2zvycTEeAHygh3xb6gkQKpR8HOCi3q8Msg
	ctAUzcUPNLTdMfgMv1BpLZ1C59yT5HPn+jMDw69+mXl2JtUNs6eMt7rmKCYu45HvTeuut/ZFV/j
	LeKJiISe50EYunknGAwv2Zx9ai2o970gHxoivK2XlGSxW9zKTpiCayBgv64JxHlDN4E/s5QEhUz
	2iYu1kn5hRyUWF66MSAV92SwsvznjsLLjGUDY3sWDq07Ra9kF83uT5/IuQqvJznJYfjE+6D2Dx2
	KxqTAWhM4y/UYM
X-Received: by 2002:a05:6820:1caa:b0:6aa:df4e:e373 with SMTP id 006d021491bc7-6aaffadde25mr3034725eaf.62.1785068880306;
        Sun, 26 Jul 2026 05:28:00 -0700 (PDT)
Received: from localhost ([144.24.58.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf973036dsm3324321eaf.14.2026.07.26.05.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 05:27:59 -0700 (PDT)
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
Subject: [PATCH 3/3] HWBP: Add modify_local_hw_breakpoint_addr() API
Date: Sun, 26 Jul 2026 20:27:45 +0800
Message-ID: <f9c49dfa49bdc57ba8c0574bc9981c1e581acf92.1785067572.git.wangjinchao600@gmail.com>
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
Message-ID: <20260726122745.qKxnEKeljpLRpZ5k5lKVc3QvTZMRZSvaw3dLH7URIgg@z>

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

Add modify_local_hw_breakpoint_addr() to update only the watched
address of an installed hardware breakpoint on the local CPU without
releasing and reserving its hardware slot. This is available when the
architecture selects CONFIG_HAVE_MODIFY_LOCAL_HW_BREAKPOINT_ADDR.

The caller must provide an installed local event and a valid address,
and update other CPUs separately.

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 arch/Kconfig                  |  8 ++++++++
 arch/x86/Kconfig              |  1 +
 include/linux/hw_breakpoint.h |  6 ++++++
 kernel/events/hw_breakpoint.c | 30 ++++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index fa7507ac8e13..bea383408e32 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -457,6 +457,14 @@ config HAVE_MIXED_BREAKPOINTS_REGS
 	  Select this option if your arch implements breakpoints under the
 	  latter fashion.
 
+config HAVE_MODIFY_LOCAL_HW_BREAKPOINT_ADDR
+	bool
+	depends on HAVE_HW_BREAKPOINT
+	help
+	  Select this if the architecture can modify the address of an
+	  installed hardware breakpoint on the local CPU without releasing
+	  and reserving its hardware slot.
+
 config HAVE_USER_RETURN_NOTIFIER
 	bool
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bdad90f210e4..09e599f2d0dd 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -246,6 +246,7 @@ config X86
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS
 	select HAVE_HW_BREAKPOINT
+	select HAVE_MODIFY_LOCAL_HW_BREAKPOINT_ADDR
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK	if X86_64
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
index db199d653dd1..bf65c7fffd99 100644
--- a/include/linux/hw_breakpoint.h
+++ b/include/linux/hw_breakpoint.h
@@ -81,6 +81,9 @@ register_wide_hw_breakpoint(struct perf_event_attr *attr,
 			    perf_overflow_handler_t triggered,
 			    void *context);
 
+int modify_local_hw_breakpoint_addr(struct perf_event *bp,
+				    unsigned long addr);
+
 extern int register_perf_hw_breakpoint(struct perf_event *bp);
 extern void unregister_hw_breakpoint(struct perf_event *bp);
 extern void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events);
@@ -124,6 +127,9 @@ register_wide_hw_breakpoint(struct perf_event_attr *attr,
 			    perf_overflow_handler_t triggered,
 			    void *context)		{ return NULL; }
 static inline int
+modify_local_hw_breakpoint_addr(struct perf_event *bp,
+				unsigned long addr) { return -EOPNOTSUPP; }
+static inline int
 register_perf_hw_breakpoint(struct perf_event *bp)	{ return -ENOSYS; }
 static inline void unregister_hw_breakpoint(struct perf_event *bp)	{ }
 static inline void
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 789add0c185a..0b1fc01f1934 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -888,6 +888,36 @@ void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events)
 }
 EXPORT_SYMBOL_GPL(unregister_wide_hw_breakpoint);
 
+/**
+ * modify_local_hw_breakpoint_addr - update a local breakpoint address
+ * @bp: the hwbp perf event for this CPU
+ * @addr: the new address for @bp
+ *
+ * Update only the address of an installed breakpoint on the local CPU without
+ * releasing and reserving its hardware slot. The caller must update other CPUs.
+ * Return 0, or -EOPNOTSUPP if the architecture does not support this operation.
+ */
+#ifdef CONFIG_HAVE_MODIFY_LOCAL_HW_BREAKPOINT_ADDR
+int modify_local_hw_breakpoint_addr(struct perf_event *bp,
+				    unsigned long addr)
+{
+	lockdep_assert_irqs_disabled();
+
+	counter_arch_bp(bp)->address = addr;
+	bp->attr.bp_addr = addr;
+	arch_modify_local_hw_breakpoint_addr(bp, addr);
+
+	return 0;
+}
+#else
+int modify_local_hw_breakpoint_addr(struct perf_event *bp,
+				    unsigned long addr)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+EXPORT_SYMBOL_GPL(modify_local_hw_breakpoint_addr);
+
 /**
  * hw_breakpoint_is_used - check if breakpoints are currently used
  *
-- 
2.53.0

