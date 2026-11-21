Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795275225;
	b=g6iYUfpUng7u9DXBe9igdwCdYFfX5Q05gvZF4/hzcNxZeq8tyXk0x41vkfbAQwrnuuYg
	 G8Shir53DM9+XPh8h+GcozeRuDAXnZITXIaws6Tc/9Coa+v0Q5O+qnUzQygSFJ9coMEDr
	 5Rwh6oUib+WrLU4itOXSsOx2LSToO1lhW/kY21GDaIwG2mOFWHXd6ggqA0LllK5PotqbK
	 hC9O6ctg0WLuS08gLaNQrN52cqFgdtyHJlnkdnr7P9vt3aaZDoZeCL7L+Q26qQ3ktZyw5
	 sIiJ1IS0bZs+mBv6rGlGTyvfJVb63cISFRfbh3P/Y4g5I/JpDchh20qqmd4kJM9/tpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795275225;
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
	bh=n9I92ZZWBb2BTy2lkiMUXZot+Iy5FwHXn21oY/c4viA=;
	b=H6+3mCfs/O1twWCDYqYyfK+8QcfMw4pVmoKUOhom7v/eJiZ2qmX0UrlEPBVNdJuU1bKJ
	 FoE8L4REHpz1CaX905nJOD7j16sgeUOF9l4BsuYoWHi3s8vSt3H1pe1CPxAsoWG9DqPVO
	 nLWfgyudEmaaPcCydDLgXygh8f2bLt2eBigYl82lYdsUrV/3GgQLmMnY4AZS7Wmj2GfJb
	 w5frPWRrbtsycZs8bRCTXTaEx8HPIj6hmABRe6RbPBoWkO2KmZg7lvV3m4wIohG7sbo+m
	 JfIvdxx51H38GTTgfF2UuBNg5vMg+RRERLnNGOlns1l5v8auF2yHecWWczjHWDGs37w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=d+Ag0zEw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.38
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012038.outbound.protection.outlook.com [40.107.209.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F91606A320;
	Sat, 21 Nov 2026 15:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F91606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=d+Ag0zEw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yi+nm/7mwjPlqHl7cBFlbmXMFEEuz+x/42NyWkDMhoYDwtLrs5hElr6Eub1aEt0C1EHatMOgUo/SgBVVe9Y7bACprjFD9aDcMsxNBkIHjvnqHoBxeQGgo0Fma93nGKvZ/RrGLCSd88bi68voNMbCcCJwGdilMv4RxJrE8+sI1YOKqyW+AEHnT3NhmreBsik1cPyFGzeyeVIJUn7Y7mtVSa58qYGJ8IMJWgdcjMTdPv2MR8/SDlsPUeSE0pPsDsN4O2NqEbq0jx+r9wN1Ssfw31sAms5byfYtsOzYkBbKbdxYCWph9XKPXr62h92ToI/Y++a3R15dKxFWEYVbja/ZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9I92ZZWBb2BTy2lkiMUXZot+Iy5FwHXn21oY/c4viA=;
 b=u+ya/BvQhUDGJOhfj1tr1jDOUMWtgeHQtzJJzXa6EaRZSJZULiUFMGXRVc4OMnGcLCFW/s8j3a7c5GmPObWTXi9/X9R7QEwG9RnIHOOUcORkRZdPEAQxIrJwbf/rOAXTiqtK9a96ON4mT/1TNJaw5gX/fJ5/rd9V7rx/ZzeFDkJRrkVhqeEws24YmDV2PSmBjNlXpfoPB24+KZR7fguNK3TPu8KTTxiclmuYdFmJvthQ6FzDN7O8PIa7tXHpXCjAKGdKAPr0l5iajgp35V11ewtac8GHyR1zr5g3ymU14xKGVqcYeREO1Ax+miwF5rW3MhG2ObGA7HisDQm2UfG2Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9I92ZZWBb2BTy2lkiMUXZot+Iy5FwHXn21oY/c4viA=;
 b=d+Ag0zEwhBY2tmLlOIFCZQ7GuOD2aG969ECwDETp6hZ7qF2heJLsS4QrAjRurehtO3+2zkslfP87OnKASXPS4ATZ0Y1WmRXNKLeEtW7yw1WTbp+d8gV6WBjHr++0/uLGoU8Q0V9GEKAWDXFqzbq9s0sBe64qOfoFbRfBP4u67Fk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by LV3PR12MB9401.namprd12.prod.outlook.com (2603:10b6:408:21c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 15:33:41 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0615.013; Sat, 21 Nov 2026
 15:33:41 +0000
Message-ID: <8e15faa8-cd1e-4ea2-bd91-fe419cb8b545@amd.com>
Date: Sat, 21 Nov 2026 21:03:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] EDAC/versalnet: Initialize MCDI before RPMsg
 registration
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com, michal.simek@amd.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-8-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261118142213.100581-8-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0240.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::17) To CY1PR12MB9697.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|LV3PR12MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: 37869851-a32c-417d-6ea7-08df47e4d1d1
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|4143699003|261022105027099003|261022075727099003|11063799006|5023799004|56012099006|261009223027099003|10067099003|261021123027099003|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	mRNNCNCP4/LeTKGmzi+TYVAgkN7TsEzeCmq2FzVRhT2UZsVCpfvYU+IXX1itPfNMd/bDqnsZfVVPknAw1Rm2f1noQ40a/1SogGtw5YzVf4kcAPIyxHgD2dA7HwPTsjZ/Yc0t9pBWWROSxHem0NN2s07SJ3ubqYRjpwCUyAGgn13D++/j8Phr1Big8gVQkj1MmTmFqvvSUvh2FD5J0R1yS8dQDZtSxIFB5Ck28DWordE7dkx4+AMmZU4belwrcfa9CjfwBqCmrt6dVS8/4O1sUeL/pxRE5w1pwywCUh/vUSnbT8yFH4HZHEVikIKhWJj18vcbRx9+TYNk1HPlGjJMU0t/fe7AZlRLrrdKI/07ZJaFuV2awywAOGSs0l8JauH6PAwudBEJNsZ2H4ysrDskJ5k81VbiK5ID0Sf9p+K7bp4f9E6R9mmwBLmYMyt9dkV1QQtGaa+3eMbNOBIQayw1jyTIVq5lzn38MiFfHK7ZsUkb8CFH0EHtKYJ4XEVYfBfQx2g0dfoFq7T2ZMw0KQV2BWnn6paDw1xdZBsH9LONm8ro6oMTF9sujEyMdAe6VpyQCB91fRGUrm3kQeCdBst5RMYviyCJiheGgZ1mlAwq48bCTUinWIV7GNclTJrXeVWqu+apwuj96FFnNr60VBegJoSnqI7Pps5zaEyvQO8LLyE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(261022105027099003)(261022075727099003)(11063799006)(5023799004)(56012099006)(261009223027099003)(10067099003)(261021123027099003)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnhFeEtFKzM3bkZ2c0tZNmluUWo2bHRFL0cyMnJ2dzRqaGdhWlk2Ync4SXFN?=
 =?utf-8?B?eU5oV0M4dHhQZEUrMWNmT0tDdGg0L0J5Mjg0eUpVSS9DVmNxL1pEOFkySk52?=
 =?utf-8?B?Vi8zc3c4VlcvK0pGbmoxTVpmaUY0bVRCLzIzR2Nra21rekhzN1Y2NTNhUHJs?=
 =?utf-8?B?TUhCQUxYYlF6V0N6aTZ0NW0zSklWQXg5RWU5M0pkbkQrWUZlK3N0N3A0Undn?=
 =?utf-8?B?OU9FVGJMUU9mQmQ1bU9EMmkwNm1LWUlIeWhhWVhDSzA1YUl6YUtWVTg4bDhy?=
 =?utf-8?B?N3dENGJBUVBjM25JQXhpaW0wd3ZPN0JURlMxU3JSZ0o3K1pEdmI4eTVpQlBa?=
 =?utf-8?B?Snd3Wkt2V0NpZmhXT25tYXdMalM0OHZKTnNmcmNHREk5YWF3bW8xUXB3S2hB?=
 =?utf-8?B?aVpWaVpTVURPeHdvdHV2NnNBWWZXN2RISXpIUWc0RTB5OXo3RWdnMEZJWVRz?=
 =?utf-8?B?M0JZZ3d3aktBZzRSS1lkRHdnQ3NsdWtRd1hvVXlQaGtWYmdXQ0JsWGRVZUJu?=
 =?utf-8?B?NFZPbFoxSmRyWERKckVuTGE1K1hiSmdUdWRkcGt2YzlTRGxkZS93aWtZRzFl?=
 =?utf-8?B?R1FTaTlwcmhkamMrZkZTb0Rxa2J0MVJBWWE3VDNQRlhuOTU4MExEUUxVYnF3?=
 =?utf-8?B?UkcwazhuWFdlRnBMVWJHWk9lekV5QzJRWmE5aVJOVHZWUVR2SFZ1S2RRL3Vt?=
 =?utf-8?B?YVFqcS9lK0dhN0phZzNGS1I1RWlzQ0liYno5dDhxK3dRSVAwUUxXMDNjSXBy?=
 =?utf-8?B?a1N2UFJjTHVUWkorSUpYYTIyUnppeGdFcjVvTFU1QlJ5QjRTQ0E4TWxPQ3pS?=
 =?utf-8?B?OHNwcVNPdzlnZVplQkkraUNvRFQ2SWdQOUxGdGhybjh2NTVIaWMybkZrYzk2?=
 =?utf-8?B?bGlYN0VpUWVWdkVHcGgvTmd5aGJqSjQvczVHNHJiUHhHb2dkeXJCQU1PZ1ox?=
 =?utf-8?B?MVRIWFNyRCtNbStJN1Y0VVZ0K2pmOWtyTkJZQi8zcUVJankzdjhvemUvZjVR?=
 =?utf-8?B?OGxRbjlBektiaHNSUlBkcTFkQ3pkTW1wWXpqZm4xYUxkanVZOXdRcXFJUE9p?=
 =?utf-8?B?MFl4eWRQRERoTUQrRjhjbi96UWN0OGI5bTQzUmNZOXVMQmlNUTNpUTdsRWYr?=
 =?utf-8?B?RGJuL3JwRk5ZbDRvSlhiZzFHRng2QzhjVUIyYVREeHlRV3I4NGs1R3ZIMEdo?=
 =?utf-8?B?ZnlzNGpCeHNjc2tYUHR5U3pudmlNR29xQ1JITDVFWWZoUytqcjdYVlFZWmYv?=
 =?utf-8?B?TEM2ei9uRTJyMmhIUVVtNFJiZ3R1QjlkSm02TjNweDYyWm9FTzNSUGRVR2tJ?=
 =?utf-8?B?clJiNUdtcWxZS1IvNS9LQXlESzFQYlEvZHVxOFB3Z2hZSGM0WmREdCtBeXdB?=
 =?utf-8?B?R3dSSVZZWmpsM1BwTXUybnd4OXh2Vyt4RitiaFdJMUxuWnZUZEtYN01yUi9L?=
 =?utf-8?B?RGs5c2Y5Zld0S2wwaTNvcXJHWDlFTnlGdmdwM0NjQnV6VnQyY2dKQ1M4RGRt?=
 =?utf-8?B?T01nOE4wVzQ3ZWxIV0hwTm5BUXdYa0k0WHdpQmFMNk9WbUJITlUwVG9hR2VO?=
 =?utf-8?B?Ny95eFRRWmRUNXlEdnVqM0FsMFlrWnVpVmpqdGdqcWoydjIrYjRlcXI2a0Z6?=
 =?utf-8?B?TXk2bGU1L3V6N0RjQUhDWDRIOWNONU9JRmJIaHVtc2hoeTd5MWRwWGo4Yzc5?=
 =?utf-8?B?SlBjeGMwWHdUcWIwTnVBdG96MEczU2FneDN1bmtKbHJYK1NGeGNuYlc2Vkxn?=
 =?utf-8?B?WGdpNGNLZktLM05MbWREUzhkZGtORGQ3ckltZEVzWG1tRW12eWRpVDI0T0Fv?=
 =?utf-8?B?SjF6akNLVUpyang3Z1Ywbk1mWkFpdWZXZGlpekcrRHNnTUZvWGVwUEZDVUMw?=
 =?utf-8?B?ZU5nR1NrSUFrMW16RDlNeXN1OFNCbFFzeVZ4Y1QyZXJPbnVRaWQwaWZ1QzNq?=
 =?utf-8?B?NjBJRjlXR2w5QmZuODRJeFVwU1cxa2ZhaWxtVmpQM2VCYXl4bTlHOThQVU1w?=
 =?utf-8?B?WUZpcFpLdmtVOFJTZTNscTlYb0dkdHM4ckp6VjBrckZZcWE1Qnl1elUwV0o4?=
 =?utf-8?B?YlV0NkdvSVRMV1hmNTdIcmgwWENlVEQ2UWptWEZuYWhJRGtzY3FzMXRFdU90?=
 =?utf-8?B?b2JPa1lMU25WMkZPT3d3dDg5cDZiZVAramwxYzhDeHF0ZFBKeTNUemFnSFd4?=
 =?utf-8?B?RzlaZjNQOEVHWXZiSlJETjVXVHpxdmZmenNpMmxWN2JOQlFOV285YzRid2F5?=
 =?utf-8?B?VG1XcEYwdTZYVko3VTFHU2x1cStUQjZvdTFPUkhMMlJRQkF0d2R3VUt4R2JR?=
 =?utf-8?Q?0kkySbxtgMBZdUqnFP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37869851-a32c-417d-6ea7-08df47e4d1d1
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 15:33:40.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iA6tyxTkidd02Xt3/Nyl29Ni4+Q9K14aUX7pm87F0va7bUllMSWoCQLMH5mfbWf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9401

On 11/18/2026 7:50 PM, Shubhrajyoti Datta wrote:
> setup_mcdi() currently allocates the MCDI instance, assigns the RPMsg
> endpoint, and retrieves DDR configuration data. The DDR configuration
> path invokes cdx_mcdi_rpc(), which requires a functional RPMsg endpoint.
> 
> Split setup_mcdi() so that only MCDI allocation and initialization are
> performed before RPMsg registration. Update the error paths to match
> the new initialization order, ensuring resources are released in
> reverse order of acquisition.
> 

All three from the earlier review. setup_mcdi() now precedes 
register_rpmsg_driver(), so rpmsg_probe() can't deref a NULL priv->mcdi. 
The get_ddr_config() loop moved below the completion wait, so the 
endpoint is live before first use. err_init unregisters the rpmsg driver 
before cdx_mcdi_finish()/kfree(), so rpmsg_remove() can't write through 
freed memory.

I suggest squashing this into the previous patch so that the series
does not introduce a bug that is fixed by a subsequent patch.

> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v2:
> Update the labels
> this fixes the sashiko comment
> "register_rpmsg_driver() exposes the callback endpoint before setup_mcdi()
> initializes the mcdi pointer. Could this lead to a NULL pointer dereference
> if a response arrives early?"
> 
>   drivers/edac/versalnet_edac.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 90918293f76d..046293d54d40 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -605,7 +605,7 @@ static void get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
>   static int setup_mcdi(struct mc_priv *mc_priv)
>   {
>   	struct cdx_mcdi *amd_mcdi;
> -	int ret, i;
> +	int ret;
>   
>   	amd_mcdi = kzalloc_obj(*amd_mcdi);
>   	if (!amd_mcdi)
> @@ -618,12 +618,8 @@ static int setup_mcdi(struct mc_priv *mc_priv)
>   		return ret;
>   	}
>   
> -	amd_mcdi->ept = mc_priv->ept;
>   	mc_priv->mcdi = amd_mcdi;
>   
> -	for (i = 0; i < NUM_CONTROLLERS; i++)
> -		get_ddr_config(i, &mc_priv->adec[ADEC_NUM * i], amd_mcdi);
> -
>   	return 0;
>   }
>   
> @@ -978,7 +974,7 @@ static int mc_probe(struct platform_device *pdev)
>   {
>   	struct mc_priv *priv;
>   	struct rproc *rp;
> -	int rc;
> +	int rc, i;
>   
>   	struct device_node *r5_core_node __free(device_node) =
>   		of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
> @@ -1008,16 +1004,16 @@ static int mc_probe(struct platform_device *pdev)
>   	init_completion(&priv->rpmsg_ready);
>   	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
>   
> +	rc = setup_mcdi(priv);
> +	if (rc)
> +		goto err_alloc;
> +
>   	rc = register_rpmsg_driver(&amd_rpmsg_driver);
>   	if (rc) {
>   		edac_printk(KERN_ERR, EDAC_MC, "Failed to register RPMsg driver: %d\n", rc);
> -		goto err_alloc;
> +		goto err_reg;
>   	}
>   
> -	rc = setup_mcdi(priv);
> -	if (rc)
> -		goto err_unreg;
> -
>   	if (!wait_for_completion_timeout(&priv->rpmsg_ready, MCDI_RPC_TIMEOUT)) {
>   		dev_err(&pdev->dev, "Timed out waiting for RPMsg endpoint\n");
>   		rc = -ENODEV;
> @@ -1026,6 +1022,9 @@ static int mc_probe(struct platform_device *pdev)
>   
>   	priv->mcdi->r5_rproc = rp;
>   
> +	for (i = 0; i < NUM_CONTROLLERS; i++)
> +		get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
> +
>   	rc = init_versalnet(priv, pdev);
>   	if (rc)
>   		goto err_init;
> @@ -1040,12 +1039,12 @@ static int mc_probe(struct platform_device *pdev)
>   	return 0;
>   
>   err_init:
> +	unregister_rpmsg_driver(&amd_rpmsg_driver);
> +
> +err_reg:
>   	cdx_mcdi_finish(priv->mcdi);
>   	kfree(priv->mcdi);
>   
> -err_unreg:
> -	unregister_rpmsg_driver(&amd_rpmsg_driver);
> -
>   err_alloc:
>   	rproc_shutdown(rp);
>   

