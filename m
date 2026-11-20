Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795193720;
	b=COlGSdsF1FjL7xwN5cz4DN1Cg+LBnhboA6Qgzfdc+0TXQ+tTt1QzVsZ3JEmfW15X93nh
	 P8Nt0eP6Zgh2FQXqR7YcV/Xi2kaSXJCNRQWAJP9Jue6xoYJHtOjWsXOnvMjIUMbSawqoG
	 +Y25WWXujhOC24JRcT16v7aJICXmgvEuvs7ZLNDIro4f/6gtXw4dfHMnmCP53XHUTEHpT
	 KOmuLQux7I8wc4EoQiaLBGJkxw2jwMyZr9ojnIWTwrE8eCvNBjFwQPmbcz97bpbPOwnpp
	 /Qc8Ou8w/me6KVhKChypZv/NzExE5v0xMQ5eWDeZqkZVcQWSRuxTszv74jT3QlBRWOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193720;
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
	bh=WP66IhO3WJQyEdAIjaj836GdXtEfeoA/arhxSbe7L8k=;
	b=H021wZhZD/gczKCrDxHuvDsLOScekxmzIXPLnH3sIBIMFlRKljp5THf4BXgqcDAwsnoU
	 Amle+bMuWzYCLZ3XktwjFBf9eqK+4lNfTGHqgSvNVdk/c9rRyz/qv4MqO4DQiAO0LMefA
	 D6d3cTGN0yhoUVOvqaSYR6VQR5ru701aDdLnYpDRrR4Y60G0Mkoqwes0wi4LVEyB0LPxq
	 isj/Y8cdJNQoVyka/oC7z0kBAoFeBUZi8C1rJpYa7uv2tgVEw3g+bcTSEkZ5K/rn1c/Qn
	 aa+zAAtOEOBphqlAS8Bx3Nt7ByU7ctjt/AjQYSfUwNXNc/y8CBfTOwGD4Q2ZPDQEf4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="Wzm/tw80";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.24
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EC660A2612;
	Fri, 20 Nov 2026 16:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EC660A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wzm/tw80
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SE6KSY1fgh+K5ixaEbonW9t4JlQHcCXmbkt/bDNH3UodsXbt7PVvySfW1yBNZ3MDjl6ud64kaqQCTajJ/kOCwTt3CiK2gHcV0fxdtZHJhLIV62GhcbwqYt/LJOaEwTSm6BfD3COnszyTSg5dC2DBDxvOHhirig/IbCxOAi7QnPV7YBAeAezl346eMHLiyyyyGcu75G5UqlEsh04f37+EuDh6zrTXSKXU0w5ZkgaZhs19DQ5r3j8fo4ITLAn7TYE9jZ/M87mWE7ooRke6RJEdYhIhvjzvhwrVLLsh4nOPI1epiKQg3/sfOLkfh9SAqJXBEQgDGfSKChgu3T1MJFAnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP66IhO3WJQyEdAIjaj836GdXtEfeoA/arhxSbe7L8k=;
 b=cxnrFS7WsqSN3+4ZS0WML1mwOp3fL7KWRmgtG18ykxJNM9IXDQNvUwG3x6xxKxX/3KZgOw+dhJ8FtatPEv9pR7GIi4LO45sCgJzwgZcyCMZnSswyJ1aeDSKQTFtypHnh356TV/OUVQYmOAV9RDaQsbc+eXat8r+vPdEJS88s0EtB7ZpbZhDETBKIAy+vm4R6hZWjJQkqHVlZbBoLjYpXOBd7tuEKYtvf7cNtbQe8uUAjOMEqOh3tjgsmyS61FaH+XQlnLpvSwY+1pkZvT9/VqrRSMGoKgTmeUW08/cxyw1dhJnMPKMSJO2s+3glyaS4dsatnxYgC1ggXo8+AMaaqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP66IhO3WJQyEdAIjaj836GdXtEfeoA/arhxSbe7L8k=;
 b=Wzm/tw80NhAAa1GpJfsGEXQzd+oKrrnJKFbjEEcyqUEcKvGuiOPkGmaeDIDlBskoducL94IRudQK2AvYI4a+V16JH4KDO3cDrHNgywYoWE6bCfxbUlMg+uZ7E0tdNtZMe83PskzcZlzZUnOl+bIxs/wGAbE48W/f/0RC83bGW5M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DS6PR12MB324412.namprd12.prod.outlook.com (2603:10b6:8:498::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 16:55:02 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 16:55:02 +0000
Message-ID: <d1a6cf18-9061-4373-91c8-6c2b5241dda3@amd.com>
Date: Fri, 20 Nov 2026 22:24:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] EDAC/versalnet: Make dwidth per-controller
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com, michal.simek@amd.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-6-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261118142213.100581-6-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::7) To CY1PR12MB9697.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DS6PR12MB324412:EE_
X-MS-Office365-Filtering-Correlation-Id: d850736d-977c-4a78-7930-08df472704a0
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	9XhOKjNzozAzrCEeJIE8QhCspYBwojAFVmV+Hv6DFCr623rZJVFJskRAKCwaki36cQ2Zsek22n8yUUIfGXSqaDjNc7qD6NUoFY68vM1GT3MlBrKGB6NhJ1a0b2rMhtS9pX4rNKa1RUTo6SKjj5wPFBNetudjqmEy4EyuMHgbr9KGqybkdrxOeNiXiEGkFSAwFjbDa5jX+QLB1/uxSekEz8kIh38rHwI4dW1x+j2CNDzRJlK07TquL0PccHEuzu+21oslg5AMj43pRpLj7Hen9bxfNhmzx9h+GLS49dVQk5opqsbIFUzAYEZ90FkE231l0X40UyK5/N7YScGsiBK1ESWRYmqgc0jDNoXe2gWiKH5xxafbczp17jqEtWIgipL9BzNeLPoZdLPNkZfcIVAjdXYA5ZRSpZBceL2b2STI5lEcwmWOmUdk4EhTI7sKS/f+XtDzfRoifTwz9pID9wURLgh6ZamFR/31zdCRIHbNGBPEIVj2IhVZB5vL6pG4hjIx2hQOQEyx9BZDy6eZSgtkKdmcVatpTir1niTI8ua6F7f8Y/HGfrqyD6Cd1wcjOsMB73AUxGgDDKWSBp72F+IzCU6I54T6BHBXyVIPlLEXcV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nkxsa1RmMjZFQWhJVTA1bVdJMmhBY0VmdCtsck8yZHh2WnRUQlNjQ05SMXBY?=
 =?utf-8?B?NS9hZS80dndqdGd2WStYUkRQREYxeThScFVRT0o2aHp4R2VGZy9HMFFXcjNl?=
 =?utf-8?B?eHJveHFYSnh5QUs4ejVEdm95K2dFZEZPN3BjVVU3a2NCa05ITGpEd092RndD?=
 =?utf-8?B?cXIxdXVsclVCMTROWTJhSXJRdUZ3NVpmRFFGSllpM1VreE11T0lVYldjR3VX?=
 =?utf-8?B?OXl6czlGdmdmMkswYS8vcmd6MlJpUVlsK1JpVWlwUHEybnpZRHI2ZXhtSWF5?=
 =?utf-8?B?WUJxeUJ2UjJ2Y3hwWnV4WFliejhJQXhYTGI3QnE0S2hSWk5lV1lDWEhuVTNQ?=
 =?utf-8?B?TG05VEdscUJHdTNUczZaQjVjVDEzSWk2MTAyUTZKWkpVcFBBVlNTWG15dUJq?=
 =?utf-8?B?VjVoeTZRaE0zVU9iUTRCRjRBd3hjcC9PNVB6TUtCQVdJd0lobEM4ZWxlRUk1?=
 =?utf-8?B?ZlNsejhyL0NhQVJZRG56SVdqQzV5aGpvMnFmaTNlT3dTRkRiV2VHMXg0ZFZZ?=
 =?utf-8?B?aHVZM3BkUFRIcHVpVDkycXczdmIvME1aQndOUWVKbGVrUlIyWUtkcUdHNlF2?=
 =?utf-8?B?V3JTTE1XU0liazhWUDZDUk5PY0V3QmlvOStFKzRXK1VCUVNaMVIvaW1Ta2NV?=
 =?utf-8?B?NFd1b05qckFGMXY4T1IrMW5TVGJudktjOHFFZHI2Ri9iQ2hFOFV6c3EzcDU3?=
 =?utf-8?B?bjI2UWRkejl2ZXBNbnZ4Z25rcWlsQ3o5YWZ6eVJtcmliNkhZb285c0FMWEJH?=
 =?utf-8?B?ZExDWm5pSzhQVHNxOWVZaTVsdE4yMnh2SVVHeE9ueEJjTVlmZkxwK0ZYZjl4?=
 =?utf-8?B?VjdGUS9aUUhQRFM5TjJGamduSTdSQmNOMnZuNFlTbFRWd2RScnZaMTRNQTJJ?=
 =?utf-8?B?UDk4OU1qcW9naFZmQzhEV1Nlb1FoZkFxSUJoZFFqNkdMUkFrN3dYZnNaUTJL?=
 =?utf-8?B?TDMzcHhmZUprMVluNHM3ajE4M3JxS29uNnlrUFZ1ekhBcmZPNG5ETG5GZk1Y?=
 =?utf-8?B?cFV2cWVYWWN5UngwcGVPL0EreEZwcHJMRkx4YU5wUGNiUitkWURhZ2NkTmZF?=
 =?utf-8?B?UGlYYVR6bTM2eXR4aGFXYXVoSDVseE1xa3NDRjYrS1Yxc2NmUG04eGtLSlkr?=
 =?utf-8?B?RWRkZ0FuOEVCL3J6a1JDMW54eWk4VjBKdHphYmdKZktDZ3NhaWxMQ1V3ZnVE?=
 =?utf-8?B?S0p4RnRrTzFkYStHeXQ3Q0dBdC8wdDltdTJBYU1nK0hoTHRMMTdwb1BIUnU1?=
 =?utf-8?B?NS8wMU1Dc05UOE5sM3Z3UFRuZEhCcUkyeVAzRDBBcCtTWXNPbXJCbXBZeWZ4?=
 =?utf-8?B?eVdVOGRVZjRiWUtnWGVwa2ltbkd5M2NKZUlWMkk2Vlk3WUUvZkw3cWJTdFVt?=
 =?utf-8?B?K0F6VWoxd3RneFMvQTgxYXkrTWlnR1JqcEpoYytlYUFCNjREWGZYQmNMR0hh?=
 =?utf-8?B?SGZWZk1nRFkyZ25HamNneXB6S1o5ZktzZUhuckRsaVVzR1A4cWFGOFFyNmJW?=
 =?utf-8?B?NDZoTmdHV0I0ZWtKVHBLSE5tYit2VnJabDh4VjF1cCtlOFZTUWxZV2dKZ1E2?=
 =?utf-8?B?UlNxYmp1M3dpU3JBMEdsd1hta1RVRHJ1YXJjTnp1S3pCaysxNHZLQTRSaldB?=
 =?utf-8?B?RHlKaWZiV1RyWmtaVW83Y3VOM3AyZm12SW9YTjRQZWhqRDEyNWVMbzk2VFl0?=
 =?utf-8?B?SE13ZytLWDhsNjdCbzdOWHFWclV2bVRCTlBWSE4vMGNaRkRzSjE1ZmpBOHZ2?=
 =?utf-8?B?OFU4SmJ2Qy9xS1dkcTRJRlJPM0dIamJ6bTRjYm5acWxyUzNHZFZ6Uk5KdUVK?=
 =?utf-8?B?c0lxOGRCbVdpMWlSWWRKUUphWGV3VHR4aWswekZtRDJmYm1lYmRpSWpiWGFQ?=
 =?utf-8?B?VTlWeTVVZkJGNDFlb0hOOFdoeXROY1lqK2RUQWdnZ3ZNR2I0OUg2THlWVTFa?=
 =?utf-8?B?UnZacGJrUVpKVmYxNDdmSTVYUUloek5uVFlNalZKY2xWcWlJSGZVKzdYcjQ1?=
 =?utf-8?B?SFlCaVJ2OC90eWRzUmJPWDNua09jeElaY0lkcWJKSHBHTHlEL05vMjdFdkJw?=
 =?utf-8?B?TE1xVXRvY1JIc0lrUHhreFlkZFBSRTFwSVBpZzdvdUU2M2JpRUhjUG8rdWFC?=
 =?utf-8?B?RSt2Z1FqOXRVQnJlaHF3ZWZOLzhpUUNBTERFVStMdjk5ZWdNUElmTzRiYVo5?=
 =?utf-8?B?R0tGR0hoSVR0b014T0YrUXVRUUdsMTl1NS9VWm9ubHUwRFF0TDRlTnU4bk5D?=
 =?utf-8?B?WnpQaFZLOUFIYWp6eVBiVmRXNWVHNzJJZXNCL0g0NDZHUFhPOFhpMXhwQzcr?=
 =?utf-8?Q?QNRN5xOrrwC5IDp8gS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d850736d-977c-4a78-7930-08df472704a0
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:55:01.9469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhxUD7PiHxAZGiIru6qEw7fKE3hgwtxWyIr0q45/BARtcrd8gt2/Ablc9R/7lhVY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB324412

On 11/18/2026 7:50 PM, Shubhrajyoti Datta wrote:
> Currently dwidth is a single scalar in mc_priv, so each call to
> init_one_mc() overwrites the previous controller's value.

Let's also explain side effect of it i.e convert_to_physical()
indexes the address decode registers per controller but reads that
shared value, so on a part whose controllers are not identically
configured it computes the wrong physical address - and for an
uncorrectable error that address is passed to memory_failure().

> 
> Fix this by converting dwidth to a per-controller array and passing
> the device type directly to mc_init() from the detected dt.

dt? rephrase the variable as dtype.

> This also updates the DIMM device type reported in EDAC.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v2:
> https://sashiko.dev/#/patchset/20260724171945.2812749-1-shubhrajyoti.datta%40amd.com
> New patch to fix shashiko review comment "this is a pre-existing
> issue, but is the per-controller width overwriting the shared
> state for all controllers?".
> 
>   drivers/edac/versalnet_edac.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 0364648d91a1..ea90d3ce3e70 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -140,7 +140,7 @@ struct ecc_status {
>    * @stat:		ECC status information.
>    * @error_id:		The error id.
>    * @error_level:	The error level.
> - * @dwidth:		Width of data bus excluding ECC bits.
> + * @dwidth:		Per-controller width of data bus excluding ECC bits.

Nit - data bus width

>    * @part_len:		The support of the message received.
>    * @regs:		The registers sent on the rpmsg.
>    * @adec:		Address decode registers.
> @@ -153,7 +153,7 @@ struct mc_priv {
>   	struct ecc_status stat;
>   	u32 error_id;
>   	u32 error_level;
> -	u32 dwidth;
> +	enum dev_type dwidth[NUM_CONTROLLERS];
>   	u32 part_len;
>   	u32 regs[REG_MAX];
>   	u32 adec[ADEC_MAX];
> @@ -399,7 +399,7 @@ static unsigned long convert_to_physical(struct mc_priv *priv,
>   	else
>   		ilc_base_ctrl_add = ilcmem_base - low_mem_offset;
>   
> -	if (priv->dwidth == DEV_X16) {
> +	if (priv->dwidth[controller] == DEV_X16) {
>   		blk = err_addr / MC5_X16_SIZE;
>   		rsh_req_addr = (blk << 8) + ilc_base_ctrl_add;
>   		err_addr = rsh_req_addr * interleave * 2;
> @@ -473,9 +473,9 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
>   	}
>   }
>   
> -static void mc_init(struct mem_ctl_info *mci, struct device *dev)
> +static void mc_init(struct mem_ctl_info *mci, struct device *dev,
> +		    enum dev_type dtype)
>   {
> -	struct mc_priv *priv = mci->pvt_info;
>   	struct csrow_info *csi;
>   	struct dimm_info *dimm;
>   	u32 row;
> @@ -501,7 +501,7 @@ static void mc_init(struct mem_ctl_info *mci, struct device *dev)
>   			dimm->edac_mode = EDAC_SECDED;
>   			dimm->mtype = MEM_DDR5;
>   			dimm->grain = MC5_ERR_GRAIN;
> -			dimm->dtype = priv->dwidth;
> +			dimm->dtype = dtype;
>   		}
>   	}
>   }
> @@ -844,7 +844,7 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   	}
>   
>   	mci->pdev = dev;
> -	mc_init(mci, dev);
> +	mc_init(mci, dev, dt);
>   
>   	rc = edac_mc_add_mc(mci);
>   	if (rc) {
> @@ -853,7 +853,7 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   	}
>   
>   	priv->mci[i] = mci;
> -	priv->dwidth = dt;
> +	priv->dwidth[i] = dt;
>   
>   	platform_set_drvdata(pdev, priv);
>   

