Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012055.outbound.protection.outlook.com [40.107.200.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B504BCABB;
	Fri,  5 Jun 2026 09:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650222; cv=fail; b=A8xg+qJ3F3wYXdFothgDC3ad/ns7z8G/evdIuhzAfxbzh0Cu85nofbP3bIA/gvICmDHuwuXp8Zh2b23P9LeynRxmKh0nwRxHKdgiIEmhjhulJsTcTS/5yP4s2zctUyijXSvI/oMFrQ8gx0SCKhegwrPkInxrlIQu3BHN+hg2j1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650222; c=relaxed/simple;
	bh=jR+pnAdD7JQE8IyuWh2V/z2BNRhKhwmDuaMfchMMl6Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fqscxt8SKgCZosOsj47PysfyJBJfIEhoW1Gml4MvV66b40aVoQwQqmshEmRZkzYbk1kiF5YTNzOEIjDVO9xOEKkjVcxXglEQPsNwQjNTy4xRiiVjHwYw5LncpFnud1k/Vm6IIzMDxjvX/Dmu+3GpTZy9MPvUzk3QcmDAZ/6e6Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JekCWzjX; arc=fail smtp.client-ip=40.107.200.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JekCWzjX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exGcSNH4OfnsU7sQRcq/iRUowVTkjrNKKWQMdiUUcJSZZF9T7ddiqigdIrH5QoLOo9sIJ8RjZ32Ebe2YygttledRjoTiPo9t3+vuHyKME5pT1dA7wyGCuJ6i3J5NpMErQnl5X7+aCHSlCbOFXVDV5bzwosR77XS+Wcjo2Zzn+xMSh3+LnXpXt6qD42xBgNKy+yPF1I8jmT3zI1g+Hvdwve+8xiQFIJtTu/YuuoXgf4WwhGr+IMygzZFUUNC3wDEChj3syF+pMRUKk4kBvQOMLShXklB69SFl7n6J4fUxCbjmkHRBy4/VYsWHcv7LXf/Lb0iXewx5eSeXBF36j5B3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpdntpYpQ0Csnq6Bcq6EhqzpjY3cP8bfO13e4w6sEs0=;
 b=FTthy8C2ZV9rK29+3KjCGJvLBemxOsqGkkv7S9IyIwANEbw9mR8D36kHZYRgQyGfg2EFaDE0ErbZJJNWWlyybT6exgMflXHIwyN6Na4IWtzHpHD2TSmM9NCWhN6XcW2F+nPFzMK4KjN72JiAbUScn5QQ8/P8u9ujw2nOjZcSrmoOPq1RKkQb34AAgLOcf7BQjZu8Z6AripndoeZNkhjOK6S2SDMwg5WpvLNAvbcA4xx6rupfeZbR9ZT+iQqZQsrq8cdiBqxkiPnGlqS0WB3yo2tJ21V71VxR45LkS4bSCSLzMng0WOiJyiLRyRqqsWQzfC/yZHsaON0E+DNudXzIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpdntpYpQ0Csnq6Bcq6EhqzpjY3cP8bfO13e4w6sEs0=;
 b=JekCWzjXRWY67nsVY2p7HPahPQbfMpKa3Emz9LZl+NYHqd7OJb0Kt9e4Vcw8FIuuqHDRp/dLYILfMQCTrfKdDuZ5oYJjR9roygczqqM1Yf/MLDtuKMcL54NcyXf+VkX2AW+gnUEcHMHZg24wNpqWpFRZ6ZzvvuhL3Aq00qBy2Yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 09:03:35 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 09:03:35 +0000
Message-ID: <78e66f8f-3998-4051-99a5-7b5fccb40943@amd.com>
Date: Fri, 5 Jun 2026 11:03:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] EDAC/synopsys: Fix cleanup on injection sysfs failure
To: Yuho Choi <dbgh9129@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260603204721.2200819-1-dbgh9129@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260603204721.2200819-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0156.namprd05.prod.outlook.com
 (2603:10b6:a03:339::11) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: f508c763-92e5-47b1-1a51-08dec2e1534b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	K+r1r6veoSZiEurNghn9vbNC/LohPJ1vSdVxbZVOBuhy+V3BFb2EGkC22eDD4XRlnefKpWgcIszqMnygBV4if/uBmWr+2PMDkpkCp43rw/UASVtcyYsy5dn8xN0Gzgaq8x7elRVGbozhweiIT4eGvbKFBEfrzeIDkbIN0HOEuj0niAPbDvpy2Ln702NNebR89KnZszbc+9Rwy/Jq5pNpFhyo+G11WDmSAiNBDKTe91KQybMDReGxQQXeh3LWlf/KuEr/cFaKcrC5WwCrRGRUd+9umGh+0wqmaJE64sMinUhEVH4DvUR1aBY/AoiTfL9lfTVdIGyrbmmwH885REtQtr5tmwt2CMkIHLBHgq3JdBSkaEVqrq0sn0+0u2M+cdAvWJbVfKIKV1VNkko9txVgjUDp5reuXg9AprrzEv4pzTZavewAedzsgzKAfHo/4zls52+xI6LLluR+yGKN7JJim02M92XqwnhAT0l0f+X7vqjVY4fuAnO2p2BkGK500faeOascv32CyaI+EZA1f3zIuM+TFWFHP5tiHTJyIVS7SLnlT/QepNzA50YuW85nI+MBu/WvxpLi/OFRYB2Esy13DM3yZlP2SbMFQM7MDYZY0B3omzbxN0Tq+z2YxbjgGOKnzc+DmySilkUDJkkBJw44g5Taj7oK3D0D62f2G6JxwC9RqlMNiVFGE9bgAarJ62sB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFhkZWVNOVMxVkE3elJodUcxLzJCSnVlaFZzUi9LV1pBTmpBRzJGY2RHRjVj?=
 =?utf-8?B?TlR1cktzc1h6N0syMjBpQlFQVjZHa2VGMFhWdjl6M1NkTUZnK2dnK3I5cFlN?=
 =?utf-8?B?MGRGSzM4ZFNac1hNRXpIbCt6dGkvNmZKL2dQM09JbUFMTkZHU2hjdjJYQjEx?=
 =?utf-8?B?c1dSdTRsY01OcXJ4ZHZwMHA5bjhjbDVLUEdLT0Qza1VNa1lianE3aUwranBN?=
 =?utf-8?B?SDBiQmI3ZXJVWGFWTlFsWkZUZGI0b3BSR2hRWUJzRktXblpHN1p0RDluTUV1?=
 =?utf-8?B?SXpERjhzQytCelRRVm1IRktQQTdrNHRuVVpBUWxkTkxHdHpUWGRJcFJieFor?=
 =?utf-8?B?RGNWT3lOU3FFTzFPZlJMQ2FsYWpDOHhPSkkzUVlYajJhTjl0d29VYWdBREdO?=
 =?utf-8?B?YlJhTFpTODR5bkt4SnJqK3VNc1h1bHlZS1paU0I4Z3JsaysvaWNTWklyMUFa?=
 =?utf-8?B?T2tXSkE3WmtHMnA4VVFSRVo1VllPVWx6bkluNlpDMFNKZE1EYSt0aWE2THNx?=
 =?utf-8?B?YWgxN1E4djBMR1dBVDBvMDgvS0wvZXk1SVp1ZDVFbEgvRGR1TG8yR2NhWUFv?=
 =?utf-8?B?SEEzOXVrOEQwRHVyWkl6bDFNdDVCNzcvdWc0QlZiYlliVkxYdTcvOE5yV3Y3?=
 =?utf-8?B?TkdGSDc2eFRtSW1qdTFpNXVtWXVHR2hJY21hY2dVVk9XNy82U2Rza3VVckNY?=
 =?utf-8?B?RER0TGhNdjJ3TmdKVWUrMWtoMjFBMUxIckFFZkN6c09yVnc1RldIYXBaVlZE?=
 =?utf-8?B?VjdlUXZnSnFNbEMxSERVMG1YbVB1OHE3Tk5RS3Q4c3ozci9IQkNRWUI4RVEr?=
 =?utf-8?B?OHZxYjc0UGRJZEp6L1ZoanU5TllMQnE3SHpqOGd4VmQxTnFwdm0yV29DN0Jk?=
 =?utf-8?B?N2JwWDdPdHgyT3plSllNS0k4Rm16TEhnREpoSUVIT1hxR1EzNVdnWjI0NUdH?=
 =?utf-8?B?bFNRek13S2FiYWY2U3VMYUJ4TkRIYVQxVmtPM3V2a2loM2RDZlN0T21UZ0Jt?=
 =?utf-8?B?Y3J2QmhqT0JiZGlHWURoM0Fjc1lveVJpSnpFOHMxbHJwemhlVmFUVzVQbU1x?=
 =?utf-8?B?OXEwQ3BQZm1USlhTcHpqWW5kaWhmMW1kRXRaUkJHRHJjRHNYOXdIQVRMdGtO?=
 =?utf-8?B?Ti9vbGUvTTUyRFovYjRnMEY0Z3JJT3N3SGVVckl1TWZGUElmMi9yallwYmdy?=
 =?utf-8?B?L3dsbWErZjZZWHVPQ1Z1MnFROEdyTGdlSTJxdmhvNHg3TmlXWG1pb05WV3hX?=
 =?utf-8?B?YS9OUURRTFVHVFdOS2RqcmVEbzVJSEo1TVp2dGdlYVIzcS9mNVJ6WnNMdFFS?=
 =?utf-8?B?aHFpVklOdDAydzR1S3BYcVJKTWJYWjM5QzQzeDdUUHpRbXFtUWRHbDdBMlh5?=
 =?utf-8?B?Zm9mMGRhRG5Td3NoMHJJNHZhMXd4VUFTVTRvQjdSU2xIekpFRVY0MGY4eHA2?=
 =?utf-8?B?Z2ZQQnNGSWtISjdpdTYrSlc1N3lBMmswcEdiYXUxSFd2ZjZvUGw3Z1ZHYnFr?=
 =?utf-8?B?TzdwWVIzWDIvd01tbjdmQ3NRZ0dJbXBPK3RKUUllTlpmUlhmMzkxOE51Lzg4?=
 =?utf-8?B?MitFOFY4TFlUQVFwVEthbTVCMzlLMjNXUWRpOEhsejBJem5ndi9nVC9adit2?=
 =?utf-8?B?aFk1MThYUW8xOCtwK29hd2FiNVN5bVVENmJJN0xUQUwwekxJTEZhMGI3UjYx?=
 =?utf-8?B?NWx6MmVTekZjRVM5S2dheG9aTlM1djZ1bHhXN1NydDNjUkpGTDJqc2ZnSU1U?=
 =?utf-8?B?c1lQUXN5Zm9lWlRzUFczZExrbkJsbmRpUU04aWw1dG1hNHNiN294WjZVc25F?=
 =?utf-8?B?K2E4TjhnSnh3RnZJU1FkMEpNaVpacnBrT3ZWTFhKM1VZSU1jTktZRFdTQjVU?=
 =?utf-8?B?c2ZoU0xlZXNTcVUrUEppQ05JU1RuRy9sSlhlNWVpYXZXNU5JWWVQUUtScFhP?=
 =?utf-8?B?LzNPcDFoRW9aOEw1VkhieEFkMlo4eWFEaENqQ214UmRPTk5NZTZwNzBYMTZR?=
 =?utf-8?B?R1NYbllxRTM2RWJsZlIvNWwrbVU1OEZuUG1CSkZEWWxQRnNrTld0WUpsdldh?=
 =?utf-8?B?ZzQ2UlF5dHk3aWFtMnhzK3pmM1EzME5VWS9GWFczZUw1OVplazlYdEZyYmsw?=
 =?utf-8?B?MkljUTdYT0t6cFc5aGx5UDhidlRKOWVOUDlLakRSM0J5L0V4SGdSbE9RS0Fz?=
 =?utf-8?B?SUJvY1F4eWVHNHAzOFNuK0F5MHFzczN6dW1TVDg0RnpPalJ3WVI0ejBCOU4v?=
 =?utf-8?B?MWlLWU5TbjU0SW4rR242SXBvQnNtRGpHaXFDdHpBQXFoYnR4S0oxdCtMWVRj?=
 =?utf-8?Q?uVsvVM6nlrA7e+iS7v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f508c763-92e5-47b1-1a51-08dec2e1534b
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 09:03:35.5176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hp1tZ71ecaXH4TwEIC2XpHT+InzCaWP4jK+ehk0oDg1F08nwXlOTqYqGaw7LR5Me
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305



On 6/3/26 22:47, Yuho Choi wrote:
> edac_create_sysfs_attributes() creates inject_data_error before
> inject_data_poison. If the second file creation fails, the first file is
> left behind.
> 
> The same failure path runs after edac_mc_add_mc() has registered the
> memory controller with the EDAC core. Jumping directly to edac_mc_free()
> skips edac_mc_del_mc() and leaves the registered controller state
> unwound incorrectly.
> 
> Remove inject_data_error when inject_data_poison creation fails, and
> route the probe failure through edac_mc_del_mc() before freeing mci.
> 
> Fixes: 1a81361f75d8 ("EDAC, synopsys: Add Error Injection support for ZynqMP DDR controller")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>   drivers/edac/synopsys_edac.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
> index 51143b3257de..c395a1e97a36 100644
> --- a/drivers/edac/synopsys_edac.c
> +++ b/drivers/edac/synopsys_edac.c
> @@ -1120,8 +1120,10 @@ static int edac_create_sysfs_attributes(struct mem_ctl_info *mci)
>   	if (rc < 0)
>   		return rc;
>   	rc = device_create_file(&mci->dev, &dev_attr_inject_data_poison);
> -	if (rc < 0)
> +	if (rc < 0) {
> +		device_remove_file(&mci->dev, &dev_attr_inject_data_error);
>   		return rc;
> +	}
>   	return 0;
>   }
>   
> @@ -1431,7 +1433,7 @@ static int mc_probe(struct platform_device *pdev)
>   		if (rc) {
>   			edac_printk(KERN_ERR, EDAC_MC,
>   					"Failed to create sysfs entries\n");
> -			goto free_edac_mc;
> +			goto del_mc;
>   		}
>   	}
>   
> @@ -1448,6 +1450,10 @@ static int mc_probe(struct platform_device *pdev)
>   
>   	return rc;
>   
> +#ifdef CONFIG_EDAC_DEBUG

I don't think this is nice way how to do it. I would do it above to avoid using 
ifdefs here.

like this
    		if (rc) {
    			edac_printk(KERN_ERR, EDAC_MC,
    					"Failed to create sysfs entries\n");
			edac_mc_del_mc(&pdev->dev);
			goto free_edac_mc;

    		}
    	}

The patch itself is correct.

Thanks,
Michal
