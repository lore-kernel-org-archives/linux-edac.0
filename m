Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B2137C92C;
	Thu, 30 Jul 2026 02:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379720; cv=none; b=AxNkeuLl+69yKomn72Qigy69/wH2PQegA5aPWvUrkJrJzDkNvuSaK/nlyirMRNttQqktyowF3maFF6VvHYkW/VezFnHabca4DmtY57tJl6Ff2QiEofryYDwpNs4rdcnVbpOzobpmIynBP6DEk0F8aiNiE0lnHG4mchQIz+LaYCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379720; c=relaxed/simple;
	bh=E9w4eVbdpy2D24TdArwcRxEEyxzm9Q1T/Ac0n8s0PGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t3vHMiE2+0p1OmB4ae78xJ/40rAYaJ58YOhE4eNY9bxdZymEJG2NbMgWQrdNqQ5JgdTImijCGdcSGuugudpVhs2JMciHeCN5x+wZKZ5mWrBKxjUggdm6i79Wonp7t4TlpYlGvtwyQzSJHDtZu5PfK0t87S6AQp+qhT2PfgtHLtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2zKpO8+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2zKpO8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785379718; x=1816915718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E9w4eVbdpy2D24TdArwcRxEEyxzm9Q1T/Ac0n8s0PGk=;
  b=k2zKpO8+QjaDumoaJNq0vk4ha4HRsTxV/OcpSmlRXIjIjHO3piUM9UeO
   3YtP1tSffWqvwXSF4bvxw4uUEwbbvhf/DRxkCn9m7Bg5ymybjmNtHR4OD
   Nxe9+cOmOer8+5QR2LNxYkQYdZbYVNlSSjkAqg3tx8FgLPK/5+b+NOqDB
   t5EicUUZvO2+/nwBBC94nNAU3NB2EvS1Ku7QCw2z2Mn4TWncjyLIA7W2T
   ZsmZlILgvaCF9uMnLPqr95MMUn7FjqxIamINKL6N2G8P3Jzrn1AlNzBPX
   Vf1u67kNivgSSS6QzlztnCdnhqW1sgfPkx6/edJ25O+wprptwd+cTIVm2
   w==;
X-CSE-ConnectionGUID: XFcSbcYJSGi+IsNukM2eBQ==
X-CSE-MsgGUID: IGicMuNqQGu3tIA4tpyI0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89674289"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="89674289"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:48:38 -0700
X-CSE-ConnectionGUID: 5gkC1xWhSTuFLKPOSXqNJA==
X-CSE-MsgGUID: hldKwGK0QgWr1zRwYQFkmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256240656"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:48:36 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: qiuxu.zhuo@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [PATCH v2 01/10] EDAC/ie31200: Decouple DIMM width decoding from enum order
Date: Thu, 30 Jul 2026 10:42:29 +0800
Message-ID: <20260730024238.4096623-2-qiuxu.zhuo@intel.com>
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

