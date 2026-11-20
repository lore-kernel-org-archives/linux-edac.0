Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795182014;
	b=pKNs1n0IE5/BdzSF7u0n+kJVL21HcOd1DwE0Ej/HNbrHRXiiVsHdkGLtlsHw4uFl9GZo
	 T7nUdxc0LEwt/G7kVBvNOi/mfQLsFz9trzKlxOvWlUqlvJRm3jtw+hVz28u780zap10Xo
	 Qv63JXDXrxTFCp0Tr0+UsZTlB1dkNf6EoZGBqIENpPintml+1KscQieNPi90pW40ZalVI
	 4KXVW6bW4Xwtr8lqhJYIV43sjBE+/GZ5XX6wJx4UlM89zB/f3p+QFDkB5/xlSYtmzIuuW
	 jWvycigkuLpoCu/bI08RpZkII4eLhoJEIPZplYyWf3a42Y8Ob/KbumARXfUdx10ntog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182014;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=xgiHm2Sylz4abEHyqSIKonDD/NN4FwmS/1YE2F1oTGA=;
	b=v40LXfeTHSSdug9ClPbpIqSZz7iazsNEldF9Xmy3pAdxxkPwcQqZH78wgpF3LLwtqJJ/
	 fuuonFwfTsGZq5izJxmbNvo0KAewnTTADwjvG9N0gtAGJyaVnMZPl5+ppPsd9lp1+3a77
	 GAAdzgaZF+JJrCl5s2pqQfiCt8MBJGTGbLUIyE2xxuIeT1pspa3fP62NjJUUzBmkRS1yx
	 HqL49Zwc7E1p764qtKnUQ57s4Cnsq3sv4VTD9oAMFhMgxUifOUQvDMILBgJtHjnkwXIMf
	 otuMcGjGuAwJVxWjlmmZwBaPDX+A2GBlEcTlz1E8IsCnEsmLaS7EnHSHxbN60G7wolw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o7HNUccZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.19
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CB2606A33E;
	Fri, 20 Nov 2026 13:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1CB2606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o7HNUccZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4lkPtzBeWn3aNpp0MJzPc4HIt9xsKasrXOuo8y+vCnVPsM6+ed9eWe4iqspxL4b1zwC4WLHf64+ZtjVOwqQnhutboqdR2hiiGwapWljR/lqD/KIS933mtR6zGWSfJ4t2CW0uQwTzaIXZd4uELzZFKxEfLZCVQk53YQVZp5E/BjFj5Rzrv6yg1mH4LaZGzMKk4pkFQ+Lu6MJlHrMiM5ob9Xv/uXI0hLDKtxFjcgKPhmuAYLlgmch9Vkt94Oq0APT2x7lgXSFBWr+M1Lqtqi0oEzFITWxFPAEeOoY7DvbWZcDPFquBv7/A+GGWIftUSIdhjzvlyK3uNOiN0CQ3e4/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgiHm2Sylz4abEHyqSIKonDD/NN4FwmS/1YE2F1oTGA=;
 b=LmtOtpc+DL2xIFUtKs+aMj1Tzix7hiKPX7FVWIXDWTeXE8LMfkTYzeTii+F3VHWDFPGp+M9LN69tn0HfPGmrMy+cdZ01TNqpD/oUa8s57oufy7b+3Es0anrJoo5Ez8rqrfoNtvQSXyjeDxu4QPPpjrCSR7CmpKIhd+aUmTEJqzWrVsMAQywb2q1kHDVN66v10WmBxV8u1Qg1lGxjcZWXJM/K5GPFanXPRzfiP3TF8yjjzREyPDQHhvhRtG8tA9HrLqaTl6A5aGb6bRiIhd8Wy9I4P34d/hfRgr3iHHVFtnB/yGogRUkYLh89pgzxeKZES5s06fM7JAdZE72LvS7J0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgiHm2Sylz4abEHyqSIKonDD/NN4FwmS/1YE2F1oTGA=;
 b=o7HNUccZM26IliauvOkkF3fyBoodgs2CNtLzr+Vl1hZtIWzhgp8nLXdpMAzH8jp9q0ze7qXQB6C94onaZzn+m9pWxMR97Ciwk3ShimHj6NG/PNcDSL9bGHDfEdSXF2fTe4eXsnj52ga72IZEtn0ycAgMDBun/l2aSRk8jBgJiV4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SN7PR12MB7417.namprd12.prod.outlook.com (2603:10b6:806:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:40:07 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 13:40:07 +0000
Message-ID: <2b69eb61-fd98-4d7f-badc-3492d03e28d4@amd.com>
Date: Fri, 20 Nov 2026 19:09:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] EDAC/versalnet: Use designated initializer for
 rpmsg_channel_info
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com, michal.simek@amd.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-3-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261118142213.100581-3-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::11) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
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
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SN7PR12MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: d350075e-6bb5-4fda-1941-08df470bca4c
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|4143699003|261021123027099003|11063799006|56012099006|261022075727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lTn6G+OehIxpEknNiuBBFN1WHH2INv4ENX++np2qvSCW10/TAev6K7gdYUqKO6sfnwtz5ftL4Hgr2kQCBzHhwsS5az7umd6fUC5CqOatABY/+J8NNlLgYEwJKSoiqN4leMdKdT55NvNTAQNjMPP0fSl7EkoMnkMIJrAiuCSf+a1ZOOam4tIetVh8auE1nwoBCC92kFaDWsYlLXC5pGlxSjMHvyfV82lvW5vJM57tG93hVNvDu0lbBnZ5nup2m51SWdhMNuY7rhv+EOAv3CYHQo4sX0grkJ1J2xn16yFOY3yyZCVw1MyvgkN4hBshOnTpgjWAFxgMsP0RhDa6lPvCTYqEtCwS6J7PCg25fSX0O5dnHeMpHZzMamd4xLdTPYs9YVYmYR0fcEOoqDnH05rxzU/3RdW9aa4DOJW06Wenwvmnfwd7lr6KP7tRmRiP+/zXF5S8KWBH8JquDY1Psv8OnCvzRTXBVt1hV07Fgnbn+pw4kReGANY2O60huNU0YqKXBNXBwW1IaqPdNRsjv9k+4pCOYygXITeF1cfAlutCoVzY4hnUVrr9HkDOcff0kvnc5iB1FrcNSHw6WTv7eBl+bTmoHMYTjy6s7Fm1aeZCexa5s3jJP2GqRr2M6JGt3A2TCKaVKQUB5LpvWE3oDTRBgPxvPkdarLgFK83zqb7W3cE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(4143699003)(261021123027099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXp2ZFNuQ1RyMi84Wi9xRkRUVkJTWXUyU2duQnJLY1UrM2pxbUg2Znpyb002?=
 =?utf-8?B?K2hCbGpTbGdZOE5yOFZBR2tEK1V2RDFvZDZqVXZsUE1EU1hkK1VTd3RYMGkv?=
 =?utf-8?B?QlAzbEUwa1FHWXhPM0laU3NGMVExN0xTTVlXUXg2SVV5NkY4VDFQSEJlcVNE?=
 =?utf-8?B?T3RYbnR6cjBrZ040NkFlSFBXSkdHdHBuWmxqMSszbFhDc0VWc2JBUS9lWldq?=
 =?utf-8?B?SXBndWhQQjRZOGc1TUpXeTYrTitrQ2ZWK21ZNHVnNUdnTzg3M2Z4cFFkYVJp?=
 =?utf-8?B?YUlpQlZKQWFPajMzK3dOejdzVnlrclFPdkwrd1VNR3kybHRUVzU4TDkvUDhx?=
 =?utf-8?B?bjRVR1dQc0lWVDhpRThwTDJTaitJdkJ2T2VtMFF6UHFlQktSRmROMFlFRGV3?=
 =?utf-8?B?dUF4YW82bnI0OTE5cnZJMjczTFh0bXNyOFBzckRHRHVqclluakVCSlRURE1C?=
 =?utf-8?B?T0ZQVDNDaWZHakxsdHBIRExzUnZ2WmV2eGJjaFBlbFlPMzgrMGg4SDQ5NnRH?=
 =?utf-8?B?TDRUZjdpU1EwUngzZ3JBY2o2c25yVVJUTFBHWkVITGYwcTdlTXFweDJiL0ti?=
 =?utf-8?B?TERBTGRDZEdNc21zSU15UEt1MmtVSDBFLzZlR3UwanNWNUcvNkNjQktVN2xq?=
 =?utf-8?B?a1lHMlNvbllsaVVNS25aVGJ0eDVLbmNSSHBJdEZoMmpoZjlVQ2h4WklPcjhk?=
 =?utf-8?B?ZjJBL0l2OTRxTWFGbWlSVGtkVE9UemhiWExpR3kyM0loWHlOUjFEdFcxeXJJ?=
 =?utf-8?B?cmgvdmxKTkVvcjl0ZnpZTlgySjQ4YWdLY01HSHZWZDVZeTNoTkZvTzV4Y1Az?=
 =?utf-8?B?UzlGQzJKOGI2WlFidmw3YnVpOWhqcnlHUkZuNlI0bS96Rys0NVFoR2NORzZi?=
 =?utf-8?B?KzU4SjJBdGlETGJyYmRZV2ViVVowUTRPV0FobHIzUHA3cDVVQ0x0aUp1ZFJx?=
 =?utf-8?B?RjkrM0ZrWHIxNllQZ2ZPb1J0bXozQUgreHg3aXpueDZGYTJwSkdQODZVL1hh?=
 =?utf-8?B?UlJFYVNqZ1pHOG1UMzRweEZnTHdSLy9ZZEV5dVRCaW5XNDNmZWFSWXRibTY1?=
 =?utf-8?B?Znlwb3BMOUlvbmREcFN2Y25mSDZ6ZytEeDIxdUdiQmFmRWJVVHpOdWNGOG5y?=
 =?utf-8?B?SXFXTDNtQVZjOGhsZHREOWxxVSsrdWhKbTRxQXdlaW55ZE04TTU1Y0pLcStQ?=
 =?utf-8?B?RUJhcUhrbGlpaFRXTzFVbzM3aWtOMGZIb2dWZ0l4Sms3T1NBSzIwd3FCM3ZP?=
 =?utf-8?B?OWlVWEVGdHl5WWhmQnNUa3JaYUlNMCthM2N3dG1yL1NOVnl6QllJSDV4K1p1?=
 =?utf-8?B?UjVrcEpMNnNKbjYvSnRUY0JHam5KalNYMFo1eHdnaUhsdmR0d2NtelZVdVUw?=
 =?utf-8?B?WnJzVFNud1JkdndNWUVRRzJmblp1YzBreC9MLzRiZ2RVZXA0ekFTbFFKdXd6?=
 =?utf-8?B?ajJVL0FwUkM5UmFPZFFnczRSNzl0YWZtL2dxUDN5M2tmTkgvRXQ0ZklBMzBX?=
 =?utf-8?B?eGVIQ3FFcW5jTFFiZGJYWC9uVDBpcHkxUEc5UCt1T3UxRWdpNzRvTm8rZlBq?=
 =?utf-8?B?ODNEQjZ5MmlmeTNiOElqS0QyWDhSM0diazB5WGpYMkEvamZpYVNhcU5UM0JN?=
 =?utf-8?B?ZEpSTnd0VUl6TldPaUJKdFB1d1BCK0FVeUZpejRoYW5OY2F0ZkJCK0RrZGp0?=
 =?utf-8?B?M2lRN0NSZGh5WEx3R0hxY3orMSszM2dNYzFFUW1MdkJWTmxMbnpnUFY5aDZB?=
 =?utf-8?B?djRraEFGOGgzQTVkbmdRdmh0d0hNK25WalpHU1FhV0g1RUQ5R2hGZExHdjdV?=
 =?utf-8?B?UGJMay96b25LUE94cUx2cTliWFVjR2I2L1RzamVYNmlHRlhURXVMazF3Qzlq?=
 =?utf-8?B?STFWbld0TzJxalNpWWEzSmtBallUSlhRQmZJSXFBRm1oeHY5YTMwNEJ4cDVi?=
 =?utf-8?B?ZTEvVmM2RnZNYjdWRlZxVEVvdGJLY25HeFBRaWc5VjVrNWZmWXdMV0dtR2sw?=
 =?utf-8?B?Um1SVVZnYTZJSVY1TlBaT1lQVWo0ejErQTRYUjlBSDBiZTBNNFRtUGZFZ2N3?=
 =?utf-8?B?QkxmQ1BMYmRmalBIYU45OXI5eXRxbjgvbEhYb2wyNWJ0MTNiMFdPWDN6ckNx?=
 =?utf-8?B?emRjUFZjWHhXWnlMYUJnTW1rN29nWjlQKzA5dkxQOTZWdjlJeWp4VURxa3Vp?=
 =?utf-8?B?My9uTG9qcUxyR2Z4b1NESjRlSmx1SjJvMVNheFF1TVBWNnFHMG12blIxTHVU?=
 =?utf-8?B?bzk0YzRvRzU5dXhUV09sKzV5S04rdW0vcHh2c3ZRSTRKdkFIWjJRajZYcGRt?=
 =?utf-8?Q?TR9alVp1xiJDfpxyvI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d350075e-6bb5-4fda-1941-08df470bca4c
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:40:07.6032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otp8AyWUa1U6sq18GkIw5OHr0yd3kAst/Jb34JJ3N3r4+oilAWkj4UlyPuzD5Fa3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7417

On 11/18/2026 7:50 PM, Shubhrajyoti Datta wrote:
> Replace field-by-field assignment of struct rpmsg_channel_info with a
> designated initializer. The old strscpy() call used strlen() as the
> destination size, which truncated the channel name. Use the
> string literal (via EDAC_RPMSG_CHAN_NAME) in the initializer so the
> full name is passed to rpmsg_create_ept().
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
> 
> Changes in v2:
> Use a macro for channel name
> 
>   drivers/edac/versalnet_edac.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 89672d4d17c9..de97b2ac45aa 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -70,6 +70,8 @@
>   #define XDDR5_BUS_WIDTH_32		1
>   #define XDDR5_BUS_WIDTH_16		2
>   
> +#define EDAC_RPMSG_CHAN_NAME	"error_ipc"
> +
>   /**
>    * struct ecc_error_info - ECC error log information.
>    * @burstpos:		Burst position.
> @@ -713,21 +715,21 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
>   }
>   
>   static struct rpmsg_device_id amd_rpmsg_id_table[] = {
> -	{ .name = "error_ipc" },
> +	{ .name = EDAC_RPMSG_CHAN_NAME },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
>   
>   static int rpmsg_probe(struct rpmsg_device *rpdev)
>   {
> -	struct rpmsg_channel_info chinfo;
> +	struct rpmsg_channel_info chinfo = {
> +		.src = RPMSG_ADDR_ANY,
> +		.dst = rpdev->dst,
> +		.name = EDAC_RPMSG_CHAN_NAME,
> +	};
>   	struct mc_priv *pg;
>   
>   	pg = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
> -	chinfo.src = RPMSG_ADDR_ANY;
> -	chinfo.dst = rpdev->dst;
> -	strscpy(chinfo.name, amd_rpmsg_id_table[0].name,
> -		strlen(amd_rpmsg_id_table[0].name));
>   
>   	pg->ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
>   	if (!pg->ept)

