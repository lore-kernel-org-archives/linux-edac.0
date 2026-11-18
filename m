Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011767;
	b=5a8/99HB5RsW8Sbk+90HDMrpBH3PEYipbBAsTPk1CFx+xyldC3mpxUvE5pOk2nASasiS
	 ND3Lgh6TxX+/2daVTqliwK1FAgzvAWXXZCaYOGPwElqwboV1H3YSRizIjJB1jdpwrq2zn
	 w2o9kQy1lPTW6lMSLmNjnxYmzd+tuM34Q8iJrhxu4JTLX1xvxzctBCXf2ZWpkAT+OfB4D
	 yrNjHow1hDgfvZGEmqU3kF+fHfDslt8JM2wQOwX2iYEt8iBdy+Xxz27407Wj8w13uiAl8
	 NhIeHtFpX4gGDYrKo4mg6HgtBlPYuh4DuZFjbd3Yq3UKnvPYMUxsI6WNFaiouCUh2vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011767;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=WoxcfhnpPuzNRYDSCyJtMQ4kLCnx1qJaNrbjgIMXG2w=;
	b=kxx02a11/CmpmoKyT/rw46gFrdd9EjfRiifgJkrxaBC1oq/GT4firqsOJNpqk14Rur+n
	 xzU3Y3BckiPUxBIzerdegfnZfpvuB7DHdeoxk4WpgeFTjMJmBp/cpcQ1xlXIFqyPbzDnO
	 qhKs2lhSAfjEaan1p+M3ec5PQVZ67CeEFAf50DX1ZJK6qWKZUPlC0Kku+9VsH3W1itvSf
	 f72xqbOqIczMXWxPKviCY5UI8rIx8HCeq8MacNEnXc2tNIlTWWbbIpwuzoFcy6dr5vGzE
	 1Qlk6YgftPIryhFuN1HNKDXrdlGZyzHoe0gIZoaLJgBg5pqN1RpI9oO2xDKfb7fcxhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AOEaK+K8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.5
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012005.outbound.protection.outlook.com [40.93.195.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FD8606A332;
	Wed, 18 Nov 2026 14:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1FD8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AOEaK+K8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crv5qPcL2mihfWoA2sAZTdUubDQn0ZcNnoqw+lC/RtxuPPi6qFwaw9UytYsFHQhIpbkBmLdAvZtIS0NY/Eov2pjdBg6chB67hOXoXDfEJaJbl1c94+VW9UOceFQYE04IBdQ+l7rIUAiXsIOeJL3ytn3QnF42Au/C6E+cgzU4zbxbIoIfjhOJe0oCef9pWO/B+E05O71B1gvLpvJjnic5rGN3OIXQw7iIc4Um9gGKxI9/TLvlUC3fzcSkZzwzNcn6aAqcxexbmcAADdFQBY9C3FrPC+XHTY/fQSFlo1nuKU/L5TwxHl3Gg0axrsl4RtTK+nWSTS8sZnbE11d6dkNV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoxcfhnpPuzNRYDSCyJtMQ4kLCnx1qJaNrbjgIMXG2w=;
 b=F89TRnal/lE2IEmNpuynExs6bUhDFyp012+YdTReVOkjTBUC0SgpixBWmQ5YVbLjRGa+k4P8BHlK9fI/ZvXLPCM5pP+XdINl+lcm5Od5IL3QH1HqOZg8TuqPXwIStQU1p9dUTe/nZWeDGFG5Bsc9KsMdUlpGIDGa1O9QYicfm2L+iEc+TI3mBXCiMQH+O3rxkuKpd4J0gSVSFAB4hEEqLqgSk9ywzBuTNuaQFFIxl+yIutV5KZygPxUBUYXgVZW8mNv4LTemKkfOo6w1yvb4Vp5f7WvB9kFQgEtWMUnddxn6ULqFAOHyBkeWKgI6G4a96BpBHEmdkgTkkPcZ/1pMww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoxcfhnpPuzNRYDSCyJtMQ4kLCnx1qJaNrbjgIMXG2w=;
 b=AOEaK+K86ZVAN39//xCTg4B9DQypB7Ft9x8NQpmkIlImwKTkLv5EYpOoXVoHAMAwaptWt36lLvatE33gNJvLKwUYc0/l88yqjFsxVQdR/NUhTaY0szrr8jfwkPCJE1Br8p3jEtewT5TSubbsHCMpZf2oqpEhCmqv1KE5+gup9FM=
Received: from BLAPR03CA0110.namprd03.prod.outlook.com (2603:10b6:208:32a::25)
 by MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 14:22:40 +0000
Received: from BN7PEPF000000A5.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::58) by BLAPR03CA0110.outlook.office365.com
 (2603:10b6:208:32a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:22:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A5.mail.protection.outlook.com (10.167.245.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:22:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:18 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:17 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:14 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 00/12] EDAC/versalnet: Fix error handling, teardown, and robustness
Date: Wed, 18 Nov 2026 19:50:24 +0530
Message-ID: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A5:EE_|MN0PR12MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: 54fb4e10-6e01-4df0-f4aa-08df457f6748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|18002099003|6133799003|261009223027099003|3023799007|13003099007|56012099006|11063799006|261026121527099003|10067099003|261028144727099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	oGq/d5S2Ic5OYOxtiAQWVNauS21Jp4p1aLvKFvt6HH/Jx3ZVyFIeIPY5fEbeNx9Tq8Am+jKfXFgeyz3KPjMKQWzkiNbND3mARCjZl6kNgjzh9UlsavNVXwP9BIWOhq/v3g6tgpJQqNyIUWsl3CWRTG6YPt1eaaEdONAjHkRDoa8tGn362Z28iQGBSCjMdxa3j8bLTDVsWj164vvC4ESjgqCyVKawN7zTduDjDBQ3XtuaMuSrxJdp8kjwb3+u8ifK2f3udEW5VbsLsnatc+xh2PfiY+2201aqDRByAD2XKHwvhYqqbwEbOamJV3LoQ32ukhk1mgAZui+JihbhXjqdBkdNzFMEuhb2FdNhRoeyDRu08dJWEEK0NhwYu6d4ZV9rCzicaP+MpXYJjnQDYAs8COrkkSo/vAG8Dl9lDi9xcvF21QBqxv9XvsTiDe2uereY33vJ2CDqUnMxDp/d1QMCZ8AJYYSwl6FBru07jhBskoBdepmg+/R4nYOBzf6R8yswjMCCDxPnqlvS41cXndZ07Nust2UU93vuUdMd6iv7qdG/02EQFoHdWpNDSh/4POXbrT2TovTtjPjjAIjNp5aitjUAQ65r5ufNR66bK5qAUQa1OzeSQgKx78fFz6QZdO/0GX86IJIj6NLr6tW8nHxh3g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(6133799003)(261009223027099003)(3023799007)(13003099007)(56012099006)(11063799006)(261026121527099003)(10067099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QM0ecfwK321CNOnGH3A6JyIVWmb+nCxb+xXLcVJucccfDf83vVkqyodf+MJkUHN3ddSY2A52epQdT+c4ReoMOqdTLbCm0hRM62H4GsN8ES3IxVdQqYpNNM6lZ4f5tdlBWF5k5AHuWyo6Nxb8Tlhy0raLu86B2E1EnkcF5Q0WOrDDqXXOdFjyTEtHdpGPR4bLNNMl0ysP/UJLZDHnrn8y+GhNBLGCPRt6O8oX6F2KFieTXkGhAPy3BMf36UOzQPQu0ZG4Pnt2S+/pgT4U+L2FcNUg9lQaBkZJk1xlOvyqB8jtoDS03BJGiYp9S1JeZsxfFbOOMzVsl88xfygPfJkFzJ+fEAPap/dnCRmE4Dbpom7wrt7axVJYul6+I/rMxlHXx3xsliIY1vv5Bkm6zfcJg1WIxJYWzUpA7rR26yU6cO2Kg8N+YJy8pCw4/KH4xVlM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:22:40.5420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fb4e10-6e01-4df0-f4aa-08df457f6748
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6101

This series addresses several correctness and robustness issues in
the VersalNet EDAC driver, including NULL pointer dereferences,
resource lifetime problems, shutdown handling, and probe/remove
path cleanup.

The main fixes are:

* Robustness fixes
  - Add bounds validation in rpmsg_cb().

* Probe and initialization cleanup
  - Move platform_set_drvdata() from init_one_mc() to mc_probe().
  - Reorder probe flow to initialize MCDI before RPMsg registration.
  - Remove unused pdev parameters from internal initialization
    functions.

* Resource management fixes
  - Fix error handling in init_one_mc() to avoid a potential
    double-free by reordering device_register() and edac_mc_alloc().
  - Replace sprintf() with init_name by dev_set_name() to avoid
    use-after-free issues caused by deferred kobject cleanup.

* Code cleanup
  - Use a designated initializer for rpmsg_channel_info.


Changes in v2:
Add the codeveloped tag and remove the non standard signature
fix the name stack warning
Use a macro for channel name
Add reviewed by tag
Sashiko comment
"This is a pre-existing issue, but are offset and length validated before
being used as indices?"
New patch to fix shashiko review comment "this is a pre-existing
issue, but is the per-controller width overwriting the shared
state for all controllers?".
Patch addition for the rpmsg endpoint race
Update the labels
Address the sashiko comment
"register_rpmsg_driver() exposes the callback endpoint before setup_mcdi()
initializes the mcdi pointer. Could this lead to a NULL pointer dereference
if a response arrives early?"
Patch addition for the rpmsg drvdata race
Add reviewed-by tag
Add amd,num-ctrl property to device tree
The property was requested in the discussion below
https://lore.kernel.org/all/34ffba5a-8e9a-49b9-9e36-c31d0e4369f8@amd.com/
Adding the device tree parameter was suggested in the review in v1
https://lore.kernel.org/all/34ffba5a-8e9a-49b9-9e36-c31d0e4369f8@amd.com/
New patch added to bailout if the cdx_mcdi_rpc fails.

Hayden Rinn (1):
  EDAC/versalnet: Wait for RPMsg endpoint initialization

Prasanna Kumar T S M (1):
  EDAC/versalnet: Fix device_register() error handling in init_one_mc()

Shubhrajyoti Datta (10):
  EDAC/versalnet: Use designated initializer for rpmsg_channel_info
  EDAC/versalnet: Fix use-after-free in remove_one_mc()
  EDAC/versalnet: Add bounds validation in rpmsg_cb()
  EDAC/versalnet: Make dwidth per-controller
  EDAC/versalnet: Initialize MCDI before RPMsg registration
  EDAC/versalnet: Guard against NULL drvdata in rpmsg_cb()
  EDAC/versalnet: Move platform_set_drvdata() to mc_probe()
  dt-bindings: memory: xlnx,versal-net-ddrmc5: Add amd,num-ctrl property
  EDAC/versalnet: use device tree property for number of controllers
  EDAC/versalnet: Make get_ddr_config() return errors

 .../xlnx,versal-net-ddrmc5.yaml               |   9 +
 drivers/edac/versalnet_edac.c                 | 283 +++++++++++++-----
 2 files changed, 220 insertions(+), 72 deletions(-)

-- 
2.44.4

