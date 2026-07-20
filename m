Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA613B95EC;
	Mon, 20 Jul 2026 20:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578483; cv=none; b=D5DzKNmK7AQgYuw4zpeOfUa5tTbEI9Aqb31bUnFp3/pvJsHPQWSUpGM1QjQAPpzk6LO6fyDuuZkIsNq4+w+Fh4XS4XNZsa86i5WWLF/R2ib5SJsZ46QqgZB2/QZyCPjxkvEDfPEabryoKtCloWHTC8RtjQW4bcJXey2FSDOIDmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578483; c=relaxed/simple;
	bh=L8iG6rbZSCPRio7i7fsNWkL+mnKxgDZdAddcNP5EZtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hn7Iqyoyu3tjybaFJH/Pz6YorUVBiYL8/qkz+iRc9VxIW9Gf8zLutbmS14WLodV58rV6zpF+snVCArtNH3tN9Ga9GjQFf/mBkmCVn/1r6t+rwIQV+63FTRtza7n7WMBM6NJoOPFgwatq6Cm/3jYQKNI8eeS73QxJiIBlObhwHKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqcZGS22; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqcZGS22"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5851F00A3D;
	Mon, 20 Jul 2026 20:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784578478;
	bh=k35bPK55M0YqpELHeycgJ3HxdnqxajKxw9PK0VKv+4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NqcZGS228TjNwbNHEi+WpnU+6Kz04beiK/GNQFz0Li1fLuXCXrEJ7cqqflAE2FHDR
	 /Y/d1+N5MFnu3ZlhAVJpcwtgQelisxTuPi9VoBZomwSGLERUytNcAwPB3gX2cINVjJ
	 BnnE3yUz6XPyt6LLHyMuW4oAzbnvzr3E8AlT6LQW5gFNmHedmKZ2TT7vQaxkOugFW9
	 Y7JM58tSjv/5J0wF23bZn2LAmYwV87aWSaZnXvfmy4fE6nucz2BzOW090XrFtwYGbn
	 7WbbzzBJMP/Ca+nkCqHrnUTQQsf+aX/vRBBtpF3deXdGupqp/+o7tze1KBq2uhdHxF
	 mI3mDsqOXHARQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] EDAC/altera: use flag to differentiate 64-bit platforms
Date: Mon, 20 Jul 2026 15:14:23 -0500
Message-ID: <20260720201425.1538771-3-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20260720201425.1538771-1-dinguyen@kernel.org>
References: <20260720201425.1538771-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit (d4486fc3098e "EDAC/altera: Use ECC manager compatible to select
A10/S10 IRQ layout"), it added a way to only differentiate Stratix10 from a
32-bit platform. In preparation to add support for Agilex5, it needs a way to
make a further differentiation.

Make use of the driver match data to hold a flag for different platforms,
specifically Stratix10 and Agilex5.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/edac/altera_edac.c | 17 +++++++++--------
 drivers/edac/altera_edac.h |  5 ++++-
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 777ba6efcc542..8a5b08e0d0583 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1507,7 +1507,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	int edac_idx, rc;
 	struct device_node *np;
 	const struct edac_device_prv_data *prv = &a10_sdmmceccb_data;
-	bool is_s10 = device->edac->is_s10;
+	unsigned long flag = {unsigned long)device->edac->flag;
 
 	rc = altr_check_ecc_deps(device);
 	if (rc)
@@ -1555,7 +1555,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	 */
 
 	/* Using compatibles to determine the IRQ Index */
-	if (is_s10)
+	if (flag == SOCFPGA_S10)
 		altdev->sb_irq = irq_of_parse_and_map(np, 1);
 	else
 		altdev->sb_irq = irq_of_parse_and_map(np, 2);
@@ -1573,7 +1573,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		goto err_release_group_1;
 	}
 
-	if (is_s10) {
+	if (flag == SOCFPGA_S10) {
 		/* Use IRQ to determine SError origin instead of assigning IRQ */
 		rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
 		if (rc) {
@@ -1979,7 +1979,7 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
 		goto err_release_group1;
 	}
 
-	if (edac->is_s10) {
+	if (edac->flag == SOCFPGA_S10) {
 		/* Use IRQ to determine SError origin instead of assigning IRQ */
 		rc = of_property_read_u32_index(np, "interrupts", 0, &altdev->db_irq);
 		if (rc) {
@@ -2125,7 +2125,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, edac);
 	INIT_LIST_HEAD(&edac->a10_ecc_devices);
 
-	edac->is_s10 = !!device_get_match_data(&pdev->dev);
+	edac->flag = (unsigned long)device_get_match_data(&pdev->dev);
 
 	edac->ecc_mgr_map =
 		altr_sysmgr_regmap_lookup_by_phandle(pdev->dev.of_node,
@@ -2158,8 +2158,8 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 	irq_set_chained_handler_and_data(edac->sb_irq,
 					 altr_edac_a10_irq_handler,
 					 edac);
-	if (edac->is_s10)
-	{
+
+	if (edac->flag == SOCFPGA_S10) {
 		int dberror, err_addr;
 
 		edac->panic_notifier.notifier_call = s10_edac_dberr_handler;
@@ -2210,7 +2210,8 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 
 static const struct of_device_id altr_edac_a10_of_match[] = {
 	{ .compatible = "altr,socfpga-a10-ecc-manager" },
-	{ .compatible = "altr,socfpga-s10-ecc-manager", .data = (void *)1 },
+	{ .compatible = "altr,socfpga-s10-ecc-manager",
+	  .data = (void *)SOCFPGA_S10 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, altr_edac_a10_of_match);
diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 9387056fd65e3..74ab7bfc3e748 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -351,6 +351,9 @@ struct altr_sdram_mc_data {
 #define ECC_READ_EOVR                     0x2
 #define ECC_READ_EDOVR                    0x3
 
+#define SOCFPGA_S10                       0x1
+#define SOCFPGA_AGILEX5                   0x2
+
 struct altr_edac_device_dev;
 
 struct edac_device_prv_data {
@@ -394,7 +397,7 @@ struct altr_arria10_edac {
 	struct irq_chip		irq_chip;
 	struct list_head	a10_ecc_devices;
 	struct notifier_block	panic_notifier;
-	bool is_s10;
+	unsigned long		flag;
 };
 
 #endif	/* #ifndef _ALTERA_EDAC_H */
-- 
2.42.0.411.g813d9a9188

