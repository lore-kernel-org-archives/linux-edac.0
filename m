Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795476439;
	b=tPvlwFR9rGAm3J0EoPIgKi9jilGD5qvfViEC6VulLexRVdHiKuMtIfBmgSdXtuTO73Y6
	 H1dn8lwHltwaoWKxE4jDBcPkxfL2O9ZkGR2y8YGbc7nHuakAvhOoZO2VCMVNrprgjk83l
	 4YmPj4pRRlra0llkxDwKxtslrvY+fjy00ovrREBkXyY3HNMECrPYpTEmkSAMPv2OoewiL
	 HC6NC/Q2GnrGcGYJ/zpLqrmrY3+zrK2O0WhKlKik/6QkfGsJJJ33PLu68zn/0VuvZ21ui
	 3g3rREbY3LJy8V+te/NoenVV5ZC8KNpZ5T5+I79ZNZQs+HoaiodPWuuJ5E4+GUdf0ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476439;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=U94Dr/dGIZWJtxID9zbynnUkPua25RyeVsq4CGIW2Uw=;
	b=GfpmBv1HATnt2iOtitA8hRV52jrjpJPNQZWmrZiICUMlx53j2VrNMlx4Iiop5UmiYazk
	 v3mzlzRCsIR5RP9F6rTJVr4/4OzogwyZ/9Z+u5hU+Jr8kyZZWG4Qc1NmAApaoUxASy8++
	 nyHAQWIBSQxqnBkYkgDs2xkNPZsv629vgXYHDbz9hR5NGGRGkxJlX6ujbwYJRmj59MI7t
	 q9ECLqi+NtTazwwctTy14FH6+kAYqgIqZT5Dpa7CHSBsKW4Dnmlp7QTjWQ+coKsrrpCdC
	 kLdrviitt3BzbfqIE0vvTdPzXeDZjxzbRz0CN9sfUFYVfMKhDfRweY6enM5EeVLSPIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bvZSaQqf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.33
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C242D606A322;
	Mon, 23 Nov 2026 23:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C242D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bvZSaQqf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1EKM/hzGGjDK09vVPBd7lQkaub1sBKBlM7DGCPQYweLLgvHI1hdoAqoZQzs5kXdxlcLuzKMASU5hCRC55kdnZBsiZAuROJezku6fY9bjed1K181VBaag+21VLtCK5CjxFOA9IMJucE1El7mCd0olaKpFKiQe4P7EqFUJCn9ZR3DbVvdC/g5QKG4qwE3gZs+URIneZjFm0Oex5BYNIfTDkzLz2YxvNW7glj4HyN4BQ1OZ1I+EEq+N8es4ESiykVsWhqzrdt8aHoYylWsOnf+iYWY2IDn8XD3FjPx2sOszU/Z5P14UK/9FJqjY5HAA3bfqsW5YtignZejZ1LQkYrfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U94Dr/dGIZWJtxID9zbynnUkPua25RyeVsq4CGIW2Uw=;
 b=mMrsNL5Z6xaAn1qzQiHaDP3QW98LSlft9LDkSJeweaQFIjIFV9zpAecYq/AIWOGfF8U9/VhoKvvEYkl7PxmX5ypG0tC7xWcgjevQ0U88GiFUdzzLFvWixcdfmGvzAHP5dpb8NJeYwrHyztQVY47E2aKtNAXopCo5Bu35I0HnXj1wZGz3RHFRQ35GEsK0v7unb3ZSwossQRh6StKK68N4juUGrq4jlB3M7WhGJvl8IxA5YlsHSJB1wskOTqSLq4GqZF4Aaz5gyO7pybzx1IfuQCs1kBNtXMZ5uDINAg6DerrjvlmTPEiickhXNdVm2rw0RsFnb3YZB/XD54X1RtNtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U94Dr/dGIZWJtxID9zbynnUkPua25RyeVsq4CGIW2Uw=;
 b=bvZSaQqft5RC6RZEvAyBEbARCVGQ1GCVkbPBbY0WCBdnm84cPGypPjo24FFHpJJ4+N1Xdot9mfzopJkeSCeihmibG2Ci+hkd7iLGkkseq63aVG88nFsdyzhN62cBS3K6nRMn0+Rz0RjFtz7rgkIcaFfb4I/PsGQmLO/WPPzu3kk=
Received: from PH8P220CA0054.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::30)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 23:27:15 +0000
Received: from PH7PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:510:2d9:cafe::9f) by PH8P220CA0054.outlook.office365.com
 (2603:10b6:510:2d9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 23:27:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF00000009.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 23:27:15 +0000
Received: from quartz-7b1chost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 17:27:12 -0600
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <tony.luck@intel.com>, <x86@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH v2 2/3] x86/mce/amd: Convert bank_map to a bitmap
Date: Mon, 23 Nov 2026 17:27:00 -0600
Message-ID: <20261123232701.1923094-3-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123232701.1923094-1-yazen.ghannam@amd.com>
References: <20261123232701.1923094-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF00000009:EE_|MN2PR12MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: 74921079-4f64-4fa4-1885-08df49b94ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|10067099003|11063799006|56012099006|261021121427099003|261022105027099003|261009223027099003|261021123027099003|261102123227099003|261026140227099003|261022075727099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NLE3sBADCJYZW2iFAWFt1PrQmDbjo9cqXLOGMv/0Id6q7zKd26r4cvC36HUh8eO8ZNphXq7a7cQsiZFBULyu0yj85XPeOoPzK5dO7fA0WiF/rAqiryDXJBh9Wxf8/Dcd/90pmEbwAaN6DP04KGjW4f2vSxpjm6JFGsJ//EFCNvYebBnIf8wPditDrKScuRovgCTJ6Vpo3iRj+rzdJiiMJNdo9OGcv6+UgjAqT2NW3IIkjKL5zJ+0Bor0OUPiY1nEItbgysl8W+reXgAQ4qE7qU+iDtw92KfW+ZgZPx7OQ/c1mergWpVXvgd3xm+PbFaIgPwaizR/nRZbfhKPwVlqtj0CSrCKdmAaMnfxyZ6rAoqOjxgqxzGnZ1/60vTyuJnI5gRjUaf3vRFOvg2QchhJyv+VWAuv1nkmxP1146l+y28TC7Z25eJxTY8tucrmHHBu8huU+uS2DkXJNcc3lGwyOP2H2XkO3cR1C1n7yz6OEk/8K+UVkNzSTjbR3091Eh2bpu9ZLeS6WtKI4w1lXQTzhgyMYgKrCAEKsfZFC25MaPnwu/bEdyQEvH08B/b++EQCBargB4DR+f7nTcjqfSKJjmJ3Z4HbWzFy4J38nHPuVAkiXcHNqaBI8o4pnrZiHYsKYQOdijnB7wlR/iJuc7NFWpqOfGTn+Lc9/7sdZo7Vcx8RG5XfuUYIsRfnBLq/HJ/KsjZ67GjRr8DgJZZktsmaqA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261021123027099003)(261102123227099003)(261026140227099003)(261022075727099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JCdbv7Uyxjeohn2mXEWBJ5RHWLAQbLLjUakkAYL/nfsM1LeouVxhdxoe7KSFg0y4XixhdFB/OLros+lmB0cHbMX05NR8dJpRTxXVt/kTiahnIRRccUL/RdoSij/saBCDyKwCRYNpz2CTuaroX5cc9wnwMNxxrENUsMPLnVHD6iq+drXjSlQpctzoKq1BlRbi1+87rMS9REzOXikbl3IXsXm6PlYojZ2HiSlzn8LjPZyiuqVf7QEoX6RS9aO6T3Ds3dCleooiStpdxKhzb6wUZk8uBVduMQjPNxOmIBIgddWjdgRB7qz14NG0z4u+xIsbJxjqz5F8GYeHQTPfhtyXAE7+AqUhj+1Dzqvvnw78IwZr2fN86xKgEx+NhRHtVzXDTtb9dzaj6uf2KtV0/hTf7dFdT1uXog5TbEqzz06Gf7S28+RAjIwDpG1gNB6xeL5E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:27:15.0059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74921079-4f64-4fa4-1885-08df49b94ee3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333

The per-CPU bank_map records which banks had their block 0 prepared
during mce_amd_feature_init(). It is a u64, so BIT_ULL(bank) is
undefined once the bank number reaches 64. That caps the usable bank
count at 64 regardless of MAX_NR_BANKS.

mce_banks_t is the existing type for per-bank bitmaps. It is declared
with MAX_NR_BANKS bits, so it follows the macro instead of fixing a
width of its own. thr_intr_banks and dfr_intr_banks in this file
already use it.

Convert bank_map to mce_banks_t and use the bitmap helpers. This is
preparation for raising MAX_NR_BANKS.

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/kernel/cpu/mce/amd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index 255d09cd8544..a0064c26221c 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -263,7 +263,7 @@ static DEFINE_PER_CPU(struct threshold_bank **, threshold_banks);
  * A list of the banks enabled on each logical CPU. Controls which respective
  * descriptors to initialize later in mce_threshold_create_device().
  */
-static DEFINE_PER_CPU(u64, bank_map);
+static DEFINE_PER_CPU(mce_banks_t, bank_map);
 
 static void amd_threshold_interrupt(void);
 static void amd_deferred_error_interrupt(void);
@@ -572,7 +572,7 @@ static int prepare_threshold_block(unsigned int bank, unsigned int block, u32 ad
 	int new;
 
 	if (!block)
-		per_cpu(bank_map, cpu) |= BIT_ULL(bank);
+		__set_bit(bank, per_cpu(bank_map, cpu));
 
 	memset(&b, 0, sizeof(b));
 	b.cpu			= cpu;
@@ -1274,7 +1274,7 @@ void mce_threshold_create_device(unsigned int cpu)
 		return;
 
 	for (bank = 0; bank < numbanks; ++bank) {
-		if (!(this_cpu_read(bank_map) & BIT_ULL(bank)))
+		if (!test_bit(bank, this_cpu_ptr(bank_map)))
 			continue;
 		if (threshold_create_bank(bp, cpu, bank)) {
 			__threshold_remove_device(bp);
-- 
2.55.0

