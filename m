Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A44531716E
	for <linux-edac@vger.kernel.org>; Mon, 15 Jun 2026 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781551007; cv=none; b=I0Ka1hBmDEDticbsgqYgIHmmZt3yqOE+Ef9uEp5Pr2cZNpp3+5V5TRXkz/AZpnGxHH+y8cIUcCxbcCP4+ciqtI13orYKMtsmOLfBLBvYyBhS7WqJ2LjDry3x5InTjoR50MrF9XEoWG1tf0zB5Q57yVTl1b6IAPB4vrqQS71enWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781551007; c=relaxed/simple;
	bh=NBJcGWJS1ALb91XFb7sqXhDAuRZ1YnyTJAih7WeyG9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c37KaQsqwy1aAk0CVf2rVDUkfPQfpHeQ5uWgUg/vPIUiIoQ5IclTl0CLdKikkEIBgl4tWd1Pu4RDSs07bgGf6wRV7kj1w0zl0ftYYDrZ5MZM5jcKoFurrbAIqGiNd/RHSV3FiW3ilvusRIczSAG9PuBmrjzdQHFcH8JiHxJ4u0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oC+vC7EZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oC+vC7EZ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso1756266f8f.0
        for <linux-edac@vger.kernel.org>; Mon, 15 Jun 2026 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781551005; x=1782155805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aViUoOqo3ck7rDbczTqdCc8hfInm8ne/np54efYciIo=;
        b=oC+vC7EZTNDcvrpatdvMtJcipxNSvH8jp/aKrreUbIHIQiHQNhtfUO0OgVq1F8zdju
         At11wHTvju63vM6htR0+0lzVnBLYrcwUUdEJ7/IdVOcF0M5iqYkPctko60Dg7JCJgwC6
         JrSQJsrxcWdhCncycmha04rSLU/XDYR5HyvDkR1prdN8kemp4TB1bqcydLYUA3xQh0sC
         TGCL5UeORjN58y16kyPUyAH+LshOMiHC+x0AJ81l7lA6aFyjz7mxUDVqaNKK64tqHQzM
         d1EXfVL4v0NNyualZJfICtm9BJ7Js8xyMATjVzq47S7kvAKNDFeTkq1Crro9s6+Bubx3
         Hp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781551005; x=1782155805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aViUoOqo3ck7rDbczTqdCc8hfInm8ne/np54efYciIo=;
        b=W37FGDT6XMscxQck5fWqfn9MttEl07MY6UD0hQWLbKJTp4W1gXM6sRgAgNyUi0T/hu
         7kdzJoVC3nvS93Zw3gQOhBiwKu9Pbs7zd+20qC8D+duGxKkBAF07ONHdmD5s6+h/Wk6x
         +crZ3IU7rPOiwBiT+bDTXvlQ7vT+ccBUzSBIcdBoCp26dz5p731+RWzXRjhBDmCJ1A8a
         SxBfp45FMBT1RxX77dh5UVlWTBCnXGOGmcKqvdppiD9faM2j08GlXU1XFscEDOkI9BOr
         D2Jzep1XZJYXNKfLj7cdkvgkUWM3L9C9YTafOHv5FKjwc5gvK81lhPcmexXPXLguIj7T
         SKAA==
X-Forwarded-Encrypted: i=1; AFNElJ9lvEsqj8K39BX1Zxj9N+jQC6Z111Ln9BuIYp3/nV1pPbHsCAnG10UaKX8ebRLBhjEUkL/FOu3SkhW9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1HcPGBcxAN3VvbauGrcvJR0H8zCdOqnym36BlLopn1hQeTInt
	PSgOEvuTs+rA7aFH6hEWxLhnPkrAaKdD5PGPvvqqT0wBXmYRr+vTtKIAz5lS0o+HQvcuZd5m
X-Gm-Gg: Acq92OG0LsCfTSGqZtIlzXrtd9Mm64F4pFc1cwWDXF/NLCit+e3+Ek4eqSguF2aQbjM
	kFAq+1qIA7/zoW6NddaWcZxXJhU/UVhOYUOch7/KJl2DWw2j1+lckWzkEtxz9x0c826A+GF0t6+
	VJwRvboDGxbyA2Cn7TCl/Ocv9BI7EJtUQgR6V3KzL+KaY7TizgbUawCoC6frrJOpoWG8009R/PF
	fpij5o8DMNggTXGXyu9SOoBNCFCe4TXVMvNNe9r9hTcKqi7r075qSdTBd08g5cq2y/y4zpAHcij
	k4e2SsPsFXOoDn/uNk+qu32zn3kySakmJHSaCvxF8F51uMz2x53llDucZEoc+MAUaibuAnIQER4
	53K0b8tA2Ls9H5mJMv6zvYYdkUm969/edghd62y0DHxtzC5kvHBhKm3q6R1zCIm9ZhUGbNVvx7S
	BNJOdNtXYVOPyvAVUC3rZom743MqSIjkOTgsOVAzskwg18WvyY6/5Hz/usdfSg1MEa
X-Received: by 2002:a05:6000:4707:b0:461:9e6a:f91a with SMTP id ffacd0b85a97d-4619f2856a0mr1254639f8f.0.1781551004544;
        Mon, 15 Jun 2026 12:16:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:1670:1b:3626:9588:9178:eefa:7c47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm37323348f8f.1.2026.06.15.12.16.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 12:16:44 -0700 (PDT)
From: AZ9tumas <rounakdas2025@gmail.com>
To: dinguyen@kernel.org
Cc: bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AZ9tumas <rounakdas2025@gmail.com>
Subject: [PATCH] EDAC/altera: use SDMMC compatibles to select A10/S10 IRQ layout
Date: Mon, 15 Jun 2026 23:15:08 +0400
Message-ID: <20260615191508.46335-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Signed-off-by: AZ9tumas <rounakdas2025@gmail.com>
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

