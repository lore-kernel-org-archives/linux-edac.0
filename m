Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8691C433AD;
	Thu, 30 Jul 2026 03:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785380419; cv=none; b=axABjKvYSVLtT3PAuQ6Dhra6T5niR3ywjE5JnGxXOoNQGwWroqwf2XC1uSfsQS+g+MI9wrJanie/MCI/h1GcOastjUvXLd07csfOKt9NVfIJ+2oKVEVH/TKj2X71XmXMU5AEUvvHjO3vJVFF4EydqdGbr7gkui959X9AMBBh4tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785380419; c=relaxed/simple;
	bh=Ci0iKyhopX29n0p3Q5KPrMormQOJRJXXkcblB1jqdCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYlgIrV5ZtvJbtDgQ9DthmZUvdDFRD/onoUu25ab06rZIOaUq3ydpkvEgxyQpdzJTtWxoZkhE/98L0Woa3hfHJWQQ2IOaG0wAmK2DxhmLXjJI5CCdzZ0PvuHEBnxAgpmGkl9W4uRlAinFmOreyBzkRbrR1YQSfsx1ly1z3kFmgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzpsHrdg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzpsHrdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785380418; x=1816916418;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ci0iKyhopX29n0p3Q5KPrMormQOJRJXXkcblB1jqdCA=;
  b=AzpsHrdgDHg9FW6XX8gABZaRkz8wCVlyAE1+3bHN5HcmFUlyCJvb6I4d
   rnns5el9imXeg4wiAVC9hqhboygpYRwv7B/tVkgf53SiipoV46dPWEsFq
   wu6a4vF5zzFBmFPMqKgyd7fljyULVBTAM4oN6VlUGGJR0CTo/OzXiDMUA
   eV5LAHIrrTQ5nqn+wp+UWAeXIrcQEBMHohtoOp6DD/ZKEQt1VbNF5/dGi
   mLwKB5OXbDhRpj3IxgYMSHbt5JJM1tn8RYbg44W+1GJhqVJqoE18qhBHW
   qQwOBHeYyk9sCeNYZg1kKEM3MLbvldRj40uoxgmcIcdSZpbkmOCkHO5iv
   A==;
X-CSE-ConnectionGUID: bYQVNjUvR6edfssPYeyDTg==
X-CSE-MsgGUID: tu0OaXkOS0W7P1B4mPNPzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86030201"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="86030201"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 20:00:17 -0700
X-CSE-ConnectionGUID: XyfLH/uVQAWnaHeSSFkUEA==
X-CSE-MsgGUID: 979BbKcfTjSh9gHRT48cLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="284746370"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 20:00:15 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: qiuxu.zhuo@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yi1.lai@intel.com,
	jie.wang@intel.com
Subject: [PATCH 1/1] EDAC/igen6: Add Intel Starfire SoCs support
Date: Thu, 30 Jul 2026 10:54:54 +0800
Message-ID: <20260730025454.4099934-1-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starfire is a derivative of Panther Lake SoC and shares a similar memory
subsystem architecture. Add Starfire compute die ID and reuse Panther
Lake's configuration data for EDAC support.

Tested-by: Jie Wang <jie.wang@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index 6abc9b203748..776c5db2f598 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -351,6 +351,9 @@ static struct work_struct ecclog_work;
 #define DID_PTL_H_SKU13	0xb02a
 #define DID_PTL_H_SKU14	0xb00a
 
+/* Starfire */
+#define DID_STF_SKU1	0xb02b
+
 /* Wildcat Lake */
 #define DID_WCL_SKU1	0xfd00
 
@@ -885,6 +888,7 @@ static struct res_config mtl_p_cfg = {
 	.err_addr_to_imc_addr	= adl_err_addr_to_imc_addr,
 };
 
+/* Shared by Panther Lake-H and Starfire */
 static struct res_config ptl_h_cfg = {
 	.machine_check			= true,
 	.num_imc			= 2,
@@ -1013,6 +1017,7 @@ static struct pci_device_id igen6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU14), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_STF_SKU1), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU1), .driver_data = (kernel_ulong_t)&nvl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU2), .driver_data = (kernel_ulong_t)&nvl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU3), .driver_data = (kernel_ulong_t)&nvl_h_cfg },
-- 
2.43.0

