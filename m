Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F954374A16
	for <linux-edac@vger.kernel.org>; Thu,  1 Oct 2026 17:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875225; cv=none; b=QBMke0Eu66uSPSmCT26CCQpgZMSH05NUTKmOVG0RaioFmIvmpNH64Ee5WGG7S2lG9+1T7XyxjvTohvcas6uDTHmS3WBZPG0b7zgcbe0JNVk13vbm3lnbsTXTH0H4c7HzL7TtXHFr8LnCkZeXVpr45bDbNBjVVSq/uX0y6IpNvdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875225; c=relaxed/simple;
	bh=OxS+1IZAxnYMpcaeqt2iQydCtWpEYgg5yxV67eW0zzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pzrfHTIQyPuVCqZ0s2zZDW5uAxn8G7wQeggbULlyoZ09Y7Z+kXnGWEL7cuXNwibdIaX8c82dBdge5od17hk5do5NmBM41XRLQL3a1D6UZbJPWZQHvzi9F6cIHVwHnweK/8BiqhQfCtmnqIMt/eX6GkxPkEYPMUbiVLGkGTpkwao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTeeh3VA; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTeeh3VA"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b590a5b5eso3561919eec.2
        for <linux-edac@vger.kernel.org>; Thu, 01 Oct 2026 10:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790875218; x=1791480018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYkwop8sZ4Wv1H89GDxkyXfocnnB2cA/vwFrfxPIM5w=;
        b=kTeeh3VAQ/vr+M3FaFJKmee0SpIwLH39PJA13jK0nUgfHvEyzrbuTmBuCYyhOC4oB8
         iL663/Bjp5eJlXbh6e4dcu6wqRKZ1dqpRo2n9k4nUQtHhWUAVvx0nB6yboiQs0itOqPH
         BPDnH5mfYaynuFz2XugXbMe8LVz8Ess22kO3Fpr/d9SkH+rgta8Z/S9a/pHdrkO0YLAR
         VL4PpieJnIqEtsRmYJracGJS6kTnlzWUgw06ARZ/WIqvjXkoFSuQAhQNztULYFZMyuu7
         ReRq56ogrEJAFK8TOD/DIk4gfGBoZawsKMXdR0pnIwgEzi+KFBtfA34K/8AFQ7rTybiV
         cCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790875218; x=1791480018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYkwop8sZ4Wv1H89GDxkyXfocnnB2cA/vwFrfxPIM5w=;
        b=JY/aKl7lPhvh7YulrdXUWW7xdEW1Zkf7drk5RmUtQ17PaHC+HN7H6t6rIn9ZahWmxv
         VktLkabX484T3HCu6X8/OvEVbkGZ4y0wd2f3Ko5hBw2fB1NBKSEx91DPL1CSTZsb1Jcq
         mZBu15pfUKGJZ8RA3TULacU+qoo6GmIJgmuCEVbEhT2Q6eME51Yu6z4/3qXyVnaZi1XN
         lV5LtMo8E1NsRNMt1Dm+f8A2u4s/CcWKRPZGyChBXPs+sKU+547gjQu6fpc2qk3+LMxh
         1DrGb8nPgwp/5NxEuXcj3LTeJN48gb5JPIrC1LuKrjkIQU6RJa55Sjf/gD5s2+R5tBRa
         pblQ==
X-Forwarded-Encrypted: i=1; AKwUvBzht935cIOYwJqHFgpgAe5uIxMTw0V2s6W/GLUdCF6VQ09IuPH0judWkQwULWzqQ1FuVNgdAncK0aXo@vger.kernel.org
X-Gm-Message-State: AFuF++m75Qk71FQEG6EKJ+m5EPI2BVaqxNGr/vZSra4VhL1KS66pkWs7
	PoGsXWolFvD0Xk8KHNhITllr1DUZatdTz/fGQAKEoz4CKCXSaquj6AmO
X-Gm-Gg: AYBFou1mdHhim3Tb+H2Ji7SpZISU17DsHNdlYIykjHzIIJ42LkhUBM/t3DzECMKOKEu
	DRIwpzUyGsNVrGlwiHMiARn2FS9HUugg2fsucbUyTcvNJfKQ6OPTAthRnirTUvhUyCJ8Z/BCVae
	vS0dooRFFANFefgU9ILx1Qjy7iqqfAUerj+arEpuJ7RDDY8o62Grp6iWS5ZcHBSrANm78nsnKsu
	GtaCBX7OrwqfaJn1nk2OaeNqwBaKFNT4j8nPc9KzPshLzesLwM334P0R3z7N3ly1nUWy87DC9kg
	h/V6KWa3w/ZutdFEXxkTv7ufeeQteu3T2tyezsFQmSfe9tu9Ct4CqWL3hV0fHBmF2tG7g8qk/jC
	gtDVlAD6XKKedz8TakbsASLjrLnuOTRyA9sC6prZqYtuLpYOZcSsOKhmbAuflqMDVYWkctvaIJx
	8urdaOi65bIX/pYOJT0F824Q/HVIQY3T1M5hUhK9SS4bAbU9rna2WiclSb+zY+Q1O1YzpyveMru
	jWLXFa2PHPumuEVSuSo3cXBhnP2XE1Ctckbbw/2asLc4nGIr21CTeQ=
X-Received: by 2002:a05:7022:f50c:b0:144:eaa7:2917 with SMTP id a92af1059eb24-14d31798eb5mr4854479c88.10.1790875218157;
        Thu, 01 Oct 2026 10:20:18 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e3:2043:8da3:ada2:3f2a:4408:a682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f46ab87bcsm44980c88.9.2026.10.01.10.20.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 10:20:17 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rounak Das <rounakdas2025@gmail.com>
Subject: [PATCH] EDAC/altera: Refactor exit paths in altr_portb_setup()
Date: Thu,  1 Oct 2026 22:45:56 +0530
Message-ID: <20261001171556.57548-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

altr_portb_setup() has a single caller, socfpga_init_sdmmc_ecc(), which
looks up the same SDMMC ECC node and holds a reference to it across the
call. Pass that node in instead of looking it up a second time. This makes
altr_portb_setup() lose its lookup and its of_node_put() calls. The caller
drops its reference at every path.

Convert the remaining unwinding to one goto label per resource. Each
exit path undid its own acquisitions by hand, so commit 7d5a36a5490d
("EDAC/altera: Fix device node reference leaks in the SDMMC ECC setup")
had to add the same of_node_put() calls to four of them.

While at it, replace the two comments on the PortB IRQ index with one
that describes the interrupt layout, and select the index with a
ternary.

A devres_open_group() failure now also prints the common error
message. No other functional change intended.

Suggested-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/all/20260926185955.GAargWKzpAwXXC4CQW@fat_crate.local/
Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
 drivers/edac/altera_edac.c | 45 ++++++++++++++------------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index bb95dab847b3..e21e2836f6e6 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1481,13 +1481,13 @@ static const struct edac_device_prv_data a10_qspiecc_data = {
 #ifdef CONFIG_EDAC_ALTERA_SDMMC
 
 static const struct edac_device_prv_data a10_sdmmceccb_data;
-static int altr_portb_setup(struct altr_edac_device_dev *device)
+static int altr_portb_setup(struct altr_edac_device_dev *device,
+			    struct device_node *np)
 {
 	struct edac_device_ctl_info *dci;
 	struct altr_edac_device_dev *altdev;
 	char *ecc_name = "sdmmcb-ecc";
 	int edac_idx, rc;
-	struct device_node *np;
 	const struct edac_device_prv_data *prv = &a10_sdmmceccb_data;
 	bool is_s10 = device->edac->is_s10;
 
@@ -1495,18 +1495,11 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	if (rc)
 		return rc;
 
-	np = of_find_compatible_node(NULL, NULL, "altr,socfpga-sdmmc-ecc");
-	if (!np) {
-		edac_printk(KERN_WARNING, EDAC_DEVICE, "SDMMC node not found\n");
-		return -ENODEV;
-	}
-
 	/* Create the PortB EDAC device */
 	edac_idx = edac_device_alloc_index();
 	dci = edac_device_alloc_ctl_info(sizeof(*altdev), ecc_name, 1,
 					 ecc_name, 1, 0, edac_idx);
 	if (!dci) {
-		of_node_put(np);
 		edac_printk(KERN_ERR, EDAC_DEVICE,
 			    "%s: Unable to allocate PortB EDAC device\n",
 			    ecc_name);
@@ -1518,9 +1511,8 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	*altdev = *device;
 
 	if (!devres_open_group(device->edac->dev, altr_portb_setup, GFP_KERNEL)) {
-		edac_device_free_ctl_info(dci);
-		of_node_put(np);
-		return -ENOMEM;
+		rc = -ENOMEM;
+		goto err_free_dci;
 	}
 
 	/* Update PortB specific values */
@@ -1534,26 +1526,22 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	dci->dev_name = ecc_name;
 
 	/*
-	 * Update the PortB IRQs - A10 has 4, S10 has 2, Index accordingly
+	 * Arria10 lists four interrupts (PortA SBE/DBE, PortB SBE/DBE),
+	 * Stratix10 lists two (PortA, PortB).
 	 */
-
-	/* Using compatibles to determine the IRQ Index */
-	if (is_s10)
-		altdev->sb_irq = irq_of_parse_and_map(np, 1);
-	else
-		altdev->sb_irq = irq_of_parse_and_map(np, 2);
+	altdev->sb_irq = irq_of_parse_and_map(np, is_s10 ? 1 : 2);
 
 	if (!altdev->sb_irq) {
 		edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB SBIRQ alloc\n");
 		rc = -ENODEV;
-		goto err_release_group_1;
+		goto err_release_group;
 	}
 	rc = devm_request_irq(device->edac->dev, altdev->sb_irq,
 			      prv->ecc_irq_handler, IRQF_TRIGGER_HIGH,
 			      ecc_name, altdev);
 	if (rc) {
 		edac_printk(KERN_ERR, EDAC_DEVICE, "PortB SBERR IRQ error\n");
-		goto err_release_group_1;
+		goto err_release_group;
 	}
 
 	if (is_s10) {
@@ -1561,21 +1549,21 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
 		if (rc) {
 			edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB DBIRQ alloc\n");
-			goto err_release_group_1;
+			goto err_release_group;
 		}
 	} else {
 		altdev->db_irq = irq_of_parse_and_map(np, 3);
 		if (!altdev->db_irq) {
 			edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB DBIRQ alloc\n");
 			rc = -ENODEV;
-			goto err_release_group_1;
+			goto err_release_group;
 		}
 		rc = devm_request_irq(device->edac->dev, altdev->db_irq,
 				      prv->ecc_irq_handler, IRQF_TRIGGER_HIGH,
 				      ecc_name, altdev);
 		if (rc) {
 			edac_printk(KERN_ERR, EDAC_DEVICE, "PortB DBERR IRQ error\n");
-			goto err_release_group_1;
+			goto err_release_group;
 		}
 	}
 
@@ -1584,9 +1572,8 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		edac_printk(KERN_ERR, EDAC_DEVICE,
 			    "edac_device_add_device portB failed\n");
 		rc = -ENOMEM;
-		goto err_release_group_1;
+		goto err_release_group;
 	}
-	of_node_put(np);
 
 	altr_create_edacdev_dbgfs(dci, prv);
 
@@ -1596,15 +1583,15 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 
 	return 0;
 
-err_release_group_1:
+err_release_group:
 	/*
 	 * Release the devres group first so the managed IRQs are
 	 * unregistered before dci (which contains the IRQ handler's
 	 * data via dci->pvt_info) is freed, avoiding a use-after-free.
 	 */
 	devres_release_group(device->edac->dev, altr_portb_setup);
+err_free_dci:
 	edac_device_free_ctl_info(dci);
-	of_node_put(np);
 	edac_printk(KERN_ERR, EDAC_DEVICE,
 		    "%s:Error setting up EDAC device: %d\n", ecc_name, rc);
 	return rc;
@@ -1632,7 +1619,7 @@ static int socfpga_init_sdmmc_ecc(struct altr_edac_device_dev *device)
 		goto exit;
 
 	/* Setup portB */
-	rc = altr_portb_setup(device);
+	rc = altr_portb_setup(device, child);
 
 exit:
 	of_node_put(child);

base-commit: 1b6cc87452e90e32789bffcb6c163dfdeb03e8e4
-- 
2.54.0 (Apple Git-157)

