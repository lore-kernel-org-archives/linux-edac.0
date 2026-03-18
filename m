Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D526221F39;
	Wed, 18 Mar 2026 02:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773801301; cv=none; b=Mnlz/SPR8fVSODCaznra6HA4jiE2J9UIdWtko3oMADJAfhWxHC+ne+QGMqcs3AKZob1TyZcm4Iyp6hiJWPiUy0vlecJUYHZOZJG2KzQA7YmSytZ+D73xgszGCgIfpPm6jv4USWNQfLYoYs33m5cfxDUovjK7ZlOk0IZCEMbXSvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773801301; c=relaxed/simple;
	bh=ETETJXgoi8nngzq5Y5B90SE23/GX4Ww+sWyitgARK4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AtH5al/OINu94erQeG8BdRVhKsQFp/0AZuhObyfNLw5S4rmWBxbsyYz+xzY/uy2IOoE740JAg8ZeEAdlVOoLT6ieah/DbUEn3ky/2sXYhDa/lBz1yK9Amg041T4FhSw9CysYt52F72jXpuqG4Fa1CBdRtksgEGv1SEf/aLgo0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOhU1J/2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOhU1J/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773801300; x=1805337300;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ETETJXgoi8nngzq5Y5B90SE23/GX4Ww+sWyitgARK4s=;
  b=AOhU1J/2IwbWQ7cKFgBvnnU0pAoVR/ppGSD4EqM2MJqYuzKVHPwjY9zc
   kP+0BTI2ifl+wpwpYuWRAgA0CbeSKDCyBV0eSV5oTlvbLweRWpwCcdiQC
   4C6wOQA+9Xu3UxzWfdbeEBhZkqq9QPQf8j73eZzLGltabaonEsSrowz3U
   ODq5xNqkWJcVApC7z3rTbycLneLcG/Vkv2Ie4RWobtbbyPhuGrCia3byU
   1bJpK0iSBF1IrUP5tkCTbcOwQuSvYXooE2ue6Sr9//PZZ69exUHDBMh9h
   Navirg/t3mw75wrLEUcckXhWJXM1yQhgezN4miXs3GlhyY+JTQXcKiAY8
   g==;
X-CSE-ConnectionGUID: uU7sEPeFSsOHi5rJah5VaQ==
X-CSE-MsgGUID: +EkGVwQEQLSaAQDD0G6GFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74968609"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74968609"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 19:34:59 -0700
X-CSE-ConnectionGUID: ZohaJQNRTAesEDbBT/YMJQ==
X-CSE-MsgGUID: IN1jdiw4RcOPAa/kOZdM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="216729368"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 19:34:58 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Shawn Fan <shawn.fan@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] EDAC/i10nm: Add driver decoder for Granite Rapids server
Date: Wed, 18 Mar 2026 10:31:18 +0800
Message-ID: <20260318023118.2704139-1-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current i10nm_edac only supports the firmware decoder (ACPI DSM methods)
for Granite Rapids servers. Add the driver decoder, which directly
extracts error information from the IMC MC error codes, to improve
decoding performance for Granite Rapids.

Tested-by: Shawn Fan <shawn.fan@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/i10nm_base.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index 89b3e8cc38b1..6f61b7614230 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -580,6 +580,10 @@ static bool i10nm_mc_decode_available(struct mce *mce)
 		if (bank < 13 || bank > 20)
 			return false;
 		break;
+	case GNR:
+		if (bank < 13 || bank > 24)
+			return false;
+		break;
 	default:
 		return false;
 	}
@@ -637,6 +641,16 @@ static bool i10nm_mc_decode(struct decoded_addr *res)
 		res->rank         = GET_BITFIELD(m->misc, 57, 57);
 		res->dimm         = GET_BITFIELD(m->misc, 58, 58);
 		break;
+	case GNR:
+		res->imc          = m->bank - 13;
+		res->channel      = 0;
+		res->column       = GET_BITFIELD(m->misc, 9, 18) << 2;
+		res->row          = GET_BITFIELD(m->misc, 19, 36);
+		res->bank_group   = GET_BITFIELD(m->misc, 39, 41);
+		res->bank_address = GET_BITFIELD(m->misc, 37, 38);
+		res->rank         = GET_BITFIELD(m->misc, 55, 56);
+		res->dimm         = GET_BITFIELD(m->misc, 57, 57);
+		break;
 	default:
 		return false;
 	}

base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
-- 
2.43.0

