Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795531359;
	b=n6T/vAyrQhliCcoWbi8c4S/54/fV6nIqnO3dBxROIAxi+jBxBFQNHayk+oKHadQMDhX3
	 Y1UMpknX73wR1V1yNF8Aveg72sPXhFXXnUk+sxBjK0Kd51c1iiihC/MDHP7tG9Qeqrr2w
	 kfNIoGScTWHuxIwh/cXaMWnggvi8wd1AeCnc/AH8PoO71kpPrh9PzHEZgstERmOPvrA9X
	 drPW2rDkwy7muyAGcHYVRgS8XJXgsbOGHZ8CJpR+38I9o1eGjASNVEUNMnTZ15dXmIT2L
	 6y2CT0UM1k2p72W4Qfr93U8rR6835dBv2Pw9I0OjgEMKtBr3/4aeB8NaCL4VTFS3lfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531359;
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
	bh=KVP/OlP8tf/7c0ptAfcG4S6h/11+o7CoYQHfpwum6rc=;
	b=GdZf51xoG/v/y33TmsMvkmzNCzrIdvPyRRTIvFd3nCLeNmbf/3s9Fel5J4xLat8spfib
	 9JFHuEvFQ2tlEx58b4CvNG+9yWNnANQsXiO5pISj8LC3kfjmwu2g8k6resFNel0pH3rdy
	 qxCEYbZg+wUzDfhJfI4Q2PwVYDlzGRCyTb8x+QvzvwZIlbv289gBIhIv5+v6b/sJAmbu1
	 c5ki5AKIDif42UW2gf9b9ljEBYHerslp2eWCUAV3nN5rEFaADtyKkcImLItbtDsNoCAjJ
	 FmiQePiBAdMaQVxGyIYdA9D0A8/GUmkHDKvVam//PzlC7ppson1fe6fKL91oqAOVlLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="y/eNr8BL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.57
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020EE606A31E;
	Tue, 24 Nov 2026 14:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 020EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=y/eNr8BL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VT/Q+R+/4DyuW0fW5aByF9fQRA+wT9J1EXjHgT1dw6ORiqIKTy9kd/8ROUr+36vGSokaiceQ4lZIlFxFAnVZl9Gmx84mRixg1NDUqf91vszjB2qIQVSo2qg+vgnwTpu/czeZn+Eb17P0vYj/c2vMDu1CVv+pl0CblLy0Dm5nAh9LQ3WNG+6YqREsOPv4LiX9+UCQb5Jmo9yhrRtaLpa5UruTkyjLfBb7sCStdgWYD3JjQj5OH42mKhbUOJzX5DDg7Iik3scovaVrqc4qEm35EGDJB2aGtVZoEFa+0dN/nRsZuxAro7FIIM3TIgPltDz13/vE0KsPMi9kXNwx6cy66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVP/OlP8tf/7c0ptAfcG4S6h/11+o7CoYQHfpwum6rc=;
 b=b4giWHykma5Af9BN8RZwrtZ9RBLiltKiJoaNEuabHXpXRwDOnl+UzgKLrpfosms5cWS8sYx5hBXnyCtoBNCKlfTVOP9J1jRMmdlwnGu8ahPTyuJxcXnvPD+9CL+hYmlkQP50hAt57WtzpyjHZMX/+o0vdTLRFqHOTWpr5VLk38LuwTA12LWi7xXwwRSKkjtKsti/0bCGsmIa5Xa74JyNyERw2n8CY1CIgigRY9Z68w4bOSE1SK7w73AWYBHpsSPeHDScl8DOiKk2mzSLjE1+en73QH+s9rzdohG5Ucnd3cpK29FOx/9Wm9XqMWCNVKArIW76Rb46Mt0BRzVOfPPWEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVP/OlP8tf/7c0ptAfcG4S6h/11+o7CoYQHfpwum6rc=;
 b=y/eNr8BL3ce3ZQLs+gTMYMYMou7WfrKRnX+DjC32fWzftr7s5Fw4rnqQRY0iNnGtND+iN83U4N6+erMOELSr+KvRJVaUYeMGxgbMIxrgAIwPKJwv3cih8QoN+BP699DzcoNRiGmUn/g0Dfnq4SqbiLVI9vfqg/dI15HVQqPwIIk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15) by SJ0PR12MB7034.namprd12.prod.outlook.com
 (2603:10b6:a03:449::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 14:42:33 +0000
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167]) by EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 14:42:32 +0000
Date: Tue, 24 Nov 2026 09:42:23 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tony.luck@intel.com" <tony.luck@intel.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v2 3/3] x86/mce: Increase MAX_NR_BANKS to 255
Message-ID: <20261124144223.GA2156781@yaz-khff2.amd.com>
References: <20261123232701.1923094-1-yazen.ghannam@amd.com>
 <20261123232701.1923094-4-yazen.ghannam@amd.com>
 <CY8PR12MB72909343EE7AA50BB36ED3CFD1442@CY8PR12MB7290.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY8PR12MB72909343EE7AA50BB36ED3CFD1442@CY8PR12MB7290.namprd12.prod.outlook.com>
X-ClientProxiedBy: BN9PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:408:fd::20) To EAYPR12MB923140.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: EAYPR12MB923140:EE_|SJ0PR12MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 8246efe4-c5b6-4ff1-3625-08df4a392c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|4143699003|11063799006|56012099006|261026140227099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|261022105027099003|261022075727099003|261022115727099003|261026121527099003|261028144727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	1YPvRP3pN5b+iTx/j+LSFuh89ukRkUpBquthXWkAANZfay8sfhuasil6fojLS2KeIbsklj8Vamy4jd1NoLDBRrw1OCYYa8DfY+RyiO5dojFN1+0dD9ZR2Pj+mccCUNmzG1vc0L/kghIA5BCHA6pKW3WPAANpX90w66CpM1OIyKvs1i0YSy05B9BZ++Su4N3v1uOcjNz+mi5zxOmF063NZKtVMyrtFqsOTmVG9ed1WYz/ko3/abTqDzUJKQruRxHy64U+OcGOqRYqucAH6aBhQhdhbtY8tA43dOIbHkTUn/uBlTdQEaNKZMOWONwhMwhKx+GUAysAN7/ci6EOayw9+bu90qLkrV36NtPdAezOIFHuc2Y9N6NtYpFQ7Crta/P+YsbtgNh+yMshugynRvdLXFVIuv58e1z7/ZCAgi1ap+jRhO5XP3KaZIcHR3IhHlwBo13IaUtsbECCDabtoHpjPGXVONPTNdChiUMAXHJBoQIfeQmE2P9sfn2OViJabPe1XTqEL0Q6xt77O7DV8QdLlqgrQVZf3+MsHl3FuBiiwRsyAAP0ijmzp+mANXgrA3IwdZWzWeLOeVhpDwxL9oizperjUzYL1EtzWuvt3ipcZpoE1iPMXbGqkOwD2DQ9eLFWFj6qOn2s5HwauSYIZioIo56QioNPsgyON3HES+DzPqw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EAYPR12MB923140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(261022105027099003)(261022075727099003)(261022115727099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oXLNies4HffRYMaGPnLtQ44BfgtaO5CC24vADXQWdwTpT/CeN8XrVah8H8G5?=
 =?us-ascii?Q?jon5JTZhmgRCkvbuRey5mdfemncyjJoYwshuJ5fv7tPhPsILFgg4Wyp+TA9y?=
 =?us-ascii?Q?Y4gmhcFdhp9YTGScPl3/FC5njaJGhmtvmCjuhcp1HbwGm32Mpcgp2Y5nI/Ms?=
 =?us-ascii?Q?Epsqe6o3xFRlds03QSiJqbaeL07VY6droVfvvTP1hvBTAR4UYBPsoyFgRyCa?=
 =?us-ascii?Q?sFv7Gx2TejPvBf8l2Fj258Q5JUPRq2V1pmkQoGAqaovQiHpW9Yn/vdhvwAYH?=
 =?us-ascii?Q?5fFaxaIn9bCGWge2BUK4ln2SpfpIge/z8xS9dW0mpFoABGDFqd8GtAaugYa9?=
 =?us-ascii?Q?/ve1VammXc2IrjB+wyr56UCD3T2EkRPDyzDQtU7wbbg7F04ZzjqP6zY0Ccms?=
 =?us-ascii?Q?KQIeHnijq9Ym2F2BmS+71feSAWpNR78ShjpSu/XGkiIUPQokBey8WL/c+v2V?=
 =?us-ascii?Q?VDYnXYXUV1z4fCDJu2Z9SRUfCBYiQCW0LY9/cYtUhT1xZ1zhkK0PrHrZKCA4?=
 =?us-ascii?Q?ctbYTjMJE19KcNQ65gFDVSPZ+s1mAc8od2XFH1vh3/hCDDLq9WqgdKlKild0?=
 =?us-ascii?Q?pB0jn+Y1HaMH6KVWKHiNSSaX2/YshMgBVVTiJ6Og1G61+XcXhKxApgFX5xSN?=
 =?us-ascii?Q?5EU0opd+lBbfsb0J2lDfTRelCo6tmFOVKBQSt5FhdrkxyaYM29GS3qrH0BKn?=
 =?us-ascii?Q?YL1Pnq6atCqxwo08f5O2hDKQFFSwNh3hCb37VD0nKVh9GVSOfCXMsWGXz06A?=
 =?us-ascii?Q?JbT78NhRNTo4vxWxkBLMfrfjHp5U14oPZtq6YksvYOpZFPJ9J1sE4cAmGMax?=
 =?us-ascii?Q?LpaxyirtXE2wVX65ZHrNJB7t6iCXAgKqn+2v/aMWecK9haIFNEJIXNbHGFPY?=
 =?us-ascii?Q?1Zi//nYpZkmkGlt/W+n1wyiPhs/DwMDpvm2hgCCSiwy2rsCompRFCiw6d2yO?=
 =?us-ascii?Q?irmfV13poMgPF4HYgCop74dyNcMF+cfN7qylYF79r1oFj0fKtnJMpzbBruFF?=
 =?us-ascii?Q?MdvAzgDXFNkJM8lm3JgqR090dyKqAM3pU6ueQ0lK4QzMmlUFY0TjR4JEgBYY?=
 =?us-ascii?Q?+MwUCBg/gyKAk4ZPoizecfQ48xr14llyvFHeeFxCF/hC5f2e+0i+rJfSLvb5?=
 =?us-ascii?Q?zeCQ/TdsTbviUCv4H3huLwxcZH5me36hIhJx+YXbrmhRXMyxfPphxo3S94Bs?=
 =?us-ascii?Q?Ma04mem8IPafc6mL8ZCl3XMfXBSUZFJOyQOZz+tQ728ktwMuLpvcMUUbTe09?=
 =?us-ascii?Q?DeV02rUCrs7rJyUK0CK2N6JP6xG4A7q5+3hT6Wsn5F9FeMhIXPvgKmZswI7s?=
 =?us-ascii?Q?gfCtCcnD5lrY0GtvTWNvU6O4qhNG1IrA9Td5DzzkeBMBWrqKpoU/s9H1/Z7z?=
 =?us-ascii?Q?PuVX3XRzL9KZsZvPdYrj18a+6MueilLPKWhsVTnWwqa6iHtvYUYmjXa5oB6M?=
 =?us-ascii?Q?m2dqYapXhPyh/bb/mav9khOLgajf1O5DKxYkB0/rZn2pCXQg0AtYh+CK6RYL?=
 =?us-ascii?Q?Va7tbtodwjOs8ETEFKKcK7KE7cuKEglezNfRn+3QDp2/GNWXqLXB3OwfXSU8?=
 =?us-ascii?Q?mW9+IrHX59WoqAkhLwNLqE5hQyFwCTkYQPSXl+aSYg3EDEsNIG5ZwiHSUqUn?=
 =?us-ascii?Q?SzIkD77EvgN2xp/eUH86Jmf+irOJh0SeuIIQnOFpWM+MNf8R1SJrMYhzqPTX?=
 =?us-ascii?Q?UPjgTXF/BSgSgNdGpgBpfkczY3JTEt1Cn41SkjJKWMP2l4AgCZ3k12jb8Zfg?=
 =?us-ascii?Q?eRLNyNSfeQ=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8246efe4-c5b6-4ff1-3625-08df4a392c13
X-MS-Exchange-CrossTenant-AuthSource: EAYPR12MB923140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:42:32.5149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jee3KNVWQa2sUfvMn2FPvprpk6iczVIpUMJSWY98sGKykGfIEIqK1jeRPQDR9L9bFjnHr7g7cxTM6fg0iQvtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7034

On Tue, Nov 24, 2026 at 02:10:08AM +0000, Qiuxu (Leo) Zhuo wrote:
> > From: Yazen Ghannam <yazen.ghannam@amd.com>
> > Sent: Tuesday, November 24, 2026 7:27 AM
> > To: linux-edac@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org; tony.luck@intel.com; x86@kernel.org; Yazen
> > Ghannam <yazen.ghannam@amd.com>
> > Subject: [PATCH v2 3/3] x86/mce: Increase MAX_NR_BANKS to 255
> > 
> > 
> > Machine Check Architecture (MCA) allows up to 255 MCA banks per CPU thread.
> > This is based on the size of the "Count" field of the MCG_CAP registers. The "Count"
> > field is 8 bits and holds the number of MCA banks per CPU thread. So the value
> > range is 0-255.
> > 
> > Change the MAX_NR_BANKS value to match the architectural definition.
> > 
> > Drop the clamps in __mcheck_cpu_cap_init() and cmci_supported().
> > MCG_CAP[Count] can no longer exceed MAX_NR_BANKS, so neither is reachable.
> > 
> > cmci_supported() now takes the bank count from mce_num_banks instead of
> > reading MCG_CAP[Count] again. mcheck_cpu_init() sets it before CMCI is set up, so
> > the two agree. A CPU that skipped MCA setup now reports no banks instead of the
> > hardware count.
> > 
> > MAX_NR_BANKS sizes a number of arrays and bitmaps. Growing it by 191 banks
> > costs the following, measured with size -A on the MCA objects built from x86_64
> > defconfig.
> > 
> > Global bitmaps:
> > - core.c / mce_banks_ce_disabled
> > - Total: 191 new bits = 24 new bytes
> > 
> > Per-CPU bitmaps:
> > - core.c / mce_poll_banks
> > - intel.c / mce_banks_owned
> > - amd.c / bank_map
> > - amd.c / mce_amd_data: thr_intr_banks and dfr_intr_banks
> > - Total: 191 new bits * 5 bitmaps = 120 new bytes
> > 
> > Global structs:
> > - core.c / struct mce_bank_dev mce_bank_devs[]: 56 bytes per bank
> > - intel.c / u16 cmci_threshold[]: 2 bytes per bank
> > - Total: 191 new banks * 58 bytes = 11078 new bytes
> > 
> > Per-CPU structs:
> > - core.c / struct mce_bank mce_banks_array[]: 16 bytes per bank
> > - amd.c / struct smca_bank smca_banks[]: 24 bytes per bank
> > - threshold.c / struct mca_storm_desc storm_desc: 24 bytes per bank
> > - Total: 191 new banks * 64 bytes = 12224 new bytes
> > 
> > Section totals, which include alignment padding:
> > 
> > Total global size increase: 11152 bytes of .bss Total per-CPU size increase: 12368
> > bytes
> > 
> > The per-CPU total is replicated for every possible CPU. In the linked
> > image .data..percpu grows by 12352 bytes. The first per-CPU chunk is page aligned,
> > so each CPU retains three more pages, 229376 bytes up from 217088. That is 5.7%
> > more per-CPU memory, or 6 MiB on a 512 thread system.
> > 
> > On the stack, the two bank bitmaps grow the frame of do_machine_check() by 48
> > bytes, from 232 to 280 bytes, on the 8 KiB #MC exception stack.
> > 
> > One module outside defconfig also grows. Measured with size -A on
> > intel-bff.o:
> > 
> > Module read-only tables:
> > - edac/intel-bff.c / enum bff_bank_type dmr_mcbanks[]: 4 bytes per bank
> > - Total: 191 new banks * 4 bytes = 764 new bytes of .rodata
> > 
> > Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > ---
> >  arch/x86/include/asm/mce.h      | 2 +-
> >  arch/x86/kernel/cpu/mce/core.c  | 6 ------  arch/x86/kernel/cpu/mce/intel.c | 2 +-
> >  3 files changed, 2 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/mce.h b/arch/x86/include/asm/mce.h index
> > 9995176d6879..e5fa0f58b305 100644
> > --- a/arch/x86/include/asm/mce.h
> > +++ b/arch/x86/include/asm/mce.h
> > @@ -273,7 +273,7 @@ void mce_log(struct mce_hw_err *err);
> > DECLARE_PER_CPU(struct device *, mce_device);
> > 
> >  /* Maximum number of MCA banks per CPU. */ -#define MAX_NR_BANKS 64
> > +#define MAX_NR_BANKS 255
> > 
> 
> Out of curiosity , are there any existing systems with more than 64 MCA banks per CPU thread?

Not currently. Future systems will have such configurations.

Thanks,
Yazen
