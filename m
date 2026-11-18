Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971051;
	b=VTF9oMQgJINY1Kb+eqr4mlVuOKzLMrF9Uu5DuszLhqvbVUDa/qgGhHD5NqAzOxL5o7GQ
	 Qmf3E1k1OZHX0LGi4ykuHB2ScAkLZpoiYT0oAEZdIJV3LhfKvfLjLdPsg5RkFaUbMUojk
	 JbX+tm4sW8AJ937CMuwpSnAMa0LwQgUBUP41ibZSkTcvAp4Oe0co26WHRmeMsV10qhQ1P
	 idbh7/JMto0Ype9Jvs8d68O4OD4O1xFJxd2pv0nQZY27euUfyDFWFJM1Nwh7EaOujtTLO
	 zECq+b34o5jwqHeZNqMJGXk/Qs76LIhfRBBAp4khtLtvTBUFKsdVMKgerKwMe0gWptg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971051;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=daE8MXWR+70jv4rmZgj2YMuLQMKh5NK2VDS/ud4GVlw=;
	b=tc6++Pm2QvloZGzog9tayI6q5LxE3+XpW5j8ujoXeqE1ghdo7L1rcSpMyNeWLLwzWz6A
	 FZgOxdv23nypWItMHuwoAUxGeMQS876RkxJ0wdOLfyDkzUf73pufXHMJgDr9OkRDyFUJq
	 kuXX2yfWkua4PW9g8md0BlqhaeGJsGmj2vBthgTp9jvEnYylN8NidsQ7xoIpLQkFKSY5T
	 5RYcBPYjKv14oZtI/FkHqSnoQV88dbVZi2v0+SmP+gbF9BRfRmTj6mjSPlocsOb0FS14K
	 YGxdxfBB7aKGhovAxu5jqhixAyenFV3SzFYTzPovpxSiyZBvzaNsdsJQeRT/mbbVdjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iaGY6zei;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F01606A337;
	Wed, 18 Nov 2026 03:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35F01606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iaGY6zei
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=da
	E8MXWR+70jv4rmZgj2YMuLQMKh5NK2VDS/ud4GVlw=; b=iaGY6zeiX3niQK+qUo
	T8mTbvaDOwL0BqJnP6G4wNdtFrWtmvzGLNod74HBYtHCoumHeJMIFDvhTqBoI8i2
	VM6OPmunkveHXt7UrG6tCFDZpvh2fLnesaZyKElDN4rKpqaug8kKnwDYUdVJo46S
	RNKsanKSFDMGhGxPiOuUNx4WA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3f_mEFf1qQ+OhIw--.17654S5;
	Wed, 18 Nov 2026 11:03:47 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@163.com>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn,
	linux-kernel@vger.kernel.org,
	Wang Jinwei <wangjinwei@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v8 3/4] EDAC/loongson: Get DIMM size from ACPI _DSM method
Date: Wed, 18 Nov 2026 11:03:29 +0800
Message-Id: <20261118030330.25779-4-zhaoqunqin@163.com>
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
X-CM-TRANSID:_____wD3f_mEFf1qQ+OhIw--.17654S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr13ZryrCw4DAF1xWF4DJwb_yoW5Jr1xpF
	43u34fKr47trnruwsIkry5CF13u3s3JF9rGFWxJ3yj9w1DC34UXFy5GFW3JF98A34rJFWU
	ZF4kCwsY9F1DJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2eHDUUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7hODwmr9FZOApwAA3K

From: Wang Jinwei <wangjinwei@loongson.cn>

Add support to retrieve DIMM size from ACPI _DSM method instead
of using hardcoded values.

1. Add loongson_get_dimm_size_acpi() to call ACPI _DSM method
   to Get DIMM size in MB.

2. Update dimm_config_init() to use the size from ACPI, with
   fallback to default 1 MB if ACPI method fails.

3. Add ACPI UUID and DSM function definitions for EDAC.

The DIMM size is passed from UEFI through ACPI OperationRegion
and _DSM method, enabling correct display of memory size in
/sys/devices/system/edac/mc/mc*/size_mb.

Cc: Dongyan Qian <qiandongyan@loongson.cn>
Cc: Chao Li <lichao@loongson.cn>
Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/edac/loongson_edac.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 4ee9dcb3d5..413ca654b4 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -13,6 +13,8 @@
 #include "edac_module.h"
 
 #define ECC_CS_COUNT_REG	0x18
+#define LOONGSON_EDAC_DSM_UUID "65d0431b-7eb8-46df-b914-b7d568553140"
+#define LOONGSON_EDAC_DSM_FUNC_GET_DIMM_SIZE   1
 
 /* Memory controller index invalid due to inability to read it from ACPI, etc */
 #define MC_IDX_INVALID		BIT(16)
@@ -68,13 +70,39 @@ static void loongson_check(struct mem_ctl_info *mci)
 			     0, 0, 0, 0, 0, -1, "error", other_detail);
 }
 
+static u32 loongson_get_dimm_size_acpi(struct device *dev)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	union acpi_object *obj;
+	u32 size_mb = 1;
+	guid_t guid;
+
+	if (!handle)
+		return size_mb;
+
+	if (guid_parse(LOONGSON_EDAC_DSM_UUID, &guid))
+		return size_mb;
+
+	obj = acpi_evaluate_dsm(handle, &guid, 0,
+				LOONGSON_EDAC_DSM_FUNC_GET_DIMM_SIZE, NULL);
+	if (!obj)
+		return size_mb;
+
+	if (obj->type == ACPI_TYPE_INTEGER)
+		size_mb = (u32)obj->integer.value;
+
+	ACPI_FREE(obj);
+	return size_mb;
+}
+
 static void dimm_config_init(struct mem_ctl_info *mci)
 {
 	struct dimm_info *dimm;
+	struct device *dev = mci->pdev;
 	u32 size, npages;
 
-	/* size not used */
-	size = -1;
+	size = loongson_get_dimm_size_acpi(dev);
+
 	npages = MiB_TO_PAGES(size);
 
 	dimm = edac_get_dimm(mci, 0, 0, 0);
-- 
2.47.2

