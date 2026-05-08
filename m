Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993D330B0B;
	Fri,  8 May 2026 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236981; cv=fail; b=ifK95YvPY7mpz6prHXH8VlmZl+RRxTC8glyAQ4X0C4icyGT81GzXHbEiloEiLqVc8GnoR+wEN0ZvJYxS3Lql2D9q1cXbf/GeBPvEPKqKo4ew7u2IPmpoA53b2D/SAb1E5ptjMK7iJm1uUSgAyJt8Acoa1D2FbINBB+Sfgrli2vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236981; c=relaxed/simple;
	bh=ZhcFfnYSxLRzFtttNWQimsqWRtke7/8GBx+opEpA4/g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sm98sNasqu8yIFgTHYG4lmy5UW1GEdWRt9IlkgjZVIiuZWlbc4vGY5sXBtn75WDe62FKPPEGd9aJHTQrmMPjZKtjAChU+z38tgwQYVEBKyoWDtBXHo/9HZfsJUWiA/6eEFO7ZYV0om/tTmUcKxhy5Calr5H4KYmn9aLyZdhJudQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=meKyfJ3S; arc=fail smtp.client-ip=40.93.194.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="meKyfJ3S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k96S4TBZx2N3cVNkMYN/sHXv7+WDXQbeGfLFijuC9xSOZDsagQEZMN1ZsRzyZF7aLb03FOg54ncWWa7s4daPZ6050SUupCW9louaX/5hn085ld4XJHE/gjf0sTbMYZH9bFK+Cnp+rUSWy263Mae9bKVV+qf18kKFBu23+gMmRGUz7ACwXLDL5bACCakgx8v+CiR4NV3aY2F5KQsCXKS7QVwDDb5+rJ1L8siZ1di/I/73XGYG+JyP/WhwXGObvHBtEnaYFxuZ1V3r2PNkhiDv1CT4FvHYRzytqm/Cjq4XPzwP3rGCFX4yHgeUdI5ZqQodCzp2YMJSHERons/71JfyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nvKttwmFpbNzz1J3HstBh01XsPNyFSfp7ihg5eH31U=;
 b=w3t1rYpV9p68fWrSEPbfkkTWPm0pR7AQfgQLx90zdo04I3zn+LNBgtPlgrP6l2mse4P7UiftcTJd+qIlidWebpxg1keu0ewMNRGWsMUcXEFSu3Gh6x6FAnUHM4HmL0b7Xaa5K4ndoj7dL600EO2+eob52ZHwvUTp+xLrK9M5y82V3oSw+is0NwGuDYidY5IhlWhpCYL0q1pfTivYvMyYBhR1a0NXvmdEy+VQ26jgKRnbsvDfGBRxOE0z94+l3MbSw3B+lV31T81eP4v/akrcrmurX9sCWvdTjxRcnQ3acLS9uCEFEgDAXYdoQpGDJBUaW5sIStYO9wJ1QqDLS3aglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nvKttwmFpbNzz1J3HstBh01XsPNyFSfp7ihg5eH31U=;
 b=meKyfJ3SeGrlYL1QJl9VO8OI1woBIp3FBHWOwL+rFWm6VHb3ZTH+Yu9zIQKIYxrk30q3TPDYxDZCctlcoAFSml4PpAeKfOwikyQXQ9gZNNIC41n5+7ow3Z5OfBnCapZCMK9cDnFDFko5WRA8nGD3OOPzzizFEiziZpth9rgafEU=
Received: from PH8PR20CA0024.namprd20.prod.outlook.com (2603:10b6:510:23c::19)
 by PH7PR12MB5976.namprd12.prod.outlook.com (2603:10b6:510:1db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 10:42:53 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::a) by PH8PR20CA0024.outlook.office365.com
 (2603:10b6:510:23c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 10:42:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 10:42:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 8 May
 2026 05:42:52 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 May
 2026 05:42:50 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 8 May 2026 05:42:48 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Borislav Petkov
	<bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>
Subject: [PATCH v2] EDAC/versalnet: Report PFN and page offset for DDR errors
Date: Fri, 8 May 2026 16:12:19 +0530
Message-ID: <20260508104248.1073957-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: shubhrajyoti.datta@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|PH7PR12MB5976:EE_
X-MS-Office365-Filtering-Correlation-Id: 5929fd9b-9400-41c6-a30f-08deacee8ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YnFuXQVm8m8GDMnpUGCc4JwbP7Mhi6jm2yLo6QOvW/bSdepfzBROWPSfBPe+IWTOc0NQN68VRy8xPBc1TvblZI5uuCNB/dvfjqQR0RQIzuJv+mjGuMJ6dmlmFbPAGbhTN1AWR8WVK2VzKFdOwK809/v8LtS+Ob2WLuXkvC+786QSxLfsg/wq7P2qzLmNTOnpHTQ9RfRHOataP9ausP3e65RK23eB5JEYG5X9JpOtOCR6e5AI1g2qraG0a7/zjtNi3ypDUulARtRqHzmG4peUU5d428z60Y5AoXauxGl8/0nkA4dw+huFOyjjVgXveCZ3/hbvg38mBddEWaPyfOPE5nSZaF74QGiSLgM2Yo8QlGlt/YWKmntdrl8yKUFFvOWxHXdJgkL6E2IBUHAdzBsyt7A5ZAT+Tgrvf7LFks3E/B+o5zF2y80qHKip3BRQTjuMWXrs3lQ8+OOOkLBcPKx0YNHc+PkicEBjGCh7MkAOu+Mp3QuJekg7r3ter1/TuCAl+LFfnjQl4X0Yygt7cieK6YDr5ax8UpJFPQvxwc2cNG/ejsV23g64jOeodX5koRz/yjiCt77taurgLrDIcL9yyJvbAY2iuHGl/Ygxk164M4XLtS4eWqbdBuoDvYqJJia1ajd3HzCFBufGbFkfk+d9w2y+bLep6rJNcFvZkBNu+sR21kPEGcRdrFjhNMpXYojnTAlw9t1R9fq8rD8ZU5njDw/T7bSwGv12LeT3FNFEAWw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RLR2sb42p0YBjRk15co7fxNzs1/rg4/qtUGaTE9414RHvTfEpernIyzzo08yjOc9Z4Mcft6JfC+EaThSUijywpd3v5pfsRpWqCOYiw7Kmum2A0H4F34PmxIxzf1sSrV61PufbRZRN8rChn/99FdiIHTokmWD6wCPZCySya6SMsVbbNk6wYs2PiHhc8ImiWq7gAP83ieV4TEMUqwQB/N4VA74OlP6bHVAKJomXKxumcKHEx3OPwATrnAOZ8l88YHcozeY6d71jTrLdVxu6lBrTB0NnYitJH4GXOP9rU7inUham+fAW/k/VjboqVEDochwQ+WvFMitOF4OVqcV7u83sknXY/EuM1cMpLI3V4eQZAQExcVcS7Dcc6nMzpzBk2LiMPIynxK79u9gn2x4JfcUoDl9/7VeNJOWkD7dE4JlEbmaoTzKMUUzk0K/443bH+A2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 10:42:52.9926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5929fd9b-9400-41c6-a30f-08deacee8ec6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5976

Populate the EDAC location fields when reporting DDRMC CE/UE events.

Compute the physical address from the decoded error info and pass the
PFN along with the offset-within-page to edac_mc_handle_error(). This
allows user space (mc_event consumers) to correlate memory errors with
a real address.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Refactor the common code

 drivers/edac/versalnet_edac.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index ec1315582414..85d1a829a8aa 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -429,6 +429,7 @@ static unsigned long convert_to_physical(struct mc_priv *priv,
 static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
 			 int ctl_num, int *error_data)
 {
+	enum hw_event_mc_err_type type;
 	union ecc_error_info pinf;
 	struct mem_ctl_info *mci;
 	unsigned long pa;
@@ -440,29 +441,26 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
 
 	mci = priv->mci[ctl_num];
 
-	if (stat->error_type == MC5_ERR_TYPE_CE) {
+	if (stat->error_type == MC5_ERR_TYPE_UE) {
+		pinf = stat->ueinfo[stat->channel];
+		type = HW_EVENT_ERR_UNCORRECTED;
+	} else {
 		pinf = stat->ceinfo[stat->channel];
-		snprintf(priv->message, sizeof(priv->message),
-			 "Error type:%s Controller %d Addr at %lx\n",
-			 "CE", ctl_num, convert_to_physical(priv, pinf, ctl_num, error_data));
-
-		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
-				     1, 0, 0, 0, 0, 0, -1,
-				     priv->message, "");
+		type = HW_EVENT_ERR_CORRECTED;
 	}
 
-	if (stat->error_type == MC5_ERR_TYPE_UE) {
-		pinf = stat->ueinfo[stat->channel];
-		snprintf(priv->message, sizeof(priv->message),
-			 "Error type:%s controller %d Addr at %lx\n",
-			 "UE", ctl_num, convert_to_physical(priv, pinf, ctl_num, error_data));
+	pa = convert_to_physical(priv, pinf, ctl_num, error_data);
+	pfn = PHYS_PFN(pa);
+	snprintf(priv->message, sizeof(priv->message),
+		 "Error type:%s Controller %d Addr at %lx\n",
+		 type == HW_EVENT_ERR_UNCORRECTED ? "UE" : "CE",
+		 ctl_num, pa);
 
-		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
-				     1, 0, 0, 0, 0, 0, -1,
-				     priv->message, "");
-		pa = convert_to_physical(priv, pinf, ctl_num, error_data);
-		pfn = PHYS_PFN(pa);
+	edac_mc_handle_error(type, mci,
+			     1, pfn, offset_in_page(pa), 0, 0, 0, -1,
+			     priv->message, "");
 
+	if (stat->error_type == MC5_ERR_TYPE_UE) {
 		if (IS_ENABLED(CONFIG_MEMORY_FAILURE)) {
 			err = memory_failure(pfn, MF_ACTION_REQUIRED);
 			if (err)
-- 
2.49.1

