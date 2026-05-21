Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB8D343898;
	Thu, 21 May 2026 07:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349237; cv=none; b=uySASvWEaJ7/FKrA0U423wBn1iySslyqTq9nPq442ykPcQw7eV5faBHlkkMyy31L9LxeMzvEOsm+0+W+0G5ISL08uOOm7VjIdWjS10s4RdyCeK/zBd0d7rWc3pF77UJGCw0S+oFqFMZw4as7feeyj1oL+Q5LMgA5i3PQkhE2rVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349237; c=relaxed/simple;
	bh=sbENprrx81r7afzrfzPlnOKe6bVAvLdOgMU3G+TrlNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkiwIr58GzDpmKxGXg6Phqq9tL36dXkq+Z3TvwlB8ckeUtEvpGZMsKoad7JfAYbjbswdF76UquewvlI7Pc+AhG9pAn9RuxlgTPeA5hrTXBeTgczzJDJK6Aq8bevRxWehIkVx3st5L9h7sibV07YKpd05ExSSZLtbmP15GH5gwVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jG3fv9Gv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jG3fv9Gv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349236; x=1810885236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sbENprrx81r7afzrfzPlnOKe6bVAvLdOgMU3G+TrlNE=;
  b=jG3fv9GvMWqtcXKVauKBeIdCYGxc3zOyiAHxnHvPo1M/W/H0+z9HXWIb
   1BU4KVP+m1vmPG00zrdMbGL02dhMIwUMtHclfKjI3cw8F/xPXpW8Zp1wi
   /0YLRMsC4yn/0QkSO4h1WgY0HbRd2xP074cG1CmoFZk6IosQOZS/Y92PK
   /2ALYpkkAKlejfIbTJ7Pj8BKGK7TIf9563tElgbN2uritEFj4lpoRj/wC
   lj8pJsNenaBN8ghMVvO1dUQ6z+QHHSJiHKlehD7sYdsgAkS7qxkAFlEtS
   zsESgepKxB20KNCE3wDpAODtDKraHlT+0mJnY529C+iCRi49tJIHiuCwj
   g==;
X-CSE-ConnectionGUID: bXMKa2kXQ8maeMtOE4A12w==
X-CSE-MsgGUID: jFVcXSR8Raa8vHViFigXfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97690640"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97690640"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:40:36 -0700
X-CSE-ConnectionGUID: uxs45YUsRsKulJl7zg2Qkw==
X-CSE-MsgGUID: JyYwKteSQPqv5z/TVP7Dwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263974022"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:40:33 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] EDAC/imh: Add RRL support for Intel Diamond Rapids server
Date: Thu, 21 May 2026 15:31:12 +0800
Message-ID: <20260521073112.3881223-9-qiuxu.zhuo@intel.com>
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

Compared to previous generations, Diamond Rapids RRL (Retry Read error Log)
operates at DDR sub-channel granularity and adds an extra register per set.
It also increases the CORRERRCNT register width from 4 to 8 bytes while
reducing the number of registers from 8 to 4.

Add the Diamond Rapids RRL register configuration table and enable support.

Tested-by: Yi Lai <yi1.lai@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/imh_base.c   | 52 +++++++++++++++++++++++++++++++++++++++
 drivers/edac/skx_common.h |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/imh_base.c b/drivers/edac/imh_base.c
index dfdcfa127ce7..6ca0df031bf5 100644
--- a/drivers/edac/imh_base.c
+++ b/drivers/edac/imh_base.c
@@ -71,6 +71,39 @@ struct local_reg {
 		.width	= (cfg)->ip_name##_reg_##reg_name##_width,		\
 	}
 
+static struct res_config *res_cfg;
+static int retry_rd_err_log;
+
+#define REG_RRL_DEFINE(a0, a1, a2, a3, a4, a5, a6, b0, b1, b2, b3)	\
+	{								\
+		.set_num = 4,						\
+		.reg_num = 7,						\
+		.sources = {RRL_SRC_FRE_SCRUB, RRL_SRC_FRE_DEMAND, RRL_SRC_LRE_SCRUB, RRL_SRC_LRE_DEMAND},	\
+		.offsets = {									\
+			{a0,      a1,      a2,      a3,      a4,      a5,      a6},		\
+			{a0 + 4,  a1 + 4,  a2 + 8,  a3 + 4,  a4 + 4,  a5 + 8,  a6 + 8},		\
+			{a0 + 8,  a1 + 8,  a2 + 16, a3 + 8,  a4 + 8,  a5 + 16, a6 + 16},	\
+			{a0 + 12, a1 + 12, a2 + 24, a3 + 12, a4 + 12, a5 + 24, a6 + 24},	\
+		},										\
+		.widths		= {4, 4, 8, 4, 4, 8, 8},		\
+		.v_mask		= BIT(0),				\
+		.uc_mask	= BIT(1),				\
+		.over_mask	= BIT(2),				\
+		.en_mask	= BIT(12),				\
+		.en_patspr_mask	= BIT(14),				\
+		.noover_mask	= BIT(15),				\
+		.cecnt_num	= 4,					\
+		.cecnt_offsets	= {b0, b1, b2, b3},			\
+		.cecnt_widths	= {8, 8, 8, 8},				\
+}
+
+static struct reg_rrl dmr_reg_rrl_ddr_subch0 = REG_RRL_DEFINE(
+	0x2dc0, 0x2dd0, 0x2de0, 0x2e00, 0x2e10, 0x2f70, 0x0200,
+	0x2c10, 0x2c18, 0x2c20, 0x2c28);
+static struct reg_rrl dmr_reg_rrl_ddr_subch1 = REG_RRL_DEFINE(
+	0x6dc0, 0x6dd0, 0x6de0, 0x6e00, 0x6e10, 0x6f70, 0x4200,
+	0x6c10, 0x6c18, 0x6c20, 0x6c28);
+
 static void __read_local_reg(void *reg)
 {
 	struct local_reg *r = (struct local_reg *)reg;
@@ -480,6 +513,8 @@ static struct res_config dmr_cfg = {
 	.ha_size			= 0x1000,
 	.ha_reg_mode_offset		= 0x4a0,
 	.ha_reg_mode_width		= 4,
+	.reg_rrl_ddr[0]			= &dmr_reg_rrl_ddr_subch0,
+	.reg_rrl_ddr[1]			= &dmr_reg_rrl_ddr_subch1,
 };
 
 static const struct x86_cpu_id imh_cpuids[] = {
@@ -519,6 +554,7 @@ static int __init imh_init(void)
 		return -ENODEV;
 	cfg = (struct res_config *)id->driver_data;
 	skx_set_res_cfg(cfg);
+	res_cfg = cfg;
 
 	if (!imh_get_tolm_tohm(cfg, &tolm, &tohm))
 		return -ENODEV;
@@ -553,6 +589,13 @@ static int __init imh_init(void)
 	mce_register_decode_chain(&imh_mce_dec);
 	skx_setup_debug("imh_test");
 
+	cfg->rrl_ctrl_mode = retry_rd_err_log;
+	if (retry_rd_err_log && cfg->reg_rrl_ddr[0]) {
+		skx_set_show_rrl(skx_show_rrl);
+		if (retry_rd_err_log == RRL_CTRL_LINUX)
+			skx_enable_rrl(true);
+	}
+
 	imh_printk(KERN_INFO, "%s\n", IMH_REVISION);
 
 	return 0;
@@ -565,6 +608,12 @@ static void __exit imh_exit(void)
 {
 	edac_dbg(2, "\n");
 
+	if (retry_rd_err_log && res_cfg->reg_rrl_ddr[0]) {
+		if (retry_rd_err_log == RRL_CTRL_LINUX)
+			skx_enable_rrl(false);
+		skx_set_show_rrl(NULL);
+	}
+
 	skx_teardown_debug();
 	mce_unregister_decode_chain(&imh_mce_dec);
 	skx_adxl_put();
@@ -574,6 +623,9 @@ static void __exit imh_exit(void)
 module_init(imh_init);
 module_exit(imh_exit);
 
+module_param(retry_rd_err_log, int, 0444);
+MODULE_PARM_DESC(retry_rd_err_log, "retry_rd_err_log: 0=off(default), 1=bios(Linux doesn't reset any control bits, but just reports values.), 2=linux(Linux tries to take control and resets mode bits, clear valid/UC bits after reading.)");
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Qiuxu Zhuo");
 MODULE_DESCRIPTION("MC Driver for Intel servers using IMH-based memory controller");
diff --git a/drivers/edac/skx_common.h b/drivers/edac/skx_common.h
index 6d4cf0dd412a..777252cca809 100644
--- a/drivers/edac/skx_common.h
+++ b/drivers/edac/skx_common.h
@@ -77,7 +77,7 @@
 /* Max RRL register sets per {,sub-,pseudo-}channel. */
 #define NUM_RRL_SET		4
 /* Max RRL registers per set. */
-#define NUM_RRL_REG		6
+#define NUM_RRL_REG		7
 /* Max correctable error count registers. */
 #define NUM_CECNT_REG		8
 
-- 
2.43.0

