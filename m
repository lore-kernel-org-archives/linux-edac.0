Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B033A3806C8;
	Thu, 30 Jul 2026 19:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440948; cv=fail; b=NSsMJnpaYQ2jFcEt2wN59PMNvqS/piaCIIYXVAqi12sYpLmoT5Ot2WF8Q2PEduqPa859RPrE9Y+UZSQX4vpwFiIDTKqiA2Mk0RlZ+SK7GlBb4OcLNxRL6mzoo5LGD9Uzifsi5jYZAEov/COlLzDajkc7OA5UyhGtp//d/bpAfB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440948; c=relaxed/simple;
	bh=1za+dN1WlSGQLOTG/lA9/OPZwKKoKcBfDUhGOKXj04I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B6lYKkBYy3JaAitqcjddFOvxG1Gy11HGRh0zvOFbHdp1kTWtbg00Illr6BgT1Zk1Y8a/6MWvfkeMxdgIRH+B3clPqWhirGbFegr5/TQDaMW5MXxxeBAEtn9cG2jknpZGQWs2X0zufdY89W3uTsvA1+cxGL92XQ14uZf1doxMSlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hehmjPui; arc=fail smtp.client-ip=40.107.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hehmjPui"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+yIt4gPfGiYhcgZcg6tAEcNDwU6HwD5EMeu6BvpI6mydAsDSbRwuQ9dMwv60sjip37vpETuFiBk9AgNISDG32U2BWU9FK2AHYEiNhb50i8K0YKlcKS7cl719uENF68VlrpMlJbTReLMBWgDTWwy/MSD1i3C9dRMnUVlHQIDlGxZ9kXUA6pcZQ+UZTYJrANBNvIRz9WUsk4SfLfwsyGfoNxRfn2sGSVVHFieu8MaAjjOrDWdmAgSWUygY3DckzEyUuYGLEJJ9k1eCF5+CWUehxuhS2z7DBCDPqbEXzPWXgg5lpQeIgDBAcbZk72iUKDrBSIqxETwuef/DztNSEOPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldAraGSYT4p6I/T/5gXWJFsWFNaD+injkRkcRX8i4Ls=;
 b=IdLVJKHpyOIy7ltq70pOqt1jGHwI662MW508T27nWcDP8HjElgYKV5c+xDrjgaIetQKGGbuG5eIItQSklWDe5kTM01jdt4JkDch7E85/FAQLcelK0d7qKgUGk/k21ie4UW8tJmrFiEVG+brKIZC3e1x6LgReiBslE3UdA8wqf6VikORP3hDsvTT4sRaQWHoLhm5QDxHQ6Us14eLqBnGgFejOFnzHfKmmxCHk3RN7wMNCdVkmahBmuYcEW94azn1TY8R2iXDXl2j3+rQq0cpQk1TPrjUNO6HfScxWYlYsVRc6POt7yryr/gXOS2DbctknHtYLCDtY0WBVPFcuwOUjig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldAraGSYT4p6I/T/5gXWJFsWFNaD+injkRkcRX8i4Ls=;
 b=hehmjPui35Bj+yeuqnhbqv+gk5mrQ7JLn5tHgU9xgCxYvznXDGPGDQHUEmr5JBB6NRaQ0LLFpycw8WqReFev6t3Ujai35yxZLrwYLRDBz6L5jaXyluGaQ4lQA8y6C4rgJxNjuP1K3QCVhEEntrXRWiTQ9fLpSBJHwL9bEePNqsA=
Received: from DS1PR03CA0011.namprd03.prod.outlook.com (2603:10b6:8:450::13)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 19:48:53 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:450:cafe::30) by DS1PR03CA0011.outlook.office365.com
 (2603:10b6:8:450::13) with Microsoft SMTP Server (version=TLS1_3,
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
 2026 14:48:51 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v9 6/7] RAS/AMD/ATL: Add DRAM address translation via PRM
Date: Thu, 30 Jul 2026 15:48:33 -0400
Message-ID: <20260730194834.3203601-7-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b870e5-e4b0-4e4c-95f4-08deee73957a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|56012099006|13003099007|10067099003|18002099003|22082099003|6133799003|5023799004|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	Rl1yZoIEDu2fvNUc7kurtMvtQGMiQQ71mRY0TPSaqCZNHHYpuGS/21ilu//bKuYms7ORXGo/Rbng6tzk0qIOU+KEtVUD9xrj1Vlt43Y/nTs9cIrVd9yCu2PdfVFYHuci/n/TvpDyReVtsjD+HyzghP6ILb7ruXEKNyZo28/ATNYK+nsY67j8FdGjHYJTkT/D0wVJYkPzN9kbAnwYzoJkj2hYSsdXKTdZxyxvcj59TjPJSFVyTZ4Rv+TrqVUhHswiSvCig8FpLnhnHdhU4GOi2/7FCuFNLtFRxHci46eeLw0jIaIWyhD+8yMCW41bzSNeN3VIAhz9Z+/pTb8LWh8al789kG5MJr7+BKqrb3+TeMUni1fiCum5D2aUwzZRsbyfeLDPek3qkXktvQvkKNbFyvzztC8aBhJBmPEMvoWTgwFxrYozq41ieXdk08kaW//Gw9ktugn7myBGpe9EuXZfrfBdvpw61hVZuWdoN+SGc1UpVnF3Uke7kzU2ikQvOWkc4qmy0Ba3GzbO6QhTFbl7W0c0IGv0134cHtFV4nRTElUx2cDxV1RyM4WQHJW9faHKgtFEUtvikFqqdXkmuEifyolRIiNL85OrrVspUC+w6tX0jki0T1VcO9ZoC9RKiBvf1moH+cDjwxRbm7SDgfufRO9YgbkbZ8PO333TKYiCa3P/vmLyPnlyP4PoxOxfEo7VhfTryEp9J0WZsgXR1s8j/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(13003099007)(10067099003)(18002099003)(22082099003)(6133799003)(5023799004)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I1/tbZM6EOM4aUvH4uCEeD9mYxzsSEXDEbLnyzG4IyzMyxtT4MKeHp4BchTrSbI1CMlmXmWoSI/Ejfqk7TqDw9mca8LxDzzLzpDJIJOwxikoR7yzWO42Cq+2aP42+3WHgCze7mdu9B1XdO6J7wwFm3VJoOYa77dAYod1lVRHJnBWOx4hXBeE6HXWhFkw1Y3qPdW/nYWFf0FG0I98/coyOeAjhDPZa/sZkofZti//s9ZcHrjYf6Kf8yc208X5+lbs8K2Neq/c5PiWDtI0/jBk9Fbigk0/LJDTEAOMfcxnZ+5wd9uYMkZvhSA0WCQ0FHF1VJg4bekj99WmkyPJFevhPBC5JJpBsYQ7nPgDMPXpeAQIwHk4mKI3VlWXLEM+TXuozxBmSZxABZsZpOXk6hs18erzeZzP2kfDoJGX4scqiPLqRL2yuMNeSVKoJp5b6y/C
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 19:48:52.8935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b870e5-e4b0-4e4c-95f4-08deee73957a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627

From: Avadhut Naik <avadhut.naik@amd.com>

On AMD's Zen-based SoCs, a Unified Memory Controller (UMC) relative
"normalized" address is reported through the MCA_ADDR of UMC SMCA banks on
occurrence of a DRAM ECC error. This address can be converted into a DRAM
address to decode additional information about the error.

Add support to convert a normalized address into a DRAM address using the
appropriate PRM handler. Expose it as a new operation, ATL_OP_DA, on the
unified interface.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220577
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
Co-developed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/internal.h |  1 +
 drivers/ras/amd/atl/system.c   |  4 ++++
 drivers/ras/amd/atl/umc.c      |  4 ++++
 include/linux/ras.h            | 13 +++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 0ebab3732886..86879f5632c1 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -286,6 +286,7 @@ u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
+extern const guid_t norm_to_dram_guid;
 
 int prm_umc_norm_to_addr(guid_t guid, struct atl_umc_addr *addr, void *out_buf);
 
diff --git a/drivers/ras/amd/atl/system.c b/drivers/ras/amd/atl/system.c
index 812a30e21d3a..1315bcc63e30 100644
--- a/drivers/ras/amd/atl/system.c
+++ b/drivers/ras/amd/atl/system.c
@@ -18,6 +18,10 @@ const guid_t norm_to_sys_guid = GUID_INIT(0xE7180659, 0xA65D, 0x451D,
 					  0x92, 0xCD, 0x2B, 0x56, 0xF1,
 					  0x2B, 0xEB, 0xA6);
 
+const guid_t norm_to_dram_guid = GUID_INIT(0x7626C6AE, 0xF973, 0x429C,
+					   0xA9, 0x1C, 0x10, 0x7D, 0x7B,
+					   0xE2, 0x98, 0xB0);
+
 int determine_node_id(struct addr_ctx *ctx, u8 socket_id, u8 die_id)
 {
 	u16 socket_id_bits, die_id_bits;
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index a3f611a4a9f8..1ab321a04cf1 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -449,4 +449,8 @@ void amd_atl_umc_translate_addr(struct atl_err *err)
 			}
 		}
 	}
+
+	if ((err->requested & ATL_OP_DA) &&
+	    !prm_umc_norm_to_addr(norm_to_dram_guid, &err->umc_addr, &err->da))
+		err->valid |= ATL_OP_DA;
 }
diff --git a/include/linux/ras.h b/include/linux/ras.h
index f0afacdcebcf..6589b4e3ff0c 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -37,8 +37,20 @@ static inline void
 log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev) { return; }
 #endif
 
+/* See "NA to DA Output Buffer" in the AMD ACPI Porting Guide. */
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
 /* Operations requested and completed through amd_translate_umc_mca_addr(). */
 #define ATL_OP_SPA		BIT(0)	/* System Physical Address */
+#define ATL_OP_DA		BIT(1)	/* DRAM address components */
 
 struct atl_err {
 	/* Identifiers; layout mirrors the PRM parameter buffer inputs */
@@ -57,6 +69,7 @@ struct atl_err {
 
 	/* Outputs */
 	u64 spa;			/* Valid if (@valid & ATL_OP_SPA) */
+	struct atl_dram_addr da;	/* Valid if (@valid & ATL_OP_DA) */
 };
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
-- 
2.53.0

