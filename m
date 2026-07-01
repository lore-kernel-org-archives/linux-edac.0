Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C03EDE68;
	Wed,  1 Jul 2026 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899460; cv=fail; b=hQuMKdsH+7yE8Edn8JaJCSwC/uvGPz5NsDs27gp8c2xAmTJdUR7MJZKAThiZDFAnXtHfO1CNQljhzWSY6fVPgLk7GQTWiQASAlzH4OiGp6ojvR6OHjL/wyGDlyaAu5eDCaoeyystH3sAxBYvtKZH3lbUcoY985FqyIpWRVo9r3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899460; c=relaxed/simple;
	bh=VYtxDHkHZOoSsE/SbWWCMWMBnIKxGJYjbIc5ZT/Ukc4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rUL48rjmNBUU/5eGavQ4Z2j1VZ4r5D2mw0p4zJGEFDeVIWy87TkYh/e/inTQyBvXTP1Bw/NwhjkMFKbf0k+4X52P/cp5Mhw/vfuPPadWVxtEq7EDFDHkVgYwxFn30hErJRPwlWl+SUBVa12iiA0Z/2eWo/CBZBlJAbMb3AYAZxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pQewe5xW; arc=fail smtp.client-ip=40.107.209.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pQewe5xW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ad0y6roCD4zEyqxzHxVjoKRkYDrouVN968CCxEue9LF0xyJTjLHcbptjFsyiKTyi8JetqY5rVTpegC/rhRs+JlBGgiDML95hsxhNfM9aKnwVP2hP99EZSSG4K0lduwS3YJCbOtcMlOiJEcBfV5has8/C3oWYFZPJRpHpMLPQaDi1zICXvAt5Z7fFUh+uRLTWEGI9miDN3tnRZmQT0Dd0Sn6HvFAK+WKtnPpm4hdIYDXHteg9f3tkQ2Z5rnNa6KRJJygRwDXMEBlAmpO30mGfutdlmbqjpoYhUOs62/1atZciHq1jGapAjUY2i6OV6UU0AjU+88xkuEE6oEZlDWTBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsaF7U6QXASZX3iaiSRiVvAgyWTZkEtyycpE/4zGbOQ=;
 b=Cizapt44adCE1UQD17OjVd+xlrVLiH48+lb6hjZpW4+/awx2E3l4bTc/0RaKbDPW+j/Mz7ojBIPJsa3zIW9Fg7tggHWh99PYly7qInYeB8Od6+PKQrWcOhqK0doUeMLWpWE3UnaGPf2p/1R77q770aR7Q3yRixkIajQNydHYxPq+w2qzlQWZgC+RQeCJg97wtug0mwuU/1qtkZbAKGMAEgS9NnPo9mjhFmi72602tQR7JpEIX9po7fHNZXPL+LAhnQD+VzBXAoUs83BC9lMsAS1RtE+J4Bo7uP+ky30MFgh23YqN+LZwaeLMfYy0AAW0SD3iKoiIhvxht0wMV5nkmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsaF7U6QXASZX3iaiSRiVvAgyWTZkEtyycpE/4zGbOQ=;
 b=pQewe5xWdkf7g06prC2qBlS/Gu8kDYRvFoJ7Dq2t934cyxC8Cv004PrUbKKBqa4Re3s0tUy6PhymnZUEFld+mt8a3UnbHyxUhctKbdRekMZBmgMruwFSAKjm99lQOQqDRmeO2aRDwwEuk9I3dQEwFTleqiCsNKxkP0KkOWTKw9s=
Received: from MW4PR04CA0192.namprd04.prod.outlook.com (2603:10b6:303:86::17)
 by SJ2PR12MB8160.namprd12.prod.outlook.com (2603:10b6:a03:4af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 1 Jul 2026
 09:50:50 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:303:86:cafe::7c) by MW4PR04CA0192.outlook.office365.com
 (2603:10b6:303:86::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 09:50:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 09:50:50 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 1 Jul
 2026 04:50:48 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 1 Jul 2026 04:50:46 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] EDAC/versalnet: Pass flags=0 to memory_failure() for UE errors
Date: Wed, 1 Jul 2026 15:20:31 +0530
Message-ID: <20260701095040.4139675-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.49.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|SJ2PR12MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 360c9f0e-7bdf-4d51-0bd1-08ded7563bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|11063799006|5023799004|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lNrr8McNXCKcw6vjoNE71buy9WxU9E08tYDu9dnrP1+cHauHxXz1lvu4hdN96aiGS73ux6ZV9el2eLbi6ap131FgrzHJ6LiQSydSNfSz+AUuWnlkYRJJhlO8Pw92DMX6XvsAcP9jdEt5+CnutwU7FkHi3wHsju/X/rnTXvWghQHyMCu/3zExNwyAuVm0bKCOnMMGTDN4PQaKEgsBoE+iHZoqYMrarfd6KJEWol3Z5KfonBhWQWS5TipiGW49J5wGWulLYEPUnIo0YfrwmMTGooM19eApITfK9dzDKKgTIqGqfv6ga6UHXTTlhSspXn113iHIT1CyMP/JlhzU3vjr9ZGUMZ6ors8i0EqkARRjRjdIvoWjodOt9C3JZzy7UbisMCrtfpGa7QgOECX35pnEEhrBluZUTDnNkbjGvjR9nWRXt9L+qCPfjQPDqukWOgODmP93tueV7UWLzJMzvLD3KT5GfgnV3UOquTfPfYxRB6TdQCXW3yRqEMHS17T7jdF5cFk7X9iqz7JgtYyFT6veCjfDkrVuVX9Pv/5B3MH8dUdLBfJX3BsfA/PqczUc7ygGO6K9QzMI+M6oZkSAlbxga9AcipHtJl1IN5AXOTyyymEasRcK8vw7HByeB/kTa6A+V6mR/KlR2eSCaPG2Ko1bBaB4jfd1XJxEIwTdvxMgOBDz8o0MVsDl4Ac89h74m5emPPNcAB+3SISsTToeC5q/Nw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(11063799006)(5023799004)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x7ViySFpuV11ggOoeqC9u77ysqKBQc3C6A75CxcmGNg+pkGlyk8NwxgeVtpICo3+hEJPwEh1zBk9vc2h7EmwdcWtoZq48KNcHFnLu9zk/oZKCRK4r4VO1uNisaOGQ4SCkmnzl6Se3g+LR6G9ofvuwLaR7BXm69zpa5gQWIOoIXcdtqba2Vy4MPJvblWUsWw+3tbJm6KFw+ADbJENMnU0FxfmICMM4qkh7r7rP8JH9WGPm4DcXLLAoIoRQfXi7s6GpgQXy/sTh1R6gc9B2QuVcJ/xm78mD5pwqbrgWaavZmR8pagPW+k6D4UVrQYTjeqIi3w9swtCmssVAExVEFuFT0tKUX7Yn1X6dRQq7suazahAJvAxx4xeSW6dQ0G1vqyiB1f+b1kYfRVi8K2ScrnpRhJXS397KPBV/sI+Ggx4Vfb0Cej88ZKQqje0ioif7FlE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:50:50.1497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 360c9f0e-7bdf-4d51-0bd1-08ded7563bb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8160

The MF_ACTION_REQUIRED flag is intended for synchronous exceptions
where the consuming process must be killed. For EDAC-reported errors
discovered asynchronously via polling/interrupt, flags=0 is the
correct choice, matching how other EDAC drivers invoke
memory_failure().

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 97ec05d68bbb..d1af5e175f7e 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -464,7 +464,7 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
 		pfn = PHYS_PFN(pa);
 
 		if (IS_ENABLED(CONFIG_MEMORY_FAILURE)) {
-			err = memory_failure(pfn, MF_ACTION_REQUIRED);
+			err = memory_failure(pfn, 0);
 			if (err)
 				edac_dbg(2, "memory_failure() error: %d", err);
 			else
-- 
2.49.1

