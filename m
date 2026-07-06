Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3533ADB92;
	Mon,  6 Jul 2026 03:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308489; cv=none; b=pGM2hUUi1LOeHgJ/GyPbZahXxJdcUQbv/PrbALgHQC8XHL1x1uiI1xDKVMAI9kk/+SIu/Q4mZwk38BF3xXZRXVeZc07M+mX9HcLA0nriFRznGx5Bc5cH3ejHpe7CHY0IK7WjUHJUdBL1whcdprhMKx9reS3nWGQdlI07FrA82Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308489; c=relaxed/simple;
	bh=KDItziufT4P5TQRpMrJwhhqGG3SlhPZrUTb6saXdeYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJAx1pBRUtdNq8CPpVSlSgcr04PQdx8FVDpnWqiyiVTtuAM2DfFdf3/gfqM3my7O5BPzJfFNNZbfqnoi/+sZzRiJGnGHkcEztkhEej6JX+AtTbAipbFmh5ndAe12zeb5BzP0c7fHBJMgELBMJnLYHVfNwt3wwb9NvVaAyia4iPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GW0NIVEI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GW0NIVEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783308488; x=1814844488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KDItziufT4P5TQRpMrJwhhqGG3SlhPZrUTb6saXdeYs=;
  b=GW0NIVEIjHhE3zetoqI7DBaFqD6T4e64Ko2qyOVHyjNl9z4eR2Z6Jv74
   f4DOxxRjbZ5ZPxvK6AvmHZZMVzQDoG+ViRpfquxv7cVxf/Gb7+yrgN6NM
   FM6Q1hCHzQzEzQIuKY2UEkHHQoJBHst2EO/xRKcxzLZYL4ifSgdxBHgaf
   f1dbmu/X+9bfnwUJKKid0Kcr3zaxrqVaVJrtH0Zb8NfNK2/cfnhw5Hohx
   avsbgSkU88NkYYLgHGpB7vkvbb6Dmd3TjSbmlpfAw0X0jKdbxGSKOQoLt
   suMqnd+fgmilU7NIf3MRhkvC75ehG8ZOMu3B215tpCNIvXQYHbJNFd28Z
   Q==;
X-CSE-ConnectionGUID: TFP71w5mR3iyVilrjodgnw==
X-CSE-MsgGUID: Nq/M83PzTeu1RMaEDmJOSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="71456415"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="71456415"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:28:08 -0700
X-CSE-ConnectionGUID: a/L2zF6mTqupV9C4UL4vhA==
X-CSE-MsgGUID: wbbBZqk7RFCWaePXaWnLCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258487911"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:28:07 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] EDAC/igen6: Remove unnecessary XOR on the zero-valued interleave bit
Date: Mon,  6 Jul 2026 11:22:29 +0800
Message-ID: <20260706032233.3283297-7-qiuxu.zhuo@intel.com>
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

When reconstructing the removed interleave bit from an inflated memory
slice address, where a zero was inserted at the interleave bit position,
it's unnecessary to XOR this zero-valued interleave bit.

Remove this unnecessary XOR operation. No functional changes intended.

Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index 12d718a50e1c..71ed50daeb19 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -448,16 +448,16 @@ static u64 mem_addr_to_sys_addr(u64 maddr)
 	return maddr;
 }
 
-static u64 mem_slice_hash(u64 addr, u64 mask, u64 hash_init, int intlv_bit)
+static u64 mem_slice_hash(u64 addr, u64 mask, u64 hash_init)
 {
+	/* The interleave bit in @addr is a zero. */
 	u64 hash_addr = addr & mask, hash = hash_init;
-	u64 intlv = (addr >> intlv_bit) & 1;
 	int i;
 
 	for (i = 6; i < 20; i++)
 		hash ^= (hash_addr >> i) & 1;
 
-	return hash ^ intlv;
+	return hash;
 }
 
 static u64 tgl_err_addr_to_mem_addr(u64 eaddr, int mc)
@@ -478,7 +478,7 @@ static u64 tgl_err_addr_to_mem_addr(u64 eaddr, int mc)
 	maddr = GET_BITFIELD(eaddr, intlv_bit, 63) << (intlv_bit + 1) |
 		GET_BITFIELD(eaddr, 0, intlv_bit - 1);
 
-	hash = mem_slice_hash(maddr, mask, mc, intlv_bit);
+	hash = mem_slice_hash(maddr, mask, mc);
 
 	return maddr | (hash << intlv_bit);
 }
-- 
2.43.0

