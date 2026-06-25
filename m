Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012021.outbound.protection.outlook.com [52.101.48.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1263C0608;
	Thu, 25 Jun 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782383886; cv=fail; b=I09pzvr827f72jG1NYK6S+EcYo8sTTY39ws0WHOHYP/9J+zOYWVRdv7hgx7vkgXlKqPKZXSh8jMgldxu1z0IyzelusbcHhubnePuREW7avICfbg+DWp66D/EpFt96ZmESHaBdHW8lgteuCA+SL5RJH0njecAZp3FVQqYeFpRBo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782383886; c=relaxed/simple;
	bh=87G/gfbbV9J327rODewkOc0hU8AP4AlEbqREkTls80A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i+9gTYU7aC72xhww7x+D4ZvyWGhfBdzaZnvbvlvLa7qGYTj2758WzMmhrz7UknaVgcaJmeJ8L2HpEQdEU1nvaRJ4FOMnwYrssoX6ynPQoA9uqjweeLcWRuJEJ1HcQvt5blLavL1E86P6mqX8HXvsHqk1Qp9wGMIAPxo435uX0LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=47tUhrRV; arc=fail smtp.client-ip=52.101.48.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="47tUhrRV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivrKKF4jLzb+Cz/8KTtkNRqU+8I+KQkanu6uwXKxNaENLvqKjSx+VnA5uAaDLFrPGHxZ2+24Lw/oCS3iuMEjtdp/l0ybJF05DIizgGtJ68tDBhf6xS1EWH7zVFzEFOu6ZGBcK3xBc8nmEXRpJbtjsjA92vh1vwnH2V02YsMemhydMQ7kEUoB94HewAxEXHYpAEufoDsyemSa8x+Hf6vjlVOJ0AbYx9KXXjFyT/IudYkyxnB+PYqtOiOKC1gEJF59gD4fB17wfimcheds3CQ/6dJsGkkP2GdfUok0mfIne9WLbpPAz6BBNMTjpyySz86T7kVw/kJMkCU5+x1UH81ltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMLOpMjQiKDJn4Y+DA6vemN+SeadmP4FnGu25TdD6Mo=;
 b=a/Jrixrw0ooULrVXf4qDCP1IFitbZvWCW8jeoX/9hcKDox1zLtStQgqk0bYvKmvgnoFnxprQ2L4cWBy59aupFGOG+q81jYTDiaZ6r9TC1Sh4ARj3apeEqZl011HtOuSNf+5SPj4H+30tRPIZlK6dHWBOlP6mQWlql9Jb0nT32zpVf+n43YOfLoNVSfiPAVnz/1R2TLiEYCZEPGTTY7LC09xFNXcZjvA9gJYhJJflPjntCdMfPAu5rQAoawZOb6PpyEsdDaq4H+AHZ7N84t5LqZlAhMwJi3UxTBuw1z0pKF8DgdZa4XWpPSqVSuL7lk/2ekkCFHk4D3wTQEgaQD5L3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMLOpMjQiKDJn4Y+DA6vemN+SeadmP4FnGu25TdD6Mo=;
 b=47tUhrRVBBPPLNNCymtWVU7tNbgiSVWz8b21kUj8LAQYdYXFBLZbA1Stksyc8VuLMZG+a3Af/K9sPZmMOvZbKL4SAdpw6X/hSCl1iLL7kt3j2Lebk5lykrR9eSIuQTV6TqwvARa2smhy0ZN3AaRqSf/dS/ZfSfroUJCQkWrRlto=
Received: from SJ0PR05CA0064.namprd05.prod.outlook.com (2603:10b6:a03:332::9)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 10:38:00 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::14) by SJ0PR05CA0064.outlook.office365.com
 (2603:10b6:a03:332::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.5 via Frontend Transport; Thu, 25
 Jun 2026 10:38:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 10:37:59 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 05:37:59 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 25 Jun 2026 05:37:57 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <shubhrajyoti.datta@amd.com>, <sai.krishna.potthuri@amd.com>,
	<bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>
CC: <linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Radhey
 Shyam Pandey" <radhey.shyam.pandey@amd.com>
Subject: [PATCH] MAINTAINERS: Add Radhey Shyam Pandey as Xilinx EDAC reviewer
Date: Thu, 25 Jun 2026 16:07:49 +0530
Message-ID: <20260625103749.1416083-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.49.1
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: b30767e8-4b90-4d6a-8a4c-08ded2a5d3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	9LKsch0HNO/VijcpKjAPDbmVWhcOkVTZvsmXU6C429YL19fT5QyU+mQj5zrq71w8YOE9bNlLH1eht7KP1cLXV6Qr8D6fEBwBx1rRp3V6qHq2CUCJRXmFIqmxMEfVdhIpFOlCJCvzuVRYdvMJxgo5OVt0GyXmj1lLjjMdWvppRfsX433KhAlSKcZXTrRseqrqDn+UrN5sYkn+bBgx1qQI5GFfW7SyU4jQ7Cc4mFW/N9dotZMHewF3hSiBxbaI55pR0qqVm3Nz/8qWrAO3PyadFCgnrY5DSBMTeSNDBxKnIu+aNLeyS0X/HrUsOcdmSj0vg/nBPSoexQQQiO9PvQYlqKTu4HW07xA4f9a/LqvVH5I3Qk68yfATsPql8I+ggoLZskSH6nMGQ/Y8HanNp8EekAITV5dlOltQjtB9WWlrXIzMlw3UzyndYqhnddOiUoroz5utS4gz9JjoJqnKuUWFdzzKaNpweZAgk6HwYLD/inH3NWLbwCUdfVRoDGZA1IXiQkgb2Ap7LAcipzncazNvjozi7DQYqo6wAPgJAFlMXRrkSm/FsizCqL+rXQbkDfMLlI9i8Obib2aOYx+OwSxd7CyXJmWqV4ze1mKMnoskDvnjicAjhvzV7UhOEmfuX9nHQxys2IalZy5kmjqRpLgT9glNeZxyAdoHXqjAYtCbClwysDJ9EfSebQ7U9y1CWyzhQmw1XMuVAqjt/xa44roS2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YM2Q8HVTTcEKueXF5SwPcdjhalocJjhS7sMQDN342e/Z9hWVKPuQUCjgxLQqvuEx2YOYwPTz0wU9ORUscBUDw6Yn5ZNWG2DKzSctyzPXJZEQ3/ZDXUbjetW+e4oMG8z86cFLVkqg3kW2XO84IzLDIe/qQpaowVSW5T2pIUMhksvYK4NZrRgxQA98PO6rt6oU12/+eGOxru+uTs5/QKYF6KiWL5Qu0vPrLYokwrfbA/2YSEtzP2+99ErdswoJPKwsuilShLZgMMlLLiJzPbVebWmTOSlLOJcHj2glccKXHlFsRz4+Qn9dc7IvlRMvruQRXWpODjj3TODCPiMSO3+zx5g0Gtnmtw0uT0kf8t/EqIwbh+kVM6+jbBecAA35PAmsonVm7Xz152EqFd6/VulKCS5+cB8ZuGg+ZZcXoE7se7oX2NHOR4agM/Wh/lPOPyBY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 10:37:59.7356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b30767e8-4b90-4d6a-8a4c-08ded2a5d3cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147

I have volunteered to review Xilinx EDAC related changes. Add myself as a
reviewer to stay aligned with ongoing patch activity and actively
contribute to this subsystem.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b9d7c8276ac..1e0ffcc4e79e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29597,12 +29597,14 @@ F:	include/uapi/linux/xilinx-v4l2-controls.h
 XILINX VERSAL EDAC DRIVER
 M:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
 M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
+R:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
 F:	drivers/edac/versal_edac.c
 
 XILINX VERSALNET EDAC DRIVER
 M:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
+R:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/memory-controllers/xlnx,versal-net-ddrmc5.yaml
 F:	drivers/edac/versalnet_edac.c
@@ -29640,6 +29642,7 @@ F:	include/dt-bindings/dma/xlnx-zynqmp-dpdma.h
 XILINX ZYNQMP OCM EDAC DRIVER
 M:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
 M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
+R:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/memory-controllers/xlnx,zynqmp-ocmc-1.0.yaml
 F:	drivers/edac/zynqmp_edac.c

base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
-- 
2.49.1

