Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971047;
	b=i5xwfFOorw6P/1m3m/Qga2cPU/mL+11OJFnLVftFv2BHUIpvLzVwz9QmGKlqjWq0rCPp
	 YbxSrXwY6Oc8AQI7/DOeHA79mp7YfvgSfoPKeJwvRdmXtUivsFUJOXPcj2axDGYuQE0A/
	 6MBD7tBh0KGHB6XBA4pMs/F90oQiFS/GER5SQV9Cw06g7JmOU/GG6naA7HQjryRT8voWU
	 Gk3oEIhNzF58JSGwndl+iKFx9v6wDVwRNvmKE6Km8oy/wzyXJX1n9WjhCIfLXtldLG6oq
	 fF6TLveDqpkCajrp9GdgZZdrv/PEDhjPpmZ+TXhELbUY4UnXW69pqD/LrNOH8PNvqGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971047;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=blIpMaMB4xvNV4wYBVnb7dSxwAKvouyJbiDj2mpDCHE=;
	b=3BQe0d/li5OCApfUKmBAiCgBMxX68z3OIhCNmv6lMBf7nlPM49QT+imSBnkRkedzw4vA
	 4WPU5gg/2QRCnKkjrFXYfHFntdiVa1cKCdNRuQZC1SmTc76mJD7FY7lJIV6BFy0x2OA+X
	 B3PwSNkdz1F64XYxA4uK2/XtzaVx08ir/aVggiWsSEBWAyWaqi8WbUFqkKeV5+hJ3NwNx
	 UUZP4+JRio+rJNPtNsHZkD7WqpXRVO4TXH6xzdl36m6NdhbeiuHSvtbYBmCTJA4yl5xbt
	 Lj2HTUSPhtmefxd4Iy8FRjLyplyn+A7dFWbQdrtMTDuJg74nreQ96CW7t3kwVvW26Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=A8ZfzNkE;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4032606A332;
	Wed, 18 Nov 2026 03:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4032606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=A8ZfzNkE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bl
	IpMaMB4xvNV4wYBVnb7dSxwAKvouyJbiDj2mpDCHE=; b=A8ZfzNkEn1Iraf2qyx
	C4FyoKNlDegSEbXyB6CyjrFEk+toAjTKdhCVn3dvUVStrmbzUHs6yutVlEt7zrJZ
	PRwNg59ugG6+Cq1KOqCEOGU0DuZ07FNA5Hkg0MH5nRDTIs3RbcCJUdR+oMPzMAxS
	RX7BvU25xEopgTuzrqmEVQGuA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3f_mEFf1qQ+OhIw--.17654S2;
	Wed, 18 Nov 2026 11:03:33 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@163.com>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/4] EDAC/loongson: Improvements for Loongson EDAC driver
Date: Wed, 18 Nov 2026 11:03:26 +0800
Message-Id: <20261118030330.25779-1-zhaoqunqin@163.com>
X-Mailer: git-send-email 2.20.1
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
X-CM-TRANSID:_____wD3f_mEFf1qQ+OhIw--.17654S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWfCFW7Gr15tFWUAr15CFg_yoW5KryfpF
	W5Can8Gr4ktr1Ika9ay3WxC3W5Ka95JrsrXan2v34rZrnxZr1jq3yftrW09FnxCw4FyF1j
	qa40gFn3GF4DAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQYFtUUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7gWAv2r9FYV8zQAA3i

From: Qunqin Zhao <zhaoqunqin@loongson.cn>

This series contains four patches for the Loongson EDAC driver:

Patch 1: Rename driver-local symbols to remove the "edac_" prefix.

Patch 2: Encode node and MC info into mc_idx so that on multi-node
systems, sysfs entries uniquely identify each controller.

Patch 3: Get DIMM size from ACPI _DSM method instead of using hardcoded
values, enabling correct display of memory size in sysfs.

Patch 4: Add CS4-7 timeout filter for cross-node access on 3C6000
multi-node systems to prevent false CE error reports.

Changes in v8:

  Patch 4 "Add CS4-7 timeout filter for cross-node access":
  - Fix Signed-off-by name format.
  - edac_mc_printk --> edac_dbg(2). Drivers under drivers/edac generally
    use edac_dbg for debug prints. Then remove Reviewed-by tag from Huacai.
    Reserve level 1 for more important debug messages.
  - Remove a duplicate semicolon.

Changes in v7:

  Patch 2 "Encode node and MC info into mc_idx":
  - Encode the presence of the _DSD property into mc_idx. Then remove
    Reviewed-by tag from Huacai

Changes in v6:

  - Rename check(), probe() and remove() to loongson_check(),
    loongson_probe() and loongson_remove() respectively.

Changes in v5:

  - Add a new preparatory patch (Patch 1) that removes the "edac_" prefix
    from driver-local definitions: rename edac_check(), edac_probe() and
    edac_remove() to check(), probe() and remove(), respectively, and
    rename struct loongson_edac_pvt, loongson_edac_driver and
    loongson_edac_acpi_match to loongson_pvt, loongson_driver and
    loongson_acpi_match, respectively (Boris)
  - Reorder the variable declarations in probe() so that int ret is
    declared last, following the EDAC tree reverse-fir-tree convention
    (Boris)

Changes in v4:

  - int mcs_per_node; -> u32 mcs_per_node;
  - int valid_cs_bits; -> u32 valid_cs_bits;

Changes in v3:
  Patch 2 "Encode node and MC info into mc_idx":
  - Drop mc_idx_u32 temporary variable; pass &mci->mc_idx directly
  - Rename device property mc-per-node -> mcs-per-node

  Patch 3 "Get DIMM size from ACPI _DSM method":
  - Fix subject: get -> Get
  - No code changes

  Patch 4 "Add CS4-7 timeout filter for cross-node access":
  - No changes

Changes in v2:

  Patch 2 "Encode node and MC info into mc_idx":
  - Use char other_detail[64] = {0} and drop the else branch
  - Put snprintf() on one line
  - Initialize mc_idx_valid = true and drop the else branch
  - Validate mc-per-node firmware property is non-zero to prevent
    division by zero
  - Wrap pvt_init() function definition to satisfy 100-column limit

  Patch 3 "get DIMM size from ACPI _DSM method":
  - No changes; rebased on top of updated patch 2.

  Patch 4 "Add CS4-7 timeout filter for cross-node access":
  - Assign valid_cs_bits before calling read_ecc() in pvt_init() to
    prevent using uninitialized data when establishing the baseline
    error count
  - Add bounds check for valid_cs_bits < 64 to guard against undefined
    behavior when shifting a 64-bit value by 64 bits
  - Rename device property valid_cs_bits -> valid-cs-bits to match
    standard DT/ACPI _DSD hyphen convention


Qunqin Zhao (2):
  EDAC/loongson: Rename driver-local symbols
  EDAC/loongson: Add CS4-7 timeout filter for cross-node access

Wang Jinwei (2):
  EDAC/loongson: Encode node and MC info into mc_idx
  EDAC/loongson: Get DIMM size from ACPI _DSM method

 drivers/edac/loongson_edac.c | 112 +++++++++++++++++++++++++++--------
 1 file changed, 88 insertions(+), 24 deletions(-)


base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.47.2

