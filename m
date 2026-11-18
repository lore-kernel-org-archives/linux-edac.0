Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011791;
	b=uf1+PeCBdwHqmqBE8yht5Iz4sOEWgxGFW+AnEJvcOp5NIL9t+B9DbNFMnx2nThlJvNvV
	 RrXn6yhjORlwCK8HpNCjuxJhfSGDTIl1QCUOcZLZAoZrmEIavEbsfZQ33BU6UeptP/3Js
	 OwipDhJWqQjeSAT1BFKej+VGqz7xYx+zKhVx1a4Pp50CkADxWRhye1uzjIWqXzSxKWEq8
	 EFl+3P1h4k7Ig0zQYM0qQzVCwkZs5UyunxPdcR8dbVFgNt3X0pZr4Sa642qGV5ivdq1mg
	 5+aGlWDWmMKX0PQ9TF3kI1E/4FURoH+M3Dhmh9wVbpDr8Y46IIY/TfQeiRCVM8JJY9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011791;
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
	bh=w1FUQA5MzzmPm/4Yh1CYUoRcvpk4duLZMwQY/A/6dtQ=;
	b=eCXFfaCY/o3z/EGCAjkjsSN5cX9TaI2bmSuOtc/SGsZAPlcvHEdQlun4Iu66DHdbU3z+
	 gGkJg+cAONFS9AkR9QL7jipYVgH+/IADX2NMua35Sa9eQZstRX79R18HdvVJSLyft83xm
	 JcGyZM6IVdiS+/xbPIR4w4pvmvyToCxlppnvY2ihiNkOAEn+TXlZocVlLi6wO7+o3HxqI
	 zKXiPflhIgxLsTgusFbo5764ROBlU8XtgBs8wdyShOGMM3/uAh11Ob6bFplT09I9E4AOH
	 Wy9+Za/L+O9mIL2srSD50kGC8tffHzqHoy/ntn7N4DPhwThtY7giRSX5neH4dL7hvPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IJ0+3uaC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.20
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012020.outbound.protection.outlook.com [40.107.200.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CDB606A32C;
	Wed, 18 Nov 2026 14:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01CDB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IJ0+3uaC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l88H+ywuEHNe3b1xpoCB6/PYC917s6g8340fEU/BxA5NIA3vr+CgNRay40ghJnX2udneH+BKeaMu1iMCUNxlH1IpO9JslQweM8vu1l9xPK/w1zJlK0PKXi6FEP98XFauvkmpOoEjBknoGhXHdiHy96/r8AB4ZRD/WqAztMRpNY87+oWwJVMGZCeLda51BUWpA/99MCXfyImlVpB3EQIwF9CkUIFmH4T+L43AIv+BPmP4d7UKvss2ykv6sp7jX4rOHVGnwT+VuMwBJlwJQf0pu4aJFOaKY3FzsJYTI4Iw2VdyG6vAJER18tOFugM5w9fgjfB8HC183F63LEdZn/1wOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1FUQA5MzzmPm/4Yh1CYUoRcvpk4duLZMwQY/A/6dtQ=;
 b=JlN3MusbqXIiwbSWu/cXZHSY5IDQ7nMZhcqH/WUaHaA3ycK/Em+qgJI3CcBbX6ZXzKxG4AosfzUnDcKWaUHYNuxBeBTCO/OyGrDji8YNJQSO29vEE0O79kOACg95S0tI80l45t2359/RZjLERj80yF+z04BaEvZeT0Vo5mDnBf6DoHrlxKmlpYl7ueK8crtn4IyLYL6ZVAKuIjHG69CACI2P93in0uQ/yNNhdpo0uEZTxMXzfmMHQJZqoCBUGaCdtDRnovlFaJL5xo9cu6OJx3nlZNgi/qeDjUXXyXXaq8utoh7FMQxEL3EbE4SI9RaqksQwAtF/7d8zl22NAwJXOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1FUQA5MzzmPm/4Yh1CYUoRcvpk4duLZMwQY/A/6dtQ=;
 b=IJ0+3uaCsjaUMzEuNvkNS2dm6+Vri78Ar+9S7lLLoqPgRg3OhdizFrhrgn7P0I31teSGj12jIv9CMcVniSTV0FXh783LFolwV9eZuzn3RNnKUnboGvE0VI6jti2F2ZF6quv3los72ThuCq3bsxkKHb3ccPbTXjp78Z8Z0iCPNWQ=
Received: from CH0PR03CA0106.namprd03.prod.outlook.com (2603:10b6:610:cd::21)
 by PH8PR12MB999296.namprd12.prod.outlook.com (2603:10b6:510:40e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:23:07 +0000
Received: from BN7PEPF000000AA.namprd05.prod.outlook.com
 (2603:10b6:610:cd:cafe::2) by CH0PR03CA0106.outlook.office365.com
 (2603:10b6:610:cd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:23:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000AA.mail.protection.outlook.com (10.167.245.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:23:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:23:04 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:23:01 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 12/12] EDAC/versalnet: Make get_ddr_config() return errors
Date: Wed, 18 Nov 2026 19:50:36 +0530
Message-ID: <20261118142213.100581-13-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AA:EE_|PH8PR12MB999296:EE_
X-MS-Office365-Filtering-Correlation-Id: bf384d9b-01b9-41d6-1578-08df457f76eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261022113327099003|261021123027099003|261021135927099003|10067099003|261022075727099003|5023799004|56012099006|11063799006|261026135527099003|261026140227099003|261021133027099003|261022115727099003|261028144727099003|261021121427099003|261026130827099003|261021130227099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gQn4150bMpsWarfYZmH1PVqQu6ItFWV74JORgQgXrf74wpU5WsDoGRbHR2v2KsbrFIHCDOE4A/KQTxx3c3UjS83SpoCtBi/Dq6wBpSuDCkRk8Fef8QwACOgjOWBKF7LoaHliTRSb8IfUUaIWW0oOguuaarmxrWH54KibWC6Awpp1818rgRuBOQuG7JMW/OUHY/7hrKER4QRWRipT67BEPC2AJOdKvxn7FpVxHCG/8fHoRDvb8NOgKOi9RbMuWK7xP/9IvnlalfAPnwj8Q+stteF1eDKT16GLvulF6nU3DQ+yZkpkBrGUjluDN/3HhWUGRZgqsKZOeumT15BkKphhGkLsLJUnTD2nSBmkk5szxPMEcZFFnw2KZxDoW1Q5usSwIicn4RR86AlxqRhcP4K5EbqtwOQNCd/EgH4QvnywEU8RsLeFdQAjaX/ZjSWT9XTxRDRZoT8wGJ/WUv1Tx2LP6JbjBkgBBAwn+l+S/ZdiKYUy5X+8xnmH/0vB6nN2GPDNaP2Q06TbdTL8y1dXmTxwWMpqLy/fv2fTa7WVW7yN7NAbGfzIykWxVKhU3h2q4ZL8SX3qt3YyIcVmEvzc9CPN9YfvwFGn9GdAXXpaZHm7QHMpaVpJ34GhUA2+f2NHsiqQBM2D6+RJDolUprwY4i/FtCGtBOACdWrmVIfb0FAu70PA4gWdq9nLHKTzwqmwAKFFHr3MCsTTomm+4SJ+r675bQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261022113327099003)(261021123027099003)(261021135927099003)(10067099003)(261022075727099003)(5023799004)(56012099006)(11063799006)(261026135527099003)(261026140227099003)(261021133027099003)(261022115727099003)(261028144727099003)(261021121427099003)(261026130827099003)(261021130227099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h4Mc0tT0hs7SzBAKPE4iT9wEvFFT16Ze1slawiG4yiwcSGFZQngWaAKiPGmg+OvLasRc769xGYtqBFe7Z2DSvmc0cyTwC82hDYYPTUSY3Pqv58RkgVZBR01m16uQC6md0IzEHnkucnPnFVpJCkGB6/acU1w3brvczlBggeCQzpKriDr+ucTyZylvjstR0cp0WEewaaxnxYe/yF5GhWmP1mti6po9wd9ylNkq2ryocmjbAFPXR/7ini5BfbGzPn9IfjD6LCJfAKkLyZDfirwuau+qsNZdntSSQ53mbi9zUUoH/qu3VXJbLsxeS7FG/Qz8VcMJRHi3ogFJfnoUURvz+zm7jQD1kXNn14Ken59XHm7cKKxs+bIKw5AM4Wcy79LClX0Ia6f0FE202Kkr94FTTKGeiasrpUkBPFxGYSE8vwm5kPCHSmjEplJKw/QlYzWK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:23:06.7780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf384d9b-01b9-41d6-1578-08df457f76eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000AA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999296

get_ddr_config() invokes cdx_mcdi_rpc() but ignores its return value,
and proceeds even if the cdx_mcdi_rpc returned errors. Also it
copies the data out of the response buffer without checking that
the firmware actually returned that much data.

Make get_ddr_config() return an int: propagate cdx_mcdi_rpc()'s
return code on failure, and return -EIO if the response is shorter
than expected. Update mc_probe() to check the return value and bail
out through the existing error path on failure.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
New patch added to bailout if the cdx_mcdi_rpc fails.

 drivers/edac/versalnet_edac.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index c2025f5744cc..ac6e926a1918 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -587,7 +587,7 @@ static const struct cdx_mcdi_ops mcdi_ops = {
 	.mcdi_request = mcdi_request,
 };
 
-static void get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
+static int get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
 {
 	size_t outlen;
 	int ret;
@@ -599,9 +599,15 @@ static void get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
 
 	ret = cdx_mcdi_rpc(amd_mcdi, MC_CMD_EDAC_GET_DDR_CONFIG, inbuf, sizeof(inbuf),
 			   outbuf, sizeof(outbuf), &outlen);
-	if (!ret)
-		memcpy(buffer, MCDI_PTR(outbuf, GET_DDR_CONFIG),
-		       (ADEC_NUM * 4));
+	if (ret)
+		return ret;
+
+	if (outlen < MC_CMD_GET_DDR_CONFIG_OFST + ADEC_NUM * 4)
+		return -EIO;
+
+	memcpy(buffer, MCDI_PTR(outbuf, GET_DDR_CONFIG), (ADEC_NUM * 4));
+
+	return 0;
 }
 
 static int setup_mcdi(struct mc_priv *mc_priv)
@@ -1043,8 +1049,11 @@ static int mc_probe(struct platform_device *pdev)
 
 	priv->mcdi->r5_rproc = rp;
 
-	for (i = 0; i < priv->num_ctrl; i++)
-		get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
+	for (i = 0; i < priv->num_ctrl; i++) {
+		rc = get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
+		if (rc)
+			goto err_init;
+	}
 
 	rc = init_versalnet(priv);
 	if (rc)
-- 
2.44.4

