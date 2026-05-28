Received: from out28-98.mail.aliyun.com (out28-98.mail.aliyun.com [115.124.28.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8843313522;
	Thu, 28 May 2026 03:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940435; cv=none; b=L4srOfyWbe3o/P3iWx7THZPaIkaRI+xEbUjGSHSwPaF/Ie6VK6eu3cpEO+jXW3vWDNbcrqbNyTS+Y62UYIAv/r8CwTgbMuO5Xnr3NezhoZ2XKyyKl6RYI9RnCfZ2gXQFwtu1fhgXDBuBOUAeR2OL68EHC+Nv3gzHI+dOHmn6AJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940435; c=relaxed/simple;
	bh=qYKSPzN6EkwxryseXHyaya2jyR3bdrjjDtwQ/5UZaJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K84RmWdYrGcx3XxD8Me7JFdhIkMHr1cEcNSVdDSJe/YAqLSBoCQYdJtfaWLk4a4/CL7ybLi3DuDIUBf/D1Kcz8Eu42l8O+m5cPfj8fHzOdGxMQnFdrmyv4FHVn/Tw5IE1OfuMsYttajJ+uBpgf7aqVApiJrL8vLIW3UaOCjBhZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00236447-0.000260808-0.997375;FP=1976337212772305938|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037017159;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.hieeC3j_1779940421;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hieeC3j_1779940421 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 11:53:44 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH v2 08/11] ras/amd/atl: Add Hygon DF2 address translation support
Date: Thu, 28 May 2026 11:52:42 +0800
Message-ID: <20260528035246.526012-9-shiaichun@open-hieco.net>
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

Extend address translation support for Hygon Family 0x18 model 0x6/0x8
(Hygon DF2).

System detection:
- Add register field definitions for Hygon DF2 in hygon/reg_fields.h.
- Add HYGON_DF2 to enum df_revisions and interleave mode
  HYGON_DF2_4CHAN_HASH (0x22, above the 0x20 DF4.5 range to avoid
  aliasing with hardware values) for four-channel hash for Hygon DF2
  in internal.h.
- Discover Hygon DF2 socket/die mask widths and shifts; detect model
  0x6/0x8 as Hygon DF2.

DRAM map:
- Add hygon_df2_get_dram_addr_map(): use shared AMD DF2 DRAM base/limit
  via df2_get_dram_addr_map(), and read Hygon-specific interleave fields.
- Map hardware intlv_mode 8 to HYGON_DF2_4CHAN_HASH on DF2 and to
  DF2_2CHAN_HASH on other revisions; add DF2_2CHAN_HASH (2-channel) and
  HYGON_DF2_4CHAN_HASH (4-channel) to the channel count table.
- Get die/socket interleave count for Hygon DF2.

Denormalize/dehash:
- Get coherent-station fabric ID for Hygon DF2 including
  HYGON_DF2_4CHAN_HASH case.
- Add HYGON_DF2_4CHAN_HASH to make-space, calculate, and insert
  coherent-station ID switch cases in hygon/denormalize.c.
- Add hygon_df2_4chan_dehash_addr() with void return type to support
  dehash for HYGON_DF2_4CHAN_HASH; it never fails.

UMC:
- Form the coherent-station instance ID from the channel field and
  sub-channel bit from MCA IPID to match Hygon DF2 UMC addressing.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/hygon/dehash.c      | 21 +++++++++++++++
 drivers/ras/amd/atl/hygon/denormalize.c |  5 ++++
 drivers/ras/amd/atl/hygon/map.c         | 36 ++++++++++++++++++++++---
 drivers/ras/amd/atl/hygon/reg_fields.h  | 18 +++++++++++++
 drivers/ras/amd/atl/hygon/system.c      |  9 +++++++
 drivers/ras/amd/atl/hygon/umc.c         |  8 +++++-
 drivers/ras/amd/atl/internal.h          |  2 ++
 7 files changed, 95 insertions(+), 4 deletions(-)

diff --git a/drivers/ras/amd/atl/hygon/dehash.c b/drivers/ras/amd/atl/hygon/dehash.c
index 9ec65888cf7b..e46b9acaba93 100644
--- a/drivers/ras/amd/atl/hygon/dehash.c
+++ b/drivers/ras/amd/atl/hygon/dehash.c
@@ -46,6 +46,23 @@ static void hygon_df_2chan_dehash_addr(struct addr_ctx *ctx)
 		ctx->ret_addr ^= BIT_ULL(intlv_bit_pos);
 }
 
+static void hygon_df2_4chan_dehash_addr(struct addr_ctx *ctx)
+{
+	u8 hashed_bit;
+	u8 intlv_bit_pos = ctx->map.intlv_bit_pos;
+
+	hashed_bit =	(ctx->ret_addr >> 12) ^
+			(ctx->ret_addr >> 18) ^
+			(ctx->ret_addr >> 21) ^
+			(ctx->ret_addr >> 30) ^
+			ctx->coh_st_fabric_id;
+
+	hashed_bit &= 0x3;
+	if (hashed_bit != ((ctx->ret_addr >> intlv_bit_pos) & 0x3))
+		ctx->ret_addr = (ctx->ret_addr & ~((u64)3 << intlv_bit_pos)) |
+				(hashed_bit << intlv_bit_pos);
+}
+
 int hygon_dehash_address(struct addr_ctx *ctx)
 {
 	switch (ctx->map.intlv_mode) {
@@ -63,6 +80,10 @@ int hygon_dehash_address(struct addr_ctx *ctx)
 		hygon_df_2chan_dehash_addr(ctx);
 		break;
 
+	case HYGON_DF2_4CHAN_HASH:
+		hygon_df2_4chan_dehash_addr(ctx);
+		break;
+
 	default:
 		atl_debug_on_bad_intlv_mode(ctx);
 		return -EINVAL;
diff --git a/drivers/ras/amd/atl/hygon/denormalize.c b/drivers/ras/amd/atl/hygon/denormalize.c
index 8bf1cd1efa14..b64ea18aae66 100644
--- a/drivers/ras/amd/atl/hygon/denormalize.c
+++ b/drivers/ras/amd/atl/hygon/denormalize.c
@@ -20,6 +20,8 @@ static u16 hygon_get_dst_fabric_id(struct addr_ctx *ctx)
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
 		return FIELD_GET(HYGON_DF1_DST_FABRIC_ID, ctx->map.limit);
+	case HYGON_DF2:
+		return FIELD_GET(HYGON_DF2_DST_FABRIC_ID, ctx->map.limit);
 	default:
 		atl_debug_on_bad_df_rev();
 		return 0;
@@ -40,6 +42,7 @@ static u64 hygon_make_space_for_coh_st_id(struct addr_ctx *ctx)
 	case NOHASH_16CHAN:
 	case NOHASH_32CHAN:
 	case DF2_2CHAN_HASH:
+	case HYGON_DF2_4CHAN_HASH:
 		return make_space_for_coh_st_id_at_intlv_bit(ctx);
 
 	case HYGON_DF1_3CHAN:
@@ -129,6 +132,7 @@ static u16 hygon_calculate_coh_st_id(struct addr_ctx *ctx)
 	case NOHASH_16CHAN:
 	case NOHASH_32CHAN:
 	case DF2_2CHAN_HASH:
+	case HYGON_DF2_4CHAN_HASH:
 		return hygon_get_coh_st_id_df(ctx);
 
 	default:
@@ -156,6 +160,7 @@ static u64 hygon_insert_coh_st_id(struct addr_ctx *ctx, u64 denorm_addr, u16 coh
 	case NOHASH_16CHAN:
 	case NOHASH_32CHAN:
 	case DF2_2CHAN_HASH:
+	case HYGON_DF2_4CHAN_HASH:
 		return insert_coh_st_id_at_intlv_bit(ctx, denorm_addr, coh_st_id);
 
 	case HYGON_DF1_3CHAN:
diff --git a/drivers/ras/amd/atl/hygon/map.c b/drivers/ras/amd/atl/hygon/map.c
index 7d0ed942a28f..79f23c1d4203 100644
--- a/drivers/ras/amd/atl/hygon/map.c
+++ b/drivers/ras/amd/atl/hygon/map.c
@@ -16,15 +16,20 @@ static int hygon_df_get_intlv_mode(struct addr_ctx *ctx)
 	if (df_cfg.rev == HYGON_DF1 && ctx->map.intlv_mode == 2)
 		ctx->map.intlv_mode = HYGON_DF1_3CHAN;
 
-	if (ctx->map.intlv_mode == 8)
-		ctx->map.intlv_mode = DF2_2CHAN_HASH;
+	if (ctx->map.intlv_mode == 8) {
+		if (df_cfg.rev == HYGON_DF2)
+			ctx->map.intlv_mode = HYGON_DF2_4CHAN_HASH;
+		else
+			ctx->map.intlv_mode = DF2_2CHAN_HASH;
+	}
 
 	if (ctx->map.intlv_mode != NONE &&
 	    ctx->map.intlv_mode != NOHASH_2CHAN &&
-		ctx->map.intlv_mode != HYGON_DF1_3CHAN &&
+	    ctx->map.intlv_mode != HYGON_DF1_3CHAN &&
 	    ctx->map.intlv_mode != NOHASH_4CHAN &&
 	    ctx->map.intlv_mode != NOHASH_8CHAN &&
 	    ctx->map.intlv_mode != NOHASH_16CHAN &&
+	    ctx->map.intlv_mode != HYGON_DF2_4CHAN_HASH &&
 	    ctx->map.intlv_mode != DF2_2CHAN_HASH)
 		return -EINVAL;
 
@@ -38,6 +43,7 @@ static u64 hygon_get_hi_addr_offset(u32 reg_dram_offset)
 
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
+	case HYGON_DF2:
 		hi_addr_offset = FIELD_GET(HYGON_DF1_HI_ADDR_OFFSET, reg_dram_offset);
 		break;
 	default:
@@ -121,10 +127,24 @@ static int hygon_df1_get_dram_addr_map(struct addr_ctx *ctx)
 	return 0;
 }
 
+static int hygon_df2_get_dram_addr_map(struct addr_ctx *ctx)
+{
+	if (df2_get_dram_addr_map(ctx))
+		return -EINVAL;
+
+	/* Read D18F0x60 */
+	if (df_indirect_read_instance(ctx->node_id, 0, 0x60,
+				      ctx->inst_id, &ctx->map.intlv))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int hygon_get_dram_addr_map(struct addr_ctx *ctx)
 {
 	switch (df_cfg.rev) {
 	case HYGON_DF1:	return hygon_df1_get_dram_addr_map(ctx);
+	case HYGON_DF2:	return hygon_df2_get_dram_addr_map(ctx);
 	default:
 			atl_debug_on_bad_df_rev();
 			return -EINVAL;
@@ -143,6 +163,9 @@ static int hygon_get_coh_st_fabric_id(struct addr_ctx *ctx)
 	case HYGON_DF1:
 		ctx->coh_st_fabric_id = FIELD_GET(HYGON_DF1_COH_ST_FABRIC_ID, reg);
 		break;
+	case HYGON_DF2:
+		ctx->coh_st_fabric_id = FIELD_GET(HYGON_DF2_COH_ST_FABRIC_ID, reg);
+		break;
 	default:
 		atl_debug_on_bad_df_rev();
 		return -EINVAL;
@@ -178,9 +201,11 @@ static u8 hygon_get_num_intlv_chan(struct addr_ctx *ctx)
 	case NONE:
 		return 1;
 	case NOHASH_2CHAN:
+	case DF2_2CHAN_HASH:
 		return 2;
 	case HYGON_DF1_3CHAN:
 		return 3;
+	case HYGON_DF2_4CHAN_HASH:
 	case NOHASH_4CHAN:
 		return 4;
 	case NOHASH_8CHAN:
@@ -216,6 +241,7 @@ static u8 hygon_get_intlv_bit_pos(struct addr_ctx *ctx)
 
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
+	case HYGON_DF2:
 		addr_sel = FIELD_GET(HYGON_DF1_INTLV_ADDR_SEL, ctx->map.base);
 		break;
 	default:
@@ -235,6 +261,9 @@ static u8 hygon_get_num_intlv_dies(struct addr_ctx *ctx)
 	case HYGON_DF1:
 		dies = FIELD_GET(HYGON_DF1_INTLV_NUM_DIES, ctx->map.limit);
 		break;
+	case HYGON_DF2:
+		dies = FIELD_GET(HYGON_DF2_INTLV_NUM_DIES, ctx->map.intlv);
+		break;
 	default:
 		atl_debug_on_bad_df_rev();
 		break;
@@ -250,6 +279,7 @@ static u8 hygon_get_num_intlv_sockets(struct addr_ctx *ctx)
 
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
+	case HYGON_DF2:
 		sockets = FIELD_GET(HYGON_DF1_INTLV_NUM_SOCKETS, ctx->map.base);
 		break;
 	default:
diff --git a/drivers/ras/amd/atl/hygon/reg_fields.h b/drivers/ras/amd/atl/hygon/reg_fields.h
index b48eaad4fed0..dd50fddd9402 100644
--- a/drivers/ras/amd/atl/hygon/reg_fields.h
+++ b/drivers/ras/amd/atl/hygon/reg_fields.h
@@ -17,8 +17,10 @@
  *
  *	D18F0x50 [Fabric Block Instance Information 3]
  *	HYGON_DF1   BlockFabricId	[17:8]
+ *	HYGON_DF2   BlockFabricId	[18:8]
  */
 #define HYGON_DF1_COH_ST_FABRIC_ID	GENMASK(17, 8)
+#define HYGON_DF2_COH_ST_FABRIC_ID	GENMASK(18, 8)
 
 /*
  * Interleave Number of Sockets
@@ -30,6 +32,7 @@
  *
  *	D18F0x110 [DRAM Base Address]
  *	HYGON_DF1 IntLvNumSockets [3:2]
+ *	HYGON_DF2 IntLvNumSockets [3:2]
  */
 #define HYGON_DF1_INTLV_NUM_SOCKETS	GENMASK(3, 2)
 
@@ -43,6 +46,7 @@
  *
  *	D18F0x110 [DRAM Base Address]
  *	HYGON_DF1	IntLvNumChan	[7:4]
+ *	HYGON_DF2	IntLvNumChan	[7:4]
  */
 #define HYGON_DF1_INTLV_NUM_CHAN	GENMASK(7, 4)
 
@@ -56,6 +60,7 @@
  *
  *	D18F0x110 [DRAM Base Address]
  *	HYGON_DF1	IntLvAddrSel	[10:8]
+ *	HYGON_DF2	IntLvAddrSel	[10:8]
  */
 #define HYGON_DF1_INTLV_ADDR_SEL	GENMASK(10, 8)
 
@@ -69,8 +74,10 @@
  *
  *	D18F0x114 [DRAM Limit Address]
  *	HYGON_DF1	DstFabricID	[9:0]
+ *	HYGON_DF2	DstFabricID	[10:0]
  */
 #define HYGON_DF1_DST_FABRIC_ID	GENMASK(9, 0)
+#define HYGON_DF2_DST_FABRIC_ID	GENMASK(10, 0)
 
 /*
  * Interleave Number of Dies
@@ -82,8 +89,12 @@
  *
  *	D18F0x114 [DRAM Limit Address]
  *	HYGON_DF1	IntLvNumDies	[11:10]
+ *
+ *	D18F0x60
+ *	HYGON_DF2	IntLvNumDies	[1:0]
  */
 #define HYGON_DF1_INTLV_NUM_DIES	GENMASK(11, 10)
+#define HYGON_DF2_INTLV_NUM_DIES	GENMASK(1, 0)
 
 /*
  * High Address Offset
@@ -95,6 +106,7 @@
  *
  *	D18F0x214 [DRAM Offset]
  *	HYGON_DF1	HiAddrOffset	[31:19]
+ *	HYGON_DF2	HiAddrOffset	[31:19]
  */
 #define HYGON_DF1_HI_ADDR_OFFSET	GENMASK(31, 19)
 
@@ -108,8 +120,10 @@
  *
  *	D18F1x208 [System Fabric ID Mask]
  *	HYGON_DF1 DieIdMask [9:0]
+ *	HYGON_DF2 DieIdMask [10:0]
  */
 #define HYGON_DF1_DIE_ID_MASK	GENMASK(9, 0)
+#define HYGON_DF2_DIE_ID_MASK	GENMASK(10, 0)
 
 /*
  * Die ID Shift
@@ -121,6 +135,7 @@
  *
  *	D18F1x208 [System Fabric ID Mask]
  *	HYGON_DF1 DieIdShift [15:12]
+ *	HYGON_DF2 DieIdShift [15:12]
  */
 #define HYGON_DF1_DIE_ID_SHIFT	GENMASK(15, 12)
 
@@ -134,8 +149,10 @@
  *
  * D18F1x208 [System Fabric ID Mask]
  *	HYGON_DF1 SocketIdMask	[25:16]
+ *	HYGON_DF2 SocketIdMask	[26:16]
  */
 #define HYGON_DF1_SOCKET_ID_MASK	GENMASK(25, 16)
+#define HYGON_DF2_SOCKET_ID_MASK	GENMASK(26, 16)
 
 /*
  * Socket ID Shift
@@ -147,5 +164,6 @@
  *
  * D18F1x208 [System Fabric ID Mask]
  *	HYGON_DF1 SocketIdShift	[31:28]
+ *	HYGON_DF2 SocketIdShift	[31:28]
  */
 #define HYGON_DF1_SOCKET_ID_SHIFT	GENMASK(31, 28)
diff --git a/drivers/ras/amd/atl/hygon/system.c b/drivers/ras/amd/atl/hygon/system.c
index bff577a559ad..99a139acaac6 100644
--- a/drivers/ras/amd/atl/hygon/system.c
+++ b/drivers/ras/amd/atl/hygon/system.c
@@ -18,6 +18,12 @@ static void hygon_df_get_masks_shifts(u32 mask0)
 		df_cfg.die_id_shift = FIELD_GET(HYGON_DF1_DIE_ID_SHIFT, mask0);
 		df_cfg.die_id_mask = FIELD_GET(HYGON_DF1_DIE_ID_MASK, mask0);
 		break;
+	case HYGON_DF2:
+		df_cfg.socket_id_shift = FIELD_GET(HYGON_DF1_SOCKET_ID_SHIFT, mask0);
+		df_cfg.socket_id_mask = FIELD_GET(HYGON_DF2_SOCKET_ID_MASK, mask0);
+		df_cfg.die_id_shift = FIELD_GET(HYGON_DF1_DIE_ID_SHIFT, mask0);
+		df_cfg.die_id_mask = FIELD_GET(HYGON_DF2_DIE_ID_MASK, mask0);
+		break;
 	default:
 		atl_debug_on_bad_df_rev();
 		return;
@@ -33,6 +39,8 @@ static int hygon_determine_df_rev(void)
 
 	if (hygon_f18h_model_in_range(0x4, 0x5))
 		df_cfg.rev = HYGON_DF1;
+	else if (boot_cpu_data.x86_model == 0x6 || boot_cpu_data.x86_model == 0x8)
+		df_cfg.rev = HYGON_DF2;
 
 	/* Read D18F1x208 (SystemFabricIdMask). */
 	if (df_indirect_read_broadcast(0, 1, 0x208, &fabric_id_mask0))
@@ -47,6 +55,7 @@ static void hygon_get_num_maps(void)
 {
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
+	case HYGON_DF2:
 		df_cfg.num_coh_st_maps	= 2;
 		break;
 	default:
diff --git a/drivers/ras/amd/atl/hygon/umc.c b/drivers/ras/amd/atl/hygon/umc.c
index 0f064dd22bcc..fd25deb843db 100644
--- a/drivers/ras/amd/atl/hygon/umc.c
+++ b/drivers/ras/amd/atl/hygon/umc.c
@@ -23,7 +23,13 @@ static u8 hygon_get_ipid_sub_channel(struct atl_err *err)
 #define HYGON_UMC_CHANNEL_NUM	GENMASK(23, 20)
 static u8 hygon_get_coh_st_inst_id(struct atl_err *err)
 {
-	return FIELD_GET(HYGON_UMC_CHANNEL_NUM, err->ipid);
+	u8 sub_channel = hygon_get_ipid_sub_channel(err);
+	u8 coh_st_inst_id = FIELD_GET(HYGON_UMC_CHANNEL_NUM, err->ipid);
+
+	if (df_cfg.rev == HYGON_DF2)
+		coh_st_inst_id = (coh_st_inst_id << 1) + sub_channel;
+
+	return coh_st_inst_id;
 }
 
 unsigned long hygon_convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 5648f9fdd1cb..bda71630b4a1 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -55,6 +55,7 @@ static inline bool is_hygon_f18h(void)
 enum df_revisions {
 	UNKNOWN,
 	HYGON_DF1,
+	HYGON_DF2,
 	DF2,
 	DF3,
 	DF3p5,
@@ -87,6 +88,7 @@ enum intlv_modes {
 	MI3_HASH_16CHAN			= 0x19,
 	MI3_HASH_32CHAN			= 0x1A,
 	DF2_2CHAN_HASH			= 0x21,
+	HYGON_DF2_4CHAN_HASH		= 0x22,
 	/* DF4.5 modes are all IntLvNumChan + 0x20 */
 	DF4p5_NPS1_16CHAN_1K_HASH	= 0x2C,
 	DF4p5_NPS0_24CHAN_1K_HASH	= 0x2E,
-- 
2.47.3

