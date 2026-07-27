Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D5C42BE9D;
	Mon, 27 Jul 2026 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187278; cv=fail; b=i2UJk03ebX6o7LcM2uL+hJWBIPiGlSN0fsbOYCTtTgPq6PcpC8Y4njXdVW2nltBvoUxy/2QIUj96uOw02vIQ0QRlDyOfPJ0P8jF4T21teq57Qv9Cvuc32oPAPS+e6zXh4BbiYMXuHP5WS/a0+Wr2OW9dimfN8zKBe7nYewLAiPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187278; c=relaxed/simple;
	bh=uAdsvnskhFi5gZlvqaMQ5+wRZNBAxddxwD4ZnnMrPOQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2PoNeyo/s2XiaAftOD01ABlfa+g6DvjYwVN8ciSbsciL+939ZKAjVn+2dAcrpVElFanAeq/IVED8yWOkgXJQvaY8YxsIxsghqYuO9h8EEZUj4U6kgJx9Horihpb+8UmGtJ7I+1U9Y2bvVwbOU/YTvarPvS68xWUn54Ijpe1F0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QM0xBxMx; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QM0xBxMx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eplIm3WI/ZEgbALzC1aSQaRHs2zmISDbSv+F6P8bTUKWdPlqa15dhI2Ji97VeDTPPA9x+QFVpmz3/B6bhgbrGVlwNjKgcRuDY5YtiChGqEnZVD1fqfH8BIkT+ahYz7/N5M33wkq2kL8UcYiLIZUrkH2sRDP0htIBylEh8a++Kds7Omrhpu4jNV+zOJjqWXOm2lub4FB7krbGY/AwPDEIrGXze3wPS9qXEZJ7qtwDODdvIpEj8nagqE+Xkh8pbaUzGVNSKgL+eGDHoBerY2Qc+GR24MRZAdFstlkllbBMbZ8w+/os/sRsW3qPf6bbZmFfpf6hUwZXsKFLW7Py70JeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rweXS8tAdeg9/8cjaPZ7Z7iyDMuhavh+zDXCMvDZJW8=;
 b=sgSYk5B4HzlFhxOah2xxNLeENPGGHiTjGgsTrMc1/U2/g8kWsHS6CwQl8SvFr8fRcduZIMwUnPIMIEWiuJlrQFxcPx3+Zep3zp1wFQMaTEJx8uTBN7F2iDTbm+UymjDZwU2WGGVM6nF5pGwYZbVJS47HwfAfXvSPhpnTC0FMIPkO+9fgSObeL34PKCXiPyqIKvog96m0+YfB4rw4kMkOFtLypixiLyMxFK8lFQjJU0e6b3WgWAGp8jvb3j7xEA8GHx+Rn8MeNBRbUUPxX06boy+28aRZiXr3XNGov2PcDwIPBm3EWczaxt3Qz0PyHcIy5gvXMYGLiU8dj1oQp4WUvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rweXS8tAdeg9/8cjaPZ7Z7iyDMuhavh+zDXCMvDZJW8=;
 b=QM0xBxMx7IA9hcly+9Uw5HBA5O3q1Ndusqe/Rycpy9r4xysFaRt5L7zXPmNmeHFE4aqr/ckDINbbqwk5iLw1mrbRqLzd6V6zu5vnczM1ilLsuX0uruVKTr/4sO2Hts4ft+hNZhp5LZkGCFG0nYXB+BUq2J5ORyF65zNz0/wt92g=
Received: from BN9PR03CA0208.namprd03.prod.outlook.com (2603:10b6:408:f9::33)
 by IA1PR12MB6481.namprd12.prod.outlook.com (2603:10b6:208:3aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 21:21:05 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::91) by BN9PR03CA0208.outlook.office365.com
 (2603:10b6:408:f9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 21:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 21:21:05 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 16:21:01 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v8 6/7] RAS/AMD/ATL: Add DRAM address translation via PRM
Date: Mon, 27 Jul 2026 17:20:44 -0400
Message-ID: <20260727212045.1810480-7-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|IA1PR12MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c8eaa86-59d8-4ae0-4b9a-08deec24f7a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|3023799007|56012099006|5023799004|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lFov9r/gubVhhKz5RzoccL9j4REihAdC+aa+QCv2CaJvlisp7Xarmq7dlErqAthaGbWb+MS1su+S2rG0Bq9nhpscEOCEdttdFVd8cml6Mjoce3RtfOBU7s7XMs9m1saZST3h6xDUlNmZgV9wtK2W6RYyM2DaXlcR1+PBsMM/sCFZ01Eo4+nEugKCCOYRscKIPaef9ESfzZKb8CHGZLl/JIe7Ofs9j7U+YCFf3Wrvsu9yUhjweb4t3AWXqkRu4+vfM92vGpt4+efPgyeMNC72GfVYvliFGkYuL9xzeZHcFAcDahEtfHKQAsi4/wDARvxY9o2cxjdfCeBS6TvKxYzAZCR7CtN7yj6DsSJbuIJr5aay3fpjU7ax+CT9Wt2XGeWvsxgrbaxPjjL3urRFStOBZkX0VJuIO1Q06L9bG8yZvs/IkNp7aKBqfwxjim6AUfUoGbQf8djFG/FErEXUbJAkwNZa3OYgOriql9kSqFBen3oGT6rJahV0sVki9h6m6Tt8gDlliLwdB9Z/E+2d4Udut2x2N1Y1lD1GvnXAREcI3vYK1aTiX55kV//X2oB8TVsof1LEj/9iELM7dwJ3r28hf57xKmHllYOXDnlLsdmCbsDiARmpf8EWblEHMBOVFK2+CITHZikBPdBAhIn2kMtYXQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(3023799007)(56012099006)(5023799004)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a0tzt0eNSjXUjBVpY2M+nT4I9wKdwREfzUv2gcHjmiZSnPdtSFZZiNWuj7+xvHxJ55OqPVMHI8zxMnOD8X0lQJkZ1Jukqswn7pksYCMb0f4xMl332LgsRDqVivRxcpwYAyJsE47y4k2XTKG5PihjR+Wf4YbMrY4UW/yLWVsR/nqGf5bxfRLo3TzDLt5ZunA9PopjsG3vgvoC5GiIZ02GYH+FqNgAzHhhfivCVlSSKjHRgBt6QgVYgJ1fcy2PcJS+I8zcZsSCZLiTkLynfMHwC5OJcoZ8f34EhFDCO/t4og5iYgmtMxU5A4lQXO3HYc1qx8k6S6Dwj4iEgd+GDpPzpP3PgrobFf5eRHodydCztW4tOMjm+VCuqRmoTUYrLpy4dp44A2pdsGncE2FUhqfVW5alktharkzrFMa3tK4sWSivgWODxSSvsZVK2o5lk6Sf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 21:21:05.0368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8eaa86-59d8-4ae0-4b9a-08deec24f7a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6481

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
 include/linux/ras.h            | 12 ++++++++++++
 4 files changed, 21 insertions(+)

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
index 18f3a76a66e3..14e1eb5b4a3a 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -444,4 +444,8 @@ void amd_atl_umc_translate_addr(struct atl_err *err)
 			}
 		}
 	}
+
+	if ((err->requested & ATL_OP_DA) &&
+	    !prm_umc_norm_to_addr(norm_to_dram_guid, &err->umc_addr, &err->da))
+		err->valid |= ATL_OP_DA;
 }
diff --git a/include/linux/ras.h b/include/linux/ras.h
index abb86f954a3a..712cc222b71b 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -37,8 +37,19 @@ static inline void
 log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev) { return; }
 #endif
 
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
@@ -57,6 +68,7 @@ struct atl_err {
 
 	/* Outputs */
 	u64 spa;			/* Valid if (@valid & ATL_OP_SPA) */
+	struct atl_dram_addr da;	/* Valid if (@valid & ATL_OP_DA) */
 };
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
-- 
2.53.0

