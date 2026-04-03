Received: from out28-106.mail.aliyun.com (out28-106.mail.aliyun.com [115.124.28.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8AF3A963B;
	Fri,  3 Apr 2026 11:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214223; cv=none; b=tXN9O54SqULxzmZOSgIUH7gYcxChOFSuNs7wUQ06CMX6dn8cTSkClSCfo8hx3CEXnE6IXg6yOTtmNrP3RtaImlFn4GzGsClSBx64dTZ9lsmOqCUu2TMxIEjsmYEgpaSAn4VA2i2qPkWq095l83E22ZdouNMajaQeQVB42VNo748=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214223; c=relaxed/simple;
	bh=wU6MqaJwmh508BLS+CsAdfsXSKdEuFevdmHj327TAZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWaIiw/8F7rZJBomvYIQEeS6eIID0NWOZsRpY9i/jzIzTlA4C9mnc+BMPsDFt7E8WIauJ95gy3rI0G1iOHRXll3+F93rzUvmmSyaVmCEi2zQxUpzmJiibwjSsV/kDBEgiw6XqAnanYQsJF/oWc4QZ23kchK6p1axmS43pHbZUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436269|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_alarm|0.00181366-0.00227821-0.995908;FP=10767401068509611067|2|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037071049;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h4TkLIY_1775213879;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.h4TkLIY_1775213879 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 18:58:10 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH 01/10] ras/amd/atl: Add Hygon DF1 Data Fabric system information helper
Date: Fri,  3 Apr 2026 18:57:25 +0800
Message-ID: <7b3526bf4782aaa9ee691bddc6cb131836f15369.1775213147.git.shiaichun@open-hieco.net>
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

Add Hygon Family 0x18 model 0x4/0x5 (Hygon DF1) support as the start.
Add Hygon DF1 Data Fabric system information that Hygon address
translation function depends on later.
Prepare hygon_get_df_system_info() to be called by amd_atl_init() later.

- Add hygon/reg_fields.h for Hygon-specific register field definitions
  with Hygon DF1 System Fabric ID Mask defined first.
- Add hygon/system.c for Hygon-specific implementation similar to
  system.c for AMD.
- Add HYGON_DF1 to enum df_revisions in internal.h.
- Add hygon_determine_df_rev() to detect models 0x4/0x5 as Hygon DF1 and
  get system information.
- Use get_dram_hole_base() and dump_df_cfg() shared from system.c and
  exported in internal.h to avoid duplicate code.
- Build hygon/system.c from the Makefile as an amd_atl object.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/Makefile           |  2 +
 drivers/ras/amd/atl/hygon/reg_fields.h | 60 +++++++++++++++++++++
 drivers/ras/amd/atl/hygon/system.c     | 73 ++++++++++++++++++++++++++
 drivers/ras/amd/atl/internal.h         |  7 +++
 drivers/ras/amd/atl/system.c           |  4 +-
 5 files changed, 144 insertions(+), 2 deletions(-)
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
index 000000000000..2c1193639c6c
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/reg_fields.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD Address Translation Library
+ *
+ * reg_fields.h : Register field definitions for Hygon
+ *
+ * Author: AichunShi <shiaichun@open-hieco.net>
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
index 000000000000..2a149cfc34c1
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/system.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Address Translation Library
+ *
+ * system.c : Functions to read and save system-wide data for Hygon
+ *
+ * Author: AichunShi <shiaichun@open-hieco.net>
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
+	if (boot_cpu_data.x86_model == 0x4 || boot_cpu_data.x86_model == 0x5)
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
index 82a56d9c2be1..19651cf9e978 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -21,6 +21,7 @@
 #include <asm/amd/node.h>
 
 #include "reg_fields.h"
+#include "hygon/reg_fields.h"
 
 #undef pr_fmt
 #define pr_fmt(fmt) "amd_atl: " fmt
@@ -42,6 +43,7 @@
 
 enum df_revisions {
 	UNKNOWN,
+	HYGON_DF1,
 	DF2,
 	DF3,
 	DF3p5,
@@ -284,6 +286,11 @@ unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
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

