Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012009.outbound.protection.outlook.com [52.101.53.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C4C4156D1;
	Fri, 24 Jul 2026 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913600; cv=fail; b=KStAkmFDpuCBB9TOim8xEPIE8sQFlYniIzUtagbbftMJ4XUXcSJqetKmPvKxEin48lFmTg68mGHC3suQzjI2YSQhyAMAX+d5+rlPYsEo1Oc7XJQnh2eKnw87S3mFmKMdJHf0aAgvG5t9YbqgpSDOWlprwhri3Z0ZRrZ3NcTNAoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913600; c=relaxed/simple;
	bh=QeaF5UdfjOz2SUB9MwgWOCC6VW81rhHr/gC5dgLbVQA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C0ji1r32gHldYKYYhLrHr3QBToKNTfOnzURDSobjYj5LiE3ePPrVT0Ah0+NdyP0E8z01CqMp3R/YSvIPgFcDPGcdDlVBTG1HHXTkjajRoJk686nD8xI8OCdzvZb2IPAw29K8JCZDUgxmkjEgbm3T9fb7M1+nI+c7U5VMqCdNKAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CRachWqA; arc=fail smtp.client-ip=52.101.53.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CRachWqA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSxmb3DJK20uyZzxMLgnJOAKAusy7qQQKY9O+euoHGlm+/KUbjxaORG5+PCQvHPOEj84MFP3yv8mo+y8Ip15oKLb3/Y44flnAv4U04DQFPsIAzc0ESkQqsVViS4EsZqcDaPaGJc5QhluM2NgEgNMoty2z/WlTQNyK1gXskt4yjYajkSSX60o5l2LymUjmBMQvK9cf+kFj/Pqg+KP0C4BFh4dLUAsFL5yksKeZrICikugk3y6MoYd0coYGoYjbFht0UI3FYyPHK5Z6lJMxRAOmTFMKqyHYkV2g3Chn1Divjw2fB/zfcaIob7iDH1Mu5tE8w6e7xdXHuKG7kSUbLUR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+N69rB0x5bc9v+iS/VlU143uYpvZu1DlRvNLL4AQIY=;
 b=LqMm6nMMTX/nF2WU/f+pTqG4HfIRRkQED6Lzh1Pw/0M9TGXpWElqTBib0wsLmccMNTWjjmx6SI27aWxk4EJ8L4fA0m9j6PiNC2livsHVATEzS1DYOIg9XQWNEbhJajYUN1uDCrKJgKjqStb4mUWPrkZpUHE7b6LhthzlKGpJcNENIabRfL1BJdCtuVwlct7ouKXRc4LYuJNj1fjgFhPLKHU5xAkxLO8PE71OZ8ozkQulA6L5Ow+vrQ5KLKcF2leW+9pgjjrtdDSI57bIj8Q55L/PfyZro/whjekj9Tl0MFLzS6uj7MFWIlmNsEfPj1K4JaB0wWmSr0Cj1QCShYj4og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+N69rB0x5bc9v+iS/VlU143uYpvZu1DlRvNLL4AQIY=;
 b=CRachWqA4hwjtbyS8p8qecuZFv2if+hxRvsb7oe0oikFvTkhkHVeZ0znXM0rxq9W2wjtwKPVkvhs8vK8bUgUv9Pgv2oUncgr3GGlEhQ0IfZK8Csv0IwodV3nMUhlW6kLZ/goPtLP9SZuuKb1D0AaO/I8bJhnU3GwGcy3/powg+E=
Received: from CH2PR15CA0006.namprd15.prod.outlook.com (2603:10b6:610:51::16)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 17:19:52 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::50) by CH2PR15CA0006.outlook.office365.com
 (2603:10b6:610:51::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 17:19:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 17:19:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:19:50 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 12:19:48 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/9] EDAC/versalnet: Add NULL check for mci in handle_error()
Date: Fri, 24 Jul 2026 22:49:37 +0530
Message-ID: <20260724171945.2812749-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: d147b1ff-4604-4ee6-3be1-08dee9a7c5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VsLszP/MUILfWb1FEl9C69Z/ZUUiK9gQYjV440MC38OPNe4AcXvCzgSy+FIL4DFGrQCyRuEa8ewoZKE7YtKvQ3fd06AMSPE94Fu63VS57cycAdnpholraBWKZvjmYhTXZkxhL9h32qe2VzivxA/EdZLfQhXer6/Z5Ebi3aibxJ9H/ZpQFEIMiRc20lbaSrCkVturueMLdGg0u9kAXNIWdDTRVmWNULK1dnqk91/OEPSDEPlxDh+I/8RrFggLX1dbgedHPHxC2kblKTCHjG/1yGfCaf/NXAZsSvAdMdbjMAumGei5mVjkb6HH3v6Jr/PSAws8/Ux4fEkuPRoace3IKgePirSgerMJN3FKIN+UxEBUOIHra9/QqWatn05lzG+VYbyoAtBrNlktepZ5U3wl5nwflg18ElK+hnp8Ki9RPtAtZDl4vzkdYej7R4Qr/I9DZt8XQWkH1pmLKOxZs9wzJfdhyDccSPI0H6+TUjA41LsSnOaZSQF/B9wt9GPn7s/6K/dEmaN8ZM7aaAz1jsbIfQQkvpIRa0wsIXhXnbK7rZgV3iN+m8mWba2Tu6C90Sq850yFDXjn6/+uZHyNMnLIbeJZ8YQNdb0rwMqjHCdky/dQ8ZqsrFCFLdcrR+sXAZ6J5ZmCgLId8lEII8kOEI044TjZhAT6jF3WxilvCyVFz4nE7yh+vNDC8OuFrp4euNdJzSLbomqyYIqrLA4Bty+zeg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LnMlzRLurjp3e65O/Rb6j8+js0+6uw7L/32OCwKCjI2j5dvL6LalEewNaPrSHhzJfHWUxqCotmy7QgGUWOIgnyeUwTQTqPPVsAWyHCPFV/kUX4ndFMtQxMeLDHfH5MqUHKvUlDQ/5l+66zVi+2CFO9BhMNxn4hNGPObbbKGvx6CfDyCwisIQTGQZbk9igvzjhdeWDsihtQ2+UjuEoOgXJvwvwUkFvGGdFWf9BSWd2vhDNkCBSLBzIrcQOXrXZXtX5416xy40b15kiu6Lo0GBS+Uz8eST3sz3nFbwi2pRr+cFxh8RO7g8o4/CAbUSJkXbp8QJLPzNAER4V6GAKx4+bXEjFt1Gfn3x8Y4alBQIwNSFTKx813b8GH0y9VF8owjx3aQkZlCRjuJbtWgyWUo2Y1hZc4l7TQNKQ0jwcy9+IQB+eSVwVlx1/36cPRD7IuHN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 17:19:51.8453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d147b1ff-4604-4ee6-3be1-08dee9a7c5b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275

Add a NULL pointer check for mci before use in handle_error() to
prevent a potential NULL dereference when the memory controller
instance is not initialized for a given controller number.

This is added as a defensive check. In our current firmware
the event will not be generated.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index d1af5e175f7e..316f8f79c4d8 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -439,6 +439,8 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
 		return;
 
 	mci = priv->mci[ctl_num];
+	if (!mci)
+		return;
 
 	if (stat->error_type == MC5_ERR_TYPE_CE) {
 		pinf = stat->ceinfo[stat->channel];
-- 
2.34.1

