Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010000.outbound.protection.outlook.com [40.93.198.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8231D2135AD;
	Mon, 18 May 2026 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120471; cv=fail; b=iWFLPMAtBUKNO0d5y9FmERU9JGGxQrG88OENLttVJPhj3vjOKr7lLJWYQh/ZCUbXXyY450T4YYfhFIyma0hBn4i7mxNVRG2refnS0U5HWD7AHs2Xt6tdFZxJQHsymiDT66fA2iUpk2pvCzk0/ro7/2CjYowG7A1MfSg2vlTyflQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120471; c=relaxed/simple;
	bh=RegD5SQPwLPB38iyPKSI4zwyMU78J9PO5nPddwTCOT8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AbEk3J51cO+GoDcAFo4gUME0V3pI92idQErl+2yyiUJqNDv0s/YWPDN1P5Fg/Fo2wRrx3alIZbI6kXO8U07w6ZKOxDtCzXm2rBH/6JilzkI2XPwF4umPFDBwn5hJgCceRLGsd5WGYJzi9rDlea928TlgHzqBgbRjSSo9aWZT2RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SZcDUTcB; arc=fail smtp.client-ip=40.93.198.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SZcDUTcB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGtYC4MiyUt2ciKIoGvnI+ystl9dXITA2+mABjj7B1fZe0kvrRp5aDAc/L9mFaIS9GsochYRcYREedtzqfsLdYvxovuCxM+7hVY2/JpOHDxWCH7bw/kOfwI3NB8xxUQc3xmA9l9iDTp1AbJV1Y5nfDo0zvH0Y/MisfdEnyaoY6v/uOGzFZJr111JHwolSiRkonYIUPWpIIHgS2zlMtZHYtfaPvhnkUqikAdYoZM67Dj+wwHy9FSGSyTS7Jf/OcxrLykyIK6rcnO5CgXhlcwjkxXs5jlM+sjj/Sk/7fWSCYm8dcw8Er5biqjPYCYLSoUzrE70Hmoxmb56j6EQD4sG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQdr66P1RhACS4+qnmUifI3iJu17V3h7lkuExHzvEP4=;
 b=aIN+GRug5AeoeRFcDVXIL+RGB0Ob4cvnspNuU/9VRDM/UthIMQ/3w6GLxT1a7nCYARHLnh8iruxCU/QSYwpXf/O1q+7/SIcMeYv0CJ6TUhGPfB9KO71VfIyUg4ccdE3NCfxBvdSSh309AGU4RDtCpwMZld3pBQNn4mz7KBZ95US3Y1DF79qxMNHC7LaHMACWqVGLhi9s48jOlzD/bxeaW3aiDAej8j++nCIpskpPrBJWkgqCwZFFeXQhfntb23/3fDN0AcHORu4nabGR7wuFQKxRkPU4VkDHzLfppDJ4vwX3VkqZVoMo5hWQPhoAnZ+aDCD1xJ5IT0hpg7mDurqgiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQdr66P1RhACS4+qnmUifI3iJu17V3h7lkuExHzvEP4=;
 b=SZcDUTcBq3efcBpYHpwKuWdKZbX0J9ONqphuJyS74IPl/n+7JHwoetUsLjmMQjyoaEvKahlKgUVQBMJKhps80WSS3hNRobujzjCjOERuH/IkX/p673vRwcscC7fhk+HHdFOMcLeDSRJWqFyBDhGJ9B2TYT2Ilg5/QrWM6ADP2XM=
Received: from DS1P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::16) by
 DS2PR12MB9712.namprd12.prod.outlook.com (2603:10b6:8:275::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.23; Mon, 18 May 2026 16:07:35 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:8:451:cafe::b) by DS1P221CA0010.outlook.office365.com
 (2603:10b6:8:451::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Mon, 18
 May 2026 16:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 16:07:35 +0000
Received: from yaz-khff3.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 18 May
 2026 11:07:32 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v5 2/2] EDAC/amd64: Include DRAM address in output
Date: Mon, 18 May 2026 12:07:16 -0400
Message-ID: <20260518160716.171578-3-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518160716.171578-1-yazen.ghannam@amd.com>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DS2PR12MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: 20615894-2339-4b90-1635-08deb4f7931c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|30052699003|36860700016|11063799003|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	7k2V2vXKoreafhpGQZa5/zCIjmUAZUh1t8kNWtFo/94l8OWIHRHczAM1endUGtQl+7Z6Sj/Xutq1ZOHQ0caof/Q7+mrVUS1TVT5/+4as2oVxrCl9SIjxlGTX+HzUzDe82rjHDqwJsrkf+t0H9pcmz2S3TksD7zpNXjjevrl9eRfD/GTdcNWWCVq5sYx6TmALUeqIGILWNwxnqW00sqKWHsgkmLKO5CzQSRKzYgu0+cIzDFomVvjedWrQPh3LXgx2uhSCcpmHINR05oBjEDyQXUctkPN+XgvvgBlwJkl3kvhTk7hzim5YplQg/CufswiX/jLK1+CX0YThlyxL56I85Wl0TbHuHXPWCjTG1/xZYELI8XX3mEtOKo+hgtjrxqFz8ymQmlNyuXYmasdYx1NzEaDfALZlzyPzgurlMM/FzZDNOcdfTcdjYsa4wOdqT929Oj2+PyFD4InzNmB4D63PXUtdKbqGmHPeb+ydGciiPLnEHoFcxuvEjdVB1mFgQ/IfMCYP+4QZv32/Tp6kmyexAyMaim1rFfhZrzXA4aw8rS9Or3LV0PynzsGcGI5Arlp2RhX55izt1v/y8Li6kw6IAHyllaYqF191zKbD2kJDPPfQO1VDQNzeLjwh28Mhd4vbtwgNPjgX1BMbQoDxZAFWZ3DKXxcWrKXuVz+SlgWf4RBePr0ngusKYwYHs+0vC0SIvwHpUFlOcdIV349TK6N+wI/kLPam5MCrgI9fiL9yhIk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(30052699003)(36860700016)(11063799003)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	in++eOL8t0UKXdrpqStem59D6CYz7LYjhW894gWdZZmReK+PNz/z4iUvo74nryo4lIHZZO+bI3jRiEswwQNKqrRtXEStfs7wEJzq365GwFk1NHjYISApaEOoOrzGU5EIPs9zCFgWY28rMgun6UzOlCiDhRJor+h5lqBpL/yXQecTd2+14y86POmN9AfEpqprYB5GSFpU+9Z4ey8L5y7+2Yp9Fjopb9X4HgNJLOL3LfOulzEiBVx1QMm6pj0U6MPlLI0T3RGuYBClhRESJEKiSEfCoQ52mYwkihSRbg9gedWwcqNhpL4JJjJUcyh8lAvn4hQIrk6HVkTEg3I6OzGS7fSUFUyNts2bdVjm6Z16Hk+B1vm8Y2dKyMailxJ0m5UUw0TvA7sSigSDiipGcHwq+Ur/H4C0Ij+vX4Lh26YBhk8d8YBZj4LX0XGPv/qBrwht
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 16:07:35.0323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20615894-2339-4b90-1635-08deb4f7931c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9712

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
index c6aa69dbd9fb..4f1c06b68907 100644
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
@@ -2721,6 +2726,21 @@ static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
 		return;
 	}
 
+	if (err->dram_addr) {
+		struct atl_dram_addr *da = err->dram_addr;
+		char *p = s, *end = p + sizeof(s);
+
+		/* Include a version prefix in case the format needs to change later. */
+		p += scnprintf(p, end - p, " [AMDv1]");
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
2.54.0

