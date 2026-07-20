Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D7E3B95F9;
	Mon, 20 Jul 2026 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578486; cv=none; b=s73i0aACpxQEiSyviHBslY6c47CEP+8wJ3RzY6NBuRRBqlseAIbE2VaPRYqVKHPnYhIZUN7Gb52T0GhDiRpV7NXOBK+dHFAp86GcnF8Gfn8c310fw2/LU9QJ1nNzC7bzxMpRqVm0OPgJKHN/zfz5XI9It8L1qpZ5Lyn6xeQBNmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578486; c=relaxed/simple;
	bh=icODztdovmLFBa/t0SKuz9MvggB1lfQk7cBj97Wthts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFBKbwUYYl9KAxqIVX0ovYFHx/CIJJi/sf7ra0hlldoxIbCnRCT/kufq/KP/h95O81Jd9hVwm1rtnN5U7H9M09PamBMUDi08EI2b6gW9dnbG03F7ybr4GOhr4SQcbhngvAeKwIbcFXOOpRCfs+xbFxmB8gVsjhUE5+xJ/OtwgtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/1DHAya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/1DHAya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1DE1F000E9;
	Mon, 20 Jul 2026 20:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784578479;
	bh=KBwZxoJtoFvsvhG5z379ZVkA7GMClyopvNaP8IXvXnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E/1DHAyaq2xtARE4yGqiA1KWFLvpKwh/TE6XcE85TuviFEo+MRYg39DjFHaAwYohl
	 sl9g8H3wJo5dQVfIjvgFlfd7DmvYEg6DuyvmoGeGYqQzmU5vgyYrBDQO154wCFJymj
	 jF4srqudo/k46ShavFlUtJ656LFsvxicVgo2HndmjnZXjn33XqVtLxk4VyQm+P9hL9
	 KQ/VsDoneoP0HTJCrEXfdXBaBVSegZs655vgBh1hO39HA3l5uTdsDGTCaJed+woU8g
	 fGtu7m3rzgWvQwMwXzudZggqylEDuIoQdTvTM0uNFTdX69zJAcaUviyHKhFAy2kW8Z
	 naFWrbqBXyeGQ==
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
Subject: [PATCH 3/4] EDAC/altera: Add support for Agilex5 ECC manager
Date: Mon, 20 Jul 2026 15:14:24 -0500
Message-ID: <20260720201425.1538771-4-dinguyen@kernel.org>
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

Add a new compatible "altr,socfpga-agilex5-ecc-manager" to the Arria10
EDAC manager driver. Unlike Stratix10/Agilex7, the Agilex5 ECC manager
exposes up to 7 named interrupts on its DT node:

  global_sbe    - aggregate single-bit error (chained, drives IRQ domain)
  global_dbe    - aggregate double-bit error (chained; DBE is no longer
                  delivered exclusively through Asynchronous SError)
  io96b0        - IO96B0 DRAM controller ECC
  io96b1        - IO96B1 DRAM controller ECC
  sdm_qspi_sbe  - SDM QSPI single-bit error
  sdm_qspi_dbe  - SDM QSPI double-bit error
  sdm_seu       - SDM single-event-upset

On Agilex5, retrieve all seven interrupts by name via
platform_get_irq_byname_optional() and stash them in a new
agilex5_irqs[] array on struct altr_arria10_edac so subsequent
peripheral support (IO96B, SDM QSPI, CRAM SEU) can consume them without
re-parsing the DT. Only global_sbe is mandatory; the rest are optional.

global_sbe is wired up as the chained SBE handler (replacing the legacy
index-0 lookup). When present, global_dbe is hooked into the same
altr_edac_a10_irq_handler() so that the existing sb_irq/db_irq demux
routes DBE events through the manager's IRQ domain. The SError-based
panic notifier path is preserved as a fall-back.

Legacy A10/S10 probe paths are unchanged.

Assisted-by: Cursor:claude-sonnet-4.7
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/edac/altera_edac.c | 85 ++++++++++++++++++++++++++++++++++++--
 drivers/edac/altera_edac.h | 29 +++++++++++++
 2 files changed, 110 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 8a5b08e0d0583..44da63ef5d71e 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1507,7 +1507,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	int edac_idx, rc;
 	struct device_node *np;
 	const struct edac_device_prv_data *prv = &a10_sdmmceccb_data;
-	unsigned long flag = {unsigned long)device->edac->flag;
+	unsigned long flag = (unsigned long)device->edac->flag;
 
 	rc = altr_check_ecc_deps(device);
 	if (rc)
@@ -2111,11 +2111,63 @@ static int s10_edac_dberr_handler(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+/*
+ * Ordered table of named interrupts published by an
+ * "altr,socfpga-agilex5-ecc-manager" device tree node. Indices match
+ * enum altr_agilex5_irq_idx. Only "global_sbe" is mandatory; the rest are
+ * optional so platforms can omit interrupts for unused subsystems.
+ */
+static const char * const altr_agilex5_irq_names[ALTR_AGILEX5_NUM_IRQS] = {
+	[ALTR_AGILEX5_IRQ_GLOBAL_SBE]   = "global_sbe",
+	[ALTR_AGILEX5_IRQ_GLOBAL_DBE]   = "global_dbe",
+	[ALTR_AGILEX5_IRQ_IO96B0]       = "io96b0",
+	[ALTR_AGILEX5_IRQ_IO96B1]       = "io96b1",
+	[ALTR_AGILEX5_IRQ_SDM_QSPI_SBE] = "sdm_qspi_sbe",
+	[ALTR_AGILEX5_IRQ_SDM_QSPI_DBE] = "sdm_qspi_dbe",
+	[ALTR_AGILEX5_IRQ_SDM_SEU]      = "sdm_seu",
+};
+
+/*
+ * Populate edac->agilex5_irqs[] from the named interrupts on the manager
+ * platform device. Missing optional interrupts are stored as a negative
+ * errno (-ENXIO) so that subsequent feature code can probe whether the
+ * resource exists. global_sbe is required because it drives the manager's
+ * IRQ domain dispatch path.
+ *
+ * platform_get_irq_byname_optional() can return -EPROBE_DEFER when the
+ * parent irqchip (e.g. the GIC) is not yet probed. Propagate that error
+ * up so the kernel re-tries the probe later instead of permanently
+ * disabling the named interrupt.
+ */
+static int altr_agilex5_get_named_irqs(struct platform_device *pdev,
+				       struct altr_arria10_edac *edac)
+{
+	int i, irq;
+
+	for (i = 0; i < ALTR_AGILEX5_NUM_IRQS; i++) {
+		irq = platform_get_irq_byname_optional(pdev,
+						       altr_agilex5_irq_names[i]);
+		if (irq == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		edac->agilex5_irqs[i] = irq > 0 ? irq : -ENXIO;
+	}
+
+	if (edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_SBE] < 0) {
+		dev_err(&pdev->dev,
+			"Agilex5 ECC manager missing required 'global_sbe' interrupt\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 /****************** Arria 10 EDAC Probe Function *********************/
 static int altr_edac_a10_probe(struct platform_device *pdev)
 {
 	struct altr_arria10_edac *edac;
 	struct device_node *child;
+	int rc;
 
 	edac = devm_kzalloc(&pdev->dev, sizeof(*edac), GFP_KERNEL);
 	if (!edac)
@@ -2151,14 +2203,31 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	edac->sb_irq = platform_get_irq(pdev, 0);
-	if (edac->sb_irq < 0)
-		return edac->sb_irq;
+	if (edac->flag == SOCFPGA_AGILEX5) {
+		rc = altr_agilex5_get_named_irqs(pdev, edac);
+		if (rc)
+			return rc;
+
+		edac->sb_irq = edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_SBE];
+	} else {
+		edac->sb_irq = platform_get_irq(pdev, 0);
+		if (edac->sb_irq < 0)
+			return edac->sb_irq;
+	}
 
 	irq_set_chained_handler_and_data(edac->sb_irq,
 					 altr_edac_a10_irq_handler,
 					 edac);
 
+	/*
+	 * Unlike Stratix10/Agilex7 (which deliver uncorrectable errors as
+	 * Asynchronous SError), Agilex5 routes the global double-bit error
+	 * through a dedicated SPI ("global_dbe"). Hook it into the same
+	 * chained handler so the existing sb_irq/db_irq demux in
+	 * altr_edac_a10_irq_handler() routes DBE events through the manager's
+	 * IRQ domain. The panic notifier below is still registered as a
+	 * fall-back for any DBEs that escape to SError.
+	 */
 	if (edac->flag == SOCFPGA_S10) {
 		int dberror, err_addr;
 
@@ -2181,6 +2250,12 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 			regmap_write(edac->ecc_mgr_map,
 				     S10_SYSMGR_UE_ADDR_OFST, 0);
 		}
+	} else if (edac->flag == SOCFPGA_AGILEX5 &&
+		   edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_DBE] >= 0) {
+		edac->db_irq = edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_DBE];
+		irq_set_chained_handler_and_data(edac->db_irq,
+						 altr_edac_a10_irq_handler,
+						 edac);
 	} else {
 		edac->db_irq = platform_get_irq(pdev, 1);
 		if (edac->db_irq < 0)
@@ -2212,6 +2287,8 @@ static const struct of_device_id altr_edac_a10_of_match[] = {
 	{ .compatible = "altr,socfpga-a10-ecc-manager" },
 	{ .compatible = "altr,socfpga-s10-ecc-manager",
 	  .data = (void *)SOCFPGA_S10 },
+	{ .compatible = "altr,socfpga-agilex5-ecc-manager",
+	  .data = (void *)SOCFPGA_AGILEX5 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, altr_edac_a10_of_match);
diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 74ab7bfc3e748..30e35da7eb6a1 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -326,6 +326,27 @@ struct altr_sdram_mc_data {
 #define S10_DDR0_IRQ_MASK                 BIT(16)
 #define S10_DBE_IRQ_MASK                  0x3FFFE
 
+/************* Agilex5 Defines **************/
+/*
+ * The Agilex5 ECC manager exposes up to 7 named interrupts on the manager
+ * node. global_sbe and global_dbe are aggregate single/double-bit error
+ * interrupts that fan-out through the manager's IRQ domain to the child
+ * peripheral ECCs. The remaining named interrupts are routed directly from
+ * dedicated controllers (IO96B memory controllers and Secure Device Manager)
+ * to the GIC.
+ */
+#define ALTR_AGILEX5_NUM_IRQS             7
+
+enum altr_agilex5_irq_idx {
+	ALTR_AGILEX5_IRQ_GLOBAL_SBE,
+	ALTR_AGILEX5_IRQ_GLOBAL_DBE,
+	ALTR_AGILEX5_IRQ_IO96B0,
+	ALTR_AGILEX5_IRQ_IO96B1,
+	ALTR_AGILEX5_IRQ_SDM_QSPI_SBE,
+	ALTR_AGILEX5_IRQ_SDM_QSPI_DBE,
+	ALTR_AGILEX5_IRQ_SDM_SEU,
+};
+
 /* Define ECC Block Offsets for peripherals */
 #define ECC_BLK_ADDRESS_OFST              0x40
 #define ECC_BLK_RDATA0_OFST               0x44
@@ -398,6 +419,14 @@ struct altr_arria10_edac {
 	struct list_head	a10_ecc_devices;
 	struct notifier_block	panic_notifier;
 	unsigned long		flag;
+
+	/*
+	 * Agilex5 ECC manager supports up to ALTR_AGILEX5_NUM_IRQS named
+	 * interrupts. Entries are indexed by enum altr_agilex5_irq_idx and
+	 * hold the Linux virtual IRQ number, or a negative errno when the
+	 * corresponding interrupt was not provided in the device tree.
+	 */
+	int			agilex5_irqs[ALTR_AGILEX5_NUM_IRQS];
 };
 
 #endif	/* #ifndef _ALTERA_EDAC_H */
-- 
2.42.0.411.g813d9a9188

