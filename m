Received: from out28-173.mail.aliyun.com (out28-173.mail.aliyun.com [115.124.28.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52912DA749;
	Thu, 28 May 2026 03:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940729; cv=none; b=fL38EW8VIUdyWvA9CCwPquNBo+uXNpAav5kTZBRsC88LiUB64OhWWtajsedJXqWBKfXHeNgldUvsKHLIyqDqcmVvjssIeTDnwKKF6fcIqvqONROZWg6u2uS87EeBbTPhJbBybKE6kbT2iKI1jQ9SZflWXLt4G6Yah/shr6hLI8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940729; c=relaxed/simple;
	bh=D+K3tdmP8edwD9ZQcd6/LSQRWobi59/Ye0cJullxJsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSNT4FXNRpPbvhtyPEH5BsH5kNR96Ue1wYbkE7rBF3G6W4nrPtp5WhP5O/XBHnDTjJciIGMterPRhasF453XP2mNPHItj3gC9EcOUc0aslQodypn2FossGoE7acLGNpi2DLCJ5XEcnpeTcXxmGoD3YkHV66z36hRBUO+n737BvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436261|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.000909366-0.00142474-0.997666;FP=10766275164307539003|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037025160;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.hieeBdM_1779940393;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hieeBdM_1779940393 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 11:53:18 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH v2 01/11] ras/amd/atl: Add Hygon DF1 Data Fabric system information helper
Date: Thu, 28 May 2026 11:52:35 +0800
Message-ID: <20260528035246.526012-2-shiaichun@open-hieco.net>
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

Add Hygon Family 0x18 model 0x4/0x5 (Hygon DF1) support as the start.
Add Hygon DF1 Data Fabric system information that Hygon address
translation function depends on later.
Prepare hygon_get_df_system_info() to be called by amd_atl_init() later.

- Add is_hygon_f18h() as a static inline bool in internal.h, checking
  both X86_VENDOR_HYGON and x86 family 0x18, with a TODO noting it will
  move to <asm/hygon/node.h> in Hygon Node RFC next version.
- Add hygon/reg_fields.h for Hygon-specific register field definitions
  with Hygon DF1 System Fabric ID Mask defined first.
- Add hygon/system.c for Hygon-specific implementation similar to
  system.c for AMD.
- Add HYGON_DF1 to enum df_revisions in internal.h.
- Add hygon_determine_df_rev() to detect Hygon DF revision, guarded by
  is_hygon_f18h(); use hygon_f18h_model_in_range(0x4, 0x5) to identify DF1.
- Use get_dram_hole_base() and dump_df_cfg() shared from system.c and
  exported in internal.h to avoid duplicate code.
- Build hygon/system.c from the Makefile as an amd_atl object.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/Makefile           |  2 +
 drivers/ras/amd/atl/hygon/reg_fields.h | 60 ++++++++++++++++++++
 drivers/ras/amd/atl/hygon/system.c     | 76 ++++++++++++++++++++++++++
 drivers/ras/amd/atl/internal.h         | 18 ++++++
 drivers/ras/amd/atl/system.c           |  4 +-
 5 files changed, 158 insertions(+), 2 deletions(-)
 create mode 100644 drivers/ras/amd/atl/hygon/reg_fields.h
 create mode 100644 drivers/ras/amd/atl/hygon/system.c

diff --git a/drivers/ras/amd/atl/Makefile b/drivers/ras/amd/atl/Makefile
index b56892c0c0d9..3716fe068eb6 100644
--- a/drivers/ras/amd/atl/Makefile
+++ b/drivers/ras/amd/atl/Makefile
@@ -15,6 +15,8 @@ amd_atl-y		+= map.o
 amd_atl-y		+= system.o
 amd_atl-y		+= umc.o
 
+amd_atl-y		+= hygon/system.o
+
 amd_atl-$(CONFIG_AMD_ATL_PRM) += prm.o
 
 obj-$(CONFIG_AMD_ATL)	+= amd_atl.o
diff --git a/drivers/ras/amd/atl/hygon/reg_fields.h b/drivers/ras/amd/atl/hygon/reg_fields.h
new file mode 100644
index 000000000000..b669049c46e5
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/reg_fields.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD Address Translation Library (for hygon)
+ *
+ * reg_fields.h : Register field definitions for Hygon
+ *
+ * Author: Aichun Shi <shiaichun@open-hieco.net>
+ */
+
+/*
+ * Die ID Mask
+ *
+ * Access type: Broadcast
+ *
+ * Register
+ *	Rev	Fieldname	Bits
+ *
+ *	D18F1x208 [System Fabric ID Mask]
+ *	HYGON_DF1 DieIdMask [9:0]
+ */
+#define HYGON_DF1_DIE_ID_MASK	GENMASK(9, 0)
+
+/*
+ * Die ID Shift
+ *
+ * Access type: Broadcast
+ *
+ * Register
+ *	Rev	Fieldname	Bits
+ *
+ *	D18F1x208 [System Fabric ID Mask]
+ *	HYGON_DF1 DieIdShift [15:12]
+ */
+#define HYGON_DF1_DIE_ID_SHIFT	GENMASK(15, 12)
+
+/*
+ * Socket ID Mask
+ *
+ * Access type: Broadcast
+ *
+ * Register
+ *	Rev	Fieldname	Bits
+ *
+ * D18F1x208 [System Fabric ID Mask]
+ *	HYGON_DF1 SocketIdMask	[25:16]
+ */
+#define HYGON_DF1_SOCKET_ID_MASK	GENMASK(25, 16)
+
+/*
+ * Socket ID Shift
+ *
+ * Access type: Broadcast
+ *
+ * Register
+ *	Rev	Fieldname	Bits
+ *
+ * D18F1x208 [System Fabric ID Mask]
+ *	HYGON_DF1 SocketIdShift	[31:28]
+ */
+#define HYGON_DF1_SOCKET_ID_SHIFT	GENMASK(31, 28)
diff --git a/drivers/ras/amd/atl/hygon/system.c b/drivers/ras/amd/atl/hygon/system.c
new file mode 100644
index 000000000000..bff577a559ad
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/system.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Address Translation Library (for hygon)
+ *
+ * system.c : Functions to read and save system-wide data for Hygon
+ *
+ * Author: Aichun Shi <shiaichun@open-hieco.net>
+ */
+
+#include "../internal.h"
+
+static void hygon_df_get_masks_shifts(u32 mask0)
+{
+	switch (df_cfg.rev) {
+	case HYGON_DF1:
+		df_cfg.socket_id_shift = FIELD_GET(HYGON_DF1_SOCKET_ID_SHIFT, mask0);
+		df_cfg.socket_id_mask = FIELD_GET(HYGON_DF1_SOCKET_ID_MASK, mask0);
+		df_cfg.die_id_shift = FIELD_GET(HYGON_DF1_DIE_ID_SHIFT, mask0);
+		df_cfg.die_id_mask = FIELD_GET(HYGON_DF1_DIE_ID_MASK, mask0);
+		break;
+	default:
+		atl_debug_on_bad_df_rev();
+		return;
+	}
+}
+
+static int hygon_determine_df_rev(void)
+{
+	u32 fabric_id_mask0;
+
+	if (!is_hygon_f18h())
+		return -EINVAL;
+
+	if (hygon_f18h_model_in_range(0x4, 0x5))
+		df_cfg.rev = HYGON_DF1;
+
+	/* Read D18F1x208 (SystemFabricIdMask). */
+	if (df_indirect_read_broadcast(0, 1, 0x208, &fabric_id_mask0))
+		return -EINVAL;
+
+	hygon_df_get_masks_shifts(fabric_id_mask0);
+
+	return 0;
+}
+
+static void hygon_get_num_maps(void)
+{
+	switch (df_cfg.rev) {
+	case HYGON_DF1:
+		df_cfg.num_coh_st_maps	= 2;
+		break;
+	default:
+		atl_debug_on_bad_df_rev();
+	}
+}
+
+int hygon_get_df_system_info(void)
+{
+	int ret;
+
+	ret = hygon_determine_df_rev();
+	if (ret) {
+		pr_warn("Failed to determine DF Revision");
+		df_cfg.rev = UNKNOWN;
+		return ret;
+	}
+
+	hygon_get_num_maps();
+
+	if (get_dram_hole_base())
+		pr_warn("Failed to read DRAM hole base");
+
+	dump_df_cfg();
+
+	return 0;
+}
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 82a56d9c2be1..56008238c220 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -19,8 +19,11 @@
 
 #include <asm/amd/nb.h>
 #include <asm/amd/node.h>
+#include <asm/hygon/node.h>
+#include <linux/processor.h>
 
 #include "reg_fields.h"
+#include "hygon/reg_fields.h"
 
 #undef pr_fmt
 #define pr_fmt(fmt) "amd_atl: " fmt
@@ -40,8 +43,18 @@
 
 #define INVALID_SPA ~0ULL
 
+/*
+ * TODO: Will move to <asm/hygon/node.h> in Hygon Node RFC next version.
+ */
+static inline bool is_hygon_f18h(void)
+{
+	return boot_cpu_data.x86_vendor == X86_VENDOR_HYGON &&
+	       boot_cpu_data.x86 == 0x18;
+}
+
 enum df_revisions {
 	UNKNOWN,
+	HYGON_DF1,
 	DF2,
 	DF3,
 	DF3p5,
@@ -284,6 +297,11 @@ unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
 u64 add_base_and_hole(struct addr_ctx *ctx, u64 addr);
 u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 
+int get_dram_hole_base(void);
+void dump_df_cfg(void);
+
+int hygon_get_df_system_info(void);
+
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
 
diff --git a/drivers/ras/amd/atl/system.c b/drivers/ras/amd/atl/system.c
index 812a30e21d3a..eb420978febb 100644
--- a/drivers/ras/amd/atl/system.c
+++ b/drivers/ras/amd/atl/system.c
@@ -231,7 +231,7 @@ static int determine_df_rev(void)
 	return 0;
 }
 
-static int get_dram_hole_base(void)
+int get_dram_hole_base(void)
 {
 	u8 func = 0;
 
@@ -274,7 +274,7 @@ static void apply_node_id_shift(void)
 	df_cfg.socket_id_shift		+= df_cfg.node_id_shift;
 }
 
-static void dump_df_cfg(void)
+void dump_df_cfg(void)
 {
 	pr_debug("rev=0x%x",				df_cfg.rev);
 
-- 
2.47.3

