Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88B63BBA1D;
	Tue, 28 Apr 2026 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372151; cv=fail; b=ggHWOajBY50hRGwP5zfRK80fJ+uOvH3dO7WTFckwhster7mQKVhAg0eJaSj2fO/uoUj99AUfmqE2Vfl6+PIxr5inz1/ZFko0t/N08lfmnFVGEj2YOuHEryzAzLqlmhoVi5wSM++uZP1+FuT0Cx39hJbhyFdw29PqgjjmtS5+bvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372151; c=relaxed/simple;
	bh=23fTR9w241nIn902IWJNKMj9aDLwyReg+CzxpYJ8rdo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aAjNJB+kmKZ5YKOQ6P5RSF6CCjRC/r7Ese6ixRsu8EuXCafHTq+5ARuP2eQAV8GetituysrdwQGK2FM1y1axADk8MisNKJDW8PnPZYmb7CbihWRFYLnbGBEnWQIoqBItoAp31ecP2GTKa06nBqYcSvzVLx571m5SawP5D9X/jlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Cv/K3isY; arc=fail smtp.client-ip=52.101.52.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Cv/K3isY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAYcfncU0Gk75yhwnkqwTQTacDyro/fVHUGMlmuSHz7OJoD6rSXK6vi7ySB9mZPxdsokjRLz2UbEuuz8xoUIPu7JYjCXqwZdG/VTlIun1ECMlfn4QTEEgrU/8HrCOFxtmoIDsbg+N3TylTZImTLrtMvqnC9uIj7BlnMFl+mQFbjp/AW+aB8FWJOp8rfctLJtW86+MbGq07xS+vNkSr/XvPXCPhJrp5x1WYc7/ckh4nNN23RwLLXeuGYuWosWpXdrrla0Fxe1rmahgCanm9CwBJBXkQBgkMUA9J63ovRN7Yi4KRv9TKwcCTXlDyiSmQk10hAglmm7AyZKKLCMBALinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coOInwbNkMNpzpTc8eSQAqV3SLTVvpbOHI7NaQ5rJVo=;
 b=Naxmgi3VwZx3nIlpxYG2ImqJu0lbgJCsWig/X6TK0I5hT4P1P4+1WvWpyXgCVzPaFP8TufyPGasKcxCG0Ds74k+id6DBmaSPtM+UQeqttC6H5f6zoEaXCZj9KVmkhDDf9kZP6fwIxIjduHvBlhNSc8et9ijw+vTpq9wrfwGa4vYXtr2y6egGkZdc2omPfhB/LQ9W2cuF+17dEyegB4grJy5pds0rfnMh919G5H36BQd/F6yRanTCBJkXplwdG3lHKGCPvEituofZtci37Uk9SxuUOGVikQ2kviQ0qQC8jBSgMejz42pjR/V9DHD9hdcyhLFJQnzyCs9dNNW770L1OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coOInwbNkMNpzpTc8eSQAqV3SLTVvpbOHI7NaQ5rJVo=;
 b=Cv/K3isYVW2/1EzY/GaIqlSctcJ1Rpb9qh0Pykt6ZjKG9VcXQx3llAXBuiR0PWXSSxZ+VJbrdlrxZ9txVqlRTPHZ0JAV/V+q9YT1rr0X1+nPErZI/8+x0xsc4pS11xQxmpkXgtaaMe9Qw3Hr48iu5wMc9+V3lHsB6DF0lFnEomU=
Received: from SJ0PR03CA0249.namprd03.prod.outlook.com (2603:10b6:a03:3a0::14)
 by DS0PR12MB7993.namprd12.prod.outlook.com (2603:10b6:8:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 10:29:03 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::fb) by SJ0PR03CA0249.outlook.office365.com
 (2603:10b6:a03:3a0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 10:29:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 10:29:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 05:28:59 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 03:28:58 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 05:28:55 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <ptsm@linux.microsoft.com>, <srivatsa@csail.mit.edu>,
	<shubhrajyoti.datta@gmail.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v2] EDAC/versal: Report PFN and page offset for DDR errors
Date: Tue, 28 Apr 2026 15:58:50 +0530
Message-ID: <20260428102850.1372502-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|DS0PR12MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 5231ff52-bef4-4577-137b-08dea510f7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xxOMIjgcQKIOVhA7myyN4bVeY1KsJKxsfrLXa8siCDiWqdikBtpvBdUjhzVsVakxsqFk1lHij7BSvhktaPmeon2e4qDPdhI1dS7EWLcbh4pDXxO1deG197HgGk0Idz6idQDF0Fc2KZ2Sw/mUzyx0Kk8Xt/q0CU3YwoY00xw3N0QV4OlhuHgUcCFjeiQbP9sav6V5cUve0XI9WhiI6J7tLfUXqnG1C7Eme9N/4mPAOyI44ta7kEbjQZCie1AcAjZSkYMIAeVKAbw6cq44KXCuR/kPV1o7d2w4q6ZMMLAPb0bS1w3g+UqZWzg6dGW9uP9qWt9C/1gI7EXaV8hNc95f12+pRXBBckkjH1sh5V0tHq2A1fRroa7L6qolCCxDscUIUZCwXnTYslfX/AAj/B94oOzM7ceP57a/ald/RjCURdupfu4k0zs2QkGpjXipqLY3U2SzRXnxO3/ih61MnVN9Pb8EYUE8cl0uqm4R4nAH4hspXXbww5Igfi7gm8gTtYOslay4jOiuS5w/fa7ccGcg03WfbUSRNV7oL1SU3b7Z9MO7hiDiYl27Gt3kP8SQLhO1jveQTyoi24Yjkq66ZHSOqPIzrApd5lrf5tgp9XGNc54g/6Q02PMQyzUwVPFOyRmST+2+AzkvZJyqduz7Im6/cCv5JMhWUF3GI/cF+D0C4cb+hOcETvmIlQCz9xzI6FPOeRZf+st4lAC0pXr+28FOeSccgMhCRMEWqIHcV73xiqpuHwJqo/aDTj1+/mwJLwkuVaObyDz0CRVYAU/SczBucQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y+734sBZ5mqD6GTbWamNCHvjYG8TCltI8ZlKypO0lenC3VgboySjYJh7+9+I3JNANnZif+lMoogqfMV/EMi6cLzmVXFLIzGnmjBxAJLR12ezbSmdcZH0JZrSHJixBK1UX3CIC/4wLm8G5XOn+cqs6RCGOH2BDFtYFl5yR1nGxUyTD4haxlBab+hRGLM7cu1mhU4/wJTofmWzWixRZhBDJePqvcqbf3p8f+B2OGWTcbRSC7LJ4Ts+lqNplW1pYE6awd99ZSKIvNqOAxKpuU7IDd8cJewf3vuYK1j8cZ2T6kWN0DV+4T/yWUE6abIdE71XhRx9c4lktdzfHngLC8po44zARAg3A4P2APXjgZXw5XFnucxu0762JT7SVJeFLvquP2FgMY1DmiSUjfg3IfKjbcskZC9eMozmee9d0d1ULlCv4ruRvQKkr+WBqJE7d9uX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 10:29:02.9995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5231ff52-bef4-4577-137b-08dea510f7f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7993

Currently, DDRMC correctable and uncorrectable error events are reported
to EDAC with page frame number (pfn) and offset set to zero.
This information is not useful to locate the address for memory errors.

Compute the physical address from the error information and extract
the page frame number and offset before calling edac_mc_handle_error().
This provides the actual memory location information to the userspace.

Fixes: 6f15b178cd63 ("EDAC/versal: Add a Xilinx Versal memory controller driver")
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
- Optimise the handle_error for it is not called for non-(CE/UE) errors
- Remove the extra else

 drivers/edac/versal_edac.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
index 539b46d4f610..5e049cbb3e9b 100644
--- a/drivers/edac/versal_edac.c
+++ b/drivers/edac/versal_edac.c
@@ -513,38 +513,38 @@ static unsigned long convert_to_physical(struct edac_priv *priv, union ecc_error
  * @stat:	ECC status structure.
  *
  * Handles ECC correctable and uncorrectable errors.
+ *
+ * Called after get_error_info() which
+ * filters out non CE nor UE events. Therefore
+ * stat->error_type is always XDDR_ERR_TYPE_CE or XDDR_ERR_TYPE_UE here.
  */
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
+	} else {
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

