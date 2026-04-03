Received: from out28-130.mail.aliyun.com (out28-130.mail.aliyun.com [115.124.28.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEC23AC0F3;
	Fri,  3 Apr 2026 10:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213966; cv=none; b=bsO482f4VyHMt3UcSxqUxwSXCN+lwCmGylUvyJ1zk4mOfVUw49HYGSX5ZA6eZAiTccgRI2ivZ3VCUAm1QV14NPuU6w7aL1oB4DfjQTIE1xER7YFVnOKbPoVFlaQVBbEse5uxV6IX5CJPPjagu9Jl19P0RwPyYCoHx8FbeSAS5aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213966; c=relaxed/simple;
	bh=jEH4NupTqcoh5OSDDBOiPw08baMwrRUn25spgOJSjmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TraAePCa48f7ndsSGf3bz4d9GLhZNuu5sHv594aMJpgvsoL5C8n/LtzrB1hTB0wL6t2wxk1AOs/h9cxu2Xo95RUrVoIEv9xMb5o9VUuFthKNjh3RuvtRqyplokrWLbXgJDALAQJkrxDDjb/Ki+H5v1obBpSsFO40LcImOSA7mVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_alarm|0.0137167-0.000863066-0.98542;FP=1959462715561411799|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037017159;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h4TkMGF_1775213950;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.h4TkMGF_1775213950 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 18:59:15 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH 10/10] EDAC/amd64: Add Hygon Family 0x18 models 0x4-0x8 support
Date: Fri,  3 Apr 2026 18:57:34 +0800
Message-ID: <f42a411d0f126662187fe7f764a907c4e4dcb20a.1775213147.git.shiaichun@open-hieco.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775213147.git.shiaichun@open-hieco.net>
References: <cover.1775213147.git.shiaichun@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add UMC base support for Hygon Family 0x18 models 0x4-0x8.
Add error channel fields from MCA IPID for Hygon.
Add distinct memory-controller counts for Hygon models 0x4/0x5.
Add Hygon node number support in amd64_edac_init() and amd64_edac_exit().

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/edac/amd64_edac.c | 68 ++++++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 12 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 8908ab881c85..4a24cf28e543 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -4,6 +4,7 @@
 #include "amd64_edac.h"
 #include <asm/amd/nb.h>
 #include <asm/amd/node.h>
+#include <asm/hygon/node.h>
 
 static struct edac_pci_ctl_info *pci_ctl;
 
@@ -98,6 +99,29 @@ int __amd64_write_pci_cfg_dword(struct pci_dev *pdev, int offset,
 	return pcibios_err_to_errno(err);
 }
 
+static u32 get_umc_base_addr(struct amd64_pvt *pvt, u8 channel)
+{
+	if (hygon_f18h_m4h()) {
+		struct pci_dev *dev = node_to_amd_nb(pvt->mc_node_id)->misc;
+		u8 df_id;
+
+		hygon_get_dfid(dev, &df_id);
+
+		return get_umc_base(channel) + (0x80000000 + (0x10000000 * (df_id - 4)));
+	}
+
+	return get_umc_base(channel);
+}
+
+static u16 get_num_nodes(void)
+{
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_HYGON &&
+	    boot_cpu_data.x86 == 0x18)
+		return amd_num_nodes();
+
+	return amd_nb_num();
+}
+
 /*
  * Select DCT to which PCI cfg accesses are routed
  */
@@ -1452,12 +1476,15 @@ static void umc_read_base_mask(struct amd64_pvt *pvt)
 	u32 mask_reg, mask_reg_sec;
 	u32 *base, *base_sec;
 	u32 *mask, *mask_sec;
+	u32 umc_base;
 	int cs, umc;
 	u32 tmp;
 
 	for_each_umc(umc) {
-		umc_base_reg = get_umc_base(umc) + UMCCH_BASE_ADDR;
-		umc_base_reg_sec = get_umc_base(umc) + UMCCH_BASE_ADDR_SEC;
+		umc_base = get_umc_base_addr(pvt, umc);
+
+		umc_base_reg = umc_base + UMCCH_BASE_ADDR;
+		umc_base_reg_sec = umc_base + UMCCH_BASE_ADDR_SEC;
 
 		for_each_chip_select(cs, umc, pvt) {
 			base = &pvt->csels[umc].csbases[cs];
@@ -1479,8 +1506,8 @@ static void umc_read_base_mask(struct amd64_pvt *pvt)
 			}
 		}
 
-		umc_mask_reg = get_umc_base(umc) + UMCCH_ADDR_MASK;
-		umc_mask_reg_sec = get_umc_base(umc) + get_umc_reg(pvt, UMCCH_ADDR_MASK_SEC);
+		umc_mask_reg = umc_base + UMCCH_ADDR_MASK;
+		umc_mask_reg_sec = umc_base + get_umc_reg(pvt, UMCCH_ADDR_MASK_SEC);
 
 		for_each_chip_select_mask(cs, umc, pvt) {
 			mask = &pvt->csels[umc].csmasks[cs];
@@ -1567,7 +1594,8 @@ static void umc_determine_memory_type(struct amd64_pvt *pvt)
 		 * Check if the system supports the "DDR Type" field in UMC Config
 		 * and has DDR5 DIMMs in use.
 		 */
-		if (pvt->flags.zn_regs_v2 && ((umc->umc_cfg & GENMASK(2, 0)) == 0x1)) {
+		if ((pvt->flags.zn_regs_v2 || hygon_f18h_m4h()) &&
+		    ((umc->umc_cfg & GENMASK(2, 0)) == 0x1)) {
 			if (umc->dimm_cfg & BIT(5))
 				umc->dram_type = MEM_LRDDR5;
 			else if (umc->dimm_cfg & BIT(4))
@@ -2801,7 +2829,11 @@ static inline void decode_bus_error(int node_id, struct mce *m)
  */
 static void umc_get_err_info(struct mce *m, struct err_info *err)
 {
-	err->channel = (m->ipid & GENMASK(31, 0)) >> 20;
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_HYGON &&
+	    boot_cpu_data.x86 == 0x18)
+		err->channel = FIELD_GET(GENMASK(23, 20), m->ipid);
+	else
+		err->channel = FIELD_GET(GENMASK(31, 20), m->ipid);
 	err->csrow = m->synd & 0x7;
 }
 
@@ -2922,8 +2954,7 @@ static void umc_read_mc_regs(struct amd64_pvt *pvt)
 
 	/* Read registers from each UMC */
 	for_each_umc(i) {
-
-		umc_base = get_umc_base(i);
+		umc_base = get_umc_base_addr(pvt, i);
 		umc = &pvt->umc[i];
 
 		if (!amd_smn_read(nid, umc_base + get_umc_reg(pvt, UMCCH_DIMM_CFG), &tmp))
@@ -3841,6 +3872,16 @@ static int per_family_init(struct amd64_pvt *pvt)
 		break;
 
 	case 0x18:
+		switch (pvt->model) {
+		case 0x4:
+			pvt->max_mcs			= 3;
+			break;
+		case 0x5:
+			pvt->max_mcs			= 1;
+			break;
+		default:
+			break;
+		}
 		break;
 
 	case 0x19:
@@ -4128,6 +4169,7 @@ static int __init amd64_edac_init(void)
 {
 	const char *owner;
 	int err = -ENODEV;
+	u16 node_num;
 	int i;
 
 	if (ghes_get_devices())
@@ -4140,13 +4182,15 @@ static int __init amd64_edac_init(void)
 	if (!x86_match_cpu(amd64_cpuids))
 		return -ENODEV;
 
-	if (!amd_nb_num())
+	node_num = get_num_nodes();
+
+	if (!node_num)
 		return -ENODEV;
 
 	opstate_init();
 
 	err = -ENOMEM;
-	ecc_stngs = kzalloc_objs(ecc_stngs[0], amd_nb_num());
+	ecc_stngs = kzalloc_objs(ecc_stngs[0], node_num);
 	if (!ecc_stngs)
 		goto err_free;
 
@@ -4154,7 +4198,7 @@ static int __init amd64_edac_init(void)
 	if (!msrs)
 		goto err_free;
 
-	for (i = 0; i < amd_nb_num(); i++) {
+	for (i = 0; i < node_num; i++) {
 		err = probe_one_instance(i);
 		if (err) {
 			/* unwind properly */
@@ -4210,7 +4254,7 @@ static void __exit amd64_edac_exit(void)
 	else
 		amd_unregister_ecc_decoder(decode_bus_error);
 
-	for (i = 0; i < amd_nb_num(); i++)
+	for (i = 0; i < get_num_nodes(); i++)
 		remove_one_instance(i);
 
 	kfree(ecc_stngs);
-- 
2.47.3

