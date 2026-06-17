Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33122771B
	for <linux-edac@vger.kernel.org>; Wed, 17 Jun 2026 00:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781654845; cv=none; b=iW6aqPPucocbmGoH44cwfcTj9SI+aMUqzYiPYNcGTeNABP/4g83ah49GSESUhCE2yoc2v3qu+fHYlYDcvRf4b/BRS6aFmt1Zzk37xCpSqfzCbUR7HORvKPmnre2+xuGLtQh2GFCRugx2KVpkzg4b8/qfUSrTvMes/v/9QTqYdYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781654845; c=relaxed/simple;
	bh=aEes9u2i+yj9QgO6FyCALtIxp8YqYSz+z0h3ATXKHds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xlv9tbuVUsdH+Ae9YeSrhzbWX5/aJ9Tzn4qkIWZdJfcrTWpnvYr7G+bLrq6vM0yXAlmwz70Yp9mlrIIy3btaBgrasmGLSo9IYxGyyez6L4i1PiVGem3WZvojk2krd470G78CIQ7tRiXj/4mH/Hp0CQK3vCktpW81KVXCFCxEynU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WscEycC5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WscEycC5"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef29c5561so2770453f8f.0
        for <linux-edac@vger.kernel.org>; Tue, 16 Jun 2026 17:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781654842; x=1782259642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQLST9EAflau+E9cVOyO3pDFcPV3nJn3SAfvlR8kHL0=;
        b=WscEycC5OwpqRUdttkBlkWzypfqQdtPW8SiElJHTq9zUQ5efZzw7opA52n9W5FyZR0
         a/vintVCqh6ByWpc02slyvNTDC783BqfOQ2gJplFiLccF0RRYOwuNRNI2+3UG9t68ylC
         afbRZBKxm01w6MG9XQUj3wiER2kgz59KjhrMGe/hFGitqH7NcqkC3cG84Aw9HO1CzsvJ
         snFN98/d37nNPOQV6kDalFVbfm+1k7jFYVJz+R3i3crKu2ZfO1fnIcq+oWB+v+6ZBOlP
         H0PbIUV+iTRLSLfeCnz7b2IsS2wk/9YeHva2SCORBCymcidtJsC4tAGIyhk3I+RqSdfS
         +Gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781654842; x=1782259642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zQLST9EAflau+E9cVOyO3pDFcPV3nJn3SAfvlR8kHL0=;
        b=DJu3h2XfGTj+mqJd2aIaDnbeKH8FDbyjrz5EyfPzq+0/iNk3a4D9fh6+VIH6YrPn3A
         EZZM5KeyUO7T0bC++VQiJrWEtr/GwesHOiLRN4W3I49BWK0bUH6dEwNTVcglnrW1Pubc
         Z8FyyHgzwi13nNmVsRZzp5OmzsZFHLOFHW8hguUAivc+8HsHwYht1XyGfUs2FUYN9yFS
         HBJBegbbL35UwjN5fLWwnHhhITFNAI1k8V4Di5Q+phT38zxArRHR48G/UJ/NLLxXTEPK
         LMYcks7P2JKwGsQNXj5rBtsxJQFwWJzLd/j6FVc3HNTM6qFrvgD5HgJI26OlmB+H+ifK
         oyFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dk+9bbrxo9SBzqTOoXf6aqkBIcgwlA9p2jPvz+heJF3ebBNVCMN9opUqti1D4a2o1aZ3IvbTnZITy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzr5h5aI6a91Gw4tGahZfevnVnkDC5wCw0DWEHZ9Vi/wBZDYZJ
	PPp2d9Nc3Q1J0dcWrYvfuzT07HyAE0QmWmvSNaJIZlrEMchaW8KVdnKw
X-Gm-Gg: AfdE7cneVdWzYA6s+zQhHUHHSK53o6NBfj3zMWkJMYedlfTtIF0LeWmayAxzsn8E8cu
	R5MJIIIk0kRROpNlNk4EFpvo5XDQEdhRZ+BXoisVqYQNo6qcB/hS2JaLuZSNNDa4vEnPPsduNWO
	SJLikBSXX3Fi/yz4BwtNDBVRIJMdN9cvtfS8SeMeuPxND3nbeLTBxP/qBcfueQq6xcqI1cgDaHl
	yrgBUrVuK9xhNMS9qOpgY1x8UM/70f866p7kRIBThrvrnc73an+YIDNM3gFt9TK54VyLrfVnULt
	8ZsEmIxH3RKl/Hsfe00WxtnzzG0hPC6Iyrcf6pXO5zB1Tb+fDms7QvBr72DQpmwV/LpwVCHTNfH
	nw+7ysC8FuofY1CqoxvkXCGIACRSxiSOk512BxCHHUcihUol6ET99vAUon+YDzd6h6t8zSBGU+b
	G1AuuHDDcKCHDh3HccAcIzawxjLOfKotL9IGsWO5H0/V/EVjhVesuIJw==
X-Received: by 2002:a5d:5b84:0:b0:45a:dd7a:e33c with SMTP id ffacd0b85a97d-46238f981cemr2344453f8f.33.1781654842033;
        Tue, 16 Jun 2026 17:07:22 -0700 (PDT)
Received: from localhost.localdomain ([37.41.33.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f264333sm50564222f8f.4.2026.06.16.17.07.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 17:07:21 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: dinguyen@kernel.org
Cc: bp@alien8.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rounakdas2025@gmail.com,
	tony.luck@intel.com
Subject: [PATCH v3] EDAC/altera: use ECC manager compatible to select A10/S10 IRQ layout
Date: Wed, 17 Jun 2026 04:07:11 +0400
Message-ID: <20260617000711.60804-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <470f54e9-9e92-40c1-9383-6be055170d69@kernel.org>
References: <470f54e9-9e92-40c1-9383-6be055170d69@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDMMC ECC IRQ layout selection uses CONFIG_64BIT to distinguish
between Arria10 and Stratix10 paths. This is architecture-based,
while the interrupt layout is a hardware property described by DT
compatible strings.

Detect the SoC once at probe via the altr,socfpga-s10-ecc-manager
compatible on the ECC manager node, store it under the struct
altr_arria10_edac, and use it in altr_portb_setup() and
altr_edac_a10_device_add() in place of CONFIG_64BIT.

Selecting on the manager compatible keeps the decision SoC-wide and
correct for every ECC child device (OCRAM, USB, EMAC, SD/MMC),
and avoids repeated compatible lookups. Stratix10 and
Agilex both declare altr,socfpga-s10-ecc-manager and Arria10 does not,
so behaviour is unchanged on all three SoCs.

Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
v3:
 - Use compatible string altr,socfpga-s10-ecc-manager instead of
   sdmmc-ecc (Dinh).
 - Set it once into struct altr_arria10_edac::is_s10 to
   avoid repeated of_device_is_compatible() calls (Dinh).
 - Fix the checkpatch open-parenthesis alignment.

v2: https://lore.kernel.org/linux-edac/20260616081709.48774-1-rounakdas2025@gmail.com/
 - Use legal name in Signed-off-by (Borislav).

 drivers/edac/altera_edac.c | 106 +++++++++++++++++++------------------
 drivers/edac/altera_edac.h |   1 +
 2 files changed, 55 insertions(+), 52 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 4edd2088c2db6..c728cd474abdf 100644
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
@@ -2122,6 +2121,9 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, edac);
 	INIT_LIST_HEAD(&edac->a10_ecc_devices);
 
+	edac->is_s10 = of_device_is_compatible(pdev->dev.of_node,
+					       "altr,socfpga-s10-ecc-manager");
+
 	edac->ecc_mgr_map =
 		altr_sysmgr_regmap_lookup_by_phandle(pdev->dev.of_node,
 						     "altr,sysmgr-syscon");
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

