Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F5A35FF5B;
	Thu, 30 Jul 2026 19:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440944; cv=fail; b=m56fIMtpqcF/NAY64R7Yn9kP3+4KHg9T9xB3HxaNSfxVvo4lXk+QKAgZnMkweRwDIzenGE4h4fip8+0/KhH94Sg6HmWz47x+aNoE9uL6Q/KumYzHs2NFvNYOn+MmunNTXrIMdeBlNpXJXmBBiK/M9yUom0//WtsjnVdTzipWf8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440944; c=relaxed/simple;
	bh=dQ/adO5I8KqkncgTrq+dRlwUACEOmJ41QhBH0wv2Ma0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SKPR7S/hBwnrgcyYYde6lYINoBBH2KW5Ytfx8gOjwERE6ChoIiFbLKRZJ2V4n6OI3ewJciLS6rvIW/qKO07yATK9sNRDAh3rJ16cy91HUjAGx6sFlJiTnDhuJmPNkgeO2um//zWz/FsOi8zopY8IxMwjtugQcbP6AUzwzLD5y3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H8LZas+f; arc=fail smtp.client-ip=52.101.48.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H8LZas+f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbdqteu2GtsRMgMT8vJCNO7ZJxKe0GvN3qkQUj6QdeYD/YY3sSdQQRQD8YbeNgAZCx90HcluwlouE0lhJPcBVIfGaD1qAGdfixm4W9SAzu6mjq0tVypI5NbF3ggyQRq3hErPdxHKlQOMkL4nMCp7h2GUBpsE5anCoU55tEjDqGwPNeuc3hbEd5qglVRHqiK4G2BtsLxKQNCKgca2GGohOQWG4ZsM1KJf+ysCGmZI/GqN7cChsE8purRFrelw4m3h7lR1499/xi3aey8KpXIaRAzNpkRlk/Pll/eBLz4x4wuOmjRC+iqlTCZGlr46Fy0T6ub1lNesWH5tAx4mK6d+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQinULgEFzMDbuiocK3HH/NW05rVchmzyXZ0GwM+6+c=;
 b=Qjb1yvMtZADtiKceX36cmUarpTEADansXNZwuGHTLsqLuV7nfXdI1o3L76w/Hfgw9JYdsptMrdTICdXOwoGFp6X7eQNOg8rRLr1F2khRMgqQ3XzPu4/ZKJd8bvOq4eD6WC/BfNpVesfq8/vp3oyyYSFulxijEDzCcaWCf3+iokdGiwWrrKaOJnuVpZdwdmgF+9ztptf+6ZcfXpNx1f/Xaw5932KHw8QN9sZEKFQctYy4KPfs0q1PXWeQyHNcnNqr8y0qb6/Pv5HzHcysey8yp+4wKDsO7nR99gqce8jDFyArYox8p9PQgPYsW3h6HnCoPWHo0Rtgvc7ND2/GyKUgMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQinULgEFzMDbuiocK3HH/NW05rVchmzyXZ0GwM+6+c=;
 b=H8LZas+fgFtCBUgxtcM1uMLPVLKnw2e8UfTlTvigvb7p6yQKDWOxuo2MH3ghGsw6UldZrK8LZcTpldzBANqaONIkkmZHzacDL64x2jhGM4tWGqb66i7TrGnJu93FWlxDxbwMoJ9HM0Y6elyMGyVFhIADPbFV74VblsuIvMGzmug=
Received: from DS7PR03CA0231.namprd03.prod.outlook.com (2603:10b6:5:3ba::26)
 by CY8PR12MB7659.namprd12.prod.outlook.com (2603:10b6:930:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 19:48:47 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:3ba:cafe::15) by DS7PR03CA0231.outlook.office365.com
 (2603:10b6:5:3ba::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Thu,
 30 Jul 2026 19:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 19:48:47 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 30 Jul
 2026 14:48:46 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v9 1/7] RAS/AMD/ATL: Always build PRM address translation support
Date: Thu, 30 Jul 2026 15:48:28 -0400
Message-ID: <20260730194834.3203601-2-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730194834.3203601-1-yazen.ghannam@amd.com>
References: <20260730194834.3203601-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|CY8PR12MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8f689a-d6ca-4239-d0c3-08deee739232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|6133799003|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	RLvPyZqYMovmG26bUWkVU1zNZ+lo8b+b86bqXyxOWT1qqYHfl7DdtTZUroJt/mP2L6Hi7xt0MKdDQPqUoQ/CH2KpQugY9zA1S6Wu3klSyQf1GPLDTFSp1ku2aHo89Bo6693KP0DwFMxsNPs75cBa7Imy2dViJQpHEU1aJ3kQDwGXX/h4JUtRGb/fu9pjh3EwiPtJqwwVpf28nkkX3+xRmud7uTdxkVNQO5WU7N/YEDA8gZH26qlQ0MObDL9rsIuiLOUlMx6DYhhqWwQpPrGkAHyljDoPcTih3jm06cMMNVZ0DCeFpS9qSa4mbVe8SGWkjNmY6F9CIhcfXFSrWuxZxFaz2cWLazn7N2CWVT9Z/LbmtigjSu3IYnGUUjdgNKNK9hZyRkYJgP71Tc2R5ONu0K615E/5FR8t4O6rHVm28QuSgC9qSxjkxexcdt6d87cHwbTygmeC0VyagDH6KVajazFYK3h76GETr/OeFo9A02vu2c7TnpUu1LXQ/s0N1IVqEa9osqxbe/EggoA7EPZlLz52oxFdrAywXF9rH5QHl3xCY4zYZyb+OAwP89d482NbX/sZmvVLsRiv2uubeCWSBHmryUulP+X43qrXJ3XQpLA9kI2xtWVTvWiIguXIHdpqPwzuS2aCD6qCXccl5ij8uNkwT63ZsYBDOZYRWUiikj8bYh6Tvotq/ATp390u709H18BtosUFoA9zErIn4ERE9w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3thD7x+VrWI9EY91vv8n87yllZ4S3YdBpCLYevqXOR6U3d51cE3KF79XQ5EEBJu7EvrAsa50szXUYl0F1E16YPhsitdzMo/u73nqHOWZjoa3li8SiXP+NQGgCMIJR9ftW1LvkOJBcmvMfmpKrvwvXQjdDKeEIyDlHyoxCLeQA7j4H4f43m/HCMDNvdQqEB6ztlAmrVUx/9Q6GAA8Q4v1tNm/WvwR8Z1BVzDjFNMNfNAMZzKsFKW2MB35DKH9vW/RBLI+k/XN1qx/ll5G3USFbCi6CMYzz9fKlBswDrPpbnoiy8HjrLQbZ01+3yW0cmkvJQLGFn73XG8GELAjmbtIpVNCgkGk+OsGzuua0plKQauOS6LJkyetlXF7G+oVckXz8DoOoqSWO//GzhyVgxkjMBQHCp92iIsQtudxmaCrnpptptWp+4Tnmq3dOm78SFpq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 19:48:47.3854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8f689a-d6ca-4239-d0c3-08deee739232
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7659

PRM (Platform Runtime Mechanism) is the only address translation method for
current and future AMD systems. The library should therefore always include
it.

The PRM helpers in <linux/prmt.h> already provide stubs that return an
error when CONFIG_ACPI_PRMT is disabled. This lets prm.c build and link
in all configurations. The library then falls back to native translation
at runtime when no PRM handler is available.

Drop the CONFIG_AMD_ATL_PRM option. Build prm.o unconditionally and remove
the now-unneeded stub for prm_umc_norm_to_sys_addr().

Add -EOPNOTSUPP as "PRM not available". The acpi_call_prm_handler() stub
returns this when CONFIG_ACPI_PRMT=n.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/Kconfig    | 4 ----
 drivers/ras/amd/atl/Makefile   | 3 +--
 drivers/ras/amd/atl/internal.h | 8 --------
 drivers/ras/amd/atl/prm.c      | 2 +-
 4 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/ras/amd/atl/Kconfig b/drivers/ras/amd/atl/Kconfig
index 44c2fd7febc5..29befaf2a1e2 100644
--- a/drivers/ras/amd/atl/Kconfig
+++ b/drivers/ras/amd/atl/Kconfig
@@ -19,7 +19,3 @@ config AMD_ATL
 
 	  Enable this option if using DRAM ECC on Zen-based systems
 	  and OS-based error handling.
-
-config AMD_ATL_PRM
-	depends on AMD_ATL && ACPI_PRMT
-	def_bool y
diff --git a/drivers/ras/amd/atl/Makefile b/drivers/ras/amd/atl/Makefile
index b56892c0c0d9..ff52452b678f 100644
--- a/drivers/ras/amd/atl/Makefile
+++ b/drivers/ras/amd/atl/Makefile
@@ -12,9 +12,8 @@ amd_atl-y		+= core.o
 amd_atl-y		+= dehash.o
 amd_atl-y		+= denormalize.o
 amd_atl-y		+= map.o
+amd_atl-y		+= prm.o
 amd_atl-y		+= system.o
 amd_atl-y		+= umc.o
 
-amd_atl-$(CONFIG_AMD_ATL_PRM) += prm.o
-
 obj-$(CONFIG_AMD_ATL)	+= amd_atl.o
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 82a56d9c2be1..4fc4bc3c3500 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -287,15 +287,7 @@ u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
 
-#ifdef CONFIG_AMD_ATL_PRM
 unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id, unsigned long addr);
-#else
-static inline unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id,
-						     unsigned long addr)
-{
-       return -ENODEV;
-}
-#endif
 
 /*
  * Make a gap in @data that is @num_bits long starting at @bit_num.
diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
index 0f9bfa96e16a..eba9d104d09e 100644
--- a/drivers/ras/amd/atl/prm.c
+++ b/drivers/ras/amd/atl/prm.c
@@ -44,7 +44,7 @@ unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long
 	if (!ret)
 		return ret_addr;
 
-	if (ret == -ENODEV)
+	if (ret == -ENODEV || ret == -EOPNOTSUPP)
 		pr_debug("PRM module/handler not available\n");
 	else
 		pr_notice_once("PRM address translation failed\n");
-- 
2.53.0

