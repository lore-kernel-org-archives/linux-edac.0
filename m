Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011897;
	b=tXfNzLtn2XWqzu5UjQV1gBCTdMtMmm1etx+KugPTAxVF75s1PEBHUeeQTZ/lCh/6yRc2
	 i7reL6r7Xf0SKRp3b9QiGL8EgXVhYkZNlVTOLzQksI5/tfDFsjiSIZgp0K7NGFT152RKi
	 i7x7zpBeySebQA1c6PNuJJOYrSMWAKJNVo3Fs+Tu0aXbNrsCPUAbUVhrKahDw6kVfsVon
	 8JYbIhinrzyD0Srt13T55uq9916ADg0CmhgKz6U+Uc7UwUkbk+o7w0Z4hJVrpPQHeYZo5
	 e2VLBGQSkBUl8UgiPfaaEae+4yXBBUZnvNASEfuFMePIZiqXduQKu4475lhlW9F7ZoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011897;
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
	bh=RqV7LP9ba1P54pPHYajDUtPCHJfg5remymdzfWly62Y=;
	b=i2tscWfBovSg3gTUJkgADCnEBwKm1BWjD2dRcGA76DlVMsuDHULnoI55HVoBfBoRxCQ6
	 RTGb4N4s/eoyFaNjh6xpUUj/dp863rgx0wFSxTCatr2ootCYyQaCBS6Qi1LTJoDWMKAMs
	 HATerLutuUzYo5fwvewMW/c8zw3QDV+drB6+mEDbDbjOD/JHwcn37jvWFGoc1EuAycGe2
	 XzYHFh2xg0r9xgQPLcQtZqpw6nS/3D6d0yEaGIpR+z5boxGQa5iKQnLNdbXl6lZ0N89Am
	 mymXqA+7sHvzRj1kvM2jwJoyOomJPELWVjVefNTqJG3wW5BNd39lwaCDtvhYb7hP5Hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="3/6nM2xU";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.12
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A1960A2600;
	Wed, 18 Nov 2026 14:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94A1960A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3/6nM2xU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTUEXcmBTBejGzRl6z3urgZfXq7ESkhMoLUToV66aqLqEgdbv2/sWr11zLh96fkuZC3hU2/yXgvw6IIpBmL9HiBDnuK22Qw3I8uw8KiGhBAChYON3cwqU6wsWcLLeLBYkNvHeLVG1oVdjrvMX6lymaqaQ+mDlgvLaXg8XdTzkVdBIkxD0WDgqEbBufSTsiCCk9P9YSAyBsOPUEdVBcV1D4ZwUNpHV+fGhzck9zHlhQ9qpzH46NDHM6Numyt2YD2CiHpc7k2qePTuoGuZdd776IWGyxL/2aV9mPCvEvYSL+mg/tEmKeC2alYjULPzEcyOpMDnt6FXBersk2R1I1qb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqV7LP9ba1P54pPHYajDUtPCHJfg5remymdzfWly62Y=;
 b=uJyirDJiqN8QhuSz7LO7e8CeCWcFlYLccgBCEwqCkqUh8LG7D9UezGB6j2yrSom8rFbhq4AQLC53MAqbVwmZslpo3CknXJaG/l1l6tvF8e4gvEAQtkrB1tOq//LoTcGwpjkLoEU0lAlr2X14Cwy6rmc1d4v0Bei7oQOmESovVWhGuuLndmMQqd0gurmpi0Ngo1SBEDa0yEbL4urCe8idnsrP6KuLptgquos9fmO2QgIujebPBC+HwAkmp9xFannv4e9ytmdQuCzbCWgzVp5T6HVRhRreO7x+dTiOYDWANPPq7kXna8quAD+u3H97xsaRdeIuYEFpy9Cn/AolH9Z3ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqV7LP9ba1P54pPHYajDUtPCHJfg5remymdzfWly62Y=;
 b=3/6nM2xUrujR285vCyZjGZighLHHuukBe4TWtBKdpKGLOFBtnX/fzS21lSff1NWVMzYC8fcnwkDOE1PX0KKWa4qbqJ4oynWJgmomLXRWPpsbqZqCJXgRh4S9YWh2YcI3TBpsrcmEz7UibzCOtQ31KwilbCipzlqII46k/T7hVJY=
Received: from PH8PR15CA0016.namprd15.prod.outlook.com (2603:10b6:510:2d2::26)
 by DSVPR12MB922022.namprd12.prod.outlook.com (2603:10b6:8:3e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:22:47 +0000
Received: from BY1PEPF000264B6.namprd02.prod.outlook.com
 (2603:10b6:510:2d2:cafe::50) by PH8PR15CA0016.outlook.office365.com
 (2603:10b6:510:2d2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 14:22:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B6.mail.protection.outlook.com (10.167.242.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:22:46 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:44 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:41 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 07/12] EDAC/versalnet: Initialize MCDI before RPMsg registration
Date: Wed, 18 Nov 2026 19:50:31 +0530
Message-ID: <20261118142213.100581-8-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B6:EE_|DSVPR12MB922022:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1a5349-8fac-48a8-16a1-08df457f6ad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|5023799004|261021123027099003|261022075727099003|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gUKMK8hm6y8d5f55wqEQxQmlNu1rNj+VfVUP9kcJYdOGTcUEX7yQ5rel0kpNiRl+CardI/I6S9CPBDLwxBdgaIIWDM4q3gHtr5F9gtlct9fprwYvz1JDwrmSHz3LzRbj1hG2TmySoES7V2F4rUujWxEFBL8LBLPEk3J0xt1Kie46BnGMroHZxIKagSgYHK4OpKKop/+68KQ7FekWU+En2hIhNLyzD18cLPMJcO/NmF8lTNL387/lQxW1Kg244d5B73EF8GvjK7mHVnLeCdp3z7uVqIbARi7CXT6xO/Pm75h9gd638sdGJut6yt60Z8b+WMdp6XShv4HsLyG5YxXq+Zway7Ug2YriN2XREzvip4tymujAUl5XdOu7lJejpgeptU3QLbOQFJB9i7TTW4DpCjDRBZuS50gJRcu3q606ZOi7uBMjHDwhzTCwW8KaBc6njQ3MCAIfsJcSBgjM58TD0ezZdCkERop7EJMahtGIyspLG1a+ohE9SvY9o0JSVq+p35kYgBxelMQyPGNYTlZDMOv3rLOtaniiVSXVYzvDOKu7scYQuNEoxBLcur7FG5EfnBXasSraPgephS3RiYXxLfdc9Ri8Q/5mfdnX7BCxmU4UNB48f77L5mZln00eMDP/JD7h7uBwt0RcZe/l8zN5u0hBGsVcKZtnBflylmd4OYwPTmmW/eO7aa4VGYFQD1/VOW5c/oAVUFG/5aF3kuCqtA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(5023799004)(261021123027099003)(261022075727099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2GoUKzyDtjydOSi29PFq5Z1VIVh3ZGDeHDBV7xru6VwIBlXB1ANIpGEbq0ZjftPx33zA1XhoQ1pKhB2RaZ+0oJn2KYqcuFrrWxV3NS0pY6QUDvlGz2g5ZhW6IfAdMpGivtMo5jWI8csumXB8dwIgc3sEg5sjSF9Z6Sz9byIs0Ez7YtaOV3K3qHj3I4eLMJF1E27eUxA5ZTDTj6QnMj0hPCh/Y6kCwsPXcmbnnuSUJPZ7B+6QQPKIWHqaj6Rm9VNvmtbRLGMHqSm8RGw8J6TNo5ptkM0H5hWEoh52b2n9MaQbSTuvDsUHYnP8/SS07IQlLTW0cDHrpLMM1inYRAy+TxXFFcCcoPwp4HO1uuQs1R3SdrXnt+D09jCzXfOKBX+5KPtxI2FrxkYvYoGDSG7YUBY0L/ZjeYB9JcF7cIvtlkcrD8UNRx05NllyE+e0r94O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:22:46.4021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1a5349-8fac-48a8-16a1-08df457f6ad6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB922022

setup_mcdi() currently allocates the MCDI instance, assigns the RPMsg
endpoint, and retrieves DDR configuration data. The DDR configuration
path invokes cdx_mcdi_rpc(), which requires a functional RPMsg endpoint.

Split setup_mcdi() so that only MCDI allocation and initialization are
performed before RPMsg registration. Update the error paths to match
the new initialization order, ensuring resources are released in
reverse order of acquisition.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Update the labels
this fixes the sashiko comment
"register_rpmsg_driver() exposes the callback endpoint before setup_mcdi()
initializes the mcdi pointer. Could this lead to a NULL pointer dereference
if a response arrives early?"

 drivers/edac/versalnet_edac.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 90918293f76d..046293d54d40 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -605,7 +605,7 @@ static void get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
 static int setup_mcdi(struct mc_priv *mc_priv)
 {
 	struct cdx_mcdi *amd_mcdi;
-	int ret, i;
+	int ret;
 
 	amd_mcdi = kzalloc_obj(*amd_mcdi);
 	if (!amd_mcdi)
@@ -618,12 +618,8 @@ static int setup_mcdi(struct mc_priv *mc_priv)
 		return ret;
 	}
 
-	amd_mcdi->ept = mc_priv->ept;
 	mc_priv->mcdi = amd_mcdi;
 
-	for (i = 0; i < NUM_CONTROLLERS; i++)
-		get_ddr_config(i, &mc_priv->adec[ADEC_NUM * i], amd_mcdi);
-
 	return 0;
 }
 
@@ -978,7 +974,7 @@ static int mc_probe(struct platform_device *pdev)
 {
 	struct mc_priv *priv;
 	struct rproc *rp;
-	int rc;
+	int rc, i;
 
 	struct device_node *r5_core_node __free(device_node) =
 		of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
@@ -1008,16 +1004,16 @@ static int mc_probe(struct platform_device *pdev)
 	init_completion(&priv->rpmsg_ready);
 	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
 
+	rc = setup_mcdi(priv);
+	if (rc)
+		goto err_alloc;
+
 	rc = register_rpmsg_driver(&amd_rpmsg_driver);
 	if (rc) {
 		edac_printk(KERN_ERR, EDAC_MC, "Failed to register RPMsg driver: %d\n", rc);
-		goto err_alloc;
+		goto err_reg;
 	}
 
-	rc = setup_mcdi(priv);
-	if (rc)
-		goto err_unreg;
-
 	if (!wait_for_completion_timeout(&priv->rpmsg_ready, MCDI_RPC_TIMEOUT)) {
 		dev_err(&pdev->dev, "Timed out waiting for RPMsg endpoint\n");
 		rc = -ENODEV;
@@ -1026,6 +1022,9 @@ static int mc_probe(struct platform_device *pdev)
 
 	priv->mcdi->r5_rproc = rp;
 
+	for (i = 0; i < NUM_CONTROLLERS; i++)
+		get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
+
 	rc = init_versalnet(priv, pdev);
 	if (rc)
 		goto err_init;
@@ -1040,12 +1039,12 @@ static int mc_probe(struct platform_device *pdev)
 	return 0;
 
 err_init:
+	unregister_rpmsg_driver(&amd_rpmsg_driver);
+
+err_reg:
 	cdx_mcdi_finish(priv->mcdi);
 	kfree(priv->mcdi);
 
-err_unreg:
-	unregister_rpmsg_driver(&amd_rpmsg_driver);
-
 err_alloc:
 	rproc_shutdown(rp);
 
-- 
2.44.4

