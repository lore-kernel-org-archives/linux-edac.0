Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80E73AFCFF;
	Thu, 25 Jun 2026 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404024; cv=fail; b=E1IdMHzQyUuZ/Mqxgsa9Rm4yoV7vUg87vV8YrBIsibMXtkNZ9LLawqb9vzPRRwGj2tLDyurQy/yiDJIWvxCfnBChCglGMqLCmhG7103OB52o+GbkPQ67XkxwRdBV7mFdELEuBTsm2fauLjHiRPnAhsShrhDO3kD4vsVjpHz4VM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404024; c=relaxed/simple;
	bh=5W7CcARyPZllamZ1P0O6UtBl801Pm+YjBNtgZ/jENIA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AC5SZxgZC19fdFf6T4t9WmA+Z3f3mwmakNKDnzN17Q7WD4GnPlkpuVXq+ozkHhwurYSF2IEfaaT/pDHZ8CfvLQGfNImrVWcpmWRysQIz9FvXK1oxcLSn7rSh5RWWa/LlyuVMfCb/nc0aZRjQKJs4LjV+qGohERMYGvmKbUc7cok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qTmVUrje; arc=fail smtp.client-ip=52.101.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qTmVUrje"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmdqgKsd5DcOOyDW/+swUs8A6sqZeEXAFag36NenHK7IvuKyKtjaf6vnDP+FwJrO+xgSaIuxdwIGP3c/gPNYW8AosBHAq5LIMwYADr8KuWuWG2Lru4WFeG3kbf7ISw/oCVPjB5XeF9NVE2Xk+3iVja6lLkcRbMVO9e6tV3WyoA9jIPtnBx58a4Ppwr5CG7fqpri1VX9j4QQIwkf908iqpAu9soI8oJMiAQPBQAFbGS5iNiwfeiKULIXlfoxMIXe6+vhx1uAgwUejOzVwUPfzxALLLsiphAMN+IvBSsDKgqosPpcmt0BlE5cyNY2sKVA8Q7JoD+bnNPvUL0JUn8W/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3LCbJc+s1mAQ9aOe5aMnq7mkkrifPqOPaAA3/3GsvM=;
 b=l7r4HznUYCOTjcnvURicPa19Oyv2HDVwtANfsA2OsiSecQDlZWqAicSCV4aI0vNdZGw1aBV3qvru4Csc/13e1MI9M+BBBSB/+Li4qP+M3i5zaQotjPtcZderdcy4CV/GZGXdJkxfWovQA+v67krw95etgvi4du9rGhGRj6GramR127vmc61HoQCQh0f7/C0syArQAejW9kpXukqsCAacbo+QQr9WoatfvqLvck78KTN5gR1LTv2LBgi/7CShUdf4dVcVP905LY7q7ZkInkrAWX8NMzMA+nCAzoaQyuasw4sUfun4seTuPZFTisIXQqIUOFHzlVqyvG5q3SCvwtCQDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3LCbJc+s1mAQ9aOe5aMnq7mkkrifPqOPaAA3/3GsvM=;
 b=qTmVUrjesGQx01Ojt2FnaDoBBXrhNwwsDFkVYy0CBdB784oi01o6Jwpl2fveDYdmi+rWpnweKkFjHBu8c9PkXMvtcztateMjTdq2wXLT/KdQ1pSw2rTxbHXVeLxTeIwRyihjStyQPYs2yV9JZzXIGcB+FIMQ8gFEbQfjiIxhVbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SJ2PR12MB9237.namprd12.prod.outlook.com (2603:10b6:a03:554::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Thu, 25 Jun
 2026 16:13:34 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 16:13:34 +0000
Message-ID: <94180869-1393-488e-8912-26bd93b41573@amd.com>
Date: Thu, 25 Jun 2026 21:43:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] edac: xilinx: Add EDAC support for Versal XilSem
To: Rama devi Veggalam <rama.devi.veggalam@amd.com>, bp@alien8.de,
 tony.luck@intel.com, michal.simek@amd.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 devicetree@vger.kernel.org, james.morse@arm.com, mchehab@kernel.org,
 rric@kernel.org, git@amd.com
References: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
 <20260624212545.2850787-5-rama.devi.veggalam@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260624212545.2850787-5-rama.devi.veggalam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0097.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:278::11) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SJ2PR12MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a4444a6-ff95-4bd7-5234-08ded2d4b49a
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|23010399003|1800799024|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ElMfM61t51w/pkzwXv4Oz77kGobcWc9aDwuHKBnv0wIJjlrSsshrnSESA4TIcMDJzkwqHu3JoWc5c0TNtCPLT92Qhwiox6q1ny82NjYzK3A6o4U5Hhdm+foLq9Vk7P+h13A25+BXI/hEXhaE2/+xUPWMk0b39k/yBtQJ1Ps/VTjHY8cSQWduGH4ptbyqfsfuSxxRmsJFTsCjKYJyw/En25GB/GhXzS0wa3bmHneOymtMySj1U1JDte2IlpNKq3Jah/T3guDSsqxDaF2/ZbvxYUDPiUhw9bgaZqMamLwkBTlI+prZzDRmSZU+D28bu3v38yDu0GdNd1A8SPSHfc+rUdW+jAOSGuFM63gg1jLd1ChKoWmNz7jA0JGHds2WjguJ/SiDApzpVKdWt3ERvJGgZAIHsUZ/Ejoaj8sxJ/9xvQPgnaURFbtXKHYsqRLPZP6bMwzzp7oM+UkLshZ0YxaXN6+N9q+qvz3m2/xl5p9/rJksPawdJYZkdMgVwRyHRK61ynHRoZjG8U9pIiJwpeXKFw1EiNlSrevhHoxEs/vkCNtdF2ivae8aBmDxmLlHzjUQAjEHs1dLYCxz4SoBTj4kFUP9vU6O7msLbmGRb/NTLKTs+d+6LEZs/azR7JKb9/c5aao0QNMlxnI58Y2o9mgQD/M11NyR0fECo9Bnmplc6+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1luWGRnVTJBQi9MeXU0eG5VK1ZGdEsreTI4dmdEbmt4dllFZGNiSzB1S3M2?=
 =?utf-8?B?NHdBa2diSWJEcEswYXoyU2drL3NNRlZTU3pVOTFQVFI0SDNtbEJWYXRlcjg4?=
 =?utf-8?B?TnVEdXpWUXdtaWxSZVNWQ3ptbzQ4WkJyV2h3Vk1DZlJwTmJmdVQxM1IyTXp4?=
 =?utf-8?B?a05SVVlhU1JjaXpVR2pPVFYzQnZsSW5WRmRqYWZ4U0ExZ0hlV1JkNkZJVzNu?=
 =?utf-8?B?WUgxUjF3UEd5eHFrL0pHY3Z0bDVjT29Famw5SWRua2gvRFlhYzZTY1dmT25K?=
 =?utf-8?B?em1Sd0IwVU9QK3dlUEN2Q2xOL2xNd1dRNjQ5Slh4d200b0p1aVhTUDlEaHlO?=
 =?utf-8?B?amtNdFVDanFQVFlXR0VRRlRaMUcxOUQxMmxRYjlCRW9DaHNXazAvWG40UkF1?=
 =?utf-8?B?RFFTSDFIRkpSc09Ea0VJUDR1c3l1dkRlMVhtR0tpL0xDZFVwVTRGV1VtMk0z?=
 =?utf-8?B?TTJ3emRsWkQ2anFpMERGNU5IZFZ0bnFQYjVWUnJGV095NTRaWlhQS2o0QkhC?=
 =?utf-8?B?c0Qzb0dTZ2tvQ2Y0S3A0WUtETytNNGZFOWt1Mk5FdUs0OVpPR2VYZ3lKSlV4?=
 =?utf-8?B?djZuaXZQNUpIUEhuUjdKeDlVNTh0VC9zYzAwVXZWZnpSc1R1T1VGQlNiaGx0?=
 =?utf-8?B?L2hQUG5jS2dpVDNBYkI0SU94MGgxeFV4ZmZ4ekVObElBTTV2UklLakNwMEc4?=
 =?utf-8?B?Mm92cENTbmJsSDg4V293VkkvaVRXRUkrRzRBUGNVSGs0dWRjRlM5VE5yMVp4?=
 =?utf-8?B?WHR5T2NCRGhhZEMzcmRoMkVpZnZsemxKKzFHcytLQkhMMFBRQ0VZeU5ZNzVp?=
 =?utf-8?B?UzZucEVENXYvS01EZDU1NzVYNCtHNWhDTzQvQ0k3S0VING5QSVJVR0t0WU5j?=
 =?utf-8?B?UG9reDZwN0hmWU1RaDZwVGZGU1MzMjF0S1BhcjNET3dnUW1iZUVqSkt5b1pC?=
 =?utf-8?B?Zmp5MnFZRDE4cGVBVjVZMDc4VWZDSW1SVUdZVmZlMkw1eUlCeHZ3dnJUbGx0?=
 =?utf-8?B?S29jWTR3Zm1Hbm4zYzB4a2R2ekRBZUFublMzbFM1Q3B0bVp2NFZvYW15UFp3?=
 =?utf-8?B?MG51RTRSamdVL0J2RStwemRuUVJwZUY5Y04wOWJ4c3o4RHNpOENLck10NVBa?=
 =?utf-8?B?L0xEZjkvVkVvWmJvTml3dUVid3B1cm5GWHFNazdadzNDZlZzYkdweExha256?=
 =?utf-8?B?cTBwUnZLMUhkRDArNWlQa3djVHdaL21SZ1E5c3B5L0Q2L3JEWWdKeUlDVmph?=
 =?utf-8?B?bzhQNGZCbGxZdGJQUEtub1lpVmFRRTFMSkZqNGRCZEg4cHpqNmJ6akJUWXpK?=
 =?utf-8?B?ckZKcG1OUG5vOTNQT2p3L0RoMXZ3TmU1OUxId3lHYldyR1F4Q1I0Q3U4UmV1?=
 =?utf-8?B?WDJraWJDOGkyWDVXeGpVUXZkQVJYUGp6azhLL05uOEswelJ4cUlNSFpST09M?=
 =?utf-8?B?UW8zWTdxbVVheEh2SnpZV1lLaVNtbjZiS1NiUVNTVzVDVXlOTkoyM0tDbkdz?=
 =?utf-8?B?U1hHZ2VIU1ZWb1B6YkZQM0xBMTg3WW0vRzhxZjJuS2dtc2tEamdpNlFRUjhU?=
 =?utf-8?B?REtwWERmYncvOU9uemZIRmxGMkJTVXFWbENxRDJNTnRGN21ya1I1N1pPUGlF?=
 =?utf-8?B?QjdlMkNnanh4bVJBcDBxSHlxanl6VFg1R2d2bWU3bzJqRzk2T2UrR3paSlhp?=
 =?utf-8?B?Wnp3Tk9tUXZlVHc1cDFzbWpKZHZ4VFZueE5aTlYxNStoeS9XRDdxeE5DeW1K?=
 =?utf-8?B?WFlZTTNOQ0dnQTdxdGpLVFFPbmxQLzk0R2g1aFQ0dHZxc2xLRS96L1VkdWNy?=
 =?utf-8?B?OHJUWXdJbmZJdE8xUkVsOFk0T2pYRUZHcnY3MHRDK1ZmL3VzRXRWaWJlYUN6?=
 =?utf-8?B?VXJjYjZwend0eU9seUZtc3ZPM09UNDBWYkIxN2dvancxa2FadTRuNUJGTzJa?=
 =?utf-8?B?VklKTUhQZlk1V2ZFVUhKMkVHbUE4NmVob1FoUWFYV01tQkpXWmtRRG93MVRn?=
 =?utf-8?B?M1hySVdFZmh0NFYraS9MN2FneE92VkxjaW0xWUtYdzI1dFo4S1BNRmlORjZR?=
 =?utf-8?B?NWMwdFJEaDBhc1BjWjlvbEw1NEJEYkRodk9EOVAvN0g5NlBrYjdSNU05RVJH?=
 =?utf-8?B?MTE2TlhVWDRkNEk3N1dEL2thUVgxUUQvY1dyaGtvZWhsNUIrN0hEbm83WUpU?=
 =?utf-8?B?c25BRERaeVc0ZzBLdlI2YmtHYmJBN2c5VGVNMDNhRzlPeFIxTXNlRlBXeXJ0?=
 =?utf-8?B?d3BHS29EVUFrY0NPdmNTRkRodzBVQXNhdlIyT21FTHlUQzFLZFlRL0R0OGxO?=
 =?utf-8?B?NGxpOWg4MW5YQjVVWVhTODJHN0JMajc4c3BGTU1iNTgvVWxmbkdQQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4444a6-ff95-4bd7-5234-08ded2d4b49a
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:13:33.9606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRCRA60cNwlRPm9OwOckQOpoKhmJG+4rGcCD58ZCrwQPaCIlQkHsO4kTIi1F9vyD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9237

> Xilinx Versal Soft Error Mitigation (XilSEM) is responsible for reporting
> and optionally correcting soft errors in Configuration Memory of Versal.
> The Configuration Memory includes Configuration RAM and
> Network on Chip (NoC) peripheral interconnect (NPI) Registers.
> 
> The Configuration RAM (CRAM) memory is used for storing configuration
> data for the programmable logic (PL) fabric. The NPI registers are used
> for configuring the memory controllers, miscellaneous integrated hardware,
> NoC interface units in the Veral device.
> 
> Add support to handle correctable and uncorrectable error events
> from XilSEM.
> 
> Add sysfs interface for XilSEM scan operations
> initialize, start, stop scan, error inject, read ECC, scan status and
> configuration values.
> 
> Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
> ---
<snip>

>   static int mc_probe(struct platform_device *pdev)
>   {
> -	void __iomem *ddrmc_baseaddr, *ddrmc_noc_baseaddr;
> +	void __iomem *ddrmc_baseaddr, *ddrmc_noc_baseaddr, *sem_baseaddr;
>   	struct edac_mc_layer layers[2];
>   	struct mem_ctl_info *mci;
>   	u8 num_chans, num_csrows;
>   	struct edac_priv *priv;
>   	u32 edac_mc_id, regval;
> +	u32 family_code;
>   	int rc;
>   
>   	ddrmc_baseaddr = devm_platform_ioremap_resource_byname(pdev, "base");
> @@ -1094,6 +2365,10 @@ static int mc_probe(struct platform_device *pdev)
>   	if (!get_ecc_state(ddrmc_baseaddr))
>   		return -ENXIO;
>   
> +	sem_baseaddr = devm_platform_ioremap_resource_byname(pdev, "semrtca");
> +	if (IS_ERR(sem_baseaddr))
> +		return PTR_ERR(sem_baseaddr);
> +

As mentioned by Krzysztof in DT review this change breaks existing
system. Please ioremap this semrtca resource only for xilSEM support.
We can make use of compatible based match data.

>   	/* Allocate ID number for the EMIF controller */
>   	edac_mc_id = emif_get_id(pdev->dev.of_node);
>   
> @@ -1124,9 +2399,29 @@ static int mc_probe(struct platform_device *pdev)
>   	priv = mci->pvt_info;
>   	priv->ddrmc_baseaddr = ddrmc_baseaddr;
>   	priv->ddrmc_noc_baseaddr = ddrmc_noc_baseaddr;
> +	priv->sem_baseaddr = sem_baseaddr;
>   	priv->ce_cnt = 0;
>   	priv->ue_cnt = 0;
>   	priv->mc_id = edac_mc_id;
> +	priv->xsem_rtca = NULL;
> +
> +	/* Allocate and initialize XilSem RTCA structure */
> +	priv->xsem_rtca = devm_kzalloc(&pdev->dev,
> +				       sizeof(struct xsem_rtca_priv),
> +				       GFP_KERNEL);
> +	if (!priv->xsem_rtca) {
> +		edac_printk(KERN_ERR, EDAC_MC,
> +			    "Failed to allocate xsem_rtca\n");
> +		rc = -ENOMEM;
> +		goto free_edac_mc;
> +	}
> +
> +	priv->xsem_rtca->slr_info = devm_kzalloc(&pdev->dev, sizeof(struct xsem_ssit_status),
> +						 GFP_KERNEL);
> +	if (!priv->xsem_rtca->slr_info) {
> +		rc = -ENOMEM;
> +		goto free_edac_mc;
> +	}
>   
>   	mc_init(mci, pdev);
>   
> @@ -1147,6 +2442,41 @@ static int mc_probe(struct platform_device *pdev)
>   		goto del_mc;
>   	}
>   
> +	/* Create XilSem sysfs attributes only if XilSem is available */
> +	rc = xsem_edac_create_sysfs_attributes(mci);
> +	if (rc) {
> +		edac_printk(KERN_ERR, EDAC_MC,
> +			    "Failed to create sysfs entries\n");
> +		goto remove_sysfs;
> +	}
> +
> +	/*
> +	 * Firmware driver returns -ENODEV if it is not probed. In this case
> +	 * defer XilSEM error event registration.
> +	 */
> +	rc = zynqmp_pm_get_family_info(&family_code);
> +	if (rc) {
> +		if (rc == -ENODEV)
> +			rc = -EPROBE_DEFER;
> +
> +		goto del_mc;
> +	}
> +	if (family_code == PM_VERSAL_FAMILY_CODE) {
> +		priv->xsem_rtca->sw_event_node_id = VERSAL_EVENT_ERROR_SW_ERR;
> +		priv->xsem_rtca->cram_ce_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_CE_5;
> +		priv->xsem_rtca->cram_ue_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_UE_6;
> +		priv->xsem_rtca->npi_ue_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_UE_7;
> +	} else {
> +		edac_printk(KERN_ERR, EDAC_MC, "Invalid Device family code %d\n", family_code);
> +	}
> +
> +	rc = xlnx_register_event(PM_NOTIFY_CB, priv->xsem_rtca->sw_event_node_id,
> +				 priv->xsem_rtca->cram_ce_mask | priv->xsem_rtca->cram_ue_mask |
> +				 priv->xsem_rtca->npi_ue_mask,
> +				 false, xsem_err_callback, mci);
> +	if (rc)
> +		goto del_mc;
> +
>   #ifdef CONFIG_EDAC_DEBUG
>   	create_debugfs_attributes(mci);
>   	setup_address_map(priv);
> @@ -1154,6 +2484,8 @@ static int mc_probe(struct platform_device *pdev)
>   	enable_intr(priv);
>   	return rc;
>   
> +remove_sysfs:
> +	xsem_edac_remove_sysfs_attributes(mci);
>   del_mc:
>   	edac_mc_del_mc(&pdev->dev);
>   free_edac_mc:
> @@ -1173,9 +2505,21 @@ static void mc_remove(struct platform_device *pdev)
>   	debugfs_remove_recursive(priv->debugfs);
>   #endif
>   
> +	/* Unregister XilSem events if they were registered */
> +	if (priv->xsem_rtca) {
> +		xlnx_unregister_event(PM_NOTIFY_CB, priv->xsem_rtca->sw_event_node_id,
> +				      priv->xsem_rtca->cram_ce_mask |
> +					  priv->xsem_rtca->cram_ue_mask |
> +					  priv->xsem_rtca->npi_ue_mask,
> +				      xsem_err_callback, mci);
> +	}
>   	xlnx_unregister_event(PM_NOTIFY_CB, VERSAL_EVENT_ERROR_PMC_ERR1,
>   			      XPM_EVENT_ERROR_MASK_DDRMC_CR |
>   			      XPM_EVENT_ERROR_MASK_DDRMC_NCR, err_callback, mci);
> +	/* Remove XilSem sysfs attributes if they were created */
> +	if (priv->xsem_rtca)
> +		xsem_edac_remove_sysfs_attributes(mci);
> +
>   	edac_mc_del_mc(&pdev->dev);
>   	edac_mc_free(mci);
>   }

