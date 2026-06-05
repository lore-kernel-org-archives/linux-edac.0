Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D0040E8C4;
	Fri,  5 Jun 2026 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665829; cv=fail; b=pd+Igc/XumT7rT82ZS7x8mFyYXvOu/lYRh2nyajF+BhLejX71GR1QXPE2mSSSleeb9E0m4Lw5QWDbz/VYa6cDNbQYAX2Gjrq2yxb9O57ZM6y47FUidrO52vFGgYDoAHsoWo6/nXjpDUqDmRJ3gQDp3+BrV9cZREqaphAEsiU0es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665829; c=relaxed/simple;
	bh=/1sXCfjoXmw45eWjQQfuqAbismtFsAeJTw9noC0GWCI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vBD59lk9nCh72eFTgeXayoLBfZcot/sjsSygAP1EMZmkuCpj7/4D1xAvD7DgZvgeGOb9S6DR1QN/MC1898tnFKfBTmYhQL3/77c4xTnXr7oIzG/Jyzl8hFTMAD5zY6eQ78RYB0FwzVB7Atu2nVdXvDPE1iqJF47Y/Ata9iUHnbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XVT6dMAR; arc=fail smtp.client-ip=52.101.52.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XVT6dMAR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppBHkN3gIIQvEAnsoBC21uLkz/aif+rLbe4/dYDWs8vh7vyxWWb+tfHmtUxiTf05RwDP5y7CxohAqHqv9yadzrlEWn2ffvQ4cb43nAg00Dz62LNz1okXZuAGj0v/QacBZs9tC4w9S2Znx4FKKLI2ve5YcVFsw/JWx+WTNdFdh4vWo949C3//oon/Il0piwoy8Sm1pMfMaE+drN9KhHJIIcyqi9rtcxmijhRZH7PqtWXn+ZT1pnBq8AfpqUM1WB1VXhE+382c/XSKu0gwugEIQ7Wmdo5AOTQQNRQnqwYjaCdCpYxQ0u2C/lJ8H+FrUSW1LNDS7CDe3+9T2FcCmb/YXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA14A5P5FW9nshEL9p7ccZtBBMr6l5q5zv+Xh0SEhv4=;
 b=CmfGV/KjtQCCULovafOBIQjSl5oZCmxlJHzoh75xV/RxhK7LRHwyIb5HUdLKa+/L3qJcp81m5LnYIq7bBVxhPp4SMPyd9RYyvKWygTmwao7JdaVkgHv0i3FX2P7Zyw3kL8l4Zx/mTtG7x9s5SV3wwCMpB/uEbWMWC5b5ug3i/dlDHDu+e2CdOmxZKRFBFPfGuCAqWJGuyz9XZ0AkDFuQ9zZGDmiyrLZG+tsSpvH61goj4nZGe5zqgMPCNK5wUsAr5Zs7c5Pih0Vm8IdRstjdH+veCKIQhUGxV/efqfAd5yrCYIWsb5lQDR0TxxmOIyEOsKbXKcIgzjxDks39EGd47g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA14A5P5FW9nshEL9p7ccZtBBMr6l5q5zv+Xh0SEhv4=;
 b=XVT6dMAR9EZ7qYGOZrO8FNetxRiLFUU8enRdXK0FrOFnVjGSIoOHggFVu2vxQl3IJGhgi9Rs8sp8n9VQQm1+S9LzhtL9SMEplsE2y+s0lXYyfwoYkAxMRJbFm4TxrEEHUhwv1jk4swB+W1AUMvgcdNyGpMmn3sXe8Jdoa+EAVSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 13:23:44 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 13:23:44 +0000
Message-ID: <0f117472-4af3-4aeb-8c8a-c64f9da088e1@amd.com>
Date: Fri, 5 Jun 2026 15:23:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] EDAC/synopsys: Fix cleanup on injection sysfs failure
To: Yuho Choi <dbgh9129@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260605125417.2348115-1-dbgh9129@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260605125417.2348115-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0270.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::43) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: da430109-1b74-4753-6f78-08dec305aaff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	piL1n/1b23yiNzyLCXQySNU/sEFNeV4DUgJjZN14Z+KVDaiEMIOge1kAAw+bGRv/EgyUulgZPWsC+op7nDmMtN+QSiErWD11bUD+QOQpfSCZVIrnm1TQONG+QIMJi3Un7Qw6GCMo+xsc2xz9YDmwBRYeO0Qc61V2Fgu2q03uEHbQPTT4IgFVVQZYo24Zf2xwof6O9cpVwAMfIYMs7jM0YByd8moUB3BxA6IUqHawFFstbavh9edfMaycA07YgATZjOdppkBdXXYfGEEpR4Of/aN5aEwsZPxl9O5xyScBoQGV1eTBKXmdbx6ljIJvkkwMG6SDUnpWHHuEluEoVc2TfnWSwqxB0uYdfmQD51WbY3/iKuhLx1a88loy5QC/OE5LfyrcIW3gWq2bkrkGNy5v4i3SCHC+jGYIDFCD/EP7LNrc0+BM4ITY14ZBtAEOQilR9eNMqQkQAw89bXQOAoNZQpLr9mVUq6lOk/o2Zn3A32r81n6+QttIqBJYtZhn6HhR0PIr9PPbLoUvEufJjZYsB+hO+XkEvbeth7b4ktpunHfg4lZmY0DFhTNaKSrpdUwNsAjNSgKLzup9gaBqgWtq23/Ad9Hs57qgM6giOh3N2mJwaK5A15//tkXtF0oWWGcRjWA7YyW5H9O3psE65HI3z+5BS0ttN6jhX9gohQGfGWvRXm/Iae1ssU6RNU5E/FlI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aS8zQkdtYUZsa2NTMHp4ZU0yeWl6WCtmR055Sy9DaFJqUzQxLzZrUUtYYTZm?=
 =?utf-8?B?WHNZdnhPdUIwV0xhOTQ1cUY3c0tuOUxOdjlvWDBMU1orSW5RWDRiR2R2aW45?=
 =?utf-8?B?K1F4VG4yL3EzT3poenU0c1UwZkd1Z1VCaWVpT2lOVXhma21LdGVpdWdrbjFy?=
 =?utf-8?B?RjBZRUx1b29QYzRUMkJVejd6bmVSTVlVSVFBU0lCT00rczQ2eGR1RTIraXQ4?=
 =?utf-8?B?NTNiME9ZU0pBWEVJQ1N1azI5eFRjM1F0L3g4UDZITExGOW8xVXQ4aEdWUkwr?=
 =?utf-8?B?UCtSQUNFOTNRaXppZW1hdWJaalpYM28yTG5PRENPOUhkNitYclFoQnBTcW5j?=
 =?utf-8?B?dit3MFMyMFZqcmo1RGVnNkxSY2RLeW9NdTlndUVmcTlCK283ZDZlcmJjTU9s?=
 =?utf-8?B?diswbXlZN1IzVWV4MjE3Mk1COC9XOEJXZXpGMzVGWWV2b1NxVElySTJUa2M5?=
 =?utf-8?B?QThHTmpwMjRyZHR3UHdIbWF2L3F0Mm1oSE81TEk0Qk52TWIzeUVzckRBSjJS?=
 =?utf-8?B?RVVUOHRiRktpMGFrNEpVekttZGlnakh6eFRDQ1l4WXVqNDQvZUZrK3pLaEs3?=
 =?utf-8?B?WC9GQ0VqSGszRnh2K0JxcnpmYmhyeEpFb001MUNIc2o4b2VKZUhXU2pkbHVG?=
 =?utf-8?B?blNUeUNaUWpBQ2RHME9GVUlQZXEyM3FOTDZIdWZmbk1Zd0tCSUFPTXpKa2h1?=
 =?utf-8?B?WVFML1htd3VrNXJ1cHhZUGgwUnU3NlNJUytIbTJERWhhR2VSbHB0OWhibGMr?=
 =?utf-8?B?TnpQRUErSUQyZ2FJQm5QNUhLRDFZbnpwVkNvOTY1SHJ6dEwraW8rT0JmWHZ2?=
 =?utf-8?B?Z0lzNXEzNWM5NXNVRE9sQXNMaVB1UmdNR3FsaC9qNVNOMm12YkY5VUNtOXE1?=
 =?utf-8?B?Ylc2cmZwUkFQeFRYZ1h4aEZQN0ZVa2M2a1hoWitId2NpcHZEV2NrRW15eWVz?=
 =?utf-8?B?RFVObHRJSVZXTkIybXZJTENWbm8vTE1PdWtEOTVDWng5a0IwSHl5N3RlYWxt?=
 =?utf-8?B?L0FuRklyenl6ZzhVQmR1ekpPRDlhT3c1cTRDQUhXdDRQZ2h4OXZaUXdkbUlN?=
 =?utf-8?B?bFJlNnhwV0RZSmQvV1RERWxUMnRUbnpyV084cDJJbXFQOFJkL0hHdWxOOCtn?=
 =?utf-8?B?eCtNdGFwcU14Vk5SVFgycGVQMXpQczhHdVM5dTgraVRMWFlkbzBmKzNMYkQ3?=
 =?utf-8?B?UVNZdG5nRkozMzFadVEvcm5QQU9xNDVzY2pTRWVDbjRqOStnT1U3bVMrZVoy?=
 =?utf-8?B?NGwvMi9TMUN4blI1TllQSXBQMXZ1alpRelhWcVJxa3NjT0J3eE1MYTN3NHBo?=
 =?utf-8?B?Nko4UEJaODU0Um9aVkNmbFRya1J0RC9HaWpHK0IzNVZDTGFWbEpNRk8ydzN5?=
 =?utf-8?B?NHNzTFhpQkVaZC83SWpFckJMS29iSXBOWFlORTVmVzNGcjJYQjNzVTI1ZGFV?=
 =?utf-8?B?Wk9Oc2pEN0pOTjJqTUV5Y1ZxclJURHF1QXdydHIvN1N5U2puQlhwZGM0VkRJ?=
 =?utf-8?B?WldKYXJmZjhSbnVKRmZoS0hPMHVjWkR6UDFkUW02VkE1aHVCNnNoUTBtUHpC?=
 =?utf-8?B?TVlKUlRkNjFnN3diY0Z6SlkwYm5lOENLWnJmQUorYk1mOFpsNFFqUXVzNXBw?=
 =?utf-8?B?UTVZSTZTa2p4L3FUSlJPMXA4T0laakNwTlFMSGlUSURmYm9zQkgvc0JYaXp6?=
 =?utf-8?B?MXpJai9kSlQ3ckFaajF5bVg4ckVJRndrWFdZU0ZhNWlmdHdDWXRrQzdKMW90?=
 =?utf-8?B?WDhuYS9uK1ljN2FBY0JIQ1l0aGRsU2ZVUlNpcGs5NTBQOHdHalVHNW5jYWxR?=
 =?utf-8?B?R2cwdzJRUEx2QjNMVGE2ZklPVjJyV0FqM2NxRVhWOXpjdUFNMlBlTC9CcytU?=
 =?utf-8?B?YTJTYmU2d0FNcHBXVld0U1J0L1A0dy9NOVB0VmJFU0VKdGdCV0JaNWxaeTYz?=
 =?utf-8?B?SnNrb2tOcU9RTkdvY1k1eUJvYXAwRG9RYURUcXdRUHN4WFhKVVh4UTViblVt?=
 =?utf-8?B?M3pSUm8vdncyRHlERWpKRVlIeUY3ZklQdGpKMTU4d0gzblhGbnBYMmMveERY?=
 =?utf-8?B?QTdoNDdwcEc5azBGWTE2QTNnZk9RcE9IM1hrZXZCV2RGeU1tWHVMb0RUR3F0?=
 =?utf-8?B?SEJ4c1V1U0RTaklXMWlhcGFvVGgyVDVsWEtiUG56S3N4L3FVczBlV2lZZTNX?=
 =?utf-8?B?V1Vucm9YaG82V2RlQUVNbWg1ZUJZZ080U3laZlV0bXVzaUFUelBsTit3Y3pG?=
 =?utf-8?B?V0IvcGRxWEF2ekxCKytIVldhZzNjRGJReEo3bGZ3am1wOE8yeWh5QmdTMmNi?=
 =?utf-8?Q?pP1rL5kt7Et1PVT1gg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da430109-1b74-4753-6f78-08dec305aaff
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 13:23:44.4948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNSSwCz+1xQMZUvSo344GJWs6hl+bOsU1N5Dj6lHv18466/A2uVSwbi4XGoeF4mg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597



On 6/5/26 14:54, Yuho Choi wrote:
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
> Changes in v2:
> - Remove the CONFIG_EDAC_DEBUG-guarded del_mc label.
> - Call edac_mc_del_mc() inline before jumping to free_edac_mc when
>    edac_create_sysfs_attributes() fails.
> 
>   drivers/edac/synopsys_edac.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
> index 51143b3257de..9ca2a842612e 100644
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
> @@ -1431,6 +1433,7 @@ static int mc_probe(struct platform_device *pdev)
>   		if (rc) {
>   			edac_printk(KERN_ERR, EDAC_MC,
>   					"Failed to create sysfs entries\n");
> +			edac_mc_del_mc(&pdev->dev);
>   			goto free_edac_mc;
>   		}
>   	}

Cc: stable@vger.kernel.org
Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal


