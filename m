Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010030.outbound.protection.outlook.com [40.93.198.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B08A2FE057;
	Tue, 30 Jun 2026 21:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853688; cv=fail; b=Mjw2wBj89VCDTiB1qDIdkt4iPzdGAYWMwHtkB4x0Y9MGo0li9qxSfirvHZVJSdyNSMWhode4NeZYfk8RAoX+P8lBMgmki6oN6hziKkyfiB3ZTH4hr0utFBXdMs5AQqvwy++Jgn3P387rIe3FQRKdScOIHuye2TO9rDVWgPrlAtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853688; c=relaxed/simple;
	bh=i0Qjo2LP3n5dQDp4GIoWKoBTuMluV3umoNYcPWNavhU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rCU6faCfUEsPP4wCcNV6pbzsOAG8PNdG6u2qwjtZa1gaKLFXtYweHPt7cxX0ORy6IlvE43LZiHaiSMN0qp+ZS63UWqsdJXG8kglUO0jb95R6nCXCoW3xamTtizQu0te5inINXfP/eArLueb69OlKro93Rfpq+7aWn2C4EvJ19s0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YPTRTGgZ; arc=fail smtp.client-ip=40.93.198.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YPTRTGgZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5ZQ5MoIhme7bkOXB3Sg2Ywm5lE3g/EIIingW6orefD7BbEYuHUoeezWrSNSL7EMBi+YWXV7ndPm+HVGhS0i7xA5n42oVsoEUXuqmsY26nF4Vn3oZzQOZhQj5w//NH3vaXvNlbbOsf7E8L9wy/XLMPn5KLVUuyiY/nt511RbHI/vYMLJhlA+QMcw1p6epWoSsxE68jeH9HJXFHp2QT6BY5uvlO4VGqS/bNLJ3jBSOg+Adiu/LFhRRH07Ct0jizpCnqvTijzcE3BEkuiMULz7yE4aQ48Mafb8UCrAk++bLyLHZRH/kC5qJd8APYrn3EYIWAoJQDHshlafWhwmiOTxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTONkEm+1hg2ERdHIT+9PUDRIwRFKHX0M1c5NcEX1hY=;
 b=rzXpY45uFgqhOdyklnULd5H7rJ86VB7xt83m/h+GA2ikZ5bMTPKjimJLGQOVBpVbPUFsy76/IZvKUwG+JCny1yEozOXjfIr4R29pZrJ8+yTAPWAuDA41X/KJdwW/PLgEgoNr+jC8yN2IWgiFw/DapINrCOps4KNqpq74dzaFG5xnkn4F/KwvK8Z8h93crLjEBHF+vKXQXFFONS5mxlWq11LqWhVVcL4NmcCyjnFZZ8yIeAe189X7xCMtFmLq3KZ6zLo6exejkmgOJ7O8vzCg5dbyvy9znfvU1H3cLqHikFSXAcA+g6RNDkp+G0eZrc9Xg6i3N1IN0GSQxoPlZiepKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTONkEm+1hg2ERdHIT+9PUDRIwRFKHX0M1c5NcEX1hY=;
 b=YPTRTGgZW1S+QjwUyCelNNno9p16D06BF5ord6JejRZV7dOnXG3v29grdcoqr+DnKz0VCLbO3Ft81jMF85W2g4vpwPU3EHfb+IOSnCxXOwFhBB8oQUnOt2XoSbfF7vNXbJiDy1UuRF7vfJZWlwS9K8/GX7iqCAQFtjdNi9zpoy8=
Received: from BN9P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::16)
 by CY8PR12MB8068.namprd12.prod.outlook.com (2603:10b6:930:75::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 21:08:00 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:13e:cafe::6c) by BN9P220CA0011.outlook.office365.com
 (2603:10b6:408:13e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 21:07:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 21:07:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 16:07:33 -0500
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 14:06:56 -0700
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v7 3/3] EDAC/amd64: Include DRAM address in output
Date: Tue, 30 Jun 2026 17:06:40 -0400
Message-ID: <20260630210640.680758-4-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630210640.680758-1-yazen.ghannam@amd.com>
References: <20260630210640.680758-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|CY8PR12MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe5c200-6717-4cb9-58d8-08ded6eba9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|23010399003|1800799024|376014|82310400026|36860700016|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Cefxqt4iqoZwIvkI6r+fH49TiMIiMKqr/s1ZM6fRilNakTG1np29py3E/8ApaxrtvF0yUHPgoFVknJBahQgsCs9Vmjvba4PaIPelharnNmubHLmJXGM2oCmlrRM7YFUH6SupgCLlNBs7OnhyEukUOdu8JAUhz9zvSws3DtcMt+gGd/N3wBsueZNa8fBCGYUZQgZ6irYcXJqAH+Oa3XgaZzGbHpeHVEa8fLblOu1FPYdN/Avzx53+Kz/BebrHN2/0Fq4N6CKeLLcOaxhCikx1H09KyqjAbqKVMCesba/6Rzn7UjHOkdM+kaJzW/YiVUiI0NzYEOgSSYI2U6RO14h+bDmcIAu8TGuBZ43bp8RRCWupToEBilePItNwycfxl6uQ+WV64KXZi3tSVArt+9zHNOekVSEarvbL5gB1kksJeV9eAE82z4iqsvu7wUhmjBNihTDQqOYL8s6uaDXoPD27DOL5BZQHxBSS9LuILBgbl1x8/7KoWMhieXGiH0BBPl3MC8JWDxQEzBEbnL1QDFHPEIWx/Xt5P4AW5e3qiv3wsqpjsDqFoKOTXitke13OGQkRWXNvpdkdEZa/w4RNNj3Jo+Ptqkwe58xVQJI4XlvIrUIEl9jk7hkmQmORs3J2OQ/eZz+XCKvhlwxfEjpdDGl04Xz71yavMjWiWAL/SPNKj9eVWz+hhmcbdWaMcrNvhNuTVx1qcPeESjZIPbBIiyhxYw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9me4WI0bgYYSedT5gerKI2RkV4ghWrligs9RhGS/nj1ZGya9F+YwF8sqOJGjNCj2ZjHzPeidZgYEkmOOibyJzRulRMxLNjLhMjayY7IfUctGvDcnAFD0gWJ3ENkLosNnfd97XCZGsNq7Jm5ab4YgTpEfkasxyGClEnL/OIy2Mszhk/l/LCpWFX64CERooLcpAEB7BEeraAHxIy9TFRgMy8srGe8o3/xIk8h2eEB3K93tdLcgYN27Ze7awjBdKx/Zonb6Yep8c8szVFb3uu8Vzk++GJL20QoAoBE5Kh1q6SOZujB6nALOm3DbLL4BCk4vN64L6lwliIXQ/YiMh0d1ByoO+FyvhBBzvmo4WmFBDVKcbYKlQ61yxz6XpOhfZdKFabEOZq3vAVhaZplWCZhgQ44E/fiylRcwPL84JCfhZixkRozTiHx1eOF9erflXpp/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 21:07:58.7263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe5c200-6717-4cb9-58d8-08ded6eba9cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8068

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
index 880036599456..477c8bf620fc 100644
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
 
+	if (!amd_convert_umc_addr_to_dram_addr(&a_err, &dram_addr))
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

