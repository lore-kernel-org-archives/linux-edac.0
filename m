Received: from out28-133.mail.aliyun.com (out28-133.mail.aliyun.com [115.124.28.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA373932D0;
	Fri,  3 Apr 2026 10:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213915; cv=none; b=uvZxYi4ZhX0DDYyjwA7EWrtUdrGpJUavFUWCyPVycIfSfxl6ZJOoA5XdPgrmq6oTbKgXLhF0JFLJJ2jVkM/2/mTWyBymEChn4n8Q5PEK6DdrLqchA/cmGU323j24SdFsY+Nwx5W+aZgVe6Wrp9yeB/DoM91aMtRX56APoZiAtwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213915; c=relaxed/simple;
	bh=vKEtvJWeZd+iTcHyIOw/LB6//erbk/gUhfCeJ5WvTQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1E7FlpEfdu8/Y4O8weJBt6BLoZwALPByEu5NbsOP2PWjYrQEXW9juYPeEnRMpjXwq845M/psYufpt6lbll8/NwpvGVxKuqSFluuRvhi4a705fMW+O8hcnsbxcs+Z9wJYIkF7WjvoS5RMk9WI+hrdVeBA5ebOfw/QJGpfNtS5Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_system_inform|0.00256868-0.000312611-0.997119;FP=1039342476406293715|2|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037025160;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h4TkLSq_1775213890;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.h4TkLSq_1775213890 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 18:58:19 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH 02/10] ras/amd/atl: Add Hygon DF1 DRAM address map decoding helper
Date: Fri,  3 Apr 2026 18:57:26 +0800
Message-ID: <92b2f7493f7cbd6273050af4814de6c0923678d3.1775213147.git.shiaichun@open-hieco.net>
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

Add Hygon DF1 DRAM address map decoding function that Hygon address
translation pipeline depends on later.
Prepare hygon_get_address_map() to be called by hygon/core.c later.

- Add struct hygon_chan_intlv in addr_ctx and HYGON_DF1_3CHAN in enum
  intlv_modes to internal.h for Hygon DF1 three-channel interleave mode.
- Add hygon/map.c for Hygon-specific implementation similar to map.c for
  AMD.
- Get the coherent-station fabric ID, handle normalized offsets, read
  Hygon DF1 specific channel interleave state, and derive global
  interleave metadata (modes, bit positions, die/socket/channel counts).
- Use df2_get_dram_addr_map(), valid_map(), and dump_address_map()
  shared from map.c and exported in internal.h to avoid duplicate code.
- Build hygon/map.c from the Makefile as an amd_atl object.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/Makefile           |   1 +
 drivers/ras/amd/atl/hygon/map.c        | 337 +++++++++++++++++++++++++
 drivers/ras/amd/atl/hygon/reg_fields.h |  78 ++++++
 drivers/ras/amd/atl/internal.h         |  17 ++
 drivers/ras/amd/atl/map.c              |   6 +-
 5 files changed, 436 insertions(+), 3 deletions(-)
 create mode 100644 drivers/ras/amd/atl/hygon/map.c

diff --git a/drivers/ras/amd/atl/Makefile b/drivers/ras/amd/atl/Makefile
index 3716fe068eb6..105c11015f4c 100644
--- a/drivers/ras/amd/atl/Makefile
+++ b/drivers/ras/amd/atl/Makefile
@@ -15,6 +15,7 @@ amd_atl-y		+= map.o
 amd_atl-y		+= system.o
 amd_atl-y		+= umc.o
 
+amd_atl-y		+= hygon/map.o
 amd_atl-y		+= hygon/system.o
 
 amd_atl-$(CONFIG_AMD_ATL_PRM) += prm.o
diff --git a/drivers/ras/amd/atl/hygon/map.c b/drivers/ras/amd/atl/hygon/map.c
new file mode 100644
index 000000000000..2194c10ff587
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/map.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Address Translation Library
+ *
+ * map.c : Functions to read and decode DRAM address maps for Hygon
+ *
+ * Author: AichunShi <shiaichun@open-hieco.net>
+ */
+
+#include "../internal.h"
+
+static int hygon_df_get_intlv_mode(struct addr_ctx *ctx)
+{
+	ctx->map.intlv_mode = FIELD_GET(HYGON_DF1_INTLV_NUM_CHAN, ctx->map.base);
+
+	if (df_cfg.rev == HYGON_DF1 && ctx->map.intlv_mode == 2)
+		ctx->map.intlv_mode = HYGON_DF1_3CHAN;
+
+	if (ctx->map.intlv_mode == 8)
+		ctx->map.intlv_mode = DF2_2CHAN_HASH;
+
+	if (ctx->map.intlv_mode != NONE &&
+	    ctx->map.intlv_mode != NOHASH_2CHAN &&
+		ctx->map.intlv_mode != HYGON_DF1_3CHAN &&
+	    ctx->map.intlv_mode != NOHASH_4CHAN &&
+	    ctx->map.intlv_mode != NOHASH_8CHAN &&
+	    ctx->map.intlv_mode != NOHASH_16CHAN &&
+	    ctx->map.intlv_mode != DF2_2CHAN_HASH)
+		return -EINVAL;
+
+	return 0;
+}
+
+static u64 hygon_get_hi_addr_offset(u32 reg_dram_offset)
+{
+	u8 shift = DF_DRAM_BASE_LIMIT_LSB;
+	u64 hi_addr_offset;
+
+	switch (df_cfg.rev) {
+	case HYGON_DF1:
+		hi_addr_offset = FIELD_GET(HYGON_DF1_HI_ADDR_OFFSET, reg_dram_offset);
+		break;
+	default:
+		hi_addr_offset = 0;
+		atl_debug_on_bad_df_rev();
+	}
+
+	return hi_addr_offset << shift;
+}
+
+/*
+ * Returns:	0 if offset is disabled.
+ *		1 if offset is enabled.
+ *		-EINVAL on error.
+ */
+static int hygon_get_dram_offset(struct addr_ctx *ctx, u64 *norm_offset)
+{
+	u32 reg_dram_offset;
+	u8 map_num;
+
+	/* Should not be called for map 0. */
+	if (!ctx->map.num) {
+		atl_debug(ctx, "Trying to find DRAM offset for map 0");
+		return -EINVAL;
+	}
+
+	/*
+	 * DramOffset registers don't exist for map 0, so the base register
+	 * actually refers to map 1.
+	 * Adjust the map_num for the register offsets.
+	 */
+	map_num = ctx->map.num - 1;
+
+	if (df_cfg.rev >= HYGON_DF1) {
+		/* Read D18F0x214 (DramOffset) */
+		if (df_indirect_read_instance(ctx->node_id, 0, 0x214 + (4 * map_num),
+					      ctx->inst_id, &reg_dram_offset))
+			return -EINVAL;
+	} else {
+		return -EINVAL;
+	}
+
+	if (!FIELD_GET(DF_HI_ADDR_OFFSET_EN, reg_dram_offset))
+		return 0;
+
+	*norm_offset = hygon_get_hi_addr_offset(reg_dram_offset);
+
+	return 1;
+}
+
+#define HYGON_DF1_CHAN_ADDR_SEL	BIT(24)
+#define HYGON_DF1_CHAN_HASH_ENABLE	BIT(23)
+#define HYGON_DF1_DDR5_ENABLE	BIT(19)
+static int hygon_df1_get_dram_addr_map(struct addr_ctx *ctx)
+{
+	if (df2_get_dram_addr_map(ctx))
+		return -EINVAL;
+
+	/* Read D18F2x48 */
+	if (df_indirect_read_instance(ctx->node_id, 2, 0x48,
+				      ctx->inst_id, &ctx->map.intlv))
+		return -EINVAL;
+
+	ctx->chan_intlv_hygon.chan_addr_sel =
+		FIELD_GET(HYGON_DF1_CHAN_ADDR_SEL, ctx->map.intlv);
+	ctx->chan_intlv_hygon.chan_hash_enable =
+		FIELD_GET(HYGON_DF1_CHAN_HASH_ENABLE, ctx->map.intlv);
+	ctx->chan_intlv_hygon.ddr5_enable =
+		FIELD_GET(HYGON_DF1_DDR5_ENABLE, ctx->map.intlv);
+
+	if (ctx->chan_intlv_hygon.ddr5_enable) {
+		u64 low_addr, high_addr;
+
+		ctx->chan_intlv_hygon.start_bit = ctx->chan_intlv_hygon.chan_addr_sel ? 8 : 7;
+		low_addr = ctx->ret_addr & GENMASK_ULL(ctx->chan_intlv_hygon.start_bit - 1, 0);
+		high_addr = (ctx->ret_addr & GENMASK_ULL(63, ctx->chan_intlv_hygon.start_bit)) << 1;
+		ctx->ret_addr = high_addr | low_addr;
+	}
+
+	return 0;
+}
+
+static int hygon_get_dram_addr_map(struct addr_ctx *ctx)
+{
+	switch (df_cfg.rev) {
+	case HYGON_DF1:	return hygon_df1_get_dram_addr_map(ctx);
+	default:
+			atl_debug_on_bad_df_rev();
+			return -EINVAL;
+	}
+}
+
+static int hygon_get_coh_st_fabric_id(struct addr_ctx *ctx)
+{
+	u32 reg;
+
+	/* Read D18F0x50 (FabricBlockInstanceInformation3). */
+	if (df_indirect_read_instance(ctx->node_id, 0, 0x50, ctx->inst_id, &reg))
+		return -EINVAL;
+
+	switch (df_cfg.rev) {
+	case HYGON_DF1:
+		ctx->coh_st_fabric_id = FIELD_GET(HYGON_DF1_COH_ST_FABRIC_ID, reg);
+		break;
+	default:
+		atl_debug_on_bad_df_rev();
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int hygon_find_normalized_offset(struct addr_ctx *ctx, u64 *norm_offset)
+{
+	u64 last_offset = 0;
+	int ret;
+
+	for (ctx->map.num = 1; ctx->map.num < df_cfg.num_coh_st_maps; ctx->map.num++) {
+		ret = hygon_get_dram_offset(ctx, norm_offset);
+		if (ret < 0)
+			return ret;
+
+		/* Continue search if this map's offset is not enabled. */
+		if (!ret)
+			continue;
+
+		/* Enabled offsets should never be 0. */
+		if (*norm_offset == 0) {
+			atl_debug(ctx, "Enabled map %u offset is 0", ctx->map.num);
+			return -EINVAL;
+		}
+
+		/* Offsets should always increase from one map to the next. */
+		if (*norm_offset <= last_offset) {
+			atl_debug(ctx, "Map %u offset (0x%016llx) <= previous (0x%016llx)",
+				  ctx->map.num, *norm_offset, last_offset);
+			return -EINVAL;
+		}
+
+		/* Match if this map's offset is less than the current calculated address. */
+		if (ctx->ret_addr >= *norm_offset)
+			break;
+
+		last_offset = *norm_offset;
+	}
+
+	/*
+	 * Finished search without finding a match.
+	 * Reset to map 0 and no offset.
+	 */
+	if (ctx->map.num >= df_cfg.num_coh_st_maps) {
+		ctx->map.num = 0;
+		*norm_offset = 0;
+	}
+
+	return 0;
+}
+
+static int hygon_get_address_map_common(struct addr_ctx *ctx)
+{
+	u64 norm_offset = 0;
+
+	if (hygon_get_coh_st_fabric_id(ctx))
+		return -EINVAL;
+
+	if (hygon_find_normalized_offset(ctx, &norm_offset))
+		return -EINVAL;
+
+	ctx->ret_addr -= norm_offset;
+
+	if (hygon_get_dram_addr_map(ctx))
+		return -EINVAL;
+
+	if (!valid_map(ctx))
+		return -EINVAL;
+
+	return 0;
+}
+
+static u8 hygon_get_num_intlv_chan(struct addr_ctx *ctx)
+{
+	switch (ctx->map.intlv_mode) {
+	case NONE:
+		return 1;
+	case NOHASH_2CHAN:
+		return 2;
+	case HYGON_DF1_3CHAN:
+		return 3;
+	case NOHASH_4CHAN:
+		return 4;
+	case NOHASH_8CHAN:
+		return 8;
+	case NOHASH_16CHAN:
+		return 16;
+	case NOHASH_32CHAN:
+		return 32;
+	default:
+		atl_debug_on_bad_intlv_mode(ctx);
+		return 0;
+	}
+}
+
+static void hygon_calculate_intlv_bits(struct addr_ctx *ctx)
+{
+	ctx->map.num_intlv_chan = hygon_get_num_intlv_chan(ctx);
+
+	ctx->map.total_intlv_chan = ctx->map.num_intlv_chan;
+	ctx->map.total_intlv_chan *= ctx->map.num_intlv_dies;
+	ctx->map.total_intlv_chan *= ctx->map.num_intlv_sockets;
+
+	/*
+	 * Get the number of bits needed to cover this many channels.
+	 * order_base_2() rounds up automatically.
+	 */
+	ctx->map.total_intlv_bits = order_base_2(ctx->map.total_intlv_chan);
+}
+
+static u8 hygon_get_intlv_bit_pos(struct addr_ctx *ctx)
+{
+	u8 addr_sel = 0;
+
+	switch (df_cfg.rev) {
+	case HYGON_DF1:
+		addr_sel = FIELD_GET(HYGON_DF1_INTLV_ADDR_SEL, ctx->map.base);
+		break;
+	default:
+		atl_debug_on_bad_df_rev();
+		break;
+	}
+
+	/* Add '8' to get the 'interleave bit position'. */
+	return addr_sel + 8;
+}
+
+static u8 hygon_get_num_intlv_dies(struct addr_ctx *ctx)
+{
+	u8 dies = 0;
+
+	switch (df_cfg.rev) {
+	case HYGON_DF1:
+		dies = FIELD_GET(HYGON_DF1_INTLV_NUM_DIES, ctx->map.limit);
+		break;
+	default:
+		atl_debug_on_bad_df_rev();
+		break;
+	}
+
+	/* Register value is log2, e.g. 0 -> 1 die, 1 -> 2 dies, etc. */
+	return 1 << dies;
+}
+
+static u8 hygon_get_num_intlv_sockets(struct addr_ctx *ctx)
+{
+	u8 sockets = 0;
+
+	switch (df_cfg.rev) {
+	case HYGON_DF1:
+		sockets = FIELD_GET(HYGON_DF1_INTLV_NUM_SOCKETS, ctx->map.base);
+		break;
+	default:
+		atl_debug_on_bad_df_rev();
+		break;
+	}
+
+	/* Register value is log2, e.g. 0 -> 1 sockets, 1 -> 2 sockets, etc. */
+	return 1 << sockets;
+}
+
+static int hygon_get_global_map_data(struct addr_ctx *ctx)
+{
+	if (hygon_df_get_intlv_mode(ctx))
+		return -EINVAL;
+
+	ctx->map.intlv_bit_pos		= hygon_get_intlv_bit_pos(ctx);
+	ctx->map.num_intlv_dies		= hygon_get_num_intlv_dies(ctx);
+	ctx->map.num_intlv_sockets	= hygon_get_num_intlv_sockets(ctx);
+	hygon_calculate_intlv_bits(ctx);
+
+	return 0;
+}
+
+int hygon_get_address_map(struct addr_ctx *ctx)
+{
+	int ret;
+
+	ret = hygon_get_address_map_common(ctx);
+	if (ret)
+		return ret;
+
+	ret = hygon_get_global_map_data(ctx);
+	if (ret)
+		return ret;
+
+	dump_address_map(&ctx->map);
+
+	return ret;
+}
diff --git a/drivers/ras/amd/atl/hygon/reg_fields.h b/drivers/ras/amd/atl/hygon/reg_fields.h
index 2c1193639c6c..44b24593175d 100644
--- a/drivers/ras/amd/atl/hygon/reg_fields.h
+++ b/drivers/ras/amd/atl/hygon/reg_fields.h
@@ -7,6 +7,84 @@
  * Author: AichunShi <shiaichun@open-hieco.net>
  */
 
+/*
+ * Coherent Station Fabric ID
+ *
+ * Access type: Instance
+ *
+ * Register
+ *	Rev	Fieldname	Bits
+ *
+ *	D18F0x50 [Fabric Block Instance Information 3]
+ *	HYGON_DF1   BlockFabricId	[17:8]
+ */
+#define HYGON_DF1_COH_ST_FABRIC_ID	GENMASK(17, 8)
+
+/*
+ * Interleave Number of Sockets
+ *
+ * Access type: Instance
+ *
+ * Register
+ *	Rev	Fieldname	Bits
+ *
+ *	D18F0x110 [DRAM Base Address]
+ *	HYGON_DF1 IntLvNumSockets [3:2]
+ */
+#define HYGON_DF1_INTLV_NUM_SOCKETS	GENMASK(3, 2)
+
+/*
+ * Interleave Number of Channels
+ *
+ * Access type: Instance
+ *
+ * Register
+ *	Rev	Fieldname	Bits
+ *
+ *	D18F0x110 [DRAM Base Address]
+ *	HYGON_DF1	IntLvNumChan	[7:4]
+ */
+#define HYGON_DF1_INTLV_NUM_CHAN	GENMASK(7, 4)
+
+/*
+ * Interleave Address Select
+ *
+ * Access type: Instance
+ *
+ * Register
+ *	Rev	Fieldname	Bits
+ *
+ *	D18F0x110 [DRAM Base Address]
+ *	HYGON_DF1	IntLvAddrSel	[10:8]
+ */
+#define HYGON_DF1_INTLV_ADDR_SEL	GENMASK(10, 8)
+
+/*
+ * Interleave Number of Dies
+ *
+ * Access type: Instance
+ *
+ * Register
+ *	Rev	Fieldname	Bits
+ *
+ *	D18F0x114 [DRAM Limit Address]
+ *	HYGON_DF1	IntLvNumDies	[11:10]
+ */
+#define HYGON_DF1_INTLV_NUM_DIES	GENMASK(11, 10)
+
+/*
+ * High Address Offset
+ *
+ * Access type: Instance
+ *
+ * Register
+ *	Rev	Fieldname	Bits
+ *
+ *	D18F0x214 [DRAM Offset]
+ *	HYGON_DF1	HiAddrOffset	[31:19]
+ */
+#define HYGON_DF1_HI_ADDR_OFFSET	GENMASK(31, 19)
+
 /*
  * Die ID Mask
  *
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 19651cf9e978..d149ec6e7da9 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -55,6 +55,7 @@ enum df_revisions {
 enum intlv_modes {
 	NONE				= 0x00,
 	NOHASH_2CHAN			= 0x01,
+	HYGON_DF1_3CHAN			= 0x02,
 	NOHASH_4CHAN			= 0x03,
 	NOHASH_8CHAN			= 0x05,
 	DF3_6CHAN			= 0x06,
@@ -246,6 +247,14 @@ struct addr_ctx_inputs {
 	u8 coh_st_inst_id;
 };
 
+struct hygon_chan_intlv {
+	u8 sub_channel;
+	u8 chan_addr_sel;
+	u8 chan_hash_enable;
+	u8 ddr5_enable;
+	u8 start_bit;
+};
+
 struct addr_ctx {
 	u64 ret_addr;
 
@@ -266,6 +275,9 @@ struct addr_ctx {
 	 * System-wide ID that includes 'node' bits.
 	 */
 	u16 coh_st_fabric_id;
+
+	/* Hygon Channel Interleave */
+	struct hygon_chan_intlv chan_intlv_hygon;
 };
 
 int df_indirect_read_instance(u16 node, u8 func, u16 reg, u8 instance_id, u32 *lo);
@@ -289,7 +301,12 @@ u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 int get_dram_hole_base(void);
 void dump_df_cfg(void);
 
+int df2_get_dram_addr_map(struct addr_ctx *ctx);
+bool valid_map(struct addr_ctx *ctx);
+void dump_address_map(struct dram_addr_map *map);
+
 int hygon_get_df_system_info(void);
+int hygon_get_address_map(struct addr_ctx *ctx);
 
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
diff --git a/drivers/ras/amd/atl/map.c b/drivers/ras/amd/atl/map.c
index 24a05af747d5..acfd0a636160 100644
--- a/drivers/ras/amd/atl/map.c
+++ b/drivers/ras/amd/atl/map.c
@@ -209,7 +209,7 @@ static int df3_6ch_get_dram_addr_map(struct addr_ctx *ctx)
 	return 0;
 }
 
-static int df2_get_dram_addr_map(struct addr_ctx *ctx)
+int df2_get_dram_addr_map(struct addr_ctx *ctx)
 {
 	/* Read D18F0x110 (DramBaseAddress). */
 	if (df_indirect_read_instance(ctx->node_id, 0, 0x110 + (8 * ctx->map.num),
@@ -441,7 +441,7 @@ static int find_normalized_offset(struct addr_ctx *ctx, u64 *norm_offset)
 	return 0;
 }
 
-static bool valid_map(struct addr_ctx *ctx)
+bool valid_map(struct addr_ctx *ctx)
 {
 	if (df_cfg.rev >= DF4)
 		return FIELD_GET(DF_ADDR_RANGE_VAL, ctx->map.ctl);
@@ -735,7 +735,7 @@ static int validate_address_map(struct addr_ctx *ctx)
 	return -EINVAL;
 }
 
-static void dump_address_map(struct dram_addr_map *map)
+void dump_address_map(struct dram_addr_map *map)
 {
 	u8 i;
 
-- 
2.47.3

