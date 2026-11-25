Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640115;
	b=u4rRdxGarwTPU/qpkfkcq0jsBm2hHmtMHG1VSDrIOcGx99ppZ7cJJ783PopB+iX6+YSn
	 zxKsnGdHwggaeusyUoY1Q91Tao/LrUCkIw/iSXv0ve/B9iKyACAC1Tokg++QTaWqIERZY
	 HqlltsLRe6pW+Z6X+GDpr8mMZnA9DwQvfm1V22lUrDqrD3ioofkhR6wVxEfZeWAdo6jIu
	 QXUEmF+xNymmi0N8JMsqIj668FLxJRs4BbFS39PNZYJEBfq8H57gcXrQv0LrhElmtPYFr
	 ryLYcyXgVOey1any/QfesDW6Zdp5OWPj58YC/J6gwlfTL1zB/+5Ug/h+hJof57VHtbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640115;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=V/cx5L4f/PoiZFPyjGFIU0TXAgJaDdimkyfCnQq+YKs=;
	b=Af3Ol2o1YJtvCYTC3gfwc5ZR9qVmIzE7FDErKH4k3cfXSoF/vzyQp6hJkGwqh4SI/ess
	 9yHFY3hq6PFG5zAJvkxMV9r5DkeSjetQvuesLXo+S1w0uZjtP22MGm10Xqt8gGTfpF6Nm
	 78xNIb5PHKWi4uzNxXw4DobASEb9r9tp7XhzCrxsZGUMEMoxgW4EdL/MBkm7Lj5Ng4LU6
	 et0+7+iOx0y4QoBuaOy7jXF07hUNu4KWk1SsoRGuttdhojNwQBMRcLV21k0UD5uMb8xRD
	 UV1I0vgDx9EQ/esvkV2FWw4PPxqJFBlrM1OpUZhoBzs2nXegJtJV1z68hdAw5QgE6BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="rk/YmTCe";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.24
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA1C606A31E;
	Wed, 25 Nov 2026 20:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA1C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rk/YmTCe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GME1k3BX+BAKFimBnxOpNtIjc0abLdRqoMPUp5mGdwK9eakNr4Oa3ylLqQCbSH8MI6cCaUwqzEte9iUw3or32R37jH2OE/mGFCZ1psZN44SOKUBe9kaLqArC/JwQiH/So8YRF5knFnPKNXVslm5Jp32ahi78GGzuH4YIODfYDp/hgSp+x3sGHa5cEXf2UUbK2KAmFna7ShB8wYa4BUj8xCZyoVfs9YVoGTV8jCuYmiFzvzCtOZo8C9x7twD7CIZ5QdYA5ykVKaJGOlRk0uwzq9jpNZjsGmmfNINd4Z7jB57Wyk1TIIEjRTk1clrCgWp2DWpwMMGICkcNZnt42vqifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/cx5L4f/PoiZFPyjGFIU0TXAgJaDdimkyfCnQq+YKs=;
 b=s/xOgAZ5ejiFdOMBb67EpSXFRZEePv3J0eidft+6pXLZqngKPaxLWCsi09JHxy6dlqrzCNe406THpQ14d8RHdstPZSuFFrITcj3CYVqvzED5VEj18fMTHQ1E69XIXybphoRqrNg5OuFRMUlS41PSWLUuX0v5RdOCpLdV3RiLlcIm29pislk4EIcg9arDnjyJkcHeh/Wx0VLWjHoJ0wpbsE5zYwMlcnwW+glwRqx84VUQCTLyFubKK+KylsF5rBkV4jjY4+3IYE1YT2usUnUfdd2UAB56XxzbvXDVnxUJo5KCrLHXy1NLygjowPLV92ywJYtnofjVtIMiM5+FZybK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/cx5L4f/PoiZFPyjGFIU0TXAgJaDdimkyfCnQq+YKs=;
 b=rk/YmTCeeLUZls6w9tb++B+8WwcvXJ71+VejgfxPseJEs3qGx0oJZgnInrL9efW5IvTZE65jmJVWDui7tXlgdv7pD7FvJadPs/r/9Jcgeq+A1lYM0SYbyLAoOWKjkt6n2GYFnzAyVqlQ72vVOfvX6jwIl0rzmyWZcPEBOFULvp4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15) by CY1PR12MB9625.namprd12.prod.outlook.com
 (2603:10b6:930:106::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 20:55:11 +0000
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167]) by EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 20:55:11 +0000
Date: Wed, 25 Nov 2026 15:55:03 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv4 3/4] EDAC/altera: Add support for Agilex5 ECC manager
Message-ID: <20261125205503.GQ2156781@yaz-khff2.amd.com>
References: <20261116202854.3087673-1-dinguyen@kernel.org>
 <20261116202854.3087673-3-dinguyen@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116202854.3087673-3-dinguyen@kernel.org>
X-ClientProxiedBy: BN9PR03CA0401.namprd03.prod.outlook.com
 (2603:10b6:408:111::16) To EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR12MB923140:EE_|CY1PR12MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: 225c68f0-d3f9-42ce-7976-08df4b36657d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|18002099003|22082099003|261009223027099003|6133799003|261022075727099003|5023799004|11063799006|261026121527099003|261022105027099003|261021135927099003|261026140227099003|261021123027099003|261028144727099003|261021121427099003|56012099006|4143699003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	rXGPNSEFdiWF5lhwKaluWXomR4vLimk6ZgShm2WVkktBglFssTcr6fft42qYz0vhEwTD2WBaNfZKiZEmq5MPp7FM4PlRiHQ682FynS5aVB6AudQGP1kINg+CELj2ulItNSHI5mfYzNpCwAd5TDy9pzMKtk6odgBb7q0Crv96NzBRJ5RBf6zvsVGm2olGVIYljVpcan4kOe24HjdtlXCh5e8RzsNzanMhGNuo59bn5HRL/M4bRqTHTY/EPQGITHII8eC98HifBGR6N5YL9kebzhC4LAzVwOy1UsETMbFyVEa2SA5IIkaVmhQmTJUt3b0e/A86IYIQ0+iNP12Z5wxFppXsZJL28I9Jd/0KsKo0WoSvAlhlZl4Q5Gf1cs5QL2FcTSkzm1IEb5MwjgCx4I/ivt0nmCf2xFHJu+bff8l5AK1EB6AGyeOR8jQ6+0ner+xGKrrgHT3U68PGM/c1PWCWNDgW0TiF4sqUqLHptpSVekIpnBahxMk1hmaGwHOYPJQxzEoy0Dj2WNgFMY+AAG4otJJf88jP13PmsirEiOi+4TvMJX8LRGigg/bji0PwEwPzIn4rm/KKICD7+slAicRYdbGhrGs5JeSKl2SHpuwvWtzERZfw2kOPb2FvgvPZ4a6xqvBjO4LPY0QtuKj3flJTR5B87LxLcALPnPhjG8z9eCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EAYPR12MB923140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(18002099003)(22082099003)(261009223027099003)(6133799003)(261022075727099003)(5023799004)(11063799006)(261026121527099003)(261022105027099003)(261021135927099003)(261026140227099003)(261021123027099003)(261028144727099003)(261021121427099003)(56012099006)(4143699003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T+sRvdcgA8cyHboX7B06tBmEFZKcII6/YA6mXDPtfhQJCnSjGv70QcThwK4B?=
 =?us-ascii?Q?/knwp2gqnZYvyXFtr116E0fcoQ6A2K5pgZJI8Hnm+oCDcQLl707iFMN9mzVP?=
 =?us-ascii?Q?WDeenkM517MwE30Z+EMHrvzfiWFsMx8KmpchRTuf3IM6lLfedRZ6HO8NJtxy?=
 =?us-ascii?Q?8wzmmk2n8wMRDcGJ7XTb8Woa9rRDkHFQ8tBkrTD1D29qnEzG7ZD4LkGeH2Dh?=
 =?us-ascii?Q?3wTpUg2UX9ajYJzBv3/WhsPv3swWBgz7eaRhEmChJYrELm43xpruwruFxTfa?=
 =?us-ascii?Q?as2MXoSg0VtSFhPX+gqE7w9bOEaKVWHFPUuYR9O0tT8p3HAEishJ5FVBxQ9d?=
 =?us-ascii?Q?3rxrMv9gNRApKMo7uo5OHEHulDM4bQ4ZmihYkVlMdTZ/T9iLu5amblapTOrl?=
 =?us-ascii?Q?8QyUR0dfaAUpiMFouAr5zQvkbZ9ExuEXJMGAOze+ttEONxBv6rCHiarC8KR+?=
 =?us-ascii?Q?6pMlAvgBjzQtuwugTLdgcO7hPOw5+jyG3O9/Qbsos1TwX93GIKQ4Ubr1fwcc?=
 =?us-ascii?Q?A6nlyBtum2CD1LAt85xMBSW7QeX7/VCr6C4OSD8mDY7EMUUN26Dy2aGuTT1s?=
 =?us-ascii?Q?YH+GoNGdL0PCrYmh+qz9QsZL9AgvE89S+jTlotwiSS9eK6Oxk9fwZJb1jKXu?=
 =?us-ascii?Q?BfejMWp5S7IviSqK9kfM+2u+hnpJSPa8lnqkVJDY0LRa1iCNGmW3v3yQo5ch?=
 =?us-ascii?Q?1rebqLbpdKn5cWEogCLScS2njD/HuesoTF8OWIEHt9zPIUzTba2v+CQts4P8?=
 =?us-ascii?Q?+HGzmuwiWuoPPX16qUQ+H1aO40+axBLmvYATkpzHhmlHwsIJdc9rzGZiRyY3?=
 =?us-ascii?Q?/vc4ICMRDgJp4Pb00Tn3I03hrlPbl234CyLhqTFhKEZp2fio/D9IZ7gFg5wp?=
 =?us-ascii?Q?/dfcq9j74KGjsOmAD/GvYayWLYtLMooJImM1g+cKBuxZiSfQSgm1sfwuFHna?=
 =?us-ascii?Q?och5q3jOhMLvi/tk+jSjsebO31m1eUrSAEjT8UwH2Sj+2MEG26vhrcWmKcMC?=
 =?us-ascii?Q?ug3j2JBFKRR/hbhPAPg3Goc8M9sXTeCg8gj7Xi0eN0SjS52MMuoWEDwGZT6f?=
 =?us-ascii?Q?dGuzePNHY/8E/pW1nK2ZiKkX1sXg+g3vGcHy6eXoGb1DbhihLTPMAPrv+UHb?=
 =?us-ascii?Q?QAbj/tkdwNwp0g3SGAnR7bYiBbWUOzzHp+IRfK/K8NNbNeuzHRLlBqGXlmCm?=
 =?us-ascii?Q?Ako1aF6c/n6oOPlfSMS8IjkKzTYry7hcrQZMiB1iTJf5HCWaJqwStk79L+CW?=
 =?us-ascii?Q?DXmXr71zR+5m++Y/FsRNORHYSU3YI1LpS2ys2cHVz+LVFH4l3OmSl4EbYx2A?=
 =?us-ascii?Q?5TGGzh9EjVWhwyduGlzXwFiQGAKOSaZPEAqUwIY4emZy309HSyeKEPsKwfC5?=
 =?us-ascii?Q?LUDjJ9e+4ahT7h+z3/oFh9ZopYqJDaGzzfwcxKVIRny1VpoD8NRhzFDAuZK2?=
 =?us-ascii?Q?qAa13sdC1lHdTBiT7du1v2qWqWbcQXG21bo1I+dSzVWq6pjt46L5/Fk8RAaF?=
 =?us-ascii?Q?6g07Lv1FE9wCLfZ/c4nEje8ZZRmwwzeeq8rnWEI2QzoxrgYxs/BJWWTM3Uxj?=
 =?us-ascii?Q?DReCkmD97keFb6uBzmF0L36q3h3ylC2QYVbcAIIC29rvR7Wcgrej4DQiQqTj?=
 =?us-ascii?Q?yzgmdGC5LH+Bcv9+9EgWJGJOA4K5YgdU4WOd0m5qpaaQfwO2UM5sYIcSIsEa?=
 =?us-ascii?Q?mqkgu3j3ohBRokUovP1ihHr40/xPJxTYDTB4qW7WtY/fvIZk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225c68f0-d3f9-42ce-7976-08df4b36657d
X-MS-Exchange-CrossTenant-AuthSource: EAYPR12MB923140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 20:55:11.3859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ba3qTI9hELk1HQfpe3DzEI0AxFGOFyFS33fQkL03uQoxqNXJMjnGp0tEWPUbJ0srorLGETPAHlX595hako+xWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9625

On Mon, Nov 16, 2026 at 02:28:53PM -0600, Dinh Nguyen wrote:
> Add support for the Agilex5 ECC manager, unlike Stratix10/Agilex7,
> Agilex5 exposes 7 named interrupts on its DT node:
> 
>   global_sbe    - aggregate single-bit error (chained, drives IRQ domain)
>   global_dbe    - aggregate double-bit error (chained; DBE is no longer
>                   delivered exclusively through Asynchronous SError)
>   io96b0        - IO96B0 DRAM controller ECC
>   io96b1        - IO96B1 DRAM controller ECC
>   sdm_qspi_sbe  - SDM QSPI single-bit error
>   sdm_qspi_dbe  - SDM QSPI double-bit error
>   sdm_seu       - SDM single-event-upset
> 
> Place all seven interrupt's name in a new agilex5_irqs[] array on struct
> altr_arria10_edac so subsequent peripheral support (IO96B, SDM QSPI, CRAM
> SEU) can consume them without re-parsing the DT.
> 
> global_sbe is wired up as the chained SBE handler (replacing the legacy
> index-0 lookup). global_dbe is hooked into the same
> altr_edac_a10_irq_handler() so that the existing sb_irq/db_irq demux
> routes DBE events through the manager's IRQ domain.
> 
> Legacy A10/S10 probe paths are unchanged.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v4: The 7 named irqs for Agilex5 are all required properties
> v3: Use irq_domain_remove() in error path of altr_edac_a10_probe() when
>     irq names cannot be found.
>     Return -EINVAL for when sbe irq is not found in
>     altr_agilex5_get_named_irqs()
> v2: Reorganize db_error so Agilex5 goes last to prevent going into
>     default condition for A10
>     Clean up the commit message to be less wordy
> ---
>  drivers/edac/altera_edac.c | 71 +++++++++++++++++++++++++++++++++++---
>  drivers/edac/altera_edac.h | 28 +++++++++++++++
>  2 files changed, 95 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 78f4a1b0fc64a..c56413cb5c95c 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -2107,11 +2107,49 @@ static int s10_edac_dberr_handler(struct notifier_block *this,
>  	return NOTIFY_DONE;
>  }
>  
> +/*
> + * Ordered table of named interrupts published by an
> + * "altr,socfpga-agilex5-ecc-manager" device tree node. Indices match
> + * enum altr_agilex5_irq_idx. Every name is required.
> + */
> +static const char * const altr_agilex5_irq_names[ALTR_AGILEX5_NUM_IRQS] = {
> +	[ALTR_AGILEX5_IRQ_GLOBAL_SBE]   = "global_sbe",
> +	[ALTR_AGILEX5_IRQ_GLOBAL_DBE]   = "global_dbe",
> +	[ALTR_AGILEX5_IRQ_IO96B0]       = "io96b0",
> +	[ALTR_AGILEX5_IRQ_IO96B1]       = "io96b1",
> +	[ALTR_AGILEX5_IRQ_SDM_QSPI_SBE] = "sdm_qspi_sbe",
> +	[ALTR_AGILEX5_IRQ_SDM_QSPI_DBE] = "sdm_qspi_dbe",
> +	[ALTR_AGILEX5_IRQ_SDM_SEU]      = "sdm_seu",
> +};
> +
> +/*
> + * Populate edac->agilex5_irqs[] from the named interrupts on the manager
> + * platform device. Every name is required. platform_get_irq_byname()
> + * reports a missing interrupt and returns -EPROBE_DEFER when the parent
> + * irqchip is not yet probed so probe can be retried.
> + */
> +static int altr_agilex5_get_named_irqs(struct platform_device *pdev,
> +				       struct altr_arria10_edac *edac)
> +{
> +	int i, irq;
> +
> +	for (i = 0; i < ALTR_AGILEX5_NUM_IRQS; i++) {
> +		irq = platform_get_irq_byname(pdev, altr_agilex5_irq_names[i]);
> +		if (irq < 0)
> +			return irq;
> +
> +		edac->agilex5_irqs[i] = irq;
> +	}
> +
> +	return 0;
> +}
> +
>  /****************** Arria 10 EDAC Probe Function *********************/
>  static int altr_edac_a10_probe(struct platform_device *pdev)
>  {
>  	struct altr_arria10_edac *edac;
>  	struct device_node *child;
> +	int rc;
>  
>  	edac = devm_kzalloc(&pdev->dev, sizeof(*edac), GFP_KERNEL);
>  	if (!edac)

This hunk has a conflict with ras/edac-for-next due to this commit:
4dd10fbbeb9c "treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family"

> @@ -2147,14 +2185,32 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  
> -	edac->sb_irq = platform_get_irq(pdev, 0);
> -	if (edac->sb_irq < 0)
> -		return edac->sb_irq;
> +	if (edac->flag == SOCFPGA_AGILEX5) {
> +		rc = altr_agilex5_get_named_irqs(pdev, edac);
> +		if (rc) {
> +			irq_domain_remove(edac->domain);

Why remove domain here but not in the failure below?

Seems like you would want to do the same in both places or have a common
failure path.

> +			return rc;
> +		}
> +
> +		edac->sb_irq = edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_SBE];
> +	} else {
> +		edac->sb_irq = platform_get_irq(pdev, 0);
> +		if (edac->sb_irq < 0)
> +			return edac->sb_irq;
> +	}
>  
>  	irq_set_chained_handler_and_data(edac->sb_irq,
>  					 altr_edac_a10_irq_handler,
>  					 edac);
>  
> +	/*
> +	 * Unlike Stratix10/Agilex7 (which deliver uncorrectable errors as
> +	 * Asynchronous SError), Agilex5 routes the global double-bit error
> +	 * through a dedicated SPI ("global_dbe"). Hook it into the same
> +	 * chained handler so the existing sb_irq/db_irq demux in
> +	 * altr_edac_a10_irq_handler() routes DBE events through the manager's
> +	 * IRQ domain.
> +	 */

Is this comment in the correct place?

>  	if (edac->flag == SOCFPGA_S10) {
>  		int dberror, err_addr;
>  
> @@ -2177,13 +2233,18 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
>  			regmap_write(edac->ecc_mgr_map,
>  				     S10_SYSMGR_UE_ADDR_OFST, 0);
>  		}
> -	} else {
> +	} else if (edac->flag == SOCFPGA_A10) {
>  		edac->db_irq = platform_get_irq(pdev, 1);
>  		if (edac->db_irq < 0)
>  			return edac->db_irq;
>  
>  		irq_set_chained_handler_and_data(edac->db_irq,
>  						 altr_edac_a10_irq_handler, edac);
> +	} else if (edac->flag == SOCFPGA_AGILEX5) {
> +		edac->db_irq = edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_DBE];
> +		irq_set_chained_handler_and_data(edac->db_irq,
> +						 altr_edac_a10_irq_handler,
> +						 edac);
>  	}
>  
>  	for_each_child_of_node(pdev->dev.of_node, child) {
> @@ -2209,6 +2270,8 @@ static const struct of_device_id altr_edac_a10_of_match[] = {
>  	  .data = (void *)SOCFPGA_A10 },
>  	{ .compatible = "altr,socfpga-s10-ecc-manager",
>  	  .data = (void *)SOCFPGA_S10 },
> +	{ .compatible = "altr,socfpga-agilex5-ecc-manager",
> +	  .data = (void *)SOCFPGA_AGILEX5 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, altr_edac_a10_of_match);
> diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
> index 4a9da28fa96ba..b769cce6063cd 100644
> --- a/drivers/edac/altera_edac.h
> +++ b/drivers/edac/altera_edac.h
> @@ -326,6 +326,27 @@ struct altr_sdram_mc_data {
>  #define S10_DDR0_IRQ_MASK                 BIT(16)
>  #define S10_DBE_IRQ_MASK                  0x3FFFE
>  
> +/************* Agilex5 Defines **************/
> +/*
> + * The Agilex5 ECC manager exposes 7 named interrupts on the manager
> + * node. global_sbe and global_dbe are aggregate single/double-bit error
> + * interrupts that fan-out through the manager's IRQ domain to the child
> + * peripheral ECCs. The remaining named interrupts are routed directly from
> + * dedicated controllers (IO96B memory controllers and Secure Device Manager)
> + * to the GIC.
> + */
> +#define ALTR_AGILEX5_NUM_IRQS             7
> +
> +enum altr_agilex5_irq_idx {
> +	ALTR_AGILEX5_IRQ_GLOBAL_SBE,
> +	ALTR_AGILEX5_IRQ_GLOBAL_DBE,
> +	ALTR_AGILEX5_IRQ_IO96B0,
> +	ALTR_AGILEX5_IRQ_IO96B1,
> +	ALTR_AGILEX5_IRQ_SDM_QSPI_SBE,
> +	ALTR_AGILEX5_IRQ_SDM_QSPI_DBE,
> +	ALTR_AGILEX5_IRQ_SDM_SEU,
> +};

You could add "ALTR_AGILEX5_NUM_IRQS" as the last enum entry. This would
automatically match it to the number of valid entries.

> +
>  /* Define ECC Block Offsets for peripherals */
>  #define ECC_BLK_ADDRESS_OFST              0x40
>  #define ECC_BLK_RDATA0_OFST               0x44
> @@ -401,6 +422,13 @@ struct altr_arria10_edac {
>  	struct list_head	a10_ecc_devices;
>  	struct notifier_block	panic_notifier;
>  	unsigned long		flag;
> +
> +	/*
> +	 * Agilex5 ECC manager supports up to 7 named interrupts. Entries
> +	 * are indexed by the altr_agilex5_irq_idx enum and hold the virtual
> +	 * IRQ number.
> +	 */

This comment seems redundant.

> +	u32			agilex5_irqs[ALTR_AGILEX5_NUM_IRQS];
>  };
>  
>  #endif	/* #ifndef _ALTERA_EDAC_H */
> -- 

Thanks,
Yazen
