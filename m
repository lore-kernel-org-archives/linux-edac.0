Received: from out28-134.mail.aliyun.com (out28-134.mail.aliyun.com [115.124.28.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B07E386438;
	Fri,  3 Apr 2026 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213963; cv=none; b=ZqrrULInpMmtRBTjy1zVTQwhz9gE+Zl3LPOwFNR/ydQHxHem0l/VGWYPZ7nDjzNgEG+IX/VSaAGljObkuoWxgaspPNDlgo8cyzT1rBaEU6+N7pWE/+vXOC9Ve79n8VNw8UoA39zZgyGRcV7V+5Oi7aDY+vyYXR5pXvNmkD0/s4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213963; c=relaxed/simple;
	bh=km5TsRbaEVjjodmY3mgKPt10XvjdWR6u+uljfeWnDS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpXx4/Gzn+SGw5BhM2XnoC8VgEV/0QRzLwrrKwJa3ee8adnKPwEJEEOO2pkxlxVzFQM5rhjzZ4G2TCDK2mHcQoVoDeszV1INe2uR4Q8JDPknP11QAbHh63KpTtL0sOfTE1guIO/9Oj4dAraIUu6+hteklwI/WziE6kZTi+1aKqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436351|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_alarm|0.00393754-0.0092153-0.986847;FP=535220511822433307|2|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037025160;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h4TkMBV_1775213945;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.h4TkMBV_1775213945 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 18:59:09 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH 09/10] ras/amd/atl: Add Hygon DF3 address translation support
Date: Fri,  3 Apr 2026 18:57:33 +0800
Message-ID: <3807bef375665273b8096c075d84ca22cfeca02d.1775213147.git.shiaichun@open-hieco.net>
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

Extend address translation support for Hygon Family 0x18 model 0x7
(Hygon DF3).

System detection:
- Add register field definitions for Hygon DF3 in hygon/reg_fields.h.
- Add HYGON_DF3 to enum df_revisions in internal.h.
- Discover Hygon DF3 socket/die mask widths and shifts; detect model
  0x7 as Hygon DF3.

DRAM map:
- Use shared AMD DF2 DRAM base/limit via df2_get_dram_addr_map().
- Map Hygon-specific HYGON_DF2_4CHAN_HASH interleave mode for Hygon DF3.
- Get die/socket interleave count for Hygon DF3.
- Get DRAM offset and high address offset for Hygon DF3.

Denormalize:
- Get destination fabric ID for Hygon DF3.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/hygon/denormalize.c |  2 ++
 drivers/ras/amd/atl/hygon/map.c         | 21 +++++++++++++++++++--
 drivers/ras/amd/atl/hygon/reg_fields.h  | 22 ++++++++++++++++++++++
 drivers/ras/amd/atl/hygon/system.c      |  9 +++++++++
 drivers/ras/amd/atl/internal.h          |  1 +
 5 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/ras/amd/atl/hygon/denormalize.c b/drivers/ras/amd/atl/hygon/denormalize.c
index 82c5982893ba..6e882a6b7b55 100644
--- a/drivers/ras/amd/atl/hygon/denormalize.c
+++ b/drivers/ras/amd/atl/hygon/denormalize.c
@@ -16,6 +16,8 @@ static u16 hygon_get_dst_fabric_id(struct addr_ctx *ctx)
 		return FIELD_GET(HYGON_DF1_DST_FABRIC_ID, ctx->map.limit);
 	case HYGON_DF2:
 		return FIELD_GET(HYGON_DF2_DST_FABRIC_ID, ctx->map.limit);
+	case HYGON_DF3:
+		return FIELD_GET(HYGON_DF3_DST_FABRIC_ID, ctx->map.limit);
 	default:
 		atl_debug_on_bad_df_rev();
 		return 0;
diff --git a/drivers/ras/amd/atl/hygon/map.c b/drivers/ras/amd/atl/hygon/map.c
index b0c05532b744..2a3d962be083 100644
--- a/drivers/ras/amd/atl/hygon/map.c
+++ b/drivers/ras/amd/atl/hygon/map.c
@@ -17,7 +17,7 @@ static int hygon_df_get_intlv_mode(struct addr_ctx *ctx)
 		ctx->map.intlv_mode = HYGON_DF1_3CHAN;
 
 	if (ctx->map.intlv_mode == 8) {
-		if (df_cfg.rev == HYGON_DF2)
+		if (df_cfg.rev == HYGON_DF2 || df_cfg.rev == HYGON_DF3)
 			ctx->map.intlv_mode = HYGON_DF2_4CHAN_HASH;
 		else
 			ctx->map.intlv_mode = DF2_2CHAN_HASH;
@@ -46,6 +46,9 @@ static u64 hygon_get_hi_addr_offset(u32 reg_dram_offset)
 	case HYGON_DF2:
 		hi_addr_offset = FIELD_GET(HYGON_DF1_HI_ADDR_OFFSET, reg_dram_offset);
 		break;
+	case HYGON_DF3:
+		hi_addr_offset = FIELD_GET(HYGON_DF3_HI_ADDR_OFFSET, reg_dram_offset);
+		break;
 	default:
 		hi_addr_offset = 0;
 		atl_debug_on_bad_df_rev();
@@ -77,7 +80,12 @@ static int hygon_get_dram_offset(struct addr_ctx *ctx, u64 *norm_offset)
 	 */
 	map_num = ctx->map.num - 1;
 
-	if (df_cfg.rev >= HYGON_DF1) {
+	if (df_cfg.rev >= HYGON_DF3) {
+		/* Read D18F0x1B4 (DramOffset) */
+		if (df_indirect_read_instance(ctx->node_id, 0, 0x1B4 + (4 * map_num),
+					      ctx->inst_id, &reg_dram_offset))
+			return -EINVAL;
+	} else if (df_cfg.rev >= HYGON_DF1) {
 		/* Read D18F0x214 (DramOffset) */
 		if (df_indirect_read_instance(ctx->node_id, 0, 0x214 + (4 * map_num),
 					      ctx->inst_id, &reg_dram_offset))
@@ -144,6 +152,7 @@ static int hygon_get_dram_addr_map(struct addr_ctx *ctx)
 	switch (df_cfg.rev) {
 	case HYGON_DF1:	return hygon_df1_get_dram_addr_map(ctx);
 	case HYGON_DF2:	return hygon_df2_get_dram_addr_map(ctx);
+	case HYGON_DF3:	return df2_get_dram_addr_map(ctx);
 	default:
 			atl_debug_on_bad_df_rev();
 			return -EINVAL;
@@ -165,6 +174,9 @@ static int hygon_get_coh_st_fabric_id(struct addr_ctx *ctx)
 	case HYGON_DF2:
 		ctx->coh_st_fabric_id = FIELD_GET(HYGON_DF2_COH_ST_FABRIC_ID, reg);
 		break;
+	case HYGON_DF3:
+		ctx->coh_st_fabric_id = FIELD_GET(HYGON_DF3_COH_ST_FABRIC_ID, reg);
+		break;
 	default:
 		atl_debug_on_bad_df_rev();
 		return -EINVAL;
@@ -286,6 +298,7 @@ static u8 hygon_get_intlv_bit_pos(struct addr_ctx *ctx)
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
 	case HYGON_DF2:
+	case HYGON_DF3:
 		addr_sel = FIELD_GET(HYGON_DF1_INTLV_ADDR_SEL, ctx->map.base);
 		break;
 	default:
@@ -303,6 +316,7 @@ static u8 hygon_get_num_intlv_dies(struct addr_ctx *ctx)
 
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
+	case HYGON_DF3:
 		dies = FIELD_GET(HYGON_DF1_INTLV_NUM_DIES, ctx->map.limit);
 		break;
 	case HYGON_DF2:
@@ -326,6 +340,9 @@ static u8 hygon_get_num_intlv_sockets(struct addr_ctx *ctx)
 	case HYGON_DF2:
 		sockets = FIELD_GET(HYGON_DF1_INTLV_NUM_SOCKETS, ctx->map.base);
 		break;
+	case HYGON_DF3:
+		sockets = FIELD_GET(HYGON_DF3_INTLV_NUM_SOCKETS, ctx->map.limit);
+		break;
 	default:
 		atl_debug_on_bad_df_rev();
 		break;
diff --git a/drivers/ras/amd/atl/hygon/reg_fields.h b/drivers/ras/amd/atl/hygon/reg_fields.h
index eaf1d628fd0e..1ee9980d7834 100644
--- a/drivers/ras/amd/atl/hygon/reg_fields.h
+++ b/drivers/ras/amd/atl/hygon/reg_fields.h
@@ -18,9 +18,11 @@
  *	D18F0x50 [Fabric Block Instance Information 3]
  *	HYGON_DF1   BlockFabricId	[17:8]
  *	HYGON_DF2   BlockFabricId	[18:8]
+ *	HYGON_DF3   BlockFabricId	[15:8]
  */
 #define HYGON_DF1_COH_ST_FABRIC_ID	GENMASK(17, 8)
 #define HYGON_DF2_COH_ST_FABRIC_ID	GENMASK(18, 8)
+#define HYGON_DF3_COH_ST_FABRIC_ID	GENMASK(15, 8)
 
 /*
  * Interleave Number of Sockets
@@ -33,8 +35,12 @@
  *	D18F0x110 [DRAM Base Address]
  *	HYGON_DF1 IntLvNumSockets [3:2]
  *	HYGON_DF2 IntLvNumSockets [3:2]
+ *
+ *	D18F0x114 [DRAM Limit Address]
+ *	HYGON_DF3 IntLvNumSockets [8]
  */
 #define HYGON_DF1_INTLV_NUM_SOCKETS	GENMASK(3, 2)
+#define HYGON_DF3_INTLV_NUM_SOCKETS	BIT(8)
 
 /*
  * Interleave Number of Channels
@@ -47,6 +53,7 @@
  *	D18F0x110 [DRAM Base Address]
  *	HYGON_DF1	IntLvNumChan	[7:4]
  *	HYGON_DF2	IntLvNumChan	[7:4]
+ *	HYGON_DF3	IntLvNumChan	[7:4]
  */
 #define HYGON_DF1_INTLV_NUM_CHAN	GENMASK(7, 4)
 
@@ -61,6 +68,7 @@
  *	D18F0x110 [DRAM Base Address]
  *	HYGON_DF1	IntLvAddrSel	[10:8]
  *	HYGON_DF2	IntLvAddrSel	[10:8]
+ *	HYGON_DF3	IntLvAddrSel	[10:8]
  */
 #define HYGON_DF1_INTLV_ADDR_SEL	GENMASK(10, 8)
 
@@ -75,9 +83,11 @@
  *	D18F0x114 [DRAM Limit Address]
  *	HYGON_DF1	DstFabricID	[9:0]
  *	HYGON_DF2	DstFabricID	[10:0]
+ *	HYGON_DF3	DstFabricID	[7:0]
  */
 #define HYGON_DF1_DST_FABRIC_ID	GENMASK(9, 0)
 #define HYGON_DF2_DST_FABRIC_ID	GENMASK(10, 0)
+#define HYGON_DF3_DST_FABRIC_ID	GENMASK(7, 0)
 
 /*
  * Interleave Number of Dies
@@ -89,6 +99,7 @@
  *
  *	D18F0x114 [DRAM Limit Address]
  *	HYGON_DF1	IntLvNumDies	[11:10]
+ *	HYGON_DF3	IntLvNumDies	[11:10]
  *
  *	D18F0x60
  *	HYGON_DF2	IntLvNumDies	[1:0]
@@ -107,8 +118,12 @@
  *	D18F0x214 [DRAM Offset]
  *	HYGON_DF1	HiAddrOffset	[31:19]
  *	HYGON_DF2	HiAddrOffset	[31:19]
+ *
+ *  D18F0x1B4 [DRAM Offset]
+ *	HYGON_DF3	HiAddrOffset	[31:20]
  */
 #define HYGON_DF1_HI_ADDR_OFFSET	GENMASK(31, 19)
+#define HYGON_DF3_HI_ADDR_OFFSET	GENMASK(31, 20)
 
 /*
  * Die ID Mask
@@ -121,9 +136,11 @@
  *	D18F1x208 [System Fabric ID Mask]
  *	HYGON_DF1 DieIdMask [9:0]
  *	HYGON_DF2 DieIdMask [10:0]
+ *	HYGON_DF3 DieIdMask [15:8]
  */
 #define HYGON_DF1_DIE_ID_MASK	GENMASK(9, 0)
 #define HYGON_DF2_DIE_ID_MASK	GENMASK(10, 0)
+#define HYGON_DF3_DIE_ID_MASK	GENMASK(15, 8)
 
 /*
  * Die ID Shift
@@ -136,8 +153,10 @@
  *	D18F1x208 [System Fabric ID Mask]
  *	HYGON_DF1 DieIdShift [15:12]
  *	HYGON_DF2 DieIdShift [15:12]
+ *	HYGON_DF3 DieIdShift [27:24]
  */
 #define HYGON_DF1_DIE_ID_SHIFT	GENMASK(15, 12)
+#define HYGON_DF3_DIE_ID_SHIFT	GENMASK(27, 24)
 
 /*
  * Socket ID Mask
@@ -150,9 +169,11 @@
  * D18F1x208 [System Fabric ID Mask]
  *	HYGON_DF1 SocketIdMask	[25:16]
  *	HYGON_DF2 SocketIdMask	[26:16]
+ *	HYGON_DF3 SocketIdMask	[23:16]
  */
 #define HYGON_DF1_SOCKET_ID_MASK	GENMASK(25, 16)
 #define HYGON_DF2_SOCKET_ID_MASK	GENMASK(26, 16)
+#define HYGON_DF3_SOCKET_ID_MASK	GENMASK(23, 16)
 
 /*
  * Socket ID Shift
@@ -165,5 +186,6 @@
  * D18F1x208 [System Fabric ID Mask]
  *	HYGON_DF1 SocketIdShift	[31:28]
  *	HYGON_DF2 SocketIdShift	[31:28]
+ *	HYGON_DF3 SocketIdShift	[31:28]
  */
 #define HYGON_DF1_SOCKET_ID_SHIFT	GENMASK(31, 28)
diff --git a/drivers/ras/amd/atl/hygon/system.c b/drivers/ras/amd/atl/hygon/system.c
index a06a39bc4527..f3ca6f58d00f 100644
--- a/drivers/ras/amd/atl/hygon/system.c
+++ b/drivers/ras/amd/atl/hygon/system.c
@@ -24,6 +24,12 @@ static void hygon_df_get_masks_shifts(u32 mask0)
 		df_cfg.die_id_shift = FIELD_GET(HYGON_DF1_DIE_ID_SHIFT, mask0);
 		df_cfg.die_id_mask = FIELD_GET(HYGON_DF2_DIE_ID_MASK, mask0);
 		break;
+	case HYGON_DF3:
+		df_cfg.socket_id_shift = FIELD_GET(HYGON_DF1_SOCKET_ID_SHIFT, mask0);
+		df_cfg.socket_id_mask = FIELD_GET(HYGON_DF3_SOCKET_ID_MASK, mask0);
+		df_cfg.die_id_shift = FIELD_GET(HYGON_DF3_DIE_ID_SHIFT, mask0);
+		df_cfg.die_id_mask = FIELD_GET(HYGON_DF3_DIE_ID_MASK, mask0);
+		break;
 	default:
 		atl_debug_on_bad_df_rev();
 		return;
@@ -38,6 +44,8 @@ static int hygon_determine_df_rev(void)
 		df_cfg.rev = HYGON_DF1;
 	else if (boot_cpu_data.x86_model == 0x6 || boot_cpu_data.x86_model == 0x8)
 		df_cfg.rev = HYGON_DF2;
+	else if (boot_cpu_data.x86_model == 0x7)
+		df_cfg.rev = HYGON_DF3;
 
 	/* Read D18F1x208 (SystemFabricIdMask). */
 	if (df_indirect_read_broadcast(0, 1, 0x208, &fabric_id_mask0))
@@ -53,6 +61,7 @@ static void hygon_get_num_maps(void)
 	switch (df_cfg.rev) {
 	case HYGON_DF1:
 	case HYGON_DF2:
+	case HYGON_DF3:
 		df_cfg.num_coh_st_maps	= 2;
 		break;
 	default:
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index c368559ca2ae..5e95d598c89e 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -45,6 +45,7 @@ enum df_revisions {
 	UNKNOWN,
 	HYGON_DF1,
 	HYGON_DF2,
+	HYGON_DF3,
 	DF2,
 	DF3,
 	DF3p5,
-- 
2.47.3

