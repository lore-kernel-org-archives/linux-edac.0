Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0392430CD82
	for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 21:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495605; cv=none; b=lG8QCIWRAJPJEIpEgeYvFRJykGaXEGlDoA/5jIT5efF8MHME0QUCZHYv/Fl07HG2+/11uo66nGWpzPsYrfrjlLm/4rapXijwkK8lcrXJmtVKi2mZTWK27As3BHvvPv86gb+ftvjI7Snzgl48tNKYfOwA9kUIGj4SfwJpr2FQeBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495605; c=relaxed/simple;
	bh=xB9i/dO3WyjAhHsqQ6yXzdKWe8poByHZyA7mlpwBkvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJRtlrk5pNQlFQYX7UlBKx3nCBTT47e17/xb1mFomFUoF18nzmgNKWS/BD7FDSRJladsWqqq399zyU4ubaWbumEH5yRK30o2ckCx9aoS+HdTxBmnAMIEeeLurMAUxypypw9l38nJvCBtklFQUyzdbYGZBqAD2R/sbWyGt6wyb2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKkUjOBF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKkUjOBF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf41bab353so25154045ad.0
        for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 14:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495603; x=1785100403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDAfciyZ/pwo0fbmhhGM+NACzss/tT17iLwZvqyayw0=;
        b=YKkUjOBFnujqX/U0RLKfdqmU986iDUOsm7wtpxnObZcze4WK/yP5fP2e30usyKT4pU
         lPzA4q6lXCxT40OzX/r2j0vccn3yjhE33D741nqzoikWrw6arS2tqbN/udlSm7ddl8uK
         wOi5QtoI3iClE1ZaObHL366KZFnVOP2Na7Sfq0rSlKYsVvTwvBUoISE3fb44DKNnxodC
         GRut3mQ13QO8N9oWqczg1PCUV2mvChmZJut5MApGPXVi6AoYVC1z0BXkLIN8c4Tume4/
         x7WzYS08FtaqsjwevltxGCXRvclzKCB30PishG4/R328RPs7ojlG50d/OiNHWLC3u1pM
         Y8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495603; x=1785100403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDAfciyZ/pwo0fbmhhGM+NACzss/tT17iLwZvqyayw0=;
        b=CZuBugXOwtxu/77tJwLm7MAi/w/+PopqykIn60KdpH/SCeDFvxBhlxwiT7LQ1Q5DJ4
         wxqTxBxLpfQlj9/nGqSNuNFjItuK1hoQzml/YnJNgY4lUp0+sdTdnMO3npCMdQuA/YvE
         HPbGxNvsXRpo70/ToMojtdU/8m3CluJB3ZyApxz5KTE2VlWybF2OgymGyp0s7jNUn5QL
         +/dDeTy2x57nIRAiL8hm5ZY8Wj3kpcSaEwBNVCZby1jmYnlnCue2+UU1574s1fxghg+z
         XSGREnKU1GB1wTPyxNTGi+hLAj17JBNe6tiybxcjJ4vnQO4HQ310K5Sjm1iYf5bWhaSy
         4eAA==
X-Gm-Message-State: AOJu0Ywg71kPkHcrANCBOflT6/ymme3xcn0pSfxjUT8mj+mgswTP9Kv3
	FftT0csgiDIzlHyVVNXIA19CVcAwD2NnYLBd1WqfP61GKNW0mo+llm/VG2Gehw==
X-Gm-Gg: AfdE7cmZDYVokDy7ZyoBUFZT5E9UYagVY5grm2F2hO6/myMXGGPMwXdFjDR8x3q8IxT
	goA3WHCk5izdBP+ktS+VtfdVlbyTuEH9yEI4AHWOEiiMy3fdj98I6KUq8pnUwm009qJS4KZ3OdY
	CvC7gskIaHnY7JZ8gXE+vPTkGL+461CYjf8RGGjB9d9XqK9aO7Qa45rM3/kSTSdMMbZ7vFCVf4f
	QJ2lbzt2YO/Ph7Pl7BBBGCdykaiUTj/c4A92mJIQN/I/la+LsH55P1Z5ef8fSbJ+QHPcVzps/tn
	FiPCuDmi0bPuYzicksZobFTuMY0lZlIh0aUhcZNmsvV/a+R1zGC6/m3Qf8JynMLRtjWF12i0j3I
	QrQt8v06OkHV/js9OqSaXkLTXhKoIDDA8TX17HIm3bvLwkv5dDtWylka6aWgM06QnHuOGbboart
	lEp2iyqhqoSS98WbBEjd0SsRHkko9PmvgHHfHfjCyfwtBBR+MkK6CBD65Pjg8XbOfVbNXWL4aa6
	mDIdswyXRK7iAVfv/2galyawUaTKVuBBjWAfbGXy2rZEjEEMuuLZzeBLhkQIjeGXQ==
X-Received: by 2002:a17:902:e805:b0:2c9:d277:2cdd with SMTP id d9443c01a7336-2cf34887c56mr126301735ad.13.1784495603367;
        Sun, 19 Jul 2026 14:13:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34729df7sm45566775ad.63.2026.07.19.14.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] EDAC/highbank: manage mci lifetime via devres and simplify ioremap
Date: Sun, 19 Jul 2026 14:13:21 -0700
Message-ID: <20260719211321.592800-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() +
devm_request_mem_region() + devm_ioremap() sequence with the single
helper devm_platform_ioremap_resource(), and move platform_get_irq()
earlier, dropping the redundant -ENODEV/-EBUSY/-ENOMEM error paths.

highbank_mc_probe() requests its interrupt with devm_request_irq(),
passing mci as the handler context, but highbank_mc_remove() frees mci
via edac_mc_free() before devres releases the IRQ, leaving a
use-after-free window in the shared interrupt handler. Register an
edac_mc_free() callback via devm_add_action_or_reset() right after
edac_mc_alloc() so mci is owned by devres and freed only after the IRQ
is released. Drop the explicit edac_mc_free() from both the probe error
path and highbank_mc_remove(), and remove the now-redundant devres
group open/close/release calls.

Built for arm (CONFIG_EDAC_HIGHBANK) with LLVM=1;
drivers/edac/highbank_mc_edac.o compiles cleanly and passes checkpatch
--strict.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/highbank_mc_edac.c | 65 ++++++++++++---------------------
 1 file changed, 23 insertions(+), 42 deletions(-)

diff --git a/drivers/edac/highbank_mc_edac.c b/drivers/edac/highbank_mc_edac.c
index 3448ab750e9c..aeb326434cb3 100644
--- a/drivers/edac/highbank_mc_edac.c
+++ b/drivers/edac/highbank_mc_edac.c
@@ -142,6 +142,13 @@ static const struct of_device_id hb_ddr_ctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, hb_ddr_ctrl_of_match);
 
+static void highbank_mc_edac_free(void *data)
+{
+	struct mem_ctl_info *mci = data;
+
+	edac_mc_free(mci);
+}
+
 static int highbank_mc_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *id;
@@ -150,16 +157,23 @@ static int highbank_mc_probe(struct platform_device *pdev)
 	struct mem_ctl_info *mci;
 	struct hb_mc_drvdata *drvdata;
 	struct dimm_info *dimm;
-	struct resource *r;
 	void __iomem *base;
 	u32 control;
 	int irq;
-	int res = 0;
+	int res;
 
 	id = of_match_device(hb_ddr_ctrl_of_match, &pdev->dev);
 	if (!id)
 		return -ENODEV;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
 	layers[0].size = 1;
 	layers[0].is_virt_csrow = true;
@@ -171,36 +185,13 @@ static int highbank_mc_probe(struct platform_device *pdev)
 	if (!mci)
 		return -ENOMEM;
 
+	if (devm_add_action_or_reset(&pdev->dev, highbank_mc_edac_free, mci))
+		return -ENOMEM;
+
 	mci->pdev = &pdev->dev;
 	drvdata = mci->pvt_info;
 	platform_set_drvdata(pdev, mci);
 
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
-		res = -ENOMEM;
-		goto free;
-	}
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "Unable to get mem resource\n");
-		res = -ENODEV;
-		goto err;
-	}
-
-	if (!devm_request_mem_region(&pdev->dev, r->start,
-				     resource_size(r), dev_name(&pdev->dev))) {
-		dev_err(&pdev->dev, "Error while requesting mem region\n");
-		res = -EBUSY;
-		goto err;
-	}
-
-	base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!base) {
-		dev_err(&pdev->dev, "Unable to map regs\n");
-		res = -ENOMEM;
-		goto err;
-	}
-
 	settings = of_device_get_match_data(&pdev->dev);
 	drvdata->mc_err_base = base + settings->err_offset;
 	drvdata->mc_int_base = base + settings->int_offset;
@@ -208,8 +199,7 @@ static int highbank_mc_probe(struct platform_device *pdev)
 	control = readl(drvdata->mc_err_base + HB_DDR_ECC_OPT) & 0x3;
 	if (!control || (control == 0x2)) {
 		dev_err(&pdev->dev, "No ECC present, or ECC disabled\n");
-		res = -ENODEV;
-		goto err;
+		return -ENODEV;
 	}
 
 	mci->mtype_cap = MEM_FLAG_DDR3;
@@ -230,33 +220,24 @@ static int highbank_mc_probe(struct platform_device *pdev)
 
 	res = edac_mc_add_mc_with_groups(mci, highbank_dev_groups);
 	if (res < 0)
-		goto err;
+		return res;
 
-	irq = platform_get_irq(pdev, 0);
 	res = devm_request_irq(&pdev->dev, irq, highbank_mc_err_handler,
 			       0, dev_name(&pdev->dev), mci);
 	if (res < 0) {
 		dev_err(&pdev->dev, "Unable to request irq %d\n", irq);
-		goto err2;
+		goto err;
 	}
 
-	devres_close_group(&pdev->dev, NULL);
 	return 0;
-err2:
-	edac_mc_del_mc(&pdev->dev);
 err:
-	devres_release_group(&pdev->dev, NULL);
-free:
-	edac_mc_free(mci);
+	edac_mc_del_mc(&pdev->dev);
 	return res;
 }
 
 static void highbank_mc_remove(struct platform_device *pdev)
 {
-	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
-
 	edac_mc_del_mc(&pdev->dev);
-	edac_mc_free(mci);
 }
 
 static struct platform_driver highbank_mc_edac_driver = {
-- 
2.55.0

