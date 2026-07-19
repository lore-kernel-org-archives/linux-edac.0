Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533212DECB2
	for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 19:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784490015; cv=none; b=edp2uzpLDaLBAxxQuPcE/QmmpU20YMZwKx4tU5OeFnPjLgizMDqVOJCDj5PaWL9UFc6DOKj+cXXXz+1XfaI98BxHWAUskZjzGYURsDu4XUICAevNhceuWsmhxANjZuPMVuEF6qbpsrt70FNcvTD1xrEYHImAvHuLWZNQb2ZKziw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784490015; c=relaxed/simple;
	bh=aAF/T3Y8hCzCHm3lKRZATEXl7G4mF8YMLRaOfUViMSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KunMfxjlYGJ5GzNwA6iuw8via7jmbLbN0hTIuVOHIf+ayrUMTj5Wh/jKfSLWS5JBUtlwSzUrHnIjKoivtXvEmxJqFnQ4XNREa6m8vpCErf4dVDI5XRYtsl6UDZz4QMuF3kZY/wEVZZ4CgoN5qTOQxpjkgXRKptGj4wcXYq601o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsWFIZSY; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsWFIZSY"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381b831d535so7092414a91.0
        for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 12:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784490013; x=1785094813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G937/UZ24uNo9RJH5F1RTklgc3d2mOnFL2BoYh6wUVA=;
        b=QsWFIZSY6TLQeqdeHrO7maY9SEbFMNvCjaW+LQf9FVhqVig2g/AREwGIEGFYTA0SQx
         ZXx5ev5XJY2EJto90Ku55QlGY5wjvLZKpH7KsdqNQL+7iPBAYpPh90TlBhqhUZbm41ev
         ZB0x321uA63iKrpO+4+y6H2VudSjpAL9JGRYho1/ghnBsd37yPbZDNZs7xIjXLgURJ7t
         SWKLLcNl69WrvRaEf18Ip/CjGzpmDrrcgwQIXKQaH9ukQgWiWmg1U1w/QJPJEGJSLRHk
         mmfHfAQKh6eFowz7YOgxn2J43b085/cVraPpeNwaNfwcmO44qSUzjBhOwBwKy/pAvhJ7
         kBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784490013; x=1785094813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G937/UZ24uNo9RJH5F1RTklgc3d2mOnFL2BoYh6wUVA=;
        b=fszcX86Rvf50alfLBep89/6ZxVeMhN0WrD/Q5ToztU0jcTA55wJ39eYNUToIysvB8m
         EXlCYm+qUDyfH+JgYj5ISmjkUgMKwNncB0QgmVLN6DuGHXP8Hit2tlF46c1BqPubU4Kf
         HIu/gBzF/CxyBMcv3DcQIxcCtbmEuypcira7xczEw7hYgS93iay+U+7rjJZER0Uw4OTE
         PJTUurdJjggs2sIImahV1IF4U/5ZNt7F8G5mQwG9sYslI7R6I5QcTMQknm4C8+G8sgZ4
         +A9a2fqxSiAhw/v9TZFj3dSenCeEC9DJIaFs/i6amVYQwR+m5jX+TCOf6vssHIt2Zpw8
         VOHg==
X-Gm-Message-State: AOJu0YxypjF2S4RUl7KPX2o7dDrP7vxFggd1FfyHAn462V2/ai+PH1cd
	eVPOXVs7el0lyvjSWy5MgXzC1ECjVcPFNde+Lb5nlnMUqgsq68fKrq1B0EWEJw==
X-Gm-Gg: AfdE7cnuFiJd7ammMtkrq6zDC+3EMepYNIFORxdHTwMOF9qo1pjciZCIIPPKErkofc+
	dW06ylXmHGfP8fMIOYHF3OwitdCIO0gLD4DJVRDeJWP6pMd+xTJDnjuAdhi6PZwwmGImb4KNCW+
	Qz4TiLknnG9HhabVmeCYBKyTcico617wOet4PgZlu/WyKY9avrKri8CVdqy9q6dibpCZB94/uad
	m16RTb86ENdvdEAqt1z4N52W+3RmJzLaCleYfv7Lfqp67lJC8nE6xWM/d267fAkInZPU/gh2F7e
	RweJ5LE65VJ8gRrWN0WO66xLPx+kyQv5iSTX82DlkFzaaayaQ4EzgnzsemFwXU+NObJYQz7dolR
	utwmoluWr3ZcOKmyBfyrN2hUvHfXfet4RM/0x1uYCEIvy02PICXQ8eQHvc27zh1Q/hVzVQU2Qpb
	pdx4epOctGcwyJq5v8hjHC/+7jO+OgdAdmQPlP8LAggp31jmFgJPhi4B0Fzlq6epdts+Hh0lNHr
	nrMoneuvu4nsMwjkINGt/EAaJ6gvPulcPlsVStRCkDngr7LIshDoxsvI8ukYMgHZw==
X-Received: by 2002:a17:90b:3942:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38e4b59469cmr11738666a91.30.1784490013570;
        Sun, 19 Jul 2026 12:40:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0fb993sm6308126a91.15.2026.07.19.12.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 12:40:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	York Sun <york.sun@nxp.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH 0/2] EDAC: fsl_ddr: probe failure and remove lifetime fixes
Date: Sun, 19 Jul 2026 12:40:07 -0700
Message-ID: <20260719194009.117532-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two lifetime/error-path issues in the FSL DDR EDAC
driver (drivers/edac/fsl_ddr_edac.c):

* Patch 1: On probe failure, fsl_mc_err_probe() leaves the memory
  controller hardware configured to generate interrupts (DISABLE cleared,
  INT_EN set) while no handler is registered, which can trigger an
  unhandled interrupt storm on the shared IRQ line. Restore the MC error
  registers in both error paths.

* Patch 2: The devm-requested IRQ passes mci as context, but
  fsl_mc_err_remove() frees mci via edac_mc_free() before devres tears
  down the IRQ, leaving a use-after-free window for the shared interrupt
  handler. Manage mci lifetime through devres so it is freed only after
  the IRQ is released.

Both patches are build-tested for arm64 (defconfig + CONFIG_EDAC_FSL_DDR)
with LLVM=1.

Rosen Penev (2):
  EDAC: fsl_ddr: restore MC error registers on probe failure
  EDAC: fsl_ddr: manage mci lifetime via devres to fix remove UAF

 drivers/edac/fsl_ddr_edac.c | 42 +++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 16 deletions(-)

-- 
2.55.0

