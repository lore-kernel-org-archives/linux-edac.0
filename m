Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0675E242D6A;
	Thu, 21 May 2026 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349062; cv=none; b=tEIbFhNc7qmq4CHrXRJHcDWXGfjXznFVuwf3apENrsxNePyFc/wDep/gEGKRFqoba7OxJVzw1k6VOJke93JP59j3W3YtMMBllYcOWvV8S3KXgEFWAlJUDhTfubky3Xv56XJnloOAFAeqSQ224bU8pFbmmcPlSa10+02v4kVh+II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349062; c=relaxed/simple;
	bh=cQv64veDgyqBqw94o1zJMbQZhrdy6Wmg3qPuVFJUQyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dDKRiQEno2KtX5eXoF2xtHnE/Kpeg7K4ccxYx/yscfVrtahMK1v/+cOxzkY5sNSbiR5dw7OtZZ06gA8uIiYXf5RSWnGk/kRnCquQmStVtdBiaznaJIZtyti/6VY0PBUsVW857DgAejGRaIuLElpXIQYyHY5zJoIYDsCvW9lx3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L38F3muw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L38F3muw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349061; x=1810885061;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cQv64veDgyqBqw94o1zJMbQZhrdy6Wmg3qPuVFJUQyY=;
  b=L38F3muwqxfq3cwwE/HKc9s2QdnByVq/PSpOCar3QhyjF5aahdNGKVuO
   vueR1OWlDmtAwmlTMRHTB55yP/pYj1Ux4rnl10xyEyAMzU/z3Y4jWQ5G3
   h1yZvCRXZdcmMsgcFvQrbxAN2RlwnLoWBdJa2719i3hpVSBLyZpGnT2D4
   DzGIzhr+NQtAQu13cKVaLj8yTxBwHrN8RL1nDelZ2B90BsGOB8KxV1SXo
   LEcIXELUealiPy26C+JeJMvZJTa+iSxII0wtkzwwFzAVAkZhXpwMAx0L8
   N2+vlrZiGl61d0WyhaC4dJt5oHED5bMWJDEruANK2W0CSrx8xCuozpxxM
   g==;
X-CSE-ConnectionGUID: iaaHgYiUTwWckXL6zd/MuA==
X-CSE-MsgGUID: irYtzaMqTRKa4+5fsOcpqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97690425"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97690425"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:37:41 -0700
X-CSE-ConnectionGUID: yUP1RxadQ2CykRk3zyRsjQ==
X-CSE-MsgGUID: FFBnZytEQ1ib3VwD6u5N/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263973153"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:37:38 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] EDAC: Add RRL support for Intel Diamond Rapids servers
Date: Thu, 21 May 2026 15:31:04 +0800
Message-ID: <20260521073112.3881223-1-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set adds RRL (Retry Read Error Log) support for Intel Diamond Rapids.

RRL provides detailed information about retry read errors reported by the memory controller,
which helps diagnose memory reliability issues. Intel Diamond Rapids introduces sub-channel
granularity and requires updates to the existing EDAC RRL handling.

To avoid code duplication and ensure consistent behavior across platforms, the existing i10nm
RRL implementation is refactored and moved into common code shared by i10nm_edac and imh_edac.


The patch set is organized as follows:

  Patch 1-5: Refactor i10nm RRL code and move it into common helpers.

  Patch 6-7: Prepare ADXL sub-channel decoding and extend RRL handling for sub-channel granularity.

  Patch 8: Add RRL support for Diamond Rapids.


The patch set is based on:

  Tree: https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git
  Branch: edac-for-next
  Commit: 4b049cd5e519

Qiuxu Zhuo (8):
  EDAC/{skx_common,i10nm,imh}: Move MC register access helpers to skx_common
  EDAC/{skx_common,skx,i10nm}: Split skx_set_decode()
  EDAC/{skx_common,i10nm}: Rename rrl_mode to rrl_source_type
  EDAC/{skx_common,i10nm}: Introduce rrl_ctrl_mode
  EDAC/{skx_common,i10nm}: Move RRL handling to common code
  EDAC/skx_common: Add SubChannel support to ADXL decode
  EDAC/{skx_common,i10nm}: Prepare RRL for sub-channel granularity
  EDAC/imh: Add RRL support for Intel Diamond Rapids server

 drivers/edac/i10nm_base.c | 255 +++------------------------------
 drivers/edac/imh_base.c   |  81 +++++++----
 drivers/edac/skx_base.c   |   6 +-
 drivers/edac/skx_common.c | 294 +++++++++++++++++++++++++++++++++++++-
 drivers/edac/skx_common.h |  44 ++++--
 5 files changed, 401 insertions(+), 279 deletions(-)


base-commit: 4b049cd5e5194c8e58cd978d2dc9d3bcf67c84f6
-- 
2.43.0

