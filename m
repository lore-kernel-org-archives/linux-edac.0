Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797571;
	b=j0EeHs8TPCqvC4ibaHYUFeSU3/SUAV+pY83pcUoKzUdae7xHihy+IaIlbV29lWqFv9or
	 3A53PHTseWPku7Cb25aFlPYCOKZ3Ha9o3DvLqX/deiKzkbXA6INC5pVYKCALDZrS9mcGx
	 ELopV5BnUtDCGYXrQkV87q+NC86JLnkfrw6Jya6mbOxlSovwovXx2lZmJi6YO4gPBHH5C
	 S62lOPKpE58XVaaydxScn/J05YdOJAmUvZOVPpYY8jCn0aVP0+JAiqO3ZIqlCU2IsCXzJ
	 1F4VfiuKL06iTGMkSVoau4b+WQUdsGBxrKUcRqmQSNz8CnhkTeXfV0f4YJBwxo7IIsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797571;
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
	bh=pSc4aLHVCShBHuvJ7d2w6XGPOtasw57QAfutzmAcVt0=;
	b=E27l89vkyY/KKe2uExz6kzuXyGgmgJJyP1Hb/D1nQk7bnJDmx0zhN2OkUS3GE0ktNq6N
	 kIT5xV0gO5ypAYLHy2k2ofhFveDnBrfmnAHy6N4/wjuwnB08LN3iqNEPSae9xSGkdySUi
	 sw3aGqkmoXZNdEaC0S7Sg2GVFP/Wbmx1Fk7IpkyJ195FrHcR0h8XNKuSuMa1ptKrBdxkX
	 4mwCZ2KRPGTnCAhNtv1SS9ps04ZZDRe7cV/UB08t4DL1nPL63DRDHYQnvPGafinRsZj4M
	 I+V8XSiDpha2h+PY9mAWlOgmcBeRQfS4f6/ASZdSU6tYZ1JFDha+y36jZ7PJ/w4Nrxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Yt9UM548;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.2
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010002.outbound.protection.outlook.com [52.101.61.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7847606A69A;
	Fri, 27 Nov 2026 16:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7847606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Yt9UM548
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJlWYm5fBb4bHyRgnlJwRZAGAhNxdzfPcb7HTI66hhcgyiLBq8HPxrvrbppdE/Jofz9wMfMi5lqgwEt4O0H1yrtHm2KmSOXPLAYXfurcdhOU5KcrT7/Z06qDxJMhM+rIetsM+ex/cLhRxPXJHl7PuqFdQoXtcORojpL2M9ewXvPALTcfHHEKKaQRyIZwIqNUdg+KKMz5OMSFmQyW0CtYQfx/tXZEGPi+RV/f+pjskEnKuwqEC30Efqo5QGJ3DJDHEwKHhxDn0gBkwiv9+CGeaj99KZW/xIPVf7+rMbHySbwZM2yf5BNNPCf5ucU4D6Y071HxFj5azY1OvsyMXweaGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSc4aLHVCShBHuvJ7d2w6XGPOtasw57QAfutzmAcVt0=;
 b=QNlrrmDiPvNwtniB3+AywwjcGvUrN0jw3uBnmGiATQC1tCJb599YHWu3XcoMSwhCgto0v/e4dwrGJFi+XDpLrVk6jeIWJiwFmHcTYjiDv9fRl2VdgR/FK+Qd7fRGMLChFzPQfj4hhGHunvp2lfIRQjv473Sx43NBN83YS+vVEfeeerM1hQXKeUDjCEP8V0TgMrXCUd5XjmEhDlqQ1PfmYrL+FrH+UkpFGZeRBs4mWrqT/hBPBvgjOmK1ZsGUoDZGH66gI0Oyb8UoOyL93MQOCshgUkyTddcJ0O2oYt7/WgUC3ADCJGYr+eOuIBEqr3ft+VhfOXLguV9Mj456WXkhVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSc4aLHVCShBHuvJ7d2w6XGPOtasw57QAfutzmAcVt0=;
 b=Yt9UM548cS9dzJ8d3gAM9IZDFUt2kILwv+vjS33WoP5A9UR7krSaTYtmbJOqGsYCRf8nopkyyXj2gxJrkhQHeEac5/4ZlRkTk6ZcHsEvDAzRWh8TZDEplLcBHCA1eGBLIRcfEJvAEXng3dYdVxkbz8T8fw06j6anIAFoMnfmboE=
Received: from SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::24)
 by IA1PR12MB7638.namprd12.prod.outlook.com (2603:10b6:208:426::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 16:39:21 +0000
Received: from PH1PEPF00062F30.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::8d) by SJ0P220CA0012.outlook.office365.com
 (2603:10b6:a03:41b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.11 via Frontend Transport; Fri,
 27 Nov 2026 16:39:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH1PEPF00062F30.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 16:39:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:39:14 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 27 Nov 2026 10:39:12 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v3 6/7] EDAC/versalnet: fix the remove controller crash
Date: Fri, 27 Nov 2026 21:59:15 +0530
Message-ID: <20261127163853.3563991-7-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F30:EE_|IA1PR12MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c39a6b-c923-4223-3858-08df4ca4fab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|11063799006|56012099006|261028144727099003|261022075727099003|261026140227099003|261022105027099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	ZREwP5o7eFIJ9JFDMDzZ3KEpaAMRgGZ4ZxVa/LVPTSC0jI5whapTbv404ZKB3xUJ1zWcdjnU73LFP1tm9ActTe+YI4fko0XuANH6+50GE3FAaLcX9MVT7DJyC6naWrTHt1BMyajf7szfzoehkdXnC6mzq1a9Zt9If72aGrbDGxpsxVaCa3QxB7P8SDPb+LB049BEGXVVii9HY9lkC+0A+wMIDZnPP+UK9AySHUyguHAxtz9JbVvsiUtt7LVVUbZckacGDScToBgNUcy5TLEUzx3rtHz8b9JWKKSif0eZAowqjnaIWR9zfZK07vRsH69Y5o7E4g1hplaWV3Dos6HVAqNyovNvYt/F8+VV0NECUMJiqW8MIC9m8CutgP8EIT2VcudbZDfySXugzh0zvx1hrlgTa8e5BxKKOt6AvLHMZ7f/55U56W2utHgUdoJHRLjKVS/3xf4WvuvC5aUGlDupbWkwXJvv3QhB3rBoExVHL97vbWDZbWIsXh3Gk6CdBEbfn7QGLtM5xzRdw7REOvbra3J2K1b/lQCw3sjjjHAq9BpXNMkRx+1qe7D1OJSoy+UHijr8u2ksRfkvezbb79kWBhMqGXa2ygkSDSclYdb3dhOk4S7NFnk6V28jz3nis2mDwopcB/g80Vt5SR0al65fUFeNqJmt614D67dPDf+X9co=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261028144727099003)(261022075727099003)(261026140227099003)(261022105027099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L1YAK9A8UNhrKdhdedzMoXgKTINExE35htMLXYgpKtXJ3YK9Wip4C3YhQlezLlu5eHdbCZK3wFDRbe3sD+SCb8n7jUQmnxItFP7DH0Qh8G09gvW+qFks4rvJnYU4zaKyPInEjqj84Xm7fF4aju/65+1j/IbfEGnnZ5FQdg1P76HkRnGPqAAmP7rMckZYR6j8eql+KSSnLdGYq370tVN4O0FITdYbOyPRVGGoWOUUK/crSKV2l+e/LOfije9VcQUOKrrCV/W+qEaDX67krCHY99ZOyBynL0OJvL+vz0KYqWcwMfrML5xFW85mZ17U8bzz7EOwFXSXIg2kmGhgeKGPIqva4dgz1R0FBOFjOR9c5cx3qt+jsxA8mexhuoEkbbh+PtX7GEBiQ55zrZNVY/s7cbctkuTRxDL3aT+qWPlroppMZbUIYK0IvKkPtgvYd73L
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 16:39:17.3902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c39a6b-c923-4223-3858-08df4ca4fab8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F30.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7638

Use the number of enabled controllers detected instead of registering
 all the controllers. The enabled controllers are contiguous. Add a
num_ctrl field to mc_priv and use it in probe, init, remove,
error handling, and the rpmsg callback, allowing the driver to
support platforms with varying numbers of memory controllers enabled.

This will avoid we attempting to remove a controller that is not
enabled.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v3:
Implement the detection instead of reading from device tree
update the numctrl check
implement get_dtype

Changes in v2:
Adding the device tree parameter was suggested in the review in v1
https://lore.kernel.org/all/34ffba5a-8e9a-49b9-9e36-c31d0e4369f8@amd.com/

 drivers/edac/versalnet_edac.c | 49 +++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 7d8b8f2ecaea..8a5da8fb3403 100644
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
@@ -161,6 +162,7 @@ struct ecc_status {
 struct mc_priv {
 	char message[256];
 	struct ecc_status stat;
+	u32 num_ctrl;
 	u32 error_id;
 	u32 error_level;
 	enum dev_type dwidth[NUM_CONTROLLERS];
@@ -449,7 +451,7 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
 	phys_addr_t pfn;
 	int err;
 
-	if (WARN_ON_ONCE(ctl_num >= NUM_CONTROLLERS))
+	if (WARN_ON_ONCE(ctl_num >= priv->num_ctrl))
 		return;
 
 	mci = priv->mci[ctl_num];
@@ -720,7 +722,7 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 		p = &mc_priv->stat;
 		memset(p, 0, sizeof(struct ecc_status));
 		p->error_type = MC5_ERR_TYPE_CE;
-		for (i = 0 ; i < NUM_CONTROLLERS; i++) {
+		for (i = 0 ; i < mc_priv->num_ctrl; i++) {
 			if (get_ddr_info(&mc_priv->regs[i * REGS_PER_CONTROLLER], mc_priv)) {
 				adec_data = mc_priv->adec + ADEC_NUM * i;
 				handle_error(mc_priv, &mc_priv->stat, i, adec_data);
@@ -731,7 +733,7 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 		p = &mc_priv->stat;
 		memset(p, 0, sizeof(struct ecc_status));
 		p->error_type = MC5_ERR_TYPE_UE;
-		for (i = 0 ; i < NUM_CONTROLLERS; i++) {
+		for (i = 0 ; i < mc_priv->num_ctrl; i++) {
 			if (get_ddr_info(&mc_priv->regs[i * REGS_PER_CONTROLLER], mc_priv)) {
 				adec_data = mc_priv->adec + ADEC_NUM * i;
 				handle_error(mc_priv, &mc_priv->stat, i, adec_data);
@@ -874,18 +876,12 @@ static void remove_one_mc(struct mc_priv *priv, int i)
 	device_unregister(dev);
 }
 
-static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
+static enum dev_type get_dtype(struct mc_priv *priv, int i)
 {
-	u32 num_chans, rank, dwidth, config;
-	struct edac_mc_layer layers[2];
-	struct mem_ctl_info *mci;
-	struct device *dev;
+	u32 dwidth, config;
 	enum dev_type dt;
-	int rc;
 
 	config = priv->adec[CONF + i * ADEC_NUM];
-	num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
-	rank = 1 << FIELD_GET(MC5_RANK_MASK, config);
 	dwidth = FIELD_GET(MC5_BUS_WIDTH_MASK, config);
 
 	switch (dwidth) {
@@ -902,6 +898,23 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 		dt = DEV_UNKNOWN;
 	}
 
+	return dt;
+}
+
+static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
+{
+	struct edac_mc_layer layers[2];
+	u32 num_chans, rank, config;
+	struct mem_ctl_info *mci;
+	struct device *dev;
+	enum dev_type dt;
+	int rc;
+
+	config = priv->adec[CONF + i * ADEC_NUM];
+	num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
+	rank = 1 << FIELD_GET(MC5_RANK_MASK, config);
+
+	dt = get_dtype(priv, i);
 	if (dt == DEV_UNKNOWN)
 		return 0;
 
@@ -966,7 +979,7 @@ static int init_versalnet(struct mc_priv *priv, struct platform_device *pdev)
 {
 	int rc, i;
 
-	for (i = 0; i < NUM_CONTROLLERS; i++) {
+	for (i = 0; i < priv->num_ctrl; i++) {
 		rc = init_one_mc(priv, pdev, i);
 		if (rc) {
 			while (i--)
@@ -980,7 +993,7 @@ static int init_versalnet(struct mc_priv *priv, struct platform_device *pdev)
 
 static void remove_versalnet(struct mc_priv *priv)
 {
-	for (int i = 0; i < NUM_CONTROLLERS; i++)
+	for (int i = 0; i < priv->num_ctrl; i++)
 		remove_one_mc(priv, i);
 }
 
@@ -989,6 +1002,7 @@ static int mc_probe(struct platform_device *pdev)
 	struct device_node *r5_core_node;
 	struct mc_priv *priv;
 	struct rproc *rp;
+	enum dev_type dt;
 	int rc, i;
 
 	r5_core_node = of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
@@ -1042,6 +1056,15 @@ static int mc_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Failed to get DDR configuration\n");
 			goto err_init;
 		}
+		dt = get_dtype(priv, i);
+		if (dt != DEV_UNKNOWN)
+			priv->num_ctrl++;
+	}
+
+	if (!priv->num_ctrl) {
+		dev_err(&pdev->dev, "No DDR controllers enabled\n");
+		rc = -ENODEV;
+		goto err_init;
 	}
 
 	rc = init_versalnet(priv, pdev);
-- 
2.34.1

