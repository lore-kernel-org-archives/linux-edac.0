Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC6C2F8EB8;
	Tue, 30 Jun 2026 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853697; cv=fail; b=FQkHQM/1X/OL3RTTcIzKIApJESRS4tcyrMN3IrS8MN91PC/V3EJskOk1uoJMw5cqZK3uTHaEK0uelU0Uv/L+zq0/vAvzoIWGxmUGEY95XhGlKHkIi8g8aK9A3ougUk1dSmtNiP+p4ItBTeYzfEvT0IrnHTvs7eAiB4R/plwQoHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853697; c=relaxed/simple;
	bh=fXUaknt7G//yXDpB8HKJ0hS/lytTFTCQVkskyG4vti8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LVAcJLCfAwq2EkXBvIGHpj7Kt8kjTKuJ/WqBYDxsHLCUD9B4S0t6eHlMe6h9Bm+9td1sda8d/+vdjDo7ACXAE2sW6OsyO7fvHRCgFGVNXNimdvPIEMrNJ8aqDXM3M0C9lQ3qqeUBM/p7hhHreQXFMIezdWruk3ZPh3kw4f3KApg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s668Vn7m; arc=fail smtp.client-ip=52.101.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s668Vn7m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1ul+fpPd0exUf88uN5O0dg8zXKvWxMM5qAep+YNHg/O3uK9CdvzoJlmCMM5zMm5IHbOnLNPqG5JNkrOG9/d6CSeiAOQ/VR+O9PpPgrdiNF9CDQdynHj85O9WSxEv/oxMlmuQuJpFY/9fLCmltEBymmiSsfpWBPxUFz4rLy7sTyuvLoG1bK8eSzKMf2MI121USbrRf2Wt7Mxkt9pV3VRmULEvnR87lTNP5KTKFsbFlXp07Ilb5bxOZCpqE3whE2qioYSQelMGjz3SZGoqZWWeCCQhajgfoFWRAtGkpoLTaLQ/FnK4ZBGQYGCvW/UHbqTao6j2LM7LOFjPQ1yx42ykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9sMn9v8R//N3g7/pCu0AF7DEwN6FYlMuLsEtas9Ybc=;
 b=vjMqGVOte8YwNBE2vAss+wL1WrcKkznB4nyfoYADcZpXryiKpGjQIDXCPjfdNHZW5RKmBlxrRIjmZ9fPZ5S+7xR16P7G1ieSjznc4bruG/bjk+x6Z31F1wYCnY2wtNmE5xlFLYvB8xqFfHMWwECnh6lCUPWJ8hhBHCB7hrf1rTBPatpgf672RuIqPH3Dbp2Tf/t/hzhOARI2lVUGxU0JJzfwIX/8S1DC+SXu6FoLboOkDUeNWWkhVNDft2ELJc33O17C8klsiJ4UFbiC6VOcflrN8Jh0sjZU3uGDmArcBviYSgMfWwUlrdmcJX0ZhfuAYyZ406Lj5IylxOjhBTPmVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9sMn9v8R//N3g7/pCu0AF7DEwN6FYlMuLsEtas9Ybc=;
 b=s668Vn7mwsdhk20DEA9VAYMUQEmiTubmVZvkPzj02eo+ci/3IVsyi4fPMBpCC3if3MwfI0/Tmul2qtcX1l9GZnzB55q7c5/SBr9djlJvvoDtSvKCnWPmgJ58gMX825B+vDbg2zkfY+YNxodM3MVf3qb9lWGxLsSulPTELKwdC4w=
Received: from MW4PR04CA0180.namprd04.prod.outlook.com (2603:10b6:303:85::35)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 21:08:08 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:303:85:cafe::57) by MW4PR04CA0180.outlook.office365.com
 (2603:10b6:303:85::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 21:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 21:08:06 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 16:07:08 -0500
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 14:06:55 -0700
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v7 2/3] RAS/AMD/ATL: Translate UMC normalized address to DRAM address using PRM
Date: Tue, 30 Jun 2026 17:06:39 -0400
Message-ID: <20260630210640.680758-3-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|MN0PR12MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 766e71d0-e002-4c54-7368-08ded6ebae85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|13003099007|18002099003|22082099003|11063799006|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZIzsxuU0wXc5T0s75i98j6+NmkWqAzGxCplIIVBFxea0pV0zXLYPg2LYbG6h+0RE4MSbFDzSssM7LH1XCPvJ1Vss1r0cVuxl9sBXSxSHvwaDL82/fGX0/X4vRN5Ix+1Ea4dZDXRuoG27kqeeAKJwZIbRzqQYyh61aVHy7HwQkLblpRxNcvIXWWgTGBpKCEKk2iuGOAP87RTKEziDZPj9RPrrT0r7+J3JrjASKTdl2lETFK/CnLhg9Nf/3ln9uiCin4X2eRsGR9nmRHs2aHZYO2QALd5skr7rp1mOzrCrFwTzJ5AcdKBL7cIOTDoJQV6gQP9GsNv0cvas9TuZJL3fgzpEddO8LmEeCqILQ9Zk65eLTI9se8sAI9oXKsKFj8n1+REuSUHcvz3RYSPNC0VeS418NrpwLCpX+/JMaWCSHm89SyBoWFzbPob9FvZk0wk7rnac/SHdHriGxIWisBmRFjAQNd9jYu1u2IXJBrETGnE4OtnfAWyrHhW5+WUJjKgg7Hb/zb4b1dNWtBBHvQnkBoIMjxmvmOcp7OhaeLiLeRYHQVYH4jn+b4+kB49W67M6GPSQSfVyoFUVmq5FpQHzdQsFxZla6MUUTiw5lcOtX5GPCFQkMCdHRXTbBqjqSTSwU3pPBdjLefMEdltegUTXGjhYbxuvMPH9gghJmVcs7+UrvIIJ1gRX4Ur7Tqv5qju14Xky9LCjiWumtj2oVEkTSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(13003099007)(18002099003)(22082099003)(11063799006)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bUrVSFXCqVPEdtPHQQBlxZzwyMc7JR3nn+MgWWrYBAX1iJcF/31hJx14bFoxTrvV8rLpJxVcq3k8TZpPOMhqFajK5MWKzOS2mW9W9NYa7o6ekvqeVs7Z8Hy93dpSe4WWadp9JVpG65rMM0C2HkwTMkeUXaJURC60KQX9GgbItJ+sypq5nJ6aHz7tzteigp7018yLxS6TXC7Lb5AeeUq//Mv9H6tdz2Gku9Jlfif0TTUBoO2vh4P72izrX7XPeer+zc7WzoxGIxZ6mh71njvgQkfefa6UQ/qiU72rYwPfe4DCyiHzwdsul31jon84AgMSCMeBsz3zGlt9HVdzS+3/2dO0u1StVOKdOEBvDE6pSIcpylykaoRfXqlWyjYEqkEtVGTvUcTOR1zF3JTM0YmVaTV/HtLv6eylpJb6YCQB18vWwTtNof4Wmzdcqtm5l9bx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 21:08:06.5818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 766e71d0-e002-4c54-7368-08ded6ebae85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032

From: Avadhut Naik <avadhut.naik@amd.com>

Modern AMD SOCs provide UEFI PRM module that implements various address
translation PRM handlers.[1] These handlers can be invoked by the OS or
hypervisor at runtime to perform address translations.

On AMD's Zen-based SOCs, Unified Memory Controller (UMC) relative
"normalized" address is reported through MCA_ADDR of UMC SMCA bank type
on occurrence of a DRAM ECC error. This address must be converted into
system physical address and DRAM address to export additional information
about the error.

Add support to convert normalized address into DRAM address through the
appropriate PRM handler. Instead of logging the translated DRAM address
locally, export the translating function when the Address Translation
library is initialized. Modules like amd64_edac can then invoke the PRM
handler to add the DRAM address to their error records. Additionally, it
can also be exported through the RAS tracepont.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=220577

[Yazen: Remove 'handler available' check]

Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/core.c     |  6 ++++++
 drivers/ras/amd/atl/internal.h | 11 ++++++++++-
 drivers/ras/amd/atl/prm.c      | 32 ++++++++++++++++++++++++++++----
 drivers/ras/amd/atl/system.c   |  3 +++
 drivers/ras/amd/atl/umc.c      |  9 +++++++++
 include/linux/ras.h            | 14 ++++++++++++++
 6 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index 49695313f850..52d4d973f4ad 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -198,6 +198,12 @@ unsigned long amd_convert_umc_addr_to_sys_addr(struct atl_err *err)
 }
 EXPORT_SYMBOL_GPL(amd_convert_umc_addr_to_sys_addr);
 
+int amd_convert_umc_addr_to_dram_addr(struct atl_err *err, struct atl_dram_addr *dram_addr)
+{
+	return convert_umc_mca_addr_to_dram_addr(err, dram_addr);
+}
+EXPORT_SYMBOL_GPL(amd_convert_umc_addr_to_dram_addr);
+
 static int __init amd_atl_init(void)
 {
 	int ret;
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 82a56d9c2be1..b6ca5fef6ec7 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -280,23 +280,32 @@ int dehash_address(struct addr_ctx *ctx);
 
 unsigned long norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id, unsigned long addr);
 unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
+int convert_umc_mca_addr_to_dram_addr(struct atl_err *err, struct atl_dram_addr *dram_addr);
 
 u64 add_base_and_hole(struct addr_ctx *ctx, u64 addr);
 u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
+extern const guid_t norm_to_dram_guid;
 
 #ifdef CONFIG_AMD_ATL_PRM
 unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id, unsigned long addr);
+int prm_umc_norm_to_dram_addr(u8 socket_id, u64 bank_id,
+			      unsigned long addr, struct atl_dram_addr *dram_addr);
 #else
 static inline unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id,
 						     unsigned long addr)
 {
        return -ENODEV;
 }
-#endif
 
+static inline int prm_umc_norm_to_dram_addr(u8 socket_id, u64 bank_id,
+					    unsigned long addr, struct atl_dram_addr *dram_addr)
+{
+	return -ENODEV;
+}
+#endif
 /*
  * Make a gap in @data that is @num_bits long starting at @bit_num.
  * e.g. data		= 11111111'b
diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
index 0f9bfa96e16a..c69158f66639 100644
--- a/drivers/ras/amd/atl/prm.c
+++ b/drivers/ras/amd/atl/prm.c
@@ -19,10 +19,11 @@
 #include <linux/prmt.h>
 
 /*
- * PRM parameter buffer - normalized to system physical address, as described
- * in the "PRM Parameter Buffer" section of the AMD ACPI Porting Guide.
+ * PRM parameter buffer - normalized to system physical address and normalized
+ * to DRAM address, as described in the "PRM Parameter Buffer" section of the
+ * AMD ACPI Porting Guide.
  */
-struct norm_to_sys_param_buf {
+struct prm_parameter_buffer {
 	u64 norm_addr;
 	u8 socket;
 	u64 bank_id;
@@ -31,7 +32,7 @@ struct norm_to_sys_param_buf {
 
 unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
 {
-	struct norm_to_sys_param_buf p_buf;
+	struct prm_parameter_buffer p_buf;
 	unsigned long ret_addr;
 	int ret;
 
@@ -51,3 +52,26 @@ unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long
 
 	return ret;
 }
+
+int prm_umc_norm_to_dram_addr(u8 socket_id, u64 bank_id,
+			      unsigned long addr, struct atl_dram_addr *dram_addr)
+{
+	struct prm_parameter_buffer p_buf;
+	int ret;
+
+	p_buf.norm_addr	= addr;
+	p_buf.socket	= socket_id;
+	p_buf.bank_id	= bank_id;
+	p_buf.out_buf	= dram_addr;
+
+	ret = acpi_call_prm_handler(norm_to_dram_guid, &p_buf);
+	if (!ret)
+		return ret;
+
+	if (ret == -ENODEV)
+		pr_debug("PRM module/handler not available.\n");
+	else
+		pr_notice_once("PRM DRAM Address Translation failed.\n");
+
+	return ret;
+}
diff --git a/drivers/ras/amd/atl/system.c b/drivers/ras/amd/atl/system.c
index 812a30e21d3a..33a04f3e7da8 100644
--- a/drivers/ras/amd/atl/system.c
+++ b/drivers/ras/amd/atl/system.c
@@ -17,6 +17,9 @@
 const guid_t norm_to_sys_guid = GUID_INIT(0xE7180659, 0xA65D, 0x451D,
 					  0x92, 0xCD, 0x2B, 0x56, 0xF1,
 					  0x2B, 0xEB, 0xA6);
+const guid_t norm_to_dram_guid = GUID_INIT(0x7626C6AE, 0xF973, 0x429C,
+					  0xA9, 0x1C, 0x10, 0x7D, 0x7B,
+					  0xE2, 0x98, 0xB0);
 
 int determine_node_id(struct addr_ctx *ctx, u8 socket_id, u8 die_id)
 {
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index b59556ded2c8..f8470d74a9b0 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -416,3 +416,12 @@ unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
 
 	return norm_to_sys_addr(socket_id, die_id, coh_st_inst_id, addr);
 }
+
+int convert_umc_mca_addr_to_dram_addr(struct atl_err *err, struct atl_dram_addr *dram_addr)
+{
+	u8 socket_id = topology_physical_package_id(err->cpu);
+	unsigned long addr = get_addr(err->addr);
+	u64 bank_id = err->ipid;
+
+	return prm_umc_norm_to_dram_addr(socket_id, bank_id, addr, dram_addr);
+}
diff --git a/include/linux/ras.h b/include/linux/ras.h
index 4b095ddb9071..205ceb447e23 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -41,13 +41,27 @@ struct atl_err {
 	u32 cpu;
 };
 
+struct atl_dram_addr {
+	u8 chip_select;
+	u8 bank_group;
+	u8 bank_addr;
+	u32 row_addr;
+	u16 col_addr;
+	u8 rank_mul;
+	u8 sub_ch;
+} __packed;
+
 #if IS_REACHABLE(CONFIG_AMD_ATL)
 void amd_retire_dram_row(struct atl_err *err);
 unsigned long amd_convert_umc_addr_to_sys_addr(struct atl_err *err);
+int amd_convert_umc_addr_to_dram_addr(struct atl_err *err, struct atl_dram_addr *dram_addr);
 #else
 static inline void amd_retire_dram_row(struct atl_err *err) { }
 static inline unsigned long
 amd_convert_umc_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
+static inline int
+amd_convert_umc_addr_to_dram_addr(struct atl_err *err,
+				  struct atl_dram_addr *dram_addr) { return -EINVAL; }
 #endif /* CONFIG_AMD_ATL */
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
-- 
2.53.0

