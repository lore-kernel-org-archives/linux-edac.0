Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778F62874FF;
	Thu, 21 May 2026 07:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349165; cv=none; b=jLceOMHW8qdTRywC98oj0h0/vVDfiPp9ipbsGqSF9vClsDdEY7STxhiWJfVRAzgB1WldnmvBkTQ8xwGoih+BuBozPUeaPBzGzQPfGJtRNv2HgEJvwaNiK8z9fHblsCVjp2ES5eXRJSa9tFMXkGYbr+mdFdkJ1eOuZ9i9sHqhhZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349165; c=relaxed/simple;
	bh=QIOnxwwbOtKXAf+rAxn1RuXBvvn9OJUmlMB4zbF2TXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VbU6P/Y0XkP/Tm9PEbVmlmo3IDsax60VLmBzkRqT9b4DmoxWFw1cXwkO9b3jo164rKi33dHjdUsr8OHFji7OZGuxhX2hVdKMP1Kvawsy+aIbTLEdAMOFzrip1ue8h6nHeZUlfnS3ADGQSkTcT4qwhquvxs/7HHHrk/HcumW2xoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHU63Uqg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHU63Uqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349162; x=1810885162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QIOnxwwbOtKXAf+rAxn1RuXBvvn9OJUmlMB4zbF2TXw=;
  b=PHU63UqgLvOQ5f+qIrTxGTouJuKq1kFUCqhBis8250BX+NbvNRDZ129D
   BDFOQFMEy5lwx1sUTsIYs3PIloU2MgmCiXArDHOr0kmpgqx/iMLySJg+P
   VsUd2Hnx+QwO5sVtypAjUYs5hckrRAXFQKS+K3gCJNaKnVLzIyqYN3GJB
   aC84aGqIrrFcXHlE+R9Y9fU6dD/GDMQ4VaPXJC+YARVYknAhCT1hkp88J
   aLzUPtts+eo3L6Dehcs9vaQj2LNZlOy51o0M1vVIUR8ygMr6e2Pxtb6nY
   PaeQTBu398QSgR4fwixVx6i/JqbmPAtC7kUNvJWH+1BTL3BfRvr/AJstM
   w==;
X-CSE-ConnectionGUID: cnblmgGhRoOcFaj6CzNlGA==
X-CSE-MsgGUID: v+8WPsbTRE64tIuZAWVnEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97690549"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97690549"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:39:19 -0700
X-CSE-ConnectionGUID: tP1QFIkvSlmViTzJXSZdCw==
X-CSE-MsgGUID: vuDSmtaeSpGkU4AJP1uLGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263973603"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:39:17 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] EDAC/{skx_common,skx,i10nm}: Split skx_set_decode()
Date: Thu, 21 May 2026 15:31:06 +0800
Message-ID: <20260521073112.3881223-3-qiuxu.zhuo@intel.com>
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

skx_set_decode() currently handles both address decoding and Retry
Read error Log (RRL) reporting, coupling two independent functions
in a single API. This complicates setup/teardown and forces callers
to update unrelated state.

Introduce skx_set_show_rrl() and keep skx_set_decode() focused on
decode setup, allowing decode and RRL handling to be managed
independently.

Also rename the callback type and variable to skx_show_rrl_f and
show_rrl for clearer RRL terminology and consistency.

No functional changes intended.

Tested-by: Yi Lai <yi1.lai@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/i10nm_base.c | 10 ++++++----
 drivers/edac/skx_base.c   |  6 +++---
 drivers/edac/skx_common.c | 15 ++++++++++-----
 drivers/edac/skx_common.h |  5 +++--
 4 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index 0a0236583eb7..c09790d5b95e 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -1208,13 +1208,13 @@ static int __init i10nm_init(void)
 	skx_setup_debug("i10nm_test");
 
 	if (retry_rd_err_log && res_cfg->reg_rrl_ddr) {
-		skx_set_decode(i10nm_mc_decode, show_retry_rd_err_log);
+		skx_set_show_rrl(show_retry_rd_err_log);
 		if (retry_rd_err_log == 2)
 			enable_retry_rd_err_log(true);
-	} else {
-		skx_set_decode(i10nm_mc_decode, NULL);
 	}
 
+	skx_set_decode(i10nm_mc_decode);
+
 	i10nm_printk(KERN_INFO, "%s\n", I10NM_REVISION);
 
 	return 0;
@@ -1227,10 +1227,12 @@ static void __exit i10nm_exit(void)
 {
 	edac_dbg(2, "\n");
 
+	skx_set_decode(NULL);
+
 	if (retry_rd_err_log && res_cfg->reg_rrl_ddr) {
-		skx_set_decode(NULL, NULL);
 		if (retry_rd_err_log == 2)
 			enable_retry_rd_err_log(false);
+		skx_set_show_rrl(NULL);
 	}
 
 	skx_teardown_debug();
diff --git a/drivers/edac/skx_base.c b/drivers/edac/skx_base.c
index aa6593ccda2d..de749413ff9a 100644
--- a/drivers/edac/skx_base.c
+++ b/drivers/edac/skx_base.c
@@ -671,14 +671,14 @@ static int __init skx_init(void)
 		}
 	}
 
-	skx_set_decode(skx_decode, skx_show_retry_rd_err_log);
+	skx_set_show_rrl(skx_show_retry_rd_err_log);
 
 	if (nvdimm_count && skx_adxl_get() != -ENODEV) {
-		skx_set_decode(NULL, skx_show_retry_rd_err_log);
+		skx_set_decode(NULL);
 	} else {
 		if (nvdimm_count)
 			skx_printk(KERN_NOTICE, "Only decoding DDR4 address!\n");
-		skx_set_decode(skx_decode, skx_show_retry_rd_err_log);
+		skx_set_decode(skx_decode);
 	}
 
 	/* Ensure that the OPSTATE is set correctly for POLL or NMI */
diff --git a/drivers/edac/skx_common.c b/drivers/edac/skx_common.c
index 1c4cc21679bc..2cdef2e69d71 100644
--- a/drivers/edac/skx_common.c
+++ b/drivers/edac/skx_common.c
@@ -46,7 +46,7 @@ static unsigned long adxl_nm_bitmap;
 
 static char skx_msg[MSG_SIZE];
 static skx_decode_f driver_decode;
-static skx_show_retry_log_f skx_show_retry_rd_err_log;
+static skx_show_rrl_f show_rrl;
 static u64 skx_tolm, skx_tohm;
 static LIST_HEAD(dev_edac_list);
 static bool skx_mem_cfg_2lm;
@@ -312,13 +312,18 @@ void skx_set_res_cfg(struct res_config *cfg)
 }
 EXPORT_SYMBOL_GPL(skx_set_res_cfg);
 
-void skx_set_decode(skx_decode_f decode, skx_show_retry_log_f show_retry_log)
+void skx_set_decode(skx_decode_f decode)
 {
 	driver_decode = decode;
-	skx_show_retry_rd_err_log = show_retry_log;
 }
 EXPORT_SYMBOL_GPL(skx_set_decode);
 
+void skx_set_show_rrl(skx_show_rrl_f rrl)
+{
+	show_rrl = rrl;
+}
+EXPORT_SYMBOL_GPL(skx_set_show_rrl);
+
 static int skx_get_pkg_id(struct skx_dev *d, u8 *id)
 {
 	int node;
@@ -767,8 +772,8 @@ static void skx_mce_output_error(struct mem_ctl_info *mci,
 			 res->row, res->column, res->bank_address, res->bank_group);
 	}
 
-	if (skx_show_retry_rd_err_log)
-		skx_show_retry_rd_err_log(res, skx_msg + len, MSG_SIZE - len, scrub_err);
+	if (show_rrl)
+		show_rrl(res, skx_msg + len, MSG_SIZE - len, scrub_err);
 
 	edac_dbg(0, "%s\n", skx_msg);
 
diff --git a/drivers/edac/skx_common.h b/drivers/edac/skx_common.h
index 95412459a84f..5a08f219e46d 100644
--- a/drivers/edac/skx_common.h
+++ b/drivers/edac/skx_common.h
@@ -324,14 +324,15 @@ struct res_config {
 typedef int (*get_dimm_config_f)(struct mem_ctl_info *mci,
 				 struct res_config *cfg);
 typedef bool (*skx_decode_f)(struct decoded_addr *res);
-typedef void (*skx_show_retry_log_f)(struct decoded_addr *res, char *msg, int len, bool scrub_err);
+typedef void (*skx_show_rrl_f)(struct decoded_addr *res, char *msg, int len, bool scrub_err);
 
 u64 skx_readx(void __iomem *addr, u8 width);
 u64 skx_read_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width);
 void skx_write_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width, u64 val);
 int skx_adxl_get(void);
 void skx_adxl_put(void);
-void skx_set_decode(skx_decode_f decode, skx_show_retry_log_f show_retry_log);
+void skx_set_decode(skx_decode_f decode);
+void skx_set_show_rrl(skx_show_rrl_f rrl);
 void skx_set_mem_cfg(bool mem_cfg_2lm);
 void skx_set_res_cfg(struct res_config *cfg);
 void skx_init_mc_mapping(struct skx_dev *d);
-- 
2.43.0

