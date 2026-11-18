Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011777;
	b=C0K/SaaeWP1L9ij9O+EOocJ1vdWTd/Vt7lAJupxm0ajX7inw6ivDlIC/WFkfPU9JbSo+
	 +e2KS88H7iB/zv/zAfTcMPFNW0YjOlgkH3cLksIf5pq5yMTCHWRmyoadojikKfe8jK/Gb
	 Y8dFxr2mPicc+rsOY52zthq4gS57WLkNBKmODSLrD3gQhBVNj/uUoiBex3doNI9YxYnOx
	 nDbWFMc2aN3xTGDYk2wdHAL+t2u4/VwCR81/MRDft5LOoga9Bg0wufQzbxCZxgz9CMLeS
	 adJEs+HG2UY3o1QBBxEGfLRJuziuIplQhlDDvXXtaSfhCcmryNVjcG6Alkj7Q7a03Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011777;
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
	bh=1byg2C8/tGIXS/6rg8iwCOgBxUMvgN6jSW1hmI5cR3s=;
	b=PTrat0r25U2EaJskVWG4PnMG7jk533aEX7cQygPQaq/8rEV2eI90bhkrwQmuo7VS1M/a
	 X9q9So9HOx88rm8Z5lNUqi5m/ruAVO4lIP/gCnG/XEd/s1OXcYnsiKKfZxx7DCL19Atgi
	 IYix1lsY609ZURc58EwPzZyYKBwtXBqtvwLqscEm6tjQikri7UYPTHPRbDqJcIFmWLTZ1
	 5zAIgkNcxHWabjKGzYemszAgke/SdEfjFqZaBLQ3QL7vb0S4C/g37bo7w1ceRu08Ewjgg
	 9AMXG41aPDEuZF394u8JT7XicbqTB4UZhvTJqnwojnV3Mef6IL+HSMpf95p9eJo91kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1Nx5Crl4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.64
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010064.outbound.protection.outlook.com [52.101.193.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E8606A332;
	Wed, 18 Nov 2026 14:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14E8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1Nx5Crl4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBWUqlTpCKIRp+etG/uCgR0BM+GJNGY+0rLHzFLoVf/3EegN+/8Tj+1s6qfG0YrHAk6rf3dsRGaRocgJaTKctdLoqtdTJiD9053Y+NBQZ4e5lA1XciSpltUtU7/KQ+wOfirIOvyB4lkOK0UOCQBTXktnJIavJ8APRPg00kcBCt6WJpfsX0wYCwzQXtW5WmmT7wEtSaadzU9GVIBK7+y7t/HFLtRKcP8YxHCgUxjEF5ZC4vYbqV04vogB8YOFG33vZoCEkB8oi9USuKlfYVWcQnNRP3HuvheO6BFz0EyXX7a4j7G8O8tHA0jQI5JwhSBO+5I349OllRvzb7S/YgrY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1byg2C8/tGIXS/6rg8iwCOgBxUMvgN6jSW1hmI5cR3s=;
 b=QrFSS+pKWr270KbL5aqdGYB5vLqkABJjtnXQ7HjWTJ7qvBt55HYtA62A9sSGrPzbTE9bAzSzBj+XAUIws0PIg7QZpo3bfcsAlC1obfLuyy0oGw8p9DzGrurRTthRymzXPDHLMrZ6bGTUO6OSibTzMN80QqjUDlFCf3JKMcnQQUF7SDFpcY8Qezknmu6IuewZbldJCB1yBXss4gT1hYUDU9RTjHgsRVfeSN+ntcpeb8S6jhBIfFF4ychgyMJGAc2vC/6bEKZQWsOuIbST1kHQqfyTeFHEW97+mxsgjLEvvonij0/o7YYDvS5fZqrbAwUaFwUBH+RxZCdkp6JL0xEcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1byg2C8/tGIXS/6rg8iwCOgBxUMvgN6jSW1hmI5cR3s=;
 b=1Nx5Crl46Nis43nWqm2KIm+zj7ov87E7IB55T92E1Xw5Ul1j/cyaf4EU0GUoGz3AVQk9ysZx8km9Upg8cT9pvot9G4dUPFZyiwo2g0AShAgdmo7uWCocJtCd5v2eR9EPgervm4UxzHndsaY9um/OP2MmlA4RAxCKzX06gFepJng=
Received: from MN2PR05CA0048.namprd05.prod.outlook.com (2603:10b6:208:236::17)
 by CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:22:50 +0000
Received: from BN7PEPF000000A9.namprd05.prod.outlook.com
 (2603:10b6:208:236:cafe::1a) by MN2PR05CA0048.outlook.office365.com
 (2603:10b6:208:236::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Wed, 18
 Nov 2026 14:22:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A9.mail.protection.outlook.com (10.167.245.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:22:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:49 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:48 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:45 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 08/12] EDAC/versalnet: Guard against NULL drvdata in rpmsg_cb()
Date: Wed, 18 Nov 2026 19:50:32 +0530
Message-ID: <20261118142213.100581-9-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A9:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b63a72-5f20-44f8-3fb2-08df457f6cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|261022113327099003|10067099003|261022075727099003|11063799006|56012099006|261021121427099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QN2/f/QNKLih3s3WDlw3JiaqP397+UN8WGv9q3XFuNqIlfr8F9RENcXVGg4pBjRvN1yj9n43tOjX0GxNlnGsI70s7JkFCw7draS14qRXlP40lYFSTo+d1TYtZ5gPlTqAIuZxbAKA/wSKWTawnCJyNLmAZpsMfI/9OahBmqcJSG6SrEKhjCdUeC+QF/FEjibeJtF7oTELFSqOQct51XGcjgS1oKBOwNj6R0e8bXhwCHNWP+MOhRozi0WDGcbhEC1U4E9dNqE3b8fVJNSg2UUrjWuYT71eBRyxl8VpZYBD4DnZwLuMXfYLRc2wOmY0uR/mVQh2akguiszIBVjEEyHRcJIxT1y1JBqh8NJTPvnoyjEtBi+3Q7U7EWMG9HkPR7uu4pE7Zea4vxCNgQ+co7zXpeLc8S7VMIsj3D/5xWa7Mr8pnjT9TSNa8k6an1GgaGtaiVjeP0isfm+nlmttsOTfnwAVLabeGeWYtnTHtbGuBnn+z22i4O1xMmKArShdp+UWHkqD+yocS29fCD5ciMFHMVz6v5zjuEPIk8Dx79zkH/oukXi2DQRWbf65Kt4y8FatYQ3QIx9cfaQnlMb04CXe3bHIZxvuaowT1TIFr0xUNzmiH468WzqNltJDYmKU0n1xaGDsdYE8ZZ8Wike+CUGDg+JAyfn8py4NHSbRlNvrWR/ag0IqqiWS90cCmldLvZmyrQuhzNxZdVM0JJwvhT3rGg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(261022113327099003)(10067099003)(261022075727099003)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kS6AiydKaTFcRwc7V+p3JfPBRrhc9iU4JOsDn+sTpogj/X/AK6w0RdVpXHLnUItiFy5DVVuBvIwdmRgn/hh8hzCXYUjIvdiEEFktvf/R/ds/Lkas0+/pjpL6jO7fb32QYFSb/f3NvEU3E5nDAwGAD3VHjhcl429luYYSDoIPAYP0U12CqXG7CFCsfBZ5T60FpAgfgx5juu/NuXX9YMxugZfhJVYiG2+2xgW1CldIayoyK1y72DJLehp/mW0/sVcgngaNLqkzJVwPsGHDgAFOwQ06+qAFpNDswadG60NQwG/NRDMhb4/YDIIlEFuGSf9xO8zS7BNgfhSzwnxaihDRUA3rzAFjmFU/NMeSxJgRkBf+XrbBQBOkx5GtNgEaGIVctxrb//SFGS0aEiR+oB0mB10WLwItCDdcumFfxfVIKH92ki1HnLOTKMZK+1D8Y+1O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:22:50.0653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b63a72-5f20-44f8-3fb2-08df457f6cf5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9651

The rpmsg core creates its own endpoint bound to rpmsg_cb() in
rpmsg_dev_probe(), before rpmsg_probe() runs and attaches mc_priv via
dev_set_drvdata(). A message dispatched to that endpoint in that
window would dereference a NULL mc_priv and crash.

The same race exists on the teardown side: rpmsg_dev_remove() calls
rpmsg_remove() first, which clears drvdata back to NULL, and only
destroys the core's default endpoint afterwards. A message arriving
in that window reaches rpmsg_cb() with drvdata already NULL.

Check for a NULL mc_priv in rpmsg_cb() and drop the message instead
of crashing, in either window.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Patch addition for the rpmsg drvdata race

 drivers/edac/versalnet_edac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 046293d54d40..1a327a2dbda7 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -639,6 +639,12 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 	const char *err_str;
 	u32 *adec_data;
 
+	if (!mc_priv) {
+		dev_warn_ratelimited(&rpdev->dev,
+				     "Dropping rpmsg message, driver not ready or being removed\n");
+		return 0;
+	}
+
 	if (*(u8 *)data == MCDI_RESPONSE) {
 		cdx_mcdi_process_cmd(mc_priv->mcdi, (struct cdx_dword *)data, len);
 		return 0;
-- 
2.44.4

