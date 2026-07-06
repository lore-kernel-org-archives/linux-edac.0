Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C962FBDE0;
	Mon,  6 Jul 2026 03:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308481; cv=none; b=J8XlyxSF/a/1rovpl0dWTSGRAKGrCTZlEsRyP1wM/U4VNvmvqoOfitQLU4J22GXLUPo14wi5D4URA0tS8jV48V62q8CCkrvPmat+yTTEUcQhZGvoMGDZHBLF3BQqckUggHTLYFN7EFuDB4rSc2vcf23a+r+CFqA3VVnPuA/fSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308481; c=relaxed/simple;
	bh=dEVofgSTMOAEkDocpecWMWfpldLep9PcMlzST5o7i/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hAkxyVeFVRUdTakVIlu2O14rOajY5IQolzDV9SaSoMEBa1te/p9YvtZP0bmuf4lfEIwMYy77WZuOuLF/vBER4YJ/M569Ldc7VkaARfJcXTtVQ0sypYoGSIHocg9+5DJH7JXtcECGV/Acesox1iKLEdPk8hYBMVDJu4jkW8cCmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsqzEurd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsqzEurd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783308480; x=1814844480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dEVofgSTMOAEkDocpecWMWfpldLep9PcMlzST5o7i/U=;
  b=DsqzEurdiPR9cjk7w71RSVKgWsL+D4ydWd9RzExpbp2WwvPdUGWEZv2d
   6bvca5USOw52zKNJTCLeGB4r3pd2w7f6vRzEZVS1FZdSekLtFHHuci76F
   dDsdkKph062CQ29IMHmldSi3M14zGOQLHo+w0o6zyGZWrUmyfd6su3BhD
   QJhCdnF/E84mKcns3flrqrOUrmsmzxCgBzp0akQMdW34vTHFiQ+Ov31HU
   fygYmebrfvuP15d2afKMm0BmnJ3KdjNCF6/YCA7iqjRZc5c32iIvIq2oy
   8fvrMmt83KUWx1SUqDB/qFN1pHgJMj8bKh60BMb7OnByVG0ncbHM3aFb4
   g==;
X-CSE-ConnectionGUID: YOVcxMijSfKjKR7x04cyvg==
X-CSE-MsgGUID: h1dJzD2qRF6nrHwhtpz07w==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="71456397"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="71456397"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:28:00 -0700
X-CSE-ConnectionGUID: gnTmModJR2aHfITc3pDKNw==
X-CSE-MsgGUID: /wFU/O32SvOnQ4qt8EbwDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258487894"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:27:58 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] EDAC/igen6: Fix channel address decode for non-hash mode
Date: Mon,  6 Jul 2026 11:22:27 +0800
Message-ID: <20260706032233.3283297-5-qiuxu.zhuo@intel.com>
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

