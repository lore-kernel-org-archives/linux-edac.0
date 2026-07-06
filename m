Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6291A3AD507;
	Mon,  6 Jul 2026 03:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308457; cv=none; b=maleNKfjOG7xr9MfWmbly3FPf9Tmcs6IIR3QGF/izeug/iPwpK/ahuht3qHjMS/I0p2U8ERzJRoul4wPUCpPUoeBnmgI8E7hn3+ap9Li0qU5YPfzW/04NI22XEH9xyHLg/fmxHtQk0bNg4fjXK3D2HtG2waYsBjU/CiJks5fz1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308457; c=relaxed/simple;
	bh=TfIyxzO1iSyzzP3VZlxzMBcTIPvzMfH3cy91qI3euM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bL/EiOTvgfbgEamKdB8wF1yyQWBxMe6r0mMUfK5yRSHu0StPftrbSdBELq8kYoBecPKzHAsbXDHbMO1ev/00GanVT3JuDqkyPVjd3POemHJZjoFaGc1nSoCkRSBeAKQZ3gq9ghIgDNnNJbu3m+phLhRKNBQCsDb+Yys6mSjwB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqYdq2jt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqYdq2jt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783308455; x=1814844455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TfIyxzO1iSyzzP3VZlxzMBcTIPvzMfH3cy91qI3euM4=;
  b=WqYdq2jtxfvsJfbs5EooPXFuxuDllqNghwIYqndadZW5/X14rnT4AfK5
   hq0hZ5E5GOp0P7s9dfIbS95NonBh14R2i/P2UN9aIW2nbi0MvY/7nPsXu
   L9BUS/kwRniAAja1/PVfWvzD5HrlANfcUT7EG2Pfm2TpXDdc4Kt0f8nbO
   bzjjvSZkky7tqCv5oEGbyIF8R9xyQaGFpWJO+cjGbY8RspqKs5IFtqy8E
   Hd/7u4BM5JbZuaS2VvnhHK27Hr8XN3vXZEOT+qThf1vdmExR5iWJAQAel
   2pF4H7cHZb5XlrXhREULr5yXnXKbPMKtqf71oL4WIleq6tdMTuom7pG2M
   w==;
X-CSE-ConnectionGUID: 86YC+qdcTNm8Csfbp5024Q==
X-CSE-MsgGUID: DvYe+9sdTZya28dyEWDv6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="71456364"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="71456364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:27:35 -0700
X-CSE-ConnectionGUID: 5dRYtPyZSxWBTYj2qNmG9Q==
X-CSE-MsgGUID: rrc2RfAlS36lMwQiAG8W3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258487807"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:27:33 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] EDAC/{ie31200,igen6}: Fix address decoding and detect IMCs at runtime
Date: Mon,  6 Jul 2026 11:22:23 +0800
Message-ID: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
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
 drivers/edac/igen6_edac.c   | 466 ++++++++++++++++++++----------------
 2 files changed, 278 insertions(+), 206 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0

