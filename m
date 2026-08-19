Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA453C09EB;
	Wed, 19 Aug 2026 02:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787108320; cv=none; b=Gp+9x2DOboEJSPcvxCjUiBIl7Xj+9Fs4VTDLmlqlAcQDorYYm9z7u7D0nFOZGGVShhLpXWUQ+lMO6eJGw5vbYMeEYK7UbhVUWg8peLAOMD3ZhlS5bWVdeK0AtYG2Xh9LOKaXM9roONd8DJ+zK20cylkWhi+ISocgRzlHI/7+9qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787108320; c=relaxed/simple;
	bh=nyBe/liy45F2ttemOBxMKwErxxruP3Q1LGTTgI3V7bI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dt4eAl84DNLXvV5bTTzhNnRhCbSFRwqinrlNznidCJ2eO0eOPzXLqHxYWdZjANb0BH7ObdDLXU1GnGlMNbekzD4zh2Wof+WBc9YGDk5FyQ+kp9TopWLeG6pozbaxpthzA+m8Mq3Qifxu2RT/mgKS9yBE6EtzREpoaG39woRaHmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsmIBzFW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsmIBzFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787108303; x=1818644303;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nyBe/liy45F2ttemOBxMKwErxxruP3Q1LGTTgI3V7bI=;
  b=RsmIBzFWI5SqC5zdCTaMMlqkedOT+IvUtb/UNmFNpmoWlemNnZ9W7BWN
   9QgwqNdCMVyCr7RDXNyht4cwzXCBkWtn6Rqn/jPBHWuh/mWTSPtGYRX9d
   G+/P56WrXF0mTDbSbeulEs0XPkLY1PEcA8DiWYSfoUSVJZzBjuo84LIOG
   Z/uf70FVMccT8LyhuDBPmXhTkidaqFGeMesq6W7cfzbOPwV5esjDpOnz6
   p2+ky1xgA+5lbgEV/cJlP58RHYSGmAW+vjFHfkZbGSSDpTVZD0Hxc+j5R
   US/zA+sma4xB/nCpEJ9S/Fo12uTE9bckagWFwnP0x5MTnBBbJfc4oDbPB
   A==;
X-CSE-ConnectionGUID: rlGO+6b0Tpie/TjfTrr10A==
X-CSE-MsgGUID: U8MAdWt7RsiPrAM2C/Pa8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87466815"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87466815"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 19:58:19 -0700
X-CSE-ConnectionGUID: 6aEPjdSAQ9OJGg9Jfqau2A==
X-CSE-MsgGUID: FE9onfWxSxacGdYRLjP9/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269248168"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 19:58:16 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yanhua Wu <yanhua1.wu@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	Ehab Ababneh <ehab.ababneh@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] EDAC/i10nm: Fix Granite Rapids ADXL MC mapping
Date: Wed, 19 Aug 2026 10:52:59 +0800
Message-ID: <20260819025259.266201-1-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ADXL reports memory errors using memory-controller physical indices,
while the EDAC driver identifies memory controllers using logical
indices. On Granite Rapids systems, BIOS may disable some memory
controllers, causing the physical and logical indices to differ.

As a result, ADXL memory errors may be associated with the wrong memory
controller, preventing EDAC from reporting errors for some DIMMs.

Maintain a physical-to-logical MC mapping so that ADXL memory errors are
decoded correctly regardless of the BIOS memory-controller
configuration.

Fixes: ba987eaaabf9 ("EDAC/i10nm: Add Intel Granite Rapids server support")
Reported-by: Yanhua Wu <yanhua1.wu@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/i10nm_base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index fa1853f252b0..f3f8e4e00148 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -479,6 +479,7 @@ static struct pci_dev *get_gnr_mdev(struct skx_dev *d, int logical_idx, int *phy
 		if (mdev) {
 			if (logical == logical_idx) {
 				*physical_idx = i;
+				skx_set_mc_mapping(d, i, logical_idx);
 				return mdev;
 			}
 

base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.43.0

