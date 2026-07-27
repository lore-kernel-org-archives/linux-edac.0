Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B349A42CAEA;
	Mon, 27 Jul 2026 21:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187272; cv=fail; b=teaNfQ310EEcDBPerIxhSZsHvdr/BTJM0cMYR51YxVeRZO1CDPbl065h2I28+nhRbpBCrqnF0zUF4sBPUSW+0Q3DJp+UBI2QYUvhsgsitxBSjhsll/kP22lHPyOpTrP0GwCiJgFWRWMp+elSZV/TQwmovV3e1sTCEoxGaZNH3Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187272; c=relaxed/simple;
	bh=Kqpf15JfrVDVxKS/9FVbhLf/ghplB7tRVm9pbIyc6EU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFI8vN7hOv69uf5EvzRdd6iduzf4FzGbf4DZAq+yiRQwyLFRqXFfYXzlVQzirfcF5M/pMPVFun2TH13BrzXGBJiPKX/HRgmd+ntGwaIOFW68m3wN9sEmj0AVhh1XfZNCSkRNDUsPVDTOio1wtpn99LOgTjOttPCK1oMokjyJtNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D1GoHkhc; arc=fail smtp.client-ip=52.101.52.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D1GoHkhc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/8iz/PmPQzj7gcx7x2nyV+V2zzQzduzCZeELeSpPdNAEGBL4OzmYnbQNIRmOXckVNDmLPaBTdBriyBgM1P1oGaAlmjpzKUvd3FGRmhlGPxdeN+VvNF9fkyogQKKwgpaZmDM7RlHAD/nYHqw4itY8fv20BVqS7d3c4FYDHgkQjC2qYYr9iCWeutknSxx2+XOT8woRbLSpQskTPjtuBl7Ksb/VQP5VtmMXJCRJ1fVdMxrZL1fcQ464wqYP/cpjoZmsyYW98AGa4Cq8JLcy/Esfbz3NbBNwrvGq2bDd72eF0XSVy4N0cdYQF9OA/aAKyZDoINNksk95bXxnfxYA8hfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHsraXdyU4qyvBx4Rr7Vry8n+jR7JMKJ4Zm0xqFQcOs=;
 b=DysPK8G1p1UfffgrG6hSaEbRxtWgbTHr/K7w7DM40XJo665mmn4MrB8UeJFtzXlm+MAepN6Z3PLt7ycGlIJSPlvP5JVvN5JHwZT7MdjEHDVlRG76AhDpuXboBSru8sMJnTW1TKHHmfN8XKdMT6WSXF0Bcw/3iaS/wDgXqwIdYQNGflMljIzZqNCorVQev3/8et/SU52IN4r/UE0M8jbCW2B9BWXoT6xQBvsmqnzgHHDimYVWVsd2Q6cgsnJMbgP1mDOzznI6l4TJCa8cHWWyBnkGaFsY8tUilGOCPeFJjXgEU0XI7NoYqHFNM5WRIPOUAyJiiMqVvk8tsnmQZFSbSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHsraXdyU4qyvBx4Rr7Vry8n+jR7JMKJ4Zm0xqFQcOs=;
 b=D1GoHkhcEUf/SuotJo9LRzwgMWcRRFsfpELaHY3G97s1N6nHWkOYLKvuSLQUaLgnbEpTISQsEaxMbSrv6zwFHk66G8BkCMT+Mz07OWjoOoBOsX+U0Uiduh1GzyIemdrW1vxiyBap2x8buh2dq3iRUs/+2QvE+1RgyLO+J89ITw0=
Received: from BN9PR03CA0192.namprd03.prod.outlook.com (2603:10b6:408:f9::17)
 by SN7PR12MB8171.namprd12.prod.outlook.com (2603:10b6:806:322::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 21:21:03 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::3f) by BN9PR03CA0192.outlook.office365.com
 (2603:10b6:408:f9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 21:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 21:21:03 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 16:21:00 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v8 5/7] RAS/AMD/ATL: Remove the standalone SPA translation interface
Date: Mon, 27 Jul 2026 17:20:43 -0400
Message-ID: <20260727212045.1810480-6-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SN7PR12MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0d4976-6c4e-422e-33e7-08deec24f6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UmCiNBYHJwpP94e55thdxfirGJfb4NRQ4n79xP2FdxrTxt6QDXdN1QwhkwVCPVGTmF4N/fsCvUtDncyrgcODxj+znXGb/N4LjzcLz1I9AX/ZH319Yn9i/ehmJMsct7sSvXNJFy/aAjOkRAwXwiWXccFUEcfhnnCaERmqmdwDioFJ344GdHlsDp5zWz+sXX7xg9QHv803ZJ2+iQmFjTiDq+hGc5T/fItZHvD6ZwTx3sFVg7IeYrejoba0wLoshFuI4hxEkUEQ3nOcQmNr1hP0qxUIrca6HIvpjfOyU1vd/W3uA62RaSe10XpG0mzplJNTJRE0susImcK0WjJwaGvGa1LApBsrUL8IT2Zyt6OeTpaDSiLAa4dkiMP0sRi2szs914rUWVx1U6/VczZ/EAUjhf2CGWPY/L31gyx5cqy+BZA8++nR1TIM/t6D+6ZyWS4oFlQHiCXx+EYO0azsmXwHoduXnKyPr/XmqCAwxTMzUaTsReuYi++DEJw+aW22OePv8YP8Ov8vx6iZf+XwrWb/rMFOCFJ9HQ4p43ixqAyOYlX9cnIL2L4zywuRqbzIFjVm/qhAQDotyjVfQBN/RoUUCUy2pvBlpmcSajsIEMmJnR8BJUTQYGW46gY5d64O+MKpiOWJDUKRUuJdF5hrAVqfkYZhEJPA77EGhdLbrV5zgVmo9MchkfakPaWrPYPo0DD6Z+oQmjnzJRrbvnFlJiQlgQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ltG/xlC7LJqysai6h3MbegOSKLBK4/0torK1Wlytk+By4nRqb/R7hyINzfv+PVbw4AEFEng75HDsWEAvNr7knxc28IWbvTT8evoZOSWOt3DuelPBPob1g5dQBjdD6vBH+igklWaN4ioZSxWzOI71rE9uFi2k3JN9UXp2YKCw4Cfc6+x5njzl9EbXS0o6a6yCf7bYUS19KGTJ4a90YPdGLZDf6nD3/kgLdo/RrKtff/K0v03PmDw/jl1Z3WXRDyqR5Q7e5Qkv3K/wWgDE1za9KWMp1RhvKduyZKACb+CIn/22uAikFxpyRnh9+QdrE3t0ckek3rIFqGNWg4gG0KLuXPYmhD7CSLVj0HHybXdDc0N5717xTVdXrJk/qTD0ebWtr0BVQ0c84BcfpCuBrBbnyPHRg1jdVWIZfrAM8kJgOk7F5a5Z5JzN1P/H58IDRaw+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 21:21:03.3490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0d4976-6c4e-422e-33e7-08deec24f6a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8171

All consumers now use the unified amd_translate_umc_mca_addr() interface,
which is routed through the RAS core in the same way. The older
amd_convert_umc_mca_addr_to_sys_addr() interface and its separate
register/unregister pair are no longer used.

Remove amd_convert_umc_mca_addr_to_sys_addr() together with
amd_atl_register_decoder()/amd_atl_unregister_decoder() and the associated
function pointer.

The unified interface performs the PRM translation itself, so
convert_umc_mca_addr_to_sys_addr() is now only the native Data Fabric
fallback. Make it static and drop its PRM attempt. Have it use the socket
ID that amd_atl_umc_translate_addr() already stores in struct atl_err. With
no remaining users, remove the prm_umc_norm_to_sys_addr() wrapper.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/core.c     |  2 --
 drivers/ras/amd/atl/internal.h |  2 --
 drivers/ras/amd/atl/prm.c      | 17 -----------------
 drivers/ras/amd/atl/umc.c      |  9 ++-------
 drivers/ras/ras.c              | 29 -----------------------------
 include/linux/ras.h            |  5 -----
 6 files changed, 2 insertions(+), 62 deletions(-)

diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index b754eaef8585..cb944d3473ba 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -209,7 +209,6 @@ static int __init amd_atl_init(void)
 
 	/* Increment this module's recount so that it can't be easily unloaded. */
 	__module_get(THIS_MODULE);
-	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
 	amd_atl_register_umc_translator(amd_atl_umc_translate_addr);
 
 	pr_info("AMD Address Translation Library initialized\n");
@@ -222,7 +221,6 @@ static int __init amd_atl_init(void)
  */
 static void __exit amd_atl_exit(void)
 {
-	amd_atl_unregister_decoder();
 	amd_atl_unregister_umc_translator();
 }
 
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 0086bf0ff24f..0ebab3732886 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -279,7 +279,6 @@ int denormalize_address(struct addr_ctx *ctx);
 int dehash_address(struct addr_ctx *ctx);
 
 unsigned long norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id, unsigned long addr);
-unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
 void amd_atl_umc_translate_addr(struct atl_err *err);
 
 u64 add_base_and_hole(struct addr_ctx *ctx, u64 addr);
@@ -289,7 +288,6 @@ u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 extern const guid_t norm_to_sys_guid;
 
 int prm_umc_norm_to_addr(guid_t guid, struct atl_umc_addr *addr, void *out_buf);
-unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id, unsigned long addr);
 
 /*
  * Make a gap in @data that is @num_bits long starting at @bit_num.
diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
index 5d9f0cb9eadb..76f7cc1ac31b 100644
--- a/drivers/ras/amd/atl/prm.c
+++ b/drivers/ras/amd/atl/prm.c
@@ -43,20 +43,3 @@ int prm_umc_norm_to_addr(guid_t guid, struct atl_umc_addr *addr, void *out_buf)
 
 	return ret;
 }
-
-unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
-{
-	struct atl_umc_addr uaddr = {
-		.addr		= addr,
-		.socket_id	= socket_id,
-		.ipid		= bank_id,
-	};
-	unsigned long sys_addr;
-	int ret;
-
-	ret = prm_umc_norm_to_addr(norm_to_sys_guid, &uaddr, &sys_addr);
-	if (ret)
-		return ret;
-
-	return sys_addr;
-}
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index 33a9ab7b959b..18f3a76a66e3 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -402,21 +402,16 @@ static u8 get_coh_st_inst_id(struct atl_err *err)
 	return FIELD_GET(UMC_CHANNEL_NUM, err->ipid);
 }
 
-unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
+static unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
 {
-	u8 socket_id = topology_physical_package_id(err->cpu);
+	u8 socket_id = err->socket_id;
 	u8 coh_st_inst_id = get_coh_st_inst_id(err);
 	unsigned long addr = get_addr(err->addr);
 	u8 die_id = get_die_id(err);
-	unsigned long ret_addr;
 
 	pr_debug("socket_id=0x%x die_id=0x%x coh_st_inst_id=0x%x addr=0x%016lx",
 		 socket_id, die_id, coh_st_inst_id, addr);
 
-	ret_addr = prm_umc_norm_to_sys_addr(socket_id, err->ipid, addr);
-	if (!IS_ERR_VALUE(ret_addr) || df_cfg.flags.prm_only)
-		return ret_addr;
-
 	return norm_to_sys_addr(socket_id, die_id, coh_st_inst_id, addr);
 }
 
diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 6032f1cfce91..c6150d44f765 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -11,35 +11,6 @@
 #include <linux/uuid.h>
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
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
-
 /*
  * Set by the library module when it loads. Left registered while the module is
  * resident; consumers keep no direct dependency on the library, so translation
diff --git a/include/linux/ras.h b/include/linux/ras.h
index df1a1485ea16..abb86f954a3a 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -60,18 +60,13 @@ struct atl_err {
 };
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
-void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *));
-void amd_atl_unregister_decoder(void);
 void amd_retire_dram_row(struct atl_err *err);
-unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
 
 void amd_atl_register_umc_translator(void (*f)(struct atl_err *));
 void amd_atl_unregister_umc_translator(void);
 void amd_translate_umc_mca_addr(struct atl_err *err);
 #else
 static inline void amd_retire_dram_row(struct atl_err *err) { }
-static inline unsigned long
-amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
 static inline void amd_translate_umc_mca_addr(struct atl_err *err) { }
 #endif /* CONFIG_AMD_ATL */
 
-- 
2.53.0

