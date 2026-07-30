Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAA037D13A;
	Thu, 30 Jul 2026 02:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379805; cv=none; b=OauEZDpqJXuNtJzkBoWmqgYlZfIA4stUELnXfFvcaIO5T8c/OmqXH1U300TzZSOEP1UFpnq7RemkeIa+agZbKLYjip9Y6ymqVXnieSbPSQ2E9fYikzrjg6DnadBXoJFT31oAhcKapQoQpAR6IHbIeizNbj/SaHqdgeUpelqbgzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379805; c=relaxed/simple;
	bh=tq8Q+5AZlr8kZsAFfnFptPratvuqU/TUa3NM8PTaAcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MEUX4nhjEZ/4gRwDcBuGmPt9r7v/Y5AK6IDbnki5ErTgNj5TNuWt1YyCAyoGgPSS8e120XF64yhpS4tamifKwYeXtRRo9SSLxQZY3EgcD+6fn2EcDc0A1jX1w4YrojsikhBRRYeinAY2Y/NBZkr9qVoO6Wk2rDEY86sZO1WsboI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hT8xc1JL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hT8xc1JL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785379803; x=1816915803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tq8Q+5AZlr8kZsAFfnFptPratvuqU/TUa3NM8PTaAcI=;
  b=hT8xc1JLSKLTAHWVl7N9wF3htIumKSCLbwzRhjWShVdobD7U+kU++zTJ
   Ci9a7n8LP3xfKFI0gnoGR4HtIHUdOjFAM+ibpcC+lbMd7SZXcJRDyzIt2
   FzQokyr+YjPSplmX9xTrpmuYXRBYvvvOfFRGPKOJfc/skxTpsIfx6XAT7
   yVExykmVAJdeDXZ1vU6JHjTZxfvbL9fNKNAlXJBAYApqjGtUgSHPy0vbP
   zPmxVJIioiKRAAeGcahEt83N69KRJhzadMWcbRKdCDDWl8bMh4o3t6q46
   pYVcojnUtGh0t/BwO6kblCfUElP4bSq5Z8HrnUPKY+ewWEkNq80V9VTFK
   A==;
X-CSE-ConnectionGUID: QDLAsVALSc2j3/YIwl1hgA==
X-CSE-MsgGUID: DB7tQ4AnS/2h2zrfBV0MvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103398276"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="103398276"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:50:03 -0700
X-CSE-ConnectionGUID: xDowwPa6TUqpQFpsck1FAQ==
X-CSE-MsgGUID: GeqjbOubQyCN400AqmupDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256240833"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:50:01 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: qiuxu.zhuo@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [PATCH v2 10/10] EDAC/igen6: Refactor address translation logic
Date: Thu, 30 Jul 2026 10:42:38 +0800
Message-ID: <20260730024238.4096623-11-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730024238.4096623-1-qiuxu.zhuo@intel.com>
References: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
 <20260730024238.4096623-1-qiuxu.zhuo@intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The igen6 EDAC driver implements similar interleave and hash translation
logic at multiple levels of the memory hierarchy.

The separate implementations duplicate decoding logic, making future
changes harder and increasing the risk of behavior diverging.

Consolidate the common address translation operations into shared
helpers so all decoding paths use a single implementation.

No functional changes intended.

Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 244 +++++++++++++++++++++++++-------------
 1 file changed, 159 insertions(+), 85 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index e10e29f1a5f5..6abc9b203748 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -123,6 +123,43 @@
 #define MEM_SLICE_HASH_MASK(v)		(GET_BITFIELD(v, 6, 19) << 6)
 #define MEM_SLICE_HASH_LSB_MASK_BIT(v)	GET_BITFIELD(v, 24, 26)
 
+/*
+ * A slice represents a portion of memory space participating in an
+ * interleave relationship within the memory hierarchy.
+ *
+ * It can represent in different levels such as:
+ *
+ *   - a pair of memory controllers
+ *   - a memory controller
+ *   - a memory channel
+ *   - a memory sub-channel / DIMM
+ *
+ * +--------+
+ * |        |
+ * | Zone 1 |
+ * |        |
+ * +--------+  +--------+
+ * |        |  |        |
+ * |        |  |        |
+ * | Zone 0 |  | Zone 0 |
+ * |        |  |        |
+ * |        |  |        |
+ * +--------+  +--------+
+ *
+ *  Slice L     Slice S
+ *
+ * Memory space is divided into:
+ *
+ *   - Zone 0 : Interleaved region
+ *   - Zone 1 : Non-interleaved region (upper part of the large slice).
+ */
+struct slice {
+	/* Slice address. */
+	u64 addr;
+	/* Slice that @addr belongs to. */
+	int id;
+};
+
 struct igen6_imc {
 	int mc;
 	struct mem_ctl_info *mci;
@@ -323,6 +360,102 @@ static struct work_struct ecclog_work;
 #define DID_NVL_H_SKU3	0xd704
 #define DID_NVL_H_SKU4	0xd705
 
+/* Remove the interleave bit and shift upper part down to fill gap. */
+static u64 squeeze_addr(u64 addr, int intlv_bit)
+{
+	u64 slice_addr;
+
+	slice_addr  = GET_BITFIELD(addr, intlv_bit + 1, 63) << intlv_bit;
+	slice_addr |= GET_BITFIELD(addr, 0, intlv_bit - 1);
+
+	return slice_addr;
+}
+
+/* Shift the upper bits up and insert a zero at the @intlv_bit bit position. */
+static u64 inflate_addr(u64 addr, int intlv_bit)
+{
+	u64 inflated_addr;
+
+	/* Insert a zero at @intlv_bit position. */
+	inflated_addr  = GET_BITFIELD(addr, intlv_bit, 63) << (intlv_bit + 1);
+	inflated_addr |= GET_BITFIELD(addr, 0, intlv_bit - 1);
+
+	return inflated_addr;
+}
+
+static u64 compute_hash(u64 addr, u64 hash_mask, u64 hash_base, int intlv_bit)
+{
+	u64 hash_addr;
+	int i;
+
+	/*
+	 * In hash mode, @intlv_bit is the lowest selected bit of @addr
+	 * to be XORed. While @mask may or may not include this @intlv_bit,
+	 * we enforce that @mask includes @intlv_bit to ensure @intlv_bit is
+	 * XORed exactly once.
+	 */
+	hash_mask |= BIT_ULL(intlv_bit);
+	hash_addr  = addr & hash_mask;
+
+	for (i = 6; i < 20; i++)
+		hash_base ^= (hash_addr >> i) & 1;
+
+	return hash_base;
+}
+
+/*
+ * Converts a higher-level address (system / IMC / channel) into a lower-level
+ * slice address and identifier.
+ */
+static void translate_to_lower_level(u64 addr, u64 hash_mask, u64 hash_base,
+				     int intlv_bit, u64 s_size, int l_map,
+				     struct slice *slice)
+{
+	/* In non-interleave zone. */
+	if (addr >= 2 * s_size) {
+		slice->addr = addr - s_size;
+		slice->id  = l_map;
+		return;
+	}
+
+	/* In interleave zone. */
+	slice->addr = squeeze_addr(addr, intlv_bit);
+
+	/* Non-hash mode. */
+	if (!hash_mask) {
+		slice->id = GET_BITFIELD(addr, intlv_bit, intlv_bit);
+		return;
+	}
+
+	/* Hash mode. */
+	slice->id = compute_hash(addr, hash_mask, hash_base, intlv_bit);
+}
+
+/* Reconstruct address for upper memory hierarchy level. */
+static u64 translate_to_upper_level(u64 addr, u64 hash_mask, u64 hash_base,
+				    int intlv_bit, u64 s_size)
+{
+	u64 inflated_addr, hash_val;
+
+	/* In non-interleave zone. */
+	if (addr >= s_size)
+		return addr + s_size;
+
+	/*
+	 * In interleave zone.
+	 *
+	 * Insert a zero at @intlv_bit position.
+	 */
+	inflated_addr = inflate_addr(addr, intlv_bit);
+
+	/*
+	 * Reconstruct the removed interleave bit and use it to replace
+	 * the zero at @intlv_bit position.
+	 */
+	hash_val = compute_hash(inflated_addr, hash_mask, hash_base, intlv_bit);
+	return inflated_addr | (hash_val << intlv_bit);
+}
+
 static int get_mchbar(struct pci_dev *pdev, u64 *mchbar)
 {
 	union  {
@@ -490,21 +623,9 @@ static u64 mem_addr_to_sys_addr(u64 maddr)
 	return maddr;
 }
 
-static u64 mem_slice_hash(u64 addr, u64 mask, u64 hash_init)
-{
-	/* The interleave bit in @addr is a zero. */
-	u64 hash_addr = addr & mask, hash = hash_init;
-	int i;
-
-	for (i = 6; i < 20; i++)
-		hash ^= (hash_addr >> i) & 1;
-
-	return hash;
-}
-
 static u64 tgl_err_addr_to_mem_addr(u64 eaddr, int mc)
 {
-	u64 maddr, hash, mask, ms_s_size;
+	u64 mask, ms_s_size;
 	int intlv_bit;
 	u32 ms_hash;
 
@@ -517,12 +638,7 @@ static u64 tgl_err_addr_to_mem_addr(u64 eaddr, int mc)
 	mask = MEM_SLICE_HASH_MASK(ms_hash);
 	intlv_bit = MEM_SLICE_HASH_LSB_MASK_BIT(ms_hash) + 6;
 
-	maddr = GET_BITFIELD(eaddr, intlv_bit, 63) << (intlv_bit + 1) |
-		GET_BITFIELD(eaddr, 0, intlv_bit - 1);
-
-	hash = mem_slice_hash(maddr, mask, mc);
-
-	return maddr | (hash << intlv_bit);
+	return translate_to_upper_level(eaddr, mask, mc, intlv_bit, ms_s_size);
 }
 
 static u64 tgl_err_addr_to_sys_addr(u64 eaddr, int mc)
@@ -544,8 +660,9 @@ static u64 adl_err_addr_to_sys_addr(u64 eaddr, int mc)
 
 static u64 adl_err_addr_to_imc_addr(u64 eaddr, int mc)
 {
-	u64 imc_addr, ms_s_size = igen6_pvt->ms_s_size;
+	u64 ms_s_size = igen6_pvt->ms_s_size;
 	struct igen6_imc *imc = &igen6_pvt->imc[mc];
+	struct slice slice;
 	int intlv_bit;
 	u32 mc_hash;
 
@@ -556,10 +673,8 @@ static u64 adl_err_addr_to_imc_addr(u64 eaddr, int mc)
 
 	intlv_bit = MAC_MC_HASH_LSB(mc_hash) + 6;
 
-	imc_addr = GET_BITFIELD(eaddr, intlv_bit + 1, 63) << intlv_bit |
-		   GET_BITFIELD(eaddr, 0, intlv_bit - 1);
-
-	return imc_addr;
+	translate_to_lower_level(eaddr, 0, 0, intlv_bit, ms_s_size, 0, &slice);
+	return slice.addr;
 }
 
 static enum mem_type ptl_h_get_mem_type(struct igen6_imc *imc)
@@ -998,62 +1113,13 @@ static void set_dimm_params(struct igen6_imc *imc, int chan)
 	imc->dimm_s_size[chan] = MAD_DIMM_CH_DIMM_S_SIZE(val);
 }
 
-static int decode_chan_idx(u64 addr, u64 mask, int intlv_bit)
-{
-	u64 hash_addr, hash = 0;
-	int i;
-
-	/*
-	 * In hash mode, the @intlv_bit is the lowest selected bit of @addr
-	 * to be XORed. While @mask may or may not include this @intlv_bit,
-	 * we enforce that @mask includes @intlv_bit to ensure @intlv_bit is
-	 * XORed exactly once.
-	 */
-	mask |= 1 << intlv_bit;
-	hash_addr = addr & mask;
-
-	for (i = 6; i < 20; i++)
-		hash ^= (hash_addr >> i) & 1;
-
-	return (int)hash;
-}
-
-static u64 decode_channel_addr(u64 addr, int intlv_bit)
-{
-	u64 channel_addr;
-
-	/* Remove the interleave bit and shift upper part down to fill gap */
-	channel_addr  = GET_BITFIELD(addr, intlv_bit + 1, 63) << intlv_bit;
-	channel_addr |= GET_BITFIELD(addr, 0, intlv_bit - 1);
-
-	return channel_addr;
-}
-
-static void decode_addr(u64 addr, u32 hash, u64 s_size, int l_map,
-			int *idx, u64 *sub_addr)
-{
-	int intlv_bit = CHANNEL_HASH_LSB_MASK_BIT(hash) + 6;
-
-	if (addr >= 2 * s_size) {
-		*sub_addr = addr - s_size;
-		*idx = l_map;
-		return;
-	}
-
-	*sub_addr = decode_channel_addr(addr, intlv_bit);
-
-	if (CHANNEL_HASH_MODE(hash))
-		*idx = decode_chan_idx(addr, CHANNEL_HASH_MASK(hash), intlv_bit);
-	else
-		*idx = GET_BITFIELD(addr, intlv_bit, intlv_bit);
-}
-
 static int igen6_decode(struct decoded_addr *res)
 {
 	struct igen6_imc *imc = &igen6_pvt->imc[res->mc];
-	u64 addr = res->imc_addr, sub_addr, s_size;
-	int idx, l_map;
-	u32 hash;
+	u64 addr = res->imc_addr, s_size;
+	int intlv_bit, l_map;
+	u32 hash, hash_mask;
+	struct slice slice;
 
 	if (addr >= igen6_tom) {
 		edac_dbg(0, "Address 0x%llx out of range\n", addr);
@@ -1064,17 +1130,25 @@ static int igen6_decode(struct decoded_addr *res)
 	hash   = readl(imc->window + CHANNEL_HASH_OFFSET);
 	s_size = imc->ch_s_size;
 	l_map  = imc->ch_l_map;
-	decode_addr(addr, hash, s_size, l_map, &idx, &sub_addr);
-	res->channel_idx  = idx;
-	res->channel_addr = sub_addr;
+	hash_mask = CHANNEL_HASH_MODE(hash) ? CHANNEL_HASH_MASK(hash) : 0;
+	intlv_bit = CHANNEL_HASH_LSB_MASK_BIT(hash) + 6;
+
+	translate_to_lower_level(addr, hash_mask, 0, intlv_bit, s_size, l_map, &slice);
+
+	res->channel_idx  = slice.id;
+	res->channel_addr = slice.addr;
 
 	/* Decode sub-channel/DIMM */
 	hash   = readl(imc->window + CHANNEL_EHASH_OFFSET);
-	s_size = imc->dimm_s_size[idx];
-	l_map  = imc->dimm_l_map[idx];
-	decode_addr(res->channel_addr, hash, s_size, l_map, &idx, &sub_addr);
-	res->sub_channel_idx  = idx;
-	res->sub_channel_addr = sub_addr;
+	s_size = imc->dimm_s_size[res->channel_idx];
+	l_map  = imc->dimm_l_map[res->channel_idx];
+	hash_mask = CHANNEL_HASH_MODE(hash) ? CHANNEL_HASH_MASK(hash) : 0;
+	intlv_bit = CHANNEL_HASH_LSB_MASK_BIT(hash) + 6;
+
+	translate_to_lower_level(res->channel_addr, hash_mask, 0, intlv_bit, s_size, l_map, &slice);
+
+	res->sub_channel_idx  = slice.id;
+	res->sub_channel_addr = slice.addr;
 
 	return 0;
 }
-- 
2.43.0

