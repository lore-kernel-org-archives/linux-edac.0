Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011041.outbound.protection.outlook.com [40.93.194.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C414C3E559B;
	Wed, 24 Jun 2026 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336371; cv=fail; b=LgUz69DPb3Zw1x46zL3MhsLZpd9InC/xz2EP03Put+RrTWywm3QU85zNxbV0j0aBujxJyWOl2LeWcCdTrWY/YJ4+psDghM50CvXpLwGkF9/1K4rIya0vI/XpBhi2oX7/geAQNl1Y8PpW/hv2AzVS8i9zpvro+W8D90GjOXATx0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336371; c=relaxed/simple;
	bh=elY4nnfGvjfc6MRrQXChADzYCeNMZm+AJTqxRliuDio=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fdSQhgMRQc4EHPlfm7ihdNosATsHg7uhEWUQtQZxRrXMmwCQj3mWDywUMZzRv09NMJav+59JXq9LhsyGxFwOtF1Y970y8088ywFzRSbBizojv+YcuOO6DCD574PeN9GbmlcnLds3azHSJqIw47pxrJ+Y9nxcV8epgy2FnaWpTsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1Q5j7g1R; arc=fail smtp.client-ip=40.93.194.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1Q5j7g1R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLfwK1hO2baXLH+0Gghhifxodv7ov40jex9pI8Oppg9U7eofMS+bi51qZOn4PxlMglAZUMrO4zyW9nHST1HToAu2yM2lVGabyHAKvoxcuZ7zvasBgI2NeyINJf54IRhlivT4yFuQ+ACxXzj4oCc0do+6zLZ6Ki5K/MYYs+UZnKuE7zzYW2dAINCzYpG/CCu8b4kDhnbclGaMqopVS4T7ivtduRJ5m7ODgozvWRcxWIzmZmE3yQbrsV9fDpmjcYxGXkNriyNMPM9gvNCrBLK0D2rttduGx3jk4kURAk+9/0igLcQd9Nc4RvMSBj2Hyr/l2EUtahLEtgPKxzwqxaE7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NiBCjY1orEt1hxSjxMIJ+fMz+RPUJHhYT1vdnLJqgQ=;
 b=GxXYZlg+rGKvX9i+IzRUNCbRg0bvLwS5BKfTXQiCuYNxg306AD13nmARdx0ba5xGu05zQ1S88o/lpg/JrOGDLaeuJh1YkE6qO4Wzd50/8xO1Kdb2LeKZ4rI6ZVlyplc6Pr5V64T4z6W8HugoRvejYkj3yN2YkDLP/ai5qxD/Sxex6yCkEmEM9VOi4amUMYqDI/pt1q1aS1I5TQ4561aiL4EbGqAiEDlcOhrKmqRNgK14cQ8dZTs/GFloQXTomb7n+ZfNJUSbeQcTLyGKYnOZqWOJWSZoDdTDBSP0/5gAm0ROHv6uYUqXazx6Fa0oA4afUIZmR4KuxiOMFcOtPnttdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NiBCjY1orEt1hxSjxMIJ+fMz+RPUJHhYT1vdnLJqgQ=;
 b=1Q5j7g1RkIQrOylKynFKhRLmejTVkDiOYPcggi2vnNJAROL9siaopy7FmrT6cBGqhLfpM11OK+dcyOfhU5bsHwsBj3UVKfaWO/mpRn3LKnu3BFUa2RCd+uWKGEyvSHlRS/o7XXKBKiXPwq/45xKgKg+cpSoFk8regTubwX1tHbs=
Received: from SA9PR13CA0073.namprd13.prod.outlook.com (2603:10b6:806:23::18)
 by DS7PR12MB5791.namprd12.prod.outlook.com (2603:10b6:8:76::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 21:25:58 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:23:cafe::5d) by SA9PR13CA0073.outlook.office365.com
 (2603:10b6:806:23::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.5 via Frontend Transport; Wed, 24
 Jun 2026 21:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 21:25:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 16:25:56 -0500
Received: from xhdvaralaxm41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 24 Jun 2026 16:25:52 -0500
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v3 1/4] dt-bindings: edac: Add bindings for Xilinx Versal XilSEM
Date: Thu, 25 Jun 2026 02:55:42 +0530
Message-ID: <20260624212545.2850787-2-rama.devi.veggalam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|DS7PR12MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc24056-13a5-4237-56c0-08ded2372e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|82310400026|376014|36860700016|56012099006|22082099003|18002099003|11063799006|3023799007|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	yma3qChF5u2ApTjlNLQLJjljDiUgZRNnTO2yNSUzvkOxlPmNDdx8UVVHNAZ5PQT7VvyYrx9ga7Yj95lyHmCvQr0n5gO3DiLcHnasY4/u1T6slsExlG0VWn4joTozIQ4Qmkucxc46QvRZ+2GWJcy+caoXoj+kXHUPvnHSy5A4Ex9MkWOzW+fL5MqjcddtsIWVcIRbzQM80mC3xDFGx5hgfn5K2xAuHTN6/MbUEPrT66lBemrFJeKtL9UD8UpVVvFtmRSvNEk1WZJaoX261Y1pyQJPf486AIzI2RvkDngp0b8uzD7R3hFNdrhdgMJFFQ8D95lRXMijVYduB1qMYvf8k6oOM/uUGwByx0xTLT7epR6wIPRQ7hlsccjWcvKvEzA6aHK6lSNMdWjA9qVy7LCFB7On7920MKpf8rex1Ep4+mCOhXpapXtY6qaSyyFT6qk+k7yT5YMqDZe1LKvfXDrBea0ASp9FsQ+VDmZspuVgBlb+RmYGeRHAeY9NnlzsVK/Wr0hBoNZ1ponYR1F2xNLWMsfC+ZfIHV2xseCV4/Apo3NNkPKA8zP3v4mitpLPVMp+iyNjFMj2usrrlSQKXx3wijq3GF8lzzAXYcJudqcyNM+A6tYF8dmA/ZMH5dyjj3vwNzdf9MW7x8xRN0gDm3/c9Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(56012099006)(22082099003)(18002099003)(11063799006)(3023799007)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DWjRgWnYec8CGhTqaVHEN+DtKWn1UdUmEpr8DVoxGzN3KG/56WgXiprTFhIiEiy41Aiq1P9cqWR+60gHNHHa0osqKS1VlAHFM6eLBuOzw2sA2PS9Oo4x7/IHt4z2pxbx9r/6DLqylH4Y8HQs16A6eZ5oew0UYPao5C98tMEDddU3DHvPusMEVYczNkaH5Q9k5nTymo2lMwvOTF8yscumR4XGpuTNf7AZZIqld1au5Sb1XnXLjBDbQrCd5syWg1wLzjZJgGt5FdhvLS+pnRm46/WtQ73MoYzjzz8KyaL9bjbK5FtOWqWUT/5v9gj8+UiMHhKVRv1MJHtaYbOyoWmKGWfX25u8SoYadeo+w3W1J8/ITpVSPd/8HVOkvaJan5BUYoAx+ap1efu0STqPe0wYZtecjNDNCqxEVhRnswDp9PsCw/5N4hda/4yAnfJvq9qp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 21:25:57.2704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc24056-13a5-4237-56c0-08ded2372e2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5791

Update versal edac device tree bindings for
Versal Soft Error Mitigation (XilSEM).

Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
---
Changes in v3:
- Merged XilSEM edac with Versal Edac

Changes in v2:
- Changed "xlnx,versal-xilsem-edac" to constant
- Removed "compatible: in required section
- Removed "|" in description
- Removed "items" in compatible
- Fixed indentation in examples
- Updated title and description
---
 .../xlnx,versal-ddrmc-edac.yaml               | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
index 12f8e9f350bc..568d2af7de81 100644
--- a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
@@ -4,17 +4,31 @@
 $id: http://devicetree.org/schemas/memory-controllers/xlnx,versal-ddrmc-edac.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Xilinx Versal DDRMC (Integrated DDR Memory Controller)
+title: Xilinx Versal DDRMC (Integrated DDR Memory Controller) and Soft Error Mitigation (XilSEM)
 
 maintainers:
   - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
   - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
+  - Rama Devi Veggalam <rama.devi.veggalam@amd.com>
 
 description:
   The integrated DDR Memory Controllers (DDRMCs) support both DDR4 and LPDDR4/
   4X memory interfaces. Versal DDR memory controller has an optional ECC support
   which correct single bit ECC errors and detect double bit ECC errors.
 
+  Xilinx Versal Soft Error Mitigation (XilSEM) is part of the
+  Platform Loader and Manager (PLM) which runs on the
+  Platform Management Controller (PMC). XilSEM is responsible for reporting
+  and optionally correcting soft errors in Configuration Memory of Versal.
+  The Configuration Memory includes Configuration RAM and
+  Network on Chip (NoC) peripheral interconnect (NPI) Registers.
+
+  The memory is scanned by a hardware controller in the Versal Programmable
+  Logic (PL). During the scan, if the controller detects any error, be it
+  correctable or uncorrectable, it reports the error to PLM.
+  The XilSEM on PLM performs the error validation and notifies the errors to user application.
+
+
 properties:
   compatible:
     const: xlnx,versal-ddrmc
@@ -23,11 +37,13 @@ properties:
     items:
       - description: DDR Memory Controller registers
       - description: NOC registers corresponding to DDR Memory Controller
+      - description: SEM RTCA Controller registers
 
   reg-names:
     items:
       - const: base
       - const: noc
+      - const: semrtca
 
   interrupts:
     maxItems: 1
@@ -49,8 +65,8 @@ examples:
       #size-cells = <2>;
       memory-controller@f6150000 {
         compatible = "xlnx,versal-ddrmc";
-        reg = <0x0 0xf6150000 0x0 0x2000>, <0x0 0xf6070000 0x0 0x20000>;
-        reg-names = "base", "noc";
+        reg = <0x0 0xf6150000 0x0 0x2000>, <0x0 0xf6070000 0x0 0x20000>, < 0x00 0xf2014050 0x00 0xc4>;
+        reg-names = "base", "noc" , "semrtca";
         interrupt-parent = <&gic>;
         interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
       };
-- 
2.23.0

