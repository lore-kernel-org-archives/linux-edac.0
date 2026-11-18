Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011760;
	b=T5jBsQP9zIWcNz8LXJABJa3ks/dFIQBymEyBVYUNBo9LevY77Lguz8Z9GG7WwJaZrPHT
	 yOyzimXXMudLl3rwPjOoai7sHn+OADqockLYqOgL14ljrVrMwz4F/7QW/EY4SplBdteBG
	 YF6AtZWElBy8CJWCH9t3Kk6oo1WOQiDm2CLVFE9nloPZ+c+x5N1mF7AaOo4CnOn66mo/L
	 V7mkaxUDUbpuu3n5Py9QnSP+mzb2pjEr5mh3tEQPBekOjAOSkc0Ifh4RiEEDLDBjtwyYX
	 5sQnSENBYjae8dnASyoKToDkB0/CsACGsNni2y9R3oZgJCI/tNCRBEHYa05HsyfHzow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011760;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=MkfsIL8t0G2+pa4x2OCvV/qNrgai6rP1XG/cxbb87F4=;
	b=AOaLmVrZEWKoZ46CL/lUkhdcCuqVXGq9LuBt2zo+noEpXr9wYtb5LHUGmkqF++Duk5wb
	 F+zxD8UXYb+oY30rdwlUZfpMVqj/XeBYr+ZBkWoXwRB6gbKah1oc93dR2yFcxnUbL4tjZ
	 7xXtXetOzWzMQdb+VwlrieyUbnoSSwTfavR9kTtz49SvXGwF4KUouL1aoVIaowL66JuXE
	 uJW799xMcTWIW7gKrQemnpYe8LPazbrtXCmvMnQx2QNiX/Kg6/P/8hVq+Ox2tcjaQ/FPW
	 LWgbLl7NhxSzZdzXS1/gpIEbo6Kyx1EP/HE1VxVlYFrSdDR0dBPF/OWB+bpEvR8Dy8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WqiDPQb5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.66
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010066.outbound.protection.outlook.com [52.101.85.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD6A606A338;
	Wed, 18 Nov 2026 14:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CD6A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WqiDPQb5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XD6D7g4zLzxrGilZcD8kMWvg16Gv1z/mZbVaO9MNIPVLV8s4wjb6RVKcyeQdSpRSXlfovmBEdgbK1QtS4LmeiSNRH5cPezsvGlDKoRCDBRmKshGjXT4AEv+qVHw5fjsdyNHrLVkBFjNywnKA+YTQD9M+0pNCbormWMNgmyeGtVvdMgqgQ0s0KGW7OLbhSWAK0eK6+cv+SveV3hJHRr70UBAKNI5g6Dqd17Is15AGRGdYTh5NMuYrZeivIa7f+jnqM0fBXwopnDTjRqAKIbYMvhPKJ369Z+RJpp2VTEnkKkw84OaIwx6C9ecPKVOhWDJ1yJlKtBXK3yNV82mODs6C6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkfsIL8t0G2+pa4x2OCvV/qNrgai6rP1XG/cxbb87F4=;
 b=qH7LX3RjcfOrTXVKSTGrEN9zWNewmsDLnuw7V5i0uhy/L+pskMUMlik2L/9PlVgvgZkEcaG3f4zeCF2MFnx+io1meAmAi+ux0nqmRo9cr1YG/vQtuRNtrHstumpsxs4AMGGBXjdPamZMEMwJNPLvFyeSddrhC6WQSUPGkt5RkTRFS3MoWOvFL98IKiXY+TfPgj96Gy5i48A42m9bJWJ2ovFqq08YTI/wNR02rjIu5VhFGafqfowYpnaVOwXvzzNOQFKUd0eQivSzPAETEVZibO5hwuchYiZC0ReOXaTu4TtU3DloeTStUcz92d7OF1K/ad8YNMiDwwMq/bw41ppCOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkfsIL8t0G2+pa4x2OCvV/qNrgai6rP1XG/cxbb87F4=;
 b=WqiDPQb5hmfznpA9vssaLoL+5fBLCoLWpBD1siZs0VzULxuB3oGMp7kr5/nmHyxkdVSbJ6CC/hgPazPZHcDwgR46vPTbAhaOHbEXT9jHPF4Xj+FObz3ui+lJ1U0wfBRlQCS2ibb5EvD+2VjZGtNgCjwG9pK8M7vukQHmbue87mc=
Received: from DS1P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:242::17) by
 PH7PR12MB5976.namprd12.prod.outlook.com (2603:10b6:510:1db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:22:33 +0000
Received: from DSM2EPF0000000C.namprd02.prod.outlook.com
 (2603:10b6:8:242:cafe::85) by DS1P221CA0020.outlook.office365.com
 (2603:10b6:8:242::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 18 Nov 2026 14:22:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DSM2EPF0000000C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:22:33 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:25 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:21 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 02/12] EDAC/versalnet: Use designated initializer for rpmsg_channel_info
Date: Wed, 18 Nov 2026 19:50:26 +0530
Message-ID: <20261118142213.100581-3-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DSM2EPF0000000C:EE_|PH7PR12MB5976:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcb2f53-57a2-4c42-7b96-08df457f62dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|56012099006|261021121427099003|11063799006|10067099003|261022075727099003|261102123227099003|261021123027099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tH8lBZYOMXUa6i47YoN6faS9nukQ9eHtlOTLc7pWDVq8SBjZAIhaWsUctGdmzMIgrdw0iIjHiJ6rAdV4GNu8qJu03wKPjoV+M2Nk90szjLbyXZ3Pp/LMsKeheQvf56hE+J3om0R34dKZHqsRhFykXDUVGiwQr9ua3yQhV0TEHuLd10o2UBWgWwfbDRPyuT5vMjbsDT8SVW3wtsMiXZHAPZq7a1jF3FIDb6T6qOYOF/kUC0doZoVo2x6KPCRxYXSNL2CZWHtXstYLav+TOqSRsWr1HZNtOPRFNKgGJYhNhVZR8eFRe5fit7qm+Ft6mKdQqZdqiJaPh3Dy778VoARSyLfZPZcOVwhNPjMQ38YeMd4mDCTDEAT+15lGyTSGXHoK70V5JwdUxTP+c3kpUnw7knsyEyOZn3WqAy411e1I6SiTdRrh1v5G4gMba3X+mIv3W6To+ReuGPDGyJT50hI+Q09FODQX1dGPnu2wb5npQ6yzBHA45a4FJW/J6VkHcRkJXPBiQSM4L7DzFuvbJ+VTCJ2z2BnFvaeur5Uj5nXYrbte1mEr8GDeoxWverUaTo4VYJ4k/wD+d3ojyMa8VECViWuBRL8hdgs46xdk6RySsxLQE24nRR/TycANvGbq3ctfIHGwIU3aS46vJ3PgxTE+j5xxU5Hlr2kN0s/LyaZVNEP3HiAg9EHcyAVyO6/QAx5McabAoHWe9L3REaYxtlmEoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(56012099006)(261021121427099003)(11063799006)(10067099003)(261022075727099003)(261102123227099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0nTVB6yGGWFD0QV7o3v6v/TI2H5Wm/iQs2kGkY7PQ9+26TZFayWMBGLKGIurIqFRaXqMddI0bX/7Dp10Z/NBMkRqjzGHw4Dvx6GWAaqP1aWQdM2gdYKQzQ52MfisyjSI3/qmL8ytQoyhYmRw7zwrRci8xMq2MZjOaqVNnToSqNM0QQNrNBA718+de5c5L5ypt+lA60Z5M/23ZmtHHtWB9zAE80ejHs5FTx4d24M97KTkErGbAXfLeV0hk3Mb7offMj2ZyNl/vgEPylmtaY5rCuC/q7kT22Jqjay0mvyAs6iLfYO1UR9BhdM50sFOcQHsO+u8NaZ6mAP9osuIylrtZZE64lDWQRTGbvehtQHSeO3p9Kmw6x/gJUx5YUg4Y29s3I4b0kZZgcZOXp1q90ugOTe2OXO81q3fCl6GEFnF3iRQAhuWy7z0YnKCPwrg5vrp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:22:33.1250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcb2f53-57a2-4c42-7b96-08df457f62dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DSM2EPF0000000C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5976

Replace field-by-field assignment of struct rpmsg_channel_info with a
designated initializer. The old strscpy() call used strlen() as the
destination size, which truncated the channel name. Use the
string literal (via EDAC_RPMSG_CHAN_NAME) in the initializer so the
full name is passed to rpmsg_create_ept().

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Use a macro for channel name

 drivers/edac/versalnet_edac.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 89672d4d17c9..de97b2ac45aa 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -70,6 +70,8 @@
 #define XDDR5_BUS_WIDTH_32		1
 #define XDDR5_BUS_WIDTH_16		2
 
+#define EDAC_RPMSG_CHAN_NAME	"error_ipc"
+
 /**
  * struct ecc_error_info - ECC error log information.
  * @burstpos:		Burst position.
@@ -713,21 +715,21 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 }
 
 static struct rpmsg_device_id amd_rpmsg_id_table[] = {
-	{ .name = "error_ipc" },
+	{ .name = EDAC_RPMSG_CHAN_NAME },
 	{ },
 };
 MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
 
 static int rpmsg_probe(struct rpmsg_device *rpdev)
 {
-	struct rpmsg_channel_info chinfo;
+	struct rpmsg_channel_info chinfo = {
+		.src = RPMSG_ADDR_ANY,
+		.dst = rpdev->dst,
+		.name = EDAC_RPMSG_CHAN_NAME,
+	};
 	struct mc_priv *pg;
 
 	pg = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
-	chinfo.src = RPMSG_ADDR_ANY;
-	chinfo.dst = rpdev->dst;
-	strscpy(chinfo.name, amd_rpmsg_id_table[0].name,
-		strlen(amd_rpmsg_id_table[0].name));
 
 	pg->ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
 	if (!pg->ept)
-- 
2.44.4

