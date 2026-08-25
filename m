Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFEA48822F;
	Tue, 25 Aug 2026 17:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787678088; cv=fail; b=HOVGkjjrE0BtDv5wnSD4viX9w/idIhqsLmxwcvjnYDbwXd8Ep2dOBjI43CvBJT2eW0JOmrRxouaBG28h8M8X+xrO/XvZcEbj7PdtDkj7MQz8g1fUNxek1KDTaP+spnmzolwmId0Kyy/aQ1lmqLEciNqtceris42mvmUy9+hsx78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787678088; c=relaxed/simple;
	bh=DpwxXUzRQsk1D0XMrg0fD9OQHqO74ehqVchDlpCiyfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JT+AdgzGfaXKml0mEXLzxBr3OcTGafTNjPlThrSjrZyU51dtRsKccW9ddaQuAo8ZOi10BtI/OqyIrUCMwZ5OB6XHeSHvNqd8yZDmXNC+Cbu65cv3Vp7Vx+UJTiJXnxMe+BEmBbe6W6LWlo5pHPrF0fpl9t6kutWQeA05qrVMBjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dpHJ3fjb; arc=fail smtp.client-ip=52.101.53.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dpHJ3fjb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xm+Ta2s5pBWb5LnNXbhmcxJ3PzgPH4Am/4ppLy29blQ20ExRhnpHnGsEsRxy0tyH/donpQIY7dlU1+hxahjNb6ufSHOaezmv8c1ttJ2VNsTkB20I2WRmhIaqZD3AzOQo/ekxCQhL3DsbXVELVR2QyIE+7hqN75UnfEI+8YP9aa+G4lWKmnjrg6/D1jY5pA35iv+OqQ0m9BGv5/ObBu6frUqPmutrMMSa6RvamhIgbAcUc27AM4fS02w3qs7hmK7fRhXjx+vrtRw8C9+Erv2RvhH3RQY5yj2gXFs/uHsZ1T+CeLhs5biFK5a/X/kMYfOmD743bQ82Pw0cHv2t4Hf8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbQasRYxG0qugF+KXmbvdNGXECCG4RXn0vQCshoHwqA=;
 b=EnlGOH+8DtMFh5tec9W4niv5FvoYB9nJaC1rnogYKaHDXpkz6/o7dj5ZFjNsQgCxT4z+EYA109ojmMI92ffysSZYwe/RWRIcAF217UUaWT+roOUG/BwM/zLGH3deH3EnGYiu+fSPZKCE9/VPft1mbW8IrBcBVYy6xB4PVLg4rxRHNAVO1wag0h51rkqyuRNWXT/YwnmE8G16E247nwWYmj15vvdt7xrSLbHfjeCrJoOGEB7D4mAPuAbgNlOLwPU3v4HB5NpFmmAy+xVxbmb2j4un7XNem4zzSyMdFpeM9xbpMJokzlKerBwEy34To5rTPQh4Nf2oJ9hctfMsvEXEcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbQasRYxG0qugF+KXmbvdNGXECCG4RXn0vQCshoHwqA=;
 b=dpHJ3fjb8Wu656SWb7mzizCgxdH6BnEWhd6Y7yJcVcnVhM6b+UXkJXVlogT2Vx3Xzl4FPi6gHxx+H1HRyHfPVFD9jJGmQp7TpcJ4GWip9qtfYjL0JIgqIORAI7GfwkjBfhJIQ86r25exQqQjZD6nghrRGGvZqj1/4jH7YqYv8IY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS7PR12MB5983.namprd12.prod.outlook.com (2603:10b6:8:7e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.12; Tue, 25 Aug 2026 17:14:43 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 17:14:43 +0000
Date: Tue, 25 Aug 2026 13:14:34 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: tony.luck@intel.com, bp@alien8.de, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] RAS/amd/fmpm: Fix out-of-bounds read in for_each_fru
 macro
Message-ID: <20260825171434.GD1500179@yaz-khff2.amd.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>
 <20260821094748.145394-2-qirui.001@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821094748.145394-2-qirui.001@bytedance.com>
X-ClientProxiedBy: DS7P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::35)
 To DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS7PR12MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 4858c91b-95b1-4dd2-1ad0-08df02cc5adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xcyhYqjZG1grj0Zb8euXU70Bh5HhEaPX5g1GiFlVqNVNG1WIXaC/XYyGHrtjnn+YxPojNLyUxR6P6AZil1ytZtdy4rMWzKpzluigW+u8AiZkvWuXDh/jVXkWeI6RMqbcPamIoTSx3Wo3mVf+yUOa/uR8NA4rrE7Ml2dqD08AG65W11LqgjGTEK73fBqPadepPzeTNKoCoqcBBSTuC5yjWQ3N1gfmzX77iZxDs0XvHmpDzfgv82qZh2/52VEfzXQwjyOms1bNW1i/OSVpCp83ecdS4zPUrP5dVdUjIxPZue1ghW5eeCsU9tYDslsaNXUNRcWmfxvyyhdJMdwFWnxJMCsWFZCzL7OlFSiYe1jsV6lRegJNf1eIUndgU5JLgmjavu93dQm6rWdPYSdCxISmDyUgH/RdR1TpVbyBHBkMOPs4ekwUs8XPN2nhJ1YKy8FLowmgWGpE2++toasnknZmwWMauQZOICfyGoar/W9WYv9uJ/Y+frtJHhd3yKNQjw6fKSDjjyzY/7QnsRhUO5HGYTAIxNcky3EsP2juRpVY+79z45CXUveZyWGXBuXshwVcviefWEPHzv70XHh3L3QYpd+4fvzWRQ/L3qhcRj1E1i9lpBp9+dNOTc0DmzOLQ2PQ9UBfUGZUsnW6JGFKfEWwwVmPmHqtVmez9IyloGZEpYM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9q9c6NVyuRR8HdCbAzXe8XBJGstmZeCcqYCX7pxC+VVBsFD1W3KawwjTYY9N?=
 =?us-ascii?Q?SOuCKOGBEPGWSaW9RUIbFs9J1hTDdwbG06k+kNlR2TSy+AfRSsKxP4/n0P2B?=
 =?us-ascii?Q?MYZwiU/hKtDwzWNVn2N9RCfar3x65cI0CTmNywLKEK7oD0y9QirZzk3qn8OI?=
 =?us-ascii?Q?WuRQ+AowbDP1v+Bb4jMxoY51d+gqMI2yFkQ5jlKvYbZyZ+1MghX0VkxukAwT?=
 =?us-ascii?Q?MTWBo36MYRoe1SuAxNT9slmMEHcDKLO9obaWAotVeq8wQ8JHasC8aeOh5aLf?=
 =?us-ascii?Q?Y5XpKQZrWK1XZaarTVQ4sQHKMiJCtKwA0jInYhMMxFTdXyTHV7p2TJBuOAiz?=
 =?us-ascii?Q?w/geYTfmfO5m66NWlJwLHzlx2zNpwVAhYVg0ZGbE53qTkhGOTUCQbNFjwcks?=
 =?us-ascii?Q?Bwrdd3V0Wws6QZP15EluuLsI271s2rth13xNtrBSSPnnuo/D1+aLL/uuLDMr?=
 =?us-ascii?Q?cTxNgbM4zTOCeFGcoYKgaK+Z5qkDSz5wduwxLrupapqHjRCBNOWsVB5S4+x7?=
 =?us-ascii?Q?WPKZzmIRo9WBRLsY5ysEcTPyXL0Z2F8MbkXGmWtertzTsVZWTc0dFergkvq5?=
 =?us-ascii?Q?4CNiB95F0YHkh21oQZvjypO/AVEF/VOnIan6eARqr6zmAFmTA5PIxdsLB+bw?=
 =?us-ascii?Q?LW0DvjsSJsPAZQE5NSNt9lUanHUup8WsUqNdBiezTYP/nZKS22KHDahrcjc0?=
 =?us-ascii?Q?V9ZQseK4S53eaSdiHZRLbyWf8YL0JT6/WoiH4XggZIy2uZjnQcF5pq1k5v1x?=
 =?us-ascii?Q?Dtkx0ea8YM/M92OLsmg34JtghohhQx3tda7Wx+5iPGT9Hie59M5R3sUHG4kJ?=
 =?us-ascii?Q?dRKsw1eynC6o3In30261mTNuyYVD32uEbpvnEu0ylz1bylJczoj2WppXQ/NM?=
 =?us-ascii?Q?dmOIxR+W55DWA2hKqAgSzFR28yHrnkdPDW3VlTPcQY0ZgcJTXmWufLj+Q1We?=
 =?us-ascii?Q?l7GHzKXlZm41WHlNtCIFToGWMLBxJxLCjjP5b95PW8+hHknDstzhJPgujrZk?=
 =?us-ascii?Q?W8ZkNtkYb/TeUVUJTLGcEoRoOqkplC4HiMlH9lrZHY422hORHX7oGE4vPAgc?=
 =?us-ascii?Q?LJyBNhrsJtAoo4ja5vgRkLTuSO/ysQAYojBenP203RNlS8cJzToa0zo1k7xf?=
 =?us-ascii?Q?fW9BwWx5kb/dNtL4w61jxKwE9XhRc6CYrBYYZyoJHhUu8tye9CVQSYBjaUBg?=
 =?us-ascii?Q?MOutdSeVjRlrGNONxfNn95XziuBeWio0fdy23e+BK0GtyyTQZDQq/31MClg/?=
 =?us-ascii?Q?CIAxniMf4iOX9luSxZk0Pj04faQXsEoBmRp/nNmIv+GzJMAnl2P0Tms/IuQb?=
 =?us-ascii?Q?nRCJ6Tuvulow7ZrmXGtbbbkG1yrzqpsmi6LPppCn+Fag0vKMiugOdBkaXaRz?=
 =?us-ascii?Q?yunnt3WNTUuMZ6DUY1WrH8m4KQMnBPVBkptypOKjHycVZ/6tmF7LkHMmAQxm?=
 =?us-ascii?Q?Xta75fwcKswwAEo6NhfHNGCOy77lu/0BdESbGeFHZQzpAflPt+lnVjYg6pLt?=
 =?us-ascii?Q?feAqsMn5TyYEYqw3VaxAueOo3ioudlUtjcNLFactbcEgYddPOgCwdL9FZHym?=
 =?us-ascii?Q?L8Y52wn3cxmLXzrvwchRdn+/8/zHX3YigMhBDzQ22khfuFcJb+2EaCCmHg4/?=
 =?us-ascii?Q?L1x+Dv1kTTdGR3JQzu3cky0Wl7YX4fySOD+hblARgGDwCqXeTvmt8hsrBTwd?=
 =?us-ascii?Q?5hwgV1NlOWTLEnNvgIwb1/C9p8w48ntvn05mzA/B/aVx8nsv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4858c91b-95b1-4dd2-1ad0-08df02cc5adf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 17:14:43.3171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3KE4MoKPD2fk6PKpmBtLOxCQvthtWsm4SYet5nOtQhT2+XzMzw6g/hQ4ZAHFmXZmlEpi296Fwl+2KKPzM7axA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5983

On Fri, Aug 21, 2026 at 05:47:45PM +0800, Rui Qi wrote:

Hi Rui,

Thank you for the patch. I agree with the intent, but I have some minor
feedback.

For the $SUBJECT, please follow the existing prefix format for the file.

Ex. "RAS/AMD/FMPM:"

> The for_each_fru macro evaluates the array access "rec = fru_records[i]"
> before the bounds check "i < max_nr_fru" due to the comma operator's
> left-to-right evaluation order. When the loop terminates, i equals
> max_nr_fru, causing fru_records[max_nr_fru] to be read before the
> condition is checked.
> 
> While the garbage pointer value assigned to rec is never dereferenced
> (the loop exits immediately), this is technically undefined behavior
> and would be flagged by UBSan and static analyzers.

You mention UBSAN as an example. Is that correct for this issue? Would
KASAN be a better example?

> 
> Fix by using short-circuit evaluation with && to check the bound first,
> only accessing the array when i is within range:
> 
>   for (i = 0; i < max_nr_fru && ((rec = fru_records[i]), 1); i++)
> 
> Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
>  drivers/ras/amd/fmpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
> index 4ccaaf7b70bf..91c49080873e 100644
> --- a/drivers/ras/amd/fmpm.c
> +++ b/drivers/ras/amd/fmpm.c
> @@ -169,7 +169,7 @@ static unsigned int spa_nr_entries;
>  static DEFINE_MUTEX(fmpm_update_mutex);
>  
>  #define for_each_fru(i, rec) \
> -	for (i = 0; rec = fru_records[i], i < max_nr_fru; i++)
> +	for (i = 0; i < max_nr_fru && ((rec = fru_records[i]), 1); i++)

I see there's are a couple of similar cases to this elsewhere in the
kernel.

I'd prefer using "( , true)" to clearly indicate a boolean for the
conditional. Using "( , 1)" looks too much like an index/value at first
glance. At least, it does to me.

Thanks,
Yazen

