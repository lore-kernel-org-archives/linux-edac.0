Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795476443;
	b=EQ6BNNl4tEwuKUgwhHuHXgKYOWHFHzEQjAPI2KfftmM+dtAeRJFw3PnEgFnvxH99CgLd
	 CkCXcISnF8aGtyfCOBiLEjDZkz5sTSgIgX5YrFHpEaX1Ga87YEuJUG7mDs9ES1+W02Qy/
	 y/CgeF0bNtoFRUbpj0hLqr3Qyys2TFdI7gp4hd0xu+HLURE2v9l73xNipFtjtNyHJ0Y6l
	 OYgbGK78bnv9i9tdhXE3c7YTbdlXuhGxdafl6LgQwp63oupLeUaCYp8Wrx/s8aEWVp8Xe
	 UsTv3OVSjg2QXgWA6KDIedVVUvA48A3Ce7TtZW6Y+OwcrWact7uZQwtMqrQaQBK9NNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476443;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=MZq91PpEww6C1HRTg27TsQkx+nbMwiQpta5jBfAyfEI=;
	b=PW/XBawzu9SudR/ia12qMHp8dXjzKX13zNNdIRodg5bgiHmBclAWFy+ZRDNOXhfc2p7U
	 kWm0C98a7HL7xhYYew/KMKBJDg9CLzOUyfRZpk3tjVjjw5qn26bIgHa5mQCLx7msIyZzg
	 uly98xOae2OGKVQX+BXva3C83bywMTwkwcPV/8MI0G8IcQISiXCIXNALrYJ7j9ZNGaEY0
	 ECTHX+pNKFSgtj4Aoi1hpyyRU0BfF9JUBgGVLx7npZh8yTpWh4dsTNyWFpnQEkmp5sbVW
	 SK1yfM9BoP8n1qkrWWEGA11e3sjswmvbsqTdBLH/o4X4/MQIqK94m3x7GuLd9XZnWgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="d/udM+iT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.56
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010056.outbound.protection.outlook.com [40.93.198.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EBE606A689;
	Mon, 23 Nov 2026 23:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8EBE606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=d/udM+iT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0BePvGCF3gTld58JCcatBo2P2SHnLqQLC7+R4CDHHON6e4xDrkS874oUCwKRqIsznfBVGN/IMlmkTrlweadftXPSMCIWJHcoqrIkbifii+QWfSJYZFrbhs4I6Z44KxgELf5N2XuXd0FMlZ8a6y9RLoA3SuhfTFnewvwNBE1HUg9VcIRtgHhGXwE/7cJVMiVEuatCSHUgsX2nEs2LbEL1e/FELtqvNWic6HCBJ6BdAU71HwAWJJIOGNMRaTcuyyWIHtA1nIMyZhWkWYfriov0GO76tWPoRX61b90TSMaHnc5X9k+1ZSHvDVQZN4fkVNz7wmw3q84iBvW3hKvalTpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZq91PpEww6C1HRTg27TsQkx+nbMwiQpta5jBfAyfEI=;
 b=aH4+9L1G3en+YfCbQUJtSZX9ycPX3WFTRG5MbkJLMUTsm/s8BGe+G5b2jIwSi30HQg4DrI2WlXFCR202zQWW9VSmNHZYm8qjKQSondxH+8WRm1cGffGRSaYvjpA1EyB+s/n1DO/XHCA4TQgeD5brutDWGvcOwEp2wR7eqTHQ95U08COpPuRHlcOL+SErM7Il7l/AA36vUwrKkIH6+0TsO/b4Ak/VkLpQa+G5UnRcvG3JipAsjdhIY4oZXaPejucXvQJT+xzSxV2oc1gSUAgEaU1+7v65UDhO1fbf8GJHjpPYSt07UTA+zBn+fcDJS+Rcr3O9bHclUUO6Stn3F3nlCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZq91PpEww6C1HRTg27TsQkx+nbMwiQpta5jBfAyfEI=;
 b=d/udM+iTB3TR4aVp8GmMdgieIdnsuXZlHitt+ynuTUxGW1i5eSQslRVp3ahzqtSNxO00qtw+QLTWfFzyoWSsA+sc8OxnE0mCbU+glNHoNFQ+vUnTx8JOawahfyGpWBGCjG1dmKC9v/2WveEOCTmbL01BOowtQUDjPa85dLo/bT4=
Received: from PH8P221CA0057.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::12)
 by SN7PR12MB7834.namprd12.prod.outlook.com (2603:10b6:806:34d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 23 Nov
 2026 23:27:14 +0000
Received: from PH7PEPF00000006.namprd04.prod.outlook.com
 (2603:10b6:510:349:cafe::5c) by PH8P221CA0057.outlook.office365.com
 (2603:10b6:510:349::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 23:27:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF00000006.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 23:27:13 +0000
Received: from quartz-7b1chost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 17:27:11 -0600
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <tony.luck@intel.com>, <x86@kernel.org>
Subject: [PATCH v2 0/3] Increase MCA bank count
Date: Mon, 23 Nov 2026 17:26:58 -0600
Message-ID: <20261123232701.1923094-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.55.0
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF00000006:EE_|SN7PR12MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d85217-1b4b-458b-148b-08df49b94e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|10067099003|56012099006|11063799006|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|261028144727099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Mi8u96e7wdmNqLGTTWTXisOROv6LsCU2MWu7d9wkDPfXrZt67N8mtLRCguAMJD6flaClvfbv4yhH1TamQ9Rq0hkbaqKZnwyEAnzw4uViyK5wJTodMAXaW+PIT9ZSTkxJi2rgfjcWpPb0pgfwY1s2GrCKaAH+8We7wWRreq8yPPogZrMBPlyRday0R0osNi75CwIdRPTzxHy+3d+xO1xzsFtpvRF1N4u/kNwklhyItJ2LoaZybZd+kZllpNt6+KW7t/cZhd00CtwrOPAvNu5yqx8uTwxouoFi4WyB86YzMCNQze4lOAxXfDETKxmBPj69fagW/Ntnw3wYyQMUDOZzbOnhzZ+CGO1LqgrTO0933TsmslaIqINOCp9YsJu6wW6Ywqe1lbrVvCbGMXEHXWBpu6GB6f7xNsyVO0wtvYllIOwdbkt0A6whuBx/oGyxPj6XuKGwzrblZaro6ItmCXGV6dk3+FRMLU0HTTElXAik4/Hb3T3d7tKkZfgwE/+gOexwp1d0uvyANJnvRiJcyxy+awyMGMI2qiKqYnFb1y9a6hKcJ+SjgYlqHna6ix4V/7ssxZKigM0oqDI8hMHwFQL0/Jkxtqo416qp5fu/fxuSj4A9pUB4B3V52+1iDb6XFXOuttYg+SEUMYfw/OOa18b8KQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(11063799006)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261028144727099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dc0hZSJJigc09MqCoiOzSMPhqorjklfyzG6/VS7KwhbMVuNQ9S2V4DDgwMBiz3S6siy35W057h+XCFiueV43XCv+B70P7whnLI2kirPiCM907uplWVNhqpf2fwEKOW49Zdht4NDp7/f0csvune60wXJin09N190xgUeat1pfndItLCJ//e8+FO2StdmGvvh+97HevzmfNfvG5+Y4YlhdvAN71+DNr9qsGI9x7tLnNYNPvyFLJ5szM0Wa/b39CP3ZMUTIUl7qEPRuocs/IEXIweGGpP6dPzlDSf7UwAlTvn26QyewElPrMHrZrrIKojNf12R9/NTvv0Z3zZyFx9Dt+x4mYx09cfUgAAetjfQ4YkD7ripGOiSc9Ig4neLZLRO0mYlz/qYBp6KqES3ooTgfs9DoRWHU3aB2WV/5lvmbz7OTRGtsjSnSAkPO12FDw/hK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:27:13.9441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d85217-1b4b-458b-148b-08df49b94e41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000006.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7834

Hi all,

This set increases the max MCA bank count (MAX_NR_BANKS) to the
architectural limit.

Patch 1 is a bug fix that came out of code review.

Patch 2 is a pre-patch to avoid a bug for systems with more than 64 MCA
banks per thread.

Patch 3 is where MAX_NR_BANKS is updated. The commit message includes
some memory stats like the last time we bumped up MAX_NR_BANKS.

Originally, I intended to include additional patches to consolidate and
dynamically allocate many of the per-CPU and per-bank structures. These
still need more work. So I thought to send just this small set to start.

Also, I figure a smaller set would be easier for backporting for those
who want the feature support but don't want the additional rework.

I'm trying to see if the per-CPU rework can help with the "sysfs
hotplug" issues reported by syzbot. I'll send rework as a follow up to
this series.

Testing was done in a KVM guest with a locally patched QEMU that
emulates SMCA banks, at 255, 65, 64 and 1 banks per thread, and on AMD
EPYC server systems. Mainline fails at more than 64 banks. Without
patch 2, banks 64-127 alias to banks 0-63 for thresholding.

An LLM coding assistant was used to help draft and revise the commit
messages, to measure the size changes listed in patch 3, and to write
and run the tests above. All code and text were reviewed by me.

I had the measurement data included in patch 3 similar to how we did the
last time MAX_NR_BANKS got bumped up. Ofc, we can trim this if it's too
much.

Thanks,
Yazen

Changes in v2:
- Rebase on v7.4-rc4.
- Patch 1: Split the bank bound check into its own early return. (Boris)
- Patch 1: Note in the commit message that GHES records are affected
  too, and that an out-of-range bank makes the address not usable.
- Patch 3: Explain the cmci_supported() change in the commit message.
- Patch 3: Add the #MC stack frame and intel-bff.o size changes.
- Drop the Assisted-by trailers. Tool use is described above, following
  1e035297ffda ("docs: remove Assisted-by references").

v1: https://lore.kernel.org/r/20260903142049.4126599-1-yazen.ghannam@amd.com

Yazen Ghannam (3):
  x86/mce/amd: Fix bank lookup in amd_mce_usable_address()
  x86/mce/amd: Convert bank_map to a bitmap
  x86/mce: Increase MAX_NR_BANKS to 255

 arch/x86/include/asm/mce.h      |  2 +-
 arch/x86/kernel/cpu/mce/amd.c   | 11 +++++++----
 arch/x86/kernel/cpu/mce/core.c  |  6 ------
 arch/x86/kernel/cpu/mce/intel.c |  2 +-
 4 files changed, 9 insertions(+), 12 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.55.0

