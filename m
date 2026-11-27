Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797603;
	b=fBGi2+6zRRnoX4O3LR6hMgWBrspbeU8qbKf6ZkOjN+ninxxqpoSovTf5JbT9ejpoP70Y
	 gnE8WhZ3iaoSDk8CTn/NKi2ReKQhMcNdIW189r/jdLsv99+uc/0BpmqBVWcAtFmLHm6+q
	 iHT1b/omXHKqHygugHozsdn7n5x6CgQFyhHPavPykIqZIneIJNbn27uF5tUQm/FpfTyJ7
	 m3T0R/6FAx8vQ6YS/zS0+WRGJ9391ZgC0t2odHcQgzlC99hpInIfxsQGkaUz8m0vPHYls
	 MdV2ikAzyzioQZbSsMIn3q6MyWBFYgds6CCBs0NPJGb5HtNVWHiO3okfQqd6JP3Dt0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797603;
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
	bh=sI0WmBWZefLAFDeIyZujJYY9+wkWBDDZktAxmoljj9s=;
	b=jopsj44yrnczaEhifaWzsnu36YJnbYG6ng/0vZ55pn//apc02lgs6O5mVUmBiCNI7yFR
	 UmTFDmyevST+LVnwmsOjzl6xQvtzPac/OrOSFKSDTXwCMD/Qg0mZ+855LWVAwBJadJVVj
	 UgSp71j4ajR0Puvc185+Xmz8jVvcshHVdLB5+n1XlUqFFdEUDTJruL0Q2KqDhiJLw86L/
	 fIFXHz0i/pQrkv1y5+k/E5pX5QmRocz3bEp+ZH46E8k6/e0RXaazDm1cbgyGgeG3SlOCv
	 uX4rpZJmBKa7M5mMqiHzto6hfeNtqod2qTKGBiCLtP4ci6Dr44GkpvITaGibPlupCDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c4RMJk0R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.15
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4040A606A688;
	Fri, 27 Nov 2026 16:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4040A606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c4RMJk0R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvTCLoEz06+PuMseE9GtYHdGvKkDGrcqK1z74CLqadyxr7LJuf0+Ax/k6B7OHzGqnK+0m+CorTuqbZolbLyHlzPhjE48Bz/JkvGDi1jMpRazEGs5igjKxXkEysi6K/wFx6rAO5q/xGuWX0QgoVBD0TyyRUFdpVmeCR/hpWRBfhZ6u0qE/8Hx2faHi+E2o8ApnFqodKZUeC0GSIl5+JEvOEQHPV7cXxm2m5ZucTxAgn/GUPo6yYNfZPGm43SLh0OwBZxj8b7kSe3C9GRB+p1tHEtjG74Cm0xMrNm/a+YYZ+WZsZ2gP7u5yJFGDcV7q5mTK+DK1hxD9c3vDcqnTMorJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sI0WmBWZefLAFDeIyZujJYY9+wkWBDDZktAxmoljj9s=;
 b=V3aYRSh+T2vAQiyRS4Z4OajdavcXEpBQVhTUOaefw3u/1c5xIi8z2lyq1w5Cgvlz9UwqCAhIByJHr6SvAHwcLmEQ7NzBTgKgT4UEzBqCxQh5sg+tih1guSSLDrH5jaLgh3IKPs5ykz8oqYBI/h92aazbljj327ulQCmRSMUVOA57ak8mFJTbYqYKDAifb/2XjS5I5YKe+aUtLG0jCRoYRjJBD3vhy9+tptSm0P5aqXmY6t0G2HvovalD3/8Te5sypUAU0YIysdd1/oqC+aYgVsbl8EQGvnzCHpdkiHjfYM0zJM1jZhDI79sjcpDhCDrbu6kYcvRhPeq8mCT/tuQMug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sI0WmBWZefLAFDeIyZujJYY9+wkWBDDZktAxmoljj9s=;
 b=c4RMJk0RoyMeT/+pk5a7tMM1PNWw4gex6AAVHC48qoGDY8+mLj9fArnJmk+9YMabtRFXP4CzvkmfH7EZm7qdBS3eJ73RGihLSdQj8/SnN2uZ+jcOiEh88uOKwf/3GmdnUjuv/lR0/otMrTOHF7EoxK5PWTelwZS4jflW8nQ5Axo=
Received: from PH8PR07CA0027.namprd07.prod.outlook.com (2603:10b6:510:2cf::25)
 by BL4PR12MB9724.namprd12.prod.outlook.com (2603:10b6:208:4ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Fri, 27 Nov
 2026 16:39:09 +0000
Received: from CY6PEPF0000004C.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::97) by PH8PR07CA0027.outlook.office365.com
 (2603:10b6:510:2cf::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 16:39:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF0000004C.mail.protection.outlook.com (10.167.247.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Fri, 27 Nov 2026 16:39:08 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:39:03 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 27 Nov 2026 10:39:00 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v3 2/7] EDAC/versalnet: Make dwidth per-controller
Date: Fri, 27 Nov 2026 21:59:11 +0530
Message-ID: <20261127163853.3563991-3-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004C:EE_|BL4PR12MB9724:EE_
X-MS-Office365-Filtering-Correlation-Id: ac004394-6dc1-481c-961d-08df4ca4f585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261102123227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	9a6WcHBZqIR2cPdW/Fv6tmjuoayv2vHXVtiZ6D58xRDGWSQIjLdHxZEjJRb6WJF25tO6vLvXv4AIqUpaVB2elK1/G0FMnx4juf3GZBzveWGMRy6g0RX7HqQkT0QeMZViAKSlBic4h6fhFMr5FZW5oJoOgNOUQ2q097NzAjlQers2sz/VKgGQQJ4iAuQYAcJo2tee6R4St7LdNtutIsMPL5e6E8wYw6X8Ms0rBSr9u2YmMEUHBNYcbFMfUhTnXR0hfaEEgLcMXS/NgW5BP2oQrBvOA/J0JlLwgtVPjuXSbHTAKsUdNqatIZ1CaTa/M9zXReIauzC+CEORWmG0laQXLJosjJQ7PKvwYPZehAQPxrHlhGiDrTBQ0h/2g9u+ESpcrwUKoGoEMne6NTyfi+bHxHgOLOvgTmIfwADr1otyWE0dWUqqwjCNmP7xEMpzHW/Qp6iSYq+HGdDMBjw/fYgey5iYC13mwDpJopYElve+S1BoVZ/EopoYL1J8auFCChGzF+Rp6t/1OSMyXKOU3+JYu4EZ8Qawj7DWsLhQjgyjXsrNmFp3PT4qFOwjnTbD2Ubl4i91gSf+xoZg34pe4/pb1p9Xnt/hDXBF32W4Nd+XG9Amwf1y9EAkcbZZ51fI8X1o6gr5E0z026xH8HPYmDnpTw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261102123227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TtRFLOCEDnRRHeXMSI0UM6GQZbCFkylPcXK5SE3s1jeUmtPKvq2uy9noeii1ysKZllmmSmoThU4w5gCkrgG9UPwscW+BRfqvUz1qF+S4zh7/nMy9OhbBGI+04BbkML/DtLTg0KiO5Q7j5ALaqJy/tzFH7Fk0qmmdi3A3j68d2vN4FUbYfAnXygI8mX8rgNq0F3P2mTUFlMhRLoMowkQLW5XF7PMXpdoJkBKqQIUm9SCPHVIrxfLeiWCmOsfhkyillvohZi1z2tVqMbtVJaplPZfCYbnqO0HHoz1lxughK/jFkwCu6U3T4KiUiPMYqQAb1DTqntdZMN/AvcOZx0A8uCm2zQGALxhkKgfI2DQ8EkB1/8D6a7wyM2LNqnZkd6r+jJtU2ZlKfUx7ljBMZnB9wo5tR6k9jk/1QpgACZTt205+J3nXVn0RZNi7SK5wa8ui
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 16:39:08.6570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac004394-6dc1-481c-961d-08df4ca4f585
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF0000004C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9724

Currently dwidth is a single scalar in mc_priv, so each call to
init_one_mc() overwrites the previous controller's value.

Fix this by converting dwidth to a per-controller array and passing
the device type directly to mc_init() from the detected dtype.
This also updates the DIMM device type reported in EDAC.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v3:
Updated the description to dtype
Update the memory allocation in edac_mc_alloc as pvt info is not used

Changes in v2:
https://sashiko.dev/#/patchset/20260724171945.2812749-1-shubhrajyoti.datta%40amd.com
New patch to fix shashiko review comment "this is a pre-existing
issue, but is the per-controller width overwriting the shared
state for all controllers?".

 drivers/edac/versalnet_edac.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 405d994303c7..8decaba19048 100644
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
@@ -846,7 +846,7 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	if (rc)
 		goto err_put_dev;
 
-	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
+	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, 0);
 	if (!mci) {
 		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
 		rc = -ENOMEM;
@@ -854,7 +854,7 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	}
 
 	mci->pdev = dev;
-	mc_init(mci, dev);
+	mc_init(mci, dev, dt);
 
 	rc = edac_mc_add_mc(mci);
 	if (rc) {
@@ -863,7 +863,7 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	}
 
 	priv->mci[i] = mci;
-	priv->dwidth = dt;
+	priv->dwidth[i] = dt;
 
 	platform_set_drvdata(pdev, priv);
 
-- 
2.34.1

