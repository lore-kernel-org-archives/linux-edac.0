Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013028.outbound.protection.outlook.com [40.93.201.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A945372EE5;
	Tue, 17 Mar 2026 18:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773772505; cv=fail; b=lTjPmaipx/mGy5y0cDMoDcp3hvCD2VfEp3jy221GRI016/aSKBI8Ep7MvpcWUZY1rnzhYv2kCuvHmgQPgW09tb2cwbuVz1jTL+oLZf5kDtFEA99+ZjFjXOdlDjVFPHuohP0LLKh0Q6IEecNouYF2VXw/1105wLb3Pvkh366JmBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773772505; c=relaxed/simple;
	bh=sTskd7SC2yvsryYXaK7YOnpKI1NaJaizz+Epsqw4eHk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PxClxtVavwgzdaXsY9PlC89npRYT6orm3NURCDMAwWkj4KlyqpeZd3AtYIK6zp8nr1vRzQKrCqaSWynC77cmwYofb7KwbdXrrRCwr/CqsJUc4GPy9Ws23n1iExnsstC4KSsFpWGEctUBaKYx00mdWkHSUys5eKE/8jXz5aCo5/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZJczt97x; arc=fail smtp.client-ip=40.93.201.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZJczt97x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkirtW2C+BT5KYHrcm39iWev3feayLASSmmXUe7xyBElikmI0RkFSfnyz4D9m/gVgRqF5j3DqH8HbDEN1oWnwdZAcQcdJu8O0YAs8MojICbcwOSywIDpZ5x5ZwdFGkk6dVtq04acGNkHDUMG6HZ8Pd82i0RUWVy5WDN1vM/75bU3KOHQ0EvHbnALWS+UxYKknB3xyvyZszMj5ttwQ+9B91fd74Zm+8G0T/4pa7Denh8Keamt/9PlV0reneuV9Lz6B0m68I326h/yGS50J8ZBhZX5aj99+uyypsOxkUWaZSCJBXC2wfWBNl8rG0Sn2actQ2Lu9sd3RSHowngv3kJHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqqRPaimbjrTBPzTycS3UoZ+R3L67UwoFxvjAOu4Cnk=;
 b=fISwh7PSpTgCw5sG50Tm9VdPVDKiXkjxdBDTuL+3R07T1Fc+U2EQJDttAvqKv6ePjkyWuBWvl7hrRZM0J1Ey8aTBIyJQhk13bizmbgwlkxCFTuPOr6UbSzxfZl6phrVjbmxORKnyisJU3RpfT1Vf3n9lccyZtfwTWbEtPaqPSz5zXtuaK6y8+S0fUAfyysDVJLfomk3ZWlLStZWcewnOZqz/Q2Npr9PLvhLTHw7Vg2eVZYJzvm5MZe0kRGX0hu7qHYVFRQHRFeS7dZQS53vMYqpCTvQO9H9DuX0fE9pKeB/PR53PgCG9ahpZ4YYl5TALTCGezhM/cO/tUlsVv1ACTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqqRPaimbjrTBPzTycS3UoZ+R3L67UwoFxvjAOu4Cnk=;
 b=ZJczt97xSIm1MMNhyPVGKgdAPZQ7yAkA8U7V4+Nhv++745RhjoSmQ1qTiraGvmTk9NSTdThOARzbZLQQb27athYpGRkxhHdIMrggLhq+k98zNPqOZL+ooekNXEMT7NmNEOLmpBENVnoevQQV15QJxJ7NxypkoTFJBpswU6TJSEs=
Received: from DS7P220CA0070.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::33) by
 IA0PPF84D37DD5C.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Tue, 17 Mar
 2026 18:35:00 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:8:224:cafe::74) by DS7P220CA0070.outlook.office365.com
 (2603:10b6:8:224::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 18:34:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 18:34:59 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 13:34:59 -0500
Received: from yocto-build.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 13:34:57 -0500
From: Devang Vyas <devangnayanbhai.vyas@amd.com>
To: <yazen.ghannam@amd.com>, <bp@alien8.de>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Devang Vyas <devangnayanbhai.vyas@amd.com>, Ramesh Garidapuri
	<ramesh.garidapuri@amd.com>
Subject: [PATCH v4] EDAC/amd64: Add support for family 19h, models 40h-4fh
Date: Wed, 18 Mar 2026 00:04:53 +0530
Message-ID: <20260317183453.3556588-1-devangnayanbhai.vyas@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|IA0PPF84D37DD5C:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a1c8f7f-57fb-4957-9283-08de8453e53b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	K/BB4YlPgyCvhCmxHe6dGATHXIqvObiJs8LFv16iJBZW2TmNARewTEmdIvB3xbIAwU+AszUPIS5PtcXv5RapA1GsSTvqWQRd4iQ/eo79qtU4EdeVuASj3P3bymSSVbFPlMPpCbpFXXn6k3O6Yt7arPyhU0WrLBUD/YQlBoStRk6mTGAsiYEyDgknwkf6LDuidZLd4q61uhyrl5BGgbXjzqtq3wmyVTRUP9EjML6OTRV+Xa8zO2x3HO6MsqNR1vPNUirJyoVKfnEEkLUAX5xopO7Li3SG2+GxOEiR8+PVPEMItfEV/NS+1uYDNtMfE2JMoclXYDygbkHmDG81Nd3x+31JQacnNiyM9cP3wQPIIjJGJ9vnMKdAGIhItB/6VPtdRlzsuSdXpzZfeqKzx0HPsyAzmG8jWlh+iFxBGliigNIuZzk/Slka11nq4e1/qWoy61Omv9vQGazjYTxGlkl9V9XWkyqfpmsQHF8FoaaiDbI1LHOzzAt9t2XZ8/d2uhrO+7pVvu8FuC57dkR0TWnjj2Mk5EVDBkyLfmDqqmqUl8vHFcMRHVatR2DA9VO2yVWYYcRL06BJg3i6pAjAA4QN4derZPkyHQssbogimOw27iRQ4FQvFJEcabW1Z/ilf0oA6wXzCu/cglMyHXNM9WyMVW3qD53haCdhQXVMmYPos81lo/inPNXhjMtQS2FpdJBOJQKSQUD60dBQclGof26boKCpzCU19UQ+Ws/DWx4S4cvrsna3Ndopr44c/pnL8FlCcLQC2jhiy8tiz5vl4NeKGA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CulAB8nrGYUIeQjlkqicbYZb53VXewXHJXyvjBI1qzQ4XcWIRnt7cjNVBXZv+Xr+T3jtresf+yrH24PNFeioztHnAjKyPoT3ZOeDkDIXfIOtTpNbZnb3lWcKl/gx6p2ne3didBjwJKkRq/UzWFKUGbjSgkjqVgnjYfcb7TAsVsUkPuGqNSEF2R5eRGEH8j5EOM+UaCch/ExzOAJtSJwDWLEIW/3fhbnY48/mAlvjcpcWqWcXvrWgoF+gHx49qJZUC7alRkw048YL5r+YJvU5G10ZuPvbeNmf9OvLGzdR6UN7pPEdLvR23PBjkcGgn+DN1ThtkpkUQR7oqj9dQ6T/tpB+8sevM98RWFoXG9kWA2ViXQeZHc3btCQFOdij3JTMt3Z2Od++FZGQoEohlIxYJJGSm3ghqeuftaAKvBsqh0JwZqHWgPeGTLw5fC3iVxTZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:34:59.5396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1c8f7f-57fb-4957-9283-08de8453e53b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF84D37DD5C

Add support for Ryzen 6000 Zen3-based CPUs in the V3000
AMD Embedded SoC platform which uses ECC memory and would
need RAS handling of hardware errors.

Co-developed-by: Ramesh Garidapuri <ramesh.garidapuri@amd.com>
Signed-off-by: Ramesh Garidapuri <ramesh.garidapuri@amd.com>
Signed-off-by: Devang Vyas <devangnayanbhai.vyas@amd.com>
---
 drivers/edac/amd64_edac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 2391f3469961..6cf0b6d7b5ec 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3863,6 +3863,9 @@ static int per_family_init(struct amd64_pvt *pvt)
 				pvt->max_mcs		= 8;
 			}
 			break;
+		case 0x40 ... 0x4f:
+			pvt->max_mcs			= 4;
+			break;
 		case 0x60 ... 0x6f:
 			pvt->flags.zn_regs_v2		= 1;
 			break;
-- 
2.25.1

