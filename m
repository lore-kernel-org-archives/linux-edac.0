Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013043.outbound.protection.outlook.com [40.93.196.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C035DA76;
	Fri, 31 Jul 2026 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785496966; cv=fail; b=XlVEU3AkI0oF7FImPVJHzjUgO2KG72pjA27XMc//V8JTrHmsQlyD6eXuq3g8mHz7r/Z2xeau/SO649m/LXYqpUPN21vWRLCxtG5NQTQdcfMBrRl1eqKOi1K7d9EBfYzkZGJpQG8gWKJXMfJ1XqQiPvYKoIzD2QBMSBJvBga3oQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785496966; c=relaxed/simple;
	bh=7mB9TePnIThEXbzh2qGMgJy9olHWzBVLwufAH60vhts=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oSl90iLAOlB57w/Y8W3rTqZwIFvUh/v2XeGkF7sKWgsiRlo3ExsdIq3/flH4UOf0OOXCeKdMEmFuI7qAFgJj8+6exRGW+yxo0geASTdwcLtpYQph29qG+mYZrykAmuwB1f45bcWio3BHIid0NdzZwc/NDhSdlKY0iU19korRlAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VWwlrxXx; arc=fail smtp.client-ip=40.93.196.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VWwlrxXx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jfg572I/j6IEo+wmlJ5sLFQ5ETTBIwXR1w71FhjdUggOu/W1a/TRBhdqyfbAKePAh1zlJyaJFHakhjH0YUFqssxFQan+BF+PHiqbKSkB0s8QIc8r5Z8jTA3dRTW9bj34ZqPHkvwZIQcfEXApsIfJ4su+5lS9+ik91P0RsBYlH3pcbSvlAnUwS2bt8nnVc5ASaGsuiOgAvSCt/RjrGEqd22sXnNoEu2GfLj7xgT+Db5hCQyAXu0jb3U5mOa+o49VL9uUjLs5WY8WpN4IVN8B4JPzOaCRDsasbGpGUvUn0r683H3Lpm0eYZUPHtdUZ0qXIsvTyA62XiICF29kyCp/GJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bhdZ/hKc1mx4sphwQQT8Q+bRqwrt1zCo/vvRnCb0Sk=;
 b=qdhGBQMJMBeRGxtdWs2KGg/EcVr3jCjDAquUj3+ndCV1Dry8TPIob+65Fo8kgVNF852AnJdKXxFEsb+OBhlGhEbiuXOxRfHBI3C33oTDLp7t7Juxsmd0YB0J0iApbG+a+F0MhQVXjlqIy1Pwnn+D7xvfu9q3PeCTc2OWDY/l5CwklltvfqLe0zuiUon9A3fpKcQG/u4pLx9ezZIhqChyVggGd7gNWxyeFqWxhDWpBFk+bchha6oATrkuwS12mZXzjrpq6+dcgjEvVNDcEZsXWz24T/3hTUM6s8CrgTG49kYqgVaUxdCB8G1ZVgVwjB3c9YprOrnfUwFIiYWR2ZEVIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bhdZ/hKc1mx4sphwQQT8Q+bRqwrt1zCo/vvRnCb0Sk=;
 b=VWwlrxXxqf2413fDPPBnb5vShIaXXiI0sbMNfvnWt1NFnZeYyo8vUDja1GiF72YDSQB9LtW3rtu3wntnQ/2KPm451yP9Yx12GFgIgMLoUiTjGo79KmyxE6QA3lYYewLCYD9teYN5IgsdY9l2yrCNc2+du+ZEp3OTjOUYquBE4vI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by MN0PR12MB6271.namprd12.prod.outlook.com (2603:10b6:208:3c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 11:22:40 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 11:22:40 +0000
Message-ID: <58e34926-1ee8-422a-82f7-0cdab1aaf278@amd.com>
Date: Fri, 31 Jul 2026 16:52:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] EDAC/versalnet: Use dev_set_name() instead of sprintf
 with init_name
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-6-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260724171945.2812749-6-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::19) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|MN0PR12MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a47c8c-e7ac-4241-6ecc-08deeef607f7
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Rp/uUg8rPtyB/raaz0w35sH4dYPQg4UJto24j6JJUOW0CZ8yOw3PRMpvfmeEKDmiPfbxYhBjFQCs2eVgjnIeaUlMOd6gcK2UpuZETzk498fTnmCJhAAP7t0UGin/K8C6wJxmHI3ehtGqprpyCDT1Fuop9MO+h9gxu2RJ3359NZBxXDfko8e+BfNrQyFNJTGJgoZzpr+brBNwZoJSr+M0g6puZ6bPUzgHzxI6TwbFhbOotF8H2J1S86xIWpY5iBcZEEnSrnu5uS6Eq/PS4Xydo5tYyQG5o7wO9HVixceyGN3VPTcoLRPiZDDW9d+wHLp/Sx9YkduiedV0pnm01de3sDvsQ+TQKKASLBrEJWUUahEqJ2DPjiB2Mb96iT1lEeT7vUX8eDeY7UlG3eohcydNqSGE9jVcH/Wehc2ELnDv4SegIXsEOdjy+kuyZ7/aX8A6SzUCF6IEpX5+fiDtPNyw+9mLJztYgJhOHBWXuwDSmQcvJEvzu+oZO4GQqvexCEasKuU2wqQHSvVOuLwEAbGh6UvM5ONjpXg5JXLNbH9VLk8wCgWVlOU9Au1R9Q8oZA41siuEApgvcZ79uG9WunlnA0m4Df7WNaygoCaLFGzrsbJkNipSxJH6tKKuv8k+AYim/o5Icaknc9XK5IInRO2uVbJPj2Ks0nMiP7yCj8AdlTQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enpDNVdHSzF1TlRWYTRBRWU0RXVaclU4REM3UTBwYTdtTjNxUDRnSW0vV2Ny?=
 =?utf-8?B?Zk5jU09EWHdrbXdhYWNiVE9FZzVDajhmaXhtMnFZMjcyZ1o5TUlFQXVBY3Yv?=
 =?utf-8?B?SkNKWGdPajZOQjFMbW9BYzZVSGwxV1Fvc3d2RTBVaFFMTndzajIvbDZ4RVJp?=
 =?utf-8?B?cDh5aGZpYUNrbnpPSHQ4UGRMVllRRlVmMjdzTXhHTDEzeDRMTUZxOEtTYU5I?=
 =?utf-8?B?bHdCWjdybGQxR0VQSThiTjJFZ2ZRNFcvQkxveUN2Sy9nRkV0dmp1eFVQZXJI?=
 =?utf-8?B?K3pNcysrS0k1eThUYXJVVEZ6SHFET1FXK2NuVHd0ZTgwaTBnSndjQXdBY0xi?=
 =?utf-8?B?b3dPeFRva2xjMXUzVmZhUWN0Q09TaDFLMmg2L0FzU1llczJCQkh3NThjUmdQ?=
 =?utf-8?B?czYwMUtEZ1hVVG5pa0o1c1F3N2tGWmNvUFRJelhTOGZrakQ1V3RIbm1pb21l?=
 =?utf-8?B?OFF4cFY1a2k4K0xZQWVBc3ZNdDJVS1RJZEduZGljdjh3SlEvS04wN0xvUG5C?=
 =?utf-8?B?eStTbUpCQmVVNW5FVFpUYVZ5UUV3NWxsZFBPb3hVS1pxc01qb1FJY3BFS2t6?=
 =?utf-8?B?RW1wcW4xTmV5M041elJZUEtiRHdKUjZ1bDg5MEdMMmkvUlk4eCtMTVFGang1?=
 =?utf-8?B?dVcvTmlLazZaaDJSdUlXcFpKbHpQQVY5OW9YUzRTYXlHSGtWQ1ViOEl1MTRL?=
 =?utf-8?B?Q0l5MG9mVUdaaHVsM2dXWTdhR3FrWVI4MEJ6dlphNlRCMThZeFE1aXNxWDNR?=
 =?utf-8?B?MTdOYzZLNkpBOTN3cUQyM1d3bVBzVXNLQXV3bXRGUlBPRjRzWUdhRUF4R3ln?=
 =?utf-8?B?Q0Y2UW1pMTV6UHl0WVc4SnZoQkVPM21WTzdPZ2dtK3RyR2hlU1FtNkhhdFFq?=
 =?utf-8?B?WTJZek1kbmFWSXdsVytvcWgvNEgrZU0yVHd5UGNtWHNST2xoOVZOWWVMUU1n?=
 =?utf-8?B?OFJHVlpTQmF4MWsxdzhXWmdkWXIvQjVxemR4Q2VyejdUTUplYWpkY0RaTG9t?=
 =?utf-8?B?L0k1YkdZQS9KU29XV0JOQnh6T2NLZnU0Mk1LQlZ3NE90aXlBdEg1eEs4cG5W?=
 =?utf-8?B?MG1yMUFKdTJTR09zQjk5M1U3clZmZU1Vdmd5anFGSGhTZ2NnU3BGbWc5aXZi?=
 =?utf-8?B?MnRyNzBJNXA4VDFtU3NnQmNQTjZSMm1UTUFCbUNaT2pXVXdCRFZteGc0UzUz?=
 =?utf-8?B?NHRkVDNYZnB3NHlMcFQyVk4zT1RFRSthZXp3UE9FSmx0bHpiREpTNlU3UGJF?=
 =?utf-8?B?SVp2Qk9CaXpsK1dLSmZOamMxaFBPc1g5RVpuRVFtdk9scU4rRzY1MCt3T1VC?=
 =?utf-8?B?VmdkKzhnUXFWZEUrZ0RGVjJ2SitWbDJCQTMrRlpiZHo1QVBuSzVnaVpOUzg0?=
 =?utf-8?B?YUF5NUdrRXd1dTg0c2puM08wQVpCVDhIeTlmOHpmUmJXUTNVRmJWaXI4USto?=
 =?utf-8?B?R3VNRjdVZ2xmWmYxQ1p2aTNIWDBTYVZTM0hmb2NIalhXb1hhanFxdHBtZjcr?=
 =?utf-8?B?Ykt0eVQ1ME8yN0Juc0J6bVVNekFtYjQ3eGhlMGViNlZpUU5XOWh2c3BZRG9Z?=
 =?utf-8?B?eUZ3OU5Pb081U2k3cS81cVFqSFNVRDRUVGQzd1RDVzR4Y0FFbVhqMUJpQVgv?=
 =?utf-8?B?QXZ6RUEzT3ozbEw0dXdwVVk4YnFIZnpPbTFLYjA5SWNoOU8rL1BkWE90QzAx?=
 =?utf-8?B?eEg1Nlh4dm9aWFoxNnhWdyt1S1lNK01hTGoveWVac0hMbkNsa2Jxd2dNeUhs?=
 =?utf-8?B?aUkxWFc1TCt5NFYzVnJHaXJCMzJyVEdDMWl6TW5POFdPZEMwQk9pYzNpcnVk?=
 =?utf-8?B?WG8wc3hXQkNNQXN3L1pxOXlMOW14bGVLRmlOblBSQzhNc0dRcHRtcUxvSU1O?=
 =?utf-8?B?SHlhYmhyMThmTFBpTFlJZEhLU2U5NFprZkpLZVkyYmt6U05qRUwvQnUwL3Vl?=
 =?utf-8?B?eklYTk4yU21CN1dNSmZsWDdGM1BDSkNTakJtcFpZWFVVeHorYmhOcUlvUzNx?=
 =?utf-8?B?SzRXS2o4L2JhdDRydDE0OEcvdHAyS2gyaCtiMWdhNk9yK2FKYllyWE9hTzFE?=
 =?utf-8?B?OFgvd29TRGU4NFU3QUg3TEZnUk1xQ0w5ZmZEYzQyVGtXMTVBNnZ5dmowVGhO?=
 =?utf-8?B?UkY5OWJUK21vWUtXV1ZBSTZ0RlBBYStHY0JPMnA4SjJJR0hySGFjSUlXWWUv?=
 =?utf-8?B?KzRHU0dMeVpJL1JNMVlnRHZmMjRYYzNsZ2puMzA1bXJxUngyU2xlSjJvVzNK?=
 =?utf-8?B?UU9RUFpYMlBKaVlFQ3B6aE8wU3lXdW1rdS95REZPRDBqTERCbEIxaWFldnFn?=
 =?utf-8?B?MkVmckluSHQ0d2FURmk1Wnl1TFU2SjFxRGcyVEFibUlkbzZHR29vZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a47c8c-e7ac-4241-6ecc-08deeef607f7
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 11:22:39.9528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhIS1eFa78wuBV2veh+XPDz6pWBreHOdz9e6RshEarwLiDrcsmQejm3Ut57nzYnF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6271

On 7/24/2026 10:49 PM, Shubhrajyoti Datta wrote:
> The previous code used sprintf() to format a device name into a local
> stack buffer and then assigned it to dev->init_name. Since kobject
> cleanup can be deferred asynchronously (e.g. when
> CONFIG_DEBUG_KOBJECT_RELEASE is enabled), dev_name(dev) could be
> accessed after init_one_mc() returns and the stack frame containing the
> name buffer is gone, resulting in a use-after-free.
> 
> This is fixed by switching to dev_set_name(), which dynamically
> allocates and manages the name string internally, but the now-unused
> local char name[MC_NAME_LEN] buffer and the MC_NAME_LEN macro are
> not needed so remove them.

If previous commit introduced regression then this has to be merged
to previous commit. Each patch should be correct on its own.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>   drivers/edac/versalnet_edac.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 3c9eaea5a106..1caaba653fc0 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -70,8 +70,6 @@
>   #define XDDR5_BUS_WIDTH_32		1
>   #define XDDR5_BUS_WIDTH_16		2
>   
> -#define MC_NAME_LEN			32
> -
>   /**
>    * struct ecc_error_info - ECC error log information.
>    * @burstpos:		Burst position.
> @@ -782,7 +780,6 @@ static int init_one_mc(struct mc_priv *priv, int i)
>   	u32 num_chans, rank, dwidth, config;
>   	struct edac_mc_layer layers[2];
>   	struct mem_ctl_info *mci;
> -	char name[MC_NAME_LEN];
>   	struct device *dev;
>   	enum dev_type dt;
>   	int rc = -ENOMEM;
> @@ -821,9 +818,7 @@ static int init_one_mc(struct mc_priv *priv, int i)
>   	if (!dev)
>   		return rc;
>   
> -	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
>   
> -	dev->init_name = name;
>   	dev->release = versal_edac_release;
>   	device_initialize(dev);
>   
> @@ -833,6 +828,10 @@ static int init_one_mc(struct mc_priv *priv, int i)
>   		goto err_put_dev;
>   	}
>   
> +	rc = dev_set_name(dev, "versal-net-ddrmc5-edac-%d", i);
> +	if (rc)
> +		goto err_mc_free;
> +
>   	rc = device_add(dev);
>   	if (rc)
>   		goto err_mc_free;

