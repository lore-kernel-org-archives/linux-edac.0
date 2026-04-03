Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319F9340280;
	Fri,  3 Apr 2026 05:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775194854; cv=none; b=C8g5aEosXxSSXwiqjLiyY8xdIyFhLCvB7edzs+vCKJBVd6ijTxpNSjKEkeA0Zad6oykxZvUkUIi8GnRFQQI7GkVjEDvBcsBNuoYGYtc+QRLwHDL5pvAJGygsseUJEzLs1Ln1mJGxHwqPB/zPg6Gt0RaEYsciu+kNI7rsWQl1mK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775194854; c=relaxed/simple;
	bh=e00h15MHtkNNaUp4CcL2MgRRx8UdJJivLnJ/bZf0Oiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TAr9MXzPdSo7hZlcRFQ192B+SpehSWbtIP1S2pb+esMTnfjFp24g5bk54dIy/cthzI6SmkttGWKjyFQshDHJLMrReR/+BqrnRxr6v8upRXbCOOcqMLstRVm/CeeqbousktmOuntGS27t4g2mfrOY2LMzr7CNQOEMQrhWhJjMhoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YX8dol3a; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YX8dol3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775194853; x=1806730853;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e00h15MHtkNNaUp4CcL2MgRRx8UdJJivLnJ/bZf0Oiw=;
  b=YX8dol3a6KH/izq4JelYAYQ6rm/xlkn8vDthH6jBFH57AlMqe/dGT22q
   vny9jB4uRjNz302IeXrByKUSPMjSId5IWtilOdO2Cbo3cbI2BCWAt7+UM
   /DCTJZu1dSZ/XQGr1uvNNqlhJdMTxYA0SivHLsUgX8RrRZbqMhkMN8pCa
   Pkk1RUDJYgiyvg0clvzut0TE9AcQ5e/tsa02PuU1Ilh+1ASlDvYDGatr9
   ID575x99pFQS7erkImJPALt1TRoBM6TuSLc3IqRyfH5nbv6VX58zZGwdQ
   6SEt8U4j46UysexEkgZ1lwPAoAVo88oeeYdpmsMLLoggNbh7sP8+/iCle
   Q==;
X-CSE-ConnectionGUID: A0G2eWx6TWmHO+VkCxAKGQ==
X-CSE-MsgGUID: 9De8V4/YTm26+Y/PlawqlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93843310"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93843310"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 22:40:53 -0700
X-CSE-ConnectionGUID: sxdf7o/SRe6u04YAN7hFog==
X-CSE-MsgGUID: dB1fe4FxT0Kl16KkuH+bWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="232107052"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 22:40:51 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] EDAC/igen6: Fix call trace, memory topology parsing, and add one Panther Lake-H support
Date: Fri,  3 Apr 2026 13:40:26 +0800
Message-ID: <20260403054029.3950383-1-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 0001 - Fix a call trace.

Patch 0002 - Correct the memory topology parsing logic for Panther Lake-H systems.

Patch 0003 - Add a new Panther Lake-H compute die ID for EDAC support.

Qiuxu Zhuo (3):
  EDAC/igen6: Fix call trace due to missing release()
  EDAC/igen6: Fix memory topology parsing for Panther Lake-H SoCs
  EDAC/igen6: Add one Intel Panther Lake-H SoC support

 drivers/edac/igen6_edac.c | 383 +++++++++++++++++++++++++++++++-------
 include/linux/edac.h      |   3 +
 2 files changed, 316 insertions(+), 70 deletions(-)


base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
-- 
2.43.0

