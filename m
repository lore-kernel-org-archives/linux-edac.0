Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146E1357D1A;
	Thu, 21 May 2026 07:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349173; cv=none; b=AL698No8xRU7DmwyqJkrrPb4gawC58giJ3wBZOaPFJtX009DLvOnx4+DiOygR6agVNTyNILb0Wz1dnmgtf7R9sDVed5LtA+Kzpbt6HMT3RNZi/YF4RmOnyyk2CShc9WIydf15/+95Frb+4KQFcHq3xLVGyUOkZ4Jo4fkKae/CH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349173; c=relaxed/simple;
	bh=A9MeywLgKor6uS2NT19b9fpcSpiiD8w+6D5NfY+psmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9tzb6Jm4rK0NvHw8mkg2T1/DshetXPLNfv+MX4br1ORWxUO3vkIiOfC9a31MaSEV+eB+bVtGY2Pw6BWMSU2xD3WiosxELFgm/WaJuxCz4r/XL0unG0QoBmsZLWOfl11p5IrC5o3kkPzI7/Z3NHd+SzyqoNdjBjk6LHjDckPd/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6ZUUokQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6ZUUokQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349172; x=1810885172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A9MeywLgKor6uS2NT19b9fpcSpiiD8w+6D5NfY+psmo=;
  b=g6ZUUokQkFBMCGFecdx31fP4A6eLlZMMav7zBeChIPobb1KfZdI7XRgl
   qel+RnArn50a1HF8Vf7QlqjvO5XXkGNAsOY3oB5POXBeUgv5xehTZwxjt
   lxtOluk5LokAlhoaQumXSbZwNa5hFPSbAMETN8lpyxXTmVPMpmbjPPW20
   W1/miS/GZ8UOK0Ih5iOOM/XLjNBH/QtBUPpT2Sw3GpqWL7KmDhfVuWO23
   9Bkw50iRbk1QGy5rFXisrtci+PsrQzLKA7Zshz6pyRAsKL/5sGGfnCX1A
   LG57KxpMT+vWBIGJnmcT4JD45pkHRm7i2NazYGt6bseiwbQGpngB2a8a9
   w==;
X-CSE-ConnectionGUID: v07G9fnnSNiWyTTV6xygOg==
X-CSE-MsgGUID: 5HXngZz5R7SH15BigzPLjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97690572"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97690572"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:39:32 -0700
X-CSE-ConnectionGUID: 2Z0izTuNQTyTrtAn5vimpA==
X-CSE-MsgGUID: WNvk196wTUm9puWvicWrVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263973687"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:39:30 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] EDAC/{skx_common,i10nm}: Rename rrl_mode to rrl_source_type
Date: Thu, 21 May 2026 15:31:07 +0800
Message-ID: <20260521073112.3881223-4-qiuxu.zhuo@intel.com>
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

The RRL (Retry Read error Log) values describe where an error was logged
from (first/last read and scrub/demand), not an operating mode.

Rename rrl_mode to rrl_source_type and "modes" to "sources" to better
reflect their meaning and improve code readability.

No functional changes intended.

Tested-by: Yi Lai <yi1.lai@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/i10nm_base.c | 18 +++++++++---------
 drivers/edac/skx_common.h | 14 +++++++-------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index c09790d5b95e..01cc86f697c8 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -78,7 +78,7 @@ static bool no_adxl;
 static struct reg_rrl icx_reg_rrl_ddr = {
 	.set_num = 2,
 	.reg_num = 6,
-	.modes = {LRE_SCRUB, LRE_DEMAND},
+	.sources = {RRL_SRC_LRE_SCRUB, RRL_SRC_LRE_DEMAND},
 	.offsets = {
 		{0x22c60, 0x22c54, 0x22c5c, 0x22c58, 0x22c28, 0x20ed8},
 		{0x22e54, 0x22e60, 0x22e64, 0x22e58, 0x22e5c, 0x20ee0},
@@ -99,7 +99,7 @@ static struct reg_rrl icx_reg_rrl_ddr = {
 static struct reg_rrl spr_reg_rrl_ddr = {
 	.set_num = 3,
 	.reg_num = 6,
-	.modes = {LRE_SCRUB, LRE_DEMAND, FRE_DEMAND},
+	.sources = {RRL_SRC_LRE_SCRUB, RRL_SRC_LRE_DEMAND, RRL_SRC_FRE_DEMAND},
 	.offsets = {
 		{0x22c60, 0x22c54, 0x22f08, 0x22c58, 0x22c28, 0x20ed8},
 		{0x22e54, 0x22e60, 0x22f10, 0x22e58, 0x22e5c, 0x20ee0},
@@ -121,7 +121,7 @@ static struct reg_rrl spr_reg_rrl_ddr = {
 static struct reg_rrl spr_reg_rrl_hbm_pch0 = {
 	.set_num = 2,
 	.reg_num = 6,
-	.modes = {LRE_SCRUB, LRE_DEMAND},
+	.sources = {RRL_SRC_LRE_SCRUB, RRL_SRC_LRE_DEMAND},
 	.offsets = {
 		{0x2860, 0x2854, 0x2b08, 0x2858, 0x2828, 0x0ed8},
 		{0x2a54, 0x2a60, 0x2b10, 0x2a58, 0x2a5c, 0x0ee0},
@@ -142,7 +142,7 @@ static struct reg_rrl spr_reg_rrl_hbm_pch0 = {
 static struct reg_rrl spr_reg_rrl_hbm_pch1 = {
 	.set_num = 2,
 	.reg_num = 6,
-	.modes = {LRE_SCRUB, LRE_DEMAND},
+	.sources = {RRL_SRC_LRE_SCRUB, RRL_SRC_LRE_DEMAND},
 	.offsets = {
 		{0x2c60, 0x2c54, 0x2f08, 0x2c58, 0x2c28, 0x0fa8},
 		{0x2e54, 0x2e60, 0x2f10, 0x2e58, 0x2e5c, 0x0fb0},
@@ -163,7 +163,7 @@ static struct reg_rrl spr_reg_rrl_hbm_pch1 = {
 static struct reg_rrl gnr_reg_rrl_ddr = {
 	.set_num = 4,
 	.reg_num = 6,
-	.modes = {FRE_SCRUB, FRE_DEMAND, LRE_SCRUB, LRE_DEMAND},
+	.sources = {RRL_SRC_FRE_SCRUB, RRL_SRC_FRE_DEMAND, RRL_SRC_LRE_SCRUB, RRL_SRC_LRE_DEMAND},
 	.offsets = {
 		{0x2f10, 0x2f20, 0x2f30, 0x2f50, 0x2f60, 0xba0},
 		{0x2f14, 0x2f24, 0x2f38, 0x2f54, 0x2f64, 0xba8},
@@ -186,15 +186,15 @@ static struct reg_rrl gnr_reg_rrl_ddr = {
 static void enable_rrl(struct skx_imc *imc, int chan, struct reg_rrl *rrl,
 		       int rrl_set, bool enable, u32 *rrl_ctl)
 {
-	enum rrl_mode mode = rrl->modes[rrl_set];
+	enum rrl_source_type source = rrl->sources[rrl_set];
 	u32 offset = rrl->offsets[rrl_set][0], v;
 	u8 width = rrl->widths[0];
 	bool first, scrub;
 
 	/* First or last read error. */
-	first = (mode == FRE_SCRUB || mode == FRE_DEMAND);
+	first = (source == RRL_SRC_FRE_SCRUB || source == RRL_SRC_FRE_DEMAND);
 	/* Patrol scrub or on-demand read error. */
-	scrub = (mode == FRE_SCRUB || mode == LRE_SCRUB);
+	scrub = (source == RRL_SRC_FRE_SCRUB || source == RRL_SRC_LRE_SCRUB);
 
 	v = skx_read_imc_reg(imc, chan, offset, width);
 
@@ -318,7 +318,7 @@ static void show_retry_rd_err_log(struct decoded_addr *res, char *msg,
 
 	n = scnprintf(msg, len, " retry_rd_err_log[");
 	for (i = 0; i < rrl->set_num; i++) {
-		scrub = (rrl->modes[i] == FRE_SCRUB || rrl->modes[i] == LRE_SCRUB);
+		scrub = (rrl->sources[i] == RRL_SRC_FRE_SCRUB || rrl->sources[i] == RRL_SRC_LRE_SCRUB);
 		if (scrub_err != scrub)
 			continue;
 
diff --git a/drivers/edac/skx_common.h b/drivers/edac/skx_common.h
index 5a08f219e46d..f7f016db122f 100644
--- a/drivers/edac/skx_common.h
+++ b/drivers/edac/skx_common.h
@@ -81,23 +81,23 @@
 /* Max correctable error count registers. */
 #define NUM_CECNT_REG		8
 
-/* Modes of RRL register set. */
-enum rrl_mode {
+/* Error source from which the RRL registers log errors. */
+enum rrl_source_type {
 	/* Last read error from patrol scrub. */
-	LRE_SCRUB,
+	RRL_SRC_LRE_SCRUB,
 	/* Last read error from demand. */
-	LRE_DEMAND,
+	RRL_SRC_LRE_DEMAND,
 	/* First read error from patrol scrub. */
-	FRE_SCRUB,
+	RRL_SRC_FRE_SCRUB,
 	/* First read error from demand. */
-	FRE_DEMAND,
+	RRL_SRC_FRE_DEMAND,
 };
 
 /* RRL registers per {,sub-,pseudo-}channel. */
 struct reg_rrl {
 	/* RRL register parts. */
 	int set_num, reg_num;
-	enum rrl_mode modes[NUM_RRL_SET];
+	enum rrl_source_type sources[NUM_RRL_SET];
 	u32 offsets[NUM_RRL_SET][NUM_RRL_REG];
 	/* RRL register widths in byte per set. */
 	u8 widths[NUM_RRL_REG];
-- 
2.43.0

