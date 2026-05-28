Received: from out198-18.us.a.mail.aliyun.com (out198-18.us.a.mail.aliyun.com [47.90.198.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06D0305693;
	Thu, 28 May 2026 03:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940428; cv=none; b=pjOb7PgBL016D2FyIaQ2bYWpUcYGyI3ROquLobAChb4xJDbY4lgQP+hMe1t2yZ3gf9LPD7SvcSnrYoAjL+YNVh7FZ+vMMHm1egTfqz+g6wz7bVLKix2O6Bi16yJH6mtf/i79v+HSGXaHpxpv/loAblH4zC9oGGkwhm4WjaMLzI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940428; c=relaxed/simple;
	bh=BpSjuNcy5HhjUc4pF1h5wrVP95toqOglAJesPl5hNRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tpb9Y4ZpXl2JuiAeAr2eJyFqRGZaMTtxye6hcBwTfo74KOVrRo4PQwWyj3Syz8cs4qyQo5cGrAvJWV80/cTpGY5iMTxQ3eVFepkRl6rI697BG1taQCtbjJfeOnZFX9aSCXJtNlREdCSoLOBabCC8OwhLHreoRElbGIktjvBlw6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=47.90.198.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0314781-0.0158465-0.952675;FP=15802124733323758803|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033045213054;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.hieeBmX_1779940402;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hieeBmX_1779940402 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 11:53:26 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH v2 03/11] ras/amd/atl: Add Hygon DF1 normalized address denormalization helper
Date: Thu, 28 May 2026 11:52:37 +0800
Message-ID: <20260528035246.526012-4-shiaichun@open-hieco.net>
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

Add Hygon DF1 normalized address denormalization function that Hygon
address translation pipeline depends on later.
Prepare hygon_denormalize_address() to be called by hygon/core.c later.

- Add hygon/denormalize.c for Hygon-specific implementation similar to
  denormalize.c for AMD.
- Add hygon_denormalize_address() to handle non-hashed and hashed
  interleave modes, including the Hygon DF1 three-channel interleave mode.
- Define HYGON_CDD_DFID_BASE = 4 for the DFID offset at which compute
  dies (CDD) start; IO dies occupy DFID 0-3, with a TODO noting it will
  move to <asm/hygon/node.h> in Hygon Node RFC next version.
- Document that ret_addr is temporarily repurposed as an intermediate
  in hygon_get_coh_st_id_df() for the DF1_3CHAN non-power-of-2 case.
- Check the return value of hygon_calculate_coh_st_id() and propagate
  error before passing coh_st_id to hygon_insert_coh_st_id().
- Use make_space_for_coh_st_id_at_intlv_bit() and
  insert_coh_st_id_at_intlv_bit() shared from denormalize.c and exported
  in internal.h to avoid duplicate code.
- Build hygon/denormalize.c from the Makefile as an amd_atl object.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/Makefile            |   1 +
 drivers/ras/amd/atl/denormalize.c       |   4 +-
 drivers/ras/amd/atl/hygon/denormalize.c | 194 ++++++++++++++++++++++++
 drivers/ras/amd/atl/hygon/reg_fields.h  |  13 ++
 drivers/ras/amd/atl/internal.h          |   4 +
 5 files changed, 214 insertions(+), 2 deletions(-)
 create mode 100644 drivers/ras/amd/atl/hygon/denormalize.c

diff --git a/drivers/ras/amd/atl/Makefile b/drivers/ras/amd/atl/Makefile
index 105c11015f4c..c4e01f3ecc7b 100644
--- a/drivers/ras/amd/atl/Makefile
+++ b/drivers/ras/amd/atl/Makefile
@@ -15,6 +15,7 @@ amd_atl-y		+= map.o
 amd_atl-y		+= system.o
 amd_atl-y		+= umc.o
 
+amd_atl-y		+= hygon/denormalize.o
 amd_atl-y		+= hygon/map.o
 amd_atl-y		+= hygon/system.o
 
diff --git a/drivers/ras/amd/atl/denormalize.c b/drivers/ras/amd/atl/denormalize.c
index d45ce753e636..cf58cfa7ab3a 100644
--- a/drivers/ras/amd/atl/denormalize.c
+++ b/drivers/ras/amd/atl/denormalize.c
@@ -41,7 +41,7 @@ static u16 get_dst_fabric_id(struct addr_ctx *ctx)
  * expanded address bits:	[20+n : n+p][n+p-1 : p][p-1 : 0]
  *				[23   :  11][10    : 8][7   : 0]
  */
-static u64 make_space_for_coh_st_id_at_intlv_bit(struct addr_ctx *ctx)
+u64 make_space_for_coh_st_id_at_intlv_bit(struct addr_ctx *ctx)
 {
 	return expand_bits(ctx->map.intlv_bit_pos,
 			   ctx->map.total_intlv_bits,
@@ -320,7 +320,7 @@ static u16 calculate_coh_st_id(struct addr_ctx *ctx)
 	}
 }
 
-static u64 insert_coh_st_id_at_intlv_bit(struct addr_ctx *ctx, u64 denorm_addr, u16 coh_st_id)
+u64 insert_coh_st_id_at_intlv_bit(struct addr_ctx *ctx, u64 denorm_addr, u16 coh_st_id)
 {
 	return denorm_addr | (coh_st_id << ctx->map.intlv_bit_pos);
 }
diff --git a/drivers/ras/amd/atl/hygon/denormalize.c b/drivers/ras/amd/atl/hygon/denormalize.c
new file mode 100644
index 000000000000..8bf1cd1efa14
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/denormalize.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Address Translation Library (for hygon)
+ *
+ * denormalize.c : Functions to account for interleaving bits for Hygon
+ *
+ * Author: Aichun Shi <shiaichun@open-hieco.net>
+ */
+
+#include "../internal.h"
+
+/*
+ * TODO: Will move to <asm/hygon/node.h> in Hygon Node RFC next version.
+ */
+/* Hygon compute dies (CDD) start at DFID 4; IO dies occupy DFIDs 0-3. */
+#define HYGON_CDD_DFID_BASE	4
+
+static u16 hygon_get_dst_fabric_id(struct addr_ctx *ctx)
+{
+	switch (df_cfg.rev) {
+	case HYGON_DF1:
+		return FIELD_GET(HYGON_DF1_DST_FABRIC_ID, ctx->map.limit);
+	default:
+		atl_debug_on_bad_df_rev();
+		return 0;
+	}
+}
+
+static u64 hygon_make_space_for_coh_st_id_df1_3chan(struct addr_ctx *ctx)
+{
+	return ctx->ret_addr & GENMASK_ULL(ctx->map.intlv_bit_pos - 1, 0);
+}
+
+static u64 hygon_make_space_for_coh_st_id(struct addr_ctx *ctx)
+{
+	switch (ctx->map.intlv_mode) {
+	case NOHASH_2CHAN:
+	case NOHASH_4CHAN:
+	case NOHASH_8CHAN:
+	case NOHASH_16CHAN:
+	case NOHASH_32CHAN:
+	case DF2_2CHAN_HASH:
+		return make_space_for_coh_st_id_at_intlv_bit(ctx);
+
+	case HYGON_DF1_3CHAN:
+		return hygon_make_space_for_coh_st_id_df1_3chan(ctx);
+
+	default:
+		atl_debug_on_bad_intlv_mode(ctx);
+		return ~0ULL;
+	}
+}
+
+static u16 hygon_get_coh_st_id_df(struct addr_ctx *ctx)
+{
+	u8 num_socket_intlv_bits = ilog2(ctx->map.num_intlv_sockets);
+	u8 num_die_intlv_bits = ilog2(ctx->map.num_intlv_dies);
+	u16 coh_st_id = ctx->coh_st_fabric_id;
+	u16 mask;
+	u8 intlv_bit_pos = ctx->map.intlv_bit_pos;
+	u8 num_intlv_bits = order_base_2(ctx->map.num_intlv_chan);
+
+	if (ctx->map.intlv_mode == HYGON_DF1_3CHAN) {
+		u8 cs_offset;
+		u16 dst_fabric_id = hygon_get_dst_fabric_id(ctx);
+		u64 temp_addr_x;
+
+		cs_offset = (ctx->coh_st_fabric_id & 0x3) - (dst_fabric_id & 0x3);
+		if (cs_offset > 3) {
+			atl_debug(ctx,
+				  "Invalid cs_offset: 0x%x coh_st_fabric_id: 0x%x dst_fabric_id: 0x%x.\n",
+				  cs_offset, ctx->coh_st_fabric_id, dst_fabric_id);
+			return ~0;
+		}
+
+		temp_addr_x = (ctx->ret_addr & GENMASK_ULL(63, intlv_bit_pos)) >>
+				intlv_bit_pos;
+		temp_addr_x = temp_addr_x * 3 + cs_offset;
+		/*
+		 * Repurpose ret_addr as a temporary to carry the non-power-of-2
+		 * quotient (high_bits * 3 + cs_offset) into
+		 * hygon_insert_coh_st_id_df1_3chan(), which reads it back to
+		 * reconstruct the physical address without an extra parameter.
+		 */
+		ctx->ret_addr = temp_addr_x;
+
+		coh_st_id = temp_addr_x & GENMASK_ULL(num_intlv_bits - 1, 0);
+	} else {
+		mask = GENMASK(num_intlv_bits - 1, 0);
+		coh_st_id &= mask;
+	}
+
+	/* Die interleave bits */
+	if (num_die_intlv_bits) {
+		u16 die_bits;
+
+		mask = GENMASK(num_die_intlv_bits - 1, 0);
+		die_bits = ctx->coh_st_fabric_id & df_cfg.die_id_mask;
+		die_bits >>= df_cfg.die_id_shift;
+		die_bits -= HYGON_CDD_DFID_BASE;
+
+		coh_st_id |= (die_bits & mask) << num_intlv_bits;
+		num_intlv_bits += num_die_intlv_bits;
+	}
+
+	/* Socket interleave bits */
+	if (num_socket_intlv_bits) {
+		u16 socket_bits;
+
+		mask = GENMASK(num_socket_intlv_bits - 1, 0);
+		socket_bits = ctx->coh_st_fabric_id & df_cfg.socket_id_mask;
+		socket_bits >>= df_cfg.socket_id_shift;
+
+		coh_st_id |= (socket_bits & mask) << num_intlv_bits;
+	}
+
+	ctx->coh_st_fabric_id = coh_st_id;
+
+	return coh_st_id;
+}
+
+static u16 hygon_calculate_coh_st_id(struct addr_ctx *ctx)
+{
+	switch (ctx->map.intlv_mode) {
+	case NOHASH_2CHAN:
+	case HYGON_DF1_3CHAN:
+	case NOHASH_4CHAN:
+	case NOHASH_8CHAN:
+	case NOHASH_16CHAN:
+	case NOHASH_32CHAN:
+	case DF2_2CHAN_HASH:
+		return hygon_get_coh_st_id_df(ctx);
+
+	default:
+		atl_debug_on_bad_intlv_mode(ctx);
+		return ~0;
+	}
+}
+
+static u64 hygon_insert_coh_st_id_df1_3chan(struct addr_ctx *ctx,
+					    u64 denorm_addr, u16 coh_st_id)
+{
+	u8 num_intlv_bits_chan = order_base_2(ctx->map.num_intlv_chan);
+	u64 temp_addr = ((ctx->ret_addr >> num_intlv_bits_chan) <<
+			 num_intlv_bits_chan) | coh_st_id;
+
+	return denorm_addr | (temp_addr << ctx->map.intlv_bit_pos);
+}
+
+static u64 hygon_insert_coh_st_id(struct addr_ctx *ctx, u64 denorm_addr, u16 coh_st_id)
+{
+	switch (ctx->map.intlv_mode) {
+	case NOHASH_2CHAN:
+	case NOHASH_4CHAN:
+	case NOHASH_8CHAN:
+	case NOHASH_16CHAN:
+	case NOHASH_32CHAN:
+	case DF2_2CHAN_HASH:
+		return insert_coh_st_id_at_intlv_bit(ctx, denorm_addr, coh_st_id);
+
+	case HYGON_DF1_3CHAN:
+		return hygon_insert_coh_st_id_df1_3chan(ctx, denorm_addr, coh_st_id);
+
+	default:
+		atl_debug_on_bad_intlv_mode(ctx);
+		return ~0ULL;
+	}
+}
+
+static int hygon_denorm_addr_common(struct addr_ctx *ctx)
+{
+	u64 denorm_addr;
+	u16 coh_st_id;
+
+	denorm_addr = hygon_make_space_for_coh_st_id(ctx);
+	if (denorm_addr == ~0ULL)
+		return -EINVAL;
+	coh_st_id = hygon_calculate_coh_st_id(ctx);
+	if (coh_st_id == (u16)~0)
+		return -EINVAL;
+	ctx->ret_addr = hygon_insert_coh_st_id(ctx, denorm_addr, coh_st_id);
+	return 0;
+}
+
+int hygon_denormalize_address(struct addr_ctx *ctx)
+{
+	switch (ctx->map.intlv_mode) {
+	case NONE:
+		return 0;
+
+	default:
+		return hygon_denorm_addr_common(ctx);
+	}
+}
diff --git a/drivers/ras/amd/atl/hygon/reg_fields.h b/drivers/ras/amd/atl/hygon/reg_fields.h
index b3d658bef6ad..b48eaad4fed0 100644
--- a/drivers/ras/amd/atl/hygon/reg_fields.h
+++ b/drivers/ras/amd/atl/hygon/reg_fields.h
@@ -59,6 +59,19 @@
  */
 #define HYGON_DF1_INTLV_ADDR_SEL	GENMASK(10, 8)
 
+/*
+ * Destination Fabric ID
+ *
+ * Access type: Instance
+ *
+ * Register
+ *	Rev	Fieldname	Bits
+ *
+ *	D18F0x114 [DRAM Limit Address]
+ *	HYGON_DF1	DstFabricID	[9:0]
+ */
+#define HYGON_DF1_DST_FABRIC_ID	GENMASK(9, 0)
+
 /*
  * Interleave Number of Dies
  *
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index adcf94385b39..3d08c34b76cd 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -320,8 +320,12 @@ typedef int (*get_dram_offset_fn)(struct addr_ctx *ctx, u64 *norm_offset);
 int find_normalized_offset(struct addr_ctx *ctx, u64 *norm_offset,
 			   get_dram_offset_fn get_dram_offset);
 
+u64 make_space_for_coh_st_id_at_intlv_bit(struct addr_ctx *ctx);
+u64 insert_coh_st_id_at_intlv_bit(struct addr_ctx *ctx, u64 denorm_addr, u16 coh_st_id);
+
 int hygon_get_df_system_info(void);
 int hygon_get_address_map(struct addr_ctx *ctx);
+int hygon_denormalize_address(struct addr_ctx *ctx);
 
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
-- 
2.47.3

