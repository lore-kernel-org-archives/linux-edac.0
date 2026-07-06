Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66351A3029;
	Mon,  6 Jul 2026 03:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308476; cv=none; b=GO2E/+5X9vdBVR9hm8MGLetIxJ91xMiiadxDZiDAhK6BgYdS5CNthL3TeujBYgKVL9j9A6KD0hBZxGCdza6wrSA14zj2+o6dQxZuQ5Tmlx4JOGME92pClhkECpL7+B551qSvDSzOsHd7qEuLwQCz7Y9SBRUA0qLd2xp6jJm78D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308476; c=relaxed/simple;
	bh=JJipb8+EYuRMsqTZSrfLXMo3N2+oerrEUblWeIl33A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AHh8BrAOrrt8UqktbCADfKgx4TC7fu5StnDkSg3B5wbr1iQvdb3FqykgGcd4scAHB7xFSI35ZbFWlOYs45Dj6zonnRhttAD4Gi3uotpaT82nUi8y3wScvRePh5s8Ckt+s3LiSXSbLDgAHNAu7bExa5zVUjS93ROk6QCqo9rpulU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTKaAT4w; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTKaAT4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783308475; x=1814844475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JJipb8+EYuRMsqTZSrfLXMo3N2+oerrEUblWeIl33A0=;
  b=MTKaAT4wW8DPIOxWWvxF/Cek/V6UZ/0D/s7BtfLNJHU5S0Xdlj6SIRoj
   fMWtVW9czqH+nzO1jLrfpOrWabAGLtOq2KiWdwE41IuhQovLC17SrtLfK
   +ioNLPzMB/WJ3vKwpQEQWpNBK6WKU5RziyWOrlFI4cSKTit0xWluPnmPo
   pNUDMZDyCc2Rbzrfl/GgjKoGwPeQNUV0SYQYIeUIdYe+3jv/zGe7WHxxj
   kjp94DJL0P9qdKWFHjg/ve51Oz0cG78KaaEyDr8rjlNpHmyCBms/t2PVy
   dmQ11lpBEIueLTr98j0zQzVasxJFNwmjww4v+N4pQgHUXU7kECb8Ea2L6
   g==;
X-CSE-ConnectionGUID: dx6TO0idTG20pEKobXaRhg==
X-CSE-MsgGUID: KNFpBSiuSAeJRFNqzWR2CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="71456382"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="71456382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:27:55 -0700
X-CSE-ConnectionGUID: T/4ca8N2TJC6pcOMwkhsRA==
X-CSE-MsgGUID: 288JI+glT/2eBBeRG75efQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258487885"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:27:54 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] EDAC/igen6: Fix channel selection hash
Date: Mon,  6 Jul 2026 11:22:26 +0800
Message-ID: <20260706032233.3283297-4-qiuxu.zhuo@intel.com>
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

In channel selection hash mode, the hardware decoding logic always
includes the channel interleave bit in XOR operations. However, the
hash mask may or may not include this channel interleave bit. When
the mask does include this bit, the current igen6_edac code performs
XOR on the interleave bit twice, effectively ignoring it - which is
incorrect.

Fix this issue by ensuring the hash mask always includes the interleave
bit, so XOR is performed on the interleave bit exactly once.

Fixes: 10590a9d4f23 ("EDAC/igen6: Add EDAC driver for Intel client SoCs using IBECC")
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index 43b56a2eb547..f1fb644154ae 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -1009,14 +1009,22 @@ static void set_dimm_params(struct igen6_imc *imc, int chan)
 
 static int decode_chan_idx(u64 addr, u64 mask, int intlv_bit)
 {
-	u64 hash_addr = addr & mask, hash = 0;
-	u64 intlv = (addr >> intlv_bit) & 1;
+	u64 hash_addr, hash = 0;
 	int i;
 
+	/*
+	 * In hash mode, the @intlv_bit is the lowest selected bit of @addr
+	 * to be XORed. While @mask may or may not include this @intlv_bit,
+	 * we enforce that @mask includes @intlv_bit to ensure @intlv_bit is
+	 * XORed exactly once.
+	 */
+	mask |= 1 << intlv_bit;
+	hash_addr = addr & mask;
+
 	for (i = 6; i < 20; i++)
 		hash ^= (hash_addr >> i) & 1;
 
-	return (int)hash ^ intlv;
+	return (int)hash;
 }
 
 static u64 decode_channel_addr(u64 addr, int intlv_bit)
-- 
2.43.0

