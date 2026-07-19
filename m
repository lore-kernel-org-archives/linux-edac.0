Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566030C632
	for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 21:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495562; cv=none; b=PeGQpwILE/rmvy3wFHlcSggAR8Zs/kty93YSAiVgHDMnTJc7TgHc5QcUACpsu+PWmbXjjVP1zqZHYYmB8iTIb3olM3Y7J16aT7hZTA0HTglicplL5Z/p3GjL3eocH/aclTwjtlRMmIvdsGOl87UCWkMNr/50hglSs76Y3HqqimQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495562; c=relaxed/simple;
	bh=kski0H7sdbKvfS+ROd9mCLlYX8Xx1mFCSVlEBupSDN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYy4hukMvfHupQPNHqowsqALBde1V75yVdPZcKYL9CDm1BSIAJC6DvYJlOQy0msdV95fD7UyuvqwoL0nFHEE6gIoPuRfg2w0bGS6TQdsxcp5MzviAr68XWbtnybsY4ArLtU3+ZOftDqwhcnRBWqvt38pqPTbXgu7EcMEqxMczqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ln4RSJhk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ln4RSJhk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so104014675ad.1
        for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 14:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495561; x=1785100361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gNHYVkmjlUEXhs1RgPaHE20c67yry/MBZs5gDBfneWw=;
        b=ln4RSJhkxIX+ZDB/GrAFeea/eGo1zQuzZVucCwL47P8XFGK24+QYZ1w7aYowXDQxA1
         qpz2+hUDZdx1Q53upgvnVxu2KYcLcv9HZYgJ4RNUdzk/iexjU6ezHELMX3YEWmbAizPC
         X6TgonjlDICwQxieMs5SXZtIxtzYv7SoVTzYfkFzSORsU1to1aalEUl3sezGpeHLxBUW
         ZZhMvwIQFCtUaxavG/30V/wXjWZxOzW5Jv09u4is6bxIabizCWU53KAOt6hDpI5N0Yti
         PkilmRVlA6ZfK38mCQ1QM98w0OOSuO1Id5yGoZhSF4kZMocdeXSVI8FYsl0ofsX0x+uQ
         jTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495561; x=1785100361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNHYVkmjlUEXhs1RgPaHE20c67yry/MBZs5gDBfneWw=;
        b=qP17LlP5AbIIkWyYOAlJjf+oXaj9382C+/v1YC6aisHr6gb91WISO1DmVO1C1mveu2
         QWs5pYfCr6PGWR5rSYaV8u3OmGmIgLUeTy9S47k1pePx0GD5n4OFzhPHcO69F+d+fXX3
         uIGSLVYKxVvlAG5s32OvYpGz2Tays2vsjRoBQTf/bswm4P6icH4xteMOvRpE9zybpbaA
         BL0ra4Li2XJIQcqEt3Nladfsv1ziw7FeAPcozEq3RLQ86UhlbX8kB0b6aaoZpE8MYXP6
         2l7gdoFeu1REYgnxR0q6vpWxzBsGk/YxHHbVT3WMcAR36ntMwWRVEYfamm9NViUzQIgT
         g9pQ==
X-Gm-Message-State: AOJu0YywXRV//f9x7MWzwvi7tYJibwAGMVqlmLh2HLQGjsGL6WZAo0VH
	zf5t4VoVT4v63uZSAc8CCYcu+0+8e2n1+oKR6OxCVQJojNlPlPEemRBHQKHw/g==
X-Gm-Gg: AfdE7clvlNje8ECA1zJ0l9F9OnUsXg2gGh4n7yCwe33S2nD0klnCD3FrkTza3Y7XTpe
	XpzqhxwQPNEbdIvRHAFB1Kvnul6dyi/R/1JCIWAMj0NiufpxbUO12NOq3SILlNgalb3gTG3RljB
	TxnUEUGLVgE6HcO1M1nX4c9K1rTZGFa5ucEzrHQGv9wK2XUNouwte3/nN11vSAB2/y72GmEHzG5
	dD+uWqCckkPG00AN+9UQ95UQBuKEjB96CeCoXd1RX4LJVS+PFPgqDX47uKoAKqOgtaZ/92bpFju
	EKiez09jgJSNequMJUZCw6vXmqU5Y5hYfksm6u9NdhTFLAqNooBYCk5OqvDvqxO7Yf5nhuLqXdQ
	P+xyW/FoBys6SHgp8BMaLV+8a2J7y24+RcMxLTtwcxPJDBWaTKFNJqPuH6K1nx2CmA8fPB1COTE
	HC/u5BCcXywTb1uWf3/5m6dF1m3RGyyR7d6hrREbLGpXfFrDUgM066d8Fl6XQVlW3cN3yxRaFM2
	ASdEqR+3bgWLfjplvhJWuDv4VxPlxFeczVmiz9AKjj02CXyvqkLgvw=
X-Received: by 2002:a17:903:2ec5:b0:2cc:77f3:a927 with SMTP id d9443c01a7336-2cf34961e63mr147312725ad.26.1784495560785;
        Sun, 19 Jul 2026 14:12:40 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm45106575ad.4.2026.07.19.14.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:12:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] EDAC/altera: manage dci lifetime via devres and simplify ioremap
Date: Sun, 19 Jul 2026 14:12:38 -0700
Message-ID: <20260719211238.589402-1-rosenp@gmail.com>
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
helper devm_platform_ioremap_resource(), and move the platform_get_irq()
calls earlier, dropping the redundant -ENODEV/-EBUSY/-ENOMEM error
paths. Also drop the now-orphaned devres_close_group() call left in the
success path after the devres group open/release calls were removed.

altr_edac_device_probe() requests its interrupts with devm_request_irq(),
passing dci as the handler context, but altr_edac_device_remove() frees
dci via edac_device_free_ctl_info() before devres releases the IRQs,
leaving a use-after-free window in the shared interrupt handler.
Register an edac_device_free_ctl_info() callback via
devm_add_action_or_reset() right after edac_device_alloc_ctl_info() so
dci is owned by devres and freed only after the IRQs are released. Drop
the explicit edac_device_free_ctl_info() from both the probe error path
and altr_edac_device_remove().

Built for arm (CONFIG_EDAC_ALTERA) with LLVM=1;
drivers/edac/altera_edac.o compiles cleanly and passes checkpatch
--strict.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/altera_edac.c | 76 ++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 45 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 68846f583eee..1d0d3c99c91b 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -703,37 +703,37 @@ MODULE_DEVICE_TABLE(of, altr_edac_device_of_match);
  *	Module specific initialization is done by passing the
  *	function index in the device tree.
  */
+
+static void altr_edac_device_free(void *data)
+{
+	struct edac_device_ctl_info *dci = data;
+
+	edac_device_free_ctl_info(dci);
+}
+
 static int altr_edac_device_probe(struct platform_device *pdev)
 {
 	struct edac_device_ctl_info *dci;
 	struct altr_edac_device_dev *drvdata;
-	struct resource *r;
+	void __iomem *base;
+	int db_irq;
+	int sb_irq;
 	int res = 0;
 	struct device_node *np = pdev->dev.of_node;
 	char *ecc_name = (char *)np->name;
 	static int dev_instance;
 
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
-		edac_printk(KERN_ERR, EDAC_DEVICE,
-			    "Unable to open devm\n");
-		return -ENOMEM;
-	}
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		edac_printk(KERN_ERR, EDAC_DEVICE,
-			    "Unable to get mem resource\n");
-		res = -ENODEV;
-		goto fail;
-	}
+	sb_irq = platform_get_irq(pdev, 0);
+	if (sb_irq < 0)
+		return sb_irq;
 
-	if (!devm_request_mem_region(&pdev->dev, r->start, resource_size(r),
-				     dev_name(&pdev->dev))) {
-		edac_printk(KERN_ERR, EDAC_DEVICE,
-			    "%s:Error requesting mem region\n", ecc_name);
-		res = -EBUSY;
-		goto fail;
-	}
+	db_irq = platform_get_irq(pdev, 1);
+	if (db_irq < 0)
+		return db_irq;
 
 	dci = edac_device_alloc_ctl_info(sizeof(*drvdata), ecc_name,
 					 1, ecc_name, 1, 0, dev_instance++);
@@ -741,20 +741,18 @@ static int altr_edac_device_probe(struct platform_device *pdev)
 	if (!dci) {
 		edac_printk(KERN_ERR, EDAC_DEVICE,
 			    "%s: Unable to allocate EDAC device\n", ecc_name);
-		res = -ENOMEM;
-		goto fail;
+		return -ENOMEM;
 	}
 
+	if (devm_add_action_or_reset(&pdev->dev, altr_edac_device_free, dci))
+		return -ENOMEM;
+
 	drvdata = dci->pvt_info;
 	dci->dev = &pdev->dev;
 	platform_set_drvdata(pdev, dci);
 	drvdata->edac_dev_name = ecc_name;
 
-	drvdata->base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!drvdata->base) {
-		res = -ENOMEM;
-		goto fail1;
-	}
+	drvdata->base = base;
 
 	/* Get driver specific data for this EDAC device */
 	drvdata->data = of_match_node(altr_edac_device_of_match, np)->data;
@@ -763,44 +761,33 @@ static int altr_edac_device_probe(struct platform_device *pdev)
 	if (drvdata->data->setup) {
 		res = drvdata->data->setup(drvdata);
 		if (res)
-			goto fail1;
+			return res;
 	}
 
-	drvdata->sb_irq = platform_get_irq(pdev, 0);
+	drvdata->sb_irq = sb_irq;
 	res = devm_request_irq(&pdev->dev, drvdata->sb_irq,
 			       altr_edac_device_handler,
 			       0, dev_name(&pdev->dev), dci);
 	if (res)
-		goto fail1;
+		return res;
 
-	drvdata->db_irq = platform_get_irq(pdev, 1);
+	drvdata->db_irq = db_irq;
 	res = devm_request_irq(&pdev->dev, drvdata->db_irq,
 			       altr_edac_device_handler,
 			       0, dev_name(&pdev->dev), dci);
 	if (res)
-		goto fail1;
+		return res;
 
 	dci->mod_name = "Altera ECC Manager";
 	dci->dev_name = drvdata->edac_dev_name;
 
 	res = edac_device_add_device(dci);
 	if (res)
-		goto fail1;
+		return res;
 
 	altr_create_edacdev_dbgfs(dci, drvdata->data);
 
-	devres_close_group(&pdev->dev, NULL);
-
 	return 0;
-
-fail1:
-	edac_device_free_ctl_info(dci);
-fail:
-	devres_release_group(&pdev->dev, NULL);
-	edac_printk(KERN_ERR, EDAC_DEVICE,
-		    "%s:Error setting up EDAC device: %d\n", ecc_name, res);
-
-	return res;
 }
 
 static void altr_edac_device_remove(struct platform_device *pdev)
@@ -810,7 +797,6 @@ static void altr_edac_device_remove(struct platform_device *pdev)
 
 	debugfs_remove_recursive(drvdata->debugfs_dir);
 	edac_device_del_device(&pdev->dev);
-	edac_device_free_ctl_info(dci);
 }
 
 static struct platform_driver altr_edac_device_driver = {
-- 
2.55.0

