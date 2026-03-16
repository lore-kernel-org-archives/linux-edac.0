Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012044.outbound.protection.outlook.com [40.107.200.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61B1396B8C;
	Mon, 16 Mar 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665634; cv=fail; b=BL7HGxxfJnWDzksDoyWad2toorujbWVfIbP6rQuTu06YLx/mPHhrqb8j905O013ffZLomsZ27OvMiOkLk4H6YWwaHuiZbKIbEdl18WZkb+jBTsifGZ0WSpCg1Rx4Mu/xBNE7/l0xCd2EnswMBHGFXUqI37/WbMWobW2nK9WrTRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665634; c=relaxed/simple;
	bh=34Dk5LMSnnFrt29fudff+e/yXrp2LnQQsS1s0Upt6L0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hiWH2tzMHcnul7kjJH3BAYYDrWteVBiowN2UZrhfllhgGaZvE22PD8BGCkHsrt49zgflWsSnlp3CCtE14n2MiNQzVZZieQjQgEMwPJaWIygXIPPb00J5VR6236h9Ec+i3LwHlLZBHTYwn6v/od8B6P6ZNOEKpZ/bKnYr7n3/oLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wI3fFi78; arc=fail smtp.client-ip=40.107.200.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wI3fFi78"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXR2uYVvkxy5Np6bCUIUIvFI3N7YqC+7q82l+djaz8UgIit54rq4+hQbJZYUphN7SaJvAEBCLh9f4vEHjsD4RTe3D//Pwb2eTIxnFi0UpwHHu1sMQxpfUFj9eQGnIjBbLISW8Oh1hKWr8lThlg3aOQIb6j7Qb1hV7rb6zivpw7LWkLFB5a3MgacFA5ZasRJHzzs5uTpom7WtBoHUA3i151RD8JgGR2cEGHr4WDoDjne7P8gcsOQ1x1S/urY7IMOYwPhcJTZ0CjXeOldIFNkqzsQc6A2ZeIPP4lNgHIL0mftz7qBsInAI21d+Ti/fMCgz1RazrDIifik5nTSi7CbpFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2ofiYeqGi1d6RQLqO9WxfNzQTD3I24Ki4onjQsozkk=;
 b=RVbzm4MZ9p22focR4PwTxJ7bBDVzj+C+xoHcALXR/nkRDTXcZx6ExF10xUrg0W6WtHvgbJrsavUYL+5+Lfudt8X7weMJkTTcrcgFu51bSsHYoUf5wwNtIad2GRkRc7jlrzrZafNNAX0QqPQKqApODnDwyexmihMSYSzOd/BbhiWRhT0/DbyrS9GC2I2yn30P3Sv2nms1PP/qiyonGf5LouQFItPTVbENvcsMtOrElxc2xNDqpIYa1nMzZw+HAbOaeCy9I2AdQtKxsUAvKkfawP2l6bbbB7tbiyfMlGg7MuZg3Ip7JY5J3lIjejk3FBx0IrmmL5BxgIYnkkSVMA3srg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2ofiYeqGi1d6RQLqO9WxfNzQTD3I24Ki4onjQsozkk=;
 b=wI3fFi78GZW4TFJIXGsfWq39FB2WWYVpl1Kbl5ExIWb8zMf1FKticil8tp6ZACwBfx30EpWXznWyNP0sfiBDlf6AaF7r+2NNAruoeGXPY/rxQVrcfX0xKsPvezwZWl2yXuy5xtBo9rmsrGWVyHSfIBKLKNvu+X9f3iaRA1+vAJo=
Received: from BN9PR03CA0710.namprd03.prod.outlook.com (2603:10b6:408:ef::25)
 by CH3PR12MB8753.namprd12.prod.outlook.com (2603:10b6:610:178::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 12:53:45 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:ef:cafe::d2) by BN9PR03CA0710.outlook.office365.com
 (2603:10b6:408:ef::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 12:53:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Mon, 16 Mar 2026 12:53:44 +0000
Received: from yaz-khff2.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 07:53:43 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>
Subject: [PATCH v4 0/2] Incorporate DRAM address in EDAC messages
Date: Mon, 16 Mar 2026 08:53:22 -0400
Message-ID: <20260316125324.396889-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|CH3PR12MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 08dbb8d6-2e62-4652-4203-08de835b0efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	naFvGHUXy1B29KAmYFlgIr1flwU9LYkMOE4pNlwNnqK1tFMcAVAGsAPXEtdl2jEKFn5YWnkAZZ9Uqpxc5vdWpA1qy4IaLpGEkC/eeDPTbumvzzmeiTSBkI1zXyetkn3cmEa3d/7rhVlhRyPG+9TOGX/QJ6D+2K+CHF9nukPqfn75zUy10NRDn0qeOP0RzAIpH7xznDnDZHdBHz0MahnKlEC2Z9ivyOnaEfdrayDVRUaRzX8L2kjnDGPzujWeoe3OvDdI3PMQS1vo48l9MpghPBpyxeyn+dPXPAkyxorINVJWxnHGahCbWXmA2L4gh8fS7IfGFBzRNeNS8YHa19hxhYQ92XjypXJBXiatG/h0X4gkN/d9mJ6NU06a0wfS8BetdZ5hySMUedfJqS509/+MugRKiTXYntOE9S/mGjMEDfklEhIm7lHZRjvvs75ExGp7C51kENSIjBzLHQQ4PAqidgxJgBbotGcaf07wbMNtpaXMzqj/lvBp5o9zwU/p82+Eg3YxF8bsa69uZdGul+tMq2qiQioSn+AwdhgDGi31zpc/sziNc+7G1frKXRlqg8VD7B/kCPEHIpUR+SCS3PEe26o1rGuvltqi8QG3mR4JIaZvNqc3nMu53CF7sfKq1MpgUNUStKuFfAhE6QSc1txcDMt6QJflgjVInE4mu1C+NGwq81NPfkHkQFPBOxf0a15UvuNhBAsjIHJKEiFkafl37bNz4Ysu9Gfop2KTf8E1c2qJtwyIGb8h15yigsKREO2Od4401GZHpKNB648wmVX+dwHnTudsXe6QAFR+7HhJIpw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/WExZovW4v9P8maSUOFd+ZsvNXxeshn9Xfvcixtnw1VES7EdI6cy+Sit6LwjfVSRdhtN7Xt7zJADqP7srxRBgG/3t1uzpoMZKgNNQgLCYFs3zBa/5eCLnkYT/JC5zI+8lVlt85Z0O5tE2x0J3YSmEvjEjVL5h0pXs/wQ4Ue2zsSNMmv9hux0LvfL51lj3elj6NTqUwcEDjUjMyFCQgQAdG0y7XCSJTR33rxGHmDiwLLXiS7irC5Z/iPsPHyG2KRi//fH5zVeyIuj4+2wyocNf9Mx+L29qcFqd8Yv1zv7JG/moXsXxI17eoXNUjzVCWSU6w44NZ7hr5zjWODF8MXJThP5qC807aG9i+T17KZDYxD1VtzcKrUznvA5IiIE+u3PpVtB06y2Ma/yliRkFxC5bWfjvz5lgMMzgqX9vpFvXWsDx3CKb6z6jQnblU7f7lO8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 12:53:44.9365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08dbb8d6-2e62-4652-4203-08de835b0efb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8753

Hi all,

I'm sending this revision because Avadhut has left AMD. I've copied his
personal account for awareness.

Since the last revision, there has been offlist discussion about how to
provide the data and in what format. We settled on keeping Avadhut's
original idea of using the EDAC other_detail string. Other EDAC modules
do the same, and users are already familiar with parsing this data.

Thanks,
Yazen

Cc: Avadhut Naik <avanaik92@gmail.com>

Link:
https://lore.kernel.org/20251013193726.2221539-1-avadhut.naik@amd.com

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


base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
-- 
2.53.0

