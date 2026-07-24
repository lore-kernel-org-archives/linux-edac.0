Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8047B44C51C;
	Fri, 24 Jul 2026 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913618; cv=fail; b=jE+ybUIfqjcgL+fWKXh8JqO53wcXjMb5XVED0Z8vtRBeicKXWbnFM4pIOrts7N/08Nk6/0ad7KqohsRlMKzRNRn010rGvczyREMoa37YT69F0mgDOxcUz2CKLIkIxTAXCeKO1XLhVx4L21CTNcgzUz1kmgfBxzy1ETLDIjY5Agc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913618; c=relaxed/simple;
	bh=kAlSjO4SWHFfK+G7pinx4jjfOjiC0JHWXIB2FQ8Vcg4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rQbaDI/aiALU4etHdUvkrzAuc/cKQs+xETq14w3nWcokbo2YMwEDbyTOLaaUx0LscvfjVyls/u3ng+55Z8ev5elvv2cj2gEQ+FN+cFuqn8IbUmIRzECT/NvnaVCRoqtDakJkbhjzOgY3KxRM366J4xIkZQHyw9we4ahGmrIcQDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d/uwtgLt; arc=fail smtp.client-ip=52.101.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d/uwtgLt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQ6V5eJq6QujKa1yjanN092xbjQ6ElFm8y94iMM4+OYXRkKJS3IZ4Kq7jmaWj5BLjvHOQ6hvt6oiwtzzGKKafXDReyxm3XpHqCceroqV9u3LdDbhWopjhZTowKTPxBDObd6KX6fzXgoLdZ/FPV1y9rctH6kFZ62j44Tiisy1t3OydgAOii17m0aAVAtfKcJYdIhD8ADamRQ/8Vij3C42MTsl43GiBml+qjZQxUirX3O/vSw2F3C1VOh0V0EYecUKr89hrxyG/Fib9Rcdv5XfpyHE8hiEyt4F1cJMef1N7Kb5PJ/R++IDcalg28H1X4WixVOS9/lVQPNObJtRbKYvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoeEwRMHa37OYn1CBiszKCpJI3gADE1Sk9tAMuMOrOc=;
 b=Dco5zM2IYCgqvq3feXma+DBNABKWu8+DErkloox1YmrdRfoJs9t8Xa7Qa7WDEzMJMbgtgXKj9HK+XLFM5Wt7Q9gMQBDFTz+Eb9FNDaTt1ETEQcXs9qYqvjikTSKEXLFeelf1DKbwoAKfaClKoW0TvaUcX9WQhlaUDTJGDCtXV4aENq9vn2WBex2PCWYOw9isbym7A4msbJXSp1zjCbpnvvzMEHUwgzvTEq25UtOkq8xr8aA2thoMX3Z+Yu4Kpwo4CsY1/h2ylgKsXCiumDYRZwXrVFS8VjUeqJrw/ouD9h2z+iTSNSq0EaDzburyudgloGfDaww1VahKc2PbzqiVeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoeEwRMHa37OYn1CBiszKCpJI3gADE1Sk9tAMuMOrOc=;
 b=d/uwtgLtahowvw39afrOvqP7I7IPyyCeFrKxnzZ1UpLjbUBGR6Zu87JzTqmdqjnrcF8aAT//588REBeAUT/hlFuDDKJiEBo8BDiWcomLlFuShTh2QU516t2FaE8edEkcWW0wRND9c8WwOS+yatEYoryWUh+AYZY3tHDgW+/EsrY=
Received: from CH2PR15CA0027.namprd15.prod.outlook.com (2603:10b6:610:51::37)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 17:20:08 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::9c) by CH2PR15CA0027.outlook.office365.com
 (2603:10b6:610:51::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 17:20:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 17:20:08 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:20:01 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 10:20:00 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 12:19:58 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/9] EDAC/versalnet: Use dev_set_name() instead of sprintf with init_name
Date: Fri, 24 Jul 2026 22:49:41 +0530
Message-ID: <20260724171945.2812749-6-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8a95f4-6583-4961-0335-08dee9a7cfd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	bLVw8L6lVZzmv8dKyLm+Xix/DP4gZcjZRcwNugV+rPfLUthONm5Sb1fGEVIxEFY3Xvdn9t/5iCYyJRXbO1UJKGnQEeDfXEgXXwMX9CFUg8BhprYpRcjE9HnPtP+ZW8bJHwWcU4b99kzeg/YBa8DXLGzwOwAleR7CgqTto8hs03Ri2esOMRCXcU0dfzpAIQuawT+q/8HzGOZ3R4t2ElotkalM7XAWJo1MYYKK/0zVuE9U1+QskVdZM9HtQz/66LjmqC7ml000if/bhDLUu04QQbseQod3XQKM7+lLuKC59Sx65+q74nxjzXxuf4vf4qO+in2vWjruBR1TAKcg9fqajVYvsaIj2o8F8C/RYDkOB1bsBkuw6cjLduTOkhuPz2RWBC5fTVJEw3MX/f1Hsq0n4jFATZ33dYrTgmHY7hXGQrAQmbo1BwHMIgeXgPvlLt5uGlrJdZupSsoOGbrBXMP6J81/RtNJR1tIvdbw15MzSEc3oTpVOUS95t5apjthMEp+hCPV3Wk3YCCpTKaVHi3NRlQH5HgZYQENI4lSbD/21wKwIqWwFUi3gzOe8vxzdaVwpsT3SuV40e9LmO9uYxrTRVOiF4/+65JFTjoBEXSfKzUynrmh7ZOV0VDlybKWiX+X45LgzoBFv1r0ShbU3dNbALY3SCfzZ0mnoIH+OiOJEN54vjV8AAxunCQ3n8Jm8nOhMU6Cay/bbIB1tax3kqJsTw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jtdhU6MgKRGsXXQ57BB0OsP8areONMEPbKWdcWYNiM++NRmmjp6crKpi6u2WStmu4ZPJjuBaL04ERgNPwuhF/K6jMFbYcmfQ3a9qZnzrVyyvszfmSBA86/+nLrNtLMR01BM+519uDS6q2uDmFni2/b+RCBEqjmY4dBfKCqiRyT3k99n6+SPbakql0m7YotEt8O3PC1Op3tVjaEk9n9ZgAJRP5r0tjOsh8QyXux82E7EF837zj+8SQvoXJDBr7wbYisHrrTlVxhoUVgFSEF6e4OGfDSEuS1wCSz3lmGaUkduPVjTqx4qS3SS1kRDAGiYhFeDyAHy3tkXqyQXNZ+9eOrMu+lfEdE3ZuBOVjrGX0IY1qHFLvfT2oy9RD8t5o80MGrNBkl8GuFBkSByRTAPF9ZzIXOkk+N0prUkq6l+sRJVLoOgzKoIECVDcaVoZs7KY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 17:20:08.8701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8a95f4-6583-4961-0335-08dee9a7cfd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141

The previous code used sprintf() to format a device name into a local
stack buffer and then assigned it to dev->init_name. Since kobject
cleanup can be deferred asynchronously (e.g. when
CONFIG_DEBUG_KOBJECT_RELEASE is enabled), dev_name(dev) could be
accessed after init_one_mc() returns and the stack frame containing the
name buffer is gone, resulting in a use-after-free.

This is fixed by switching to dev_set_name(), which dynamically
allocates and manages the name string internally, but the now-unused
local char name[MC_NAME_LEN] buffer and the MC_NAME_LEN macro are
not needed so remove them.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 3c9eaea5a106..1caaba653fc0 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -70,8 +70,6 @@
 #define XDDR5_BUS_WIDTH_32		1
 #define XDDR5_BUS_WIDTH_16		2
 
-#define MC_NAME_LEN			32
-
 /**
  * struct ecc_error_info - ECC error log information.
  * @burstpos:		Burst position.
@@ -782,7 +780,6 @@ static int init_one_mc(struct mc_priv *priv, int i)
 	u32 num_chans, rank, dwidth, config;
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
-	char name[MC_NAME_LEN];
 	struct device *dev;
 	enum dev_type dt;
 	int rc = -ENOMEM;
@@ -821,9 +818,7 @@ static int init_one_mc(struct mc_priv *priv, int i)
 	if (!dev)
 		return rc;
 
-	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
 
-	dev->init_name = name;
 	dev->release = versal_edac_release;
 	device_initialize(dev);
 
@@ -833,6 +828,10 @@ static int init_one_mc(struct mc_priv *priv, int i)
 		goto err_put_dev;
 	}
 
+	rc = dev_set_name(dev, "versal-net-ddrmc5-edac-%d", i);
+	if (rc)
+		goto err_mc_free;
+
 	rc = device_add(dev);
 	if (rc)
 		goto err_mc_free;
-- 
2.34.1

