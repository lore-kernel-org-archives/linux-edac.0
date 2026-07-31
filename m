Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F92F12C5
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 01:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460900; cv=none; b=mnq1WiYO7swrNpyPt4RB4XVznh5BpwvMqF6lwmOmnPz8DitiY2kqBZXEz1HTHyF9D7ReLqVcQwR73Y26xL1uXnMu4ymFE52wCaoZOXA1n6SL/Td4RTTIhXOyvglifGNgQeUIXoEh3r92iFtzIVPsNufe4pFtRvEzaqdReSQJ3LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460900; c=relaxed/simple;
	bh=xsFVWzxEmP1xtSwF4J0aOwtU5FsqXzYKJ4uqEQVsIDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dis/htJXQlpFXvKDI7cMFRQW7eo0w11+Kgkj08qoQjpkcyVMb2f+dsGfEGw9X3S5CV5iI30DD5gM4A/U4R7oBvrDSVGnIpu9v7lFHWtObWLR8+N6WmErFklOZw09QBU6kKLPR05+NfVL6OIlx03DrI3+2lqYEQbOFVcq8I/giIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dq6xnVgX; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dq6xnVgX"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso225160a12.2
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 18:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460897; x=1786065697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg8//SIb3wCfw25zWTdBtLReUkKBuqQ+hnflSQ8n1KE=;
        b=Dq6xnVgX/tzB7FtsAH5BTI05HEa9ePD5lxZMNER0wutujVxuO1UqcVotZgGqp9+Rc7
         FKakWuUUXFaJuG6hs9REYE7kvtPuP+91Cpngtl7WRdrnEMEcD4tm4LyUoeBI4dT3Gcmm
         HS9qBzpFW5l8ZWyZbPsvQnYNuuNhZQFbvCJyZSwrn5xUfSl9BDUs8Iw35+uJJxwOqaNY
         RkGlrw3M5LTnP3Wks3Ypu1CizsJ00hpIVsIL2iH6d+54Fsw89X91K2IB5GFCLvO6hdFK
         6ws+FQnnpoXcEghW5nanBOKfetVvSyWgkY/gUYVt04eznJI2BNzFV8IOxHGiHd25Grne
         gWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460897; x=1786065697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jg8//SIb3wCfw25zWTdBtLReUkKBuqQ+hnflSQ8n1KE=;
        b=hxgCdjPxlgY7CFO7K3NgMCk0XrqoTp2iso1dWTeD+RWw6b28TwIs5pl/f0qUfwnDM2
         6T9GInzJuW5FVcp8t2FLGYBh0NLyKcCU9wjNX/h1oGfdaks48V92losZXgtcxaFZI9Fr
         o2IxOWcQQ54Uvf0m1XZlMPB3piVUF0lrUhSctaCCgK/GXiQW9bKidnJqmr9JATKujtva
         uf2RTL8/G6IsuGkFP/DM41hIUA2+FT9IYmtITYkN4P0OgmJrqLvcJP6Tl7hACEoPBGT5
         PcG7wjztl5LU5JBoJu7N6M3OsqU6A/vR4NHouxQloEUXJrupKD/OPK5OeB9On2/KU7+7
         RQjw==
X-Gm-Message-State: AOJu0YzGlb1fOXzXnONUiO1AEnyuiEKye1UT77IST0BNC/aEI7+Hsf2h
	jCK4bR7CM5qnO9ZuWkSuGq1sr1w8mPJTTRFIkfFQ1V91qZNC8wokMO6e22GRAA==
X-Gm-Gg: AR+sD1253uzaqmQbfd9GsOS6Cd9PR5jLV6mfczlVAXOg1EotUFvbgU2m4DRZ1ssCpvu
	7uJpsjWBnqbaTTKuK7uwN1E489Xqvwgme7YAhMFo4ctFIeWqIhGikD9mEuDrVzZD+NfrBbHM87e
	HfPLLiGiexqXe7m1YObs0rsYATdqM5dz1tgFwhh0+sYeO0guWzc8jeCOBZi6++Ohz+LYmLVQPDt
	uXoJ8Pa3uOsbyENt7GCRZG50U2zKFr6QJoq3Fq1hDbbJUIG0xMP3wFCiumfqwUF7jqkhx3LZK4G
	3+o0wDqRCFk8Q2yly6/qAmy73K4RYat+4LkY8b08WIzIfYnZERdDqLMNXuclcrCdOE5j/g0s21S
	1VuPQrQaSQc5aRcvadu0WhCAiO3udXFPyFCuq37RovVIF5nHhf8KLlOOPSd+a91WaImZyk67+CW
	oqLNw7Mvao4wiKUVVPFVWJw5fXO4nkBxpj/sHpoQriZTdygw7HoS5qtqsT5YjnDX8hf/9aMECGk
	dOWrCxLRk8uKrGx0NGwyjoj5pBjMNqycGVsOZwf5pplBJ1unR85v6Rr8nHqIxCtoutZijV5Nr4Q
	dGu+O93VTKcfrncQlFgLU8T0Sr/4OcbasfOKQA==
X-Received: by 2002:a17:90b:1650:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-38fb11368d2mr135362a91.4.1785460897057;
        Thu, 30 Jul 2026 18:21:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:36 -0700 (PDT)
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
Subject: [PATCHv2 3/3] EDAC/fsl_ddr: restore MC error registers on probe failure
Date: Thu, 30 Jul 2026 18:21:30 -0700
Message-ID: <20260731012130.1212640-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731012130.1212640-1-rosenp@gmail.com>
References: <20260731012130.1212640-1-rosenp@gmail.com>
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

Do not pre-initialize orig_ddr_err_disable/orig_ddr_err_sbe to 0; the
err path must only restore registers that were actually modified.
Split the error labels so early failures (before the first hardware
write at line ~~580) jump to err_free, which does cleanup without
touching hardware registers. Save orig_ddr_err_sbe alongside
orig_ddr_err_disable so the err label correctly restores both
registers, avoiding stale bootloader state clobbers.

Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
drivers/edac/fsl_ddr_edac.o compiles cleanly.

Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85xx")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index c505fb268474..139277c4e2f0 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -577,23 +577,22 @@ int fsl_mc_err_probe(struct platform_device *op)
 	pdata->orig_ddr_err_disable = ddr_in32(pdata, FSL_MC_ERR_DISABLE);
 	ddr_out32(pdata, FSL_MC_ERR_DISABLE, 0);
 
+	/* store the original SBE threshold */
+	pdata->orig_ddr_err_sbe = ddr_in32(pdata, FSL_MC_ERR_SBE) & 0xff0000;
+
 	/* clear all error bits */
 	ddr_out32(pdata, FSL_MC_ERR_DETECT, ~0);
 
 	res = edac_mc_add_mc_with_groups(mci, fsl_ddr_dev_groups);
 	if (res) {
 		edac_dbg(3, "failed edac_mc_add_mc()\n");
-		goto err;
+		goto err1;
 	}
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
 		ddr_out32(pdata, FSL_MC_ERR_INT_EN,
 			  DDR_EIE_MBEE | DDR_EIE_SBEE);
 
-		/* store the original error management threshold */
-		pdata->orig_ddr_err_sbe = ddr_in32(pdata,
-						   FSL_MC_ERR_SBE) & 0xff0000;
-
 		/* set threshold to 1 error per interrupt */
 		ddr_out32(pdata, FSL_MC_ERR_SBE, 0x10000);
 
@@ -621,6 +620,11 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 err2:
 	edac_mc_del_mc(&op->dev);
+	ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
+err1:
+	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
+		  pdata->orig_ddr_err_disable);
+	ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
 err:
 	edac_mc_free(mci);
 	return res;
-- 
2.55.0

