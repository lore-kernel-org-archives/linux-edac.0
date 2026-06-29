Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536B842EEDF;
	Mon, 29 Jun 2026 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745675; cv=fail; b=aT/u4uyoXYhY8gRCNIG2MuCwjz+rnxc1v1hBHKJCBXysjDvqOCrDKevuiqPJ6Td3UbuAyXygRAvTgPCYl/6uR2v2oO3FHA/Mq9H47n0zx4wsYznmOpVCG0ts3jIKxMvoAk/EzgFHvfQqPz+SXYJIyvEKuLCLtkjBYtGA3+aWhSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745675; c=relaxed/simple;
	bh=rRpr0Me6FVKO2sXejoYy0J9e6L5zmYUENggD0f7OezA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ruvvSF8DvFZ4r7aSXHTAqp5n4+p9NMiWOmJOQ4vDfsirDVwVJJ8MFFJNfUg2J2nQBU4u2PHEyoMDDpdxHT/yofFbF6Uhv/Iphyhk7aM0RX3jhbohXr5J5Fpj/ylsaJZOu3eUumloh32VALzyyY0aIJrbgmt6FoJHKLMI+um+JHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=urMVYDps; arc=fail smtp.client-ip=40.93.196.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="urMVYDps"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFMyn0eS6bUXE3M37FRSHeapcT8po4Kf20/Erxr9jhFldjt8tD2gyY9jDnPHaHYsvFC4I2dJh+PKbKyoFX2glPVFDdzdZp1g0UVz83eUrYXvS6RDAJb9V+6cHn2GeYZ1MUx6JnRD10/hde677sQSWkXJL2Zow6tritn5duFCuhU6cVYePvX73vQNDff5H2QP1u8vTnbPpsbtEqhicr/KvRU+ExcUPgTjBTlrYEFCqKFTOjnipvn8L7WuAskpBET1eZoX1mOb8DTq42HrR0XrAXnf7Ro5ixG9pifKr6i+vm4H60Nkvmq5sxgZYFG+5O+WbprplZdmOYPaqvlZqd+azA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBDl2JXNvTmeHNmbTQraUSB2qytlb/u1u9k+IttboMM=;
 b=VnQNcLuRK43Bh3Vd3FVqUOOcoBFlmnR7cwwAtHipuSctuARzReR/Cfz/v86L8XP5yZN2JdbOX6wfWnfXpIWL8T3ZDuRNgStmm7ImfGurXq0C8FXyNVJw0SiS4Wliq9vjCxEt3liDgT4KKiYHjkGTCHiUp8xc+XT8WeEQpp6R54Vo8Sw4cQXFTl/LBYJICqOmT2+ucnK5hGpaJNbCqf93qGqQVnQmk9GoGTdbvU39yr0Lr0aYp6gfMhXcdPpMzSmjazZasJKejM8iC68VU2Rc9MeasNo+NQL/d8GP3yeO0WWY6Qxw7VzAlJaOS+XsgFcqzK8T/GMrk++Vvr2rr21FHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBDl2JXNvTmeHNmbTQraUSB2qytlb/u1u9k+IttboMM=;
 b=urMVYDpsQ7Zi7tqe/E+MPmBAhG+dZdhFqu1/fe0s02M71KPl5AW8j0NpLZIYLSa0ELiLK8vmJw8j8bbGFzzw6g/8pkIp78/XJtIjVMxfYRiKyZYPphUiNM04l+HmpnwJSZ6FyD4fEI9fTcom3ikf5Qj7nodSFhNpv8LJEdyPJYE=
Received: from DS1PR02CA0020.namprd02.prod.outlook.com (2603:10b6:8:44a::14)
 by CY5PR12MB6058.namprd12.prod.outlook.com (2603:10b6:930:2d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:07:44 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:44a:cafe::2f) by DS1PR02CA0020.outlook.office365.com
 (2603:10b6:8:44a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:07:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Mon, 29 Jun 2026 15:07:44 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 10:07:43 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>
Subject: [PATCH v6 0/3] Incorporate DRAM address in EDAC messages 
Date: Mon, 29 Jun 2026 11:07:28 -0400
Message-ID: <20260629150731.1009605-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|CY5PR12MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: abae3418-e41d-413b-e7bc-08ded5f02c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|3023799007|5023799004|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tsDbiNibw3MmSrsW5w7OfJj5JuGWWzvB1wVvjrxCap+U14YLiU4OWmU0Tj3epSa2bmkrNV7XtemFyX0W4vvbpGeKJizML4aeev+FeImPZ8sFXk/c7HmoptyuL3VQLrpWnU/u35XcsHxafye1B4EqIJ6fPAkeIR8opxRzILlf9KlM/ICgpE7sl3eQjGoBGhbAtDtnfS4xWxya9/wqQ8+6DfpeXBSlFen5jnuSI5C3ujf56aOri/7B8RHPhkSBIDycYY9patpgkqYTENCX39+bdvW7uZZx6e17wfSMiJEp24WBDsMk7aTQ/7B54NRtBwIf4pkPfKfsuH9n9ZD2KBMvQcCCCIpImTDyZnpf+x2OopIackE9mJ7Vc2pZrAYpto5QXLbNxerViM/ozJDHUD/CLOU+vFJd2x1OLSi3RPU5MTMdSjKr+VVt4h1CjAXh0KSzoZGpo51l/SgnFT0agFyqwMPkQyUaMNDO3nHm6Se3L/gr+zG9PGncWCcQTVdO8gs+SoY0zn7eJyNQnu5wlx1wmokRUomD1AXGjvRE2edFDO5U9h7f1LKzjHoo5pA4ae/3+22HQlsFpUynSg8G37za26WvTolDuud1BrNUyGgmgIaR0BjA7I7DDfPUjIrDN7GDxZJswYkiLFHkzmixehILAF3HyVnU6GoTgJN185BbiC7R1BG2PvSIj/LmLFOYT0T/xN+fp7obxzPGcGkNGQMGPQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(3023799007)(5023799004)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FPiOe5j5nsO/Get0W8cVJ/UufatBxpZ1zxrNeOtzr1R2gxdr5Zp5KdlV2Lh679pJUq0GTGMlBsmVUIX6AfXTCkA/3gMvBQgNSXDPK3lUO8A3S/7DFf0n0B1qURHaUzuKxd4w/wGfN8nh/a1/E3Oq/X2COUYqsFBBbNJCeTpdokEhQMtP5f4jptS6qf6SmBsWaP4Ib3iEi69kODP54tVSFmW2O+/FExcZkql3Csd4jzKW2HJ+ukkpayCvkxtUIdzQ4p9trcNijhX/zqaKAHG0+Pozj38bssyNXVeSQRSrtqolLLTuJ+Zwa9ZoE7XQAzHNspBQs9MxpmSdR8Cdm4GtE5ETEfxd3RB3jPz4H1VYo6gHiKcG9DvCIO8QreYSdzzAMN7zXWFO47igmCAN9KDoeUQBvkXhjAt8aC+/nokSDC2wULAqEAxWauxs9O1rCrxQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:07:44.0096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abae3418-e41d-413b-e7bc-08ded5f02c01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6058

Hi all,

This revision includes a new pre-patch to remove the fake_inject
interface. The new patch includes a few tags for AI assistants. Please
let me know if they should be structured differently.

Also, two values were added to the EDAC message: Socket and IPID. These
are needed for translating back to a system address for page offlining,
etc.

Thanks,
Yazen

Cc: Avadhut Naik <avanaik92@gmail.com>

Link:
https://lore.kernel.org/all/20260518160716.171578-1-yazen.ghannam@amd.com

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
  EDAC: Remove fake_inject debugfs interface

 drivers/edac/amd64_edac.c      | 32 ++++++++++++++++-
 drivers/edac/amd64_edac.h      |  3 ++
 drivers/edac/debugfs.c         | 65 +---------------------------------
 drivers/ras/amd/atl/core.c     |  3 +-
 drivers/ras/amd/atl/internal.h | 11 +++++-
 drivers/ras/amd/atl/prm.c      | 32 ++++++++++++++---
 drivers/ras/amd/atl/system.c   |  3 ++
 drivers/ras/amd/atl/umc.c      |  9 +++++
 drivers/ras/ras.c              | 18 ++++++++--
 include/linux/edac.h           |  3 --
 include/linux/ras.h            | 19 +++++++++-
 11 files changed, 121 insertions(+), 77 deletions(-)


base-commit: 749c5102487b558cc7d73961a6d0da2fceaa022d
-- 
2.53.0

