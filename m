Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190989;
	b=jguMay8wp4tyHEM2b7LE4M/ecnKTLZhTuZdyrokA9CBsY75EtLy5CE2duYgee0xrJBg1
	 5v+MiRbIdB5B/CbUIcrKiGjG7RVzuZn+B4hvg8RHWOihCixRZCw6Hm/lGyxTKQ6XjQ/d+
	 yge94S8JkSf0jmUXF41Dz32xBvbpYF9tFvaLwImnI83XiYp6HZKMA95bKAimhZj5d9JCl
	 1I0yOT9ymKfuJVRJZO/nHUbcf5afKTRy7c3csqD7KzW6H9TClPj5AsPNR2KuuY6MHcoUN
	 n1ZB4J+SxMz4koJk7rZbGeOTIGE1H8WBKVf6UaYYNVegmH7Sp2hqatw0ma7ehQ8d7zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190989;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=UfAmdFQtmuj0cRwGbRjy5nd/7JNt1+hpkxagFS8GV9E=;
	b=XhmydH0Dngo2Sik5/Z1myr9AZ91xhTjw5mSDepVgFK2ha+tU2MLq7tlsW1jh2HL+9pxd
	 FmpCbC4Te6PI4V9mg0EvK6DUwKI80Khs2pKjLSv7/BUTQZJlVE3Mg56xirAnUEVb3QDkP
	 i68+8BBVkN5qJ6VBP7IqGEEIfkmv4/8LajVKZyrsfRU8Ol6JdwI18aPmBXDjcCbx+iYe9
	 JdNaNcWmuFAn40lryg9MWYKuijmp4rN3FzW5SeZQqP6x8EGy5xCck2TyLj1qQC9FFF2GL
	 IuAXgyebomT5OY06ZTvNXssLQRGnDcsZ7eGJc7plKJV3ajTJWOJRLDd4JC8jI+0zbig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qxgzL0o1;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4FF606A33D
	for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 16:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4FF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qxgzL0o1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8324AC6221F;
	Fri, 20 Nov 2026 16:09:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BED06601B9;
	Fri, 20 Nov 2026 16:09:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBE5011BC0422;
	Fri, 20 Nov 2026 17:09:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795190981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UfAmdFQtmuj0cRwGbRjy5nd/7JNt1+hpkxagFS8GV9E=;
	b=qxgzL0o1a7xhdoigypocZ0ZjjsSqtGUnYMcU7hKKjTfS9KSA4uas2w01d+lQ08xk+ecTin
	z25vUe5BNjzPtK+V4+NtGfqHJPOQsG1xD3oHaJtqB8cUof7l9iFszTlzkEoBm2C+EUQwut
	n+VFoOh0nQU337ELoojWCJYomlTU6upzHRu4zGZJOcDj5EUFZ0lKP9uHyZicj9y1HfMCTE
	T1v7CtrKE/BNmE/0r1x1NqDy7I9LvF59VhxXk3SbOhC4sdIMVJ/9ByXCQrCM6rHyao+Ruq
	F7oy6xd9gUeC1rb9fGSzfosvmTXqiXbEY68yJm2CKfAHsnho/IaPN6cEEYG2CQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 20 Nov 2026 17:08:35 +0100
Subject: [PATCH v9 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-paul-v7-3-rc1-edac-v9-2-470f2e6928cd@bootlin.com>
References: <20261120-paul-v7-3-rc1-edac-v9-0-470f2e6928cd@bootlin.com>
In-Reply-To: <20261120-paul-v7-3-rc1-edac-v9-0-470f2e6928cd@bootlin.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795190968; l=13416;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=qxZpCeYX51R2BbLw+HcsQao1RuXTMHGO3uYjgl3HEMA=;
 b=UiEYPpVk3dsbEooQ0nr04LYptp4D0uVcs4WHA37bpu9BtV++4bKNeyi/JiV3fsLYZ8vLkN/Of
 bzjpxu86Ip2D+7u9hyg21qGTgm5bltPd23XklMwvor2jxf0rQeuFcQX
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
The memory controller supports ECC, software scrubbing, and SECDED.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 MAINTAINERS                 |   1 +
 drivers/edac/Kconfig        |  10 ++
 drivers/edac/Makefile       |   1 +
 drivers/edac/cadence_edac.c | 388 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 400 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5070e3e02bf2..1e8fe131b601 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6003,6 +6003,7 @@ M:	Paul Louvel <paul.louvel@bootlin.com>
 L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
+F:	drivers/edac/cadence_edac.c
 
 CADENCE MIPI-CSI2 BRIDGES
 M:	Maxime Ripard <mripard@kernel.org>
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 63f263c4263d..84a3c2ce6fe2 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -515,6 +515,16 @@ config EDAC_QCOM
 	  For debugging issues having to do with stability and overall system
 	  health, you should probably say 'Y' here.
 
+config EDAC_CADENCE
+	tristate "Cadence EDAC Controller"
+	depends on HAS_IOMEM && OF
+	depends on ARCH_RZN1 || COMPILE_TEST
+	help
+	  Support for error detection and correction on RZN1x SoCs. ECC must be
+	  configured by the bootloader.
+	  The controller supports single bit error correction, double bit error
+	  detection.
+
 config EDAC_ASPEED
 	tristate "Aspeed AST BMC SoC"
 	depends on ARCH_ASPEED
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 4020ea60738a..f8f02fb442e1 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -94,3 +94,4 @@ obj-$(CONFIG_EDAC_LOONGSON)		+= loongson_edac.o
 obj-$(CONFIG_EDAC_VERSALNET)		+= versalnet_edac.o
 obj-$(CONFIG_EDAC_CORTEX_A72)		+= a72_edac.o
 obj-$(CONFIG_EDAC_DUMMY)		+= dummy_edac.o
+obj-$(CONFIG_EDAC_CADENCE)		+= cadence_edac.o
diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
new file mode 100644
index 000000000000..306d5422768c
--- /dev/null
+++ b/drivers/edac/cadence_edac.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2015 Renesas Electronics Europe Ltd.
+ * Copyright 2026 Bootlin
+ *
+ * Based on highbank EDAC driver:
+ *
+ * Copyright 2011-2012 Calxeda, Inc.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/edac.h>
+#include <linux/interrupt.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+
+#include "edac_mc.h"
+#include "edac_module.h"
+
+#define DRV_NAME				"cadence_edac"
+
+#define REG_BYTE_SZ				4
+#define DDR_CTL(n)				((n) * REG_BYTE_SZ)
+
+#define CDNS_DDR_STAT				DDR_CTL(0)
+#define CDNS_DDR_STAT_DRAM_CLASS		GENMASK_U32(11, 8)
+#define CDNS_DDR_STAT_DRAM_DDR2			BIT(2)
+#define CDNS_DDR_STAT_GET_DRAM_CLASS(reg)	FIELD_GET(CDNS_DDR_STAT_DRAM_CLASS, reg)
+
+#define CDNS_ECC_STAT				DDR_CTL(36)
+#define CDNS_ECC_STAT_ENABLED			BIT(16)
+#define CDNS_ECC_STAT_IS_ENABLED(reg)		FIELD_GET(CDNS_ECC_STAT_ENABLED, reg)
+#define CDNS_ECC_STAT_FWC			BIT(24)
+
+#define CDNS_ECC_XOR				DDR_CTL(37)
+#define CDNS_ECC_XOR_CHECK_BITS			GENMASK_U32(13, 0)
+
+#define CDNS_BUS_CTRL				DDR_CTL(54)
+#define CDNS_BUS_CTRL_REDUC			BIT(1)
+
+/* DDR Controller Error Registers */
+
+#define CDNS_ECC_U_ERR_ADDR			DDR_CTL(38)
+#define CDNS_ECC_U_ERR_STAT			DDR_CTL(39)
+
+#define CDNS_ECC_C_ERR_ADDR			DDR_CTL(41)
+#define CDNS_ECC_C_ERR_STAT			DDR_CTL(42)
+
+#define CDNS_ECC_ERR_STAT_GET_SYNDROME(reg)	FIELD_GET(GENMASK(6, 0), reg)
+
+#define CDNS_PORT_CMD_ERR_ADDR			DDR_CTL(61)
+#define CDNS_PORT_CMD_ERR_TYPE			DDR_CTL(62)
+#define CDNS_PORT_CMD_ERR_TYPE_GET(reg)		FIELD_GET(GENMASK_U32(10, 8), reg)
+
+/* DDR Controller Interrupt Registers */
+
+#define CDNS_ECC_INT_STAT			DDR_CTL(56)
+#define CDNS_ECC_INT_STAT_CE			BIT(3)
+#define CDNS_ECC_INT_STAT_MULTIPLE_CE		BIT(4)
+#define CDNS_ECC_INT_STAT_UE			BIT(5)
+#define CDNS_ECC_INT_STAT_MULTIPLE_UE		BIT(6)
+#define CDNS_ECC_INT_EDAC			(CDNS_ECC_INT_STAT_CE | \
+						 CDNS_ECC_INT_STAT_MULTIPLE_CE | \
+						 CDNS_ECC_INT_STAT_UE | \
+						 CDNS_ECC_INT_STAT_MULTIPLE_UE)
+
+#define CDNS_ECC_INT_ACK			DDR_CTL(57)
+#define CDNS_ECC_INT_ACK_MASK			GENMASK_U32(21, 0)
+
+#define CDNS_ECC_INT_CTRL			DDR_CTL(58)
+#define CDNS_ECC_INT_CTRL_MASK			GENMASK_U32(21, 0)
+#define CDNS_ECC_INT_CTRL_MASK_ALL		BIT(22)
+#define CDNS_ECC_INT_CTRL_UNMASK(i)		((~(i)) & CDNS_ECC_INT_CTRL_MASK)
+
+struct mc_priv {
+	int irq;
+	void __iomem *io_base;
+	struct dentry *debugfs;
+	unsigned long pfn_base;
+	bool ecc_enabled;
+	spinlock_t lock;
+	u16 xor_check_bits;
+};
+
+static irqreturn_t cdns_mc_err_handler(int irq, void *dev_id)
+{
+	struct mem_ctl_info *mci = dev_id;
+	struct mc_priv *priv = mci->pvt_info;
+	u32 status, err_addr, syndrome, reg;
+
+	status = readl(priv->io_base + CDNS_ECC_INT_STAT);
+	if (!status)
+		return IRQ_NONE;
+
+	/*
+	 * Hardware is not exposing how many CE / UE occurred since last ACK in
+	 * case of multiple errors. Always set the error count to 1.
+	 */
+
+	if (status & (CDNS_ECC_INT_STAT_UE | CDNS_ECC_INT_STAT_MULTIPLE_UE)) {
+		reg = readl(priv->io_base + CDNS_ECC_U_ERR_STAT);
+		syndrome = CDNS_ECC_ERR_STAT_GET_SYNDROME(reg);
+
+		err_addr = readl(priv->io_base + CDNS_ECC_U_ERR_ADDR);
+
+		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1,
+				     priv->pfn_base + PFN_DOWN(err_addr), err_addr & ~PAGE_MASK,
+				     syndrome, 0, 0, -1, mci->ctl_name, "");
+	}
+
+	if (status & (CDNS_ECC_INT_STAT_CE | CDNS_ECC_INT_STAT_MULTIPLE_CE)) {
+		reg = readl(priv->io_base + CDNS_ECC_C_ERR_STAT);
+		syndrome = CDNS_ECC_ERR_STAT_GET_SYNDROME(reg);
+
+		err_addr = readl(priv->io_base + CDNS_ECC_C_ERR_ADDR);
+
+		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, 1,
+				     priv->pfn_base + PFN_DOWN(err_addr), err_addr & ~PAGE_MASK,
+				     syndrome, 0, 0, -1, mci->ctl_name, "");
+	}
+
+	writel(status & CDNS_ECC_INT_ACK_MASK, priv->io_base + CDNS_ECC_INT_ACK);
+
+	return IRQ_HANDLED;
+}
+
+#ifdef CONFIG_EDAC_DEBUG
+
+static void cdns_rmw(struct mc_priv *priv, u32 reg, u32 mask, u32 val)
+{
+	u32 regval;
+
+	regval = readl(priv->io_base + reg);
+	regval &= ~mask;
+	regval |= (val << __bf_shf(mask)) & mask;
+	writel(regval, priv->io_base + reg);
+}
+
+static ssize_t cdns_force_ecc_error(struct file *file, const char __user *data, size_t count,
+				    loff_t *ppos)
+{
+	struct device *dev = file->private_data;
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct mc_priv *priv = mci->pvt_info;
+
+	spin_lock(&priv->lock);
+
+	cdns_rmw(priv, CDNS_ECC_XOR, CDNS_ECC_XOR_CHECK_BITS, priv->xor_check_bits);
+	cdns_rmw(priv, CDNS_ECC_STAT, CDNS_ECC_STAT_FWC, 1);
+
+	spin_unlock(&priv->lock);
+
+	return count;
+}
+
+static const struct file_operations cdns_ecc_error_fops = {
+	.open = simple_open,
+	.write = cdns_force_ecc_error,
+	.llseek = generic_file_llseek,
+};
+
+static void cdns_setup_debugfs(struct mem_ctl_info *mci)
+{
+	struct mc_priv *priv = mci->pvt_info;
+
+	if (!priv->ecc_enabled)
+		return;
+
+	priv->debugfs = edac_debugfs_create_dir(DRV_NAME);
+	if (!priv->debugfs) {
+		dev_dbg(mci->pdev, "failed to create debugfs dir\n");
+		return;
+	}
+
+	edac_debugfs_create_x16("bits", 0644, priv->debugfs, &priv->xor_check_bits);
+	edac_debugfs_create_file("inject", 0200, priv->debugfs, &mci->dev, &cdns_ecc_error_fops);
+}
+
+static void cdns_remove_debugfs(struct mem_ctl_info *mci)
+{
+	struct mc_priv *priv = mci->pvt_info;
+
+	if (!priv->ecc_enabled)
+		return;
+
+	edac_debugfs_remove_recursive(priv->debugfs);
+}
+
+#else
+
+static void cdns_setup_debugfs(struct mem_ctl_info *mci) {}
+
+static void cdns_remove_debugfs(struct mem_ctl_info *mci) {}
+
+#endif
+
+static int cdns_setup_irq(struct platform_device *pdev, struct mem_ctl_info *mci)
+{
+	struct mc_priv *priv = mci->pvt_info;
+	int ret;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return dev_err_probe(&pdev->dev, priv->irq, "unable to get irq\n");
+
+	ret = devm_request_irq(&pdev->dev, priv->irq, cdns_mc_err_handler, 0, dev_name(&pdev->dev),
+			       mci);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "unable to request irq %d\n", priv->irq);
+
+	return 0;
+}
+
+static int cdns_setup_mc(struct platform_device *pdev, void __iomem *io_base)
+{
+	struct edac_mc_layer layers[2];
+	struct mem_ctl_info *mci;
+	resource_size_t mem_sz;
+	struct dimm_info *dimm;
+	struct device_node *np;
+	struct mc_priv *priv;
+	struct resource res;
+	int ret;
+	u32 reg;
+
+	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
+	layers[0].size = 1;
+	layers[0].is_virt_csrow = true;
+	layers[1].type = EDAC_MC_LAYER_CHANNEL;
+	layers[1].size = 1;
+	layers[1].is_virt_csrow = false;
+
+	np = of_find_node_by_name(NULL, "memory");
+	if (!np)
+		return dev_err_probe(&pdev->dev, -ENODEV, "unable to find memory node\n");
+
+	ret = of_address_to_resource(np, 0, &res);
+
+	of_node_put(np);
+
+	if (ret)
+		return ret;
+
+	mem_sz = resource_size(&res);
+
+	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
+	if (!mci)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "unable to allocate edac mc\n");
+
+	mci->pdev = &pdev->dev;
+	priv = mci->pvt_info;
+
+	priv->io_base = io_base;
+	spin_lock_init(&priv->lock);
+	priv->xor_check_bits = 0;
+	priv->pfn_base = PFN_DOWN(res.start);
+	platform_set_drvdata(pdev, mci);
+
+	reg = readl(priv->io_base + CDNS_ECC_STAT);
+	priv->ecc_enabled = CDNS_ECC_STAT_IS_ENABLED(reg);
+
+	mci->edac_cap = priv->ecc_enabled ? EDAC_FLAG_SECDED : EDAC_FLAG_NONE;
+	mci->mtype_cap = MEM_FLAG_DDR2 | MEM_FLAG_DDR3;
+	mci->edac_ctl_cap = EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
+	mci->mod_name = pdev->dev.driver->name;
+	mci->ctl_name = "cdns-ddr-ctrl";
+	mci->dev_name = dev_name(&pdev->dev);
+	mci->scrub_mode = SCRUB_SW_SRC;
+
+	dimm = *mci->dimms;
+	dimm->nr_pages = PFN_UP(mem_sz);
+	dimm->grain = 4;
+	dimm->edac_mode = priv->ecc_enabled ? EDAC_SECDED : EDAC_NONE;
+
+	/* Check if half datapath feature of the controller is active. */
+	reg = readl(priv->io_base + CDNS_BUS_CTRL);
+	if (reg & CDNS_BUS_CTRL_REDUC)
+		dimm->dtype = DEV_X8;
+	else
+		dimm->dtype = DEV_X16;
+
+	strscpy(dimm->label, "Channel#0_DIMM#0", sizeof(dimm->label));
+
+	reg = readl(priv->io_base + CDNS_DDR_STAT);
+	if (CDNS_DDR_STAT_GET_DRAM_CLASS(reg) == CDNS_DDR_STAT_DRAM_DDR2)
+		dimm->mtype = MEM_DDR2;
+	else
+		dimm->mtype = MEM_DDR3;
+
+	ret = edac_mc_add_mc(mci);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "failed to add mc\n");
+		goto free_edac_mc;
+	}
+
+	ret = cdns_setup_irq(pdev, mci);
+	if (ret)
+		goto del_edac_mc;
+
+	cdns_setup_debugfs(mci);
+
+	edac_mc_chipset_printk(mci, KERN_DEBUG, DRV_NAME, "ECC %s\n",
+			       (!priv->ecc_enabled) ? "disabled" : "enabled");
+
+	return 0;
+
+del_edac_mc:
+	edac_mc_del_mc(&pdev->dev);
+free_edac_mc:
+	edac_mc_free(mci);
+	return ret;
+}
+
+static int cdns_mc_probe(struct platform_device *pdev)
+{
+	void __iomem *io_base;
+	struct clk *clk;
+	int ret;
+
+	io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(io_base), "unable to map regs\n");
+
+	clk = devm_clk_get_enabled(&pdev->dev, "ddrc");
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "unable to get ddrc\n");
+
+	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "unable to get pclk\n");
+
+	writel(CDNS_ECC_INT_CTRL_MASK_ALL, io_base + CDNS_ECC_INT_CTRL);
+
+	ret = cdns_setup_mc(pdev, io_base);
+	if (ret)
+		return ret;
+
+	writel(CDNS_ECC_INT_CTRL_UNMASK(CDNS_ECC_INT_EDAC),
+	       io_base + CDNS_ECC_INT_CTRL);
+
+	return 0;
+}
+
+static void cdns_mc_remove(struct platform_device *pdev)
+{
+	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
+	struct mc_priv *priv = mci->pvt_info;
+
+	writel(CDNS_ECC_INT_CTRL_MASK_ALL, priv->io_base + CDNS_ECC_INT_CTRL);
+
+	/* Wait for any pending interrupt before releasing resources. */
+	devm_free_irq(&pdev->dev, priv->irq, mci);
+
+	cdns_remove_debugfs(mci);
+
+	edac_mc_del_mc(&pdev->dev);
+	edac_mc_free(mci);
+}
+
+static const struct of_device_id cdns_ddr_ctrl_of_match[] = {
+	{ .compatible = "cdns,ddr-edac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cdns_ddr_ctrl_of_match);
+
+static struct platform_driver cdns_mc_edac_driver = {
+	.probe = cdns_mc_probe,
+	.remove = cdns_mc_remove,
+	.driver = {
+		.name = DRV_NAME,
+		.of_match_table = cdns_ddr_ctrl_of_match,
+	},
+};
+
+module_platform_driver(cdns_mc_edac_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Renesas Electronics Europe Ltd.");
+MODULE_AUTHOR("Paul Louvel <paul.louvel@bootlin.com>");
+MODULE_DESCRIPTION("EDAC driver for Cadence DDR controller");

-- 
2.56.1

