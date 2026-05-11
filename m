Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D80431E83D;
	Mon, 11 May 2026 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495744; cv=fail; b=Q/oltqu0vQB8BqajUv9DjQWpy/DNZOGddME6flar6lsJAqwgZfmK+tjthvRb7AQFOcxVd4BELNReHfQBXZla1+m1jjPNRd++DXrtGUfJBlrEcGvMixVDHEoJSdv9HJuEnISzEAlIQDmPaEN5kPW/mm0AFAbtrGGAmjASi3LcBlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495744; c=relaxed/simple;
	bh=vP4W6ZPJyianiNgfrFmYxZORVx2zZUm0nZ6IKakyrkM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OqoICX4rkeQQCUqjGnYFj7XTThEVX/4f3gLQ2wQ0tV1ngxIo3izEJsJForwjaXIXnhVKfNU/pY63sP+Zbcy3dtzAB+1M+CfJxxrLr9Dk8mrdTbxJvvt7F5WinShra3E0goq38R0BzGXe0a4AiwifARYiNiiLzDwLJlrG9ek7zzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CUWVBOmz; arc=fail smtp.client-ip=40.93.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CUWVBOmz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn094cZMB6favSbfLO0bn++E2eUTv6zGPCzkbgC+iyRsh+hfjWo8JY4blAtUXDfL3cIaIgBx8mgoW4ltgPPMLSm1HUuMAVojaUo/yxutvG+Xw0hgs2msCNwdc1iolEknW7ogXt40Do+x7mGvagSOOSLs6xJxwfPyX3C76LmR4gnnqlN4brhQmOFKkwhSeCclmc83tK35Hu2tUVpaWilqW+OW4IAA5cvtdrblO6+ESpALm9gT1E3jcwhjbvrJDqe6OcgDX9+DJsNzRra5/LNGJsU/29rKWIcChCfx5v9nseAodvalhXHzWUq+s1BnT+Hc3v9LFzol7O3Q+8oLN1D1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wtMWIkRkvoi2AWzH/2VxJZhr8QV8KI5sO8Dc4RqIXQ=;
 b=Zok4ZOEn7yXaLIXTPCfBufilS79hlZE0pIRBjbwIA0Murj1A8OeBgNBGGxGTzeIviP1l0BPEI/dLZ2hg6eZcHtkTBhPzXeWDWi57LuHivMfNPUTsQvWr4HrkR55OZ3du1l3gvmu4EDP+W9gSBZ2AdAkY+lwYCdsHEwSEVhgfOZ7RZVTFdzqNp8b2bcwGxlkObqS055FhxbyfdctesNQX1jfUzoeO8DTnhPKFJatIdpXM0DlUnDpJI1j11Ldoush46EcrbIRTdCwONWkPW8IWvuYA35/dZzMYHR1960mOXlC+jQGrxqvjAKLlO3khYqunTqgDMHWD57uoNPA8jPnRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wtMWIkRkvoi2AWzH/2VxJZhr8QV8KI5sO8Dc4RqIXQ=;
 b=CUWVBOmzAM1PIiqyylfTeVndI0h/EiI4gZxM7kqE3xQrmQWZVgIjwGaHLG+oGqBjM1Q30556pO3GH4e5BxUBR2ySPOM5MDEAEAxPpJy7kFdDuEsPaKUGO2IpmnOwXEne8T380aDK4iKU9BgicgV377JQ4HHtzI/5O6w7OJocgiI=
Received: from SN7P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::32)
 by SN7PR12MB7934.namprd12.prod.outlook.com (2603:10b6:806:346::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 11 May
 2026 10:35:37 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::58) by SN7P220CA0027.outlook.office365.com
 (2603:10b6:806:123::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:35:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 10:35:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 11 May
 2026 05:35:34 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 May
 2026 05:35:32 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 05:35:30 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Borislav Petkov
	<bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>
Subject: [PATCH v3] EDAC/versalnet: Report PFN and page offset for DDR errors
Date: Mon, 11 May 2026 16:05:09 +0530
Message-ID: <20260511103529.1853270-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SN7PR12MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: af32c31b-5074-481a-d36e-08deaf490a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xG9W006+RPxTBQXP6uNKqlfPdUZB/IuBXS89zGhL24jIU6xitc9UACxGmT2fe50u9bRrvS5IyBF7Ts6re+eHHRbfNq8qoAJZAdYtLQ/l7Q7IPK2iINhUMTR3s+cRY5TrG6nXStxxoXs3USdNhlUQzwUjC7efmuk6Yko9JfEPzFmH6uNx2IgGSVmhNPVYDHgNSq6+AWcx6TYruibxXUZ5pDGEmeaB6VjCR6WMLYFcsbxGzFrsSTsTquSTNWYVZQOFxlIwj3YCh5Afiy38q0KpzLm4xFX0eZlt3y/12X0sh9pYKccQqnpeNtkPmpXxwF4rG0XAK4ZyT1iPBSaFKNbaP4tZDf6F0PRRYtXUEYKBnzjjs+cE/W+oGEHGvjp1lrm9WMW5k/tqS6Gyp6M5DIRrU3aoNE3CZjAPBR5Bhv6SbOPi4JnuBUSu7X2tE8EuDrHr5k2jYMLN/eRDS7tLZyW6hNInp+KcoQ8j+by4QlE9jme5eArPeQc+I+MudAYqRnwOmpDlotMRm4gJOhAowjB7uXse7lpOB5pPlWVtC34EDArY0qwe72Ay3R3o3/D4vHSJAVZBsLC2fz5NwuSFkRJIiOorY8iY7qm88UcMfwSFGXFRBbVNV7AGOlpjaYbA7ZFu39IB6zQAVo1huH4QfTUBAqghciRoEAVQUdkZAOtWGK3JEbdpOfG94s+GtAZ42pOGbZpT3TGxc9pdbFv/QXoIDawKLLfxjy3+cbGzHkILiaY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1jiHN3VWV0aGDC0AJN1gU6PhQba54kCHh8/7PZmo7zF3h7ktLz3uMX+hABafcLSKF/HqA8MYvqHEc0X2avrhyu0ZC/3Yf6UH5OKFYTA1mY6ZHwFjluw6NI/97QKMnp+jwWk+GXoi7JeJIt86Na+93W6u/T9l7rOntQaYFvXRKDzC2WMnGbZfSIiUWt+lnTJ2hUU+umqJnMJDaEY1RCfaCKANVNUgFkKotnoF8ZDCZWfHs06DuqJWlKmc+mVUQzHKgokFEBf0Z90wUw9oik4KtEXcucD5Re94rneLsgfL9Ift1Dtg+3LM65A1sejG9nTfQA0kVh6/cpkTV8JMMSSEVCaHZ5suyI9E9OAuDxmXL6C78rolsJnmGRS2h8aNbDoQ87SbMdRyNiVVtiusFtcTgwaHDd+BHEWn32WcUfBIjNX0Ha9lBjQ4GjXrbN9TDFt9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:35:37.0888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af32c31b-5074-481a-d36e-08deaf490a2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7934

Populate the EDAC location fields when reporting DDRMC CE/UE events.

Compute the physical address from the decoded error info and pass the
PFN along with the offset-within-page to edac_mc_handle_error(). This
allows user space (mc_event consumers) to correlate memory errors with
a real address.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---

Changes in v3:
Update the comment for DDR address

Changes in v2:
Refactor the common code

 drivers/edac/versalnet_edac.c | 36 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index ec1315582414..7a10c53c4768 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -265,7 +265,7 @@ static bool get_ddr_info(u32 *error_data, struct mc_priv *priv)
  * @controller:	Controller number of the MC5
  * @error_data:	the DDRMC5 ADEC address decoder register data
  *
- * Return: physical address of the DDR memory.
+ * Returns the system physical address corresponding to the reported DDR
  */
 static unsigned long convert_to_physical(struct mc_priv *priv,
 					 union ecc_error_info pinf,
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

