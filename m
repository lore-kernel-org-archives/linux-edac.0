Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89903F0A9C;
	Mon, 29 Jun 2026 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745673; cv=fail; b=uacaOiXhJ35qMKKopcm+kmOyhdTb1Xy1wpUt9CO0V2H4108WRcr5YUaK2JWMLzESlXx81kuEiEB8X1QlmWCayM8vPSaC8iT1OMw/rCQS1T0WuUOySnF6cgcwCWOTdLnnQQEBnoNs+6Cay3HpmKvfd6KdAtAqdpvRpGllDGfk0jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745673; c=relaxed/simple;
	bh=Nj4nvJ95Ef5C+azC/RBdtZJmBJeSCfqaIJdASY0d8gg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KMX8BhVIEKVbkiohJOf7vU5bn4N4ehJMtfy5Cn9ngo0GWlE05P3iARFhR0bLPv4S10II7A/2Im4bEfTdPNrMXIpFkISNtIaGogFvvCKY7JwK7ZXsPscO56ZRQMBdSkT0xLQB83z9e7Y2jkkiKlO8rZKaXnk+plkynGb4/2jq9ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I60VFENH; arc=fail smtp.client-ip=40.107.209.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I60VFENH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dqg8U3PICLq+R5g6AVhN8ukQLHRMmF7V3irLdzSEftY1oQJifipPs08Iagjks5rHoJ+rz7rLtrhEVc4w/ELZLwTGO+xd19FcgjIu3g1Vtl2oP/4XwBwQ69kJ2Xs0zfgYoWtUg13CQY5+nrhqqLuEJ7JpvKEz9jWBtBBDC6BB0WmjoRYeeu1d7HPO4LzdOvpRGbT0bOYQ8hYSF+DEI9HApGDT90TIWGAvRpV/Vk+j42YF+2bD/zfQG2JFygRrTBXIR8YguEueeNljyIKJxZzRsGD+OySwcNpF5oDNmG7ucn7OLv6hJMl78CEuOw1oLqor4IO4XPhSvSeHu5r3O34DiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svp9j3tFUnyVgNyRrQgKw25MFJ0rNR2bx0ZQTYSyVKM=;
 b=Ca5yjapktsPcxcPboBj7TUXI9PelxUICGuJm3JBPDY4oOd+ksXOUjGzcJPSQsvO8Onm5exCOS1HGlYuBbFxQ/1vDMk/Wbuugeu1l7jPAIrcaZchqJ5pxyKC2FLGiaLy9WqK7MWSUe0dCvLC2V/oVLyftHB6JzJN51DLMH5JMxA16EBHRrw9l4+HkTnbfBXUA7fvTvDsYE8733ycKFjdMJxNSfTX7NG34tDBqSa5VDXnpgqZTHEMR1yxgt+pSAUZNwqgcoS1vzJ5W1Ib6B49RvyE7I+RSJhYLNW0UIKt4bwYLQSCmC7VjIVfnTqP43/YddgoO/aVqJUIeDP+5aH8G8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svp9j3tFUnyVgNyRrQgKw25MFJ0rNR2bx0ZQTYSyVKM=;
 b=I60VFENHJPj3odDnQW9g4xwRMuVQjdMFPnOXWiv+xrBG9wJHJ66ZNbIuxrqHHW23Xh6oRQkoag1Fe/ftCQt/x1O1qyI9IfIF69oGe9N6QQMF+8CnmIpCxdSDv+yunBO+mO/M7MLADGcJ+qZkcp1r5U+mOvoabnbYIMmetQvIXNY=
Received: from DS1PR02CA0025.namprd02.prod.outlook.com (2603:10b6:8:44a::18)
 by SAVPR12MB999169.namprd12.prod.outlook.com (2603:10b6:806:4e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:07:47 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:44a:cafe::26) by DS1PR02CA0025.outlook.office365.com
 (2603:10b6:8:44a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:07:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Mon, 29 Jun 2026 15:07:46 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 10:07:45 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v6 3/3] EDAC/amd64: Include DRAM address in output
Date: Mon, 29 Jun 2026 11:07:31 -0400
Message-ID: <20260629150731.1009605-4-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|SAVPR12MB999169:EE_
X-MS-Office365-Filtering-Correlation-Id: 567a5825-350b-4cc2-a71c-08ded5f02daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|3023799007|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mv6PXos7fXG7yPlqmq3M5v9XYeXXqbJ1XbmMT8UUSEQj+IhVcR6NLaaiDMVyXlPp0xA1ymdviuUjBkmLH5ZACWE8dZSOCnXjQ3aV8Y0Bf4A4x4NQSsfEAMoJpICQbeJGrf8BsjhWmWnZ+PB49NaQrNpCRLU292RjJgaqmnUq+8CXDIZ79o7FSl3tZphVfzafcZHx/jhdcW3P/3SBTv6JQylOBnpF6OcGsJJBiqM2i5a9e79K85LaQzI87J2VcTYjJtat3AgWucUCxQGsvNWcfgkTuGY+jsdGcRNwklcx3n1FlRqAZdyWDdTdKR3J9t48GgI4SZfnsCenjPGVjnaIsumFuno7jwhSDjOWas9zw9mKNNApi5+lhhlZo98J844Vy/MdS0NCveFNNLel05WEK6+9g5WZOyudUnNpfQ1t0onVSkc3TZVlsvVjgZdgYEHXqC1v80YiradzQomj6m58e2s13uK0IurHoE6XQ1JXbsEuzDIn3dITz1t+SyQPan8Cx25GlsypNbmvb5WcmsnKi7Bnfjrbj+AmABk4EH3gDMRofpZwMmpLWVqt2bIH6rsmDV43ZwOVCqapIvj41XpnmxKd0bS/ESG92TkohNR+6xA5zmU7TqzwgKwHx5EmkN5cnzan7ao2RzdegB8ZF9I54Zw/2KGsFepNNSqE4fEgX1v8bb+YUl0HlMFgv7brOuoCi+tOGr4CjMUO35wRYfpobw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yiYd83KGOCf4TLjDiQ2ZsEsg/JJZJErTmncyxyEORvuLMZ1FoUAeOwtC7kLFToDRE9NupHsIj8A/o+TrAuNZCJ5wNLiOU6HM7PfrZJjtmAmnGTzs7A9oaEFuC/PMlUmWAByzgKwiHp7hWmSPleoYML4vAxIw/L/CpGAyrwc6na20ofse0BBCNyQ7xbxVSeXPQX2qJXmhKu0L7Sal7lng44blwjaNcwqCyHFsGjIrYND/3ISPonjwT50fQnxXSoSLpwyHF0t7dE7vs22xltnqPSbVinSzGkB8ZkWxKoxkSFjrTw3jsXI952DKCyFF16MefiINT8ruICtyj4DD49CQvKoDjp194dOgVZxd0QQlRoOfd2f6b6jmocZx9OFzzUCDiZPZaJtci9R8t0pbQ1il3POcteJtAtTY+whJkxEUf/DO8bAwPVk8o1ZJesql0g5k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:07:46.7885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 567a5825-350b-4cc2-a71c-08ded5f02daa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999169

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

Also include the Socket and IPID in the EDAC "other_detail" field. These
are needed by tooling to translate a DRAM address to a System Physical
Address.

[Yazen: Reformat other_detail string]

Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
Co-developed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 32 +++++++++++++++++++++++++++++++-
 drivers/edac/amd64_edac.h |  3 +++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index c6aa69dbd9fb..ed5e71e3c6a2 100644
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
@@ -2721,6 +2726,23 @@ static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
 		return;
 	}
 
+	if (err->dram_addr) {
+		struct atl_dram_addr *da = err->dram_addr;
+		char *p = s, *end = p + sizeof(s);
+
+		/* Include a version prefix in case the format needs to change later. */
+		p += scnprintf(p, end - p, " [AMDv1]");
+		p += scnprintf(p, end - p, " %s:0x%x", "SocketId",	err->socketid);
+		p += scnprintf(p, end - p, " %s:0x%llx", "IPID",	err->ipid);
+		p += scnprintf(p, end - p, " %s:0x%x", "ChipSelect",	da->chip_select);
+		p += scnprintf(p, end - p, " %s:0x%x", "Row",		da->row_addr);
+		p += scnprintf(p, end - p, " %s:0x%x", "Column",	da->col_addr);
+		p += scnprintf(p, end - p, " %s:0x%x", "Bank",		da->bank_addr);
+		p += scnprintf(p, end - p, " %s:0x%x", "BankGroup",	da->bank_group);
+		p += scnprintf(p, end - p, " %s:0x%x", "RankMul",	da->rank_mul);
+		p += scnprintf(p, end - p, " %s:0x%x", "SubChannel",	da->sub_ch);
+	}
+
 	switch (err->err_code) {
 	case DECODE_OK:
 		string = "";
@@ -2748,7 +2770,7 @@ static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
 	edac_mc_handle_error(err_type, mci, 1,
 			     err->page, err->offset, err->syndrome,
 			     err->csrow, err->channel, -1,
-			     string, "");
+			     string, s);
 }
 
 static inline void decode_bus_error(int node_id, struct mce *m)
@@ -2808,6 +2830,7 @@ static void umc_get_err_info(struct mce *m, struct err_info *err)
 static void decode_umc_error(int node_id, struct mce *m)
 {
 	u8 ecc_type = (m->status >> 45) & 0x3;
+	struct atl_dram_addr dram_addr;
 	struct mem_ctl_info *mci;
 	unsigned long sys_addr;
 	struct amd64_pvt *pvt;
@@ -2822,8 +2845,12 @@ static void decode_umc_error(int node_id, struct mce *m)
 
 	pvt = mci->pvt_info;
 
+	memset(&dram_addr, 0, sizeof(dram_addr));
 	memset(&err, 0, sizeof(err));
 
+	err.socketid = m->socketid;
+	err.ipid     = m->ipid;
+
 	if (m->status & MCI_STATUS_DEFERRED)
 		ecc_type = 3;
 
@@ -2853,6 +2880,9 @@ static void decode_umc_error(int node_id, struct mce *m)
 		goto log_error;
 	}
 
+	if (!amd_convert_umc_mca_addr_to_dram_addr(&a_err, &dram_addr))
+		err.dram_addr = &dram_addr;
+
 	error_address_to_page_and_offset(sys_addr, &err);
 
 log_error:
diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
index 1757c1b99fc8..39c1b6471909 100644
--- a/drivers/edac/amd64_edac.h
+++ b/drivers/edac/amd64_edac.h
@@ -400,6 +400,9 @@ struct err_info {
 	u16 syndrome;
 	u32 page;
 	u32 offset;
+	struct atl_dram_addr *dram_addr;
+	u32 socketid;
+	u64 ipid;
 };
 
 static inline u32 get_umc_base(u8 channel)
-- 
2.53.0

