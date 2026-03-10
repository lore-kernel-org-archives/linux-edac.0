Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010064.outbound.protection.outlook.com [40.93.198.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09AD39DBF7
	for <linux-edac@vger.kernel.org>; Tue, 10 Mar 2026 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773164872; cv=fail; b=rhiiRyZxFHyiFKb0bBj/V4+GWMjyA80v+A3yu/CE/1I13wwt0OOQ0JTPj7S4keTs57zRh8OW5lc+E3TRjTLkzxfnebQuERNDLVB4rf4+Os05zFcJ2mOpfOk4dwjzl8Bd/aiKcsyXDt0VudyW1b4Y6sdQwqUmpJU9KrqX8CgJEks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773164872; c=relaxed/simple;
	bh=to3c59kNw1H1BPmw7amZJCC3zc8Yy9u+fxCYJ8uuw0w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GrfgfaxJy2UUn/F5dZquwZ6OFhAWNWYVb1jcmW6C1fuqhFqxxZ8uaXFc8lCNd+ms45am8VS9N9m2kJ3BR7IQ8B8pBQ/nGIDrvIl59O2lOV8iLXgi0estszcFLegA4m02vIpKB6XEPNPsLlyFIVRh/WIeB6wyfPp4El9geSCqBXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=21NI66Xx; arc=fail smtp.client-ip=40.93.198.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="21NI66Xx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vug5uLzNQeQHw+0rtEFnFyvXBrnWRExDdinHcOMMAeaypndleZPkC0Maovf0mD/jjcDSyVWiP9g/OOmYPVJ0AQv2nBcDUfKj9xKLcz6svi5wub/jCMH3Wt7r3Q9943v+3OiJQA7MPG91uHOEf4CydznVJflYY17ahcA1TZItEIQB/O0ogZhX5suyCx/AYNDIgkzF6izJjHCarX8N83mY9Zj6H/F0k+amBoufCS6/Xv76/kZmxY1hsYWgbTLQPYXwUAOpvlH1H2UkzWdgotcEZiJw9YXyYR8viCFS/sYTel533rQeia3+1/PG7nK1JGVu1y9q6ARwN/F7S5oBDVNHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXYWR61/uudg5pyq8FClxPsi+KeBaoiFufqKEYJW+kw=;
 b=NKmGcErrrlzUqntDaNcQegEg57M5ms4o5M7eTL+Qhro/9fsIJOBoKdh3/Vmne/UWNqO0YMUc3bHwUzIgix0BuZKFN8xtveECOAnbUpv6XMGRjOWSGiB8tZYVj+ky/hg5m6DyhY+WpG0PDq+5LkpC4EfLY0iyeO/OzlANDAWvHUTwsepIifQ0z/4lDN+yTt0r40UaaSaEnsMf6qcAGxjbJJkIZH+6C6vfXFJGpk7krnaJuPwYIv42GJbRLo9flpgtICRvoX8HsVnSOdhdmuyCcm8TwrYrbayNl6NS15K8F3e+dq4YIiKrRj5dgj0xtNM4nc4gQnhLex8zbL2xB9W8AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXYWR61/uudg5pyq8FClxPsi+KeBaoiFufqKEYJW+kw=;
 b=21NI66Xx6HkNe08X5J4zgaTqcUr6qQKHbxlVgMGH7MFWUaNOS8wpybWzbMaWfkFF2pZyCSrRhezJVgk+aUKxpA838NPsY8X5h0cwcxwU0QhBZJ5H8a/ACf3efVD8A2f4r0BfRJRe1dhCRwXpbSpx8jFaM5roZ9p7bEYANPrPsVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by IA1PR12MB7496.namprd12.prod.outlook.com (2603:10b6:208:418::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 17:47:44 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 17:47:44 +0000
Message-ID: <943824a1-d5e7-4801-a0a9-c4e875ad286c@amd.com>
Date: Tue, 10 Mar 2026 12:47:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RAS/AMD/ATL: Decrease message about unknown DF revision
 to debug
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 superm1@kernel.org, linux-edac@vger.kernel.org
References: <20260305154528.1171999-1-mario.limonciello@amd.com>
 <20260306145003.GDaarpm6p8A-pFBCCf@fat_crate.local>
 <a9a4aeb8-a044-476d-845d-0368f90624f2@amd.com>
 <20260306153223.GFaarzhwApsh3Jdqdy@fat_crate.local>
 <47075497-6bb8-4da3-b8b3-63901d9f3b05@amd.com>
 <20260306154947.GGaar3mxJ1JkcC0OgV@fat_crate.local>
 <20260307144910.GA113343@yaz-khff2.amd.com>
 <20260307151231.GAaaxAX3gT1AKv04I4@fat_crate.local>
 <20260310125422.GB890303@yaz-khff2.amd.com>
 <e6fa4686-5bff-43f2-acdf-b4442452d4dd@amd.com>
 <20260310165225.GA1166706@yaz-khff2.amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260310165225.GA1166706@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:610:5a::14) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|IA1PR12MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: d5abcf87-ffaa-4d69-d747-08de7ecd2244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	WpRnEme7JPmuBQeLYbsSKTbBmGgucslZ8DLBQpKFkhJ40FTjSTgYyAwqiIXz0fK7FFRuVfpqoQJ5+qwyavWDCAyI1Hn/M6iH6Ew0pj19ldWAzaOdDzV6MKJy9owE73O7ujWw8Bq5ySlNTWI/SLyJu4N619evVBT5qoWYjcxwcUK1dEpzb5YyUG/ydFXkmYJyC5SdZ39CwlNxMKExdlczbGNgKovWilCaiM3naI9UqjViWuTlkwp645EWVvYvyOmqipT54CZq0BpWgpskDYcBklwYU3J7P63wlm4nqRlg7GZbgHyWSOnNYjnl1h9BWhii7dIKPgebaWHGdri1FYVd+pqi7yt2735Ig8gmEl6fLl+Utuj8UnfZWL+yV7lxHp2lEAscAHzL1w4rcY2wMeg7g6Ze1GiITFLD3EmqpWbpSuZXqZw6Qgut5AoiHT5lfOzRQI0S6vSQ9f8rA7NcRV/+TSnv44gLjtdexjlarK1SRIa3mEwp1WchFpFR6PBQ/qLWkitdELfRO247HJMcmMBG9j949xQcr7xHfb+mHA2gBLsPPTWjAc7kU6Bi6rCLDtnLUAIP3GmOURSl+uQohreLOmtrZaVENnYL/fa5vXHmPmVzRtUTlmeAwPbStDsU8PIIzcGoq5A30C9Nr1JLmBRxzO84dmHklYwtnEUPgVG3NXZwv/kcAbgcSZ8PxxuPNmZgYEzRZXfKVlC261+VHaO6IuYq08M+hpSSZLmOY2CTRHc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amF5Y0dVeHBNZ3BUNDc0Y1BlQU40dTNWY3lPaEZkOW41R2JHOFplL0MvMEhS?=
 =?utf-8?B?dGV3VXBJSldrRUV0Nm10ejZwNWV3YmkwbE16ZnBPL3pEUDJqRDc4a004Tjd2?=
 =?utf-8?B?ZnRpZktxcDhpU3NOTVZKVGpQQVdRTmZnanBsWVZ5RkhaS3Via2lCUTF0UzUz?=
 =?utf-8?B?NGg3Q2N1YldQTnNaRVQ0VXQ4RC8rdGJ4SXlDSWhmeHQrQ016dy9yT2JSc2Zo?=
 =?utf-8?B?UjR3SUFLN3RxbFY1dHFHZEpnN3ZEaTgzN2k3VDdpeHlyc0hIbk5BNHdOcUJG?=
 =?utf-8?B?M3lWd2VPcUVqWFpuV2N3SkZPbHdDbnE5VXRZbWcvWnVPRngvZjFEWEZVdngx?=
 =?utf-8?B?WVoySmo4aVB6MEVpY093ZDhhbnl5eDcvL2dKb2R5U0VlSUFiOUUyclV1S2FB?=
 =?utf-8?B?UVlzTWl0ZGJHU3huS1NwWit5dHVYN3hReVV4dEh2VjFGZXh4TUZRY1BJN2s5?=
 =?utf-8?B?ZGd5YWIwWWFrdFUzdURkdVBKanMxa1lZU1FXTlZ1bGdScVJKRHZXcDEwak9M?=
 =?utf-8?B?d3UvN0R4Y3FGTFlabTN6RTZnV0E1NmRiMVR3WFNJSDdPL0ZVajRFMTNFUjZT?=
 =?utf-8?B?aVJ0Z0wwZWZhcVdoa000MjZRQWMrNk5uRVFPS2FLbUREWDVTVXc4TGRta1Vs?=
 =?utf-8?B?S2gyRHFZU3JHdTJwZDNtNkMzUWV6WE9yakV0WTIxMVdHcFZPVGY1cEhJMEs5?=
 =?utf-8?B?WG4rWWxiMzhDMEJTYlU1VmhFQy9HRVAzNDFaU1hTSmxVQTlBa1JLaG8zbmF1?=
 =?utf-8?B?MSs5SmdnZXhHT1h6NmpjNnJTbzlaT3N1ZmNsYWhwREdTdXl0OVdBZkplN1FL?=
 =?utf-8?B?bmZiRE5PcS94U0toQUxJWm0xbnhTQlF3cTNoMkJvc3N2NWNYYU1jK2xyTzBt?=
 =?utf-8?B?VkZjTHdpZytna2NyZzZEc3pLL0ZIZDhEUTBxaUg4Y1lFS0dXMEJmUVhZSTkw?=
 =?utf-8?B?ZjU4YzNETFBRendTbkljN29yeUtTcE5MRjBCR3pDMVBIeFQwL2R1eEIyK2ph?=
 =?utf-8?B?VkkzSnIwenpjOTYwaTlsVTlReW5mSjJ0L1FSRDROYUpsU3NsUUdENWRkL1lS?=
 =?utf-8?B?ajRLTVZhTVprUFkvbmNpL3dkSFlzaW1FVk9Za1VEM3phZ1ZqTmxIcmswS29K?=
 =?utf-8?B?dTJwV2FwTWJZRWlsbWR0UnVuSzhmNDBrbm5zYjJSYUY5bHZ5UGFsRXBnTyt0?=
 =?utf-8?B?WjdXb00zOW1ua1ZMQktaMk42dzdvV3Zqa0x5c0RTUmZiQ1NSSTdWZjVZOFdt?=
 =?utf-8?B?ZGEzd1RUV3I3WTY4azJsQkVneThuUlVSTDFmMldZZjBLMmkydjA2R3c2OWxD?=
 =?utf-8?B?ekNHNWp6bXprVDBTSHdiQzBid2l4aDZqQU8zTmFBUlNJVkg0MlFHL3JpUG5u?=
 =?utf-8?B?ajBtRk1PbVdyQnhSeFdySHZpamJSMFJKV0J1ZzQyaEdSa1RKN2ZwZTRnREdv?=
 =?utf-8?B?T3BNVEoxTi9BMnVLQWFHSlNTa3Fwa0JZSDl1VGdtd1IwaEtnRDhTbDhkM2xt?=
 =?utf-8?B?VVl4bmNyc0I3K1l5bGN0eWVvSVFJeHNydnFJb3BKcm91aWtjdmZhek1BVERx?=
 =?utf-8?B?RmU5bXk0VkxyanNQZ29ua2pLYzBocmpKdno0T0x4emk5dkRDSThkU2c3LzdO?=
 =?utf-8?B?TVU2NnRiczlSWmsrSWZOYWYwVENWcnZoN29PT21QSW82aGlickFKTDdWM1Bi?=
 =?utf-8?B?cE5YY09XWmJRZC9PNHF6Qk5BdGhET1NYR1VJMFdlandvanBjQ3U0T3NkbXBF?=
 =?utf-8?B?ZUNtWnFtMjN3YUVTZkhqaUI2Mk9zZ1hWK1RnTTJPQitMd2lheHByOGNOTzcv?=
 =?utf-8?B?Ymh4MHhxVEpSM3Y2bXhFVlVMZ1pXQ0pwdWpuU3lieE5md1d3QUdCZGFyTHZ0?=
 =?utf-8?B?V3hDN0Nvc01BdE91VmRuRE9xUXBWeEc3elFETDVTU3AyUGJwV3pwZDhqcVd0?=
 =?utf-8?B?TDRCM0tYazh6RG1WNkdwZUQveWxNaTZVS1k1R3BBUVhUTjdoc1dsWlg0akZZ?=
 =?utf-8?B?Q1V3WnZkbGlNL3hOblFLYzlTU1RlMUs3R2J1NVp6NmUxNW1ib3loSGZ0WXR6?=
 =?utf-8?B?M1E4dUt5MGgrTm1ZV0MrZFk1L2JTd21kdlFvTFdEUDJiNkhld0ozRGFxaVdM?=
 =?utf-8?B?ME52MFNHcngzUDlCVE11dDBkZWUzcFNBR1Jqb3JjNDJ4UEdlT2xrTGtUYitj?=
 =?utf-8?B?clB2K3UxVTdGdTlPR3NXWitOVFkvMjZWQU0zL2FVUGdkWnIxNU1TVm5iVW9s?=
 =?utf-8?B?YjJzZ1ZrR1hFQThSYVJlUXJ3aWtyS3ZxcXAvUXJEMkVlQnBGVWdWOHdWakhW?=
 =?utf-8?B?cmwzS1JPKzdFcWxQaTFNcWhDUnpzNDZrUFFFZDhLWGxxU3I2MEQwZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5abcf87-ffaa-4d69-d747-08de7ecd2244
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 17:47:44.3221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9XK7vW1cHGZRF4yr75SBLjLchAS8O71j9VPiDvPK9ULw9DpB2kCu6KHHkJrkH742G2X3jpMEs/fL/7wzNKu9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7496

On 3/10/26 11:52 AM, Yazen Ghannam wrote:
> On Tue, Mar 10, 2026 at 09:58:18AM -0500, Mario Limonciello wrote:
>> On 3/10/26 7:54 AM, Yazen Ghannam wrote:
>>> On Sat, Mar 07, 2026 at 04:12:31PM +0100, Borislav Petkov wrote:
>>>> On Sat, Mar 07, 2026 at 09:49:10AM -0500, Yazen Ghannam wrote:
>>>>> On Fri, Mar 06, 2026 at 04:49:47PM +0100, Borislav Petkov wrote:
>>>>>> On Fri, Mar 06, 2026 at 09:40:06AM -0600, Mario Limonciello wrote:
>>>>>>> But don't you need to use UMC to discover that?  Chicken and egg type of
>>>>>>> issue.
>>>>>>
>>>>>> Probably...
>>>>>>
>>>>>> And we already do that in amd64_edac. So perhaps we could export an API or so.
>>>>>> Yazen might have an idea...
>>>>>>
>>>>>
>>>>> How about having EDAC load ATL when ready?
>>>>
>>>> The thing is, AMD_ATL can also be built-in so then request_module doesn't make
>>>> sense.
>>>>
>>>> Which means, if we have to "tie" it to amd64_edac detection, we'd have to make
>>>> it synchronize its Kconfig setting to the CONFIG_EDAC_AMD64 setting.
>>>>
>>>> Or we could simply say that AMD_ATL is a module only because if anything needs
>>>> it, then anything should request it. And that makes sense because the address
>>>> translation should be present only when something else loads which is at all
>>>> capable of presenting addresses which can be translated.
>>>>
>>>> IOW, AMD_ATL should not be builtin at all because, well, it doesn't make any
>>>> sense for it to be. IOW, its existence alone on the system makes a little
>>>> sense if there's no address producer like amd64_edac or whatever else calls
>>>> amd_convert_umc_mca_addr_to_sys_addr()...
>>>>
>>>> Hmmm.
>>>>
>>>> It sure sounds weird...
>>>>
>>>
>>> So AMD_ATL *can* be built-in, but it is default 'N'. CONFIG_EDAC_AMD64
>>> has 'imply AMD_ATL', so CONFIG_AMD_ATL=CONFIG_EDAC_AMD64.
>>>
>>> If CONFIG_EDAC_AMD64=m, then CONFIG_AMD_ATL=m. I think this would be the
>>> default for most users. EDAC will fail to load on systems without DRAM
>>> ECC, so AMD_ATL won't load either.
>>>
>>> If CONFIG_EDAC_AMD64=y, then CONFIG_AMD_ATL=y. I expect that a user that
>>> wants EDAC built-in knows their system will use it.
>>>
>>> Thanks,
>>> Yazen
>>
>> Are there "going" to be other consumers of AMD_ATL planned?  I wonder if it
>> should just be structured as part of amd64_edac and only registered once we
>> know there is ECC support.
>>
> 
> Yes, actually address translation was once part of amd64_edac. But there
> is so much code that it was nice to move it to a separate library.
> Another example of this decoupling is with ACPI_ADXL that Intel uses.
> 
> There is another user of AMD_ATL: RAS_FMPM.
> 
> Also, I do have it in mind that AMD_ATL can be used by other places or
> independently. I have some old WIP where we use it with MCE to do
> preemptive page offlining.
> 
> EDAC for x86 is mostly counting and decoding. You could leverage address
> translation without wanting to use EDAC. And you can use EDAC without
> address translation.
> 
> Thanks,
> Yazen

OK.

I don't think the assertion that amd-atl won't load by default on most 
systems without ECC is correct.  It has a modalias that looks for 
features (X86_FEATURE_ZEN specifically).

alias:          cpu:type:x86,ven*fam*mod*:feature:*00FC*
alias:          cpu:type:x86,ven*fam*mod*:feature:*0223*

If you look at this all in a vacuum - is turning down the messaging to 
debug for amd-atl so bad?

