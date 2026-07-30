Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012048.outbound.protection.outlook.com [52.101.43.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B597739EF33;
	Thu, 30 Jul 2026 19:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440944; cv=fail; b=hL/gfXZtSIC/3F6n5PXgJLoHzbIW1AYUPOcaqDagE/ljMnekegukGEqNjGa3Hs131NlaUptfavGPBCXDHtk/n1cD2/A4kgGceNf4Keot3hLSLUziB6raU6zLGNZ7AHbi49/Hbq1B66SGjoVA6eZSXzEdpUIEG/XsjKKR/tajAZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440944; c=relaxed/simple;
	bh=cHqftjYw4GaLisTzqgNv5au4R1/NMREhGxeP3v0KcKY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ql/M3S75QxtC/6wRKVWnGk1m2DXqTjkJRZvVzkI9qe5t4XT/YqYo5mIMWYeIuKpZxP0VbvA0CDMGP10aDwdPBzss1kS/jZsm/wxg1xuojWPk+47DJnRB2xliiAHEIqOeP1Ja975PB2MT4/pqEfzO+FxjIAIC2tTysKO3r2MGc24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wfuD/AKF; arc=fail smtp.client-ip=52.101.43.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wfuD/AKF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXCHvokS4PnK3rVPq1OvSOaxlhRQSzyvgNHLwp/eSeuiThonTh2+4X3P4IM4KvepPZBmfnDpb3cCDhBdi4jk7/fAUjgeRSWChoStTkyB8mdPVYCJ5jOjLTm7r1y+LPbqFirrEH+RLe+nF08WL59XHUcsi02vuv6MjcjaEDkQQEFekOMH7EtrD8cw6KLhygLqnIRpNPvidMgXLPt7n5dOMePSGYEaCaPa+4H1VyGjweO/nUNCfD4Udr8ErEJ6CKAW6K45vhtGDRrsgLz2ucS0T/wdeY1HOzZADNgAoboR4FU1vX+6JZKJxGJsqH9y229uYzldldqTfi7aJENqOIHwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5bUtZGXMmO7Myrgb9aNLPmxVy2aafMG5kx31Mf1HAs=;
 b=Z7AbGL1QQctJ0oEeG0tTBhr2+oqgkAw3AIj8L1GsyOJ7t8/YxR82ZSKdsmkgOwqTG2YqVQxfkk2GhOScpBb7vRjgVgWAzCLtoaYbiOninD4CIIF1E54SMp9syRg5jd03lwiMbzQ6v/kTP0/uL3UhAOxxHCXuTcDTkBYn3adRvkXarezp0wJbEqL96wLd3uY1Pl4ik5Kw0q22Bxb2un4+qXdUidYa0f8FJS6cOpLk3NEZ/8Ns8+ZJfU7WptNeRTRFVI5nSlNpTbllB0aDt+lXoBx6HK3TJ0/BVTcQa5o57OKPQFrr1nJbcDflFQobyoCdkvNfGswYCbt3UXzou1yy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5bUtZGXMmO7Myrgb9aNLPmxVy2aafMG5kx31Mf1HAs=;
 b=wfuD/AKFTOD1mYK0Z75WQ9FkaeCOjwfgUGjU2u3a3yVLZJPiQGDIGXktGB4Tf1e+0MRC80k17u3m5sLDrB4jxE7YuUtTxzWbYIAEj3CQhK6ILPgZSWgn+HMmkBZlK+2vagAHLBLwAU5AJY+yNsno9VZ+8uMW3N8FS2o0umBmoJ8=
Received: from DS1PR03CA0003.namprd03.prod.outlook.com (2603:10b6:8:450::16)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 19:48:51 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:450:cafe::9c) by DS1PR03CA0003.outlook.office365.com
 (2603:10b6:8:450::16) with Microsoft SMTP Server (version=TLS1_3,
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
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 19:48:50 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 30 Jul
 2026 14:48:48 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v9 3/7] RAS/AMD/ATL: Add unified UMC address translation interface
Date: Thu, 30 Jul 2026 15:48:30 -0400
Message-ID: <20260730194834.3203601-4-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|MN2PR12MB4390:EE_
X-MS-Office365-Filtering-Correlation-Id: fb05279e-ed29-46b8-28c1-08deee7393e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|18002099003|22082099003|56012099006|11063799006|5023799004|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mf75Dr1VJG+KmgX7W+KUjSfWevQAeVEPA8G9hHb3l5ASFU68XelmFzgpawnAfuNlOrGILDVOzvIj4fh/nbEXg7s/EKPcdXEgIdI5K4JN9h6UpAaYyjyl991JK9CnLA0bE4bjzFpLysjaK45mi7b2Nk+GmuM2VNUS5e48SYMiqSvA5an971pC1zpLC/joG01COSlQw8x9GklUKD1J6cQw7oUDzZVsWPKo1r6P3w9RclHFKGDtCClq40pEEbubCvlNtK/GTfH0SEXuQJ+ldMf9D2QQTrYTLmN6l7vIc6MtIskdyxbkRhMw+qceVQi6dSJ3/Ulho8K8bf3pbG9YUiJR+/cofC8W6+UGj4bIxPHnIGFyIwXRgEfd7Ax+wuMjGWoU64tFULSyA+N/znZnOwUE0+1ZHz9LhoQKUYlnylm2u/LlQn6DJFIZYByU8rQCZj+9mQ8710cFWyR7rdE5CPeJMaHeh5vZoGAfjngLP8kikNoXr3KQX8vFBAe0ielG3TmbGj9onxCipSH4aSAAIiUGUmxOV6rhKpwdCgU6jeePyrESw/PPkaDrEgUZhdc9eU5dfZIZgoXSkVn7PW5ZqBcKEX8X0o0G3R5S6gjX4DmDU7J7m4YLUtje7WHABOvMDeNZMPpbx+dm9EyZ2XEbleZR1zo4pIoA0Rw+uAiiv6zOaEWwWJbtRQEjNTKWxE17fyffqaeUVvdqhGLjyzcfwbujJQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YujvLTUaQlFeAkE+DIV9kC+HqrTorDFZs+RiqwXXTdn6LwRVIsyuBNjsnyEgGg+XjAOi/6/AiXyHPWuBlc6zfQZcrWuohb3+6xVnxBgNVYydL4GWHDhPIIBtyfzOY2DAiqvHxgGf/HKWzHfTJCXC5kXBHgeOMf6AtIAyvoUzm3r8KmOfpzO5MZ7O+omx9LO6fDpOEv4TX92CReCmE+XlYHkwSiG0vjuH8+cL8eK080XpZOzyUpCkc+KdLnnYaZgh+1VAX6uheRsT5gPeF8YztD0EvQMy//Kme1g6yXljKovOVkxycpivEeLx3PSN27B/Q4wol6IzmDnTP0WXe8/Ap49B010g8ePrdLFfHFUfBN3QjH7OVsT4xwpo01IIIU42WTLZze22WkOOdn3Fy5D5uFlYr2/0XvXvo4gTQ38pPKd/DAJbI4cESb/o3RsLlnEb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 19:48:50.2326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb05279e-ed29-46b8-28c1-08deee7393e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390

The library exposes a single function for UMC address translation. Adding a
new translation would mean adding and plumbing another export. Callers also
have no way to request more than one representation of an address in a
single call.

Add a single entry point, amd_translate_umc_mca_addr(), that operates
entirely through struct atl_err. Expand the struct with a pair of
operation bitmaps and the per-operation output fields.

The caller provides the error inputs and requests one or more operations.
Each operation is attempted independently. The library sets a validation
bit and fills the matching output for each operation that succeeds. The
caller must check the validation bit before consuming an output value.

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
Physical Address. Try the PRM handler first. Fall back to the native Data
Fabric translation if PRM is unavailable and the Data Fabric revision
supports it.

Leave the existing amd_convert_umc_mca_addr_to_sys_addr() interface in
place for now.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/core.c     |  2 ++
 drivers/ras/amd/atl/internal.h |  4 ++--
 drivers/ras/amd/atl/prm.c      | 20 +++++++++---------
 drivers/ras/amd/atl/umc.c      | 37 ++++++++++++++++++++++++++++++++++
 drivers/ras/ras.c              | 28 +++++++++++++++++++++++++
 include/linux/ras.h            | 28 +++++++++++++++++++++++--
 6 files changed, 105 insertions(+), 14 deletions(-)

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
index 3d5a6f5ae0a9..a951c00f940c 100644
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
index befc616d5e8a..2d61f890e4b8 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -416,3 +416,40 @@ unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
 
 	return norm_to_sys_addr(socket_id, die_id, coh_st_inst_id, addr);
 }
+
+/*
+ * Translate a UMC MCA error address into one or more representations as
+ * requested by the caller.
+ *
+ * The caller sets the input values and requests one or more operations
+ * through @err->requested. @err->valid is cleared on entry. Each operation
+ * is attempted independently. The corresponding bit in @err->valid is set
+ * and the related output field is filled for each operation that succeeds.
+ * The caller must check @err->valid before consuming an output value.
+ *
+ * The PRM handlers consume @err->umc_addr directly. Only MI300 needs its
+ * MCA_ADDR value converted to a normalized address first; see get_addr().
+ * MI300 platforms provide no PRM handlers, so the conversion is left to the
+ * native fallback path.
+ *
+ * Registered with the RAS core as the UMC address translator; see
+ * amd_translate_umc_mca_addr().
+ */
+void amd_atl_umc_translate_addr(struct atl_err *err)
+{
+	err->socket_id = topology_physical_package_id(err->cpu);
+	err->valid     = 0;
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
index 03df3db62334..20e23560dee5 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -39,6 +39,34 @@ unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
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
+	err->valid = 0;
+
+	if (amd_atl_umc_translate)
+		amd_atl_umc_translate(err);
+}
+EXPORT_SYMBOL_GPL(amd_translate_umc_mca_addr);
 #endif /* CONFIG_AMD_ATL */
 
 #define CREATE_TRACE_POINTS
diff --git a/include/linux/ras.h b/include/linux/ras.h
index 468941bfe855..eac8cf39ddd5 100644
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
+		u8 socket_id;		/* Filled by the library from @cpu */
+		u64 ipid;
+	);
 	u32 cpu;
+
+	/* Requested operations (input) */
+	u8 requested;
+
+	/* Completed operations (output) */
+	u8 valid;
+
+	/* Outputs */
+	u64 spa;			/* Valid if (@valid & ATL_OP_SPA) */
 };
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
@@ -46,10 +64,16 @@ void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *));
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
+static inline void
+amd_translate_umc_mca_addr(struct atl_err *err) { err->valid = 0; }
 #endif /* CONFIG_AMD_ATL */
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
-- 
2.53.0

