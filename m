Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DED44C518;
	Fri, 24 Jul 2026 17:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913618; cv=fail; b=mXinEPrCgLxBlB1+8HBiUWIGS+VmH+LqCbmg+Rnt08kDo2DAFe1O/Ah1JEoKBtVKa5eSZ8vG0i3/QLhIofyhEAalYhuRr3+m3X04/gYPEkvVXhlHc0RX9Dqxw+iKgIvgaswcAYQ0Z6PugRrmGEjKe1Dj2FvPutVMFnSbltFgyUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913618; c=relaxed/simple;
	bh=LvDRAQK38VxHDAJoK18ZnYwNeN3TR4k7lwF45OYvqe4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PDZejCevkDFDnxGPPgHxWmNFq9Di8vDsMtMdNs0soc9DjH4mS++GaXOdElzYmsvYhFj/F7Fak0xn/YQVsAFVEujY5Al/DNdYaOX8fOvd/u1gUmsi9p1LZM9xSVRBFQszLpHwtT1XM/GSfzQg4NwYvBJPcLOrtWBx2al9jHY83x8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wUjZX3UL; arc=fail smtp.client-ip=52.101.48.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wUjZX3UL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVxB8lKamLOnp5/hoxzQata4KABhFtGvUy/eyx8j77TDoXdhmTLpC8zGfWhwwHQTw+e/jlPkseGBFih9Vu2/WW/VfUmu7EXy4z+DfVo6sWldAMfUWrp+Y9MfQu7LxBUn7sYSSdpyy1bCfSKqtec/6rDUl4AUqIaSI2qXC6NQ87uM4oiWP2tEW5DJbVLl8xVnzNf0AR8uJq0wqD6/Bs9MWsBxSSxSx8E6Xv0p8NpdF36ZwY9GvrdSLBLmNYvZpGHJKDq7Bo8ln1a+sz1RfArV0dTus0Bq0uvl8vh65e0PUGGRkIeyILFvbC36tORt7encw1ymvvkJj5b/gM0r2SsNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htpPrwL1J6/5BoEJOs2oMUm/EuiKduVI5GxTcKjC8Kw=;
 b=SZm+cX9/97EQqX+8CEoRnEWTSxR2kNuQninbWlOLoqLpptQI4wZSnjaqsaDDf+2WSBKWmdeaAtGhv8yRGqqMJ8fE3uDdtSn8j4n8YsxDZGDvn5k0nKMrMakY7J9gnPPvBaD2sIVyQ5Ny2+oSEGaifyd4s2+U+7Fq35JeCfe9B2S/WGFVYdahgdzuXAs02HiiWrPnnaufSbQU0gbTU7ZN9yRDOGxyN9qjjNeJCyDlgIk56AvslegADWWYvdvioJXn25adG3m+dkoolB6Xt1Rp3+y64pTe6vZj1MGumv4YiQapNVP+pt8B2sVPqJUotkJC1CUjkEzlqD8bZKypeypPJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htpPrwL1J6/5BoEJOs2oMUm/EuiKduVI5GxTcKjC8Kw=;
 b=wUjZX3ULeOrukaYaNhRCFnyBjM/eeVng5qDeRCQFdWH6ifk+lHL+UyHX9yny2ONL0E7fKxt2YSGmQxS8TZBn91OwVDEeiuSUlY5OZBzCmUZgw9UDNSFkpvisTvy0+dx7XwHbkqDzf+sSpBUxmmeQ1DPK2C8v8qTW9R0nZ35hLY0=
Received: from SA1P222CA0058.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::9)
 by PH7PR12MB7116.namprd12.prod.outlook.com (2603:10b6:510:1ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 17:20:00 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:2c1:cafe::80) by SA1P222CA0058.outlook.office365.com
 (2603:10b6:806:2c1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 17:19:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 17:19:59 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:19:58 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:19:58 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 12:19:56 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/9] EDAC/versalnet: Fix device_register() error handling in init_one_mc()
Date: Fri, 24 Jul 2026 22:49:40 +0530
Message-ID: <20260724171945.2812749-5-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|PH7PR12MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: d041dfbd-f6ea-4881-5f95-08dee9a7ca37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|18002099003|22082099003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ex41RlLjBsmOtLkmnaE1D1tAhfyoIHjqowOSeed/JFNMC9SvP7tkHpmQ7ju2sAk+hVocrQZqk1N41EX7Ep5ag0Xg0g+ydKdQl2TT5CBfMiqQz3MFRSiHC4pz4mybBvMfHx8mAb5NXL4rMA0k09irYywgZgSkkcgRmDdnD+RPVqqhWbkjGj6JDLxwrT0ZZiottwK2eCeU0CcxS1zZmvoIYRg61S2Ympb46Hy4XFTISCEHZ3JN9r/e3LxPoyWB3uIs0VnbB4Nk/tFRwvzKOVxakQfPF2/9WJCfYtVenzZeZoiiEsiq/LnUEbZSRQiJPDtp+MmaGluMngB87S1R7p5mvoIiD9mneTLvJGrqL1PYatH8ZDHZ+khFMsIFfvyZInFeqKpXYPQHjKbdsPf9Iah3qBZCf5S4FKHHUIywO7qF3+11+IPJsGHesGCqIYHcXpbA6k/ZFbTIbPGlH1k2iR1I18wEI76fSthyYMQ4LKxJ42rBKkvpQbJ87vd8qNbMoU1nTSA1tUhjhpQ/MCTTRgjwPA7N6+BhcDDoP7MVPMJrFa16gExolJgxd8y8xFiYyDz+ZRQDPNl9M7DHKe7EOP/qXiqukTbmPLki/1EHnBvZ/MU3suPyLfMa+R5WXgiED+9gtptcsiByI+XrBi/M+ZE9z5oO8AoQzttSS703NEEQVdUCKmiCn0cQU47UZeukjUIy0RJ7dEQap2glONoTzCg5iw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mZ8TRp3UIgN3LYpYEc6tUUyFXdekTC4nI6drf4M9IJ3Ygp55K0qc0IqSdwCHcNj8LYa/RMYd8DR8cOa1lnHUcaOLs5R97eLT7BOnsyhEwmEjHNTxW1VeVeJh9xfZ0yIkggI/6VTEorTIdCZ2dB+MIE8xZKA4HCV4J8p37xefAssWZUnAp/robH5+ipvqpFW4+yYS6Xy6i5SgpknWIaZjDwRt0YQIt1gAFIcTdu8T8Fw3xdzDHi5mgMjorvchZSYv+AtdZLfNxqcJTERohBrlXEgJ+wYH9zm2PzI4mZ1wAIZRkyweTHwOn5RrZnWRYrPnWmw390R0USsKL+an1vtrBZod+T2mUKhpwCAFgBpIoPUkPdbDZ9ayvfFS9Qqq1iWc6vBNQvYAmuQ5cV5QAGCvd21EuSH6WwTxg2ZAB12AnaEYYNoUX1jEZCG3B4GP/GoO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 17:19:59.3977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d041dfbd-f6ea-4881-5f95-08dee9a7ca37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7116

From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

When device_register() fails, it must be followed by put_device()
rather than kfree(), because device_register() calls
device_initialize() which sets up the device refcount. The matching
release function versal_edac_release() handles the actual kfree().

To simplify error handling and avoid complex unwinding, split
device_register() into device_initialize() and device_add().
Initialize the device early so put_device() can be used in all
error paths.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Cc: stable@vger.kernel.org
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 03b6e0958f17..3c9eaea5a106 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -785,7 +785,7 @@ static int init_one_mc(struct mc_priv *priv, int i)
 	char name[MC_NAME_LEN];
 	struct device *dev;
 	enum dev_type dt;
-	int rc;
+	int rc = -ENOMEM;
 
 	config = priv->adec[CONF + i * ADEC_NUM];
 	num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
@@ -817,23 +817,23 @@ static int init_one_mc(struct mc_priv *priv, int i)
 	layers[1].size = num_chans;
 	layers[1].is_virt_csrow = false;
 
-	rc = -ENOMEM;
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return rc;
 
-	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
-	if (!mci) {
-		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
-		goto err_dev_free;
-	}
-
 	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
 
 	dev->init_name = name;
 	dev->release = versal_edac_release;
+	device_initialize(dev);
 
-	rc = device_register(dev);
+	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
+	if (!mci) {
+		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
+		goto err_put_dev;
+	}
+
+	rc = device_add(dev);
 	if (rc)
 		goto err_mc_free;
 
@@ -843,7 +843,7 @@ static int init_one_mc(struct mc_priv *priv, int i)
 	rc = edac_mc_add_mc(mci);
 	if (rc) {
 		edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC core\n", i);
-		goto err_unreg;
+		goto err_dev_del;
 	}
 
 	priv->mci[i] = mci;
@@ -851,12 +851,12 @@ static int init_one_mc(struct mc_priv *priv, int i)
 
 	return 0;
 
-err_unreg:
-	device_unregister(mci->pdev);
+err_dev_del:
+	device_del(dev);
 err_mc_free:
 	edac_mc_free(mci);
-err_dev_free:
-	kfree(dev);
+err_put_dev:
+	put_device(dev);
 
 	return rc;
 }
-- 
2.34.1

