Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795628689;
	b=1Wo1AupemyQp4kGCvL/zizBy7MqvE6mmwdaFKSOM8NxNRLWGvSZ0xzO88oBY7ePCb+7x
	 CEtGJow6m+59WsZ0nKKa8vtdXxDgFRFHs6rz9y7u/BiW/dfAYIxh59gweCG00roCyEveq
	 5A11NTJ6wWDNnc7g5I2df3V8or4nu7MwhD+HG0KdYA6h0iyRbNw87YMd+ogeCgKheu8Fn
	 x8FYrZKZyJY8D/31LUtaZcaIQzWnQO2CVUBm8mIhHtqILX7/6UzAa1yG+9Hj/JzBx0QgK
	 DB2XO0pvPhahZ6I8bFjDgZjf+FRO2jN2gYu+RJOBlx8zRdIYRLlawk77lcW1G02L2Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628689;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QCIBSE6QpgRyKi70r0dMGAPjqC6xGlcLfU1CjlyjFpg=;
	b=YbOl5c2rKueGYkQCGRKCmONZwa9afOVt5e92fg16/GZAhKTDzFVBPaUG5m/u5iLp+ghA
	 3s34y1RdtBgpcYtRQUhP9vWqRHbo7lCGsACMdpl6ciZj8gwcS87apKQCQ647qrtgvJLKs
	 Lw9H2tuc8U2+0hKqDqEggEIwFa4DcWF0zy+lB7RO6LJQn0B9clZG85RRmJVgd3kZ6SdeD
	 qxk15D/XkcEOZQaRXn5Ea1AeU4sZPlLUJdGMXVqXXprCy1x4I7v4O1b0d9sFjodq84uyK
	 16O+yrNZJXQwB6Fb3Lmou97mpIWlg1IcO7HhwWoywqrEWSySVwVY6CLOvBDJJK8lRmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nvzZGjH6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.46
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1CC606A334;
	Wed, 25 Nov 2026 17:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1CC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nvzZGjH6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YybtAeFw4u9l2nw+aaPhXDmadrn6ZZvG2QK2pKzY6Ju/DaOfGoV9ezvLuhGTtYCh75+b07LWNt/CqotdIt8qGLqDvnVU612OUvjxd/ONFDQ5+5okWmBJZ2svlq9Y9yciIR2sie/VP1aCHM/J/vZENqltrc+zHzaj5Kbx78N60AGgqpR8hE1jdo/T9ZSwasuiqCmHCUINFJGPWgmZsKvdpUrIp5ImncxohT+rId7k2vBMJfVfbSnCaCBPFpQhf99p9SyH6//us4OGVRyKMG2ojXqNjzZdrYGoR4jeQGdcQX4dasr4eibVTfpJtPYyAgoZrQVx8h691aifk3jAJfLJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCIBSE6QpgRyKi70r0dMGAPjqC6xGlcLfU1CjlyjFpg=;
 b=n5A1PRPbDtykcs/orYvuHYY+F+bvDggGbU5MPAwNq0v2qFureMTZEqxw4BTWL0lhbB8hrg6POEc8IA3G/Hx8/NZi3ZC1MJbUeoL875T6GkTlf/XIAPEEoq1NTr5VudWjLA/l2PBcE4u+hnQZEbbLeuNXfR/dhPbskehizevgL8fBo46t6BmgY5P6UKW8+HqMi9qO36Lt/lzd3htPwb0IPJPU0Wq16UFyNd8QczNfJ6sh+hTJinsjNvRHiZ7vBLnnKC2rcfjXibIH386jjM3FdPyEAAGK021B4P9c54r030kwTtwQe3R8D3cqKd7ZUP22HeJIedDu7hlRJGKrMAgs4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCIBSE6QpgRyKi70r0dMGAPjqC6xGlcLfU1CjlyjFpg=;
 b=nvzZGjH67V4q0swSeKr16nOInhQn+9wEQ09oWp+zHqprl7xkzu9FEePpv1yJdoVDs/etkrkmomDaj7bA9qxTp5sx7Fnu4uX/QQ5icDvZg0GPZXv9NetoHBaD0utug7UA+IBEiIpWtZle7E6Z/YTFmdlXZLAcRmwj8/y/rEp9Fi0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15) by SA1PR12MB7270.namprd12.prod.outlook.com
 (2603:10b6:806:2b9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 17:44:32 +0000
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167]) by EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 17:44:32 +0000
Date: Wed, 25 Nov 2026 12:44:24 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	michal.simek@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/12] EDAC/versalnet: Make dwidth per-controller
Message-ID: <20261125174424.GM2156781@yaz-khff2.amd.com>
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-6-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118142213.100581-6-shubhrajyoti.datta@amd.com>
X-ClientProxiedBy: BN8PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:408:d4::32) To EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15)
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
X-MS-TrafficTypeDiagnostic: EAYPR12MB923140:EE_|SA1PR12MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b06fcd-9d15-4429-1b48-08df4b1bc374
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|4143699003|56012099006|11063799006|5023799004|261021123027099003|261021121427099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	pAiF7ECgyS6IMhb3oJBp7PhJIcAgaOv1WXkHXUrLiGzQGj0H6/daGm3BJrsEd+H8lX7blb9cZk+ecmjpXZ9SiEyBony4ZsahuJtFzV7ciIwHs1lEYbfBAItn2B7pmp7OkNlBstXzTh10Z4fpbJ6DZMO1KodBOT7/jMZUhnsE8ZtlOTS5tu4lw6QvJcw57n/LbrmoZ8D7gSBOW2dwUZC9YuCP//HXF1wy02y/tHU1LkVLb1YLbEUdR7KbEE6aOrPqcDUBwgujlLHqsSFMZcZeMYCdLpGF3rL0zkPt5cHLyhJ6rgydyq+d4Jt8RTmr8kaVS9bd2FJqhDZNStv+VbRv+X6HgC/PAvhJtOqeQ1KZBWkaqgb8P2j4WaktE46eE5au+zfR7tPbgBYoo8T5jwUZR74HOZrYFhvQV+EyyDueYUY0h4+e9ORqOQ30J4YR/pguVzT8xFPBoK+dS2dhc6p/SrAydbrinrFLOY2EG5pygh5ATk+I+L9qGq0ZQxZUQscZE3dZIeqz3vo6ZN669lysHjKDudl89+Dex9hA4cPe9PKiffc4QwjqGgo3r4+m7wy4GKBnI3+CFHDe7u6er3jEdkC6fx2cl+VNfBTaFzxxt4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EAYPR12MB923140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(5023799004)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bfEp/5LJFO9K89WY8H6+LmbsLXSQTzYXFDb2BlR2KHvlSNFFR9bbLhWiCtch?=
 =?us-ascii?Q?7tsS0UBD4xw9wNDLzPYnSPCKCaWx+zKGDy6xUwLLx53bgwCQ4OaknEVkBMa0?=
 =?us-ascii?Q?oE5ebUohgm3lGLywldMarrThKIRHDNicDdhBS+NF+YVpVzIgzvsuaen01O4P?=
 =?us-ascii?Q?3xgTmwxvvLT6OXKNpjkrqf2pDYCBpZOIOfkFtrUwcQig/c71weYWB6sB+EEx?=
 =?us-ascii?Q?6GbrhvRmfPcuNDII8U5Xa9dSjeC447LPAz8Vto6OV+X5PqwokiUwYobZYnf/?=
 =?us-ascii?Q?+iuord/j7fP8p8BgigMBvLpF8wx+ctlXYjUlEHWotrbuzp0DBNwnJ+DVRZ29?=
 =?us-ascii?Q?52hYyud7t4TFZEvo9mDj52X4Jn6Nwg90kke18Uoavo/hAyamneu4P+aLKP7u?=
 =?us-ascii?Q?/Y1jO6YtCl0WgB5ZGzF86qayxj9l0O9J7VjgHf2+zSa9t4a2esa03yR3PKc6?=
 =?us-ascii?Q?QXjmVd3mFyR77svhuGFWvhif+r6l/CQmYWRyYxSGT1qwxX7plXSvbCSRKf4i?=
 =?us-ascii?Q?LPNHYUyYBXxYgz26vUz0zq38++6iQcVO5eB3u57U0pm6OoMXlldt/7lTOqTl?=
 =?us-ascii?Q?Oxycw0czoVLuMdU25Fivd0Aftvd5hbQw23DtLOU8BEg5Ht0x7s5zagC5y8hm?=
 =?us-ascii?Q?ShHz/6LOlmJIb1/2dq4eYZXJEIBxYxH8DczxUI9WaCx8qpyX9wa87sdUr4M9?=
 =?us-ascii?Q?winXciSr2IVYctWQTLX0yCKGoge2x79rzDp/Q4QqQnMin6e1xsoQYg6h0l0L?=
 =?us-ascii?Q?1e5JnuzTO68DDeo/tvqIEZSx1hs9LfdfP/HkHxw28vOGAG9o97Csl7Qya2UD?=
 =?us-ascii?Q?AZWeZj7/zF+lvdeZ6Gzh05wjp4/1wIQuQPUrtkrwtdBDBBY2NyjFI0Ymi5Gu?=
 =?us-ascii?Q?LEBhWSDf68CoS2o7Hsav7/7beMzH15V+bCm26e7/55VZFI+z6KcDNgfPGVFj?=
 =?us-ascii?Q?OOxbxTLd0rK6SVdVAiYm9ARr9az+DhA24yOQ36ykolj3w11HUXCL+RgK4+Ea?=
 =?us-ascii?Q?WQyONyoePiKIG+015IqNh+AUtPt9I2oE4v+dAe5YFIvb+9yrOgXSiCw2S2sT?=
 =?us-ascii?Q?lhPqPWCdaV4Pb9QmfPCV++/EVPW8p0GhzIXv5BQCgFfe/lGAU1qbXsarVP98?=
 =?us-ascii?Q?iBwe62SZuaa6m0gb3Q+nvJuvh+WENJD9ScK/22qW/k1UG6frvdJKLQElfj6t?=
 =?us-ascii?Q?sDfiW8aMuj6E0kojbXf6Y5H6joCUTeEmBgZl/bhXTOvwIA2elj4+HlklfOF9?=
 =?us-ascii?Q?tRe1SrzOsuXg0HYq1vYutBhY/WtohVeNDJGcYTuYzxYNG20fzccHV0OGQCCE?=
 =?us-ascii?Q?zXTcX+Rp12tYrIUn1pdXcu+XcuQ+A1bI4Dm4WUXF+P2hEwrdvUGBAe2xG4op?=
 =?us-ascii?Q?bnQqfeVENPgo3BL6hllz/I1K0ql1raM7HbhOXLxGbPHXXl1bCOBq9f0viT4O?=
 =?us-ascii?Q?zckaYUPenZf3NhgdGckTPdftHuMi2PkMkzEtgyDL9H63XGpp/t7VeZbuoVb7?=
 =?us-ascii?Q?d5LpcYDFaWc3LVPe9xajE7VwdCRxQBLJRkJ1ZJHrWD+3lVTIpIXXkRLdtVXv?=
 =?us-ascii?Q?b2pAKaFA9WWVBK6SNOpZ6BKTHG4lAt8JvCKTIjCGrgdta9f4sv6l4aUJEeAB?=
 =?us-ascii?Q?iqBkERUm6iu7kNCCqEwIo0XD1O2X4PewaIY6xziwSfNBhFto/3ZM+Rntxlrz?=
 =?us-ascii?Q?cQZcSc4K8m5hG+dWAiWj8xvKaWILONfSNvqeEYeuCw3fQmr6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b06fcd-9d15-4429-1b48-08df4b1bc374
X-MS-Exchange-CrossTenant-AuthSource: EAYPR12MB923140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:44:32.6567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSgwBrG0WFHNC874HzDHzYEOgIsus83XrDKoRSSUQL/jgPY9ytKPRaEq3a7ZSdpg7SvMrXJawWhFyFSMgl7QjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7270

On Wed, Nov 18, 2026 at 07:50:29PM +0530, Shubhrajyoti Datta wrote:
> Currently dwidth is a single scalar in mc_priv, so each call to
> init_one_mc() overwrites the previous controller's value.
> 
> Fix this by converting dwidth to a per-controller array and passing
> the device type directly to mc_init() from the detected dt.
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
>  drivers/edac/versalnet_edac.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 0364648d91a1..ea90d3ce3e70 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -140,7 +140,7 @@ struct ecc_status {
>   * @stat:		ECC status information.
>   * @error_id:		The error id.
>   * @error_level:	The error level.
> - * @dwidth:		Width of data bus excluding ECC bits.
> + * @dwidth:		Per-controller width of data bus excluding ECC bits.
>   * @part_len:		The support of the message received.
>   * @regs:		The registers sent on the rpmsg.
>   * @adec:		Address decode registers.
> @@ -153,7 +153,7 @@ struct mc_priv {
>  	struct ecc_status stat;
>  	u32 error_id;
>  	u32 error_level;
> -	u32 dwidth;
> +	enum dev_type dwidth[NUM_CONTROLLERS];
>  	u32 part_len;
>  	u32 regs[REG_MAX];
>  	u32 adec[ADEC_MAX];
> @@ -399,7 +399,7 @@ static unsigned long convert_to_physical(struct mc_priv *priv,
>  	else
>  		ilc_base_ctrl_add = ilcmem_base - low_mem_offset;
>  
> -	if (priv->dwidth == DEV_X16) {
> +	if (priv->dwidth[controller] == DEV_X16) {
>  		blk = err_addr / MC5_X16_SIZE;
>  		rsh_req_addr = (blk << 8) + ilc_base_ctrl_add;
>  		err_addr = rsh_req_addr * interleave * 2;
> @@ -473,9 +473,9 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
>  	}
>  }
>  
> -static void mc_init(struct mem_ctl_info *mci, struct device *dev)
> +static void mc_init(struct mem_ctl_info *mci, struct device *dev,
> +		    enum dev_type dtype)
>  {
> -	struct mc_priv *priv = mci->pvt_info;

With this change, now there are no users of mci->pvt_info.

So you could save some memory by not allocating it.

  mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, 0);

You set the last parameter to '0' ^^^

We have the same idea in amd64_edac.

Thanks,
Yazen
