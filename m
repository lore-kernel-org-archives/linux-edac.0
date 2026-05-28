Received: from out198-20.us.a.mail.aliyun.com (out198-20.us.a.mail.aliyun.com [47.90.198.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF181DE8BE;
	Thu, 28 May 2026 04:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779941365; cv=none; b=Ev60ryEQUSTSclN61jAIeCvam6x162jTe8g00R63sac6BzxLfDqJ3HyY+BtldD7pjcqo//+Wuh3dXypWj/n/g3B8jfvpZW7axR+6P3noN+Sqn1JKRZQv3Yke09u++oyXY9xqfqgAonjWrNwBtHT9Bpqm5XTEGm0NfIysAoLeQow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779941365; c=relaxed/simple;
	bh=8hSCcSIeOS9kHBROuPW24gTFO7ivIU8Ec7eu5qN4Siw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYCQ8B4UXn8iKxQIENmjdk09ClsVEix+OfujDZyD5k2LUOo3MdJzpd7F75Uw1hj+pQ4NpeL36mTF9ZFg+dK8jHGMwPJBrmP54n3Wft6roJZA7fQyIb5iO2nw38r29ZbTYrUyelVoMGfqMpI/YCpevVAI27XVHYcNw34tTztPntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=47.90.198.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00432169-0.000303894-0.995374;FP=1039342469963859155|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037022039;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.hieeBiu_1779940399;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hieeBiu_1779940399 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 11:53:22 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH v2 02/11] ras/amd/atl: Add Hygon DF1 DRAM address map decoding helper
Date: Thu, 28 May 2026 11:52:36 +0800
Message-ID: <20260528035246.526012-3-shiaichun@open-hieco.net>
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

Hygon address map decoding duplicated the same loop as the AMD path for
walking coherent station DRAM maps and selecting the high-address offset.
Only the per-map register read differs; pass it via a callback so
get_dram_offset() and hygon_get_dram_offset() share the implementation.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/Makefile           |   1 +
 drivers/ras/amd/atl/hygon/map.c        | 292 +++++++++++++++++++++++++
 drivers/ras/amd/atl/hygon/reg_fields.h |  78 +++++++
 drivers/ras/amd/atl/internal.h         |  21 ++
 drivers/ras/amd/atl/map.c              |  11 +-
 5 files changed, 398 insertions(+), 5 deletions(-)
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
index 000000000000..7d0ed942a28f
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/map.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Address Translation Library (for hygon)
+ *
+ * map.c : Functions to read and decode DRAM address maps for Hygon
+ *
+ * Author: Aichun Shi <shiaichun@open-hieco.net>
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
+		u8 sb;
+		u64 low_addr, high_addr;
+
+		ctx->chan_intlv_hygon.start_bit = ctx->chan_intlv_hygon.chan_addr_sel ? 8 : 7;
+		sb = ctx->chan_intlv_hygon.start_bit;
+		low_addr = ctx->ret_addr & GENMASK_ULL(sb - 1, 0);
+		high_addr = (ctx->ret_addr & GENMASK_ULL(63, sb)) << 1;
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
+static int hygon_get_address_map_common(struct addr_ctx *ctx)
+{
+	u64 norm_offset = 0;
+
+	if (hygon_get_coh_st_fabric_id(ctx))
+		return -EINVAL;
+
+	if (find_normalized_offset(ctx, &norm_offset, hygon_get_dram_offset))
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
index b669049c46e5..b3d658bef6ad 100644
--- a/drivers/ras/amd/atl/hygon/reg_fields.h
+++ b/drivers/ras/amd/atl/hygon/reg_fields.h
@@ -7,6 +7,84 @@
  * Author: Aichun Shi <shiaichun@open-hieco.net>
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
index 56008238c220..adcf94385b39 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -66,6 +66,7 @@ enum df_revisions {
 enum intlv_modes {
 	NONE				= 0x00,
 	NOHASH_2CHAN			= 0x01,
+	HYGON_DF1_3CHAN			= 0x02,
 	NOHASH_4CHAN			= 0x03,
 	NOHASH_8CHAN			= 0x05,
 	DF3_6CHAN			= 0x06,
@@ -257,6 +258,14 @@ struct addr_ctx_inputs {
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
 
@@ -277,6 +286,9 @@ struct addr_ctx {
 	 * System-wide ID that includes 'node' bits.
 	 */
 	u16 coh_st_fabric_id;
+
+	/* Hygon Channel Interleave */
+	struct hygon_chan_intlv chan_intlv_hygon;
 };
 
 int df_indirect_read_instance(u16 node, u8 func, u16 reg, u8 instance_id, u32 *lo);
@@ -300,7 +312,16 @@ u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 int get_dram_hole_base(void);
 void dump_df_cfg(void);
 
+int df2_get_dram_addr_map(struct addr_ctx *ctx);
+bool valid_map(struct addr_ctx *ctx);
+void dump_address_map(struct dram_addr_map *map);
+
+typedef int (*get_dram_offset_fn)(struct addr_ctx *ctx, u64 *norm_offset);
+int find_normalized_offset(struct addr_ctx *ctx, u64 *norm_offset,
+			   get_dram_offset_fn get_dram_offset);
+
 int hygon_get_df_system_info(void);
+int hygon_get_address_map(struct addr_ctx *ctx);
 
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
diff --git a/drivers/ras/amd/atl/map.c b/drivers/ras/amd/atl/map.c
index 24a05af747d5..365ad48ca68f 100644
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
@@ -395,7 +395,8 @@ static int get_coh_st_fabric_id(struct addr_ctx *ctx)
 	return 0;
 }
 
-static int find_normalized_offset(struct addr_ctx *ctx, u64 *norm_offset)
+int find_normalized_offset(struct addr_ctx *ctx, u64 *norm_offset,
+			   get_dram_offset_fn get_dram_offset)
 {
 	u64 last_offset = 0;
 	int ret;
@@ -441,7 +442,7 @@ static int find_normalized_offset(struct addr_ctx *ctx, u64 *norm_offset)
 	return 0;
 }
 
-static bool valid_map(struct addr_ctx *ctx)
+bool valid_map(struct addr_ctx *ctx)
 {
 	if (df_cfg.rev >= DF4)
 		return FIELD_GET(DF_ADDR_RANGE_VAL, ctx->map.ctl);
@@ -456,7 +457,7 @@ static int get_address_map_common(struct addr_ctx *ctx)
 	if (get_coh_st_fabric_id(ctx))
 		return -EINVAL;
 
-	if (find_normalized_offset(ctx, &norm_offset))
+	if (find_normalized_offset(ctx, &norm_offset, get_dram_offset))
 		return -EINVAL;
 
 	if (get_dram_addr_map(ctx))
@@ -735,7 +736,7 @@ static int validate_address_map(struct addr_ctx *ctx)
 	return -EINVAL;
 }
 
-static void dump_address_map(struct dram_addr_map *map)
+void dump_address_map(struct dram_addr_map *map)
 {
 	u8 i;
 
-- 
2.47.3

