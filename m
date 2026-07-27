Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013042.outbound.protection.outlook.com [40.93.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E3E429CC1;
	Mon, 27 Jul 2026 21:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187269; cv=fail; b=jKjCdiTeqSl1BJjGNxdE8m187KhuFCt56vOXTLr3ZjAHpEfRWoQHL2/9STGomBt7U+Ch9Ud0naAH90sKEZA5VOoj7k3sMr7EedyBcZJOrXqYfmwNtYxeJhHp6eI+vYcUDGBOJmubb7Lr1aBPlZ8xAierSRYDaDMyGzsRls3mzHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187269; c=relaxed/simple;
	bh=t22zSEtbbHx7Q3cpxpYrc2W9DO9zJ6uoSqe1X7PrqSM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWdggTIECClV7DwoF+zkelTDOfzHiYtYD8QjGOpwqohpEuNjYfwLwsyXF+3qB2e37LGlPJhHn56tRkQHeVtGVKgysG2gpV0Idb1GgfmP+O2GlslZxuS60tVPS5Kt8mbgo+j0kE3JQDEmYICDJlUGwrXhisjXJqDWrdXrXbn3kso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gkxDjQX7; arc=fail smtp.client-ip=40.93.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gkxDjQX7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssCsN/iJyyITXEdDnZQBJaCfTCsQ/SNuD7pUNLqNLDdoq83I/bEVBaho76TpuRuKSJ4G1TzHF3iqh2P6wewcCQzYKVV7YiEnK8dhaX0Q0U+d1+l5lxCQvHtHwGwbpR4RsTU+6DMq+LAipOXqOGf5FY3IAm2xGm6+OdgtJzmuOCZXtQX5kd0wFpXrAqKWN0xRelSuIG2jL/t0FUnm1d7TToVzCW/69M5NXv2lo7soz17Foue7N82PRpnw8JLYpJZ3vtkKz+rqv+qd0OU18ykv2CAxy7+hNribmrIiU4cIU2MrxS8mTwF21AQrmO8fPmCG/WeXxyhrkj5iA1hKCdaWRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BbARoFyfrS9WUka5uS04nDZ+Ejpffe5/2pUJXDvv5Y=;
 b=QqtXolOVr7+wpmfEgCuXqCd+MXBDtWp+4Od9BUcQwAXzOfxh4H5QSv7gbmdchSLiyI6mbrvgRGm7QqTq9ZzCYpr3LkI4Bvp62yQCT9dBX5bpwlF5VhUfTwijRsIMtBvF0qU4qS3/3e/RO5bXZYQZlMi8Pzo/JfZRZQHHcAwXDAXUO1S/p7epVQg/wmZOo77nalgMxrJjoSm+ddPQGt6bOX8OejHk+pIwtKSp446LfBdxU0J7eN4SMDJljTzl/XuqFjb8JMOZRmWhAQEmH5d2IWaWgMiLiUPnmPCnVRfXVRSv1qAKGcQqCEHb0JpBljiu/qa5cv6N9C8p/x4WMQiySA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BbARoFyfrS9WUka5uS04nDZ+Ejpffe5/2pUJXDvv5Y=;
 b=gkxDjQX7kSmo/08VQNFTWOvelAlPKRSHiDpk/hGgIkBRvHVcmK0b7yOFtYabZQMdBrA8Kq58PFsuwujvLhsddifjG+r9/QxGyugZBjsA3j+7FxQimjCckttWjBV3A7hg8sIN5mW2vxiswLtZhqY3oNjpaorEeMWUymbB47hcMXs=
Received: from BN9PR03CA0491.namprd03.prod.outlook.com (2603:10b6:408:130::16)
 by SJ2PR12MB8927.namprd12.prod.outlook.com (2603:10b6:a03:547::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 21:21:02 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::31) by BN9PR03CA0491.outlook.office365.com
 (2603:10b6:408:130::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 21:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 21:21:01 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 16:20:58 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v8 3/7] RAS/AMD/ATL: Add unified UMC address translation interface
Date: Mon, 27 Jul 2026 17:20:41 -0400
Message-ID: <20260727212045.1810480-4-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727212045.1810480-1-yazen.ghannam@amd.com>
References: <20260727212045.1810480-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SJ2PR12MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 397d7ac5-b8c9-451c-389d-08deec24f5b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|56012099006|11063799006|5023799004|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dN+iTfmXBZW3d/KgiQS0yNKaEW2kxbOqyE3GplMi9WM+WSkoJLoX72cy8b3RPWHqHw7YzHGXtHma9QU0n3krGj24gMe53MMwlejZEsQ0bjRs2abMvdvuWCjnOYOVEPak3oTMG2ofFCXEPwGxL8AsE9l5e4a5nGSokZ9zbjZfBbPWxPrNIvOuC9tD2gWLmQ00eUDSdke5Dp+m9tqcc0ox1jQ5rS/qJaakE00c7sNKqXbH+Kakjs0VnA/mXDk4YC5L1W7RAkhO64bbz7mEAeou8FGHwysC1qymxz4yz9tA/PASZJ53bX+ocSwGOI6l4zd9xTRzyDKDIB+IA6++2CO034L3Kg70GN/keCLzHuHoGcG+W2kZIyqYqZ/PYV+uBE1sR2asWpXqkqu4GdFXKjz8Rbik07Ndxuqc6/FRZt/Ng/lmL2xMXDxnUn2CgUPX1+0pLiNhCn9k/weVENDOfy4sowGr7k7cMluLP/3HK94NUMJdou2RhJ6nOeTyvdIJDkv7jBoFnUt/Q+8fdWT7/UWoQBFlLelNajWsyHtI3yI8N5P4n5+1n9bke5IwyWe2H9vJL6/SuMf5D2in2rNpO5f1XrsRxqswpllho6rDmSFHmmwsbzN+Jd1YwW13IRgLVc/cZuuxT+u+n7cnfdMcVeeChgcjMG4iVvLa/XiduEIzuStiY4Ek6LbM/B2cWhCB6nslGS3A+QLBH4dmhDbQMBAFZA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(5023799004)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OKPDxen8a4D4GHZd7HVYeCETNmT6HR3rpdIYoaQX1hogn4DDEAoeM8K0T77Q65djPdJvxZ/bbtBQEEik9uCHiQZ+IUplk7RyVdIuBLLEowkMDwnyGkV0LPMt0ahXr6fDxSqhxprtolWcUk3lLYJUCiHLH3nPfrktHah5TeVXj2aEMKkx/tv+Mp3pIld+bFOhohdh0gmurOmu/Ap7Ou0eSJ13iY7kyYqAg3VqQM7OnOAK9web5htCWh1cGzhhhoLVB9C0aXkuOElLttVlRocCb5Je8CNZ2IHHuCyinyZsFU7/N1JiBxnMvZUAEX+2cpy0lChiRcD/K7geyGJmZYLoGR6U5oT0SgkafluBUxo19IiY1rede0wiXAFAvFelvpZnMoMheSloR41mLs677vewnOWgQ9FJPbxDjwUPXusy66kFUEeZCt1lRS68CYMsgHK8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 21:21:01.7805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 397d7ac5-b8c9-451c-389d-08deec24f5b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8927

The library exposes a single function for UMC address translation. Adding a
new translation would mean adding and plumbing another export. Callers also
have no way to request more than one representation of an address in a
single call.

Add a single entry point, amd_translate_umc_mca_addr(), that operates
entirely through struct atl_err. Expand struct atl_err with a pair of
operation bitmaps and the per-operation output fields. The caller provides
the error inputs and requests one or more operations. Each operation is
attempted independently. The library sets a validation bit and fills the
matching output for each operation that succeeds. The caller must check the
validation bit before consuming an output value.

Group the error identifiers (normalized address, socket, and UMC bank ID)
into struct atl_umc_addr. Lay it out to match the PRM parameter buffer
inputs that every handler shares. Reuse that struct for the parameter
buffer. A caller-populated atl_err can then be handed to a PRM handler
directly.

Route the interface through the always-built RAS core so the library
remains optional. The core provides the entry point and a
register/unregister pair. The library registers its implementation on load.
The entry point does nothing (no validation bits set) when the library is
absent.

Start with a single operation, ATL_OP_SPA, that produces the System
Physical Address. Use the PRM handler on PRM-only platforms, where the Data
Fabric revision has no native translation support, and use the native Data
Fabric translation otherwise. The existing
amd_convert_umc_mca_addr_to_sys_addr() interface is left in place for now.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/core.c     |  2 ++
 drivers/ras/amd/atl/internal.h |  4 ++--
 drivers/ras/amd/atl/prm.c      | 20 ++++++++++----------
 drivers/ras/amd/atl/umc.c      | 31 +++++++++++++++++++++++++++++++
 drivers/ras/ras.c              | 26 ++++++++++++++++++++++++++
 include/linux/ras.h            | 27 +++++++++++++++++++++++++--
 6 files changed, 96 insertions(+), 14 deletions(-)

diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index d77dacdd4f56..b754eaef8585 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -210,6 +210,7 @@ static int __init amd_atl_init(void)
 	/* Increment this module's recount so that it can't be easily unloaded. */
 	__module_get(THIS_MODULE);
 	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
+	amd_atl_register_umc_translator(amd_atl_umc_translate_addr);
 
 	pr_info("AMD Address Translation Library initialized\n");
 	return 0;
@@ -222,6 +223,7 @@ static int __init amd_atl_init(void)
 static void __exit amd_atl_exit(void)
 {
 	amd_atl_unregister_decoder();
+	amd_atl_unregister_umc_translator();
 }
 
 module_init(amd_atl_init);
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 9f4d2a5b6c14..0086bf0ff24f 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -280,6 +280,7 @@ int dehash_address(struct addr_ctx *ctx);
 
 unsigned long norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id, unsigned long addr);
 unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
+void amd_atl_umc_translate_addr(struct atl_err *err);
 
 u64 add_base_and_hole(struct addr_ctx *ctx, u64 addr);
 u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
@@ -287,8 +288,7 @@ u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
 
-int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 umc_bank_inst_id,
-			 unsigned long addr, void *out_buf);
+int prm_umc_norm_to_addr(guid_t guid, struct atl_umc_addr *addr, void *out_buf);
 unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id, unsigned long addr);
 
 /*
diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
index 0934f890745d..5d9f0cb9eadb 100644
--- a/drivers/ras/amd/atl/prm.c
+++ b/drivers/ras/amd/atl/prm.c
@@ -20,22 +20,17 @@
 
 /* See "PRM Parameter Buffer" in the AMD ACPI Porting Guide. */
 struct param_buf {
-	u64 norm_addr;
-	u8 socket;
-	u64 bank_id;
+	struct atl_umc_addr addr;
 	void *out_buf;
 } __packed;
 
-int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 bank_id,
-			 unsigned long addr, void *out_buf)
+int prm_umc_norm_to_addr(guid_t guid, struct atl_umc_addr *addr, void *out_buf)
 {
 	struct param_buf p_buf;
 	int ret;
 
-	p_buf.norm_addr = addr;
-	p_buf.socket    = socket_id;
-	p_buf.bank_id   = bank_id;
-	p_buf.out_buf   = out_buf;
+	p_buf.addr    = *addr;
+	p_buf.out_buf = out_buf;
 
 	ret = acpi_call_prm_handler(guid, &p_buf);
 	if (!ret)
@@ -51,10 +46,15 @@ int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 bank_id,
 
 unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
 {
+	struct atl_umc_addr uaddr = {
+		.addr		= addr,
+		.socket_id	= socket_id,
+		.ipid		= bank_id,
+	};
 	unsigned long sys_addr;
 	int ret;
 
-	ret = prm_umc_norm_to_addr(norm_to_sys_guid, socket_id, bank_id, addr, &sys_addr);
+	ret = prm_umc_norm_to_addr(norm_to_sys_guid, &uaddr, &sys_addr);
 	if (ret)
 		return ret;
 
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index befc616d5e8a..c22bc98104ee 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -416,3 +416,34 @@ unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
 
 	return norm_to_sys_addr(socket_id, die_id, coh_st_inst_id, addr);
 }
+
+/*
+ * Translate a UMC MCA error address into one or more representations as
+ * requested by the caller.
+ *
+ * The caller sets the input values and requests one or more operations
+ * through @err->requested. Each operation is attempted independently. The
+ * corresponding bit in @err->valid is set and the related output field is
+ * filled for each operation that succeeds. The caller must check @err->valid
+ * before consuming an output value.
+ *
+ * Registered with the RAS core as the UMC address translator; see
+ * amd_translate_umc_mca_addr().
+ */
+void amd_atl_umc_translate_addr(struct atl_err *err)
+{
+	err->socket_id = topology_physical_package_id(err->cpu);
+
+	if (err->requested & ATL_OP_SPA) {
+		if (!prm_umc_norm_to_addr(norm_to_sys_guid, &err->umc_addr, &err->spa)) {
+			err->valid |= ATL_OP_SPA;
+		} else if (!df_cfg.flags.prm_only) {
+			unsigned long spa = convert_umc_mca_addr_to_sys_addr(err);
+
+			if (!IS_ERR_VALUE(spa)) {
+				err->spa = spa;
+				err->valid |= ATL_OP_SPA;
+			}
+		}
+	}
+}
diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 03df3db62334..6032f1cfce91 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -39,6 +39,32 @@ unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
 	return amd_atl_umc_na_to_spa(err);
 }
 EXPORT_SYMBOL_GPL(amd_convert_umc_mca_addr_to_sys_addr);
+
+/*
+ * Set by the library module when it loads. Left registered while the module is
+ * resident; consumers keep no direct dependency on the library, so translation
+ * is simply skipped when it is not loaded.
+ */
+static void (*amd_atl_umc_translate)(struct atl_err *err);
+
+void amd_atl_register_umc_translator(void (*f)(struct atl_err *))
+{
+	amd_atl_umc_translate = f;
+}
+EXPORT_SYMBOL_GPL(amd_atl_register_umc_translator);
+
+void amd_atl_unregister_umc_translator(void)
+{
+	amd_atl_umc_translate = NULL;
+}
+EXPORT_SYMBOL_GPL(amd_atl_unregister_umc_translator);
+
+void amd_translate_umc_mca_addr(struct atl_err *err)
+{
+	if (amd_atl_umc_translate)
+		amd_atl_umc_translate(err);
+}
+EXPORT_SYMBOL_GPL(amd_translate_umc_mca_addr);
 #endif /* CONFIG_AMD_ATL */
 
 #define CREATE_TRACE_POINTS
diff --git a/include/linux/ras.h b/include/linux/ras.h
index 468941bfe855..df1a1485ea16 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -3,6 +3,8 @@
 #define __RAS_H__
 
 #include <asm/errno.h>
+#include <linux/bits.h>
+#include <linux/stddef.h>
 #include <linux/uuid.h>
 #include <linux/cper.h>
 
@@ -35,10 +37,26 @@ static inline void
 log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev) { return; }
 #endif
 
+/* Operations requested and completed through amd_translate_umc_mca_addr(). */
+#define ATL_OP_SPA		BIT(0)	/* System Physical Address */
+
 struct atl_err {
-	u64 addr;
-	u64 ipid;
+	/* Identifiers; layout mirrors the PRM parameter buffer inputs */
+	__struct_group(atl_umc_addr, umc_addr, __packed,
+		u64 addr;
+		u8 socket_id;		/* Socket of @cpu */
+		u64 ipid;
+	);
 	u32 cpu;
+
+	/* Requested operations (input) */
+	u32 requested;
+
+	/* Completed operations (output) */
+	u32 valid;
+
+	/* Outputs */
+	u64 spa;			/* Valid if (@valid & ATL_OP_SPA) */
 };
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
@@ -46,10 +64,15 @@ void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *));
 void amd_atl_unregister_decoder(void);
 void amd_retire_dram_row(struct atl_err *err);
 unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
+
+void amd_atl_register_umc_translator(void (*f)(struct atl_err *));
+void amd_atl_unregister_umc_translator(void);
+void amd_translate_umc_mca_addr(struct atl_err *err);
 #else
 static inline void amd_retire_dram_row(struct atl_err *err) { }
 static inline unsigned long
 amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
+static inline void amd_translate_umc_mca_addr(struct atl_err *err) { }
 #endif /* CONFIG_AMD_ATL */
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
-- 
2.53.0

