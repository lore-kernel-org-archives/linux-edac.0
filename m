Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCEB385D9B
	for <linux-edac@vger.kernel.org>; Sun, 26 Jul 2026 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785068569; cv=none; b=jvfaLDpWltbq+G/lKIkfFlgRboSP18bYyMu6c+fV2FBRa/GZsFW2WPPdAM714LVPIpsE79wajut/+0+oHxSji5MQfJIwolxY/BIT6b6MFjMhVINKcm87fcC7ig+ooUk+DqcXtkiYatSPSV2sSBddLjyQZmXzrmj9b3LP8Ccce9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785068569; c=relaxed/simple;
	bh=EWnv07DWloHMIzkcvB+TMe7XnJ2cm6FV6nkeNMADT+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLtbEUqhYr6siEa9w7wMoKx9+4O4KLAMhTrWLB/sutYMnFsOoXvVv+sd1vYeeXTrDx0JPmJN3XviaHtTzfCeCEo6WguwSfZneYQoeUURBe1E+OrhFFGX6o++Hxcl3ziZsjQT4Tn9v5BSXIhpz0uKWCrLYDY1te+FdMORHguwvVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FE1m9exK; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FE1m9exK"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6aa9606ddadso1488886eaf.0
        for <linux-edac@vger.kernel.org>; Sun, 26 Jul 2026 05:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785068567; x=1785673367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWX/ZZduUGn7dvOGbkdZ90gJ+u5X4idkSvz+SXiZQGM=;
        b=FE1m9exKHLvAS5o8BjC4LgdZqTAQmeDiCRP6Fm/+xbACJcyN1TzGYr92GoWNuxLmlg
         j3J5VYJhIbyD2BsKoBD1M0yVoqpIrMV5H9nRLTky6fVIpq6tEN9QwGDwEvlzClzVJ3LM
         iB9OWMUT04IuUPiq/DRCNGKnPG/n7LWU91GQiLYvBkgMSvav8SxCIf0Oj0p73W2bIBzG
         bISQ96f7jbbiUmHBlm6s09ZkCZHY6si2+sn9zDXNTomkDQKiZVAo8SHgTeDw/J7M7wZ+
         IicURTfq2sHn8lcR3infjIWyp2tBVOUtMCOATzyRhKI3AhfBsjEvsxpnHuF9PZbNYdJf
         SQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785068567; x=1785673367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dWX/ZZduUGn7dvOGbkdZ90gJ+u5X4idkSvz+SXiZQGM=;
        b=CRSdLfPorq5CzHbrqIcfPBoaiKmtlunu0lnnbeYoESXhcYDghFUo7I0MtI5yTOHcjn
         ydsh0UD+/E8gQJQJ1XrSA9SJxCDPAbZwX+aGTXDK8ahPA4fjH0lJLVjfag/SUwGC00yC
         +IO2elnShmCoATnb7t2EQVKdihPYgPozWQeBB8y+JkqmNKgvEXbHpUQa5qjNrCwzeKhu
         QT0VFujh82n7NHK94ZUHV5VaZ7PRwT2Csk7lvQgcAkFV4NqMoDwpIhQHndzsh1FVEhZh
         KF6ZCS+gCUVKCx6cteYVD/CNVXuty/kCFl50XoEmbz7chaFjED7rldQNhL3hmfKep03L
         Biuw==
X-Forwarded-Encrypted: i=1; AHgh+RqqQdqyuBdydIxr4bFSQ987ix+PqRisbxuiTNSNdnhVHOtxZvam8thnXzx1wiIwfO7npWnJ8VUT67u+@vger.kernel.org
X-Gm-Message-State: AOJu0YzJDVrbNp98FTYtYpP9YIO719HCBR37JvloDv4uTyePGtaeNtOP
	EDXmEDLjM2/G86Yaouh//oxs3G7j3rPUDEzDULSo8GQfSHvTJKI3DDva
X-Gm-Gg: AR+sD108ndtw2KTJCHUVAq7sC4TVXRp3deKyZMzFbh15QBrmD/M8mm+jjE3tFTrcoyB
	yuoV4oXlhamxgtCkLNxvkE8Qefv62OEY0SqW3K91jGujdfCutpTPcmxNnsNYf87Ae52Uh3tp10l
	QsKHM7M4IklTNUccQ9gusj2BqggHksIR1dKTWvLG7ZJLlQYqpwffeIlzVlyg3FS/EV21KKn/ju5
	UqRi3vVMa3YWi02rFcAFgRDzhH99UU5QjnOpwsIvk26i+sT57dFNmCdtE4abVDJVbn+TAHQBvwj
	Ekb2M6ondKlKWiZhXf+ZI978PthSx4OqcRigv547GsLz9fiTVUrAXnw1bxdn52V2PQa01whGfLS
	0AWbDvNJf4kANAFMfMINaMgxmx3Ouyf1wIvC6YX4qx+h2iVdabVDqyzKZ4JHYdrbq6h+TyyDn7M
	wmQA==
X-Received: by 2002:a05:6820:450a:b0:6aa:dfcb:3daf with SMTP id 006d021491bc7-6aaffa204f3mr3158838eaf.51.1785068567318;
        Sun, 26 Jul 2026 05:22:47 -0700 (PDT)
Received: from localhost ([144.24.58.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9363793sm3403006eaf.5.2026.07.26.05.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 05:22:46 -0700 (PDT)
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
Subject: [PATCH 0/3] hw_breakpoint: Fix and simplify local address updates for wprobe
Date: Sun, 26 Jul 2026 20:22:29 +0800
Message-ID: <cover.1785067572.git.wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <178476143000.26117.9810509272687580410.stgit@devnote2>
References: <178476143000.26117.9810509272687580410.stgit@devnote2>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Masami,

While reviewing wprobe v10, I prepared three patches to fix and simplify
the HWBP support required by wprobe.

This series is based on linux-trace/probes/for-next, the same base used by
wprobe v10. It is intended to replace patches 5-7 in v10, so it should not
be applied on top of topic/wprobe-v2.

Patch 1 fixes the x86 HWBP slot and DR7 races when an operation is
interrupted by an NMI.

Patch 2 adds arch_modify_local_hw_breakpoint_addr(), which updates only
the watched address of an installed breakpoint on the local CPU.

Patch 3 adds the matching generic modify_local_hw_breakpoint_addr() API.
It keeps the original patch structure and Masami's authorship, while
removing attribute parsing, type/length updates and rollback.

With the address-only interface, the install/uninstall refactoring in the
old patch 5 is no longer needed.

I can take care of follow-up maintenance related to fast local HWBP
watched-address updates.

The patches passed checkpatch and the relevant x86_32 and x86_64 object
builds.

Jinchao Wang (2):
  x86/hw_breakpoints: Make DR7 updates NMI safe
  x86/hw_breakpoints: Add arch_modify_local_hw_breakpoint_addr() API

Masami Hiramatsu (Google) (1):
  HWBP: Add modify_local_hw_breakpoint_addr() API

 arch/Kconfig                         |   8 ++
 arch/x86/Kconfig                     |   1 +
 arch/x86/include/asm/debugreg.h      |  36 ++++++---
 arch/x86/include/asm/hw_breakpoint.h |   2 +
 arch/x86/kernel/cpu/mce/core.c       |  20 +++--
 arch/x86/kernel/hw_breakpoint.c      | 114 ++++++++++++++++-----------
 arch/x86/kernel/nmi.c                |  10 ++-
 arch/x86/kernel/traps.c              |  10 ++-
 include/linux/hw_breakpoint.h        |   6 ++
 kernel/events/hw_breakpoint.c        |  30 +++++++
 10 files changed, 166 insertions(+), 71 deletions(-)


base-commit: 1a416ae446afa42d2d8500ce25bd61c564508721
-- 
2.53.0
