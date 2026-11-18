Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011770;
	b=OV0uSQFwhHVT/G+u+7u0NEjBQuwzZKYM+cRNVHCfKvl7lVqnzQyGP6ksvAIJ1uCwu1DP
	 Fnpwm3kX/zObTCPg3Wu+TSANuBfAB33slXETA8yjSSQEAPSLoB6fhHkwieUHdtdnSNWh2
	 7f7O1kbLECyacWeISFuBTHmMfW81OFzjFIX49RGGSAKMkgtmR0E2hJ1vLOOEZX+a5Tgup
	 lvK0iuGJVumZKqnUbkxavbVIpSYxGNZEQ9gF+oswTut9FOQWZaSBvjruuEdolDmbPleoA
	 t5CoMVVfvbEEdAJyUKtwCnKatVIoJCFrQpnu9CsHPGIGjYiFhSuyrXzpbSp3Re5DX9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011770;
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
	bh=0D2P/AUCNkoJYWuk2BazFFNGQglhC0AS4qOczz4+qo4=;
	b=BG+uGgd9UzFhfXolo/gzXUqhjRy5t5iKppXH1LSBcBSgRVw7kh0d19rynkg0g2NjxNFC
	 /ProwqRvAGFAIH9k81sFmlcVqwcjvhcdfQLH8rcNdcpogyoDXwS6xvmiHVzBkrP4NmSne
	 WQnQHq1oR//aJYLs7PUj1WyTwuWSkr9aHO5t1/aDi5+e6QdvMc6WQWXbKIo6tS+3Cs1vS
	 PbH8qhRZMK0TXDveiJNpS2/rHxZN787+RchkCM/rvssoMLNJLlPkcnLh88yaMDZOKGNOt
	 3MAqxDqh+FZaaKWV2kQ+HNNFTTVVGZbHJnXEJ2WW8fRdHsEqAtDcWGHie50k3FN3Ltg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="dLTl/1zh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.27
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012027.outbound.protection.outlook.com [52.101.53.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A2C606A337;
	Wed, 18 Nov 2026 14:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A2C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dLTl/1zh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/ijzECbcVXsRiJPxMzIpmZR+6Une45tDSWbMHlNgkL2Bo/VsiOSSVkd2XHC+FN1w+IIn1l17WQHiD5/RK20hP17Zwfi7b/Q7W7q8t5ezIURBUsGWWiqw7/SIzZZBm7ZId/wvKyH3mLIeFTrLj9h6KupbnLkQmRyD0YW7rcYajANgFTgAek4m4Rf/kjejKJlBuHXcYbypDCcMLLuihI8McpHrcDLesRbpkNygE4/U0cTPhSjthBpbJovqxjJwcw91+5baAo8HmQInMYkJzz7WYTjKLHwe4YIbELSjRz57ZMKLbaGDKa6jCT7936GUUm3QdvisNt4tAlGD30IWwWruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D2P/AUCNkoJYWuk2BazFFNGQglhC0AS4qOczz4+qo4=;
 b=LCP2n9M3TqD94xIGzkJDlzYd/BsppLpjJaJtYzcvcRcUmUkdmzgGHL/utxFQKD1s7Rsi0nvO5Cyn5edfUNJyfWhlxflabbjdsgRTcrJ7P1O6gknX65l6QuXf27H1vQlYAKp1gt+uTi3givlF6tnOri21MNsVv8o+yQZEH7w8Xq4aJBcXS2UH6YETK7Z5rtQBYqrIYCfeyzmcrZikHt3MSWnjKlC8a1QdoylAu8mTV1d6QzCtZMzcOF26jiTImrMnR2NAf/Qa9kBn8jPPOIGbqCadXVKNOwwrk6MnDgMuAkhc8gtKgC9gCyGokNo1L+9fKUD1npSA3rU2eqC/osky1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0D2P/AUCNkoJYWuk2BazFFNGQglhC0AS4qOczz4+qo4=;
 b=dLTl/1zhjVNqAE/roofNMXzJiUfx4HC5MWFg7UsyX85ICyKznm/PgtoPQCE37i31CCZMtUJqHC4C7Pg8gQxlcFOPlwQGQ9u7Mx9ZI8kF91ZVC7TApila2xVlMutRVQ68v0x9zMYYww51jrrB4d4174X+tVh5Pygcvc6cRToz0Sg=
Received: from BLAPR03CA0102.namprd03.prod.outlook.com (2603:10b6:208:32a::17)
 by MW6PR12MB8833.namprd12.prod.outlook.com (2603:10b6:303:23f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 14:22:41 +0000
Received: from BN7PEPF000000A5.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::7e) by BLAPR03CA0102.outlook.office365.com
 (2603:10b6:208:32a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 14:22:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A5.mail.protection.outlook.com (10.167.245.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:22:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:34 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:33 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:29 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 04/12] EDAC/versalnet: Add bounds validation in rpmsg_cb()
Date: Wed, 18 Nov 2026 19:50:28 +0530
Message-ID: <20261118142213.100581-5-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A5:EE_|MW6PR12MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f598f22-b61b-41d3-afda-08df457f6798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|10067099003|261028144727099003|11063799006|56012099006|261022113327099003|261022105027099003|261021121427099003|261022075727099003|261009223027099003|261026140227099003|261026121527099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rBrggTJ5i4bpaarHxx7xPhFR7OsTSpeYo3v6gt1xGmxhbJGz160thWyMkV4+nXCatXp+l5Rx1YK8j7QBv4GJix036Vxy/hodkZ8G3pQ1s1LeZmkKIIDFXjOHCxGNDzsBdqFysu3t9kq2O0aN7E5l/rVQEUVdmiK+A7iIM08S1dnj/q/eop1L0AJopEt/tDh1ys12wg1xOyFFHTsl1FYrfFcmcrA+nZ0AJfOs47U9gefqDdbuwwNHIdFbayZwugNN9+GyvyWDuHwDj+zcCzSMvxLEbymmrggh2A6kV/WUwvq2S8i4xk9nPxwBXSAu7m3WeRg1U2r0sTRqsHFQPmQnBZjzXlw4uXCFgTnvG2l7kmrm8pYT3RLSnAXnW9ogKKlAAUl7fLvzuDgnIO+gQxodd/XryWQfg5ImZ65d3Rbnh/X0sAUvxCKTtsYU2BrI6Rup5Hr9SL/6Df6pEcCZrt2XELP6bgG69Hd523dIJg1+2y+CLActkBsWzK216L4e0Qu43ipAv8oYmUMMebfUje+Ig2DARUYGvArbp2GjyPa3OJjXagz7zjnbZgL0PYaIcRyqh3DFiZSFInA2mPuLTU/zOJ2VX0Mpa+31sJhrNcj8o5yK2TeI0T5JksPvtY4pMABjrPyH+JCKSQNSEKQfDV8ZhpLQWMO7TzJ9I3a1/V43RVeWqkUM5KTWWjKg9S3eGx3vZ1VgRofq/sjsyULNdyykkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(10067099003)(261028144727099003)(11063799006)(56012099006)(261022113327099003)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261026140227099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3uBzWoXsVpEaFz8+RENdyK8QlspyO6kVaYs9a7EyFxkbNkaVXfJ7vS01i5KrWsbFqxfeT9ch+F6rAxHA3Pk+m03Eu0hqXPaFZg4DOmc+UPTqNCeME5BmM+VC/X0NyeDhFQfrhsHXXlQ+LEDh0dX1KwJLWrSXGh76MHsPpT5NDHBRtiSczU7ZjbGBK2rqy8eIy9NAGy9DU2T9X5t2fCecZDhcLlE81NmnFEAL+bH+xe93/xS0R1DS4nx1e8gVnfFnz+YEalKx4tE0KjadmxL0disiPWBy4h3kbNH9VKYW1RdW08J5VjrrYvpMAiFX16GSxr8l6tFKHD0yuQjTPRyljiOdyNSo7YgNFd4u4yxoRJZ01EON0oV1Pxf9iGyviM2p+J4fCGNGQ25Fkwv9vfycF1kRYfNoV9PWXzVpzAQANvhgTRmhM14yPOLDSLwVPeIb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:22:41.0676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f598f22-b61b-41d3-afda-08df457f6798
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8833

The firmware-supplied offset and length values from the RPMsg payload
are used without validation to index mc_priv->regs[] (REG_MAX entries).
A malformed or buggy firmware message could access past the end of the
array, corrupting adjacent structure members or kernel memory.

Add bounds checks for the offset and length before accessing the array.

rpmsg_cb() supports messages split across two RPMsg callbacks. If
validation fails for either part of a split message, discard the entire
message.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Sashiko comment
"This is a pre-existing issue, but are offset and length validated before
being used as indices?"

 drivers/edac/versalnet_edac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 2d1417135e42..0364648d91a1 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -607,6 +607,13 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 	length = result[MSG_ERR_LENGTH];
 	offset = result[MSG_ERR_OFFSET];
 
+	if (length > REG_MAX || offset > REG_MAX - length ||
+	    result[TOTAL_ERR_LENGTH] > REG_MAX) {
+		dev_warn_ratelimited(&rpdev->dev,
+				     "Rejecting the faulty message\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * The data can come in two stretches. Construct the regs from two
 	 * messages. The offset indicates the offset from which the data is to
-- 
2.44.4

