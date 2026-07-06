Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F4B32E696
	for <linux-edac@vger.kernel.org>; Mon,  6 Jul 2026 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783372914; cv=fail; b=h/6QOupG2cgOa+hSXP3Of2q4Nq+y6LQNvlnxlCxb8HcHoVlwIRE1x2Hn4enbyHrisHYZo9iCR1mFejLcmpJoFZMSkAkUaezXbW/0ZyGRgfUGctiIm1jQKPa4OpO03zC5YKY3VH/j96iZxFD6Uka6ltf/ka63wyczxqN93bifeF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783372914; c=relaxed/simple;
	bh=bY+H716Cl5pdHzU6VKIYKeoUlggIEYu3ec6yLMPVZDc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=stjkXtn5juegF3pDUzKoaNdQgpf7PrCpZ53Vm4kbjrGN2AQ2iurwyqyMIHMLtNBWOjsU7Q8Es8EsjYILAUcoixDYtryUD8aNI4ai/FczFNj6oH2MU1Aw5O/qrelni6w7PyKXXzPmOpdWaDVnVW/pTy+UlCqw/QJYcbtluK7ilIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q5h66aPw; arc=fail smtp.client-ip=52.101.43.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q5h66aPw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1oz0TSf50VvSKiOJIKUbMvoR6g8mI8H6mpa3oFkGdXdgGwY5XY0wCIyQwhEsiEnVtzVAWUvnbzuZkTmmkLRc+ULCm01FmszyKy2A5IZBMTwDCz1JNg4zv17e0LeM0j3pe/nsjC9N+HJ1tvJNenc8GgM1ClOuHVyD+atnK6hy4ZpofgDBLGMHxJUoYEJXqhzPveym4V0ZwIBXjAkVgH1FIjIRXSdsfv/KmXysl7+GRrvIqdGePKtgMZUMQrTDtqKh9II5LOHNIv//tBwi0IBR6ArMWW08JEuLDWObnfAcNcj7RuYW12wblggbc0C4eDGuTXiHdWMDr5UuWK1pAHj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLv5jR4ZCKe4H82OEbTubNF6MJzl5Y9BGrKDjpvNRzA=;
 b=aRSbnAhjkQanzbu1gigd0HJNhX6FhcWAIolnr1qs4fxhVkkuMNQE4kHnqc3xYV4KTpIRpHKqaf6Cc1XxpuFSXxCvkVyV2W/3e4PNSao6GgqSZUJZlzbL2kMz3AHam837a8xUFuQ10a7c7reImei5h77Yx1THOyNpVthTA9rO2Lctub0xEduxhSsIVUoJ3u3pvS12Gvq7Ru9/FZYY7tTNxXxcPbZxdycv9qSW2qKJgKkTmtv7oJAKJx0jnwmOGK16dDwIFnrFpss6K77piPIOcZ7zah9tQjfjN0mQaGTGsOTfMkJMwN3Hx9WHGElOTza2ToR5pmInS7fBeL4qFyOFBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLv5jR4ZCKe4H82OEbTubNF6MJzl5Y9BGrKDjpvNRzA=;
 b=q5h66aPwM2mv4n1xkzQ3U5braTtKylVo0WZJ8TXMCRoG8m19pEaS3VVkJCmiN5eahIF+vKQDvKkOVSDB61vVsLCsR5kLNzgYsNr2ZtZmgJKeaptwywqh/q+HWF6ft1YVHIrNxe2tYDAk7aHEsxcKzQzVdE57k6ogj4LBL2exvvc=
Received: from BLAPR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:36e::21)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 21:21:37 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::15) by BLAPR05CA0012.outlook.office365.com
 (2603:10b6:208:36e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Mon, 6
 Jul 2026 21:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 21:21:37 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 16:21:36 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <yazen.ghannam@amd.com>, <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: Mario Limonciello <mario.limonciello@amd.com>, Deskhmukh Shrirang
	<Shrirang.Deskhmukh@amd.com>, <linux-edac@vger.kernel.org>
Subject: [PATCH v2] RAS/AMD/ATL, EDAC/amd64: Only load ATL when needed
Date: Mon, 6 Jul 2026 16:21:15 -0500
Message-ID: <20260706212116.1221949-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: a35beb35-4a84-4978-f968-08dedba49072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|18002099003|13003099007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	WtOce0gWeENulD+SXu5PHBfiGxbcLuKfdm4Lw0Vxvy+ycBeJjnccGljFMEBv1RVbhCcQ+7340KHb2Sw5dGVRwqTVNP08JYzx0BPp34P+TrUONkCYhGGo9R0vSZ8WEHtpNHRKOT3uYvASh73qstXwLP1DMUdz9iJQWBEjEcYZayFtlRC+9Jqev3OTzx4y2cX8p6DEEzX1UoDF5tPeXmQzgWScfJz+PS5PLThLYCV+nnBWq9tUTiCz6gtdQWpVy0mxycijcvQwDWwenyQKImYBOy+F5MVZ0aZMrn/T5k+J6wRtRORoQZbDy/WGVFft4ZSoaNMG86qhDuzh9UKlt/elYxotzwC1+NTZOucs+qLyYCfnO0O27vkSutJwrr6jfwmiIsoqKZjWU8D3xzlFuJqgAwkLKVzjCx2OVyfFwOz2KdjC74s8rvDpme9V9rqkdMueyul9b/KmecWGkeAXpo8QwntjB/jqRHhF5VQ7qi6jGKMvSmya0B4+6meWC24sdcbgZVIA4jd63JEABIB0u6qFlUNRb9yZxGcRF5TChm1dseJB1VfUjI9IzMP5+3N5H/rFYL9qM+JDcNQymkgTkOGY6bxD6tt0YsfT9J/dI7Az0D9JC1EBL2NcAQ9KqqsXeVjT+Hv40dsL+GWTKqa/o68YZ1ND4O25ZmIbNHrTiolN+zuKHYYhfGUwLC+LrY1htgcIQKQKaLES33RecbJTupjOcg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(18002099003)(13003099007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vPTY2TR60FXvARVqzhrWGHfw6D/V42I4vbps0EcZdETSbqOoKQKdC/dC+kl8Llfsua/Km0ncamOCRsuLPJxHHb46r8sXc8nyA0cwmEVBqx5ib44N3vfQuJ7NAvGcbYjTCB0RDgNVxLRqs51CIGwSk3TNH1DMPY3A4k+fe/aKyww8OhpKOneNn94FqoRBpNIg1Ctr5pBbAzlR2p/KFxBoMScQgdGR5I5xHcTPhsH6mcyeeN2fWNxqnEnD9yWjOHZFJ63XGy5NImc0Zay0ngYYJPM5vjiTKUIEsG+Xi1Q5VXBEAwhSrunh5CwxZPfza5aS8gZej1eyABeQY+GNnLZV4g11PDgXiTs3NRyo8mgNZpqNIhqAyPNg35OCgQMZ2ggc0zF3OwRXh36pGG1Bg/fiY5jR4lEDEGIPGYb5Wj2BKZE98xpCzRjK8ERWAKSnvyMV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 21:21:37.7334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a35beb35-4a84-4978-f968-08dedba49072
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030

From: Yazen Ghannam <yazen.ghannam@amd.com>

The AMD Address Translation Library (ATL) will attempt to load on all
AMD Zen/SMCA systems.

However, only systems with DRAM ECC enabled will use the library. Other
systems will fail to load the library and produce an unnecessary message
to the user.

Remove the ATL module dependency table to prevent autoloading. Request
ATL to load from EDAC once all system checks are complete.

Fixes: 3f3174996be6 ("RAS: Introduce AMD Address Translation Library")
Reported-by: Mario Limonciello <mario.limonciello@amd.com>
Closes: https://lore.kernel.org/20260305154528.1171999-1-mario.limonciello@amd.com
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
Tested-by: Deskhmukh Shrirang <Shrirang.Deskhmukh@amd.com>
Link: https://lore.kernel.org/all/20260307144910.GA113343@yaz-khff2.amd.com/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2:
 * use request_module_nowait() (Boris)
---
 drivers/edac/amd64_edac.c  | 2 ++
 drivers/ras/amd/atl/core.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index c6aa69dbd9fb1..475235c402e88 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -4173,6 +4173,8 @@ static int __init amd64_edac_init(void)
 		goto err_pci;
 	}
 
+	request_module_nowait("amd_atl");
+
 	/* register stuff with EDAC MCE */
 	if (boot_cpu_data.x86 >= 0x17) {
 		amd_register_ecc_decoder(decode_umc_error);
diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index 0f7cd6dab0b0e..d77dacdd4f569 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -190,7 +190,6 @@ static const struct x86_cpu_id amd_atl_cpuids[] = {
 	X86_MATCH_FEATURE(X86_FEATURE_ZEN, NULL),
 	{ }
 };
-MODULE_DEVICE_TABLE(x86cpu, amd_atl_cpuids);
 
 static int __init amd_atl_init(void)
 {
-- 
2.43.0

