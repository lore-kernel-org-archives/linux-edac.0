Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E0A32AABA;
	Thu, 21 May 2026 07:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349196; cv=none; b=Go9hXTN4E5phTAORR1xSrvbXdh8jsxH2sIlQNZFIvEmLkFPqZ9e13KPFwNnPmQXwWaSPKYMDY9DD6MlxzaglL5OrTFg3npdX4C6JDnh7Uvk21C6RgF9fNzHCqxS7pCsl69zyyn6w8IsGGxR8iLpk6L6+r55LKHU7MTqaCGn9/Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349196; c=relaxed/simple;
	bh=VtCZUf6oMg0H7hNR01fJAQtLx0AL5TMyVAyXRDqnWaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbz4v9Pwy+vvDj4gX0OtrW94DNSw7zN9yvJAg9l/zfXPytFURO27Ws7LZE2SkXtg5E8aZUqh1jfIaaS9ewH7B7WzCaL0d/xJK6e6uB50kTnG+2FEQdJxVUgyHjGj1mfdwyl9+yISksdKn+Z94APOSbtGMfon8QNNjWTjbKc80fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEDfdTvI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEDfdTvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349194; x=1810885194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VtCZUf6oMg0H7hNR01fJAQtLx0AL5TMyVAyXRDqnWaI=;
  b=WEDfdTvIRBQ83Cdr1YYEk403dETcINjUuAxNmI3L6aWFX6Nl4pFOb+XM
   tYwB+l4zFHV1PE6kU0fHvjZtTiN8wJybKqv6rxTWKLUSPBsDWe2xChH8g
   mvPMMn88RPTZMAXPf3puntfwNH+d434+RpiWtLVZ576MTOQ4uKUQnmh+H
   fud4Sh2quNAHIvtFUSoeEyBBcdjZELXoy6hZh/d8yJ6iw0HF3ulJoGjw/
   aUzyVSH+qYnwz5vmQv1t8VEWx4T/r2eBvsSGE7z36G6YEa90jz1OfySsJ
   gt6m1oCcnCBRE/TVd7/9y8Ky3ffLVciUBLzsIAfusiU7YLyjuQrt/UI1S
   A==;
X-CSE-ConnectionGUID: sxUjGohSQRKM/mrBU/n5gw==
X-CSE-MsgGUID: jZWDZanbSYWFmIC73hiBZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97690582"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97690582"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:39:49 -0700
X-CSE-ConnectionGUID: r8aH96m/Tq2UYm3TyWmRbg==
X-CSE-MsgGUID: 5WnNEN3nSsqjn/OEnUL0qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263973810"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:39:46 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] EDAC/{skx_common,i10nm}: Move RRL handling to common code
Date: Thu, 21 May 2026 15:31:09 +0800
Message-ID: <20260521073112.3881223-6-qiuxu.zhuo@intel.com>
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

Move RRL (Retry Read error Log)  handling from i10nm_edac to skx_common
so it can be shared across EDAC drivers (e.g. imh_edac).

- Move RRL enable/disable and log dumping helpers to skx_common
  to avoid code duplication and enable reuse by other drivers.

- Export skx_enable_rrl() and skx_show_rrl()
  so common RRL handling can be used by i10nm_edac and imh_edac.

No functional change intended.

Tested-by: Yi Lai <yi1.lai@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/i10nm_base.c | 191 +-------------------------------------
 drivers/edac/skx_common.c | 186 +++++++++++++++++++++++++++++++++++++
 drivers/edac/skx_common.h |   2 +
 3 files changed, 191 insertions(+), 188 deletions(-)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index fe148f1f2319..2e21eefbb4f5 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -183,191 +183,6 @@ static struct reg_rrl gnr_reg_rrl_ddr = {
 	.cecnt_widths	= {4, 4, 4, 4, 4, 4, 4, 4},
 };
 
-static void enable_rrl(struct skx_imc *imc, int chan, struct reg_rrl *rrl,
-		       int rrl_set, bool enable, u32 *rrl_ctl)
-{
-	enum rrl_source_type source = rrl->sources[rrl_set];
-	u32 offset = rrl->offsets[rrl_set][0], v;
-	u8 width = rrl->widths[0];
-	bool first, scrub;
-
-	/* First or last read error. */
-	first = (source == RRL_SRC_FRE_SCRUB || source == RRL_SRC_FRE_DEMAND);
-	/* Patrol scrub or on-demand read error. */
-	scrub = (source == RRL_SRC_FRE_SCRUB || source == RRL_SRC_LRE_SCRUB);
-
-	v = skx_read_imc_reg(imc, chan, offset, width);
-
-	if (enable) {
-		/* Save default configurations. */
-		*rrl_ctl = v;
-		v &= ~rrl->uc_mask;
-
-		if (first)
-			v |= rrl->noover_mask;
-		else
-			v &= ~rrl->noover_mask;
-
-		if (scrub)
-			v |= rrl->en_patspr_mask;
-		else
-			v &= ~rrl->en_patspr_mask;
-
-		v |= rrl->en_mask;
-	} else {
-		/* Restore default configurations. */
-		if (*rrl_ctl & rrl->uc_mask)
-			v |= rrl->uc_mask;
-
-		if (first) {
-			if (!(*rrl_ctl & rrl->noover_mask))
-				v &= ~rrl->noover_mask;
-		} else {
-			if (*rrl_ctl & rrl->noover_mask)
-				v |= rrl->noover_mask;
-		}
-
-		if (scrub) {
-			if (!(*rrl_ctl & rrl->en_patspr_mask))
-				v &= ~rrl->en_patspr_mask;
-		} else {
-			if (*rrl_ctl & rrl->en_patspr_mask)
-				v |= rrl->en_patspr_mask;
-		}
-
-		if (!(*rrl_ctl & rrl->en_mask))
-			v &= ~rrl->en_mask;
-	}
-
-	skx_write_imc_reg(imc, chan, offset, width, v);
-}
-
-static void enable_rrls(struct skx_imc *imc, int chan, struct reg_rrl *rrl,
-			bool enable, u32 *rrl_ctl)
-{
-	for (int i = 0; i < rrl->set_num; i++)
-		enable_rrl(imc, chan, rrl, i, enable, rrl_ctl + i);
-}
-
-static void enable_rrls_ddr(struct skx_imc *imc, bool enable)
-{
-	struct reg_rrl *rrl_ddr = res_cfg->reg_rrl_ddr;
-	int i, chan_num = res_cfg->ddr_chan_num;
-	struct skx_channel *chan = imc->chan;
-
-	if (!imc->mbase)
-		return;
-
-	for (i = 0; i < chan_num; i++)
-		enable_rrls(imc, i, rrl_ddr, enable, chan[i].rrl_ctl[0]);
-}
-
-static void enable_rrls_hbm(struct skx_imc *imc, bool enable)
-{
-	struct reg_rrl **rrl_hbm = res_cfg->reg_rrl_hbm;
-	int i, chan_num = res_cfg->hbm_chan_num;
-	struct skx_channel *chan = imc->chan;
-
-	if (!imc->mbase || !imc->hbm_mc || !rrl_hbm[0] || !rrl_hbm[1])
-		return;
-
-	for (i = 0; i < chan_num; i++) {
-		enable_rrls(imc, i, rrl_hbm[0], enable, chan[i].rrl_ctl[0]);
-		enable_rrls(imc, i, rrl_hbm[1], enable, chan[i].rrl_ctl[1]);
-	}
-}
-
-static void enable_retry_rd_err_log(bool enable)
-{
-	struct skx_dev *d;
-	int i, imc_num;
-
-	edac_dbg(2, "\n");
-
-	list_for_each_entry(d, i10nm_edac_list, list) {
-		imc_num  = res_cfg->ddr_imc_num;
-		for (i = 0; i < imc_num; i++)
-			enable_rrls_ddr(&d->imc[i], enable);
-
-		imc_num += res_cfg->hbm_imc_num;
-		for (; i < imc_num; i++)
-			enable_rrls_hbm(&d->imc[i], enable);
-	}
-}
-
-static void show_retry_rd_err_log(struct decoded_addr *res, char *msg,
-				  int len, bool scrub_err)
-{
-	int i, j, n, ch = res->channel, pch = res->cs & 1;
-	struct skx_imc *imc = &res->dev->imc[res->imc];
-	u64 log, corr, status_mask;
-	struct reg_rrl *rrl;
-	bool scrub;
-	u32 offset;
-	u8 width;
-
-	if (!imc->mbase)
-		return;
-
-	rrl = imc->hbm_mc ? res_cfg->reg_rrl_hbm[pch] : res_cfg->reg_rrl_ddr;
-
-	if (!rrl)
-		return;
-
-	status_mask = rrl->over_mask | rrl->uc_mask | rrl->v_mask;
-
-	n = scnprintf(msg, len, " retry_rd_err_log[");
-	for (i = 0; i < rrl->set_num; i++) {
-		scrub = (rrl->sources[i] == RRL_SRC_FRE_SCRUB || rrl->sources[i] == RRL_SRC_LRE_SCRUB);
-		if (scrub_err != scrub)
-			continue;
-
-		for (j = 0; j < rrl->reg_num && len - n > 0; j++) {
-			offset = rrl->offsets[i][j];
-			width = rrl->widths[j];
-			log = skx_read_imc_reg(imc, ch, offset, width);
-
-			if (width == 4)
-				n += scnprintf(msg + n, len - n, "%.8llx ", log);
-			else
-				n += scnprintf(msg + n, len - n, "%.16llx ", log);
-
-			/* Clear RRL status if RRL in Linux control mode. */
-			if (res_cfg->rrl_ctrl_mode == RRL_CTRL_LINUX && !j && (log & status_mask))
-				skx_write_imc_reg(imc, ch, offset, width, log & ~status_mask);
-		}
-	}
-
-	/* Move back one space. */
-	n--;
-	n += scnprintf(msg + n, len - n, "]");
-
-	if (len - n > 0) {
-		n += scnprintf(msg + n, len - n, " correrrcnt[");
-		for (i = 0; i < rrl->cecnt_num && len - n > 0; i++) {
-			offset = rrl->cecnt_offsets[i];
-			width = rrl->cecnt_widths[i];
-			corr = skx_read_imc_reg(imc, ch, offset, width);
-
-			/* CPUs {ICX,SPR} encode two counters per 4-byte CORRERRCNT register. */
-			if (res_cfg->type <= SPR) {
-				n += scnprintf(msg + n, len - n, "%.4llx %.4llx ",
-					      corr & 0xffff, corr >> 16);
-			} else {
-			/* CPUs {GNR} encode one counter per CORRERRCNT register. */
-				if (width == 4)
-					n += scnprintf(msg + n, len - n, "%.8llx ", corr);
-				else
-					n += scnprintf(msg + n, len - n, "%.16llx ", corr);
-			}
-		}
-
-		/* Move back one space. */
-		n--;
-		n += scnprintf(msg + n, len - n, "]");
-	}
-}
-
 static struct pci_dev *pci_get_dev_wrapper(int dom, unsigned int bus,
 					   unsigned int dev, unsigned int fun)
 {
@@ -1209,9 +1024,9 @@ static int __init i10nm_init(void)
 
 	res_cfg->rrl_ctrl_mode = retry_rd_err_log;
 	if (retry_rd_err_log && res_cfg->reg_rrl_ddr) {
-		skx_set_show_rrl(show_retry_rd_err_log);
+		skx_set_show_rrl(skx_show_rrl);
 		if (retry_rd_err_log == RRL_CTRL_LINUX)
-			enable_retry_rd_err_log(true);
+			skx_enable_rrl(true);
 	}
 
 	skx_set_decode(i10nm_mc_decode);
@@ -1232,7 +1047,7 @@ static void __exit i10nm_exit(void)
 
 	if (retry_rd_err_log && res_cfg->reg_rrl_ddr) {
 		if (retry_rd_err_log == RRL_CTRL_LINUX)
-			enable_retry_rd_err_log(false);
+			skx_enable_rrl(false);
 		skx_set_show_rrl(NULL);
 	}
 
diff --git a/drivers/edac/skx_common.c b/drivers/edac/skx_common.c
index 2cdef2e69d71..f769a354ea45 100644
--- a/drivers/edac/skx_common.c
+++ b/drivers/edac/skx_common.c
@@ -102,6 +102,192 @@ void skx_write_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width, u64
 }
 EXPORT_SYMBOL_GPL(skx_write_imc_reg);
 
+static void enable_rrl(struct skx_imc *imc, int chan, struct reg_rrl *rrl,
+		       int rrl_set, bool enable, u32 *rrl_ctl)
+{
+	enum rrl_source_type source = rrl->sources[rrl_set];
+	u32 offset = rrl->offsets[rrl_set][0], v;
+	u8 width = rrl->widths[0];
+	bool first, scrub;
+
+	/* First or last read error. */
+	first = (source == RRL_SRC_FRE_SCRUB || source == RRL_SRC_FRE_DEMAND);
+	/* Patrol scrub or on-demand read error. */
+	scrub = (source == RRL_SRC_FRE_SCRUB || source == RRL_SRC_LRE_SCRUB);
+
+	v = skx_read_imc_reg(imc, chan, offset, width);
+
+	if (enable) {
+		/* Save default configurations. */
+		*rrl_ctl = v;
+		v &= ~rrl->uc_mask;
+
+		if (first)
+			v |= rrl->noover_mask;
+		else
+			v &= ~rrl->noover_mask;
+
+		if (scrub)
+			v |= rrl->en_patspr_mask;
+		else
+			v &= ~rrl->en_patspr_mask;
+
+		v |= rrl->en_mask;
+	} else {
+		/* Restore default configurations. */
+		if (*rrl_ctl & rrl->uc_mask)
+			v |= rrl->uc_mask;
+
+		if (first) {
+			if (!(*rrl_ctl & rrl->noover_mask))
+				v &= ~rrl->noover_mask;
+		} else {
+			if (*rrl_ctl & rrl->noover_mask)
+				v |= rrl->noover_mask;
+		}
+
+		if (scrub) {
+			if (!(*rrl_ctl & rrl->en_patspr_mask))
+				v &= ~rrl->en_patspr_mask;
+		} else {
+			if (*rrl_ctl & rrl->en_patspr_mask)
+				v |= rrl->en_patspr_mask;
+		}
+
+		if (!(*rrl_ctl & rrl->en_mask))
+			v &= ~rrl->en_mask;
+	}
+
+	skx_write_imc_reg(imc, chan, offset, width, v);
+}
+
+static void enable_rrls(struct skx_imc *imc, int chan, struct reg_rrl *rrl,
+			bool enable, u32 *rrl_ctl)
+{
+	for (int i = 0; i < rrl->set_num; i++)
+		enable_rrl(imc, chan, rrl, i, enable, rrl_ctl + i);
+}
+
+static void enable_rrls_ddr(struct skx_imc *imc, bool enable)
+{
+	struct reg_rrl *rrl_ddr = skx_res_cfg->reg_rrl_ddr;
+	int i, chan_num = skx_res_cfg->ddr_chan_num;
+	struct skx_channel *chan = imc->chan;
+
+	if (!imc->mbase)
+		return;
+
+	for (i = 0; i < chan_num; i++)
+		enable_rrls(imc, i, rrl_ddr, enable, chan[i].rrl_ctl[0]);
+}
+
+static void enable_rrls_hbm(struct skx_imc *imc, bool enable)
+{
+	struct reg_rrl **rrl_hbm = skx_res_cfg->reg_rrl_hbm;
+	int i, chan_num = skx_res_cfg->hbm_chan_num;
+	struct skx_channel *chan = imc->chan;
+
+	if (!imc->mbase || !imc->hbm_mc || !rrl_hbm[0] || !rrl_hbm[1])
+		return;
+
+	for (i = 0; i < chan_num; i++) {
+		enable_rrls(imc, i, rrl_hbm[0], enable, chan[i].rrl_ctl[0]);
+		enable_rrls(imc, i, rrl_hbm[1], enable, chan[i].rrl_ctl[1]);
+	}
+}
+
+void skx_enable_rrl(bool enable)
+{
+	struct skx_dev *d;
+	int i, imc_num;
+
+	edac_dbg(2, "\n");
+
+	list_for_each_entry(d, &dev_edac_list, list) {
+		imc_num  = skx_res_cfg->ddr_imc_num;
+		for (i = 0; i < imc_num; i++)
+			enable_rrls_ddr(&d->imc[i], enable);
+
+		imc_num += skx_res_cfg->hbm_imc_num;
+		for (; i < imc_num; i++)
+			enable_rrls_hbm(&d->imc[i], enable);
+	}
+}
+EXPORT_SYMBOL_GPL(skx_enable_rrl);
+
+void skx_show_rrl(struct decoded_addr *res, char *msg, int len, bool scrub_err)
+{
+	int i, j, n, ch = res->channel, pch = res->cs & 1;
+	struct skx_imc *imc = &res->dev->imc[res->imc];
+	u64 log, corr, status_mask;
+	struct reg_rrl *rrl;
+	bool scrub;
+	u32 offset;
+	u8 width;
+
+	if (!imc->mbase)
+		return;
+
+	rrl = imc->hbm_mc ? skx_res_cfg->reg_rrl_hbm[pch] : skx_res_cfg->reg_rrl_ddr;
+
+	if (!rrl)
+		return;
+
+	status_mask = rrl->over_mask | rrl->uc_mask | rrl->v_mask;
+
+	n = scnprintf(msg, len, " retry_rd_err_log[");
+	for (i = 0; i < rrl->set_num; i++) {
+		scrub = (rrl->sources[i] == RRL_SRC_FRE_SCRUB || rrl->sources[i] == RRL_SRC_LRE_SCRUB);
+		if (scrub_err != scrub)
+			continue;
+
+		for (j = 0; j < rrl->reg_num && len - n > 0; j++) {
+			offset = rrl->offsets[i][j];
+			width = rrl->widths[j];
+			log = skx_read_imc_reg(imc, ch, offset, width);
+
+			if (width == 4)
+				n += scnprintf(msg + n, len - n, "%.8llx ", log);
+			else
+				n += scnprintf(msg + n, len - n, "%.16llx ", log);
+
+			/* Clear RRL status if RRL in Linux control mode. */
+			if (skx_res_cfg->rrl_ctrl_mode == RRL_CTRL_LINUX && !j && (log & status_mask))
+				skx_write_imc_reg(imc, ch, offset, width, log & ~status_mask);
+		}
+	}
+
+	/* Move back one space. */
+	n--;
+	n += scnprintf(msg + n, len - n, "]");
+
+	if (len - n > 0) {
+		n += scnprintf(msg + n, len - n, " correrrcnt[");
+		for (i = 0; i < rrl->cecnt_num && len - n > 0; i++) {
+			offset = rrl->cecnt_offsets[i];
+			width = rrl->cecnt_widths[i];
+			corr = skx_read_imc_reg(imc, ch, offset, width);
+
+			/* CPUs {ICX,SPR} encode two counters per 4-byte CORRERRCNT register. */
+			if (skx_res_cfg->type <= SPR) {
+				n += scnprintf(msg + n, len - n, "%.4llx %.4llx ",
+					      corr & 0xffff, corr >> 16);
+			} else {
+			/* CPUs {GNR} encode one counter per CORRERRCNT register. */
+				if (width == 4)
+					n += scnprintf(msg + n, len - n, "%.8llx ", corr);
+				else
+					n += scnprintf(msg + n, len - n, "%.16llx ", corr);
+			}
+		}
+
+		/* Move back one space. */
+		n--;
+		n += scnprintf(msg + n, len - n, "]");
+	}
+}
+EXPORT_SYMBOL_GPL(skx_show_rrl);
+
 int skx_adxl_get(void)
 {
 	const char * const *names;
diff --git a/drivers/edac/skx_common.h b/drivers/edac/skx_common.h
index 4091431356d6..eea2d95cc0ac 100644
--- a/drivers/edac/skx_common.h
+++ b/drivers/edac/skx_common.h
@@ -344,6 +344,8 @@ int skx_adxl_get(void);
 void skx_adxl_put(void);
 void skx_set_decode(skx_decode_f decode);
 void skx_set_show_rrl(skx_show_rrl_f rrl);
+void skx_show_rrl(struct decoded_addr *res, char *msg, int len, bool scrub_err);
+void skx_enable_rrl(bool enable);
 void skx_set_mem_cfg(bool mem_cfg_2lm);
 void skx_set_res_cfg(struct res_config *cfg);
 void skx_init_mc_mapping(struct skx_dev *d);
-- 
2.43.0

