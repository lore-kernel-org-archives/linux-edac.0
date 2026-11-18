Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011786;
	b=PFmUG726t2N2Yipw54u8okTZ1ldp6mHE9ua/4wKJixZEnkl5i6Yw6fepJyAuit26IdiJ
	 liBOwpEJwTGZok3g0y8JM5EHp3Tovkyn3uM/8T6OnksJEJsr5rYBfQ0ZWTL9ZBjvDzK+2
	 MsoUgzkF59xiJuFCsV/KoDy0jDFcmfIScIU7zvely8fkUxhojDLpkbEfftedHsnTY7in/
	 brYBiXdUWOQ9ZUK4FYiaOdI9K+NYlr6IghVE+3PMRAd3gifEC16luAShBSJqihSoRLU1/
	 MurWAYZhxFk+x5LbsvmETfoHmlAjEFbEl5IKXTueJ1p0AuujjfFjgYojW73WX3O1WQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011786;
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
	bh=L504tfyeR+6NIjMJGb8jqHe8jUQLi6SwtqNLfhzVgmQ=;
	b=IVT6cquVNepIfPhs4AEoVVlJmhhIrKnb2nezqxxNoXXFn2KymN7Rz2joHzkermvl5zp9
	 E9/UN6IDryceid7VYaTLNod3PMQOVKNO/ZLK1/RNlvXvjkLpPfvP9xaC1Ng3q/hgaSx3v
	 P4rvxyJsfyCIUyhUHOEd8b3Max44k9uv7QXVxT5IEA7UrvEgQKMXN25ngwGPG4zb5DLTi
	 htCd+ttfl6QNgLfDwGwzReL5D65KtzO2+Sm4z7CADgPaAh3mJh37egliJykE1Y+rO8Mx/
	 qVdo4MY364RQJJu+HdI8OVjVeB9x50flSEuaSLm1T4TEaCQVZYtGyinlM7RSShc84mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gNhvCgHR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.54
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3398E606A32F;
	Wed, 18 Nov 2026 14:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3398E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gNhvCgHR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiAA/UVNopwAue60iqlEd5fnxzXm9UWTL2LUWIX8vSe1DlXgUar4a76KO01/NzmDfwXGvKZ1cH2QA4Hsz/3p0dgj+fgeh86p0TL+6JrT1Oxo4dExzURpwInn4DNzXcpbUj1ZIM4NSh8coFz62+KCG+vUJLCLl0fdWhiX/AYXZVYj/mdqu17yM+9SZCSedokPeOv2JkBiEtyA1Yc1GRb8l36no+KEk0Rw8ogXfeKInZfSF3xDTLCVm85QdvOVhuHkYWDSBYVWkDwDy2ENMDPd6reiOCJUR1PXvD6O30U1kJYjeCOYbnPjxAIAkQrDMY4P5vMuuHNtIcwMgFebitSB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L504tfyeR+6NIjMJGb8jqHe8jUQLi6SwtqNLfhzVgmQ=;
 b=qmH/n8HwV4jrr+KDdd7OV/7G9n0azGlRw7KgGqO8IZLpEkqjQrA661G/LRkczd4bsPTEb8uPoBvk/m1fyhMNsSk8aAJI4Ae50j418h1zd1ViXrFEuMN9sSiH5wUao6xGtPW/4uGZUzL2Ouq3mgj/5H9SdqqioZQ1slPyMdHTFJHBBSdhxPDJc1QGtLl3xdpSKlzh13/ZTFXIkP5g6G4vyVYJK8MqYUqJFO2jLj5olkued45/XCuC+FxxEeiW9JHRcwRxZNgfLE2EYkSaMIYVbwbfM/D7wIwMEifxPpF9yv5uj17nUljTm7CeBbthIdvA0SLNxl5CCeh+5qhoSUdqpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L504tfyeR+6NIjMJGb8jqHe8jUQLi6SwtqNLfhzVgmQ=;
 b=gNhvCgHRxWOjp1dEU8ZUGSqKR43YWL3VzRYK2+OeX0619jYWN7P0loLqE4LzCxGCOlzXq7I9KMnSXPNVoZfKoUvKMj+uVd1highIfF0ImvIYPyQaQYldhoYz4PpvyU7U/QkgI0DGQDZEGe4NznVUPAkH6W6K42bpbNZApvRTlAc=
Received: from CH0PR03CA0120.namprd03.prod.outlook.com (2603:10b6:610:cd::35)
 by DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 14:23:02 +0000
Received: from BN7PEPF000000AA.namprd05.prod.outlook.com
 (2603:10b6:610:cd:cafe::1d) by CH0PR03CA0120.outlook.office365.com
 (2603:10b6:610:cd::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:23:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000AA.mail.protection.outlook.com (10.167.245.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:23:01 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:23:00 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:57 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 11/12] EDAC/versalnet: use device tree property for number of controllers
Date: Wed, 18 Nov 2026 19:50:35 +0530
Message-ID: <20261118142213.100581-12-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AA:EE_|DS0PR12MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: d8bbff9c-673e-4ac2-d177-08df457f73e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|261021123027099003|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	up0bfx7XxfjNLrDCSB6JIXQLmuDNGtw/Aw7NBdEW2N163a1Ty7F3DoRuAheC3c4yMHm4w5zy7AIiQ5nCu4fsjipf+UrtMPW26hC3TsYjzTnAVrE2hXoZzvYcGZvYsjYrYtRZ0D0aDZeAN4Vn6jktAPTtzLxqXtrPVSMN2VnxsFCsqNRXp+wFiSe8EW2L5ahMcfQUq2XVYrkt39J8zh2qw9wfOS02ciV05tuc6AHP7mDbDMTb7vgedvsfiRf6blech9Vblvi2+RMETq9HJvnXRBP6VfWicJaIckxqdz9GQ29N7vKA7BtBJ8gtVKN82/Bupa8GFN13fJFlNuDOtPHsGi8GsXT2A9Na8tHTYJ2+BvyL1HwsSUh/lez3+SD6DZ6n8LypyHrMRNRL2obDInAbRbKsMmsru5xldbAeVCCTU78VN/QJmGLOdainwU4eucKkM5zit+F4pWys2N4VT3+m0RqE3EFYHIUcREBWmKharU9NlToYwhdhehP+2ceHLutlpJzzKE1FnlnzP8e+xDOvU6gXaNcmH5JbEkx1CqjH0ptPDpubba+2PQ2BBBH8kV7shB6UMmUOaJXMq83JNulxQ/yJPaRa8rCoE2CPChIYy78CsfJbVqg8LRiAsEMC1BfeFv9Ps91CI5BH6eyyu+I2/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(261021123027099003)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fd0yBkg1bC+MgBrRIpqIGdO6zEGtdLZgbHxKxkYHLZqBfMWbiDy2esE18CIxm2JChJk7eQiRI6sInrjRy7T2sOthKqzy9vidZGlusOPJEyCwhgoplx+5S3hkkQF1jJM5KB+vJmf0l/ZFVIPff6OY8IJJ5FxbajKsF+62dtsUgqF/hVrZvaiZoy0Pd5GJZaF8Y1C+4QUssiznoyBJ9cRnwkJbR6xq2iM7BNo2ryRMJ38bTF+FSf4M9HuIjFDCoLfYu7fX97EDCoTASOMUv9oSSoyNQQnPJ78I/mSAdpAvIDZ5mIeLC6s4iKHLuZjRMlQ3WxFrHn6MneSxSeOkSoT14SiuFUVp5ITWrVj7El3vgZbz03nvQkM4BkT9EqZlQ5OV3fXCzWbndZejjNVPlxg1AaP/bb6UccDbx0gWSmcXu24rnwmkJwzXPuGJvHt0psn1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:23:01.6735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bbff9c-673e-4ac2-d177-08df457f73e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000AA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745

Use the number of enabled controllers read from the "amd,num-ctrl"
device tree property for registering instead of all the controllers.
The enabled controllers are contiguous. Add a
num_ctrl field to mc_priv and use it in probe, init, remove,
error handling, and the rpmsg callback, allowing the driver to
support platforms with varying numbers of memory controllers enabled.

This keeps the old behaviour for older device trees. On a platform with
whose device tree lacks the property, the old iteration over all 8 indices,
remains in effect.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Adding the device tree parameter was suggested in the review in v1
https://lore.kernel.org/all/34ffba5a-8e9a-49b9-9e36-c31d0e4369f8@amd.com/

 drivers/edac/versalnet_edac.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 7c14f1e78da1..c2025f5744cc 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -140,6 +140,7 @@ struct ecc_status {
  * struct mc_priv - DDR memory controller private instance data.
  * @message:		Buffer for framing the event specific info.
  * @stat:		ECC status information.
+ * @num_ctrl:		Number of DDR memory controllers.
  * @error_id:		The error id.
  * @error_level:	The error level.
  * @dwidth:		Per-controller width of data bus excluding ECC bits.
@@ -168,6 +169,7 @@ struct ecc_status {
 struct mc_priv {
 	char message[256];
 	struct ecc_status stat;
+	u32 num_ctrl;
 	u32 error_id;
 	u32 error_level;
 	enum dev_type dwidth[NUM_CONTROLLERS];
@@ -456,7 +458,7 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
 	phys_addr_t pfn;
 	int err;
 
-	if (WARN_ON_ONCE(ctl_num >= NUM_CONTROLLERS))
+	if (WARN_ON_ONCE(ctl_num >= priv->num_ctrl))
 		return;
 
 	mci = priv->mci[ctl_num];
@@ -713,7 +715,7 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 		p = &mc_priv->stat;
 		memset(p, 0, sizeof(struct ecc_status));
 		p->error_type = MC5_ERR_TYPE_CE;
-		for (i = 0 ; i < NUM_CONTROLLERS; i++) {
+		for (i = 0 ; i < mc_priv->num_ctrl; i++) {
 			if (get_ddr_info(&mc_priv->regs[i * REGS_PER_CONTROLLER], mc_priv)) {
 				adec_data = mc_priv->adec + ADEC_NUM * i;
 				handle_error(mc_priv, &mc_priv->stat, i, adec_data);
@@ -724,7 +726,7 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 		p = &mc_priv->stat;
 		memset(p, 0, sizeof(struct ecc_status));
 		p->error_type = MC5_ERR_TYPE_UE;
-		for (i = 0 ; i < NUM_CONTROLLERS; i++) {
+		for (i = 0 ; i < mc_priv->num_ctrl; i++) {
 			if (get_ddr_info(&mc_priv->regs[i * REGS_PER_CONTROLLER], mc_priv)) {
 				adec_data = mc_priv->adec + ADEC_NUM * i;
 				handle_error(mc_priv, &mc_priv->stat, i, adec_data);
@@ -956,7 +958,7 @@ static int init_versalnet(struct mc_priv *priv)
 {
 	int rc, i;
 
-	for (i = 0; i < NUM_CONTROLLERS; i++) {
+	for (i = 0; i < priv->num_ctrl; i++) {
 		rc = init_one_mc(priv, i);
 		if (rc) {
 			while (i--)
@@ -970,7 +972,7 @@ static int init_versalnet(struct mc_priv *priv)
 
 static void remove_versalnet(struct mc_priv *priv)
 {
-	for (int i = 0; i < NUM_CONTROLLERS; i++)
+	for (int i = 0; i < priv->num_ctrl; i++)
 		remove_one_mc(priv, i);
 }
 
@@ -978,6 +980,7 @@ static int mc_probe(struct platform_device *pdev)
 {
 	struct mc_priv *priv;
 	struct rproc *rp;
+	u32 num_ctrl;
 	int rc, i;
 
 	struct device_node *r5_core_node __free(device_node) =
@@ -987,6 +990,18 @@ static int mc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	rc = of_property_read_u32(pdev->dev.of_node, "amd,num-ctrl", &num_ctrl);
+	if (rc == -EINVAL) {
+		num_ctrl = NUM_CONTROLLERS;
+	} else if (rc) {
+		dev_err(&pdev->dev, "amd,num-ctrl: failed to read property: %d\n", rc);
+		return rc;
+	}
+
+	if (!num_ctrl || num_ctrl > NUM_CONTROLLERS)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+			      "amd,num-ctrl: invalid value %u\n", num_ctrl);
+
 	rp = rproc_get_by_phandle(r5_core_node->phandle);
 	if (!rp)
 		return -EPROBE_DEFER;
@@ -1003,6 +1018,7 @@ static int mc_probe(struct platform_device *pdev)
 		goto err_alloc;
 	}
 
+	priv->num_ctrl = num_ctrl;
 	priv->dev = &pdev->dev;
 	platform_set_drvdata(pdev, priv);
 	mutex_init(&priv->ept_lock);
@@ -1027,7 +1043,7 @@ static int mc_probe(struct platform_device *pdev)
 
 	priv->mcdi->r5_rproc = rp;
 
-	for (i = 0; i < NUM_CONTROLLERS; i++)
+	for (i = 0; i < priv->num_ctrl; i++)
 		get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
 
 	rc = init_versalnet(priv);
-- 
2.44.4

