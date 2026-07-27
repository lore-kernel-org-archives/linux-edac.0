Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7FA239567;
	Mon, 27 Jul 2026 06:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785134942; cv=fail; b=exe5U3WzvEnVMPT6fb5ZoVuy8u4GNvpYbEiB1Cd/8pPt+oGpvPPOlLjWHeQaC/FnDFubRcvxId/eKWw+BhFcruPedvnc6ZMmkiunp91wltqy2L5N9a+JEp2pqVsU/fWw/CI99IMX2qg4NNEUl1l79EVj6j5FwFspWAC8llugEdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785134942; c=relaxed/simple;
	bh=KUbOmvXXMnDxxS+mqshn3TWifWFm4r872gF31eXQHAU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KMhKWS9l6odhpKndB1l+xLJWcjntiJsOrHhyv564kbYXLX1U/coqac4DoFrXkTxkaIgaXRu8+Pn4xkhLaL/Tcnf+B28URfHaW51E4N1HypG3CMb86KTadMEW9KxF/bnCMQZev+8LQ4ovUGCRTGQFMqRgjZrsN0AxiaFfnx/rEaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c5zuNrqG; arc=fail smtp.client-ip=52.101.56.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c5zuNrqG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMgoo5DWvTQGPNUQQ1ytetteab6bl84SHpiUKn7yBAgZt+TV6hqd6amq57NAY7Vm6kuyDwsB72R5rpTeHAmfYrBSkx8GKSyVRSKJkEvXWMH1ddppLIwTZYPAnHYhRGl4AniB0vJSqDNR8JVgLai4FDeONpRpE550iGtfUWG9dyELxkbqv6cyUNdD3xMNIXJyMR8BLk/7iWP/VvnOfVGU1ywIv95iIixVyFPoyd4V8zuz6yOnod5AIcpKRegBo6y2TUob1IkyuL2a6sewXmA/XVmTp2NaXQJKye5Z/ohYy6CeNnAR14vEEwhj+Spjc9MOY9dZA40BNYv8iKe6Wafhzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCerL6qlLiNdPQL8mTS72VotTcC0P+EX64zhqg//ryc=;
 b=Pe0rZfG3ewPX/23bdzMNf+YTucmwFUvfzEf/T4OPWxUOJ3DyCcwW1iXbdDHor8FUwpJ+H0D42A433+N+waydBBIcSQt01EQ2LQtH1aKrW1Okqpde5RjSzN5dmyP02bVeE7EDQiQ7Xd6CupiNLuInpdYtwcyK4eF4wRkpafxu5cq4KZEeCspY0GisjuFZx8h5gRq0Dk5X0T9t/yf7cCr1PQOGpt7PI8lKFBvpgpVIq9b7Em/4Y4Z/cYJLZyMfn4dyzhqHfIVlSmZ+PTkjcdatXi1jguzxCovLLT3XcN8rS96JrZ7vOaAq/eA6kLeXzK0sKJwJuHQkWABRzzeM+MA7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCerL6qlLiNdPQL8mTS72VotTcC0P+EX64zhqg//ryc=;
 b=c5zuNrqGy6TEC85SZoek6dFiy1bzYwZqOCD37uMNs0uZPn/8YEaNMmEAx+TI8uddz4iNhTbbb+QLC4VyPk0BXeXYRA/8AXbX/961/n2LGvCtC7s0ruPCbYMyUOdHDQOsXFWSb91lZ2Cd86RR9Qf9hdFVsyxsqkZevSCQ8IyBbhE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by LV3PR12MB9439.namprd12.prod.outlook.com (2603:10b6:408:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 06:48:55 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 06:48:55 +0000
Message-ID: <511e62ae-79e6-4931-a7b0-4f0c3830cdcf@amd.com>
Date: Mon, 27 Jul 2026 12:18:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] EDAC/versalnet: Add NULL check for mci in
 handle_error()
To: Borislav Petkov <bp@alien8.de>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-2-shubhrajyoti.datta@amd.com>
 <20260726235228.GAamadvFK6GYNRx_dh@fat_crate.local>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260726235228.GAamadvFK6GYNRx_dh@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0109.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::10) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|LV3PR12MB9439:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b226ac0-8ddd-4de0-2cd7-08deebab20d9
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+n09EG4bROAgGcuLk8X64PtrJACSOocUp2AvbK65fAyrRBkRjtgXGAbrBiwUk12WTEFDoizwk6zE5m+SrjcPS0f3strvTw6y2900qmOtwL+xf/Pa9Kx23KZAEoPBaNgr8Qp2q3X3WvJtDeRRq5HEEngb2eQpFhmVKBsqGGaT7LF7EX1yknlNnwk3lWhtvjQjfbTg0lFwsXww4q7CaWaCAxyGv0+ue0nJ9W9L3zD7t++Ca4kPVoD46sFTLm1IRfWdQekj+O0nXzh0dto/uoi0omjgKRN3VltzX4jAb38zSpxaaHRb3lXwqxMv9orm+1tovuCBI5xPYpFoSHxDkvwz7fk7EZO8ksEASqWDCPd859u9nqyV4Uy6anRLF7EjjchW9t/n6IzoZAkMxjqzya3vlG80/1KdrX9EAD/aY0T3kfPs6KN6Utk9UcUAaZDXKbcZVf25LeWaVzwXDggXoZNd7TuqPAJoMHL+/+KD7lre1Dk9KRm3MmbT01tlolkZa1wtE45nfSS44LJH8TWOxEYBH/DQfeNp9gs7WN6aQHlWtsNYJdLSArRAicGg/5bTm02ChOs7lB/DHo0R1gYASPMRorQgLTA9ZLnOuNrdCpeTCJvabcIwtxmP7eJse8JFhCwanVINiZrq5bq4HriNv0R6+KjSaIXQRF5hO3qZhk51KqU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1FpVFNvY2tVaGdpdnJDQ2dneUlxdFdKY3EyMzVQeEVzck9zNHBuMjRVazlQ?=
 =?utf-8?B?b3lSVmQ5Z1hINWFXc0Y3U09qVStGSXJNbDkxVHZsSGYxSnladG1mUjkrVlk0?=
 =?utf-8?B?RnE0aHJpZk9yUTdhZ2I5ZFg4R2JRYUpuMERxaTNLTFh1T1NGSXdZbDU1a3JL?=
 =?utf-8?B?Z3FlNEd6MmtiNlhPcEZiOGRWK1liQW14eDlVZjU2TVNNOURncXdaSTNiYlVT?=
 =?utf-8?B?RnhiR2w5N0Z5V1JKNVdnZVZISDV6TmMzVUxSanRsSmVTcTJYU2pMeHhlMlpa?=
 =?utf-8?B?ZDhWY09OQ1p6QXFreGJHTTRBQ2VXNjV2cXVjbDdBdStMa1VSRHpuc3hpeHd6?=
 =?utf-8?B?VHM2NVZJUFZuYm5uMVlPbnd5d2xMZ3lJU2NIUU4xdDJybFIzd3JBdFBQaGNk?=
 =?utf-8?B?cEVDeVBPNWJUQ09vZm9WVlNSOFJXK1pjL3RmNlJ2c0lNUkZPMW1mbGIxaWE5?=
 =?utf-8?B?MmxPd0lIV1VNYThlUGY0RU5uOXUzZFpZWThmRUxPL1krMmpQNkhlWG1xRGxv?=
 =?utf-8?B?VTFxU0s1cW9rNmxxbWFua2Y2SWNMTUgyZE95QTdMSDZvbWZhSm12UGxRWWdY?=
 =?utf-8?B?VkR5dUdvTkJkYnA1TExCZTdHeld6dW5pK3NCQ0luUDNTNmVpN0RKN1JRSmhh?=
 =?utf-8?B?RFJKTFZ6R2R0RHlkTUhzVnJFK0NNdFJhM0I2VmM2aERBRXVJQThHcnhEM2I0?=
 =?utf-8?B?Tkp0eE9qcVRKTzBySUU2RVZ5NzJ0T3pZRjg3WHMxOWRJK1pDMk9RZ3pTYm5U?=
 =?utf-8?B?VEZUTW5JSEUxdTJHcWErRTdQdmFISU9mU3BlVi9qV0F2ZGIvL0hSRC81RHRi?=
 =?utf-8?B?OWFST0N1TzBoUDRaOVFpNzFjSWtPT01WVDVLcFRNbnhpRWhDYWZZWmxTcThR?=
 =?utf-8?B?NE01TGtFekpQQzJPbTNiUUxBbkg4R0swczdZN2dQUkt0TFlnSE5tYkxlMzdH?=
 =?utf-8?B?ZERaOVFEQTBsRWRxcGFlL2RRQm03aG1xTEdLS1Z4TnRidFNINGE4WTluSnly?=
 =?utf-8?B?TGJjcGtsOHRodUtoNkh1N3ErVllILzNWVWFqZjNHUWtXNDFodUttcUFTenUw?=
 =?utf-8?B?OWZmVEdGSUNuQmI1dmlSQUtuVnVEeXhvYmxDa2hYM25ZOGt2SS85TUc1K2lm?=
 =?utf-8?B?TVBXTTFweHJ5TVpjNlhvYmwyODNxUndHTnlPV1V3SEdNRHFsN3BLRjBTYklB?=
 =?utf-8?B?bWtHTEZkdEVRMC94VEwrdUw2SXl0dWhnYVJHd1dEQVJncG1kNkh3Umx4dDhM?=
 =?utf-8?B?Q3N5Wld0WGY1QzVVbTFHSFdDc2dTakZ6SXFZU1ZyVktzRThTMUdPbzk1ZGtS?=
 =?utf-8?B?MkU2dDMvRzg2M3RXOXMxUXFGWkNJU2Mwbk5CNkZKU0N3cVJJcW1TQVFtRzJP?=
 =?utf-8?B?TFU4SkorazNENS9vRGhMQzhNTURGWUx5WHZNT1pWYzcvU3RDTFIyNUhhcGkw?=
 =?utf-8?B?ZC9Ybm1aZmR1QnRqRHdTbzk0T2JHOU1tbmNEQ04wcFBJODJvTkpscFJoUVFV?=
 =?utf-8?B?a1RTR3E1TksrTjc4YnoyeGVMaWFDcXQ0ZklLL3pGYU16SVNiemg5dEFmVmJr?=
 =?utf-8?B?dy83S3lBaEoxZy9NUDhRbjhYVDg0ejdGb0QrWUJ6dmsyL1Y2QWhFcUwzTDdG?=
 =?utf-8?B?d1FGYkM5NXYxYllNQXI0L2ZwNDZlZXYwWHNrenRjQ3dkL3p3Q1FYYjNMME5h?=
 =?utf-8?B?T0J0djdEU1FqUTF2Zmt1L1l1clErMFBWSis5YS9OTjlDT3UyRlFrbm5TYS9H?=
 =?utf-8?B?azk0cnhGeW9JMTZ6cG1ENUhNUkdpZmZBQWp6M25lcWJqaU0yZnBCTWllQlI0?=
 =?utf-8?B?dXpFUkpLWGF5L2p1SUlnZUQvd2dqSEtNVDdIbnpHdW9JMHJFbnVocnZCNDJm?=
 =?utf-8?B?eU9mMWM1NjNzWlZPWXF4WXZDTm85VWNvNXozbVk1aUc3RnJHQ3c4c0FjYi9P?=
 =?utf-8?B?OVhmK3pZVGR3L1hON29NNHRrRVhMaEdaaFlYUW9PNStUUTIyQVBMNjlNZ0JU?=
 =?utf-8?B?a0RkRTFvMHVtbFIvd3RlN1ZGWTJBMUFZaHlkL3hSTm1RNER0ekdrbE9mVDAz?=
 =?utf-8?B?dmUyOHJSYmNxdHNwUFowMUIyb0NxT1E5YVdqTHJyZXhSODlYZlVtaGR2bW5l?=
 =?utf-8?B?eElLUXFvSExUdlZRYU1WTGw0UDFIU2c2TXlKc0F5Sjh1Y0VtUnFJMUp3dHBJ?=
 =?utf-8?B?ekF2NjRBQm8vOFhuaEEraytYU2ZBODh2MHQrNkJFQTJYNFlNN0VDb01vTFZr?=
 =?utf-8?B?VXJrZFhBTWZRbmMya0doMjQ5STNZOHEzN3BzckQ0NXJEUGx2WDZMV3pSNWtq?=
 =?utf-8?B?RnkwRS92WFRTMnlsT1c4NDRPWm5ycXBpa29qcDdGYks1bWFveEN6dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b226ac0-8ddd-4de0-2cd7-08deebab20d9
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 06:48:55.7348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mP5VHDwnTtGEQilUyyZhGYhmKGfHfwsQDIJmbE0RAQQPDL0z1BJRCbSwS5/zDcl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9439

On 7/27/2026 5:22 AM, Borislav Petkov wrote:
> On Fri, Jul 24, 2026 at 10:49:37PM +0530, Shubhrajyoti Datta wrote:
>> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
>> index d1af5e175f7e..316f8f79c4d8 100644
>> --- a/drivers/edac/versalnet_edac.c
>> +++ b/drivers/edac/versalnet_edac.c
>> @@ -439,6 +439,8 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
>>   		return;
>>   
>>   	mci = priv->mci[ctl_num];
>> +	if (!mci)
>> +		return;
> 
> You have a WARN_ON_ONCE right before that line which checks against
> NUM_CONTROLLERS and init_versalnet() unwinds all the setup the moment
> init_one_mc() fails for one of the MCs.

The gap in the driver is that init_one_mc() returns success without
setting priv->mci[i] when the bus width decodes to DEV_UNKNOWN, while
buggy firmware / future firmware rpmsg error path can still calls
handle_error().

Happy to drop the check if you prefer otherwise we can keep it as a
cheap guard for a firmware/driver mismatch.

Shubrajyoti: Please feel free to add/correct. I'm still ramping up on
this driver and may have overlooked details.

> 
> So why are we adding dead code?
> 

