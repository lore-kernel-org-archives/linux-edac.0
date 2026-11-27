Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797566;
	b=IupUGYAP0CQAcOFzpNp8lefCw/eQ/hJqXL9kW/mej5JyQzTApfrAc92+4Y0qtV+uDmU8
	 y8PhxNWNmXspGiA/FM1bv5Fh8U6v/U1wOQFeqEujzgeWTBd2sfkxD4lWoi0twWluwegS4
	 eupndJhev2QQTu7Czp90/WGeb3jqeXvRCZbuMybc0M+i7FdSel03Mo9MDO1uEDgAHSI3A
	 5P6GnQJviXeSuh0kHAviRdRmJbbrYFD7Nwka5dHZjJ+aoBt8jYj1ySFYN3v3NiO2PmuOr
	 C8TddG7D4mTUujO/CKx6G8JsaKjlVOj+6aduE00oK0wbRhF8Q4eQFxOPtKlguxq/QnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797566;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9OVDP8wqhA0ij8HunATHVRpeb1yFt0PzpZU/mWbm7gc=;
	b=RIWE1S/IX/ogygcgilxwlIX6tTeiXpfZpLDjpXlJHPJxqzFk6zjWXuAtzfebBQLH5uST
	 rPtKAjz2CarNSC3j8a+P1eI8CZFX3L5yV5UJZrc+ZMAcc5iLc9uAoCay6AxFpgwDqDAeo
	 3MhnwDDpM8gSNNq7wSzAjaqFxRV/W+8lVen+nvWx6GAyDVe4yMnQX13m70FC5gDmPSJGZ
	 RKM7aK8RouYbRWQfJ/UN4vgBvUp5BHJGsV6RVnrqSDq7l1SogWFR45lTjgqalRaXBPBP8
	 l7fQL/spxd09rLHGOsJqfXWQYjg7MOb0naWvqHvCJ2V4DxD6qn7XLDlEzck1VpWRfoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="3/OHoleC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.42
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364AC606A680;
	Fri, 27 Nov 2026 16:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364AC606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3/OHoleC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHVtAv6/lQXnVKUltvt8ucjEXiX90rWAyS24zMo+kK/GLIyYsQoJzO+jRiJpDFxbrUUH0KZemQgmOucxBdubrV0+Y2i9M+9Oc/WnYCb5emvvWqgNg8YmAMhI3JC2Kjd8vtSV05GyBTkoqxtwnkJiXezSzkOwblYOUlLaNwKHBT1JfiOZCDXu/w91ryraUhXiJksPcLIy3O2EjtG7pUok4uKuk0y5RHng+t60HNmt17JjCKNi9XbrpT/88lPxR1rW7GVbp8SnSa4BKBxXbaXLrR1GYb8wC1bRNllATBpu6y81wb8X9X3opVDmmCdq0wpH9T/8aMqZ7EImJoggUaH6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OVDP8wqhA0ij8HunATHVRpeb1yFt0PzpZU/mWbm7gc=;
 b=QRmnv4Wh/QSBnKr87wVj9SeG7PcN0GYyeOV+cM6Hx988vQX9S0ef9p7Pgwo+jvI6WDiho+5fYVgxE3mq0zHQZldz1ZawRPnuk7C/WyioSN6BLd5kKXazQ2RGKC09PzDluQZXPDo2iRGUS2QEQSXVJ4h4c+begR9xxgF4klxcmgieo/dr9He1Ad44ruFrxBlUGJTe78oCixE78x3A7tPQBCbRX2M5BUIxhD1TLlRbL7yJS6IH/sOhvUd6l6adW/nJP1OvINvq3aFKlxWoigpsOwRvHxuaLk1anx9ocYXM2aTgsYGNcLjdvmmKZzxNTx0qm6R6GIiOcMfA3AkQqgLSfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OVDP8wqhA0ij8HunATHVRpeb1yFt0PzpZU/mWbm7gc=;
 b=3/OHoleCLBKtqMZs5dfZD5TxZuEzM/eZzHDGEC15aAJwX3GvfUNIzo5/OhdDb4bh3FBMLEYyWFNsKd412oxoATvf0X9cBrhwjrz+AoTcSrcsr0qbnnAYM6Psd3XK1SErB+a0Ja3+IVKqmQi8TWtekhHUkYmQevHzMhYZPyj1Bng=
Received: from PH5P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::17)
 by SN7PR12MB7977.namprd12.prod.outlook.com (2603:10b6:806:340::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 16:39:19 +0000
Received: from CY6PEPF00000048.namprd03.prod.outlook.com
 (2603:10b6:510:34b:cafe::5d) by PH5P222CA0003.outlook.office365.com
 (2603:10b6:510:34b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 16:39:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF00000048.mail.protection.outlook.com (10.167.247.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Fri, 27 Nov 2026 16:39:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:39:18 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:39:17 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 27 Nov 2026 10:39:15 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v3 7/7] EDAC/versalnet: Move platform_set_drvdata() to mc_probe()
Date: Fri, 27 Nov 2026 21:59:16 +0530
Message-ID: <20261127163853.3563991-8-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261127163853.3563991-1-shubhrajyoti.datta@amd.com>
References: <20261127163853.3563991-1-shubhrajyoti.datta@amd.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF00000048:EE_|SN7PR12MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: f67cf9f6-ec3e-4908-0cfa-08df4ca4fbc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|261102123227099003|261022075727099003|261021121427099003|261021123027099003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	/KTobcHPBfpT8mfn+gJz7lZNAsPuN2nb0DBJ0/VStPZzEZJFEbE2Ku2f332bvJf0N4vAH48sQAsicU1FeqOwtMvgLQCpieS5IIKN4tL2fU1flF0tSoPMhSFTVlQ/Srw7mQplUhMqlqhrUTsasmz8dxN35IeZ3EhyQAzM+/Puco7AJ8U5LezvnG81zcD7KYA0w6MY9mKv7iq2FCjISy6Coxp+0454TNXNC31SRRFcGKSWBo3Jx579B9qu+RSdzDNnwxffxQSxGP/nFH53nMCgxXT0y2hcKQsFEWh4bWH0e7sSt/UyCfRGeELCI+jSBfwGU3pC5WgznVABzVH8nFf8fa/HVl0SzRvBOjuyGvoGVY58TWHBgA5JMxKUcSr6lD9eY8qbHhLXW8X3pQ8QfwSHJDjAFG9x84Et2OHkOjlCWpS/iWO6thEqhVyrGrtch0id80YkGPc1Zsl0rTaoZo38fMHZSmzFa8vZv36zwpxMMFbtDPQpewx8YYCS8x/eitEvukE2hSVHbxvEbh1f7vgeV3BPQSYhtAPVTfHrbV4fzLoNoyM6DLVGmgYWJEGmdsHnEVrZTWDUk2JPZCd1l49T5sHFcVRA6m/8zZm4Ppjvoie5fzXyQh88/8fD43BY3ZD1mGTRrVvvyRU9L0CNdy546Izl+UnLvQv2kFy9u/rWyvbV9VbBrSJxUj+l0MnD4dNdsXo4PcP8Hg8lKxAKM5h70w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(261102123227099003)(261022075727099003)(261021121427099003)(261021123027099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	beIzSU4n6L11s+wJealzRPLrklguAnBjhexkMR381rCxxCMmIkN8S15KAQyjRLYnkNZU9BUU0QVxlqvy5oNcqp1gKjPZUWTJtW26vsXdsvr3WhbhRCBEROkvKZIxdVlAEXbBgxVE5JL2m/0/03+Oge1kjA9hJ30yS27tmtPN1GxSKexjooOWqJoKhZwYankBsNdPTJhfpqaIxgIPJx0Legy72jdJVxv0zCis6Zh6UCauqPzyC6u1t1gj6vN4vnYr7wzXWhKCGY+aEMyVOhV5U8x3Jh2zHrnRb66REikeIWEciMDKkippO4fWczkWjDv903IiXk/FfikKexaXZ+Yg82myoGB/EuAdSgHQUkotPjW1DTG5xciw1NMH+JK/YzgwiraCOU/fIdzODwA1NklspdP/XgYLAbwUWGci0uDoM9OG+vZ69vUhV+8C0fzuTJin
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 16:39:19.1535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f67cf9f6-ec3e-4908-0cfa-08df4ca4fbc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF00000048.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7977

Move platform_set_drvdata() out of init_one_mc() and into mc_probe()
so that the driver data is set once during probe rather than being
redundantly set on each memory controller initialization.

The pdev parameter in init_one_mc() and init_versalnet() is no longer
referenced. Remove it from both function signatures.

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v2)

Changes in v2:
Add reviewed-by tag

 drivers/edac/versalnet_edac.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 8a5da8fb3403..143be2cfe6a8 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -901,7 +901,7 @@ static enum dev_type get_dtype(struct mc_priv *priv, int i)
 	return dt;
 }
 
-static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
+static int init_one_mc(struct mc_priv *priv, int i)
 {
 	struct edac_mc_layer layers[2];
 	u32 num_chans, rank, config;
@@ -961,8 +961,6 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	priv->mci[i] = mci;
 	priv->dwidth[i] = dt;
 
-	platform_set_drvdata(pdev, priv);
-
 	return 0;
 
 err_mc_free:
@@ -975,12 +973,12 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	return rc;
 }
 
-static int init_versalnet(struct mc_priv *priv, struct platform_device *pdev)
+static int init_versalnet(struct mc_priv *priv)
 {
 	int rc, i;
 
 	for (i = 0; i < priv->num_ctrl; i++) {
-		rc = init_one_mc(priv, pdev, i);
+		rc = init_one_mc(priv, i);
 		if (rc) {
 			while (i--)
 				remove_one_mc(priv, i);
@@ -1028,6 +1026,7 @@ static int mc_probe(struct platform_device *pdev)
 	}
 
 	priv->dev = &pdev->dev;
+	platform_set_drvdata(pdev, priv);
 	mutex_init(&priv->ept_lock);
 	init_completion(&priv->rpmsg_ready);
 	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
@@ -1067,7 +1066,7 @@ static int mc_probe(struct platform_device *pdev)
 		goto err_init;
 	}
 
-	rc = init_versalnet(priv, pdev);
+	rc = init_versalnet(priv);
 	if (rc)
 		goto err_init;
 
-- 
2.34.1

