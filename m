Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5658E2D4806
	for <linux-edac@vger.kernel.org>; Fri, 20 Mar 2026 03:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773977410; cv=fail; b=B747jZbxaTPPVYgKXKWk5ozaWlPPrzMBR8FSCCJjZk+oq7t5UFnr66OIISfHHefehE6JbCbSSIEndCqyoNL0d3ZxFtUISP7NdaMlWMXGd7+rdT02Cca1gOSJN2z+6xBt/6jsEovetEOcSfW/KsxyMXvu7DoJFB3MHbYhIbZrhsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773977410; c=relaxed/simple;
	bh=1+KAdE4kK+otRfsfdM9H2hIu48flBnjdfEvShHwu9o0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DI+DDJTLuxlE5r7p4sbxb0mtVVBJYCAxy4SezmNX7DVpIelVXGTX1MwGKuDdRlArHqYNtUXBFMo79+6zGrOHZoQbSNDSxLsnBAPGBVUERk11qF1kZS4Xf4fElIdhqW0gkRtXzZprc29sg9wXm/Kf1K1k9GOpzprmRPrJtEItWYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iVuK75S+; arc=fail smtp.client-ip=52.101.52.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iVuK75S+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+FL5I6UZD9CQ9PENZVJkwxIrddyZDqlepeMds9eV11UfVeW906lAikWtSDdnxhAOaN1pcLHD486ngFO6BotLji63bw+v+YxEa2gIzRwzhpHu+c46bEGTJRfxRiDQSBUlVddUCgdW2Ip/zawtxwJW6n0i3j0W+kAscFF+9yydQy8ZHn+OS1msf4jwgYnS5lJAnqv/2bDKeThjc7W6TWajkl9mDu7xzwB+OP+ysZ291mEhSeoGvCnlInbgo692w3VCfnq3hmqBtGRZ99uOnM7guJY2n6THxApLTFnzjkpUMTJG7I/1QXn1R+kpzBvHFO445dfgrnbRVLltA2EZD+LeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkqQQ72twExQxW1Prnc8zwjqqf+wV77fQ8C/BsTL+3s=;
 b=kIpF7I5pc40L/ICb49n4PphvPvVgR3X1ZQrTNWshMPDlNKMSKmWzGclnm/F6XW29uvQUJADBloVIednVcMYkTnpFpXzSbKIkcoC/lU65MUNPqxKwbMqPXRg0uGwZuzn4JNt0F2uduGGiBvSvXFuI7fSlH7aoMQz2g4yHM4cvuudDgNEISUVxhiC3gfzRxsL1VI2oxIwB46e4M1WVE9cHcg7wKGnJrj6daV10sz9ctM8AUB6KYj3Pfd5vl9C+sRGqQAS0eKTby+W5IJIJ2MJ9zG56Uc7D+O8BescBym53r3r2OEgMgQwJL6Gkp32PRNi3zAHikkJIuWnWO9DW3V6+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkqQQ72twExQxW1Prnc8zwjqqf+wV77fQ8C/BsTL+3s=;
 b=iVuK75S+LmETIAa66XjzUPjdDLQreDZ0Zy8mt2P/P/nlu4hEdBGr9wwK2SXxPSzEjo+7Z/9sYJ0AFSouJzfyB6Clg24nOtWyqFO4EQ1bnax68EqMPtcu08HFN1qdGG5fstE8E0YTkcKk4wzSv85IgMnyF1J4C3iik7MkE/Y4Qro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by MN2PR12MB4269.namprd12.prod.outlook.com (2603:10b6:208:1d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 03:30:06 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 03:30:05 +0000
Message-ID: <6e752d2b-c52b-4077-85bd-b54c7da4868e@amd.com>
Date: Thu, 19 Mar 2026 22:30:02 -0500
User-Agent: Mozilla Thunderbird
From: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] RAS/AMD/ATL: Decrease message about unknown DF revision
 to debug
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 superm1@kernel.org, linux-edac@vger.kernel.org,
 Shrirang Deskhmukh <Shrirang.Deskhmukh@amd.com>
References: <20260305154528.1171999-1-mario.limonciello@amd.com>
 <20260306145003.GDaarpm6p8A-pFBCCf@fat_crate.local>
 <a9a4aeb8-a044-476d-845d-0368f90624f2@amd.com>
 <20260306153223.GFaarzhwApsh3Jdqdy@fat_crate.local>
 <47075497-6bb8-4da3-b8b3-63901d9f3b05@amd.com>
 <20260306154947.GGaar3mxJ1JkcC0OgV@fat_crate.local>
 <20260307144910.GA113343@yaz-khff2.amd.com>
 <b7c232c0-51b7-4ebe-9c9f-20537628fd38@amd.com>
 <20260319143634.GB1639900@yaz-khff2.amd.com>
Content-Language: en-US
In-Reply-To: <20260319143634.GB1639900@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:610:e4::25) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|MN2PR12MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 69d088b5-9887-4cbc-d8b6-08de8630fa73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qFAXp0T8PZXA8qcbM3HRGcw0tvz3R7vfwNcgCCnwvsMciiK9iMDSqmAuXoroMVFDRsWZ0puEiggZBMMAs2rMOHBm20v2AqmHBobIc03hIrO1GvlVJgpjIauFHDD/ztXVlGnimR7+ZD3GdUpdMgJVR1KDuAlyuYnS0u0tz+Ilu2JWIeWNc2fLlA931h6H1vg925wb0rBakr9GS+9Q9wvwX4vHOVbzIfBpltGR/AKZo3ZUjBHQUnIF2BVeVI2tY8leObH2ZvGGw7KzL7Q4+oAcLTH1xRHZLNrwf138msJhK0QfkweOFGoCr02JujxmXWWqgqmGLXPILf2JNLuyRIbILDgl32XdSPeYSGMuoJt2NlS7Q8yEKPqEBcF9OObow/yKfVGyDtzZLcxfD8fZoP6sbBqsstAWLw+bMgRD1PS8BFbgrzwVY6LerehCuJqBBckziXXuwBiQAcksG43UiQd8578Oh7KfqAdHXLKaeg8WhZlITTqFRLnVEDJPyT6rtuiX9scLMVtA7tOoYfN+FyC0tpyvAc26XG4vtSLzLSsdUmuVijfj0qGpnzvrF1a9JLJUW4RZWVoc2i6WVOnCghHITf95lGXqPJcF7Fbscntdj42kH5H6oFXX6lMCbLuWwpeze4HPMI+oSmhUejWtS3JVLYxApPpb/VGe4BWFiubIJw/Fh3AIWF8IUVDf6C1Vk6gJX/xN1A37LMU/72weEmMbg0XCpgqr2OJnkrfOhnvSt3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFRlYUpPMFE2bUVGU2dIUi9MWWpjTysvTGR2M3BxM2pWRSswY0lweUlCL2N6?=
 =?utf-8?B?VEZGSEM5aTUxUWQ5QTFsbVZ5VVNRTkQ2YWMrcTgwK1VKdDAvSFBQcTRTRlhm?=
 =?utf-8?B?aWJvNDRCZjZnb25vS1JsUEE5RTdpUTFlYWNYcUpYL1BGZ3JVeVU4YzFuWGg1?=
 =?utf-8?B?UFlQazN3WjN0RTlEdDJUbEd3bGdwWkZxWExDZlhkTU02bFg5UUM2eWpLVlpO?=
 =?utf-8?B?T2VDS2NJWDdsNkZxTUt5SWJPQzkzSXl3OWMxQ2kvWGdiTXRDNVlIUnhiNmU3?=
 =?utf-8?B?TFVUdDByRkpJYWxpU0tjSTdFVVZHVXFJdlROemFwcC9GVk5VQXd3TXZJUUs2?=
 =?utf-8?B?ejI1MG1XU3BTTUNZcG9ET3lRUUduRFhTQlZsV1JTK1M1UkZTS3VpZkE4TWZF?=
 =?utf-8?B?Rm1mRHJ4dGU3Rk9DY0Zpa0twYUlQL0VmOVoxc2tscFptQ2pRbEc5M0NnU2FM?=
 =?utf-8?B?OHF0ZkNPNGpPNHRYSDZPSGNLMjlwVm5KSWI2a0FnVUoxV1RhbUt2VDhhMzBy?=
 =?utf-8?B?TVYyZXVvdzFlUkU2UnNvS3Y5eWxZbm9tUDlOMjZ0NE5xaXdUR2hvNzdLeVAv?=
 =?utf-8?B?enZBUjdkUjdsblY4ZC90aytMaWM4czJpRU9rN0Nvc0xKNTcyeEVXNy9udUp0?=
 =?utf-8?B?MWZ0cU45Q3Fub2JkeEplTHFtcDBvVnhERVFmeWN4OTZzSzRwaWswS0V2bnJG?=
 =?utf-8?B?MmxWMDRSbnhLb3FZL1N0djF3SjU0NEUwV3JOdTdXbGpUejV6Qy93ck5pSjFT?=
 =?utf-8?B?YmJmdGVFYk1Dd0k1TWt3RGZuR2ZPQUY1R0ppeU51SitSZU5LRmlZWXZyYXFW?=
 =?utf-8?B?QnJvVUl0Y2NkT0VRQ2kyNnQ2Wk5laVZoTUVtVkd1R1FGaEdhNW4rMjJpVzdX?=
 =?utf-8?B?Vkx5ZkEwQXBXN2NkcTdtMStWNSswZDk3a3lhQmFyY1JlMW1LaXI0elZoMXIr?=
 =?utf-8?B?K1psTDBlakdzR0dDWHFLcDgyN0pTSTZHdEN1QVVrYWJvWWlrK2xyZkhPUCs0?=
 =?utf-8?B?d3pUdW5MVURjU2szRSswZERnWTRiY3duRmFnUEFEMWFuOXd4WmgxYk83c2wz?=
 =?utf-8?B?ZW11c1B1d0JIeTVaaHIvK0tkeE4zVFVQb0d1Z050L1JkaTBBaU1DTEFNZlFv?=
 =?utf-8?B?TGNQS0J4c0FGK3krQ0JYZCtReExIc3puT0tUdjVka3R2OG1qV3VFL3JkZVhp?=
 =?utf-8?B?SVFZeEVpQWMzdlFQSlNtWCtwdnFPYVdCVnFiKzg2d25STWZyY3Z0L21JMmky?=
 =?utf-8?B?aGcrK3JpM1pQUDliZEZlZlNpMVN1d0UwNWNBT3N5VnBUeW9OYktMcE1Jc05S?=
 =?utf-8?B?WVhsTU5iTFNJTGpHalRZVWFJcG5HSFJJUFJmYmk3QzEwaW9Kclk3UVJHOFpx?=
 =?utf-8?B?TFkwaURya1BKR0N5bHFZSTlwTkVHVFcyMWF5S0Q1a3hVNFdOaCttVWhkd2Vw?=
 =?utf-8?B?NWNUVHBwT3ZzQUIvYXUrcFk5MzdzVTk3VG9LditMczFBa1dGVEZoelhySlRJ?=
 =?utf-8?B?RGNMVmhzOUZ2aW5KU0xrcWhmWkJvSUpIdjVaTUsybkdkVmhScVJMNElLcjRM?=
 =?utf-8?B?cDcwaFlnTTVJd00vTjlQa0NYZGd3bTBIT0srcHFMdVRuQWR6T0x4aE5BTkY3?=
 =?utf-8?B?bjdrS3hDcVN4RDdzSzBoc1hGMTFGWkRoMlRDV0lDTU0vMUZUSXpKUDZ1djhF?=
 =?utf-8?B?TnhMclJDcWRRS2M3Z1o1bzd5VWx1ZGQvWXQvdnhQRGxhM1ZDa0J1L1VNeFQy?=
 =?utf-8?B?eW1jQXBWUDVZV2p6WDVPT21VYVhmckNWb0NHV2dIQ0dxWGNzZHhvZTRkbUpt?=
 =?utf-8?B?TXorRUk3eERzZEhsN3VVR3g5ODJiTkx0NWJiLzM5TVZQZjg2TDNQb0hCRmtK?=
 =?utf-8?B?V0pRMjdkUWdwbDVZWVlzZjZzWXA2QlNPTjkwRG0zbmNQVUFvM3Z4ZVVmR1FZ?=
 =?utf-8?B?aWYxTGJTejQrOFpyclhxbTBVTzhyem5OU1hTZktKck8xRlpOUjRwSCtaZG9L?=
 =?utf-8?B?WHNTQ1M0VFNIYWUwbjduK3d1eDBoWWVmNHNYekt6N1p4ZjloNU9XbHlDTnQy?=
 =?utf-8?B?N2F1ZTZuN3BINVRUcnBZSDJEbnBCeWk1ZzNGcUM5bFRib0JUWGlOSU5ZSkZK?=
 =?utf-8?B?eVR5YWhvM01IUHhVQmZneTV0eXVmOFFyRmhid3Z5RlYvN3hkWXFadnhFUnE2?=
 =?utf-8?B?dkZ0K1ozc1pXVEgvN1ZsZkMzeG1udXE3RzZVaUZPVjZ2NDI3NUJvY0dKU215?=
 =?utf-8?B?WnVtZmdLQjMxMjJLTnV0dzJDQmhEVG12S00zeFp0S1o3Lzczb0EvTVF4NU5T?=
 =?utf-8?B?SGwzY3h3V0dvWUVHUVdnMWk2dk0rUnByNWt1a3pORzVMS3l6OVRaUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d088b5-9887-4cbc-d8b6-08de8630fa73
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 03:30:05.3604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFTbhj8hlevMbuM0QE2A9nIQaHpNxayxwFVYIw0b501O0sMns5a8dUp016ihLwivIyOZ6KCzUwNkQbF6Jaz+XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4269



On 3/19/2026 9:36 AM, Yazen Ghannam wrote:
> On Wed, Mar 18, 2026 at 10:43:04AM -0500, Mario Limonciello wrote:
> 
> [...]
> 
>>> diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
>>> index 0f7cd6dab0b0..d77dacdd4f56 100644
>>> --- a/drivers/ras/amd/atl/core.c
>>> +++ b/drivers/ras/amd/atl/core.c
>>> @@ -190,7 +190,6 @@ static const struct x86_cpu_id amd_atl_cpuids[] = {
>>>    	X86_MATCH_FEATURE(X86_FEATURE_ZEN, NULL),
>>>    	{ }
>>>    };
>>> -MODULE_DEVICE_TABLE(x86cpu, amd_atl_cpuids);
>>
>> Pretty sure this means you can drop amd_atl_cpuids as well.
> 
> Yeah, maybe.
> 
> The request_module() in EDAC is unconditional. We use the same EDAC
> module for multiple generations of CPUs.
> 
> The amd_atl_cpuids check will keep the amd_atl module off the legacy
> systems.
> 
> We could redo the flow. But there needs to be a feature check somewhere.
> The proposed patch is the smallest diff I thought of at the time.
> 
> Thanks,
> Yazen

Well to be fair there was CPU no check before  - the module device table 
just controlled automatic loading.

But yeah I think a simple cpu feature check during probe along with the 
suggested change would solve this.
