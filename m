Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62954396B8B;
	Mon, 16 Mar 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665636; cv=fail; b=QW2XKIXfjAEndGGf1tSB9byCmMgclcvnNn2YrLkrPuZ/mMHwkmtJGjspt1WwxjZq/oiCmObhZbofslErRKjhH8BLY3alUy7HspQwAQpTSHhPszHmZQ8U+i77iEtnUbfYb1r1YMNK7umAh9MGoMQQlHGprCYjPGwer97t6mt4igE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665636; c=relaxed/simple;
	bh=FIk19Oa+C4Bxbh4fFh8uiv1HUbilW13/93ygOXUY7mo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cnWzXp52279B/zNK4n1+GNW7n8xzQaHgW0quXI11nIxBoE43yiEZhQSPLUq7ZehAGUxc7dpIhY4BN8iPzOKg2nqAfbgUzrO72lCMg97hDWscORKMkvU3e9E2B7wi758BGGxI/bdX3hZvH0SchHZKni6XyHkSOpaT3XOEsp8Tmto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rmZjlGoF; arc=fail smtp.client-ip=40.107.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rmZjlGoF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv4DYFqBZzhazARgi7gCC0xtfMdUYev8CMOuU+/mua8KBVVGZDwmAKGBi96nLOsO3e7n3lQmq8m2FNWuvFKsQCvdhNMBeWivEJ/UV+NnTGAEufL/J3so4RIJRXmy7hEZhNSEpKWkuyxTfKYs7M23RyIqZbhVearuKwmcqv4IXojaiok9J3c+3Odt6NF0vHQYiTB/94RVwH7AX/St2Pybi4tjuU9CDYAmn0kTFaeZ8Ax0y7fioyaojbVYiJunsUwFRTDxJtl9VJiH8KrjKmQb1oe3yAURV7/Gf0IMaxm91Ccv8gzjqOpTsZlKSrdnzEmfymYhMqcojkGw5YlRxF8t9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ah02JUzxXPuwARt3sRgwnumcTr7klWYLs1P3673NQw8=;
 b=tweEeUQHHF1RMTjOnBM+TK8P0E09jXCfFkXg9uTAQYPOjJjUkF76YXkQb4FYdeYUXdVYOtDD1LWuLdY7q1c7XOS55VU2AG/yb9Ixc0IZg0gVjoWcKOeJYdJG2zqXnho1y9jIlyzbS1q8xA7vIAfhDL16aVmv1LIflkl1xM5ShvWVNZrfWv2mEzffx+8fCH9+pjy8ykSAI/7CRVpo4P/04yRT+33lYvveyI+1APi2Rh7/2ijyxyzEVO0TyipgNVWo0diXuvmSQZJwTIgPPitt8WmJj96Xmno6Fp5InYCTbeMXTVB1eWbAEKg8RxnfZzieTpjiMm9efwj9p2Ef7wFB/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah02JUzxXPuwARt3sRgwnumcTr7klWYLs1P3673NQw8=;
 b=rmZjlGoFLksn02FDZrYg92dl8kvdK0eXqHp1WuUdVsEQO6AVaFEqTcDcs+WSfd0q2zMyPAtiuFyVpKP0wJQRljYopgHqXnRQ1s7N8AVUzSaW6P4UNiRLwNMXBmQeTnjtnYtIPtJeHE4xtKg17vOzqxjZcmb6OjwKQL5jFxgPWjA=
Received: from MN2PR18CA0006.namprd18.prod.outlook.com (2603:10b6:208:23c::11)
 by MW5PR12MB5599.namprd12.prod.outlook.com (2603:10b6:303:194::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 12:53:48 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:23c:cafe::6d) by MN2PR18CA0006.outlook.office365.com
 (2603:10b6:208:23c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 12:53:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Mon, 16 Mar 2026 12:53:46 +0000
Received: from yaz-khff2.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 07:53:44 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v4 1/2] RAS/AMD/ATL: Translate UMC normalized address to DRAM address using PRM
Date: Mon, 16 Mar 2026 08:53:23 -0400
Message-ID: <20260316125324.396889-2-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316125324.396889-1-yazen.ghannam@amd.com>
References: <20260316125324.396889-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|MW5PR12MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ea2ca0-774b-449c-fed4-08de835b0feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hiZ1Mc+d1eOAtqlrgZyWykwhAhGrViZ/BntEsQmR5qJNVpjZEBmpte6D8Nw2Sbg3Qw5kjkzbiIqF4tWKhE7gmBXOsAoQpOZOYgbI5bOKdJziKJgWsRk2/s/8MBZ3Rnre1z0qmTg9VpZpTwImLYzueevxnp4FCy/tLmYL6w0GJEZVkYDkOQZl3Rm3TTovMW2VCFIv3a/zobwru5x+ScjJtYP3BHNTMzzvw4cJWXP/inaPMlSEjxXgmpSbdqU/I2JZsh8yG2gm4W5uWgr25eD4tR0n0BHINMIpKctaNqqEU8RnljsgiaV0O0A1MCwcCtF5CrZZuKoqYX0VOLNifhy91FPi3lFygDeNcyyH6s52GulRGZjJ5/D8ZNLVVyKIbHbJGCAPIKqQqKKnCJToIF3JKBZsEmkeGcH45DX5csWm85V1MiAhCBUzPXpTVbQcaLUa+AR69SCQtqXci5rZKvV7stkWcEhqJzH5qYCx7YLNpUxreAmw3SkU70vy6AxixM6y8gAAdAN54FcM8dPsQDJ+5Mas1nguDtfnmPmUgo8mx/j42UU1nsHIB8e15EJKgQ9qrcjA64lEkuIR60gkG0CGX7eThx4cO2NvhqXfxCJKHTC/q/eRc6B67IztVFYHnrqyl0wu30f384VCp2uPXRY7LyU8gennz/tEjN3bieyXHwB1HqdFuADt0Kon1+9V475p0p8wI2ABHZ4U2wkLBSwkpymeQKW9/oNTYfrzadv1zoXEkkY7ppomou9aWqzniB0vjYGmCP9xYtEkJHF9UgAkfw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ia61CFLuYxRYhPWTFTTHdfQsMNif0yS9jKftZC3wZglUOJXqtBunY+0E2vb/FERaCgmzAI0QABzMiC4smsDpMV6dQfiMht+dBVrj4PLop8QiaqaYSKPnYd1xCO7HNQP59kkwod/mGlx8H+7kKCYU9eXivpDqksau3zH8fr42wi+AqJ6jKLTG+ZtP1JSYLO0jiu8LWJwxfM3gBvORIfvOGsu3SobQ6RNMXMzrVqOemYuquy8wSRG/wd0Vo9jnZdMHbUrIw/701NIp4jg9wTVs7CesGAM+0MyhOe1qaTAQf5LbONmnmojyKAJ40Tm9bA9V1gNkuozzhvFepIoryJUp2xN+9PbvMf6ZdG+AcwV3+65fJXx6GVIMf0XjE/iWWnA0OPC+Okqz6/O9DzXKarcjFOhFsAev2rglKn9EPWf9NREW3C4Ei/8LkkcZAyNW7ZCD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 12:53:46.5148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ea2ca0-774b-449c-fed4-08de835b0feb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5599

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

