Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010062.outbound.protection.outlook.com [52.101.193.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715E637CD5C;
	Thu, 30 Jul 2026 19:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440952; cv=fail; b=M/2N0wfNO89Ndi+o4saHOz96KlnGVUASSVzFYlfv4inQ1T7RoaWH1QhicBcjQQvrYnd4H8VKQbYAj3+BbsOsRqFvpV25osNsUeFx4E6/GuDldRsESUcuX0RBc+2HzJ1cBINEq13ChXB9Iib+xJk865uhZmlImCL6ZLvZLLE9s4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440952; c=relaxed/simple;
	bh=2H/go3sVg9IbJy0QR2YDSNzrvYm9SyYWmq7zHGwv0jc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jyav3awYg+8BCbzyUqoZ9lUrx/KG8fFFmC5hs4Hv3N3sTJ4Hmgmhupl6v9b2AlRlguhvI8lGIJk6KUIgBPCR+3PPD00vPJoxTcK3mdaPGUcbuxeA+Mflu19HE6WWYMyFzmz+mkSe4ctBOZgurj10X9cDF5T5LhOzKq4OW8rAJNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MdiIrJBd; arc=fail smtp.client-ip=52.101.193.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MdiIrJBd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVUHToGrQMISKPkOKpGYr6JDcWwhWR8w1qarafghM8tbdJor8Y+X3Tw7NJQWd9eXEKW+B8PNamy126uKju5kF9qeJSXPq5YJwSTUTsbhDGmvJVJTL8NYg5C7jy0InDjddFKLWyUMqMlQ/GcgEIvlF6HL2v3OljIn6a+fS0pMj4FWsTNqHq0A1+xQB1pYxw32awD2X8um5klMjeQB3ce2F1w3ZKOAg7jzLVmEA3uMahT5FHVsTu2QxIPOV2yN0e38jH+U9uIhHFEkS5Hzqdrqp/lrgCkYTngESwwayx+X1Q7CZznCeJh32FhSyWJn/taO3uVv084AL5Oaqe4aO5DZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69DdBmeYTQ0j1bF+Z71251X/vgrXnzNeTQx4sGc8RoE=;
 b=fgxC9B3r5p6KW6FCMMdR8M+9J3M4IZcyjUY/5BWUi1aTuLZHNYlyjL4Wet61/8XAtjXTqAb4FErcJmKmX+IwxoaeNUPLCtKP3yAq1ywfqTLMgVt92sFMhQBvDhRbnYJff2bmW+xxf/+BZzGh2bS2yfKgt72C8VVZsl4opwNtRXTqbTrDiC5pRG0bsRa/oUM/qCp8yIhN+qJGOWeItFewOLuh9OZg8k6CTxo3bpvAbGBIeX9+6jk/u3rIlJoPkpFIc+yBMlbbjf2M3CXFmD59HScIxvVyQHu4XYivHLh8meotVdZslMZ8xm64pv1XjPH24TC9YIzRmIqHHA80/LH51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69DdBmeYTQ0j1bF+Z71251X/vgrXnzNeTQx4sGc8RoE=;
 b=MdiIrJBdMYthZbmsG+bSUEDE9jOFd7pMqsfGuH5eZ3PnO9g2V9Dqmm7YHqIP3ZPRT3eSjTvzZ3LtRz21GFI8m9uNz7qVw8kKxDKvgugZ9A2Pj4Kvp7X55N/K3PRuALE5Okj/w0+FuaScDiGp0TQXBgR+Y1niDgw3ocga6PMG4BQ=
Received: from DS1PR03CA0010.namprd03.prod.outlook.com (2603:10b6:8:450::8) by
 IA1PR12MB9529.namprd12.prod.outlook.com (2603:10b6:208:592::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 19:48:53 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:450:cafe::6b) by DS1PR03CA0010.outlook.office365.com
 (2603:10b6:8:450::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Thu,
 30 Jul 2026 19:48:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 19:48:53 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 30 Jul
 2026 14:48:51 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v9 7/7] EDAC/amd64: Include DRAM address in output
Date: Thu, 30 Jul 2026 15:48:34 -0400
Message-ID: <20260730194834.3203601-8-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|IA1PR12MB9529:EE_
X-MS-Office365-Filtering-Correlation-Id: 3388388a-e4bd-42cb-a12d-08deee7395d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|20046099003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uYr6HGiOa9zkgZte1iJ8U76UVdCuaMzfae9YEuzAAOhJya4nE3rF/LWQBKvsCFLLDIv6iUF77zX9/rEnISgaOoob7/ueiJuAZDfFyZvtzh2EN7ulvF2/a8zYEYh6nvmg5faUqECM8esJhW1zLqQyJ+mm6LQMUWuwcaXdZHbjdGm5XyYguAWxzgGYjga7zJlg2pzmJSV7a2Hxyc12wwA6T3XXJuEzwhWVuyOXe5Sodk8TzfZZtt272TZHhz8wVedC+GH3x9Qunq/2mwqHgULsEBqdQcJLiaL//V8p7Dxtlj/iJi/A2PjQVkshRMzmfYPY+YfoYBo0LqzcsSzCbdNCnRxMXbIqESWnWLjvoz+rRIVjnD2khsU9NBOwEXHYTJrhm5ypSTRrl1CYsyzMuRa78mNUU/U0cNEpvkcUVUxrQTr++UhPLa1F+H3Y4gKPTCM11GiZuLkZzgXFZQkSvrsXvDX+TCVGiaGP17jn0Gv9o+THKawgpZXBF72oc5Pggg/YDw3DwxbD6rSbOzHq+C5yJNDsgY43WvLGCD27xmt2er/wXSY0aylxUIfKEGjwBiR0i8VVT6+77o090pMAj5AP7ipIANbIuc0HZ2XGGqSJO1wsL876b6N900pKKBshJYoMotvL8ZdwRwqIkhOSPFrHj13mfM+LyDW/+g2I3ovsFOybI2+UwjJS1qm16aKL+559KYMA7aXpFo/RYuApLB8dHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(20046099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0Ulc8e3p93bD8KpcSu8mb/AYi+Jhkgy75g33g/APNgDS4r7PT0scA/5r+9iRwqpDXTVrOWoiuwI4EzdKHTmrmoPC403J55om5ixUlism/d1onGGI9VosFSgYfn/pjtfhklWX3RsW6cXJUp9MQ8ZN3cAqKfvQJmK+PHoNtHn0Zi9Z8ljfvTpUH63C0pZRkPysQCKsmqtEuzcs2RG1wHZf8hIDidj2fSYp+yUuWuBUkS+ZxSjYkRNO+bSR57YQr8pRgyPJIfKf0kSbo5mwYixc/hn1EltVR5fXX++SObRuYM3gjGITkbTSpkJ4VHz3i5Dg3jfx+1S9K8VaQoZB0am8G+zMrvb08TSeHRQ3Y7z5kKeUo83UMAUEc5354gkWv+44XN7xHVkWSpHTmglPanQ3GsgeqFxW5SHGuS7Cm3V50+TKqjuPJZ6k07EIyswdPxD2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 19:48:53.5280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3388388a-e4bd-42cb-a12d-08deee7395d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9529

From: Avadhut Naik <avadhut.naik@amd.com>

The DRAM address of an error is used by tooling to find failure patterns,
e.g. for off-system analysis or to offline a page affected by a bad row.
Other EDAC modules (GHES and SKX) already provide it. AMD64 could not,
because the translation is system-specific.

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

