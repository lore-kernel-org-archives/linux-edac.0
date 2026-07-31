Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5187340099D;
	Fri, 31 Jul 2026 11:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498130; cv=fail; b=mIyucMO0UPOaLn4wA/Dxsv/1iUoF/yuSfLAP21/Njy8SF0y+PCqe6vS++ULIC4WceEawwCJdrM5a8F2U4V5AbCN1x37OmQJASUQYhh+RQLaqmWB1jAhipD0OVqWmfb0GuL0cKi6kvksP8ItWyUX/hWFJAVKRshGv8apkolIeBRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498130; c=relaxed/simple;
	bh=JggzecLkglaN5AE8e8xyFk2+5Iv71GcxTtKwq5R9gow=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h9sgcuVm2YfmKDKISSzMBXftHTF/JobNILa0RxR1R+1MRUbobaP1gkn3Mz8sAjS5qV48XdrHU5xzr6qptuwn6v8/3heYtk9A2+yDHzuxRjXbXBTQ1dFYszIjYh6e6Nh2xzRwst2OUs6uC8jQ1foNy5p2ZpxNs1TTV9h2T0gapX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=usybP7v1; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="usybP7v1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtB8XqidreTjIlXRn9oPv3gVbaDeUigRxfu1e0IbB//7/uknqAtqw6dgPU9r/lp3D3IxwknTP9JZW62D4xLlhtZYQ0DIbORDpMHFDd71Q7Sm+Ox52oUDnJEjI0mPpxLFy1m7Yn9e8BSGn9y3KAyQk7xtO+mG9edSxiYaf482eewzgZpQXSaRMwjW2jAisE5ZxTSB0WhOG1c3NDdygeYL84EE+7uikPbEbqL1QmHGM/4tPsbhHiUy+Iyi38gWOr5nCLm4F3MdagCozvWefh/6BWlT3tViOeMVonOqMzycp2BpelF8IYucdWjlQhVngMjI/X92Ncu9Q/6ivC4RKvKUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9nZrlg2ILxxjlYb8S+qj8kzGB+yJ7v04QEscldxL0A=;
 b=b5BH5CsQJCO4J/OQKTbj7sMp/GIADDiGeEFx2/ECSkHLU/g8TNn0by7HBoW0gDvjbxcbbMDHnP8ZaFpa6J57ufo0f9cRPjqjxygCpCyI4Ho8GDyaVXWdWcRAubGpWnfGz6EMqwwT1DpCPRUnp0rAFv13h/m5BH0B9Ex9g+04JjFE0hRegDsRPbZZdfbtA+WQj2qcbWGsaSJeOcuPRM7bsFvH1eu58OJZJ3Jl2Uj0NtOWTByLu804RJx3+bwZBwlu2SUkOdd3th81SxmA1m19mUysnbUnkvze0qSGiP8WBOZRZwT8uU/odweHm8VzLQwq7bd7PyM6ubC7ehbskwptgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9nZrlg2ILxxjlYb8S+qj8kzGB+yJ7v04QEscldxL0A=;
 b=usybP7v1PkLRQqJ1kdKRb6sN/XTk+/lIPK/HXrmBWGYZkzk9zvDU27swHAVLEu2RWr6Smx0cQOQjdQF3u8oJHiLPzcybInP9j6gnUXVssOpLoV7NXqxt9u4XgFak+uZvtn2waupt1bGyyWYSrOwTu3JMguhWgsDUIWvfA7dQe10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Fri, 31 Jul
 2026 11:42:00 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 11:42:00 +0000
Message-ID: <1f85ed76-ac26-45c8-a5bf-a9b3faf2859a@amd.com>
Date: Fri, 31 Jul 2026 17:11:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] EDAC/versalnet: Initialize MCDI before RPMsg
 registration
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-7-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260724171945.2812749-7-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0041.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::15) To CH1PR12MB9717.namprd12.prod.outlook.com
 (2603:10b6:610:2b2::8)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: a30cf59f-4660-4d8c-83fb-08deeef8bb63
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|11063799006|5023799004|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	U2MPQfUGsZSOAqEEDjL3mInX8EFEG0bfjyg9xSfKpVGTvxAJah32ebHfSQyvBBH5U1uaOPqOBQhXqemxtxH12LcFMHhiTI1CPBP2VwxVe5oIxFF0UXEAnRM9k8GeilwZ3wlt6NM/xFNa6n0k6hDnG94cDryDMrAKXPpEmoJ24i5rdFRueZYIcH+uq26uXJ8Uq+TMTDf55mSt3MoiYytvdXuQNv29d/IAjs1aTrrUpCpt7k0m8XKaZgdycuq+eSZNYpwOiENR9COyCMOxmCM255Dl8w2H+GMKFWUOT+XwBnAdu6YQRwxiErKFTOb7v8QqO1GOFzhCKLaMdp64EKQB+8OCobY1xOwfkoKZloixOiHVK9UIPsxDaUs8cu0h2eECZyzyrPXYXY7bHUTMpuAkVc16OnDEJbxpMJM/srzLou77CVbLJE+CSm1lmU6bgz1isuR+p5zJCh4ArfyE4wdanW+t4xghodZxRNdlP+SAYOM2RLFg6JLNnKDggHzqmaG/9W2V/p+bpzY/bgd69FDFyeNhv5QS+EcIRNkvprvQXCGoKJPLl1xRYWQb7FTtp38oY25iltXXyGGzOibMPPSWs8ObYS1l7goqKt4HburbIBXY/LbPrs5vfO1ouxcYWr/7DflVjGe6DFtL3pKerBi2K1Iy328g5v0cdCRkwGMw4DM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkMwTFQxWkJTemZFV3UvTUFhdGNSKzhzR3p3UWhSdExrWERqQmZkVVNLQ3BM?=
 =?utf-8?B?cnlMcGxOLy8xcUdpdUVyVmpZVG5aV1NYSzhTWFNteUVHSkV0NUh5SGtaZHY5?=
 =?utf-8?B?OXExOU5oNUJYZWQ0aUNoelpqR01QS1BTTUNSZ0pOMGs2WHQ2VUh5eGdybklw?=
 =?utf-8?B?cVdWMlJDc0w4U25PMHVuSG9YdU1Vc2h0U25SVTNqN2lEOVV5OStWZmdGdjcy?=
 =?utf-8?B?TWRiL1N4RHRScGg1enNlZVZXaGtBM21MUklMVVFDcDV1NmQwaXA3czVNbkEw?=
 =?utf-8?B?T1MrZ3dpU1RXNC9EMzBxcXZwY3Zqbi9MTWJEenJQT1JXNFhINEpLdnorUTN3?=
 =?utf-8?B?angydVRoVGNMVHJ3Q0lTaWlaVjJnUnQ4aDJyNXZBOHU3WDBMNDBLbi9FN00y?=
 =?utf-8?B?alNscTZiTTUrMXJ3bWNPd1dmNWw4ZWFLSWp1N0hYNDhRckpqMXNaSnQwSS9T?=
 =?utf-8?B?WWpWaHU1ODhZVzJSbkJ5MHJFenpMREh6VWMyNnNVQ3hzaThJd1IvSHB4SU1K?=
 =?utf-8?B?MU5ubnlVeEp6eHBmR2lFNGNkeUtNK2MxSHNlWGRNTElUN29qYlM3c0JCbnMy?=
 =?utf-8?B?bWdOWjFZTSttM0RYS25aQi9kL0FCTFA1cVpzR2lHVEtxR2xLNXJxQ2NWeXI3?=
 =?utf-8?B?SW0yYlVyMUJVak8xOUdLOWNWN1k1Zm9ZaDdxWnBJZXk1QTRYOEg5azR4Zy8y?=
 =?utf-8?B?MHVWVHFTazJIZUVmR1NuS1V2bHZBcGhRazc2bkQ1QktOa3hNWko0MWZtYmxN?=
 =?utf-8?B?UUtid3lPYlAyZ3dqSVc2bW5VMUY1aFlWSU5XTlRFUi9ndmFuNlNzSEdRVlpq?=
 =?utf-8?B?c2NFQkJSUmpRK1E3ZzRUd3ZSdUhvREVHRFh0UlZkQ2ora3puWElja3pKU0g4?=
 =?utf-8?B?Y1RlalVyc3I2OXlsQVJSRk1WajJaWlNRUldNcWF2bW5HSHBqUC95cyt4YlhQ?=
 =?utf-8?B?eW9WSG1qaENZY3BPUXlzR2t0eFRRWUpkUW1kcGpiUlZRZk5wTU5nWFRPc2Uz?=
 =?utf-8?B?RE9VS2VYckpqNWJQZ2FXc2c3MmxaZFdHMnM1MkFRb3Y1YWRIOHUvUzJjb2sy?=
 =?utf-8?B?VUdLd1BWd2NDRk9jNUR6VTVtZDZjUXVEU0QzL2RFRVFoejFsNFJpazVMSjNm?=
 =?utf-8?B?WWE1Ym90V3cxUTAzTkY4TkpuYmhlZmhiN3JVdlprdk9ic3lCQUl5VytXRDhF?=
 =?utf-8?B?U2hnRGJ2R1Bxd1pacnNPbE1CU3RNb1V3NnRPWkxabnZwbE9iRXlaWDNrQnRm?=
 =?utf-8?B?cjhJdzczTVdpcU1EV0hwdURSSG5jcXZRSHJGUWNOSCtBN3ZYQVdjNEFQeEVB?=
 =?utf-8?B?ak5PTHkrZjJJOFBGYkFEcUR5S2lZSlBWNkxvQklFOFNTVmt4MWs4NkIxaTFZ?=
 =?utf-8?B?UUV5UjhtWHQxcVFwQUtIM1BRR3p3c3R3VmlPc1lGWVMrL3o4Q2hJdmVGRUph?=
 =?utf-8?B?aHZEQ0lvalEvVWxKNnRqS0tRT1krMEdxM2JLOEJxcmtsRWJvV29hU3dBZy9N?=
 =?utf-8?B?VXpHTWhiK0d6VlROQWdkNklPSVBGc3ErTFJkYVJ6eitiQzVxSlArdlJMRk9Z?=
 =?utf-8?B?V0plSWhyN3pMblNoMmxXemhlU3N4OWVMckFpclNYRCsxb1hPTllRSkxlZFY3?=
 =?utf-8?B?YUZDZkUvNk1RWVpxMnNMK0ZMWHVDU3hYeEpnNHVONGo0ZVZJeVp2MGxjRHph?=
 =?utf-8?B?MDczQjBVVUhoZmd1dUozOEFHWEgvdEJEWSsxVEM5NDhQdyszc2hHRy92YTR3?=
 =?utf-8?B?YU5jOXJWUTlFaDRzalhvTUg0V21KTmhQd3FnUDY1K2RkYzBPcThqR2FNL3g3?=
 =?utf-8?B?L3l3QUhjaS9ZTnJOWFBnb3RpRFJFbnFkODNyNmZjR0UybUlHZ0ZvWTNIekhz?=
 =?utf-8?B?Y29WZE1FaStRVHJGUUVGdVdkRkFHZVlJZVVUWnRTSEUxc1AwSS9lZWt0TDlI?=
 =?utf-8?B?M1dXd0JZdmd4a285TDJlamlRREJUUUV3WC9SR3htL2lLZzk0UnppVjBlN0pC?=
 =?utf-8?B?NE5iSVlzZkhkcUxoaU9oOUNUL0hkK01SYnhYdzR6RFBpUjQ1NTdtRTNPTXpp?=
 =?utf-8?B?Mk9NWkxRd0F2L0xmSVJEZzc2YW84cnZXeG1nRHRFSFpSSWZpU0RSOWtvTmhC?=
 =?utf-8?B?TjlaS3RBYVdxeHgzc0hROFIxK1VBT3hrR092N2hHdHNtYlZ0NytuOGNZVTcy?=
 =?utf-8?B?WEpLcDVWT2xtYWQ1RlJOMjRGZ0NFSHhLYVoybHhoemxnMzlGbFVDZkdVSHMx?=
 =?utf-8?B?a0paUmQ4LzhYQmRjZG04SzcwbjRlMlpST3krNlp1b1R6ZEZJUXpuUGhZMVpH?=
 =?utf-8?B?cEhTeUlRNzMrbjd2elp1YWFtOTdaZ0RNMmI1eGR6c0poWk04Wm82UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30cf59f-4660-4d8c-83fb-08deeef8bb63
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 11:42:00.4910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sidMeGx/I9hYe1QeKqUm6lExs1YHZJdEuVM9fY3Fvh2a9eRDUqTpite5WRXlNk5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321

On 7/24/2026 10:49 PM, Shubhrajyoti Datta wrote:
> setup_mcdi() currently allocates the MCDI instance, assigns the RPMsg
> endpoint, and retrieves DDR configuration data. The DDR configuration
> path invokes cdx_mcdi_rpc(), which requires a functional RPMsg endpoint.
> 
> Split setup_mcdi() so that only MCDI allocation and initialization are
> performed before RPMsg registration. Move endpoint assignment and DDR
> configuration retrieval until after register_rpmsg_driver() succeeds.
> Update the error paths to match the new initialization order, ensuring
> resources are released in reverse order of acquisition.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>   drivers/edac/versalnet_edac.c | 29 ++++++++++++++---------------
>   1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 1caaba653fc0..e9561242f292 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -559,7 +559,7 @@ static void get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
>   static int setup_mcdi(struct mc_priv *mc_priv)
>   {
>   	struct cdx_mcdi *amd_mcdi;
> -	int ret, i;
> +	int ret;
>   
>   	amd_mcdi = kzalloc_obj(*amd_mcdi);
>   	if (!amd_mcdi)
> @@ -572,12 +572,7 @@ static int setup_mcdi(struct mc_priv *mc_priv)
>   		return ret;
>   	}
>   
> -	amd_mcdi->ept = mc_priv->ept;
>   	mc_priv->mcdi = amd_mcdi;
> -
> -	for (i = 0; i < NUM_CONTROLLERS; i++)
> -		get_ddr_config(i, &mc_priv->adec[ADEC_NUM * i], amd_mcdi);
> -
>   	return 0;
>   }
>   
> @@ -886,7 +881,7 @@ static int mc_probe(struct platform_device *pdev)
>   {
>   	struct mc_priv *priv;
>   	struct rproc *rp;
> -	int rc;
> +	int rc, i;
>   
>   	struct device_node *r5_core_node __free(device_node) =
>   		of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
> @@ -914,18 +909,22 @@ static int mc_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, priv);
>   	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
>   
> +	rc = setup_mcdi(priv);
> +	if (rc)
> +		goto err_alloc;
> +
>   	rc = register_rpmsg_driver(&amd_rpmsg_driver);
>   	if (rc) {
>   		edac_printk(KERN_ERR, EDAC_MC, "Failed to register RPMsg driver: %d\n", rc);
> -		goto err_alloc;
> -	}
> -
> -	rc = setup_mcdi(priv);
> -	if (rc)
>   		goto err_unreg;
> +	}
>   
> +	priv->mcdi->ept = priv->ept;
>   	priv->mcdi->r5_rproc = rp;
>   
> +	for (i = 0; i < NUM_CONTROLLERS; i++)
> +		get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
> +
>   	rc = init_versalnet(priv);
>   	if (rc)
>   		goto err_init;
> @@ -933,11 +932,11 @@ static int mc_probe(struct platform_device *pdev)
>   	return 0;
>   
>   err_init:
> -	cdx_mcdi_finish(priv->mcdi);
> -	kfree(priv->mcdi);
> +	unregister_rpmsg_driver(&amd_rpmsg_driver);
>   
>   err_unreg:
> -	unregister_rpmsg_driver(&amd_rpmsg_driver);
> +	cdx_mcdi_finish(priv->mcdi);
> +	kfree(priv->mcdi);

Nit - considering renaming the labels. Rest changes
looks fine to me.

>   
>   err_alloc:
>   	rproc_shutdown(rp);

