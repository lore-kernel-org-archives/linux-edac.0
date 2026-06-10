Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C94031716B;
	Wed, 10 Jun 2026 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126161; cv=fail; b=n/kNa2zURzj/qB93qoBUY+ueg0w38JUjzMRHaVlOrkSKcytfPqediHlpD6gKKRwq7nXD/0fSAnoD3/ATveQF5BE2hjnK/R3oJxbKtWF84/XkgADmeHed6cmkAtEltK7qsriGtuvtcno1bXSv4fAMMFzek0mDpUkHAsVZHQUHpv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126161; c=relaxed/simple;
	bh=8Vs3hxRNna2BidpPZPTZBitiL42yF6Q0CHZZyARllDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZdbTLfYZeACyONk2YvxIMYsIYmzx0Znty7/yKUgUfsrs/QX4WgwoFNXg5twFsCthf/uBaXyClrBMa9QC/mwN8LMPvSjGHaSndrM/ZlISAar9WdQmYVg8GTzWxXNKbpXw14OshjIcmssgOScJ9ypWNVxA0MxhuL1elqaeqglAjbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CJS7Ctde; arc=fail smtp.client-ip=52.101.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CJS7Ctde"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXbqR+LYoL3FAuQEenBcfw4AMOrj9pvkMN22egu98IurChf/RJXrJRuUnVHYjA9875dhP+ETnNRknvKceGWoDwb0CXp3Zqk865jUg5rV3NalXw7Zu7NR9pMut0zcDA8llOgt0i6cykoaO3/ui1dv5OuhBjVgAERHqDRvExW7C9u1NvY1++gZwUXxNKi98VuR1PY5LfY7OJjJsrXtYHAbz77kL4X5MJxU5BTQNIwX/CvcmxFIWpA4EFm6741cxjsGyOXL6h2Aq5PlsGkWvuAaklCVgZ2dBkLS9rLK3NuS3vElAduQVe4EYKyXxBuIaPTZ3Hbzlz34Z8nQJcfUknPxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOKZabzZ8aJMUT18YuxQ3eyoUMXMxSGOQs6dmOdZwig=;
 b=x2BW9hCLEVLJZeO16dIVUk9cbeGx9/T9r31UINNFXbhDtOA7eQcpZsApLhREh0WYRQVm22yU2xJgrWN959LQDJP8l30NpmeOUV8TJCxg1cQ0rlM3oGOzNH3CbgZVIVV3Bz0FGc147Vo4BpjCNl/IBAp4naQYxnDq3KgPFdf4XanCeQqXMnIzK2M/398wl1f3Q6+QgZuEsDU8OVUPM4TJKEVOsEAb0quKW9QFfAgg5spZslR7LGlvzc4xSZPXU45ko9mersGquujyyrxJTq85fR5GyCRc2hRMXZND1SVrP7YXTl7IQ56oIASSXDxqnI2amELtGiJa3S+KVtzdJBIhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOKZabzZ8aJMUT18YuxQ3eyoUMXMxSGOQs6dmOdZwig=;
 b=CJS7CtdeA1aOio4p+sDslscRqjAj7Pbh0rHWh+mRhdl3jytok6QQOI3NHd+LUBba3uEG1PJ8C0RQQa0F2zRPjMSr9GMh3S7cgM2uqP5J8NHuSMB96Oz9M5RibrAiUk5mSFB/E15Iqkmuw22AzZybISfAaBRpqtUpKNrF7Lm5Lpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SN7PR12MB6672.namprd12.prod.outlook.com (2603:10b6:806:26c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.12; Wed, 10 Jun 2026 21:15:57 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 21:15:56 +0000
Date: Wed, 10 Jun 2026 17:15:41 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Message-ID: <20260610211541.GA831811@yaz-khff2.amd.com>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
 <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
 <20260601184100.GA4547@yaz-khff2.amd.com>
 <20260601210535.GFah30HwoSEavRkLXu@fat_crate.local>
 <20260604154856.GA1625873@yaz-khff2.amd.com>
 <20260610003516.GBaiixRCclQEMwY_9d@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610003516.GBaiixRCclQEMwY_9d@fat_crate.local>
X-ClientProxiedBy: CH5PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:610:1f0::28) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SN7PR12MB6672:EE_
X-MS-Office365-Filtering-Correlation-Id: a8cb02b9-1197-4585-5a99-08dec73575f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4aYGaKlOsfjl2oUduGOLeTEUKGf6/izPtLjy0HvQZBSbJp4lLxNPUoOoLOVE+zWp/827Wa0LI+lyp+wbZb2rfmFtV9Q30FlOMt9p01La4bHOMBY0/Yfly9ITpS2WKCJNded/HoKaUJN7JgpX4WlvHH+ANqlhmWhcwFd7vaQVrq8vwOMxa3fnFjcvJo32gn8YphLM7KIHIS97sPzYz5n6vgkgmAgqMS3fMaAjraqgwNMC/zgL5BreGAsxruWr/iOiDspbzWwBxvM5g63XGsEnWymUsYUUzRb/6EOtvvXC8dG6xrwHYY45eP9whU71gtwv/5Q+RWljw/0HhM9fVWePsdl54bFcdTPAPk5SLr+VHIU1b6EZEkkyyQk6NMXfkw2a9JaXTWOB1X74gCuC/A5/uYAjA8WyC/F08gjdSZKGC71LYDZ2fAimoYRSm8GsrCGoET2ajNv5W/Jaj3pP5SILQXNlZfa9nsDiTwafHa7rQGufTvevKp8+I9H73oif+H4HsdfHnMocVjMH5talTqzW8dzMa3UgBAaUJuPU9N7mWJ6m+4ezM6EDpwJSAdxpafoAGx58CbQTBBCkk2iZLlFgF1mkytqKfZJd2wNVwL9MVKVdRPML6gkwF221fR/MmcQ/SW/52css1xOdU+5lTF2qIQbDLWjmwc6MrtWhqCMzbf6FqHi2EMD3/X0yqygpdmGI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Om6QLGFna8fZMvf/4Au49jszRx4rd6rdvbi4JL/nzf2nxDhbJH6vj/XT5IQ4?=
 =?us-ascii?Q?c8FIsXgnwLk2iJcnKrBoFwxha9J+IvLLFv+tc22ufXj8mG2Q+/JXPc5WlGWS?=
 =?us-ascii?Q?/zOzh4Kr+EXl/tKx9loQ6nVL8q8Rd7dQB5CvdQzE0ALGikvR2x1QNTv14t0m?=
 =?us-ascii?Q?uJMFkma9F/WNoKSN47oM3rTRFp6MDadECFC+s2cO/D4A397eXr+MJq/EXjdY?=
 =?us-ascii?Q?HddZhG6qhpxEwzNScNDoDBGUG2bAVCdJdujRCMQr6gqr6X6sZiIPHNfPMEV9?=
 =?us-ascii?Q?mogjGO8g+MJwp9b2gg2UhS+RzEdrwI8FDcjfnPVLpS9HVFEQKVGQ4ldsnEfH?=
 =?us-ascii?Q?OrkzpNVznsH5uwiTidd+792C0lxicTxSh2eT7PabsTPhzqBMzyY9kshD8lPn?=
 =?us-ascii?Q?XK9fo8/yU8AOvqKv8xkqmjNRZ8lgFClv2BDKvIOyt8Vq86kX4rHxWrDjCTr4?=
 =?us-ascii?Q?0thqDrM6NDMx5SBL8I0fsdYIy94Us1bAzTNBlJBwZ1ud3SZuwxt5HixGb6Sj?=
 =?us-ascii?Q?5NWsCvo3roX5GlnU/KXW7CI1H0b/h79fKU9HgXdyLOFcaUPEuFFnWWQOgkSl?=
 =?us-ascii?Q?5UsNxIfryQ78yIYw67gPOXxHihRtkvr3HsQy3C35BPA/0sADKztzK87h9MLQ?=
 =?us-ascii?Q?0nYAag7e7Rwlohr+XDAhv6NrZ2wdL2BgQ7Wupg8pJyJXYHcMabg0bNG/ZSlR?=
 =?us-ascii?Q?ly2Fq1AZBcuuIte00lBaxsCiE4gXraYeAI4/7Eyb0d4fMn2noh0EQfhiqwJ0?=
 =?us-ascii?Q?8rFl00vdh8k+hKzcJCvC3PJ4pkfNlX7+/d08jmflfGNLBMBuXaEEOuvuxkHu?=
 =?us-ascii?Q?zhEFdEASSqVVol3yxGQkCQqVN236brx04vcfEmFLjlWmO64R0uceut4kXUQy?=
 =?us-ascii?Q?LedaZExDPPPRu/GZQ2KfsrL2XpfBgYVz8OfaOmqwlxeBxqliwWZcxDIwTRa2?=
 =?us-ascii?Q?sgTnmkkk2QkKFq6/nAfNeBE2wvRYnM2VlshhOWJ9DAI0V1egnhRjVFrOuRKB?=
 =?us-ascii?Q?sZq2ZO9sOC/UCM+vSLTmE0MUm0SORkXWN/mOMAikCUAHTUaR7pUQjKm/N8s0?=
 =?us-ascii?Q?Zw8IcRpFvWinLyhfiCZXJeyF7rHJ2eZCIBAqY5bPnv2LIo2anXHJgrXHoCFs?=
 =?us-ascii?Q?NB8C2P1qyPzdJ0AoJ9nEMy3zs/tRuba6IDQp5ijWvSrSphlCMZnAA3QN2yy1?=
 =?us-ascii?Q?lqUDMpdtf5XqyScClOl884LnAlAZYVCZnUd5hViWuu3bOShSS3k/V5c2KB1Y?=
 =?us-ascii?Q?Yv8QuUhAJAqfE4wAM/Txl+7ZrF7jkscA55ajF4choJ3TXyuf4NNFuZndPL37?=
 =?us-ascii?Q?/Zfq6KDEQB2zd5QcDEDtu3OB/jbhtd+XlyDS5j3pIgqTzuKBg07n9itIw+2D?=
 =?us-ascii?Q?50Ev8B4yk57AeX2M8lai9lX+qrbHK5o3m8HOy67kdr4RHDcx/rseZvGHtMeF?=
 =?us-ascii?Q?L+XGKefMLm2RDM8PbIq7YS+XwUxZ1Lk+PN4CILiDiqA2zFTqivvjwlnZPZsE?=
 =?us-ascii?Q?Cc3gv3+LkrJxBae6Cm05awWoJzT0bYS+Jy/413/eL08qxrosaV/F0Bp1zfA4?=
 =?us-ascii?Q?ePd7wyvJ1hjFPLXbG9tF9QwraxOYcrS1A2hzLrMMqE7dimetOlXYLI0EaxZA?=
 =?us-ascii?Q?myeV0ucDuUXYJWjcsYQJXo0kB5mLum42OhIM31nyeu+HLi5MGJCB8s8MW9qr?=
 =?us-ascii?Q?IKoeLrvGjIabQzIZriZLWzAg/ChEb77c0Dz20T9ZpJjyF3Zl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8cb02b9-1197-4585-5a99-08dec73575f5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 21:15:56.3345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyVSeg84lUuLeCRZFnqFib67pECEsfeWqPhkGSXHlCtLKbNDMqZUsQVBX/DH9fb0g7rY/oyYhF/X8udYzpJkLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6672

On Tue, Jun 09, 2026 at 05:35:16PM -0700, Borislav Petkov wrote:
> On Thu, Jun 04, 2026 at 11:48:56AM -0400, Yazen Ghannam wrote:
> > I think the issue is having concurrent updates to mci->error_desc. EDAC
> > assumes a single owner for the MCIs. The fake_inject interface basically
> > acts as a second module/owner.
> 
> Ok, something like this. Ugly but it should show the intent. It probably needs
> more auditing whether we have copied all the fields we need down the
> edac_mc_handle_error() path...
> 
> diff --git a/drivers/edac/debugfs.c b/drivers/edac/debugfs.c
> index 8195fc9c9354..034b9b3f9cf5 100644
> --- a/drivers/edac/debugfs.c
> +++ b/drivers/edac/debugfs.c
> @@ -14,28 +14,38 @@ static ssize_t edac_fake_inject_write(struct file *file,
>  	struct mem_ctl_info *mci = to_mci(dev);
>  	static enum hw_event_mc_err_type type;
>  	u16 errcount = mci->fake_inject_count;
> +	struct mem_ctl_info *imci;
> +
> +	imci = kmalloc(sizeof(struct mem_ctl_info), GFP_KERNEL);
> +	if (!imci)
> +		return -ENOMEM;
> +
> +	/* use a local copy and copy the struct */
> +	*imci = *mci;
>  
>  	if (!errcount)
>  		errcount = 1;
>  
> -	type = mci->fake_inject_ue ? HW_EVENT_ERR_UNCORRECTED
> -				   : HW_EVENT_ERR_CORRECTED;
> +	type = imci->fake_inject_ue ? HW_EVENT_ERR_UNCORRECTED
> +				    : HW_EVENT_ERR_CORRECTED;
>  
>  	printk(KERN_DEBUG
>  	       "Generating %d %s fake error%s to %d.%d.%d to test core handling. NOTE: this won't test the driver-specific decoding logic.\n",
>  		errcount,
>  		(type == HW_EVENT_ERR_UNCORRECTED) ? "UE" : "CE",
>  		str_plural(errcount),
> -		mci->fake_inject_layer[0],
> -		mci->fake_inject_layer[1],
> -		mci->fake_inject_layer[2]
> +		imci->fake_inject_layer[0],
> +		imci->fake_inject_layer[1],
> +		imci->fake_inject_layer[2]
>  	       );
> -	edac_mc_handle_error(type, mci, errcount, 0, 0, 0,
> -			     mci->fake_inject_layer[0],
> -			     mci->fake_inject_layer[1],
> -			     mci->fake_inject_layer[2],
> +	edac_mc_handle_error(type, imci, errcount, 0, 0, 0,
> +			     imci->fake_inject_layer[0],
> +			     imci->fake_inject_layer[1],
> +			     imci->fake_inject_layer[2],
>  			     "FAKE ERROR", "for EDAC testing only");
>  
> +	kfree(imci);
> +
>  	return count;
>  }
>  
> 
> 

Right, this fixes the race, and printk/trace would be okay. But the
normal EDAC interface won't get updated. I think that breaks the fake
inject use case.

Ex.
1) Use fake inject to target layer/severity.
2) Check EDAC interface to see layer/severity counters increase.

I don't use the fake inject interface, so I may be mistaken about its
use.

Thanks,
Yazen
