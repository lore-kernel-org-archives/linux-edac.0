Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012065.outbound.protection.outlook.com [40.93.195.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9517244C65E;
	Fri, 24 Jul 2026 17:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913619; cv=fail; b=RJLffT9OSqwn8YuAlikgCOS2qLG7+Tkb7Ek9l4XPf6e+iNUsBT7xLergXhstA0S5bE6YIE7qU6QEUuBwiY+5usM04h/MAXf+7CKIWr3u0LDDzAZh0MviGKZdDFEdXYad522MvZ7JHxak2V/ooRgXWguLDnQ+oQ/9sjrscrZd/F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913619; c=relaxed/simple;
	bh=fNdEjDVjA34eL4hFJlvZjb76M9IF08PS0nOInYe8d9o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LoooCcM/22am99etAmdcgzFvdhf6kHO5lfCbki7InrUFRFZ0tJ+7twhpCeziEjuYG5KCsakFEgl/pMrO39DrlsoBfVQx9jEbFu01237L9sQ2xhd+/ykARa9CBwx+iVS/jwzdfUahZAnMmo6ICPL47be9xJ8LEI6kSI/26HKzs9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pyBe1XrW; arc=fail smtp.client-ip=40.93.195.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pyBe1XrW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqe3P01hHBLhqXdweeUquPpyFiIZvxkA2us+OUU60YXSOlFR5R0wuka7FF9+nW9WVrs9QkxBNYY6MUXh207ib+r/95/dQZ03tAqZU8gdA6Iu2trz9sK7n+r+uotPA1OJGAt1sgZ33/7U/t5Lx/Nt64bFhZqBY6uegbz7pNvdjrBDhpMip1bMJFcw5Yo+77YWLE8lGhr/9Ah8EwxR43cS3THiEnentNpswGTjkCM5YQq9v8PW1+23gU1DsmomNmJXt+wuVY1Txsob7mZYCk5ItyeJHKgCOq9spFzw4ysRULlF+QE3cFYDhQkebkbPFNFRB4io++Hn4tur8DrcmcnyPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3tInHeKqpigzeyDz0g/wvDU+vaKygYEx1sN8kplLlM=;
 b=xAeaMr9hw79AYtFI3hsxiigZUJbkM14Zb2zuIBPrAO0H+oxtOhw3KT3IztJW8f736rj7K0/kX/DNGz6zigos/es8NmL92BoEa9M7mwdk2ZWU0LuOQ4y4kMxaGHEtjEDGz6d16KgvWeoLZYN3kJ00nltBUOpukFaM9ec+IGuWu+0hoSafm7niOcMvD2r4+HaPV1O1jRWxaA8ILuO6r7tf9k/sHyiIt6a8hyqP2xfyefFS1Yr4wOF1tMs7tECdf/nKbW4R3Za6FYD58eb08Vj106+znW/8DO5UPW5EajIt0E2srEVhmal84Gzg7sc7wuWxBUYYYV/tEB8KHuJ2VsDQnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3tInHeKqpigzeyDz0g/wvDU+vaKygYEx1sN8kplLlM=;
 b=pyBe1XrWbDGc2hrLqqkGys7hcOOQbOqFfUW5CBmO11iQX/Ndar7MP3PSIMTMuH3iyagdhsmuZHRzJe/HUPAaCkHhdozVNvGwKnE6M91Ni0WJkLHMNy6ekwJPH+PchRZXNyrieJjD0OQDTqnT14/BsUTbm84uu56GFmc8tag+9oQ=
Received: from PH7P221CA0071.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::24)
 by PH0PR12MB8006.namprd12.prod.outlook.com (2603:10b6:510:28d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 17:20:08 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:510:328:cafe::71) by PH7P221CA0071.outlook.office365.com
 (2603:10b6:510:328::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 17:20:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 17:20:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:20:04 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:20:03 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 12:20:01 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/9] EDAC/versalnet: Initialize MCDI before RPMsg registration
Date: Fri, 24 Jul 2026 22:49:42 +0530
Message-ID: <20260724171945.2812749-7-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|PH0PR12MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 98096c65-53ba-4fb7-5377-08dee9a7ceef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info:
	GOv/IAoOLWN1uVyJx78WnziNTUoAMlDGyYY7XmODYWdGADwX5PDxEne2FbIi2PlYcXndx/fGt7Cg17MIvedfGmxNG7EJq90xxTornrsM9JhBHK4QY8JQaWuAAzfvU6d3QnZAsxKwy9cK8c++2ZkPKiPcb3KZgpxScWY7uefjY3NMt344+6ECbl1ICWPO2ecjTTr/5dluWJCD5Yie7bPiKPNukq9EU9nYniMeYE4T0OKW2H2uE5Qg2q0O8Tykdj1A4SlY9/1A8z4bHvdJGBAJqZyoWtjBzdsNJ87oRqgfHqf1leyGa9U3B0Z6dUAZBqwh0q0v8NTUdOf+XD9l0X1CvMilA/KD14zTYc7Swp7RFz8HxlI5eYvRhC4N4IlZ1Wji8Gl1mPAprxXeQM5Qa8/uHkQ1QeNx2ogxZSyXJ3COvI1SkzXWpuKB+ZSjh8ZOPxVWlCe8w1DPNUb5lJWJoDRCSuz+MI+J63nIvZgz5eq2j1qOxDvItmAYdZIG1cz08CBi0zXn8dyPgByeU9nh/Xfhh1nKaGBL/RtMdkw9gSAh5hjZnwElGaylSMBR/ihJD87gtNcCG8Erg4v1FN4HnAVpQfNvDbixBLMTe987ZQztOylgGPFLzbrcM8rtzqz6fPg+KT1td6g78Rhox0VXnczD8JFSrralRtthyr84jAf16zz6Ls4578duhEZd/Wxb4uJHH0Gl/vUkGE2GYpIhpPgcxQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FNtUAIOyxkFCbSB/dtu3YGQ/JMCwmfL1+hcRxRN8h9IJ/ECJmZUpyvkKa88bL3qJDyW8FbR/GJ0M+ddCj59AeBoXouGhHIG8/I69TVCiahgXs2kjV84/CA4tiwy/KBIhbXyOPPPTAE8XwodqR2k5nJaxW3JPG4m+48W9SMsY/w2OzJzXp+sO4eKeElczMqrxlysbo8HVPttnU89lw+mk3T+r3cyxk26eURoNR0wDsu3Ysf6t8DQQdNztAPsPz0ttFth8wEjNPa72TH75M/dPb3UQSeTixu+wH4yiLkdiacLY3ASkE+uEaFjuzTDIAE0gGp5VQsbzFIP+rn8+6A4lZjPn+iqKbDqZ8KOXOX1fPQa9dYoLrhlyKGsZJti+qA8IcAQTXW7kDWUkWJK+uArw+dGA66/vGM0h+9LZugK1jgoprVOCEQ6jbl5QchBQrsau
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 17:20:07.3370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98096c65-53ba-4fb7-5377-08dee9a7ceef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8006

setup_mcdi() currently allocates the MCDI instance, assigns the RPMsg
endpoint, and retrieves DDR configuration data. The DDR configuration
path invokes cdx_mcdi_rpc(), which requires a functional RPMsg endpoint.

Split setup_mcdi() so that only MCDI allocation and initialization are
performed before RPMsg registration. Move endpoint assignment and DDR
configuration retrieval until after register_rpmsg_driver() succeeds.
Update the error paths to match the new initialization order, ensuring
resources are released in reverse order of acquisition.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 1caaba653fc0..e9561242f292 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -559,7 +559,7 @@ static void get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
 static int setup_mcdi(struct mc_priv *mc_priv)
 {
 	struct cdx_mcdi *amd_mcdi;
-	int ret, i;
+	int ret;
 
 	amd_mcdi = kzalloc_obj(*amd_mcdi);
 	if (!amd_mcdi)
@@ -572,12 +572,7 @@ static int setup_mcdi(struct mc_priv *mc_priv)
 		return ret;
 	}
 
-	amd_mcdi->ept = mc_priv->ept;
 	mc_priv->mcdi = amd_mcdi;
-
-	for (i = 0; i < NUM_CONTROLLERS; i++)
-		get_ddr_config(i, &mc_priv->adec[ADEC_NUM * i], amd_mcdi);
-
 	return 0;
 }
 
@@ -886,7 +881,7 @@ static int mc_probe(struct platform_device *pdev)
 {
 	struct mc_priv *priv;
 	struct rproc *rp;
-	int rc;
+	int rc, i;
 
 	struct device_node *r5_core_node __free(device_node) =
 		of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
@@ -914,18 +909,22 @@ static int mc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
 
+	rc = setup_mcdi(priv);
+	if (rc)
+		goto err_alloc;
+
 	rc = register_rpmsg_driver(&amd_rpmsg_driver);
 	if (rc) {
 		edac_printk(KERN_ERR, EDAC_MC, "Failed to register RPMsg driver: %d\n", rc);
-		goto err_alloc;
-	}
-
-	rc = setup_mcdi(priv);
-	if (rc)
 		goto err_unreg;
+	}
 
+	priv->mcdi->ept = priv->ept;
 	priv->mcdi->r5_rproc = rp;
 
+	for (i = 0; i < NUM_CONTROLLERS; i++)
+		get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
+
 	rc = init_versalnet(priv);
 	if (rc)
 		goto err_init;
@@ -933,11 +932,11 @@ static int mc_probe(struct platform_device *pdev)
 	return 0;
 
 err_init:
-	cdx_mcdi_finish(priv->mcdi);
-	kfree(priv->mcdi);
+	unregister_rpmsg_driver(&amd_rpmsg_driver);
 
 err_unreg:
-	unregister_rpmsg_driver(&amd_rpmsg_driver);
+	cdx_mcdi_finish(priv->mcdi);
+	kfree(priv->mcdi);
 
 err_alloc:
 	rproc_shutdown(rp);
-- 
2.34.1

