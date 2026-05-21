Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D32FD1CA;
	Thu, 21 May 2026 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349183; cv=none; b=l5PDo+0SjhIzxqXfbE778QdH+gsREIGEA1FarfEHNlasmHrLQDmXOt3QEsuoFFan2hc72/7MTELx3PdO60kGNebK+GBSe2AMjD81yWnn62FOGONSWisL+vos5jVr5vez+TUK8wPaWuVj6p5xLRtNDL803XwbB79ipi2b4oiHJLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349183; c=relaxed/simple;
	bh=37ZYSbhznVu39jS6yV8v/HarMSlLNd6CVDZNkLjlSXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VF97lz1EOX2pzN6m1IWgVmzD4MtdIzqhv+JDsI8TDKrubcOjwjCpMmXGYEqWAuCf3kM7fc1sWok02MD4RmGskkYm6bHnglY/aY0cRHH5ugmWEie5WC5BjOJHoz2HyJJxs1rre+q9rUD/MIU8pdkiyCb3nHuHmowpHff1q0C+Mjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZRn5t4K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZRn5t4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349182; x=1810885182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=37ZYSbhznVu39jS6yV8v/HarMSlLNd6CVDZNkLjlSXE=;
  b=GZRn5t4KbPwuoWEZGescS8X7o2G/EY18rDNjef0NS1IAsTJmJJNZ7ZtO
   1B8JKcDzJz3u81HaEax/6OgctXkl+nFF7kbOPnnpabhE3S7ov4atPi20q
   GutOPqQTZab4/fb6J6aeDCg/rBlucA8BnAuGNfN/n7ysyU/l0K7fNVsjv
   4MqpJpsLslTK9/sncDOGtuW7TZF/AMA3SoLtR1XXFkbYltJ6wM9Qquq7U
   iJbfhWdSuEt9jlxzxxxkDtk9JBjPuSIzJIqFdk0ytqzxLop19EYAg3zkH
   Gu074GwRAv+j+8GX/7egUIyAojW/tGbGdJCY0jCTELUn2l6gfYNpGfmfU
   w==;
X-CSE-ConnectionGUID: HmCBCpabQ7WnA7IAYEH1kg==
X-CSE-MsgGUID: syNjvsRgSpqTlZMzSk5wng==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97690575"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97690575"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:39:41 -0700
X-CSE-ConnectionGUID: xBGGfs0eTJeJijwrBM8UPg==
X-CSE-MsgGUID: X1tfszGCQmu4w4U2YmlAvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263973766"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:39:39 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] EDAC/{skx_common,i10nm}: Introduce rrl_ctrl_mode
Date: Thu, 21 May 2026 15:31:08 +0800
Message-ID: <20260521073112.3881223-5-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521073112.3881223-1-qiuxu.zhuo@intel.com>
References: <20260521073112.3881223-1-qiuxu.zhuo@intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RRL (Retry Read error Log) ownership is currently inferred from
retry_rd_err_log magic values, making control semantics implicit
and harder to understand.

Introduce rrl_ctrl_mode to explicitly describe whether RRL is
controlled by none, BIOS, or Linux, and replace direct checks with
named control states to improve readability and maintainability.

No functional change intended.

Tested-by: Yi Lai <yi1.lai@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/i10nm_base.c |  7 ++++---
 drivers/edac/skx_common.h | 11 +++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index 01cc86f697c8..fe148f1f2319 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -333,7 +333,7 @@ static void show_retry_rd_err_log(struct decoded_addr *res, char *msg,
 				n += scnprintf(msg + n, len - n, "%.16llx ", log);
 
 			/* Clear RRL status if RRL in Linux control mode. */
-			if (retry_rd_err_log == 2 && !j && (log & status_mask))
+			if (res_cfg->rrl_ctrl_mode == RRL_CTRL_LINUX && !j && (log & status_mask))
 				skx_write_imc_reg(imc, ch, offset, width, log & ~status_mask);
 		}
 	}
@@ -1207,9 +1207,10 @@ static int __init i10nm_init(void)
 	mce_register_decode_chain(&i10nm_mce_dec);
 	skx_setup_debug("i10nm_test");
 
+	res_cfg->rrl_ctrl_mode = retry_rd_err_log;
 	if (retry_rd_err_log && res_cfg->reg_rrl_ddr) {
 		skx_set_show_rrl(show_retry_rd_err_log);
-		if (retry_rd_err_log == 2)
+		if (retry_rd_err_log == RRL_CTRL_LINUX)
 			enable_retry_rd_err_log(true);
 	}
 
@@ -1230,7 +1231,7 @@ static void __exit i10nm_exit(void)
 	skx_set_decode(NULL);
 
 	if (retry_rd_err_log && res_cfg->reg_rrl_ddr) {
-		if (retry_rd_err_log == 2)
+		if (retry_rd_err_log == RRL_CTRL_LINUX)
 			enable_retry_rd_err_log(false);
 		skx_set_show_rrl(NULL);
 	}
diff --git a/drivers/edac/skx_common.h b/drivers/edac/skx_common.h
index f7f016db122f..4091431356d6 100644
--- a/drivers/edac/skx_common.h
+++ b/drivers/edac/skx_common.h
@@ -93,6 +93,15 @@ enum rrl_source_type {
 	RRL_SRC_FRE_DEMAND,
 };
 
+enum rrl_ctrl_mode {
+	/* Linux does not control RRL or reports values. */
+	RRL_CTRL_NONE,
+	/* Firmware retains control. Linux only reports values. */
+	RRL_CTRL_BIOS,
+	/* Linux takes control, resets mode bits, and clears valid/UC bits; reports values. */
+	RRL_CTRL_LINUX,
+};
+
 /* RRL registers per {,sub-,pseudo-}channel. */
 struct reg_rrl {
 	/* RRL register parts. */
@@ -272,6 +281,8 @@ struct res_config {
 	struct reg_rrl *reg_rrl_ddr;
 	/* RRL register sets per HBM channel */
 	struct reg_rrl *reg_rrl_hbm[2];
+	/* RRL control mode */
+	enum rrl_ctrl_mode rrl_ctrl_mode;
 	union {
 		/* {skx,i10nm}_edac */
 		struct {
-- 
2.43.0

