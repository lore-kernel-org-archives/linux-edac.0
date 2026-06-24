Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1013E559B;
	Wed, 24 Jun 2026 21:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336381; cv=fail; b=oQR7RYXed8jtRxKKRk6PXdUcHqg841b7WINQO3rvBFmj9bYTH4A0d1kc4HSVdDPD05BPRFFwdlSGcsG9g54F23h89b+WdMDMAm+ww8VDBmZnpaYjV6hSV5p/YzLWRGer4sM8iTt8bMl8jaI8OSr/bZT4GeeU2jRN9h9CD36DoAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336381; c=relaxed/simple;
	bh=7jI3c/uMavawX5YM2dl33SmTycwDAh2kTi9YVoCua5Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZMQPAn5SKa/q+rgtPbNJYiVHiAp/s2nM4tp0EtwsEM04sfcjyj+vGDDfjbvuHjpSzgnhTiSxRwxahpGnCJAZhdPlcbYd/J22gQiTTVf5A4a+UWK1qNrbk8WgPT2uzcwUcCMKSe5JjkMLcgLEgMcZIMqITDSoSPDUwNkKAv/yVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EnLF1m0v; arc=fail smtp.client-ip=40.93.196.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EnLF1m0v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNJTZBnI2IXnYANy86DVnzXMM8ym1X65QdKP0X44HzHcBabfXsuGOzeqVSBs1gp6qqnriYz9A8xM0+JqbP/4GZ1r72k5O02hHhRgcreC0swGkotWZP+T7wtZMZrozGKvZoZIsrYf831I1Ka1WSzeNU3EaGmvHbgqnCyeoC8r7DfBfiUfynawtXX7Zr0RWhagl5TCy4MNJJBtIBHOqqXnkJEmjcPD7OUXDxgrTGzwbvnl/6Xdi+zCnCl6L5kNYJQpRJvUM7uTZxq/iptkOg/idHxS87BTNOVkF4UzpBeC2qOH/6rJg6uwuRdrnJQ4kvWp9wzCT5Ua6ylDkAgJcBNcNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKHlnood4/FvhN6nTC15c2+PL0dWeKxT5w1YOZLQyEY=;
 b=rlAUBztk1yepMW03ohNGGenC58rMJEv3urmwOq1NC7ZECOeuIC2L6Zytrnuz90ctpG718dYX389iYa8k4SGS7FvdejDlKSr6iz2mHAWiNiZvyqce62u9wF/phZdkaz/RS6tIGSOnMrIcw+SxjgBBlEAfa5Ob78ER7WKjsy/+2JWLAsOShehDhekQG6MH5N5JQ0/cwjmf4Q/BWaFrgRcvl3EZXVwYegbFwmeVGwMrlXUMwZfpyHmzU+6fhdsTJdMFdmuYMM4m0DVVkRhkHefx8vGzUObPuPMOG4ZYW/F/BKBJ/goPHKrGbW7eib9eUl2OxP46OkOKicNuyJP3ZGDdPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKHlnood4/FvhN6nTC15c2+PL0dWeKxT5w1YOZLQyEY=;
 b=EnLF1m0vwn9AV4F1h4/wnlILM67skbdWCCqLIJ0hThyuydV2UBtuxUWjEFvh0RO5sJS9hCoeGm2FQSBPnjTVYZ43qEyMJ3M0nY9u8zEEWNVbI7IWTDnFpVQu5NZlifn+QelFPSHei2p3CfpVVWT8nX32s/kbrblKyUOTsevue9Y=
Received: from SJ0PR03CA0090.namprd03.prod.outlook.com (2603:10b6:a03:331::35)
 by LV8PR12MB9333.namprd12.prod.outlook.com (2603:10b6:408:1fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 21:26:10 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::2e) by SJ0PR03CA0090.outlook.office365.com
 (2603:10b6:a03:331::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 21:26:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 21:26:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 16:26:09 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 14:26:08 -0700
Received: from xhdvaralaxm41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 24 Jun 2026 16:26:04 -0500
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v3 4/4] edac: xilinx: Add EDAC support for Versal XilSem
Date: Thu, 25 Jun 2026 02:55:45 +0530
Message-ID: <20260624212545.2850787-5-rama.devi.veggalam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|LV8PR12MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d54243-bef1-4444-fcb7-08ded23735ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|7416014|376014|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ExO7thVu5Xwa5EF8SsfeexLYtcTtta7dzOShQ6zyWydBdAAAd+XFc6xBq/D1om7Tzrebkrkc2MeubZxU1nrHIW/6l4fwquPeoIs9aE5tg1RMVvyjJq/kgzKKchkXzd2iazgJTNA8J4nYteUAodeYxu3zxGVjNmhXZDj2RtkKg8UcTOQ9a/DlHaUcc1XFZ8b9M/cXMYXiQhLR/QnejAczh9aMU2geLye01U7U2aAYp6p4ZKUIhjjUujmpNFQJRaH9FUuBZ7h2swccqIT6U/itkcUJqGF6VaWvNUVISexw7MLG77xbKPK6WWBgfkrX6VzuWWtOfIgr7PQiFdqzD769+pPIZuEAe5Z/8c269Vs+F4ECLAWQN9yN2neu6vz/UEM113+AGht7pf5bt3WfJOv7rVN8jpmyAf7iojZQ+XTg0T7KsLuu8kqRnTFmv6Qvt1hagLhq8Ys1GF4qpX71uuM4fRAeywg0kiu6aIQsVa3igpOFEWrw2x30WC8LOnAjfdasIWU70QUTKeljJReS1+1mw3CG12AY37TpYZaLYsop7soFCNjFfqG4GU6ahwAxVK+oIKukmPKU+Y1kQEf9ALYeRMuox0lwDVcLN5e3/Nt3cgOt/xFqdD6bPtsJvjOmAPHG9yKBDyfLEDawITcHxi5G3+OAZr/XBQ3Koh9a2F9m+Z/i7aVIXXf0QXNaHGdV7G6H2clX1ydfHllojPeOKEwRwQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(7416014)(376014)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DfVuYYviEQ+L7LmP5O0KBaN7iYCcfPnW640BxS1Cw/59UKipyZowICsAFatO+lGH2oUOTXMjWhp++CTPolPcF8b92lwYS7yHStZjoowsOcc4WhpqTteeGuFBWJXTH8Fxj3YTspMn5O4h6FhpK2l3GvRznkCFC9tiju5ZyFHUyM9rbnv2TZkUM/iyc3RfZ3N7gE2s08jcqXPrfY8zqZIvAmMiJQzMtI3xRskRer9pgwQatQzOYSJ3LlPrxUm+zKYemaI4GHUyb2ahWpO3C6sPLCPp3ALzWSRxrMQaprm6ffTlzHa31nXOSzEnnVE31FJS2bnaD6HHpVFzXH4+Or/XcKeI637Mmky3N7PIcjlzzSCkPtRQ2gB1vz6B/WNOR5E41j4PlhzdvteN13VZFIkOG+qmPtmHf8lAqjXtFgjSyyafKg79ENYHz6zTL0DH2EGX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 21:26:09.7949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d54243-bef1-4444-fcb7-08ded23735ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9333

Xilinx Versal Soft Error Mitigation (XilSEM) is responsible for reporting
and optionally correcting soft errors in Configuration Memory of Versal.
The Configuration Memory includes Configuration RAM and
Network on Chip (NoC) peripheral interconnect (NPI) Registers.

The Configuration RAM (CRAM) memory is used for storing configuration
data for the programmable logic (PL) fabric. The NPI registers are used
for configuring the memory controllers, miscellaneous integrated hardware,
NoC interface units in the Veral device.

Add support to handle correctable and uncorrectable error events
from XilSEM.

Add sysfs interface for XilSEM scan operations
initialize, start, stop scan, error inject, read ECC, scan status and
configuration values.

Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
---
Changes in v3:
- Merged Versal XilSem edac with Versal edac

Changes in v2:
- Patch created on top of dependent patch series
"enhance zynqmp_pm_get_family_info()"
- Fixed maximum length warning in patch description
- Added details for eprobe_defer conditions
- Updated copyright information
- Removed ARCH_ZYNQMP in dependent list of XilSEM Kconfig
- Added error code for invalid versal device type
- Removed redundant sysfs details in function headers
- Included MAINTAINERS to this patch
- Added more description in commit message
- Removed print for probe success
- Removed function comments for xsem_edac_remove()
---
 MAINTAINERS                |    1 +
 drivers/edac/Kconfig       |    4 +-
 drivers/edac/versal_edac.c | 1348 +++++++++++++++++++++++++++++++++++-
 3 files changed, 1349 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b787bc2855f..3109d05c324a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29585,6 +29585,7 @@ F:	include/uapi/linux/xilinx-v4l2-controls.h
 XILINX VERSAL EDAC DRIVER
 M:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
 M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
+M:	Rama Devi Veggalam <rama.devi.veggalam@amd.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
 F:	drivers/edac/versal_edac.c
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index a44b85c440ca..1549dbff3666 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -546,11 +546,11 @@ config EDAC_NPCM
 	  device used to store data is used for ECC storage).
 
 config EDAC_VERSAL
-	tristate "Xilinx Versal DDR Memory Controller"
+	tristate "Xilinx Versal DDR Memory Controller and XilSEM"
 	depends on ARCH_ZYNQMP || COMPILE_TEST
 	help
 	  Support for error detection and correction on the Xilinx Versal DDR
-	  memory controller.
+	  memory controller and configuration memory of the programmable logic (PL) fabric. Support detection of errors in Network on Chip (NoC) peripheral interconnect (NPI) Registers.
 
 	  Report both single bit errors (CE) and double bit errors (UE).
 	  Support injecting both correctable and uncorrectable errors
diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
index 5a43b5d43ca2..024ddd90f699 100644
--- a/drivers/edac/versal_edac.c
+++ b/drivers/edac/versal_edac.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Xilinx Versal memory controller driver
- * Copyright (C) 2023 Advanced Micro Devices, Inc.
+ * Copyright (C) 2022 - 2026, Advanced Micro Devices, Inc.
  */
 #include <linux/bitfield.h>
 #include <linux/edac.h>
@@ -11,12 +11,88 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
 #include <linux/sizes.h>
+#include <linux/io.h>
 #include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/firmware/xlnx-versal-error-events.h>
 #include <linux/firmware/xlnx-event-manager.h>
 
 #include "edac_module.h"
 
+/* XilSem CE Error log count */
+#define XILSEM_MAX_CE_LOG_CNT	7
+
+/** Maximum CRAM error register count */
+#define MAX_CRAMERR_REG_CNT		14
+/** Maximum NPI slave skip count */
+#define MAX_NPI_SLV_SKIP_CNT	8
+/** Maximum NPI Error info count */
+#define MAX_NPI_ERR_INFO_CNT	2
+
+/* Maximum SLR count */
+#define MAX_SLR_ID	3
+
+/** Maximum number of cframe types  */
+#define CFRAME_MAX_TYPE	7
+
+/** Mask for getting Type_0, Type_4 frames */
+#define CFRAME_TYPE_0_4_MASK	GENMASK(19, 0)
+
+/** Low mask, High mask for getting Type_1, Type_5 frames */
+#define CFRAME_TYPE_1_5_MASK_L	GENMASK(39, 20)
+#define CFRAME_TYPE_1_5_MASK_H	GENMASK(7, 0)
+
+/** Shift for getting Type_1, Type_5 frames */
+#define CFRAME_TYPE_1_5_SHIFT_R		0x20
+#define CFRAME_TYPE_1_5_SHIFT_L		0x12
+
+/** Mask for getting Type_2, Type_6 frames */
+#define CFRAME_TYPE_2_6_MASK	GENMASK(27, 8)
+
+/** Shift for getting Type_2, Type_6 frames */
+#define CFRAME_TYPE_2_6_SHIFT_R		0x8
+
+/** Low mask, high mask for getting Type_3 frames */
+#define CFRAME_TYPE_3_MASK_L		GENMASK(31, 28)
+#define CFRAME_TYPE_3_MASK_H		GENMASK(15, 0)
+
+/** Shift for getting Type_3 */
+#define CFRAME_TYPE_3_SHIFT_R	0x28
+#define CFRAME_TYPE_3_SHIFT_L	0x4
+
+/* XilSem_CRAM scan error info registers */
+#define CRAM_STS_INFO_OFFSET	0x34
+#define CRAM_CE_ADDRL0_OFFSET	0x38
+#define CRAM_CE_ADDRH0_OFFSET	0x3C
+#define CRAM_CE_COUNT_OFFSET	0x70
+
+/* XilSem_NPI_Scan uncorrectable error info registers */
+#define NPI_SCAN_COUNT			0x24
+#define NPI_SCAN_HB_COUNT		0x28
+#define NPI_ERR0_INFO_OFFSET	0x2C
+#define NPI_ERR1_INFO_OFFSET	0x30
+
+/* XilSem bit masks for extracting error details */
+#define CRAM_ERR_ROW_MASK	GENMASK(26, 23)
+#define CRAM_ERR_BIT_MASK	GENMASK(22, 16)
+#define CRAM_ERR_QWRD_MASK	GENMASK(27, 23)
+#define CRAM_ERR_FRAME_MASK	GENMASK(22, 0)
+
+enum xsem_cmd_id {
+	CRAM_INIT_SCAN = 1, /* To initialize CRAM scan */
+	CRAM_START_SCAN = 2, /* To start CRAM scan */
+	CRAM_STOP_SCAN = 3, /* To stop CRAM scan */
+	CRAM_ERR_INJECT = 4, /* To inject CRAM error */
+	NPI_START_SCAN = 5, /* To start NPI scan */
+	NPI_STOP_SCAN = 6, /* To stop NPI scan */
+	NPI_ERR_INJECT = 7, /* To inject NPI error */
+};
+
+/* XilSem Module IDs */
+#define CRAM_MOD_ID			0x1
+#define NPI_MOD_ID			0x2
+
 /* Granularity of reported error in bytes */
 #define XDDR_EDAC_ERR_GRAIN			1
 
@@ -205,6 +281,105 @@ struct ecc_status {
 	u8 error_type;
 };
 
+/*  XILSEM structures */
+/**
+ * struct xsem_ecc_error_info - ECC error log information
+ * @status:	CRAM/NPI scan error status
+ * @data0:	Checksum of the error descriptor
+ * @data1:	Index of the error descriptor
+ * @frame_addr:	Frame location at which error occurred
+ * @block_type:	Block type
+ * @row_id:	Row number
+ * @bit_loc:	Bit position in the Qword
+ * @qword:	Qword location in the frame
+ */
+struct xsem_ecc_error_info {
+	u32 status;
+	u32 data0;
+	u32 data1;
+	u32 frame_addr;
+	u8 block_type;
+	u8 row_id;
+	u8 bit_loc;
+	u8 qword;
+};
+
+/**
+ * struct xsem_error_status - ECC status information to report
+ * @ce_cnt:	Correctable error count
+ * @ue_cnt:	Uncorrectable error count
+ * @ceinfo:	Correctable error log information
+ * @ueinfo:	Uncorrectable error log information
+ */
+struct xsem_error_status {
+	u32 ce_cnt;
+	u32 ue_cnt;
+	struct xsem_ecc_error_info ceinfo;
+	struct xsem_ecc_error_info ueinfo;
+};
+
+/**
+ * struct xsem_ssit_status - SSIT status information
+ * @npi_status: NPI Status
+ * @slvskpcnt: NPI Slave skip count
+ * @scancnt: NPI Scan count
+ * @hbcnt: NPI Heartbeat count
+ * @err_info: NPI Error Information
+ * @cram_status: Cram Status
+ * @err_addr: Address of corrected error location
+ * @errcnt: Corrected Error count.
+ */
+struct xsem_ssit_status {
+	u32 npi_status;
+	u32 slvskpcnt[MAX_NPI_SLV_SKIP_CNT];
+	u32 scancnt;
+	u32 hbcnt;
+	u32 err_info[MAX_NPI_ERR_INFO_CNT];
+	u32 cram_status;
+	u32 err_addr[MAX_CRAMERR_REG_CNT];
+	u32 errcnt;
+};
+
+/**
+ * struct xsem_rtca_priv - Xilsem private instance data
+ * @baseaddr:	Base address of the XilSem PLM RTCA module
+ * @cram_get_frames_status:	Buffer for get total frames command
+ * @cram_get_crc_status:	Buffer for CRC read command
+ * @xilsem_ssit_status:	Buffer for SLR status command
+ * @cram_errinj_status:	Buffer for CRAM error injection
+ * @cram_total_frames:	Buffer for total cframes data
+ * @scan_ctrl_status:	Buffer for scan ctrl commands
+ * @cram_frame_ecc:	Buffer for CRAM frame ECC
+ * @xilsem_status:	Buffer for CRAM & NPI status
+ * @xilsem_cfg:	Buffer for CRAM & NPI configuration
+ * @sw_event_node_id:	Error event node Id
+ * @cram_ce_mask: Event bit mask for CRAM correctable error
+ * @cram_ue_mask: Event bit mask for CRAM uncorrectable error
+ * @npi_ue_mask: Event bit mask for NPI uncorrectable error
+ * @cram_ce_cnt:	Correctable Error count
+ * @cram_ue_cnt:	Uncorrectable Error count
+ * @slr_info:	Pointer to get SSIT status information
+ */
+struct xsem_rtca_priv {
+	void __iomem *baseaddr;
+	u32 cram_get_frames_status[4];
+	u32 cram_get_crc_status[6];
+	u32 xilsem_ssit_status[4];
+	u32 cram_errinj_status[3];
+	u32 cram_total_frames[7];
+	u32 scan_ctrl_status[7];
+	u32 cram_frame_ecc[4];
+	u32 xilsem_status[4];
+	u32 xilsem_cfg[6];
+	u32 sw_event_node_id;
+	u32 cram_ce_mask;
+	u32 cram_ue_mask;
+	u32 npi_ue_mask;
+	u32 cram_ce_cnt;
+	u32 cram_ue_cnt;
+	struct xsem_ssit_status *slr_info;
+};
+
 /**
  * struct edac_priv - DDR memory controller private instance data.
  * @ddrmc_baseaddr:	Base address of the DDR controller.
@@ -227,6 +402,8 @@ struct ecc_status {
 struct edac_priv {
 	void __iomem *ddrmc_baseaddr;
 	void __iomem *ddrmc_noc_baseaddr;
+	void __iomem *sem_baseaddr;
+	struct xsem_rtca_priv *xsem_rtca;
 	char message[XDDR_EDAC_MSG_SIZE];
 	u32 mc_id;
 	u32 ce_cnt;
@@ -1073,14 +1250,1108 @@ static u32 emif_get_id(struct device_node *node)
 	return my_id;
 }
 
+/**
+ * xsem_scan_control_show - Shows scan control operation status
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ *
+ * Shows the scan control operations status
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_scan_control_show(struct device *dev,
+				      struct device_attribute *mattr,
+				      char *data)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	return sprintf(data, "[0x%x][0x%x][0x%x][0x%x][0x%x][0x%x][0x%x]\n\r",
+			priv->xsem_rtca->scan_ctrl_status[0],
+			priv->xsem_rtca->scan_ctrl_status[0],
+			priv->xsem_rtca->scan_ctrl_status[1],
+			priv->xsem_rtca->scan_ctrl_status[2],
+			priv->xsem_rtca->scan_ctrl_status[3],
+			priv->xsem_rtca->scan_ctrl_status[4],
+			priv->xsem_rtca->scan_ctrl_status[5]);
+}
+
+/**
+ * xsem_scan_control_store - Set scan control operation
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for doing Xilsem scan operations
+ * (initialization, start, stop)
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_scan_control_store(struct device *dev,
+				       struct device_attribute *mattr,
+				       const char *data, size_t count)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	char *kern_buff, *inbuf, *tok;
+	u32 cmd;
+	u32 slrid;
+	int ret;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	kern_buff = kzalloc(count, GFP_KERNEL);
+	if (!kern_buff)
+		return -ENOMEM;
+	strscpy(kern_buff, data, count);
+
+	inbuf = kern_buff;
+
+	if (!data) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	/* Read Scan command */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &cmd);
+	if (ret) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	/* Read SLR number */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &slrid);
+	if (ret) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (cmd < CRAM_INIT_SCAN || cmd > NPI_ERR_INJECT || cmd == CRAM_ERR_INJECT) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (slrid > MAX_SLR_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = zynqmp_pm_xilsem_cntrl_ops(cmd, slrid, priv->xsem_rtca->scan_ctrl_status);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_cram_injecterr_show - Shows CRAM error injection status
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM error injection status
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_cram_injecterr_show(struct device *dev,
+					struct device_attribute *mattr,
+					char *data)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	return sprintf(data, "[0x%x][0x%x][0x%x]]\n\r",
+			priv->xsem_rtca->cram_errinj_status[0],
+			priv->xsem_rtca->cram_errinj_status[1],
+			priv->xsem_rtca->cram_errinj_status[2]);
+}
+
+/**
+ * xsem_cram_injecterr_store - Start error injection
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for doing CRAM error injection
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_cram_injecterr_store(struct device *dev,
+					 struct device_attribute *mattr,
+					 const char *data, size_t count)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	char *kern_buff, *inbuf, *tok;
+	u32 row, frame, qword, bitloc, slrid;
+	int ret;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	kern_buff = kzalloc(count, GFP_KERNEL);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	strscpy(kern_buff, data, count);
+
+	inbuf = kern_buff;
+
+	/* Read Frame number */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &frame);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	/* Read Qword number */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &qword);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	/* Read Bit location */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &bitloc);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	/* Read Row number */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &row);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	/* Read slr id */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &slrid);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	if (slrid > MAX_SLR_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = zynqmp_pm_xilsem_cram_errinj(slrid, frame, qword, bitloc, row,
+					   priv->xsem_rtca->cram_errinj_status);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_cram_framecc_read_show - Shows CRAM Frame ECC
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM Frame ECC value
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_cram_framecc_read_show(struct device *dev,
+					   struct device_attribute *mattr,
+					   char *data)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	int offset = 0;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	offset += sprintf(data + offset, "Read Frame ECC Cmd: [0x%x]\n\r",
+			  priv->xsem_rtca->cram_frame_ecc[0]);
+	offset += sprintf(data + offset, "Frame ECC Word_0: [0x%x]\n\r",
+			  priv->xsem_rtca->cram_frame_ecc[1]);
+	offset += sprintf(data + offset, "Frame ECC Word_1: [0x%x]\n\r",
+			  priv->xsem_rtca->cram_frame_ecc[2]);
+	offset += sprintf(data + offset, "Cmd Status: [0x%x]\n\r",
+			  priv->xsem_rtca->cram_frame_ecc[3]);
+
+	return offset;
+}
+
+/**
+ * xsem_cram_framecc_read_store - Read CRAM Frame ECC
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading CRAM frame ECC
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_cram_framecc_read_store(struct device *dev,
+					    struct device_attribute *mattr,
+					    const char *data, size_t count)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	char *kern_buff, *inbuf, *tok;
+	u32 frameaddr, row, slrid;
+	int ret;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	kern_buff = kzalloc(count, GFP_KERNEL);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	strscpy(kern_buff, data, count);
+
+	inbuf = kern_buff;
+
+	/* Read Frame address */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &frameaddr);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	/* Read Row number */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &row);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	/* Read slr id */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &slrid);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	if (slrid > MAX_SLR_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = zynqmp_pm_xilsem_cram_readecc(slrid, frameaddr, row,
+					    priv->xsem_rtca->cram_frame_ecc);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_cram_ssit_getcrc_show - Shows CRAM Row CRC
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM Row CRC value
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_cram_ssit_getcrc_show(struct device *dev,
+					  struct device_attribute *mattr,
+					  char *data)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	int offset = 0;
+	u32 id;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	offset += sprintf(data + offset, "Read CRC Cmd:[0x%x]\n\r",
+			  priv->xsem_rtca->cram_get_crc_status[0]);
+	for (id = 0; id < 4; id++)
+		offset += sprintf(data + offset, "CRC_Word %d:[0x%x]\n\r", id,
+				  priv->xsem_rtca->cram_get_crc_status[id + 1]);
+	offset += sprintf(data + offset, "Cmd status: [0x%x]\n\r",
+			  priv->xsem_rtca->cram_get_crc_status[5]);
+
+	return offset;
+}
+
+/**
+ * xsem_cram_ssit_getcrc_store - Read CRAM row CRC
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading CRAM row CRC
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_cram_ssit_getcrc_store(struct device *dev,
+					   struct device_attribute *mattr,
+					   const char *data, size_t count)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	char *kern_buff, *inbuf, *tok;
+	u32 rowindex, slrid;
+	int ret;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	kern_buff = kzalloc(count, GFP_KERNEL);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	strscpy(kern_buff, data, count);
+
+	inbuf = kern_buff;
+
+	/* Read Row number */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &rowindex);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	/* Read SLR Id */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &slrid);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	if (slrid > MAX_SLR_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = zynqmp_pm_xilsem_cram_getcrc(slrid, rowindex,
+					   priv->xsem_rtca->cram_get_crc_status);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_total_cframes_ssit_show - Shows total cframes
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM total cframes
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_total_cframes_ssit_show(struct device *dev,
+					    struct device_attribute *mattr,
+					    char *data)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	u32 temp_buf[CFRAME_MAX_TYPE] = {0};
+	u32 id;
+	int offset = 0;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	for (id = 0; id < CFRAME_MAX_TYPE; id++)
+		temp_buf[id] = priv->xsem_rtca->cram_total_frames[id];
+
+	priv->xsem_rtca->cram_total_frames[0]  = (temp_buf[0] & CFRAME_TYPE_0_4_MASK);
+	priv->xsem_rtca->cram_total_frames[1]  = (temp_buf[0] &
+					CFRAME_TYPE_1_5_MASK_L) >> CFRAME_TYPE_1_5_SHIFT_R;
+	priv->xsem_rtca->cram_total_frames[1] |= (temp_buf[1] &
+					CFRAME_TYPE_1_5_MASK_H) << CFRAME_TYPE_1_5_SHIFT_L;
+	priv->xsem_rtca->cram_total_frames[2]  = (temp_buf[1] &
+					CFRAME_TYPE_2_6_MASK) >> CFRAME_TYPE_2_6_SHIFT_R;
+	priv->xsem_rtca->cram_total_frames[3]  = (temp_buf[1] &
+					CFRAME_TYPE_3_MASK_L) >> CFRAME_TYPE_3_SHIFT_R;
+	priv->xsem_rtca->cram_total_frames[3] |= (temp_buf[2] &
+					CFRAME_TYPE_3_MASK_H) << CFRAME_TYPE_3_SHIFT_L;
+	priv->xsem_rtca->cram_total_frames[4]  = (temp_buf[4] & CFRAME_TYPE_0_4_MASK);
+	priv->xsem_rtca->cram_total_frames[5]  = (temp_buf[4] &
+					CFRAME_TYPE_1_5_MASK_L) >> CFRAME_TYPE_1_5_SHIFT_R;
+	priv->xsem_rtca->cram_total_frames[5] |= (temp_buf[5] &
+					CFRAME_TYPE_1_5_MASK_H) << CFRAME_TYPE_1_5_SHIFT_L;
+	priv->xsem_rtca->cram_total_frames[6]  = (temp_buf[5] &
+					CFRAME_TYPE_2_6_MASK) >> CFRAME_TYPE_2_6_SHIFT_R;
+
+	offset += sprintf(data + offset, "Read Total Frames Cmd : [0x%x]\n\r",
+			  priv->xsem_rtca->cram_get_frames_status[0]);
+	offset += sprintf(data + offset, "SLR ID : [0x%x]\n\r",
+			  priv->xsem_rtca->cram_get_frames_status[1]);
+	offset += sprintf(data + offset, "Row Index: [0x%x]\n\r",
+			  priv->xsem_rtca->cram_get_frames_status[2]);
+	for (id = 0; id < CFRAME_MAX_TYPE; id++)
+		offset += sprintf(data + offset, "Type[%d] frame count: [%d]\n\r", id,
+				  priv->xsem_rtca->cram_total_frames[id]);
+
+	offset += sprintf(data + offset, "Cmd Status: [0x%x]\n\r",
+			  priv->xsem_rtca->cram_get_frames_status[3]);
+	return offset;
+}
+
+/**
+ * xsem_total_cframes_ssit_store - Read total cframes in CRAM
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading CRAM total frames in ssit device
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_total_cframes_ssit_store(struct device *dev,
+					     struct device_attribute *mattr,
+					     const char *data, size_t count)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	char *kern_buff, *inbuf, *tok, *kbuf1;
+	dma_addr_t dma_addr = 0;
+	u32 row, slrid, dma_size;
+	int ret;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	kern_buff = kzalloc(count, GFP_KERNEL);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	strscpy(kern_buff, data, count);
+
+	inbuf = kern_buff;
+
+	/* Read Row number */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &row);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	/* Read slr id */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &slrid);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	if (slrid > MAX_SLR_ID || row > 4) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	dma_size = sizeof(priv->xsem_rtca->cram_total_frames);
+	kbuf1 = dma_alloc_coherent(dev, dma_size, &dma_addr, GFP_KERNEL);
+	if (!kbuf1) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	ret = zynqmp_pm_xilsem_cram_ssit_totframes(slrid, row, dma_addr,
+						   priv->xsem_rtca->cram_get_frames_status);
+	if (ret) {
+		edac_printk(KERN_ERR, EDAC_MC, "ERROR: XilSEM Status PM API failed\n");
+		dma_free_coherent(dev, dma_size, kbuf1, dma_addr);
+		goto err;
+	}
+
+	memcpy(priv->xsem_rtca->cram_total_frames, kbuf1, dma_size);
+	dma_free_coherent(dev, dma_size, kbuf1, dma_addr);
+
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_read_status_show - Shows CRAM & NPI scan status
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM & NPI scan status
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_read_status_show(struct device *dev,
+				     struct device_attribute *mattr,
+				     char *data)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	return sprintf(data, "[0x%x][0x%x][0x%x]\n\r",
+			priv->xsem_rtca->xilsem_status[0],
+			priv->xsem_rtca->xilsem_status[1],
+			priv->xsem_rtca->xilsem_status[2]);
+}
+
+/**
+ * xsem_read_status_store - Read CRAM & NPI scan status
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading Xilsem status
+ * Return: count argument if read succeeds, else error code
+ */
+static ssize_t xsem_read_status_store(struct device *dev,
+				      struct device_attribute *mattr,
+				      const char *data, size_t count)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	u32 module;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	if (!data)
+		return -EFAULT;
+
+	if (kstrtouint(data, 0, &module))
+		return -EINVAL;
+
+	if (module == CRAM_MOD_ID) {
+		if (priv->sem_baseaddr) {
+			priv->xsem_rtca->xilsem_status[0] = readl(priv->sem_baseaddr +
+								   CRAM_STS_INFO_OFFSET);
+			priv->xsem_rtca->xilsem_status[1] = readl(priv->sem_baseaddr +
+								   CRAM_CE_COUNT_OFFSET);
+			priv->xsem_rtca->xilsem_status[2] = 0;
+		}
+	} else if (module == NPI_MOD_ID) {
+		if (priv->sem_baseaddr) {
+			priv->xsem_rtca->xilsem_status[0] = readl(priv->sem_baseaddr);
+			priv->xsem_rtca->xilsem_status[1] = readl(priv->sem_baseaddr +
+								   NPI_SCAN_COUNT);
+			priv->xsem_rtca->xilsem_status[2] = readl(priv->sem_baseaddr +
+								   NPI_SCAN_HB_COUNT);
+		}
+	} else {
+		edac_printk(KERN_ERR, EDAC_MC, "Invalid module %d\n", module);
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+/**
+ * xsem_read_ssit_status_show - Shows CRAM & NPI scan for SSIT device
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM & NPI scan status for given SLR
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_read_ssit_status_show(struct device *dev,
+					  struct device_attribute *mattr,
+					  char *data)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	int offset = 0;
+	int id;
+
+	if (!priv->xsem_rtca || !priv->xsem_rtca->slr_info)
+		return -EINVAL;
+
+	offset += sprintf(data + offset, "Read SLR Status Cmd:[0x%x]\n\r",
+			  priv->xsem_rtca->xilsem_ssit_status[0]);
+	offset += sprintf(data + offset, "SLR ID:[0x%x]\n\r",
+			  priv->xsem_rtca->xilsem_ssit_status[1]);
+	offset += sprintf(data + offset, "NPI status:[0x%x]\n\r",
+			  priv->xsem_rtca->slr_info->npi_status);
+	offset += sprintf(data + offset, "NPI scan count:[0x%x]\n\r",
+			  priv->xsem_rtca->slr_info->scancnt);
+	offset += sprintf(data + offset, "NPI Heartbeat count:[0x%x]\n\r",
+			  priv->xsem_rtca->slr_info->hbcnt);
+	for (id = 0; id < MAX_NPI_SLV_SKIP_CNT; id++)
+		offset += sprintf(data + offset, "NPI scan skip count %x :[0x%x]\n\r", id,
+				  priv->xsem_rtca->slr_info->slvskpcnt[id]);
+
+	for (id = 0; id < MAX_NPI_ERR_INFO_CNT; id++)
+		offset += sprintf(data + offset, "NPI error info %x :[0x%x]\n\r", id,
+				  priv->xsem_rtca->slr_info->err_info[id]);
+
+	offset += sprintf(data + offset, "CRAM status:[0x%x]\n\r",
+			  priv->xsem_rtca->slr_info->cram_status);
+
+	for (id = 0U; id < 7; id++) {
+		offset += sprintf(data + offset, "Error Location High %x: [0x%x]\n\r", id,
+				  priv->xsem_rtca->slr_info->err_addr[(id * 2) + 1]);
+		offset += sprintf(data + offset, "Error Location Low %x: [0x%x]\n\r", id,
+				  priv->xsem_rtca->slr_info->err_addr[id * 2]);
+	}
+	offset += sprintf(data + offset, "CRAM scan CE count:[0x%x]\n\r",
+			  priv->xsem_rtca->slr_info->errcnt);
+
+	return offset;
+}
+
+/**
+ * xsem_read_ssit_status_store - Read CRAM & NPI scan SSIT status
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading Xilsem status for SSIT device
+ * Return: count argument if read succeeds, else error code
+ */
+static ssize_t xsem_read_ssit_status_store(struct device *dev,
+					   struct device_attribute *mattr,
+					   const char *data, size_t count)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	char *kern_buff, *inbuf, *tok, *kbuf1;
+	size_t dma_size;
+	dma_addr_t dma_addr = 0;
+	u32 slrid;
+	int ret;
+
+	if (!priv->xsem_rtca || !priv->xsem_rtca->slr_info)
+		return -EINVAL;
+
+	kern_buff = kzalloc(count, GFP_KERNEL);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	strscpy(kern_buff, data, count);
+
+	inbuf = kern_buff;
+
+	/* Read SLR ID */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &slrid);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	if (slrid > MAX_SLR_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	dma_size  = sizeof(struct xsem_ssit_status);
+
+	kbuf1 = dma_alloc_coherent(dev, dma_size, &dma_addr, GFP_KERNEL);
+	if (!kbuf1) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	ret = zynqmp_pm_xilsem_read_ssit_status(slrid, dma_addr,
+						priv->xsem_rtca->xilsem_ssit_status);
+	if (ret) {
+		edac_printk(KERN_ERR, EDAC_MC, "ERROR: XilSEM Status PM API failed\n");
+		dma_free_coherent(dev, dma_size, kbuf1, dma_addr);
+		goto err;
+	}
+
+	memcpy(priv->xsem_rtca->slr_info, kbuf1, dma_size);
+
+	dma_free_coherent(dev, dma_size, kbuf1, dma_addr);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_read_config_show - Shows CRAM & NPI configuration
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM & NPI configuration
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_read_config_show(struct device *dev,
+				     struct device_attribute *mattr,
+				     char *data)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	int offset = 0;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	offset += sprintf(data + offset, "Read Config Cmd: [0x%x]\n\r",
+			  priv->xsem_rtca->xilsem_cfg[0]);
+	offset += sprintf(data + offset, "CRAM Scan Config: [0x%x]\n\r",
+			  priv->xsem_rtca->xilsem_cfg[1]);
+	offset += sprintf(data + offset, "NPI Scan Config: [0x%x]\n\r",
+			  priv->xsem_rtca->xilsem_cfg[2]);
+	offset += sprintf(data + offset, "Cmd Status: [0x%x]\n\r",
+			  priv->xsem_rtca->xilsem_cfg[3]);
+
+	return offset;
+}
+
+/**
+ * xsem_read_config_store - Read CRAM & NPI configuration
+ * @dev:	Pointer to the device struct
+ * @mattr:	Pointer to device attribute
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading Xilsem configuration
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_read_config_store(struct device *dev,
+				      struct device_attribute *mattr,
+				      const char *data, size_t count)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct edac_priv *priv = mci->pvt_info;
+	char *kern_buff, *inbuf, *tok;
+	u32 slrid;
+	int ret;
+
+	if (!priv->xsem_rtca)
+		return -EINVAL;
+
+	kern_buff = kzalloc(count, GFP_KERNEL);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	strscpy(kern_buff, data, count);
+
+	inbuf = kern_buff;
+
+	/* Read SLR id */
+	tok = strsep(&inbuf, " ");
+	if (!tok) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	ret = kstrtouint(tok, 0, &slrid);
+	if (ret) {
+		ret = -EFAULT;
+		goto err;
+	}
+
+	if (slrid > MAX_SLR_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = zynqmp_pm_xilsem_read_cfg(slrid, priv->xsem_rtca->xilsem_cfg);
+
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_geterror_info - Get the current ecc error info
+ * @mci:	Pointer to the memory controller instance
+ * @p:		Pointer to the Xilsem error status structure
+ * @mask:	mask indicates the error type
+ *
+ * Determines there is any ecc error or not
+ */
+static void xsem_geterror_info(struct mem_ctl_info *mci, struct xsem_error_status *p,
+			       int mask)
+{
+	struct edac_priv *priv = mci->pvt_info;
+	u32 error_word_0, error_word_1, ce_count;
+	u8 index;
+
+	if (!priv->xsem_rtca || !priv->sem_baseaddr)
+		return;
+
+	if (mask & priv->xsem_rtca->cram_ce_mask) {
+		p->ce_cnt++;
+
+		/* Read CRAM total correctable error count */
+		ce_count = readl(priv->sem_baseaddr + CRAM_CE_COUNT_OFFSET);
+		/* Calculate index for error log */
+		index = (ce_count % XILSEM_MAX_CE_LOG_CNT);
+		/*
+		 * Check if addr index is not 0
+		 * if yes, then decrement index, else set index as last entry
+		 */
+		if (index != 0U) {
+			/* Decrement Index */
+			--index;
+		} else {
+			/* Set log index to 6 (Max-1) */
+			index = (XILSEM_MAX_CE_LOG_CNT - 1);
+		}
+		error_word_0 = readl(priv->sem_baseaddr + CRAM_CE_ADDRL0_OFFSET + (index * 8U));
+		error_word_1 = readl(priv->sem_baseaddr + CRAM_CE_ADDRH0_OFFSET + (index * 8U));
+
+		/* Frame is at 22:0 bits of SEM_CRAMERR_ADDRH0 reg */
+		p->ceinfo.frame_addr = FIELD_GET(CRAM_ERR_FRAME_MASK, error_word_1);
+
+		/* row is at 26:23 bits of SEM_CRAMERR_ADDRH0 reg */
+		p->ceinfo.row_id = FIELD_GET(CRAM_ERR_ROW_MASK, error_word_1);
+
+		/* bit is at 22:16 bits of SEM_CRAMERR_ADDRL0 reg */
+		p->ceinfo.bit_loc = FIELD_GET(CRAM_ERR_BIT_MASK, error_word_0);
+
+		/* Qword is at 27:23 bits of SEM_CRAMERR_ADDRL0 reg */
+		p->ceinfo.qword = FIELD_GET(CRAM_ERR_QWRD_MASK, error_word_0);
+
+		/* Read CRAM status */
+		p->ceinfo.status = readl(priv->sem_baseaddr + CRAM_STS_INFO_OFFSET);
+	} else if (mask & priv->xsem_rtca->cram_ue_mask) {
+		p->ue_cnt++;
+		p->ueinfo.data0 = 0;
+		p->ueinfo.data1 = 0;
+		p->ueinfo.status = readl(priv->sem_baseaddr + CRAM_STS_INFO_OFFSET);
+	} else if (mask & priv->xsem_rtca->npi_ue_mask) {
+		p->ue_cnt++;
+		p->ueinfo.data0 = readl(priv->sem_baseaddr + NPI_ERR0_INFO_OFFSET);
+		p->ueinfo.data1 = readl(priv->sem_baseaddr + NPI_ERR1_INFO_OFFSET);
+		p->ueinfo.status = readl(priv->sem_baseaddr);
+	} else {
+		edac_printk(KERN_ERR, EDAC_MC, "Invalid Event received %d\n", mask);
+	}
+}
+
+/**
+ * xsem_handle_error - Handle XilSem error types CE and UE
+ * @mci:	Pointer to the memory controller instance
+ * @p:		Pointer to the xilsem error status structure
+ *
+ * Handles the correctable and uncorrectable error.
+ */
+static void xsem_handle_error(struct mem_ctl_info *mci, struct xsem_error_status *p)
+{
+	struct xsem_ecc_error_info *pinf;
+	char message[XDDR_EDAC_MSG_SIZE];
+
+	if (p->ce_cnt) {
+		pinf = &p->ceinfo;
+		snprintf(message, XDDR_EDAC_MSG_SIZE,
+			 "\n\rXILSEM CRAM error type :%s\n\r"
+			 "\nFrame_Addr: [0x%X]\t Row_num: [0x%X]\t Bit_loc: [0x%X]\t Qword: [0x%X]\n\r",
+			 "CE", pinf->frame_addr, pinf->row_id,
+			 pinf->bit_loc, pinf->qword);
+
+		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
+				     p->ce_cnt, 0, 0, 0, 0, 0, -1,
+				     message, "");
+	}
+
+	if (p->ue_cnt) {
+		pinf = &p->ueinfo;
+		snprintf(message, XDDR_EDAC_MSG_SIZE,
+			 "\n\rXILSEM error type :%s\n\r"
+			 "status: [0x%X]\n\rError_Info0: [0x%X]\n\r"
+			 "Error_Info1: [0x%X]",
+			 "UE", pinf->status, pinf->data0, pinf->data1);
+
+		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
+				     p->ue_cnt, 0, 0, 0, 0, 0, -1,
+				     message, "");
+	}
+}
+
+/**
+ * xsem_err_callback - Handle Correctable and Uncorrectable errors.
+ * @payload:	payload data.
+ * @data:	controller data.
+ *
+ * Handles ECC correctable and uncorrectable errors.
+ */
+static void xsem_err_callback(const u32 *payload, void *data)
+{
+	struct xsem_error_status stat;
+	struct edac_priv *priv;
+	struct mem_ctl_info *mci = (struct mem_ctl_info *)data;
+	int event;
+
+	priv = mci->pvt_info;
+	if (!priv->xsem_rtca)
+		return;
+
+	memset(&stat, 0, sizeof(stat));
+	/* Read payload to get the event type */
+	event = payload[2];
+	edac_printk(KERN_INFO, EDAC_MC, "Event received %x\n", event);
+	xsem_geterror_info(mci, &stat, event);
+
+	priv->xsem_rtca->cram_ce_cnt += stat.ce_cnt;
+	priv->xsem_rtca->cram_ue_cnt += stat.ue_cnt;
+	xsem_handle_error(mci, &stat);
+}
+
+static DEVICE_ATTR_RW(xsem_scan_control);
+static DEVICE_ATTR_RW(xsem_cram_injecterr);
+static DEVICE_ATTR_RW(xsem_cram_framecc_read);
+static DEVICE_ATTR_RW(xsem_cram_ssit_getcrc);
+static DEVICE_ATTR_RW(xsem_read_status);
+static DEVICE_ATTR_RW(xsem_read_ssit_status);
+static DEVICE_ATTR_RW(xsem_total_cframes_ssit);
+static DEVICE_ATTR_RW(xsem_read_config);
+
+static struct attribute *xsem_edac_sysfs_attrs[] = {
+	&dev_attr_xsem_scan_control.attr,
+	&dev_attr_xsem_cram_injecterr.attr,
+	&dev_attr_xsem_cram_framecc_read.attr,
+	&dev_attr_xsem_cram_ssit_getcrc.attr,
+	&dev_attr_xsem_read_status.attr,
+	&dev_attr_xsem_read_ssit_status.attr,
+	&dev_attr_xsem_total_cframes_ssit.attr,
+	&dev_attr_xsem_read_config.attr,
+	NULL,
+};
+
+static const struct attribute_group xsem_edac_sysfs_attr_group = {
+	.attrs = xsem_edac_sysfs_attrs,
+};
+
+static int xsem_edac_create_sysfs_attributes(struct mem_ctl_info *mci)
+{
+	return sysfs_create_group(&mci->dev.kobj, &xsem_edac_sysfs_attr_group);
+}
+
+static void xsem_edac_remove_sysfs_attributes(struct mem_ctl_info *mci)
+{
+	sysfs_remove_group(&mci->dev.kobj, &xsem_edac_sysfs_attr_group);
+}
+
 static int mc_probe(struct platform_device *pdev)
 {
-	void __iomem *ddrmc_baseaddr, *ddrmc_noc_baseaddr;
+	void __iomem *ddrmc_baseaddr, *ddrmc_noc_baseaddr, *sem_baseaddr;
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
 	u8 num_chans, num_csrows;
 	struct edac_priv *priv;
 	u32 edac_mc_id, regval;
+	u32 family_code;
 	int rc;
 
 	ddrmc_baseaddr = devm_platform_ioremap_resource_byname(pdev, "base");
@@ -1094,6 +2365,10 @@ static int mc_probe(struct platform_device *pdev)
 	if (!get_ecc_state(ddrmc_baseaddr))
 		return -ENXIO;
 
+	sem_baseaddr = devm_platform_ioremap_resource_byname(pdev, "semrtca");
+	if (IS_ERR(sem_baseaddr))
+		return PTR_ERR(sem_baseaddr);
+
 	/* Allocate ID number for the EMIF controller */
 	edac_mc_id = emif_get_id(pdev->dev.of_node);
 
@@ -1124,9 +2399,29 @@ static int mc_probe(struct platform_device *pdev)
 	priv = mci->pvt_info;
 	priv->ddrmc_baseaddr = ddrmc_baseaddr;
 	priv->ddrmc_noc_baseaddr = ddrmc_noc_baseaddr;
+	priv->sem_baseaddr = sem_baseaddr;
 	priv->ce_cnt = 0;
 	priv->ue_cnt = 0;
 	priv->mc_id = edac_mc_id;
+	priv->xsem_rtca = NULL;
+
+	/* Allocate and initialize XilSem RTCA structure */
+	priv->xsem_rtca = devm_kzalloc(&pdev->dev,
+				       sizeof(struct xsem_rtca_priv),
+				       GFP_KERNEL);
+	if (!priv->xsem_rtca) {
+		edac_printk(KERN_ERR, EDAC_MC,
+			    "Failed to allocate xsem_rtca\n");
+		rc = -ENOMEM;
+		goto free_edac_mc;
+	}
+
+	priv->xsem_rtca->slr_info = devm_kzalloc(&pdev->dev, sizeof(struct xsem_ssit_status),
+						 GFP_KERNEL);
+	if (!priv->xsem_rtca->slr_info) {
+		rc = -ENOMEM;
+		goto free_edac_mc;
+	}
 
 	mc_init(mci, pdev);
 
@@ -1147,6 +2442,41 @@ static int mc_probe(struct platform_device *pdev)
 		goto del_mc;
 	}
 
+	/* Create XilSem sysfs attributes only if XilSem is available */
+	rc = xsem_edac_create_sysfs_attributes(mci);
+	if (rc) {
+		edac_printk(KERN_ERR, EDAC_MC,
+			    "Failed to create sysfs entries\n");
+		goto remove_sysfs;
+	}
+
+	/*
+	 * Firmware driver returns -ENODEV if it is not probed. In this case
+	 * defer XilSEM error event registration.
+	 */
+	rc = zynqmp_pm_get_family_info(&family_code);
+	if (rc) {
+		if (rc == -ENODEV)
+			rc = -EPROBE_DEFER;
+
+		goto del_mc;
+	}
+	if (family_code == PM_VERSAL_FAMILY_CODE) {
+		priv->xsem_rtca->sw_event_node_id = VERSAL_EVENT_ERROR_SW_ERR;
+		priv->xsem_rtca->cram_ce_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_CE_5;
+		priv->xsem_rtca->cram_ue_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_UE_6;
+		priv->xsem_rtca->npi_ue_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_UE_7;
+	} else {
+		edac_printk(KERN_ERR, EDAC_MC, "Invalid Device family code %d\n", family_code);
+	}
+
+	rc = xlnx_register_event(PM_NOTIFY_CB, priv->xsem_rtca->sw_event_node_id,
+				 priv->xsem_rtca->cram_ce_mask | priv->xsem_rtca->cram_ue_mask |
+				 priv->xsem_rtca->npi_ue_mask,
+				 false, xsem_err_callback, mci);
+	if (rc)
+		goto del_mc;
+
 #ifdef CONFIG_EDAC_DEBUG
 	create_debugfs_attributes(mci);
 	setup_address_map(priv);
@@ -1154,6 +2484,8 @@ static int mc_probe(struct platform_device *pdev)
 	enable_intr(priv);
 	return rc;
 
+remove_sysfs:
+	xsem_edac_remove_sysfs_attributes(mci);
 del_mc:
 	edac_mc_del_mc(&pdev->dev);
 free_edac_mc:
@@ -1173,9 +2505,21 @@ static void mc_remove(struct platform_device *pdev)
 	debugfs_remove_recursive(priv->debugfs);
 #endif
 
+	/* Unregister XilSem events if they were registered */
+	if (priv->xsem_rtca) {
+		xlnx_unregister_event(PM_NOTIFY_CB, priv->xsem_rtca->sw_event_node_id,
+				      priv->xsem_rtca->cram_ce_mask |
+					  priv->xsem_rtca->cram_ue_mask |
+					  priv->xsem_rtca->npi_ue_mask,
+				      xsem_err_callback, mci);
+	}
 	xlnx_unregister_event(PM_NOTIFY_CB, VERSAL_EVENT_ERROR_PMC_ERR1,
 			      XPM_EVENT_ERROR_MASK_DDRMC_CR |
 			      XPM_EVENT_ERROR_MASK_DDRMC_NCR, err_callback, mci);
+	/* Remove XilSem sysfs attributes if they were created */
+	if (priv->xsem_rtca)
+		xsem_edac_remove_sysfs_attributes(mci);
+
 	edac_mc_del_mc(&pdev->dev);
 	edac_mc_free(mci);
 }
-- 
2.23.0

