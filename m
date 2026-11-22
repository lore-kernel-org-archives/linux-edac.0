Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795313151;
	b=1X++Mpjly6VLEkFiki/KNe3vz9yn4foAb2ch640InoZ7GR+o70gFY5Rzv0chy+hjdb0S
	 Ca36gSeo33wssyNY5IOvTJme7F6hVHGq1HM6RSbP3tAf5zzY/mggwTLVOgpgNtsSelKkp
	 r9ZQYgemjbD3VDYIvY0JiMAhYLvcO5AG9CoKVkQEk6JtI2M0w9YekRDjTmU77RIzriKc/
	 O2tItJGxqz8q7nNGtCXLyA/AqiB8HMkoTV/DYiRRht0PoueXxr4lwwuUme3PWYrSSgcwq
	 94hYZXWAP42ajuM2PnSMhY5eyKSK+MUMTawpK60O4bfeDDoBoj57FCWmBO+rgzAbM2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313151;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WteDsQOYU1/zTkS9JtPsXbpxiwYVqCHgYwijge8qJQA=;
	b=lVbitA4YONThEZi7sX+3TznjKWgp8lu0eXFDbxn3eNpTq6sXkNImIQ2ROot64pA8EG3T
	 qaeWO/7ctoXRFtEPkhNatI9Br/eufVydJNUy8bjFg9brGOXCXtH9k49XlOVP9dHxe67Ou
	 Ptwpl7XVJgBQCoZBXCrXiVtyCPJkeQK3TzqJNXPv63eRz/igIzbqWcBNFALF53esb+Tkm
	 JUEtPGd9XhBicK2Z5Lf0oqo+OoJ7HVAbKLtLxYZCaWrxDLCShjR58CfOslrT8Ef04QYLx
	 SXA7wom/hdFpK1NwEvNZ6yaavMZdHFe7K8tXZvwslBjeX1xGQc3Wqe8zcFUWVuf2EoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tdtcCb2j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.66
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010066.outbound.protection.outlook.com [52.101.193.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E986606A330;
	Sun, 22 Nov 2026 02:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E986606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tdtcCb2j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWCyVTWnDSE5IPnhcTR/vx6BJdbeaqczuIOqmHXZh9n+VczzcLAYTwXyXYaZDGzXUMwag/QPLxTcf/Itl8ezDJy3V7TR0jNXiKc8exFx5hWGc6+ox2vB3Qa/344o7sIQHnmvFcVW+ngXikWhX8DratgocljJ9W41r+CALDy6iGmDbgnxBkbUGe7z+CvTywWCCtbanZxvpkSlFTuoYFe+075joakJTX9vJKDbfa6mG5phPeIkHSC3MWyhGuNrfo22UVe+dVyhFBvUF7/0SVp9JTqIdedS96NKr5n2jLPxOKVA91nxC147VrOsX+kKiMrrBb52xspmKxbr8wY7KwRHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WteDsQOYU1/zTkS9JtPsXbpxiwYVqCHgYwijge8qJQA=;
 b=Z+5ZWAKPBokSzwYXN+wJzAvMlocnF4FjlspZogGOcl2PWopo66rdY3usXfOWTzqWDgvWQ/6mmN4U+qGqfncdgdRymDwnLTGqQUPGZn3BytbXWM8eN9gW/y9uYOjIzT5DZBDJE9T7cL4W5F05roWEfsJLBHJEh+dLguH78+L4aq1nsbKtuS7dF9XSNbLK5fsyKiDN3vVcFyHfueCp4rY/QpmIyM2c05tVCrcCm9YqclYUSMoO5f7o04p4VQxe3e16mUmQcl7G1K3DKRCdV/F9T+IN9/dj9INmNkXcCg7hf6K9scduLr1N1irdKO5Nsod5vTayl0Z0ChNOAcsVzNXBkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WteDsQOYU1/zTkS9JtPsXbpxiwYVqCHgYwijge8qJQA=;
 b=tdtcCb2jtwJCQ1irVXk3IRDL9LZsooRb5URioT3312zhfRuXQOV8tHYPo8vIHQGUQE0J8/kUnlQkiuUXdlmjGnKT1ycX2NKUkVkrNDPuLQT6sf4muQ3PdcuBpmYzr86pUsNquoKhnzPS2UnqiV7dWxM/JZ2H1Vk9E+hDSLZDLkA=
Received: from BL1P223CA0038.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::7)
 by CH1PPF73CDB1C12.namprd12.prod.outlook.com (2603:10b6:61f:fc00::615) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sun, 22 Nov
 2026 02:05:42 +0000
Received: from IA0PEPF00000043.namprd04.prod.outlook.com
 (2603:10b6:208:5b6:cafe::f) by BL1P223CA0038.outlook.office365.com
 (2603:10b6:208:5b6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Sun,
 22 Nov 2026 02:05:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF00000043.mail.protection.outlook.com (10.167.249.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 02:05:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 20:05:40 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 20:05:39 -0600
Received: from xhdrveggala50x.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Sat, 21 Nov 2026 20:05:36 -0600
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v5 2/3] firmware: xilinx: Add XilSEM firmware interface
Date: Sun, 22 Nov 2026 07:35:23 +0530
Message-ID: <1795313124-2138932-3-git-send-email-rama.devi.veggalam@amd.com>
X-Mailer: git-send-email 1.9.5
In-Reply-To: <1795313124-2138932-1-git-send-email-rama.devi.veggalam@amd.com>
References: <1795313124-2138932-1-git-send-email-rama.devi.veggalam@amd.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000043:EE_|CH1PPF73CDB1C12:EE_
X-MS-Office365-Filtering-Correlation-Id: c04bebb3-6917-4d4f-d09a-08df483d1c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|23010399003|261026121527099003|10067099003|261022113327099003|56012099006|11063799006|5023799004|261026140227099003|261009223027099003|261021135927099003|261102130727099003|261102123227099003|261026130827099003|261021123027099003|261028144727099003|261022115727099003|261022075727099003|261022105027099003|261026135527099003|261021121427099003|261021133027099003|261021130227099003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AGFgDZn0mzrRXugcpbM7KlbJSfRJCDltXsuQ1rvffOtbHTMIoNVcOVCertv8+31I0+fsD//+NBo/ipQsm/H/U1allSTmmmV8XGhdFHK5jqrmw2IUm+BSQDvXsaiBQWE6iN4dh3HYz/yujTvrvi1n3A6Bgw92aSBVFMv+Sr6ouvnzwfiHk3M9Nb6QR5CB+ZsgNJVHMstwfMuRX2Vgk0y1WVF6y6uY/ZO/mHS8KZ415MZf/+qI5yPDQhs4IvzIfIW0KZ2D9LMqrD1BTB6qsv7SUbpRveZkgkMLRitGSDxPqGX/VCx3M/4skSGbg4MOT3fFaBr/zCvVcIf/1sK2ApnLABW482I2FZo860gZmgARmOOpcjT1xsQGeJIteT4mctmx/FR6/KN4Xq/K3Rc/Fz+qqDP7e/cZTSSCEy/Ui7iKCFbQEyiIoMYlpNBFsx2iWyGZOqsvtQEipM/bgBX1hFH5lnG/xt9nmUPa9YcIp88dkieYtR2HO7S7YAd/uAc6BxkOt8uqGCs/kExVxkCx1WncsASsFD1jVgYPtGR0taMgAtpRKaLB+naxCeTF0mrLwO+tVLRHDJr4w3PD2+ZQSdGEw12sUDG2WO5Vqb/2hmoB/923RBfStdLda6OolOLXKoXFGtvG6UONCqVn/i7T92fdJpVFZnS388IOMA0TFIlYTVBMMu37unNwRMrx5FjMdrwXr9OOZjUssVHmUDa2EaWcSg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(23010399003)(261026121527099003)(10067099003)(261022113327099003)(56012099006)(11063799006)(5023799004)(261026140227099003)(261009223027099003)(261021135927099003)(261102130727099003)(261102123227099003)(261026130827099003)(261021123027099003)(261028144727099003)(261022115727099003)(261022075727099003)(261022105027099003)(261026135527099003)(261021121427099003)(261021133027099003)(261021130227099003)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kbl7zd0upU7W71gEXW3PmaxICn7BZOMzUUdY/17pfDNOZhSB5d77/oggKZ/iVQIHDv5+nL6AJKPmI2J4bVCr8iWBM5QvN0ecH9b9USvRPtTKgNLGIyflCfmvuZc3kn8dEgOqwwmgiXJDJxLpGUvpaw4RDcO/yWQhU6N6+UBQS2sMjeao7MdGQQakbZecmz3VZdiE7WhMR7x2b7CBwGnIHUjo7uvMNCw8IUyGhKFzw3pi/E2qiWTFJ8dCJYkQrwGkA0LFLTE3XSAIBuGOAVeEcMLwGpvgFik17J2HGwXSESqu3p3b5N23pZBL3e9qGktG1IIUIGo9WWYef51EKHXrNQrZYIgLzI49du5XqEVNG4gx7dt2ZDGwrGRd3fRcmv4ZHGt3PbxzHPPGDcbL/DI9nmL3feejcyIDtzQXmPiC2LlhJJ7KLolo93pFgTvFWC3G
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 02:05:41.4150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c04bebb3-6917-4d4f-d09a-08df483d1c46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000043.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF73CDB1C12

Add the firmware interface used by the Xilinx Soft Error Mitigation
(XilSEM) EDAC driver on Versal and Versal NET devices. XilSEM runs as
part of the Platform Loader and Manager (PLM) on the Platform
Management Controller (PMC) and performs Configuration RAM (CRAM) and
NoC programming interface (NPI) scan and error injection operations on
request from Linux.

Add zynqmp_pm_xilsem_*() wrappers for scan control, CRAM error
injection, frame ECC read and configuration read. Add the XilSEM error
event node IDs and masks, and update xlnx_event_manager.c to accept the
new software error node ID as a valid error event on both families.

Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
---
Changes in v5:
- Replaced the SLR ID with a reserved id argument (must be 0) in the
  zynqmp_pm_xilsem_*() wrappers and response structs.
- Dropped SSIT support.
- Cleared @response at the start of each zynqmp_pm_xilsem_*() wrapper,
  so a failed call leaves no data from an earlier call.
- Returned -EIO when the firmware reports a non-zero status, keeping
  the firmware's code in the response.

Changes in v4:
- Added XilSEM error-event node ID and error masks to the existing
  include/linux/firmware/xlnx-zynqmp.h, used to register for error
  event notification.
- Updated xlnx_event_manager.c to recognize the new SW_ERR node ID as
  a valid error event for both Versal and Versal NET.
- Added full SSIT (multi-die) support.
- Changed all firmware responses to use typed struct xsem_*_response *
  output parameters (7 response structs) instead of raw buffers.
- Added xsem_narrow_dma_addr() to validate and narrow coherent DMA
  addresses for the two calls that take a DMA buffer.
- Added NPI error injection as its own scan-control operation, CRAM
  error injection has its own dedicated call and is not reachable
  through the generic control-ops entry point.

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
 drivers/firmware/xilinx/Makefile         |   2 +-
 drivers/firmware/xilinx/zynqmp-sem.c     | 142 +++++++++++++++++++++++++++++++
 drivers/soc/xilinx/xlnx_event_manager.c  |  16 +++-
 include/linux/firmware/xlnx-zynqmp-sem.h | 127 +++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h     |  50 +++++++++++
 5 files changed, 334 insertions(+), 3 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-sem.c
 create mode 100644 include/linux/firmware/xlnx-zynqmp-sem.h

diff --git a/drivers/firmware/xilinx/Makefile b/drivers/firmware/xilinx/Makefile
index 8db0e66..a71919a 100644
--- a/drivers/firmware/xilinx/Makefile
+++ b/drivers/firmware/xilinx/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Xilinx firmwares
 
-obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-ufs.o zynqmp-crypto.o
+obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-ufs.o zynqmp-crypto.o zynqmp-sem.o
 obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) += zynqmp-debug.o
diff --git a/drivers/firmware/xilinx/zynqmp-sem.c b/drivers/firmware/xilinx/zynqmp-sem.c
new file mode 100644
index 0000000..ae73864
--- /dev/null
+++ b/drivers/firmware/xilinx/zynqmp-sem.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Firmware layer for XilSEM APIs.
+ *
+ * Copyright (C), 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/export.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/firmware/xlnx-zynqmp-sem.h>
+#include <linux/string.h>
+
+/**
+ * zynqmp_pm_xilsem_cntrl_ops - PM call to perform XilSEM operations
+ * @cmd:	Command for XilSEM scan control operations
+ * @id:	Reserved for future use, must be 0
+ * @response:	Output response
+ *
+ * Return: 0 on success, -EIO on a non-zero firmware status, or another
+ *         negative errno. @response is left unchanged if @cmd is invalid.
+ *         Otherwise it is cleared first and filled once the firmware call
+ *         completes (return value 0 or -EIO).
+ */
+int zynqmp_pm_xilsem_cntrl_ops(u32 cmd, u32 id, struct xsem_cntrl_ops_response *response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	switch (cmd) {
+	case PM_XSEM_CRAM_INIT_SCAN:
+	case PM_XSEM_CRAM_START_SCAN:
+	case PM_XSEM_CRAM_STOP_SCAN:
+	case PM_XSEM_NPI_START_SCAN:
+	case PM_XSEM_NPI_STOP_SCAN:
+	case PM_XSEM_NPI_ERR_INJECT:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	memset(response, 0, sizeof(*response));
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_HEADER | cmd, ret_buf, 1, id);
+	if (ret)
+		return ret;
+
+	memcpy(response, &ret_buf[1], sizeof(*response));
+
+	/* The call completed, but the firmware may report a failure in the response */
+	return response->status ? -EIO : 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cntrl_ops);
+
+/**
+ * zynqmp_pm_xilsem_cram_err_inj - PM call to perform CRAM error injection
+ * @id:	Reserved for future use, must be 0
+ * @frame:	Frame number to be used for error injection
+ * @qword:	Word number to be used for error injection
+ * @bit:	Bit location to be used for error injection
+ * @row:	CFRAME row number to be used for error injection
+ * @response:	Output response
+ *
+ * Return: 0 on success, -EIO on a non-zero firmware status, or another
+ *         negative errno. @response is cleared first and filled once the
+ *         firmware call completes (return value 0 or -EIO).
+ */
+int zynqmp_pm_xilsem_cram_err_inj(u32 id, u32 frame, u32 qword, u32 bit, u32 row,
+				  struct xsem_cram_errinj_response *response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	memset(response, 0, sizeof(*response));
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_CRAM_ERRINJ, ret_buf, 5, id, frame, qword,
+				  bit, row);
+	if (ret)
+		return ret;
+
+	memcpy(response, &ret_buf[1], sizeof(*response));
+
+	/* The call completed, but the firmware may report a failure in the response */
+	return response->status ? -EIO : 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cram_err_inj);
+
+/**
+ * zynqmp_pm_xilsem_cram_read_ecc - PM call to perform CFRAME ECC read
+ * @id:	Reserved for future use, must be 0
+ * @frame:	Frame number to be used for reading ECC
+ * @row:	CFRAME row number to be used for reading ECC
+ * @response:	Output response
+ *
+ * Return: 0 on success, -EIO on a non-zero firmware status, or another
+ *         negative errno. @response is cleared first and filled once the
+ *         firmware call completes (return value 0 or -EIO).
+ */
+int zynqmp_pm_xilsem_cram_read_ecc(u32 id, u32 frame, u32 row,
+				   struct xsem_cram_readecc_response *response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	memset(response, 0, sizeof(*response));
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_CRAM_RD_ECC, ret_buf, 3, id, frame, row);
+	if (ret)
+		return ret;
+
+	memcpy(response, &ret_buf[1], sizeof(*response));
+
+	/* The call completed, but the firmware may report a failure in the response */
+	return response->status ? -EIO : 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cram_read_ecc);
+
+/**
+ * zynqmp_pm_xilsem_read_cfg - PM call to perform Xilsem configuration read
+ * @id:	Reserved for future use, must be 0
+ * @response:	Output response
+ *
+ * Return: 0 on success, -EIO on a non-zero firmware status, or another
+ *         negative errno. @response is cleared first and filled once the
+ *         firmware call completes (return value 0 or -EIO).
+ */
+int zynqmp_pm_xilsem_read_cfg(u32 id, struct xsem_read_cfg_response *response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	memset(response, 0, sizeof(*response));
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_RD_CONFIG, ret_buf, 1, id);
+	if (ret)
+		return ret;
+
+	memcpy(response, &ret_buf[1], sizeof(*response));
+
+	/* The call completed, but the firmware may report a failure in the response */
+	return response->status ? -EIO : 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_read_cfg);
diff --git a/drivers/soc/xilinx/xlnx_event_manager.c b/drivers/soc/xilinx/xlnx_event_manager.c
index f733dc4..d832ee6 100644
--- a/drivers/soc/xilinx/xlnx_event_manager.c
+++ b/drivers/soc/xilinx/xlnx_event_manager.c
@@ -75,6 +75,16 @@ struct registered_event_data {
 	struct hlist_node hentry;
 };
 
+/*
+ * Error-event node ids are per-family firmware IDs, packed at
+ * 0x28100000 + n * 0x4000. The same value names different nodes on
+ * different families: 0x28110000 is VERSAL_EVENT_ERROR_SW_ERR and
+ * VERSAL_NET_EVENT_ERROR_PSM_ERR2. Compare a node_id only inside the
+ * arm for the family that owns it. For this predicate the overlap does
+ * not change the result, because 0x28110000 is an error-event node on
+ * every family that defines it. The family split is required for ids
+ * that exist in only one table.
+ */
 static bool xlnx_is_error_event(const u32 node_id)
 {
 	u32 pm_family_code;
@@ -85,7 +95,8 @@ static bool xlnx_is_error_event(const u32 node_id)
 		if (node_id == VERSAL_EVENT_ERROR_PMC_ERR1 ||
 		    node_id == VERSAL_EVENT_ERROR_PMC_ERR2 ||
 		    node_id == VERSAL_EVENT_ERROR_PSM_ERR1 ||
-		    node_id == VERSAL_EVENT_ERROR_PSM_ERR2)
+		    node_id == VERSAL_EVENT_ERROR_PSM_ERR2 ||
+		    node_id == VERSAL_EVENT_ERROR_SW_ERR)
 			return true;
 	} else if (pm_family_code == PM_VERSAL_NET_FAMILY_CODE) {
 		if (node_id == VERSAL_NET_EVENT_ERROR_PMC_ERR1 ||
@@ -94,7 +105,8 @@ static bool xlnx_is_error_event(const u32 node_id)
 		    node_id == VERSAL_NET_EVENT_ERROR_PSM_ERR1 ||
 		    node_id == VERSAL_NET_EVENT_ERROR_PSM_ERR2 ||
 		    node_id == VERSAL_NET_EVENT_ERROR_PSM_ERR3 ||
-		    node_id == VERSAL_NET_EVENT_ERROR_PSM_ERR4)
+		    node_id == VERSAL_NET_EVENT_ERROR_PSM_ERR4 ||
+		    node_id == VERSAL_NET_EVENT_ERROR_SW_ERR)
 			return true;
 	}
 
diff --git a/include/linux/firmware/xlnx-zynqmp-sem.h b/include/linux/firmware/xlnx-zynqmp-sem.h
new file mode 100644
index 0000000..9e703ae
--- /dev/null
+++ b/include/linux/firmware/xlnx-zynqmp-sem.h
@@ -0,0 +1,127 @@
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
+#include <linux/errno.h>
+#include <linux/types.h>
+
+/* XilSEM commands */
+#define PM_XSEM_HEADER			0x300
+#define PM_XSEM_CRAM_ERRINJ		0x304
+#define PM_XSEM_RD_CONFIG		0x309
+#define PM_XSEM_CRAM_RD_ECC		0x30B
+
+/*
+ * Valid cmd values for zynqmp_pm_xilsem_cntrl_ops(). CRAM error injection
+ * has its own dedicated firmware call (zynqmp_pm_xilsem_cram_err_inj()) and
+ * must not be reachable through this generic entry point, so it is
+ * deliberately not a member of this enum.
+ */
+enum pm_xsem_cntrl_op {
+	PM_XSEM_CRAM_INIT_SCAN = 1,
+	PM_XSEM_CRAM_START_SCAN = 2,
+	PM_XSEM_CRAM_STOP_SCAN = 3,
+	PM_XSEM_NPI_START_SCAN = 5,
+	PM_XSEM_NPI_STOP_SCAN = 6,
+	PM_XSEM_NPI_ERR_INJECT = 7,
+};
+
+/**
+ * struct xsem_cntrl_ops_response - Response to zynqmp_pm_xilsem_cntrl_ops()
+ * @hdr:	Command header
+ * @status:	Error code or status, non-zero if the firmware reported a failure
+ * @id:	Reserved for future use
+ * @status1:	Reserved for future use
+ * @status2:	Reserved for future use
+ * @status3:	Reserved for future use
+ */
+struct xsem_cntrl_ops_response {
+	u32 hdr;
+	u32 status;
+	u32 id;
+	u32 status1;
+	u32 status2;
+	u32 status3;
+};
+
+/**
+ * struct xsem_cram_errinj_response - Response to zynqmp_pm_xilsem_cram_err_inj()
+ * @hdr:	Command header
+ * @status:	Error code or status, non-zero if the firmware reported a failure
+ * @id:	Reserved for future use
+ */
+struct xsem_cram_errinj_response {
+	u32 hdr;
+	u32 status;
+	u32 id;
+};
+
+/**
+ * struct xsem_cram_readecc_response - Response to zynqmp_pm_xilsem_cram_read_ecc()
+ * @hdr:	Frame ECC read command header
+ * @ecc0:	First ECC word
+ * @ecc1:	Second ECC word
+ * @status:	Status, non-zero if the firmware reported a failure
+ */
+struct xsem_cram_readecc_response {
+	u32 hdr;
+	u32 ecc0;
+	u32 ecc1;
+	u32 status;
+};
+
+/**
+ * struct xsem_read_cfg_response - Response to zynqmp_pm_xilsem_read_cfg()
+ * @hdr:	Config read command header
+ * @cram_cfg:	CRAM scan configuration
+ * @npi_cfg:	NPI scan configuration
+ * @status:	Status, non-zero if the firmware reported a failure
+ */
+struct xsem_read_cfg_response {
+	u32 hdr;
+	u32 cram_cfg;
+	u32 npi_cfg;
+	u32 status;
+};
+
+#if IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)
+int zynqmp_pm_xilsem_cntrl_ops(u32 cmd, u32 id, struct xsem_cntrl_ops_response *response);
+int zynqmp_pm_xilsem_cram_err_inj(u32 id, u32 frame, u32 qword, u32 bit, u32 row,
+				  struct xsem_cram_errinj_response *response);
+int zynqmp_pm_xilsem_cram_read_ecc(u32 id, u32 frame, u32 row,
+				   struct xsem_cram_readecc_response *response);
+int zynqmp_pm_xilsem_read_cfg(u32 id, struct xsem_read_cfg_response *response);
+#else
+static inline int zynqmp_pm_xilsem_cntrl_ops(u32 cmd, u32 id,
+					     struct xsem_cntrl_ops_response *response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_cram_err_inj(u32 id, u32 frame, u32 qword, u32 bit,
+						u32 row,
+						struct xsem_cram_errinj_response *response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_cram_read_ecc(u32 id, u32 frame, u32 row,
+						 struct xsem_cram_readecc_response *response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_read_cfg(u32 id,
+					    struct xsem_read_cfg_response *response)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* __FIRMWARE_ZYNQMP_SEM_H__ */
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 41a1cd8..2d64b02 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -121,6 +121,12 @@
 #define VERSAL_EVENT_ERROR_PMC_ERR2	(0x28104000U)
 #define VERSAL_EVENT_ERROR_PSM_ERR1	(0x28108000U)
 #define VERSAL_EVENT_ERROR_PSM_ERR2	(0x2810C000U)
+/*
+ * SW Error Event Node Id (0x4000 stride from PSM_ERR2 above). This
+ * value coincidentally equals VERSAL_NET_EVENT_ERROR_PSM_ERR2 below -
+ * harmless, since each family's node IDs are an independent sequence.
+ */
+#define VERSAL_EVENT_ERROR_SW_ERR	(0x28110000U)
 
 #define VERSAL_NET_EVENT_ERROR_PMC_ERR1	(0x28100000U)
 #define VERSAL_NET_EVENT_ERROR_PMC_ERR2	(0x28104000U)
@@ -129,6 +135,8 @@
 #define VERSAL_NET_EVENT_ERROR_PSM_ERR2	(0x28110000U)
 #define VERSAL_NET_EVENT_ERROR_PSM_ERR3	(0x28114000U)
 #define VERSAL_NET_EVENT_ERROR_PSM_ERR4	(0x28118000U)
+/* SW Error Event Node Id */
+#define VERSAL_NET_EVENT_ERROR_SW_ERR	(0x2811C000U)
 
 /* ZynqMP SD tap delay tuning */
 #define SD_ITAPDLY	0xFF180314
@@ -146,6 +154,48 @@
 #define XPM_EVENT_ERROR_MASK_NOC_NCR		BIT(13)
 #define XPM_EVENT_ERROR_MASK_NOC_CR		BIT(12)
 
+/*
+ * XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_CE_5: Error event mask for handling
+ * correctable error in Versal Configuration RAM which is reported by
+ * Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_CE_5		BIT(5)
+
+/*
+ * XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_UE_6: Error event mask for handling
+ * uncorrectable error in Versal Configuration RAM which is reported by
+ * Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_UE_6		BIT(6)
+
+/*
+ * XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_UE_7: Error event mask for handling
+ * uncorrectable error in Versal NoC programming interface (NPI)
+ * register which is reported by Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_UE_7		BIT(7)
+
+/*
+ * XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_CE: Error event mask for handling
+ * correctable error in Versal Configuration RAM which is reported by
+ * Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_CE		BIT(7)
+
+/*
+ * XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_UE: Error event mask for handling
+ * uncorrectable error in Versal Configuration RAM which is reported by
+ * Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_UE		BIT(8)
+
+/*
+ * XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_NPI_UE: Error event mask for handling
+ * uncorrectable error in Versal NoC programming interface (NPI)
+ * register which is reported by Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_NPI_UE		BIT(9)
+
 /* Node ID for all peripheral devices */
 #define PM_DEV_ALL_PERIPH	0x18224FFFU
 
-- 
1.9.5

