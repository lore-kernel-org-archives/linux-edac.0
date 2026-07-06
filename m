Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7731B3AD51A;
	Mon,  6 Jul 2026 03:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308485; cv=none; b=qYVa5jmg/TtXNnZRwrbWqLylc4t0XZNPmqAy822LkhDEg6dCZlFm1b9KRtLKTjTuk5SxsVffu73BtDAnYyJ3ZWE/q5VrZir0Q3pDhlkD2t6+ee9Xh5I2OENguWNwj9vY12BT3tcSkSSwswud3YSDLpTl2kTz8KBPfJtttIPwTcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308485; c=relaxed/simple;
	bh=qaI1Mq9IhjOIdg8o71zSRTyKV1XU+y6DYs7KCxVTnJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbNSLJ7A0F54uIx308ESpI8IRhSaymyZ4kuait3TDYjgji4cGfDUMD+CRkf5bOSZF9adTo3VEQvikBQdI+ETcS96Xvst0RWzHNl2fX0p92It2vu8ldxL9OvykeVutyFrH+g33zJUpyUUF4yviXeC/JFsi1wNPgz/drw3TZl3W6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMZtP5FA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMZtP5FA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783308484; x=1814844484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qaI1Mq9IhjOIdg8o71zSRTyKV1XU+y6DYs7KCxVTnJM=;
  b=jMZtP5FAUc6XCH03wW4nbsl29ygbn3g651cjvL85rYyMeJCAkJyj8hxf
   SN7HlfeA4xTrBhiX9fhnTZn1LEPFX9rdrjZwpY2AcCKb6pzHb0fxSlJE1
   5WkYzq133mADgNd//7hJ1V0YcaLv7UNMjH7Tc/ZdAaKwvHYePnBFQrdEB
   uQWwIp4FeqzZx6XOqNCJS3z6zLzt626uXu9YFLreGCgzLJ01e9dsQUOzd
   kvkS82eAjCyFOm2i6+uKK2EVboyLdw8PRmjZ0Orc57rfWmUvNX9x3hKXa
   RxGkS47+D0nxc7t4eOMbMtgdup0igwm91acwdUfh+MHJ2BX44I58XFR5z
   Q==;
X-CSE-ConnectionGUID: 4IV8NsuGTMKwFAlBJ32J0w==
X-CSE-MsgGUID: Yj/Y9A4NRKCVgajWTspNng==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="71456403"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="71456403"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:28:04 -0700
X-CSE-ConnectionGUID: JFa38DceThCczEuIjrlaCg==
X-CSE-MsgGUID: snIHMJiOSvqRnHGUgIfCLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258487902"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:28:02 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] EDAC/igen6: Fix Raptor Lake-P logged error address
Date: Mon,  6 Jul 2026 11:22:28 +0800
Message-ID: <20260706032233.3283297-6-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
References: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
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

