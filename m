Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEEC37AA77;
	Thu, 30 Jul 2026 02:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379738; cv=none; b=GrrX9VrKRS2OHR3PFMJ0aDd9hibRF1/4lRrfvOqBHNtleA2oIkROfvgZ5wbMM3tBlqYBMBx+/Ho5WJET+P9yCCXxVoHPD7Qiupq5/s5hhMVPa65nPy5vid6QLWNmB1FkI+6BMh4WEH3Kf5WT24/EUW+MFX6E3kMZAiAFb8vaZV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379738; c=relaxed/simple;
	bh=IAyYrRSOokTe7F04Jw0T250P62ppYWqJkiiFW89rLAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMKUaOtt8YegzZJDuzDj/QLfrm/rcrKbIhQWD0dB/SuKjKRdVKmE6YAup3uulUezoss1eZEFs/a4fmSy/rvNM7XF8bqbUpndRezNUmd0T3lXLyjdD7vy+cms//V+ChXiLhfiHzvAdRB21HK+FZRLo0iB/80Qqq64rexO19d1nFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkC+z4lY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkC+z4lY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785379736; x=1816915736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IAyYrRSOokTe7F04Jw0T250P62ppYWqJkiiFW89rLAo=;
  b=ZkC+z4lYWNeDfQ1VyXRxDYd3AgRddP5zzX1IQg/a4tuSS5CO7rGQrNYs
   UY9mK8qeoAxWqmjeGslS4DIf2QXfKCIpogRKe4d0WX8Fwkmk65u7uR+2L
   CMp3bE4NkRl/t5Z8/RqNHs6/MXxcGLkPFgLY1re4Ngrk6m/DJI8i7clqW
   fsS7yk1735oK2Vy8ie3hzgL18LTqTdkr+1S2K7NVG3EhVN0auWRb/em0I
   r/mlmfqzs4OiYWg30oEHyK9ROh0d7tXBkfKa3YfbLx/WV2RcjNbTggHcS
   pUMgAGz9OAj0IaV9IxD8iVI7xZCYUByureC3Joid4yDpwoPgziF19p52d
   g==;
X-CSE-ConnectionGUID: 6R/eUN+SQ2a9geOZZ4friw==
X-CSE-MsgGUID: GtJRy2xNQ8KLXFG5wXrlZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89674293"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="89674293"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:48:56 -0700
X-CSE-ConnectionGUID: xtPSB4RpSc2UKAkvGkxwoA==
X-CSE-MsgGUID: Q3c3acBSSVePW0V0TahxKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256240705"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:48:54 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: qiuxu.zhuo@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [PATCH v2 02/10] EDAC/igen6: Fix interleave boundary condition
Date: Thu, 30 Jul 2026 10:42:30 +0800
Message-ID: <20260730024238.4096623-3-qiuxu.zhuo@intel.com>
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

