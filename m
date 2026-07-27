Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4B9429035;
	Mon, 27 Jul 2026 21:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187268; cv=fail; b=hUqDPL+9n3lBjdo+Al+JLXPHnAf8APjc3sO4E/xbDcqVTOc4/GL2UjXCKZYfnpeXB1eImLgtCHDxdR+eY8keCA8lHnHWyt/sGietyam7X0JnAYOQxs8hZJSUYxIBPEIvKDMNM3Gw9fCRx0tLxSWzI5zltU5SMCvOmQz2Js2De6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187268; c=relaxed/simple;
	bh=wvEL3J3/tYBRqO8vNKzhgFUTzFe7DW2sK+UDGHhD/2Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRvBkxOh7yM0WrFdCdloz2MPXyn/8R1djKclP6MdVTLpi3GzxHhlQ20uIMJ/9G2WJsBwGqjd6WRntop/AV8Ro0/ucPBH/cutWApHCoBPeI+hRVxiUkLggfbdmBxGhEdsNqeoRk0RcG6xyUcuF8klDrZpEqHTsM7ZBno1FNmX7oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nhaIVjch; arc=fail smtp.client-ip=40.93.195.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nhaIVjch"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpIGXKza5jLpVkP7bmGfp0GWqfi+PIHu0Vfmvl4k+Fegm+ZCahpPmBi6anBLYvuy8YGqVgFTuWxe4iviBjeKU3//gqYFS4Adx4UuDHIeJamf5V7uYDPCpftsouaMaVHDUc3aBK6S5mKCwB4DleyTSUNenz3RtRQb6e1p5UbSpHc4odO7+3FqYDLSHK6KVAEdDKDJR3wCPYVpzTf6ZXXunJmDX7egOyQiWYT7uZ002dsaVebBFqXmbVWTGLQaxUufHgVrzgRg06WQ0LtZXXUP+eYM/JyYD7J3czNJR9gO/aiyaN4ephQPtHmPz3mlrsx4kz1AygI/ohms4djvD5MJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hChFGwn3q1aYwp6DaEjjrcJXjiyJwV7Rd/5OXitJsSo=;
 b=gQ8bNJLY4j7FYBmVV5o03sZVbiOpz/pX9A4DjS/RZnTg2kCiUrYVddLVylxH1VRnH5g1oLSu2CHFGTN2lDAHbh6Ua5w0oTf0nNstRzlE/aJWCt87tlxeGxog/XnMJpftBMtBjmPNMK4dkTz7l7o28PxtBmY+CZ6d6wiIXXkuGyWqxhBl4zAOb704Uy4cw9r9n7NozY+8FeRvzR+JxkEq/f1uLDoCp7JyfE2PiANbZv6QS9mVSTFmeIdLXBAmY6rWNySR+gI856b/w+fFs7HAt5zhV3Y7HDxlelH0T7B7dj+PGVqBjR15VSuKC9srkLa/HEF09q0u6S2XvAGDg9n/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hChFGwn3q1aYwp6DaEjjrcJXjiyJwV7Rd/5OXitJsSo=;
 b=nhaIVjchLakubnDTKCVa5tVEBE38vG75sQbbyaHJZFJ6LYCYgB6Hh10D4xYn+CtykW87M1Eyy5Ica8f4ezzJ7CL/Ce8xDfcN/+s+cpRm1RnOTpLobhZRX4WPqesPvCZeq7Ig9Q9XGu3qXCl/pyukgEYT8Y6lZJTcByDJDXFCwhM=
Received: from BN9PR03CA0193.namprd03.prod.outlook.com (2603:10b6:408:f9::18)
 by IA0PR12MB9046.namprd12.prod.outlook.com (2603:10b6:208:405::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 21:21:03 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::3) by BN9PR03CA0193.outlook.office365.com
 (2603:10b6:408:f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 21:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 21:21:03 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 16:20:59 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v8 4/7] RAS/AMD/ATL: Use unified interface for SPA translation
Date: Mon, 27 Jul 2026 17:20:42 -0400
Message-ID: <20260727212045.1810480-5-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|IA0PR12MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e099eb-e949-48c4-fa21-08deec24f66f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HXsalIfI4LLHFwOkkTl7iQV5S+YpcLtFsh5Z8/250xddvZMMCauONLWpB2J1mgbPzLEax20bkY9IhAKu6w6DyLVsXbbRqAdR1jtSsEvlrV5PgGH1GogT2QMUWQ/lovL2PB6du2u29JPdY0YMaDljmoNqMDE94WORQKpz9Xl4GTTtbn+hZ+fogPGCSywPm0P5TauAUmqLe0i3RBCYly3UFvYdMXdLMOrS6V1MSgnQmS3VGFbBCb44VMAmMAXx1pvG/wO893gztjN0xRzOlHPK5aCXX+mANd7Yex+L5ZTjmZ32DmOP/nQuQCGAIFb0RbCHhDDfm0I4sEnRgAMC+Vji2fKfAPmNVIzxMyV3WHsc/x8hdul7dUp/P+vFnmzr42EgUrBOfXvnA4b/Wqi/YtrqgytJHUx9SaR3ro8Jzi1V7Slv0qTgL9TMa3RtWt8YhwK47UzmGOwGdXengVbJhoRJTF4tEhloPyxuhCDYIRlOGXtzCvZ30VgkTECamPSoi/MaUm8kuN+pqbAEVp1pT2XYwMdInI9rCTGNAIfr4GBXZISPZfvxda7nRc5pInqeek2bLFyAEf8LPNOkz45A0UUBTmDclu/e/mQsLVPaZdVG408mcclVEQqBYoXqSRO1dcPezR3UWTFw0M3t4i/VvYzLd+4roqEr0Og4Y4advq8bAzAo0kwLfSIbBREROllP45BoYn/MrCZ+74U8pYVn3kyqlA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ndlHkWdMqVjnOHNdJzoMdsTi8fboc72G2mpONhFNAUI2t1glgkPtJedWzpsuraBWek6p9MO2nw+pr/HWNWxmvdMTtrzXK7U3AtxpIo9INeVbUn4hcfRm7kwWpW8lIZNJ919VscRlbBeXi0HWVg/Ho03eEiA1JJArNSvR4w0nSG5Iu5lXyX+PcU2NS4WaJZf18XLFm4z1/HbD7YI0EyPVdL1iifEYEJslZArHZiPuRHbTcL0mWtUX7Gtuh9kEFkL+rmrCPxBVhqco0jJl4ruQBNHpWYgxrkDmY88hlXas6AWmkoSC57T9LFpot+9fSSCRBktqxlxJb2RyPHfjVix7vX/WyAH03ah8ypLJsSXt86JyIykSC7OlnPtCEcNL6reqD1jvUyWzdXJJDPn2GxOhHbOXKdfByiRjQxDimKiU0uCzkG7UT+xjqALnvPSBNicF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 21:21:03.0284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e099eb-e949-48c4-fa21-08deec24f66f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9046

Switch all users of the ATL SPA translation function to the new unified
interface.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 15 +++++++--------
 drivers/edac/amd64_edac.h |  2 ++
 drivers/ras/amd/atl/umc.c |  9 ++++++---
 drivers/ras/amd/fmpm.c    | 10 +++++-----
 4 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 475235c402e8..f428d815bff1 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2809,9 +2809,7 @@ static void decode_umc_error(int node_id, struct mce *m)
 {
 	u8 ecc_type = (m->status >> 45) & 0x3;
 	struct mem_ctl_info *mci;
-	unsigned long sys_addr;
 	struct amd64_pvt *pvt;
-	struct atl_err a_err;
 	struct err_info err;
 
 	node_id = fixup_node_id(node_id, m);
@@ -2843,17 +2841,18 @@ static void decode_umc_error(int node_id, struct mce *m)
 
 	pvt->ops->get_err_info(m, &err);
 
-	a_err.addr = m->addr;
-	a_err.ipid = m->ipid;
-	a_err.cpu  = m->extcpu;
+	err.a_err.addr      = m->addr;
+	err.a_err.ipid      = m->ipid;
+	err.a_err.cpu       = m->extcpu;
+	err.a_err.requested = ATL_OP_SPA;
 
-	sys_addr = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
-	if (IS_ERR_VALUE(sys_addr)) {
+	amd_translate_umc_mca_addr(&err.a_err);
+	if (!(err.a_err.valid & ATL_OP_SPA)) {
 		err.err_code = ERR_NORM_ADDR;
 		goto log_error;
 	}
 
-	error_address_to_page_and_offset(sys_addr, &err);
+	error_address_to_page_and_offset(err.a_err.spa, &err);
 
 log_error:
 	__log_ecc_error(mci, &err, ecc_type);
diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
index 1757c1b99fc8..b11da6fdf0fc 100644
--- a/drivers/edac/amd64_edac.h
+++ b/drivers/edac/amd64_edac.h
@@ -17,6 +17,7 @@
 #include <linux/mmzone.h>
 #include <linux/edac.h>
 #include <linux/bitfield.h>
+#include <linux/ras.h>
 #include <asm/cpu_device_id.h>
 #include <asm/msr.h>
 #include "edac_module.h"
@@ -400,6 +401,7 @@ struct err_info {
 	u16 syndrome;
 	u32 page;
 	u32 offset;
+	struct atl_err a_err;
 };
 
 static inline u32 get_umc_base(u8 channel)
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index c22bc98104ee..33a9ab7b959b 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -314,15 +314,18 @@ static void _retire_row_mi300(struct atl_err *a_err)
 	struct page *p;
 	u8 col;
 
+	a_err->requested = ATL_OP_SPA;
+
 	for (col = 0; col < MI300_NUM_COL; col++) {
 		a_err->addr &= ~MI300_UMC_MCA_COL;
 		a_err->addr |= FIELD_PREP(MI300_UMC_MCA_COL, col);
 
-		addr = amd_convert_umc_mca_addr_to_sys_addr(a_err);
-		if (IS_ERR_VALUE(addr))
+		a_err->valid = 0;
+		amd_atl_umc_translate_addr(a_err);
+		if (!(a_err->valid & ATL_OP_SPA))
 			continue;
 
-		addr = PHYS_PFN(addr);
+		addr = PHYS_PFN(a_err->spa);
 
 		/*
 		 * Skip invalid or already poisoned pages to avoid unnecessary
diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 4ccaaf7b70bf..21f645197410 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -302,7 +302,6 @@ static void save_spa(struct fru_rec *rec, unsigned int entry,
 {
 	unsigned int i, fru_idx, spa_entry;
 	struct atl_err a_err;
-	unsigned long spa;
 
 	if (entry >= max_nr_entries) {
 		pr_warn_once("FRU descriptor entry %d out-of-bounds (max: %d)\n",
@@ -328,19 +327,20 @@ static void save_spa(struct fru_rec *rec, unsigned int entry,
 		return;
 	}
 
-	memset(&a_err, 0, sizeof(struct atl_err));
+	memset(&a_err, 0, sizeof(a_err));
 
 	a_err.addr = addr;
 	a_err.ipid = id;
 	a_err.cpu  = cpu;
+	a_err.requested = ATL_OP_SPA;
 
-	spa = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
-	if (IS_ERR_VALUE(spa)) {
+	amd_translate_umc_mca_addr(&a_err);
+	if (!(a_err.valid & ATL_OP_SPA)) {
 		pr_debug("Failed to get system address\n");
 		return;
 	}
 
-	spa_entries[spa_entry] = spa;
+	spa_entries[spa_entry] = a_err.spa;
 	pr_debug("fru_idx: %u, entry: %u, spa_entry: %u, spa: 0x%016llx\n",
 		 fru_idx, entry, spa_entry, spa_entries[spa_entry]);
 }
-- 
2.53.0

