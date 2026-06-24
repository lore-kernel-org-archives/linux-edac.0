Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC23E6389;
	Wed, 24 Jun 2026 21:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336374; cv=fail; b=BVqIYkOWNzw1fzS+rqS/V+b7A+QAbswBj3XWeuOUrBp8/5/+Xbgpwi6MkJP5UTt9HRZmizSAWTZqoDE8ypzkZRxq14f7I08LUVZwTNntDGAoe0Nx3uHAQMnWaNztGXxhL4JF/kaLBWG5puZrQmjM914ybKL+biYYtOXe3+nWKwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336374; c=relaxed/simple;
	bh=G+kBCuT/0sWJY+AnLmgf69m5wzShZUtUNitV2HomoYs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQUr4bimGWq1wmOCMiy4Rx7UX9js0l6lTXgrHGMqwbw1GD5SzhZwko5ROuz0WSEsXbm14aT5GRdh2b0JuktvASTWZ0V6zNxlC82Uefa0HUhbO1yuHjOaQAKQuvD3QISPpCrbzGo4fQf7tsgj+8I1tX+kojtsWtQsTyT3h+/znoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4SFso0qd; arc=fail smtp.client-ip=40.107.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4SFso0qd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYRk1KFtxCNjR2cGSg8OnTzzoFHx+hqqAElEbQC1KJsucw9EbuuiclgSG4vY0TAK0fNLGKcI2Z/eSDYf8ACmvBe3sRFgPgb/XeTa8PY31Dnrj64y3blub0vPa2pgPhyOKkSU4GduHkhGzJ0BXPoPC9Wo02rtlGUYlDzQuw0c6iw/sjj/JA2vyrFsXjDQ1fH3Va+4e4xp+EiFpQ2AfnJg6KgcwxO3Gqo7m3mTPEch5xD1X+RprSHN7WpHPmSQhrPApMiJBPko037AmfQfw6FFZmEiADwLZHNV+d7kfgQFxCaP3+psEnqzELeUPnxwHypdPEcn9HvkjRfYZRSe/koYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78KTU0DsZN5FwEgn5+8xho7Jp3HH0896cYOJtIUDn7I=;
 b=qhb1KpwItHn+rLFkYn5hK7iEGN+ijf9kv+dkOtIQvDwPPzcrXrsmUYat/RiRKQWzoS3glN8ecwdju7Vv6h64CyJSOfiXvRi/smFTG04QTdZwEJ/mN0KXbgCXnPU8l47WpRYMpEKNp2Pg1YCXCjNKzycgSw4m5y0cIVntYRNn5ZoLPuKK27L5p8Y5Dzi928vcUzvbC20cwep3y8hI5XBv5QHHucNcLNY7KzKwMmbQVxk9dL94pRk/BZ2xLeEWZw3iHh2Fs2VKTfeHVH7eF3UDRTCHOTzeWIjvw5fAGui2Qy9ICOeoVpeh2tLHpDTkE/cI1bXJCuVn72zehzucl8w4SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78KTU0DsZN5FwEgn5+8xho7Jp3HH0896cYOJtIUDn7I=;
 b=4SFso0qdkTW0Sio0Osw3lsVNKV0qlkqERATCWTBPtZWvCynp3kBlERSwV6LtvvmIceVHfbwt4kxTs1I+kRI5YZpyST/uKzMQzFRYz5fBLIdeiIIkrX8AizljSqrlaR1wWPDxCy6HnDRipCg1S8dfB6EsMQSZCtKq80Xq5yXqR3s=
Received: from SN7P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::10)
 by DS0PR12MB9421.namprd12.prod.outlook.com (2603:10b6:8:1a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 21:26:07 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:124:cafe::9c) by SN7P222CA0020.outlook.office365.com
 (2603:10b6:806:124::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 21:26:06 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 21:26:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 16:26:05 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 16:26:04 -0500
Received: from xhdvaralaxm41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 24 Jun 2026 16:26:00 -0500
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v3 3/4] firmware: xilinx: Add support for Xilsem scan operations
Date: Thu, 25 Jun 2026 02:55:44 +0530
Message-ID: <20260624212545.2850787-4-rama.devi.veggalam@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
References: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|DS0PR12MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 37bf33c5-a416-462e-a1c5-08ded2373320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|7416014|18002099003|22082099003|56012099006|11063799006|5023799004|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	V8fYHMPvb2GbBatD7Rj1IB4JjWgNW+Grg24/naKN7rie0aTmj0JvtxL3s3WS8aZ2TF2lLonrvJBMuTU3PYtpMePFVst3NqBngEz4/nQfi5thOpAAS8i3lZleWBEEVayVFe8h8oSWloeTsh02Kqp9e/ueuagnWbD1J+m2zyZgH1U68AmehEwlO5etj1d3VS5Mzx5Lku5BjGwcMi1ZNywoUJdXxRK0wr228XgreaPaLgc7ds1UMTe+ZJm1YFcDGhpG95egMGx+ZDXgzBGdMnM34qsHbrv30BnR5HVxoA5IF3v+bjRSEECdlAvRWPzkuWyzl1OihK56OAGjY7XpmVcSEA2uZ8PYME2uzRfqB7CHBFC8j7eSrQyBkD/M24Y1/ov6hBBOEOP3OfobMcGvM9F6SqdpTCnu+jul71zS890pZLaxjXDbX8yggyGo/DBzVpjx0NHiTb89pTFkS2xVYHlagLxXNPHA5M+id+NinsnWniCMZSwDP7XrKITI5kdJAS6cP1SqWFMg4v3F6fRc/5TgqoLpUGqGKp0q6eLCQ7t0fNY91kNIEesSXiKFQ+Pl+01Jaj5n2Jt/1KNAk7lqPegvGAExWUeFIuiy8D02YiOolZv/F9Bkvxk4SHXhvg/o9aLEIo4Ct+KVvhUzND6wV71UxyWDanB0YhRoKYPJwJxCZRvImXJf0lnrhi6/QuLG758iPMwx1ScdlvR9nE7Yy2WDlQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gGPjQc4cMz4zUrqGZJuV1Vf3bb6mZJWVrJ7L0UBnrYHoov9lvl9TtSwpeoAVjMN9ADoahz8ENNP64iGHPu8SaHwS1xnp/jmpF4zHrHU7zMHH8wcmhq8IibbBjx8qk5X2Sx9ZdjJcIhQPydJcWfw5idQy3/wMRaimcuEp8Ak4a7gk9E4haY/qbjqvEeiwWom7NwjbhAsg4fjbqNfyiIhgI+QX9CKTIS6TqSkUZW3lJNuF6a2MU5rI/wSEAXj1TNXW30neY2vVS1af+rnDoEpUGQK1yxd8bk6BMgXvvDm04x1T42783n+E+qRR3a+hgHi7I9VSoxTHKqdf1f3yjnP7k906obbOlt2V5lrp0nev6bW1rJSAh+A9Wzzw6XPxW4aFMBfcGhtp5OuyRCGoasuF6Hyo+m2oe9HSfbyKRzAbg7I8pgoH6VhyS3YvTQ/FKV5h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 21:26:05.5386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bf33c5-a416-462e-a1c5-08ded2373320
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9421

Add the ATF EEMI call support for Xilsem scan operations.
Initialize, start, stop scan, error inject, read configuration,
status and register for software error events.

Add macros for XilSem correctable and uncorrectable error events.

Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
---
Changes in v3:
- created separate file for Xilsem ATF EEMI calls.

Changes in v2:
- Patch created on top of dependent patch series
"enhance zynqmp_pm_get_family_info()"
- Removed non-relevant SOB names in error event header files
- Updated copyright information
- Merged Versal and Versal NET error event definitions to firmware
patch
---
 drivers/firmware/xilinx/Makefile              |   2 +-
 drivers/firmware/xilinx/zynqmp-sem.c          | 176 ++++++++++++++++++
 drivers/soc/xilinx/xlnx_event_manager.c       |   6 +-
 .../linux/firmware/xlnx-versal-error-events.h |  43 +++++
 include/linux/firmware/xlnx-zynqmp-sem.h      |  69 +++++++
 include/linux/firmware/xlnx-zynqmp.h          |   1 +
 6 files changed, 294 insertions(+), 3 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-sem.c
 create mode 100644 include/linux/firmware/xlnx-versal-error-events.h
 create mode 100644 include/linux/firmware/xlnx-zynqmp-sem.h

diff --git a/drivers/firmware/xilinx/Makefile b/drivers/firmware/xilinx/Makefile
index 8db0e66b6b7e..f9380c8931ae 100644
--- a/drivers/firmware/xilinx/Makefile
+++ b/drivers/firmware/xilinx/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Xilinx firmwares
 
-obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-ufs.o zynqmp-crypto.o
+obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-sem.o zynqmp-ufs.o zynqmp-crypto.o
 obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) += zynqmp-debug.o
diff --git a/drivers/firmware/xilinx/zynqmp-sem.c b/drivers/firmware/xilinx/zynqmp-sem.c
new file mode 100644
index 000000000000..5cd399b165f5
--- /dev/null
+++ b/drivers/firmware/xilinx/zynqmp-sem.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Firmware layer for XilSEM APIs.
+ *
+ * Copyright (C), 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/export.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+
+/**
+ * zynqmp_pm_xilsem_cntrl_ops - PM call to perform XilSEM operations
+ * @cmd:	Command for XilSEM scan control operations
+ * @slrid:	SLR id on which scan operation to be done
+ * @response:	Output response (command header, error code or status, slr id)
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_cntrl_ops(u32 cmd, u32 slrid, u32 *const response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_HEADER | cmd, ret_buf, 1, slrid);
+	response[0] = ret_buf[1];
+	response[1] = ret_buf[2];
+	response[2] = ret_buf[3];
+	response[3] = ret_buf[4];
+	response[4] = ret_buf[5];
+	response[5] = ret_buf[6];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cntrl_ops);
+
+/**
+ * zynqmp_pm_xilsem_cram_errinj - PM call to perform CRAM error injection
+ * @slrid:	SLR id to inject error in CRAM
+ * @frame:	Frame number to be used for error injection
+ * @qword:	Word number to be used for error injection
+ * @bit:	Bit location to be used for error injection
+ * @row:	CFRAME row number to be used for error injection
+ * @response:	Output response (command header, error code or status, slr id)
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_cram_errinj(u32 slrid, u32 frame, u32 qword, u32 bit, u32 row,
+				 u32 *const response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_CRAM_ERRINJ, ret_buf, 5, slrid, frame, qword, bit, row);
+	response[0] = ret_buf[1];
+	response[1] = ret_buf[2];
+	response[2] = ret_buf[3];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cram_errinj);
+
+/**
+ * zynqmp_pm_xilsem_cram_readecc - PM call to perform CFRAME ECC read
+ * @slrid:	SLR id on which Frame ECC read to be done
+ * @frame:	Frame number to be used for reading ECC
+ * @row:	CFRAME row number to be used for reading ECC
+ * @response:	Output response (Frame ecc header, ECC values, status)
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_cram_readecc(u32 slrid, u32 frame, u32 row, u32 *const response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_CRAM_RD_ECC, ret_buf, 3, slrid, frame, row);
+	response[0] = ret_buf[1];
+	response[1] = ret_buf[2];
+	response[2] = ret_buf[3];
+	response[3] = ret_buf[4];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cram_readecc);
+
+/**
+ * zynqmp_pm_xilsem_read_cfg - PM call to perform Xilsem configuration read
+ * @slrid:	SLR id for which configuration to be read
+ * @response:	Output response (config header, Xilsem config, status)
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_read_cfg(u32 slrid, u32 *const response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_RD_CONFIG, ret_buf, 1, slrid);
+	response[0] = ret_buf[1];
+	response[1] = ret_buf[2];
+	response[2] = ret_buf[3];
+	response[3] = ret_buf[4];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_read_cfg);
+
+/**
+ * zynqmp_pm_xilsem_read_ssit_status - PM call to perform Xilsem SSIT status
+ * @slrid:	SLR id for which ECC read to be done
+ * @bufaddr:	Buffer address to get the status information
+ * @response:	Output response (status read header, slr id)
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_read_ssit_status(u32 slrid, u32 bufaddr, u32 *const response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_SSIT_RD_STS, ret_buf, 2, slrid, bufaddr);
+	response[0] = ret_buf[1];
+	response[1] = ret_buf[2];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_read_ssit_status);
+
+/**
+ * zynqmp_pm_xilsem_cram_getcrc - PM call to perform CRAM Row CRC read
+ * @slrid:	SLR id for which CRC read to be done
+ * @rowindex:	CFRAME row number to be used for reading CRC
+ * @response:	Output response (Get CRC header, CRC values, status)
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_cram_getcrc(u32 slrid, u32 rowindex, u32 *const response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_SSIT_GET_CRC, ret_buf, 2, slrid, rowindex);
+	response[0] = ret_buf[1];
+	response[1] = ret_buf[2];
+	response[2] = ret_buf[3];
+	response[3] = ret_buf[4];
+	response[4] = ret_buf[5];
+	response[5] = ret_buf[6];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cram_getcrc);
+
+/**
+ * zynqmp_pm_xilsem_cram_ssit_totframes - PM call to perform total frames read
+ * @slrid:	SLR id for which total frames read to be done
+ * @row:	CFRAME row number to be used for reading ECC
+ * @framecnt: Buffer address to get toral frames data
+ * @response:	Output response (Total frames header, slr id, row, status)
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_cram_ssit_totframes(u32 slrid, u32 row, u32 framecnt, u32 *const response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_SSIT_GET_FRAMES, ret_buf, 3, slrid, row, framecnt);
+	response[0] = ret_buf[1];
+	response[1] = ret_buf[2];
+	response[2] = ret_buf[3];
+	response[3] = ret_buf[4];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cram_ssit_totframes);
diff --git a/drivers/soc/xilinx/xlnx_event_manager.c b/drivers/soc/xilinx/xlnx_event_manager.c
index f733dc42b3b1..fb820fb15173 100644
--- a/drivers/soc/xilinx/xlnx_event_manager.c
+++ b/drivers/soc/xilinx/xlnx_event_manager.c
@@ -3,12 +3,13 @@
  * Xilinx Event Management Driver
  *
  *  Copyright (C) 2021 Xilinx, Inc.
- *  Copyright (C) 2024 Advanced Micro Devices, Inc.
+ *  Copyright (C) 2024-2026 Advanced Micro Devices, Inc.
  *
  *  Abhyuday Godhasara <abhyuday.godhasara@xilinx.com>
  */
 
 #include <linux/cpuhotplug.h>
+#include <linux/firmware/xlnx-versal-error-events.h>
 #include <linux/firmware/xlnx-event-manager.h>
 #include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/hashtable.h>
@@ -85,7 +86,8 @@ static bool xlnx_is_error_event(const u32 node_id)
 		if (node_id == VERSAL_EVENT_ERROR_PMC_ERR1 ||
 		    node_id == VERSAL_EVENT_ERROR_PMC_ERR2 ||
 		    node_id == VERSAL_EVENT_ERROR_PSM_ERR1 ||
-		    node_id == VERSAL_EVENT_ERROR_PSM_ERR2)
+		    node_id == VERSAL_EVENT_ERROR_PSM_ERR2 ||
+		    node_id == VERSAL_EVENT_ERROR_SW_ERR)
 			return true;
 	} else if (pm_family_code == PM_VERSAL_NET_FAMILY_CODE) {
 		if (node_id == VERSAL_NET_EVENT_ERROR_PMC_ERR1 ||
diff --git a/include/linux/firmware/xlnx-versal-error-events.h b/include/linux/firmware/xlnx-versal-error-events.h
new file mode 100644
index 000000000000..4767a23c9e4d
--- /dev/null
+++ b/include/linux/firmware/xlnx-versal-error-events.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Xilinx Versal Error Event Node IDs and Error Event Mask.
+ * Use with Xilinx Event Management Driver
+ *
+ * Copyright (C) 2021-2022 Xilinx
+ * Copyright (C) 2023-2026 Advanced Micro Devices, Inc.
+ *
+ */
+
+#ifndef _FIRMWARE_XLNX_VERSAL_ERROR_EVENTS_H_
+#define _FIRMWARE_XLNX_VERSAL_ERROR_EVENTS_H_
+
+/*
+ * Error Event Node Ids
+ */
+#define VERSAL_EVENT_ERROR_PMC_ERR1	(0x28100000U)
+#define VERSAL_EVENT_ERROR_PMC_ERR2	(0x28104000U)
+#define VERSAL_EVENT_ERROR_PSM_ERR1	(0x28108000U)
+#define VERSAL_EVENT_ERROR_PSM_ERR2	(0x2810C000U)
+#define VERSAL_EVENT_ERROR_SW_ERR	(0x28110000U)
+
+/*
+ * XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_CE_5: Error event mask for handling
+ * correctable error in Versal Configuration RAM which is reported by
+ * Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_CE_5		BIT(5)
+
+/**
+ * XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_UE_6: Error event mask for handling
+ * uncorrectable error in Versal Configuration RAM which is reported by
+ * Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_UE_6		BIT(6)
+
+/**
+ * XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_UE_7: Error event mask for handling
+ * uncorrectable error in Versal NoC programming interface (NPI)
+ * register which is reported by Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_UE_7		BIT(7)
+#endif /* _FIRMWARE_XLNX_VERSAL_ERROR_EVENTS_H_ */
diff --git a/include/linux/firmware/xlnx-zynqmp-sem.h b/include/linux/firmware/xlnx-zynqmp-sem.h
new file mode 100644
index 000000000000..722849cc6403
--- /dev/null
+++ b/include/linux/firmware/xlnx-zynqmp-sem.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Firmware layer for XilSEM APIs.
+ *
+ * Copyright (C), 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __FIRMWARE_ZYNQMP_SEM_H__
+#define __FIRMWARE_ZYNQMP_SEM_H__
+
+/* XilSEM commands */
+#define PM_XSEM_HEADER			0x300
+#define PM_XSEM_CRAM_ERRINJ		0x304
+#define PM_XSEM_RD_CONFIG		0x309
+#define PM_XSEM_CRAM_RD_ECC		0x30B
+#define PM_XSEM_SSIT_GET_CRC		0x30C
+#define PM_XSEM_SSIT_RD_STS		0x30D
+#define PM_XSEM_SSIT_GET_FRAMES		0x30E
+
+#if IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)
+int zynqmp_pm_xilsem_cntrl_ops(u32 cmd, u32 slrid, u32 *const response);
+int zynqmp_pm_xilsem_cram_errinj(u32 slrid, u32 frame, u32 qword, u32 bit, u32 row,
+				 u32 *const response);
+int zynqmp_pm_xilsem_cram_readecc(u32 slrid, u32 frame, u32 row, u32 *const response);
+int zynqmp_pm_xilsem_read_cfg(u32 slrid, u32 *const response);
+int zynqmp_pm_xilsem_read_ssit_status(u32 slrid, u32 bufaddr, u32 *const response);
+int zynqmp_pm_xilsem_cram_getcrc(u32 slrid, u32 rowindex, u32 *const response);
+int zynqmp_pm_xilsem_cram_ssit_totframes(u32 slrid, u32 row, u32 framecnt,
+					 u32 *const response);
+#else
+static inline int zynqmp_pm_xilsem_cntrl_ops(u32 cmd, u32 slrid, u32 *const response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_cram_errinj(u32 slrid, u32 frame, u32 qword, u32 bit, u32 row,
+					       u32 *const response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_cram_readecc(u32 slrid, u32 frame, u32 row, u32 *const response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_read_cfg(u32 slrid, u32 *const response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_read_ssit_status(u32 slrid, u32 bufaddr, u32 *const response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_cram_getcrc(u32 slrid, u32 rowindex, u32 *const response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_cram_ssit_totframes(u32 slrid, u32 row, u32 framecnt,
+						       u32 *const response)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* __FIRMWARE_ZYNQMP_SEM_H__ */
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 7e27b0f7bf7e..f5808f39c7a6 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -18,6 +18,7 @@
 #include <linux/err.h>
 #include <linux/firmware/xlnx-zynqmp-ufs.h>
 #include <linux/firmware/xlnx-zynqmp-crypto.h>
+#include <linux/firmware/xlnx-zynqmp-sem.h>
 
 #define ZYNQMP_PM_VERSION_MAJOR	1
 #define ZYNQMP_PM_VERSION_MINOR	0
-- 
2.23.0

