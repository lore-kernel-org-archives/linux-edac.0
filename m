Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011010.outbound.protection.outlook.com [40.107.208.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EB03FFD;
	Wed, 15 Apr 2026 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776232975; cv=fail; b=kRlnZe/WHisok+vel24y9gp4+qMCswiiz8gTUFHQ1hfkNMKBc7RAppw/LJ4QzWZyvLUsiI1Q5dGmSHyc6ky3SUAAo8wuD27idLZS3X/6m67SdpbeKy7Wsnch2iIg5KnLzBs5rk6EmnYxSAsizJnnZ97Nw0+Gp8IeXl9425wdWXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776232975; c=relaxed/simple;
	bh=lZslIeoZIJx2Qise+wo0YteM8oKSBKm4ukabKgNkd+8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mxWJB/nRja6jySp9sLck5l7rqLL6D6vUio8HTV67RhYRR1bVQkQz2gzmeg6BTB0jarRdmZNqjtzGuJSB17BuMAppF9dhCo78yPI0vYslsrv2k336hu7mnWAOAgYrU7kN1g+65tmsumevegfZZgGWa3yJVHPm7nTtbG0S9hfGDfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DzX0XSzi; arc=fail smtp.client-ip=40.107.208.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DzX0XSzi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAE0tAkdKeCSS1jr9lvGrE3wz/7Tli81bBRYPoclAKAQz3x4Ub2H65ebfciaG0VPK5+zRkj5pH2WwOZ/I20jUuFNsABLErCUpjTKwhUiqdpKm7K89VYN0nW0pa8BBoP8+MqMly2kG3Ee8QSVoHVsBD1LIc/Cmb/McCfE4ULDRLGXom45BOppTCYtvRxpiaeXZdW+T/diGZwl1RqSjMm8Yr6b35UHBKeC8zc7vESJg5LAhr1sNgo/w19Pd3soNBbfs5KX/Jejfs6imECAP/4Rk87tUU6wYxX5wQ04tOmVB9DmJCH7qvwmqy2mTWorT6Fwg8WTiUjA3BqKYEcPozgtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gamXhLl8M/S1OF7kKN0qTTijgVPbA8e+vih4Jkwen+k=;
 b=Lm+I8AhBJST89rLvGpw1j0ZCopu+oSOoIL4HWZ69CdaiC9g5MXpitb3kn3J26ABrpsyVYb+WucpdQUXiOynWfSrYpOTrZdSXjae8emXdlkgHNHZIe0JlZhTnQoslhA4Dwastj1hkpa6SGUADOSThlYicd/ROXvnHktY/Rxwm6Cr4OFSEMrctaz6ESB9EKFQmrp9Rl9rfbQAv9kzpkeJUi87Gp/LHa39CwbC2bjf7deXnOb9CPRCLJ/e4qnUIQLT94DyeJ2E3VKYDCbbyM1GuvyxNWQt1Y4mF8W4J6DnVtJ5zu9l+Y04q5Qt7HoQ5p9FhzLA8PdvWVbVvl4540g0QKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gamXhLl8M/S1OF7kKN0qTTijgVPbA8e+vih4Jkwen+k=;
 b=DzX0XSzioxLEISyRAfiQqFgk/X67Hb0MvAvpjo2EDH5nWRNJL06eY7wQmcZIccw/dW0rPhteCZGwVu3ffBvWROPBfS3ZE93zCYmv3dft7j+Y1PN3XSk/54NHFnoICdFLsmQP7WD9bP8BIaeMWXWVjQeXX4uqM4JEiBYYRAa8rhg=
Received: from MN0PR04CA0002.namprd04.prod.outlook.com (2603:10b6:208:52d::13)
 by IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 06:02:50 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::1b) by MN0PR04CA0002.outlook.office365.com
 (2603:10b6:208:52d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Wed,
 15 Apr 2026 06:02:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 06:02:48 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 01:02:48 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Apr
 2026 23:02:47 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Apr 2026 01:02:45 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <ptsm@linux.microsoft.com>, <srivatsa@csail.mit.edu>,
	<shubhrajyoti.datta@gmail.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH] EDAC/versal: Report PFN and page offset for DDR errors
Date: Wed, 15 Apr 2026 11:32:39 +0530
Message-ID: <20260415060239.733200-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 2688bdfc-6c9b-4a99-798f-08de9ab49f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LqIlQMjMlIkGK6QqvoeG0l66qZtMuka+PQI1Q9ZEMndCA1ndcVOGUEf68zlXjTF4gfKKeiuB+hkQGWQy6wid6t9cI83aPlcYmZu2+elq/99ptm/8Wl0HIfTUPMFNs/B+bv4cY/af3HtJGJdlsMcTB6lMV7Exrm2xyo9ylhwB65ZK49iREDvPAWPjbqcyLLweLzyusiFZp+nt0IAZ0DtHcLjaiJ1S3CUANg4IN8u0hRZMbBoK79QE8XlshYXnUa7WUDMknkRpzgu37YgxJn4ndd0/alWoGvq61NTDC66369clUfHHQxRcwmi8ZIP14g6ZSsnpdzs1Z0vlMWCORKU1NcE9q5NcBEPayVsGqrBrJJ3Ao03AL47Y+b5e/bGjHcNeSwBi989FaS7gA4apaLbmqBEnY7i2CuUZwz6J2RIk6NROoOdGY5mvdDtwewCjwLuuNc/NIdbgG1ClhVXDrF/xONcA6wYdQtrURTh/fhmqsUJw7bqzP6wPHfaaDKq9RutjpG2fqPWWKwXo/CvBnHy8F01DbpCaz+KOIN9h9L7ocIXLeGQ06Yax+76lXY/hvaMFpLhP3IOl5LEUVYu97K1liSzQRQhufpBgyV3V/lYFqB/nuAW377JXgm5UmQayze9nE3cfll6y/zvzRVl/C6ADy7Xf4kAyqEHY3uNG6nTmsySpyH7XDFhtYrakFfpkeOroAWzVLBN/es7WgNTi6yrgukA5hfKI0aT5PpbJIpRGG9PSjjrMCs9fPlFkc58pOmokU3cf0BTZhg6tjW9yek4/sg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3ZlKAlyi+V7/xtf3UjkBwORcN/3Xkk1yW4ylewYzoNUiOu12eo/fgIs69E8hP9GGxnnvRac6YT7rzYQm66sD2d9l7rE9mWuk4K7z4YSa1Mx9LEfgsqxF80VvXKawO2Zjc2lkjhD5LecOnyLgVO0qgdPRXSrXTzC6OHfg93/Ec6l/8NRkgt6scZWYt4q7AbRZJbl4N6m3tI+tRBQZGBEIylXlT562m+3xsyFC/PSguk/5ZXRV0vi0da/mCiAzxFxEDAYNnHTnPMm+Eqv62MsF0qA77AMngF8p8zLThh7xcUDoTMMomxso2fxEI04F7zTZvfJbpKpLCmmyYSdV9TF2AlJhOhB2ZZ41nfu64LgKbPX2CCugdkOcQ7dcRgmqtgWJZe/7J2pwcNz9eJCm4/LDt6D1PlWbNm78SPKi/WswAyyzkrlKc4OycoSZx9jYRoTp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 06:02:48.9278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2688bdfc-6c9b-4a99-798f-08de9ab49f3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

Currently, DDRMC correctable and uncorrectable error events are reported
to EDAC with page frame number (pfn) and offset set to zero.
This information is not useful to locate the address for memory errors.

Compute the physical address from the error information and extract
the page frame number and offset before calling edac_mc_handle_error().
This provides the actual memory location information to the userspace.

Fixes: 6f15b178cd63 ("EDAC/versal: Add a Xilinx Versal memory controller driver")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versal_edac.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
index 5a43b5d43ca2..18045f96610e 100644
--- a/drivers/edac/versal_edac.c
+++ b/drivers/edac/versal_edac.c
@@ -414,34 +414,32 @@ static unsigned long convert_to_physical(struct edac_priv *priv, union ecc_error
 static void handle_error(struct mem_ctl_info *mci, struct ecc_status *stat)
 {
 	struct edac_priv *priv = mci->pvt_info;
+	enum hw_event_mc_err_type type;
 	union ecc_error_info pinf;
+	unsigned long pa, pfn;
 
 	if (stat->error_type == XDDR_ERR_TYPE_CE) {
 		priv->ce_cnt++;
 		pinf = stat->ceinfo[stat->channel];
-		snprintf(priv->message, XDDR_EDAC_MSG_SIZE,
-			 "Error type:%s MC ID: %d Addr at %lx Burst Pos: %d\n",
-			 "CE", priv->mc_id,
-			 convert_to_physical(priv, pinf), pinf.burstpos);
-
-		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
-				     1, 0, 0, 0, 0, 0, -1,
-				     priv->message, "");
-	}
-
-	if (stat->error_type == XDDR_ERR_TYPE_UE) {
+		type = HW_EVENT_ERR_CORRECTED;
+	} else if (stat->error_type == XDDR_ERR_TYPE_UE) {
 		priv->ue_cnt++;
 		pinf = stat->ueinfo[stat->channel];
-		snprintf(priv->message, XDDR_EDAC_MSG_SIZE,
-			 "Error type:%s MC ID: %d Addr at %lx Burst Pos: %d\n",
-			 "UE", priv->mc_id,
-			 convert_to_physical(priv, pinf), pinf.burstpos);
-
-		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
-				     1, 0, 0, 0, 0, 0, -1,
-				     priv->message, "");
+		type = HW_EVENT_ERR_UNCORRECTED;
+	} else {
+		return;
 	}
 
+	pa = convert_to_physical(priv, pinf);
+	pfn = PHYS_PFN(pa);
+	snprintf(priv->message, XDDR_EDAC_MSG_SIZE,
+		 "Error type:%s MC ID: %d Addr at %lx Burst Pos: %d\n",
+		 type == HW_EVENT_ERR_UNCORRECTED ? "UE" : "CE", priv->mc_id,
+		 pa, pinf.burstpos);
+	edac_mc_handle_error(type, mci,
+			     1, pfn, offset_in_page(pa), 0, 0, 0, -1,
+			     priv->message, "");
+
 	memset(stat, 0, sizeof(*stat));
 }
 
-- 
2.34.1

