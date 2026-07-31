Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADC142C519;
	Fri, 31 Jul 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507987; cv=fail; b=ZgCnWf1BqQ0rsRAejggZMlPhYJLyVZ5lUB0ZeL+n5B51Kg6mPsTfVHbfgVbBZLzP7uTMzWKJW1Jsq1Snh17aQewz3iOsXcwTwXJiURpCWuK5M7gxWi045e6WQ4xuQNWvj92Bf+uoqWx0UXnJjhqb9WMNLtQkRICosT2y6uamB4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507987; c=relaxed/simple;
	bh=y6iQ+OAlajKAB1xYhCbLHu3DoN1LGYa0/NryUz2u8sI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KxizzB3zk1OmoapEofdRnd8nkkgLXlS1mpHRN6jHzz3puYwy2FqxJ+vpOk1HYGiu3P/RC4uF1+Qqbc81nhO+CzAifF2jdadlio0C+ckYnpckVhc7/ZFO7e3CkJuPnsERzeH8EKUFo922nV1LeZ3SFRMJjOGs3v/iJVnX4PMa9SY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ECAAWsXO; arc=fail smtp.client-ip=52.101.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ECAAWsXO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdWBzpUG+VqAvhVvQqol3ycrUDVweT6gWicJzEDqRQr8DMUW5XiDYZEBAoz7f1HH4HGfdH2B8I1o4yyA+WS/V/N6UKkyzvbeosQgf5R3PLhh3CMvyGaetUPoDcCPZm0AflZMVHpcqJz1dIQiEX+nPWOlk/2ve/p3i265SS6UaTiUiJuhfT0rMF3YLFPTTMe1XHkE3iNjJARxPnPvtMe6s+lBPy92jXbaOq10uhd3O8pfy5HbUwqoWPiRirtH9prQ9CzJLXXn9b/HVsSWFq7XCQFaL1rpZbJnQ9GBXHS72FwcjWBUGOgr8fukvLB0VYVOP31gC2PpGhG72OcsCijIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exko5JUENbZ+XhZYicsTSBAw2IenLWBVCMQUF9BugTg=;
 b=F46hw8SvZF+pjYoynMVYYW62dlHsSPIIPqwPXZCuX56YT0k5sN8BK59w0kgoXxyYUSfFpWofQnBryoq7KB6VDDOD/3zwNf/BnHfEl7lYsGhcFPaOe6EiQZI9/rXmnZQeUPTfXoXO02rbss9DzMqR7iz0xLRAQmx0o7ZGRRiqKSacEmbqIWDv2QxAqSBUptaO+Ac/W6w0G5vLNYuxCBDgeO25P1bYFkSLvHjEVR/tkHah7D1LfPVxbGG7Afp+Tb8Jk2J0xeJUAxwT59tCeVEeMO1Pkyr75Te3qN343giTGu56s5yXZDzYIG3719MYgeTp+C/ldf68TzOoh9HOEq+b6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exko5JUENbZ+XhZYicsTSBAw2IenLWBVCMQUF9BugTg=;
 b=ECAAWsXOTs+qSKY5tOdZbwDe5BiGosErobnh6TFWtqyvCe0ciqbrJSdA8g7hc7mJiR/sArduROThImZnMojO/R28ZC7LfhpXCwqbgleO+FgSjp6AK+9VC4Y/D45FHNzBMIUqPyl+Y1F3uaIXr6aPnaHlzQHJIceEG5T6ZWz39Yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SJ0PR12MB8138.namprd12.prod.outlook.com (2603:10b6:a03:4e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 14:26:18 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 14:26:18 +0000
Message-ID: <533c4d27-7156-43d5-821e-fa45160dfe21@amd.com>
Date: Fri, 31 Jul 2026 19:56:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] EDAC/versalnet: Use designated initializer for
 rpmsg_channel_info
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-10-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260724171945.2812749-10-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0082.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::12) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SJ0PR12MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e99a80b-298e-4ae8-b739-08deef0faf5d
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	0AlFd1P3hmjh3uYcSmxG2kkutuDFl6fKYGhmdqmD4HTlBuVZhaSRzY0JnQA234hDvLvUa7IISX5mSdTKNoK6l4t1C0z0dGrA/Wx4kjQjCuD4eaoJ11ixRUjjD5Ajh5xeoH4B7t65l4HIRi3kYO2ME9Y4k1YYo3dM259oCnlXsxoF098pcvu/vMrWD0MQrsqOK7NSOXDGLyl3FKAFSj+X0TuxSxRpYUso0wH+mmjXPKkbJg2G4DEWiyLTUr5frUU8VGKKQDqD6UnJHTBMeNGS5FyuUeDz+298iMBtoRl2MgkrUntA5dc+d3FhC69/oTbyFGKJLCby5KETmVm5pGKal67jKsy3F1FbmO1LMhVJPNn4ET44azqJ3bPzBDPAbtqL3VRNA8bMI1l9Ur3mWnOosttNGta1RFkAcJdXCnNLVtyu70BhezM8BgyBtxgh2Z5ucmyQOgpXJSenACai/vOGXsldgvq7sehvFkpEoYZgNABz0zkqTBnO9bpxpY3pS+4Lo6K5G8lOybbPtOXu/XZpS8afsz1iC8J0PkcPFxt+mSa1G9WPLcjuuX9U0R7cMgtULIezqjk+6S3+ijaGKBsl2tHpbU68i79qL883x+TVbTYK4+se6BfNU/RLH+IaLcvMu6oODTsXTfzkHI54G3Vh4OYyh03FzNNmKXcA4DuuUyQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUR4T0NuZ3NtQy9JVTNYUTlEaEhFTXUzQTIwZ3pvbDJtZ2RrUFJkblBQUE4v?=
 =?utf-8?B?UUVPVUdxYXRMbzdHcjJVWmZVVUVOMWwxU05keHVSWXp2c0R4djA5SXZUU2sr?=
 =?utf-8?B?dEFmYmx2amNjYXdwT3JxbnBzWk5PVSsvRS95RjFrRk1GVU9IcUFTRzZlLzBI?=
 =?utf-8?B?ZzhjZ2ZwcC9sVHBXUTl6TVlnWWw0bE9iTGZ1UkJoeE5OVVJZOHpsNis2VzRZ?=
 =?utf-8?B?YUw3Q1MyKzRCUVNxYUt4Um1rODRHbTAxWHdJYW9JU29Cdk0rQ28wdEM3VFdX?=
 =?utf-8?B?U0pqdzBGVkFGMVdHR2FVYzlJL2RXdHhRYU16QlNjNkZ5dkJ0VlltR2gyK05H?=
 =?utf-8?B?QmtwQ05VUS94TDFZSlU1Z3RsNTVSN0RDL3cwc0tWV1pBOWh1bVI0WFVyS1BC?=
 =?utf-8?B?SjlLNjUreDAxS1VGb3FEeVY1ZHE2Y0dBa2I2d2NNb05nZWtueXFBaDBWZXJQ?=
 =?utf-8?B?aGE3YzZDM0h3NVVBRXQzd2EreXgxRFVUcm8yNFhlNUROL1ZiWVlSTklqSkpY?=
 =?utf-8?B?TW5FVlVvcStJVFlqTnpBNXE2ZjRMR2FMRjArMithVWVxWWNHdUdXRHI1VGR4?=
 =?utf-8?B?SHBYbHFDVnBpSG5TT1EvWlZFbmdhbFFoeFY3WktzVGwwYVhqdzkrMjRpMDRL?=
 =?utf-8?B?Y1NGcXFZcW1adTlZOTRJdVN0VUE3cHMrdjlhVU5zand2L2ZmdXcrUkhHaDJq?=
 =?utf-8?B?UFdBcW5wY1lzT05qL1V6R3BmK2VoakZjblJ4VnVxL0dWelM4T1BOWDFBWEZJ?=
 =?utf-8?B?WnI2RlJPNHpIREJjT1llbWhXMzBTYXBiQk51WDRIdTdsVFVMTFZVRjQvWVo4?=
 =?utf-8?B?YTZhRGd6bERsVDU4d0RPclFSRWtqaldSQkxZUk14RjVLV3JvK0lLbW1SeXI1?=
 =?utf-8?B?UVBGejc2ejhMaFh1VTVBQU90aXBZSTRWUGFzNFFpQTFlUmpVdVpXdEtBTjFY?=
 =?utf-8?B?YUhOSmhwS2hTdGRteDhFQ1RPMFJON2FCdE91TUhHdXFLYW40TUIyNjhrRzZx?=
 =?utf-8?B?VGVXS2xVZDZhOWJockVQUm9QSmVKNjVwOTEzTGV5akdCNGVHNW1qdkFsaHcw?=
 =?utf-8?B?MEpNUlBsek1VVXlDZHVaZGRscUlPUVpVODA3Wk5ScFM1cHd2LzdRR2FEcmtw?=
 =?utf-8?B?eWwvNndLWkdnSGpEb1B3OXRqaHN5cDhJZ2ptME1MTTJaZTd2cU1wdk4yY3NZ?=
 =?utf-8?B?NkFHSGNNU3VWV1hFTUQ3WllYQmxWK3YxVlpVVVdFS0RDS2dNVWVMSzh4UllN?=
 =?utf-8?B?bTE5Tmsrd1llRXVlRUl3NXdTU0IyOVFKcEZkWk81QVdkSkZtREoxK3FrUTl2?=
 =?utf-8?B?dmcyWHRSZ0JndDhpL05wNnRmVXRHVVo1aXIwRk9CV0NMNm42YzloZU41NTdi?=
 =?utf-8?B?ZlF1UUp1Z2NOckpkeWdOLzFrZ3g3NHpBSXR1aDdpNktpY1pncFZXeXgvZGxV?=
 =?utf-8?B?bWh4WWozUmt1MDVCRFZEbW5GY3BTMytCbmI1eG9oelhNbGI2dmwrM09ZeXhM?=
 =?utf-8?B?NTFOT0JHai84TFpxYVJUL2h3Z3VWREVsVGMxNGR4REQ0c3ZSRmNrM3pYZXY5?=
 =?utf-8?B?SGxsOXl5bVpIVDk4VFdqQ0VrdFpnOVovWXRwUUR4aWJidWdtdTBlZHNTb01Z?=
 =?utf-8?B?K2J1Z0FMMnVSUUZWc2pFRy9sbWQ1ZFVPK3MySDA4Zzd2OEZUSlp0TmVab3Yy?=
 =?utf-8?B?bHpOVHNMS1d2T1c4QkZ0Y1JWVXVRYW5Ka01uNXo3TmI1aDF3QWlsVk4rL0pS?=
 =?utf-8?B?Q3VtVWtScGhwWXl1MDJOSWQ0eEdoLzdVU1JPOVVPSnpIOFlVYjRaYkNGUFFi?=
 =?utf-8?B?cXdRYyswQlgvVldZVytzQmRlZWlwTUVrUGdwMHhwdXZNSEJTOXMwTDRURFlq?=
 =?utf-8?B?SWR6VDlsb01nNDM0VWppenRtb0N1Qy9FNkpRRDhyWVBpRnNkMjFnWUVwQ0RF?=
 =?utf-8?B?YU9aWWl1d2RiZ0E1Z2w5VEh5M0s5cThDSHdTbStPcWhoNFBSVCtKa3l3cEVI?=
 =?utf-8?B?Rk1ncVlhOTNjWmx2dk83UGVYMGJDVUJndWwyYmw1T25sV2FaSWNNSm56NjZH?=
 =?utf-8?B?TjNQMkVZelArWVFkaXh5RzY1UnpSaC83Vk9ENi9rOEx2WkxZY2ZPR3dZQndK?=
 =?utf-8?B?c0NwTm4xVk5aaXVDWjI0L0tPN0Y5cjFETmZ0VGhSME4xL0MzT0l2bzZrQTdE?=
 =?utf-8?B?UVUyS3U0Z0Nhd1A1NW40MFZrUnhkT2U3NU5xRzkwMHhydjdRbVlrVXRZdEhw?=
 =?utf-8?B?clhINzMxRDVjWDcxNDliSnJPSkpaa3ZTRTdQbGU4S0JHOWx1SERXbUtXMFFo?=
 =?utf-8?B?Q3kybVBZNThCK3JxTVRyNktYcTBWVGpVbks0RTE4T25hOUJvdGJndz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e99a80b-298e-4ae8-b739-08deef0faf5d
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:26:17.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFOxHLkGcTPYCoWNtl3a3vHK+9s1vjYqZ7Vp7zJVZJgZF2RB4CUEBAxWRUP/RVZi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8138

On 7/24/2026 10:49 PM, Shubhrajyoti Datta wrote:
> Replace field-by-field assignment of struct rpmsg_channel_info with a
> designated initializer. This also fixes the incorrect use of strscpy
> with strlen which could lead to silent truncation of the channel name.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>   drivers/edac/versalnet_edac.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index ba295714d972..88b24eec4206 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -720,14 +720,14 @@ MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
>   
>   static int rpmsg_probe(struct rpmsg_device *rpdev)
>   {
> -	struct rpmsg_channel_info chinfo;
>   	struct mc_priv *pg;
> +	struct rpmsg_channel_info chinfo = {
> +		.src = RPMSG_ADDR_ANY,
> +		.dst = rpdev->dst,
> +		.name = "error_ipc",
> +	};

Nit - have a define for channel name and use it in both places.
Also swap above declaration order to align with reverse xmas style.

>   
>   	pg = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
> -	chinfo.src = RPMSG_ADDR_ANY;
> -	chinfo.dst = rpdev->dst;
> -	strscpy(chinfo.name, amd_rpmsg_id_table[0].name,
> -		strlen(amd_rpmsg_id_table[0].name));
>   
>   	pg->ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
>   	if (!pg->ept)

