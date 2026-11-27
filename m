Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797548;
	b=NJly4VwtjcZClSPXNHFId0+4SRQKJA4asxo39L5ZttcGxxNjEFuu6+BxmzK83X9pUH2U
	 VOiHMP221YXwD2L+jdGJr4f1tp+2ADDcMHORWp3CFxMp3k8Rn8QFwJuGSQjFmW1KT63Hw
	 WCfmc79wlHxDx1sgZSzGfdXdvEWZUApZQZbZ+4c7uXaRKCqro9PjQ7BIGiueNVwxzMFOE
	 Wg36Pwu4cyMzEqOIxO69oq50aGzFCQIHpzd7Jwia+oO4UgHwYHyFNEaGaTSoimDyqOaIQ
	 T/uuPLdEwVZmZQ5/HQxu9OL3VbkFA7T3JDj9lg0R9N96qcHrWQyIMDlaWMfjEC2mLoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797548;
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
	bh=M76ls6J6Zl1fIuBTgz0vh0DvU/ty1Hve42VgNmX8Qr8=;
	b=rJb3/FUU2kAgvw+wK5LzccnRu6zGF8/1jJBfVAEEX0xArAz6IOVV7PHD3mHW96zKFIMh
	 SeaGy15bc2gRQMbcRO3XjXUw3xD1BWz7G0LcziPVq1KWr/BdnDHXXFBzRAuDWblAaFDd3
	 vo2i6k/R1M6bs5DP5knlqb6P6m/XfagH9oHXGwcErOxXC+p1WKd/xrARRE00vXr3/Sig6
	 /TqV1QyXOGVw9xIo9fEi5qQSzs94ET4PwuRr2dXxh31daDIuH29ANNXdGO0fRss0ijy12
	 C/uESxG36/EeodlEL2FxDVC2lBnfPMCQp0uv7AyOvHYcDASfW3SX4mlrIskqogqzZHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RGtIx2sM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.27
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E0B606A336;
	Fri, 27 Nov 2026 16:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E0B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RGtIx2sM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doJjG20ebofVvBs2BkvwcDGZkYnaAsbQL9xILURYytA+YWhZO6Xu8dOAb8ee5IObCkhDMBqEfbAKjETxnBd0fuZwtVnlY7BW5gKpxvm90fNoJ4fbpCmkJRNnNzyZyiRHgXrDc6Wd97d4tHwz5qyjr44qrUmELGDDAA3F0M3Wm4tj3D60dhzijo5+1m3OKeTig+Va9oJ+fTlV3iOzXKeEKqeGLtdLlY3mdnokthTMZyJvDB+JO8gTM2FNet8Naxo+1SGNlH3oKx/2SY7XBLs/0TeSBwXy8QpsRrVVaaAmnJEs8hFKvy5SV/rjRl3KAvgPmEbaOrXQTnlshy+vsgfLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M76ls6J6Zl1fIuBTgz0vh0DvU/ty1Hve42VgNmX8Qr8=;
 b=nD9TUbyDVAeesZSZC8q0jthbtygBd9RpbgLOMIiKkQhGcr7wXXuG8Mfkx3M22o7TnwvUBNXsEH9LeeH2CEXZqZbp+NaOc4EYh2UFiy0lOkqTjpiZqspePmvkcMrPeB/fFZ/IVi9dOueA/HmXRtQyQp4pwr9KiAGe/VvYVtSwaJrjIoGwvp6+ykL62PFg0havo9ljkqt5ccoVwMgird9UoDYkVn+yEl45kG46PyX+aMKRHl18kOV4ue/3f6h7r97W88PNV5DcLT2gO4WM09nlUTd8IGJW8n9NnUWUNCqvmICAJ4bsmz+ECT8/WkI0Orl87Ww0Y6318xYpyRCMleJ4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M76ls6J6Zl1fIuBTgz0vh0DvU/ty1Hve42VgNmX8Qr8=;
 b=RGtIx2sMySj3RhbGpEXmZaO8sFdQyQ4ZlBAy/U035e4tbdLKGJgkYKt/yyla2k3R8tupqN6O5NcbA05zYwgAgbuoTvb1rAPBd4pXF/8yHKmUC0l8ZOxDN0OjcrjO7+POgPnpIqUgnQ0Oy1GGCfc0g/UFFxwFeu2P5h2KWhF6luI=
Received: from SJ0PR13CA0017.namprd13.prod.outlook.com (2603:10b6:a03:2c0::22)
 by CH3PR12MB8533.namprd12.prod.outlook.com (2603:10b6:610:159::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 16:39:02 +0000
Received: from PH1PEPF00062F2E.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::97) by SJ0PR13CA0017.outlook.office365.com
 (2603:10b6:a03:2c0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5 via Frontend Transport; Fri, 27
 Nov 2026 16:39:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH1PEPF00062F2E.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 16:39:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:39:01 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:39:00 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 27 Nov 2026 10:38:57 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v3 1/7] EDAC/versalnet: Add bounds validation in rpmsg_cb()
Date: Fri, 27 Nov 2026 21:59:10 +0530
Message-ID: <20261127163853.3563991-2-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F2E:EE_|CH3PR12MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: e7af34c1-3dda-4dc9-b2c7-08df4ca4f17f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|56012099006|11063799006|10067099003|261022113327099003|261021121427099003|261026140227099003|261022075727099003|261026121527099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	O2TM6ury8tC0LRmP0yZ+ACTMN082fhKjOJeQTld1DlyNEFXZHvZdoGp6QnvXrGPGVpGXrTsMRW3dbiUSBGRWT/UDFQ0+mbcJAy8/oxiMLLnqgB1Ni4GODajZtIO73iwQGS4jpQIckpgsKD/gmnSwrao1CdznAgHJXTk6vbPZmkvdR4xPvUpBN10MiJdNTWYJfhTqzyKPyFHC4TSqwCfr9+PRwMrO+EdUHJ0t7lnUbaYHYxmEZ8t4UokgkvPVw5P5c+8cLLdf5hugcdlQG/PJGYbF+IrUDsWZjVhhgZUmYpOFEi/XLiBkUiaxmIOe1QrjWz7ZnsK5bYiBMha3mS6BwggNpYmWKS4LqnGjRClql0slqTYSJ3CmtU0pX/ARhQ1yPQdb7i2iN1E3CnvLGF1z/kWUbsrHbP2sCmg/VATsYH67Y8FES1Un5eQqrsDL4Mn6+voNnCyZ9W7wb/1jGkQYI3UPNRLRkqYMCVg8aiEKmkz5m1SyALoINoDi2bDUIkZr7NYeKRv+5y3JdM2gYxkep4TIWgA10P4tmVKcVTeaWm/WoKAOvrK2Gj9OYHQ5HxeEPlStnNg1/V2Z5iT9smqXIh/nO3B3XG1GzvzgZLTcZ29MBU1yeCQ8Vh5KTrlrlmBggYcu4lTTPXSviq2LUy46OZbmrLovaqFMjnCG3k/GzX6QNnR6LM+bk+oojbFFsjztjLxnGPuVBBmaJz4eKw6V5w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(56012099006)(11063799006)(10067099003)(261022113327099003)(261021121427099003)(261026140227099003)(261022075727099003)(261026121527099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2AO0w6PMjB62GUy1ZYwqGgudUaSrQdXV2lUhBY/S+/4NwvaX+4JZVY8YwkRWDe8+nOeiD7DNzy5fNGjCdKigFiBhtFR2kMmqXzKFHFC/B7KB8a1EcqPnR3iiy5Gn645mGwouPwMu352vhq0Pm1EUXpfPKT0UGtwGoyc0y5UTu8gGgb0p6nyQDifb90ilc/gdPRwaqlGVrXC+G4z7s9MEjk4EyOwXRRXeLbM5I4OjOHleKPgGDJfrV7ipJSvPvY3/x3L3rNbsu0bgzGfk5llkhaRC5gS7IJLK7qRGRQLI14f7jUXPIRU5w/jzh6Ln5966umBaF/urllxkigLq1GH7L3JcMJE/FhGTAoIDlD+235MNY5L4vnPOPDP4igd9DcomdsKDISPucmGnDZQ6ixqB1AgBH/akO7Yh/Pp5hcsONGbl95h6GD8WYUBrwSKTGVXs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 16:39:01.9142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7af34c1-3dda-4dc9-b2c7-08df4ca4f17f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F2E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8533

The firmware-supplied offset and length values from the RPMsg payload
are used without validation to index mc_priv->regs[] (REG_MAX entries).
A malformed or buggy firmware message could access past the end of the
array, corrupting adjacent structure members or kernel memory.

Add bounds checks for the offset and length before accessing the array.

rpmsg_cb() supports messages split across two RPMsg callbacks. If
validation fails for either part of a split message, discard the entire
message.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v3:
If it is a split message tben discard both the messages

Changes in v2:
Sashiko comment
"This is a pre-existing issue, but are offset and length validated before
being used as indices?"

 drivers/edac/versalnet_edac.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 2019a0f102c6..405d994303c7 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -607,6 +607,22 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 	length = result[MSG_ERR_LENGTH];
 	offset = result[MSG_ERR_OFFSET];
 
+	/*
+	 * For a message that is part of a split sequence, offset must
+	 * continue exactly where the previously accumulated data
+	 * (mc_priv->part_len) left off; otherwise either a fragment was
+	 * dropped or this is an unrelated/replayed message. Reject it and
+	 * reset part_len so a bad fragment cannot desync, or be used to
+	 * smuggle data into, subsequent split messages.
+	 */
+	if (length > REG_MAX || offset > REG_MAX - length ||
+	    result[TOTAL_ERR_LENGTH] > REG_MAX || offset != mc_priv->part_len) {
+		dev_warn_ratelimited(&rpdev->dev,
+				     "Rejecting the faulty message\n");
+		mc_priv->part_len = 0;
+		return -EINVAL;
+	}
+
 	/*
 	 * The data can come in two stretches. Construct the regs from two
 	 * messages. The offset indicates the offset from which the data is to
-- 
2.34.1

