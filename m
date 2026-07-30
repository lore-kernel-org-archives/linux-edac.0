Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D5337C0E6;
	Thu, 30 Jul 2026 02:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379765; cv=none; b=F3c8OcOpf3RHuZodh/fF0Mo+A+axCtntZ+N0Gk9PGGHTU8ReW8qBm/W+7QeXy8IZZNR8EQzpwD0/R7/K/rbYXf20iEsLD3Fsds2n4a6QxmIneZCrA8yzhBmg6/Cbf5Hu+rxBb81920kxE7XJVBu837LCM2Um8e160moel7pKIxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379765; c=relaxed/simple;
	bh=dEVofgSTMOAEkDocpecWMWfpldLep9PcMlzST5o7i/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfDSQMdojUCBZ8/FAYYiSq6hhc8slADVFq8kPxlZzTMEfcM8KM5G5RUavFCS/GCDxdTTjq61Zc4fjIP9f9X8wvsN3g7vPI2resK8XN8hs2GDL3fc+I9WFkRNAqJocAhAWxVWWYGjrtJYiISLdnSJHxBfYz/WinCYhwUq3WeHvfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpvdddJE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpvdddJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785379764; x=1816915764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dEVofgSTMOAEkDocpecWMWfpldLep9PcMlzST5o7i/U=;
  b=QpvdddJEboTD6sZipZXkwmeCZvl8Rm1jK208oNcTPC1PwL3r6bvpsgLm
   Ah0F8rOeT57j9J+9hGG8RK27a3Miw631tKmPBMQuoR9clexvs3AmaC1p+
   d90Q/C2bodUPSow9SsIv/VDe28KkOgIMxje66mlOCnBM8QLreGOKuRd92
   dqv/2H2jEw7r1seVGq7Uz3wxHPBezHQGNA5zVkEaxMlKoSfyHHThbRR2V
   MdMsp9i1+NNCkCtd7e8UoZXpVzh5dJxE3lS21r8I5CtZrmwxoDpPGkKxL
   4GI+8dgHwAGQRVaXJ9Q+dMRcERHWa0YC7mJdqXYEMB5R2yQRpBap2GoDx
   Q==;
X-CSE-ConnectionGUID: tsrmb+O0RCuKNwxXgrwxAw==
X-CSE-MsgGUID: 1cO90DllStalLJzMUxYUEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89674319"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="89674319"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:23 -0700
X-CSE-ConnectionGUID: D+LUF6XmQF+5oRda/0wHwg==
X-CSE-MsgGUID: 1HF48ldsQW+G49Jrqc8imw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256240737"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:21 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: qiuxu.zhuo@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [PATCH v2 04/10] EDAC/igen6: Fix channel address decode for non-hash mode
Date: Thu, 30 Jul 2026 10:42:32 +0800
Message-ID: <20260730024238.4096623-5-qiuxu.zhuo@intel.com>
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

In non-hash mode, decode_channel_addr() and channel index extraction
used a hardcoded interleave bit position 6 instead of the actual
intlv_bit parameter, causing incorrect channel address decoding.

Fix this by using intlv_bit consistently in both hash and non-hash modes.

Fixes: 10590a9d4f23 ("EDAC/igen6: Add EDAC driver for Intel client SoCs using IBECC")
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index f1fb644154ae..ea5628d780eb 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -1049,13 +1049,12 @@ static void decode_addr(u64 addr, u32 hash, u64 s_size, int l_map,
 		return;
 	}
 
-	if (CHANNEL_HASH_MODE(hash)) {
-		*sub_addr = decode_channel_addr(addr, intlv_bit);
+	*sub_addr = decode_channel_addr(addr, intlv_bit);
+
+	if (CHANNEL_HASH_MODE(hash))
 		*idx = decode_chan_idx(addr, CHANNEL_HASH_MASK(hash), intlv_bit);
-	} else {
-		*sub_addr = decode_channel_addr(addr, 6);
-		*idx = GET_BITFIELD(addr, 6, 6);
-	}
+	else
+		*idx = GET_BITFIELD(addr, intlv_bit, intlv_bit);
 }
 
 static int igen6_decode(struct decoded_addr *res)
-- 
2.43.0

