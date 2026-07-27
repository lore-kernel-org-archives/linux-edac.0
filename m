Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA843AC0E7;
	Mon, 27 Jul 2026 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141325; cv=fail; b=pr9le4BBZ1MQwII82Ug+I1wxSU+HpTk9Vfs4VdKm+FCrkYnjX3HplIjxB+GydlFKyzJ5arYWjhNBzWExtka3w2vtw11Na0n0L26GE/rGLXnZkOzTP5oiT+5uuiJsfdyc3z3L6RjRy2NDngD58VYGIHjhBITRzvPt105VwUCAItg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141325; c=relaxed/simple;
	bh=piA3HzPzMKAg2DU/8n/Kn5L5GEc/o1dk36LR+P0M8qM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H4SRHghjgdZDSUuCKFl+wAuwdauVqDIM2YmY6soGYaKJDEsRdTLpwE8GSD1PBvlw431cM/NMtBDqQBljRcXh1y++lr8KGcZeu5w05b1u8stzIzf6pG76Jt9/H0ytUqL6ppDF2nNZFhwSW9T/0IMxVhFZifFYGg/Us9imWHFp48s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AOfIbahv; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AOfIbahv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNVp/4hnmFdDTgRfvgXH5n+MxNk6Z1p9/ZODjFalLnccG5Dor1TTFk2Fxvhz38yl4Nww30zoczAppouNcH8k+vt2lZLTU4fo3gdRWsMoSIEBaccA3smYzp6U5DTuDQIZqKqe5hYnaa5ieJdOY71bor9VC0YrCOcjdBqh+RNbtexYrVr88BiszX8CMGx2ZpmXvbEeCx6C6EfwOXAkReqSBbE69eg5vYoBYzzJvG0W4IVBWgB15RVmGrQZVQj6nmRLlmmuxXoWpT331LE1PBHWAMXdfzK24KznNvZC/C20aRLmBFyox3Z1BhKA4Ye3R4oji1GgpTekrcmmgX3gTCafPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JRbeA8rJz5nf7VEIQVSbp8t1+IwV1QCJrF9hPZr3y8=;
 b=qJDHQPrVleo91oxu4oBfEpSRNpeGzWzTEwoO3qOpV8nTV4NhN10WQ/u8qxt/fv+M3zrtXqhtFmIFlAfKw7W3+SOdy+dN3zcGkSRr+At+VhjGsBa6lBKhOUNFxxOnRojD3jKV01fVWlZB3SRwu15gf/UuAiWhj4OzLEuPE2om9KDX0ZYW5HmVwK4LgJIJ+rWtJ+WJGWvbPQl7ggMhqmLeLxmoHzvHJSHa/UtohNX1nuUnhZglqUn0aP9m0jNzJz96dxYhhPY1B212NAlQ6zXvLl3z/AmUncX9ofDm1Q6z32WieEayBvvnr3vbNG2KCSxUXDt55gXugPTPum1e0z+C/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JRbeA8rJz5nf7VEIQVSbp8t1+IwV1QCJrF9hPZr3y8=;
 b=AOfIbahvMUxAtcdOV3YmZSu4rgUIczpyg4nPwCd8q4CWE2lSceDd2i6ryXDjIfPCIlNu2fuUpQrt+pGMYupav0HcOtodHcLojONZCjcyRwDTPxcyzHnrWYfkd+Qfhfj03+B9gUnnteZjN05G8MTE/I3BWw2FPRi60krre8hoe6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SN7PR12MB7202.namprd12.prod.outlook.com (2603:10b6:806:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 08:35:19 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 08:35:18 +0000
Message-ID: <ce2d4e01-d262-489e-beaa-9e1670ac55f9@amd.com>
Date: Mon, 27 Jul 2026 14:05:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] EDAC/versalnet: Move platform_set_drvdata() to
 mc_probe()
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-4-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260724171945.2812749-4-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::7) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SN7PR12MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7a963c-494a-42e6-2232-08deebb9fd5e
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	kgdzNRstYPaDtfwspMirqb2KNyoXsqDJ1rP3LxhOhy4NG/OlOT09Ps9K1Hk3yhKeQDevNrw4SMUwM+yvZQtg3No1jQWFbPsIlVUoKeQm7jwqhVYx2Mr/a7Sl9zwaPv/3YkUnPxjoN30bAA4ir6T9vBvTIbtOCg/41Edg49bmv4XJVrXUdp+SZyct0k2yxwvi7b0IjQ94vZ7MR+/hWlyt1kmPx/bCae77tnW1TnFVg1EF9JIpdTOLN7WqYwFnvA61q54YXigiQPezR8s+lK3Epsx04DRauVpLn7K0f4HOWY86vXbjCGxnhaZRtx/o/tR+pXGFqFsDZN6rj8HdHEeRemYMRN5ziedZ3GkL7tpOE/rHFeHLUk4SUst/slJ1TTwCi2f6gfU4rTMphz3elzJv9WSP6bFyEPW0l7qo3lb2kvKRsA1txjt4PKGWKIcCeDFm6OvHvfQ2Qi3zYFVrPrKV4Z23hdvom6SNp5Ci/YIunWVU9zRqR5NeLuhHcQIZUyYfwHPzvM3985+SX10I/XLCCVMUlFWFgq2Kh7Ay9bS9AiYc/FuT2zlHR7k0ODhiecAeo+xhi9x0QZDeB78mZwxaC7xzTivc9PaIOf4yx1gD2W6y7cAb8djnnXG1cpyc/gIgKkdxJ7ayQwWu3pv4YUUatuOb/u8lBT+VjNng5/501X0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk1DbXdnZG9EZVpNZ3VPcnJDR2RwRldEVDdwUFBJdzB6MVhlcUFrZUJWcEpN?=
 =?utf-8?B?bTZBbkZTVlgzcS8xeDlGa2lNb2dGTjRwdkJ6VnQ0TUtxM2tPcUIxOHIvV0xZ?=
 =?utf-8?B?YW9xWjRPdkszL2dFWlRQWTdMMHZsMTdNVGV3MzZhcmVvWkRnc2tQb1ZlWW1m?=
 =?utf-8?B?ODNoNGhpQTdlNVhVM3I2TGYwVUtMRHlBdDJaN3B0ay9WTU9tQ2JWd0dJaWsw?=
 =?utf-8?B?ei9jNlFNMW45UGNLMUp0ZEk3YTlDTFd0TDFCUFlTTnVlcG41djFYRDBoRVRi?=
 =?utf-8?B?RUtvWE9hWkZMNkh2TENQQlJqNEFuQnNmOW1wa1lrRE12RDRMdXQ2SDVPQXVO?=
 =?utf-8?B?SGtvWW1HcEpXbG44L3djR0dYcmdRdlZERFVsakZhUW1SYWQrenhkcUF6ak9T?=
 =?utf-8?B?ZlhhNXEyY2JtSHVmV0V6d1JjT2xBK1pUVElLWll1dWxZZEZLdjhlaWpIWk1C?=
 =?utf-8?B?ODlqdjFQZHVqRGRGWnZFVGtPY2puejlrVGdiMXZwMnZOVlRZZGV3cmp2K3hD?=
 =?utf-8?B?T1JiaDZpcVdRUzdoOW5HcjRvUG1WWVZGeHkyOWFkbndMSENYcHMzVllOMTBt?=
 =?utf-8?B?aXo1c3lhQmwwaGlDSFVYdzJWL0wzcTlwMEMvUnVZWnYyMGhjSDZseGNOSTgr?=
 =?utf-8?B?RStabWl1Sld3bldnTytYeml2RWtSOXowL1dld1ZLU0JnbkFwS3BsUlFQTytW?=
 =?utf-8?B?YisxSG4rL01WRkZBWW50M28zMTRkNEtoTVpaeFQxRWFQNVVKVWtZWHVwMkp3?=
 =?utf-8?B?eGEwWTNxRU9Dd25FRnZiS3FJUWZubUFiNDdweUsrZHJ4OGh4ZEd3R0tEdUY3?=
 =?utf-8?B?ak5mQVgvTGQ2K0dhdlZZZE54bXVETGtEUEZwUFhpdVJOTHlONlNxbldPV1Fo?=
 =?utf-8?B?TXRBY2JTRXZEM1NkVnU4blZqZ1B5N1NtQ1UzRzdwaWFqdTNKbjUrcCtGT2w0?=
 =?utf-8?B?cGw3Z2JnRm1UUjFyY1NhbFptUEV6QlkrYUgrcUZZQUdQQU82VUFLejVMc0Jp?=
 =?utf-8?B?MHIyTmlxYi9VbkNoOFBlYjJNSHp0L3BqcDNoam0rTEkyT1JvOU1NcTFCY1or?=
 =?utf-8?B?M0VPSTFmUS84T0lYd3RFWVp3dlV5bnhjTlV3NzJ3V1psY0xNK1dvNE1TbXZn?=
 =?utf-8?B?RTZOQldwV3hueGxyTHA3N2Q0RW8xcE54eFltSzhoWUFJQmVuRDFGdmtycS9n?=
 =?utf-8?B?NUl3ejdEWk0xbXRNUmlIRVk4dkxJSFpuYnpZRE5Lb1JHV1N2UjlPRkNHeXFN?=
 =?utf-8?B?R1JnVERYakkyaG44aDVuUjBzWVFwa3k3Y1VOaFA2YjdMNUlnU2RRTlpiZEtH?=
 =?utf-8?B?ZUZGQjIzZXRoWTVhQ2VVcC8zZTBYMHgyNWZQUjZHTVF5Z2l3ZEhEMmFqYlkr?=
 =?utf-8?B?UTN1N0kvSnhLTktlRFJKVXB1b28ydlp0R3FrMENSNFhJVWd2UHIvQmVPenZ5?=
 =?utf-8?B?TktSY0VjMW5GUi9raHUrWktISksvNkpzc0tCVm5veUh6VFZnRzZkNjcxWHcr?=
 =?utf-8?B?QkZVM2V1b1hVN1hDNGYyK0d2TEd5aUl0dVYwRDBzOGg5dDNnV2FMZjBmNlNv?=
 =?utf-8?B?SjdYR2M4MjVDR0xwcStxNCt4SkFWMDgwY2R2K08zc29xdVFPeWQyYVEzRWlZ?=
 =?utf-8?B?Q2dxL0I4TTJHRDVuUVFiOGZUN2JFRzFwOU9WVmllcSsxbjE4VHRPTVJER0JX?=
 =?utf-8?B?cmlZcklOZUFSWGk5c2hpMnhidll2REdrNG5RS1pIU1dibFhPamowRzlGNndZ?=
 =?utf-8?B?U1RZZllWSDZQeVVMZTlGSUFCZS9Wdm1UZGlZSWx3aUo3MytvMUpLSVY3T2NT?=
 =?utf-8?B?Y3l2NWhHUGlMRk85c0lLSzNPbndTNGszc0p4ZENCZE9NbDdBem9pWk94UGlW?=
 =?utf-8?B?VGJxK3kwTjlwUVA2ZEJ6Q0FCeG9ycWRZK09jdW5PM0QydEJvdlJxc2NaZCtO?=
 =?utf-8?B?T21LbWNqazN1M2c1MUdQTTdLWVg3QTZuckdvUGphUnBQQ0thbkNOV0JYUDVl?=
 =?utf-8?B?RHlTaGVOSWs4aDZITkpWNWNxYUNNS0J4QVYzaitodmVYdy9ZaXk5NGhLOUhx?=
 =?utf-8?B?MmNZUlprMDh2dkhLOVdCMnpMZFhJd21RR3JUazlBR2lWTk84NFNTcU9aMjJa?=
 =?utf-8?B?QmtON2YySHJqVW1uZzh4My9hWExTNy8xdVh6VHNYZDNDekRMczRWekl5Unoy?=
 =?utf-8?B?WCtkSW1nNGhXTEU4VXRQYmpWMk8zaUdKeCtaY3MwUC9ZVnV6c1EweUcxanhY?=
 =?utf-8?B?TW1KdjZHNUh2bHZEZURiZENjZE5SUFhmWUNpdE44ckVPUXBoQ3BiN28zd3dv?=
 =?utf-8?B?RGYvZGJydzBHa0R2a1d4OWNUWEZFZ3JNc2dHZllFZXUydmY3ZlE4UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7a963c-494a-42e6-2232-08deebb9fd5e
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 08:35:18.8593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHtrKMbQLGUbdJpNgh5zTdjqVG8ubg74e2DFGYxCv7Z/o/Jniz5DovlF2RWx1+X8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7202

On 7/24/2026 10:49 PM, Shubhrajyoti Datta wrote:
> Move platform_set_drvdata() out of init_one_mc() and into mc_probe()
> so that the driver data is set once during probe rather than being
> redundantly set on each memory controller initialization.
> 
> The pdev parameter in init_one_mc() and init_versalnet() is no longer
> referenced. Remove it from both function signatures.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!
> ---
> 
>   drivers/edac/versalnet_edac.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 05dc34504cc2..03b6e0958f17 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -777,7 +777,7 @@ static void remove_one_mc(struct mc_priv *priv, int i)
>   	edac_mc_free(mci);
>   }
>   
> -static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
> +static int init_one_mc(struct mc_priv *priv, int i)
>   {
>   	u32 num_chans, rank, dwidth, config;
>   	struct edac_mc_layer layers[2];
> @@ -849,8 +849,6 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   	priv->mci[i] = mci;
>   	priv->dwidth = dt;
>   
> -	platform_set_drvdata(pdev, priv);
> -
>   	return 0;
>   
>   err_unreg:
> @@ -863,12 +861,12 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   	return rc;
>   }
>   
> -static int init_versalnet(struct mc_priv *priv, struct platform_device *pdev)
> +static int init_versalnet(struct mc_priv *priv)
>   {
>   	int rc, i;
>   
>   	for (i = 0; i < NUM_CONTROLLERS; i++) {
> -		rc = init_one_mc(priv, pdev, i);
> +		rc = init_one_mc(priv, i);
>   		if (rc) {
>   			while (i--)
>   				remove_one_mc(priv, i);
> @@ -914,6 +912,7 @@ static int mc_probe(struct platform_device *pdev)
>   		goto err_alloc;
>   	}
>   
> +	platform_set_drvdata(pdev, priv);
>   	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
>   
>   	rc = register_rpmsg_driver(&amd_rpmsg_driver);
> @@ -928,7 +927,7 @@ static int mc_probe(struct platform_device *pdev)
>   
>   	priv->mcdi->r5_rproc = rp;
>   
> -	rc = init_versalnet(priv, pdev);
> +	rc = init_versalnet(priv);
>   	if (rc)
>   		goto err_init;
>   

