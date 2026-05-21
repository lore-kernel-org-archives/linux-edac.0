Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A5B343898;
	Thu, 21 May 2026 07:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349230; cv=none; b=M+9cjpEwgh0Xhh3cMtAht3miUsD8nNZZjsbwFJhnUL+gWFQeWUjPDs6nW+xWMcpc/7oeU+CM/j3vfFyJH8dUwFClZpY6qYtlRdwo804edrkf9XiJNydiR3O9YwlrNAd6uAVkk4KGENr+FpS9UnoNTK0rgHH0hIGknippS4DNRcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349230; c=relaxed/simple;
	bh=ddnsfOZjlx8QKbpjbe/hxa0ckGFh7gWVmj4Q3lEEHAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WiM9U5MkSeXECg2tsNNs7AqqobnQx3Tg4BP0xSXC7ZcN3pegvXjn2mU48qzxJLNPnbBdOJTkCM8+ucux5sbuU1b3gL8jN0Bg669BIrmHWptui5q1h9hLFvGp651+r9REAegS2YWe6exhHijnhcGe7LZaQ0SbplUk4J7b3rBQ1Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYU6KgX3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYU6KgX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349229; x=1810885229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ddnsfOZjlx8QKbpjbe/hxa0ckGFh7gWVmj4Q3lEEHAc=;
  b=fYU6KgX3lzCaEFK7OTdCTh+j4OF9dP+n2KvYj1pqqiYRLWUAdI972dbi
   Ed/h5Jvc4sETp0JwytGsGb9qiDc05VFoJgccdPLv9qhFvZJeRAwdTOreW
   ACE7UHukOzFUkH4qK9QFYv6h0wlnhKC7qKyqhRICs74lqnbH7NcLWGJ4R
   IPEhq45RWeKUPurWayc9035FeOSGhMIMaTRWIzUckrIZu6dhh9/j99iYo
   aNgRFWWOMHSzrRsIbkBtCvluofLX3hkB+UpPAteGRDJa1NGjT6Mc3hKSJ
   co0Y2LIVvYuDlDRkc4DrqNhAHWxOaAz9zxn687ZTmSeY3bUQXsYOkJsHb
   A==;
X-CSE-ConnectionGUID: Ch7JqlKaSoWSUj7xbZrWXQ==
X-CSE-MsgGUID: +6c6tAboTXix4p6vWfrbFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97690617"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97690617"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:40:29 -0700
X-CSE-ConnectionGUID: m+px+oZkTyCfMpjiufsQ2Q==
X-CSE-MsgGUID: mZG0LFjrQmyGpgOAiOcKSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263973968"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:40:26 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] EDAC/{skx_common,i10nm}: Prepare RRL for sub-channel granularity
Date: Thu, 21 May 2026 15:31:11 +0800
Message-ID: <20260521073112.3881223-8-qiuxu.zhuo@intel.com>
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

To prepare for enabling Diamond Rapids server RRL (Retry Read error Log),
which operates at sub-channel granularity by converting struct
res_config::reg_rrl_ddr from a single pointer to an array (reg_rrl_ddr[2])
and updating all users in i10nm_edac and skx_common accordingly.

Initialize only reg_rrl_ddr[0] for existing platforms and prepare for
supporting two RRL set groups per DDR channel (one per sub-channel)
when present.

Tested-by: Yi Lai <yi1.lai@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/i10nm_base.c | 12 ++++++------
 drivers/edac/skx_common.c | 35 +++++++++++++++++++++++++++++------
 drivers/edac/skx_common.h |  2 +-
 3 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index 2e21eefbb4f5..fa1853f252b0 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -767,7 +767,7 @@ static struct res_config i10nm_cfg0 = {
 	.ddr_mdev_bdf		= {0, 12, 0},
 	.hbm_mdev_bdf		= {0, 12, 1},
 	.sad_all_offset		= 0x108,
-	.reg_rrl_ddr		= &icx_reg_rrl_ddr,
+	.reg_rrl_ddr[0]		= &icx_reg_rrl_ddr,
 };
 
 static struct res_config i10nm_cfg1 = {
@@ -785,7 +785,7 @@ static struct res_config i10nm_cfg1 = {
 	.ddr_mdev_bdf		= {0, 12, 0},
 	.hbm_mdev_bdf		= {0, 12, 1},
 	.sad_all_offset		= 0x108,
-	.reg_rrl_ddr		= &icx_reg_rrl_ddr,
+	.reg_rrl_ddr[0]		= &icx_reg_rrl_ddr,
 };
 
 static struct res_config spr_cfg = {
@@ -808,7 +808,7 @@ static struct res_config spr_cfg = {
 	.ddr_mdev_bdf		= {0, 12, 0},
 	.hbm_mdev_bdf		= {0, 12, 1},
 	.sad_all_offset		= 0x300,
-	.reg_rrl_ddr		= &spr_reg_rrl_ddr,
+	.reg_rrl_ddr[0]		= &spr_reg_rrl_ddr,
 	.reg_rrl_hbm[0]		= &spr_reg_rrl_hbm_pch0,
 	.reg_rrl_hbm[1]		= &spr_reg_rrl_hbm_pch1,
 };
@@ -828,7 +828,7 @@ static struct res_config gnr_cfg = {
 	.uracu_bdf		= {0, 0, 1},
 	.ddr_mdev_bdf		= {0, 5, 1},
 	.sad_all_offset		= 0x300,
-	.reg_rrl_ddr		= &gnr_reg_rrl_ddr,
+	.reg_rrl_ddr[0]		= &gnr_reg_rrl_ddr,
 };
 
 static const struct x86_cpu_id i10nm_cpuids[] = {
@@ -1023,7 +1023,7 @@ static int __init i10nm_init(void)
 	skx_setup_debug("i10nm_test");
 
 	res_cfg->rrl_ctrl_mode = retry_rd_err_log;
-	if (retry_rd_err_log && res_cfg->reg_rrl_ddr) {
+	if (retry_rd_err_log && res_cfg->reg_rrl_ddr[0]) {
 		skx_set_show_rrl(skx_show_rrl);
 		if (retry_rd_err_log == RRL_CTRL_LINUX)
 			skx_enable_rrl(true);
@@ -1045,7 +1045,7 @@ static void __exit i10nm_exit(void)
 
 	skx_set_decode(NULL);
 
-	if (retry_rd_err_log && res_cfg->reg_rrl_ddr) {
+	if (retry_rd_err_log && res_cfg->reg_rrl_ddr[0]) {
 		if (retry_rd_err_log == RRL_CTRL_LINUX)
 			skx_enable_rrl(false);
 		skx_set_show_rrl(NULL);
diff --git a/drivers/edac/skx_common.c b/drivers/edac/skx_common.c
index 4d832f02fb59..bfd0cd1689ed 100644
--- a/drivers/edac/skx_common.c
+++ b/drivers/edac/skx_common.c
@@ -173,15 +173,18 @@ static void enable_rrls(struct skx_imc *imc, int chan, struct reg_rrl *rrl,
 
 static void enable_rrls_ddr(struct skx_imc *imc, bool enable)
 {
-	struct reg_rrl *rrl_ddr = skx_res_cfg->reg_rrl_ddr;
+	struct reg_rrl **rrl_ddr = skx_res_cfg->reg_rrl_ddr;
 	int i, chan_num = skx_res_cfg->ddr_chan_num;
 	struct skx_channel *chan = imc->chan;
 
 	if (!imc->mbase)
 		return;
 
-	for (i = 0; i < chan_num; i++)
-		enable_rrls(imc, i, rrl_ddr, enable, chan[i].rrl_ctl[0]);
+	for (i = 0; i < chan_num; i++) {
+		enable_rrls(imc, i, rrl_ddr[0], enable, chan[i].rrl_ctl[0]);
+		if (rrl_ddr[1])
+			enable_rrls(imc, i, rrl_ddr[1], enable, chan[i].rrl_ctl[1]);
+	}
 }
 
 static void enable_rrls_hbm(struct skx_imc *imc, bool enable)
@@ -218,10 +221,31 @@ void skx_enable_rrl(bool enable)
 }
 EXPORT_SYMBOL_GPL(skx_enable_rrl);
 
+static struct reg_rrl *get_rrl_reg(struct decoded_addr *res, struct res_config *cfg)
+{
+	struct skx_imc *imc = &res->dev->imc[res->imc];
+
+	/* HBM has two groups of RRL sets, one per pseudo-channel. */
+	if (imc->hbm_mc)
+		return cfg->reg_rrl_hbm[res->cs & 1];
+
+	/* One group of RRL sets per DDR channel. */
+	if (!cfg->reg_rrl_ddr[1])
+		return cfg->reg_rrl_ddr[0];
+
+	if (res->subch == -1) {
+		skx_printk(KERN_ERR, "Invalid sub-channel id (-1), possibly missing %s ADXL component.\n", component_names[INDEX_SUBCH]);
+		return NULL;
+	}
+
+	/* Two groups of RRL sets per DDR channel (e.g., DMR: one group per sub-channel). */
+	return cfg->reg_rrl_ddr[res->subch & 1];
+}
+
 void skx_show_rrl(struct decoded_addr *res, char *msg, int len, bool scrub_err)
 {
-	int i, j, n, ch = res->channel, pch = res->cs & 1;
 	struct skx_imc *imc = &res->dev->imc[res->imc];
+	int i, j, n, ch = res->channel;
 	u64 log, corr, status_mask;
 	struct reg_rrl *rrl;
 	bool scrub;
@@ -231,8 +255,7 @@ void skx_show_rrl(struct decoded_addr *res, char *msg, int len, bool scrub_err)
 	if (!imc->mbase)
 		return;
 
-	rrl = imc->hbm_mc ? skx_res_cfg->reg_rrl_hbm[pch] : skx_res_cfg->reg_rrl_ddr;
-
+	rrl = get_rrl_reg(res, skx_res_cfg);
 	if (!rrl)
 		return;
 
diff --git a/drivers/edac/skx_common.h b/drivers/edac/skx_common.h
index 38d96bf71fd9..6d4cf0dd412a 100644
--- a/drivers/edac/skx_common.h
+++ b/drivers/edac/skx_common.h
@@ -283,7 +283,7 @@ struct res_config {
 	int hbm_chan_mmio_sz;
 	bool support_ddr5;
 	/* RRL register sets per DDR channel */
-	struct reg_rrl *reg_rrl_ddr;
+	struct reg_rrl *reg_rrl_ddr[2];
 	/* RRL register sets per HBM channel */
 	struct reg_rrl *reg_rrl_hbm[2];
 	/* RRL control mode */
-- 
2.43.0

