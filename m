Received: from out198-44.us.a.mail.aliyun.com (out198-44.us.a.mail.aliyun.com [47.90.198.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B05C3ACEF2;
	Fri,  3 Apr 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213947; cv=none; b=ThjgNxKtGiwo2Hs39L5aDkgf0Qo5NWwUumYBzmaLtueJMVSQL9MevwoyFWxW84lkw9DPOKLivUyueLOjFU1SFnNuhSd6WYup8QHXakZKkNH6dtH/MfQhkcnQDoxTv0NzrGDSUuZFpo1tR7WK/SCq7OiYEUx2TKDEA3uyj4akIrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213947; c=relaxed/simple;
	bh=VRbthcdA5e2exvyu/nlSfrFp0Xtjo/C0Atge+rtqcIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfRBGoWEjX6QdhwONj5QkbeExgapJLMm5+CuUDjb53dQWGsJNHo8uQGgN+dBAsfnjPZCSXOOhmPuGXlwGsXP10SYyboyX197nYi4V7nacylbYVAEP05phOykXFQui6ckaRjrW9AAe9IxoSYBTPVWrvnynbu5zl8BBvpPTQzX3uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=47.90.198.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_system_inform|0.00301659-0.000348675-0.996635;FP=9963226918574573311|2|1|2|0|-1|-1|-1;HT=maildocker-contentspam033032023038;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h4TkLpR_1775213917;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.h4TkLpR_1775213917 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 18:58:44 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH 05/10] ras/amd/atl: Add Hygon DF1 normalized-to-system address translation
Date: Fri,  3 Apr 2026 18:57:29 +0800
Message-ID: <f36626ec5773eef277a990483ee854e080a0fdbf.1775213147.git.shiaichun@open-hieco.net>
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

Translate a normalized UMC MCA address into a system physical address for
Hygon DF1 with the following pipeline.

Pipeline:
- Initialize address context with socket, die, coherent-station instance,
  sub-channel, and normalized address.
- Enforce legacy hole requirements when the map enables the hole without
  a configured hole base.
- Run Hygon DRAM map decoding, denormalization, DRAM base plus
  legacy hole, dehash, and DRAM limit checks.

Prepare hygon_norm_to_sys_addr() to be called by hygon/umc.c later.

- Add hygon/core.c for Hygon-specific implementation similar to core.c for
  AMD.
- Call hygon_get_address_map(), hygon_denormalize_address(),
  hygon_dehash_address() prepared previously in hygon/map.c,
  hygon/denormalize.c and hygon/dehash.c.
- Use legacy hole_en() and addr_over_limit() shared from core.c and
  exported in internal.h to avoid duplicate code.
- Build hygon/core.c from the Makefile as an amd_atl object.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/Makefile     |  1 +
 drivers/ras/amd/atl/core.c       |  4 +--
 drivers/ras/amd/atl/hygon/core.c | 52 ++++++++++++++++++++++++++++++++
 drivers/ras/amd/atl/internal.h   |  6 ++++
 4 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 drivers/ras/amd/atl/hygon/core.c

diff --git a/drivers/ras/amd/atl/Makefile b/drivers/ras/amd/atl/Makefile
index fc12013de21f..0a42f2cbabc4 100644
--- a/drivers/ras/amd/atl/Makefile
+++ b/drivers/ras/amd/atl/Makefile
@@ -15,6 +15,7 @@ amd_atl-y		+= map.o
 amd_atl-y		+= system.o
 amd_atl-y		+= umc.o
 
+amd_atl-y		+= hygon/core.o
 amd_atl-y		+= hygon/dehash.o
 amd_atl-y		+= hygon/denormalize.o
 amd_atl-y		+= hygon/map.o
diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index 0f7cd6dab0b0..b7083588b46e 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -17,7 +17,7 @@
 
 struct df_config df_cfg __read_mostly;
 
-static int addr_over_limit(struct addr_ctx *ctx)
+int addr_over_limit(struct addr_ctx *ctx)
 {
 	u64 dram_limit_addr;
 
@@ -39,7 +39,7 @@ static int addr_over_limit(struct addr_ctx *ctx)
 	return 0;
 }
 
-static bool legacy_hole_en(struct addr_ctx *ctx)
+bool legacy_hole_en(struct addr_ctx *ctx)
 {
 	u32 reg = ctx->map.base;
 
diff --git a/drivers/ras/amd/atl/hygon/core.c b/drivers/ras/amd/atl/hygon/core.c
new file mode 100644
index 000000000000..ef064e61805b
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/core.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Address Translation Library
+ *
+ * core.c : Base translation functions for Hygon
+ *
+ * Author: AichunShi <shiaichun@open-hieco.net>
+ */
+
+#include "../internal.h"
+
+unsigned long hygon_norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id,
+				     u8 sub_channel, unsigned long addr)
+{
+	struct addr_ctx ctx;
+
+	if (df_cfg.rev == UNKNOWN)
+		return -EINVAL;
+
+	memset(&ctx, 0, sizeof(ctx));
+
+	/* Start from the normalized address */
+	ctx.ret_addr = addr;
+	ctx.node_id = die_id;
+	ctx.inst_id = coh_st_inst_id;
+
+	ctx.inputs.norm_addr = addr;
+	ctx.inputs.socket_id = socket_id;
+	ctx.inputs.die_id = die_id;
+	ctx.inputs.coh_st_inst_id = coh_st_inst_id;
+
+	ctx.chan_intlv_hygon.sub_channel = sub_channel;
+
+	if (legacy_hole_en(&ctx) && !df_cfg.dram_hole_base)
+		return -EINVAL;
+
+	if (hygon_get_address_map(&ctx))
+		return -EINVAL;
+
+	if (hygon_denormalize_address(&ctx))
+		return -EINVAL;
+
+	ctx.ret_addr = add_base_and_hole(&ctx, ctx.ret_addr);
+
+	if (hygon_dehash_address(&ctx))
+		return -EINVAL;
+
+	if (addr_over_limit(&ctx))
+		return -EINVAL;
+
+	return ctx.ret_addr;
+}
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index a5624599c91e..f943cc33f82e 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -297,6 +297,8 @@ unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
 
 u64 add_base_and_hole(struct addr_ctx *ctx, u64 addr);
 u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
+bool legacy_hole_en(struct addr_ctx *ctx);
+int addr_over_limit(struct addr_ctx *ctx);
 
 int get_dram_hole_base(void);
 void dump_df_cfg(void);
@@ -313,6 +315,10 @@ int hygon_get_address_map(struct addr_ctx *ctx);
 int hygon_denormalize_address(struct addr_ctx *ctx);
 int hygon_dehash_address(struct addr_ctx *ctx);
 
+unsigned long hygon_norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id,
+				     u8 sub_channel, unsigned long addr);
+unsigned long hygon_convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
+
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
 
-- 
2.47.3

