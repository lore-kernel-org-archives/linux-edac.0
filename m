Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894FE4BC035;
	Wed, 13 May 2026 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689387; cv=none; b=XuZ0spnMfszAp/qf0FQ8IvzTFBj7KXTEKrremNsQ9xwejXLRHX94rU2iEva24h8Cc/iIMe97OPBoFXs6zWnhOqY5uP1Dy9JmpJrcJy0Ymb3GzEdrUgB1cln4P2SnvAfRzepwI7JoJ/HACFfnFNZsx6G4fZIbpBARD25lYrmyfQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689387; c=relaxed/simple;
	bh=Ax6R7IbTOvfCcKK2S7kyNguRiEnnrGw99+InD3kpp3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hhCuQ1uPUYV7k6W0nfVY5aIm6C9cUGh4tk8MoIqv3ZqR3adtJQmY+PmJ+tR8vVxiRBd0G/ys76x3ZtcPlAJRU1aGUEALS7cnLEyyeN9gQWeIEG7tL3dUV0RRocdd7TtQtAvJ63jUN/J6RfuwXGVQUE88zNKLLq9Fp5LCyeHWaJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dm2Fvsaw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dm2Fvsaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778689384; x=1810225384;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ax6R7IbTOvfCcKK2S7kyNguRiEnnrGw99+InD3kpp3E=;
  b=dm2FvsawHt8Rd/XWNPKG/ouaxkL+0UYMIPv412LZhZ+58IgUkDZ0uq3Y
   Li0iCNlJjcEAPSk92q/Sho3HBK4e3dO7TkRtSQaSyaU/zJYCZt+lSpLKZ
   va2Y2x33WS1a6g6B8WS/+uS2bvbtm/yInWdn6y6N0sLzMmS6Aijbax22x
   Cr496d2pGOuzIHXuH3u6UI1/QaX6KsmoTN6YvdxfQWhzZCXqcEVd4Woie
   Zpu+cTTs2vKXzLKVc92flSnMLWE0ykiJINAx0k0Ur42EZheaxEVqQhtkb
   9uOG8P7HB8gpknSzFzc5kW5jaHqKpZyvFXKXcyRSQueFi95NqJN9XfTe3
   A==;
X-CSE-ConnectionGUID: xceksqEgQXi46+45ZhPTAw==
X-CSE-MsgGUID: G2xFMrsQQv2w4GnJaPx4DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79518264"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79518264"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:23:02 -0700
X-CSE-ConnectionGUID: GKkFo6+LRWmxxV9/S3zT7w==
X-CSE-MsgGUID: CcgpGSZnSUOgUXAgRsxRqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="261633702"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 13 May 2026 09:23:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BF70C95; Wed, 13 May 2026 18:22:59 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Subject: [PATCH v1 1/1] RAS/AMD/ATL: Drop malformed default N from Kconfig
Date: Wed, 13 May 2026 18:22:53 +0200
Message-ID: <20260513162253.365343-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First of all, it has to be 'default n' (small letter n), otherwise
it looks for CONFIG_N which is absent and in case of appearance
will enable something unrelated. Second and most important is that
'default n' *is* default 'default' already. Hence just drop malformed
line.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/ras/amd/atl/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ras/amd/atl/Kconfig b/drivers/ras/amd/atl/Kconfig
index 6e03942cd7da..44c2fd7febc5 100644
--- a/drivers/ras/amd/atl/Kconfig
+++ b/drivers/ras/amd/atl/Kconfig
@@ -12,7 +12,6 @@ config AMD_ATL
 	depends on AMD_NB && X86_64 && RAS
 	depends on AMD_NODE
 	depends on MEMORY_FAILURE
-	default N
 	help
 	  This library includes support for implementation-specific
 	  address translation procedures needed for various error
-- 
2.50.1

