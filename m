Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013035.outbound.protection.outlook.com [40.107.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8E62D73BD;
	Tue, 30 Jun 2026 21:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853687; cv=fail; b=FVKAEbKBIi1zfe3srSkLECSBeLVXMtm00ZIBKSF7S5AS11oZQl6PkWenuxM9gVlyct032purmFE0/0IR1TaYSgFHr2t/RqvxnPuFTZ2LgBwPI+HRIpXKCJ1IzDHIOfOr9EkSPghs3B+7RtiigeO/i2LYpAMmnnazTNvkyY34JuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853687; c=relaxed/simple;
	bh=EEfNekimH24UUkhnuBuANGZgj17idHjI5D0nfA8wwwU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdEGOG5zG+tGrNqX6JPH9Zrf9WVTaMadsRABTI5FVNTs1GRwC2CQnnR8trhJqzLVIsYsCMC/lPmnNc8AKP2oJVEJZ+g5kwv9t8KNZ7FIe8Bv12jdb2X75SXcNG/kRlodffHjeZpg4nfrdh6oTcd0T9M+heCzzoxNfcBrHlYHlB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ENDYDjcp; arc=fail smtp.client-ip=40.107.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ENDYDjcp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkAGvqjJO2d2mF/Td4UTPrdMaJ41cNmjKeJm876SEfx9u6QrFiiiY1NdgWkWtJgoJaC1nqt1NSKjBqocx5SCZKV0qlZwTB8m//7jMtKe1M6wk8705sgP/jby4BhbrKouQiZ9KK7grTfb31EyDlocJRkjviHx3LESMTdCbBPhdBrdPZBUMR+4j26VQ7J2Ll2ATHukAJ4LqKBDQlMfOHkDgUrLTJI5v/5kN8TtLuoISJw6m8VFnU73NNPsvpBGvF8ynbDDAXLnDDGMVqEjHlGUro2XHuI5XBvGbWmLW770qsZI8eyHVs4B2VmUaZOMr/jv6DBx8pdp3a5MgBRuTZdnAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0S7OabnBGBOSl7skcJO/JIRdgGqmLNDujfHcqpB58gA=;
 b=qG3C9H7CAh4Zi4o+FgUL8SC5k5YPwDv8ecLtDABFctRxOGob0BCy9tGHM6BjK1BRCDHk45cAJcLiG2sJBSYIfz5d+3DFox5VicXpzi8weqBF112X5KxBOQu/e3QiF5C6L/yX51VWCl29pCj1wIAjF1tMteEAmpd4qYzkz6VSMGBuRJCILs4TCp7pNRh3rI29OKHgJEAmVJB14i7MDcRJ1eTi05dehH8eOcnlJyUaOL7Bu0MeqotHEqqH7M9ZpfNZFIYdsmEnbMieR+dnacegyR0RXhFaDsiTlicUeK6kLGUYN+41TM3YYaeWsgHeTZOebfhSsxx7J+zDno4Zd2e3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S7OabnBGBOSl7skcJO/JIRdgGqmLNDujfHcqpB58gA=;
 b=ENDYDjcpuxMwgNOUlFCjML7hl1viWGozSxsHf1/xiyaV/74uWLDxGcsieXcpjwY1XT59KpQiyT4XgmqDaN8Gaa16nTjEl7Wz6OBnTVz6eY7wwEzS4Y8IFJcCxuDL/pKyCOyB//nD2aX5Kyl8NI4WaEhI5pA4AikMpd2pcQ+2xJ0=
Received: from BN9P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::8)
 by PH7PR12MB7332.namprd12.prod.outlook.com (2603:10b6:510:20f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 21:07:58 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:13e:cafe::47) by BN9P220CA0003.outlook.office365.com
 (2603:10b6:408:13e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 21:07:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 21:07:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 16:07:03 -0500
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 14:06:54 -0700
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v7 1/3] RAS/AMD/ATL: Directly export address translation helper
Date: Tue, 30 Jun 2026 17:06:38 -0400
Message-ID: <20260630210640.680758-2-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630210640.680758-1-yazen.ghannam@amd.com>
References: <20260630210640.680758-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|PH7PR12MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a9d6cc-6eac-41c8-7b0f-08ded6eba94d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|18002099003|6133799003|11063799006|56012099006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	1QhklPOfiszdXmERC4Kw+E700lRHvh71nzV8nnNsMkCqyJcf9nOMyYvX3cQVMopN+C7ew4chillVEzItneP+HjUIzSdZCeZGhsGQZLZwUM+TZLE2e6FM2GKigS8tR8xbI/BHU8v1Sy0ECWW2Gf39+blcOqKkM0Tt8WI0aVyWz9yi/WD2GAwLubMoAgOG4b23vtMcvM7nmbWrApDNeGhAfVkkyR77PLGDfl7fySbrSsAyTnbyZvAPaR1KP2aGQtpDedFqgWcXsLKYqfxjIphntos06RUuJmsfByBh+rlgm/PBQ6WcSKEax1yt5MQoUTHaX1wNW6TzSddnQRS1G5XB6Adr2OgCYiyXVCRktKUHRzyGyEV4F+RAzVXu/J2ufu4i4IJsgYsw8nDGw21mhNQ1zvy4Npa9IRd7c9qs2PIVWzLps1wUX4STuMW4562AjwU/2rTu4sy2jyNSCpi0YQyk2GNBt/ORFn7wXra/lauPl3DJCHk0F9SN6NBRGcZ8Q0LhMwBbBfs7/d7db2kbRu4RAwJnNSJe2dngHAoJ2sjbdv57c7RuzBreRzmTv5sTJpUgumMhDe/ND9uXRtvadQWpt7xz3XsAxqHe3xoFYuVg2vFBeYwLQnoFGLLnmcfO8qk9dNEkP/GYyfgf2udoOfdSfQQPes1dlY0swOPSXHrUElhhjMP8EB0CBDiYZHa0sF3sGfzAqKIC+wT0pEyGWgRazg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(18002099003)(6133799003)(11063799006)(56012099006)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gd7ljv9MllxCYUp2uOUFq5B0ZOeQwd4WVEw7d+46YMCWMeM6HWcI1Fq4loLa/EuwB96VVq80mup6m//vo5gMcCcsc3qX6jsMABuMEmkpzr5hqIBoVbIVeRcfIUi0VCNiXATjzWeKNR4w1uRs5UnvbSlFf0UoPTt/cAWg2skpBL4IDdGkxzQwQlY0BJ8VppAcaLrUm8M6l/b3VS2T+FylYIW98/bCNyfsj52pqSu9znVFiXJmYuBGTsNGS60kWcIOOi18N/LaH01VBNlzimckEpAHMyEi9lMUoC+7qdber1626CMpwmJWcaympifWVbX8DrWzcCMfqv87oQ59fO6oX5zqIh5YX5jQEQKBL6rXlq3BEX1cL3XCgATRLi3VpEaaM7308C/Buc9RVd8JUyFllJkAOFIiXAWSaK6KNLIY0D8oq7vnKsY85mS/4Qcdbvm7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 21:07:57.8892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a9d6cc-6eac-41c8-7b0f-08ded6eba94d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7332

Currently, the address translation function is accessed indirectly
through a function pointer set at module init. This is useful to allow
the translation library to be built as an optional module independent of
its consumers.

However, it becomes cumbersome to add new functions in this way.

Remove the indirection and export the current helper function.

This introduces a linker issue when AMD_ATL=m and a consumer module is
built-in. Address this issue by using the IS_REACHABLE() config guard.

Also, shorten the helper function name a bit.

Assisted-by: Claude:claude-opus-4-8
Originally-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c  |  2 +-
 drivers/ras/amd/atl/core.c | 17 ++++++-----------
 drivers/ras/amd/atl/umc.c  |  2 +-
 drivers/ras/amd/fmpm.c     |  2 +-
 drivers/ras/ras.c          | 31 -------------------------------
 include/linux/ras.h        |  8 +++-----
 6 files changed, 12 insertions(+), 50 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index c6aa69dbd9fb..880036599456 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2847,7 +2847,7 @@ static void decode_umc_error(int node_id, struct mce *m)
 	a_err.ipid = m->ipid;
 	a_err.cpu  = m->extcpu;
 
-	sys_addr = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
+	sys_addr = amd_convert_umc_addr_to_sys_addr(&a_err);
 	if (IS_ERR_VALUE(sys_addr)) {
 		err.err_code = ERR_NORM_ADDR;
 		goto log_error;
diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index 0f7cd6dab0b0..49695313f850 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -192,6 +192,12 @@ static const struct x86_cpu_id amd_atl_cpuids[] = {
 };
 MODULE_DEVICE_TABLE(x86cpu, amd_atl_cpuids);
 
+unsigned long amd_convert_umc_addr_to_sys_addr(struct atl_err *err)
+{
+	return convert_umc_mca_addr_to_sys_addr(err);
+}
+EXPORT_SYMBOL_GPL(amd_convert_umc_addr_to_sys_addr);
+
 static int __init amd_atl_init(void)
 {
 	int ret;
@@ -210,23 +216,12 @@ static int __init amd_atl_init(void)
 
 	/* Increment this module's recount so that it can't be easily unloaded. */
 	__module_get(THIS_MODULE);
-	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
 
 	pr_info("AMD Address Translation Library initialized\n");
 	return 0;
 }
 
-/*
- * Exit function is only needed for testing and debug. Module unload must be
- * forced to override refcount check.
- */
-static void __exit amd_atl_exit(void)
-{
-	amd_atl_unregister_decoder();
-}
-
 module_init(amd_atl_init);
-module_exit(amd_atl_exit);
 
 MODULE_DESCRIPTION("AMD Address Translation Library");
 MODULE_LICENSE("GPL");
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index befc616d5e8a..b59556ded2c8 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -318,7 +318,7 @@ static void _retire_row_mi300(struct atl_err *a_err)
 		a_err->addr &= ~MI300_UMC_MCA_COL;
 		a_err->addr |= FIELD_PREP(MI300_UMC_MCA_COL, col);
 
-		addr = amd_convert_umc_mca_addr_to_sys_addr(a_err);
+		addr = amd_convert_umc_addr_to_sys_addr(a_err);
 		if (IS_ERR_VALUE(addr))
 			continue;
 
diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 4ccaaf7b70bf..48ca7f598387 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -334,7 +334,7 @@ static void save_spa(struct fru_rec *rec, unsigned int entry,
 	a_err.ipid = id;
 	a_err.cpu  = cpu;
 
-	spa = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
+	spa = amd_convert_umc_addr_to_sys_addr(&a_err);
 	if (IS_ERR_VALUE(spa)) {
 		pr_debug("Failed to get system address\n");
 		return;
diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 03df3db62334..011de2c257b1 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -10,37 +10,6 @@
 #include <linux/ras.h>
 #include <linux/uuid.h>
 
-#if IS_ENABLED(CONFIG_AMD_ATL)
-/*
- * Once set, this function pointer should never be unset.
- *
- * The library module will set this pointer if it successfully loads. The module
- * should not be unloaded except for testing and debug purposes.
- */
-static unsigned long (*amd_atl_umc_na_to_spa)(struct atl_err *err);
-
-void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *))
-{
-	amd_atl_umc_na_to_spa = f;
-}
-EXPORT_SYMBOL_GPL(amd_atl_register_decoder);
-
-void amd_atl_unregister_decoder(void)
-{
-	amd_atl_umc_na_to_spa = NULL;
-}
-EXPORT_SYMBOL_GPL(amd_atl_unregister_decoder);
-
-unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
-{
-	if (!amd_atl_umc_na_to_spa)
-		return -EINVAL;
-
-	return amd_atl_umc_na_to_spa(err);
-}
-EXPORT_SYMBOL_GPL(amd_convert_umc_mca_addr_to_sys_addr);
-#endif /* CONFIG_AMD_ATL */
-
 #define CREATE_TRACE_POINTS
 #define TRACE_INCLUDE_PATH ../../include/ras
 #include <ras/ras_event.h>
diff --git a/include/linux/ras.h b/include/linux/ras.h
index 468941bfe855..4b095ddb9071 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -41,15 +41,13 @@ struct atl_err {
 	u32 cpu;
 };
 
-#if IS_ENABLED(CONFIG_AMD_ATL)
-void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *));
-void amd_atl_unregister_decoder(void);
+#if IS_REACHABLE(CONFIG_AMD_ATL)
 void amd_retire_dram_row(struct atl_err *err);
-unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
+unsigned long amd_convert_umc_addr_to_sys_addr(struct atl_err *err);
 #else
 static inline void amd_retire_dram_row(struct atl_err *err) { }
 static inline unsigned long
-amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
+amd_convert_umc_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
 #endif /* CONFIG_AMD_ATL */
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
-- 
2.53.0

