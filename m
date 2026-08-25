Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1243B585D;
	Tue, 25 Aug 2026 20:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787688398; cv=fail; b=grwpLh67AY+hMgitcGy9e/x8FtTKEs1/bkdVEFWls8otyZCNwN3wX9xWPSTxPsRIUT9gWzBBg8w7MUPSg5wfbr92XrXXzsudnKGDplobTPUI0HPhqfz/NVy7c8KLSCqlgM1J3S3Eevwr3p33IBiXJb0lTFaHLXIdrSqb0+7WK74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787688398; c=relaxed/simple;
	bh=0Z/8CIZNr3wqEwjHo/rsvJpqQ+Yvra1CXiYFtp4LVB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EZ3pwQzE9GbrfzQfg3up+vd2sLLtIekNxmy3iPfsDwkeyvvg322gbKiqPBT0fdh9YnXTAanpFLhw95FSNz0NuNxjLWVs9uE46vIXJQImeNy4QJslXv7CThV8OFJqYd8k/jm+icFixuMflq0Yjo2qXdcfJdCTbzQ5WwUW7dVaW9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4lUeaWvL; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4lUeaWvL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ss6tjWTKYMyKHC0MtVD4v4qcM6xt0nZLKx3DEKTWcLwa56sWz8LfGDcatOJa/Tg0UZERJ7hUAxjCWVC7MVeFs8ncYU2UyvFKTz4anSHgfMLEV9MX9RB0/D88gkFvK0xWGHkBzv8qwgeEtzPS8MZHXMeK0OnAyJf7IdD89UTpoETcY4W7v/LtzKWUtxRhNaB6aY6CtIxfsInGLxTYlYJKD5cqCsZqMS/bkR84KMN1kopFDNltRB7Y/pmY+KVH0fl7RN8aOubyWbCDpOZJW3j+MWANYDul/6R/EVe7cKLHPMg75XLWs8mEBGaBfkjyrZmaI2GLqGwYm8BiY2nC5aVGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnXQb8Qc7gkgAyA0Q2VO+pBsdPj6Wo5GLGmt1LQdzjw=;
 b=HtubO7t0zZUL15dSDLT7O0gC+17tj+uaL1h6lfPMLJvCQNPGSVGV1MlIhfd+6Ojhfmi901YurqKUkvYftIlkfytb8WA2jli1GtA55DbUDLbziDHq5Wwn5xIFciI7pu8/XnvWYjS5sNJhJbq/y+tuVDNlWRZ7+oqp4AQO6qLMWsCuTzDn793lVpYAvbFXPcqxK8RojX270zGX5nyVQFER7P647aMFDyvLetdLZhcfCBI2wUroLxe9DRQgSvCuTa5xYBz2Peh7O+ETDD+QTBlYw1O1FImlkD0mdReXVUchsx8ZD+4K5lHD+0iDvQZXIpgkF3IUqyPK/7OCATlI7LzvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnXQb8Qc7gkgAyA0Q2VO+pBsdPj6Wo5GLGmt1LQdzjw=;
 b=4lUeaWvLyTcLxJzBIAJ6WKcSlrkwNAusQ6t30QHX5SuF9DBRVLljiPpGCIVJLMHrOEsNFTAKI1Bj5OGP0CfLNI1TfGpqD1wYRfQWnPzQchoo54q5wjQq4BCVghO3aANBdw2U9BwhqHwrZPPHC1aYL2kjSFS3Flsrea8Xg4NyalA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 20:06:32 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 20:06:32 +0000
Date: Tue, 25 Aug 2026 16:06:28 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: tony.luck@intel.com, bp@alien8.de, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] RAS/amd/fmpm: Make max_nr_entries read-only
Message-ID: <20260825200628.GF1500179@yaz-khff2.amd.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>
 <20260821094748.145394-4-qirui.001@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821094748.145394-4-qirui.001@bytedance.com>
X-ClientProxiedBy: BL1PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:208:256::26) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: b009faab-a756-4539-5a6d-08df02e45b6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3SU65Tk81Cyr+UI5djCAEA5wWbwk01aqH0Yp8j1l5+trmBK483YnOvUH4fWm4FL4HKkkhDLZIkyMGts/ZYwHMSY8l+SzbtouKJb//3mAo3WYo5T6/Dnn75HAP7SsdNJjVvzfVxiSI2zPuEGdGjTmPYnEi0pASrU4cnTMGhzER6gOW2igs957Tsgqcdp6ptg0fbB4M6gwMHW+dZSE5VZNGWwSkt2a5TFlqZw6I55oE+3koPcesHmcd1K51diTLYOFGpyFVGG4t6xW8cUiUiSzN41iLL6ypBCYlv1iAZpp2x/TQpnns1n0BsksjKrDH7RXJzQS+MGuAGXwNPJhbDFXyABWIOa/Fa7zKVfJTmfkMcgdX3yWh2H1WvU7HaByZ2iDSLd5QH1J2XvSjxu3Edr3/n3drVGSVlpP1gPjhrn6EmVsOgF3U7gzU0k/sEkiQvuOIQ1+0bCHBoxhVOC38Jc2PecBLy448sSCROeYGM8q76qPPGHboq4P2hAAVoWfRlgFoVt6u6NM5CayNMYaV3nSPitmSe1Ahl757T3Tmh4M/FZNZKZO6s4p9mPzJVouY1oIK47rP5J0iiDa4s2zmyUTfKHnhGTH0FNOj7pQoc2I4Qv2k7vEDJjzzybx6uHZBvP+Q1F/i6lxHwCNL2iXX1WKGbLaKoPnimlm2Ymu9b2fHwE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P3UR0/MeIWVoI0+d/ikyxBPUSZMcT9nLsJQWf4+lmdXM2ZTGqgZUIURmwWMW?=
 =?us-ascii?Q?uGp9pC8g259SeysCrsi0QJcJPTyZ5v9qvSf+KolMRc+RaoJbZyfXTGNQS5zV?=
 =?us-ascii?Q?RpBmJ7ArBqmZSELWTv3E35kWaC4nC+y4QqC862NXnBmsp9etQ0bfwuWV5coH?=
 =?us-ascii?Q?Kv7W4np/fXu/E/YpLZ79bpi4GgUD/PaajTXqsRpI4ghAJdrMVZdKo+Jup51O?=
 =?us-ascii?Q?mdN0HGydPPrjVAgqGs+eEyjROIuSXXkxESSNDHeO2KROXsryU6onxZ45Vdu1?=
 =?us-ascii?Q?WVOGHgbKfDnVcDPj3b/SAwBtwi8KnlUHBbrDswpVM+Fzl2t+jChLw1bsAE/3?=
 =?us-ascii?Q?PYYLETa03auX+bYkllnpmHuXZ3eEx630A+omHIrxZHrjjdxJsMEnQhWh2qny?=
 =?us-ascii?Q?W1C53gmAIjN7A49yrW4h8WPCElfRnlRTBAukuy02oP7X6kRdqd+utvN83gje?=
 =?us-ascii?Q?SbMQ3YWc9r4cb2yYYoOEM+iw8lsD93yEo4bHrnM49FLiVFCLxIxHtDzatYIS?=
 =?us-ascii?Q?jIHDkZVfWqRKGq5f8t0WD+bMEsi0tvj0b+WucGiVoGBvAugTskRuMmMwERQp?=
 =?us-ascii?Q?5v5UySG9n7ww/ArXyYAjHI2906u4Auq9SA4WktlYd3u/g6N8GCAjaT+R+Pxt?=
 =?us-ascii?Q?2Gu3flXsqAqlyw8ExsOr2rK9zA/HVz8afaWSUeIivvp4MtVgU1PomkHGXR0P?=
 =?us-ascii?Q?DAB1NpQ0qcQU/sLuCbp80mH/2GgfeMglfOgSMrelmLyVl22pQ8KfCDfyHRvT?=
 =?us-ascii?Q?9v0ihrkRuo5hfCGhiW6e1zMwLJlpsGJbVUpy6F5n+4R/bAdyEz1VZghWwIyY?=
 =?us-ascii?Q?SoiXl++9ZOuJDIu8YgTZ/Ebn6Yb28abVsznUFlm7Pm98GcdqsnS3i0a1YrqE?=
 =?us-ascii?Q?hVEF+tA9o+8s/9DW2vRF+7SVqH3gw56e9O23eEwJJ73JEo5tgC3tEVhg5GnA?=
 =?us-ascii?Q?I0Dx/6bZxpo4Sj5dVQah7KFeCyEsvVmqyUl11kDaSOJ3PkoZqW9WauVZLFyl?=
 =?us-ascii?Q?bJCWEYY7LtssY4eskD69CZHxteyf3BEVrgLwdItEWPegcMcRbvuGFjvVoPQJ?=
 =?us-ascii?Q?YYEuuK6c90FqzPtXo6pVJtjZ+ACJWFMsfhTqj+iHTE1r7i/YbteoxNC5mZot?=
 =?us-ascii?Q?AoFqeR90sOOTzCME5rX/OWr1NTFzngv6ou8uMDSyXSRX2RNwN+bJjmYL2MeX?=
 =?us-ascii?Q?5iYVRCN5XUkpejjtK5zZfsEy1CaJClNKZeICpifCy8FdLw08kdbtVjkzDN59?=
 =?us-ascii?Q?k0YFhzRtXrepg6gGx+puWiSxhmptAJH6GPJZAoxodks2MqxDfVl1VrGWZaX4?=
 =?us-ascii?Q?CssSZBxaJ0in3Jcbz5+3UZL4Zmmc/lcuAnYWnCt9/o5wBaIM1Lq/Wcdb9WRA?=
 =?us-ascii?Q?TOia3bMiS/C3CIziWyl5aiX0Us1I+0uSNHvivXWEgvOMyFea6Lqas3KaheL7?=
 =?us-ascii?Q?5quJrwZK4F3TFRZ8+m2Wrzn6NH+PQeQsz0t4gYOwAG1u7bRmX63vSol6VXne?=
 =?us-ascii?Q?iQ7aq0OtjaZ+TJ/yYN2yOEwkt+JuDBv1CuXvDElcNTuCFKQTmTb71dxd+R8+?=
 =?us-ascii?Q?o5v/pFhJoS+pXkwoX883XHszM93pwyL0PPWUwbg2XW3xAMS96P9dMmU5kAKV?=
 =?us-ascii?Q?Rb5jEp+YdahU6O1PpsqpuD34Df4nzbk+FTP91YDsRbeKRPv7vJgsdzQKik27?=
 =?us-ascii?Q?wUdOeg8zA3NwTBqUt9nduE4XsRO6u5ITdbOgNoGcd0kvrjpR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b009faab-a756-4539-5a6d-08df02e45b6a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 20:06:32.1302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDxFpauuYYYXzhwFJ7amC9yfcuWOPtvtuxCRkszauFhrkyON0oZ9/Zl8AHoVgfT2AiSmR3+5mRxO3m58nKZ+ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108

On Fri, Aug 21, 2026 at 05:47:47PM +0800, Rui Qi wrote:
> max_nr_entries is used during module init to calculate max_rec_len.
> That length determines the size of each allocated FRU record and is not
> resized after init.
> 
> Leaving the parameter writable lets a later sysfs write raise the runtime
> limit used by update_fru_record(), allowing entries beyond the allocated
> flexible array to be written.
> 
> Expose the parameter as read-only so it can still be set at module load
> time, but cannot diverge from the allocation size afterwards.
> 
> Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
>  drivers/ras/amd/fmpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
> index 0231163e2634..14a103de9d62 100644
> --- a/drivers/ras/amd/fmpm.c
> +++ b/drivers/ras/amd/fmpm.c
> @@ -138,7 +138,7 @@ static struct dentry *fmpm_dfs_entries;
>   * No input or '0' will default to FMPM_DEFAULT_MAX_NR_ENTRIES.
>   */
>  static u8 max_nr_entries;
> -module_param(max_nr_entries, byte, 0644);
> +module_param(max_nr_entries, byte, 0444);
>  MODULE_PARM_DESC(max_nr_entries,
>  		 "Maximum number of memory poison descriptor entries per FRU");
>  

Same minor feedback for the $SUBJECT prefix. Otherwise, this looks good
to me.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen

