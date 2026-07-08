Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41983E3C4F
	for <linux-edac@vger.kernel.org>; Wed,  8 Jul 2026 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501920; cv=none; b=XMXJkFBh3Q/LM7447NSTdbiV46TGPJdnN0Imj0LE5YdAR89rjb/7IpoNcqem8MP8H9L6kKS+zx8FNLP5HPHStUbfi/qvJS4UmLE8jXnZxmV3RrdACyozbmvU5vUS9ZjjmYvTMpGn0fJgXaBjBrgdL/VfuhimpblGg1whkgISg7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501920; c=relaxed/simple;
	bh=xm2lYyTUL4Q5EW+eVp44OoOTfHyKq2qI9moGvjYHldk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXZx2h4el2i3nC5CFwo5/IFZtiJ6tFdv9V9eZZD6ca70rSzVSUsEfsjMY+/3vjU+CrLzSYyGC89q0EBNR4nA0U9fTbzoq2tNIbTC0inZnopyopjo9+UGn5hAd9WrMDsDj1z80VlVFF65d+ijrEo05dr7+4bRCs15RNEINtCxiig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTiuENfn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTiuENfn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b27c7451so17623265e9.0
        for <linux-edac@vger.kernel.org>; Wed, 08 Jul 2026 02:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783501917; x=1784106717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPNDbkQoDdIVU2mDaeMhb7tmuYAJPYfVVvdvfTT0yQg=;
        b=mTiuENfnJ5FuxTsOJBIdItLUePX3sNw+pUs2YXL0Cg89QZ+4OMIvXlA9ByrSkZt3qV
         EuO1NLBz0o6cANXIDO0uv24f472TiTkYP1JpFgPU2VdZvFIMZmuza2vVGXsprLprtv8w
         LtowrMbEWyT4IHdpxJHk6lOYcdqj7Kv7V6nmj4IZqp4JLYTpI63aTw6vbqca6MmSzKpC
         wKnpucsSDebZHoEsTSS4/tbl9tvg24gBugPdJcsqMKqI5daBUWBsgb9ksVpv3Q5P4BX1
         45BkiQ8NQGb8uabDbx+rHhhyELov4+1sfoVh5yUAStIPM8dEXCFBhAXCOhK8opxdRDVK
         B/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501917; x=1784106717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OPNDbkQoDdIVU2mDaeMhb7tmuYAJPYfVVvdvfTT0yQg=;
        b=l+i1xTrPzwVppWjfslblsEtqFBcrGBfItrBGwsWq32fUumalLZwe1GTxkvi2gBiNV2
         3ddv4RPh1oL0P62CydQBG18FygzxzVdK8sT0MRIvsoqb0yXAQRQgCISVy64ZyQjwffow
         k+tvDmgKIeJ00iXcY8i236rW1ausD+dzSd8boWglFA2ejc0hNgQtWMDtpRC57zy6VMBd
         DJ93KqSNU+hardqlvnidbGjQY+JIoL5MgjnRamq9TXZMIU30O16Andv9Tcs7JHpvvaLq
         ODXccv2nQAiQsSR4hLmMGLTTYQ1zseqORi7G0RZZGJ6hQfGy8e83NG1pVZDSePEcI07Q
         oVlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqvnc0T1x3Vb3N0d6tsEAguvkvse9z3BaYsg1PsiVZ9UBLsI8dQyTCqO30fAy4uqTH4vOIo0PlVz9ap@vger.kernel.org
X-Gm-Message-State: AOJu0YySX64p0vqkKnVyZCGLwXusMsx+PfaapCm6UJ55+GrztpfBXu8I
	/AizgmRhwxbeG8Y2sdXjwXry216j3/dNWNoEByyLWH9HVbuvc15+VRu3
X-Gm-Gg: AfdE7clK+pVlPWW55cW3uDpQIyoKQEFA9om3cuVBr0JE3c14fIaEF228mQSiIfsgBl7
	ZYScFflBxfG5UZvF69YnOLXZxy0YCkU4q5Kv/PogG7427xbXyT6FQppJWWSzE4vCC/rP5PJEQbt
	cnzwP//gh14Lu1ndPhiy6w5HrszUSeCcV1UeAn3KDrzl6qPpmi9avJqj0OuSNnRmNZ24srePMgu
	k2a5WrUUprLhivGc5S7AVuZp5QqTBStn1FMjD/dSYsGydBuEm81lm4lVvQfM4dkBpN+wgHHKa+Z
	/Csil6aVDWAWPsBqI5Jm+JuGlnk0+6NqRpS2GwaPOsHtI/HjcUkoGYBNKRn2DbhV8vxs9dik+6e
	sOUaN6zYkVaCaF+yVVCE4tevTRnZq1UOAZOL97tKKVZRLAOBFGCNC/0+XlkJUED9wkrcyLqP5SR
	z/EIh2f5iOhQSwi0yMd+e1CpXYQmjpaEaPLGpK2XGIEVdiBAKVldaYes2BYsjcMPo0
X-Received: by 2002:a05:600c:3f0f:b0:493:b698:9247 with SMTP id 5b1f17b1804b1-493e639ac57mr17325015e9.14.1783501916680;
        Wed, 08 Jul 2026 02:11:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:1670:1b:3626:64e6:9d2c:1204:3e04])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f32660sm127772895e9.2.2026.07.08.02.11.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 02:11:55 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: dinguyen@kernel.org
Cc: bp@alien8.de,
	rounakdas2025@gmail.com,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] EDAC/altera: use ECC manager compatible to select A10/S10 IRQ layout
Date: Wed,  8 Jul 2026 13:11:34 +0400
Message-ID: <20260708091135.94114-2-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708091135.94114-1-rounakdas2025@gmail.com>
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDMMC ECC IRQ layout selection uses CONFIG_64BIT to distinguish
between Arria10 and Stratix10 paths.

Detect the SoC once at probe via the device match table (.data)
store it in struct altr_arria10_edac, and use it instead of CONFIG_64BIT.

This keeps the decision correct for every ECC child device
(OCRAM, SD/MMC, etc.) and avoids any runtime compatible lookup.

Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
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

