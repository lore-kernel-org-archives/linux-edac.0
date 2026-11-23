Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795476496;
	b=SF/+EH75wRMqZxxG/JjRlwIKcReswfL6K9rK5YRU0Sn1kpYN/CNVHXyEF01s4gqfH5Dw
	 9jyoAS2SWCbqmis0clSoxK34a2ioZlS6FqmQtpvHTSCRqf+znlsu31ulz7FFzrTUjZmyb
	 HQ5Mw88wnuH3mZUGpRT6BWjCzJPffVmOvmZUZLm8ZskQCN7PSB8ecNqPrArU5m/p1Yq4R
	 KV90FOetQUIIZsiGVA38qLNhW7AmzYe0gm4Lsz4RGYOwSBjJdK/kUPP6nD2uSsqG37CQ0
	 5JCVkUE0nrtZ6KVWIJhc6A287SFxE2f3Iqz1+o6g85UNEbd7jBPfwp7hDJQOJP9HqMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476496;
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
	bh=dNeNX5KHOuGMUwfAKukFrE4Y43K42FGPr/FFdQpmnG0=;
	b=VYpxUowhulFr/FkSLW91dg8h43oKt3C2O0cUe7gwoTdIa9wwmRBWnLpC4b1U1u4UuN2G
	 cypoHhCaNTxuj++OLD5lL5GX9YmVYp3URJ94vHnNLqk5dbJvgVKyfDr2MgFQG0K18WJuP
	 pQHyO6BNAlY81asV4P2Uo6HPZjNaQeXZAJeB4nUHnv1rJFpoSt5r0zqZFIeRsypBBl36P
	 BTenDoUvRvadJQ5zSFr+9O6A8lOClHJepllRbaB/H9HzZjUZQQTPhbltRGdL7gnvBs0m1
	 6A3HL6r1NJrCwEhJlcQBow5xmdPsVnk2qU0GHEUbip4MEsrxTvkZIWZ9PvvsU6P3BwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=R+sGLcjN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.20
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010020.outbound.protection.outlook.com [52.101.61.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5C8606A330;
	Mon, 23 Nov 2026 23:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5C8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=R+sGLcjN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdcPnJo2gW+pKhbID6bBDk9PmOhpnPpuOmBiWkrDPbgbMWNQLwx/+XC7wjAdCUG49f0M+MlipViMCejvgIGybn9jq+6v/muZXiSDLXxQvPuUWyWFpPHdK+w4J6ChrrAdRms9IhnMdidBhMXw2biu156DEoUCsHQuBGLfDJrCbDc0Ai9SzRGPN3hJT9ndRXqTOOrUtyuqo3sDA7ecMQsu7gqucfSlAJE5IHWTAbjTnhJGPf48gngH7SGQiNh+fmDrlCTIckZLm3XYd7k10+2id0kZpC1U3TNCgwklFRbZbGR5QTwTsYazTjJTSzbYgp7Mq8Un/liL7XaMbwqOT9xrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNeNX5KHOuGMUwfAKukFrE4Y43K42FGPr/FFdQpmnG0=;
 b=Yg5Y5PkGrzE9gXlQri2+TrYBU3EofdYoAgTzL17fxVDc4PxPhDi5CLSFKqCXQutb8eBLs2q0eynpMndGg4yMBBfEhTC+cATiB54EpUN2XTeqZFoYTZHD17FfGbCMMF9gg3jG/LAuAUdEVfN79Ek13H1P2zCUFFqrGjQwNFoBdTKddup9psqCYmtBrk+cwu2ILMtqDmTDjg8aXK8kRVwS7At4yopEzA9N/sce2MYgBHHcIeCfmZCUgTYTOdLxxV9Zyx1wjsobFNJynTPUu3Uge8Ik8atg9KfbTiHXYo12hBo49Phtf0Bl4gn37o99r0rLY6MnnlT/8s+YvkassJ6/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNeNX5KHOuGMUwfAKukFrE4Y43K42FGPr/FFdQpmnG0=;
 b=R+sGLcjNlMWCOGlc/6/Hh3u47C8WmaP8PpNUnVHjLw2DvI6MxJ5mFI2UTv2OusFYuZeTZ1beKpC77PmkzQUym+SjTTPES/OsbKS2/9pnj7RcGVOSNG0ObQImv9DSSluckKU161sxlbCPILidRlmVul5+VT8Q94OW3t2hR8xk3XI=
Received: from PH8P220CA0037.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::9)
 by PH8PR12MB6843.namprd12.prod.outlook.com (2603:10b6:510:1ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:27:17 +0000
Received: from PH7PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:510:2d9:cafe::27) by PH8P220CA0037.outlook.office365.com
 (2603:10b6:510:2d9::9) with Microsoft SMTP Server (version=TLS1_3,
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
Subject: [PATCH v2 3/3] x86/mce: Increase MAX_NR_BANKS to 255
Date: Mon, 23 Nov 2026 17:27:01 -0600
Message-ID: <20261123232701.1923094-4-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF00000009:EE_|PH8PR12MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5b1bcd-e712-4429-e2f0-08df49b94f40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261022075727099003|261022115727099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EgR+wcAhyaWlG6ohszAaz3j+rLm4hiplQeLgAFdoTJtiGpMSxO6UZHRBoFAw+oX6uZT3OjLOuROrjGI/gKGju3tjls0XQz0yk5MsFserwuWDkK6nZ++a2C1zAm5l03bA/7Ai+DuxUE2L3YenS4kiplAFVtui8+O7FsMwpDMMCb+zMxsqN1qvMFeaBVX4f4GqgUOMEBJtP14kvoeifGN/1g4wFqC2C4uRgeLuwVqVSYnGeo0h+BmvapxfPI38Bledro2ofDzUOJ6hqTYTvFHp6WxuW7LmyFJRk3v126dWweEmUDXWXdyQBkK9bkdBZWM2JArR//dTGK20ha9pgoH+fKuO8Dys8mB4ij01CW3z2CjqQau1+AxFNsWjw+uLM6uq47FBXAERKygSsuEIFTQO2KBPgA5cmy/gS/wdqm183G8lFW310cmWl20uUUK/uJ7q5k5h1PcfMAtlr1l/Vja2CkSyb7J2OyzEpdvA29wxOb5CcCW+Wlxsf1p7Hs7eTnufl28ffjBXih4KHv/Oh0d56Jwu0fPoBHBexsQRUoP7XGh6nicXjY+kOsme3up6k7hk+lcrbTn6bM8OGC9Qyn0tVF9+lUUSZoAdiojWDBNoSGpRPOV0bAuOWjXD3DnjTiUo+W7ili9mz5HrgK08ZF4kTiJ7iedw4cGXngF7oyGTtMYAViJkQ7WjqqtyNo9FVGUTs0B4mdm78uftebW0Qxhc+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kicX2KsRgy9ARDI2vec07Dk8cBQgs7GYWGTt5LfOQ4tT4YPlVqrMWR1Z5tau6tA8WOmRdiMyghSdmnkCdzh9tNNAZwsY3IsMz9eMyJFneUt1A8QZ6oSuCbgTySdmX4awH2B7dAmRfnYftuoxzMat4EnlRFITCi2211JS1yY5SCIjGaAvgshiM1f8Auc59ZXn89gGj1nfku5m8PCZujCk8WOh4lmchmMCkUWsCwGHk2NNPcS7WTuy99ptlTSgsx5w3za6BCsOOSsxMs5NcZSjg/TECfEnnCKOUlHeyoLp+3XI2gH4dUnrf4j/tWEUy/G9X5UY8pHwmz+TauUTt+BKvGesqALqunuzmOXeVa/WKpQr+QBuhP+1+D+kmSrjzvI1tGsWqbo4QLzItz11tnmw1Tx61CIfvZBnhmwSC6beHslTUwlozCnCfXOz27Fsh9LS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:27:15.6219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5b1bcd-e712-4429-e2f0-08df49b94f40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6843

Machine Check Architecture (MCA) allows up to 255 MCA banks per CPU
thread. This is based on the size of the "Count" field of the MCG_CAP
registers. The "Count" field is 8 bits and holds the number of MCA banks
per CPU thread. So the value range is 0-255.

Change the MAX_NR_BANKS value to match the architectural definition.

Drop the clamps in __mcheck_cpu_cap_init() and cmci_supported().
MCG_CAP[Count] can no longer exceed MAX_NR_BANKS, so neither is
reachable.

cmci_supported() now takes the bank count from mce_num_banks instead of
reading MCG_CAP[Count] again. mcheck_cpu_init() sets it before CMCI
is set up, so the two agree. A CPU that skipped MCA setup now reports
no banks instead of the hardware count.

MAX_NR_BANKS sizes a number of arrays and bitmaps. Growing it by 191
banks costs the following, measured with size -A on the MCA objects
built from x86_64 defconfig.

Global bitmaps:
- core.c / mce_banks_ce_disabled
- Total: 191 new bits = 24 new bytes

Per-CPU bitmaps:
- core.c / mce_poll_banks
- intel.c / mce_banks_owned
- amd.c / bank_map
- amd.c / mce_amd_data: thr_intr_banks and dfr_intr_banks
- Total: 191 new bits * 5 bitmaps = 120 new bytes

Global structs:
- core.c / struct mce_bank_dev mce_bank_devs[]: 56 bytes per bank
- intel.c / u16 cmci_threshold[]: 2 bytes per bank
- Total: 191 new banks * 58 bytes = 11078 new bytes

Per-CPU structs:
- core.c / struct mce_bank mce_banks_array[]: 16 bytes per bank
- amd.c / struct smca_bank smca_banks[]: 24 bytes per bank
- threshold.c / struct mca_storm_desc storm_desc: 24 bytes per bank
- Total: 191 new banks * 64 bytes = 12224 new bytes

Section totals, which include alignment padding:

Total global size increase: 11152 bytes of .bss
Total per-CPU size increase: 12368 bytes

The per-CPU total is replicated for every possible CPU. In the linked
image .data..percpu grows by 12352 bytes. The first per-CPU chunk is
page aligned, so each CPU retains three more pages, 229376 bytes up
from 217088. That is 5.7% more per-CPU memory, or 6 MiB on a 512
thread system.

On the stack, the two bank bitmaps grow the frame of do_machine_check()
by 48 bytes, from 232 to 280 bytes, on the 8 KiB #MC exception stack.

One module outside defconfig also grows. Measured with size -A on
intel-bff.o:

Module read-only tables:
- edac/intel-bff.c / enum bff_bank_type dmr_mcbanks[]: 4 bytes per bank
- Total: 191 new banks * 4 bytes = 764 new bytes of .rodata

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/include/asm/mce.h      | 2 +-
 arch/x86/kernel/cpu/mce/core.c  | 6 ------
 arch/x86/kernel/cpu/mce/intel.c | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/mce.h b/arch/x86/include/asm/mce.h
index 9995176d6879..e5fa0f58b305 100644
--- a/arch/x86/include/asm/mce.h
+++ b/arch/x86/include/asm/mce.h
@@ -273,7 +273,7 @@ void mce_log(struct mce_hw_err *err);
 DECLARE_PER_CPU(struct device *, mce_device);
 
 /* Maximum number of MCA banks per CPU. */
-#define MAX_NR_BANKS 64
+#define MAX_NR_BANKS 255
 
 #ifdef CONFIG_X86_MCE_INTEL
 void mce_intel_feature_init(struct cpuinfo_x86 *c);
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index eb0e51ac80fc..fa61ef6affc2 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1841,12 +1841,6 @@ static void __mcheck_cpu_cap_init(void)
 
 	b = cap & MCG_BANKCNT_MASK;
 
-	if (b > MAX_NR_BANKS) {
-		pr_warn("CPU%d: Using only %u machine check banks out of %u\n",
-			smp_processor_id(), MAX_NR_BANKS, b);
-		b = MAX_NR_BANKS;
-	}
-
 	this_cpu_write(mce_num_banks, b);
 
 	__mcheck_cpu_mce_banks_init();
diff --git a/arch/x86/kernel/cpu/mce/intel.c b/arch/x86/kernel/cpu/mce/intel.c
index 4655223ba560..fa63f864e4ad 100644
--- a/arch/x86/kernel/cpu/mce/intel.c
+++ b/arch/x86/kernel/cpu/mce/intel.c
@@ -95,7 +95,7 @@ static bool cmci_supported(int *banks)
 		return false;
 
 	rdmsrq(MSR_IA32_MCG_CAP, cap);
-	*banks = min_t(unsigned, MAX_NR_BANKS, cap & MCG_BANKCNT_MASK);
+	*banks = this_cpu_read(mce_num_banks);
 	return !!(cap & MCG_CMCI_P);
 }
 
-- 
2.55.0

