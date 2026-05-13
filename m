Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8771379C2A;
	Wed, 13 May 2026 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705428; cv=none; b=MQyT/qqP5haDg60ybF3q7QEd8mgu7lR9GePq7x/W3eOPY1+RgLrLHuw1FaBvO7tCpHBqynG7uuPFspCmZ/xXt+8hk2ao9Z9vEJ3BKWTTHvLw8WxwgcyEpsO7+o/zXWPxKtaJP300Qlex6U5dm4NNcGNAUXMku0C2+fD5xAyYtBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705428; c=relaxed/simple;
	bh=7iEHe7kWqISx+DD2MOXmwiuxux+wZ/O4QEzKKbc8eCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jx/bkreIp7w9A1K3iLtT0cYfo61I6K+IxQUrFq5Wkg45XxCTcvbG3ZUNTLAfD9Jfi6PaPGZH7u4fEFy3IIqu37vHl72XA9X0WQvjNtC/tyvaSsv9NtXOyCoBWCvW8f5IdVm2LMLviFEyCE4EotV6hAk8Nol9udGljawY30A3838=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzCNPUBF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzCNPUBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778705427; x=1810241427;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7iEHe7kWqISx+DD2MOXmwiuxux+wZ/O4QEzKKbc8eCk=;
  b=UzCNPUBFTyEQUFgWYhlCJY83Zn9HW0ODv9zZj3/SQVRZNi+OprO9bqCP
   sBkeVlXn1bxiXq3vRKpx1ZRT2oSNWN7hOWWLIVWiXkcL9ItnGXXtzcxoF
   XquYXJ5p5lLFJW+itVnDYO8HiwD4NPcDsk+m9ky7cvYK2xLFMaROU683Y
   K5im7x6+RJGaFR1OLrH2O5I6ttvE+HWWGN6RTh5mu1aW2YleEnuDPBB7u
   tEV28qiDyBdSWiz7q9bk8G18QGx6dr5XqFQ2MLOQiQrU41A8HrcOnHCtT
   Yu7jHvAW2KrhkilxhE2wZcHCaHcb0428Nc2OtqM3wABwdr7BwtlQu8PyP
   g==;
X-CSE-ConnectionGUID: tbz+ERbeSDWM7dpnp+a/sA==
X-CSE-MsgGUID: /KYoHxqHTfKIPkyqjycJsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91028386"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="91028386"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:50:26 -0700
X-CSE-ConnectionGUID: CC8hDjmGRv+rrI2ZjSiXUQ==
X-CSE-MsgGUID: pDfGoJHLSZyJt0VsFGzXxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="233918005"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2026 13:50:25 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 856A795; Wed, 13 May 2026 22:50:23 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Subject: [PATCH v2 1/1] RAS/AMD/ATL: Drop malformed default N from Kconfig
Date: Wed, 13 May 2026 22:48:55 +0200
Message-ID: <20260513205021.368190-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The capital letters are for symbols and N in 'default N' will be evaluated
as another, nonexistent, Kconfig symbol, and not as the 'no' it should be.
The most important is that the 'n' *is* default 'default' already. Hence
just drop the malformed line.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: rephrased the commit message to mention 'N' vs. 'n' (Boris)
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

