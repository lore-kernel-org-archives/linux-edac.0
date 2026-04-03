Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D763590C3;
	Fri,  3 Apr 2026 05:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775194870; cv=none; b=HAmwYbhTq4s7/iNh3vM3DFTrMR+orjhHwt0sJ9nWMzlUH3Oa43hqHiCpV4LYTr0UWd06uZfj1aAm8AIWiyJ62EPYEGuMVP29Yn907XXffMCkr4botbV43DztQGNdcIRchxJtOZXKQzZL9PJQSyqgZoxVEXmFHNN9ru7o1qTfZsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775194870; c=relaxed/simple;
	bh=MB8LpTgltQ79fr6/u/BNsW/xHPCWfLL30JTUJDWadWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ReKP9rHb+ydXvODTfLUOwRUf2qpgpQOVLRDt56jJCTdl8OrxZSAo9i+rJOdhPLBbjwzMmgyc4KK8I/87IgtPFkYjCwfsZsT/KuNSPSidNaZKCxldaxPD/CbDdkl0i6mo7BF41mYXyijum+6JDhfaPxO8pQHmwxlyAZUKzZIrdEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwDDO8oQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwDDO8oQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775194869; x=1806730869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MB8LpTgltQ79fr6/u/BNsW/xHPCWfLL30JTUJDWadWc=;
  b=YwDDO8oQ7nkFmD8bOLo1FTKydEfwK+2ZOf5ENKHb2bsTrumKlJLQmLbh
   FNOtTFbnCKGm4cGKfh4z8S3h61paeGJX/dpDNe23YrUIDrOdXJ7+t0aZj
   4Yo7vVdQhG9K3uZlMmtZbFr1LYM9gh16SI4M1YdtaWmPQjv4u08WQ4OSH
   x7k6y5kU1o3ANiaRC02y843mIlosAEpR+SZP1OP7Yw+v7Fj63Jw2r+bQ4
   2y7suTrGIZpNxXYmclItu3UsRBd/s0KFbnumdnLQjQkyIGJk94RCZcRb3
   Ko5CP6+D8vrIy96COSpR6YHW4d+eoq1L4rzPeRdMRyRFXNLZnOIPGmOvW
   A==;
X-CSE-ConnectionGUID: Mm/C80EXShW8C9bbrCJanA==
X-CSE-MsgGUID: pYaJtmWvSmeVCP9m22wHXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93843322"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93843322"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 22:41:09 -0700
X-CSE-ConnectionGUID: n2i5q1sYTIuIahm3pEZ4GQ==
X-CSE-MsgGUID: nD5XEq7+SvWpZXD8tvmprg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="232107130"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 22:41:08 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] EDAC/igen6: Add one Intel Panther Lake-H SoC support
Date: Fri,  3 Apr 2026 13:40:29 +0800
Message-ID: <20260403054029.3950383-4-qiuxu.zhuo@intel.com>
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

Add one Intel Panther Lake-H SoC compute die ID for EDAC support.

Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index f849e3299593..f3e53d63eb54 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -309,6 +309,7 @@ static struct work_struct ecclog_work;
 #define DID_PTL_H_SKU11	0xb028
 #define DID_PTL_H_SKU12	0xb029
 #define DID_PTL_H_SKU13	0xb02a
+#define DID_PTL_H_SKU14	0xb00a
 
 /* Compute die IDs for Wildcat Lake with IBECC */
 #define DID_WCL_SKU1	0xfd00
@@ -863,6 +864,7 @@ static struct pci_device_id igen6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU11), (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU14), (kernel_ulong_t)&ptl_h_cfg },
 	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), (kernel_ulong_t)&wcl_cfg },
 	{ },
 };
-- 
2.43.0

