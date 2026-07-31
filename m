Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063523A1B5;
	Fri, 31 Jul 2026 14:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506829; cv=fail; b=Wr1SudxU0uyYbeWzloHKiKuICr4oyOx7GPwsWEGbG26xFlDJBXm/6zXS987lU+BWccNNNGPIbZH7o35YHuftxfc+QqBMKfXcUCaaH0LIU6W8TlyfNUDAxl0dTXEIgFc9aWOmX8ej4DwmEPA1r26jS5QI9UBed3rbc3VaSZUMwuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506829; c=relaxed/simple;
	bh=4qG01uyRxZoyTnF8M35nXzEx2az9ismv8bUttSTCTeE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VBU060uQt7zBBT6/gwEr6qzKBUjgBLe6Otn/OxCEIQp76+zCUP5/9kM+X56sYg5uJUysuThlwedpUFfU4KFgksW5WzvQUsHiqC/siBeil0TAJkyH3Te8SLy2bb1Eu0ux5uE+JaE9wXMsLRxAKTL1pf/KYfc0AEhkKkuRdaGjFzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5ntDdQ/X; arc=fail smtp.client-ip=52.101.46.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5ntDdQ/X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOsGFBJIFOXlwzrTcIUtCNBW3vkWmt949PIauNN3rO34yqkWMhvtwEWvt/OkorX+sY0kXRdoOlhRRJdPM9g0HEpkDaE81miPmxKhqAVROh92lK4SfHZNlXWoFuF2f5GjvYaHMuO44+ra/ELOZXG8q7w55wB1bHELG3mpkKer8/dY15M1q1+ItuMjPXNTxs+jBq+AMwk0J0myg8Jua+26QFsZC/sjl5Jyz4LatsSsYrQ6rYeBacM5mc7cEVJngHWJl+rma7JwSPvKQ7+5Ex+Q5dRVUcfkSc16khqb4zScN1Ig/54+9FDRRmLdPwEUEVXmEN+gFSdcTWGy5pqMiTVVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdnqymNff9Lf6ZF3EhRp/X/MkRQaGTy1bnbUroZqH3M=;
 b=VM2RAXjszGQwsMpNcG39vNohac3nMyPKi2niUNN6efCL3wmgUOP99W2p3cwgaPY+wQe379UVX++kHsFUl9OEF8NfhPWB5uzSM25zkOnNfvEJjCgbx/gYdQAOkkMcun3yNpAmUnXv/KwysD8vEwXoWkxFhi3oTh/XwySX4xb/L0KmcazP7fv1mN/WjlP3pywKy1db8HTDJWZTdsDARPynz0ga+pbEKhuzmXY5hRsmyHriLtgAahwqlqV6gByPM+h/c5qb8uKAF/OIWdds54aLKIopr3l1ICcaZ1V6pIIUTiI0IcLEez6oeGXSk2yM+SwZaFJ/kL43Vq8n9G5vf/PVJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdnqymNff9Lf6ZF3EhRp/X/MkRQaGTy1bnbUroZqH3M=;
 b=5ntDdQ/XfbeaWaQ+IrnexLVYtnx4b3qRlSQtO/1MX7rttH7Wl7VX/Tut5s1pmATDeMrmzjdy0uSfnVdShmPEps2Fp0YbjtbI4CW0ukX9gVd4GU+m+oVu9caGTlHyS6wdVBMqBFu2esfh8eI4ZQCw3uvwUrfEQUWV7woBPge2nuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SA3PR12MB8045.namprd12.prod.outlook.com (2603:10b6:806:31d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 14:06:59 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 14:06:59 +0000
Message-ID: <f5d5f6d0-3dd3-4ea0-b969-f975760cc149@amd.com>
Date: Fri, 31 Jul 2026 19:36:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] EDAC/versalnet: Fix use-after-free in remove_one_mc()
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-9-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260724171945.2812749-9-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::7) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SA3PR12MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6182f6-9ff9-4f77-bcf2-08deef0cfcc1
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|4143699003|11063799006|5023799004|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	GQDhiBM9kxTqXiw5nIAQktScWTd95hcjYX0E0dK+x7RCQH+b1oOfg6hXYGq0AmAksAs726RFbK9y+DC+JwmpEvSAzxyOQeeaYqXnUGLPThVYLuRTiXMCDQZlmVAVMFsuCvwMRpchf2p00IyZYIz4Bcm/DKJYFcLJ1Vlf/YVhVQ1HesN9VvzBRAm5dTll7Bwfvv6GFQ3lY00Ik3tSlgyHsY2AK/tZmt2dESfz4tiiPE0jGWM+nOVDiD+2K/aJ7V++PbRyvK6jiJRbot76OY7dbKFkgr+kDvzXW25jU6ncTNXCmKePiIoCcZYmDm3VYZWK8hl2FxW1CUomW/mdDe/VSvsHmkHfazuVb+LOLERw03f7HC1+vEWpCg6TJ3R0HEh+o+LIB7rEQqa2cx/F8mSoxzmfmuric9tT/oUJXdF6esN8+PxTyeaDeTCOqdZlWgSbhpllDHqjHJZ8OFkagP1ht6OUlxkaALTo2upNF01N216SSEsPFDFAR96T3w/r7jkLZQi8AMS/g7GPklyzU8T6IdbUDpAQsFw2QB5hMh4rNPq05up81Ojk45EjXrpwUNDrgkgUxbb0iUbE5NNRPL816/R0dm+SC1A8YxmmrFtmSEINJUI192XlTUgtFLSzbWFuQ/BTK0Qx+ggSHfPmjrNNAFQP966MhfO40my5sf2HDk0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHB6ZEtGc1BKQmkrTU8yY1VUZytpMFNkYlNPMk5MazN0dDVYczNIT0tRNkd1?=
 =?utf-8?B?WWRtRStJK2V1MkRnc3dUTDRaK0l0Y2ZhWENVSGY4WW1CVHI3Rlo1ZUw1TVYv?=
 =?utf-8?B?WGdrZDhLL1I1dlNiek91Z2hLdkVucXExaTd5d0todDRobksvMXpZblNtYzV3?=
 =?utf-8?B?cFNkcjFiMzE2bWR4a002T20zN2xlcmlUS1lCaVVtUGxENmxWdjZaSHFwQlFR?=
 =?utf-8?B?TjRPb25ZVDF5bjVGakgxVmY5SkNGT2FsNXNwQ01yZ01jNmVHNW1XMEdNNnpt?=
 =?utf-8?B?QW5DaldWNUc0dUdIa0YvcDV2akFNNWlIS3hSaGFwcHRheTNDQ3JkVTJvL3lt?=
 =?utf-8?B?eGVBK3FVMUpWbVR1WU5rUFBKSENmQmdXdEY1S3BLL1p3WnVwSm5sVmZ6Y2l1?=
 =?utf-8?B?TGF2NjluUHA5UGNiUy9neWdlK2E0K0kydzJOVGtxdFFVa1JuMWRGeE9uNTBm?=
 =?utf-8?B?NE8rQTRlWk9SNDg5TXcwMklpWHNvUnp6YTJlYXFRN25jejJXWU5jWDZqWlpS?=
 =?utf-8?B?Zlg0V3Nua1gwZVI4VVBmZGhNWTU5ZmFvbVhQMEdDNVNNOG1iNGJTcEFya2kr?=
 =?utf-8?B?dnJLRVd3RDBMVU5pYjg1UXh5c2dsSlpZamRkU2pNMXk4elFYaWlCY2lLRzFI?=
 =?utf-8?B?Q1N1QVRwM0FvVUJ1dU42N25JS2VVSk9zRWNJb3ZIZHlTZ1FLM2c3R0FvZFZn?=
 =?utf-8?B?VGZ6Uy83YXpaQ3VMZkJhVTF2Qlg4OUcvU2xodHl1YjM0Mm1zbUZhQUt3N1Ji?=
 =?utf-8?B?NkZpNWZOZzFlOEQ2a0pBNlBtUFFYM2UrZzZyc1hqY0xFRUlTL2ZjMkdDRjBW?=
 =?utf-8?B?VDJFUE96c294REVyYjZyVm12SXZhQzljMnNLbHhqeGtaeU1QSDY2YUtaRExy?=
 =?utf-8?B?YklzSUpqZDJRVUpQbjdFZHNCemt1bXZYdElDWFlTVFovUXZZbEczRTZONm1s?=
 =?utf-8?B?Ty9Ib0t1YUVXRktiYmtIMWs3L2o2VC9jcElpVUtBVXRRTUdnbGxaNWNzUTFk?=
 =?utf-8?B?SGRHZDl6cmRMc0VXZ2hNdEk3SVVuYjZGaklTcTNwK3ZpQTF6NjhqN1MxTnRC?=
 =?utf-8?B?SHUxMnFRSnk1QldTMmVJRG9qSlQvWnprU3JRNHJiSFVvcmRXUUNXV0RPaEUx?=
 =?utf-8?B?YlVzU3kxb3BhTDRMSHF6U1dpUGl4ckpQeWs2dS80YThpSW5SNmc1RmtKWkNv?=
 =?utf-8?B?clU0OTJxaDRqeEZaQmo4cG45ekJ1ZytUUFAzMS9DaURCRmRURmlCa1dxMlFi?=
 =?utf-8?B?Znk4T2VQR3VLU0IvNTJUSjRCZ2tpazQ2eDkvcTc0K3RreW5YWHAwcUFPWDZV?=
 =?utf-8?B?blVyVmoySkNIYmNvcWt6djJlaWpnek9uVkRmMTlVbFZzYm9rYnY3RzNHNVRi?=
 =?utf-8?B?V3E0QzFZVllEMGYzb1dFbjlEdnhNUit3ODlrbEZrb3Nrck85Tk93dXpHaEpH?=
 =?utf-8?B?TzN2OGlOR1pEbU5MbS9MUkkyS1J5QnZoMnQ0cWc1WWp0YUNlcktCc3AydTFY?=
 =?utf-8?B?WVpXYzdPOFV1aUllclJqenR4SnR2a2FDTVZnZnM2bzMxcXczN0t6MjBSa3Rr?=
 =?utf-8?B?WDFMTkRQZjZObnNXS0FOTmVzRFZvSmY1Rno2d2pqRVgrMytmbi9DWERnTWwv?=
 =?utf-8?B?aUVUVWZvZkc5NnhLU1ZBekd3NnhiZDJya0FmSW8zb25abzNrd0VNU0pTRUtz?=
 =?utf-8?B?Ky9aYm1Xa0tqdWFJTFhOQTMrTnNHYUVoQkhaUDZJeFdUWXpmVFVFeFpKVEk0?=
 =?utf-8?B?aE5HWWNIazk0ZGFKeVpwTUVvMFhVM1paQy91RXFqT0tMSi9QVWgzMFlCTWNH?=
 =?utf-8?B?bitrNjAwYmhRS3lhK2ZjT3pia0RSTm81NVY2Q3NuT2RQV1NIWXllUkgrU0Z2?=
 =?utf-8?B?ZG0wRGhZc2FpQTgrQkNJNXdiWGp0ZjZWTjd0ZVMwUVZ1YmNTQm1zMXJCOE9q?=
 =?utf-8?B?N1BrZkpSZUl1bkZJU0I3UU94QUo2VERJZ3Q2OTVyelZVNFB1MlEzcUZJM0NY?=
 =?utf-8?B?NGFUSDdJNmdmajliUGdtVEt3N0tKNUpRUnQ4TFEybHdDRE84VUpSUnN3dVd4?=
 =?utf-8?B?cnJHdTgrTUtSMkNsQ29HQmljRitxYTVYazF4NFU4RS9pbXNaNHF0ZGtPQnBD?=
 =?utf-8?B?VDhNTzVIeWtsajUrVkdiNy9FZUlmVmdVMlUzUmtEaTZrZldqclBMeXlPMTQ0?=
 =?utf-8?B?M29ZVStWaVRRaEdMK29QVE1sQWJuaGZBZ0MrMlFIV3o5cHd2b2JkOWRoWXZB?=
 =?utf-8?B?UVVka1F5M2NFQW9ya2J6NHROczM4ZlpqdFdPODZVM09YdE1JTHROU0k1OEFr?=
 =?utf-8?B?aHBycnRBcEtIR3FvQ21NTHlkN2d3K0NreXprWmYxWE5SeTJiV00yUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6182f6-9ff9-4f77-bcf2-08deef0cfcc1
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:06:59.3829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASHihL3VNiamnox4cVLWHiBqKMnB5AVUpL8qMagyAGEpB8gDDb+GRaBqR0UV0IX3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8045

On 7/24/2026 10:49 PM, Shubhrajyoti Datta wrote:
> device_unregister() drops the last reference on the device and invokes
> versal_edac_release() which calls kfree(dev). The subsequent call to
> edac_mc_del_mc(mci->pdev) then dereferences the freed pointer.
> 
> Fix by saving the device pointer, calling edac_mc_del_mc() and
> edac_mc_free() first, then device_unregister() last so the device
> is freed only after all users are done with it.
> 
> Fixes: 62a9fc50e8d9 ("EDAC/versalnet: Refactor memory controller initialization and cleanup")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>


Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!> ---
> 
>   drivers/edac/versalnet_edac.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index baca90f44c58..ba295714d972 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -763,14 +763,16 @@ static void versal_edac_release(struct device *dev)
>   static void remove_one_mc(struct mc_priv *priv, int i)
>   {
>   	struct mem_ctl_info *mci;
> +	struct device *dev;
>   
>   	mci = priv->mci[i];
>   	if (!mci)
>   		return;
>   
> -	device_unregister(mci->pdev);
> -	edac_mc_del_mc(mci->pdev);
> +	dev = mci->pdev;
> +	edac_mc_del_mc(dev);
>   	edac_mc_free(mci);
> +	device_unregister(dev);
>   }
>   
>   static int init_one_mc(struct mc_priv *priv, int i)

