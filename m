Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D363E5A34
	for <linux-edac@vger.kernel.org>; Fri, 17 Jul 2026 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284519; cv=none; b=LVZ80rArehfM4wJAxYjjYYFn4POuPhvocifQUYfioldPa16qmdkKqXR8lmm8Ye7mVRUGKjYJjOBNcLFH3SR6zscPj8sf4ndp9YIKUMCPfb3/d1a78iJNMRHLfCgc6Suj+cel4JpnAKwfYrOpUvhIUNeidc5/WgD3emBJerGgkuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284519; c=relaxed/simple;
	bh=JuQ4q7hxeKlY4GY6NrrglhzlUg+r0gikvL5tbMMS/9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dGOLy/SFT8TFsXK139aBXnfWQXR0Q1b2v7aIMd/XD9YlQfuMbogTWjOsY8envgUW8JjfZwjIb8VJ73Y68sEV1RErzmuEHfDlJy5J7DWCDukzgIFuDW9iefC5za58ilK4Y11S8cl1/U1ScrFAnYvDTkK2+gTbiBTsM88Ad0p+i3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAE4oReq; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAE4oReq"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso5970275a91.1
        for <linux-edac@vger.kernel.org>; Fri, 17 Jul 2026 03:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784284516; x=1784889316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=97ExHNuIoUrJIKM3oCIPS5xjpmF2yFk3sg4kSKRU0dA=;
        b=JAE4oReqj/83fBBA9VLt0LAsBkh8wv7OqmnCXhfF6FzlXCRIFdtqIoZBj2oPbeLYux
         pNiGSDrZ86V8G5OmQZbr17OnKjGsEEmkeajuwkvgBNYY3bH4hdNm7Q4N9n2q3x2qp6Sv
         GzlyKlrqhRv9btAvsvI1URv+3BGgGGxw9Wr9zO0yE5fdim9oVib71TYrTciRAEFXsjg5
         mM7KbBU/hDKBx6L4ESMmsNivLr/9k8m2ZZfca/8oTYpNnQIUmy1nMuqy986Kw585jLu1
         uOhTEYEVPilXUy+8ZLI0vJoRigTqMEDWZ5138r3iqEQ9keoiAjp1qUnVyjleIH8nWJLg
         4JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284516; x=1784889316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=97ExHNuIoUrJIKM3oCIPS5xjpmF2yFk3sg4kSKRU0dA=;
        b=QmcPq+bEG2FnANPbqQBzdgKzKJzBzTfBK5AcM7WsoI3xg1LO8strshalxwGqvPvHOU
         DbidVoHdo7BZYVVELJ6i6U6eZ3nKF/FXo458bcjjw+dfRQ1zgFNWaR+itDLFv1zVEqdN
         huwklUWvAbcHjAjcjsH9gCyvZJOKprPz5GUUX3yPtfDIIytHPqu+vEKNgpPHIPfSArG0
         YmO2FXvPDw2hO7rRK89cXhQSLhL0fHlGOfdtGvpNCeDlTiuzA6Sz3tfIT1Dp9LN6672X
         HjGnxlIXe7W01ep2tPxdgmZMxl8ip/s7ymGFJMW1MO+WbjYwqVa3Up0mD7NfAdXas/Zl
         ktuA==
X-Forwarded-Encrypted: i=1; AHgh+Ro43UEYX6D3G1yG7b1y3CsDvAPWYlm4Uf35QrMq77o34M66eKljba1efOru4sY953D9AVR9QD1RGcb9@vger.kernel.org
X-Gm-Message-State: AOJu0YxNFUEqqUHqOmXbE8Q+kNhFL2DhLHusSxGBaoOnPqnprKMkSTbH
	fQFHnhZ6JE1RUnFFM9I0skSMDtjruo7qSnr81Qtpm1zg/cd6XrF+oPs1
X-Gm-Gg: AfdE7clAdo8c2fZS1w3Q4WtK7k+1WSLqZpKdWIYnEEG5XuWi+uTwSGbnVOTo97CLmyi
	2V2zp0OagQc0tLOoockx4pG4O5khSzJO+9RYeqh4KxM/CEAzRjqZUKnRcW85ujLUAPLuJtqWuPN
	a/TmMlZGo49+DXO8Smn3EzC+GeNSjAsJ5P8Z5p3j/XZaG60TXDKF/yo+pi718xJEGW49JC9TW4Z
	RDlR2yIKKAIcefVGxYs/cqRZk0j/tZvEPMMDFwjcUWKKTEAbnBN+sAHZHTJ+SCKe6LD9gJJAI3G
	wNLhs58DrUldl9gcUSqf9lkWCN41NSWo8J2z5k0v+hO6Et3jp3QQrynp+hpAzvRxCh8FVro9AI9
	fc6rz3wLdZmy0/FHZFKNPZyth61WU6cNLVh+5ou/JyHMgOQ6oORJTnRtmqgrZ2OqAinl3H27JCi
	IwQ+J+qbTTX2WObH9CECqrSkSYQrGOzI9k7ecIeg4ftO8LKA==
X-Received: by 2002:a17:90b:3dc8:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-38e4b3e1419mr1858993a91.6.1784284515949;
        Fri, 17 Jul 2026 03:35:15 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e3:2048:47da:f413:dfc6:e61f:2573])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429ff04absm5461371eec.8.2026.07.17.03.35.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 17 Jul 2026 03:35:15 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: dinguyen@kernel.org
Cc: bp@alien8.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rounakdas2025@gmail.com,
	tony.luck@intel.com
Subject: [PATCH] EDAC/altera: Fix device node reference leaks in the SDMMC ECC setup
Date: Fri, 17 Jul 2026 15:55:49 +0530
Message-ID: <20260717102549.13309-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under altr_portb_setup() and socfpga_init_sdmmc_ecc(),
of_find_compatible_node() was being used to look up the sdmmc-ecc
node. This node wasn't being dropped using of_node_put().

altr_portb_setup() did not drop its reference under its success path
or on any error path.

socfpga_int_sdmmc_ecc() did an early return thereby skipping the
common exit label and thus leaking the reference.

Add the missing of_node_put() calls in altr_portb_setup(), and route
socfpga_init_sdmmc_ecc()'s success path through the common exit label.

Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
 drivers/edac/altera_edac.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 68846f583eee..777ba6efcc54 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1524,6 +1524,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	dci = edac_device_alloc_ctl_info(sizeof(*altdev), ecc_name, 1,
 					 ecc_name, 1, 0, edac_idx);
 	if (!dci) {
+		of_node_put(np);
 		edac_printk(KERN_ERR, EDAC_DEVICE,
 			    "%s: Unable to allocate PortB EDAC device\n",
 			    ecc_name);
@@ -1534,8 +1535,10 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	altdev = dci->pvt_info;
 	*altdev = *device;
 
-	if (!devres_open_group(device->edac->dev, altr_portb_setup, GFP_KERNEL))
+	if (!devres_open_group(device->edac->dev, altr_portb_setup, GFP_KERNEL)) {
+		of_node_put(np);
 		return -ENOMEM;
+	}
 
 	/* Update PortB specific values */
 	altdev->edac_dev_name = ecc_name;
@@ -1600,6 +1603,8 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		rc = -ENOMEM;
 		goto err_release_group_1;
 	}
+	of_node_put(np);
+
 	altr_create_edacdev_dbgfs(dci, prv);
 
 	list_add(&altdev->next, &altdev->edac->a10_ecc_devices);
@@ -1609,6 +1614,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	return 0;
 
 err_release_group_1:
+	of_node_put(np);
 	edac_device_free_ctl_info(dci);
 	devres_release_group(device->edac->dev, altr_portb_setup);
 	edac_printk(KERN_ERR, EDAC_DEVICE,
@@ -1638,7 +1644,7 @@ static int __init socfpga_init_sdmmc_ecc(struct altr_edac_device_dev *device)
 		goto exit;
 
 	/* Setup portB */
-	return altr_portb_setup(device);
+	rc = altr_portb_setup(device);
 
 exit:
 	of_node_put(child);
-- 
2.50.1 (Apple Git-155)

