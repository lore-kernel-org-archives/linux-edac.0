Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0EC3AD507;
	Mon,  6 Jul 2026 03:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308518; cv=none; b=YZwpHTO03B2wAK4EuswtJ0ZGl7Gv4ixPn3Ly7epblm5hD+Q6MqOYGR9N9zjMO86UWEKU4VFdP8Ca2IHEippgNpS5DtR7hbuze/7QOTlbf9Jf4bVPsjkx+oCnA80nmjQjaNgCLn9xRBfVYt08OWUxkNcYzsTFfZ11t1dx5Me1mGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308518; c=relaxed/simple;
	bh=E/pZnXJIbWrqutZzTJKuv9CqKafzNrwTQxT+c4CrMP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESFoIWVPRwSOXghoBiX7M9pdsjNKjyqvMPp9qMd/Tfmn5DbW1/6i90SoS1sJkguyZNVyAOOa76RFIiX63zoCdpFBleG01zPt6Bl1gnyNkeGY2ycOFGlbUiCmuIy9rbKI7AhmEsnvpgk7eYHy/l9KvwdcuO8ofEufXh4gI9Vt3lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSHoQOi6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSHoQOi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783308516; x=1814844516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E/pZnXJIbWrqutZzTJKuv9CqKafzNrwTQxT+c4CrMP4=;
  b=KSHoQOi6xm11zwXcNflVw6QeB72CsSA8H/WkR5qQMuYoKRq0is1FttK2
   F58BB5x1SFlLnkasJCN1IwMmO7wGu2kdrLIvNTL76UXCSm1fr7y19tCn0
   2APk2ptnoGkXU/limcgZU17xyAG6r2gvut+rHGlFV1hXaPQI2KRIcVyKr
   RjEiO8PufkXFGeMvA/S20sXfIl4DBqK3uyqtkAfRq2za6+bMyeaFehweL
   NCySydrYhxou+yM0xD1RoujDoTUh8M9nLqe+V4yc2ALaIqokI8H7+fQFR
   Iitq7PjM6RVOEK3craar6hru9C7AYW4tTWbK0RBI7+mBIISaovFjAN06C
   A==;
X-CSE-ConnectionGUID: 989uQh8aTjmvl3NxzPAR0A==
X-CSE-MsgGUID: gwvl1FX2T4SdqXl7sWQD7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="71456453"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="71456453"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:28:36 -0700
X-CSE-ConnectionGUID: YV4OkqbUSsyQpARmHJ9fXg==
X-CSE-MsgGUID: RNbXyIqxSG+c/PawFPmIUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258487973"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:28:34 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] EDAC/igen6: Remove redundant resource configuration tables
Date: Mon,  6 Jul 2026 11:22:32 +0800
Message-ID: <20260706032233.3283297-10-qiuxu.zhuo@intel.com>
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

Several resource configuration tables differ only in their num_imc
value, while all other fields are identical. Their only purpose is to
describe the number of memory controllers supported by a platform.

Since IMC count is now detected at runtime, these duplicate tables no
longer carry any unique platform information. Reuse the shared
configurations and remove the redundant tables.

Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 64 +++++++++++----------------------------
 1 file changed, 17 insertions(+), 47 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index d468c655348c..ea34adac822b 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -736,21 +736,6 @@ static struct res_config adl_cfg = {
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
@@ -813,21 +798,6 @@ static struct res_config ptl_h_cfg = {
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
@@ -880,22 +850,22 @@ static struct pci_device_id igen6_pci_tbl[] = {
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
@@ -911,6 +881,7 @@ static struct pci_device_id igen6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU1), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
 	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU2), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
 	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU3), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU1), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU2), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU3), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
@@ -925,7 +896,6 @@ static struct pci_device_id igen6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU14), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), .driver_data = (kernel_ulong_t)&wcl_cfg },
 	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU1), .driver_data = (kernel_ulong_t)&nvl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU2), .driver_data = (kernel_ulong_t)&nvl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU3), .driver_data = (kernel_ulong_t)&nvl_h_cfg },
-- 
2.43.0

