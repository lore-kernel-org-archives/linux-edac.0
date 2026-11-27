Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797559;
	b=t6NH3cXP1Uscn0Z8eaYiwDHEw2iyuKcMwxM9ewf7B/wGDeYVue+YefubU6ODmpnFATjB
	 +2hugPtWtN2I9uVDL0/eHzdh1KCh+c8NIRa8WTFKDkxLMc15sRmndN+2776j0RYpnykBV
	 xBsj1Fgq4cGUfI9F8dj3/QOx8jqBf2mY76ZC2ImxHfUXjt+81EuNss1yPo4xDEUnUZaPr
	 xf4FdDaEqI3pYDyw6bqSAQGVU7VwLsjc1PKf2eXQ3aYV+R88yfTtlHY/2pk1+/JrghGTq
	 0FLE3AUL0oBBHZBZYXlvGpqng9DG6cBcA9i+LEntN+Ey4n5fgcSPZiIkFq1sopJrHVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797559;
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
	bh=XzuNBii23/z4BtGX++y8wm5JVmtVuurTsTcErGcdYPQ=;
	b=sOJAzj11Qqx5/eCAV3mAcMyWCMyytoDO0STQVydW8qhuN8sxvgSOPSYvU7ekkprOLb1y
	 8vAT1mvshOOw9TkwUCCkpjpmXRv+nnz1UAhN0Jpch/5HDwfjQuVqObrulo8R6X0TCXYyK
	 ECdIRH87IizhxoyqshA2HKnW1U6f688ZCvFng7uMIgMHKoTzmE7bA7tA9LCfSCxOzXLwV
	 zWVjqMbpWHZoTijCe+NjZJgzU+2xa5xxyyMfpy0Z9eWPp/PY3f8TGw2V7O7uFZVT1JyJ4
	 Zr5dfj5tyl0RMcckOxC/2jcdW+nPfhw+Ax9QZlTzCN0NWiE/wmN3y9h0pZbF88iOFCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uGKKPvdC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.20
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010020.outbound.protection.outlook.com [52.101.61.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE59606A338;
	Fri, 27 Nov 2026 16:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE59606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uGKKPvdC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmY4RObAEKopaPRY9zwynSs42nhSDogJCcS5xNkZjOqYYHujw9HCiP068XZIQKkJEOz24gtSEbDW4aSOeJv80C9XLWX5Xlm5IA8wtbe1OYVpoILc/deLVwUjk9PKsCZDkfHtbtRXzBiHrfRtzyX3IiqGnHpjepop7yi1E9MK4RQB78C1m4h3ya5FfsrorIytHLUdtjS9GALobrx7S6D7L/oOecZOOD5zg44nhju4QM6BOa41oABR3/8MnS+slfRyWHkj/no9dWV/HPUQRtth4Mc34oTWKYWd+b+oERYjMTj9i/7Bv24XRjVplKmVQOHYI2RZjHjzyHIAxqLIqOTDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzuNBii23/z4BtGX++y8wm5JVmtVuurTsTcErGcdYPQ=;
 b=dQEoBocIHhFes40jTabieNWZjhg2wgnUMUwhYOABTXja7qjEJAlMRQZShIH/MY9XLrzMqOgdlMdG09GVFNHNu7+l0bdTa6gdkBJr4rZ79lND5DUxZkIj2BHhhSQ1tP+EPdaA2Uhoab2xjLD5rOsskJk9WvdbFNJMsJlpaP2uxh8V82U/hhekhyYTvp6STFdl+IhnPm1zo74TBj2aUo2J5Sq0FaeQKE4poNrhardFRcayfWezR7zSfZxvsBdovTLpgTYlPIzskQ2O8kjl6me4Rqqy5tqf01mc5CPcVnx+3NLjWDedeFoVM8ZiAxEL/H+2W/vY3iT1F31/GhC0BFNr7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzuNBii23/z4BtGX++y8wm5JVmtVuurTsTcErGcdYPQ=;
 b=uGKKPvdCNndm41uRywMRK7dUr7+SBkHsiNUjJrzDBdThrU+7r6AdVcMnpZryHspOmPnEPI8qStL/0i/zGcxBFWhJ+t014H31xPRcyETkr2NeuzqEWcDeRYYdrufDWMsBL9V3rZ44rhDNExQowDz8I7WZ5YUZ97RWLtlw9ELrYns=
Received: from PH7PR17CA0042.namprd17.prod.outlook.com (2603:10b6:510:323::21)
 by PH7PR12MB6633.namprd12.prod.outlook.com (2603:10b6:510:1ff::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Fri, 27 Nov
 2026 16:39:13 +0000
Received: from PH1PEPF00062F2C.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::14) by PH7PR17CA0042.outlook.office365.com
 (2603:10b6:510:323::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 16:39:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH1PEPF00062F2C.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 16:39:13 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:39:11 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 27 Nov 2026 10:39:09 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v3 5/7] EDAC/versalnet: Make get_ddr_config() return errors
Date: Fri, 27 Nov 2026 21:59:14 +0530
Message-ID: <20261127163853.3563991-6-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F2C:EE_|PH7PR12MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: dcafda89-8f98-440c-3667-08df4ca4f89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|22082099003|6133799003|261009223027099003|261026130827099003|261028144727099003|261022115727099003|261021130227099003|56012099006|261021123027099003|261102123227099003|5023799004|11063799006|261021135927099003|261022113327099003|261026140227099003|261026121527099003|261022075727099003|261021121427099003|261022105027099003|261021133027099003|261026135527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	6D5A+nXcTHxLd8foP+r+Cj+I7KtEVkZ4vKp6/NvpQqi4ZaoCjsBOq/P4jLmjaWpQTv3mW77KTMhftDnyia0eDD9xioxYVBtwBlevX19uFaztfAe72QFP1SUEk8wKSCPekF4QGWO+/X/cAC6evr1RS95mDFwFPBHfnstdxlEBMYYOphJPl0qZJFVxLUJS8XEeEgEOIHHGX0+U2AIrdkTyOKPs915QdOCUJLlyfdB4uU1Qt0B5j9wXoxu/DZuCilZ8EZ42+MIRTsVHJEoeg4z699OYXz3wDh2h4XDjzotJHiHCmMFb9aahmhpT68ji0Q323EmUEJur4iO53HZJASuPsGsG4DLWo06AgTIehsK3cZev1rMmMNkWtBeYl2zbUS8FjwMa/tWLlqAbohQQv+pGRA4Ib/Tps0fmqL42jHO889MY5OlVIj5Jlbrxx2UpzIykLyGvOlm7nUXq9owqTMkH9Md06Pr7W6LIdzHIka5p4ulz+8j4rwMzqmScyLgLxlWiCFN+pUNvGGNXFkRtn3OjZE6JQTT8JWnSvGs5mWlV99K+Ha4jkPCRQnbp+v4AGR1ghtYWIarJA3Sac7fQzxbqkFSvHlxv2O1tvAzWqYtHBRgUse+SsSb2vBSbjUPriDsSe9pfqX/ICeyCaq4zxbOCMIJDUTeQ4TyvP4s6FFm9YNgZQaOSNDagysaXLuJ+dqErQeQNigrks3jUg84yk+GkVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(261026130827099003)(261028144727099003)(261022115727099003)(261021130227099003)(56012099006)(261021123027099003)(261102123227099003)(5023799004)(11063799006)(261021135927099003)(261022113327099003)(261026140227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261022105027099003)(261021133027099003)(261026135527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bVtTTXBqGHFcE4noa3Si1BrW70rmB350M1FwnVxPm1epIuE6E+riHYaceHvXtjBaZ7NJAe60oJea3tdcX9x4GoUeXXDzZhNBPrCnsyga5rFcY51HOT3K03RNEiWaqIbuRaxsfMPhLuIeeXJLYr96Bztf+tvApTl4sBIuGGUyvKb4m9jBv7/Wi/Hj+selPHBFJ0FlXHAEILNmMURZIgEOIp/qNrgatiR3XsKR/r641syCenUfkRF+TVVF8vRBJKTH3I4uPRHfYNc+pajsqFWqj/kdNjizo1UtTfDNglm05Ax7iDTJ5xxp2MVnK/pMIzuuoXBakWGdbfoacxzpDBJpGsgJY6U2nVOVXcneXrHNqoepI3O+BG2mg+ITLpXXDxx2aUDraVZWPIguLudmp3ILaAxlS6MVnO44HJa1mZQvOpvqfyJQQRMRzcY9ZEWY5lH2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 16:39:13.8384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcafda89-8f98-440c-3667-08df4ca4f89b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F2C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6633

get_ddr_config() invokes cdx_mcdi_rpc() but ignores its return value,
and proceeds even if the cdx_mcdi_rpc() returned errors. Also it
copies the data out of the response buffer without checking that
the firmware actually returned that much data.

Make get_ddr_config() return an int: propagate cdx_mcdi_rpc()'s
return code on failure, and return -EIO if the response is shorter
than expected. Update mc_probe() to check the return value and bail
out through the existing error path on failure.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v3:
use sizeof outbuf
Add a print for the failure
Reorder the patch

Changes in v2:
New patch added to bailout if the cdx_mcdi_rpc fails.

 drivers/edac/versalnet_edac.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 8c3f8733c049..7d8b8f2ecaea 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -577,7 +577,7 @@ static const struct cdx_mcdi_ops mcdi_ops = {
 	.mcdi_request = mcdi_request,
 };
 
-static void get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
+static int get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
 {
 	size_t outlen;
 	int ret;
@@ -589,9 +589,15 @@ static void get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
 
 	ret = cdx_mcdi_rpc(amd_mcdi, MC_CMD_EDAC_GET_DDR_CONFIG, inbuf, sizeof(inbuf),
 			   outbuf, sizeof(outbuf), &outlen);
-	if (!ret)
-		memcpy(buffer, MCDI_PTR(outbuf, GET_DDR_CONFIG),
-		       (ADEC_NUM * 4));
+	if (ret)
+		return ret;
+
+	if (outlen < sizeof(outbuf))
+		return -EIO;
+
+	memcpy(buffer, MCDI_PTR(outbuf, GET_DDR_CONFIG), (ADEC_NUM * 4));
+
+	return 0;
 }
 
 static int setup_mcdi(struct mc_priv *mc_priv)
@@ -1030,8 +1036,13 @@ static int mc_probe(struct platform_device *pdev)
 
 	priv->mcdi->r5_rproc = rp;
 
-	for (i = 0; i < NUM_CONTROLLERS; i++)
-		get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
+	for (i = 0; i < NUM_CONTROLLERS; i++) {
+		rc = get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
+		if (rc) {
+			dev_err(&pdev->dev, "Failed to get DDR configuration\n");
+			goto err_init;
+		}
+	}
 
 	rc = init_versalnet(priv, pdev);
 	if (rc)
-- 
2.34.1

