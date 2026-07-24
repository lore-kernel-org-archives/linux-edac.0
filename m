Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B544C516;
	Fri, 24 Jul 2026 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913604; cv=fail; b=TYLoIxzQvSwQuqAiS/5TQFnbY5mvhuqI91MssAe/FbqLh5HVdJJMZuhqf4fqcE3pghNzjd2iEzJUl7Rp8yUJDCoDsHjeZYJG79wAgN066J0z//Bf6jOqvU85SrHcjjuHlRw/toH3DeEMJPxyhegqPUA+O9YTV5ynxvwP5KfjmXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913604; c=relaxed/simple;
	bh=Yt30JjVNeKdyqghL/z1+6tatKl7tSzobwJL2VmOiaxA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7qJ7K1d/F+rvDAEFsWlWkmg0FKjz9p0hT5A01Q4O8+NyM5wWW+97qz5x+ZeXXCrwQ8ym+Cw9VK8FN/X9Nx9H9SQjRiXK56NwapSaEx/m/alSAw5W57eOHCueYXomf95/z7jnxqDq041ANkSse2/uXYX376klWxKuzhzpi8RP9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ECmGKc/7; arc=fail smtp.client-ip=52.101.62.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ECmGKc/7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksKSlW8sGMsbGh3uWQhTTySkTPdR++JRK4SgZL85bMaS1F05mdWgaLeQZLPutqvbmI6ezqQxy4F2THvV6shZzHRhNdeiBZFo69iDvkXVSL5YxpP44lbtBuUaBuMKiENad5tehEnsutcvshjMSe8Y8dGpllhkd+fC8R7l6RGU9BWlw2nx1HKlkyWGZQNF/WXYwjRXAme2jeFZ2Z5/pxU/D5PwImgBeQv3/VvnOrCr8U3DENFCnc6OwTASoezbRco3UspBUbfIobeCZWDXuioQ62A5vsDUOPcSDPOJzam920BGakiPL/rtf8l1KEsPe/6+W/2Dx/uI4cuKl3KshFdRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTYLLnX0mO0SKb+rWhtbN/WTNZrMpTczh090RaqCIMQ=;
 b=Het0cLKlptqbBJeVaPr/8WkQ9f/yWkHXVAJqaiaTYh2Yu94mHLURqlRjZM187mBbIfudxQ6H27BDmxrachp2PkDSidOJKLMQFwNjS8ObBTu5r+gj6fPOkKKNX4v87NVesZJSctsvg8DMjrHERqVfePPInN9qMGxK84DmqXpF4cMZH9mwL+aZmuj8s9VYOrFzBqFP33p1D4h/qet/oZyK0eL5taTuSXHGIoX3NHX3JXjImFemwCeYetoGZENEKzEcK+PbFX4W0uokeVEEesk7sWYA0Bv2E6YTEOimYXP2cdLu/8LbNzDSJalk/yulf0za4XGNMDctP0B3AS0sKotMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTYLLnX0mO0SKb+rWhtbN/WTNZrMpTczh090RaqCIMQ=;
 b=ECmGKc/7Nz1PAmUK4t+8KsPSlM4HELg0t9BFEnO3h/TvgfiAnlf+GGCIN6IPJolVNwWlxX1Ffl7wtc9d9sQhzk3oBTPZjUJMGEmZ3crBsOXphTo55PCEHdJxJ7dnlpsJ9/sWLfuMKrWgBTrqlnqTd6eAjusl1BOrbBlW9j5haTc=
Received: from SA1P222CA0156.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::19)
 by SJ2PR12MB9191.namprd12.prod.outlook.com (2603:10b6:a03:55a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 17:19:55 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:3c3:cafe::66) by SA1P222CA0156.outlook.office365.com
 (2603:10b6:806:3c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 17:19:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 17:19:54 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:19:53 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 12:19:51 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/9] EDAC/versalnet: Add NULL check for mci in remove_one_mc()
Date: Fri, 24 Jul 2026 22:49:38 +0530
Message-ID: <20260724171945.2812749-3-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|SJ2PR12MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c3f597-e857-4c73-f58b-08dee9a7c73b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ydi8Gw/TUUkN5MmvK768ZpcAydecTKPwlqWvkEqrr4KKiESIHp+FkFu7+QOD2ALQp7pAgjqI55FRsnDdXVEpufTZZdWqmkP2oqHnD0okpJq1uuJSfpGNz32OLYIVIXeAHsBd7HnYFodM9OrVvwLT35GzBspCQtY0rzM5bK9bS4IDe9nutr9X7RIDJYstfBDPRy5qWdLFuy2MOdCgsV5T7nwaoL+qeSo5Br/o5WuQWP2d0fiozv8rLli5Notqnl7sQJBhZhuozxbfazaC5QbTb+FUrToFfhLdphz4Q1b9lRpGIZtzzxKarihBt+mwVq/IAqXLy6gjJqsG+K5oex7iJ5pzZbVm3tsxOgRp4bp2DeYBK2E1wf/r8OO0tOsyhkVznh7JxdYTekhbNInknv3j52Zh9Lrvu01YDLFKdT8X/A/y/x1mx+XL5076CbBiooMQpDD0MIJ/hhKyzVSMmDM+bmnkhxoKA3FLsY8zvkRR8X8wzR/Aob1lJhrtpA7l5aucgD6xR5PhCSX696yLgZjNcQuqUz7d10CkkyBN9K8P9WBuagXzbql7id9vrGDjyWiXacuCWzXEoBLwaKkf8godgSStcIwrD1wXPuqShhJm5Um2ir4NZT3IGJ3p2r82jq8/k9zk1S47KpaRq+us6ernmszAMOSFaxzzc7IEABjVkyePIa3yzF4GcAZRCqBB9K+mgLv7UneSgZfwnE5kA825Fg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bSfOPb+xkVnJuQIkEYrxG7oomPtmf8OmA4R310W4UXBG/OxtP4QYj3PHS+aYxoZr3beoCLEi2wvvn+sxVCR04rP+LSwjHDi00c8HALHXjbRF6djFRW9C74gVmis0RcJZrjgbFTzBL0Dakjtj++AiWJNAQDR3Tk4Yy/oxWwqGC8ZobMhmfsbmSBhj0WsWpJCh/MbWRZwA9GpRpPReLh6xkbHgOx/l0TCzE5li6RbETBd35SlRZe9zvC/bu3/fjcgdnnSggZCtcHCgKd6plC6eY2yb/A3WzMoxIw7328uABJn2ihYu1b/DNhUFqNC+8+X5a3uEUevZGDkEqB7aAtJtBFYSF8XyCt9xIieb+tk0GsOYnijaAtrvg49PrzeBJahlgUqGuj5GCwsrUQxRaFNJaZPlZhg6Vil26pIv5RQTDNf+u1EVpEaohFvu5gfhdYnv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 17:19:54.3951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c3f597-e857-4c73-f58b-08dee9a7c73b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9191

If a controller's configuration specifies an unrecognized bus width,
init_one_mc() returns 0 but skips allocating priv->mci[ctl_num], leaving
it NULL. On module unload or probe failure, remove_one_mc() is called for
all controllers and unconditionally dereferences priv->mci[i], causing a
kernel panic.

Add a NULL pointer check for mci before dereferencing it.

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000390
 Internal error: Oops: 0000000096000004 [#1] SMP
 Hardware name: Xilinx Versal NET VNX (DT)
 pc : mc_remove+0x34/0x88
 lr : mc_remove+0x4c/0x88
 Call trace:
  mc_remove+0x34/0x88
  platform_remove+0x2c/0x70
  device_remove+0x48/0x7c
  device_release_driver_internal+0x1c8/0x224
  device_driver_detach+0x18/0x28
  unbind_store+0xb4/0xb8

Fixes: 62a9fc50e8d9 ("EDAC/versalnet: Refactor memory controller initialization and cleanup")
Cc: stable@vger.kernel.org
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 316f8f79c4d8..05dc34504cc2 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -769,6 +769,9 @@ static void remove_one_mc(struct mc_priv *priv, int i)
 	struct mem_ctl_info *mci;
 
 	mci = priv->mci[i];
+	if (!mci)
+		return;
+
 	device_unregister(mci->pdev);
 	edac_mc_del_mc(mci->pdev);
 	edac_mc_free(mci);
-- 
2.34.1

