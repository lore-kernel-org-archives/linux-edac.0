Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1362234CDD;
	Tue, 30 Jun 2026 21:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853629; cv=fail; b=bo6x8SslnoDrSgkBz/cCMzLfm0BrZQFTps0cBvRV9TVHpnazFjEsiFwZtD371HqnYqbyCYhRVHMBGRwRUzMIgMBWjCZ2Ryoemi7FjEnMxRi62dr+Neo88edGmuZmfCnaOsyWeuMH613+tvIA+UDAagMWWEGRndCMBkFkyFLkj5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853629; c=relaxed/simple;
	bh=O4BCWvHhPHBBMPbJK+3JvZorUCjFt4StvukwawTOWoY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BoRjHNtlxmKdFXkl5kaUyIJvh3KrIH+ZUdNDxowchrHa+AjNRu0hHyrq5xa85iYdDef1iU0nP0pmnvayDdOap/FzREhUns9qFKTKTSdexl3C2Foq3u2h0hsJBNhgr47vSSSX/Fo7NIHeiCCWin9o7MWa8Zkgh2ldvrnrcvxbn4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sa+AtwKh; arc=fail smtp.client-ip=52.101.56.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sa+AtwKh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaProey1wa+IJxx92XBlySJWBLEtn8pleLGShJzCS29aZjRFavb4rBcLuanwuIzuaFt9ECGmqvLxJLoEhWNcYZi04muOT5di0GJQpUoYPPgth5t4ZfiwZB2fFLA8c0pBK3WJkPFTJT1w5DCMsFX3m82zTevfbnylvVS/dcHM0W0Zx+Fq1zt64VJFTO1bXAASrJyGCdAjOnKv7hqSaoD8b8jeY7RiINdZS5wIhV8f9NmlgewmYiqSquoSwgPmQnP/CT1hH1j9VcfeXUjMyEPxayKnREWw4dg6YdoPlXZ+k+0P4/0P8NYSZ/0tLNZx3+TdvPbAncVBmMx0t3M1EAV6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnpXuCkySu/16z6G1hqOeelSynfxGewbvhnNdzAMR54=;
 b=ZaZ3eO8jkMCS37OCSMeCCex90ZxFCnGM3DEz5Zd63xBLO1J/JcgleWpmd0saxto+nX17A2NL8we8luDkQp4ikvk78zus3/7DEYD532JgEdo2KRyojX0VKtOxrpjuD+6LM4DLuwD53OZpbRlXyL80dnZOkGfQutK9veIzzB7nBMi3H+sf/vYL9X7ZQsOddzo0VlmDTSjnRkExv5j7I7xoUJ2SXoqYlj9fQLTU85cOofbAo1eK4FTtM0XdLs3OsLSZ0beNFR3R43aJp91gpXd/izGfzyticDlB8QWRMclnUe0UeO1px7M/Ui5ozSUfrB7YoKfXeFz+MmdRdGO01lelxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnpXuCkySu/16z6G1hqOeelSynfxGewbvhnNdzAMR54=;
 b=sa+AtwKhfe8LnmV9NxZJTy69WwWpO1gPEYfJyYav0lR30rdAGqQCW0ljSea4xDgFeZUxMTNlc6rOg8/Y2XWRUz3OjE1jZfElFsPdcdUcx43mFhEoyVlSAjxKfunOectU7oIgPRzMvHrsLhpd4qY22qmFWnLknUZk6j6kmFhAsUQ=
Received: from BN0PR04CA0205.namprd04.prod.outlook.com (2603:10b6:408:e9::30)
 by SA3PR12MB7806.namprd12.prod.outlook.com (2603:10b6:806:31d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 21:07:04 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::2a) by BN0PR04CA0205.outlook.office365.com
 (2603:10b6:408:e9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 21:07:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 21:07:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 16:07:03 -0500
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 14:06:52 -0700
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>
Subject: [PATCH v7 0/3] Incorporate DRAM address in EDAC messages
Date: Tue, 30 Jun 2026 17:06:37 -0400
Message-ID: <20260630210640.680758-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|SA3PR12MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa1747c-b1cb-4b4f-9909-08ded6eb893e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	m+7xKEgJxG9cRuObjiMFwmT5qqPhpZOheL6jz4aFMvST8EMDG9unXAFX7by5H6dsqIRes2F9fGLVAUAOHGbgrXi+0OesFHMzjIaTLNK1wCaWmq9QedhjnxszcNGfzebkdZO9Ab9N/orPXB8auD/0zeVsyZY3zNyv+UZo4QEC1ZGmm5H++sBFAlmiAAp2lmiNSxVrU2Jj6BDlRkZQcZtKS2ILigdPy8pDdOhRCkTjqClCqZhmzF3LUo2RAtnm1+dXenvwkUPVg6ydlRqw4E7Wq8sUpBEvlMGYBxyddzzywnGEaaSR2FP5AHSI0/+RXcmRUURu4Ygjs9z4lsFOpNVtDMkXDRm/jWYKuZU9Y4Y7Qg2UOfoYmuuwRMswUQkqV+izLsRLOachVtBv9mmUvhCaSXtmYdOauUtSYyFtNs8iLuMzUW6kNhH+fO+mYsnP0Ar30IBvBCJZOciAwNTV+YiUqztTIfVck4zaTU0F3Q7L4YiKIISDjU2SCnyF6OwlVkzrtvb39Jlgb4hSTQob+dtcvVGflezD3/bdPhZ29uZAHBh4z+OO0jnahHdmt18FCb9YHaApgozbV7ofZrfmGR0LhIb5cM2vk2l7C4XOu76xU/hBQrZL0sJoJC4nLj6n6G3uxbQ0n00UD/SF0uLWQD0ry2TgbGgp45GpBRH1sRejLkWandn27Qa+uk8wIIpmkw9S+tT1nBmlIcSqXV0yvnuWEA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	awlI0lSQKIi326jVtWzcig/cOa+NgSmrrR4XRfEZqFrma8XP3JiXm+8Ofv5WBIM2gkSKJoGl+9vIFRZouwRDs1mWLOYIQR1EVKb8URVetmY4k+GLVgtfDxWcclNIeEOpONE5RasAeeFH/iphxbefubkDuRg+XIDxz+nReIzKJlC4xfS0QwqVL19R3bKqdYsoNdiN+322KS3sRbpCfjUUkzK4cXfML1PNhn8k/TC9LHFdSb11T+xlHK5FDxzjvEA7B4tiQ6zsH0+I8Odie+hiDVYsgJ8CLgRCsMBnW0CbHEFkb7h8CsbdvqqYQOTDtCY/HC+d1Tx+iYLGTg8Zxw6PYopcIbLhDksJS4WoqfvG1qeJdNeX55S0dMiyZctJpTJHKC6x5Uwx1QvNfgbAPcFxd3wetpM2Bb4IXrtgafTUJwTheSIOkE58iz9N99yaccqA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 21:07:04.1008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa1747c-b1cb-4b4f-9909-08ded6eb893e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7806

Hi all,

This revision includes a new pre-patch based on the diff from Boris in
the last revision. The subsequent patches were fixed up as needed. There
were some minor changes due to formatting, etc. Boris, please do adjust
the attributions as you see fit.

The first patch has an Assisted-by tag due to help spotting and fixing a
build issue with a particular Kconfig combination.

Thanks,
Yazen

Cc: Avadhut Naik <avanaik92@gmail.com>

Link:
https://lore.kernel.org/20260629150731.1009605-1-yazen.ghannam@amd.com

Changes in v7:
- Drop fake_inject patch that was already accepted.
- Remove function pointers. (Boris).

Changes in v6:
- Remove fake_inject interface. (Boris)
- Add two more values to 'other_detail'.

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

Yazen Ghannam (1):
  RAS/AMD/ATL: Directly export address translation helper

 drivers/edac/amd64_edac.c      | 34 ++++++++++++++++++++++++++++++++--
 drivers/edac/amd64_edac.h      |  3 +++
 drivers/ras/amd/atl/core.c     | 23 ++++++++++++-----------
 drivers/ras/amd/atl/internal.h | 11 ++++++++++-
 drivers/ras/amd/atl/prm.c      | 32 ++++++++++++++++++++++++++++----
 drivers/ras/amd/atl/system.c   |  3 +++
 drivers/ras/amd/atl/umc.c      | 11 ++++++++++-
 drivers/ras/amd/fmpm.c         |  2 +-
 drivers/ras/ras.c              | 31 -------------------------------
 include/linux/ras.h            | 22 +++++++++++++++++-----
 10 files changed, 116 insertions(+), 56 deletions(-)


base-commit: 1129f95c19e50823398822a775c9adc141113196
-- 
2.53.0

