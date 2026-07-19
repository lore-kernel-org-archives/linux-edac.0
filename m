Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5844D17BB21
	for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 20:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784492165; cv=none; b=X8odqFsBK+E64bqYazQAsAwpeoVM8KpYneEHyaOpFFggNDvunVmOWj9tD74wqoEvXUWeQBtrGJN9yD5v9HKUVLMVd3ovOQf9Crcrt1N2RApHmTXWP9D96mbFt78qU4zFI3f6qgBWEh1AQBgiJyTPh8GYOt3Oi43Iv1o12KA6b60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784492165; c=relaxed/simple;
	bh=S3ZAZTnVI61BJZH/XagCXm7D5+H8PYPOjoWBz9R77lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sSX2SA8fzh8H9gMyKaA0toUDmUAFl0UROQxmmUaIERVzEmkDV3lfZRKUsurUZLSwZg3dkEfzGN4CCJQ75rwCb/GbVbUR0p6dwpqPPt81D9tLy0en1B2s4zGjNNkbdLSSlAwGwu1+xh3JGLbgTnZVTx0zcAJuLfUQOvik7FXEjiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpvheE5+; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpvheE5+"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-384c94c9414so5100726a91.3
        for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 13:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784492164; x=1785096964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVSXItgURNFIq6EsxubzFWcf+i6RbOIXI0lH1YoD/ms=;
        b=bpvheE5+5Zfs5TPE6wuRCpviAtYjhkirjMCIOZKED8q8hJ0VWF2UzHar/2qmAcj230
         flvmmzbDcblyBWQnuM95bh6hRmM3hEPQyX7sdWJfIA0XTzGmoskUIyp7BtLC64uYF1zF
         5A02AvYAZZVeidqEN+FUQGUg8IMsakJrnPOGEXSxtLUELHW8WXObD/iXuW4Q+2ake2jN
         iEFc26R2gANcd5EHzmF1+DIwF4ivvGKOyPo/1AGD1xysEOGur80If9Pzef+zH6g/6p3c
         gINcpETnO+nZW1fGJ8/x4k8RjqdYv9B4YcWzQaJkoQY+yPL9XTAr7LgPWlC1v5wrdVZV
         6lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784492164; x=1785096964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVSXItgURNFIq6EsxubzFWcf+i6RbOIXI0lH1YoD/ms=;
        b=XyTTzrYalywlNPdPSB0vCQsEPwR4+vbIKmuffMFrPX6nzQogeHxdEGUkuDPjsYBL+u
         9OmDdMGG24ZfXOZWqYAzMx7QhDMZyxtT5ru4rJcSd+6RgjKnCplg1DNpw/inhJnmnze3
         kGyB6v+ew+4HRnkaREI8UQfJc2w0+ef3DgX7gJYmHqYwP6q3us42yVecnmQrrFsAjOIT
         Hx3myxk1TN54zDCbEUUE9O5Ll9rPYLGK32bhx+yE5yQSmiEizY9gg4UCjHhj0tktOL8J
         RuT8UHbGqeX0Ctg/zIIybfCn1sq3LktLaOKLl1Mw8aLsdT83EIUlZ5x0rUtpghDgmWeE
         BWwA==
X-Gm-Message-State: AOJu0Yxda18fDkGf7LDVa7MfEiyPJYPAerzxpF86RTh4SJgTcBDPZosu
	/BC8S0p5mVfx4BmShwqAOD0r9hA8O2ZLnnnVvtuh/K1vhNFG7fTswW+EzZtAHQ==
X-Gm-Gg: AfdE7clYqBHGDIvfzapYTrFPdQy3/52Kej5m9N0gwyHI0d8KA8QY4n1W7KPUg94aVhi
	ZLKzOfQOqyXIdcNYeP9MUuorsCGMaPu14EsNZmts5Vgqmfow7tVaQ3byK7g/XNXoXvAuSgUFjv6
	FcSAnnt8llC14iUkDPQjChoXviHj4iceI9Zc/4rGr+nJ7PCAfepbVdJuSYJeVxVeht0ksYryLh5
	Zccfls6Uvj70fax58tPN9N0+cVKdm1Rp9TylIgadHIpu6zyLFd0J11+saCf7w3EweHYaeXmscVA
	8nGQkMs2nUS12vOxe/mBQeoTwI2Ce5Hl71WzrBC9k/1UMMwWKPaaXTaN10yti276zPgHl6007vl
	b3pSDEmNKjzCAs6EVEGxZ6t8+tdfwp5JMhHZe9+z8N+HBMbSz0HmDwZjlVad0+pwsHfJ0ouitv3
	/hGmOAMYmq3n6kySHEre/TxL4DX0N46MWadoLuA2bCDQ7Zpcb2JkOxfw0eTegMM/eGb+S2T//RN
	W/sFWmoZMmgA7JckH2qAWl6rpW2jIypL/1Hgx2N8HUhjiznYpatQAc=
X-Received: by 2002:a17:90b:3ec7:b0:381:5a08:6291 with SMTP id 98e67ed59e1d1-38e4b503aa4mr11320509a91.20.1784492163625;
        Sun, 19 Jul 2026 13:16:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39fe37d1sm6473418a91.12.2026.07.19.13.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 13:16:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] EDAC/mpc85xx: manage controller info lifetime via devres
Date: Sun, 19 Jul 2026 13:15:58 -0700
Message-ID: <20260719201558.310738-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mpc85xx_pci_err_probe() and mpc85xx_l2_err_probe() request their shared
interrupt with devm_request_irq(), passing the allocated control info
(pci / edac_dev) as the handler context. At removal the driver frees
that control info explicitly via edac_pci_free_ctl_info() /
edac_device_free_ctl_info() before devres tears down the IRQ, leaving a
use-after-free window in which a peer device on the shared line can fire
and the ISR dereferences the freed structure.

Register a free callback via devm_add_action_or_reset() immediately after
allocation so the control info is owned by devres and freed only after
the devm IRQ is released (devres runs actions in LIFO order). Drop the
explicit frees from both the probe error paths and the remove callbacks,
and remove the now-redundant devres group open/release/remove calls.

Built for powerpc (CONFIG_EDAC_MPC85XX) with LLVM=1;
drivers/edac/mpc85xx_edac.o compiles cleanly and passes checkpatch
--strict.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/mpc85xx_edac.c | 42 +++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index 7bb13f85ce57..13c88600f7b5 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -141,6 +141,13 @@ static irqreturn_t mpc85xx_pci_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void mpc85xx_pci_edac_free(void *data)
+{
+	struct edac_pci_ctl_info *pci = data;
+
+	edac_pci_free_ctl_info(pci);
+}
+
 static int mpc85xx_pci_err_probe(struct platform_device *op)
 {
 	struct edac_pci_ctl_info *pci;
@@ -150,13 +157,14 @@ static int mpc85xx_pci_err_probe(struct platform_device *op)
 	struct resource r;
 	int res = 0;
 
-	if (!devres_open_group(&op->dev, mpc85xx_pci_err_probe, GFP_KERNEL))
-		return -ENOMEM;
-
 	pci = edac_pci_alloc_ctl_info(sizeof(*pdata), "mpc85xx_pci_err");
 	if (!pci)
 		return -ENOMEM;
 
+	res = devm_add_action_or_reset(&op->dev, mpc85xx_pci_edac_free, pci);
+	if (res)
+		return res;
+
 	/* make sure error reporting method is sane */
 	switch (edac_op_state) {
 	case EDAC_OPSTATE_POLL:
@@ -285,7 +293,6 @@ static int mpc85xx_pci_err_probe(struct platform_device *op)
 			 | PEX_ERR_ICCAD_DISR_BIT);
 	}
 
-	devres_remove_group(&op->dev, mpc85xx_pci_err_probe);
 	edac_dbg(3, "success\n");
 	pr_info(EDAC_MOD_STR " PCI err registered\n");
 
@@ -294,8 +301,6 @@ static int mpc85xx_pci_err_probe(struct platform_device *op)
 err2:
 	edac_pci_del_device(&op->dev);
 err:
-	edac_pci_free_ctl_info(pci);
-	devres_release_group(&op->dev, mpc85xx_pci_err_probe);
 	return res;
 }
 
@@ -310,7 +315,6 @@ static void mpc85xx_pci_err_remove(struct platform_device *op)
 	out_be32(pdata->pci_vbase + MPC85XX_PCI_ERR_EN, orig_pci_err_en);
 
 	edac_pci_del_device(&op->dev);
-	edac_pci_free_ctl_info(pci);
 }
 
 static const struct platform_device_id mpc85xx_pci_err_match[] = {
@@ -484,6 +488,13 @@ static irqreturn_t mpc85xx_l2_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void mpc85xx_l2_edac_free(void *data)
+{
+	struct edac_device_ctl_info *edac_dev = data;
+
+	edac_device_free_ctl_info(edac_dev);
+}
+
 static int mpc85xx_l2_err_probe(struct platform_device *op)
 {
 	struct edac_device_ctl_info *edac_dev;
@@ -491,16 +502,16 @@ static int mpc85xx_l2_err_probe(struct platform_device *op)
 	struct resource r;
 	int res;
 
-	if (!devres_open_group(&op->dev, mpc85xx_l2_err_probe, GFP_KERNEL))
-		return -ENOMEM;
-
 	edac_dev = edac_device_alloc_ctl_info(sizeof(*pdata),
 					      "cpu", 1, "L", 1, 2,
 					      edac_dev_idx);
-	if (!edac_dev) {
-		devres_release_group(&op->dev, mpc85xx_l2_err_probe);
+	if (!edac_dev)
 		return -ENOMEM;
-	}
+
+	res = devm_add_action_or_reset(&op->dev, mpc85xx_l2_edac_free,
+				       edac_dev);
+	if (res)
+		return res;
 
 	pdata = edac_dev->pvt_info;
 	pdata->name = "mpc85xx_l2_err";
@@ -573,8 +584,6 @@ static int mpc85xx_l2_err_probe(struct platform_device *op)
 		out_be32(pdata->l2_vbase + MPC85XX_L2_ERRINTEN, L2_EIE_MASK);
 	}
 
-	devres_remove_group(&op->dev, mpc85xx_l2_err_probe);
-
 	edac_dbg(3, "success\n");
 	pr_info(EDAC_MOD_STR " L2 err registered\n");
 
@@ -583,8 +592,6 @@ static int mpc85xx_l2_err_probe(struct platform_device *op)
 err2:
 	edac_device_del_device(&op->dev);
 err:
-	devres_release_group(&op->dev, mpc85xx_l2_err_probe);
-	edac_device_free_ctl_info(edac_dev);
 	return res;
 }
 
@@ -602,7 +609,6 @@ static void mpc85xx_l2_err_remove(struct platform_device *op)
 
 	out_be32(pdata->l2_vbase + MPC85XX_L2_ERRDIS, orig_l2_err_disable);
 	edac_device_del_device(&op->dev);
-	edac_device_free_ctl_info(edac_dev);
 }
 
 static const struct of_device_id mpc85xx_l2_err_of_match[] = {
-- 
2.55.0

