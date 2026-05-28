Received: from out28-2.mail.aliyun.com (out28-2.mail.aliyun.com [115.124.28.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4702DA749;
	Thu, 28 May 2026 03:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940762; cv=none; b=pgVkQ4W1p5TdPtvqUIix+DkEXkgen/T61JOq6P7FjKWVRpjUB6jRxAcYVFcJ90bU6XlMTb4ykpzTnG8Rlt/qaXDaqG/m0EYcn8hW15VSA4qfNMgoCSM92zPO4HvJpHBfGkYtZYal0AvFB+AalB2WVcLGdir3HMY4yHE8bfjtCL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940762; c=relaxed/simple;
	bh=Yy7H8afrj0+EYn6ozWUAd6VUhE9TwkVrAhwOzh0d1aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCFo2VWeMmPXGBlJVcQX/Q6qFaINlfsrBBWSvz8wsxAXMnL6GLI4paKYKO1aaNTZx9/cU+G9V3Xaay+FF8BfwIYUNk6QopqE3qbz6SaQ9XnyVmpTs9seludkd262iiKXcAe8noYsDupWLf/+lLesvN9/xHBkHcQyvKrXhMOJsfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00552353-0.000629855-0.993847;FP=17812137783631348919|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033032023038;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.hieeCAb_1779940428;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hieeCAb_1779940428 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 11:53:52 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH v2 10/11] EDAC/amd64: Add Hygon Family 0x18 models 0x4-0x8 support
Date: Thu, 28 May 2026 11:52:44 +0800
Message-ID: <20260528035246.526012-11-shiaichun@open-hieco.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528035246.526012-1-shiaichun@open-hieco.net>
References: <20260528035246.526012-1-shiaichun@open-hieco.net>
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

- Factor Hygon-specific code into hygon_edac.c and hygon_edac.h.
- Add is_hygon_f18h() as a static inline bool in hygon_edac.h, checking
  both X86_VENDOR_HYGON and x86 family 0x18, with a TODO noting it will
  move to <asm/hygon/node.h> in Hygon Node RFC next version.
- Separate UMC base computation into hygon_get_umc_base() in hygon_edac.c.
- Add get_umc_base_addr() dispatching to hygon_get_umc_base() on Hygon.
- Add system_supports_ddr5() to include Hygon models 0x4-0x8 alongside
  the existing zn_regs_v2 path.
- Add get_num_nodes() returning hygon_cdd_num() on Hygon and
  amd_nb_num() on AMD; use in init, exit, and allocation.
- Extract error channel from IPID bits [23:20] on Hygon vs [31:20]
  on AMD to match the Hygon UMC IPID layout.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/edac/Makefile     |  5 +++
 drivers/edac/amd64_edac.c | 58 ++++++++++++++++++++++++-------
 drivers/edac/amd64_edac.h |  5 +++
 drivers/edac/hygon_edac.c | 73 +++++++++++++++++++++++++++++++++++++++
 drivers/edac/hygon_edac.h | 24 +++++++++++++
 5 files changed, 153 insertions(+), 12 deletions(-)
 create mode 100644 drivers/edac/hygon_edac.c
 create mode 100644 drivers/edac/hygon_edac.h

diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index a37534300ab9..1d58af106420 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -47,6 +47,11 @@ obj-$(CONFIG_EDAC_X38)			+= x38_edac.o
 obj-$(CONFIG_EDAC_I82860)		+= i82860_edac.o
 obj-$(CONFIG_EDAC_AMD64)		+= amd64_edac.o
 
+amd64_edac-y				:= amd64_edac_core.o hygon_edac.o
+
+$(obj)/amd64_edac_core.o: $(src)/amd64_edac.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
 obj-$(CONFIG_EDAC_PASEMI)		+= pasemi_edac.o
 
 mpc85xx_edac_mod-y			:= fsl_ddr_edac.o mpc85xx_edac.o
diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 8908ab881c85..d9050f368d4e 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2,8 +2,10 @@
 #include <linux/ras.h>
 #include <linux/string_choices.h>
 #include "amd64_edac.h"
+#include "hygon_edac.h"
 #include <asm/amd/nb.h>
 #include <asm/amd/node.h>
+#include <asm/hygon/node.h>
 
 static struct edac_pci_ctl_info *pci_ctl;
 
@@ -98,6 +100,27 @@ int __amd64_write_pci_cfg_dword(struct pci_dev *pdev, int offset,
 	return pcibios_err_to_errno(err);
 }
 
+static u32 get_umc_base_addr(struct amd64_pvt *pvt, u8 channel)
+{
+	if (is_hygon_f18h())
+		return hygon_get_umc_base(pvt, channel);
+
+	return get_umc_base(channel);
+}
+
+static bool system_supports_ddr5(struct amd64_pvt *pvt)
+{
+	return pvt->flags.zn_regs_v2 || hygon_supports_ddr5();
+}
+
+static u16 get_num_nodes(void)
+{
+	if (is_hygon_f18h())
+		return hygon_cdd_num();
+
+	return amd_nb_num();
+}
+
 /*
  * Select DCT to which PCI cfg accesses are routed
  */
@@ -1453,11 +1476,13 @@ static void umc_read_base_mask(struct amd64_pvt *pvt)
 	u32 *base, *base_sec;
 	u32 *mask, *mask_sec;
 	int cs, umc;
+	u32 umc_base;
 	u32 tmp;
 
 	for_each_umc(umc) {
-		umc_base_reg = get_umc_base(umc) + UMCCH_BASE_ADDR;
-		umc_base_reg_sec = get_umc_base(umc) + UMCCH_BASE_ADDR_SEC;
+		umc_base = get_umc_base_addr(pvt, umc);
+		umc_base_reg = umc_base + UMCCH_BASE_ADDR;
+		umc_base_reg_sec = umc_base + UMCCH_BASE_ADDR_SEC;
 
 		for_each_chip_select(cs, umc, pvt) {
 			base = &pvt->csels[umc].csbases[cs];
@@ -1479,8 +1504,8 @@ static void umc_read_base_mask(struct amd64_pvt *pvt)
 			}
 		}
 
-		umc_mask_reg = get_umc_base(umc) + UMCCH_ADDR_MASK;
-		umc_mask_reg_sec = get_umc_base(umc) + get_umc_reg(pvt, UMCCH_ADDR_MASK_SEC);
+		umc_mask_reg = umc_base + UMCCH_ADDR_MASK;
+		umc_mask_reg_sec = umc_base + get_umc_reg(pvt, UMCCH_ADDR_MASK_SEC);
 
 		for_each_chip_select_mask(cs, umc, pvt) {
 			mask = &pvt->csels[umc].csmasks[cs];
@@ -1554,6 +1579,7 @@ static void umc_determine_memory_type(struct amd64_pvt *pvt)
 {
 	struct amd64_umc *umc;
 	u32 i;
+	bool ddr5_supported = system_supports_ddr5(pvt);
 
 	for_each_umc(i) {
 		umc = &pvt->umc[i];
@@ -1567,7 +1593,7 @@ static void umc_determine_memory_type(struct amd64_pvt *pvt)
 		 * Check if the system supports the "DDR Type" field in UMC Config
 		 * and has DDR5 DIMMs in use.
 		 */
-		if (pvt->flags.zn_regs_v2 && ((umc->umc_cfg & GENMASK(2, 0)) == 0x1)) {
+		if (ddr5_supported && ((umc->umc_cfg & GENMASK(2, 0)) == 0x1)) {
 			if (umc->dimm_cfg & BIT(5))
 				umc->dram_type = MEM_LRDDR5;
 			else if (umc->dimm_cfg & BIT(4))
@@ -2801,7 +2827,11 @@ static inline void decode_bus_error(int node_id, struct mce *m)
  */
 static void umc_get_err_info(struct mce *m, struct err_info *err)
 {
-	err->channel = (m->ipid & GENMASK(31, 0)) >> 20;
+	if (is_hygon_f18h())
+		err->channel = hygon_get_umc_channel(m->ipid);
+	else
+		err->channel = FIELD_GET(GENMASK(31, 20), m->ipid);
+
 	err->csrow = m->synd & 0x7;
 }
 
@@ -2922,8 +2952,7 @@ static void umc_read_mc_regs(struct amd64_pvt *pvt)
 
 	/* Read registers from each UMC */
 	for_each_umc(i) {
-
-		umc_base = get_umc_base(i);
+		umc_base = get_umc_base_addr(pvt, i);
 		umc = &pvt->umc[i];
 
 		if (!amd_smn_read(nid, umc_base + get_umc_reg(pvt, UMCCH_DIMM_CFG), &tmp))
@@ -3841,6 +3870,7 @@ static int per_family_init(struct amd64_pvt *pvt)
 		break;
 
 	case 0x18:
+		hygon_per_family_init(pvt);
 		break;
 
 	case 0x19:
@@ -4128,6 +4158,7 @@ static int __init amd64_edac_init(void)
 {
 	const char *owner;
 	int err = -ENODEV;
+	u16 node_num;
 	int i;
 
 	if (ghes_get_devices())
@@ -4140,13 +4171,15 @@ static int __init amd64_edac_init(void)
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
 
@@ -4154,7 +4187,7 @@ static int __init amd64_edac_init(void)
 	if (!msrs)
 		goto err_free;
 
-	for (i = 0; i < amd_nb_num(); i++) {
+	for (i = 0; i < node_num; i++) {
 		err = probe_one_instance(i);
 		if (err) {
 			/* unwind properly */
@@ -4200,6 +4233,7 @@ static int __init amd64_edac_init(void)
 static void __exit amd64_edac_exit(void)
 {
 	int i;
+	u16 node_num = get_num_nodes();
 
 	if (pci_ctl)
 		edac_pci_release_generic_ctl(pci_ctl);
@@ -4210,7 +4244,7 @@ static void __exit amd64_edac_exit(void)
 	else
 		amd_unregister_ecc_decoder(decode_bus_error);
 
-	for (i = 0; i < amd_nb_num(); i++)
+	for (i = 0; i < node_num; i++)
 		remove_one_instance(i);
 
 	kfree(ecc_stngs);
diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
index 1757c1b99fc8..d6a068dffb36 100644
--- a/drivers/edac/amd64_edac.h
+++ b/drivers/edac/amd64_edac.h
@@ -8,6 +8,9 @@
  * GNU General Public License.
  */
 
+#ifndef _AMD64_EDAC_H
+#define _AMD64_EDAC_H
+
 #include <linux/module.h>
 #include <linux/ctype.h>
 #include <linux/init.h>
@@ -524,3 +527,5 @@ static inline u32 dct_sel_baseaddr(struct amd64_pvt *pvt)
 	}
 	return (pvt)->dct_sel_lo & 0xFFFFF800;
 }
+
+#endif /* _AMD64_EDAC_H */
diff --git a/drivers/edac/hygon_edac.c b/drivers/edac/hygon_edac.c
new file mode 100644
index 000000000000..92504edac1f9
--- /dev/null
+++ b/drivers/edac/hygon_edac.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Hygon Family 0x18 memory-controller support for amd64_edac.
+ *
+ * Vendor-specific UMC addressing, node counts, MCA decode, and family init
+ * live here so the core amd64_edac.c AMD paths stay unchanged aside from
+ * thin hook calls.
+ *
+ * Linked into amd64_edac.ko together with amd64_edac_core.o (compiled from
+ * amd64_edac.c; see drivers/edac/Makefile).
+ */
+
+#include <linux/pci.h>
+#include <asm/amd/nb.h>
+#include <asm/hygon/node.h>
+
+#include "amd64_edac.h"
+#include "hygon_edac.h"
+
+/*
+ * Hygon Family 0x18 models 0x4-0x8: UMC config is behind an SMN window derived
+ * from the compute-die DFID.
+ */
+u32 hygon_get_umc_base(struct amd64_pvt *pvt, u8 channel)
+{
+	struct amd_northbridge *nb = node_to_amd_nb(pvt->mc_node_id);
+	u32 base = get_umc_base(channel);
+	u8 df_id;
+
+	if (!hygon_f18h_model_in_range(0x4, 0x8))
+		return base;
+
+	if (hygon_get_dfid(nb->misc, &df_id))
+		return base;
+
+	return base + (0x80000000U + (0x10000000U * (df_id - 4)));
+}
+
+/*
+ * Hygon Family 0x18 UMC channel is encoded in IPID bits [23:20], unlike AMD
+ * which uses bits [31:20].
+ */
+u8 hygon_get_umc_channel(u64 ipid)
+{
+	return FIELD_GET(GENMASK_ULL(23, 20), ipid);
+}
+
+bool hygon_supports_ddr5(void)
+{
+	return hygon_f18h_model_in_range(0x4, 0x8);
+}
+
+void hygon_per_family_init(struct amd64_pvt *pvt)
+{
+	if (!is_hygon_f18h())
+		return;
+
+	switch (pvt->model) {
+	case 0x4:
+		pvt->max_mcs = 3;
+		break;
+	case 0x5:
+		pvt->max_mcs = 1;
+		break;
+	case 0x6:
+	case 0x7:
+	case 0x8:
+		pvt->max_mcs = 2;
+		break;
+	default:
+		break;
+	}
+}
diff --git a/drivers/edac/hygon_edac.h b/drivers/edac/hygon_edac.h
new file mode 100644
index 000000000000..80f952209b95
--- /dev/null
+++ b/drivers/edac/hygon_edac.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _HYGON_EDAC_H
+#define _HYGON_EDAC_H
+
+#include <linux/types.h>
+#include <linux/processor.h>
+
+struct amd64_pvt;
+
+/*
+ * TODO: Will move to <asm/hygon/node.h> in Hygon Node RFC next version.
+ */
+static inline bool is_hygon_f18h(void)
+{
+	return boot_cpu_data.x86_vendor == X86_VENDOR_HYGON &&
+	       boot_cpu_data.x86 == 0x18;
+}
+
+u32 hygon_get_umc_base(struct amd64_pvt *pvt, u8 channel);
+u8 hygon_get_umc_channel(u64 ipid);
+bool hygon_supports_ddr5(void);
+void hygon_per_family_init(struct amd64_pvt *pvt);
+
+#endif /* _HYGON_EDAC_H */
-- 
2.47.3

