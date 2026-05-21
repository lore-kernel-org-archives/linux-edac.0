Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042653D7D90;
	Thu, 21 May 2026 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367478; cv=none; b=QRa3VhYA65kHF+VMUFEUTZ6e7JoVGQ8A8DLCoo9nSdJQm9G8TyOmTSg94EWqxS4W36H0RnBn2mxP4QpAdiJiizEUUsuz/Swh/y5ctPGYC2fUkalLPN47R0of4VHdQd+CIRU+syAjqiHfg1T6vUzXVSbrEzVe11O5kJz1cysNzLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367478; c=relaxed/simple;
	bh=imXbdl8843zCr5ZXlD0MakswNoMy9nUYFeNQaXKOnzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h9xfcY05uX/DY+j906sST5m1BxHKe5sWbphp2AM4j+xhTYQTZKwRKGYQ7YSaZMrKB/LuALmZNDTVgcTAj20YGVbD9gT3YHo3sbCgCgu5+1OWfcBbOBOX5aTZ6sThqRlEnZUwUVTHiZ7H1i2eh6m/BIslLIlBrIsCpk6/TdnxYHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObEvx6Zj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObEvx6Zj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779367476; x=1810903476;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=imXbdl8843zCr5ZXlD0MakswNoMy9nUYFeNQaXKOnzg=;
  b=ObEvx6ZjhnkljOBCm/nzizIy8i6GwVOQr8maaDJrgjH4F94hE5dejA8o
   Qlo9CvWWgJBZ3hCQLSe8O7GitVtfYXU+9JaWegfDu6Lq7aUG0G5bAjQEA
   thOm4eObBjMY7UgxLIp2eG2pEvoIM4G6y83qTjkPCJKFLV8vs7wg0TPf9
   WcjJpvQtN7ukqUW97ITms0iEkcShKZMVgk4rr1QypQAxy8ZPe0jGfWA8q
   Laf2n1RidnbXYXCqgfrv7XWmCUG0i04PAHqvN1kmWJKmiFP5Qq1fKEpK0
   HSTNSv9Wzw1d5X3CCksYLTEc5PC/6bguJO4+8J1r7m9lCRC3AhHxaGCEc
   Q==;
X-CSE-ConnectionGUID: unMgt3e4THeKU0j8fpCXfA==
X-CSE-MsgGUID: NkbnpTpORY+KGsf1ie2Qpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80265191"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80265191"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 05:44:35 -0700
X-CSE-ConnectionGUID: DjxeveJWTMuqBSwUqMqi9w==
X-CSE-MsgGUID: 9g4dbsS6QnC6bTjQFFG41w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="236265124"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 05:44:33 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Jie Wang <jie.wang@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] EDAC: Add Intel Nova Lake-H SoC support
Date: Thu, 21 May 2026 20:38:10 +0800
Message-ID: <20260521123812.3961038-1-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Nova Lake-H uses different IBECC detection registers than
existing igen6 platforms. Make register detection configurable to
handle platform differences cleanly, then add Nova Lake-H support.

The patch set consists of:

  Patch 1: Make the IBECC detection register configurable.

  Patch 2: Add Intel Nova Lake-H SoC support.

The patch set is based on:

  Tree: https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git
  Branch: edac-for-next
  Commit: 4b049cd5e519


Qiuxu Zhuo (2):
  EDAC/igen6: Make registers for detecting IBECC configurable
  EDAC/igen6: Add Intel Nova Lake-H SoC support

 drivers/edac/igen6_edac.c | 101 +++++++++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 28 deletions(-)


base-commit: 4b049cd5e5194c8e58cd978d2dc9d3bcf67c84f6
-- 
2.43.0

