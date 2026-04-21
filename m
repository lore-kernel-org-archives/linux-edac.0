Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011052.outbound.protection.outlook.com [52.101.57.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4CB3B8BC3;
	Tue, 21 Apr 2026 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767536; cv=fail; b=C1tlP2SEvXAGakxKE1LGsk0WhdgPT3StroqcHyRx7Sm534BGgCFUQVLgFOlgcCsec64B0Iqwo1E6VwPfmyQdp9y8XZyhEPlLIhF56IcKMVckzPJpCuYOfFTwER5ucIiesZgo7FV/PU57Finw5rzgLoAtm8Ssqd+xf0JNvDAbKPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767536; c=relaxed/simple;
	bh=ZreI5cWJ0Gmigo3lf4WNoYvWtD/UHzep4MGvsGVx6qQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TNM3KHLvN4MBpnfxDxdoR7CKlp5goRCSbQp7OU647B2NHKX/uIfE/EvhH9Ij6boAzuNL4pNmRLTI2ZB7qe/dTkFQRg8CZOJL1OWtLbk19mzV3u/kVKAb13A9Bi/gU2XJSBzALo50JnYAUN0vmhLRIf5zWGhrm4ZXkRO2XEgZwbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EFGWMyWx; arc=fail smtp.client-ip=52.101.57.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EFGWMyWx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHism4X0j1/17GLEWSsaWBI8YIi1m9DF87TXI+Zo9nff6TJPnB/wog7iZwHUrDJZQQIOIf2fudn8GNRZ+mEpsl4e6KSpA6GgA5PT0dJkHOMDPszWOV7nXGqYTeHgVf+HMGkcEsz//q4Uqn6CNunYbTbseZHYKMLR2q7J8b0mhLvEJCtqfmxLrmVQaW/VhBXggMpAz0VC0+yv7NsTbgo5/0gG7FZHKev41YAhDHexcIdQzr7IQzEy2WROSqkW9L9kh+KOXCeeDaBVAOOryaJ9QsqHTaoDzrxMvgyiphcunwWEJC91XRD9be8WJ6EhgQQpNDJFB2OH1/UUoqT39y0bJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4GVh04RUMztXX49i9h28Ot6qkdIyqMuWLurZb/R4xc=;
 b=apGkozjsNwZwkrMmzpC/h6WrsFYti+nl8kY0dTZ9G9q9w8Q+IPeK6+wfocBq26X0jjkuKT37mHQchczTJn9m6X5yQUlblYEfO+uyn7DdQyrjaNshoQoxkNJE+kZs8KRTjO6zpum5LEFv4iz1b8i66x+u471P0WtvmcpwS1MVJYjMJ+5JwQdeq0XKJ9kDOHmqIVvIABpiPGEmMnLQ6eqdHqia3ebkl0+zMUpDCkWltvHlX62e9wyXhBtaEzH9bmPtTx0MwnixMO5cXJv8gYuiOJw7EYVSmHSgfevs0GH2/tR/FQsw/adK2e5D5pQ+krLs1tsdzT4q4tEzGMTciZO+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4GVh04RUMztXX49i9h28Ot6qkdIyqMuWLurZb/R4xc=;
 b=EFGWMyWx1zSFumkPWe7cYARGcqMIP97jf46ZRezKiahNbQNfd3m1tTtpqrBlU+ckbKDKSDj1froz7Tt8hvvBRHuzHD5RuDmzhZ8yLSFQuxEIf6WBjmaII7PMfeojM4Uos8HdcKVfYtH1dFuZP79d5gBczn6+PyUpztmFOBft40s=
Received: from SJ0PR13CA0170.namprd13.prod.outlook.com (2603:10b6:a03:2c7::25)
 by SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 10:31:58 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::c0) by SJ0PR13CA0170.outlook.office365.com
 (2603:10b6:a03:2c7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 10:31:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:31:29 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:31:23 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 05:31:21 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] i3c: dw: Add VersalNet compatible string
Date: Tue, 21 Apr 2026 16:00:59 +0530
Message-ID: <20260421103059.2484623-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421103059.2484623-1-shubhrajyoti.datta@amd.com>
References: <20260421103059.2484623-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e51a478-125a-466f-1f22-08de9f913744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0Bo1BpKjyAsMJb602D1SaCzCLh1icKBNU+lEAhSOrdsJrnfQHk0+uHeTznB7UNEpGqCzjqVbII51hxv3BT4Ij1p5SHY4TlKF5E+BWRDLwxArfZniLMk6T9ghCoWwlhbNhsrEsEZe2nM/ORgfexevTRosSW4bCj80WYnuLyJTWE0CI/d7Ijj36HsKVhV34QuXL16Mp3AfWrL7idPfCfntRruuO5VAODASDIZGvMoOPHg1CKe6yHbPBWArE2/Msy+MEsxT4U1SGwC2v7+H47jSKEApQMP53dVeiKgE2eDx7S/parjIcPSTHCKRYUE//rjbWQ0XJOrCpBylkPIlfD1BQm5H/N+OHhmfnUtheITp0ia9/+nzSDB7GlpcghONGAKYuttMWcntA7WeSWjAHV/nrUqJxeSYz29CYvOjBPhEKDXKvYZ4wBywX2eU5FgmdSGlQ100URpcptK5GEVZ7w9wOn24YbVZwr6RbYH7KSf1hSwBzS/NzzbgUacwuXUry36FlgWN22vU/Kui+l9Dg3OQFaUS/SPw9HX4xeO2zHfJg7/eW3Md9RqBqeCsauZHYhBtavSRm+iKVPP/Vwt/H+xG/E9PFbSu+zTsyoYsU9B7iROvCBIbg1+z4ErOMvvgQZ6gwvv1sV11IHqTLBsvwYdnhwMJY8+PC/ZcJTOQ7A5iqFLq6tmzT6CXY8ckOu2fFfN5YB6w8EYEtnk2cKKwKuyRNYpSoQ99pipvFB6ba1nnbQ2AiPv9fHvFrjpXEz1501jOvS+qmcwotP3WksYhOsxueA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q03FCLC9ZwcvY2wYHAwAE/OWGlDHKei/rClmPWXQnCrsyaIXtD/fRojFPl5dUgfvyM7AYHU630IISvPZ5l66gBA9MpMEqyviDRhKeiucJpIU+PIYbrto2ueHtpaiRHoOB8ig9AJrHDBVSKRyvt48yRmm7y1pGaAe7EUQW9Sst5btYrf5sx1d7zX86eCwlhc3VWAEHBqMVAD9OnwnxQ3DRrA6zVo2tcjtHFW1di0I7bX3Iz5tCkVKZ54mT/2O1BuCsuj5zBgaN5f6HBPMsdjUsvEwsjGGnXiuJdaQNa5eMdHz34FGQBRK7stB/H3GGxJAvDrGBglUbjmzgcSl4PYGNpWvU1dhH1OnNDy8pexaQ8461VJqhJIAb7npSfs1cBjfo8y+L4qSBie2C7a2Q4OGir41ZTWmdItd6PCDCcauV4VGMyGqOl2+coI5QXeakEk+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:31:57.8381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e51a478-125a-466f-1f22-08de9f913744
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062

Add amd,versalnet-dw-i3c-master to the of_match table with
snps,dw-i3c-master-1.00a as the generic fallback.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/i3c/master/dw-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d6bdb32397fb..69fef7fdda37 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1845,6 +1845,7 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 	{ .compatible = "altr,agilex5-dw-i3c-master",
 	  .data = &altr_agilex5_drvdata,
 	},
+	{ .compatible = "amd,versalnet-dw-i3c-master", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
-- 
2.34.1

