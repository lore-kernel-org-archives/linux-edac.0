Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012003.outbound.protection.outlook.com [40.107.200.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6181429035;
	Mon, 27 Jul 2026 21:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187263; cv=fail; b=V6NoDhJQmGtxvLVBCHnwgz7FWoDnNWqutYBqfmoKi3+S2AV/ju0gC1DezgWvcGErcSHnhuzfnCZtgNv/CNjgPwG//sgidAe+50wygctnqLjSApsGIxg3DluLfXKUGXNBwsOeJrNOE9rmYjbi1OwXJx8qkiI1b4mU/rRv244V6oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187263; c=relaxed/simple;
	bh=4MfIIuWPRA/LboEMkq3PoyXLaKFBLPyYwF/eXrW5XFY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFwB9+5vQ6jVM84r9bHNL13IoAJ8ZvcoMqOw89tp7ThP9/MXYhcN3p7zIYyd4UBu6TTDFz36kRl+QhvyKzD2N89wlqMzbcylazAMyN6VyJriTN93uVPME5yb2HjAL2HSpMx8n0XoKH3RYYg9nXWCWuQqXnlFYiaOTLsAudywIeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FRxnMcpH; arc=fail smtp.client-ip=40.107.200.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FRxnMcpH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ekegqt+EDphawiHj8UBeomyYYBx4nYmjzvFJ0TpBIbk6cmOCguZsGVd1mOcMdCm/ZXZI4wic5hfwDwl+6+lecvbdmvzcJ1U9DNT3KhKO4aWmL7Ov+/Ai7qlULBtATixMbrTJhUZZ9YEtQB9K9fvN1BVLVI6nmdoNmyafBu3qNq7foqr+lpWfX9wmXTugKxACF4nn5kF1oxWfXDVZ41lQb8GvtQGfx0xaMCPcBa7Eetuzl4ETNth+QHyamuzNpLGlp870CtVouWGD9q2b0NJIJWO7j/sbA8Ve1i0v7ocBIo7Zsnl1R4aACeWEZqe+KjIguPG5/Xoi7zMENLbKKajQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoQZFR8zEjJDHUlXcevZjmXY6XBveMW4V62Ywo//2IQ=;
 b=exXqATPOJ1iQOfDAG1Nk+pCbJrZo57kbxgz7mg8tM7oi5lwAUrgE5BqBTS12BcTgALgp7SWo0E67EOXalOswHJ4MyFHndDPluTkr0icQHL7brUwQHNGp/OZjw0yqJkKCocRLOICwVtV0hKm8rtHxE4cd6GoLd7BCsk1hmX97U7cRokvEoxvqPkSNqE5Lht6P72KZyTQ/KmdM0V3BOSkUW9/tfy79+V0+JW+JNsyEKBOeu4Rb3jal4XlhD3DD3gGRQ7zRRI9Vxf+7soaE5kkEhkLoVfWJHTXFkl9blqOdiJCqSR6AsUMZNd5VHfslAlL3Z1lV05yQ21LzXzljBn0K1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoQZFR8zEjJDHUlXcevZjmXY6XBveMW4V62Ywo//2IQ=;
 b=FRxnMcpHqhK1T2li2o8ywz59CFGQ+zT9osISvm+d5+V8PzdFATQp+Kzb4UsLVQNhGm1vkqESF8rOzhG7WEb+eEg3Be8wTlWNva4x6QztRxrzYwGhwzZJc0aAZpRi0J/+5QP2SnvlL2P3UF4mB+SjBcnrY+HEyDwBipVPhRYq4zU=
Received: from BN9PR03CA0508.namprd03.prod.outlook.com (2603:10b6:408:130::33)
 by LV3PR12MB9438.namprd12.prod.outlook.com (2603:10b6:408:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 21:20:58 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::a0) by BN9PR03CA0508.outlook.office365.com
 (2603:10b6:408:130::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 21:20:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 21:20:58 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 16:20:56 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v8 1/7] RAS/AMD/ATL: Always build PRM address translation support
Date: Mon, 27 Jul 2026 17:20:39 -0400
Message-ID: <20260727212045.1810480-2-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727212045.1810480-1-yazen.ghannam@amd.com>
References: <20260727212045.1810480-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|LV3PR12MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aae9e65-3bdd-4703-41c6-08deec24f38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nKA2YzB4FA5F2bNtpIciDbp5A5/vAdKEV9jcW39sefliyPBqjS3CgbSiHOKQ4HjTPixysk1B5V1sQzqY5lBcTO01R2/wBZ+nmd7OlMBbpI42EvE+LOFKihYpgUe0T4b/+3MtGaa+0UUJzvr/r6V7s3YcK1aKJNd0B9xoYLQtFXqO+QmLrXWqlsOpjEHiu0f7Ig6xjL665pMg7K2TQGfQQZYoZrNOa75PrA3eB4vCadGT/QXQxGeAo4u+qX5h22VZcZLm3nCS9fV9x6djIHad6Hihhn4q3Wh3nHSIZj7weVBBSUeCIEqBt3UrAnN6YigUt8ViJ4xSk7mdXC+DAOUEwM1D9vwv08FylGt0mGR/6MXnMIIQ3YsgJ8suCvnDNgJTmUJQGjm0YamddFLHIr3iRXvyNxFI+/ORYJ3zSO6twDSrTLwHP1j2255ZA28qLETUwBc5R5wbpWAQQ5jX/FmI3TKwz5j6gq99lucIKSb6COBLUjaxPqkRq2HXQXIuEaJlQ5SJo6c92QNsjqeCMyPyZuofwpBUQ2xnq2mPa1yrrUhRXsaWGFeJzPe5REZChDjK99NgmPyaIXPoA7fUBOnmxmKyTT1WTGoGBRmHwDC5WvLIAQqhYFW7djG0cWT1bhx5tQ6/VR/1iWUVDF1mGp9mm3KCqOdIbzQkOarlkaYTj7jbGdb7fmqWqm+QWePXXuPE6bo0DdrGX44/bP9erR6r0A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HEINSEYiKHmJOnmCbt3E6pe+lYYSwsAxDix/9uQ7bOOUeYvMce4EfbpppvMU81hmK3X7WOQvExte2pRxP07/fVrGiN8mMeBa+pV+h49cZMEE6Kj0aPbkqs8CufNzl4YKAKdH+qE40F3olCXT7z7R9aiYzW1aWDzaVHtNY7XhR4wTa+mdZnKhyPBH+PV1LRwaAjWtF5n1UQJHsczqKQY7iuJVU5EyJ3ItIhE0xlXgHqgMV5V82RLYCij4eK182XXQ0XqRgSkPkdZEy4NoemVukfcQW3t6EPqJthvZcpu393SaG9Qh8y70sxlRukd5kx9pt7JIMHzlEp1rh+B4/HghNiHrGdHyijn4O9pFT9rGylXf9JrWD9FZkICRwt2muu1tdbVcjGPPSt7EVksu+WhEQCmwAOdvNYGjQWGRtvyVwFVVChboBDoKc7Frz02vPW06
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 21:20:58.1675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aae9e65-3bdd-4703-41c6-08deec24f38a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9438

PRM (Platform Runtime Mechanism) is the only address translation method for
current and future AMD systems. The library should therefore always include
it.

The PRM helpers in <linux/prmt.h> already provide stubs that return an
error when CONFIG_ACPI_PRMT is disabled. This lets prm.c build and link
in all configurations. The library then falls back to native translation
at runtime when no PRM handler is available.

Drop the CONFIG_AMD_ATL_PRM option. Build prm.o unconditionally and remove
the now-unneeded stub for prm_umc_norm_to_sys_addr().

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/Kconfig    | 4 ----
 drivers/ras/amd/atl/Makefile   | 3 +--
 drivers/ras/amd/atl/internal.h | 8 --------
 3 files changed, 1 insertion(+), 14 deletions(-)

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
-- 
2.53.0

