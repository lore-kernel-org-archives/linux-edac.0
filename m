Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A74F2DECB2
	for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784490021; cv=none; b=WFzJbS4LrE0EiOyDruAq57UrlVEZP7sFGkDIBK3cffkiGPoecqogxtlmlcT9Iy7HuE93vnhMGU7URsok60PD3mAua7hzlaMlT4uRd/6iffXv2ier8djfeFMbmIXFyOFy4H2p/vizPR+mTHcv1lh0P37fZ79Fokhit62C1mXH1tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784490021; c=relaxed/simple;
	bh=TLJtucb+fMTnZkK3MG1MYEdha1u6aPFM1hXEkh/SJAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNuDXW6VCYw0nHd9nO3f7IDB3+iLOIcyjw54CCbNJoQiQxuCEEu4Ad5vEBRAgWgx3M5MljPJCLPrhy9ULbegzlElLNjyvaomVBPQ0fg+7RFKytQhZA6e/sTT0ZjVAHAXsT6Qkb79LtgkKuoRZVqwo0yR3TtiABatdzqVN/fhAz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwCPQnG6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwCPQnG6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso5815515a91.3
        for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 12:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784490020; x=1785094820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHDTeZIldDDYJIkvsl14Ioncr+9aGn9+y+1u1DznXfQ=;
        b=DwCPQnG6CtKfQ5VhtW2rdF6WiQuv0YWCJNt11UzsqCXi09TvmjkPXxdKIl5ENu5Sp0
         q5ypT5Vev04wTuksDHZcbFkh5C3AvHJ0H93pG16Uasj1DC2wDPeXjz5pcScX31mfrfbo
         vgAw0r+DwKaFNuAXTRwTKKfm0L9oFXoj3CFeqIsrzGFZ4E98JquYPPDGVBo04Ni4jcr3
         JU/5qRTvJ0VHt4GTDLptcDLz1lJ9B7FWsHHGQRELHnOmERHLDxmBZaEz8Gyn2i8IJI5O
         3PiPvKN+WwjW9gaTddhN8kBJve8gaziVUM4gDby83FUd8ST0J4H7mKOl0noVO7yVzmyN
         Py2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784490020; x=1785094820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHDTeZIldDDYJIkvsl14Ioncr+9aGn9+y+1u1DznXfQ=;
        b=ORSbjESkZpyvwk3XKgvr0zJQnAFScm34neyE1a89+SAJxk5xroMUBQhQ2FTuUYc6lA
         REBidX0pnMIkxLMc40MkZxoyc+pfc1Mjs9NZvRWWzmmGbMhk0WGf8f1LSHnipHCvesuI
         4e7TDK6A41HT60vDEJ29fCq2Km7ImJBuzu0Ei0YdmjFapg7RYmzzrTPLrZ/Lfd1ag+ZQ
         7VnrMuxM7VuyUt4RZUGY33j3F44sRKWGNV1amnzROqvobP3SKWzeDEpkE19bmzndB/LR
         dm92J4ob+4ekA+LIBvdk+h2eRbYiUL4vfQI7sDtWFKx4qnK5Um6kFl0yJetThhYX7JYd
         vc3w==
X-Gm-Message-State: AOJu0YyOc1++e2D3/mAfUPXBa52g1pdLtMtED9/tBboUx2CFk843KW7d
	CBE+wtEYURsDTBjyflFfqc4FXSfwaTjOt6wxRlZPqkuDfGgcCq8osuTZmLmD3A==
X-Gm-Gg: AfdE7cl3DShwCo//k0BHjzn3//R1qvOZObR+MWZRbpOLg1ou14URSb7Kl56DJVrcXn6
	i2eYICUFIChQf32vDp/t77FMtpB4ca+fRfxqTSx5Saih5sYUOBZ9ur3mF7aK03GQH6uamAx1326
	+vCUAYlfQSrtZdY9RWu0Z8DQT+cRMbVC2uTJX4qnQk6uJVEukvmpN5hbY0xykNB5szy082zg1xV
	+O8HP4wucHaos/RfpFQa/kilSqxjRWmFUIy5mwSiEhwRL9WuYu5TTuHDSIrvkpU8O/K0OKolly4
	0ymz/aInVEEOxXT3qIdT5MPX51fvMjFojboUVkhsnFr4/TJA8xBCj0KkFNfQSh89PDywa/kLn64
	NmIGC3LdnEW4n9srdHOOIYNvUnnPSsveUg30z8JJz+EFHVS2btoCaOru4xZ84pVFj5a4hZPFy57
	R1010ZQ/jmLUd3vhpf+gG1csAL2M25e/+1VhWfBig41nT1sQ3RqFC/pQ80aAceXM73GfDPoehQc
	94xgZMo6uizr7FAJMeJY7KsFXXwhBBFpygzKRGqn7nDZLSA+3JCWN0=
X-Received: by 2002:a17:90b:2f0c:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-38e4b431074mr12281543a91.8.1784490019784;
        Sun, 19 Jul 2026 12:40:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0fb993sm6308126a91.15.2026.07.19.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 12:40:17 -0700 (PDT)
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
Subject: [PATCH 2/2] EDAC: fsl_ddr: manage mci lifetime via devres to fix remove UAF
Date: Sun, 19 Jul 2026 12:40:09 -0700
Message-ID: <20260719194009.117532-3-rosenp@gmail.com>
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

fsl_mc_err_probe() requests the shared interrupt with devm_request_irq(),
passing mci as the handler context. At removal fsl_mc_err_remove() calls
edac_mc_free(mci) explicitly, but the devm-requested IRQ is only torn
down by devres afterwards. Between edac_mc_free() and the IRQ release,
another device sharing the line can fire and fsl_mc_isr() will
dereference the freed mci and its pdata.

Register an edac_mc_free() callback via devm_add_action_or_reset() right
after edac_mc_alloc(), so mci is owned by devres and freed only after the
devm IRQ is released (devres runs actions in LIFO order). Drop the
explicit edac_mc_free() from both the probe error paths and
fsl_mc_err_remove(); edac_mc_del_mc() is still called explicitly at
remove time so the edac device is unregistered before the deferred free.

This also lets the now-redundant devres group open/release/remove calls
be removed.

Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
drivers/edac/fsl_ddr_edac.o compiles cleanly and passes checkpatch --strict.

Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85xx")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index b1e6e177b088..cdd129bc42c7 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -490,6 +490,13 @@ static void fsl_ddr_init_csrows(struct mem_ctl_info *mci)
 	}
 }
 
+static void fsl_mc_edac_free(void *data)
+{
+	struct mem_ctl_info *mci = data;
+
+	edac_mc_free(mci);
+}
+
 int fsl_mc_err_probe(struct platform_device *op)
 {
 	struct mem_ctl_info *mci;
@@ -500,9 +507,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 	u32 sdram_ctl;
 	int res;
 
-	if (!devres_open_group(&op->dev, fsl_mc_err_probe, GFP_KERNEL))
-		return -ENOMEM;
-
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
 	layers[0].size = 4;
 	layers[0].is_virt_csrow = true;
@@ -511,10 +515,17 @@ int fsl_mc_err_probe(struct platform_device *op)
 	layers[1].is_virt_csrow = false;
 	mci = edac_mc_alloc(edac_mc_idx, ARRAY_SIZE(layers), layers,
 			    sizeof(*pdata));
-	if (!mci) {
-		devres_release_group(&op->dev, fsl_mc_err_probe);
+	if (!mci)
 		return -ENOMEM;
-	}
+
+	/*
+	 * Manage mci lifetime via devres so it is freed only after the
+	 * devm-requested IRQ is released, avoiding a use-after-free of mci
+	 * (and its pdata) in the shared interrupt handler during removal.
+	 */
+	res = devm_add_action_or_reset(&op->dev, fsl_mc_edac_free, mci);
+	if (res)
+		return res;
 
 	pdata = mci->pvt_info;
 	pdata->name = "fsl_mc_err";
@@ -558,10 +569,8 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 	if (pdata->flag == TYPE_IMX9) {
 		pdata->inject_vbase = devm_platform_ioremap_resource_byname(op, "inject");
-		if (IS_ERR(pdata->inject_vbase)) {
-			res = -ENOMEM;
-			goto err;
-		}
+		if (IS_ERR(pdata->inject_vbase))
+			return -ENOMEM;
 	}
 
 	if (pdata->flag == TYPE_IMX9) {
@@ -575,8 +584,7 @@ int fsl_mc_err_probe(struct platform_device *op)
 	if ((sdram_ctl & ecc_en_mask) != ecc_en_mask) {
 		/* no ECC */
 		pr_warn("%s: No ECC DIMMs discovered\n", __func__);
-		res = -ENODEV;
-		goto err;
+		return -ENODEV;
 	}
 
 	edac_dbg(3, "init mci\n");
@@ -639,7 +647,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 		       pdata->irq);
 	}
 
-	devres_remove_group(&op->dev, fsl_mc_err_probe);
 	edac_dbg(3, "success\n");
 	pr_info(EDAC_MOD_STR " MC err registered\n");
 
@@ -652,8 +659,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
 		  pdata->orig_ddr_err_disable);
 	ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
-	devres_release_group(&op->dev, fsl_mc_err_probe);
-	edac_mc_free(mci);
 	return res;
 }
 
@@ -674,5 +679,4 @@ void fsl_mc_err_remove(struct platform_device *op)
 
 
 	edac_mc_del_mc(&op->dev);
-	edac_mc_free(mci);
 }
-- 
2.55.0

