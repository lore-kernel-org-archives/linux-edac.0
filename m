Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795499424;
	b=W4UaLPusjijIdpUnBZ8TZj5yVIvT6dhi8xtLcX10/qzkIDiKMnuNa03ZSwLfp55TFtBv
	 ZRruwcuDCKm4tTwxJ8Tn54MMGY1uv/zz2Oc6i/Ny5OuT2jEP6vBBYIe5UleSxXUwOaTHs
	 OeZIfsl7c75nT0EOidpYggzZMaHfR17D+psl7pw1cBf0DxWgeTImvu5JliCiwlCv1thof
	 299nrDvhzg7nnVyrf//S2Dh+9gjqpgh0OYHHxJiZbuVRWlWNLnLu2V4y7H/v+KMJAvZYg
	 R2ymxq/qJudzA/QksWS+TWbmcr03ct81cqA3eScX6HT9k+ARMllOcGuCmzxbZ0neqXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795499424;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dJwOKRaW06wVe+4plvEE6TuhEloDqL9SS5Z/O1RHdZE=;
	b=KL7Hy5ljh4KxyWDQhQY7MbFHHZspNO6pyxAEWcyw+vcPnvtUXxhWrwrB3SVBL3C1WRHC
	 XDIoPEJIu+eTzhC388ph7hIDsGXaU/Rt2UPFA+70ps5tE67/5B+OVKVywdF6wXXL7sufY
	 tHorykfZASa4uJorH2wPZ2jkztZx7BjqgC0fK61OajJONk2zW3AJa5lNhYoHnkS1V9rrg
	 dK+Bib8nXmn0Hg5t84vtIup7AF9JYasbn2FYfHgms0fJESTUDygS9qZEH0V0nHPXbMVTU
	 paOp3SM0uTy50ds0TlpOVqr2iCegg5pWxn6vaRaTdxCmxsooMX0Yq6cneJAkzG9IZVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Vu39C84Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.1
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F87606A321;
	Tue, 24 Nov 2026 05:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F87606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Vu39C84Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9+Dz6zMawBJovKRpvwKP87o66xnTi8hmYFyXbcc6D8B7YpHGYeKZ4UN1rlqtOKhzZq4eLBzAHgcub8EIdGWsh9vvWeQEdnPptPpLE0n+UhAAuoExEvWd4AvVVbSw/4qDDBvCbKJ5P7hvcxYuShFx/hu/Ac5A6DdsciTkCp4yK3BjJCklY0wfwYZm9sqKWXz1oTOcSzNzD9fLnsl6+MA17n1L0LbkdomsirjcrYfUO0w4ZEZ8/w9IG55JPh8Xp/3fA3pDeIbtQJSv5Gxfy/rCFpCTXlbRuAZ8Dc0odikDIjDgeBQKxw77+deep3OHOKRfN7/Pb5zVbqPxRq5ZIdhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJwOKRaW06wVe+4plvEE6TuhEloDqL9SS5Z/O1RHdZE=;
 b=ZC4joCGDCViFfwU2uTqyDtgSzSLhCdNZxC3DBoOfVE5YnWU87TUEez+jA4rHYjut3LHEjFBD+WoZLVrNERM4cZX0kHSyrBTMZmp36d7rwm0NsOYjbjtBqELjkovL56q3P/tt5rnlTnAHxKFbO4eQUiAAQqFd8OaoDNHJCPqV7rVfxl3fC15r9QnZUAwje29Z75RO5qgOyJjKYsixEsZPp980BaLpPhCX67XE8tyunCxm+H0QGvUzJw5mZV4GPupMbGKixJ4ygVhoTJwn73qtCyQBTvI+E6OyFem87ZtP4kIzRJXhuzMSaqy3iw1JiRIDlzKH7W6zg22lv8b7VizJvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJwOKRaW06wVe+4plvEE6TuhEloDqL9SS5Z/O1RHdZE=;
 b=Vu39C84QMPBsk+n65JiIaSk5wdO24CS3Kta4flZUbJ2t2IEhYqgSTfBWAbHls61PtY4sJcsSGwFsmxLxeSkg3J8cQOtiTRJ9tKDtrAkjIFvWDDe1vuzUNaGv6bvH4NWe9ex9So9l8ssknGwjPQCqaCFJpNRI9Pu55GKg2nhV42E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM6PR12MB4043.namprd12.prod.outlook.com (2603:10b6:5:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Tue, 24 Nov
 2026 05:50:18 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 05:50:18 +0000
Message-ID: <2c8e0e9f-6711-4b34-b915-f4cbf7b0b999@amd.com>
Date: Tue, 24 Nov 2026 11:20:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] EDAC/versalnet: use device tree property for
 number of controllers
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com, michal.simek@amd.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-12-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261118142213.100581-12-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::19) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM6PR12MB4043:EE_
X-MS-Office365-Filtering-Correlation-Id: 7adc39ce-22a5-435f-72f9-08df49eed1b4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|22082099003|4143699003|11063799006|261021121427099003|56012099006|261009223027099003|261021123027099003|261026140227099003|261102123227099003|261022105027099003|10067099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	gRm/hG1l03dFvu5joGi16dQoopz0yjBy4RrTfkPEU6V1CQevaoKZMsiWp2JsHR1+KLjDb+CZJUrhW0P4eXrYEKf8QGR9YUv4H89kzTAqmAnR19eIQQCHBAq8oXd6eRRS5A7xafDztHq1DfcQtFJ6PAiPg+N+t3ho4jtrgf9NtBk9UAudVY02g+xLHLqwWI6ZYP1h3szqgVjVO19zYz4AeJOWGl/nXg7bFvFe7MwmlyozlwrbtQ0amL2hV8OnDpVNX8/sPP9HOl3EHtgD1AWNY310NwlOd1Y8G8GfD4j0BySyS0EsXQcJVEdkbG9Wh0gV8IDo6zzfKxEEYa/JHApaspQDy050L02ggCv/rmwbkuSQeKSzCAITCZEJOnnMLNHN4SW+R2T/T4ni9q4rYW/bnLhgIAsaEO2o+OQxWEPmpRQXHIWMHPLETDfwfM9Ok+2MgfE7HZwojh3EjwnvGAOwtqCJcadlUkQWZQFcB7+zuY/ObqK0J7TATqzrncGy3+nqZ3byCEYEkzJyYyyLGjUKrLYi0QkQS3CRR8ukNUKEfi53kJkN0cTz55p0NcUg8qEtA0WWM7EjULfNIK2tCqvI4e9doKSlsbttcshdoLLy0tiw05PhKzMRqKSSXEpvPOy5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(261021121427099003)(56012099006)(261009223027099003)(261021123027099003)(261026140227099003)(261102123227099003)(261022105027099003)(10067099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzZZUVJCMjVZek9lakc4amJGU2VSOGRYejVOQXVwTU9VVkhwUGhMT2cwZE9R?=
 =?utf-8?B?NlpXR3d5aUpJV1FGS3hLYUpSeUsveFRRZTZoSmFvS2l4ekszVllBVzl0V0NK?=
 =?utf-8?B?TU5ZRHVKQllic1JBZDF6ZDUrVHh3cDd3M3oxRXFRSmU3VXkweGhLMkRjeTlW?=
 =?utf-8?B?cE5ud2FBbFJXZnlZU1puV0pzb05jVndtbVhreFJnNHJmanltVWRsc2pQSDI2?=
 =?utf-8?B?a2JJdytTenNQS29jc2t6MVFZUFdZL0hGRTZKcFJieElUclJ2aDV1aUlGUnFr?=
 =?utf-8?B?RStadytxdjNXc2RvRkxvOW1QTTNHS0JVRm1wL1IzeTJUdERpcHQyZytkR2pB?=
 =?utf-8?B?dnNMdVhYd0w5RTJWQlZkR0x1YlN1RmlMa01pZG5EVVo4ckZGZXZJcHJUVS9B?=
 =?utf-8?B?eWVQbElpbHZ2UVFPMXcySEU0OE1WZllFZi9jcExrdlB2QUZFK3FTK1RPc1Zn?=
 =?utf-8?B?eHRJVzZNRjZOczR1a2VwZ29YbUN5TStiN0VtTkQyU2ZmenFDWEpWWUtCM3FI?=
 =?utf-8?B?eGhsUUZRMUFZZzFweC9wYzV0cUtPc1BDbTV2VDJUanRHMGgzbHJlMldjbTNG?=
 =?utf-8?B?RW1ZN1JHYmJBRHo5OWQ3U3V5M0t3REhucUNPYVBHQ1dxb05LWWRQKzNYWUY0?=
 =?utf-8?B?U3o3TFFhNE1nV0NJdkl4NnhlNW84aE1oTzhSVEVzeG5nODF3Y2lDYkdMTXU5?=
 =?utf-8?B?bTBoUDZ1d0gzRG5iY1lzdW9mNTFQOTBYSlVHcURQN050UGRJbVZXYjhXQnlu?=
 =?utf-8?B?bHRCMDVqVFdwZDRvbmdJWC9QSkVkdDVMZnpKWTc0S2JPV1lDNWZvYk1waUxS?=
 =?utf-8?B?RVBQMG16Qm9EaDhFVUVhdldsSlVveloyNDF5S1dNazA0TWVFSXFUdytBb3pu?=
 =?utf-8?B?UUd0N0NyR2hXbFdkVklYSHN3ZkI2elR5UmFLSVY0U1dmS2NmU0c0bEYwQ0Z1?=
 =?utf-8?B?cFFIT3l6TjIwNFVlckIxMG9LUGlDRFVYN0NnZFJqL3ozZENWTk9pUGRrRnkr?=
 =?utf-8?B?V2ozZmpIeEtORU1GbnZZQUFydjhLOGgyUk1TMXdmcDV2Nkw0S1hrM2dpcGdp?=
 =?utf-8?B?VlhTa3lKcjkxVlRFNlNvNzdITHBWTXpJOWk4Ym5oRUJtRlJhOG5TU2FMQldO?=
 =?utf-8?B?RkhzUTBkam1CTS9Jc1R2NnYzR05JbkJkRm5KYW1FdlZYeHRPNkxFTm10QXdJ?=
 =?utf-8?B?Vi84bEtTa2ZCdFl6NVZpUXEreDJ0dzV1dlZsNHZUbFl1VlA1UGlVcngvWkZw?=
 =?utf-8?B?Lzh6c0lJMGNsOGxXRlNXbjRIaFBUWkhoK2J6cllCRmx4R1IyOTUrNFVzbnZY?=
 =?utf-8?B?ZTlZdVhaa3J4bUNGV3hYeVBZYXVXVlBoNmI5TXcrUWhaS2RhMXdaRFMxbUlu?=
 =?utf-8?B?SWtRT2NOSkpVRUVtSnBtVnUzaVg3R0Ztb3Vvc0tGTXBFY241N2N4RzRBTzVa?=
 =?utf-8?B?Sk9CeW4vZjAwRC9lbkJVSzR1U3lUZ1hqZWE4SGhDNmJXeGtMVGVEenlabGhq?=
 =?utf-8?B?aW01cFhJWW1KOFFVaGZjdHI1aW9iU2lRRlRLcmlHWGVxU0RDTWpkSXRhZ2ty?=
 =?utf-8?B?M2JOeVc5UWppMWZHNzcwS3lueHFZSnVoZHcwYlYxZWNPaitPTmJWejZWSTB6?=
 =?utf-8?B?VXhrenZOZU9xek56VHNmTmNoSTNHbCs1eVJhZVlLcjgvQXNXMy9JeXQ4Y3d6?=
 =?utf-8?B?cHBQMWlpVUZJSDVMS0JKTm95bU9kcmUwNjhyYnV3MjRWakJyM0lUVUVFZHJV?=
 =?utf-8?B?WThHZkRxbUsvKzhXTFVta3gvMHVrOGJrQm1aWVRrZDFLZnlBenpJMzBTS2hC?=
 =?utf-8?B?eHhFYytnb0kzUENyMkJ1bzFJRVdaRHpObldodXYwc0NRZnhpRVhCRCtIOEVj?=
 =?utf-8?B?TEQycnhTOVVKYzdEZzRpb2daU1hWajBIaVZ1clRXeDBaUTFmWExhSTg3VmEy?=
 =?utf-8?B?Zmt5aG5tR2czM2xpbzFzc2Erb1UvbUFtTTRsdExaT04wWGN3MlEyL0xVME91?=
 =?utf-8?B?S3A5c21sa3pDbno5c2xRenRKeTlhWllNWE8wZ2pvZm5qQlI4WmZUeFR0ajRS?=
 =?utf-8?B?OEd4NUNJY1c2eEgvSVdGVU9yQWs1cUl0cGcyam1obm1ib3F0Y3lKUVRtNUtE?=
 =?utf-8?B?VHJ6a056T1NOV0VFK2drN1E5clhFRXczZXBFMEcvK2pwOFZhQjZZOXV4OEs2?=
 =?utf-8?B?NGw5aFgrb1AzT3RmWldQZ3l2emdvTjl1eC9LS2VaNll5cEdpb3RGb0toTllC?=
 =?utf-8?B?NHFCR0pxek4vVTFrY1dRci8xM1hkUzlHOE1tUStCZ1d6ckw1RDgxMmdyTlJE?=
 =?utf-8?Q?XqzQyo6eSTUSv3hZiG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adc39ce-22a5-435f-72f9-08df49eed1b4
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 05:50:18.2293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCPWz4nllnAHljRbBhj6sY7bfFElnPh5A8UpDViDGS/Zd+AlzqesFJ469p0+HSTD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043

On 11/18/2026 7:50 PM, Shubhrajyoti Datta wrote:
> Use the number of enabled controllers read from the "amd,num-ctrl"
> device tree property for registering instead of all the controllers.
> The enabled controllers are contiguous. Add a
> num_ctrl field to mc_priv and use it in probe, init, remove,
> error handling, and the rpmsg callback, allowing the driver to
> support platforms with varying numbers of memory controllers enabled.
> 
> This keeps the old behaviour for older device trees. On a platform with
> whose device tree lacks the property, the old iteration over all 8 indices,
> remains in effect.

Trim/simplify above commit description.

Default to eight controllers when the property is absent to maintain 
compatibility with existing device trees.

> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v2:
> Adding the device tree parameter was suggested in the review in v1
> https://lore.kernel.org/all/34ffba5a-8e9a-49b9-9e36-c31d0e4369f8@amd.com/
> 
>   drivers/edac/versalnet_edac.c | 28 ++++++++++++++++++++++------
>   1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 7c14f1e78da1..c2025f5744cc 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -140,6 +140,7 @@ struct ecc_status {
>    * struct mc_priv - DDR memory controller private instance data.
>    * @message:		Buffer for framing the event specific info.
>    * @stat:		ECC status information.
> + * @num_ctrl:		Number of DDR memory controllers.
>    * @error_id:		The error id.
>    * @error_level:	The error level.
>    * @dwidth:		Per-controller width of data bus excluding ECC bits.
> @@ -168,6 +169,7 @@ struct ecc_status {
>   struct mc_priv {
>   	char message[256];
>   	struct ecc_status stat;
> +	u32 num_ctrl;
>   	u32 error_id;
>   	u32 error_level;
>   	enum dev_type dwidth[NUM_CONTROLLERS];
> @@ -456,7 +458,7 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
>   	phys_addr_t pfn;
>   	int err;
>   
> -	if (WARN_ON_ONCE(ctl_num >= NUM_CONTROLLERS))
> +	if (WARN_ON_ONCE(ctl_num >= priv->num_ctrl))
>   		return;
>   
>   	mci = priv->mci[ctl_num];
> @@ -713,7 +715,7 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
>   		p = &mc_priv->stat;
>   		memset(p, 0, sizeof(struct ecc_status));
>   		p->error_type = MC5_ERR_TYPE_CE;
> -		for (i = 0 ; i < NUM_CONTROLLERS; i++) {
> +		for (i = 0 ; i < mc_priv->num_ctrl; i++) {
>   			if (get_ddr_info(&mc_priv->regs[i * REGS_PER_CONTROLLER], mc_priv)) {
>   				adec_data = mc_priv->adec + ADEC_NUM * i;
>   				handle_error(mc_priv, &mc_priv->stat, i, adec_data);
> @@ -724,7 +726,7 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
>   		p = &mc_priv->stat;
>   		memset(p, 0, sizeof(struct ecc_status));
>   		p->error_type = MC5_ERR_TYPE_UE;
> -		for (i = 0 ; i < NUM_CONTROLLERS; i++) {
> +		for (i = 0 ; i < mc_priv->num_ctrl; i++) {
>   			if (get_ddr_info(&mc_priv->regs[i * REGS_PER_CONTROLLER], mc_priv)) {
>   				adec_data = mc_priv->adec + ADEC_NUM * i;
>   				handle_error(mc_priv, &mc_priv->stat, i, adec_data);
> @@ -956,7 +958,7 @@ static int init_versalnet(struct mc_priv *priv)
>   {
>   	int rc, i;
>   
> -	for (i = 0; i < NUM_CONTROLLERS; i++) {
> +	for (i = 0; i < priv->num_ctrl; i++) {
>   		rc = init_one_mc(priv, i);
>   		if (rc) {
>   			while (i--)
> @@ -970,7 +972,7 @@ static int init_versalnet(struct mc_priv *priv)
>   
>   static void remove_versalnet(struct mc_priv *priv)
>   {
> -	for (int i = 0; i < NUM_CONTROLLERS; i++)
> +	for (int i = 0; i < priv->num_ctrl; i++)
>   		remove_one_mc(priv, i);
>   }
>   
> @@ -978,6 +980,7 @@ static int mc_probe(struct platform_device *pdev)
>   {
>   	struct mc_priv *priv;
>   	struct rproc *rp;
> +	u32 num_ctrl;
>   	int rc, i;
>   
>   	struct device_node *r5_core_node __free(device_node) =
> @@ -987,6 +990,18 @@ static int mc_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> +	rc = of_property_read_u32(pdev->dev.of_node, "amd,num-ctrl", &num_ctrl);
> +	if (rc == -EINVAL) {
> +		num_ctrl = NUM_CONTROLLERS;
> +	} else if (rc) {
> +		dev_err(&pdev->dev, "amd,num-ctrl: failed to read property: %d\n", rc);
> +		return rc;
> +	}
> +
> +	if (!num_ctrl || num_ctrl > NUM_CONTROLLERS)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +			      "amd,num-ctrl: invalid value %u\n", num_ctrl);
> +

Nit - consistent use of dev_err/dev_err_probe.
How about something like below.

u32 num_ctrl = NUM_CONTROLLERS;

...

rc = of_property_read_u32(pdev->dev.of_node, "amd,num-ctrl",
			  &num_ctrl);
if (rc && rc != -EINVAL)
	return dev_err_probe(&pdev->dev, rc,
			     "amd,num-ctrl: failed to read property\n");

if (!num_ctrl || num_ctrl > NUM_CONTROLLERS)
	return dev_err_probe(&pdev->dev, -EINVAL,
			     "amd,num-ctrl: invalid value %u\n",
			     num_ctrl);



>   	rp = rproc_get_by_phandle(r5_core_node->phandle);
>   	if (!rp)
>   		return -EPROBE_DEFER;
> @@ -1003,6 +1018,7 @@ static int mc_probe(struct platform_device *pdev)
>   		goto err_alloc;
>   	}
>   
> +	priv->num_ctrl = num_ctrl;
>   	priv->dev = &pdev->dev;
>   	platform_set_drvdata(pdev, priv);
>   	mutex_init(&priv->ept_lock);
> @@ -1027,7 +1043,7 @@ static int mc_probe(struct platform_device *pdev)
>   
>   	priv->mcdi->r5_rproc = rp;
>   
> -	for (i = 0; i < NUM_CONTROLLERS; i++)
> +	for (i = 0; i < priv->num_ctrl; i++)
>   		get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
>   
>   	rc = init_versalnet(priv);

