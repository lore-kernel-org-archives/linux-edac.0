Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DEC48BD52;
	Mon, 18 May 2026 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120493; cv=fail; b=ZohdNC4KnV3hd+oawa4qbVBczS49akhukBSe/QNDD1oarRyCxYblGP61DETa3qJHWxvx/BV59cBBcaW0LQ1tk4tg/TiB0psLGjit+6TGUeqMdNSuCqt3oCUcKCLBIFqnd5Goa4l8SkTzCdhhNgohlvfuDNfQXON03noWsbVT7b4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120493; c=relaxed/simple;
	bh=GAW5cALtRdCRLBiMM/qRBHFucoohF3ObQhgU86ytFDc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pOLg7jm3pc+8WhikLNzd2bx+Y5Gu5+eCrjXqhgVRLVOtc2VqqR4W5JuUFhQTdca6/y7afoT7qRkrnF33zN6cN2FqpT3BzQx/Mtmmi787wj2keqL1e017p+i3kqN7lEVK6g54Tx+0cnu3if7BvMn5NuFBe/uge90C251UcwG0gEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ltSM0Tg2; arc=fail smtp.client-ip=52.101.61.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ltSM0Tg2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8ytrQibcij3uEQuucqc2lyhPCPKFhxHElMO6b3LMyuni8CoemjJmxDVsVPQHxNSpCEA0G0v30oLe1Xzih3qiexS7lX92oqn2SuiMqZGP7AlPd2PuxgkMXFdHdd9xr4a63Hn3kwdPx01oGL1qxLs4xJf48eKfHkuyQt7mzUwm61mYy6p9fXjwu5rvSrlTJSZcrHVaRq/pBLG6Rl8c86MsrH/YdWxcJyoyV54A32wLxGiGVVsv6eJnuwCCg58abhMicDqo8LgE8A2fmjlae53jPeilRHltUjQjhwL5rUnAWqeoQmB2MWyKZ+63M3D5g6ZxgSou8+3jKHd74Gr3NmceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+ImmJhOnwEtbGnN+LEDBCTsWFyW7fJ1hiNY8ckrdxE=;
 b=bxZIcseqYYN8HqxMtXL0T+CH6J+ceChcV9Lwp02rbDu7etLr8/9RLS89MmkpCoNcC2ytdY3+Uf8EfGxym0t8nxH73Eq4nFsHASsf+fQX04Wu43qiUgXAHiLnZIA7puLGzxtDi+1Lj9KHm9VU1+OttGszkptcywtCp7r9CP0iQ2RGJFcOqLl75AIMm5LP5eqDiJJcG9sJdOfApYhykZPxR2zAEFDVGpw3RyFpU5jvJ5wwncn024cFS7DbUcqgnnqsGPSsEXy/dcB1CtOq5XdC0nAPAI8DOGfRB9vhSLF+auxQ5nppW63L2//BjjOhMWlarSdyVCzrbUy8e7Oc+XkLTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+ImmJhOnwEtbGnN+LEDBCTsWFyW7fJ1hiNY8ckrdxE=;
 b=ltSM0Tg2xGa/eihc1xByL4+C9NEveaczrahosmmNPnk53Cie+9j9WVW5nUyzID7G63BZYGYMgTuBK69NWNmYifG7mBdjVE39Z2/p7wy2bkkk37L3jlNx+prLxcPZb99Dx7SJRpXMQK9h2N3A825tmzix411HSZuwmOR0i5Mlt0w=
Received: from PH7P220CA0155.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::8)
 by DSVPR12MB999125.namprd12.prod.outlook.com (2603:10b6:8:38a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 16:07:47 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::2c) by PH7P220CA0155.outlook.office365.com
 (2603:10b6:510:33b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 16:07:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 16:07:31 +0000
Received: from yaz-khff3.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 18 May
 2026 11:07:30 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>
Subject: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Date: Mon, 18 May 2026 12:07:14 -0400
Message-ID: <20260518160716.171578-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|DSVPR12MB999125:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c56e7a6-baa8-4fa7-d03b-08deb4f790fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|13003099007|18002099003|56012099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	+tcHHYEXu3GDK/OAJTWIXyvFllyH+oxhrNY5KxkqHISZJ5R2WCJQfqh36ZwaaJ/o2k6rHNOaHJcUsMRjWAxWsiXaW4mm3/wxC7bnTLxxUqKCWnuXzQTjSYVMnwDrqHPeVpbZWy5vAmQ/hc0T+oGmymngn0GpcTf6ke9C+Hkn3Fsz9zb1ZCXm7Y1bSoC0YH8Su2drJe7HLUzG6YZULiaS2sopQdHO1iArVcHEf7rwT/E4oIRU5lm/jB8GbMvY1DmQypzj+ER588elVtwBM0GhMTIHMOWLYjuOLfocWjNrlcY1T5vBJssN8/XRDb55YLJ7bCAl3GcXh8XVUf9WULcspp7fihwM7A9thhUYKshEqboR8O1K3JaTAGDgJAqJ908oyv4gt39Yb/64KDVKnDo//DWOKve+bNYPB49AztXgd21Bq+EqEudeZeNRHjhx8slyzsd/T5TW3kQ4d2iOzEAWiFoWCBNbW9fYkmon9swBqi4dr65235eoGwf5EcCPgV+A1n3XIyI34pJnnnEnpPD0Q66nBFsboAqxOOToVSqI6QSy8odNQzSXmiqpzu61w5vSfzQYGMLwCf+3SJyXyfeNrQ8DdUboy02Z0pypDJFKud8GhuSvp/9SxQRZA28Xc6VWrXQm8zGuUn3IJjoGElPVdGFwRKDBvPP/cE5Y2QDlRt+IdMbeegptwtc2C5y9J+o8l+9fftSzPz+lz+P7DzHJtHdn2ozX8xeqL9YVKZjXqJI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(13003099007)(18002099003)(56012099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Dm2LIc//i/ULJWQ//yArrLmYvfLUMMNbxqSUtqBWtZDtu9Pg1xjtCfZ5JMr25PZjFEeYRkyLcxGJS7Remt08ozQIPESbbd7w28KjHp2/ZogncPVaxNNstf5XHMsLqBlZtrp/qObZMJanPVbdDJmP7fa8vsu2aA/jndPL/U8pQ3Ch1+sb+Ttr1H4HRN1MLkSRnc+VotfJU+DbmNvfO0XZbZ8EWufwungaBtkKQZdCzX1vtlR7iGWVX86QdDFlJ7gjPfqL6mKNq8XyrGZXA2dXWtzsfhEAGdvHcpiPN2M++Kg4opeGhV8acA3jfBY8Cxg5MuaVCUPd4cWB9eRV1a5zvTiSONCTNsSu59r6BjIyQitIKSgb68jHUPu/pHwBZ0h917RQFz8H4BVA4Vxzh81mG8Rz31bb47iT3UOZniHK+J0P8+ADP3sgCH103cIRG9z1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 16:07:31.4599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c56e7a6-baa8-4fa7-d03b-08deb4f790fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999125

Hi all,

This revision addresses a comment from Sashiko in patch 2. The decision
to print the DRAM address will be independent of other decoding results.

Thanks,
Yazen

Cc: Avadhut Naik <avanaik92@gmail.com>

Link:
https://lore.kernel.org/all/20260316125324.396889-1-yazen.ghannam@amd.com/

Changes in v5:
 - Address a comment from Sashiko in patch 2.

Changes in v4:
 - Drop a "handler available" check in patch 1.
 - Reword commit message in patch 2.
 - Reformat string in patch 2.

Avadhut Naik (2):
  RAS/AMD/ATL: Translate UMC normalized address to DRAM address using
    PRM
  EDAC/amd64: Include DRAM address in output

 drivers/edac/amd64_edac.c      | 27 ++++++++++++++++++++++++++-
 drivers/edac/amd64_edac.h      |  1 +
 drivers/ras/amd/atl/core.c     |  3 ++-
 drivers/ras/amd/atl/internal.h | 11 ++++++++++-
 drivers/ras/amd/atl/prm.c      | 32 ++++++++++++++++++++++++++++----
 drivers/ras/amd/atl/system.c   |  3 +++
 drivers/ras/amd/atl/umc.c      |  9 +++++++++
 drivers/ras/ras.c              | 18 ++++++++++++++++--
 include/linux/ras.h            | 19 ++++++++++++++++++-
 9 files changed, 113 insertions(+), 10 deletions(-)

base-commit: 4b049cd5e5194c8e58cd978d2dc9d3bcf67c84f6
-- 
2.54.0

