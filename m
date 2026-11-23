Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795476438;
	b=ZnuUGadqn5FwOIt6JCEmSh9diXOuJpLdi43jqMpnq6mp0WLM4J/gRvMqniPf+Z0QGUgx
	 qPuJyvCAUOXgZggdK4bvOsM2u5Ugz58fLzD2U5QlB8hCklXxEB1ejAQ4t4C4GRbUpoNgc
	 J0Y15jwRxZbpY8iIhkGBEmkon39jXg5fCKvlkxtw7vJkrExSEDH6UvuL70vHoheaR+Fs7
	 kfgamMtMDmLhhzN0cJVoduNFdplDwZ8EurZ2dj1S41jNJ2749fagAfQRB81c5JMR3IFNR
	 pz624HgNgv0fcfSf2HoF7GpC7E/2jhesv6i7JINUq0SvND2n5NYJ5k52CaGdst7L0Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476438;
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
	bh=nPLH3Qlo9gywOpY9AmdDCGWLOxF90d8lRHssF6914YI=;
	b=XPqIOcEVtbbdGOAoTS2dsp/TmO+WfNYHImlf7LJqJvggKMNGgSzYWMvDGhm40xBQ30It
	 ATtXugD5DgKV4qCnwess+xajMf/bBh3FAw5EIebAXovxMSfTcragzrHQwnZyoSIzq6BJm
	 9c0pxadJqngYQp88WE+0HvQ7nlIKjQIWEIIbJqfjp5lINVyhypuD0FWON8pwdJZw1Voql
	 idrByjRJ8+SYAAufuZ5QOBsg56sbjwW1HCJ0Cl77ClHSqk78VaHvxanEocrQa85IpMcx5
	 A9i14EXMUIaEsPAXUL4OKVwXdV5LR3oZhRinmFHf1swUzxyQ2bNn28uaAVxG5OivjSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=utMn3FfD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.22
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A70606A326;
	Mon, 23 Nov 2026 23:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A70606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=utMn3FfD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxwVLozsSTR6ZYUV1JhQPiUMwVWJ3CI5op9bephL36h8FihRjlCfKUEFAD3CNpGNLTUq0CTfauyLyHFDUwfK7suFAMXJADVaXVhHv1YacZcU51Mp3azzBXyipuuSzWwgkCV9lkBSjR8r0FZ15ngiUqzeMiXwa9sCsohQz0dK8lBWodPfCtuRw0/sIvTPvrWdztdfKYf+G1H2ngWUZW+O8/yARTSQIz9a00msJ8LkUfUDr6hmTHyg83GNyiiE196fC6xZRzhA3ztk1WPSy5hCsgH5vlx4n75eX2713C5fo9OtLLSmuOBbA7F+gYBDdIlLlVLDp8XfO7SrpNboKUKelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPLH3Qlo9gywOpY9AmdDCGWLOxF90d8lRHssF6914YI=;
 b=E6XPZilMFYmMdSuB1bwRbDAHGO0mt1rHYO7pq2EAX9HHKmshiRZDUeABMWv6DVPcXe8rd0VJCoDYK51YwWVq1rL/gmRaEJQisk2obcn6c0nO9amN0tU8ov3oJxOUnMyi1kim+3EIIsZt3wjg9Ay/97Pdg7rDAFe99w0zPrGS7Ncix2KigZ8M1JVaka9kGlrpggwLIcCZ9ehP1iB3d3EFV1xhCQs1S3C6YkkM+3NUIqO2rUlc/+JI/waVHrBJCyScaEpwLivoZ4Xzhoa+UsBMtIHtR3l5KMGByRtnf157t0ReO5IapdSmvzer4K8DpkLKiiVKAYnmuQQO+TIT0dWboA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPLH3Qlo9gywOpY9AmdDCGWLOxF90d8lRHssF6914YI=;
 b=utMn3FfDIseW2SD70pR709CiH2M8ICSioEiVT2W8b8PepOm2SFsJKFFFEVIV5SSDTscRD4TUgqIlzIm5VIrSSforP1/KAsfiVhfaY3b3LJUl3qj65lydEffRWjhu1wZZT553s21Anu2513+umP4wYR4SElW+1KvPz4sP8tqA4Ks=
Received: from PH8P220CA0058.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::32)
 by IA3PR12MB482642.namprd12.prod.outlook.com (2603:10b6:208:712::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 23:27:14 +0000
Received: from PH7PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:510:2d9:cafe::a8) by PH8P220CA0058.outlook.office365.com
 (2603:10b6:510:2d9::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 23:27:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF00000009.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 23:27:14 +0000
Received: from quartz-7b1chost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 17:27:11 -0600
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <tony.luck@intel.com>, <x86@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH v2 1/3] x86/mce/amd: Fix bank lookup in amd_mce_usable_address()
Date: Mon, 23 Nov 2026 17:26:59 -0600
Message-ID: <20261123232701.1923094-2-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF00000009:EE_|IA3PR12MB482642:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d99b452-c92e-4f27-3728-08df49b94e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8ktBFBkPlpiOQCgfZWcdOl1ULgl0IVxCCshhvRBhk/fwmzvGQ9d5pSZhZxyczBB2MagpJO7Yjg53L+4Xd+xgYL5flTlBPiGdi+F8JIgi4eFjNmQ/KT4WKve6lqKVDSKTzRE4zPMZRWLKeP5OXcMB7drs6/4J6HCw/tgQCjfKLFzRPb8vXQFcSDtXqUhcHnMOwieR2/ptYQELSM6jPPy4TATCa0RXa8bi1w7Z0gsuBSgfpc8y5cVKvl36c1/Te2WPLWCoOm8bxTr4Ekwh8GMVDpjaIH3rMsiBrADhe9wDB+vP/86JjzrtN/y72FS9Mdl8Q2auH/jAfvPiVv12RkTNn1/72QswzLX5VfngNwDupxzrckCUhT/q14CN8LDivNXh+UchZRajVjvgTrWa4Z2tLeCuJczZQDHD4ccQu5WGQYafmCya2VU8c9qBJn1gAr+WCFnOnMnq5NBrybN8ioEI1DBjquLDzm0RU+upE/xiqlaSxkhzbs0Oj70pM4tKVmLoL6ppYue/qEOeb4sf+N0N6yyd/oogiOhlQj9+XkTyoh7C9nXiJROfgFzE2AQi4H6ijKdtXNlFvD3+HtKVDRn7nehnkSwqVxxpv2/WjefCbUIKezp+yz3K+1abFO4gea04B6hAo/rMl8bmYTTeXiD/D/cemDdGvRCB8H6FELFgdHZYHTW8R/C+6q7TBYndH4IEMrbjdHh3S06fubOGHjJqcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qc9THteR6e5OKEsf3W+Tg+RMBRx/3BjvzJY6AECEOthtJAdqnLp8QCLJ3TGj3ncZBYtJodFFLCRruwGSTpwhFXQJffWDRa3ATloW/sDmRdjDXEO4QL5+MYaEsjszOEWKMduXI4ITXYU3wGU9iAO17QWwr6r+DWMR8VaHaH7ECbJjygFpqW3ydc0CQH3zVUQTRS+Nse279RNO1ObCg1vgLTUi09r9EQvjluiGtkel/jQnTicEWWayhpNsG9yX6255uwtaFKttFHxnrJ0mWWxTnyghqozwHGOD3PeFN6ybeACLyEzRBnBm5OVxvQY73atgh652yEllETsyCt6UfMPpgkIsN/ZA1XF8yx4RaTvEP5ip1WoHcP/vvMFzaPO+fJ5m+iSDpVg5Ut+3ooKRz4+IcHmLQJGovTECul2dfuBq201vzikKtEPnmI8zWYdrvXIB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:27:14.1107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d99b452-c92e-4f27-3728-08df49b94e5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB482642

amd_mce_usable_address() reads the per-CPU smca_banks array at index
m->bank on the running CPU. The index is not checked, and the bank
belongs to m->extcpu, not to whichever CPU is decoding.

m->bank is unbounded here. apei_mce_report_mem_error() sets it to -1,
which is 255 in the u8 field, and apei_smca_report_x86_error() takes it
from a firmware CPER record (BERT or GHES). Both reach this function
through the decoder chain, which runs from a workqueue on any CPU. Bank
counts can differ per CPU on SMCA systems. So the read can land past the
end of the array, or on a CPU where that bank means something else.

Use m->extcpu for both the bound and the lookup. A bank number outside
that CPU's range makes the record inconsistent. Don't act on such a
record: report its address as not usable.

Fixes: 821f5fe4dbcb ("x86/mce: Add support for physical address valid bit")
Cc: stable@vger.kernel.org
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/kernel/cpu/mce/amd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index 1cc20b855b7e..255d09cd8544 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -837,7 +837,10 @@ bool amd_mce_usable_address(struct mce *m)
 			return false;
 	}
 
-	if (this_cpu_ptr(smca_banks)[m->bank].paddrv)
+	if (m->bank >= per_cpu(mce_num_banks, m->extcpu))
+		return false;
+
+	if (per_cpu(smca_banks, m->extcpu)[m->bank].paddrv)
 		return m->status & MCI_STATUS_PADDRV;
 
 	/* Check poison bit for all other bank types. */
-- 
2.55.0

