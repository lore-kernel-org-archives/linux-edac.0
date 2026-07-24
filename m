Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA56244C4E5;
	Fri, 24 Jul 2026 17:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913632; cv=fail; b=XHS27ytrfqcE9cwNxzEVG6rtU4LYLAV91ldApM3HiXVhk7oSM7lkaJkDUNmJ1GGDp8fXrcGyy1ZDCVk7DZXj9kzS3lHLAOE7tqw3Kg8idSjIzKtDD9QFvTtypaHz11woN35P8Y+90CmGD4491sceszo3YcCVEzn/MkR9YV8GBUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913632; c=relaxed/simple;
	bh=GYsy3r0v4j0BcVvJdjhntaHH+VtiVLDZQo2oZZc3Rrc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JfOjBA+prGPYbkjrMQwwR+giWu4IAY0GZhw7syNUF1FBTYhxcn4Xi/OAdKN4U1QdQpDCREAb42BIAPqyIcLCkaSD3458FxYORvXw7AVk8mxX479FgCafRxyQ+VzcI8nNxv9yUuYzRD9VrufS+MvAVpvtDp9Ip/DUn4jEvGDrETw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZrmF1o4h; arc=fail smtp.client-ip=52.101.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZrmF1o4h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBUXg7DzF3aR/MqsZtvE87X/6fRkkq/6z5D9qWHYVg7Tj1eP3ocET5ut1Y1WWFbm29B9MyIrheLo00CKiYGPp5/mUH9TS/52llRx5P7nxcvU/01g+jOYtA/nH0tzaau5INJtwcaTdCq9MN7huMTsmyuOd4OtftWd3ojoZRh5jRu0ng4qV5s+etmPLQLw1vBJhGNV27jRMwqmw68HBpzbXmCWcTnzwz6y/PBysIr9eLiHeg7Yoe42zu2hfnnJC/Q+wrBC5LEa+c53CzGMHNsDIp67RmjZZSr1xi+dVeoSK/Cklk/C9entlZhFiPsiNPymLLcAfHEqMFJjOkcofCnEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UVs9Pb1KTT7wVg6dGfcjxY+pcXzGmCqTbwntJ22JOA=;
 b=FB8WerDfkLvQedUfPK4X2l09KP4hoorP/GCs3ASd9++RywS39NURZ8C4kt8z0PNdd4IuTk5F6JDHZTk6xHppN5r5d2Kz07VJbt1HPoHm3FrrFRts+xfwLXRsIUy/7IkhnrWm7XFZHBE7w+e42POD8sK8DV+EZp6cvN7i262A2wx8egzDg7qBePMjDXkniIuB0dA0Osx1DpLMpc8/w8vm2Dm5KP6ZzuFBnGRxUGmHI9spTe4wLdjA96GobRYATYuhE09gr2xHujpolXKE5tsDCwc+iLchOFEZsHVdyJ8O4vI1YcC0u/QeaNFwnJzu9ZFxHZnx7QO9JJz/MzYZh2XXrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UVs9Pb1KTT7wVg6dGfcjxY+pcXzGmCqTbwntJ22JOA=;
 b=ZrmF1o4hNkrkgisXu8M4N+a2Wd7GNHtR32JEenR8xyqZm6ylI+rMk/kRRfN8m1gT6yl5JxPJoAv3Ck5NfHFMpu4snY9OmLgs/SBx8mctaxpn0HQ0MMtxu0NA6gGKXaOWOddvT1206fpd58bnb+K/PQyfrEcsMX+I94MLnBYD85Y=
Received: from BN9PR03CA0227.namprd03.prod.outlook.com (2603:10b6:408:f8::22)
 by SJ2PR12MB8157.namprd12.prod.outlook.com (2603:10b6:a03:4fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 17:20:18 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::9a) by BN9PR03CA0227.outlook.office365.com
 (2603:10b6:408:f8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 17:20:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.1 via Frontend Transport; Fri, 24 Jul 2026 17:20:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:20:10 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 12:20:08 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 9/9] EDAC/versalnet: Use designated initializer for rpmsg_channel_info
Date: Fri, 24 Jul 2026 22:49:45 +0530
Message-ID: <20260724171945.2812749-10-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SJ2PR12MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ecef04-861d-4958-79a4-08dee9a7d545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|56012099006|10067099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+UMOmod+mG4REoof/uzNU/mwdrLBbSajg/qgjDo0WwqFWW0iwNsgTcKdFXr48twfnUMT1Ok4ldUCJGKtGbKDHY96j4HZYpWnBc3Dxz4GVKRY7kdatF25CaBA9LNSxk8zFLRoVaEV9YNozZZJlHZlImjzaaqYImZIhtXk4MINkRCo4Gv1yJKAh1g0zWjuPYWJOIuNNjG7omcGMQePvQsXjngZ9rhONIMF6bj0KJzLvPYWPUzhqaRBdtLG9GoiZZauCKNLWukoWN7iyhVQHi0w+aD9t6q+3ULrebBqaGqP/xCt4kFb7j/h+uoOsVgnkWL/hANH1+zWPeOREtD9M9Yd9CNbMPTFhGNpvY0jXsocz1e5466U0mgGHLfN6Y1DEV0SjXEhXQDiF+HV9iZfaHel1gWS3ubBYccZzbRbjMFTHe9EaXOMFzLtsLg5O5HHQDJOo5FwpuLVbkcoq9aUoVsAbXiJM8DHiWcsjOeRDUf8BJdUBb/QB+Ecr8/ArdxOEcjUkVE8ssD/76RHtxLI/uaw02RlmsZiXfPboOIy+Dq6b8bZ9tZB2hmiEp5Y5pkd1cH5j6MExLmD48RlJUjDsdtcknwxwbSXy3O4zNhhQl1D74PtgfRBPiAw3CmESahcZN68v2N6YePXNS8c6httTgm76XhG3fxHvaao+DItaStmZv1H2uNOkQaKqbtRrpBaHr9jPF+pSXJmAryulg4hM9aMBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9CpuzvlX/YiHsjZFLF6SauplPdbsu8+6At5RgiGffc9AaJNsvUvY5fD8sjlZasXPEyl1h0MIG9Q/TYJoe/j1cBvSJLQ8Xd6NCPkFBhZFsA8HnWvN8r2d7nIWbGSPDgwOJIY02LNK4ihkUjUSL6q0S004sYyVcH8PMNYDa6Hr5hV6koJCVNZNCIMPEMH/HGAvq/dAB0Zsiu9xLVfAeK/r3S5YF1JN414IrihL6KawNQO1CuZDQ0lgTHJrfnwU5Zba8QAnr1yu+28NdMKB568EdCihEUiwV49cFAPDjtmNvbJSluHbcraryvtZGvM/GGma60BHiX+hytqjND4byN17wQ+zqAIiDNZr1I3CmkpaDHVjkSlmVf+t9p0Y6WlxorMHoDrYvdv55wFH8youxpkqJcW3ynxQrmvCi4pTJCuCupVWj48idsl8a48o3wln9MfK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 17:20:17.9717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ecef04-861d-4958-79a4-08dee9a7d545
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8157

Replace field-by-field assignment of struct rpmsg_channel_info with a
designated initializer. This also fixes the incorrect use of strscpy
with strlen which could lead to silent truncation of the channel name.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index ba295714d972..88b24eec4206 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -720,14 +720,14 @@ MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
 
 static int rpmsg_probe(struct rpmsg_device *rpdev)
 {
-	struct rpmsg_channel_info chinfo;
 	struct mc_priv *pg;
+	struct rpmsg_channel_info chinfo = {
+		.src = RPMSG_ADDR_ANY,
+		.dst = rpdev->dst,
+		.name = "error_ipc",
+	};
 
 	pg = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
-	chinfo.src = RPMSG_ADDR_ANY;
-	chinfo.dst = rpdev->dst;
-	strscpy(chinfo.name, amd_rpmsg_id_table[0].name,
-		strlen(amd_rpmsg_id_table[0].name));
 
 	pg->ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
 	if (!pg->ept)
-- 
2.34.1

