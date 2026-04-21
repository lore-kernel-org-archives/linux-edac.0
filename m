Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010018.outbound.protection.outlook.com [52.101.46.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC1A3BA25A;
	Tue, 21 Apr 2026 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767501; cv=fail; b=McpJ94p2B1Xl+BWf4mGmKhfURC/72uZoQiQtJpRVmayT4TZoMx631nrPu3OGBor0Zm6TPGh+fHKax3xlueuJRICNaV8vjHeieNW1CJGUHodDZXr3A459sMIwaA5CTb2W8PtQdFX3anepJgsGPEPl6RqOYAuc9Rv1ES8495x0DYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767501; c=relaxed/simple;
	bh=Le+o4KU4TDolg4dF6tJ/LWoTB2TaWMHujUc/80PL2ZA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Aek/eZwfDbrpCPixvOLHzdz4uNOpQgrEnYLPFPGR6jB2O49riVyTc+gak58oJCSv4GSM5xgkGU0mrE8VNZh4XkdSayUTOQ6egKzSu1GdVq5Hl8MImExYixedxnxrnBHAG9XWanqC7qpg1iayCXAUxb1F8b7TXpxdnmAepefzk7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l24WxZ+x; arc=fail smtp.client-ip=52.101.46.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l24WxZ+x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/blL2MkkdHSo/mV17rCsrCKtctuSGVOYSHe40gFRi9sQJkWYB70woUJ+lu3Kbtnk2heuJp5Q0wyu4VhWeOiLczSfsCZq60K8keTROYC+Sp3Tx0yZNMMX0lpcmau3SscudBxkF3cK3H37KCIXYcvyN5BJSHpwFe8IEupH2fAezqml7HePJ0IfFhVxqJcURkzZC+V4LmQiRtpkIUSRTyeTjCQAhgrHr9OPtf48S/mXbQV5JI3Z+QxWMiA649t3gcsl1GY81NnwJw8P8+r4TmrXaa2+dAh6ryyRFD+iJwS50rVh6wFMs8CpVAcavrc892LGYw370SBYvYV4PpcRbfyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngAJM39Dv+Gvm160jmR2ggcJ3wdHwU0IKvWcG7ja018=;
 b=AG3AdBjBqXCkSOwLw08di7o16RHCga63MWXdfaFvH1a+wlgJRBfWS737VUCHgM4zMkDiQjuff20ewCuNtc8jN1ub6M7Xzi5krkGp7OoZu+7m70CIefRWsOg2W2Q0+YrBI4TBsgHBEaJPLCp5QJzN8e7+UhvCL8O1WYdvq3LDJcoye7F+MWAJvfpTVb4td2q5dmIuuyCwBcHBmyjbMrvWRf9QWun3pkiviWhs1uJmJPe/uQ07zpFR/qo9kkG/4r8yWm9SIhWOPdIb8FTL/rA7FLrjFjkvFUI8xgDgxHSGI0RKSP5Rq6zU5j3hPQTBrcFmWdHNHH4k471EpDqblpsLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngAJM39Dv+Gvm160jmR2ggcJ3wdHwU0IKvWcG7ja018=;
 b=l24WxZ+xVGjAFmD0agsc+wLxDeeg0JUqRNevmF+GMQaaTr3li41MjJ3QCyToJq8YaQuGn2YZlGr/FFz4jBYLd2FcB7V5615yfBQkfVVHr6RT+MR0tMHhoH5ZeZ71BLM2MD6fZev4MMzBkEjdsDKE2TdX3ySio/ry5pJw/MBmptI=
Received: from CH0PR04CA0049.namprd04.prod.outlook.com (2603:10b6:610:77::24)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 10:31:27 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::2) by CH0PR04CA0049.outlook.office365.com
 (2603:10b6:610:77::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:31:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 10:31:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 21 Apr
 2026 05:31:13 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Apr
 2026 05:31:02 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 05:30:59 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] i3c: dw: Add AMD VersalNet I3C compatible string
Date: Tue, 21 Apr 2026 16:00:57 +0530
Message-ID: <20260421103059.2484623-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: shubhrajyoti.datta@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|DS7PR12MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: 26650ebe-814b-428c-b2ae-08de9f9124d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|56012099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	tFfIejeNDNqldAar/Pw/vlkhH7gWvcA+zgiOh4/ZB7Bv1l5X6IAJRGOpNdA5JG1WcCgZH4vzZWcT092dtqaMQqlAIPTdnBK+39l5LmcIjrc7FFZzZTLlfRpzeOexET2iv3mGKMSDBT/1atkaoaMJcxxeMhc9m3GkxbK8HKtKhlsBE9BqOIVVPkgAkKDW+EJlKA/PmYlpAIo69XXIbeefbDR6+vkUoMf3cTVtOQYjyfwy8c9r0kVDfmm5w9juZIiMJkj0blq4ulhmnjX4RRfryOgBUoXEyrV5tq5Gh1UI4pL52Wc1Cm3REA4ZztiAj5ENG1yGzkN/Zap7t3Zv55Y8ejybNNzzgsryYCwNjx3+X0kmr9Veiu/pwXJMmRaE5TXrzLVlB6DQ3XsXg1S6vMbutR9gpxZqcEq8cUSn0n8J8rR7iZeQ4IQraboQXK5XLmeIqteQ86nRlXQEdSV5S3JuYenAkKjOj8iAURCc0bUuoiZuEbF2/NB+4T8kkHCfrwgGZW3hZYblvkDoqUsHLNJQ5TOQkWxe7J9j12U0VmXBAEBBAik0AiYqQ2Xsf2+AsjB3+qKne0lyk3Ls3+ho2ALmcR3ryfusNeVP1n5WgwSjlJWaLlXqLSXyK8qU3NRYco2jdCNOP4HiILgNlqXKiDaKZS0uZE8MfJ/YecMKC38F6GeD/clS1piG4P4dxY3yUPQ2USjvuVKEqLRZyuwa6bgvHLxF1EeZl5s7/4ItLtBqUFrSQ6LXzKJMOKdf6PQ//WHot5cWY2whzXpW+rTJNkgACw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FstwPmL9GyOGo166dvezwELK8DZdXTrKKS3BKKytEIB6Tq+So63YqawonIkreb32rjd04O9fZV6KIXVbxv+WmeFlGM0Y7rtFC5is/bfOIjTBncPC933VPAb8+VyaKh0XrTR1bqxg4bF57tS/sehZ+wPgofD1sIYpJzYnqdLnDQBQtSQN9c/exlL1mSeosbD2G2EpMWpaYYK2SKS0Jyhz4YeKzX4F+YwlzUg6djJnySEKaZFfCHABJ9aiwcTlo10JLpVDt+9COznZilWGodxR+4DsGUPD/8VTKoxXwh5MDLjowmLBIyCCWxH0kYl7QuMlDB15crpChPQx1KJanKROwQJxuGZuC3Is7xGhSvkthmZePOCzR2H2oTNFJxTB2BuLIKAO3JR4eRkApDBY8YMHvNUFFWgbs7/mbYk1tYgkFeCu8G6JK6qaEVq9yk8Vx/l9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:31:26.9918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26650ebe-814b-428c-b2ae-08de9f9124d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840

This series adds support for the AMD VersalNet SoC to the
Synopsys DesignWare I3C master driver by introducing the
vendor-specific compatible string amd,versalnet-dw-i3c-master
for I3C in VersalNet platforms.

The request for the addition was in the below thread
https://lore.kernel.org/all/LV5PR12MB9828D700D168803CBD022A708151A@LV5PR12MB9828.namprd12.prod.outlook.com/


Shubhrajyoti Datta (2):
  dt-bindings: i3c: dw: Add VersalNet compatible string
  i3c: dw: Add VersalNet compatible string

 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 1 +
 drivers/i3c/master/dw-i3c-master.c                            | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1

