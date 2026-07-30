Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B20A344036;
	Thu, 30 Jul 2026 02:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379798; cv=none; b=NbRa86j4gYqlzanX1ecR1cxAk3hdh2V0Sq5BtZ/Eqs0kJlu881Odpe9lfP3X/F7fktIkRvFS2Hs1wd8E+2iQ9ojV6O5hRESRmt4JdCiY+JKNv37t+gnidvF0xxOc4VadNYXHfziISwmdVDcuVvCTCtHgy1tVfWwmgk/97B3xE3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379798; c=relaxed/simple;
	bh=iW5NcUhLu/mokw6KQtZTKq3F3nu9zWZMLQdkNCxVhPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ssdKKjW35Nu97s+NsgQCj+dw2gLTJEPnSVYE6PC2wG3uE0f40hY3Wnhi5e1Nw3ZONXB8yONfDLQ3fAfk4falXlaJvEw6xkYWjWo19UyLJNoxmUcmqwo/Bjvq0Zb0foXS+U2eDoX63VBCKZT8bTnca3hawBTUtMkrdfRmROUyi4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BCqRSIzH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCqRSIzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785379797; x=1816915797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iW5NcUhLu/mokw6KQtZTKq3F3nu9zWZMLQdkNCxVhPU=;
  b=BCqRSIzHtA+4/4K4KBLNDxWiQFDKtWDN8WCYSm5yOwfFLqdBcsdb3DZj
   DY7/53lN/MTcw3TEjNiR8c+Ya6fWFnL/kvDuH7cj+xxDbYU9CXGaRHRyH
   ARyx77AAqzRPOuXzFTRHJ8+bwEW5tQW55uWzfqwq2ZT7F7ok0YG7CIP1u
   dfD3Mu9/lBismT/M45fVKvO6o1H2VmwISWj4lmxpeP0OsA/9n8rGt+nWW
   Rdg+bcFOf9vhDlk976EJuvPSHREcycPRUkpRvZil2b0BVz8xYQce9Tq6w
   48/yAux1qRR+er4Cd8Vtq9XkyHBOI1nLHVUvobFIH8+lNCWui71KscKZq
   A==;
X-CSE-ConnectionGUID: aDM5OlrmTUapSLg8iwfsNw==
X-CSE-MsgGUID: 54bXeaBjTi6hYmmJPGKvAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103398268"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="103398268"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:57 -0700
X-CSE-ConnectionGUID: OtPwplFDRpaQkpNCAzhJZA==
X-CSE-MsgGUID: Udo/pCP7RBe0qnpJRfaJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256240801"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:55 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: qiuxu.zhuo@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [PATCH v2 09/10] EDAC/igen6: Remove redundant resource configuration tables
Date: Thu, 30 Jul 2026 10:42:37 +0800
Message-ID: <20260730024238.4096623-10-qiuxu.zhuo@intel.com>
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

Several resource configuration tables differ only in their num_imc
value, while all other fields are identical. Their only purpose is to
describe the number of memory controllers supported by a platform.

Since IMC count is now detected at runtime, these duplicate tables no
longer carry any unique platform information. Reuse the shared
configurations and remove the redundant tables.

Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
v1 -> v2:
  - Add comments indicating which platforms share the same resource configuration table (Tony).

 drivers/edac/igen6_edac.c | 66 +++++++++++----------------------------
 1 file changed, 19 insertions(+), 47 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index d468c655348c..e10e29f1a5f5 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -721,6 +721,7 @@ static struct res_config tgl_cfg = {
 	.err_addr_to_imc_addr	= tgl_err_addr_to_imc_addr,
 };
 
+/* Shared by Alder Lake, Alder Lake-N, Arizona Beach, Amston Lake, and Raptor Lake-P */
 static struct res_config adl_cfg = {
 	.machine_check		= true,
 	.num_imc		= 2,
@@ -736,21 +737,6 @@ static struct res_config adl_cfg = {
 	.err_addr_to_imc_addr	= adl_err_addr_to_imc_addr,
 };
 
-static struct res_config adl_n_cfg = {
-	.machine_check		= true,
-	.num_imc		= 1,
-	.reg_mchbar_mask	= GENMASK_ULL(41, 17),
-	.reg_tom_mask		= GENMASK_ULL(41, 20),
-	.reg_touud_mask		= GENMASK_ULL(41, 20),
-	.reg_eccerrlog_addr_mask = GENMASK_ULL(45, 5),
-	.imc_base		= 0xd800,
-	.ibecc_base		= 0xd400,
-	.ibecc_error_log_offset	= 0x68,
-	.ibecc_available	= tgl_ibecc_available,
-	.err_addr_to_sys_addr	= adl_err_addr_to_sys_addr,
-	.err_addr_to_imc_addr	= adl_err_addr_to_imc_addr,
-};
-
 static struct res_config mtl_ps_cfg = {
 	.machine_check				= true,
 	.num_imc				= 2,
@@ -768,6 +754,7 @@ static struct res_config mtl_ps_cfg = {
 	.err_addr_to_imc_addr			= adl_err_addr_to_imc_addr,
 };
 
+/* Shared by Meteor Lake-P, Arrow Lake-UH, and Wildcat Lake */
 static struct res_config mtl_p_cfg = {
 	.machine_check		= true,
 	.num_imc		= 2,
@@ -813,21 +800,6 @@ static struct res_config ptl_h_cfg = {
 	.err_addr_to_imc_addr		= adl_err_addr_to_imc_addr,
 };
 
-static struct res_config wcl_cfg = {
-	.machine_check		= true,
-	.num_imc		= 1,
-	.reg_mchbar_mask	= GENMASK_ULL(41, 17),
-	.reg_tom_mask		= GENMASK_ULL(41, 20),
-	.reg_touud_mask		= GENMASK_ULL(41, 20),
-	.reg_eccerrlog_addr_mask = GENMASK_ULL(38, 5),
-	.imc_base		= 0xd800,
-	.ibecc_base		= 0xd400,
-	.ibecc_error_log_offset	= 0x170,
-	.ibecc_available	= mtl_p_ibecc_available,
-	.err_addr_to_sys_addr	= adl_err_addr_to_sys_addr,
-	.err_addr_to_imc_addr	= adl_err_addr_to_imc_addr,
-};
-
 static struct res_config nvl_h_cfg = {
 	.machine_check			= true,
 	.num_imc			= 2,
@@ -880,22 +852,22 @@ static struct pci_device_id igen6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, DID_ADL_SKU2), .driver_data = (kernel_ulong_t)&adl_cfg },
 	{ PCI_VDEVICE(INTEL, DID_ADL_SKU3), .driver_data = (kernel_ulong_t)&adl_cfg },
 	{ PCI_VDEVICE(INTEL, DID_ADL_SKU4), .driver_data = (kernel_ulong_t)&adl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU1), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU2), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU3), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU4), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU5), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU6), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU7), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU8), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU9), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU10), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU11), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU12), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_AZB_SKU1), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ASL_SKU1), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ASL_SKU2), .driver_data = (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ASL_SKU3), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU1), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU2), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU3), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU4), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU5), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU6), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU7), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU8), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU9), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU10), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU11), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU12), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_AZB_SKU1), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ASL_SKU1), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ASL_SKU2), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ASL_SKU3), .driver_data = (kernel_ulong_t)&adl_cfg },
 	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU1), .driver_data = (kernel_ulong_t)&adl_cfg },
 	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU2), .driver_data = (kernel_ulong_t)&adl_cfg },
 	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU3), .driver_data = (kernel_ulong_t)&adl_cfg },
@@ -911,6 +883,7 @@ static struct pci_device_id igen6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU1), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
 	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU2), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
 	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU3), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU1), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU2), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU3), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
@@ -925,7 +898,6 @@ static struct pci_device_id igen6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU14), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), .driver_data = (kernel_ulong_t)&wcl_cfg },
 	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU1), .driver_data = (kernel_ulong_t)&nvl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU2), .driver_data = (kernel_ulong_t)&nvl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU3), .driver_data = (kernel_ulong_t)&nvl_h_cfg },
-- 
2.43.0

