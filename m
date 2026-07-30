Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E65374E5A;
	Thu, 30 Jul 2026 02:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379786; cv=none; b=LkPE0sx6Piw5vbFQHmUq5iu5tvtY4bTCiMO1DW8WG9ijSVqkqRzINDMG30FlMJ0f+WI8sbWt35a2fWXbF1uTuMMsigTfojjyHEBPkhmDi7q5wuNXFhkoTpNa0u3EQwAfnsGx9nFCzkuknJ7rcTpysDxPx3MoRbljlIgr3gqpces=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379786; c=relaxed/simple;
	bh=mWeeQNjv3efALXuaGZZObxG5+h2gaMNBrLYT9Crfdxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXMQBtJQ3gSZ1rcEEndVEEXAyl2LnM7bDsuPTQR9UT4LApvBJy/GBz/EYVWrFv2frCiAkJG2OxJUQIZGGcurX7mU0y2E73CZvE7rlphnClJM0h91J3kMhzYAgEf+uATBTu0RtE96GrkJenDFkUDpfqyuKhn0qU6sbQ8r4gN12cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nnam5Kwy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nnam5Kwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785379785; x=1816915785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mWeeQNjv3efALXuaGZZObxG5+h2gaMNBrLYT9Crfdxg=;
  b=Nnam5KwyRhEPNSG+YnL+EWjt1zek8O6ZOfcZFg5oIdDUPIRtXKWv+vty
   TOL65L06CDa7SeCX+3Kr1bChafon08XXYAei5cIevuoaXzlKR9IQ7mErG
   C166K4aGfzBBAqNH2qbK+P8BiwYiYERPUzsBBs66UX2XG5L6OvIwbclnq
   cm/HEsVtWLZu868ztyVgRAUevsUDw8qveMugF8DjCrM7VOSpYs/lWobvW
   RSMBmBcFAe8m1SX0+u5IaELMRChvUthOlUenZsK+Tp7p3Pe19NHyULYcL
   sekoCeYrqRtMe7omMScBOtUWP4hwdEfSqcF1L9cIrtDhSkidVVS1tLy2a
   g==;
X-CSE-ConnectionGUID: eu8uOwO7REmmX9bg2heQRw==
X-CSE-MsgGUID: lsPr4pfXTmazKipXAC+PTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103398249"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="103398249"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:44 -0700
X-CSE-ConnectionGUID: NbXxNyNCSJ+IbERbPFzP5w==
X-CSE-MsgGUID: ujC9gRxWShyEY8ZxmQKf8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256240781"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:42 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: qiuxu.zhuo@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [PATCH v2 07/10] EDAC/igen6: Simplify compute die ID comments
Date: Thu, 30 Jul 2026 10:42:35 +0800
Message-ID: <20260730024238.4096623-8-qiuxu.zhuo@intel.com>
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

The existing comments repeat information already implied by the code
structure. Shorten them to SoC names only to reduce clutter and
improve readability.

No functional changes intended.

Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index 71ed50daeb19..2960af172c57 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -223,7 +223,8 @@ static char ecclog_buf[ECCLOG_POOL_SIZE];
 static struct irq_work ecclog_irq_work;
 static struct work_struct ecclog_work;
 
-/* Compute die IDs for Elkhart Lake with IBECC */
+/* SoC compute die IDs with IBECC capability. */
+/* Elkhart Lake */
 #define DID_EHL_SKU5	0x4514
 #define DID_EHL_SKU6	0x4528
 #define DID_EHL_SKU7	0x452a
@@ -236,22 +237,22 @@ static struct work_struct ecclog_work;
 #define DID_EHL_SKU14	0x4534
 #define DID_EHL_SKU15	0x4536
 
-/* Compute die IDs for ICL-NNPI with IBECC */
+/* ICL-NNPI */
 #define DID_ICL_SKU8	0x4581
 #define DID_ICL_SKU10	0x4585
 #define DID_ICL_SKU11	0x4589
 #define DID_ICL_SKU12	0x458d
 
-/* Compute die IDs for Tiger Lake with IBECC */
+/* Tiger Lake */
 #define DID_TGL_SKU	0x9a14
 
-/* Compute die IDs for Alder Lake with IBECC */
+/* Alder Lake */
 #define DID_ADL_SKU1	0x4601
 #define DID_ADL_SKU2	0x4602
 #define DID_ADL_SKU3	0x4621
 #define DID_ADL_SKU4	0x4641
 
-/* Compute die IDs for Alder Lake-N with IBECC */
+/* Alder Lake-N */
 #define DID_ADL_N_SKU1	0x4614
 #define DID_ADL_N_SKU2	0x4617
 #define DID_ADL_N_SKU3	0x461b
@@ -265,38 +266,38 @@ static struct work_struct ecclog_work;
 #define DID_ADL_N_SKU11	0x467c
 #define DID_ADL_N_SKU12	0x4632
 
-/* Compute die IDs for Arizona Beach with IBECC */
+/* Arizona Beach */
 #define DID_AZB_SKU1	0x4676
 
-/* Compute did IDs for Amston Lake with IBECC */
+/* Amston Lake */
 #define DID_ASL_SKU1	0x464a
 #define DID_ASL_SKU2	0x4646
 #define DID_ASL_SKU3	0x4652
 
-/* Compute die IDs for Raptor Lake-P with IBECC */
+/* Raptor Lake-P */
 #define DID_RPL_P_SKU1	0xa706
 #define DID_RPL_P_SKU2	0xa707
 #define DID_RPL_P_SKU3	0xa708
 #define DID_RPL_P_SKU4	0xa716
 #define DID_RPL_P_SKU5	0xa718
 
-/* Compute die IDs for Meteor Lake-PS with IBECC */
+/* Meteor Lake-PS */
 #define DID_MTL_PS_SKU1	0x7d21
 #define DID_MTL_PS_SKU2	0x7d22
 #define DID_MTL_PS_SKU3	0x7d23
 #define DID_MTL_PS_SKU4	0x7d24
 
-/* Compute die IDs for Meteor Lake-P with IBECC */
+/* Meteor Lake-P */
 #define DID_MTL_P_SKU1	0x7d01
 #define DID_MTL_P_SKU2	0x7d02
 #define DID_MTL_P_SKU3	0x7d14
 
-/* Compute die IDs for Arrow Lake-UH with IBECC */
+/* Arrow Lake-UH */
 #define DID_ARL_UH_SKU1	0x7d06
 #define DID_ARL_UH_SKU2	0x7d20
 #define DID_ARL_UH_SKU3	0x7d30
 
-/* Compute die IDs for Panther Lake-H with IBECC */
+/* Panther Lake-H */
 #define DID_PTL_H_SKU1	0xb000
 #define DID_PTL_H_SKU2	0xb001
 #define DID_PTL_H_SKU3	0xb002
@@ -312,10 +313,10 @@ static struct work_struct ecclog_work;
 #define DID_PTL_H_SKU13	0xb02a
 #define DID_PTL_H_SKU14	0xb00a
 
-/* Compute die IDs for Wildcat Lake with IBECC */
+/* Wildcat Lake */
 #define DID_WCL_SKU1	0xfd00
 
-/* Compute die IDs for Nova Lake-H/HX with IBECC */
+/* Nova Lake-H/HX */
 #define DID_NVL_H_SKU1	0xd701
 #define DID_NVL_H_SKU2	0xd702
 #define DID_NVL_H_SKU3	0xd704
-- 
2.43.0

