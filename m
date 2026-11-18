Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011811;
	b=y3C4MGcdR2runDKyJHsz1dlu4zFqZlB0YmOmcHz7nHIvmWkyzBJj64h/Io2mVtGGK0KC
	 DAAeicld80FYA9WXqaYc3I20QRq52o6ChmW7qMsc202keR99J+faeRw1fkkRSntR/OsJj
	 z4W7ngejOqAQj/r9g2sUGJbtGMdN3l5IavGjDAb6wURxTn1Qs/ytkveMKy41gavLmxqH6
	 eGHTffmei0G9DDBC7nYinaa3ThDU+8ecCP2CkricrL4QsuyU76V+8xSwGXOpLW1PZQZBi
	 KNwXcGWOoMSyGhFa26GMGN3NousmyZ+3vl7RlL/QK4NcRocr8kb+VsJoE5Qg9xKrxmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011811;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=ykmm4eie6nPGBtT8EEgM6F/IrRPNk6vY0fCHXeUibi8=;
	b=Q4PXytgKPYQGexalDrrUJvLqm1Js7MburbSLltGhLKVYnBD1GpiEkzc1tdzhjljL8y7l
	 3Z2d1eF/5vmEe3PQ/4heXUhnjuk0G321INZ5Ks8gkTsn0wB3noH30AxQfvmV0NbkhM4Om
	 g6UuDyb1WWFwefUVmZCR9F+8GRcmMgJFOdsZJclZQ/Eql3b/3flQtoZ4sq7qsCVTCYq9c
	 pKqheRRgN1Y7Qch6XFQ7qyx67g6THQIt33+PFn7M6T3pP6O8jX8r1PGzT/ljzaWaSRAXN
	 DGZaPBSnyswSXmeC2mTe8NJsJ92pPdAtOGRZ1B9uua2FQx61PpvoPNVlLZ8AfnO+BFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=r8vR8j0i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.13
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E13606A336;
	Wed, 18 Nov 2026 14:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E13606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=r8vR8j0i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pp4Nz6no8gEI18niYhgAaowkPSmAtFoq+YgscSGd2j/k6Njxx7ycsVEBnIUT7tE76LoHSXtKMG4HfAvKwiidZc0tU/uZoF0vZ5W30PHE4RHhSsFk/IxriGCeMYHwrcd3zlMvyl5sxmVh6NQ4fvrJUCo76t39cV5xBEsNUTLmwFEYl5r9dGvajP57lmMHuk2KihAFSQnANYKvTvkZWN0anrw0B10bPbk+ur7kyv4nmyTabxi0p8Bez9sGv4hLR/y1b5rQ+McA6qNZRy5StUu06SccRyWGx7Vn2zhc9yFYPls0Sq2KXjMt0TiNGnNCNb5hYFlOKDoSWkoI6T6dpkmOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykmm4eie6nPGBtT8EEgM6F/IrRPNk6vY0fCHXeUibi8=;
 b=XzZDH7sOsKvIcidLaTgj4v9B0sc12vwWL9DCR4URhWh8aNjYn5fOi3+LwqRwP3IJ9sxTkYArxLF77tSCW2bb3fUdOHhcVkdmGzO4oiQMaNdPnmbakG8I+7mLVyV9TDyyffq2yIkTdNTNSdE16PaOaxDj0Wbyo95FCOdTBg3rvEuqG/NdeLedicVF2GjUJFfh/+Oj+BOcDMEHcJShQACkIRvEfMZuWCotvaCU5dfbh35MmBLIsBm95i5coYq+UFvuiHgRfM/tZn95UEB8kNGEve/He1zZ35l8jQ6Or7Vp2S940J8iC3Y/lQOr8WCKWtUY1K7XNxYCDmvG8Ya7PBiZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykmm4eie6nPGBtT8EEgM6F/IrRPNk6vY0fCHXeUibi8=;
 b=r8vR8j0ixQ+JhbYtZnCdFSWcOQN/gpvplJT6ZA+KUKf0S1AAkQyggTPqBsEDVgYvvsSsA2fP5UGhBdKs71uUEHGH3jboF2cXRUKVBrALl5bm9MhOxOZzlVh2M8X6VHINnm5QYB9lY6HLhnQlnCQRMBE+Qaa3bmJlBCus2O+rfjQ=
Received: from CH0PR03CA0118.namprd03.prod.outlook.com (2603:10b6:610:cd::33)
 by LV3PR12MB9353.namprd12.prod.outlook.com (2603:10b6:408:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:22:58 +0000
Received: from BN7PEPF000000AB.namprd05.prod.outlook.com
 (2603:10b6:610:cd:cafe::41) by CH0PR03CA0118.outlook.office365.com
 (2603:10b6:610:cd::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:22:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000AB.mail.protection.outlook.com (10.167.245.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:22:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:57 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:56 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:53 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 10/12] dt-bindings: memory: xlnx,versal-net-ddrmc5: Add amd,num-ctrl property
Date: Wed, 18 Nov 2026 19:50:34 +0530
Message-ID: <20261118142213.100581-11-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AB:EE_|LV3PR12MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ab7a39-a958-40a5-925c-08df457f71a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|56012099006|11063799006|261026121527099003|261021135927099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	97acf6GnXATXtZZocdNZUp8ITAdNtbAN6PraZkhK5ev5E2XRmWl/LhWmQ0qDn64ERaMt11zu1T3d1BNnbI8hssnoUSBSlPbo06wNuKSsGeqKNZkkyNDaVtKl/qHC7C9Q9x9K9VGgF0PDF6FRCj/QXhCvks14Vt3Si3qwgOlXphNrl/4OIui5wkzC575kljD35v6VvxYgNwyX7qsbIwOhnQTVH2vkdBUgVgxY/kncSDhhD7DuhUjpdOX5iZl6eGPyIBNcuFiarW4NAITILW5Q0D3ZbVb9MtojNwj9WZVUaYyNY/gK1YlG/DY68b7X4uAZAepAC9csUhcs6T4xX1e/dLyokaz9HHQq+BIuPDZrshVLi3rW2M2hEsWhfcCfrX42nQv/jBCmCV9KGLWBsspY2mJUJ2S0O4JXOlRZqirJE0xcvmOPT1c7Yvy3eWxRIoI0NxsV3JLpUNf8SMuSwuQkPojj4KBD7BzaUiAbFhHnpdnwp0bdiL1ZdchpLJWQxuxl8z7rzZNk4WMnW/ff/wq84aaCwa5Qvdyr6K96EENtiItuWVInWzctTIhafBdmLibV/VZ3rYqGy24YLcwhfbCexDCri1jt8lUamTrF+IoG3a6g8AVwm5w3aojgOhmDrOg0AZqYjSBzMLir7l7HA4Xxpw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021135927099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8N0iX1Fsa0UxLDRghkfLwCAHYG32YMqO7+rGshQCXNKhV6peI0dftHuqyjGa0lAVFt+K2aI1TKPqLoL8lnhrHxreUX2iueIXYNkzp3zOALpo07GsLyNBuZ1OKp/Oz8a9X9jQXREEVHBaFiXGBc2eCl2x2PnHu2S+0FWMXyfyyv+XxzsXwK/pf7Syu4sxzLzdzy1+kF/UD8seVaLFYOTtM4uJxBqDs1pOx9l7WnIzg6LQMrIHCoA5WrXKW23Wb3ScDkgDKZjw+dQhoYTSSsWI1H0n013FAPDM76KYnmu4WZrYEYEXaGFzys2zx+fTGAXP13UosJTZaWP9kxILjlmvhFC8S3viqY4k5h/0PF6OE1WbSvPL6lg7cqQzAkz9RTn9h9lSmM74d0Nx5V37vjh78hwL33fVt30JneS9RUGETpHC8epB1FWzWhCbtWwgh/be
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:22:57.9403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ab7a39-a958-40a5-925c-08df457f71a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000AB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9353

Add the amd,num-ctrl property to describe the number of DDR memory
controllers enabled in the design. Valid range is 1 to 8.
The driver then can enumerate only the enabled controllers.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Add amd,num-ctrl property to device tree
The property was requested in the discussion below
https://lore.kernel.org/all/34ffba5a-8e9a-49b9-9e36-c31d0e4369f8@amd.com/

 .../memory-controllers/xlnx,versal-net-ddrmc5.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-net-ddrmc5.yaml b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-net-ddrmc5.yaml
index 479288567d0b..65feacd007a1 100644
--- a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-net-ddrmc5.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-net-ddrmc5.yaml
@@ -27,6 +27,15 @@ properties:
       with remote processor. APU primarily communicates with the RPU for
       accessing the DDRMC address space and getting error notification.
 
+  amd,num-ctrl:
+    description:
+      Number of DDR memory controller (DDRMC) instances enabled in the
+      design.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 8
+    default: 8
+
 required:
   - compatible
   - amd,rproc
-- 
2.44.4

