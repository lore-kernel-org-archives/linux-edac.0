Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011768;
	b=pxSAtfNHFxCymLIhZOd5v2tJ1pVj7H/uSJGALeM+cooFOJVTB9xosdNaiDUQGy2E8NEM
	 FDgvQf2W7tboZ1N3yDAO6H6VHxwDNmYi7bl7Y70cgPsgBWxtISizppi+h8IP00YaYTpon
	 k2IlVrRmCjRueUGv9SHBZXcNd0n4Mim0ZT9K9IeNp813NPUZReWw9ivYAOhE8849QqF8m
	 q1hiwdvPI4KWmvpJTqzwIYNg78z+hnqN2jKumoXz4Ufi/t4y2dphnrfa9qb+u9i1eAi/3
	 BYwrUmnctXomFrt8YT8FN3pOLoAxA9OMWtXbEQ88UxW+/XWBDBP/1sbYtAD16ot3SEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011768;
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
	bh=r4tw95kc8n03/cIkTYM2qNFpaIxrNeI8lXuRCJUVLVM=;
	b=rcWV5u6/hxLCaAl6oY9pI0sHxvaKGu4a6xtxcEm54E0JpM6hEPoKz4zS3sctbxSYz3I9
	 yGGZmub5aFIecZCjz/a1m0YXZitMLpbndPoCHB5x7E6/3EuHtKQ+3z6W2xxf1bIe6DrgD
	 zxH19Lesd+b36iEehAJkup3xSG6KVfpzNqZBOH4RM9K1YtgQaukGINC30Ss94nTXiMpNF
	 Zu3NpG/2fq7ayq7ixhkZgFMkrMUVkR6dWB+bAcQA7dyYrqgOAIKoL7/cg0ChlNLhKfpem
	 MdCLU9z+m5r4nyZnt1kf0D/emN9etXVOaGGJqTSOVU2LfSO313JfNh2GLrwxkZhXYmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zI9ilAJY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.60
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013060.outbound.protection.outlook.com [40.107.201.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161E4606A32F;
	Wed, 18 Nov 2026 14:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 161E4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zI9ilAJY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSHhdeF+q/NpD9x/QkGbu9KvVOThhE3x3OlcqyFIcnMj6ocqNzoC6LCdP2ZjNMKhUMdphORC4gkKbDepapRPXx7mIPzeWFM2q+IyKOMOjp29O9XOYsP6L39Kh8tTNn7whCZpLz7ehyV7je4ZWVr64tuPYcQkfsKEswnulo9A0LmtEkGtoLj6xjqbbu6HqP+YT0jqGgvCca4i/1pSrWfjRZ/Iy421WWh5S8/1iSgayIEy7GmoKt8OdiD0d6KQnGTdXUyDy23HI1XXk2WkWhXuIznohNFQlttWlmRFA/feurGLuRolG6m9vEmrJpW3lmGIdyCdtAT8aZt3uZGh6Ig2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4tw95kc8n03/cIkTYM2qNFpaIxrNeI8lXuRCJUVLVM=;
 b=aG8tXfRmkatKlURmPMphWpZohYp9wGgtPdKKd2AhjuxXZOke59arCiiG8W5OI0iNmY7iDRUDgEYTdHlRbAGACeHBhrhZBrdjjV3+Foqq0SLHqJrz0fcj5g186Zu4nNQBkzrdE4q/8oeXdN+GmidTolz4RC6vO4vnph8vhCmpduwqcomd8OtDP5N3gqUpQHBaic+xI4h84AKiWB5kmgpLCcn7aBPCjS48WtNtY8CmtJq1xdlYWKNQUIXCR6lN/JPvk5LYqbxtwb9ZwI6DBL40FEXVgPm/dQSBhQMculIcOj1ChClevAderq3eDQUzJ2wWOblcdMeSG6t6FsnQkdnVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4tw95kc8n03/cIkTYM2qNFpaIxrNeI8lXuRCJUVLVM=;
 b=zI9ilAJYbGB/79v8J8ryvqigNXvhvCsaCR+GgZohaHZeWQzL5uOciwmCrcDJBtgHYHiWemxvcKWRrYJBrTGu1GQC0Wt0oA2fv7Y6oG1QFCEqMCs2wUsHDdjPxYyLj6TC6bw7F+J7u4W3nydj5V/mNMqir2GmxRdLWFExfyt37HY=
Received: from BY3PR03CA0002.namprd03.prod.outlook.com (2603:10b6:a03:39a::7)
 by SA1PR12MB9472.namprd12.prod.outlook.com (2603:10b6:806:45b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:22:40 +0000
Received: from BY1PEPF000264B4.namprd02.prod.outlook.com
 (2603:10b6:a03:39a:cafe::4) by BY3PR03CA0002.outlook.office365.com
 (2603:10b6:a03:39a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:22:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B4.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:22:39 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:37 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:33 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 05/12] EDAC/versalnet: Make dwidth per-controller
Date: Wed, 18 Nov 2026 19:50:29 +0530
Message-ID: <20261118142213.100581-6-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B4:EE_|SA1PR12MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: 34891df5-3536-4518-4aa6-08df457f66d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|261026140227099003|56012099006|11063799006|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	+Okd1BaP8xt7wjU/g5ix/bj7zQvFe2FhGQkClQXywLY6RP9+K7ROasb1KoG6dnesZXFwqVPXPmCMM/FwDV7MMar5J/uuI+Ef1mRWttOe5eQIQU1LzJTVMKV/6fNkdLN8hxy5cjSCg5PoUUYGPXHPlh9FnxWefj9LHuM7ZlGY8Sn6Ray9OxQOCRro/snuMXQ3kz7UEfUe0O8My/YO+q9jctWgA9STPpDReMJJFTJvdwQYX/yWR98Q3/pzbzx2QPiZOnLpvNA8LQ3k0a1WVH6xnlcS1Ju1vLU/512f7Ktx0SGyn8e4aIaWZ5Y2yEIfu2j9BuuneoVLrkaS06Rfk+O+QELnOTmbkeNWqg6wu5bPZhIeWdICQ83tXIbOxDeT2h3oX2Pa2oZIH+lSGDGI+AlohWA1xiyk8aSScaJf5OBzxKHjr91kwsYHe7pbu1T1liCbyF043HTF16MCXLDOygi8NU75rC7/fQC09Odf/m0MR/0ruEoI7E0bSOb/CNzevK8jx0125+5/9YTxPVXhsrBVBmUHsoGEzC1yVGMfK/anIM5ezLdVxLx4WcAPSXNNseLnl0GXsJKtTxTMc4Sv8D3BmTtUE0hDghU18sMrwiXFHO7taXl2N5i3DnKtvqrj9PxjfCZPBWBSAQPUYFM624//VA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(261026140227099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hM9pg/+GuTzL95UjYOWGYyQ0hPgAxHYywVYhDXDhU5Dvi4QhXXumgUXNKUhqpgVR1NX3QvjjBl1vu0l1HEb5TRdmlkoXPHdXLZ9ddY5b0dMdUuTgpT5sm3XPIx4Avp6Cm2MhGJSCs6wj2LbhzLr8kGWDE/jzeGIE50+wYe/bAxx8w1pKY07PX/7/TMQkZ7mZyZqor1umxJunLFZwEaog0SaRCkxQFSmJla3Amn7k03nZVJFmkiIUQXg0T6jLoJWPnT/+fSze7HnqluvXde1lqxajWb/XiEpztdjJ/an7obM4z5RH6NRuKJvr1IVAk8RPQm2/gUwrJy7LE9bL8zFrKvQ33jKSjasZdcJGBniHRI+zQNFy2kLtt2E8hScEG4mrTrBXmUmTZ7c5+oFztcHx9a8mI4Uv272eg3YA1ueEN2XNQOQQJaS6Jf8tNvvMUmj6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:22:39.7008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34891df5-3536-4518-4aa6-08df457f66d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9472

Currently dwidth is a single scalar in mc_priv, so each call to
init_one_mc() overwrites the previous controller's value.

Fix this by converting dwidth to a per-controller array and passing
the device type directly to mc_init() from the detected dt.
This also updates the DIMM device type reported in EDAC.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
https://sashiko.dev/#/patchset/20260724171945.2812749-1-shubhrajyoti.datta%40amd.com
New patch to fix shashiko review comment "this is a pre-existing
issue, but is the per-controller width overwriting the shared
state for all controllers?".

 drivers/edac/versalnet_edac.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 0364648d91a1..ea90d3ce3e70 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -140,7 +140,7 @@ struct ecc_status {
  * @stat:		ECC status information.
  * @error_id:		The error id.
  * @error_level:	The error level.
- * @dwidth:		Width of data bus excluding ECC bits.
+ * @dwidth:		Per-controller width of data bus excluding ECC bits.
  * @part_len:		The support of the message received.
  * @regs:		The registers sent on the rpmsg.
  * @adec:		Address decode registers.
@@ -153,7 +153,7 @@ struct mc_priv {
 	struct ecc_status stat;
 	u32 error_id;
 	u32 error_level;
-	u32 dwidth;
+	enum dev_type dwidth[NUM_CONTROLLERS];
 	u32 part_len;
 	u32 regs[REG_MAX];
 	u32 adec[ADEC_MAX];
@@ -399,7 +399,7 @@ static unsigned long convert_to_physical(struct mc_priv *priv,
 	else
 		ilc_base_ctrl_add = ilcmem_base - low_mem_offset;
 
-	if (priv->dwidth == DEV_X16) {
+	if (priv->dwidth[controller] == DEV_X16) {
 		blk = err_addr / MC5_X16_SIZE;
 		rsh_req_addr = (blk << 8) + ilc_base_ctrl_add;
 		err_addr = rsh_req_addr * interleave * 2;
@@ -473,9 +473,9 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
 	}
 }
 
-static void mc_init(struct mem_ctl_info *mci, struct device *dev)
+static void mc_init(struct mem_ctl_info *mci, struct device *dev,
+		    enum dev_type dtype)
 {
-	struct mc_priv *priv = mci->pvt_info;
 	struct csrow_info *csi;
 	struct dimm_info *dimm;
 	u32 row;
@@ -501,7 +501,7 @@ static void mc_init(struct mem_ctl_info *mci, struct device *dev)
 			dimm->edac_mode = EDAC_SECDED;
 			dimm->mtype = MEM_DDR5;
 			dimm->grain = MC5_ERR_GRAIN;
-			dimm->dtype = priv->dwidth;
+			dimm->dtype = dtype;
 		}
 	}
 }
@@ -844,7 +844,7 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	}
 
 	mci->pdev = dev;
-	mc_init(mci, dev);
+	mc_init(mci, dev, dt);
 
 	rc = edac_mc_add_mc(mci);
 	if (rc) {
@@ -853,7 +853,7 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	}
 
 	priv->mci[i] = mci;
-	priv->dwidth = dt;
+	priv->dwidth[i] = dt;
 
 	platform_set_drvdata(pdev, priv);
 
-- 
2.44.4

