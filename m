Received: from out28-111.mail.aliyun.com (out28-111.mail.aliyun.com [115.124.28.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643AC3AB29C;
	Fri,  3 Apr 2026 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213957; cv=none; b=Ax+uxMxfPytSF+Ohjp0rxKf/7IyibmQGWknDcU16kJcRzNFtwCKdQ7Dp7LnCgIAnAAwuU988Lh4dQKKnSkZnLOwIZUv+rg1m+H+94OTfpGhdXMgzhbN5gOJfMrdXZ/bG7Va/yMCE/fPAF+jOAS0LEXyJjB8/oD58voNyp2ESNiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213957; c=relaxed/simple;
	bh=Meyf+KhWGfkBzxAl3COHv8EoR2naTQ4BN35cNm12C/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBOi3vL3JnmprK6QFpBw2WMBjU5GR9vb0KO9n8859sBgjFsuRiaF+jVC0OFZlKjpGJdwkPQ25A6cCGP084ORr9D5rS3EQtB4SBcU4TztXKggishWeH1x2+Bbk00qpzx6pwxYRcC5AW9zVDleXs1OqIaWjmD+XulK13KNhef9Imo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_alarm|0.00259096-0.000165939-0.997243;FP=2264602773296106514|2|1|2|0|-1|-1|-1;HT=maildocker-contentspam033032027189;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h4TkM4p_1775213938;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.h4TkM4p_1775213938 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 18:59:04 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH 08/10] ras/amd/atl: Add Hygon DF2 address translation support
Date: Fri,  3 Apr 2026 18:57:32 +0800
Message-ID: <5f7d3a38bf4785ff84e7611e19c192a4361b65a8.1775213147.git.shiaichun@open-hieco.net>
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

Extend address translation support for Hygon Family 0x18 model 0x6/0x8
(Hygon DF2).

System detection:
- Add register field definitions for Hygon DF2 in hygon/reg_fields.h.
- Add HYGON_DF2 to enum df_revisions and interleave mode
  HYGON_DF2_4CHAN_HASH for four-channel hash for Hygon DF2 in internal.h.
- Discover Hygon DF2 socket/die mask widths and shifts; detect model
  0x6/0x8 as Hygon DF2.

DRAM map:
- Add hygon_df2_get_dram_addr_map(): use shared AMD DF2 DRAM base/limit
  via df2_get_dram_addr_map(), and read Hygon-specific interleave fields.
- Map Hygon-specific HYGON_DF2_4CHAN_HASH interleave mode instead of
  the AMD DF2 two-channel hash mode.
- Get die/socket interleave count for Hygon DF2.

Denormalize/dehash:
- Get coherent-station fabric ID for Hygon DF2 including
  HYGON_DF2_4CHAN_HASH case.
- Add hygon_df2_4chan_dehash_addr() to support dehash function for
  HYGON_DF2_4CHAN_HASH interleave mode.

UMC:
- Form the coherent-station instance ID from the channel field and
  sub-channel bit from MCA IPID to match Hygon DF2 UMC addressing.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/hygon/dehash.c      | 23 +++++++++++++++++
 drivers/ras/amd/atl/hygon/denormalize.c |  3 +++
 drivers/ras/amd/atl/hygon/map.c         | 33 +++++++++++++++++++++++--
 drivers/ras/amd/atl/hygon/reg_fields.h  | 18 ++++++++++++++
 drivers/ras/amd/atl/hygon/system.c      |  9 +++++++
 drivers/ras/amd/atl/hygon/umc.c         |  8 +++++-
 drivers/ras/amd/atl/internal.h          |  2 ++
 7 files changed, 93 insertions(+), 3 deletions(-)

diff --git a/drivers/ras/amd/atl/hygon/dehash.c b/drivers/ras/amd/atl/hygon/dehash.c
index 43f1bdea1eeb..e0546ea70900 100644
--- a/drivers/ras/amd/atl/hygon/dehash.c
+++ b/drivers/ras/amd/atl/hygon/dehash.c
@@ -48,6 +48,25 @@ static int hygon_df_2chan_dehash_addr(struct addr_ctx *ctx)
 	return 0;
 }
 
+static int hygon_df2_4chan_dehash_addr(struct addr_ctx *ctx)
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
+
+	return 0;
+}
+
 int hygon_dehash_address(struct addr_ctx *ctx)
 {
 	switch (ctx->map.intlv_mode) {
@@ -65,6 +84,10 @@ int hygon_dehash_address(struct addr_ctx *ctx)
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
index d189799bd183..82c5982893ba 100644
--- a/drivers/ras/amd/atl/hygon/denormalize.c
+++ b/drivers/ras/amd/atl/hygon/denormalize.c
@@ -14,6 +14,8 @@ static u16 hygon_get_dst_fabric_id(struct addr_ctx *ctx)
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
 		return FIELD_GET(HYGON_DF1_DST_FABRIC_ID, ctx->map.limit);
+	case HYGON_DF2:
+		return FIELD_GET(HYGON_DF2_DST_FABRIC_ID, ctx->map.limit);
 	default:
 		atl_debug_on_bad_df_rev();
 		return 0;
@@ -117,6 +119,7 @@ static u16 hygon_calculate_coh_st_id(struct addr_ctx *ctx)
 	case NOHASH_16CHAN:
 	case NOHASH_32CHAN:
 	case DF2_2CHAN_HASH:
+	case HYGON_DF2_4CHAN_HASH:
 		return hygon_get_coh_st_id_df(ctx);
 
 	default:
diff --git a/drivers/ras/amd/atl/hygon/map.c b/drivers/ras/amd/atl/hygon/map.c
index 2194c10ff587..b0c05532b744 100644
--- a/drivers/ras/amd/atl/hygon/map.c
+++ b/drivers/ras/amd/atl/hygon/map.c
@@ -16,8 +16,12 @@ static int hygon_df_get_intlv_mode(struct addr_ctx *ctx)
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
@@ -25,6 +29,7 @@ static int hygon_df_get_intlv_mode(struct addr_ctx *ctx)
 	    ctx->map.intlv_mode != NOHASH_4CHAN &&
 	    ctx->map.intlv_mode != NOHASH_8CHAN &&
 	    ctx->map.intlv_mode != NOHASH_16CHAN &&
+		ctx->map.intlv_mode != HYGON_DF2_4CHAN_HASH &&
 	    ctx->map.intlv_mode != DF2_2CHAN_HASH)
 		return -EINVAL;
 
@@ -38,6 +43,7 @@ static u64 hygon_get_hi_addr_offset(u32 reg_dram_offset)
 
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
+	case HYGON_DF2:
 		hi_addr_offset = FIELD_GET(HYGON_DF1_HI_ADDR_OFFSET, reg_dram_offset);
 		break;
 	default:
@@ -120,10 +126,24 @@ static int hygon_df1_get_dram_addr_map(struct addr_ctx *ctx)
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
@@ -142,6 +162,9 @@ static int hygon_get_coh_st_fabric_id(struct addr_ctx *ctx)
 	case HYGON_DF1:
 		ctx->coh_st_fabric_id = FIELD_GET(HYGON_DF1_COH_ST_FABRIC_ID, reg);
 		break;
+	case HYGON_DF2:
+		ctx->coh_st_fabric_id = FIELD_GET(HYGON_DF2_COH_ST_FABRIC_ID, reg);
+		break;
 	default:
 		atl_debug_on_bad_df_rev();
 		return -EINVAL;
@@ -226,6 +249,7 @@ static u8 hygon_get_num_intlv_chan(struct addr_ctx *ctx)
 		return 2;
 	case HYGON_DF1_3CHAN:
 		return 3;
+	case HYGON_DF2_4CHAN_HASH:
 	case NOHASH_4CHAN:
 		return 4;
 	case NOHASH_8CHAN:
@@ -261,6 +285,7 @@ static u8 hygon_get_intlv_bit_pos(struct addr_ctx *ctx)
 
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
+	case HYGON_DF2:
 		addr_sel = FIELD_GET(HYGON_DF1_INTLV_ADDR_SEL, ctx->map.base);
 		break;
 	default:
@@ -280,6 +305,9 @@ static u8 hygon_get_num_intlv_dies(struct addr_ctx *ctx)
 	case HYGON_DF1:
 		dies = FIELD_GET(HYGON_DF1_INTLV_NUM_DIES, ctx->map.limit);
 		break;
+	case HYGON_DF2:
+		dies = FIELD_GET(HYGON_DF2_INTLV_NUM_DIES, ctx->map.intlv);
+		break;
 	default:
 		atl_debug_on_bad_df_rev();
 		break;
@@ -295,6 +323,7 @@ static u8 hygon_get_num_intlv_sockets(struct addr_ctx *ctx)
 
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
+	case HYGON_DF2:
 		sockets = FIELD_GET(HYGON_DF1_INTLV_NUM_SOCKETS, ctx->map.base);
 		break;
 	default:
diff --git a/drivers/ras/amd/atl/hygon/reg_fields.h b/drivers/ras/amd/atl/hygon/reg_fields.h
index 69be2d5d2240..eaf1d628fd0e 100644
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
index 2a149cfc34c1..a06a39bc4527 100644
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
@@ -30,6 +36,8 @@ static int hygon_determine_df_rev(void)
 
 	if (boot_cpu_data.x86_model == 0x4 || boot_cpu_data.x86_model == 0x5)
 		df_cfg.rev = HYGON_DF1;
+	else if (boot_cpu_data.x86_model == 0x6 || boot_cpu_data.x86_model == 0x8)
+		df_cfg.rev = HYGON_DF2;
 
 	/* Read D18F1x208 (SystemFabricIdMask). */
 	if (df_indirect_read_broadcast(0, 1, 0x208, &fabric_id_mask0))
@@ -44,6 +52,7 @@ static void hygon_get_num_maps(void)
 {
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
+	case HYGON_DF2:
 		df_cfg.num_coh_st_maps	= 2;
 		break;
 	default:
diff --git a/drivers/ras/amd/atl/hygon/umc.c b/drivers/ras/amd/atl/hygon/umc.c
index e2339db3f575..b912dbdebee4 100644
--- a/drivers/ras/amd/atl/hygon/umc.c
+++ b/drivers/ras/amd/atl/hygon/umc.c
@@ -27,7 +27,13 @@ static u8 hygon_get_ipid_sub_channel(struct atl_err *err)
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
index f943cc33f82e..c368559ca2ae 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -44,6 +44,7 @@
 enum df_revisions {
 	UNKNOWN,
 	HYGON_DF1,
+	HYGON_DF2,
 	DF2,
 	DF3,
 	DF3p5,
@@ -61,6 +62,7 @@ enum intlv_modes {
 	DF3_6CHAN			= 0x06,
 	NOHASH_16CHAN			= 0x07,
 	NOHASH_32CHAN			= 0x08,
+	HYGON_DF2_4CHAN_HASH		= 0x09,
 	DF3_COD4_2CHAN_HASH		= 0x0C,
 	DF3_COD2_4CHAN_HASH		= 0x0D,
 	DF3_COD1_8CHAN_HASH		= 0x0E,
-- 
2.47.3

