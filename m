Received: from out28-113.mail.aliyun.com (out28-113.mail.aliyun.com [115.124.28.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B423AA512;
	Fri,  3 Apr 2026 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213920; cv=none; b=gTDNnlez8MbeoC7KXYCWOywr4NCQu72i1uywhp1AX5aTgW2MmcBCt1KI1O6Qhw/ilgBHFJgtXxJdSRSzwz5dYmXVFJAD6NKK+coyrimmJXdWetKwG/gpOOZIdUl86/jd9SPpacvBNln3MkhsAnbHOKedpRqvveCKFAPnnDj/aKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213920; c=relaxed/simple;
	bh=tO4K+DXyn0MTmwKkc76aMBuN2zvakrVdA5moPAeOgZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PtA7AekzXQCDd/QQVr4QpwaVbJKVKIK2R40XhRhS1mUCOHDh64YBviAXWDzgA9xreRNSyX0FySWg5pe7v/Hl9EyuQwFZmCIAFCDCIe1vn0tvG2V1S/PFshF9jnjTB4Q3BKGQSpfpV7/rb3RMERucyQm802GELhvji2pWPGgXUQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_system_inform|0.0313017-0.00313976-0.965559;FP=6578752146713166939|2|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037071049;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h4TkLbQ_1775213900;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.h4TkLbQ_1775213900 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 18:58:29 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH 03/10] ras/amd/atl: Add Hygon DF1 normalized address denormalization helper
Date: Fri,  3 Apr 2026 18:57:27 +0800
Message-ID: <25e9501e2f6d36802e5efe982e8af975a47f4652.1775213147.git.shiaichun@open-hieco.net>
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

Add Hygon DF1 normalized address denormalization function that Hygon
address translation pipeline depends on later.
Prepare hygon_denormalize_address() to be called by hygon/core.c later.

- Add hygon/denormalize.c for Hygon-specific implementation similar to
  denormalize.c for AMD.
- Add hygon_denormalize_address() to handle non-hashed and hashed
  interleave modes, including the Hygon DF1 three-channel interleave mode.
- Use make_space_for_coh_st_id_at_intlv_bit() and
  insert_coh_st_id_at_intlv_bit() shared from denormalize.c and exported
  in internal.h to avoid duplicate code.
- Build hygon/denormalize.c from the Makefile as an amd_atl object.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/Makefile            |   1 +
 drivers/ras/amd/atl/denormalize.c       |   4 +-
 drivers/ras/amd/atl/hygon/denormalize.c | 176 ++++++++++++++++++++++++
 drivers/ras/amd/atl/hygon/reg_fields.h  |  13 ++
 drivers/ras/amd/atl/internal.h          |   4 +
 5 files changed, 196 insertions(+), 2 deletions(-)
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
index 000000000000..d189799bd183
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/denormalize.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Address Translation Library
+ *
+ * denormalize.c : Functions to account for interleaving bits for Hygon
+ *
+ * Author: AichunShi <shiaichun@open-hieco.net>
+ */
+
+#include "../internal.h"
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
+		die_bits -= 4;
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
+static u64 hygon_insert_coh_st_id_df1_3chan(struct addr_ctx *ctx, u64 denorm_addr, u16 coh_st_id)
+{
+	u8 num_intlv_bits_chan = order_base_2(ctx->map.num_intlv_chan);
+	u64 temp_addr = ((ctx->ret_addr >> num_intlv_bits_chan) << num_intlv_bits_chan) | coh_st_id;
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
+	coh_st_id = hygon_calculate_coh_st_id(ctx);
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
index 44b24593175d..69be2d5d2240 100644
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
index d149ec6e7da9..8f9fe6710c1e 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -305,8 +305,12 @@ int df2_get_dram_addr_map(struct addr_ctx *ctx);
 bool valid_map(struct addr_ctx *ctx);
 void dump_address_map(struct dram_addr_map *map);
 
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

