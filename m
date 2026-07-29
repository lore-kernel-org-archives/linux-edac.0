Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010062.outbound.protection.outlook.com [52.101.193.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E9A4CA29D;
	Wed, 29 Jul 2026 16:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343251; cv=fail; b=luPS2K5VXy1OxIXcjK2x6y2tSroRlJL6IW1ojgvV7CLD6mYPalKUzorkatucYbu3XuG/D79XatXom/Rffkv7iUmTLdo6OlBLLWcb4VYzIfxzXju28WMGZl8ZYv96AmOB167N8f9o/ISLfuvWZnwD2PDT3Ov7lH73+r1ZsBhdLso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343251; c=relaxed/simple;
	bh=ijibZC+sREOy+dIM8TurGJ7SFQWtlVEg4x2eeeJHxpM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l497OhgHNxaxIIiz08hT2Ttkd0fGf3WuFePusXQxtSy1HqFIPkvhHdthHcss5psRwdgzpez2EksfMe9qxkYa4bV1uwazyuvF7cJXboi47yRFaMjjJpJ/xQJMF5KYZnEuuFIDnFdx8xikBshvtsuxqqQnV9tkiIlAP7T4d58LJWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f7y6VgGP; arc=fail smtp.client-ip=52.101.193.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f7y6VgGP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MA1mDA6asy4HhJb0JB7zj+zo2GtSLiwngW1NRCrrXpHWGTBe3Jc8OKAqscVgUcsHS5/SApgzBG9mJVt4wWEg39PR9RIAyM+ZuJ75yixIojOnYLU0X41ZBfxqvvv+s0u7P2LdlwQvPoxbvY3RS4BheA42j2w0rD4NUWKN1n+UeV8sBMlx3FwVYIHRk/P7IVdNTDBPI+ItnO2x03vce6V9/hZ2cEwtRjCoBThpxiNiLWlb8xxxddEKnqaQpqPK/Ub96LH9UTrrD5JRrA61hiKpJCyjqFg77ouE3pun32vZxecvt+ZAhIrHzedJDYrvA+8e8VWBZHsP4lkOeM82H0mi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oztlbBV3Y5d8FIpYNp3gZqsa9zdeApu2gMA783Y/RY=;
 b=PotSI6lDN0toUgkIGtkL+91FEtN626Hx3uTlO1gxuES5XOT+0z3uhVgX93WZyw3MUljxUF8F/Rbek5bQA5KybLWuVRkTEBgIMVGIZEM8QSsGW+FFxKMEi2p8UAK5BU2Kr+XXJqgp6thmefGuynPd/eheKPadJgb3ZhLV54ZnW+LSs6gvCGHLKi4HHUaaA/Pu/F0IQzwO7Yxz8jQrwvh7IiqXJWg72gGYEALAl7uFbB59eefOx7nBejnzuHkIyvksytg6GXbW+rkpHbuOVrmjVHNOHqAZ5sDPbNMI7jm8K8gTP6M0G9zf/UnoUkyFzp92BMZ9Kvox1BnFVlW2jvwOaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oztlbBV3Y5d8FIpYNp3gZqsa9zdeApu2gMA783Y/RY=;
 b=f7y6VgGPPO9q24lNifUi4gCj3jdBjgkLJj9zQOaNvYvcsmbOT5ho/EBDpsW0puT2rADMgLmleykvz5nlNiodN3LwSNCDcL/fkq8+2oZ+dFOYJRcH1IyY0CMUS+SflrdrTS0XgntNutl6faEr9q2Ac5ceMaTbBkkpKUGU6KYGqdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by CY8PR12MB7242.namprd12.prod.outlook.com (2603:10b6:930:59::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 16:40:37 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 16:40:37 +0000
Message-ID: <34ffba5a-8e9a-49b9-9e36-c31d0e4369f8@amd.com>
Date: Wed, 29 Jul 2026 22:10:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] EDAC/versalnet: Add NULL check for mci in
 handle_error()
To: Borislav Petkov <bp@alien8.de>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-2-shubhrajyoti.datta@amd.com>
 <20260726235228.GAamadvFK6GYNRx_dh@fat_crate.local>
 <511e62ae-79e6-4931-a7b0-4f0c3830cdcf@amd.com>
 <20260728013725.GBamgH1WcvOaEtAw4n@fat_crate.local>
 <5554052f-398b-4507-b2af-152a7695abea@amd.com>
 <20260728213300.GDamkgDK_DeaaHFHff@fat_crate.local>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260728213300.GDamkgDK_DeaaHFHff@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::11) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|CY8PR12MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff3da24-a7a8-4cf0-0223-08deed901e38
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Z+FlVf6Ipq4XACGCLTz/SI0POujWcKIYDhNxHZ4vBQJzDFCZwtYWwJGjfn3co9xabxfuys7k0i7+Ub0hKYPaQsKrMTqM3Sm6GkSm8hmY2OEIEnKxDhzD8GLQMQ6H6uAYqck0IGZFLzO8csmpDbwwblJ/a32u0nBHSxbhfiYTQXhLkRyxeWhZpIaV2m0+1WPMlD9kDH38G6Tpm75sT6WAShpAtTHTckqXq0jAUl+CVEpR10p/f99zRB+cuCPpG/Ex2wmOsdjM0vAHDIoaPBtmwTdCKLw+lIkxBQkJ1dNPyMdfTXdsh99jZOLMZHc2ubgFRQg2lJKxECBZ5ur7Udp66mNPBa3c/lMCJrsYKmy8AfAtA3KY/lZ8QHOifvQbpB+xBaeYSR5puOUCkexe2FHUp+tgfbHvQ7ElwREu1JyvpCyp+lVMRw8Qlh+hMd3YQ66lUTQ8/62HxINw9C+O7nbQ3HI4ArbyYTYYWKKkIdYToioR4M9JGTMDpPDhmK0CwwzNZbKAF34ypTgxQO9kouXoDaiLZSblqDLGmIcEB5M+hmm+XpATgEqkk54p8TFLFsmFb54KgJxmVwMOk5mkINsiTaRD3nzWfkqQtTjsgTJG61hT639FHsG1S4atllSFR4ez2sC0LS5IRcjnxeOUM3G9O99YLWPOEi9ZQ9rKCoAGicQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTVGQkhyVmRWa3FWRWdJZ2ZQd1N2SlNkVllaRjIvNG5xZUF2bGYxQmNzbmQ1?=
 =?utf-8?B?WDViYThIMjAyV0NQOVMwZ3oxVk5SZEFrUnBoMWxhTkdXSGNSYXNNTzRRbG13?=
 =?utf-8?B?NjAzcEJOOXlVck5VS1Z6UmgyT2V3Vk8weXh6UldKTWtsWllLa2J1ZHVxUnNL?=
 =?utf-8?B?d3YxeDR3dHZ3dWtWMnUwM09iZXFjZzRHNHVyd0dJdGF4Y0ZpWmtPMnUxOEhM?=
 =?utf-8?B?b240azJPM1pnOUF2UHY3TkhCSmRDa3o1Rnd4ZSt1anZqSlFBRkZTLzJBWU9M?=
 =?utf-8?B?SCszRDUrdFg5bk1CMFdEcGs3Y2MyQ2RvVkVZNGNyMWM0WGhTQ1Z1WTVpRmZK?=
 =?utf-8?B?YVIvUjhaN3RNYVFRTURKeW1meTAzNk83bU1zLytOYXN6a0J1QU9zQUtzL0xO?=
 =?utf-8?B?RU11dWRrNG5jdFNFeWUzdDgzSE55RlBCRllNVS9Hdk05WnZleU9SaDRQd2ZS?=
 =?utf-8?B?ZVVPYUZDdFBidVFSZThsODd3K3I5bWVKMWFwMWJOV0Q3V0FqWHVGN0crSitN?=
 =?utf-8?B?d3I2Qk93RDhZajlVdXJ2VUJtQkFxcWROa2NOTmdCVFFLdmhBQ0Y0OWplQkIz?=
 =?utf-8?B?MjAzTWlIelk4WllrYzByK0NWRDQybk9wbFppVUF1RVhzbTN4YWhqY2RvSjFZ?=
 =?utf-8?B?OHl2RC9qVjR0cnZUV3hhQS8xSHp1NVdaa0llQ0JSWXRqY0ZqOEV1ZGFSeU9a?=
 =?utf-8?B?VVJUMG1KRkkyalorQzlpUENIOGZ6SytHQlU5ZDNoODI4TjZESkNXYWtxeFZX?=
 =?utf-8?B?Q1h2MkFtbDl0eWdTWlB1UjJTaXlTMGZkVmpYZENjL1JYMldzZXVPNm84NmMz?=
 =?utf-8?B?SjhLUmJBbFFkUHZQNExCTjYralJhc0ROQURqVFBOY2dSUXpOV2VpcHZjRklk?=
 =?utf-8?B?VnV3V3g3dGkrU3kyYU1Ucm9aSXl2dnpIWnJNU0RBYUQ2MHhsVEswVUhxWHNG?=
 =?utf-8?B?eE15TTVkN3BvNW5TYkppWmhUQlcvUm83RURYS0hrVnFSOUhGeW5OdVFlQ0Zn?=
 =?utf-8?B?SlVJQTI3ZCtUWERrdlR5Vzl4TnlKeER1ZTFhSDFYd01GYlQyby91dzEwSVpy?=
 =?utf-8?B?RzhDb0xWNWtnYXc4SGVuMkt0bXZsNWlaNE9CY3NpWjNqSkNZbk9PQU5pVHZN?=
 =?utf-8?B?NFNLblRKa2tlY3NpT3h1Yjg3Y3FzS1FFRjU4YUI4bzhmWk94TkVnMktkdjFi?=
 =?utf-8?B?ZUl2WnR6UWpyTDZKRVc3NXF1amRJdHBTeDdBNnFtaVJDNFM4amFWQXh1bmk1?=
 =?utf-8?B?aDEvVTE5eUJwOXlIcWM3WWxHT0djN0FCd20xM2xaQTJkNUdZbzh1YlJjTHdL?=
 =?utf-8?B?QlVDbUZIZVZyRllibTA0enNGeFUzdkthbnhCTzczS3BkbjBGQURQL2hYNjB4?=
 =?utf-8?B?YTNMSzQxdnFtV2U0T2MxSE1JdHE5K0RjNm5kVlF5S2JFTk9kc1hrMnBidXFD?=
 =?utf-8?B?c3VQT0duNXowdUJBTndpeU1qb3VZUlQxNjFnelYzWG5PV3dLTUNuNWhYaTRG?=
 =?utf-8?B?azhKTVRBaGUzNHpUVFUwdm1ZeGhsS0VLa2xyM1hqZkEzOVUxa2c1K0NLYS9m?=
 =?utf-8?B?bmtNT0J0WWY4dkxLK3ZlcFBuaFpyY1BvemVkaUJ1UDRTSHROc203dTAzYStK?=
 =?utf-8?B?cHJtYUV1R0xVNTRGbnUvaExvOWJGY0pjQkE0NmwrWks2U0hZVzRJbUVHTVdR?=
 =?utf-8?B?d1JzU3Zvamp3K2cwakc2cncrV1ZyT3dEclJQaWFjQjRKR2xidDJhWld3dzJK?=
 =?utf-8?B?ZFc4QUg0ZE5OUFVsR2x1NTJrclRWUGpYallNZFB3Q2Erd0tKS0dPd0lnemRR?=
 =?utf-8?B?ZFJxQTVSM1FiclZaSGErVXJRdlo2dGlPWU5sZFowaXY2WE9uZVJZcUtKc05T?=
 =?utf-8?B?b2toVTRSZG9uSTBGYXZCTWJBZVJVRlV2b3RYRU1ZZzdQYzd0SEE1OElMaGs1?=
 =?utf-8?B?azF0ZmZYaVhqY0YwTlc5VGJ1bUFaZnlRSUh3R0cyTDhkTGkyNis5SEJjbDVO?=
 =?utf-8?B?dzFRdUlJM2JGc0lPMWlVWTRSZUVob3VXK011TlVQbVppV2RrRzNNaGVCUDV4?=
 =?utf-8?B?eGxZYTFXaGRweHRTYWV3MzVHQ2ltMEhHMDNFSG5pbk1TK0ZHeGo5eTVvV2hM?=
 =?utf-8?B?NXBpUms5aHRRV21xdVBVUFZHWEdqUWtQV0lmU0hidy9jbG9NQ21rT1k2UnJw?=
 =?utf-8?B?TTl0TjRaUkRLWHlpVG50L09LNEhOY2dwOTNab24wbTc2T1hjb0QrRjRhWTF3?=
 =?utf-8?B?bzlwMXVER1kxNU9VTVhzZ21EUHhBcFhuR0lNYlJ5RjIwMTZMc05CbFdqMXk0?=
 =?utf-8?B?eTB1T1Z5SHZwdk4xYzFVdkJxSjBPSHZLOUpLeVp5TlFVNHVDZUxoUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff3da24-a7a8-4cf0-0223-08deed901e38
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:40:37.2688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhmpsFn3jRXesoqd+gLzwqdGs/0iANR+n07Jp8jwK+HHLJo1JJT8/LOpYIC11QM5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7242

On 7/29/2026 3:03 AM, Borislav Petkov wrote:
> On Tue, Jul 28, 2026 at 11:57:28PM +0530, Pandey, Radhey Shyam wrote:
>> One clarification on DEV_UNKNOWN: on Versal NET, the driver exposes 8
>> MC5 controller slots, but a given platform may not have all of them
>> configured.
> 
> Are you basically saying that you can have non-contiguous controller slots
> present on a system?
> 

In the Versal NET designs I've examined so far, configuration with fewer
than eight MC5 controllers uses a contiguous set starting at slot 0
(for example, slots 0-3 populated and slots 4-7 absent).

I will let Shubhrajyoti comment if non-contiguous controller slots
are possible on any supported platform?

Agreed for real init failures if initialization of a controller that
should be present fails, probe should fail and unwind all instances
registered so far, same as amd64_edac.

For v2, my proposal is (only if contiguous slot are supported):
-Take the supported controller count from the design/DT rather than
always iterating hardcoded NUM_CONTROLLERS(8). Though it has dependency
on XSA support(hardware description metadata archive exported from
Vivado) and DT binding getting accepted.
-Run init/remove only for that range.
-Treat DEV_UNKNOWN as a probe error with full unwind, not as a silent
skip. Indices beyond the supported count are not probed at all.
-Document this model in the driver.
-The existing WARN_ON_ONCE() check in handle_error() should be
sufficient so the current patch can be dropped.

Shubhrajyoti: please chime in if I've missed anything or if you
have a different view on this approach.

Thanks,
Radhey
