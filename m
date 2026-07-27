Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011061.outbound.protection.outlook.com [40.93.194.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609D42BE9E;
	Mon, 27 Jul 2026 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187278; cv=fail; b=D0lDxgbnwiuFAvNZZ/iG5iunjK8Y/RVhewXBgmomW86W4E56+TzLWekk87gO2ZbJpn3uca0u/onUNag+3t6VRnvyJKX7vKLpyJgL+PWNxTYMb5MWRaCFbDQSXnvUBO9kjpZBOcWlnoKhzPI2glJbczN3ZHHvNeL9q93G4fbQsd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187278; c=relaxed/simple;
	bh=XAmoyae+VjMfnUluA+YKalKRPo9woprRhWpVqrR75PU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KhpVHEW31r2c3g4t7i2Tne6tzp4sW+KxGQ0wP63iASn8hJvc9iRgSePGTpDTUViIL+cPiFoAlSukTuR72JnPBvfPLsqoNeJjDpmKnP6cBGESktpP9cEL8MxtWcqY/PS1wwqFqUpqHMkaSwJsaX8nvDfUYMoCXZCc7hbiahnXGRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LE0m4M+R; arc=fail smtp.client-ip=40.93.194.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LE0m4M+R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khH0e4cfaak1nXrSHVsHiY3fSENiq2nGClB46dv5kL9AxNRRAcaIxDNRraDZdz4GWHyNrzfF/iRiap7WVx5GmGC2yXvroUsjJZsEl0mW23AtDuYT+RXuQuUMxC+qz4FyaOaqCzyfgy0Vzilm52yV7F85Wfxf9vyTgHDTboyTIVxUoS8aiH8tjSeoX1Ys/TsPx1EiV6p+3CMOvnLQSGpNPxlrVN20Hl60ZbLKZwFoktTE2qfAcGBydZ7QEptzNiRhlwDMnR9ti+95TgyiuUW7wGz+J77L1ccCpAvc9kHKYyKrnSEHrD1iQhI8Ds3+t5DcYDO+ahJvnzbRgsABmOzyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=op/KwlQ8rpKuXBRruj3PSE5uOpohobLuCXp34j1C+PY=;
 b=qh7psSONNBZn4mtVncEMFxM1O2uFy6V5wvlSVzoY66bJFf8IDvtfsy8scKIL8QZvBTNpKfkTx1uSyc4FBjFr/WM54jQBSRV7bpswA3n1RbDMUTXlMfIPQcfmFVNuxOD+TZv2pIMWg/9x0zrPmF3/Efkm07URZ1yXwGImchbvQVv60thvBCQjSMKdrS5lbadfUTokKFgDbfh316JALQoI9iuNP0ghtvG+RbHqIjlhyQK9zZKp5SV64wPFiMQ6lMPK6mwr4Frz+De2Ub8t9H5gLsX/Ki9OYl57Kd2SPIETDNWXB+XaxjFWqnyGtpNEdZ5Vbm0UA5UiIfnxLBll/OJpuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=op/KwlQ8rpKuXBRruj3PSE5uOpohobLuCXp34j1C+PY=;
 b=LE0m4M+RR+dj0h8c7Hu+184cBkHNN6qc0G7MfUNfg6AYqU2IeQ/UuuiStIUVPVmUkWWQUMABJ/X4SHdVOpNK43oOt5eyt1fmX0vi6MXairUYeL1UPBxc4wK90jLLgmILS5OWlP6e+gs34ev3CdauwoCegcairNGlE6DSZ5Lm/Qw=
Received: from BN9PR03CA0496.namprd03.prod.outlook.com (2603:10b6:408:130::21)
 by SA1PR12MB9245.namprd12.prod.outlook.com (2603:10b6:806:3a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 21:20:58 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::3e) by BN9PR03CA0496.outlook.office365.com
 (2603:10b6:408:130::21) with Microsoft SMTP Server (version=TLS1_3,
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
 2026 16:20:57 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v8 2/7] RAS/AMD/ATL: Refactor PRM address translation into a common helper
Date: Mon, 27 Jul 2026 17:20:40 -0400
Message-ID: <20260727212045.1810480-3-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SA1PR12MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: b59d4845-3863-4e10-1ea6-08deec24f3a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|56012099006|10067099003|5023799004|11063799006|20046099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BxkPzhZgASmiaXjScX6IXsx+Vpf4ClXxqAOnTvgPpQr0I9K0N+Ll5+kLHobF9zID+MnXaGqNRxsigIhAM9TzVA1Y+9i/kBADIor/Lqj1PZLth9CAQXaKpj149lEj9qiiBYiUuKt7sRrSMoebGXT3DM1syEAZT5YXuo3eb8v5KDIUi6Tk/NA2xwjKcatUwUNeJCA3/jfQTsWg/1xenXsdjcAv7xZqpIEXQjmJ+VJYiOA7ork1rcnu/ZPz/wTxGJ83WvG9oG9W5fE+JIHiIxJHasN0O7DH8AWv2j1KJSKeYZoouaHV+5qZb5yJT20RfZFMPHKgU2vBRqmOdEsBPXPuEhX+mJC8ysXC7J0UdV8JpcrvqvHdnEcp7zCvem3sQgFNZznQ6gqG4OTONJ+iAfI/TlKrtuVonNeei6BXkVXDhY9CBjwntP3T9rceTUvxKQspv295AsNde3m2z1vmuBt4hd2kKNV8RKDLS5LA5QLmw9CQ0tuuIryFQeffePHK3MwzQFMmSdb40hht6+bK5TGZWeiyA93ovxqOjDG05DNKJAnvZ7D+o7+EPq9cRKJK8z4Ba4jA3wUswbzwo/xPHx2YTN8HFzs9cFLiQt+aGopDqxSfxj6anM5qGOcoT3qN6Gw35SKbkqToGsnqRgF2i7JTusUI+e1zo8Y2Y8vxBkycjPprGyT9SBs1BUTwcUcFYrDiIfmGogFu9eyWDNloi5AzTQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(10067099003)(5023799004)(11063799006)(20046099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dBZdk4rpc7J/LtDoW80mx3ibhj7kNZa2j1tVqsQpH7jpe+a7NiogckmFodpnz8/mLZv/Zu/6DGo5lUUF8jI00+SL6+2XdtOPbZFP/pcTKEdQvU3gk+6GrWzi8MTpgWm6tTr7xG/56ld/BHo3Fyce9OJlDYzAy8W1QcWDmPXNs9CnoSTnfhwzDSPIwudVarCH+765lu4uaS42wwJD/PkTdY3gg6Wy4WotAWoYfJBwA/2w2ulbt6FFzy8ldd0WqC69CsL6tUwlLeEdPSVfYWNcQjODh9RWWcxxJDx3ER/FxqealeZu+r8PsoVS73svQiGh8Q+jRjIyOQcA06BbGejKChRNO3E8D08Qd/TkaQRdZp44f/ojLIDGpqJwON4wMh0QZGo0pDzL3PJwnvVlOnXMQ0mAF3IMCz2wsgSD/LEFzCEsM4aYr9Gpa1ffvZf6TRzr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 21:20:58.3627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b59d4845-3863-4e10-1ea6-08deec24f3a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9245

Every PRM address translation follows the same pattern. Each fills a
parameter buffer, invokes the handler, and checks the result. Only the
handler GUID and the output buffer differ.

Factor this common sequence into prm_umc_norm_to_addr(). Convert
prm_umc_norm_to_sys_addr() to use it. Rename the parameter buffer struct
accordingly. The struct is no longer specific to the system physical
address translation. Also include the error code in the failure message to
make it more informative.

This is in preparation for adding more PRM address translation handlers.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/internal.h |  2 ++
 drivers/ras/amd/atl/prm.c      | 35 +++++++++++++++++++++-------------
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 4fc4bc3c3500..9f4d2a5b6c14 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -287,6 +287,8 @@ u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
 
+int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 umc_bank_inst_id,
+			 unsigned long addr, void *out_buf);
 unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id, unsigned long addr);
 
 /*
diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
index 0f9bfa96e16a..0934f890745d 100644
--- a/drivers/ras/amd/atl/prm.c
+++ b/drivers/ras/amd/atl/prm.c
@@ -18,36 +18,45 @@
 
 #include <linux/prmt.h>
 
-/*
- * PRM parameter buffer - normalized to system physical address, as described
- * in the "PRM Parameter Buffer" section of the AMD ACPI Porting Guide.
- */
-struct norm_to_sys_param_buf {
+/* See "PRM Parameter Buffer" in the AMD ACPI Porting Guide. */
+struct param_buf {
 	u64 norm_addr;
 	u8 socket;
 	u64 bank_id;
 	void *out_buf;
 } __packed;
 
-unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
+int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 bank_id,
+			 unsigned long addr, void *out_buf)
 {
-	struct norm_to_sys_param_buf p_buf;
-	unsigned long ret_addr;
+	struct param_buf p_buf;
 	int ret;
 
 	p_buf.norm_addr = addr;
 	p_buf.socket    = socket_id;
 	p_buf.bank_id   = bank_id;
-	p_buf.out_buf   = &ret_addr;
+	p_buf.out_buf   = out_buf;
 
-	ret = acpi_call_prm_handler(norm_to_sys_guid, &p_buf);
+	ret = acpi_call_prm_handler(guid, &p_buf);
 	if (!ret)
-		return ret_addr;
+		return 0;
 
 	if (ret == -ENODEV)
-		pr_debug("PRM module/handler not available\n");
+		pr_debug("PRM module/handler not available: %d\n", ret);
 	else
-		pr_notice_once("PRM address translation failed\n");
+		pr_notice_once("PRM address translation failed: %d\n", ret);
 
 	return ret;
 }
+
+unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
+{
+	unsigned long sys_addr;
+	int ret;
+
+	ret = prm_umc_norm_to_addr(norm_to_sys_guid, socket_id, bank_id, addr, &sys_addr);
+	if (ret)
+		return ret;
+
+	return sys_addr;
+}
-- 
2.53.0

