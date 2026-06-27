Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5392426F2B0
	for <linux-edac@vger.kernel.org>; Sat, 27 Jun 2026 06:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782541089; cv=none; b=i+JkRR7Ez8QRubRHJkmo3xOuwpSSfF0ajWVN2k/VM99sXpuZaI5IRhSRM6lv+aOGmA3kD3wtcMfTsX12uLbZLPXqoI8+WWHo5ppKtx9mtdFxQnWWMaD+KriUtBmkueeEfuSlzNOMPSuXnBwqz+Wvm94V5AVGytoI47gYskmCvE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782541089; c=relaxed/simple;
	bh=xfQ8qRNmkwvsq1Ev/USsf7PEfEhxf3cD2iIefHN5Zbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OBaMl0wt1IJEiLHgUcy9IcGRWg/pbtb5ZJU96IHbOdDAcsFBcLWEualG8kxrgvJFWqJDYDa+3wqBJjcNRo+2+d4mFd6rX6cAPyl/hN6HF/BGfYXVANPkAHPcyQ7j7u+uRz+xY4iQHe/t1jPpo+LhWlpix5rOgO4oTVbbBJyNLtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cspfKQkS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cspfKQkS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46def4bd5e8so1493651f8f.1
        for <linux-edac@vger.kernel.org>; Fri, 26 Jun 2026 23:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782541087; x=1783145887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9q77farvO9P+y8KT44PSREEZ5RV5Uc13y2noXFCoFg=;
        b=cspfKQkSb1PLJZho2BMDm85ggNBrJUjiII4RVTuGML5Km4DsxIn2an/wxIaU5VfbCq
         jKlVCWTP2h+OHxP8i4GSWgtmr+rLH4kVcWh9aUyo/uCIZVQNjtjn3ghAnNkMmP+bNWVF
         ZUsajmvygRQvXD+D01DDxg1P3YLrO9ue0T39eqdtJgaDbhplDPZOeKCwIdYpDzSfvcG0
         tpLQWwNa1a/ea5Xd+vrJHXAqDFFxINaCLHP8b6kVESYdfQt5AXHYXLd1xn9rtRsqigHt
         5eES53OCdbEtSRzYdoQkogKySWw0T/++nVuf2TT5YqmS7fheeMD/o40qkcZF8f2H6RPd
         Uknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782541087; x=1783145887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9q77farvO9P+y8KT44PSREEZ5RV5Uc13y2noXFCoFg=;
        b=PUUbTx8+vHbGXVokwaM8XsO3DphR9VoDsW/o5qhdStZoqxLTTw6IGXEdTAByQLP/6x
         k6IV8qHqeUaBKK5D7tf94F/mnvyBeGeyPXC7gpFxZsQ7g+B2YzKvvbFFXSK/+1WARDvs
         koS0Bj0HES/JvQSDQuBO2fozMMZDr5+tetpXqQ1eteMkrMALZYFiRU7laCqsx+xJRukO
         S8sHJVi2fsYShhK0EIJhNezMX0Eq34MptaFckmaWKShkSq+6YmOZtIShNLZBp2V/JPot
         PvQ19P4J9PjC2+Mb0ivoMy2kyJ3fg7ZEBGYNxUFl1sG5x1/eX6zZF4s9i2GfhDqRp1DE
         6J7w==
X-Forwarded-Encrypted: i=1; AHgh+RpTid9BHLJK9I9gBUrbpmhlJDoIa6DYdZ1ke+N9xTkS2neA5uVEpkoeNndCiJcpvnlPY3k730vH89Eq@vger.kernel.org
X-Gm-Message-State: AOJu0YzVESuQLEyO2dSCGEu/nxw1fRZu8BQJMzNhhNN2QQWK1hyYRfKK
	TxnhZ5X9cH+wAzabG0RrbGClQq+mJ+CXFa7jZx7Yc1NKiPMAsagGP6qP
X-Gm-Gg: AfdE7ckAjrkuyecZ+F5HG5LR8+34rulPxkMGbyN8CROmalAkjVvTyt2DwdgPQWhtGSR
	WlM3Ukt8HODrDjuWf6d8mkg8I2vDYVYZqqfRQW7w1sERaxBrK2Fi/bTT5QZU28+DqmFrO046Vc9
	NtzECAKVDiCMJqUK02EPLRgO+Mj0j0qOCL8lr3daMmysNSWBO71aeXYclnRwibi8uMkuEwdcQS8
	InZGVxRRxt0uzEL/+poPVbVolIjiBCach3Xo4enc3rbKRcDB+lfS+G/poM+M/ShOQP2LsorM3F+
	3js9SAN9pkF4cwd4CYjKhW52n29lhNGVkHOoQrGGVQ6rXi1xSrdob9p2OYLvtCDf7RNu77dqA1z
	7j4MT5JK/71F6qG+ARTWyjrd+bJg+Z/qEEYQLoRhy96FxWPeCOulp6gqkEqTPjzIzt07uS5y5aq
	2hgCfKRcHWBOhKdbYfew1jEtxfDFEYkwfMf0COqZOuShuV6RhIYGMSCg==
X-Received: by 2002:a05:6000:2f8a:b0:46d:d6c1:8383 with SMTP id ffacd0b85a97d-46dd6c18494mr14628555f8f.44.1782541086583;
        Fri, 26 Jun 2026 23:18:06 -0700 (PDT)
Received: from localhost.localdomain ([2001:1670:1b:3626:89dc:67b0:2cd8:f24f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f9db29b15sm6239124f8f.18.2026.06.26.23.18.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:18:05 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: dinguyen@kernel.org
Cc: bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rounak Das <rounakdas2025@gmail.com>
Subject: [PATCH v4] EDAC/altera: use ECC manager compatible to select A10/S10 IRQ layout
Date: Sat, 27 Jun 2026 10:17:23 +0400
Message-ID: <20260627061723.43014-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDMMC ECC IRQ layout selection uses CONFIG_64BIT to distinguish
between Arria10 and Stratix10 paths.

Detect the SoC once at probe via the device match table (.data),
store it in struct altr_arria10_edac, and use it instead of CONFIG_64BIT.

This keeps the decision correct for every ECC child device
(OCRAM, SD/MMC, etc.) and avoids any runtime compatible lookup.

Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
v4:
 - Carry the A10/S10 distinction in the device match table .data and read
   it with device_get_match_data(), instead of of_device_is_compatible()
   at runtime (Dinh).

v3: https://lore.kernel.org/lkml/20260617000711.60804-1-rounakdas2025@gmail.com/
 - Use altr,socfpga-s10-ecc-manager and store it once as is_s10 (Dinh).
 - Fix checkpatch alignment.

v2: https://lore.kernel.org/linux-edac/20260616081709.48774-1-rounakdas2025@gmail.com/
 - Use legal name in Signed-off-by (Borislav).

 drivers/edac/altera_edac.c | 107 +++++++++++++++++++------------------
 drivers/edac/altera_edac.h |   1 +
 2 files changed, 55 insertions(+), 53 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 4edd2088c2db6..24bdf7f5bac63 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1507,6 +1507,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	int edac_idx, rc;
 	struct device_node *np;
 	const struct edac_device_prv_data *prv = &a10_sdmmceccb_data;
+	bool is_s10 = device->edac->is_s10;
 
 	rc = altr_check_ecc_deps(device);
 	if (rc)
@@ -1548,15 +1549,14 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 
 	/*
 	 * Update the PortB IRQs - A10 has 4, S10 has 2, Index accordingly
-	 *
-	 * FIXME: Instead of ifdefs with different architectures the driver
-	 *        should properly use compatibles.
 	 */
-#ifdef CONFIG_64BIT
-	altdev->sb_irq = irq_of_parse_and_map(np, 1);
-#else
-	altdev->sb_irq = irq_of_parse_and_map(np, 2);
-#endif
+
+	/* Using compatibles to determine the IRQ Index */
+	if (is_s10)
+		altdev->sb_irq = irq_of_parse_and_map(np, 1);
+	else
+		altdev->sb_irq = irq_of_parse_and_map(np, 2);
+
 	if (!altdev->sb_irq) {
 		edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB SBIRQ alloc\n");
 		rc = -ENODEV;
@@ -1570,29 +1570,28 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		goto err_release_group_1;
 	}
 
-#ifdef CONFIG_64BIT
-	/* Use IRQ to determine SError origin instead of assigning IRQ */
-	rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
-	if (rc) {
-		edac_printk(KERN_ERR, EDAC_DEVICE,
-			    "Error PortB DBIRQ alloc\n");
-		goto err_release_group_1;
-	}
-#else
-	altdev->db_irq = irq_of_parse_and_map(np, 3);
-	if (!altdev->db_irq) {
-		edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB DBIRQ alloc\n");
-		rc = -ENODEV;
-		goto err_release_group_1;
-	}
-	rc = devm_request_irq(&altdev->ddev, altdev->db_irq,
-			      prv->ecc_irq_handler, IRQF_TRIGGER_HIGH,
-			      ecc_name, altdev);
-	if (rc) {
-		edac_printk(KERN_ERR, EDAC_DEVICE, "PortB DBERR IRQ error\n");
-		goto err_release_group_1;
+	if (is_s10) {
+		/* Use IRQ to determine SError origin instead of assigning IRQ */
+		rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
+		if (rc) {
+			edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB DBIRQ alloc\n");
+			goto err_release_group_1;
+		}
+	} else {
+		altdev->db_irq = irq_of_parse_and_map(np, 3);
+		if (!altdev->db_irq) {
+			edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB DBIRQ alloc\n");
+			rc = -ENODEV;
+			goto err_release_group_1;
+		}
+		rc = devm_request_irq(&altdev->ddev, altdev->db_irq,
+				      prv->ecc_irq_handler, IRQF_TRIGGER_HIGH,
+				      ecc_name, altdev);
+		if (rc) {
+			edac_printk(KERN_ERR, EDAC_DEVICE, "PortB DBERR IRQ error\n");
+			goto err_release_group_1;
+		}
 	}
-#endif
 
 	rc = edac_device_add_device(dci);
 	if (rc) {
@@ -1974,29 +1973,29 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
 		goto err_release_group1;
 	}
 
-#ifdef CONFIG_64BIT
-	/* Use IRQ to determine SError origin instead of assigning IRQ */
-	rc = of_property_read_u32_index(np, "interrupts", 0, &altdev->db_irq);
-	if (rc) {
-		edac_printk(KERN_ERR, EDAC_DEVICE,
-			    "Unable to parse DB IRQ index\n");
-		goto err_release_group1;
-	}
-#else
-	altdev->db_irq = irq_of_parse_and_map(np, 1);
-	if (!altdev->db_irq) {
-		edac_printk(KERN_ERR, EDAC_DEVICE, "Error allocating DBIRQ\n");
-		rc = -ENODEV;
-		goto err_release_group1;
-	}
-	rc = devm_request_irq(edac->dev, altdev->db_irq, prv->ecc_irq_handler,
-			      IRQF_TRIGGER_HIGH,
-			      ecc_name, altdev);
-	if (rc) {
-		edac_printk(KERN_ERR, EDAC_DEVICE, "No DBERR IRQ resource\n");
-		goto err_release_group1;
+	if (edac->is_s10) {
+		/* Use IRQ to determine SError origin instead of assigning IRQ */
+		rc = of_property_read_u32_index(np, "interrupts", 0, &altdev->db_irq);
+		if (rc) {
+			edac_printk(KERN_ERR, EDAC_DEVICE,
+				    "Unable to parse DB IRQ index\n");
+			goto err_release_group1;
+		}
+	} else {
+		altdev->db_irq = irq_of_parse_and_map(np, 1);
+		if (!altdev->db_irq) {
+			edac_printk(KERN_ERR, EDAC_DEVICE, "Error allocating DBIRQ\n");
+			rc = -ENODEV;
+			goto err_release_group1;
+		}
+		rc = devm_request_irq(edac->dev, altdev->db_irq, prv->ecc_irq_handler,
+				      IRQF_TRIGGER_HIGH,
+				      ecc_name, altdev);
+		if (rc) {
+			edac_printk(KERN_ERR, EDAC_DEVICE, "No DBERR IRQ resource\n");
+			goto err_release_group1;
+		}
 	}
-#endif
 
 	rc = edac_device_add_device(dci);
 	if (rc) {
@@ -2122,6 +2121,8 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, edac);
 	INIT_LIST_HEAD(&edac->a10_ecc_devices);
 
+	edac->is_s10 = !!device_get_match_data(&pdev->dev);
+
 	edac->ecc_mgr_map =
 		altr_sysmgr_regmap_lookup_by_phandle(pdev->dev.of_node,
 						     "altr,sysmgr-syscon");
@@ -2207,7 +2208,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 
 static const struct of_device_id altr_edac_a10_of_match[] = {
 	{ .compatible = "altr,socfpga-a10-ecc-manager" },
-	{ .compatible = "altr,socfpga-s10-ecc-manager" },
+	{ .compatible = "altr,socfpga-s10-ecc-manager", .data = (void *)1 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, altr_edac_a10_of_match);
diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index f3e84172caa9c..9387056fd65e3 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -394,6 +394,7 @@ struct altr_arria10_edac {
 	struct irq_chip		irq_chip;
 	struct list_head	a10_ecc_devices;
 	struct notifier_block	panic_notifier;
+	bool is_s10;
 };
 
 #endif	/* #ifndef _ALTERA_EDAC_H */
-- 
2.50.1 (Apple Git-155)

