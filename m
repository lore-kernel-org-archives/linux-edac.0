Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797556;
	b=Q5GipzVjF6LefV5ey4eNcMqt78W6KG1Oe1SKXpQ2vrPcssYsTdZvJytKhzu51zTJrv9k
	 /Y9OyF6Ufvlr2wcrV5tO0k2WJa3iyt848KgYsD7FNU2OzFxigO3LqihbUPDfyzMbeO61R
	 lrGp3tTmYDIVD3CjzIan1HfoDm8gYXTPbTedT5aVwh5TTPQcGi9b9L52jG+6cK11EX4oM
	 bZ60RUCBi6gAH2h7YrGML9h5mhIzEuypJSO5qhQwH5MGWk3RSsJ9a8xx7wrmFMAT4iNAh
	 cMAaN1ZIihiRKXDvQa0qHTPVoFEwAdFOysjnl1aoFKeybzOdj9/UJ98Pb66Z0AiOBCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797556;
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
	bh=/1AJ86BAk6JxWuwvEJutKGgBBua50bcp4YYD8RgB5xY=;
	b=SBtFtmMj7y/P8k0Psl7SEXDDwJd2XiXVmipkM+J4cTv412MuSxi5vHmdg+LgaMEVMS2J
	 C3e+Z6POuu2Br3mibi9QwFo6f04cnLCNYfeVNDX8hXJG2re+VaEz2fth/nwsQPw4Y8TRr
	 nWaM6cuTJ/TKROhkRRyniLJ2gT+IoNyFqnx34hnlO3yesIGaVoPZDvgQkCrRVjEjOEnD+
	 12//yTQ8k6pYrcxfDCc8ot/u6yn4QG6TwsbbCHAYRK80QbH+tCxqaJVAFV5khqtzPydI7
	 ZJEJXNHAEYnAhzyhgJBfWLMHSqzeDmBdHZyIl8zlgQV2xG7oZXnt7Sv5fTqAuKL51Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0AHMows9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.22
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0FF606A33A;
	Fri, 27 Nov 2026 16:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D0FF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0AHMows9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fifs4S9lMf5pg2Wn8NtU/eICDnfngN83y6xlqe4C7D4s/GDUb0luuNQKRUBv408Guz5WVopdUMgXfM6vU8Yflee7ZQIN8cEs6lfYXj5f87W1V8KHRQ4KU0zShzAQ3assXo9+0fFbOKUmF3F816ytfYn0izFrc8a5Uc2e9JWTv9+sryvJUbda7SIRS+fLWu6D8rR3yOPZ8k2tm+mdKWlUkiOJgSv/v5YeqL0M6/12OOgTCqVPCfhVTZ25oE66skLO7LSHk8KxYZX1CLQxvgqGaNKzWiNH7dfue2mxgTnQlSn45zqOYyQrqrwAGxxoXHjbPMX+klD6vgpa/SgjEjj8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1AJ86BAk6JxWuwvEJutKGgBBua50bcp4YYD8RgB5xY=;
 b=QzkIsgnLIzThr1k4q0RWQVz3333VrfY8gE06ntLJQEJE08in8DrLsjlGMjCQGC4Rijg1or1KSLklKBWEPvB5iSpRW/HqIz5OfUWGS8YoXhermg3qdnKmjGcquC+bCI22E2JFzZqbTU/8kWxhpvPUcg1cB5DmE9hhb3C3NKK4xikeFCQA/wuMphXqRef4z0j4+zBpAM+X4083pK/bH5w7NLY9SbRh8y0p04oqDCEHXTAk5tEYKbxZuP+9unRNADN94Ic4q7Azv403yYydcao9dxVhf26DO+yj+UxAz5thgkritYeK0YiqbMLCWAvv3hqccHYzudY+bpcggI16CQudAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1AJ86BAk6JxWuwvEJutKGgBBua50bcp4YYD8RgB5xY=;
 b=0AHMows963kuAOh1EfHlM/KkMRN1x+20Ly+4bQFHuq0/tD5SJfxyqclppHRfWKy/7jjjWkdGRFYCYjwTi50ua9qDYhrqwSjgv+O3yyA92FxgJ/ciR/Hv0LUIxYo71nuXHLPA2lrD+WwK+N4JoR+gLJfcVnzXa1xROb7D3FRe1Zg=
Received: from PH7PR17CA0028.namprd17.prod.outlook.com (2603:10b6:510:323::8)
 by IA0PPF0A63E7557.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Fri, 27 Nov
 2026 16:39:12 +0000
Received: from PH1PEPF00062F2C.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::3e) by PH7PR17CA0028.outlook.office365.com
 (2603:10b6:510:323::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 16:39:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH1PEPF00062F2C.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 16:39:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:39:09 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:39:09 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 27 Nov 2026 10:39:06 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v3 4/7] EDAC/versalnet: Guard against NULL drvdata in rpmsg_cb()
Date: Fri, 27 Nov 2026 21:59:13 +0530
Message-ID: <20261127163853.3563991-5-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261127163853.3563991-1-shubhrajyoti.datta@amd.com>
References: <20261127163853.3563991-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F2C:EE_|IA0PPF0A63E7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f5f764a-b0c2-4fbd-607b-08df4ca4f6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|22082099003|18002099003|261022113327099003|56012099006|261102123227099003|261026121527099003|261022075727099003|261009223027099003|261021121427099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	NKIs38q2rMoNPNcjgCvNPyjufu5mn9Gu+Ue3kTKe3c+NLDr0CiWYKTEZrp5ak7QziwZSmhFYnh4dTHXEpJhFoWvCdTwnNUEKW2CG1+LgBw/Eo6Ma3B7l2NHHUl3oRddvue1i3oJS2+crrX+2Guc3B0yx8XBTm+Isak+9ZtlQ4wYInISGwv5N4p/sHjL/qiuvu9vGI3pdB+9mX3Hpow9FJefTpy9pmfUtRQGCpDYaQd5wxrpRYTpfFN4L7LwojhCxItg8vFVPVxXFP5dK5+VlW+8N8w/UJ4o47iBBdppPp+VqimeWG0qCtJ5RgYOjNjBF+NEe//PLsyMzWNfe5usvlPLpFY72gLKVm1gEpxllfX50C+K0CxGPGBc+wwPE0Nlj8yVLSOs6pyxfaBORQdcjbNO/JlUjkujNXaybvmudbyGD/7MlRnHLwTAFt7qLIb3BdIGRUgiwszex8NbtJxTpXf/Y7wYrfobkY8izzZg3mx2zcJtUlHzzJ1UPzIht+d3lFv4/vxfYMq2QgauU70LSjw8heEmf0jQlgQN4JnDmP33ZJw1MJLEGz9WMEL9MelbeQSfP7Niyl4+xC1CMV1CdU+aJLdWuoyrBIOm3xzAMCclWjOVj3gHG9Sf5ZkXi85bS/SQjq2qGIAaQ1joWJoG/QeuVOOcQrOMU1PSEym2bmMCT42hD3nYuTwb+Vlh9/jKYrK1GBLLvfIOgN5DQnvhIOQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(22082099003)(18002099003)(261022113327099003)(56012099006)(261102123227099003)(261026121527099003)(261022075727099003)(261009223027099003)(261021121427099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XMBYozMVAKWQPwcg1E4XHXLfY3DA+5d6639y8zMqE0jm8vA+4Lw53aOSDISwtr3fsFx63ZrB8JSKsr4oXwKyHAoek+ARnpsnUtPRl8Z7slRb+Au1vHVEq+axRSUOwECRD+XuQjBZhgvY1QI5aPB0KtTnUgB+SE+lIXq8+5cQDMSoUu0Pstr0riipJXe+kQOc6Muh5jv12+ci1GJ2Qug9bxFnWDXUyi8kdqrjLPjPkQowvOVAnUG/VUWZr/DM4cmPpAshsxLF+PURx79YC3IsSRq9UulJ9YucPy3blNjALka8wYA7MheRu6kmc0oTgn9ptOQRMeP7UVige4hNwIUaOezTHh5SEbuFH695EogLkTueoW4yeK2qs/8GVGZZKYs1YQqnHIhd1ao8Mfx4+6coklmvevouLz7YfKTzzOdVgIUgc/by2x3rbI3qUkrKAqL0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 16:39:10.5695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5f764a-b0c2-4fbd-607b-08df4ca4f6a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F2C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0A63E7557

The rpmsg core creates its own endpoint bound to rpmsg_cb() in
rpmsg_dev_probe(), before rpmsg_probe() runs and attaches mc_priv via
dev_set_drvdata(). A message dispatched to that endpoint in that
window would dereference a NULL mc_priv and crash.

The same race exists on the teardown side: rpmsg_dev_remove() calls
rpmsg_remove() first, which clears drvdata back to NULL, and only
destroys the core's default endpoint afterwards. A message arriving
in that window reaches rpmsg_cb() with drvdata already NULL.

Check for a NULL mc_priv in rpmsg_cb() and drop the message instead
of crashing, in either window.

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v3:
Add reviewed by tag

Changes in v2:
Patch addition for the rpmsg drvdata race

 drivers/edac/versalnet_edac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index c43104a5d9f0..8c3f8733c049 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -631,6 +631,12 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 	const char *err_str;
 	u32 *adec_data;
 
+	if (!mc_priv) {
+		dev_warn_ratelimited(&rpdev->dev,
+				     "Dropping rpmsg message, driver not ready or being removed\n");
+		return 0;
+	}
+
 	if (*(u8 *)data == MCDI_RESPONSE) {
 		cdx_mcdi_process_cmd(mc_priv->mcdi, (struct cdx_dword *)data, len);
 		return 0;
-- 
2.34.1

