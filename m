Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40285366061;
	Thu, 30 Jul 2026 19:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440953; cv=fail; b=rqTfjDkASGfkccHjTDMibL/9Ke7UcqJfF8mElgZfUULp7+rp5BDSxOF+QdRAYS9piQMNXDX7UWbNRUnerykwy52KgwjddegrBV0OOewTMpcgD8sAdZHDA1ythZIq/8v0zAf6869QzezkNyYai8+u2cHzPBW5FoOytqCdOrJ4ztE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440953; c=relaxed/simple;
	bh=mboU76yf0WonvH/c6nQmOE3uHfuRaLlY8ko9tkEnt6g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XOAp8IeswMEFdHTxlxqAGxR1TESun9XyL4oBhiuY5qr2nvJCs7GtijfTaQOoIdvwzgCQPiHVcwuRFhp9bmbHUcVyn72GQN9XF9NzZBjd/yezX1+sw6p+eu19XMhURv73ypAE2QVuuXfkn0yvm1ZIE5zW3Dr4lQCRQGrCNpmR04w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4IkoC0r5; arc=fail smtp.client-ip=40.107.209.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4IkoC0r5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhLE1cOvHBONsD9OanlmtLpYE5hnwnH941Uz3ziw85iC5sIUs5G3i6n7JUMBlfQIbcBc4UrNNMGD+J/GgNpGuy0jsPyShId4c3iHEF4ld18YSQCjv7/cpDkMd1xAJyE+GLbO3iXlY3k43l+qFKUx1eaHKswbxf1ZQ+S+aNbbCbHL+KiLIATqpwYYKNyzWZAkIYzKXPrQO4RLtVDxhY9T2wqhO8YVd55FnBXf0RifK6i9w2jVrXc2ButnDf/su4d1E0WW/0OlMVxCAOpUVt6/mvKZvuumGd+n+YIZPzjv7zh7pvz5QOs917ITW6LVGMfWpGuKVPissedYld1VtUtnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2DIno9Ead5t8x2rrPmm0RTWBTzSmH7YLFOCrnEQkC8=;
 b=EU+GCgeEC8LoJGKY8rOOC1ftQQNHW+UfIGRAmefNGTRB7mlkGG0yfXEnGDmLQ40hOHdn21ASR6pNVde+TjiztFyii231gYLF1pDN8Vyu+DQMl5wmpDn4PJp7ecITBVjwUsWnI8WeI+l8zm/DsVkBX6kNekq4eM7+oqxsBl4aYX6vvP7DnRfQ12xVwS9iZ+6YjVEy3RbGN1Rx87SezOMnAjMWTpWwz3rJplIQ+787BrIJbpfwwVIT6wfhGxoVFempjD0sGDbFuvd1XSZCyWrW2SG1XOXFvsYabgTpTThFNcs35ySiKXf2hivPU4RY+1qRJdZIx2ZUt8HtU7OUwUiEzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2DIno9Ead5t8x2rrPmm0RTWBTzSmH7YLFOCrnEQkC8=;
 b=4IkoC0r5Tu8oQx3+m4CHY7SuLaku5bUaIlLhM8ODAJKLDksjhJM5z28+69fcSLkdztNEqDGbksXGNoe4JbUx2KS4nks2YEkTIrvSl3ciqAkS6w6ApL4T6uaXn7lt8/44eOYZrJzUKsNZ6npMk8NaNjAhUzgRWsE9m/C69lt3x2I=
Received: from DS1PR03CA0010.namprd03.prod.outlook.com (2603:10b6:8:450::8) by
 SA1PR12MB5613.namprd12.prod.outlook.com (2603:10b6:806:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 19:48:52 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:450:cafe::8b) by DS1PR03CA0010.outlook.office365.com
 (2603:10b6:8:450::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Thu,
 30 Jul 2026 19:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 19:48:51 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 30 Jul
 2026 14:48:49 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v9 4/7] RAS/AMD, EDAC/amd64: Use unified interface for SPA translation
Date: Thu, 30 Jul 2026 15:48:31 -0400
Message-ID: <20260730194834.3203601-5-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730194834.3203601-1-yazen.ghannam@amd.com>
References: <20260730194834.3203601-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|SA1PR12MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bceae8-3003-4074-a6c5-08deee7394db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	gLS/bOe6poX2sv0xhILeSfFEVhQLi37sopOTq2xpGn3yyzbqHW/bUx+YSBpHp0xZ7AsityM6S2RRxwMe9SsmVfTKzIee2kb6V3+a4g/Jn/1knNaqrQPvKlM8k4McKPcRTlV6wGDcs6aI8IcuIaaB3HF+ghbIo0nKzHHz9TZDB1KrJgUcT5tNZ7QwzfixRQwFVsmL6zuo577Gf6NXPPfrIER19ElsRS6znl+MAwnraCSdmVA8pBmZMvB+5f8fyjwMFVQYZ4T7eTafK9UIGoECx4bnYb62NQ7lkkLzkp7qWW5FD2VoNl6liYIcShPABVw4F0ufRe++jtF6hrY/+5S4CecHR5RdNcPC3yJBFXwfmpKvr1ZCh0uxAKybkFKiOje+rGDtRf1d+BlQTDhpNePnHOfGBl0Hcir2K4HkTNPP/rfYazRA8Kvj+eJ2/jkvxqa/ZgX1ewQSP1QVCOMebVfsJqIGPZ4q3CAKqHVznkooVGWWIbf4tPfh5t+STumQXFh4d8EbJgl1Q0/VecPPfghikbWrgnFqBiQwFWCu/NDJYhObiczCoc+2IbooKlA/0rgMpyyBl5OpppU5Iz7FnNqlqhIxa9yj0YFbZvhtNXhJJHNho7bO5x/NHD6f+FhTKjPtlypsA91GS/n4IOAAUnnqh6BtGsgranak2PZAuxBel65enhXkRCahg582n2vepbjPWyZzbVjOFZwmPREWoO9vUg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	stW6XcgtrBuuXYVWrcZoAoKv8nLSweP80rZUVGBL+4dBABT3y/ZSQWinrFfC03/E2bWb64NU+Kk+gCEhTJkojeOt/x83CUnr0yWdN8iqrJKi3EzTX0pt3XDe1GbyU6TVZvKE47GbkdTYgGx6BF8N3wkki88cl95K9cO3uPkgjEF1dkRCec7k0QGk7LXZshdX53I1q2TV2208r4R/pHl8Rq1FxYAKhS4cla8bzWwL1+0Om4jX+jirf+CpDaFffLCCpXC1y8i8E5RL/22dNDyKVbt4nVLk2xxhKTwNDDNpVM4W1KSGyupjnCCQ94UnRC+RaO85U3KlS/9rST0GpSfra7caRzfuifftcnydZItdHOndTlcxQ2qKO1447bMP49SyA1Y7oQzVkJI28s8vZCfGwy/nwvcD1wSqV+8o/xjJ0RpX4yED6idCsnmu4X0C/SHC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 19:48:51.8515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bceae8-3003-4074-a6c5-08deee7394db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5613

Switch all users of the ATL SPA translation function to the new unified
interface.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 15 +++++++--------
 drivers/edac/amd64_edac.h |  2 ++
 drivers/ras/amd/atl/umc.c |  8 +++++---
 drivers/ras/amd/fmpm.c    | 10 +++++-----
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 475235c402e8..f428d815bff1 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2809,9 +2809,7 @@ static void decode_umc_error(int node_id, struct mce *m)
 {
 	u8 ecc_type = (m->status >> 45) & 0x3;
 	struct mem_ctl_info *mci;
-	unsigned long sys_addr;
 	struct amd64_pvt *pvt;
-	struct atl_err a_err;
 	struct err_info err;
 
 	node_id = fixup_node_id(node_id, m);
@@ -2843,17 +2841,18 @@ static void decode_umc_error(int node_id, struct mce *m)
 
 	pvt->ops->get_err_info(m, &err);
 
-	a_err.addr = m->addr;
-	a_err.ipid = m->ipid;
-	a_err.cpu  = m->extcpu;
+	err.a_err.addr      = m->addr;
+	err.a_err.ipid      = m->ipid;
+	err.a_err.cpu       = m->extcpu;
+	err.a_err.requested = ATL_OP_SPA;
 
-	sys_addr = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
-	if (IS_ERR_VALUE(sys_addr)) {
+	amd_translate_umc_mca_addr(&err.a_err);
+	if (!(err.a_err.valid & ATL_OP_SPA)) {
 		err.err_code = ERR_NORM_ADDR;
 		goto log_error;
 	}
 
-	error_address_to_page_and_offset(sys_addr, &err);
+	error_address_to_page_and_offset(err.a_err.spa, &err);
 
 log_error:
 	__log_ecc_error(mci, &err, ecc_type);
diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
index 1757c1b99fc8..b11da6fdf0fc 100644
--- a/drivers/edac/amd64_edac.h
+++ b/drivers/edac/amd64_edac.h
@@ -17,6 +17,7 @@
 #include <linux/mmzone.h>
 #include <linux/edac.h>
 #include <linux/bitfield.h>
+#include <linux/ras.h>
 #include <asm/cpu_device_id.h>
 #include <asm/msr.h>
 #include "edac_module.h"
@@ -400,6 +401,7 @@ struct err_info {
 	u16 syndrome;
 	u32 page;
 	u32 offset;
+	struct atl_err a_err;
 };
 
 static inline u32 get_umc_base(u8 channel)
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index 2d61f890e4b8..4d75ad4483e8 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -314,15 +314,17 @@ static void _retire_row_mi300(struct atl_err *a_err)
 	struct page *p;
 	u8 col;
 
+	a_err->requested = ATL_OP_SPA;
+
 	for (col = 0; col < MI300_NUM_COL; col++) {
 		a_err->addr &= ~MI300_UMC_MCA_COL;
 		a_err->addr |= FIELD_PREP(MI300_UMC_MCA_COL, col);
 
-		addr = amd_convert_umc_mca_addr_to_sys_addr(a_err);
-		if (IS_ERR_VALUE(addr))
+		amd_atl_umc_translate_addr(a_err);
+		if (!(a_err->valid & ATL_OP_SPA))
 			continue;
 
-		addr = PHYS_PFN(addr);
+		addr = PHYS_PFN(a_err->spa);
 
 		/*
 		 * Skip invalid or already poisoned pages to avoid unnecessary
diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 4ccaaf7b70bf..21f645197410 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -302,7 +302,6 @@ static void save_spa(struct fru_rec *rec, unsigned int entry,
 {
 	unsigned int i, fru_idx, spa_entry;
 	struct atl_err a_err;
-	unsigned long spa;
 
 	if (entry >= max_nr_entries) {
 		pr_warn_once("FRU descriptor entry %d out-of-bounds (max: %d)\n",
@@ -328,19 +327,20 @@ static void save_spa(struct fru_rec *rec, unsigned int entry,
 		return;
 	}
 
-	memset(&a_err, 0, sizeof(struct atl_err));
+	memset(&a_err, 0, sizeof(a_err));
 
 	a_err.addr = addr;
 	a_err.ipid = id;
 	a_err.cpu  = cpu;
+	a_err.requested = ATL_OP_SPA;
 
-	spa = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
-	if (IS_ERR_VALUE(spa)) {
+	amd_translate_umc_mca_addr(&a_err);
+	if (!(a_err.valid & ATL_OP_SPA)) {
 		pr_debug("Failed to get system address\n");
 		return;
 	}
 
-	spa_entries[spa_entry] = spa;
+	spa_entries[spa_entry] = a_err.spa;
 	pr_debug("fru_idx: %u, entry: %u, spa_entry: %u, spa: 0x%016llx\n",
 		 fru_idx, entry, spa_entry, spa_entries[spa_entry]);
 }
-- 
2.53.0

