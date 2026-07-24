Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010037.outbound.protection.outlook.com [52.101.193.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D163345EAA;
	Fri, 24 Jul 2026 17:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913621; cv=fail; b=Kc2yYOreSw/C6fzEfrVG1mHFByPA9XUlm1nXuypG6Myb9gerLWKv0zKV3l+W20cG1QlN4jygLB7K+XRZR5ZFqTpxpKiw4l2GVw0Rd9tx7avmFt5t5kWs3PtfouimhvINcpxqmoltjBwOQc1nQa0SgCMBIsrQvVCjw12KDRxuhdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913621; c=relaxed/simple;
	bh=qiDipzY1wGToggmaXi1R6RCLRlVDQYbTi+jxmaKq8Ag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KbD7qQcmyTA9WH0Xjjtw3yPR8JAi4I/RCUB3b7WBRdzoGQBuwB4clLs1kkQce7kcqnNN5YMyNaBi0Sr8QWFetBn7fbOv1NnPkpyHQo23xlo3ckVOfl1se4y183qsgqKY/EzMstd5b/fAJ+g4d9pFk0i2/oiaShnogVfS7nCP8ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Gh8eKizC; arc=fail smtp.client-ip=52.101.193.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Gh8eKizC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ML/IorKw2cwCmGPT3IJSdPZ5UsdaaZaUR28meFKRPXAwvPVSulpQeIdbsFPP10wKkRGyIc7jAmvJIcfamG7GtpToLiq1VEDWocVby+ds7yVwH1saL46NUJyXte/PgYmwgMqwwpxcP2b7qdBJwx7HTTd4TW5UgVzd6dJSL5ZjFk+7+iqt04tukb9RUoA94fu6mI7/6pr4vSSojWhDAT5/VtZYaH65S/kSKWKhwegBYNPuv+4ZSBTJK2WwGL5reVksNCSPrGr8huibFjRTy7046XXQPd8GZpCanbiC8NFb7cToU9dFDIgCWjYyOXWrU0ZX3sDhfvFNyq7JBhLa2JtIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4sPDJEE8z2PAm5CDZe9JognrSs1z7jePZVNRW5+nKM=;
 b=st+imQu+qb+5xsN0SEXIstXRAqz8wFXLsurcjutJEFG1AaQItaVX6vI5eQZTrQnaxHH5+IfkSZzYFCCKGL3aT9tjR1w0rBQLCDoRSAuXsVB2rpKi5nrFEBltf2UsZh3IoJRkHUmk4s0mpxSHRGJMIQ+xb7iOY8CSWRVScl4PRXH9c3Ob3KRs0/sspY40IJzbpBXXgzXt0up3lZiHoHyC4/nv8ESnn+9Iz0A1q/TyZjIHFDs+RZM1JZ3x8hovEeJmMHlcLq+4pX1diw8NK5ELDk4CQ1FgYZ1Gta+3uEc51I2TiDTPqAHgnoFasxuQXF85EGLHoP23pQAwQ4frhjfTYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4sPDJEE8z2PAm5CDZe9JognrSs1z7jePZVNRW5+nKM=;
 b=Gh8eKizCPfJN8rwZXG5ihyRD7JqpOoHsV01tl/x6MBNNFOoTIVw3qVmoRVQQyX/Z/BasKYiImG5LBlcItcEAXfPz4xzDk5k/Y5ZOAkAMn6PAmqHDAFqLv2UZFQCiUSx/93S5iO4SaooOxAovAAUmSUz/BaQms2rx8zCr9kqdMWs=
Received: from CH0PR03CA0099.namprd03.prod.outlook.com (2603:10b6:610:cd::14)
 by MW4PR12MB8612.namprd12.prod.outlook.com (2603:10b6:303:1ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 17:20:14 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::26) by CH0PR03CA0099.outlook.office365.com
 (2603:10b6:610:cd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 17:20:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 17:20:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:20:08 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:20:08 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 12:20:06 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 8/9] EDAC/versalnet: Fix use-after-free in remove_one_mc()
Date: Fri, 24 Jul 2026 22:49:44 +0530
Message-ID: <20260724171945.2812749-9-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|MW4PR12MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b3721b-9af8-4ecd-0872-08dee9a7d319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|6133799003|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QzCZI8N4ambnTddpbOp6ZqfAP45fRNiq1l6t1RP1Bvn8gfcBOnJam3IQuTMCtoXN/bOwpxsQ4BsgHjftTgayKBYbtNJdfpfukwXmTLGe9P+CclWuuLA/DpLSj6mM/4SZd7R56B20heaYUorz39JMJgg+LAUNj2E3JndrDV/jkCnykFWMBSnb0rOrrj8irHwNhSAnBByMngnbxrMLkaTK5OzZpBm4uwLHyem1a1/KsYZEv9MX9vLh33O3vGBadQ9J4+cK10JMf7DyUQvcaO7Nr7o5ckE7R0X+2BPAN7CrLma02gYE+xS0Bui5zapccIw+xsiyY8+0VP1865L3gujt+y6Yf4ZdqBPYyqbBhhb/StQb4RgHUaTxEO/CR41rrMKo66YCQ9FFqNOTwZeJP4CUmeB59A78SgfwLnMWA8XgFF2Jfu4SzXTlXriTeldE2eeupG5q/hHY9FJSoTLrSS8KH0Tvd4YZvRqTNrnlfet7ur0SUbqgAyUL8mefzGhJFuec00r+MFeNEc+56g8ojp9K9aBOwcs+4dxujFl8JuLMwa16JBCCPEczLmrsyX9qiSKPYUd1+dJJGD4QYMwTwMePe/s+8szmtO10ytjoTFZXeUznoNoUssInti/dM9LV4tN/0TkdO3EOoYypFqldJIJiZH0krVj+DQtg8MVfSpPuGhhyiQfGY9sWuMCai3AiTrPh8oLfrTwIE/efVs60x5f8kw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DMnYiUAM/ibBMHT4Cls4rM1sQQLY2rYecaVrhB8hhHJkC5OAzXNqWN7cZzZIjRNb8dBova7ug/RZEAe2s0Z33ThDCw4TprU8wobTb6hASH6gATrSgDFcjWhPaO8ZAuVxFcu6aq1gcwL4fxzTiDoUJQMF9fupu89JsyRVyYtQ4hoEwvVzh4qyRfKXLJhEKBrVsSUBbLcvDIICb4wYCAlW5XZL06uUXb3VAEWCCW950XdMJvYdgcWqw/J7piFnKaGv5TIf7H+hNYke3y78B81PbV91Ltw3NDL29s+za0BftuhhxAALLE83VDkDaQL2Q4NfP1LvcJuvwQmn5oVo0CHw0yFbKKZK6Sa+5N4FtxqqX8PWG9YPJ1quMW56knhitxER2fz5ltDViaSyK6AEocfr9vBthPKkNE5jMl80IVlJYmm02zpWJSIwGp28WgGPEYq4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 17:20:14.3325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b3721b-9af8-4ecd-0872-08dee9a7d319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8612

device_unregister() drops the last reference on the device and invokes
versal_edac_release() which calls kfree(dev). The subsequent call to
edac_mc_del_mc(mci->pdev) then dereferences the freed pointer.

Fix by saving the device pointer, calling edac_mc_del_mc() and
edac_mc_free() first, then device_unregister() last so the device
is freed only after all users are done with it.

Fixes: 62a9fc50e8d9 ("EDAC/versalnet: Refactor memory controller initialization and cleanup")
Cc: stable@vger.kernel.org
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index baca90f44c58..ba295714d972 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -763,14 +763,16 @@ static void versal_edac_release(struct device *dev)
 static void remove_one_mc(struct mc_priv *priv, int i)
 {
 	struct mem_ctl_info *mci;
+	struct device *dev;
 
 	mci = priv->mci[i];
 	if (!mci)
 		return;
 
-	device_unregister(mci->pdev);
-	edac_mc_del_mc(mci->pdev);
+	dev = mci->pdev;
+	edac_mc_del_mc(dev);
 	edac_mc_free(mci);
+	device_unregister(dev);
 }
 
 static int init_one_mc(struct mc_priv *priv, int i)
-- 
2.34.1

