Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379A844D6B2;
	Mon, 18 May 2026 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120478; cv=fail; b=iZ17By0OTqnt5QDrWbWx5a1s60hPZtdblK1CmGFyok2tjaeK5JM+F7cMMVaTMAlwkFqxD+PwniBf7DTOqEsFB+tpMhKBJd5WsQoRr5a/Vvho0qCLLd+iLwgF/ubaxcjkaOfYpwnXd59RrqLJyQ6MpbpUAKBoReWp2ACAMpjQl20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120478; c=relaxed/simple;
	bh=tg7zNkd6KkiFtrd8Pk5IKlm2DqcE/P1y0uSl6Nu9CUs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j1VJi+nixocmQt/ify7A19gI04opAwJpYMJCo/9V4xSrKgehv7M85qXvpnXcp1SYQ45WBNqdF5YILacpPCseIXKg4R5J/V/7/PSQ5KbUOkqm2u8gx6JjFDCeQ2iec3/aEhNzJgFQNtSLeJrGJe6qw/JI3+7ZlQZep5jZ256FuAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Up8cZpA1; arc=fail smtp.client-ip=52.101.52.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Up8cZpA1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jygcql/uuRzuoEIK75ZtlNwIMUdWND/Npxhk2UKzOB9ODz4XRU1kjlqoyytwkkr5+jkcJJICe78446jjW/Yx+kjcGm/60GuyfEjb3hX70nOikD0kCLyQP4Hmg2Uig0bGHPDbAWTW5m+lM/HynsuLfBafjbvHAeh1FrFSnOVeEgxypfziNKBqY8mM6GwfT2cElL631OUmvCHtweVKJXiFeS0Cz43dunZ5AVWgbKsOLt2416umSzrqMntubKaWXan5GVY424OrnAyHcLmNgN03dYtIMjsXLe355/24F4nUkfZWE0JiVf8IMFMEvh1T/p+VEpL+6+Empfrwv0y4EFk7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tuQtO7HgsNUICqu+r/tbl2UOYXDgb0kMPoUJmGh5KA=;
 b=L18KqQEDr+mOf9o/qrg+F9q9WctrHxd9IC+Xz2BbmGix2EFl+r2LyOOU5JglMh4lGRDpQptFANPc/Pt1hGKPPc+ipW+z7i8Xe3tQDLsvNvLggkMBdJrZdutEmVffReg5goOu9pA4IcfZlQyhEcCUNOWemhyHazmR5Lgh8UA+7J9tz1R3T0OXSLQ7bOIEX4UvXCRzOMsuApLjECmJHfkNWt5wkoCfMBEzYrNv1N6tLbNQ2xc5Zi8eUjpkAVh+JZ2hiCD2VOJYJSaW3dwPYNDU1iZeQ/l9ex+sDRMVyqiOBQvMBBBnfkVtLzyBA4c21NurKJTfbFEAj6jzUEqyU5j+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tuQtO7HgsNUICqu+r/tbl2UOYXDgb0kMPoUJmGh5KA=;
 b=Up8cZpA1eJfRFdv1bZOWbZeVE/8vzegTn8INuNBvQhjzZnWqIIqPelJBlTlqDyoDmb0vbStGoGDQCIP0I5suglOP7xbQEuNO9vRj/t9HPTww5hUCscaR+kc1hgyP7C9yvSNkkc0wo3ZHJyT8Xx+Fu4Uj4CdPPZtJ/oFiEMglAHA=
Received: from DS1P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::12) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.23; Mon, 18 May 2026 16:07:34 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:8:451:cafe::77) by DS1P221CA0003.outlook.office365.com
 (2603:10b6:8:451::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Mon, 18
 May 2026 16:07:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 16:07:34 +0000
Received: from yaz-khff3.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 18 May
 2026 11:07:31 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v5 1/2] RAS/AMD/ATL: Translate UMC normalized address to DRAM address using PRM
Date: Mon, 18 May 2026 12:07:15 -0400
Message-ID: <20260518160716.171578-2-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518160716.171578-1-yazen.ghannam@amd.com>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 452f5c60-c134-49e5-4a2a-08deb4f7928b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Vll2s9wZZbQ6JNGcqR/dGYSR3KqziHAGIuccmuxu3xp3IMJjsl7WyWL3VrTspY87eWEvQ5vkGCJWMi7irKjhR9Nm67daj7UrIDZ+mCBOBqHRIa+4Pw2JzZKMlESdNksC0klqgS+JuCHOSzrMmlREp87+uDeb2xNDFQQ/ZNzhF5RAhd59YWR2RySTF2/ww9nEmzKV3z9aWlGV8bDip3+8e4fc/DiTPK5gys3VIvmVCflA4tARw+McBxt7ueO1n22oahS+LBzDjFstjxvkmTWYxXBhJymnkR6jynUeg/d1g0veNt9LCAsVIy9X5NknRvpwWEJrnqYB7WbnQZ2ygbMC5bcwXduNZoug5qEClWuvtPQ687lZsOU+tvKs+uf1gLd7xf8UwqUVnaZ2EeKwGoOhgwRdKoTWDTTXGKf421OCmbI+l1hWe+a8Hai9NKZ1Vd240XQBMhffDZyEUIgWs73ufLxsqLcZ3GnqgDFP+zYfuieuO+8c5AIh7kQ04oi/9L7daBtezHlIQc3fAMOU2/U4TlRZ9oBhEQEDdhmnW0tgaAjHdI49rRz9ggzx4a3gPWeVKHPi80o8AmILiQcJDNmnozidVSF2E30aQ91ucRsaQXU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aL8/A9iCeuaxPg01xOJBc8/tuvkV85R1lHAKJ+YbDq8CKofpFDryCnioMjDp8bQHHcnbDVn+zaRDg/WxWjRIAOUtnZBJKe+afpXCL7dJrUrB6z3rabi/2tn6sWU98xQELQVzyOogK4zUA7SlO9j1rj0/etEkuZScpEmaGt4zaAAa5pFcOTn4r6wMJ1iE/KSJss30P3c8OK/XeSk76gNiRbqP9555INRl+DkxyCtMtIjruJTV8pcYjc75M+6G6+jsgvhhJk+8BJZrvA0qrqRbpZ27XDKVT2Y4aTPRb6Z42dnLjAd7KXKNXdPXXx+g/S+w2PO5pLd8btSyqi1Bf50qsJxGBmYlu1KMyHqEbRfBuz1KepD3yXBezgXtTKXDsmroPKMkaxVumQ9XJTWnERdVeGZBY/p3sc5xRqib8MIOmGyzIpVmsC+7CTkqwDDEasY6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 16:07:34.0842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 452f5c60-c134-49e5-4a2a-08deb4f7928b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

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
locally, register the translating function when the Address Translation
library is initialized. Modules like amd64_edac can then invoke the PRM
handler to add the DRAM address to their error records. Additionally, it
can also be exported through the RAS tracepont.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=220577

[Yazen: Remove 'handler available' check]

Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/core.c     |  3 ++-
 drivers/ras/amd/atl/internal.h | 11 ++++++++++-
 drivers/ras/amd/atl/prm.c      | 32 ++++++++++++++++++++++++++++----
 drivers/ras/amd/atl/system.c   |  3 +++
 drivers/ras/amd/atl/umc.c      |  9 +++++++++
 drivers/ras/ras.c              | 18 ++++++++++++++++--
 include/linux/ras.h            | 19 ++++++++++++++++++-
 7 files changed, 86 insertions(+), 9 deletions(-)

diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index 0f7cd6dab0b0..3d622e6a6cc5 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -210,7 +210,8 @@ static int __init amd_atl_init(void)
 
 	/* Increment this module's recount so that it can't be easily unloaded. */
 	__module_get(THIS_MODULE);
-	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
+	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr,
+				 convert_umc_mca_addr_to_dram_addr);
 
 	pr_info("AMD Address Translation Library initialized\n");
 	return 0;
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
index befc616d5e8a..b48c0fe97bf2 100644
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
diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 03df3db62334..582aa2b93e81 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -19,15 +19,20 @@
  */
 static unsigned long (*amd_atl_umc_na_to_spa)(struct atl_err *err);
 
-void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *))
+static int (*amd_atl_umc_na_to_dram_addr)(struct atl_err *err, struct atl_dram_addr *dram_addr);
+
+void amd_atl_register_decoder(unsigned long (*f1)(struct atl_err *),
+			      int (*f2)(struct atl_err *, struct atl_dram_addr *))
 {
-	amd_atl_umc_na_to_spa = f;
+	amd_atl_umc_na_to_spa = f1;
+	amd_atl_umc_na_to_dram_addr = f2;
 }
 EXPORT_SYMBOL_GPL(amd_atl_register_decoder);
 
 void amd_atl_unregister_decoder(void)
 {
 	amd_atl_umc_na_to_spa = NULL;
+	amd_atl_umc_na_to_dram_addr = NULL;
 }
 EXPORT_SYMBOL_GPL(amd_atl_unregister_decoder);
 
@@ -39,6 +44,15 @@ unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
 	return amd_atl_umc_na_to_spa(err);
 }
 EXPORT_SYMBOL_GPL(amd_convert_umc_mca_addr_to_sys_addr);
+
+int amd_convert_umc_mca_addr_to_dram_addr(struct atl_err *err, struct atl_dram_addr *dram_addr)
+{
+	if (!amd_atl_umc_na_to_dram_addr)
+		return -EINVAL;
+
+	return amd_atl_umc_na_to_dram_addr(err, dram_addr);
+}
+EXPORT_SYMBOL_GPL(amd_convert_umc_mca_addr_to_dram_addr);
 #endif /* CONFIG_AMD_ATL */
 
 #define CREATE_TRACE_POINTS
diff --git a/include/linux/ras.h b/include/linux/ras.h
index 468941bfe855..1e82a94b0db0 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -41,15 +41,32 @@ struct atl_err {
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
 #if IS_ENABLED(CONFIG_AMD_ATL)
-void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *));
+void amd_atl_register_decoder(unsigned long (*f1)(struct atl_err *),
+			      int (*f2)(struct atl_err *, struct atl_dram_addr *));
 void amd_atl_unregister_decoder(void);
 void amd_retire_dram_row(struct atl_err *err);
 unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
+int amd_convert_umc_mca_addr_to_dram_addr(struct atl_err *err, struct atl_dram_addr *dram_addr);
 #else
 static inline void amd_retire_dram_row(struct atl_err *err) { }
 static inline unsigned long
 amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
+static inline int amd_convert_umc_mca_addr_to_dram_addr(struct atl_err *err,
+							struct atl_dram_addr *dram_addr)
+{
+	return -EINVAL;
+}
 #endif /* CONFIG_AMD_ATL */
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
-- 
2.54.0

