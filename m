Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75A41A3029;
	Mon,  6 Jul 2026 03:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308472; cv=none; b=TUy/b5WQm8AgKH4s2bcPJdn5WOoB0gbyPMdo0F8WjeNGOooTW4M/16trK8QW8HpLcM/4q2koLgqAR9ml9pwXz9VesVOFCCfzzLBI5ghvO5y2M7+al0WkiLo7q4n4/+FCNsgCysOU57T48xCqwzaw/JhNaCwwvEsvsOo4xyFbPls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308472; c=relaxed/simple;
	bh=IAyYrRSOokTe7F04Jw0T250P62ppYWqJkiiFW89rLAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AIkBp6r1OnDWwjTEIuhr1MA64OgwtHr5A8W4TGFUpabik47hRI+e0m5QtnB6FvXPsH5eUssYtroEi6cY419l9XX122gLlNLc+92nBAK51u2/QHipwbBV+qj4m21kJGYiZOThT1nHINit7SCdVvlj5VY+QvV7eYa/2k7Zd8YldoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMlqm7aW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMlqm7aW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783308470; x=1814844470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IAyYrRSOokTe7F04Jw0T250P62ppYWqJkiiFW89rLAo=;
  b=XMlqm7aWAbHHKb/AR23ORKngM7o0j8Nakwa2CbRPiiNF/er/jyly0YGx
   QXxpPQrW8QKkuoM3I9QoJHrzxllLUIomumWj/Uy64dZH1pdbx/Ab8ucHW
   OQHzwJiAiLcL7bMLC9eprdcgLxPSmaohes/fK7Y3InHkr8WbvY+kW0CLX
   +rrCSmI2Z9n77yUQv6Hp9ZmAMgVEJdAvwPY8v/27gttbRzo68LBIz6mky
   GHsr/CRkADvXRV72qyBViOUjNz/6ol+QWidVfXBNEYbv/1uDgCN+YErBf
   XHxwKs8MiR8Fm2t69N1Ucovsr8err0xpM/c641JZ9GIwlojD5gHEIeKwV
   w==;
X-CSE-ConnectionGUID: 25gKPm0qRK2lmOYywKX54Q==
X-CSE-MsgGUID: McoyjESVTQyi3EmEGeG7vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="71456377"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="71456377"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:27:50 -0700
X-CSE-ConnectionGUID: RUPMiLvZT7mZDVYKjduWPw==
X-CSE-MsgGUID: mSbZPyhlSP2gCndKu8XI9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258487877"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:27:49 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] EDAC/igen6: Fix interleave boundary condition
Date: Mon,  6 Jul 2026 11:22:25 +0800
Message-ID: <20260706032233.3283297-3-qiuxu.zhuo@intel.com>
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

The address translation logic splits the memory space into interleaved
and non-interleaved regions using a boundary at 2 * s_size.

The current check uses '>' and incorrectly classifies the boundary
address (2 * s_size) as part of the interleaved region. This leads to
incorrect channel/sub-channel selection at the region boundary.

Fix the classification by using '>=' so that the boundary address is
handled in the non-interleaved region, matching the hardware layout.

Fixes: 10590a9d4f23 ("EDAC/igen6: Add EDAC driver for Intel client SoCs using IBECC")
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index f1fc20d4ebf6..43b56a2eb547 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -1035,7 +1035,7 @@ static void decode_addr(u64 addr, u32 hash, u64 s_size, int l_map,
 {
 	int intlv_bit = CHANNEL_HASH_LSB_MASK_BIT(hash) + 6;
 
-	if (addr > 2 * s_size) {
+	if (addr >= 2 * s_size) {
 		*sub_addr = addr - s_size;
 		*idx = l_map;
 		return;
-- 
2.43.0

