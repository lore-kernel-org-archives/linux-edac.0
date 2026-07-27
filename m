Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9604C42BC30;
	Mon, 27 Jul 2026 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187279; cv=fail; b=lX6qSd3FZT5KGxYQiuud/mVLPEQiSom9ks7QPCcgr7aY1csIqj2OLKqJt36eqe6mNazgO6h9rN8XGs7RTIJM1t+8Kj0VveVNLx+iLY9GaFjQxYwHcgLn8oXgw5aGRf2Ttp4jOwDzUlG0nc58GtJ+OcOchFX5a46REW2se6szBog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187279; c=relaxed/simple;
	bh=Or1mEEEST+LaW0pcSqKdujpBkvvVaLWUhQG7h/D3Rik=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t4Ty3v1qNDW3jIf+Zg5fzOzpClOmrGOiG39SbJUJmASKuLILM9kvzKFEKfxRrMlPlU8JuHnGptQ1s5oC0gTuQwr5+8j3gy8nAbmYQINscwLPRC6RQTvbae68KctboRR9RHPYzrW8XK6JtlossxFMhC/0/Mcw3tlZQ2YIctaW9fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=11y6bTs1; arc=fail smtp.client-ip=52.101.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="11y6bTs1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHAi7Uy3SOyE/Ij2hWrIL/r8AeC6GjwxBzS3O6dwlHejfNCJr/FPLi3pCbzg4wHn9epZax4CKoYeuIZhNvPa+ZAKkg1vG7fIoqYz02QOMPuqGweSlVdY39CEvZxaI87gAldmOaCvpfoGkV+b61pu59ERwA5TKtamdk4khGzTes8t86+2KKvnqenPzOL1CYUrC90vUsRQGsQbi+TnqnxDr6PlU5L5GL+hqi3o/vfz9Gg6Z+eG/yvzLRYvgrp7jL5/TSvNf7bLFpsXGczvvGSoyMZgBllpsDXP8zA36f05alTOF2y1N5hcmR9iLvqhAzk1cceoiLQh77PK9QaoTNHK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFFF0Emois7fQuJFUWT7Zgl5CNnMNfpdpw4LW+A1R0I=;
 b=JqqQAOnBisJt4cT8rWqrK6DBYl07FsEfLEadHli7S450EkPl5tyW9PTcorz9ETdT6FA07J3vlK9QBxCt0zXktGWrzv/KGBUk1KCOaLAQxboTn/I+HxgDEfJtEymrajQ/VH1+ukTvnSnqV6tLVcpAOMSDOs+dLCnV+ASVqThSR5oECfhDw/S2MmpjBL9Fwiu6NsKIvATOp28MY74VgwVfC4YsO2gurD/Fi04NNa7Sm+Z1m3g7K/0dZzc7xpdGtw/1nuBCW5/W/Xl3d5qeLvB4gxcOLLkF56J7ivtkikxxo49SIuWdULeh3W3CvXFBmbyIEJMlC8FCj+iR8JCyyMxpqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFFF0Emois7fQuJFUWT7Zgl5CNnMNfpdpw4LW+A1R0I=;
 b=11y6bTs13odngbUrt9Vf0eEqUc+gzn3UqpK5wwLI7brOu/X96WlGdRupw14AuXIClobmvu7ZlIlm8a5CX3qPH6t81T9niwUaWVtHZgjqwwKEMZpA1lfMoSigpHclhGXkulWdlQ+4Eqly5847hvRJ6+BIiTio+L70pio1RGL6/Z8=
Received: from BN9PR03CA0190.namprd03.prod.outlook.com (2603:10b6:408:f9::15)
 by LV9PR12MB9760.namprd12.prod.outlook.com (2603:10b6:408:2f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 21:21:12 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::2e) by BN9PR03CA0190.outlook.office365.com
 (2603:10b6:408:f9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 21:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 21:21:12 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 16:21:02 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v8 7/7] EDAC/amd64: Include DRAM address in output
Date: Mon, 27 Jul 2026 17:20:45 -0400
Message-ID: <20260727212045.1810480-8-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|LV9PR12MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: 240fe6a8-706f-4ea8-504c-08deec24fbff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|56012099006|11063799006|10067099003|20046099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	I9YH5MvZqRxNKBWw/c7wXUilpTw7s+Vxmj4UKNvWXAIw04iI0sn6TEmMoJKoyUgK+BUfqGWoN06VwVSNbZD1iDs2YUXbKtrjSEISb93x8bfJIwqwKo4FktbokzlbBQjlXW19APXRZaeKkpbW1kw586nZWQwgqSfEYuwqvBuTirhxWRMGMoenecaCRd7kLQBK1GY4zl5XzeeghBeeEtAARcxjkD3+abNV0bT4OGmE8BGR7MLPS5bqShpuBFmPP7PoIJKELlKj5n96Y7QhLdzCReWTKEsBDo7nfS4s5cXqWzQ7VaqrcJBT+/sZ3a8NxyNnYQLPhkQOkgEOiIZ0JcT8GhbtEPe9VTg/pdlxFUPNsxeDsn2S0SVyuBVB07aZwBJzza4mZepymY8ZZk1rDlBfW9fZcbS+iBw4LQok3EUntMh89zQgncGlXWzbQntiZKQuUiTL5rQHDUUh+xxLFRIwIziChR+blPOzItUa0GU6pgZCTRUwXCvZe6IX8tvYZoQiCbTvFizOJSswAXa0JppVTScS2bGOHhMSkdheSeRgqTuVB4ySyyddeGc7jqa224tuhF2ypeb1iAieq6GCYNmOh78tjOFm1HmYZTmKOYcLSv6PvqzdA2ZIjSLjJ6qF3/Meq4uxkNF604sJfoHiMyK1UdqmIP7o2mp5nSntgJgQZjs3RDAy0R5hjV5cP0a2xk8vmsjWlyZkyImT+2EoOaR97w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(10067099003)(20046099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bBeuUgnfvbCjmrShP1cQwNz7rwrkWisFCYbgBbyWvT4dtclq++tm0Z4wbJzJtiYVAMBVNcKBDctiIe3QjBnMjDUdf6UsRrdSoup8Bmta+01SIMl3ELD8IGeBa9XX7xvrEcJNpcg423eiKXafjsa+JUi+5bH8iZ8ejYfpJcL1ZlDMiRhaXTsDuG472IRvAViE1bUFvHDrX5AIC9b3eg2zzZ+1IPCsNYSFG1s6Vpq0s8wQZpGqA/6h+AmZDLX2IbO6OoUtq5XATAqGqMyJ2Y8YQxp3eX4Lu5qt8jy/fcwRq8gAXhOZFXCEcrDDLt1vaXNyNL0qV942rnZUwXW12Y0qL0KGhWCg3pJBDO5YvDOD/OqSNkuEc9Se3dE7BXoz6gnLeVHo4FxKdrZBlJppe7puf4e36+M9BhuKnXZNv0iywd5ZCOfybFp9qiJ1vqAV86DR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 21:21:12.3578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 240fe6a8-706f-4ea8-504c-08deec24fbff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9760

From: Avadhut Naik <avadhut.naik@amd.com>

The DRAM address of an error is used by tooling to find failure patterns,
e.g. for off-system analysis or to offline a page affected by a bad row.
Other EDAC modules (GHES and SKX) already provide it, but AMD64 could not
since system-specific translation is needed.

Request the DRAM address in addition to the System Physical Address when
translating a UMC error. The SPA is required to log the error. The DRAM
address is best-effort and only added when its translation succeeds.

Add the DRAM address to the EDAC "other_detail" field, along with the
socket and IPID that tooling needs to translate it back into an SPA.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
Co-developed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index f428d815bff1..7d7d116dbb75 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2704,11 +2704,15 @@ static int get_channel_from_ecc_syndrome(struct mem_ctl_info *mci, u16 syndrome)
 	return map_err_sym_to_channel(err_sym, pvt->ecc_sym_sz);
 }
 
+#define MSG_SIZE 256
 static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
 			    u8 ecc_type)
 {
 	enum hw_event_mc_err_type err_type;
 	const char *string;
+	char s[MSG_SIZE];
+
+	s[0] = '\0';
 
 	if (ecc_type == 2)
 		err_type = HW_EVENT_ERR_CORRECTED;
@@ -2745,10 +2749,27 @@ static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
 		break;
 	}
 
+	if (err->a_err.valid & ATL_OP_DA) {
+		struct atl_dram_addr *da = &err->a_err.da;
+		char *p = s, *end = p + sizeof(s);
+
+		/* Include a version prefix in case the format needs to change later. */
+		p += scnprintf(p, end - p, "[AMDv1]");
+		p += scnprintf(p, end - p, " SocketId:0x%x",   err->a_err.socket_id);
+		p += scnprintf(p, end - p, " IPID:0x%llx",     err->a_err.ipid);
+		p += scnprintf(p, end - p, " ChipSelect:0x%x", da->chip_select);
+		p += scnprintf(p, end - p, " Row:0x%x",        da->row_addr);
+		p += scnprintf(p, end - p, " Column:0x%x",     da->col_addr);
+		p += scnprintf(p, end - p, " Bank:0x%x",       da->bank_addr);
+		p += scnprintf(p, end - p, " BankGroup:0x%x",  da->bank_group);
+		p += scnprintf(p, end - p, " RankMul:0x%x",    da->rank_mul);
+		p += scnprintf(p, end - p, " SubChannel:0x%x", da->sub_ch);
+	}
+
 	edac_mc_handle_error(err_type, mci, 1,
 			     err->page, err->offset, err->syndrome,
 			     err->csrow, err->channel, -1,
-			     string, "");
+			     string, s);
 }
 
 static inline void decode_bus_error(int node_id, struct mce *m)
@@ -2844,7 +2865,7 @@ static void decode_umc_error(int node_id, struct mce *m)
 	err.a_err.addr      = m->addr;
 	err.a_err.ipid      = m->ipid;
 	err.a_err.cpu       = m->extcpu;
-	err.a_err.requested = ATL_OP_SPA;
+	err.a_err.requested = ATL_OP_SPA | ATL_OP_DA;
 
 	amd_translate_umc_mca_addr(&err.a_err);
 	if (!(err.a_err.valid & ATL_OP_SPA)) {
-- 
2.53.0

