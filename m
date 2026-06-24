Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012048.outbound.protection.outlook.com [52.101.43.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9603E5A14;
	Wed, 24 Jun 2026 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336360; cv=fail; b=qPJLyQpOXfn32S/PpXHnsiSyAmMVZhkeyisaG1X040QRZuyh0FvIgHxL0eij6kp6xaCnd0QGy1cfZtoAl/uxFL6tiz0CBmEkdTyYarUyI3mthGN951hNHOhuhjT8bW4G+M8WoF2Ig8Bdh5+PDedpTjn86q7cb6Zg+3cRvDVSx5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336360; c=relaxed/simple;
	bh=wnKeHB7m4QaJyXhc94i+QJGCfmB2+xADJRAdsZJIbc4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FIGGbDBQD/Qg2yc8R/qv8QgmcnK16049xQPurEIVcrGJhQytJgsG9O6f3M4q972pd5FMBMIvwNo+dXrDTM5XghmBw5XJQSBdMA1qhCI9gMb19pL0Bs+ASUkVuh9MJARd2c0xK87FH6yoDX0XoxhzP3HzehoyE7wMj4j73lgkrck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g44tYKas; arc=fail smtp.client-ip=52.101.43.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g44tYKas"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUjAQoncNSNFOelmRsG+1eAbpzb1kwU+enLKNPPVgZY+aq90Voss4v7trFdSCPecyCfASpncbzVXRp1RuQjE46aUUY4PlI2Xw26OHHegi7xphxclUg+DA3oVozGHiIVYFOTkUeAvzO5p8qUU8hnUVwiR10aiZW06pTgF/b2S9cUNRKLMUabW/ON5lUj7WdgPZBS9a7NFq0VIvRNS5u0KWsCmyZA/YYeRya4ymrMLndW/CH3zaS1q6hRelj7CD2by67Tgm0x2kHJEEyi/jLmGipJEMooDSs13PVivz8KgJuz7WTDeC6MkLRaPXFMpiD1mDHq7jCu7ec0nQJX7mDvtgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xs6V8nK1Ei7KtocHEQ/PT8vwXHA95+7EGgI1ZzkaS1I=;
 b=yi9Hk8FrMvJVSw8qbRnjg9dd7yN4kU+ShldiIHdoXM/ia2MSvP/0irhB+ydY/qt1yvsJq6tMOLXy5CnFZq2ExJYFDwrnFUR/ShLkkCUlWcIrjrOV0WkksTmPF7+2Sv2MvJ52GaHVlPrBhzWwBNzXvpM0Ht/yK37PxhpfDlrBWIeZ8NRxmX3qZZfdczlijUUoo4PNgkHe0k9JKL1MyP7kk+0BefB1tkjMAamOZkrKvqU8DYzfB9Wio2Z5i8y2cL/jdaaq/KhGYrdfsgpaPLo3iqOELZi+ehuSd8/0ce14h2goCgQcxhdMikYrWzuGCBhAhTCYIcGaxIiJLEw9FZ/IAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xs6V8nK1Ei7KtocHEQ/PT8vwXHA95+7EGgI1ZzkaS1I=;
 b=g44tYKas4hxLYgn4Sh02exA9jscSNRZ8GeM8tClxAzQP5yWlQfumWOfU+CfT4NUJuS8Tsk6vvypyCOD/j47V79+6sLQ+nEzfL/mSJ38dPQ6U+a9BofiYb4kKZwR7iI1u5htKuitNv/n43QNruNUfNoe1skahsaH4Dv051DV3TqQ=
Received: from PH7P220CA0100.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::14)
 by CH2PR12MB4182.namprd12.prod.outlook.com (2603:10b6:610:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 21:25:55 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::7e) by PH7P220CA0100.outlook.office365.com
 (2603:10b6:510:32d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 21:25:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 21:25:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 16:25:53 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 16:25:52 -0500
Received: from xhdvaralaxm41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 24 Jun 2026 16:25:48 -0500
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v3 0/4] Add support for Versal Xilsem edac
Date: Thu, 25 Jun 2026 02:55:41 +0530
Message-ID: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
X-Mailer: git-send-email 2.23.0
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|CH2PR12MB4182:EE_
X-MS-Office365-Filtering-Correlation-Id: c091accf-a23f-4baa-1dc9-08ded2372bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|7416014|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	LBKuLXktOE5hTcUJuhE5fleCKlV9G07jX/U1wno4ywLztLSAlLpBRS2H6ef+lhG1Eiiv5qD3gvhtmYhCKTl8u/BtiXAxSvhkwNdw+jtrwOBo136VNUVNUauzgXiBR+ByYTNHrz+C9c4WtvpuH4B3yqkTA3AwVZnn9si5SpJBGa7UVc2aCBlOHjxdkysw7YWFZjXQjXUjx1yaQdD7bomsYOJ5znYQ53B4S8dMcxDk4vs6PNmhgYaGdhfO8ei0/WxOLVDS5a6N8mMjwEwajbD78PDTQ6zZhxxI34jbtvs0WA4uRmO8TJdTk1Ruamf/zwJ3OANRGl6FxVeNO97ebCJnBmjtmxBsCgBt9FRklwDqZQh9odOD26KI4lJPnER20wqgECiRSCkuDj1KRRMm3UwCES5F7UlPbE8JnyPH6vcb42Q1p6ELnw0wnDXQb9Cv2hkDYh4uJ0RGiwQfmKj7nX0c8hjlNDXvTouXyV0tmzAdnXL39aShBfpEl1WT2/90wGJIBv1bRq9iYx6h3sAiVSqkYgHqBpfXu9woTs1ayVAB6j4oE+8xTS4/1dJpE18qO0yg/d3CP8SkiDHOGXq8JClzcgV089vuOFY/QW1bBXoAXXqvs6rnUvYTTk/ZPqs5g7afT6/tQncIqMQU2pFljOSwVwKxvDFhmip6sxF1E1tIA9pkYAWPU/pVFCQt/BTmwko4typoX4P+WAqTN+/JWKc6Pg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(7416014)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lUJLonmTh9Ks070JfOYeVBF9MjtwtcxSx5qgIDj5FKdINIsjIsfLDuZThmql7UiL0bqH0EWtXlpOmD8H3LkvZr8cECcMUOZLy00ELXdzihSM7Vygjb/WjSHyIyFWA3MXQk8suetW/vZ3D4t8h+UZnAd1WDe8Zk7C5swPH25fbvLq78s87TFncAGssqAvUXT93Zc9cIdarUmF9g4h2U1X+E+CUH/fPvYJGuUOavjAfJxknSI7Vw7ARGK+zA/78gDLCfPkpEPZEz1JtVCZCLsN9sQ8T5DyCeWxfBG4jVNpzLJCUaWaa74gIkq6QVlVN++PGlynteyNaswCZZeRG9L5/frII9/ysbiaiVOlNT3wyMLf+yriv4ocLoG2NoGnsFbxTXQBtjTJBi6aalcyR7QA9afcS6p61AG6r0I04FJSj/Y8znj/d6Tuf6xt5fp/Zz0b
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 21:25:53.5367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c091accf-a23f-4baa-1dc9-08ded2372bfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4182

Add sysfs interface for Xilsem scan operations initialize, start,
stop scan, error inject, read ECC, status and configuration values.
Handle correctable and uncorrectable xilsem error events.

Changes in V3:
- Merged XilSEM edac with Versal Edac driver to address
the review feedback.

Rama devi Veggalam (4):
  dt-bindings: edac: Add bindings for Xilinx Versal XilSEM
  Documentation: ABI: Add ABI doc for versal edac sysfs
  firmware: xilinx: Add support for Xilsem scan operations
  edac: xilinx: Add EDAC support for Versal XilSem

 .../ABI/testing/sysfs-driver-versal-edac      |  303 ++++
 .../xlnx,versal-ddrmc-edac.yaml               |   22 +-
 MAINTAINERS                                   |    1 +
 drivers/edac/Kconfig                          |    4 +-
 drivers/edac/versal_edac.c                    | 1348 ++++++++++++++++-
 drivers/firmware/xilinx/Makefile              |    2 +-
 drivers/firmware/xilinx/zynqmp-sem.c          |  176 +++
 drivers/soc/xilinx/xlnx_event_manager.c       |    6 +-
 .../linux/firmware/xlnx-versal-error-events.h |   43 +
 include/linux/firmware/xlnx-zynqmp-sem.h      |   69 +
 include/linux/firmware/xlnx-zynqmp.h          |    1 +
 11 files changed, 1965 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-versal-edac
 create mode 100644 drivers/firmware/xilinx/zynqmp-sem.c
 create mode 100644 include/linux/firmware/xlnx-versal-error-events.h
 create mode 100644 include/linux/firmware/xlnx-zynqmp-sem.h

-- 
2.23.0

