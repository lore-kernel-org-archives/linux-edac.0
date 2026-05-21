Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623EB46B5;
	Thu, 21 May 2026 07:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349199; cv=none; b=m7gIIfVnmxKi8FZnwR37w7fKJn0h4LsCpCSmD9FW8KX34ocWIlZLRSVNrXfANZS1d+GdZnZmiLeEDlu2pOdpxjlfpw30EjtpDl6TJW+EsU3d0LGJqFsWEMDLBNd4fHo/na1dZM6vM+p7351VZueQ1H72K3xeM6erDr8ek/ikHyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349199; c=relaxed/simple;
	bh=1wAOQAsq4vEcHK8x9vPvNugIwlGTusS7svJZDL3ML68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAkgWHpvDqKfOnwOvSh7QuDKiC8CXvdIjOmsSzz7/Vsv6QryLxz1YI55mFjs8R5P9w1MQQ67lBX86ClWtfOVHwzdjCwg1uydJ2r1GBs8HDqElkuDCdzaqQ5qZGiPoh3IV331m/T4ftv9TgnGH6N0l0vKyU6m0p3rsAuWzNBr5Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWsma5w4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWsma5w4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349198; x=1810885198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1wAOQAsq4vEcHK8x9vPvNugIwlGTusS7svJZDL3ML68=;
  b=RWsma5w4t4Nm8kQ3IbZ+2afsPwJfUf1yOngpvUSUL7gao/xi0dPqVMWp
   ibUBN3NEJ6CZhoHXDgJOXfT7K62ND4A17iQs+VFn3RE3Hcc6iFve7vrU/
   FGB23LS1nvXMlwnm55JWfyvzDBu2Uu1MOFrpMSzzPTu9fKebOZVsyW2kU
   RD8wzFd1vJLTtIc+S1F2atG8Qb/CyzDC24bckhjP8ei0kZWWtVFPvZe2V
   hje+QEcFkEWtuf9kGwyaMwlop3VosuDG66L0kor7LBTsJbVSDVoE+Ud/L
   T/BFhhSkvmmeXoqFklsw9tYKDJa4OJj+lT9xvLv60Rc/6QvCeOCZXTMVe
   Q==;
X-CSE-ConnectionGUID: bev1kY1iQqqzNP+0jGgLvg==
X-CSE-MsgGUID: BSyV8fLDQiSS5fGA3oEwyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97690587"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97690587"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:39:57 -0700
X-CSE-ConnectionGUID: NsJ8TZk0TlqRsWJts23s+g==
X-CSE-MsgGUID: sj3Z6h2xSm2GwhLtJ5ec2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263973839"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:39:53 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] EDAC/skx_common: Add SubChannel support to ADXL decode
Date: Thu, 21 May 2026 15:31:10 +0800
Message-ID: <20260521073112.3881223-7-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521073112.3881223-1-qiuxu.zhuo@intel.com>
References: <20260521073112.3881223-1-qiuxu.zhuo@intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Diamond Rapids server RRL (Retry Read error Log) operates at sub-channel
granularity. Add SubChannel support to ADXL decoding in preparation for
enabling this feature.

Also introduce adxl_component_required() to validate mandatory ADXL
components to improve code readability.

Tested-by: Yi Lai <yi1.lai@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/skx_common.c | 20 +++++++++++++++++++-
 drivers/edac/skx_common.h |  5 +++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/skx_common.c b/drivers/edac/skx_common.c
index f769a354ea45..4d832f02fb59 100644
--- a/drivers/edac/skx_common.c
+++ b/drivers/edac/skx_common.c
@@ -31,10 +31,12 @@ static const char * const component_names[] = {
 	[INDEX_CHANNEL]		= "ChannelId",
 	[INDEX_DIMM]		= "DimmSlotId",
 	[INDEX_CS]		= "ChipSelect",
+	[INDEX_SUBCH]		= "SubChId",
 	[INDEX_NM_MEMCTRL]	= "NmMemoryControllerId",
 	[INDEX_NM_CHANNEL]	= "NmChannelId",
 	[INDEX_NM_DIMM]		= "NmDimmSlotId",
 	[INDEX_NM_CS]		= "NmChipSelect",
+	[INDEX_NM_SUBCH]	= "NmSubChId",
 };
 
 static int component_indices[ARRAY_SIZE(component_names)];
@@ -43,6 +45,7 @@ static const char * const *adxl_component_names;
 static u64 *adxl_values;
 static char *adxl_msg;
 static unsigned long adxl_nm_bitmap;
+static unsigned long adxl_bitmap;
 
 static char skx_msg[MSG_SIZE];
 static skx_decode_f driver_decode;
@@ -288,6 +291,15 @@ void skx_show_rrl(struct decoded_addr *res, char *msg, int len, bool scrub_err)
 }
 EXPORT_SYMBOL_GPL(skx_show_rrl);
 
+static bool adxl_component_required(int idx)
+{
+	return idx == INDEX_SOCKET ||
+	       idx == INDEX_MEMCTRL ||
+	       idx == INDEX_CHANNEL ||
+	       idx == INDEX_DIMM ||
+	       idx == INDEX_CS;
+}
+
 int skx_adxl_get(void)
 {
 	const char * const *names;
@@ -306,12 +318,14 @@ int skx_adxl_get(void)
 
 				if (i >= INDEX_NM_FIRST)
 					adxl_nm_bitmap |= 1 << i;
+				else
+					adxl_bitmap |= 1 << i;
 
 				break;
 			}
 		}
 
-		if (!names[j] && i < INDEX_NM_FIRST)
+		if (!names[j] && adxl_component_required(i))
 			goto err;
 	}
 
@@ -438,11 +452,15 @@ static bool skx_adxl_decode(struct decoded_addr *res, enum error_source err_src)
 			       (int)adxl_values[component_indices[INDEX_NM_DIMM]] : -1;
 		res->cs      = (adxl_nm_bitmap & BIT_NM_CS) ?
 			       (int)adxl_values[component_indices[INDEX_NM_CS]] : -1;
+		res->subch   = (adxl_nm_bitmap & BIT_NM_SUBCH) ?
+			       (int)adxl_values[component_indices[INDEX_NM_SUBCH]] : -1;
 	} else {
 		res->imc     = (int)adxl_values[component_indices[INDEX_MEMCTRL]];
 		res->channel = (int)adxl_values[component_indices[INDEX_CHANNEL]];
 		res->dimm    = (int)adxl_values[component_indices[INDEX_DIMM]];
 		res->cs      = (int)adxl_values[component_indices[INDEX_CS]];
+		res->subch   = (adxl_bitmap & BIT_SUBCH) ?
+			       (int)adxl_values[component_indices[INDEX_SUBCH]] : -1;
 	}
 
 	if (res->imc < 0) {
diff --git a/drivers/edac/skx_common.h b/drivers/edac/skx_common.h
index eea2d95cc0ac..38d96bf71fd9 100644
--- a/drivers/edac/skx_common.h
+++ b/drivers/edac/skx_common.h
@@ -210,11 +210,13 @@ enum {
 	INDEX_CHANNEL,
 	INDEX_DIMM,
 	INDEX_CS,
+	INDEX_SUBCH,
 	INDEX_NM_FIRST,
 	INDEX_NM_MEMCTRL = INDEX_NM_FIRST,
 	INDEX_NM_CHANNEL,
 	INDEX_NM_DIMM,
 	INDEX_NM_CS,
+	INDEX_NM_SUBCH,
 	INDEX_MAX
 };
 
@@ -225,10 +227,12 @@ enum error_source {
 	ERR_SRC_NOT_MEMORY,
 };
 
+#define BIT_SUBCH	BIT_ULL(INDEX_SUBCH)
 #define BIT_NM_MEMCTRL	BIT_ULL(INDEX_NM_MEMCTRL)
 #define BIT_NM_CHANNEL	BIT_ULL(INDEX_NM_CHANNEL)
 #define BIT_NM_DIMM	BIT_ULL(INDEX_NM_DIMM)
 #define BIT_NM_CS	BIT_ULL(INDEX_NM_CS)
+#define BIT_NM_SUBCH	BIT_ULL(INDEX_NM_SUBCH)
 
 struct decoded_addr {
 	struct mce *mce;
@@ -242,6 +246,7 @@ struct decoded_addr {
 	int	chanways;
 	int	dimm;
 	int	cs;
+	int	subch;
 	int	rank;
 	int	channel_rank;
 	u64	rank_address;
-- 
2.43.0

