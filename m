Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8A3D561;
	Fri,  3 Apr 2026 05:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775194860; cv=none; b=Q8XM/OY6pFzM8rM8YOanuFLpfvyZJXw+zp4A5U+nhF04QiZIQ/dl6iclR9t3X4AE8dPmYvH+sIFm9mZmDac2pXLasLeWegQwnjXrqGnZZ8zITbv15VKbuC51Xs+sr+nocoNrl2MtqWhfNKYm9YJw+NkwA2gTpzVqmwbJxoKurmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775194860; c=relaxed/simple;
	bh=RkpOupTJJ1qPgLpeNk4LFXOI14dn4d3ncD9K3G9P7Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoafvY0KaG1nz/L7BFm+Yr0Pf78xx61EWRnmNYu4A5MAL3+aUG3nSGNyddsRg1e4CoWHUFK/2L8dzHQ7Jad6JSdW/UTC/Xr78XvTippP49W8q6SkzasSF/R8WQuvtL3/qz03qRQI6bVBEWnaMNdhdsQJtUmd0CBme7+n4eeALps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlUECgy8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlUECgy8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775194860; x=1806730860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RkpOupTJJ1qPgLpeNk4LFXOI14dn4d3ncD9K3G9P7Vs=;
  b=PlUECgy8vZ3q1yjdDg/M2RbKw8D0hhM8cNrwYwucChpZmBLszlkFZPnV
   4UkuRUc2ZxR39HX2SIeFECZQZVN/SpaTtTvTYIRYCBqFTF96joJm4tpEP
   v3XOYNyaoJFBj1o0pMt5A5MSxQLw0izrHpDRwxhrWVsDl2FVVEarYA0Qq
   Cacn5mGCMNYrZgjWfGGXGOnJAGbR/NKV7d8B0i32Iapq+KnlbSxjFdBhD
   XHkJQ0e/aW/PSnMYhxv5P9kcCTCzMo4ULWj8E0eNAdLl7s0VvZd4XOJS6
   CAaKCHzVZRb3XUytx0Krt3DHjh3RLBpBVb2rGiqH/jvoRk6MClkJj0yTo
   w==;
X-CSE-ConnectionGUID: J3Cd4yV4QDqIHsbpJodPVQ==
X-CSE-MsgGUID: k0bbE7a+QliNv8RGyGerPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93843318"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93843318"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 22:40:59 -0700
X-CSE-ConnectionGUID: V62PVMdcSjKaIMiypUI1Ww==
X-CSE-MsgGUID: 752fkozRQouNSwSs+I7bhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="232107099"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 22:40:57 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] EDAC/igen6: Fix call trace due to missing release()
Date: Fri,  3 Apr 2026 13:40:27 +0800
Message-ID: <20260403054029.3950383-2-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403054029.3950383-1-qiuxu.zhuo@intel.com>
References: <20260403054029.3950383-1-qiuxu.zhuo@intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unloading the igen6_edac driver, there is a call trace:

  Device '(null)' does not have a release() function, it is broken and must be fixed.
  See Documentation/core-api/kobject.rst.
  WARNING: drivers/base/core.c:2567 at device_release+0x84/0x90, CPU#5: rmmod/127209
  ...
  RIP: 0010:device_release+0x84/0x90
  Call Trace:
   <TASK>
   kobject_put+0x8c/0x220
   put_device+0x17/0x30
   igen6_unregister_mcis+0xa2/0xe0 [igen6_edac]
   igen6_remove+0x82/0xb0 [igen6_edac]
   ...

Fix the call trace by providing empty release() functions for the
memory controller devices.

Fixes: 10590a9d4f23 ("EDAC/igen6: Add EDAC driver for Intel client SoCs using IBECC")
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index fcb8ab44cba5..0bf9cf349d0b 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -1296,6 +1296,11 @@ static bool igen6_imc_absent(void __iomem *window)
 	return readl(window + MAD_INTER_CHANNEL_OFFSET) == ~0;
 }
 
+static void imc_release(struct device *dev)
+{
+	/* Nothing to do, the 'imc' owns the 'dev' and will also release it. */
+}
+
 static int igen6_register_mci(int mc, void __iomem *window, struct pci_dev *pdev)
 {
 	struct edac_mc_layer layers[2];
@@ -1334,6 +1339,7 @@ static int igen6_register_mci(int mc, void __iomem *window, struct pci_dev *pdev
 	mci->pvt_info = &igen6_pvt->imc[mc];
 
 	imc = mci->pvt_info;
+	imc->dev.release = imc_release;
 	device_initialize(&imc->dev);
 	/*
 	 * EDAC core uses mci->pdev(pointer of structure device) as
-- 
2.43.0

