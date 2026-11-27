Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797545;
	b=B2kfE1YWmgrMS0Z11ReBuJ8LdHrF1LXgARPc+5u7eQON0SzwXgfaYMiEyjdv21uICRxk
	 bYpFXxmVFjdN8WwA4Qlu9w43WbHLmqzN465vGFBskWb6xmK5AB/A5wc0sWYnjwDxPL00B
	 D1Ol+c1pnLugOgrHD+RrkmXHl6fQ2Uuhk2x9xqsVYgIYYIQAZzj9cqWZjJZznIGlbs81/
	 A3ixA7iF9mEjgfli6tnR2CWVhYrgZFAUir07s1dfffSwleVr595FhqOw2fM8r7MCj+u1D
	 b5x+DqTs+OHpzINWPEBXKXGooI9mqjfXNCyMzLtU6bhaiJtbXx/i3E5ObCUcM1dO8/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797545;
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
	bh=FSQIaSMcSI/wWyy+rk+i+Q4LxBbvj7dVfDBaFeTMcS0=;
	b=jBWJ2QWwwWBcgXrlG1qnzdjAbVfi/4MjGvBnteLsD2j3NXV1eBzZ5Ac5zoWzSE0jViE3
	 uxwt5iOUQN3D6t84xECbx8Af7Wz98Uf57NYys4gi2LWE7lXLBxoQkmd5Qa1QU1OqAe4ng
	 asmyn6KMqNisYS5BA8X3HweneZ42sUqB9gytGkXUor4Hf1+WT/9rgPPhS3C6kK8mylpvW
	 hPSy2Q1nrmX8cxlVlJBJkskC+YCXYK6RDbVTNHobhe/RnEQ/uJDg0ct51aAhRKbBoJfji
	 DpD0x8alPQzv+kw9vbJXtQVMnjnPi5+v5BhkL2fQB9eh0DELgk/Zm55jz5jnk5DTn0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NwnEgfRj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.69
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013069.outbound.protection.outlook.com [40.107.201.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2EB606A321;
	Fri, 27 Nov 2026 16:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D2EB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NwnEgfRj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhW4j8JRS+YZRdVqQ4wPqx9Q9oe4S8WZR1P/+35usUPxAzdrSPheEpZCrDB7/Yp78q+dXGNnGRrUiUKtaDTx/Ozce/Vol2/O9DHYnIfDufTwruqOEiWybN/bDK6jm+vmwk7BATvR2PS3K4Yfh0G7u4OPaWVSYAyWEOZQ2DumvbYLixPG9lDMi215pbCEzD3uZP+G0HuCEVE1kNy91b8oEXKHAoNDI2X7AAPNChGLy4mc6LxYVKXWWkU3+SU9PBUqD3xtgWfKJnXvkNQcgf0QndR7XHMNC0m0gXRkh3S3f66CQSioizN/h60XqsCMhxTtoeGXqxqwkeKT4Un1pGYMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSQIaSMcSI/wWyy+rk+i+Q4LxBbvj7dVfDBaFeTMcS0=;
 b=dxty9xWBrF/kn13sYdhbvrC1bPZTWR8EQu9bZTlK2HYAJVyUNqSCyOcfsxLpCf6bHhBSFfXsel2SWpN+kQ7kOGz6MrY38gnYP0KUZAhvkF6XiO7FqRTiO/J2GzbN96O1FUJkwzRy+QYV7Yo7v2sxKP5yiYzFtxH0wDHh0wjUjun5khJrQsiB8cFOiRRVtcP1FSUQ3kt5LfLa8+7chjptfu3wgN09mKOJFFPsfn/1KrOqMuprbdqYmx9kAu4I4UJt+GXhMUrIECgPEY7JjAhwUGGa66b494TkbQbYIt8UPQYpjpm9oSVzquB+cSVzlTf3OGYBal5bE5l6JVExtK+8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSQIaSMcSI/wWyy+rk+i+Q4LxBbvj7dVfDBaFeTMcS0=;
 b=NwnEgfRjsJijaFzriJAgk25xTpU3m080uoEzFeSWX4QIYDUy+X7FKo7fH1w8rJi10Oh+Vntb4St29yYT4UJUMvXHDgaTMCKBVTGMzbeCzgi3/4R43ohuJFscSlIpybXUeyxZT8c9/1EVXy60waQ57QsccvaAMxSgaJIuuWhi43I=
Received: from SJ0PR13CA0003.namprd13.prod.outlook.com (2603:10b6:a03:2c0::8)
 by IA1PR12MB6065.namprd12.prod.outlook.com (2603:10b6:208:3ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 16:39:00 +0000
Received: from PH1PEPF00062F2E.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::a0) by SJ0PR13CA0003.outlook.office365.com
 (2603:10b6:a03:2c0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5 via Frontend Transport; Fri, 27
 Nov 2026 16:38:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH1PEPF00062F2E.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 16:38:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:38:58 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:38:57 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 27 Nov 2026 10:38:54 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v3 0/7] EDAC/versalnet: Fix error handling, teardown, and robustness
Date: Fri, 27 Nov 2026 21:59:09 +0530
Message-ID: <20261127163853.3563991-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F2E:EE_|IA1PR12MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d87bc94-f2fa-490c-fe2c-08df4ca4f041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|56012099006|10067099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261026140227099003|261102123227099003|261026121527099003|261009223027099003|18002099003|11063799006|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	xxUQO+VKJA2LvLcyhhOCPaF1m/qVNr+NukpCXeFdgScXtP9+Md+1kwQtTBKVWHrskNJrx5K5Aunnp34jSKyTBhfc1R8AbHOLotjWT5uuhDAhdxjGm6T1zV5w/xATneM/mQfrko0kIbIT+KYqcnQErb0pIWfjNwAiyieKZ4NkXE5YP1qDAT/r0yTPdx5c+ueCMQzgG1Mhp7JgjBhpk7uNnNX8gM0s6dkfNAx8KwwlNy6kkG4TBEwmsl0PHmhrs2ZOgK/8y4ErUOcJPVFhmhzQK9j6D2fR6lV3gnvEU/OV2Yx8WmOq4/xpaDAA/iSk04e0UYg5n8CWS/kIFlpG/0PaSi49kaT+JqrU4dsH9JOt/jRRfdZPM5x1TsaLuFsAVmI6uDgEEf+nVzvHPpr7PgnUTmiKPf+nUO2jq6zpHF6z23cOEAh5E1n7xejQoh5OkKvUdV60RZtaQ0sQbsE/V7C74liow09yagLz9p2v8EkpQlJVhEUXmYiuTRXGW4HXcKYIKRQsNsxKi23PXK3zq3jZ+kgLcMLPwg8rl+660jOIRVSdz8Qjw/zaYy2U/CcyXSdlI5xhIToc57gquExZ2B5O56x18KQWWdGQwgf6MsI+v5hVPgCWx+hiyb+i4GfLx62WF6Y2U1xjjUYJs4TrQwZLA3fkXzPwxrFcFah2LS7JI2E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261026121527099003)(261009223027099003)(18002099003)(11063799006)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wKZlcf5I1tj7xzeFozQ5oRMge01PSJZfSDyMl87LGnoJdAsqVJeqpmiS+0PwES/hTu/QZyjaJ55FIl6G+WJiOKaWNILpTe4u5VMyW+KGTDmLx3M1rbCBIvC0ceFoWM4rSLBjj5HzNWAb0bnMUCFrvPqc1zSbdgoWYnEqbIJycUuUglhJz97C6Yl3C0Erqw1xZ/AzS0Nu+gCWGEJHHcCb2AGURoBuSlAk62pExrA+B7yOvIv2G94cx8Be065SsnUgmjopFGyMgtWyFVudqg0azAUNnqkJX/ObHr6O9swPMS3uApG8mAFbfUYCDc4eYHY6FTaIQBkMcNT0fawoXA7J4fBO7YipebARkVNxf/lNBZL7wPOjoaz4pNFX33isK0p8s6ZrCpVlZwtxuljpKSxphG4qzTcERgw/FNT5mwdrQ9fqiJ0/FqvGp2kDXahCwDy1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 16:38:59.8320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d87bc94-f2fa-490c-fe2c-08df4ca4f041
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F2E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6065

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


Changes in v3:
If it is a split message tben discard both the messages
Updated the description to dtype
Update the memory allocation in edac_mc_alloc
Update the kfree sequence
Squash the "EDAC/versalnet: Wait for RPMsg endpoint initialization"
Add reviewed by tag
use sizeof outbuf
Add a print for the failure
Update the commit message
update the numctrl check
implement get_dtype


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

Shubhrajyoti Datta (6):
  EDAC/versalnet: Add bounds validation in rpmsg_cb()
  EDAC/versalnet: Make dwidth per-controller
  EDAC/versalnet: Guard against NULL drvdata in rpmsg_cb()
  EDAC/versalnet: Make get_ddr_config() return errors
  EDAC/versalnet: fix the remove controller crash
  EDAC/versalnet: Move platform_set_drvdata() to mc_probe()

 drivers/edac/versalnet_edac.c | 257 ++++++++++++++++++++++++++--------
 1 file changed, 201 insertions(+), 56 deletions(-)

-- 
2.34.1

