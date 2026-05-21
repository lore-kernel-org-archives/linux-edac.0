Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D322FD1CA;
	Thu, 21 May 2026 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349114; cv=none; b=BfEq5g5UMIxEE4AOOqvPjZJnej3qO+5WPgE/52XAUsJc9w3C9WwV3CGEUNect+mkvoqftrozx41d32snHQT0GXVx99hIvInWKJHWtwkQ3pE82nloO1Q+PH4IchiWWcxdARWa3B7yxxaSow9Yo3I23lzlXLvVDZ9Fn2cyY5AnTBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349114; c=relaxed/simple;
	bh=Mbe5hz6Y3uNxsC5wAEABVT3EVK/RvFRtN/WI3+KXuP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a1K0yJnAPnGurjhcvsGtRzl0UYNedBSKKhynJbXi5qaEVoWIwvbkdnqVsItU7RF2z9FHVBy5UBClkn6QQPojGN4q83/VDd0wdEIieUy6PzTofHIGrC4yIIdi1nn350+NMNOQ8dC6Hj8e49B9gAcr+1qqIdo8y2NjyDYnFk487kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTj3/LvT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTj3/LvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349113; x=1810885113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mbe5hz6Y3uNxsC5wAEABVT3EVK/RvFRtN/WI3+KXuP0=;
  b=nTj3/LvT66UYdWFTmXq/hacMb84hCAlaMkZEi9IOIoNMt2k3d427m0Ir
   SKMqMoCZoHZQao69BHUEBoOchoedpfdLJjQ/FKuxuKRmloUfPACtGVcwW
   71E5yv4OoyaRp0hL3BJ57y83LNh6qGQrjBM7QlFNrfyk6pY/fZLG1QMlo
   eG1rwA8521odrW1uRCTBINO8k8ItOgBgZcBkdcn0p0FIWXTUz9NKi3yhQ
   3pWDG6grtz8K5+ESPEyh0gq+Z+3Q5bFFa9E9rB1bD/3OtpgynoUr9l7UX
   9D49p2W44iRSwgRjjM2N64lgI8VYjDFOMEmCyR3Jhy4vG5HOa74YT3ZsO
   g==;
X-CSE-ConnectionGUID: eBBor2EcSSOuwx9hRn/6wA==
X-CSE-MsgGUID: ppSFFjaBSwOeA8TrY2WKFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97690446"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97690446"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:38:33 -0700
X-CSE-ConnectionGUID: QfI10y9JS+WYig6E62qjKA==
X-CSE-MsgGUID: xuUzYuhuQUe4ntp5GjthWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263973378"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:38:30 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] EDAC/{skx_common,i10nm,imh}: Move MC register access helpers to skx_common
Date: Thu, 21 May 2026 15:31:05 +0800
Message-ID: <20260521073112.3881223-2-qiuxu.zhuo@intel.com>
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

Both i10nm_basic.c and imh_basic.c use identical helpers for accessing
memory controller MMIO-based registers. Move these helpers to skx_common.c
to eliminate code duplication. This change also prepares for an upcoming
patch that will move RRL(retry_rd_err_log) code from i10nm_basic.c to
skx_common.c, which requires these helpers to be available in skx_common.c.

Additionally, prefix these function names with 'skx_' to maintain naming
consistency within the file.

No functional changes intended.

Tested-by: Yi Lai <yi1.lai@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/i10nm_base.c | 39 ++++--------------------------
 drivers/edac/imh_base.c   | 33 ++++----------------------
 drivers/edac/skx_common.c | 50 +++++++++++++++++++++++++++++++++++++++
 drivers/edac/skx_common.h |  3 +++
 4 files changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index de6c52dbd9d2..0a0236583eb7 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -47,12 +47,6 @@
 	readl((m)->mbase + ((m)->hbm_mc ? 0xef8 :	\
 	(res_cfg->type == GNR ? 0xaf8 : 0x20ef8)) +	\
 	(i) * (m)->chan_mmio_sz)
-#define I10NM_GET_REG32(m, i, offset)	\
-	readl((m)->mbase + (i) * (m)->chan_mmio_sz + (offset))
-#define I10NM_GET_REG64(m, i, offset)	\
-	readq((m)->mbase + (i) * (m)->chan_mmio_sz + (offset))
-#define I10NM_SET_REG32(m, i, offset, v)	\
-	writel(v, (m)->mbase + (i) * (m)->chan_mmio_sz + (offset))
 
 #define I10NM_GET_SCK_MMIO_BASE(reg)	(GET_BITFIELD(reg, 0, 28) << 23)
 #define I10NM_GET_IMC_MMIO_OFFSET(reg)	(GET_BITFIELD(reg, 0, 10) << 12)
@@ -189,29 +183,6 @@ static struct reg_rrl gnr_reg_rrl_ddr = {
 	.cecnt_widths	= {4, 4, 4, 4, 4, 4, 4, 4},
 };
 
-static u64 read_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width)
-{
-	switch (width) {
-	case 4:
-		return I10NM_GET_REG32(imc, chan, offset);
-	case 8:
-		return I10NM_GET_REG64(imc, chan, offset);
-	default:
-		i10nm_printk(KERN_ERR, "Invalid read RRL 0x%x width %d\n", offset, width);
-		return 0;
-	}
-}
-
-static void write_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width, u64 val)
-{
-	switch (width) {
-	case 4:
-		return I10NM_SET_REG32(imc, chan, offset, (u32)val);
-	default:
-		i10nm_printk(KERN_ERR, "Invalid write RRL 0x%x width %d\n", offset, width);
-	}
-}
-
 static void enable_rrl(struct skx_imc *imc, int chan, struct reg_rrl *rrl,
 		       int rrl_set, bool enable, u32 *rrl_ctl)
 {
@@ -225,7 +196,7 @@ static void enable_rrl(struct skx_imc *imc, int chan, struct reg_rrl *rrl,
 	/* Patrol scrub or on-demand read error. */
 	scrub = (mode == FRE_SCRUB || mode == LRE_SCRUB);
 
-	v = read_imc_reg(imc, chan, offset, width);
+	v = skx_read_imc_reg(imc, chan, offset, width);
 
 	if (enable) {
 		/* Save default configurations. */
@@ -268,7 +239,7 @@ static void enable_rrl(struct skx_imc *imc, int chan, struct reg_rrl *rrl,
 			v &= ~rrl->en_mask;
 	}
 
-	write_imc_reg(imc, chan, offset, width, v);
+	skx_write_imc_reg(imc, chan, offset, width, v);
 }
 
 static void enable_rrls(struct skx_imc *imc, int chan, struct reg_rrl *rrl,
@@ -354,7 +325,7 @@ static void show_retry_rd_err_log(struct decoded_addr *res, char *msg,
 		for (j = 0; j < rrl->reg_num && len - n > 0; j++) {
 			offset = rrl->offsets[i][j];
 			width = rrl->widths[j];
-			log = read_imc_reg(imc, ch, offset, width);
+			log = skx_read_imc_reg(imc, ch, offset, width);
 
 			if (width == 4)
 				n += scnprintf(msg + n, len - n, "%.8llx ", log);
@@ -363,7 +334,7 @@ static void show_retry_rd_err_log(struct decoded_addr *res, char *msg,
 
 			/* Clear RRL status if RRL in Linux control mode. */
 			if (retry_rd_err_log == 2 && !j && (log & status_mask))
-				write_imc_reg(imc, ch, offset, width, log & ~status_mask);
+				skx_write_imc_reg(imc, ch, offset, width, log & ~status_mask);
 		}
 	}
 
@@ -376,7 +347,7 @@ static void show_retry_rd_err_log(struct decoded_addr *res, char *msg,
 		for (i = 0; i < rrl->cecnt_num && len - n > 0; i++) {
 			offset = rrl->cecnt_offsets[i];
 			width = rrl->cecnt_widths[i];
-			corr = read_imc_reg(imc, ch, offset, width);
+			corr = skx_read_imc_reg(imc, ch, offset, width);
 
 			/* CPUs {ICX,SPR} encode two counters per 4-byte CORRERRCNT register. */
 			if (res_cfg->type <= SPR) {
diff --git a/drivers/edac/imh_base.c b/drivers/edac/imh_base.c
index 40082ba45e62..dfdcfa127ce7 100644
--- a/drivers/edac/imh_base.c
+++ b/drivers/edac/imh_base.c
@@ -71,28 +71,11 @@ struct local_reg {
 		.width	= (cfg)->ip_name##_reg_##reg_name##_width,		\
 	}
 
-static u64 readx(void __iomem *addr, u8 width)
-{
-	switch (width) {
-	case 1:
-		return readb(addr);
-	case 2:
-		return readw(addr);
-	case 4:
-		return readl(addr);
-	case 8:
-		return readq(addr);
-	default:
-		imh_printk(KERN_ERR, "Invalid reg 0x%p width %d\n", addr, width);
-		return 0;
-	}
-}
-
 static void __read_local_reg(void *reg)
 {
 	struct local_reg *r = (struct local_reg *)reg;
 
-	r->val = readx(r->vbase + r->offset, r->width);
+	r->val = skx_readx(r->vbase + r->offset, r->width);
 }
 
 /* Read a local-view register. */
@@ -378,22 +361,16 @@ static bool imh_2lm_enabled(struct res_config *cfg, struct list_head *head)
 	return false;
 }
 
-/* Helpers to read memory controller registers */
-static u64 read_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width)
-{
-	return readx(imc->mbase + imc->chan_mmio_sz * chan + offset, width);
-}
-
 static u32 read_imc_mcmtr(struct res_config *cfg, struct skx_imc *imc, int chan)
 {
-	return (u32)read_imc_reg(imc, chan, cfg->ddr_reg_mcmtr_offset, cfg->ddr_reg_mcmtr_width);
+	return (u32)skx_read_imc_reg(imc, chan, cfg->ddr_reg_mcmtr_offset, cfg->ddr_reg_mcmtr_width);
 }
 
 static u32 read_imc_dimmmtr(struct res_config *cfg, struct skx_imc *imc, int chan, int dimm)
 {
-	return (u32)read_imc_reg(imc, chan, cfg->ddr_reg_dimmmtr_offset +
-				 cfg->ddr_reg_dimmmtr_width * dimm,
-				 cfg->ddr_reg_dimmmtr_width);
+	return (u32)skx_read_imc_reg(imc, chan, cfg->ddr_reg_dimmmtr_offset +
+				     cfg->ddr_reg_dimmmtr_width * dimm,
+				     cfg->ddr_reg_dimmmtr_width);
 }
 
 static bool ecc_enabled(u32 mcmtr)
diff --git a/drivers/edac/skx_common.c b/drivers/edac/skx_common.c
index f15de0ea96c8..1c4cc21679bc 100644
--- a/drivers/edac/skx_common.c
+++ b/drivers/edac/skx_common.c
@@ -52,6 +52,56 @@ static LIST_HEAD(dev_edac_list);
 static bool skx_mem_cfg_2lm;
 static struct res_config *skx_res_cfg;
 
+u64 skx_readx(void __iomem *addr, u8 width)
+{
+	switch (width) {
+	case 1:
+		return readb(addr);
+	case 2:
+		return readw(addr);
+	case 4:
+		return readl(addr);
+	case 8:
+		return readq(addr);
+	default:
+		skx_printk(KERN_ERR, "Invalid reg 0x%p width %u to read.\n", addr, width);
+		return 0;
+	}
+}
+EXPORT_SYMBOL_GPL(skx_readx);
+
+static void skx_writex(void __iomem *addr, u8 width, u64 val)
+{
+	switch (width) {
+	case 1:
+		writeb((u8)val, addr);
+		return;
+	case 2:
+		writew((u16)val, addr);
+		return;
+	case 4:
+		writel((u32)val, addr);
+		return;
+	case 8:
+		writeq(val, addr);
+		return;
+	default:
+		skx_printk(KERN_ERR, "Invalid reg 0x%p width %u to write 0x%llx.\n", addr, width, val);
+	}
+}
+
+u64 skx_read_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width)
+{
+	return skx_readx(imc->mbase + imc->chan_mmio_sz * chan + offset, width);
+}
+EXPORT_SYMBOL_GPL(skx_read_imc_reg);
+
+void skx_write_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width, u64 val)
+{
+	skx_writex(imc->mbase + imc->chan_mmio_sz * chan + offset, width, val);
+}
+EXPORT_SYMBOL_GPL(skx_write_imc_reg);
+
 int skx_adxl_get(void)
 {
 	const char * const *names;
diff --git a/drivers/edac/skx_common.h b/drivers/edac/skx_common.h
index f88038e5b18c..95412459a84f 100644
--- a/drivers/edac/skx_common.h
+++ b/drivers/edac/skx_common.h
@@ -326,6 +326,9 @@ typedef int (*get_dimm_config_f)(struct mem_ctl_info *mci,
 typedef bool (*skx_decode_f)(struct decoded_addr *res);
 typedef void (*skx_show_retry_log_f)(struct decoded_addr *res, char *msg, int len, bool scrub_err);
 
+u64 skx_readx(void __iomem *addr, u8 width);
+u64 skx_read_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width);
+void skx_write_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width, u64 val);
 int skx_adxl_get(void);
 void skx_adxl_put(void);
 void skx_set_decode(skx_decode_f decode, skx_show_retry_log_f show_retry_log);
-- 
2.43.0

