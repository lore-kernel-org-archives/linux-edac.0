Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE372396B69;
	Mon, 16 Mar 2026 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665635; cv=fail; b=WTUOMBSnq95T4yIFwi3PlsY3HmiLVB3MR2ELDh244Uc03IMukNmrD14e22+2mGBsxFK5lHe2CuqPBJXd5gXBEQDOl+8VxDkvdITgECTQAl2Ywz9ak1gCF+eQy0yU5yYdm/0gRDmlEPJAM9havCH1S5SpkQjIYIbAXcwDCgb2WYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665635; c=relaxed/simple;
	bh=ATo+ZH67Pi5pCw9i3RSgpSvKRlJJssYTG3r8vdMWMJ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iP925Tye2EcneoRVo6ymPI7oXyMIfvD4FgV7ACisEL5uyanKVG2fzhIDl6URlRdG0hV01OIqBSOGU1ZWFGiwSEUS00al1RXjCXeWBdMSfwbISIhd1QPByktNe/L2olOQhCGZx70Bu43vvuoR9CXhuD1y7F8oAUHTQPGB6VUwXbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ppfMRS6C; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ppfMRS6C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwzNKj+v0G2mNaNvVsIfposOk9nFYstzobrNGjNmsLKYA7g4HJLW/AyNEg9NbZJfTc+0vlHUFaJUuX5oS8XOrILXnIytcq8xlerQY241PDE4N+9mHo85x78TmFdkvMK1YMdqjCN3n8GpS5Petz1Nm0MrA1w0nyrVQ17T8RoyDK6WiiThAQGf2f9Q1Tfy0dyXk0YjWzMtHNNvwz39TIJxNDT9qhqp3nLoJibdBGfNvbCPxfsS6fjZRCIlnEe35wKuaJ2DXKME5TAGFIS756/rjuXjYFEKWSk+lG1ekOwZepmnp1aVlhPS2XL10en8wpvRn45AzWt47SaMC7y2I0vNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbuUnDQYQVTBrie3At0KHFBKwa3iAf0bKVbzTrfs3cI=;
 b=AeFFRac3ax/rjDm2J0aV/Fp1Q5S6ZXsIqOlWhIP8zuKK58p3cky893AyVoHijSPK4vl0i+xsPjPUGrm0O7NhuKymeyMxhkf7c8QzZ1BrzrMfGFVq9K1TRRC0KV1+DrYhIYvHe+PIhiZKA94FKLuSYUQqKDixu1fzhp2B3e4pBkJKXaLW0+gBlpKNXc6cXuhPZUyoBpQkdsLSvnBjF/7aFf+7qUDiLfu9CKPp7ixrjrTGeFgW5LskIrNL6xE+OEoF9kzrHvfZ/3XZo1PzBfvbwL3u7MV0F9XRiJMKn5GKexzQyE2Py34j/AUjqRzB8ZJ9Kuj9GdoHl7pqcC6slpgKEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbuUnDQYQVTBrie3At0KHFBKwa3iAf0bKVbzTrfs3cI=;
 b=ppfMRS6C3K+0tsOMy2xjI6EvGABmt2YiWGicDzeaxKfKqN8OBfaER21nqV2phJAaAkY9O2ocJum0LVf6rsTgaYAUfdBvN2xULwsxzJubmlD063R7TTc9d4HlZzGThH4ySc71BjDWJr/nJ7L+nRFyVJPsUdCzXQbyZy8WsQSHXFA=
Received: from MN2PR18CA0002.namprd18.prod.outlook.com (2603:10b6:208:23c::7)
 by BN7PPF0D942FA9A.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Mon, 16 Mar
 2026 12:53:48 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:23c:cafe::a2) by MN2PR18CA0002.outlook.office365.com
 (2603:10b6:208:23c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 12:53:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Mon, 16 Mar 2026 12:53:48 +0000
Received: from yaz-khff2.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 07:53:45 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v4 2/2] EDAC/amd64: Include DRAM address in output
Date: Mon, 16 Mar 2026 08:53:24 -0400
Message-ID: <20260316125324.396889-3-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|BN7PPF0D942FA9A:EE_
X-MS-Office365-Filtering-Correlation-Id: efc42144-f5e0-48ba-9252-08de835b1120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|30052699003|376014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Eu/DsW8Yhi6LOD7fpkJK0UP9zB39gVC7Zml864XlL6/ja9nHEjDWUNZvkQFg2u7twSoWCt+cEZnoUYZ3vHim+9YpEDrhOuUJk8Fa18c2+tPCJO6gbkEq3Z2Op8Mhz6RDnwAH4jpD7KqKlFWsYaJC/6Pg3KagkSrFf7h5XVY9YP6cpcYHwyMVYKVdDKWBz77JC7p5MSsozAKRirsDOFih6pBSSTsItxIYYBbGpI71W1WTp6u1yx1OYmp0w7Poj+m5ImjuGqi4Sx70XzW+AD/lE5Z1euf7+OgBHr2Rrx19siVJIbk5QCAKJSGcQYORuuBq3+D3yPSJQwzRefesZgEF55m/xX4RgMfGzWlCct4I0Vf1tqjdDf3sNw8jlmHFy99C6V+6WYMSJRcXnOfSeXYbz7ybWCjo1TIlQcRNxXUF0luTWHQJWZb5AUcxFw3YelJwV7xmwF9UcpjSaJsQFT9jo9Y0LNDSwJJQQB/dSIRMxgc8X+dO9AzR1NPP6pfLYrtYcxpakmhyhqX26e3TxSIE7IUfruFDynY16CjMT8k/aVi5Aa7lxC4XYlMtUb0g1UuwVv0MKIC3Xv71d9nAZPGhwqFnaegujpVAZ6SZ8C+XQGBymwAvRfPoKEFuJaVsryLBFc7+1UYCzkyh36tojbTblats7sINRSxnqTBDRCF6e7EHBvgJx3kF2HXjyZXZVUwf01d6BT1TSzTIKxaN14kwnpXj3AGk9AsSaPIMZvRtOjGtOSpKkbx8t/48DPOg/B/ZTBNw70sJ3ghcg2C4ix+xwg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(30052699003)(376014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mDTS2V1fGuTMYrBalM6vf+EGVEIPYf3nIznMOPryG7EdJOvmq+yXB+hJ6DyMd0oJSku/CD9W6C7Yk0nU3JFuqQ6wt/rCwjHvgsHZmmm66/Ls6WjUDynP3k1wY5nsOF6I3d9T5Bo3HqYF6aHP8T6YodpmNijl2HzqHJ447KuuqRV+xHRAYkrbvSn1CdbnUx63aZFGfHF7eYENUJdDvkKOxYa41xU1WhJtVScSAJUVk5FP/NU9qC1fe21BY0KtC/9Hd4deZZ98+j7YTOlJDyZ/H0ap14E4IioARH+NGyWfmyb3BU4gubDjXOaYiQQsEa0f9Q2DkulAte2a8t19QCe53loN6nYbssrSqIlboqmjrtviTl1WqqeIjAXrjXt6ojfMX4LvmFpOQvnWiG7Vln9NgGZWdZ+JoeRooarJfhwPdeM2yxQLSSOARgOFaiYN5hNa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 12:53:48.5367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efc42144-f5e0-48ba-9252-08de835b1120
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0D942FA9A

From: Avadhut Naik <avadhut.naik@amd.com>

The DRAM address of an error is used by tooling to find failure
patterns. This information can be used for general analysis off system.
And it can be used on system to take action like offline a page affected
by a bad row.

Other EDAC modules (GHES and SKX) provide this information in their
output. The AMD64 EDAC module was not able to provide this information,
because system-specific translation is needed.

Recent AMD systems provide a PRM handler for DRAM address translation.

Use this PRM handler to get the DRAM address of an error. Include this
in the EDAC "other_detail" field.

[Yazen: Reword commit message and reformat other_detail string]

Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
Co-developed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 27 ++++++++++++++++++++++++++-
 drivers/edac/amd64_edac.h |  1 +
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 8908ab881c85..42acda4cfd59 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2704,11 +2704,16 @@ static int get_channel_from_ecc_syndrome(struct mem_ctl_info *mci, u16 syndrome)
 	return map_err_sym_to_channel(err_sym, pvt->ecc_sym_sz);
 }
 
+#define MSG_SIZE 512
+
 static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
 			    u8 ecc_type)
 {
 	enum hw_event_mc_err_type err_type;
 	const char *string;
+	char s[MSG_SIZE];
+
+	memset(s, 0, sizeof(s));
 
 	if (ecc_type == 2)
 		err_type = HW_EVENT_ERR_CORRECTED;
@@ -2723,6 +2728,21 @@ static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
 
 	switch (err->err_code) {
 	case DECODE_OK:
+		if (err->dram_addr) {
+			struct atl_dram_addr *da = err->dram_addr;
+			char *p = s, *end = p + sizeof(s);
+
+			/* Include a version prefix in case the format needs to change later. */
+			p += scnprintf(p, end - p, " [AMDv1]");
+			p += scnprintf(p, end - p, " %s:0x%x", "ChipSelect",	da->chip_select);
+			p += scnprintf(p, end - p, " %s:0x%x", "Row",		da->row_addr);
+			p += scnprintf(p, end - p, " %s:0x%x", "Column",	da->col_addr);
+			p += scnprintf(p, end - p, " %s:0x%x", "Bank",		da->bank_addr);
+			p += scnprintf(p, end - p, " %s:0x%x", "BankGroup",	da->bank_group);
+			p += scnprintf(p, end - p, " %s:0x%x", "RankMul",	da->rank_mul);
+			p += scnprintf(p, end - p, " %s:0x%x", "SubChannel",	da->sub_ch);
+		}
+
 		string = "";
 		break;
 	case ERR_NODE:
@@ -2748,7 +2768,7 @@ static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
 	edac_mc_handle_error(err_type, mci, 1,
 			     err->page, err->offset, err->syndrome,
 			     err->csrow, err->channel, -1,
-			     string, "");
+			     string, s);
 }
 
 static inline void decode_bus_error(int node_id, struct mce *m)
@@ -2808,6 +2828,7 @@ static void umc_get_err_info(struct mce *m, struct err_info *err)
 static void decode_umc_error(int node_id, struct mce *m)
 {
 	u8 ecc_type = (m->status >> 45) & 0x3;
+	struct atl_dram_addr dram_addr;
 	struct mem_ctl_info *mci;
 	unsigned long sys_addr;
 	struct amd64_pvt *pvt;
@@ -2822,6 +2843,7 @@ static void decode_umc_error(int node_id, struct mce *m)
 
 	pvt = mci->pvt_info;
 
+	memset(&dram_addr, 0, sizeof(dram_addr));
 	memset(&err, 0, sizeof(err));
 
 	if (m->status & MCI_STATUS_DEFERRED)
@@ -2853,6 +2875,9 @@ static void decode_umc_error(int node_id, struct mce *m)
 		goto log_error;
 	}
 
+	if (!amd_convert_umc_mca_addr_to_dram_addr(&a_err, &dram_addr))
+		err.dram_addr = &dram_addr;
+
 	error_address_to_page_and_offset(sys_addr, &err);
 
 log_error:
diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
index 1757c1b99fc8..e0ad1c0fc1c3 100644
--- a/drivers/edac/amd64_edac.h
+++ b/drivers/edac/amd64_edac.h
@@ -400,6 +400,7 @@ struct err_info {
 	u16 syndrome;
 	u32 page;
 	u32 offset;
+	struct atl_dram_addr *dram_addr;
 };
 
 static inline u32 get_umc_base(u8 channel)
-- 
2.53.0

