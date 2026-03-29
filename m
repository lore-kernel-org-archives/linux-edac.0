Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887136CE12;
	Sun, 29 Mar 2026 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774788252; cv=fail; b=TCfB8rkFbH6X6WFikZLL7L91w57DijHIpClv8HcvCPTbUr82Ry8/sZe1pSklQlkLHcV5cgIXM1D9DFag5dY6bxowLmwDC46oId9jsWIaRAe++1jE8uH44M5TVfDHmAc6NkJCzXlPQop14vioeBsEqHeokzWr/5MqLbA48hGP3TQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774788252; c=relaxed/simple;
	bh=ukO4zYiSDBXwuc46GAlhV7+0VHU3yFk1yFOFxlGNBls=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MHppzHFfExUZzaaXw11q1+dFkGNXro3CKmxefq5Zqx571ELlSyN53aImuiW9XDoobjAm9Yr7LNWCI8iWWGn3wqRdivLwXgn1NNxFn/a/VzFfEDv/+QDCroaFeudxJoHxoPWl3dvRwuXsVrS43TWXvPc6Lb3aJMDHS+QGgAJOQz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RODeYr/w; arc=fail smtp.client-ip=52.101.48.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RODeYr/w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZPzWa7xs+UEbtqMEhpgozN1BLVAGOXOiGeHAPRdTA+MqBWO8Oqo2ta3o2JMzRqTluFZU7eurulV9YkgtPF/lFl7pHmggiOLcwXPb4+48miPG++wmpNnivszJVaXN7bzRywXKcT+8vuta65LBN8CLgg+JJjF4LQO7oVjVL96oKZIJ0WU+Aa1D7z/CC4R7WDAw5VDj7pIVsw9Cv6rT2tlh50i4AvIhI/L1GasWfLjBl/ktVGrLnukvC1HPD4P8PjsSegeUzg2oqMvf7EFpeZKJaD3sPwXrkhG4G4THWBiZIGunlvZtiu8dUbR7TZ7iI0t3noHLUkliIz4w/7cYyWLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijr4hXIybc1iI4yTwf9mObiHYUUMtC7EMdK+/oNxevg=;
 b=RZk90h33bRYRsbEik7cmT1VLwDhEejjvuGz9eQOtNNnCFitHbIgOzNtlUHEGUbfEPEsbkwHRE+MnIqrcAOcALJyo7dkGdNIfD2/2alOUiFa9uFMNBpx70TmRYIz7Mbz9dpJq6yglLWWE/JlhSFq9myYfV6UXFFV5f87o/orXYtwXUD5QX1HM17M86dbHt/yeBQq/KQFESdyeEezAcfcVerYf5/YGMuqh1ne4EVwmQT1x2bf2cR57l8eysIuPvBGA5rzN05dWw3RHut3P/6JOfA1VPZ4G8s/vAm+wEtJWmhx7SKDGfBvOb0DYJbCQey9bbQ6wOEIuRH9dcn9rgCZo5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijr4hXIybc1iI4yTwf9mObiHYUUMtC7EMdK+/oNxevg=;
 b=RODeYr/weRL16m13c+bzo+BwXAjhXcpHKwV567J6Aaxc/z/+uBixC3kusv9D4K3WNK8R7sAPX2KwuwtVOkeCFmGz903npIz/LI8WsOeJ7OESVEEogsUQ0IxBcbZ4aE8j6bCpN7noBETxpTKg90pCgze03KVatrSTOVoIgGBEEfM=
Received: from BN0PR10CA0026.namprd10.prod.outlook.com (2603:10b6:408:143::21)
 by IA0PR12MB8301.namprd12.prod.outlook.com (2603:10b6:208:40b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Sun, 29 Mar
 2026 12:44:05 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:143:cafe::79) by BN0PR10CA0026.outlook.office365.com
 (2603:10b6:408:143::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Sun,
 29 Mar 2026 12:43:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.0 via Frontend Transport; Sun, 29 Mar 2026 12:44:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sun, 29 Mar
 2026 07:44:04 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 29 Mar
 2026 07:44:03 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 29 Mar 2026 07:44:01 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] EDAC/versalnet: Report PFN and page offset for DDR errors
Date: Sun, 29 Mar 2026 18:14:00 +0530
Message-ID: <20260329124400.4064739-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|IA0PR12MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: df9367aa-b760-4390-98f2-08de8d90dca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MnOopbjzCXKR/Xhh3fwphqfP80KIGtbMfkvTTiy8BqX9WR5brwY4kbkGmgdHxgDlMNcEThTNY7L5+hEAKnM4BjfMItwYUVO8rsUPXBXTV3QBBxIb5+g2LmNetKaz7EEKk6DFp+SoogSImq4noVhBvY3Qvv48LNmkkDlEIWV4xRlL8n+nssCnEprvSCPMM6qTw+4HZCz7SkcZOLDbI3SO2ZUHLM6kUy1dgAjNY8/UK2/QhPyWdvyt429qcaJpMAPr8sN78rdUiFrVNGA9x9LNQfaGyPbSV/tbTAjuzY0ExDyw66EtuTbWmz3WIYMQXCuQDqjsycvPvMQ7LqZaui2BdRjAocNKE9Z6Tj5ZaSVQKQ+0vR2XlsxxEtvgQrRoCh51JjiGzkxwZJfcgBkjz9dDZ0JRS6lLqVkaMas2BgK+ZRsMw5o97Os0WwhSanbpjary8Nohmu17nfMtJEVBmHHOCpWNxm66pR/G8bz49Xtxqr98AO4lFJ14eCYwaArd7s6USOH3L95Qfwt0F9txZQT0yX5AsAPoBt1r7gIaF9MIw7Lz1n3eZzKEqnK/fPkRSLkXyDXSmm9mE55+OofTcqJ2C6MglDfuMc0MHUfzoeBRbShFDQ6wKjD0rm6zGX/ykDf6+cTRIeJ2yeH2Qg42rtvx3awNCYBOH+fLXtb13ByJGWW9Di/ASbH8+cccC7UggFVkNiqzLyS2KjBo51CdCUS53jG1AMEf2ew4ub1sk935t5WX5vQO824SB7+FWYRaBhIxNVSx4pcyz9d1jq4upa+8Iw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yo2d1XJ9czW+En4WnINYBOxFx5x21c+LeoGOBj4XUJCBZqSuEIhjGD7ukbU0E8YOyUJt8ddUX+2i8V38xYgy3KRwEPlrjzICnxUej2SIKxywkmmr/8Vy7BcBDkT7Uu4OFDW8F+ht7mXIT+Se0JU2pxz1qlyuUFZmaDajWPBMn7P7c2c/eY3X8cdED9hPpyi1AaKec+HbtqlCwyc6K/zV6N0lPQPNp6JxpLG+r4ek6avzh4cAiO249E1EDQ5p+6+NdMJfyFtJT8XWbPYhBhqyZ/9IJh4b/z6q/kV5s0MYhzjDQ2pZeE3Q0LN/ptp5kUGhe9SFttRPu+9TBNyCxt2gWTabhLJjswUp9KFLiHW5QTQwuLmB3JZknnjCKeuthAOkdC6b7OdsLrDXfiGzp5R8IpP7JD4yxSHsb24vYL7Wqe4WLfX3UybHWnGzSPEHat03
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2026 12:44:04.9243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df9367aa-b760-4390-98f2-08de8d90dca2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8301

Currently, DDRMC correctable and uncorrectable error events are reported
to EDAC with page frame number (pfn) and offset set to zero.
This information is not useful to locate the address for memory errors.

Compute the physical address from the error information and extract
the page frame number and offset before calling edac_mc_handle_error().
This provides the actual memory location information to the userspace.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 915bcd6166f7..66df090245be 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -431,8 +431,7 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
 {
 	union ecc_error_info pinf;
 	struct mem_ctl_info *mci;
-	unsigned long pa;
-	phys_addr_t pfn;
+	unsigned long pa, pfn;
 	int err;
 
 	if (WARN_ON_ONCE(ctl_num >= NUM_CONTROLLERS))
@@ -442,27 +441,28 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
 
 	if (stat->error_type == MC5_ERR_TYPE_CE) {
 		pinf = stat->ceinfo[stat->channel];
+		pa = convert_to_physical(priv, pinf, ctl_num, error_data);
+		pfn = PHYS_PFN(pa);
 		snprintf(priv->message, sizeof(priv->message),
 			 "Error type:%s Controller %d Addr at %lx\n",
-			 "CE", ctl_num, convert_to_physical(priv, pinf, ctl_num, error_data));
+			 "CE", ctl_num, pa);
 
 		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
-				     1, 0, 0, 0, 0, 0, -1,
+				     1, pfn, offset_in_page(pa), 0, 0, 0, -1,
 				     priv->message, "");
 	}
 
 	if (stat->error_type == MC5_ERR_TYPE_UE) {
 		pinf = stat->ueinfo[stat->channel];
+		pa = convert_to_physical(priv, pinf, ctl_num, error_data);
+		pfn = PHYS_PFN(pa);
 		snprintf(priv->message, sizeof(priv->message),
 			 "Error type:%s controller %d Addr at %lx\n",
-			 "UE", ctl_num, convert_to_physical(priv, pinf, ctl_num, error_data));
+			 "UE", ctl_num, pa);
 
 		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
-				     1, 0, 0, 0, 0, 0, -1,
+				     1, pfn, offset_in_page(pa), 0, 0, 0, -1,
 				     priv->message, "");
-		pa = convert_to_physical(priv, pinf, ctl_num, error_data);
-		pfn = PHYS_PFN(pa);
-
 		if (IS_ENABLED(CONFIG_MEMORY_FAILURE)) {
 			err = memory_failure(pfn, MF_ACTION_REQUIRED);
 			if (err)
-- 
2.34.1

