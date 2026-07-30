Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AE639D3D2;
	Thu, 30 Jul 2026 19:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440942; cv=fail; b=pbCJmmth0oNrxXFttR1+O7c8JX4yopsi6QjU6qgj8+VtF01bCHg9TfjqR+d6ScToutjBim+EmpcwuHx59UH7s80dOBP4argam7T9N5sFdkapxsdyOdixqWAifg9wHCrrCQNoGbA5ncSNfgb8TN+761Q8HlfQMiSsXtm6M0KVQ7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440942; c=relaxed/simple;
	bh=beSQLxJt36atG62rnOnrD26sgB1iyGtKv9D1cLeHBC4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KmyZBbYT6tzwVMzN5KREYet1Oa2i3rC7RQx5lvapBylSkewOu9zk5HCabYbJlr+zvRI/XpvDPWhVClVLKr/eiA4w4iUgPfmuatzPGgPCL0WWQCl/wecmFmF872G761dLadS2ack89R8qpPVygc0pXzWH6S7VR6Lvzp7OhyjdZFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hcl+6RPw; arc=fail smtp.client-ip=52.101.46.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hcl+6RPw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjyxGfSP7ykyQfGKTKhviTqxa2imWuxyzwxuhFWU+m9hAgEsi392JnBTW1adVYDcPEn9Gc9yBv5UcwjxTD4jxwCuO2HOm0Y/MH0RR73bDU0o5xLFVi3VNo9sefzoL610rmQYjHswAQH8HhULd7Dieg625nPZ0whi+1YwSmRNVX9MPnGKwXHVyAOEpIrL4/l9JVaEShiq2knr5ZRx8ogPC7FmiA9Di57X5x2e0yI7RABq5YB0wc5pAjVxjGDhSv/cuREJL+T82LJ/ZKp+QeAToCJjtYIz1ERkJ+olMd70qdjQYYyieKVXbEVdwwKVvtz14lErrazQNx0mIwxZAcA+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WPVet73KXxzXhqc6VSYs1z/7J3Jf6vuWL3AtodWskU=;
 b=ZzsPvOfq5dgAe+E9rI+jK0rSMf8KTd8V+P2ChhSQenwjvMlt0Fai9ZxZo/xOWItlT2biRBsIuH1NNz0rIU49ZYGdlUswiMMTntFOKhgAxSZLXs+Qkgrrt0aGeGE0f1U84cIIdeYSyRxHYrgkY2NCIe0XBacGLVP+x/x/P6LbnnIL5+OO/ysfKZnKJ3r76/okAWabCvTWTFsYtMv1ojeVUSjaIZ4t5eoRNypqTUcpTmfq87zBPI+BpwH97W2jfPHPrnMhgQAg3mJiHt6hdF1KmVXSDokA8XZf0pBwb3JXY7jEMtp1T9WUqn1O7XsJkGZJ2v3Eyx49z4OU3rECVWbpqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WPVet73KXxzXhqc6VSYs1z/7J3Jf6vuWL3AtodWskU=;
 b=hcl+6RPwW1Kzyl50v3JenkcZgfiv6Q9GDMgZvOZsBXQLZmlt3XnI6/X6hvEjtlYoMNGiPeJ1LKjLmufbY5a7//CXC6TBdxgH7jXIDWtHVurtOYjEMqGqCn23HKT7UnQpV36gCfY0D+OWOShB2uDb7WfPS2uIzCQPjjoVYp/KA2U=
Received: from DS1PR03CA0010.namprd03.prod.outlook.com (2603:10b6:8:450::8) by
 CH2PR12MB4310.namprd12.prod.outlook.com (2603:10b6:610:a9::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.15; Thu, 30 Jul 2026 19:48:52 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:450:cafe::6b) by DS1PR03CA0010.outlook.office365.com
 (2603:10b6:8:450::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Thu,
 30 Jul 2026 19:48:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 19:48:52 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 30 Jul
 2026 14:48:50 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v9 5/7] RAS/AMD/ATL: Remove the standalone SPA translation interface
Date: Thu, 30 Jul 2026 15:48:32 -0400
Message-ID: <20260730194834.3203601-6-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|CH2PR12MB4310:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c3ecf3-bd5f-4358-66ff-08deee739530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ug2Xs3DTGlx+iYfysNef4IjghqO0jv/mdrTGZ5TqXY9alElfV+35Ptm9xuKTkWEu1b8BFneK0xnSVOR1BOLZFJp9IEVOAbSq/s2RhFYuDkGIBSt9Zom/4NWi5KBuuYPTssAAVQD02/b1Ua/0ZRj7EJz6/kHDoSTDgiTofz0NMvI+lrKWNYmyee9WczWfct8K5TVx6R+RqLfpx/7aeZg6nQCLekyK+vfoS7pz1QxenCrktelVBi7m2ek77v7lAd5wPUjxyL6RpKRP92to1WETXKVPz8FHFteAUkvRkVkfIM5q1oGcAqg7Azk0CtaQM2Hgym45Zjtgw/+l0dXtOyIuH9G3ncqJHkuEm/7laKOPPqXEI/0JCJWW0zAfXx9gRsDXApcLnhGWoV8Ol/4bTZwj0RxMo3qvLKmIEAoab8Yxbryqjq5owxUaZ6v0gjGYLBFWC6FDX8mQS408jUDKmYIk+YpBFQ6LLPSuWgF5ZbsfD/kje+cZg8nXiUPOLy6OA08XXskutXddF4oOl7xD9W2aObTE6msBQ/n6qZBXtnNLxrRUFyssE2haW+5NXliYpho/p7I2/UZE8MEBZ5o5i8C0VfYaLGpki5SmkHrWh+S5Iw//FT/hyUj/3spG1golv4cW2Bqlcn8jKY6fHi34JMBL6kROqojjCasBSELhiCWIOxM3OEBLx5+VVawiGWIuWI9yPF9ksmv+NYR1Hj+veo+jjg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7vu24arrt/4QQaBqJxi6IYFTzSlTenGRZC6yLp01ghICkpMcP5m1b9QE0mOGSOXgyMRxf4Naxl2TU+Ey3IyyXsrJ99Yw1EaVLJXFj/KyNtC7UelZnlpnjyxANI9KhShOejQovzVqX/E0dtKKySv2HzK59LwN8v4ShclX8FeiYbVkkTgjSBX7RJ18hm7SXAkvKnPQ0nse9Rq8B9jBT5JDGb92C/XsrkgWtXWS3uJB1rFBce7TqwCkyhmg9+Sdqd7RZxJAde4nNQ1+aA/YRR6WXZWZoWf+mVKRJqxm4pYgn8mBBt868Ru/kFHCqNLoNfoCOgdzf7jSLRryk9MMgTefaDEzbha81muLDnFD2Kzi7OcGcbViX4P6ms6IJJGi6MvsSTbCH0p1mNREwNcFIpkjYAeNhbrNFqdQW0d6tMnjmVGjFNEYjM53lie/Y0k7Ptt5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 19:48:52.4038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c3ecf3-bd5f-4358-66ff-08deee739530
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4310

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
ID that amd_atl_umc_translate_addr() already stores in struct atl_err.

The prm_umc_norm_to_sys_addr() wrapper has no remaining users. Remove it.

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
index a951c00f940c..b6b2d12a2a66 100644
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
index 4d75ad4483e8..a3f611a4a9f8 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -401,21 +401,16 @@ static u8 get_coh_st_inst_id(struct atl_err *err)
 	return FIELD_GET(UMC_CHANNEL_NUM, err->ipid);
 }
 
-unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
+static unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
 {
-	u8 socket_id = topology_physical_package_id(err->cpu);
 	u8 coh_st_inst_id = get_coh_st_inst_id(err);
 	unsigned long addr = get_addr(err->addr);
+	u8 socket_id = err->socket_id;
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
index 20e23560dee5..c92b6d599792 100644
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
index eac8cf39ddd5..f0afacdcebcf 100644
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
 static inline void
 amd_translate_umc_mca_addr(struct atl_err *err) { err->valid = 0; }
 #endif /* CONFIG_AMD_ATL */
-- 
2.53.0

