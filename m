Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010019.outbound.protection.outlook.com [52.101.61.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630633B636C;
	Wed, 11 Mar 2026 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216310; cv=fail; b=gPPQ9bAcJDOIp69T2UTBlXu/GIxYjynfz7MNsfq4bQX7RkyY44cZ5zFQvWiBSkRag4P3SYcJ56jNVuAvAJTH0Neveiaq5MyxjgQxrTibt2zozHeZ9OF5F4xG1Y8D5BfqVDM2kPg14coPdIVVukrm8W5gAFy+EQAo8IyVmzNT15Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216310; c=relaxed/simple;
	bh=Jmpu0S70H6WRbkimY1VGz15Re7dP8yITpYBYdTxEEf8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M0PoCBneN4a3t1tgtbBV9T/DarZUmRkcfw3q9ZB0E+1sStt1e8i5VmTHP04D/a+gesVvayH9IV5PyWiITITzTA9mIZ/Vi59fwnhJoJ1ZXfgGktxooV+Dls16v983iEYyuzB0JNAA0mgJrlHd/cRBSWgL1vboX/y0rVokxoGAUp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TydF08Nk; arc=fail smtp.client-ip=52.101.61.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TydF08Nk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqPmbwV8buRveOX6HtOB1o9DzcoO9dZueLB2VylB7Ghy/LyT1kSHXEwIFFzgX+Um/62xu8wBFcoOZCs4/khTrHM/Jq/Aj65bF1e9l7Vw3I5Nyl3yFZ+zQrseF5GYfLJeTgCfqMb2VMJWsEhm2YVa7ArEDui+4rP7riywzE71H4c9RxQYL0+AQIDOarEyElrp/v50NbdTWqKqWilljn+L5nTBSDwRXUytM86L+rBAvXY69hJmF8Tl03T/rVgurmf7OUScZkoUGKoMcmJrrE6IqcSxgQc8t0/GyYM/mPMGzDkmK2q3lv1vm5+oHIrd6xeKdzKHJfLJONaqKbkAZPdocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqGzfk5gUalH205sT/WcbPksZogZri5dFHBKdMJRrf0=;
 b=u3EeZss77qgPnAdNBiogsUtKQC46t8hSMpKABepsO2QfJtcD1U8YLe676YT82+tZCQFhbNXNAkAjBi4qDcH5I6PQOj2G3bkI2rxNw9R0JXQak1FDCH02Tl1FQqW8ZtILdYOkjT6sT3dtow7gh05DR9zEKkO0KMkqSIzvWyH87j+WDLagkeklUzPN59hJ1RdcilnSth0nGPbME7vIYAD1s2LMHOggFB4fV6HFrIDtqvhfsxnh7dHsilFN8NCkzgjNpyfemVaV8+POcuLz6cI7YZypCo/ZY3znC7m5CVv8EBXeBRhlQCKQGTyva3b9L1STSKTzn55T7LKooWzmssdIDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqGzfk5gUalH205sT/WcbPksZogZri5dFHBKdMJRrf0=;
 b=TydF08NkMsNGyRsdM2AcA4bTkLLNIhiELvvVOKlKiETt6PbD3YkiKVTgjkd7qTcfcBlKFUIiltsIdpbsjp274d4ivvS3jE1pLyzGu1czmhCGem9sVyPQyLureMoaBQpdekBLpphpaK0K7bu79x+xPFzuC3rdXg//s5i3J36GP1A=
Received: from SJ0PR13CA0202.namprd13.prod.outlook.com (2603:10b6:a03:2c3::27)
 by SA1PR12MB8987.namprd12.prod.outlook.com (2603:10b6:806:386::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 08:05:06 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::a4) by SJ0PR13CA0202.outlook.office365.com
 (2603:10b6:a03:2c3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 08:05:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 08:05:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 03:05:04 -0500
Received: from yocto-build.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Mar 2026 03:05:02 -0500
From: Devang Vyas <devangnayanbhai.vyas@amd.com>
To: <yazen.ghannam@amd.com>, <bp@alien8.de>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Devang Vyas <devangnayanbhai.vyas@amd.com>, Ramesh Garidapuri
	<ramesh.garidapuri@amd.com>
Subject: [PATCH v3] EDAC/amd64: Add support for family 19h, models 40h-4fh
Date: Wed, 11 Mar 2026 13:34:50 +0530
Message-ID: <20260311080450.3069302-1-devangnayanbhai.vyas@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|SA1PR12MB8987:EE_
X-MS-Office365-Filtering-Correlation-Id: 78005f5d-d113-48ac-7095-08de7f44e812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2pZ7b9j1a92H+WRWjDvOsSdAolyPK0umTIxUP+tuDTLCj7V3A1B1F9BhpEUY+0yu2VzjRXzcKqCdE41KdoSYPMRzU5yB0jSesfQWvIbucXjklmF9pBb/hUZKJovanRE8XgfsDrS5J6YnMzJyKg8tGkZQR4+CkDM2uBwImxHVJjea6L97sCzoIPYJhPqcevbWm5137YMYtpN893MZEqjgiWtTvq2U1yaWChWohTZm0NQEc+LYkvQeDCO7axmWEVKOuS0QLgtWiq1CQq4hQ44BK//86IfeblcTfYXulJ3RXy1SEChp9PLD3tVb/3xjpF/xYcORiQ1sUm5ZwdOh6VZg2+3+s2bVEfxHDgTWAqiKqP5GgLL0kk3+vp6N8+ddRrKHneNAFCZ/mFEp0vRw8GQujxS5k2pliLMD0T3wvubukveDr2zyfL7Qrb6oD+eFa+U1kNhFByp2pKm10hqCfh6j9ei2vQi3bbx9tmOsCI6XxPz+YvkB2aeAOn1tn49L5n3SppRrIgSN/glJQAlU4F9pLLSNgXplgjMVbtTFMPo104boqRfr57lCnr7np51kzHEx/rtorZto3aMau3FCyVStKtzv2Ixbk3zmdszLMBLRn7SMNROzOuvdqJms/wbzsiqsDEXRoRfqohNQSA8yy3uksown7MyJ5rzA0D+Isiv3qn3ipsEKRqpDVlhzqZaIxSI5L8zUgfPdb4kfVRu15fW15ruY27yw5EIrYv1C5ysz8tNNlG9khRNJuzO6tSor3G47ufyUStnSA+67FsmFAxhVoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fnDr+TQ4AAJTA3cR+JZnD2+V0vC4PV7QHZ8Kcg/3+ddtuS2cNawZ0jeTvaOlb7oqzC2Ac0Kcp1xX8gW3Z/xcYibzYlSNuvX/FkF+P9k597UYe26FluS3x1Ryw0SKl/jiNtEnamsFyLB7A8bwH64ILhfLG0ie36Rxpbx/sNzJeE8/SI6UE9CC9DjcQaySOFc3QIxrQsiwK/Qk63qpYOnyt1/6TwqyMjS+tXUwciy7Kv0hm9JxgJ6bVzoRFj/c+x66H1MP8pfMn60LRVBqX8TkZIWDbkHsW91qszyCpPpYKIsYCd1P4rxn17kuCfKfojLQ8t0A/20FmvyUoLCnTtUD/X+z9/dCTB+cKf43tQSKFEdA/r0auU8jLOY7tBYHH5g9nAYyid+oyg6y/slyFOztf6BMJy1PMcRyolCPutGJlout5ElJLZUKrrjN2Bfn21mA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:05:06.0131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78005f5d-d113-48ac-7095-08de7f44e812
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8987

AMD EDAC driver change helps loading the module on Rembrandt
hardware which has ECC memory support.

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

