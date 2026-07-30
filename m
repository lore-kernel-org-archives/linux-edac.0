Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC552344036;
	Thu, 30 Jul 2026 02:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379688; cv=none; b=PDxotXsuOQraIAGrBN0+9QVbT4ivTDPoxIafXTQb02TnSfHAMP5c310ify2+6HAKBa+WkHqWbu14fqDXlqtysAESZ6DWLIuWISFmlh+N7gy8gXtBRDlUJ9tY4RM+JkeqGw/Rl13+IBa2fVm3GEiFkK9UAsoKEbl8gHVIKmno9F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379688; c=relaxed/simple;
	bh=5iICcRRDmW0YafPXPoYfiYSBLtnVlZ78squ8hBPJ2xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJdwFo89K/PLMUlKUHFKCMSRvK7ph4pX+5uT/czXpTBjylgvtt5p90n/YiMZ9hMJAJ7i+/frp32+8xr+EN544D9Mhsjl+PhWcysSNYdY1SckH2S2PVOcyrO3H53fX26HAjl/wj2vFLeAoLV6jjt8h6u0Uw21InzMTRjbt2+M2qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gwhy0Ney; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gwhy0Ney"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785379686; x=1816915686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5iICcRRDmW0YafPXPoYfiYSBLtnVlZ78squ8hBPJ2xc=;
  b=Gwhy0Ney6ROdLM5cR2ZAgpMnzvnHxBZBWeO2fca6GrSp0THKEaoE42VU
   dedQVmdqX2Iw+4ZL4lur07DTi4ac/MWCXQLksT8VaoCNVRS4L3EtFFtnv
   cO2jD95Nl2+cHXiVxnBaOgbXDqWcw/bB+Ee9Lb9Cjb3koSlVKLhmIhAP/
   WGLpCkm9XQ4/BO/YUwGOLH4OnK2DRhIxbr+nbOkr15zbMwN9pSFABrz9i
   WN5+j0b3mjd8m3a8yuvnrnFDrY1K9T0BDveOCHne5vms+31LKTQkBN57X
   rWZLTZXTlR34I57o8Vy5OAn+rAu3FFtPlN9QW1T7ui1yIMYVwBt5azbOI
   g==;
X-CSE-ConnectionGUID: QLvbSalsSpuA0a9gPItfaw==
X-CSE-MsgGUID: 1WTsWMGQRoG1lCqXJMPCBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89674280"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="89674280"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:48:05 -0700
X-CSE-ConnectionGUID: veDrrsdpQyC9iLn1LpEL2A==
X-CSE-MsgGUID: EWmkwZ9tSWa3Zsujv/YOfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256240609"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:48:04 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: qiuxu.zhuo@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [PATCH v2 00/10] EDAC/{ie31200,igen6}: Fix address decoding and detect IMCs at runtime
Date: Thu, 30 Jul 2026 10:42:28 +0800
Message-ID: <20260730024238.4096623-1-qiuxu.zhuo@intel.com>
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

Intel client EDAC drivers duplicate address translation logic and rely
on platform-specific IMC counts even though the IMCs can be detected
at runtime. This series fixes several decoding bugs, replaces static IMC
counts with runtime detection, and consolidates the common translation
logic to simplify future maintenance.

Patches 1-5: Fix several correctness issues in the ie31200 and igen6
drivers, including interleave boundary handling, channel hash selection,
non-hash address decoding, and logged error address translation.

Patches 6-7: Do small cleanups.

Patches 8-9: Detect the number of IMCs at runtime, allowing new SoCs
to be supported without maintaining per-platform IMC counts while
eliminating redundant resource configuration tables.

Patch 10: Refactor the address translation logic by introducing
shared helpers for the common interleave and hash translation operations.
This removes duplicated implementations across multiple decoding paths,
making future changes easier while preserving existing behavior.

Change History:
  v1 -> v2:
    - 0009: Add comments indicating which platforms share the same resource configuration table (Tony).
    - No other changes.

Qiuxu Zhuo (10):
  EDAC/ie31200: Decouple DIMM width decoding from enum order
  EDAC/igen6: Fix interleave boundary condition
  EDAC/igen6: Fix channel selection hash
  EDAC/igen6: Fix channel address decode for non-hash mode
  EDAC/igen6: Fix Raptor Lake-P logged error address
  EDAC/igen6: Remove unnecessary XOR on the zero-valued interleave bit
  EDAC/igen6: Simplify compute die ID comments
  EDAC/igen6: Detect present memory controllers at runtime
  EDAC/igen6: Remove redundant resource configuration tables
  EDAC/igen6: Refactor address translation logic

 drivers/edac/ie31200_edac.c |  18 +-
 drivers/edac/igen6_edac.c   | 468 ++++++++++++++++++++----------------
 2 files changed, 280 insertions(+), 206 deletions(-)


base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
-- 
2.43.0

