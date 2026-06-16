Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CF8360EE4
	for <linux-edac@vger.kernel.org>; Tue, 16 Jun 2026 08:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781597850; cv=none; b=NV/r8b7uX+bdzAs7OwpAyDpSdo2a2PqccUx4m5BbntQoVzbmXdQmo2gkBv+Sg88msvKP1vUJ0ehaaOTh0XjyhOX1pdehXl/qxz8qq8tP3B2hu9pAocOzpp65TO+4egDHQ3+HFR6vz41tv0N4kEqtBMkIfND3xEdDmkY6k+OIcVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781597850; c=relaxed/simple;
	bh=UTXMTQrMhN3R5ECxLYD7W5iv5Zgiw+hrRmP05ilrfOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gx841TMtZpfT7S1CDZ/9EXZiAcPA/TOjIrZBE2XegB2sqR1/C/W+8UOYg5I53BaJ84oXxzFBWLwPNdxD06q5HjoSvObSX1tjX3oz1sBDEFTvyIDfPJKYUhEebXLajRH3L9eBdYw4MMi1zU7jPGY4OCPPS4t0I22h6nyDk+bUzp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2fSALJl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2fSALJl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so41345295e9.1
        for <linux-edac@vger.kernel.org>; Tue, 16 Jun 2026 01:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781597847; x=1782202647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75IkNlC1QHcM4HB1+jD3ziBofvuVCPKMNCVxrgnfGD8=;
        b=D2fSALJlPy7uOd1mZ4OVp4rd+eyANYDpNpW8sA4tJplBf2FwQXEtqHYRdIS+700V1+
         XOGWZ9QGTNA3DC1hzNREApnQWKKYF0SFUf8xGFbJcMrQ05WJrbSjAwMn8bQRrLa0apjP
         h3979YciCosAjP8Rj9GQuXkce7QUnyYP8ClsrVny8DrsA9UAoH69qblnWs5b61GkINpU
         sPHIUa8BUVcXpoRAq2nLNSm3cAk2PEXuGGLxGzgSCmg+mVFlBADVtHAShC7xTE/kw6wD
         ClJ4f3dqOY8h6HAwRzt3EEGqcK6jepELDDSBS+jtZB/mjlgyObOwJpyCqb25+pt1l6+o
         nALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781597847; x=1782202647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75IkNlC1QHcM4HB1+jD3ziBofvuVCPKMNCVxrgnfGD8=;
        b=XWeK4Q3o7Qvdc0eWZ+QGqP8z+NjgaUaBbVOlbUlqcvrUsYQDOLlmhd0e0PFEWi3PGE
         p+K+IuKYewk3tAfCqlZYxo6cpiTRtWI0dEhFoh/K1tvn2S1TWmfSIK1DEQIfjZesezZ4
         UnI352bhBm7550BV0yCaTLGZxMKQ6oZRpzkWi8r905VBxjnNzb8S1fSJrb+G3RKA0DpB
         mdtIuQvLVDZdqKu6m/uciU5XmrdkOy0fHU59dJc4WGpIT+t/1KfBJgUfSFYKyqqS/aF6
         L7bcXD53PTS2n+bBC6fW+wy3BvLaja1kb3qsKFY3UKUYvdslyzeUNEwe6Lcb5vYi8Ka+
         zRFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gmQWqu7iMa37EZIqcNTI0C39igaci3yjwBsnWskvypcLeUeJQWna49fRkIb66//4B3jh3399D1fdq@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHgnXVqtTtiM+5Rv/mob3bAUvB3UO1DsPZIXb+DaE5udpD05x
	KZJcWNoPyXm+f2QOImzI1xMGUtFGuYDZVH9RQ7ENnGR2uwPb2si+0hKkvxElZbcEQHnnV2Tg
X-Gm-Gg: Acq92OHFO/AA7CY+OshSMU9yNXbGlLcFjHx44vW8gl3A79JBOORhB8ohEc9c6yMfN/G
	E/qEE7I/zbuMf5dcIiYO6D0WzJV2aOtPF5xVVSwU5hXP8rUT7u7yNYtXDSQefVxPiYJs+EPb3XC
	ARhXdx5D+MPMsHbr2am11PJevlIj0UqBrqSRg5vknVHHIEQp+lvhabuD8ZR4d9gXugOLAuDFTGP
	Nxe1KpfpVkHrAsvdWDYdFcbO2C9HjMOIn3RGd67aDXmlS2d3tXHSsFge+ON1sgQBYpX73hbUncm
	dpAI1Od+bGj9UjA73SCXqoarJyo/8lFcDVY+RIU2Wkwm7RLW411RYYGf173w23kOgzZSw8wtBuU
	O4Etfy1AFXNvii4H0tuZWDDTHB2Z2a3GKrzKAW9O5GhJQsZ5fit6JbJSvhvYVuN/efh2XnpXuTk
	MEb6xUIFSEDql42v0HGiUFzmiVioSTFilXJZYZjuV3V4iOVZXbz9D/ixBl12tF71/N
X-Received: by 2002:a05:600c:a20f:b0:490:e19b:9632 with SMTP id 5b1f17b1804b1-4922fb071acmr26949905e9.17.1781597846633;
        Tue, 16 Jun 2026 01:17:26 -0700 (PDT)
Received: from localhost.localdomain ([2001:1670:1b:3626:9588:9178:eefa:7c47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm59172835e9.11.2026.06.16.01.17.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 01:17:26 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: dinguyen@kernel.org
Cc: bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rounak Das <rounakdas2025@gmail.com>
Subject: [PATCH v2] EDAC/altera: use SDMMC compatibles to select A10/S10 IRQ layout
Date: Tue, 16 Jun 2026 12:17:09 +0400
Message-ID: <20260616081709.48774-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260615191508.46335-1-rounakdas2025@gmail.com>
References: <20260615191508.46335-1-rounakdas2025@gmail.com>
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

Select the SDMMC IRQ layout via of_device_is_compatible() checks
for altr,socfpga-s10-sdmmc-ecc in both altr_portb_setup() and
altr_edac_a10_device_add().

This keeps the existing behavior for both SoCs while making the
selection mechanism hardware-descriptive.

Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
 drivers/edac/altera_edac.c | 105 +++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 52 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 4edd2088c2db6..161331ef57c01 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1548,15 +1548,16 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 
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
+	bool is_s10_sdmmc = of_device_is_compatible(np, "altr,socfpga-s10-sdmmc-ecc");
+
+	if (is_s10_sdmmc)
+		altdev->sb_irq = irq_of_parse_and_map(np, 1);
+	else
+		altdev->sb_irq = irq_of_parse_and_map(np, 2);
+
 	if (!altdev->sb_irq) {
 		edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB SBIRQ alloc\n");
 		rc = -ENODEV;
@@ -1570,29 +1571,29 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
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
+	if (is_s10_sdmmc) {
+		/* Use IRQ to determine SError origin instead of assigning IRQ */
+		rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
+		if (rc) {
+			edac_printk(KERN_ERR, EDAC_DEVICE,
+					"Error PortB DBIRQ alloc\n");
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
+					prv->ecc_irq_handler, IRQF_TRIGGER_HIGH,
+					ecc_name, altdev);
+		if (rc) {
+			edac_printk(KERN_ERR, EDAC_DEVICE, "PortB DBERR IRQ error\n");
+			goto err_release_group_1;
+		}
 	}
-#endif
 
 	rc = edac_device_add_device(dci);
 	if (rc) {
@@ -1974,29 +1975,29 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
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
+	if (of_device_is_compatible(np, "altr,socfpga-s10-sdmmc-ecc")) {
+		/* Use IRQ to determine SError origin instead of assigning IRQ */
+		rc = of_property_read_u32_index(np, "interrupts", 0, &altdev->db_irq);
+		if (rc) {
+			edac_printk(KERN_ERR, EDAC_DEVICE,
+					"Unable to parse DB IRQ index\n");
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
+					IRQF_TRIGGER_HIGH,
+					ecc_name, altdev);
+		if (rc) {
+			edac_printk(KERN_ERR, EDAC_DEVICE, "No DBERR IRQ resource\n");
+			goto err_release_group1;
+		}
 	}
-#endif
 
 	rc = edac_device_add_device(dci);
 	if (rc) {
-- 
2.50.1 (Apple Git-155)

