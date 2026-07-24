Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9042E44C514;
	Fri, 24 Jul 2026 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913609; cv=fail; b=M43LTP6ip6CNSorpJJgBJ0pUUgE7ZxMt90JuV66kZlrH0xBbtPUKUCNLlHd5Pk1wtKtBi5RNlDZBbAM/ThvX7h1srL3VADnoOePc+w9zem73FZjclviSvuoRVW9Gj0R4Zua27jjlRrJYPWrfkHyVlyHWLgyvcuHU6SCd6QOasa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913609; c=relaxed/simple;
	bh=IBZN4ccik2rynmf6hYsAjarkJ2Pv0/nrqJYOZEW1ZAk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TMGYVezrX9pxh30pJGJ+6ulhdCIz9+MwKC/rYyEOjKMkv4QRJatMWz/Dcfr0LNhxEAqhpiC+2fGXb7SdVgKfEBQ66GT3crudHwf9z/QdEImPXW7CFDL0GKyM1rSFx9NW6/pRhVl8EYNiDnOymE3B4f/OLzgnOi/SH+uhLkBD53M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FV0e5Q+Z; arc=fail smtp.client-ip=52.101.193.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FV0e5Q+Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmezmB7jSDXDx5rp/czI1SOYUp9ROm3uAaWYgEPNI0rz5LRriE9Rpf1lPkfMZ7cbOMC2rpwrMltpPIpQ6+0PJ/38hSPz1uL3dzpt/Z0ZXqgKQqdH22zOMNDCElNTUl0ZhSPFIe/PC86lcugpulLIj+3xxwnRIQ3DdYZOLvE3jUGj+fvGRZl7Q2loBmgfbcfUlmnkJc/f+8el65vQXEWJ4AVigfk6O4lQyzWEHoB5khNiwddB9tymMOnsisDEfgTqo2fzkDDzyjDuacPLM56r1H9iTobIik6nLD8UMDOu68m4g1qt83LYaz1QZ7kunGQPiHbA8SjjQSpMJUUWUgXiCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZ0n7Z8SpRMiDurFw2S6Bt54h0u1blEn2bcU1qbo5no=;
 b=MXzr86iswyskG+HweCF3FgSKhznzQx5ScZJxS0Hg0OFEIyxnDai5Ul1WwAtsTUL2xLAS3y2k5AaWlryK61X4RcezYbyHlGRDCzANPqJBo0D0j5SW82FM9tvWkIzx4dlNrN8HU7xvOIpN0IeFCs3StZAjhbu9kIPRH+e59kKG6BcdVvuMwgI0mGBS9VcJpvBgyw/NKecRbYtcvXTveoplq7v/OPALXy278AJmfZbp8+B6EyWcWrc0iw5/5V/+/BrToffxCnPpL4nZOz1cykojbtpvMrqt9J/F50hwvxPNxii8Nxd78dgoax/5yfwyShNod7mSF8G+Hxl1aus3yroIuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ0n7Z8SpRMiDurFw2S6Bt54h0u1blEn2bcU1qbo5no=;
 b=FV0e5Q+Z0LDfn7vfuvNtD5cMibn8WMGPS0arINEMFXOB6D0qulLIXMp0JRhl2GiwbG6q2jczGZBgmj8ZegDZwrLMi0B+hI2J+AplMrIHRJbZhXiFiBoAS9qp+4Bmb2NQn/ARW6HCm1ybYyGEAmjHDK9W10flJBCqd1kU+hKedfw=
Received: from SA0PR11CA0058.namprd11.prod.outlook.com (2603:10b6:806:d0::33)
 by MW6PR12MB8951.namprd12.prod.outlook.com (2603:10b6:303:244::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 17:19:58 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:d0:cafe::88) by SA0PR11CA0058.outlook.office365.com
 (2603:10b6:806:d0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 17:19:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 17:19:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:19:55 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 12:19:53 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/9] EDAC/versalnet: Move platform_set_drvdata() to mc_probe()
Date: Fri, 24 Jul 2026 22:49:39 +0530
Message-ID: <20260724171945.2812749-4-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|MW6PR12MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ef0580-b5a1-4988-225d-08dee9a7c8c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tZ8rtfMXhFRF9zA0lqUd80cb7hH6OibviWTkII3xt7HwDYxlK6U+frHkfqpat8pCO+EJ8IfFUmO8eYyQWBk9ofIBmKND1eVDONqYaYQdp9a1SLVYz16+6mHC5/NLxz8Maz0Zcu7mpBGQ5mvq1WdzyBAHxbwU4nWVK43/KcCoyHP6ExADEAGoXhTCoTGnNU0hfTfN++bExIE/SzzcJrnweYKxl8M7UTRtKoFzaeTb/XabBExWBQ7R7CkN96T9cEluJdiFwX9Bj9O/yCTdRaYfhULHDAdflK/X+cY9oyC92FgHFiEKW6rJiWR4cveO2k8LcPql1qd7ybwgsjiDLt38VmVmt/uGUijIr4UVN5e74UFQDzOVWwzyghzY+Qte9Ez/N0v9tksh6A5Xg/HFTpq9+g2EvVWPwKZKvXejYDydGHCojRQ/8rz8K52rfcryAMDtdQbl26PFV8jTUUymODG3qWF3T2hG4bUeriNDCp/s+AV2NNmr2+H/OPXEfMC8lvboUL7grkignjBX5VBo2iwWngZBTIX55e2SFqSDfER5GERCNSj0nmMvHfhDWINydH6SxKc814C/hGQpf1tPXZxYeZJexkltCw13lKwQw1TgSZhEUKSblOn9/iEPCg4g32Wm3HzBzslPg3ZYa/YLD1dWi56zMrAA/Zq1dF8yRaaESTn2pa/hoMTaeLw/Xs43ydosYPJNmBhtKZtoooAIBeqOOw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TsLAnyslzL59So9P9KLPmi9dGTS/JXtF+P/j6VVUq9/PJhJVEhpMfgS69PHkuvjnM1Yky0irXCVP2+TVJ1F7Gn2NJbG7yvxG6SueKrpdtuTpBUFeUCsWKMueXPX1sVxuNsgdgpjEDMeh5WV7L2NauVutAJiPJUV9ozsAg8lMH/6YjorzLuAUp1KM7M5VYiLNDot924xa0ujy9ulSoVWf8moaWYDgo+QETHiCAGpFtsdDDGVxTEkDF1tIoMkw+ouTZlZW07SJuan+UyzTxRGQ3tiucKSWuSmUzXNnXaoo5O/qjr5skEYI3JuSxA30YiU+uZIvkCejoyU8n9ApfX/YGtaCruRUL6jFNsv4mzpD0l5rJ0Xw/zQr5/diRzw7pPw7oi/D1+ZiMunsSnBQW+jK3APVOF/vodjkOb1IOztAPX07qu8juFMtb3Y5ZY93woTu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 17:19:56.9501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ef0580-b5a1-4988-225d-08dee9a7c8c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8951

Move platform_set_drvdata() out of init_one_mc() and into mc_probe()
so that the driver data is set once during probe rather than being
redundantly set on each memory controller initialization.

The pdev parameter in init_one_mc() and init_versalnet() is no longer
referenced. Remove it from both function signatures.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 05dc34504cc2..03b6e0958f17 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -777,7 +777,7 @@ static void remove_one_mc(struct mc_priv *priv, int i)
 	edac_mc_free(mci);
 }
 
-static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
+static int init_one_mc(struct mc_priv *priv, int i)
 {
 	u32 num_chans, rank, dwidth, config;
 	struct edac_mc_layer layers[2];
@@ -849,8 +849,6 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	priv->mci[i] = mci;
 	priv->dwidth = dt;
 
-	platform_set_drvdata(pdev, priv);
-
 	return 0;
 
 err_unreg:
@@ -863,12 +861,12 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	return rc;
 }
 
-static int init_versalnet(struct mc_priv *priv, struct platform_device *pdev)
+static int init_versalnet(struct mc_priv *priv)
 {
 	int rc, i;
 
 	for (i = 0; i < NUM_CONTROLLERS; i++) {
-		rc = init_one_mc(priv, pdev, i);
+		rc = init_one_mc(priv, i);
 		if (rc) {
 			while (i--)
 				remove_one_mc(priv, i);
@@ -914,6 +912,7 @@ static int mc_probe(struct platform_device *pdev)
 		goto err_alloc;
 	}
 
+	platform_set_drvdata(pdev, priv);
 	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
 
 	rc = register_rpmsg_driver(&amd_rpmsg_driver);
@@ -928,7 +927,7 @@ static int mc_probe(struct platform_device *pdev)
 
 	priv->mcdi->r5_rproc = rp;
 
-	rc = init_versalnet(priv, pdev);
+	rc = init_versalnet(priv);
 	if (rc)
 		goto err_init;
 
-- 
2.34.1

