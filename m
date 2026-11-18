Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971054;
	b=qkwhwBmf8rOMfho9EY/Pbdfv4i9SxV2N87DCwVwibQUmzu05pcYNUJgGrd+UOVHL2zan
	 y/uO7E59t8JFXZF97vxHuGDvn2atwZwtGq1vp9GW9rQaNdt0ataun5yucrxJSj2xR+6pa
	 TdhvrhlI4kyYEbCQ0T/poQxFD2VVeqCW8V2nPS6oXUrWIbNSgt2JI6wnHT/633hW1JPUJ
	 Ezv3+SRUcskoLVMtTsnL/Cxpb9+NWkfm0iAITeM0S3GMEsNN/aGCXLwMwyfR8N+oOhNIr
	 cL/5efhFuEZ0kSAJ/h8YA1bvbCfv8tuvfB2CqMHp6XqYYnuXW8KK/0MvwOhUVZyqdUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971054;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=QfWytE/OyWOiquCmJ5wYN6TtAZqv5/f0+1pVE00jcqE=;
	b=wvMF1iSLxrKbhbQ8OU0ls4toNhQkUBPbdnKrtyNon9VYKkTN4Q8QOxuX1qrQAH12Uj7N
	 BWJmijdVzEO3sDyC5utEUrz7MUC/OsDVKP8rOd1AXXgjxDgeoRcuAaxCIcO3zdtEd8vY6
	 lMum0Py4PT04+kluqPzJnWaEi7jR/0wLAF9mNDY5nzWulJ3qX3Iqn9v5RUqQKLIWjnF2f
	 1WObia9TifO7qAcwZJEh54alLtIz43x7SY9kJ+L5UlHR6VKhy9BZ45BKRje+BtbcQj58g
	 fD7wgbkgOmtY1MIVUW1Q3m4d+m0ZmmjWU/rPgXEXaz8m3F+5BOQLizGZoj7WZUPVeEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="Ma8OF/Em";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB218606A881;
	Wed, 18 Nov 2026 03:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB218606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ma8OF/Em
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Qf
	WytE/OyWOiquCmJ5wYN6TtAZqv5/f0+1pVE00jcqE=; b=Ma8OF/Em4w/8a7Z81R
	Hk+evwLb6UNsML2RUj/4OaBrnLkG5rCzud30ylifRAk+vv4K5FfWIx4FQOZa0VoW
	3ZTcFAaYMMJSt/4kM2Tr53FKnPaWpjYfZ+jsZ5pf3tvYOP3liT6elgtdyrIjgBiG
	Kno1z8wenO/146Pcj9Bu8sn/c=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3f_mEFf1qQ+OhIw--.17654S6;
	Wed, 18 Nov 2026 11:03:51 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@163.com>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn,
	linux-kernel@vger.kernel.org,
	Wu sheng <wusheng@loongson.cn>,
	Wang Jinwei <wangjinwei@loongson.cn>
Subject: [PATCH v8 4/4] EDAC/loongson: Add CS4-7 timeout filter for cross-node access
Date: Wed, 18 Nov 2026 11:03:30 +0800
Message-Id: <20261118030330.25779-5-zhaoqunqin@163.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20261118030330.25779-1-zhaoqunqin@163.com>
References: <20261118030330.25779-1-zhaoqunqin@163.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f_mEFf1qQ+OhIw--.17654S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFy7GFyUCF45Xw18Ar1xAFb_yoW5uF17pr
	W5Cay3KrW8Kr9F9w1vyrWDZa45CFZaqFW7WrZ2y3s3Wrn0y34DZry5WrW2vrn8A34Fkrn8
	Xw1rKw4xCa1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7nYrUUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7heEw2r9FZeB2gAA3w

From: Qunqin Zhao <zhaoqunqin@loongson.cn>

On Loongson 3C6000 multi-node systems, when the EDAC driver running
on one node accesses the memory controller registers of another node,
the read operation may timeout and return random values. This causes
false CE error reports because the random values in CS0-3 (low 32 bits)
are misinterpreted as valid ECC error counts.

For cross-node accesses, check CS4-7 (high 32 bits) of the ECC
count register. If the valid-cs-bits firmware property is set and
the high bits are non-zero, it indicates a timeout or random value,
so skip the report and return the previous count.

To avoid undefined behavior on 8-CS systems where valid_cs_bits=64,
guard the shift with a bounds check (valid_cs_bits < 64).

Signed-off-by: Wu sheng <wusheng@loongson.cn>
Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
 drivers/edac/loongson_edac.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 413ca654b4..50959d4429 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -30,6 +30,7 @@ struct loongson_pvt {
 	 */
 	int last_ce_count;
 	u32 mcs_per_node;
+	u32 valid_cs_bits;
 };
 
 static int read_ecc(struct mem_ctl_info *mci)
@@ -39,11 +40,21 @@ static int read_ecc(struct mem_ctl_info *mci)
 	int cs;
 
 	ecc = readq(pvt->ecc_base + ECC_CS_COUNT_REG);
-	/* cs0 -- cs3 */
+	/* Discard the read value if any invalid bit is set to 1 */
+	if (pvt->valid_cs_bits < 64 && (ecc >> pvt->valid_cs_bits)) {
+		edac_dbg(2, "ECC read invalid, skip: 0x%llx\n", ecc);
+		return pvt->last_ce_count;
+	}
+
+	/* cs0 -- cs7 */
 	cs = ecc & 0xff;
 	cs += (ecc >> 8) & 0xff;
 	cs += (ecc >> 16) & 0xff;
 	cs += (ecc >> 24) & 0xff;
+	cs += (ecc >> 32) & 0xff;
+	cs += (ecc >> 40) & 0xff;
+	cs += (ecc >> 48) & 0xff;
+	cs += (ecc >> 56) & 0xff;
 
 	return cs;
 }
@@ -112,13 +123,15 @@ static void dimm_config_init(struct mem_ctl_info *mci)
 	dimm->grain = 8;
 }
 
-static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase, u32 mcs_per_node)
+static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
+		     u32 mcs_per_node, u32 valid_cs_bits)
 {
 	struct loongson_pvt *pvt = mci->pvt_info;
 
 	pvt->ecc_base = vbase;
-	pvt->last_ce_count = read_ecc(mci);
 	pvt->mcs_per_node = mcs_per_node;
+	pvt->valid_cs_bits = valid_cs_bits;
+	pvt->last_ce_count = read_ecc(mci);
 }
 
 static int loongson_probe(struct platform_device *pdev)
@@ -127,7 +140,7 @@ static int loongson_probe(struct platform_device *pdev)
 	struct mem_ctl_info *mci;
 	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
-	u32 mcs_per_node;
+	u32 mcs_per_node, valid_cs_bits;
 	int ret;
 
 	vbase = devm_platform_ioremap_resource(pdev, 0);
@@ -162,7 +175,10 @@ static int loongson_probe(struct platform_device *pdev)
 	if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) || mcs_per_node == 0)
 		mcs_per_node = 4;
 
-	pvt_init(mci, vbase, mcs_per_node);
+	if (device_property_read_u32(dev, "valid-cs-bits", &valid_cs_bits))
+		valid_cs_bits = 32;
+
+	pvt_init(mci, vbase, mcs_per_node, valid_cs_bits);
 	dimm_config_init(mci);
 
 	ret = edac_mc_add_mc(mci);
-- 
2.47.2

