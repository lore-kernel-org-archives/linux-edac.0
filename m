Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128D62F6577
	for <linux-edac@vger.kernel.org>; Tue, 10 Mar 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154706; cv=fail; b=t1w/g9GpWp5V5ArF47peqKKniT7SuFV4smGDufcQzZfNFijsT6Qb/5IAyg02DEOZ74holJcWQ4vX7vunPYw/UnzJ5kKBsi+uE/BMuKO9aULVEuJVIFx1X1kKey+Da/b6z+XAru668pvVIhpAKBePSZWBnRy8T2h1Hdvj0Z+y6oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154706; c=relaxed/simple;
	bh=xYHAt5OksI3RwI+KU5uVPjPsy/FGEpjhfu5ImdM5ydM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=siLEAeJYtvJ5CfAvLWfZ1yx9K7N8pgwkFNe1Fvhe25cQblsEc7FkXYpwc295UwNEQp/n5fkS13NbBCo1ELZjNZR/mPysv7Bv8vBfyoqMmflTFlN5mI9CBmfpqUsJ4AcEF/wzZDvR442UZddQJFvLbeF+Y06S/BfvzkLj9v5KrBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=opQfpBaz; arc=fail smtp.client-ip=52.101.46.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="opQfpBaz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snW9RmAgcL53L2OtXFj/WwusP04rJq0cZGE8twx3a6GGwKB/IfbkB27+UBhcfjqHFJMByv7a3VOalUVUUqk4YQAK77uD7Ala4vvM6OOB+YBho/3QIJI/pLPJwCeJNB5TBEZQy83HwZNDrxxCX0p87Gm06Vq5tourTbrOKB9k0EqInQN+iHJqfp+OQ1xu+SARc0J6UsDv6C9Ev8KjuNFTA+AE34deFGL33yswQ2oBhmyp0H62iEJUGpFv9wDxwS04P6XSDUOPcEOseRpInRs2LOwuBfxXFk01mmfMnbexASmgp8ykhB5aQJYRsmPmpPH+RyXzofUuyrS0DiciVXd3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pJcm5LYlgfg3RAXCVdpS1jTKy2UYgSebaX3eIpI2EM=;
 b=hElGEpFszgT5ZRpo0QlznDnDMPUPobYqFdrDboOQj+oBvjQcIs8+LwIMgUnJd8fc3mcbtBvcdRtYChtnfFLr+sVYiN6k7LZubs8ACR0KChSYDXDStjuav+1mMo9tR7lX2FRQV/fQXXvFQNaiJALxxNPAA0xG/LE55NbbqKqqnx357W9GdDVebk4GuqBSHj2i8yfTx8LZKejm/WqzMF1j3J1sSQLkokPPEaB0zw9wkWB/AASfniiZNhBgiUQDSlO4ata4WibPKlzkkhRfbQPonDC9wG7HoVXouUq9Zs4/9kF3XCht5BF7zdubFeBoXFmFFUkODI++5mnmLOd/youNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pJcm5LYlgfg3RAXCVdpS1jTKy2UYgSebaX3eIpI2EM=;
 b=opQfpBazdsly7Z3wBvQrgA9Tlo7dnmDdiRQRObaV5EKrxDoxu/reX0/CxU0/RkfkwmsDNr0HK1/SMb9cBLo7YmAaBORb/FagGAeVZNXrefY/aru3imsjBAJhywP6k/36s6fPqE92uDzMauAGph4tyrH/AXpRQJxvT33y6mBWBkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 14:58:21 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 14:58:21 +0000
Message-ID: <e6fa4686-5bff-43f2-acdf-b4442452d4dd@amd.com>
Date: Tue, 10 Mar 2026 09:58:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RAS/AMD/ATL: Decrease message about unknown DF revision
 to debug
To: Yazen Ghannam <yazen.ghannam@amd.com>, Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, superm1@kernel.org,
 linux-edac@vger.kernel.org
References: <20260305154528.1171999-1-mario.limonciello@amd.com>
 <20260306145003.GDaarpm6p8A-pFBCCf@fat_crate.local>
 <a9a4aeb8-a044-476d-845d-0368f90624f2@amd.com>
 <20260306153223.GFaarzhwApsh3Jdqdy@fat_crate.local>
 <47075497-6bb8-4da3-b8b3-63901d9f3b05@amd.com>
 <20260306154947.GGaar3mxJ1JkcC0OgV@fat_crate.local>
 <20260307144910.GA113343@yaz-khff2.amd.com>
 <20260307151231.GAaaxAX3gT1AKv04I4@fat_crate.local>
 <20260310125422.GB890303@yaz-khff2.amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260310125422.GB890303@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0184.namprd04.prod.outlook.com
 (2603:10b6:806:126::9) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c213de-3f41-4a7d-b3ba-08de7eb578e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	IIPk1uX3N0f4KO6i/mE1Zi6qi7tr2DMXOAPkM5vMQiPU851xgws3kTzi8L10d8LOjRBts3G/SoyMANOwJCNC11wLkf1gvfb93xbu86pgdd6V8CXXNy3nmToNk8z0tvxokaMqh8FR/Bcc8omKWn8ztsMaGjc7HxX37M6OFtLTmgzIfaxqlVRd09GrAJEJPjFJPsQlGuT1HW9IIv3j6Xvr0f6hHvHtTi1iMOB2MD+AectabTglqntAHd2tFGw1U26a+3mq9PfiEESmaOtbRKkv6TADX8ZQORCjsewkaEq+FLqJyWRunceSdJObgD1A7zf0uaN1hgXUh6KSEUINBQj00YJEyVMHoOYHau1U2p8JPadR+ow1vCh1fI/tw6VCw8DaB/k8r4m43GpbbopQFToIM6MXCgvhSNV4btYOPwGwDhoPU6uV0TONISzJeS/AAZaNuMwtgTqFG/y2F/vvY+exHFPJkq26tN9eWLWQ5KkX2VpcbcAJQi/B6mDjapt6ydvQMDehFpFRbGCotV+MbRoZdG9APyTk+eWNAttgGvTLgpTiIOuDzB3gYexWvBCJuq/k6qsWJvsAPOfvn518dnJWvJJqXMWIZJdbFsxrKMx4sp+07co0jDdjTWLsG8iCcxQ6uUycySbb57ws8oo9N4V6X9nfOa3hUQ7NtJ2StSW2N1v3R5xb0VWKB2OmYvxSdJmZqMgASUzNqVIbu9lZyRcjsrkqg/AOS9mSuy1hU5/ze4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmFGeVVoOXRPSFpvOXhWT0FCSGVYUWtTUEZTWGEvZ0k5MjhxcFhycTBvbUZi?=
 =?utf-8?B?YmpKUDA2YUdDd1hwM2pSTXUrRlk1UVRyeEdqU3lPV3piYVBVYnZpa3FIdndn?=
 =?utf-8?B?UEFmQ0NmSTBhOHZTRnFMcHFUVmZFdlFEWGhYRE9VZ1cvcXd4NmxoSkxSZE15?=
 =?utf-8?B?bFlWVXlvUHFOZzl4UzdBSmxBTGF2YWsvSDRNZjZDQjI3eXY4MUZCWFpOSFhV?=
 =?utf-8?B?UlJXUzJseXY0Si9FY3M5MVYrVnArWUpmTFdBc2p1RnZ3QngrakVEa1ZYekRm?=
 =?utf-8?B?R1Myc2ZrcGN6MWFPWFo5OW9sQUlXRklIL0E2L1AxekRRV044dnFhVVJGT0x4?=
 =?utf-8?B?c1BEYlBWM0lpNEhKSGl4Sk1ZZzQwZTNQWmFOays0dlp1KzdzR094amFXa1Vk?=
 =?utf-8?B?clp6YWVqR0grMFFXWlkxQWdJWTNOaktzL0dOSEdSU1ZlNlBhSGJLUzJ1Smhk?=
 =?utf-8?B?YU9yZW5PZ3R0UFU3UllDMDFGdVpBY2Y4a3VTRHQ2WnRYUGpmV1h6ai8rY1Z4?=
 =?utf-8?B?WDBhc0sva09QTGlCVWU3R0JEWTJ1SFNXVkR3MVNVeUNvSUhITTE1L0ZyK3Zx?=
 =?utf-8?B?ODdseXJQUVlQK0ZDQkVSMnFnL2Q0RkxQWk1OYzNiaitGYzRXdzFycllXZllS?=
 =?utf-8?B?NnVNenVIeWxRZDZFenNzZm9uTTZucHdUak9wOUE5NUlnUVRJeWNBNHEvS0Jx?=
 =?utf-8?B?SldwTEg5QVd4Z0lhYStRb1F0b0N6dFdQUExsM1pDelcyd0pCaURRY0tKT1JY?=
 =?utf-8?B?ZFF2TDJTeklLdG00WmVYb25PTUplTlJwSVA1ZmVpUTlKakY0d3JIQWY4WE1L?=
 =?utf-8?B?OEJ1dEoxdUFjR0JRRjhkWHU2K3QyOXlwMnRsRUhkdzE4T0sxd3o5QkVEamdn?=
 =?utf-8?B?YUpLSzNpU0dsb3J1SVdrcWdWTEwySVVYeTFzK1pNakNoMFkzbCtDR0lBV214?=
 =?utf-8?B?Y01FV3A1bmp4dFNHRFd2Ynh4VE5BM3hmZGRFc3N0WHNMNC9PTm9tODMxcWk3?=
 =?utf-8?B?WllEemhVVXZZWHExNjFlU0hMcm5YYWpTZW5hMmNybEZsc1VqVkYyMmdhV3Br?=
 =?utf-8?B?ckFETzlEN0trci9pT2h1dGQ4NG91Q0dTZU54eHFGK3A3d2dJcUpxWmFtQjBi?=
 =?utf-8?B?WVNReVdOSlk2RHpjWUY5bHNxeUlRK1psSnBvMjFaWk9VczNiRFE1VVRua3Rz?=
 =?utf-8?B?UlhPelpLQmRETHVpbktjZGZra3BVeDhEY2hJMGtTc1RyOWg0eEpwSmhuMU9z?=
 =?utf-8?B?Wkx2WkxlMWFPZ0c1dUNGYlo5c0R4RjdybS94WUJqTlB3QjJNcWthaHNFWHc2?=
 =?utf-8?B?WjdHcm9mTzBEMVhiWEF5K0EyYXhGdUE4OTZpRHFCVmdPU3gra2dLTGVkY29D?=
 =?utf-8?B?Y0lqYVZ3b1A2c0Q0SCtBV2d3MG5WeVZmRXRkTTVMelhXc0x0ZWhyYWtXd1Zs?=
 =?utf-8?B?WjlNOWloZTNCZ0xWYXZ5dzR2cnVaNnZobzQ3TUNQdzUzdEJNZ3gzNVBqcmtV?=
 =?utf-8?B?WjVSaUFNSERubEVkNjdFSHJNMkc4QXBoTVpnay9RTWNocTRWREs5K2tFYU9y?=
 =?utf-8?B?VUJaTFdrYVpsTkphZnhNb1ZqSVRHU1pkZ21neDBnNFNyM1lxZ3ZyTFQyQTVX?=
 =?utf-8?B?WldwbTdIejBEOXpGWFZKOHZMVmlOWGJRMGtuYVhpVjBjWDZwVk1pUjNHL3pG?=
 =?utf-8?B?azlVZUhQL0ZUdnpLTnRwajVTbkdwUkZyU1UzTDBqb0Nub3BNWEsrMGJNNlpw?=
 =?utf-8?B?a0xleXlRSTcvWFJydHdRQlZCMDBla0g4bVVYUk16UFlFRVJEMVBMZE9PUFZ0?=
 =?utf-8?B?OCtwbXhwcjlJN1c5bk5PeU4zbzB1QnVXNEUvTHY3aHpJakxWcUlGcTAyUlpD?=
 =?utf-8?B?NmdUT2lmOE5KU1czd0c1QTVXd1JuMHNDTmdvbGVZS0ZxZndaU1pvUEJ2ZVcv?=
 =?utf-8?B?OS8zbEtBd3dMUXNwWUNUSnVUY2U1V3R1K2thWWNYcEhmTHN3clFQbUVLK29q?=
 =?utf-8?B?MDFjd1RFanZvaHdCb3ZPMzFlWFIyYUNqcnJSaFpXTGNCTy9kWHUwbnM5ampL?=
 =?utf-8?B?YWFNZTQrcTNnbUwzN05YeTAxWWtQczNxSmNFVHgrR3VHbGUxOVcwRHVzNjdh?=
 =?utf-8?B?bUZoaTJBU1gxczNSRjNTOUF1Mmt2RjJLUS9UQy9KM3g5Z1F2MkFKZU1ycUNH?=
 =?utf-8?B?UnQ2cnN6VEVieUpJbFBzMlA0VmQramJONURYb2tSSkhEYjdjcDR3UEsvdlZX?=
 =?utf-8?B?eVQxc04vVFl6VjB0MERlczlPZWVsL0QxSzA5ZHl0MTNkUUVCK0xJVjdiMkJR?=
 =?utf-8?B?NkNUWThxb2RaaG5LUXJMQXNRSFkyMkRYWjN6OWxUanFBcFJUNXlYQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c213de-3f41-4a7d-b3ba-08de7eb578e3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:58:21.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewu/CZOrYebpSZWvOU7/2OtQ480/hEnFpVJjZ6msjZdEholCwgDeBqHauDYNPp+OToJX9Ji44pNH18hdyR1YSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

On 3/10/26 7:54 AM, Yazen Ghannam wrote:
> On Sat, Mar 07, 2026 at 04:12:31PM +0100, Borislav Petkov wrote:
>> On Sat, Mar 07, 2026 at 09:49:10AM -0500, Yazen Ghannam wrote:
>>> On Fri, Mar 06, 2026 at 04:49:47PM +0100, Borislav Petkov wrote:
>>>> On Fri, Mar 06, 2026 at 09:40:06AM -0600, Mario Limonciello wrote:
>>>>> But don't you need to use UMC to discover that?  Chicken and egg type of
>>>>> issue.
>>>>
>>>> Probably...
>>>>
>>>> And we already do that in amd64_edac. So perhaps we could export an API or so.
>>>> Yazen might have an idea...
>>>>
>>>
>>> How about having EDAC load ATL when ready?
>>
>> The thing is, AMD_ATL can also be built-in so then request_module doesn't make
>> sense.
>>
>> Which means, if we have to "tie" it to amd64_edac detection, we'd have to make
>> it synchronize its Kconfig setting to the CONFIG_EDAC_AMD64 setting.
>>
>> Or we could simply say that AMD_ATL is a module only because if anything needs
>> it, then anything should request it. And that makes sense because the address
>> translation should be present only when something else loads which is at all
>> capable of presenting addresses which can be translated.
>>
>> IOW, AMD_ATL should not be builtin at all because, well, it doesn't make any
>> sense for it to be. IOW, its existence alone on the system makes a little
>> sense if there's no address producer like amd64_edac or whatever else calls
>> amd_convert_umc_mca_addr_to_sys_addr()...
>>
>> Hmmm.
>>
>> It sure sounds weird...
>>
> 
> So AMD_ATL *can* be built-in, but it is default 'N'. CONFIG_EDAC_AMD64
> has 'imply AMD_ATL', so CONFIG_AMD_ATL=CONFIG_EDAC_AMD64.
> 
> If CONFIG_EDAC_AMD64=m, then CONFIG_AMD_ATL=m. I think this would be the
> default for most users. EDAC will fail to load on systems without DRAM
> ECC, so AMD_ATL won't load either.
> 
> If CONFIG_EDAC_AMD64=y, then CONFIG_AMD_ATL=y. I expect that a user that
> wants EDAC built-in knows their system will use it.
> 
> Thanks,
> Yazen

Are there "going" to be other consumers of AMD_ATL planned?  I wonder if 
it should just be structured as part of amd64_edac and only registered 
once we know there is ECC support.
