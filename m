Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD9E3DCDA7;
	Mon, 27 Jul 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139925; cv=fail; b=Kb9qknQRwmJ3PLfYfMhcZt63qew5c5NpaJv6xdy1RRoarxYnWBXunUp2lX5BNC6wDD7HnwOjD/EPa1hhvTC+6egvvhUNSOBEqmrMpX80GxUdFxfke+DikxKlgCq7bZ/OXx8ldfvARBz/Nm/NGygBanIdAs3ycPhtIB/AYnXdPuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139925; c=relaxed/simple;
	bh=4I1SCqh7AIC3+vLRKW0eCPBuobTPc6zt4ffWa+CcHb8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D4qEcfLmGHOYuCmsgdHZHf6iYwkSr4X8ZctpLrB0Jazu9XSO7rJcIW3haXJXpcHQhxLbTty24JKaQQn9VduGiQpAcmOGeI6E7uAu/kMRtQP/wstdilEB4z7ev6e3y1IzDDj/FNA0j7oq6BUZL5fwWtX3+BRJDmyeTyyZyUF+n/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nmDXSSm9; arc=fail smtp.client-ip=52.101.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nmDXSSm9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIGTueNiL0Oqzg8Dq6MBJ45kaU8k+0b1lma4xEw6UQ9gdfffLCZitNYPjoaygIjBCFOCAn8IXbaESbrS1tTkM+9Vwnq368RJJ829Wg9U1n2XEhTguSVjGJ5rNxX75GFo2r+qfMT6OjgjRcj78MmF72k8FBCyD6gLTEkdd5xdCjwmPM1qGPDC9SiVXVg1PtUT8LwasqXB/j8NkQSwtbUv8z4pHV+asNceMccltgIWgnaGUPYcpkp1Qfe6z8TJC0ZacfWCvJiDnAzvL6oJSD4OfuWhD8IhsRnllZTsiwNZAYOKFwbHeTvmcK2fqplJgDuFjk2kH9Yq8J87FpTdJhFNrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2W7NBP/dRy3TXbwhKJ7C0wQXk3VbY4rX0zJUKMlfzzM=;
 b=sOenpsNRLJ6rG6C/7tFw+ipF96Dg4R8q/wLjzwVzh2xG6lj2NkgUXZB2UarW10ldIqAYldBNrHgvXHHs9eDq+GImFwVhWIRr8hD8UJ0YPKaFp9hH4UrUyTZQWQc5V0JndR5HAteueRdgn6lUGvikEKHDXtAB6ftniLoK0KdZ4IneSO+k1EIbjNhMbDkrgGDauYEfDXAy43zOvETkiaomGXfwH1/tlp+kDS3qJ3/D6uaF4UeagP+XCo/mtlj8/MGdynM3Gdhn9gTAHyfZa8v8qMtjaWNgAVGzo+k2LKFRflLf/2RMdCApoNu0D2Rdo/3uLzLdMINXhe+xG2eFdMG7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2W7NBP/dRy3TXbwhKJ7C0wQXk3VbY4rX0zJUKMlfzzM=;
 b=nmDXSSm9i8BvZX2M+k5YEvppOeHgiTRLWvU1K5h21Ll9UgKQjtb70mHava6bkoYuS7tmX/nTsBlTJsyi81bQmQfZ9n4Jdfnvtc9lrpP61bPKla/Nh3m6VysP4FzDwQvWddB/Yan4eX0gnnkP0wgLQ110aO2NW0yZ5/1BYGTJ4r4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by CY5PR12MB6347.namprd12.prod.outlook.com (2603:10b6:930:20::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 08:11:59 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 08:11:59 +0000
Message-ID: <4b6253ae-dad7-4591-ad11-8cebb31caa86@amd.com>
Date: Mon, 27 Jul 2026 13:41:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] EDAC/versalnet: Add NULL check for mci in
 remove_one_mc()
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-3-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260724171945.2812749-3-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::8) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|CY5PR12MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 267e4641-d069-42fc-6d02-08deebb6bb3a
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9wdMIkFdHJNsvHUm90gSHmJ9DAUaWS0tAxNNV2Zyi11CaYOcsQBrftmBt8lM1DaosESs1bkPgzfptQAWQ5PVEmfCHQqE4HUyann+dVcwqeVZhUaBijBA5arLJOGYHJMSjVsZQsoTKxL6s/1rbrRaE7538fPnvc0Fy8DJXiFSFprv7J6kxVSHDNup3/hT9eZoXMBQHBxz3V8D3eD+YO1ByeZQRe+D3RrbIuySll22SrZ2Yc6rCtvhTfSMfGXVAKaJwbvco2qiv4p4+/+myoHW9A2z7CLgqb/ZYLvIhShWxASGSiVDd0l56q1f+ZFJnLmI3OQ8jbTKkRWnvqtz3YlHn5aNiCo5kIbGaALeGPukEHvA0sB+U4aR57F8FDaLN/SoIc+Kc4rNKc4JaR1Y9izkTxPOb5+58RbXzBK9HAUo1I3gjcFsMKHcAFxQ5zpHjvcaxcFBHEGRfxlCSKex4CriN093P8DYbhbtTBszdLo2nITodrLAC2sfOuJailUJ0sFjNiLKl5bQwQzgmlW6LHcHFrlWSKA/m7/mVhwtbaDLbzgja5iyPboWRMDomaB9Wg9ESjNTnp5d90XkrqXkpBvzLOkIPo1xG2yfQD1Qt7UTdc3lL/8vzu4oOVxLS1W1LSRYK7llJpNm2wkBxJL2MRGKwKbIWDQybqyqR5ueQdCR9MM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWpuK0RUZzArMkZiQVFqeDdITzJNVU1la0ozSy9Rem5QTGxjdWM1VlNEcmRx?=
 =?utf-8?B?MG1mcGo1eWtpSGRXeldhMXJ1NjdGL1YzMkN1QWNxTkN5TGlKUUdQbnRpMXpB?=
 =?utf-8?B?dWxkUWFkVExmbjd4aE5yRHZjWUpvWDI5V2NKOURqRE9XY0t5Z3QxMjdaVUsx?=
 =?utf-8?B?bE1NNlllemw2QzBSSVpTR0FTWS9QdENPNHhZb0FibjNKeWo1SFNtZEZ2czRG?=
 =?utf-8?B?MS9kcHlKWDJlY2lEY05USjhNWGMyamRobCtrbHdNQkVGSUQ1bnE0T0NHLyty?=
 =?utf-8?B?eUlpSzRiK2hleWtvUjNXZEJRc0NyTXliOFlTd3FsMmVqRUVNY21hbHl3MnFI?=
 =?utf-8?B?SlpUWTE1NGs3eE82Q1luaW8vK29hTjhOZVFTQnEyMEttSTNGazFrQWZSOVEw?=
 =?utf-8?B?SkFESHk1ZkRlQXpLc0FHRVFyOU5jT01Ga2hKYVJHOHE0dVA0bTZMeDNhYnY2?=
 =?utf-8?B?U3RXcFBRbDZRZnZ4cHRwVnVVMUx3ZDZpUFdFTVN5cW5MR3kzTU9UbktMSmdT?=
 =?utf-8?B?bU03OW5PajRXZ1JLamVZaFp1OTVwUDJWZW5WZklCNFBpc3owaVdzNGVoZnRh?=
 =?utf-8?B?TVZOQ1Jld2lOaVhwVjA0V2w5dWpyRkdlQTF4K3NXUnpFTHpZVDd4UnFRMmRR?=
 =?utf-8?B?NzhuSXJrMXlKMzc1ek9Tam45TTRyWktoRzRtUzRRT0hQRENQZGVCbXZKUmdk?=
 =?utf-8?B?MWQ2R3BUdlZadXgvd1JmQjhmU0NUekdEaWFWSkZLT2ZuN2hMV0x1YVJvd3lX?=
 =?utf-8?B?UVNPUFFMT0M1T01HWDF6OHdGUHZNYlA3YzRiM2pObFFCNVF6Q3BoYlp1UHBV?=
 =?utf-8?B?dzYzRUZuOHQ0bElVb25YTDNxY2tyUUU3bEtNbTBNVEZYU2E1MExnbllVdHVY?=
 =?utf-8?B?TXZUNFVMeHlzSXIyWHVNUU5GdEJhUERTRDlmdXg2NDRXbFF5ZTc5YUozU2VN?=
 =?utf-8?B?RWNSMTlHdmpLVVAvUXJpdHBZZlQrNDAzZzZOL2x3UFlPVFllVXA0VVY0ZzlK?=
 =?utf-8?B?SktIbEZSdXJwWnV2MGt2R2d4SWFIUU5PT1drb0loTDdiVFMzQkNCUHZuZGdk?=
 =?utf-8?B?K1E4WkEyYzhmZlp3ZzVMck1RdWdXY0ZyandRelJaY04yWkdodS9TN0VRWTd5?=
 =?utf-8?B?NG8rZmtLUHRTSm9qOW5OOEIzNWp3MXY0UjhXSnhXOU1pMkJEMXZPeW5FaUtH?=
 =?utf-8?B?TXF5blJzWUN1SU5sZkc0eWRuaDQwNHpXcHpndVhOV01SYmNBL3QvK1FwK3Vl?=
 =?utf-8?B?UjIramg0Rm5yZnpWMStpeVhXaHJKaHVZTkhZVksxV1B3NDlrcWsyNldhUlRs?=
 =?utf-8?B?K0xuRXNqa2JBaHhxL2tIeDZ4SXJMczFKYnd4bkhlWU1aNVRwSnB0UE11K2Fx?=
 =?utf-8?B?WFJVcVRHdWhrSXBkV2hyREVyTzhBek1yam9Icy9YUlhvWU0rMThSS1VHbkNm?=
 =?utf-8?B?WFBZYllOTk96R0dtbmZ5YlVNV0doWi9EUzlGcGw0SEVjOXJaY3lGaWh5TXRE?=
 =?utf-8?B?MU05bFlTUzJwYXI4TGowZ0lmZVJHWkIzQ05LRGcvMUpzZjFGd3pFMG1TWkZU?=
 =?utf-8?B?ZmF6cEkwdHR1MnNjeUJIcU93Zm5iREY5VWkycXZvcTFBVnZxd1JKTVJCNy92?=
 =?utf-8?B?TFJxWXd4R1F5Zk1mdmlwWTRWbTlwSWxOU21KaDBld0ZRaEFJQVRnUmYveC9I?=
 =?utf-8?B?TElaeHR3UGdaS1NZOU1Db0pMSnl0bUUrOTY5LzhpZlJXSWFhR2Jhcm82amhw?=
 =?utf-8?B?cm5GSmhVU0FEcThVamFhZU9hR0l6cldDeWVLNHA2RnF3MHBqMEVxYlU5amtS?=
 =?utf-8?B?UXpLaVNhOE1QdDlDMlo4ZSttVDhuNVprRWVwSmhRdGk5KzcyQy9JREt0N25S?=
 =?utf-8?B?aHk4aWRydXExdjdJZ3AvSU1YZ29RM0VDVWsrVkNJK2VhSTZIc3VSa3c4WjJY?=
 =?utf-8?B?YjFUZ3dHcDA4amRDNFZrWGpuMG5pT1dWazQvd3hjVnpERm9HeDMyVFNPbm1R?=
 =?utf-8?B?czVVTkhqRHFsRVF0R2lid0o5MzdrSUFUY2YzQ3h2ZzJGU0hrM3JFZ2YrQWov?=
 =?utf-8?B?enBqV01IYnhoTUhzWkx4OXZvM2VJV1VKSHNMNG50eFVwWlFGZmZtZUxleWg4?=
 =?utf-8?B?OVJQOFl0OUFSZTgxZjd2ZWFJZTZZeUcwY0YrSllMWTZsM0t6UVpmeDNJakpN?=
 =?utf-8?B?WCsrNDBKM29oaGNKS0ppeXRKVSs1a0s2RFlnbDI4dG5ZNXdwbDRTNU9acTZi?=
 =?utf-8?B?Q1czYkJ5MEZXcFpjazhlLzhvQVZSYVEvSERWQ01XQ04rSGEyQ1JZNWNIN0Ns?=
 =?utf-8?B?ZnU2QWZ5cE9vc0thYWtNdGRkNVk5MEp5U1VEK25KK2Jka0xTSVcyZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267e4641-d069-42fc-6d02-08deebb6bb3a
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 08:11:59.4135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mon7UG8lQZZN7QcDEhU95cdIWTNtxkEAOHUiWqepg1v/sf5dBWnKUV5o7bvHEP/A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6347

On 7/24/2026 10:49 PM, Shubhrajyoti Datta wrote:
> If a controller's configuration specifies an unrecognized bus width,
> init_one_mc() returns 0 but skips allocating priv->mci[ctl_num], leaving
> it NULL. On module unload or probe failure, remove_one_mc() is called for
> all controllers and unconditionally dereferences priv->mci[i], causing a
> kernel panic.
> 
> Add a NULL pointer check for mci before dereferencing it.
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000390
>   Internal error: Oops: 0000000096000004 [#1] SMP
>   Hardware name: Xilinx Versal NET VNX (DT)
>   pc : mc_remove+0x34/0x88
>   lr : mc_remove+0x4c/0x88
>   Call trace:
>    mc_remove+0x34/0x88
>    platform_remove+0x2c/0x70
>    device_remove+0x48/0x7c
>    device_release_driver_internal+0x1c8/0x224
>    device_driver_detach+0x18/0x28
>    unbind_store+0xb4/0xb8
> 
> Fixes: 62a9fc50e8d9 ("EDAC/versalnet: Refactor memory controller initialization and cleanup")

Confirm on fixes tag. The bug likely goes back to the original driver.
> Cc: stable@vger.kernel.org

There is no CC to stable kernel in email.

Below changes looks fine to me. With above tag fixed.

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>   drivers/edac/versalnet_edac.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 316f8f79c4d8..05dc34504cc2 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -769,6 +769,9 @@ static void remove_one_mc(struct mc_priv *priv, int i)
>   	struct mem_ctl_info *mci;
>   
>   	mci = priv->mci[i];
> +	if (!mci)
> +		return;
> +
>   	device_unregister(mci->pdev);
>   	edac_mc_del_mc(mci->pdev);
>   	edac_mc_free(mci);

