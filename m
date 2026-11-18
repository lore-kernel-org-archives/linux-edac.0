Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011780;
	b=Shw/k9US6GD3+L6PPNmgm/aI4dw6B0mxJcTrShts/YTGsdMOO4Oi6atMpy7LymRtF5MF
	 6Olcz0iC5/YUnuw0Ow/wkW9LndbgXeGy/4ZXnwbvT6Dju/MvVI2knM+hZMlI1qA4S3dq7
	 1noM2NDdQGeSYiWUM9TLIg4o3HvbbExhqr49g+/OYB9pZaLkEamJrZ79KYcmRlTL98g8w
	 C6ltXJAU18N11E3bl8jnplqnk0tDQ84w4bWuikHNm5whg1waqdkRMFlz4JD09QBZ9QdzF
	 njUk54nW3rCoEn9drBVspimPyfnRBIarqZweAT7uOKYQHkSm19oNWi29y3XcE5ADQ9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011780;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=EBtvwFy+WCmFg6+CjdAp6owH3j0V7YEoBnw4frAxjw0=;
	b=4J+EkvL08S7PqktIDNmoNn4y68gPAzjhu3alMMTqq/WyR7HxudiLN0VNotA7w8BR9NGq
	 1dAyJ1S+ngcbBwMZ1uKxeERSRiI2HteVyK461PbY9NRgcO1ft/Ejs/j4nAH2neQIl1kPc
	 XLWif74zIqi74FEaywvz3buDgU9JWcCyKs4xypJddjw8BhkEzTXgnQg2pz8vHQBXWgTsp
	 E9VSEkL5vEz1vqMdlJnlLRuTmbOprURNvEJJyk0KIsGJ/wmU7x4DQmqEoufKLD8UY6k7K
	 rqvfe6GG1arsIYlSO6fbk1snIjyMxUP7EDK5VdWwAc2rvk/9Evufd95SsnOIqydvBUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="4rkV0/vr";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.47
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012047.outbound.protection.outlook.com [40.107.200.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160EE606A336;
	Wed, 18 Nov 2026 14:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 160EE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4rkV0/vr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXy3IvKVCs61kj6/JMxaIukbeKbFN7YLswcpuHIbbVhGtZmVHj9spmmc2pdKieyUFuEQhfJQPOF6ESsOyD+QyGEIE51mtW9ZBOBc1NQfCsKOnrkF6DZIwduCRH/YyasV0oO8YyjU/NXFNj+cIreAHcYYXJZroVqFiVazlQHq5bjChRosh5zB7tm2SF6XpHYLgI9gyDUnH0h+oChHtn7cJ+bHYQ5DdA3cd2D4KOZIJ6XXPQ4OoV5mGUMRy0bt3BsshzyoFtUdPkyyZrd1WyCSxNjg/rXAXKLNpkqIQax9Mawdr5rYKj1fWfOOUuYz6ggnWh1JztTN9om/4/BMJ7Lpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBtvwFy+WCmFg6+CjdAp6owH3j0V7YEoBnw4frAxjw0=;
 b=V4e55UtoPMbd2FiOYDgHj7BnOw0MbgR4jDZ3+F9rA/gfTv7qApPkSdWSZqlLwF1D/TaD4j9uMhxzhHj2o/BzashcQoSJgolAJHY93UEG7eG82Shz6S/hvU7qq2soiCdiXTOoa9r1H9h2RB6ynPEW0XkoCqqPTybjtIOqIweurcPMo4TyposqWPT2pTl1ut6Jfbmfr9qsdPGVPW/bCcV9MexEY2FO4mPsSrxb2KLck4HnABAwtEYvECyHPRz92Fcz4qsCNXbnYXgktFjv9gUhDZNMLHP9fxV6dSl4HN5pNBX6qxW/Ufs/6rrzFY2umI0xlosh2j8YviV9x6LfF2BNRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBtvwFy+WCmFg6+CjdAp6owH3j0V7YEoBnw4frAxjw0=;
 b=4rkV0/vr4jGapLJpqOA8IFA0F26BP2Oe1UApScVl8USVQoGD6A4m7WSaikD7uoP8Qv8aDoXhvORU3V2IRPT2PNVIIgrjuB21Os6IwQFoKEC6sctS75nFCv0KMAaF053RHyfRQvv2o0PEnKantKQDq81k6roxpuuY7Jc1Visw3yY=
Received: from PH8PR15CA0023.namprd15.prod.outlook.com (2603:10b6:510:2d2::22)
 by CYXPR12MB9442.namprd12.prod.outlook.com (2603:10b6:930:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:22:55 +0000
Received: from BY1PEPF000264B6.namprd02.prod.outlook.com
 (2603:10b6:510:2d2:cafe::24) by PH8PR15CA0023.outlook.office365.com
 (2603:10b6:510:2d2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:22:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B6.mail.protection.outlook.com (10.167.242.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:22:54 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:52 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:49 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 09/12] EDAC/versalnet: Move platform_set_drvdata() to mc_probe()
Date: Wed, 18 Nov 2026 19:50:33 +0530
Message-ID: <20261118142213.100581-10-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B6:EE_|CYXPR12MB9442:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ba650a-6714-4203-4e3b-08df457f6f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|261021123027099003|261022075727099003|11063799006|56012099006|10067099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Mif7jaEjtquiZLdPAenj2DnnoVKgUox5E/ZUgj7FW8To9pvLVW5O4MP8zb3cuChsX0nPGLMywUbNJ6a7KFiJmUWZObvNYFsP5WHBSh35LLitXnndI6CK+HAeN+RBj3a2OqEJ2MXiYZKEqQTxRL+tH0CJSVmOAp1Ww0j8JdVw/tVArVJmetcMC3JIbTClvcsySG4qb6TghuS9lH7wqpgKORhwnM6n/V6+YiEs23C3N/aDtsNZpMYiekRV+WQafkRMLcKLWIozSISmGuNG86TbMquWkhcnyCK/69f1oJ7cddY5AtsZw+8cWlKgalJ301VL4Mvd9XIWIBa4KlMyWYEjbWE0+zCXO2VoDjYBjhEghUxAMOtOSEcEzzZUk79ulmY3eFijfoGcwnxclpLRL81Y1WZP2wyLdxjBEdvrjnz9Cxw+m7tZvtOumi1m8KxrTMu1ZiBnr1iwWZB1TdM48/kFZy0UqKWgC0T1GvX7q2NwrwFRUIsU5/c+CpgaMJGb7tMM2BGo3NJB6b2zkHQaMd6p8l2672kliqCrOHW07gHsJfC/+o+SC+orRe1GSONx42iRHkXN0twVsKnc+yFXDPJnZcRfasQ6CTHv00//ReDNnCjrfWWOyF8nFIRfgE9L4d/tpOqG0M+C/sli5lmBMHMCUSqZgNR2rSBh9C5c1QICqu3VY8VMWoT/Y/O8XvBYNQyxhiw0n7eQrOhNrzwrCjb6SA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(261021123027099003)(261022075727099003)(11063799006)(56012099006)(10067099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a/RqjSq/Iw8NGD9cV8Xw7FgSVJVCWyyTHwhQTFFsTrDbQQRf0Ias28eUKcZFOzdzqVWxF+GRpjPPttUvrKh94zK7VYxvNBWOQzoCzBhPcqy1GiENL/Hu05bYg0vMRYqt5uH7PkA4b9PuexVqbEh7yhzY//u6c4FZZTlHfsuxOii9ExZXLTKMm9yLRJBtEcCM3kUggqanOYBwKjSP1Z9Zp+0t01wX+TXoZG0JpUeQsc/8wCVPIb4xKpwVU9JPTp5Rl4NcQQLNOjDR5t4ZvxQ8fvKcQgRe196Tea4iqw7nrUd2t2JsHFxZoZUJQwEhrEDsWz4dab5EGjvilF8mgrTx4TEjCfe9JFQWVbCamwVDqh9a6VqwZGerJLY2WKbDRctgvGgoyGCxDX7ktAdr6NAac8SNcX+7DPaqVwQGE4bqzxgpeHtAjAocPF7WAue1722N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:22:54.1997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ba650a-6714-4203-4e3b-08df457f6f7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9442

Move platform_set_drvdata() out of init_one_mc() and into mc_probe()
so that the driver data is set once during probe rather than being
redundantly set on each memory controller initialization.

The pdev parameter in init_one_mc() and init_versalnet() is no longer
referenced. Remove it from both function signatures.

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Add reviewed-by tag

 drivers/edac/versalnet_edac.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 1a327a2dbda7..7c14f1e78da1 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -866,7 +866,7 @@ static void remove_one_mc(struct mc_priv *priv, int i)
 	device_unregister(dev);
 }
 
-static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
+static int init_one_mc(struct mc_priv *priv, int i)
 {
 	u32 num_chans, rank, dwidth, config;
 	struct edac_mc_layer layers[2];
@@ -940,8 +940,6 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	priv->mci[i] = mci;
 	priv->dwidth[i] = dt;
 
-	platform_set_drvdata(pdev, priv);
-
 	return 0;
 
 err_mc_free:
@@ -954,12 +952,12 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
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
@@ -1006,6 +1004,7 @@ static int mc_probe(struct platform_device *pdev)
 	}
 
 	priv->dev = &pdev->dev;
+	platform_set_drvdata(pdev, priv);
 	mutex_init(&priv->ept_lock);
 	init_completion(&priv->rpmsg_ready);
 	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
@@ -1031,7 +1030,7 @@ static int mc_probe(struct platform_device *pdev)
 	for (i = 0; i < NUM_CONTROLLERS; i++)
 		get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
 
-	rc = init_versalnet(priv, pdev);
+	rc = init_versalnet(priv);
 	if (rc)
 		goto err_init;
 
-- 
2.44.4

