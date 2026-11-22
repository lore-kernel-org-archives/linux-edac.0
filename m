Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795313147;
	b=QxdZuiynl8N32X1GpvztAF3FVGL7tWi/kHAiWPiJEptlGzPIYyY60r/KEMTmUNUdzN8G
	 WDR3JYtYHAVtDIPdn10Y5LdxKEnckdxFq55pOo61hefWjU3EVPQQmUoTIPj9OIMzcyZa9
	 jE721YK2xDop58BisvAu1LL+QbKh1r0zBiBPeEEggZktnHgUkKtU9wlCOWRJ1P0U8kOog
	 43ZJPsleKpEe5UcWtOc2FhMhJVkGqknfxUBQ/v+URk7zNmMnM6ChG02NQkuc0fxqlLlRu
	 cxx4X6WwyAMYgz6rLWds4CfQHtyftVL7YSnPLApZECi4VYZzJ6RgnUDZXsGzfw0H+Eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313147;
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
	bh=VFIJVHK+exc2Ot74vMuBT/F8RSjZDJ3jbrcsnzvhpEU=;
	b=ReC+5Cknt6f6StpD9vTEXTNwOAGp+LqzNZ7CW0qGMej/d2GWwPBL19bk4IjYYq4LubHW
	 FcRj7SVX95mQueu5eLfnAOHDR3CaaxEKFDJfBznI07SQ4DzyDxzz+1CHYg/mYJZ9FXbZx
	 L4UFxI5xP9AYD9R3ocFNcnqcu3g+6Tmjy78gxU+rYQj7/7eTTZ0NE6ZcVnEKfUWiTR13m
	 rSb2q2J/zJ40bJ+f3s0L4ePJhvQOBJQu1c0w4rlw66T4oxLBNk9afyZo9lo9AymJLZ1He
	 NWnM+FhFLLCY+j1CQcYqjB5Vbrh3xj9XOhHvUEfEIjVZ6yjGPGmz9hzCVkQDXNcx4hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kZcCM0en;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.11
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012011.outbound.protection.outlook.com [52.101.48.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B864606A330;
	Sun, 22 Nov 2026 02:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B864606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kZcCM0en
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWcgqA5M0zsJPi2PBjAKLw/SKJEQlh1o2kufZxFh5/EY2OGPymCls8usG06qQ8Dw0aom6qtR4NsRij9Cugqvaw601ubjaYJj4KMWzNk5Mg71bOZx3hfFZZkQOynV97EQAWRCPDjBn/snnJiuj8il9ACEaDXkN4vuzRuzsUwEf+e3PstgClB2xgQGzmhCYJpXonICepEkVhwKR1OkmydCQsLeRUZuZve1g5YE/Rm/jz9kUgU6nSqM4Z11BcHHxBP3R7A6TipmOSZsHcr6umRGww89IvNpRmcSiKBrp0okHiSlAX92Xo4d66yz0qac2k5U9AhQ3Efy9Y8l4xsHU74+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFIJVHK+exc2Ot74vMuBT/F8RSjZDJ3jbrcsnzvhpEU=;
 b=JpMJE60sy2kKtNSQu5nre18DCgHYqy4kwHE7AWfxYQd+vxjV0oFuUsQ63Rsl2+Q9ygB3jttMKO/PkxPNvlNZpC2n+0en0pRuEPYgtGNWEOcI8kvGXaHBJa7bR/txQ1tazMR7MJ4kANIk+kzyNlPPV7qxNW58HbGLKP3PpabetISH590Qd8z48hgXFm1GbVpGu+4zK8A10VTqg+V+GTBdgk6ojn3Ll7a9vcp3LUGmzGiHIPgkqJ35sPwhkGk0Y1YudobgGR+w21rEel7Qipky2h2Ihy3nJKLba6e1jBe7dOigUfBt43sWSk8N8nJpLLfWPlINxrPbhpsKOKBMRrBD/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFIJVHK+exc2Ot74vMuBT/F8RSjZDJ3jbrcsnzvhpEU=;
 b=kZcCM0enQG/wyckaNjBUHoKp6zkFxHyCvcyMTeB1pnhHqGFpL0/7l80rkmB319gSs3IkIxBp0PWvtO4KhQKY5l2sLVnndZmFVVjoc6LnKoLO6Vx9qL0HMuuH1P7DVOb5QOuA/Se4AQaqKlS9QbQcpURu4MGh4WRw2F2dbN2gj0w=
Received: from CY5PR04CA0029.namprd04.prod.outlook.com (2603:10b6:930:1e::20)
 by SJ0PR12MB6735.namprd12.prod.outlook.com (2603:10b6:a03:479::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 02:05:40 +0000
Received: from CY7PEPF000000E9.namprd04.prod.outlook.com
 (2603:10b6:930:1e:cafe::6c) by CY5PR04CA0029.outlook.office365.com
 (2603:10b6:930:1e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.13 via Frontend Transport; Sun,
 22 Nov 2026 02:05:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000E9.mail.protection.outlook.com (10.167.247.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 02:05:38 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 20:05:36 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 20:05:35 -0600
Received: from xhdrveggala50x.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Sat, 21 Nov 2026 20:05:32 -0600
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v5 1/3] dt-bindings: edac: Add Xilinx XilSEM
Date: Sun, 22 Nov 2026 07:35:22 +0530
Message-ID: <1795313124-2138932-2-git-send-email-rama.devi.veggalam@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000E9:EE_|SJ0PR12MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 598cfe1f-34d7-498d-84f6-08df483d1ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|23010399003|36860700016|6133799003|261009223027099003|18002099003|22082099003|3023799007|13003099007|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	1ftRu1VRSwqsHbG743mrsjncPvZxW7HdtgbrsLPVg8cYDE1X8qvOpgKT4/ziPmOvyLne6mAHPNwKmmzUVuN+xzSH8wiu1Gfvv0GLuYQchnMlrqMgNQdjn3PBMY8F9bsjBfOf+vz/o6lf3Ks2zAQLZC7pClqlb6r8drw1lg/8c/3DvRHC1wzkWrqS5jFWbRSnSd0qn5KyYSlPxWnAJcnWdOWW7u++AZMHfYIxPCaoPlHgEmy0m/K2kU1orEnDPxa6XpvEgwl3IXELgEQHBoGX/urkgWvp0o0rL8xYnrKGeJpQoYMTwArdp0pStbNL+qu/dYfp92zG+7dpZ6S48mL55Adn+zh3B4DvezpdLYmqRILGuY/+zlXIMQyBmrBel8vt/Z5XkgwR7+kUsZRriKGS11wEjhpNbCKD6jgrZqqeFQJp3ugbpc13OyT29l/CllFu84W+GOvn6Bt73PfsD8t8TNB2sftbg6LqgaTt0xJo2+SfZkPjXN+ZjOOWX9nBZZZj/usx1G2h9bbkYqBOfTYVVkRduzvyu6yUkCa5IItCcWB3BTpNoLOtF3FJOOwaQxsDcDBtMaU2JedqpEpoWHESWi8YXnJYTBYposAlzgExeqzjrHVFV2SPq5zolthUfSX2P6nNw0wRsLsL79iwzLRvHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(23010399003)(36860700016)(6133799003)(261009223027099003)(18002099003)(22082099003)(3023799007)(13003099007)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HIIvOvhJ+c1hChr6R5kz1kVYgNP6FTicMmBrrZEg59Zl4U4x4R6DCyZOeGV4ftao3XAi9h9EZvt4xWYuyHEF3dShTzu3l8mkNmZOwBuIW0vo9PFixA+Of24bVOqec7ZvMnJl6n1hAfIqorEdn0vkpRvJvO6hyKLAjwc07L4lL1tsJ0+p6cFOMVsCAbL2yUSKPHZ2deLC+zgH7kcBt5JKOCR5Zt8p5Yg5/gVmQBnzc56viDV7CCUgclstqx1c8iiQ7EzJ/XXKDkbRDzLkH7MmjaitpWMRtRk92IPj7Q0HFTYspU0Z3Rhb/4ugzmrkcb9QZK7dCH5UigICojEK9QUivIPrD7Ra40YPEXdgCjhRBznBhpc8dR/Xj4UEhOaBRt8rhIa6FY73HwLm2sYzJsyBleJndKqcUZpSzbEaWcCcXPg+4ZzcFVrMVPetKuXj80D2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 02:05:38.9941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 598cfe1f-34d7-498d-84f6-08df483d1ad9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000E9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6735

Add a devicetree binding for the Xilinx Soft Error Mitigation (XilSEM)
block on Versal and Versal NET devices.

XilSEM is part of the Platform Loader and Manager (PLM) that runs on
the Platform Management Controller (PMC). It detects, and optionally
corrects, soft errors in the Configuration RAM (CRAM) and the NoC
programming interface (NPI) registers. Errors are reported to Linux
through the firmware's event notification interface, so the node needs
no interrupt property. The only resource is the register region used to
read the CRAM and NPI scan status.

Only monolithic (single-SLR) devices are supported; multi-SLR devices
are not covered by this binding.

Use a single compatible, xlnx,xilsem, because XilSEM is common to Versal
and Versal NET devices.

Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
---
Changes in v5:
- Moved the XilSEM binding out of the Versal DDRMC EDAC yaml into a
  separate xilsem yaml.
- Renamed the compatible to xlnx,xilsem, shared by Versal and Versal
  NET.
- Described the CRAM and NPI coverage, and why there is no interrupt
  property.
- Described reg as the PLM RTCA region used to read the CRAM and NPI
  scan status.
- Stated that only monolithic devices are supported.

Changes in v4:
- Added a new "xlnx,versal-xilsem" compatible string to the existing
  xlnx,versal-ddrmc-edac.yaml binding, gated via allOf/if-then so
  DDRMC and XilSEM requirements (reg, reg-names, interrupts) are
  validated independently per compatible string.

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
 .../devicetree/bindings/edac/xlnx,xilsem.yaml      | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/xlnx,xilsem.yaml

diff --git a/Documentation/devicetree/bindings/edac/xlnx,xilsem.yaml b/Documentation/devicetree/bindings/edac/xlnx,xilsem.yaml
new file mode 100644
index 0000000..3ae5b6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/xlnx,xilsem.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/xlnx,xilsem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx XilSEM EDAC
+
+maintainers:
+  - Rama devi Veggalam <rama.devi.veggalam@amd.com>
+
+description:
+  Xilinx Soft Error Mitigation (XilSEM) is part of the Platform Loader and
+  Manager (PLM) which is loaded into and runs on the Platform Management
+  Controller (PMC) of Versal and Versal NET devices. XilSEM is responsible for
+  detecting and optionally correcting soft errors in Configuration RAM (CRAM)
+  and the NoC Programming Interface (NPI) registers. Whenever an error is
+  detected, be it correctable or uncorrectable, XilSEM notifies the errors to
+  user applications via the firmware's event notification interface, so no
+  interrupt property is needed.
+
+  Only monolithic (single Super Logic Region, SLR) devices are supported.
+  Multi-SLR devices, built with Stacked Silicon Interconnect Technology
+  (SSIT), are not supported, and this node must not be used on them.
+
+properties:
+  compatible:
+    const: xlnx,xilsem
+
+  reg:
+    items:
+      - description:
+          XilSEM region in the PLM Run-Time Configuration Area (RTCA), which
+          the PLM firmware updates and Linux only reads, used to read the CRAM
+          and NPI scan status
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        edac@f2014050 {
+            compatible = "xlnx,xilsem";
+            reg = <0x0 0xf2014050 0x0 0xc4>;
+        };
+    };
-- 
1.9.5

