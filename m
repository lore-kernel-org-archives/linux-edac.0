Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B584E38B140;
	Thu, 30 Jul 2026 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440945; cv=fail; b=tv+wUyTW+gLNhSDMjfetuIednqi1mWnKMNE4qH8CRcbdCg1Vx2Yh/4ZgNcXnjYdejmZjAU04p0VfCUDsQySPeIYhy34W6M9HHHcGln+CnfkA3yrSGKUTVn9om7Ko0PL/UD7FqYHlqLPLWwkjfNeH4PMHI4dUbQRPZdBdB+9/yso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440945; c=relaxed/simple;
	bh=O4IzXBAFL2XzTzJ0hDTDX9iZYIDsTnhCu71DSf1uotg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NwyvvNo77avrJ+UN4Z3Mq70XzKYPgYCIG1Nqqk8YF7HMUluVdhJRm2dg3E5hnzd2ecpbYgKosycUeHkc5MEpi5WUbJ3vzZz8QMR3M+QnM5gZpT8fZrYmEVmuDO8EOMSfkty+eQe5RYyetGZ6HzGyVy68g5lK+pUr1Z2R67oydDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vTzVqnof; arc=fail smtp.client-ip=52.101.52.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vTzVqnof"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMZAtEEDCIa+N/p6iPalZftj+u+9+49TGX43IVC01dUL1MG/2Xh5A7NYZFtk55k1wUmFx5Nvds9jsCR0DE8oVqqCQ5L5w6MhK5tkpfUGI5CXLROHHQFm5Nr4nHzGARSyLErCGIp0fz3CdSG4NiO/Q6rNGQuj68tbNmxPdarg1Ej48zME3phJRScEE3Mcue1LDOnwBB5kaDqm2gGF74XbxbtuYv80mxEgnut8vVerBPDqVvwVQkGf5u7vy7cU4jDUrjN4IuHpoEy3mW6AQLX9nvJWOb81L38xcbnZNPqZhYejtjJr/xh2wS47VCmlePNm+vXQ4VMmqqFnVgxFcAx2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEPFU69oHCGYrLMpsv6xcOVXftY/MGZ1VooExl7FR5I=;
 b=JOAbo6grjspGGZVOHhSK1GEklEI8hVlwV907s/VWMn17/LwPd6LyjRdDaDMg7nkQWFWzsCWl8gzjsFaMPwWgeGVbdk09jxLHTLJMgNt7cITUjoxwGeB8dxKjD1I1cfs+l6aldu9XppYDygwoO4DxeD6jDpV2RWtexA6P6IvJpt/PlrBzCtsWXwHUsGSggj5bXaYLUfucu26jEfCOTBdw9TV/UGjVyPli77+3UADNrdirFd7+QGVJn+d9ITczj6YjMZJHY7yej5ddUISqyOe/swdWuJb5E+d8hiTpnawFVpsneHxdv+lW0a3/8P2YO/J/+u5JpRywh+Sq6zVcOUK4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEPFU69oHCGYrLMpsv6xcOVXftY/MGZ1VooExl7FR5I=;
 b=vTzVqnofAPbz6u5yNWzCxwVw8h3wiFqSAIOJ81Ip9aPbzHTOIoDfQKmmZ/d/BtLIKL3Ev3dgpq2pRlp80HtKpZkVwNKwFzLfGe+16sEkI9Eh7R759OfNMbHHXmmw5ooMN4J/TH56DACSqZehkBRrAOMVeuL+JlPEco0h09Yk+r0=
Received: from DS7PR03CA0232.namprd03.prod.outlook.com (2603:10b6:5:3ba::27)
 by IA0PR12MB8746.namprd12.prod.outlook.com (2603:10b6:208:490::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 19:48:48 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:3ba:cafe::7b) by DS7PR03CA0232.outlook.office365.com
 (2603:10b6:5:3ba::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Thu,
 30 Jul 2026 19:48:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 19:48:48 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 30 Jul
 2026 14:48:47 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v9 2/7] RAS/AMD/ATL: Refactor PRM address translation into a common helper
Date: Thu, 30 Jul 2026 15:48:29 -0400
Message-ID: <20260730194834.3203601-3-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|IA0PR12MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: e922a0d2-0760-49da-a527-08deee7392d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|20046099003|18002099003|22082099003|3023799007|10067099003|11063799006|56012099006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	thp2rLqkly4Ai0kML5petDZdbZe6gilU3rjqzID8oFjH0XPQr9Q/d3NdBhvh6TIvcryVjJLSiXhgX+1lLV6gsTtL77NXusL0PAgNWJfY/ywzdKeIeA3Hn0KHN/tR9eOycbufOzIY3EYdSSYUxUn/hLHM0mIrxyIsOGdb8nupure8+jhM6t+XYXXNa6CW8+0SKLXEOOXecsMeLh7rnA0b8am/uy/4fKc4pAHzMtwbI+2vFqxPDb0J35CRPBQLANXo6I0cvQZIHPm9W91lKQ0nn7MbIdJKBuZ50t9uNN/Rj0FGl66QRJnM7TTXjs8TUA+yHPKp0/ET5eHOT7A/kUtAS58UNICgZA6SklMYHYXMIRvJmroGorm5FsOcSnYuZJ2ZkTjGyEAje9V5fNOvsbk4heYwZXecmerowBTBGz1dhnZHBeTWxpBzWYMZG785LTCL2D9EU6Hjz5N+WIbwi5zFwhjEhSi/JtK+oJiHjLF/vvS2oWlJ6ldhJ6JENFSz4wKc38tiTpZSqhvxB7KXmo3MIGXZ5vRb4N0wgUw2ycWnMkWHEtIyXWnAnH3+g5YVJAWHqkCpJbQZit0Hty+ne84MFgli3CFYXTTrPx5ftNvSbGjEMrlE/BdEwGV84LGOVX5gN3yQ/82O5BWVtjKXMdF0uAiUOkI/KsRlAm7X5GtQbY0DCWBV9iJzmmanNn9QViHpjyPe1kKHmoNbaNaTxR/3+w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(20046099003)(18002099003)(22082099003)(3023799007)(10067099003)(11063799006)(56012099006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a/F6dAxWazd7sck/4pUBHYxqsw8436MOCEukIEjG/SxHr1F7ZZ7AckJzAdr8NL0n9HtmANoN3ApK9kKb7cz98yYVPZaMKIeWUe79QZyUg2b0FXlsZYoOLfxp7RMMisdntEyg5Oiy2yEJrW2Z6jRh3CKT7wKTLYV/PmcNt9f9ilHTlOKyFOV7DGsPRDmwaqbOnj5YSmBlCT/8v61IWOWl5xqgHY5UX/APZIFVxofPp4LDga06lnKij2m5bLQeNWKhner412eCocHhuSIHV7IxFa3toewRvfWmkBEwZUxn3U0gfw6yeZeIxHJwQb1/ioCnO/RpvjHyI3Rs1frDwkDasGykB+G8I7Bhvueco+JMr//NvA+02d1zauCSGjECWpyJf57rMPgcjfLp9ZeLqDZ+fIv3x7o9I/5HbV7+9QThlpPoiP5x6DA0cpa/0WmAqXYB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 19:48:48.4384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e922a0d2-0760-49da-a527-08deee7392d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8746

Every PRM address translation follows the same pattern. Each fills a
parameter buffer, invokes the handler, and checks the result. Only the
handler GUID and the output buffer differ.

Factor the common sequence into prm_umc_norm_to_addr(). It takes the GUID
and output buffer as parameters. Convert prm_umc_norm_to_sys_addr() into a
thin wrapper around it.

Rename the parameter buffer struct to param_buf. It is no longer specific
to the system physical address translation.

Include the error code in the log messages. This makes a failure easier to
diagnose.

This is in preparation for adding more PRM address translation handlers.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/internal.h |  2 ++
 drivers/ras/amd/atl/prm.c      | 35 +++++++++++++++++++++-------------
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 4fc4bc3c3500..9f4d2a5b6c14 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -287,6 +287,8 @@ u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
 
+int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 umc_bank_inst_id,
+			 unsigned long addr, void *out_buf);
 unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id, unsigned long addr);
 
 /*
diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
index eba9d104d09e..3d5a6f5ae0a9 100644
--- a/drivers/ras/amd/atl/prm.c
+++ b/drivers/ras/amd/atl/prm.c
@@ -18,36 +18,45 @@
 
 #include <linux/prmt.h>
 
-/*
- * PRM parameter buffer - normalized to system physical address, as described
- * in the "PRM Parameter Buffer" section of the AMD ACPI Porting Guide.
- */
-struct norm_to_sys_param_buf {
+/* See "PRM Parameter Buffer" in the AMD ACPI Porting Guide. */
+struct param_buf {
 	u64 norm_addr;
 	u8 socket;
 	u64 bank_id;
 	void *out_buf;
 } __packed;
 
-unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
+int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 bank_id,
+			 unsigned long addr, void *out_buf)
 {
-	struct norm_to_sys_param_buf p_buf;
-	unsigned long ret_addr;
+	struct param_buf p_buf;
 	int ret;
 
 	p_buf.norm_addr = addr;
 	p_buf.socket    = socket_id;
 	p_buf.bank_id   = bank_id;
-	p_buf.out_buf   = &ret_addr;
+	p_buf.out_buf   = out_buf;
 
-	ret = acpi_call_prm_handler(norm_to_sys_guid, &p_buf);
+	ret = acpi_call_prm_handler(guid, &p_buf);
 	if (!ret)
-		return ret_addr;
+		return 0;
 
 	if (ret == -ENODEV || ret == -EOPNOTSUPP)
-		pr_debug("PRM module/handler not available\n");
+		pr_debug("PRM module/handler not available: %d\n", ret);
 	else
-		pr_notice_once("PRM address translation failed\n");
+		pr_notice_once("PRM address translation failed: %d\n", ret);
 
 	return ret;
 }
+
+unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
+{
+	unsigned long sys_addr;
+	int ret;
+
+	ret = prm_umc_norm_to_addr(norm_to_sys_guid, socket_id, bank_id, addr, &sys_addr);
+	if (ret)
+		return ret;
+
+	return sys_addr;
+}
-- 
2.53.0

