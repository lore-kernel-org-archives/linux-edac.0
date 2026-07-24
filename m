Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010025.outbound.protection.outlook.com [52.101.193.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51E44B68D;
	Fri, 24 Jul 2026 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913602; cv=fail; b=FYZclfTjo4Lm6LgQ7094fIhZuLS+uKIzROBQfowAGBZ9cEFi+bdG6OxuRNkmHz7J8AVvS816HiiKkRCNew/64g5fMjSePQOLBPSjZFtFE5OecCYEvQkmGLPVwQI9nKprUEytdQPJcQqmxZQWX7Hfku7DjmQUoEC63MZbZJ4GYMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913602; c=relaxed/simple;
	bh=yDfDHSuz1kS5h+MGKSGzc5IK/MnBKtW+SLMUloh9F58=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ucE5L6Tcbn7tv7QW694+LJ8evBpnHst8hk8VE/jx1pH6t5EaDNjF6NcUXNsQRV2thUM00hrDtr+nahysGEUi/Plq913GsStMf9LJHsnxYcjgz34/JxrRPnBDdFNVghyK2UtMoptT5Y8riBXiOUhRb/ctB+D5Wbp0bsw9W7IacBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uyPkJuWg; arc=fail smtp.client-ip=52.101.193.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uyPkJuWg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UstrxTEHB5fAAdRnwMInzh3IgufyfzUrWmf5BLZvdFiInCA7jolVA+iyVYtX2Uf547gnARcWng8fig9VocQFg+5Fezxn9ID+vKG5MJ/W+XOwrGrrsc33c5OuCgud8BefzBq5yRrgT75Zk+ZwCHNYtukzpGhG5/8A3VFUPRBCh2uvCzMqiwL0nptUZvMedOKyMHK/vbcTR9C9I07rGaEfO5yfzuT15zOjMVjcenfK1yN+fak9nxXmV6u0CZ9Ue1BkxwrnLWh5uRori+2MZbknfXtC1svqylE/X81gHpl2WJa2WRk01Urgaqekbj2asiqRVIVtfSlGprpHBkYMtyDWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TukvIqMSmw1iEFiXwZsfK0vZDvpqHyJK70szoIr4Sc=;
 b=HaPJa5RyEk1aFN3BJ+fIL67wvzZNUjNZxWyY/nxHhfxJ1elcg40ufTikdfUSY4xDOCxm3eFY/H1n8xpwYwH+R3fz0rltOV8bEPt+ixrGIUnYAuBe50d2BKErMqcPaeudviKEgY30Pjd2oWfWMIaUeMEJKdGBJFu46D69E/WhZTDzjjkvmUvjFatDUfj4VLyXVxXrl+ngDsm4faU7EAtfaqM68somBRvQ/yp3DfpO+q3nsg8xedjWW+SAq2kWAyeiorFZqrPuSfD08KsoKqIZ55ayOY6A0s8Y6+B/E6ulNVfJNpbU0fmAhWJ6/XAlZ7ut47CspRsggBjCiVuA0WPR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TukvIqMSmw1iEFiXwZsfK0vZDvpqHyJK70szoIr4Sc=;
 b=uyPkJuWgyYnnhJy80Q0sQgm9GVD6F0cuZprd5CLgVKZHhWULOleU39b/RATqrLqSInV/fqKvKNZI02RHHkdxcckiuiXIU5Ans7tDVeE9jUp6YqIy1yEiox8cqgXh6UjasAXLc5P/o0I153/dDYEdBm6oR5loEwAFf/ENrdOC8Lo=
Received: from CH0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:610:cd::32)
 by SA1PR12MB9491.namprd12.prod.outlook.com (2603:10b6:806:458::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 17:19:49 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::45) by CH0PR03CA0117.outlook.office365.com
 (2603:10b6:610:cd::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 17:19:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 17:19:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:19:49 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:19:48 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 12:19:46 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/9] EDAC/versalnet: Fix error handling, teardown, and robustness
Date: Fri, 24 Jul 2026 22:49:36 +0530
Message-ID: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|SA1PR12MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 75998392-7317-4b84-00f3-08dee9a7c464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|56012099006|10067099003|3023799007|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zxKJ0nWW9vGR8QV2SwRt/+XYgmm/voFR54mEPjtyFWXgw2rK52t4P+wx2irv4NAJ0Q7dP4fILim1bquPZVo6z7jTe/PDqTCCGtfzdojAvzsD1JVbgIFPXSD12Qrk+82YOCjkV8j/aFIyBWKWSFM80ElxcAM5x7fgWnj3rV0JOVaTmJf0t8stAC7nMoFHVMVA1QKYP00TYR9bqn0fPsmRThoeNdPF/liNnDACEkAJCbuqAoJazx378pj23ET361qEHub4z2fQL2TEdvyFp7MHlfAWwPz5FRYqqAPP2zjFtTTHBQX4JlGAjFLpFB9HkD37tZBN4ieeW1obIqTDRg5uC2beSR+BNeY2v0ErEP5Xz9LUaN1uVJoR8m3PwIke+NZmmXThAu/0SxFHaQL7AmQa54+lnKX/CR0NgcAhz4nob9LUQSclnZsPHQsHRj0bkJKS+2KCB7+hlhFR41F0TnUmhzopQo8HFK+8cZMe5qKtJQiXlcDLkjwNCRlOmbGkIrOeBko7geOVgOr9I7Kjkb1HDOjQyRmi245sLVjY0OaQA3yeO/KQPDei5B5k/hcqByR50k1aEQRVWOPTxCOaiFQ+91NPBO14XR/4Zb4CRCwjvt7P0b05zF6pieKZtlYiRrpnoOcK9ZQBhpZiJLqRrIk7pGDgMjQKZKFRsZ3mBAQH4v0wk6L9/hOfjibtYLeb5SldYZglQWLqWA+SnvVyUeG+Zg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(56012099006)(10067099003)(3023799007)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VsgmCrKJJ2iuL4l0UzWIQYtdJtffQWyuOjXj5bPnDJZT3KryEljJsgJtLmWFOka2S+4QcCfldK7XRb/R5CDqqFetHrIJyZb4goDFq0Jy/l61HJL//4vrAWxVcCocuEsVFxrNX2Aeo12Xu9oVLV0ZC/vmEkvhcntZ91VRdrAfgaPoaglgEVOGdh6z9NISEouyLzPr7TX88fnbac0N1WN5nLGpl7VPbPxq4JMputbQfvt8Ry4M9Ed6GUexv8zK6gbCOCx8eMgchuZqk7qjjZhKaf96zHZBVEKVizeQNhorP7d+moP+/Jp7jb5OcHoj8oDm8/dFbtr8QS+r/dF2PaiOt/l/GNulDq9mGMWwaLFzPMaEpyVw2CpKY65tQ68Y5Iq2RyNWpMux4PlUJH5d2+U/Ag6cPNDiqIUqpXV++bskrSvjUH7N7SmEBv/6Kv9kKYYw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 17:19:49.6336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75998392-7317-4b84-00f3-08dee9a7c464
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9491

    This series addresses several correctness and robustness issues in
    the VersalNet EDAC driver

    The main fixes are:

    * Robustness fixes
      - Add NULL checks for mci in handle_error() and remove_one_mc()
        to prevent NULL pointer dereferences when a controller has not
        been fully initialized.
      - Add bounds validation in rpmsg_cb().

    * Teardown improvements
      - Fix teardown ordering in mc_remove() and remove_one_mc() to
        prevent use-after-free conditions.

    * Probe and initialization cleanup
      - Move platform_set_drvdata() from init_one_mc() to mc_probe().
      - Reorder probe flow to initialize MCDI before RPMsg registration.
      - Remove unused pdev parameters from internal initialization
        functions.

    * Resource management fixes
      - Fix error handling in init_one_mc() to avoid a potential
        double-free by reordering device_register() and edac_mc_alloc().
      - Replace sprintf() with init_name by dev_set_name() to avoid
        use-after-free issues caused by deferred kobject cleanup.

    * Code cleanup
      - Use a designated initializer for rpmsg_channel_info.



Prasanna Kumar T S M (1):
  EDAC/versalnet: Fix device_register() error handling in init_one_mc()

Shubhrajyoti Datta (8):
  EDAC/versalnet: Add NULL check for mci in handle_error()
  EDAC/versalnet: Add NULL check for mci in remove_one_mc()
  EDAC/versalnet: Move platform_set_drvdata() to mc_probe()
  EDAC/versalnet: Use dev_set_name() instead of sprintf with init_name
  EDAC/versalnet: Initialize MCDI before RPMsg registration
  EDAC/versalnet: Add bounds validation in rpmsg_cb()
  EDAC/versalnet: Fix use-after-free in remove_one_mc()
  EDAC/versalnet: Use designated initializer for rpmsg_channel_info

 drivers/edac/versalnet_edac.c | 95 +++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 44 deletions(-)

-- 
2.34.1

