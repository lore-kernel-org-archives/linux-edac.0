Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7249A3A9002;
	Mon,  6 Jul 2026 03:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308510; cv=none; b=PB+MzWN1CV6yHCaicq57eK7Y1T/NGWM9icI78mGT32uIxbZ/vzNuFtEaZ3UAiLuRVlSvHcWUbvLfWXj8Nita6GDF5owAvl2cL7wz1nt0iczkUcgb22XtbS72tNfloNnvMzFR7XIdkUaxvmlkx0/KXZDRmBX6htmeLuACWniAExQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308510; c=relaxed/simple;
	bh=D81IPOMTYBf9SQ7ePQDGAbUrFCmknmM2kR20In4Cz5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ri5shK4yXyVZ/i6RnvJBJ3cuL7Yozr7erZBMgpcEH30nFWfDksh0mTYVQj6fJInN+02wXe489PYt7npX6QZdvl5Xo2UQmY2ynXUdbW9u5QhvAzT2MvBtP4iTHbJ4r1qFhgnoVD9jrox7lt5/Itnk/zUu2uvyogMzmlmmhtkt6Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjjXUvW9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjjXUvW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783308509; x=1814844509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D81IPOMTYBf9SQ7ePQDGAbUrFCmknmM2kR20In4Cz5U=;
  b=OjjXUvW901e3ZYrbHG1K65AqCt6B6LDQriCL33Sw3z+SCNlipOFbzbzP
   Sy2t150PM0o3Z4qHYS+UvbEqBruQpY7HtSXTLi6C7HPL8K8Dgw0sMBL/P
   MjUMGRCIk2nPQIwJmnz8DqWQUQos4ATOayTx8zeJ11ZmCUlWRcKipwM2t
   J4dXtICOc61lJgzC6vzdAuO+4P9DlVDsJgqHX5EW8utkrB7Fl4wNmkDup
   DiC5gR1fPB0NGAfBGZPINK2uinVBlPtdrMBcQkp4qn9z0a2OK4AzLrF4m
   htRBQq4nk3aTPMWOZDdGyD4EROIrK3V9Hgp54zLKG7JVeso8f4bTQtMVc
   A==;
X-CSE-ConnectionGUID: C6p7tOdNQFOrQUKMVbRC2Q==
X-CSE-MsgGUID: VxqDYHO+TPef8hVVgRLVFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="71456442"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="71456442"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:28:29 -0700
X-CSE-ConnectionGUID: BbHJLSJkR8OCznICuXP2yA==
X-CSE-MsgGUID: GMNXPUxcR2O1c76c/beBKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258487962"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:28:27 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] EDAC/igen6: Detect present memory controllers at runtime
Date: Mon,  6 Jul 2026 11:22:31 +0800
Message-ID: <20260706032233.3283297-9-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
References: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The igen6_edac currently relies on res_config::num_imc to describe the
number of memory controllers supported by each SoC. As a result, adding
support for a new platform requires updating this configuration even
though the hardware can be discovered at runtime.

Instead, detect the number of present memory controllers at runtime and
size the driver state accordingly. This eliminates the need to update
res_config whenever a new SoC variant is added.

Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 97 ++++++++++++++++++++++++++-------------
 1 file changed, 64 insertions(+), 33 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index 2960af172c57..d468c655348c 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -42,7 +42,8 @@
 
 #define GET_BITFIELD(v, lo, hi) (((v) & GENMASK_ULL(hi, lo)) >> (lo))
 
-#define NUM_IMC				2 /* Max memory controllers */
+/* Probing upper bound, not a hardware capability limit. */
+#define MAX_IMC_TO_PROBE		8
 #define NUM_CHANNELS			2 /* Max channels */
 #define NUM_DIMMS			2 /* Max DIMMs per channel */
 
@@ -182,11 +183,11 @@ static struct res_config {
 } *res_cfg;
 
 static struct igen6_pvt {
-	struct igen6_imc imc[NUM_IMC];
 	void __iomem *memss_pma_cr;
 	u64 ms_hash;
 	u64 ms_s_size;
 	int ms_l_map;
+	struct igen6_imc imc[];
 } *igen6_pvt;
 
 /* The top of low usable DRAM */
@@ -353,6 +354,46 @@ static int get_mchbar(struct pci_dev *pdev, u64 *mchbar)
 	return 0;
 }
 
+/* Check whether the memory controller is absent. */
+static bool imc_absent(void __iomem *window)
+{
+	return readl(window + MAD_INTER_CHANNEL_OFFSET) == ~0;
+}
+
+/* Return MMIO base address of the memory controller if it's present, otherwise return NULL. */
+static void __iomem *map_imc_window(u64 mchbar, int pmc)
+{
+	void __iomem *window;
+
+	window = ioremap(mchbar + pmc * MCHBAR_SIZE, MCHBAR_SIZE);
+	if (!window)
+		return NULL;
+
+	if (imc_absent(window)) {
+		iounmap(window);
+		return NULL;
+	}
+
+	return window;
+}
+
+/* Return the number of present memory controllers. */
+static int get_imc_num(u64 mchbar)
+{
+	void __iomem *window;
+	int lmc, pmc;
+
+	for (lmc = 0, pmc = 0; pmc < MAX_IMC_TO_PROBE; pmc++) {
+		window = map_imc_window(mchbar, pmc);
+		if (window) {
+			iounmap(window);
+			lmc++;
+		}
+	}
+
+	return lmc;
+}
+
 static bool ehl_ibecc_available(struct pci_dev *pdev)
 {
 	u32 v;
@@ -1457,18 +1498,27 @@ static struct igen6_pvt *igen6_pvt_setup(struct pci_dev *pdev)
 {
 	void __iomem *memss_pma_cr;
 	struct igen6_pvt *pvt;
+	int imc_num, rc;
 	u64 mchbar;
-	int rc;
-
-	pvt = kzalloc_obj(*igen6_pvt);
-	if (!pvt)
-		return NULL;
 
 	rc = get_mchbar(pdev, &mchbar);
-	if (rc) {
-		kfree(pvt);
+	if (rc)
+		return NULL;
+
+	imc_num = get_imc_num(mchbar);
+	if (!imc_num) {
+		igen6_printk(KERN_ERR, "No mc found.\n");
 		return NULL;
 	}
+	edac_dbg(2, "%d mcs found.\n", imc_num);
+
+	/* Use the runtime detected IMC count. */
+	if (res_cfg->num_imc != imc_num)
+		res_cfg->num_imc = imc_num;
+
+	pvt = kzalloc_flex(*pvt, imc, imc_num);
+	if (!pvt)
+		return NULL;
 
 	memss_pma_cr = ioremap(mchbar, MCHBAR_SIZE * 2);
 	if (!memss_pma_cr) {
@@ -1553,12 +1603,6 @@ static void igen6_check(struct mem_ctl_info *mci)
 		irq_work_queue(&ecclog_irq_work);
 }
 
-/* Check whether the memory controller is absent. */
-static bool igen6_imc_absent(void __iomem *window)
-{
-	return readl(window + MAD_INTER_CHANNEL_OFFSET) == ~0;
-}
-
 static void imc_release(struct device *dev)
 {
 	/* Nothing to do, the 'imc' owns the 'dev' and will also release it. */
@@ -1670,26 +1714,15 @@ static int igen6_register_mcis(struct pci_dev *pdev, u64 mchbar)
 {
 	void __iomem *window;
 	int lmc, pmc, rc;
-	u64 base;
 
-	for (lmc = 0, pmc = 0; pmc < NUM_IMC; pmc++) {
-		base   = mchbar + pmc * MCHBAR_SIZE;
-		window = ioremap(base, MCHBAR_SIZE);
-		if (!window) {
-			igen6_printk(KERN_ERR, "Failed to ioremap 0x%llx for mc%d\n", base, pmc);
-			rc = -ENOMEM;
-			goto out_unregister_mcis;
-		}
-
-		if (igen6_imc_absent(window)) {
-			iounmap(window);
-			edac_dbg(2, "Skip absent mc%d\n", pmc);
+	for (lmc = 0, pmc = 0; pmc < MAX_IMC_TO_PROBE; pmc++) {
+		window = map_imc_window(mchbar, pmc);
+		if (!window)
 			continue;
-		}
 
 		rc = igen6_register_mci(lmc, window, pdev);
 		if (rc)
-			goto out_iounmap;
+			goto err_unregister;
 
 		/* Done, if all present MCs are detected and registered. */
 		if (++lmc >= res_cfg->num_imc)
@@ -1709,10 +1742,8 @@ static int igen6_register_mcis(struct pci_dev *pdev, u64 mchbar)
 
 	return 0;
 
-out_iounmap:
+err_unregister:
 	iounmap(window);
-
-out_unregister_mcis:
 	igen6_unregister_mcis();
 
 	return rc;
-- 
2.43.0

