Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DE32F3C37
	for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784490018; cv=none; b=D6JQawYhohwVfhGDltlz31q4quG9ITDTT1T6su04/g4UlNySdJeWYLJQjFeKvaGrzg8IqruKG+RI9to7prLaRN8UPuaUfW/xB+HdMAl3CA4wOO3Oi4wmvKKMQkE7dA4Og8/PpWPp+IttsHgpTxkYAUGLvxB6RGzcQt4KgTUbWcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784490018; c=relaxed/simple;
	bh=ifU1kMZfngVDHcvrjk0awPR30T+Cgv/d0HA1XGLTU7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lb/HPWixx5cRdt55U2yssThNTPHXw+5F/I4LVtpQcMF/qLbmkFUOvhrCZnALA+d/rSDFCA7souPmdBzMKEcNIA5G/fqb2hrncT3JmV+vflIPu1S/grCiuyImmJiBIC67IG4eId91+N9VCnbAIEp7DF55shIrswNyEZjwo1kIIC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcxORIR6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcxORIR6"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so3952945a91.1
        for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784490017; x=1785094817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSIQ5/dAG3XXTro4N8Y7fM6rRNG5QM3A2gVdghbdtAs=;
        b=mcxORIR6tX2kEE8pf4cv6Ql0wJQtXD/6PapYkl6Hlov0p0+AOlKKnELkt6Fp7VqjCM
         1ILaB+bTUZ0D65lDz1+dX0WYBFrb6EY6JMJYLrkwXTamByWsnkUzmMplGAqCmDtGkW7Z
         iQTx9cLaxErrmujo3ecuy1AW6A+HdjYHkVxWGJVuh+YW2zIGF8DMw1YUIfySVh+bBRia
         GRpCXyAJQsMg3DUAXVcp6krHEzmR0/ujoySJWQhW0JgwwwYQruxFVj2zoRvXjNNe3MIF
         +nswG8MwzqotKTTS8GFGE7svsloHhAkQbLqSe/64bo/Ff+s9Eb+n/COiY0ra5uEzgjPl
         OmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784490017; x=1785094817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSIQ5/dAG3XXTro4N8Y7fM6rRNG5QM3A2gVdghbdtAs=;
        b=FuGoF71e13IVjEj2xndOAv/+UAE4/BgYgReNl3Nqnk/H/ML+PaUkiGjKOWECerXtiv
         tLmT0vHDwUQpTkRdPFY5T+cxRwUOdWkhWeprIQLdh7Z2MpXPb3jn9926GyqEPojiVuCr
         IqYJtdKu9WKiqnvw2c5LI7YqWSbcfQxBDb47Gq1Ghdu6xgzY4vHuNvohIYzwTYGmSwLD
         HC+W6aoVwNVXtcadOJkTa+8+DPYINuHt7dQ8pJAudTCNNC7WI3K/AuEH14pxiF05CrF0
         y7PavOi9AFBvYbXBurmbsFcPM/reyU6hYO1DnhojOzLgh5NXmqQ83pJPwwp/UI89BUAZ
         uGRQ==
X-Gm-Message-State: AOJu0YyK25v7sfEd6BiR+KSqBrvBvTinj15Mxf3RpEvOsntQS5GfKFGa
	PL4olXtZRX8x5TNwMQE3KpNWAh93TsA+Zvz/0FcBiVTaQNCP3J9fogiv83GFcg==
X-Gm-Gg: AfdE7clCAqgQA2B8t+Y0A8uKMB2pwFuDNxzW8XCEZnD7aVCzL0kK+t4U8GJwIS+p1OY
	8p0GaVBkhcJ2xV4tLIhldmExD2dn74NSybV/dqv7zyyvpoo+3YEQyXa8m+ULObzAL5OBmp42rD4
	1uKP+kmjgCr2v5WYbLXWVSw1sHjm2S0mtUJ5ObqRPPX0VuK5aaRyntBsqXa1GtgamlhRP5QuoQm
	muzzsx40sBuZPUgCO9OqGnnnr6AszPwVG5JmLwbkjbqdiwVMoFdsyaGnpdhFKoS829ZgUTwiPYp
	t56FQ0ATJFxJBesO6oAO/x4bH04mWqnnd/LodsJgcn8uPKLGF4ePrixfYDfMWYTeH/sbvFbrYmN
	hGAWUu3dzR63YJwRrSPnQ7hDAJ0Fsz6a1LFoiqP/10r9pjnoakuhyB/92KKNT4DB3TldnPAgRiQ
	T50M/l4PR7is99X6fWKJ18AlZcalOOZmv6SVV14sgW0+Bnx8UgW1z7U92mvYzGhbyosYAYqzd8U
	4cP9zVIkwLrois7t3h9f2LVkJS7dMIMRcv2iQdgWd/Img+/8q7sM8c=
X-Received: by 2002:a17:90b:57ee:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-38e4b40292cmr12031474a91.10.1784490016674;
        Sun, 19 Jul 2026 12:40:16 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0fb993sm6308126a91.15.2026.07.19.12.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 12:40:15 -0700 (PDT)
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
Subject: [PATCH 1/2] EDAC: fsl_ddr: restore MC error registers on probe failure
Date: Sun, 19 Jul 2026 12:40:08 -0700
Message-ID: <20260719194009.117532-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260719194009.117532-1-rosenp@gmail.com>
References: <20260719194009.117532-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_mc_err_probe() clears FSL_MC_ERR_DISABLE and, in EDAC_OPSTATE_INT
mode, sets FSL_MC_ERR_INT_EN to enable error reporting. If a later
initialization step fails and jumps to the err/err2 labels, the cleanup
only frees driver memory and does not restore these hardware registers.

This leaves the memory controller configured to generate interrupts while
no handler is successfully registered, which can cause an unhandled
interrupt storm on the shared IRQ line. Restore FSL_MC_ERR_DISABLE,
FSL_MC_ERR_INT_EN and the SBE threshold in both error paths.

Initialize the orig_ddr_err_disable/orig_ddr_err_sbe save fields up front
so the error paths are safe even when they are reached before the INT
block populates them.

Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
drivers/edac/fsl_ddr_edac.o compiles cleanly.

Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85xx")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index b27dff96aeb6..b1e6e177b088 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -518,6 +518,8 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 	pdata = mci->pvt_info;
 	pdata->name = "fsl_mc_err";
+	pdata->orig_ddr_err_disable = 0;
+	pdata->orig_ddr_err_sbe = 0;
 	mci->pdev = &op->dev;
 	pdata->edac_idx = edac_mc_idx++;
 	dev_set_drvdata(mci->pdev, mci);
@@ -645,7 +647,11 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 err2:
 	edac_mc_del_mc(&op->dev);
+	ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
 err:
+	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
+		  pdata->orig_ddr_err_disable);
+	ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
 	devres_release_group(&op->dev, fsl_mc_err_probe);
 	edac_mc_free(mci);
 	return res;
-- 
2.55.0

