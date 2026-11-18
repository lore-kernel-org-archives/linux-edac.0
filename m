Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011758;
	b=jq/VjGrcs/I+91evvfwWgsybAmkjrCRbB80aUU90L41Edg1znA9TUxcwN8A9zEZb0nGv
	 VbyFM7rhffAzRXsASMLXElWbHpMJZEIErlHKqcDI39p8jIauOjwciS6ewQjXyAzuWGpu6
	 UXxDh41W83MKRDPrD8/8ZfangLnQdYTIzyRVtxwlxHbTffOLeOZxncmJn+FEv11SmRSx6
	 A3QkpavwhCuKV+11CGc/0UAa5GFKYyK0pj5G8xjHlzVFbULBr0h1Wqk4HwpY5fkI7Y5sn
	 yPbZidX8ENsRc10XdzyamGzy0Xw6jd+36yCX9HTnkZgvGBWJVzFqgbnvJejEjFrBr4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011758;
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
	bh=4Z5r8JDQOmWjctcosvxnw4qudecDQYRolGbAdOxnHnU=;
	b=0QowjiFPKUpspN/rDRbpfbCOY/X4D48fa8dWstCgER+yt3zebbv6fAsnDXkciK0q7G+h
	 bp1Vsq08YHmGpV2lNmrG9FNCZPvdFWMuzJo5Yt8ZEH4rrD6L3tHKVmBrzRi/nregb2lGd
	 Ibl23neFpUkdP8I8hxoS4OAXWO1IsT6wL4rpnTpIQdJ3e0SHx3xSiju2HDhuRnvaorKKC
	 Fal0UOAPCbj2/jr6bdXnBjUWu0FXV3ImpZsj6ZpQPlyRf6hL+WiFw2CuyFjQfDpi8ptf3
	 6qKF2qizA/yuDm7nEMyrSQeWVxdMq8AcuLJgi7oLtUoXa14RLbR9++ssoBBQZOgLkCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tfF6fdxp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.6
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011006.outbound.protection.outlook.com [52.101.52.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B276606A332;
	Wed, 18 Nov 2026 14:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B276606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tfF6fdxp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJvEBE/bK4tZDn5AgUEM32BcMTG7rTPNzKBxoGET9PIHtsn98+9/1F7gNMNG8ZBrRaFNfAU0CR01+EiQBspOPgxqHZgZPEXiSvRDDWeJDZgt0I8JAJ3/4ezTfZQxFMZMqmDUb+FpqcCWEWNZiLT33145P9EV8dEKWf7jtHRnIHTGpjqekTnWcH68NROaX6TyjLlBi4jgYnXq6rmM4e9nwsZMKoA1hzTYnZIonMeGn4YjME3/5jA6cLiKDH+/6jRR4VMKbBZDVDTC83/du76LLTq9DqNfPAuP/0Ka+PbIhygIBIekafx1Lu5ETFCzFSxHm/Eiy9tkK/CpsT6u97+DRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z5r8JDQOmWjctcosvxnw4qudecDQYRolGbAdOxnHnU=;
 b=KOtfewp3o3teGkvKVieb0jMm6eDbMmDf9PnhReVqEWZDcZSITfOHYsMS9M0PGsrshFLYmOtV7zBm16CDepzVUoj7BhNHiuyQoy4SuBgslsrayY258gsvyYfhi5OtUjWrtNR9OGFLOzePGJaoup6PWaSryt+ENjoDI7EjxwT/T6AMDwP48QAGIjVJuS89jPYXdRJttzT1BcsTRsW1UAozPElJNveNdd3PmczzgqeWZC5PqjdVGfx+RWPyS28snZHK3Vb373om1/ugoLpEwaM0hMk4MJbdQMl1jQGzkdEfh3jAU0qEKNJh6tFemQBb6HUI25UM2R0Ldpa5yV2XUur6tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z5r8JDQOmWjctcosvxnw4qudecDQYRolGbAdOxnHnU=;
 b=tfF6fdxpUz0tx4DVShhkc3oYRFo0BemyGF3g0Q2kR14fsr+U3vL0SUFPjy+ukbtp13hykXEref9m5tncA3zX4hP+AVK7AxBV4eF6Voks5ANNriBbP+jWvZ59YJeducxp+qhAHR2OoARoQHUdxgc6pQ/Avz5/jV5abNRhPm6JEV0=
Received: from CH5PR05CA0015.namprd05.prod.outlook.com (2603:10b6:610:1f0::20)
 by SA1PR12MB5671.namprd12.prod.outlook.com (2603:10b6:806:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:22:32 +0000
Received: from DSM2EPF00000011.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::81) by CH5PR05CA0015.outlook.office365.com
 (2603:10b6:610:1f0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Wed,
 18 Nov 2026 14:22:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DSM2EPF00000011.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:22:32 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:21 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:17 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 01/12] EDAC/versalnet: Fix device_register() error handling in init_one_mc()
Date: Wed, 18 Nov 2026 19:50:25 +0530
Message-ID: <20261118142213.100581-2-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DSM2EPF00000011:EE_|SA1PR12MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5232b9-b25b-45e9-2710-08df457f6241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|261021123027099003|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	m3FYzEp6WuETynfAUOTTFbfMcIQhpTLpVOALe96L5CwgOYurGeing03qNA9WwxHyd2qCNG5D3xvuvZCwWapr8p8kxxgwFoeV47XOyLARxLKlJJ9fLHbLmliJuV8A1UXZ3OcfcbF2SxiTS3S0fhMkOnizQ1AESWB7+gp06taChOPeOOjTDKZ/adU2wfOahAtdwgEwcklieNK7CFaqGXnygOpz5X7MAFKNgqwLBgWjLKXGpme46dFP9CviWfTut2Madpd76QEgmJu9IO8KptWJWRVGz1S2+Z4GIVTmfCU9dl6PwOP7SJo17gPaGm9151ZdB0RXe6X0QB7wNmNU3kCg9R0Hf4OJZvVnB8Roh2RtQwErggKzMjFfWZLm0Nre+jfXKYs7XCVy3erA8VX4tzR34RiH3FS8WmTrfOO1DvL9vl/QQhFKp5NSAnm5OlLeR3s3Wg1o0Ty7vink5SNQz7tEjAcnq/B5V23W4aXGIvHczBGXuDunu/3L+vhEm4L5UGyhkOefmxJKxiulBbxpSemxkLj8k4PZeHon+ZdYXHrqtwkhBd30k7a8Mtsds2vo8P5Pfb2VVdLlMJ0wzrFd5dK61Dr1F8jjsq8tQEd9x7PWppdJy68uggNwApv9Webtbd6x15f31NyR2USjCaTidPqbsprLKN8g9fkUPUgwSvJlHpq46w2QI3ULdI3zZsbDZYm1eVKmOAqpXlxnLK4YBuKCOw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(261021123027099003)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n0aQoRq2Lyb9WC3dCXttt3s3guHluzkjYGbu3DO6yiFUDpVBfCOP2cWfV645rGGmfHUG8WOXZ2EWHvJZPEtEnsDPF6SwyatqKulQn+k1PTeWD0kv1l1csXopQP8uLL2Eal6i9j2yQujC0c5tRt/kT/Zhv0HYEuTZQ3NBqPy76et2VqfhcBQvXQS2MHcrA1fB3/6ojbG8U7NZ/GU39fqGhx36X+b1dr3eLqHdXz6phCwcO4yLHlOFcaC2k3HqSBq80ui35csZM3ROu5yyrplABD7n0LeLWkt1zBQiIFQvP/vy0JEFrk9jjg/hE/1mjkimrlahgK6KkDfMVwyhPBlxYV9q/byTaKwGfdGe+T/AXrBuZMIBksSHThx4bEg5CxeysjopqDolEfFEJ+qOK9B8+m9p4E9PvqdlpvmKm+9hCpZSZqNmxtExh4oRdX5M2lA0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:22:32.0684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5232b9-b25b-45e9-2710-08df457f6241
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DSM2EPF00000011.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5671

From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

When device_register() fails, it must be followed by put_device()
rather than kfree(), because device_register() calls
device_initialize() which sets up the device refcount. The matching
release function versal_edac_release() handles the actual kfree().

To simplify error handling and avoid complex unwinding, split
device_register() into device_initialize() and device_add().
Initialize the device early so put_device() can be used in all
error paths.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Cc: stable@vger.kernel.org
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Co-developed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Add the codeveloped tag and remove the non standard signature
fix the name stack warning

 drivers/edac/versalnet_edac.c | 36 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index eae9fea60db1..89672d4d17c9 100644
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
@@ -777,7 +775,6 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	u32 num_chans, rank, dwidth, config;
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
-	char name[MC_NAME_LEN];
 	struct device *dev;
 	enum dev_type dt;
 	int rc;
@@ -817,28 +814,31 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	if (!dev)
 		return rc;
 
+	dev->release = versal_edac_release;
+	device_initialize(dev);
+
+	rc = dev_set_name(dev, "versal-net-ddrmc5-edac-%d", i);
+	if (rc)
+		goto err_put_dev;
+
+	rc = device_add(dev);
+	if (rc)
+		goto err_put_dev;
+
 	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
 	if (!mci) {
 		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
-		goto err_dev_free;
+		rc = -ENOMEM;
+		goto err_dev_del;
 	}
 
-	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
-
-	dev->init_name = name;
-	dev->release = versal_edac_release;
-
-	rc = device_register(dev);
-	if (rc)
-		goto err_mc_free;
-
 	mci->pdev = dev;
 	mc_init(mci, dev);
 
 	rc = edac_mc_add_mc(mci);
 	if (rc) {
 		edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC core\n", i);
-		goto err_unreg;
+		goto err_mc_free;
 	}
 
 	priv->mci[i] = mci;
@@ -848,12 +848,12 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 
 	return 0;
 
-err_unreg:
-	device_unregister(mci->pdev);
 err_mc_free:
 	edac_mc_free(mci);
-err_dev_free:
-	kfree(dev);
+err_dev_del:
+	device_del(dev);
+err_put_dev:
+	put_device(dev);
 
 	return rc;
 }
-- 
2.44.4

