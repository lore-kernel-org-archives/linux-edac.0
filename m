Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6966731715D
	for <linux-edac@vger.kernel.org>; Tue, 14 Apr 2026 18:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190719; cv=none; b=Jt4Qs3ZPk8CPNlIIBRtNbBkTBvIi8lMWkDQL6MjbcHHrIOzdkGC08efxBIYJRPwOlI3CR0d+oqnw/8Tn/ZDyCidRCvg3J51I9HHuu6WGQKMQ/AViPFzhi+erAf6GdSoO9+QK+yo7Hwu8DsqaoDcXK3X8D7Tu4QSBtTXrRKFaPlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190719; c=relaxed/simple;
	bh=EGJT4vB2scMx5ZWJV+8qy4ZrRJT5zSxWDwW6BXeB3O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iCQFc8ownTqlNxB1U5g8kQ+qoy+NX98CrTL+2wMYRLwPF6vEPKh5E6k4xBIpXZiRvKfczftNcvWELXxGqRAvs8dRbEurH44cjQRFcwAK+rLj5P6q1fOn+X4zRBoPPXMy2WtmcLJ4buSHBGo83seMGewBRd+e+beAkXKVx1AUUAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGkNTiXn; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGkNTiXn"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82cebbdab08so4345182b3a.2
        for <linux-edac@vger.kernel.org>; Tue, 14 Apr 2026 11:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776190718; x=1776795518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzM1wzYSCOjVyEsgMAHvBw3QH520uGNl0L9o4Z7S3BQ=;
        b=lGkNTiXnP1QNC0nGHkV+f6KuEMYmcionQtcqJnaQFoLOmrgP6zXdd+BUXXJeCTOz83
         56e5zPH/5i6Nj2Wt4X2ZQZNmb1PTZKRAppXS+2f2mdYQS0+jLqguMqt/J5R94FPXQWWO
         3yAWpOXFtl3SjDfYfCvUla1SrDL1pBsbTOfxNXfqG6b8YeFb2vCRmIU4LWa8Ic5E8C85
         I+3dVWIfvAGkLPxuxbSg6FVL94+3dje+RrnvawptUwbyj2n98kwPfgCv7u/lxi37xUti
         bl9j1SNuc/4sSqF+YK09VTDznerEP9VKe4YuKoXaJSMRFhayecdtMnFuxvy3//XV9DCB
         swFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776190718; x=1776795518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzM1wzYSCOjVyEsgMAHvBw3QH520uGNl0L9o4Z7S3BQ=;
        b=MrIsmIFZrxb2ybMBBTQ9zi2yr1ggrGjjlD9JeWJrT9fKywDnRr+q1oKuZ978cuLqlI
         wuJQDPfzZ5EbEeoH5ljGesznL8zgTAWi3E7HLEXJMPFsKtA7cWtULS4OeOFZYRAydBvc
         KDkZIsLEHuXb5Xy3WsuGW7pW/AduNrcmUXxZpczGjVNAi9EMF7PMPH/u7b0/W+RWiGu/
         BCAr1zX6PaJmFi4rmY6eR/nqlCMsZei9Cin6v6qdryKo2zg811PrSPBqDTuO98DHVqME
         ErfUVVAZJh8xFiUMMMDGXUjcsJ7rh3p4pVt4ECMm96oCGF5e/vraxZaFCbJwYWv2Y9zM
         NcrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qrkFBqFR3cqS8dP27TIlUtIKEpBiUV85NpwUANDJr48boRc8LgVpjxok8jqXfXA4s/dnASQ8BouMh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz79IK17hN1AzGWvf7EaaOJe4tnKLvpM1nIh5YYFcIWX9MLzadH
	uy0VqGOietasuRSXYhJboeuNRNrzI34ZCwIk21kQ/YTLEjqMYgymDVDoVILB1kHP
X-Gm-Gg: AeBDievOflXZi1Z3MKIfqbA7qYwMG8o9ujVgeWQq9EOvMxJjVi6uRE3z7NS0CEVFUXY
	WotPlowWaEeUfsIaYq2N+9HWoIc1X0uNYotDjy/9VzAdPUb3ka1ufjCzJKuAyqFJGjwv1hLAoVj
	cp8tlehxshxFJhQp8gog9iigz/KvhOF3PXRgsBEsv1i8HQLvSkCaCmEt+z6jJzHMX2IJ6f2cPuK
	OiNA6pWCUty8F3iHb6oUPZvD/l841whbWTP1ijkkmEaWeYuAhOzdS2FHmeS2mZGFfbaomtWDYZ6
	p2cdYKuh7Esj/2VzyRCJWtTM3f43DVEXzyO85hHd5cFOIDsSDy1zL00GkJCFgWrxeqUBMmsC8ag
	54pgYS4LHZ+7qGwBsa+t3ao2vh0q7N8sUQpiPalBde5XaF9gGts6yFiHXsPOxBv5s+oSdidkp/R
	WeXISVvRKJQsoCMSEbVlc/JzBgxIvdAuEjubvynJo3sgQ7FLEdvpzJEyQ=
X-Received: by 2002:a05:6a00:4009:b0:82f:3f28:2244 with SMTP id d2e1a72fcca58-82f3f2836bfmr8490236b3a.1.1776190717655;
        Tue, 14 Apr 2026 11:18:37 -0700 (PDT)
Received: from anarsoul-xps15.lan ([2001:569:7c09:b500:8461:f909:7a3b:1c4c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4d5413sm14028936b3a.40.2026.04.14.11.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:18:37 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vasily Khoruzhick <vasilykh@arista.com>,
	stable@vger.kernel.org,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Subject: [PATCH v2] EDAC/i10nm: Don't fail probing if ADXL is missing
Date: Tue, 14 Apr 2026 11:17:16 -0700
Message-ID: <20260414181735.87023-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasily Khoruzhick <vasilykh@arista.com>

ADXL is not present in Coreboot- or Slimbootloader-based BIOSes and as
result, the driver fails to probe there.

Since commit 2738c69a8813 ("EDAC/i10nm: Add driver decoder for Ice Lake
and Tremont CPUs"), i10nm_edac supports driver decoder. Switch to driver
decoding when ADXL is not present.

Cc: stable@vger.kernel.org # v6.1+
Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Signed-off-by: Vasily Khoruzhick <vasilykh@arista.com>
---
v2: - use imperative tone in commit message
    - add r-b tag

 drivers/edac/i10nm_base.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index 89b3e8cc38b1..69a4a255e4c8 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -79,6 +79,7 @@ static struct res_config *res_cfg;
 static int retry_rd_err_log;
 static int decoding_via_mca;
 static bool mem_cfg_2lm;
+static bool no_adxl;
 
 static struct reg_rrl icx_reg_rrl_ddr = {
 	.set_num = 2,
@@ -1208,8 +1209,14 @@ static int __init i10nm_init(void)
 	}
 
 	rc = skx_adxl_get();
-	if (rc)
-		goto fail;
+	if (rc) {
+		/* Decoding errors via MCA banks for 2LM isn't supported yet */
+		if (rc != -ENODEV || mem_cfg_2lm)
+			goto fail;
+		i10nm_printk(KERN_INFO, "ADXL not found, falling back to MCA-based decoding.\n");
+		no_adxl = true;
+		decoding_via_mca = true;
+	}
 
 	opstate_init();
 	mce_register_decode_chain(&i10nm_mce_dec);
@@ -1243,7 +1250,8 @@ static void __exit i10nm_exit(void)
 
 	skx_teardown_debug();
 	mce_unregister_decode_chain(&i10nm_mce_dec);
-	skx_adxl_put();
+	if (!no_adxl)
+		skx_adxl_put();
 	skx_remove();
 }
 
-- 
2.53.0

