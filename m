Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF13344036;
	Thu, 30 Jul 2026 02:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379772; cv=none; b=gsxuO7S2Lpi+aNVuRsH48NLgEAvOzPgFCmYka72qVBh5lSaVxLHUuECaRAv5qVgn+YS4CFF2OU861wJxOhQ9Jc205zeONoNx6/ewimCL61H12+70aIANsba0Y6b25USx3sMmxV4SXwiiHJGF6tf++jf+nHgcP8IR8FxVMJ4O/a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379772; c=relaxed/simple;
	bh=qaI1Mq9IhjOIdg8o71zSRTyKV1XU+y6DYs7KCxVTnJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFWF54YnDDNbIbrkxAy4ToB5eqd0WmHDTqdGlve8hrUFfu+kEECpqj4MPoDXAgHERxWLWs9gmA3dZi0aDDqfVm9VX/l8lVsIX/qsZ5Pf4vEifXB06qDiCge42s1D9MbqBsFq1SQfbpqc/zSAv8/ggjCCM2hYmb2e50VLZgtlZwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2+Xx3Ya; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2+Xx3Ya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785379771; x=1816915771;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qaI1Mq9IhjOIdg8o71zSRTyKV1XU+y6DYs7KCxVTnJM=;
  b=G2+Xx3Ya91x4wDaT9+1ZQnUutmzI2V7xMc/lKXvQCpzxsrb2OxszVGOv
   lhoLeO8lfpm1L1Nm4gUeTJU15DF+jngVR8IbkyYiOC0Ym2BKRp/SmiYm3
   YwDUC3KyWEeahT+EDri6nPz9xPl+Dm99gIRbYBGsAlNfE/xbkInxKEenT
   Nkw0p6rSaEYZV7QzWmSLJBQeHcM93LIgOggGVRXA0nFPojvfPofA4gkYu
   2Fh8ZtZWrchaf5SltX99ivomIOOo4zCwFJ3V/7JokG0cyDm1csc5yD2YG
   qRWan1nhgT53thkqjW2k2wcQzQhmUy7J+1NUl5MRvyGJjlOogD50LQc58
   A==;
X-CSE-ConnectionGUID: f6BjQ1lDT3GhrSEkURR9aA==
X-CSE-MsgGUID: XKfWDuQ4Sjadl/zK57mvBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103398226"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="103398226"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:30 -0700
X-CSE-ConnectionGUID: AHb2LDPdRHqAvhTfx45kbg==
X-CSE-MsgGUID: tALhKgiOT7SGYNJz8nlK9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256240756"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:28 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: qiuxu.zhuo@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [PATCH v2 05/10] EDAC/igen6: Fix Raptor Lake-P logged error address
Date: Thu, 30 Jul 2026 10:42:33 +0800
Message-ID: <20260730024238.4096623-6-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730024238.4096623-1-qiuxu.zhuo@intel.com>
References: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
 <20260730024238.4096623-1-qiuxu.zhuo@intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Raptor Lake-P was treated as using a different IBECC (In-Band ECC) error
address format and therefore had a dedicated extraction path that shifted
the logged address.

However, Raptor Lake-P uses the same cache-line-granularity error address
format as other IBECC platforms. The special handling causes the logged
address to be decoded incorrectly.

Fix the issue by removing Raptor Lake-P specific extraction logic and using
the common path instead. This also allows reusing Alder Lake resource
configuration data.

Fixes: d23627a7688f ("EDAC/igen6: Add Intel Raptor Lake-P SoCs support")
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 39 ++++++---------------------------------
 1 file changed, 6 insertions(+), 33 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index ea5628d780eb..12d718a50e1c 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -175,8 +175,6 @@ static struct res_config {
 	/* Set imc->dimm_{l_size,s_size,l_map}[chan]. */
 	void (*set_dimm_params)(struct igen6_imc *imc, int chan);
 	bool (*ibecc_available)(struct pci_dev *pdev);
-	/* Extract error address logged in IBECC */
-	u64 (*err_addr)(u64 ecclog);
 	/* Convert error address logged in IBECC to system physical address */
 	u64 (*err_addr_to_sys_addr)(u64 eaddr, int mc);
 	/* Convert error address logged in IBECC to integrated memory controller address */
@@ -522,11 +520,6 @@ static u64 adl_err_addr_to_imc_addr(u64 eaddr, int mc)
 	return imc_addr;
 }
 
-static u64 rpl_p_err_addr(u64 ecclog)
-{
-	return field_get(res_cfg->reg_eccerrlog_addr_mask, ecclog);
-}
-
 static enum mem_type ptl_h_get_mem_type(struct igen6_imc *imc)
 {
 	u32 mtype, val;
@@ -716,22 +709,6 @@ static struct res_config adl_n_cfg = {
 	.err_addr_to_imc_addr	= adl_err_addr_to_imc_addr,
 };
 
-static struct res_config rpl_p_cfg = {
-	.machine_check		= true,
-	.num_imc		= 2,
-	.reg_mchbar_mask	= GENMASK_ULL(41, 17),
-	.reg_tom_mask		= GENMASK_ULL(41, 20),
-	.reg_touud_mask		= GENMASK_ULL(41, 20),
-	.reg_eccerrlog_addr_mask = GENMASK_ULL(45, 5),
-	.imc_base		= 0xd800,
-	.ibecc_base		= 0xd400,
-	.ibecc_error_log_offset	= 0x68,
-	.ibecc_available	= tgl_ibecc_available,
-	.err_addr		= rpl_p_err_addr,
-	.err_addr_to_sys_addr	= adl_err_addr_to_sys_addr,
-	.err_addr_to_imc_addr	= adl_err_addr_to_imc_addr,
-};
-
 static struct res_config mtl_ps_cfg = {
 	.machine_check				= true,
 	.num_imc				= 2,
@@ -877,11 +854,11 @@ static struct pci_device_id igen6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, DID_ASL_SKU1), .driver_data = (kernel_ulong_t)&adl_n_cfg },
 	{ PCI_VDEVICE(INTEL, DID_ASL_SKU2), .driver_data = (kernel_ulong_t)&adl_n_cfg },
 	{ PCI_VDEVICE(INTEL, DID_ASL_SKU3), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU1), .driver_data = (kernel_ulong_t)&rpl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU2), .driver_data = (kernel_ulong_t)&rpl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU3), .driver_data = (kernel_ulong_t)&rpl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU4), .driver_data = (kernel_ulong_t)&rpl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU5), .driver_data = (kernel_ulong_t)&rpl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU1), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU2), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU3), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU4), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU5), .driver_data = (kernel_ulong_t)&adl_cfg },
 	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU1), .driver_data = (kernel_ulong_t)&mtl_ps_cfg },
 	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU2), .driver_data = (kernel_ulong_t)&mtl_ps_cfg },
 	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU3), .driver_data = (kernel_ulong_t)&mtl_ps_cfg },
@@ -1237,11 +1214,7 @@ static void ecclog_work_cb(struct work_struct *work)
 
 	llist_for_each_entry_safe(node, tmp, head, llnode) {
 		memset(&res, 0, sizeof(res));
-		if (res_cfg->err_addr)
-			eaddr = res_cfg->err_addr(node->ecclog);
-		else
-			eaddr = node->ecclog & res_cfg->reg_eccerrlog_addr_mask;
-
+		eaddr	     = node->ecclog & res_cfg->reg_eccerrlog_addr_mask;
 		res.mc	     = node->mc;
 		res.sys_addr = res_cfg->err_addr_to_sys_addr(eaddr, res.mc);
 		res.imc_addr = res_cfg->err_addr_to_imc_addr(eaddr, res.mc);
-- 
2.43.0

