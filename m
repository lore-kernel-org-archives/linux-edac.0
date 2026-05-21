Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E34C3F9267;
	Thu, 21 May 2026 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367487; cv=none; b=pU2UclBGoIkDRaFkPif9KU1ON0o4Yq48R1Ysf9KzuG+eoZRt4Xj3QEoPLYUKsAsmHT52hSy8/fNYfKG7td+vTyztdylvl3hJAcNNn0OWKJRss0UY8nJEMeRHGpPbQ2a0NpUvI8PmMjpfF7mqCa8zPsgVGj4J3KjAYaPQ1YuiqbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367487; c=relaxed/simple;
	bh=vl0PT/MORTjvkVXEPloURKq/4N2xHH2AuBE1J8ygcS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAk2HBVBIb4CGpYT8HupBw9ReX7C9jJRvvLf52/kqDU0N7etIkgSTSNe6In3qUOMzbTqnLDnYLu32jsvnFmJ7gb7PQezVP71N3jeI8wm3BG8uGkh3AduHpHi4t5aYnTY7nB7joBQmD4ezPfvX0oOwsvuU5o4fIcoTgcaV9fB9EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5FYaA39; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5FYaA39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779367483; x=1810903483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vl0PT/MORTjvkVXEPloURKq/4N2xHH2AuBE1J8ygcS4=;
  b=E5FYaA393RQvnQpQ9kKQLoh515GblIwzkhkjlG2rQtB62s5AsZlMF4tb
   cKHzWhkDcm6dZIX4oHqG99QjNAftsQshZFO8DlikQ8/niIQauieZ2RIii
   Mvkz2JiZHStgCnzwNjqHcHc7b9Rr0RuKdMfWRSYJplISBDRa55oGyeq1t
   dHSNA7KH8k/2xB7or9WEKkME6QMqEffOAaEzpbc+tZ6A12y8Riye36esB
   B/PofXjayeyz64f2BDjXK/dfPCMlLuhpSGCqtGD78DiTs9Nb4d+rw6ORJ
   IIrRvdwTBhVZ835v6YNM9OgaMUd8CBt+aV6dIatKE1AdNEhAiGnGjkKL8
   g==;
X-CSE-ConnectionGUID: hSUiJMwPQ/emCetqfkPw1Q==
X-CSE-MsgGUID: TTgiaLoLTOedI4R2Ci+dSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80265197"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80265197"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 05:44:42 -0700
X-CSE-ConnectionGUID: FZ38KbHwT7GvCp1U7fGjZQ==
X-CSE-MsgGUID: 1qZdHEYaQ2WlVbcD9ob2Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="236265146"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 05:44:40 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Jie Wang <jie.wang@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] EDAC/igen6: Make registers for detecting IBECC configurable
Date: Thu, 21 May 2026 20:38:11 +0800
Message-ID: <20260521123812.3961038-2-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521123812.3961038-1-qiuxu.zhuo@intel.com>
References: <20260521123812.3961038-1-qiuxu.zhuo@intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Intel CPUs with IBECC (In-Band ECC) capability use different registers
to indicate IBECC presence. Make IBECC detection registers CPU-model
specific and configure them properly for scalable IBECC detection.

No functional changes intended.

Tested-by: Jie Wang <jie.wang@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 55 +++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index f3e53d63eb54..a761d683eae3 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -151,6 +151,8 @@ static struct res_config {
 	/* MEMSS_PMA_CR registers. */
 	u32 reg_mem_config_offset;
 	u32 reg_mem_config_ddr_type_mask;
+	u32 reg_capabilities_misc_offset;
+	u32 reg_capabilities_misc_ibecc_dis;
 	/* Memory controller registers. */
 	u32 reg_mad_inter_size_mask[NUM_CHANNELS];
 	u64 reg_mad_inter_size_granularity;
@@ -405,27 +407,22 @@ static bool mtl_p_ibecc_available(struct pci_dev *pdev)
 	return !(CAPID_E_IBECC_BIT18 & v);
 }
 
-static bool mtl_ps_ibecc_available(struct pci_dev *pdev)
+static bool generic_ibecc_available(struct pci_dev *pdev)
 {
-#define MCHBAR_MEMSS_IBECCDIS	0x13c00
-	void __iomem *window;
-	u64 mchbar;
+	void __iomem *base = igen6_pvt->memss_pma_cr;
+	bool present;
 	u32 val;
 
-	if (get_mchbar(pdev, &mchbar))
-		return false;
-
-	window = ioremap(mchbar, MCHBAR_SIZE * 2);
-	if (!window) {
-		igen6_printk(KERN_ERR, "Failed to ioremap 0x%llx\n", mchbar);
-		return false;
+	if (res_cfg->reg_capabilities_misc_offset) {
+		val = readl(base + res_cfg->reg_capabilities_misc_offset);
+		present = !(val & res_cfg->reg_capabilities_misc_ibecc_dis);
+		edac_dbg(2, "capabilities misc reg 0x%x\n", val);
+	} else {
+		igen6_printk(KERN_ERR, "No register for detecting IBECC presence.\n");
+		present = false;
 	}
 
-	val = readl(window + MCHBAR_MEMSS_IBECCDIS);
-	iounmap(window);
-
-	/* Bit6: 1 - IBECC is disabled, 0 - IBECC isn't disabled */
-	return !GET_BITFIELD(val, 6, 6);
+	return present;
 }
 
 static u64 mem_addr_to_sys_addr(u64 maddr)
@@ -725,18 +722,20 @@ static struct res_config rpl_p_cfg = {
 };
 
 static struct res_config mtl_ps_cfg = {
-	.machine_check		= true,
-	.num_imc		= 2,
-	.reg_mchbar_mask	= GENMASK_ULL(41, 17),
-	.reg_tom_mask		= GENMASK_ULL(41, 20),
-	.reg_touud_mask		= GENMASK_ULL(41, 20),
-	.reg_eccerrlog_addr_mask = GENMASK_ULL(38, 5),
-	.imc_base		= 0xd800,
-	.ibecc_base		= 0xd400,
-	.ibecc_error_log_offset	= 0x170,
-	.ibecc_available	= mtl_ps_ibecc_available,
-	.err_addr_to_sys_addr	= adl_err_addr_to_sys_addr,
-	.err_addr_to_imc_addr	= adl_err_addr_to_imc_addr,
+	.machine_check				= true,
+	.num_imc				= 2,
+	.reg_mchbar_mask			= GENMASK_ULL(41, 17),
+	.reg_tom_mask				= GENMASK_ULL(41, 20),
+	.reg_touud_mask				= GENMASK_ULL(41, 20),
+	.reg_eccerrlog_addr_mask		= GENMASK_ULL(38, 5),
+	.reg_capabilities_misc_offset		= 0x13c00,
+	.reg_capabilities_misc_ibecc_dis	= BIT(6),
+	.imc_base				= 0xd800,
+	.ibecc_base				= 0xd400,
+	.ibecc_error_log_offset			= 0x170,
+	.ibecc_available			= generic_ibecc_available,
+	.err_addr_to_sys_addr			= adl_err_addr_to_sys_addr,
+	.err_addr_to_imc_addr			= adl_err_addr_to_imc_addr,
 };
 
 static struct res_config mtl_p_cfg = {
-- 
2.43.0

