Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924F03C1987
	for <linux-edac@vger.kernel.org>; Wed, 18 Mar 2026 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848592; cv=fail; b=aRwZ1dCVvv6Bk3s/t/5PMEisNvkc0GdU/vZnIZ464y0nBgFMoBUANtIBY6BM0OTvekObXx6u2k5HQNN1YR8vcCof8pDhLqYVW9Hd9vY0IqyUKzIdjtU1EjGz/L1agC+v2SzuOysbASBJavJUZSguOeli00Gtb+aw3x8xPkxIMhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848592; c=relaxed/simple;
	bh=UlR8Sp0a6pFQQzMaQjAVkWGHC8FMKGBBVhgbaFzfs5w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aGR0DF7OlOQhgTu/8tI6poNC9I8jAOuOwiezjfxkeBwvdCxIE9LZ+OGWKmXVQfq0RKye70JL0vl6cMI4EgG6XbMBpizUrTanX05HMtRpZpZia9VwSJ2AnTskLvnXkagS55fwFKLSfZZIhNk+9x+IDO1vGoO9BupaxI4aRj0RWWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eR8grd8t; arc=fail smtp.client-ip=52.101.61.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eR8grd8t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpOk6v04ftaU5Kfv7Po9hpXXwhrcqD4FA1ZPxfUQiajlIJ64r9PSjZItKpXsZ0+HSz5Kk0x21oI9j08tRm5rktdZ+QY3IC9u5vkFhumGGUIRJ22McTBlNPTkHivbzOGYpQpeEZTALRHK7JPtF5DQ+S4eWMMCQlTs3uGU8u9DcDjmaNoZFHZsoI7MhI5zjnBxqyHlH6R98oTFUwuoA/zOlTaR2m4ASP03V9rSpOqbVc/2MeDDw8TS9ulD+jUmP5hVbxidgOWyfsGm1nv5KD0WF9+ATcXlntXRY5I1uninDkbgfq33Ltrx3yfnQebL/twAAgmcL0Yql54POoqgf+uw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtGFNKFptRYEoUjlk81SikLvhmWfYNY5Tm49AT21PaY=;
 b=luJ9XH591OTYH3TUbws2us7I1D4bNimkJUFEtpiqGJNqgcVwlmH7GtfDHkpGl+VnUgeFSxPTpOuPfmzGx9Uco9lwKD7TRHKTQL1lnAnaToG+OYz/8AtN3Wh1+PhXDkKgvdcaQ4UDjkV+RjlrXDeSx6auAY7t5o1DMXfDKIiy5zuJnuSrLRTEImfCTd1Gjw0gcDHjwCZ6el7iA+17L0Jr0TaAIFWnDmfNINN+pRpxrUGFFcPdzhfi8za5f0G/iMqtDqdYHLCTzcYa4MFNGzfbI/P5hSmOFste6fL7PPajTQlugyn/1bU7h9iOPDrrnhKviD0JBTzQTqEkhnVvJ8DWww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtGFNKFptRYEoUjlk81SikLvhmWfYNY5Tm49AT21PaY=;
 b=eR8grd8taKWk9zR1RNHOUpNkRphsJHMmr4495ygLawZkNnte2F3z+xDXWW9efJdMdQkH7vrR+J5PjlRwP+K7ryTSg/aKkbU5Z0DXKIEks+0MIIkhRpRc9YC3V8vKpTh2QGHQUNeQqcYWNMsZ0bJgcdHZGiNKt1a4iiGFp+A6kdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by SA3PR12MB9129.namprd12.prod.outlook.com (2603:10b6:806:397::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 15:43:03 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 15:43:03 +0000
Message-ID: <b7c232c0-51b7-4ebe-9c9f-20537628fd38@amd.com>
Date: Wed, 18 Mar 2026 10:43:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RAS/AMD/ATL: Decrease message about unknown DF revision
 to debug
To: Yazen Ghannam <yazen.ghannam@amd.com>, Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, superm1@kernel.org,
 linux-edac@vger.kernel.org, Shrirang Deskhmukh <Shrirang.Deskhmukh@amd.com>
References: <20260305154528.1171999-1-mario.limonciello@amd.com>
 <20260306145003.GDaarpm6p8A-pFBCCf@fat_crate.local>
 <a9a4aeb8-a044-476d-845d-0368f90624f2@amd.com>
 <20260306153223.GFaarzhwApsh3Jdqdy@fat_crate.local>
 <47075497-6bb8-4da3-b8b3-63901d9f3b05@amd.com>
 <20260306154947.GGaar3mxJ1JkcC0OgV@fat_crate.local>
 <20260307144910.GA113343@yaz-khff2.amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260307144910.GA113343@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|SA3PR12MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 030316d8-b702-4d08-305f-08de85050ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	b2/4XgXnRMJ+mL7cLNiFvE0P0E0lloIuT1HGW9knFhz/V/6suSDMfFJpGBjHC1vbfJFHRHS4C8zg030slPe0m2bvqSamnwXPUi+pvw9TKiGQ475Qo01ubRltUCdSh5vzAvEvyt9HOvnEoJN+IK1BVrfe3k/oDZU8k/MccpLdlIq0Twqocx8ULRchQMmR6kM7Mo+vqKnIlMsDJY6OUjnSaDXSg9ssH8v1ANL69rTQwX1R9mxynt9sloE+Gh0sFLQXThmKxd24edpnbipglsBNWzl+Sxm2UE09Mz4TkmePkhCVUed5JdRZd9vpvA6+ahltvdfnuVHgbg6dQB+/JVy9JFFQ6cU/J8R6Lofso02UIdmsiit6ddM1cmaYZBJrUatvwMI3AAugqeVvwEeaRua3F1BYOwkWj9i5JQJzDc+vh8V+It/2IpNQpoRvzmajGA/fxIz6P/2pRE8MAc52o30A8xh5dagQCuCK4HRIJ6zpOSrb4JHQ5E2HbwYMEbJFUQsrbNiVGT9sxrol5OpTbg4OVQJLuERKaHqOpAx0JYdYhu9nFaIHZXO0yACmcw5uenJuzr4wuAfApec6HSSjU7Ceq68L5yctzT2RRW7vplrJuxDfkjj77XjoraKrsQcTD3XZppqbYwRjFXeXKPNVw5Y3mkb1SUyXTzRkStxsSmCiSazp17c0Tt0rOmb1/u4yIzt1psKCxcpAUaTAx4mnoc1Fb1kRiDC0L7E7VnwnG6ZFr98=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjBqZE55eCtJMm83ZkFadk5WVldNWUhzUWJBbHNjZnN2VW5RUXdiRlpmdGhW?=
 =?utf-8?B?dmNyaE5DZTduN1VYM1BPbWtmcVg4b1ZjRG52VnA5T29uOWVneDFLeWtwemF5?=
 =?utf-8?B?QlljMGMxY00yditPMHVDdG1hd1AvUjMrMGJXeW5HWm9yVDE4K1V4RTFLT2s4?=
 =?utf-8?B?Qi9vTFk5UG83TWdEMy83cVYwcGtWb1dZY1NlMG1xVHlQdng0NXJqdGlJSkhi?=
 =?utf-8?B?NU9CbDUwNGJhbnhWVVVBdWhlZUdqenBrR0F6cjVIcTBIVnUzU25idENIYlNz?=
 =?utf-8?B?RG50bU85dElGcklYbDZreDdRSkVPN2RERExDU0RlYjRPZUhDQ0Q0WS9xeVRV?=
 =?utf-8?B?TnpiclRza3JTTGFkZ0paVk5zWGZkcFNCSmt0M25ibVlka2gra3JackM4b3Bk?=
 =?utf-8?B?ZWVxcURVNHpWWFFpWWU2cUQzc2dnZnUvME83Y1ZhTHRKejNTSkpSdmRmTVRK?=
 =?utf-8?B?QTByL1lySXdldGwwR3NyYkx3bEl5c0I4cHVEUC9XY2kxem9yWFZDamJTYVNj?=
 =?utf-8?B?ZWYrMS9oMHZPOHloS25xdHhQUEFCUmNGTGZmMk1WWjMxVmtwbmlmdWZ1NmJX?=
 =?utf-8?B?ZDZmK3dFSXpnQkhxakpKbXlxcmxIK2IweXR5cjF1YXVFNjRHYnlqZUZ6VTJO?=
 =?utf-8?B?ZGpTZndQVVJ1ZEUyY1B4c0k3Q1dQR3hWcXlLMm5zb01JNVZsK2gxTmwzTkpx?=
 =?utf-8?B?TGJERVc4ajdpMHh0dmd2U3JTL0wrWWNtU3dVQ3B0U090UnBLY2JYY0htNnFL?=
 =?utf-8?B?S1I0RXljTlB1V3VJelVYU0RkRzZDQnl6Q1FsZ0UxVU1NZlR2UjFxV1lUN1Q5?=
 =?utf-8?B?VHhFdXcxWmc4SlJ2S3BWSGRpa0N2SjhlWnlHRkhQZTZpYUJvRTlDd2xVODR4?=
 =?utf-8?B?bllWNUoyRGdSWDE5ZmNYR1hQdTJjK1diUGFYcW8wTW80NkZLdWNjbFhwMGxK?=
 =?utf-8?B?Wkh5dWhWcmQrUTUwWEdYMitnWUtqakwrcXVxcWd5aDh5TG55UG02UEZ1WHlW?=
 =?utf-8?B?ZklYVGtRS2tBdWY1ZFFnalJjWkZQYXVoakd5MHRJVW94U1Nad3NsNTl0aUNX?=
 =?utf-8?B?NHIvNDNUa1Zwcyt4Tzc1QXN5dURMTGRmSmdTOWFVQ2IwVzlmWWlEbnB6bkFU?=
 =?utf-8?B?a1FuVElXdnpZZ3JuOExsMnJ1YTRILzEyYnRFZFFBWmZ2TDdOTWFqbnBDOWlX?=
 =?utf-8?B?NlU4SEtJajZDSkhwUS83ZUJONGlzd2k5bFhiWi9KQmxUcTRoVk1rWm8wMEly?=
 =?utf-8?B?YXhJZ0s2WHExRkZOc2NrclJ0WW5EZkdDdWJONTByZ2dDR0ZwZ2hiUmZLc0xX?=
 =?utf-8?B?a0xqK3d2bU5yZlRaTmJiQVl2RkI2Mzd0cWtzU0FDdGNvSXdzL0JQa2ZKVlZk?=
 =?utf-8?B?alFLWXp1TUhxc2dlT0I0YlRvRzBGZjJXWGsyK3pXVUtsK3ZBb2VhbHhWSlY2?=
 =?utf-8?B?bmtkUlJoeGtPWE5sckFVMGNieHAxYW5VclZEbTEzTXZSb01SZmsyb1I3d2s4?=
 =?utf-8?B?cmZJZ2pmR3R3OVdRSk12N3hEV1JxeGtERkFXN244aUdIQ3orZkJGVXJ1bldV?=
 =?utf-8?B?dHFCZnN0V3VjSFR1VTMrTElSZHh6N0k4RHd0N2d5bVhQaFFLR1NpMUIrUS9i?=
 =?utf-8?B?QlhDbkd1Q1kxTjBRckRieHd2NnJYcDVySFI4NEwzdW9GQVRGWEZWMlBnWUVx?=
 =?utf-8?B?T3g0VTBzd25wakNqVU9FT3JCQnF1SFVPVTJnSnFQdEpiemRrZmg3Wm5qVDU5?=
 =?utf-8?B?L3JVM29SSDc4NFVxbGJxSEVxTlJlT0xkTjR3aWxjellNcnZKRGxDQ2VYeUN1?=
 =?utf-8?B?NkhlUjBLdWorMyt2RVdMakh1b1l1SkZZRTc0Vk1XMnBCbFhHTmU2Yy9FSDJ6?=
 =?utf-8?B?R01OaEYzZlRTemhLUUJMNVFxRTFLNlNmLzU4YnhGODQ3UXlVOTRGSDlWNEx1?=
 =?utf-8?B?RWU0ak9IZ2xsYzNEQjFtNERKb25SSGkrNWVmaUNnQld2eTIvU2x6ME00STR6?=
 =?utf-8?B?SFpXQmEwSDVYZ1d6M3RLWU1ML0JCMVcxZzg5WTF2QmNCVkZTL0hLRVNhR2VP?=
 =?utf-8?B?WG01bTR5Zm5hVFVYRDhYaElvejdocXdGS21vV21FT2doY2hMK09ueWZ2S1p3?=
 =?utf-8?B?cllZVFdvYU9kMUtXcXl0OUlnTjFHalhQemRRTkFiYXhxYnBpL3dzNkk0Skkz?=
 =?utf-8?B?ZjU3OE9INGYvZGp2MUg1TTBaYTB3c1BzNlNXemV6aVBvVjZrTlpyVHZjakdB?=
 =?utf-8?B?L1VJT01SQjVmYU9NTzkzTGk5WGxLWFNMTFcwdzBTbGcrYytSUWU2YjJTcmU4?=
 =?utf-8?B?eHBsYlM5djM2VXlCMStvMlBaN0tWOG1FU3NoWUtoeFZnYjJlYnhudz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030316d8-b702-4d08-305f-08de85050ac1
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 15:43:03.7295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GK58KUQfH3KFlACA4IeB9iVNWmZEX6lwzu9wS/dYuF68c/zxdk9aLnpYynE+awQKiRMwczfHx7w+/9p6qG6nww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9129



On 3/7/2026 8:49 AM, Yazen Ghannam wrote:
> On Fri, Mar 06, 2026 at 04:49:47PM +0100, Borislav Petkov wrote:
>> On Fri, Mar 06, 2026 at 09:40:06AM -0600, Mario Limonciello wrote:
>>> But don't you need to use UMC to discover that?  Chicken and egg type of
>>> issue.
>>
>> Probably...
>>
>> And we already do that in amd64_edac. So perhaps we could export an API or so.
>> Yazen might have an idea...
>>
> 
> How about having EDAC load ATL when ready?
> 
> Thanks,
> Yazen
> 
> ---
> 
>>From d4e3cdb2efb34ccb2c234a4b227d0301327ad340 Mon Sep 17 00:00:00 2001
> From: Yazen Ghannam <yazen.ghannam@amd.com>
> Date: Sat, 7 Mar 2026 08:58:56 -0500
> Subject: [PATCH] RAS/AMD/ATL, EDAC/amd64: Only load ATL when needed
> 
> The AMD Address Translation Library (ATL) will attempt to load on all
> AMD Zen/SMCA systems.
> 
> However, only systems with DRAM ECC enabled will use the library. Other
> systems will fail to load the library and produce an unnecessary message
> to the user.
> 
> Remove the ATL module dependency table to prevent autoloading. Request
> ATL to load from EDAC once all system checks are complete.
> 
> Fixes: 3f3174996be6 ("RAS: Introduce AMD Address Translation Library")
> Reported-by: Mario Limonciello <mario.limonciello@amd.com>
> Closes: https://lore.kernel.org/20260305154528.1171999-1-mario.limonciello@amd.com
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>

One of my colleagues tested it.

Tested-by: Deskhmukh Shrirang <Shrirang.Deskhmukh@amd.com>

> ---
>   drivers/edac/amd64_edac.c  | 2 ++
>   drivers/ras/amd/atl/core.c | 1 -
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index 8908ab881c85..7b04f7c5e2ba 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -4170,6 +4170,8 @@ static int __init amd64_edac_init(void)
>   		goto err_pci;
>   	}
>   
> +	request_module("amd_atl");
> +
>   	/* register stuff with EDAC MCE */
>   	if (boot_cpu_data.x86 >= 0x17) {
>   		amd_register_ecc_decoder(decode_umc_error);
> diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
> index 0f7cd6dab0b0..d77dacdd4f56 100644
> --- a/drivers/ras/amd/atl/core.c
> +++ b/drivers/ras/amd/atl/core.c
> @@ -190,7 +190,6 @@ static const struct x86_cpu_id amd_atl_cpuids[] = {
>   	X86_MATCH_FEATURE(X86_FEATURE_ZEN, NULL),
>   	{ }
>   };
> -MODULE_DEVICE_TABLE(x86cpu, amd_atl_cpuids);

Pretty sure this means you can drop amd_atl_cpuids as well.

>   
>   static int __init amd_atl_init(void)
>   {

