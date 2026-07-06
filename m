Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641E43C2D;
	Mon,  6 Jul 2026 03:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308466; cv=none; b=o0Qvg0ynmSa5Aw8CVZcqLXN5R/Df3EOekFVd/+2ZpTpfNy1689rqTyVFLxk8FDk6lzC7cmNmcaMkt/6LXjm7URc2iIzYSRfh7NU5wFcNIU6WeqI0fYKpSdPM7kYMZi/5gvBQzx/mZ0I1rO82ACuWGW2XcToLIITg8FTHByv0av0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308466; c=relaxed/simple;
	bh=E9w4eVbdpy2D24TdArwcRxEEyxzm9Q1T/Ac0n8s0PGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1FQ7+LfaPz9psFWP4grEJbWALq1Cso57tldkCC/XWRzoCDufOqV0HXbg2Jv/Uln9umuylHxMAB8gY8tGTQcrE/J/ddVMSwKyLwPhaznTrJqsO+Lj6rArVS2xONQIEcwa/qq5QB/xpFuFF9PjkD07UUGNQUcOHVISVz6ykhopZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=St1Ro42w; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="St1Ro42w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783308464; x=1814844464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E9w4eVbdpy2D24TdArwcRxEEyxzm9Q1T/Ac0n8s0PGk=;
  b=St1Ro42wx26sKT5pSNq3x6C+5JiPDI2Yz/WA8BM+sBKtS4B51bt8ffUC
   IacW6jAvjgpihdx1PWL/q+48TIlwuaIh38S0++yK3RN7PcQmzDxM1iEBB
   PJ6JWDnToE1KjVR8b+Im36ECaBqrDZUq6U7mQeKBRWPEycvZ+DtZEr10m
   J4SNTc/HXzM2ctkVPy0/pAqs/MaQpvFMExGpUg+FchBRKqAb5CY28+iE8
   kecD8b13j3NCl/zP5QLVFnzMHNN0cPCetYcRIXH133CRuwk0QU8LteP+Z
   vh+ABePrbFywjLUEAQ5xNjX8Xgd25FGGfUSvw6sA0f6bMS+AtyGD4KgkU
   A==;
X-CSE-ConnectionGUID: l1zlE4UETxyYUah7gPU8+g==
X-CSE-MsgGUID: jffA6omAS52CDajvqvpUwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="71456370"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="71456370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:27:44 -0700
X-CSE-ConnectionGUID: MnsPxNJTRlOQYPW8oqH6nA==
X-CSE-MsgGUID: 4ahWtvsDT5GOWdqZ+j0nOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258487861"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:27:42 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] EDAC/ie31200: Decouple DIMM width decoding from enum order
Date: Mon,  6 Jul 2026 11:22:24 +0800
Message-ID: <20260706032233.3283297-2-qiuxu.zhuo@intel.com>
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

The current method to get DIMM width relied on DEV_* enum ordering via a
linear offset (+ DEV_X8), tightly coupling hardware encoding to enum layout.

Replace it with explicit decoding to remove this dependency, as the
enum is expected to grow with additional device widths.

Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/ie31200_edac.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c
index e3bd6436669b..bfd54012ae47 100644
--- a/drivers/edac/ie31200_edac.c
+++ b/drivers/edac/ie31200_edac.c
@@ -416,7 +416,23 @@ static void populate_dimm_info(struct dimm_data *dd, u32 addr_decode, int dimm,
 {
 	dd->size = field_get(cfg->reg_mad_dimm_size_mask[dimm], addr_decode) * cfg->reg_mad_dimm_size_granularity;
 	dd->ranks = field_get(cfg->reg_mad_dimm_rank_mask[dimm], addr_decode) + 1;
-	dd->dtype = field_get(cfg->reg_mad_dimm_width_mask[dimm], addr_decode) + DEV_X8;
+
+	switch (field_get(cfg->reg_mad_dimm_width_mask[dimm], addr_decode)) {
+	case 0:
+		dd->dtype = DEV_X8;
+		break;
+	case 1:
+		dd->dtype = DEV_X16;
+		break;
+	case 2:
+		dd->dtype = DEV_X32;
+		break;
+	case 3:
+		dd->dtype = DEV_X64;
+		break;
+	default:
+		dd->dtype = DEV_UNKNOWN;
+	}
 }
 
 static void ie31200_get_dimm_config(struct mem_ctl_info *mci, void __iomem *window,
-- 
2.43.0

