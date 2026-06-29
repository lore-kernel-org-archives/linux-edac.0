Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7E5421EE0;
	Mon, 29 Jun 2026 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745673; cv=fail; b=Q+KafnTUo+7io3KKSnWLYPOHR0m2gURCObYUTjz54014oTyzhXS+g2fjvsDb37yCynVSyGOw4CvdZQfpeG9SwmBUMfDck6RNZrDDdx3O2BWNXXr5FrZgAUI1Z0cbxNAmSP2/ikd98tm27vxJz2eq9WhNg53xDf+Skj1UbZoqRY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745673; c=relaxed/simple;
	bh=FIk19Oa+C4Bxbh4fFh8uiv1HUbilW13/93ygOXUY7mo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jl6jgnelHJJh4YQmmUeWUZPgR3olIz6k44UtcHdrEIXXwcr6uPwyifci/LG0oxH2zQWSu54OXd5WFcKO+7uuevr8CuE0dsygN++rGwWAWHLJckly4zez3FQrv3QltH/vrPw6qQwce7X60QAP5KFsVRvyC1Mac2+qt7Ob1c3pXjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xvZLoNn3; arc=fail smtp.client-ip=52.101.52.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xvZLoNn3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbRfNvLIet3pGMEglWbnuMbKdE8GqjfhKHMIJAzxDsjx/VjuJhEe4Q10hi0JdGjcaj3PUwrKxVHcmxfm7ZmtehnkwLve0O1WMPZsIRdQr/mObeoZ9hzi74Ugk2bG98V/Ax8M+10CRF3TgfcfUGLwUsmOfuBGB+r8SzIQncdsO+wffd0/PWx4NLECTdPQbuYM8Fvn3vtt+ocfL3PwoyEf3TWJYRjLvGx4aacgwY59HLHPqETny7yi8I0ZzE0U2KjpYabnfIKsSNJR2ea3idms3sT3Z6DuNy2FR1oVqgOyLM72K4x/vJi9Wmerq5mhaJD/uOlJ70CCBki2dAYnqfv4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ah02JUzxXPuwARt3sRgwnumcTr7klWYLs1P3673NQw8=;
 b=G9YU5nMOq9lg0jJ4BiyeldOcd9RqgIFC7+BLBiQy4Zw6Q11/XaWgsTT1H4vNtIAmXqAnNr9jKhoJB0mPXHX8NR47SwZNG9JFu20YdToHy1UZgHdQnYohJfcqLyh8iZTaWWgOP4Almm1R1hzs5IEsS4oot2nEK97k+0848wvTtb30JPzbWxw1lkEvQgJjsiv/S6oGV2RiU5Kkg6uzDfTNw90gm58gYzJf8m60EXuM26gXSyVikGr7dkVK2uXeBGled4KBP11WSwyF3gKnYNaDqnmT+VKPcqjUmDeef02kYzEpJxZ5jfEXPpgRXIcuywHiHJ47j/PPxnaW/T8E4kCEeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah02JUzxXPuwARt3sRgwnumcTr7klWYLs1P3673NQw8=;
 b=xvZLoNn31Xa99yOeoOQFbrT7aRaC+tT7EAWyTPbWHQZuFEIgJ7/X6thkxcUFOPOJArUIq1TmwOkKK7890HIKoc1QO809/k2kmEHnt5INmpCtSD6tLmwVwffZoLEmvYeRMDRKHM2juGR/k8j6qBd/LrYYMLdN0Lu8DljHIK4qAIk=
Received: from DS7PR06CA0048.namprd06.prod.outlook.com (2603:10b6:8:54::24) by
 CY8PR12MB7562.namprd12.prod.outlook.com (2603:10b6:930:95::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Mon, 29 Jun 2026 15:07:46 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:8:54:cafe::64) by DS7PR06CA0048.outlook.office365.com
 (2603:10b6:8:54::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:07:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Mon, 29 Jun 2026 15:07:45 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 10:07:44 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v6 2/3] RAS/AMD/ATL: Translate UMC normalized address to DRAM address using PRM
Date: Mon, 29 Jun 2026 11:07:30 -0400
Message-ID: <20260629150731.1009605-3-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629150731.1009605-1-yazen.ghannam@amd.com>
References: <20260629150731.1009605-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|CY8PR12MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a373635-ddc2-45e7-4865-08ded5f02d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|6133799003|5023799004|11063799006|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	OjtaV26pxN+ox7gM0kgSdiQevxzPOknlmKclDAXOunDfF87dswPaZMQzwIF3AtB0IpL2FPZV7LOFwWkLVe08YUeaQZQTswAbys5dyaDKturgcduxJAZA/wzYM6GCSR52+LNeUs+6fbH0dyndS4hIdOJV4ZbwGOnBd/Zuo45bT6UPReTt64UT/+pC6tEdfxKOAHzisvcmq5ZIiGWnQTOvYaSuXjeQm8e7poY1QMvM9w1lXPNZVqWuAZl9ZGEwcyRyHlAPioebvcJgKF8nLkIozzh3pJVLWczIoKMRIEt8uSIo4ezZBL9oL+wOXoHVmjd543MDr14ZYlScZcnAKR6r73IsXI7xlpYUBUunY9r5uXLAnvRAuRmpdTZi624FFtbPfMbJ7dcQ6tCRL6tNu3ddFqC7kIt7BVBbgZAss9+e5Z8Qefks4hW0lmInI2lDOMO22oxZUI+Dbr5MQuBlOhop8EHNjBB+l/kN7XXT70lbujc2T/FaVolcIiwZUrUo28PBItVxS8b3S7e5S80LYyzXPIp/dvJwpSyqH7RE8XpD9uujBSmJ2xzajFetdm3c9PAWp4hQKPnHMcNw0lHjQlCyzlH+BYQ959LtFoEwOJyXsXyXIC8Q8cSH0DPmLwehAXoo3qrdTCzuDq9Ey7ARajVZ6KkkvH053NPiEaucugZ6Sh3ksEy040+gTQL6XDTCRVyTBog0eJ8tNJcMy87i3+yUHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(6133799003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7v8KH6F0vn5xKgwDZWGyLSqMCE27qO7p6iNq+JXPshH14ZX3uY1jdXzw9glrJsUPGnfS7/Bj0Gl/mwtY1o8lBHcFd78THfMM72/+cclsQeXoLA8GVMyOmxMmCz1+2gstZ8W1p7IxFEVBX7NUTIs2j8Fzi5T+Q0H5h2Dxl9dxJ2UyNDeX+ijX/obTwXncnsozaPCWJBDHuGh7J7gLqP014s4qk/WelDmevP8xNdlC8h9WX9X9tboAN0vP39gRapLitkavg7RnODTDUZHdjKiGasgHi0rjuq0k3+02GPehK2LkH1qRMqAD48KXU7nbncl8g1AfCwYenBHchqp0/0n9vvZlkKI3JqumvZlgnUV1J6CRnMLCtmxynX9aFgvf/xn2BtcENaqf/JlN8qyIVc8YajsJLeSVIiESfmaH+hFr+5ljH05TjNcT6FP68npQ5c9J
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:07:45.9184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a373635-ddc2-45e7-4865-08ded5f02d29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7562

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
2.53.0

