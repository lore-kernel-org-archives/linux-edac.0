Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CB33E170E
	for <linux-edac@vger.kernel.org>; Tue, 30 Jun 2026 05:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782797211; cv=fail; b=grvmtX+GSmuZ3EG5J8ZA8RZWBwA8DCB50BKpRpcZQ4ipSAsgsL4FHgkfsxhYHnuJRV6qTizUyrKy/kqBTcPewPgiI/NmmCA6NVkbdm0hUeupFKxHjQpaXDI7JSI5ZyoLZxqub/OdMtSLk/Z/fJwBUzZpksQda/ju9yTOE275O1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782797211; c=relaxed/simple;
	bh=FIxZPLXFq9ofMnh9BBN5tY+OAf/jgGNzGTy6+gLsFZM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZtCSsvR6RRwKefnV5f9Z4stlZHq93P5uxddjIOtWp71fBzrWm2hyglIR7224SqtKcjYfOzkrUFO6m3rHFchnb8Gblqc9iFALQwn9a3N7h8nQ5go5w/ubCs1HCHzkUj+OHO/VR/cC3v8Yxugl6vw6NDx2H5iobhjBCY8RCYLjSOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0ze7u59k; arc=fail smtp.client-ip=40.107.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0ze7u59k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyXK9Nb/Ym8uI6F0PX5YG0HmsZuCPebUFXpir7pk3ZYmXtFnbJ49qpbTMjaD2r2B3XOAQGW/8p3xGPyDpQ0Heo8x0InlrmqtWcom5xHdw4o0q1iX791G1H3wDMnWYfJOlECsQcF9QYsMXOwn7ZatoMwUjAFCvNyikFSuvHWmND8XXM7R/kQ9VVMspwRcSXdGm9y15LBt5Oen57NKPsufMd7RUzTgw9cJtGsXQtyXmNXeXRgPct9SPFP8RKKjzTIAyTPcbN4Vqh5eqLTvI/QzkJ6OX0DViAvmVY4+LQswABXXp+fzRyxI6mgSwkaXxudfN1K4qJUi62CENbTUDy9R7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfIZiE346ygtPvEOH497jNZnQe8CaSjHkkxjY6k7/zw=;
 b=XJ7CyC712mwa9VzyHybkzKIUxHVsmuPF42/nPqk35m1LB0pYuRP08Ro82T49WezLKgxK0q9CUSCftsXocBHbTK8zJo7OoL+twjGBYBRlAG4B9mwEIZfFn+WcIV9B3USzi330g+jVcjnxki6qe+wewSiHtaaoOawLOra0Cr+L1QJDhDcdC9CVEm9NH9zFh9zMO+qLJhVvxmW1V88NJvKSxelEfMkt32vSS6WgKBPa3JSttBYbDxrpI/v2mSxvXv4ksC3oL1fUXYkBlup0dhcodVOpSYl0VD8T8eTdTcMOZhzLRt+16mK8EY4JlifhR4UtUONxSvVySS+BcdpZ22L5Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfIZiE346ygtPvEOH497jNZnQe8CaSjHkkxjY6k7/zw=;
 b=0ze7u59khYSDNjcwDHeuBq89H4AmvQAwgN/6bvr3aSEQVCHg0JbXg+AscvcfcFZNz1NxErkBeRAh/RI1TZjpZ052KPPEmzOaDAKKwbJL8JkLKZisU7q45+FzSx+0Urzwt3DlUN4F8xBHuL+s9kExVjtaJuYutYvG04cA/MCpc5Y=
Received: from CH2PR17CA0018.namprd17.prod.outlook.com (2603:10b6:610:53::28)
 by PH8PR12MB7448.namprd12.prod.outlook.com (2603:10b6:510:214::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 05:26:44 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::11) by CH2PR17CA0018.outlook.office365.com
 (2603:10b6:610:53::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 05:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 05:26:44 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 00:26:42 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <yazen.ghannam@amd.com>, <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: Mario Limonciello <mario.limonciello@amd.com>, Deskhmukh Shrirang
	<Shrirang.Deskhmukh@amd.com>, <linux-edac@vger.kernel.org>
Subject: [PATCH] RAS/AMD/ATL, EDAC/amd64: Only load ATL when needed
Date: Tue, 30 Jun 2026 00:26:05 -0500
Message-ID: <20260630052610.808707-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|PH8PR12MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: b4211c83-0863-4e25-d8b2-08ded6682c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|13003099007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	WnwCmS7EsCJfs2x9+4Hc/JTFsLg7XWAHB33OHop6Uyi8kgCiU1lDm33XAFZ8Eone+Iw10tK6mC72/IRcpDzVFt8WjczwB3NUXvL5PcKMtZMj32PvvBgk24M2h+IJH+ohQaSxaipyBFV/Xj99tBmDGH/a40rF0RRQY13zDEEfLrFpdCZhP10+EN4WZlmACNLk+snwKu67X9AnqKaI6gS+CPP5lsgcQqvdGk7IA5RwKtCt/c5GJGzG/gFcyphOQ2EBM33DlY+AOoHorXZonH4GQG7yzpEUSP3jR5c0vUWV8hbNWDA0UPJNIblHKdC5yGLjsOjb5oqdWFZQtudMAy2nS4QVI+6Zf18MbTIA0QkzWwsHH5r/IlepbYw+JsAT5h2LmBvXMpI1QeJjOWPxbIs0uNYE0zdwOXTFbsJRarRP0zoRSqWJXNB/jCWgk5r9jwLq61y7y7XlC0ge4YY4vBhfPp8oWosgBAhHMn8G7DTvtcC2ZGRR8l88ImD6GA2JN94nutX5HoHydQWuC9yfyax34gK9sw9N+ePpoHVowWIdohDAFfUxOGNhT5IWLZPfGAy0GT1wDATliAR5xtDKxdi9ED/tRso3hmuP/cWMhtJMBmtuGNOyYU50g2c5cFstES9fC5sROnya+47Lqy9km6Imt0Ip/3Lev6u/+a2x4qcyvIiYRTiDmFZcrx/I4k2Tx2+43MIjHQKDawAnEEJjgN4QkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(13003099007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pSKBn9XZAaGIzaNdavGWv3xPVT56P6KqiLBFOr0VbzME8eI2JhnAkL+vBqw/WraquHPaC1rB6Lx3jreTFA/NJFxgorNKzGlSXPF9xiZjuoVcVCjUWSVPqlXNJ39oNII65k+6KWLy417xxcl/wB5p26QyHKbGF+bq0VOiuEoODy3FW+dcqAlSws1urVAcg+qJfXB2wCXl8TmmcPAXEig9u42mc3/lntsV8y59AmN5zXH9bqs0wTUo2F5KiNoS3O7it6ui8vdrmsHT7SYZ0L0TfrcZBLSB9/93aCl04yDpVgtulyeY9theLstH54Rw05K4778HmYS1/4VTVDXVVLIFalbcJwG7jlxhyDKvrOgOqcKDOQx6pqesKbzji3UkYoqxjMBvd/7ZKDZj8PWoC6ZiMe/hxYBS0fZN+3V0LX8bpur26eN27HEE99gSJRXlsMkI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 05:26:44.0352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4211c83-0863-4e25-d8b2-08ded6682c46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7448

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
 drivers/edac/amd64_edac.c  | 2 ++
 drivers/ras/amd/atl/core.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index c6aa69dbd9fb1..01b1e569d98e9 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -4173,6 +4173,8 @@ static int __init amd64_edac_init(void)
 		goto err_pci;
 	}
 
+	request_module("amd_atl");
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

