Received: from out28-113.mail.aliyun.com (out28-113.mail.aliyun.com [115.124.28.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA0A267B05;
	Fri,  3 Apr 2026 11:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214243; cv=none; b=QLgKKTDHNE0wKV/1UucCmTWFljY+azzzH+TAejRHebLgDIXHo3vvJlnUZFEYGbwpuStnJWcoDBjEB0rdQCVsnwxZtPJd+Rm9sUB5I4w7NZ3HT2EYfvK+Y3H20dCbdG2cFnICxcLaSKfnfW+46ZLyZzPxNFh8Em4tIHVvL2yhlpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214243; c=relaxed/simple;
	bh=Es0cueEljL2OyVCzvBtkXmjT+3qSCTYXBLPDUNT0644=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vm29OzXl105a0tvlrctEiBhmlQ7/Al1ofdcB0pb69aRSs/R2eeqjD/q4Gwg/sIlgxPmQ73W2GxFSKG4oz4vaywere2tf6H5gznSlGo/G4zs5ereB80VwT3JXCqqR0ALK+0J/+yn+Uj5DgSYmlxGrLbWaIHeKAvrQudLVOmwhj+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436261|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_system_inform|0.00392541-0.000608637-0.995466;FP=12325593758985700569|2|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037032089;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h4TkLit_1775213909;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.h4TkLit_1775213909 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 18:58:37 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH 04/10] ras/amd/atl: Add Hygon DF1 address dehash helper
Date: Fri,  3 Apr 2026 18:57:28 +0800
Message-ID: <06e367a5b3d33f4dbbf8dc2274d5bcaeeb31a839.1775213147.git.shiaichun@open-hieco.net>
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

Add Hygon DF1 address dehash function that Hygon address translation
pipeline depends on later.
Prepare hygon_dehash_address() to be called by hygon/core.c later.

- Add hygon/dehash.c for Hygon-specific implementation similar to dehash.c
  for AMD.
- Add hygon_dehash_address() to do address dehashing where the DRAM map
  uses hashed interleave modes for Hygon DF1 including two-channel hash
  interleave mode and DDR5 case.
- Build hygon/dehash.c from the Makefile as an amd_atl object.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/Makefile       |  1 +
 drivers/ras/amd/atl/hygon/dehash.c | 77 ++++++++++++++++++++++++++++++
 drivers/ras/amd/atl/internal.h     |  1 +
 3 files changed, 79 insertions(+)
 create mode 100644 drivers/ras/amd/atl/hygon/dehash.c

diff --git a/drivers/ras/amd/atl/Makefile b/drivers/ras/amd/atl/Makefile
index c4e01f3ecc7b..fc12013de21f 100644
--- a/drivers/ras/amd/atl/Makefile
+++ b/drivers/ras/amd/atl/Makefile
@@ -15,6 +15,7 @@ amd_atl-y		+= map.o
 amd_atl-y		+= system.o
 amd_atl-y		+= umc.o
 
+amd_atl-y		+= hygon/dehash.o
 amd_atl-y		+= hygon/denormalize.o
 amd_atl-y		+= hygon/map.o
 amd_atl-y		+= hygon/system.o
diff --git a/drivers/ras/amd/atl/hygon/dehash.c b/drivers/ras/amd/atl/hygon/dehash.c
new file mode 100644
index 000000000000..43f1bdea1eeb
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/dehash.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Address Translation Library
+ *
+ * dehash.c : Functions to account for hashing bits for Hygon
+ *
+ * Author: AichunShi <shiaichun@open-hieco.net>
+ */
+
+#include "../internal.h"
+
+static int hygon_df1_ddr5_dehash_addr(struct addr_ctx *ctx)
+{
+	u8 chan_hash_enable = ctx->chan_intlv_hygon.chan_hash_enable;
+	u8 sub_channel = ctx->chan_intlv_hygon.sub_channel;
+	u8 start_bit = ctx->chan_intlv_hygon.start_bit;
+	u8 hashed_bit;
+
+	if (chan_hash_enable) {
+		hashed_bit =	(ctx->ret_addr >> 12) ^
+				(ctx->ret_addr >> 21) ^
+				(ctx->ret_addr >> 30) ^
+				sub_channel;
+		hashed_bit &= BIT(0);
+		ctx->ret_addr |= hashed_bit << start_bit;
+	} else {
+		ctx->ret_addr |= sub_channel << start_bit;
+	}
+
+	return 0;
+}
+
+static int hygon_df_2chan_dehash_addr(struct addr_ctx *ctx)
+{
+	u8 hashed_bit;
+	u8 intlv_bit_pos = ctx->map.intlv_bit_pos;
+
+	hashed_bit =	(ctx->ret_addr >> 12) ^
+		(ctx->ret_addr >> 18) ^
+		(ctx->ret_addr >> 21) ^
+		(ctx->ret_addr >> 30) ^
+		ctx->coh_st_fabric_id;
+
+	hashed_bit &= BIT(0);
+	if (hashed_bit != ((ctx->ret_addr >> intlv_bit_pos) & BIT(0)))
+		ctx->ret_addr ^= BIT(intlv_bit_pos);
+
+	return 0;
+}
+
+int hygon_dehash_address(struct addr_ctx *ctx)
+{
+	switch (ctx->map.intlv_mode) {
+	/* No hashing cases. */
+	case NONE:
+	case NOHASH_2CHAN:
+	case HYGON_DF1_3CHAN:
+	case NOHASH_4CHAN:
+	case NOHASH_8CHAN:
+	case NOHASH_16CHAN:
+	case NOHASH_32CHAN:
+		break;
+
+	case DF2_2CHAN_HASH:
+		hygon_df_2chan_dehash_addr(ctx);
+		break;
+
+	default:
+		atl_debug_on_bad_intlv_mode(ctx);
+		return -EINVAL;
+	}
+
+	if (df_cfg.rev == HYGON_DF1 && ctx->chan_intlv_hygon.ddr5_enable)
+		hygon_df1_ddr5_dehash_addr(ctx);
+
+	return 0;
+}
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 8f9fe6710c1e..a5624599c91e 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -311,6 +311,7 @@ u64 insert_coh_st_id_at_intlv_bit(struct addr_ctx *ctx, u64 denorm_addr, u16 coh
 int hygon_get_df_system_info(void);
 int hygon_get_address_map(struct addr_ctx *ctx);
 int hygon_denormalize_address(struct addr_ctx *ctx);
+int hygon_dehash_address(struct addr_ctx *ctx);
 
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
-- 
2.47.3

