Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2FC3FC5D7;
	Thu, 21 May 2026 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367497; cv=none; b=bRju0vQQ4nQolyS/11SULdlPmLnxp4cKhXSZ4LTOHYrRbH5ogEjA0X2F6sodp7Ml+hqp+StpjyNpchYJLb13x/29IjPhgGu0DcBfIp73H7nrtrL5UgoF2Ag0dGtn6Vv1FKqG9JRCWyjZwt2qYaVH2Hzs5lvhjl4PGNAM/Ov6u0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367497; c=relaxed/simple;
	bh=vkpTdE49LW3ePrA6mNyoeYRGMf3DT/A0A8Svp1xxlVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGHnhCwuXopvRwDDoTWec/zzL+718ONQWajNcWq6WRKU7yfeoipwV0hX4tzlLcJVMSYN2pF6dX2RyDoz+Z3ej+S5mkZvW+BvhllJ3W6bgNNOQK4LFu1E3vTXqKtJSWvtb44Gink+72mFQJUcSBVx/zmAfTa3B9fW0mCZVKYvVpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MB/9nc3C; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MB/9nc3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779367490; x=1810903490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vkpTdE49LW3ePrA6mNyoeYRGMf3DT/A0A8Svp1xxlVA=;
  b=MB/9nc3C7/vHcnPUV8uESiaESuR7kIL59+brGTm49wTBywEs8XA+GuB1
   tYL8Unnk9K20cOZwG++hzAJWwz/UY7zfBRBnWbEVq1FPs97v1Ml8jo4nj
   5Kxjvfo/ltpgA/t/sXPvpGrCCPZkkOKVD3SZqHfVzlIaODed//7iDf4Jc
   fHJAUgsgK23y6uzuOY0vb/F7I4GYpXe394JSjOfZCY88YQVnnJPAHhKYZ
   BlElziiyMp80LQQjNHaU13SKsAXsnWEQW3LArxNg60MU4/32Jya1KBp87
   9E+OHBdz9xeCJ+zI5cbzPSwEfAQhoP9JIZTPVVMXSg1foAita552sjqhV
   Q==;
X-CSE-ConnectionGUID: hF49MM+SQMq2yM+C1rwOKA==
X-CSE-MsgGUID: jGauXXbHTvWQpD6iWjo+YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80265207"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80265207"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 05:44:49 -0700
X-CSE-ConnectionGUID: 421uKTlsSpacgZwzxqpNQA==
X-CSE-MsgGUID: bXnvk7OpSWGmgEpNQT+tbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="236265157"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 05:44:47 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Jie Wang <jie.wang@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] EDAC/igen6: Add Intel Nova Lake-H SoC support
Date: Thu, 21 May 2026 20:38:12 +0800
Message-ID: <20260521123812.3961038-3-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521123812.3961038-1-qiuxu.zhuo@intel.com>
References: <20260521123812.3961038-1-qiuxu.zhuo@intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nova Lake-H SoCs share similar memory controller registers and IBECC
(In-Band ECC) registers with Panther Lake-H SoCs but use a new memory
subsystem register for IBECC presence detection.

Add Nova Lake-H SoC compute die IDs and create a new configuration
structure for Nova Lake-H SoCs to enable EDAC support.

Tested-by: Jie Wang <jie.wang@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 46 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index a761d683eae3..9af15ac6ff84 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -151,6 +151,7 @@ static struct res_config {
 	/* MEMSS_PMA_CR registers. */
 	u32 reg_mem_config_offset;
 	u32 reg_mem_config_ddr_type_mask;
+	u32 reg_mem_config_ibecc_en_mask;
 	u32 reg_capabilities_misc_offset;
 	u32 reg_capabilities_misc_ibecc_dis;
 	/* Memory controller registers. */
@@ -316,6 +317,12 @@ static struct work_struct ecclog_work;
 /* Compute die IDs for Wildcat Lake with IBECC */
 #define DID_WCL_SKU1	0xfd00
 
+/* Compute die IDs for Nova Lake-H/HX with IBECC */
+#define DID_NVL_H_SKU1	0xd701
+#define DID_NVL_H_SKU2	0xd702
+#define DID_NVL_H_SKU3	0xd704
+#define DID_NVL_H_SKU4	0xd705
+
 static int get_mchbar(struct pci_dev *pdev, u64 *mchbar)
 {
 	union  {
@@ -417,6 +424,10 @@ static bool generic_ibecc_available(struct pci_dev *pdev)
 		val = readl(base + res_cfg->reg_capabilities_misc_offset);
 		present = !(val & res_cfg->reg_capabilities_misc_ibecc_dis);
 		edac_dbg(2, "capabilities misc reg 0x%x\n", val);
+	} else if (res_cfg->reg_mem_config_offset) {
+		val = readl(base + res_cfg->reg_mem_config_offset);
+		present = !!(val & res_cfg->reg_mem_config_ibecc_en_mask);
+		edac_dbg(2, "mem config reg 0x%x\n", val);
 	} else {
 		igen6_printk(KERN_ERR, "No register for detecting IBECC presence.\n");
 		present = false;
@@ -798,6 +809,37 @@ static struct res_config wcl_cfg = {
 	.err_addr_to_imc_addr	= adl_err_addr_to_imc_addr,
 };
 
+static struct res_config nvl_h_cfg = {
+	.machine_check			= true,
+	.num_imc			= 2,
+	.reg_mchbar_mask		= GENMASK_ULL(41, 17),
+	.reg_tom_mask			= GENMASK_ULL(41, 20),
+	.reg_touud_mask			= GENMASK_ULL(41, 20),
+	.reg_eccerrlog_addr_mask	= GENMASK_ULL(38, 5),
+	.reg_mem_config_offset		= 0x12904,
+	.reg_mem_config_ddr_type_mask	= GENMASK(8, 6),
+	.reg_mem_config_ibecc_en_mask	= GENMASK(3, 2),
+	.reg_mad_inter_size_mask[0]	= GENMASK(15, 8),
+	.reg_mad_inter_size_mask[1]	= GENMASK(23, 16),
+	.reg_mad_inter_size_granularity	= BIT_ULL(29),
+	.reg_mad_intra_rank_mask[0]	= BIT(7),
+	.reg_mad_intra_rank_mask[1]	= BIT(15),
+	.reg_mad_intra_width_mask[0]	= BIT(6),
+	.reg_mad_intra_width_mask[1]	= BIT(14),
+	.reg_mad_intra_density_mask[0]	= GENMASK(3, 0),
+	.reg_mad_intra_density_mask[1]	= GENMASK(11, 8),
+	.imc_base			= 0xd800,
+	.ibecc_base			= 0xd400,
+	.ibecc_error_log_offset		= 0x170,
+	.get_mem_type			= ptl_h_get_mem_type,
+	.get_dev_type			= ptl_h_get_dev_type,
+	.set_chan_params		= ptl_h_set_chan_params,
+	.set_dimm_params		= ptl_h_set_dimm_params,
+	.ibecc_available		= generic_ibecc_available,
+	.err_addr_to_sys_addr		= adl_err_addr_to_sys_addr,
+	.err_addr_to_imc_addr		= adl_err_addr_to_imc_addr,
+};
+
 static struct pci_device_id igen6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, DID_EHL_SKU5), (kernel_ulong_t)&ehl_cfg },
 	{ PCI_VDEVICE(INTEL, DID_EHL_SKU6), (kernel_ulong_t)&ehl_cfg },
@@ -865,6 +907,10 @@ static struct pci_device_id igen6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU14), (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), (kernel_ulong_t)&wcl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU1), (kernel_ulong_t)&nvl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU2), (kernel_ulong_t)&nvl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU3), (kernel_ulong_t)&nvl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU4), (kernel_ulong_t)&nvl_h_cfg },
 	{ },
 };
 MODULE_DEVICE_TABLE(pci, igen6_pci_tbl);
-- 
2.43.0

