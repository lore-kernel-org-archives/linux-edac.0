Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795496437;
	b=OGATSBGxN7YeaBQdPI/gIOnfQtCJgXgOns8Ydwanf1WqpOAtIkn8wPgwT4H2BV0NcOwM
	 wbpOJ2KZW283avTpuWKTGySh/ReSgg4yHoQ4mEI1NO/jtK2p5ZQh4WlBXfAEnsUoHD00j
	 /E2AvKCgskW4jl00cGh50vARltJ/0CF8/sos0xVqMgsjAT/20IP4F7P6nAYACOen5AWWE
	 /Wf/1uJ4AS6xuFPDiicY0Rek7349ekfUE1aYmOeZT2BZLra61I+yTqGcmsS9fLoGTWg/t
	 lQ2bYY3y8A+T5qWMQFo7ADOVRzzivj7DA0txftvfELHF4E3+wGQyHba8aGgP61b32aA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496437;
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
	bh=IZzEFG6U0cIAXVND2raef8JeJPc6t+cD7MVgE4d4FY4=;
	b=IuEdxLggLXKTAD53588H4ts/qC+eb/imL6CUurjqczR+vEt4RbFgJmO6Yre7Rc1K84/h
	 BLTeIyug1PGLD71LspjOmTGIStFa4wvMY+IqBFY6gPDweK7WjK76raF4qvCVev9BkPh7u
	 u7QTWHXWeePFktAH/7I4rDj2QTb9+kLaKVf0+/jBNtoSK6yUD41yo58q1mOOOOpZKe9aC
	 IFetM/uPAU5RMl5rZXII4LrUDvt0KGIMj18irQsSITXx9LgAlE0jpYu6n7BjYxK2/ze9w
	 ibnYAIU0701wRZ4Ux0wwOxnp+J1VfYDrt/8YEZUc8T+MtYd5ncT3+SI6fh/6lXWY0Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sRYMfm1L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.4
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010004.outbound.protection.outlook.com [52.101.193.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E3E606A31E;
	Tue, 24 Nov 2026 05:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E3E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sRYMfm1L
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCafA+/bv6+zOjqmiiu16KUorGmWF5+V+Qq3kaVDABB0DSqA93NRXFwPQNKaPiUfCJ0GnAkaFSRCbi4Pz/gcaZI/rWXi/4n3kMiTfUWXB2GHl/FI+fIKYBZXU/PZdnskY9MnIgG+zJAayWgWhpzl/5FA4NRTg5iYikLlvkBjUl9C27GoXR6uctBgdnYdtzfg5+9CA+EpY6CfbhPnEX2DRSVdFEQw3/VlhezG+lytye8MQaeEyIBGwfl6GofkDdtrtaIYuP+7E47zodWOaYwomn8nvcfRn9qcdXJDhN3J3egxzvYwUyRuh020vx3EM9hMYa/QIS7C81icWom/yDaWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZzEFG6U0cIAXVND2raef8JeJPc6t+cD7MVgE4d4FY4=;
 b=shguaMtKmQ6OlVqviFceICKoit1FMWPoVzm3R1Q7fOZEgyDytNiOr/f2Ckf1K2zxJO5GCGGJocLZCodD2CjGwhMA7lquJgWhi3SX5D0keBN0N0VrBogYdwNdUnrpqPZXHgV3OA0QYk4phnvP1oRKaWqqofuulpkRB4d5JZJozcA3gsJIFrohI9XNUaQKiWtdYKEBHIt7IVzASd7y6s6VEuSQqNUem9UJ+6r6tYIjpQGYoCgqQ+6JfIKJxBvAb3ze+yAwaup9kOENGkghOs4DD8HxbbuVK4zrcUJjEDCXuRAMVHHIQ6XxcHMK9AwTMDMKCD+EPPicTZQ58qR8GeF4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZzEFG6U0cIAXVND2raef8JeJPc6t+cD7MVgE4d4FY4=;
 b=sRYMfm1LcRFBum42ZPSPnk5B9UsjTAJlLHLCIUOH06IBVtI4MG9NLUAG5wfiVKmsVFQlV3w9dcMTESa+EIuKW11quiSADKASLSmq5CkqJCEIqggiX9brIzO6wXiBAYbvhGdB4b7S/XGenLsYdMeqAnPXM9ytms/z1oZQ9j81/EU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 05:00:30 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 05:00:30 +0000
Message-ID: <d30df635-8afc-4d02-ac9a-04d26640dfbc@amd.com>
Date: Tue, 24 Nov 2026 10:30:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] dt-bindings: memory: xlnx,versal-net-ddrmc5: Add
 amd,num-ctrl property
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com, michal.simek@amd.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-11-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261118142213.100581-11-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::16) To CY1PR12MB9697.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: cab1bed4-6e92-4ab3-788e-08df49e7dcc7
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|261028144727099003|261021121427099003|4143699003|261009223027099003|56012099006|261022105027099003|261021135927099003|261026140227099003|261026121527099003|261102123227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	HTmiCYeSooYs7fQbBWouqNSxIasYBJV5OI958LBUp4GckAsUNzO1rARk/bJyWWjs8a7jkBrOj0vkHtdIPtv7V3Eua3D7Nu032JdjmUzWAnkwQgivjDYn8GXZRlFqVWA7veoSHdX1KxRH20JFA0vgkJGKVHGXojBVb+kyirxQFu3Q2exUDXjmSXJjB5xi1P9P2YoL3CZGhvZASWuBN3y5fIY8t+611Gnwi+DT3JWW6hRShaL43cgLSI2a0xMmPv/DWazpmfWWee00uGg7sg2muJ9+t41WAeFAAXErI4HJ89NUyaP4UZSFgDoHSZHXg/aOolnKawSiTv6NGXtM3RL71S481iyi1Ixzd3uLg1NCAzFkeOYt02AsHhSQ8ShDaSAn+HNk1ZzRpRk+LHGFmvOozne89g67Lacsyi9aB2RT6HrTURbr5nXLmmHjJlEuv4XZHsyZZzbtv11cbAzRdGf59+tn2TR2dIig4kmDLf0mzVXfH9YWMqnclol5D0486bf18Z64mpa+jI0V04/y0sjAw42CIEi014HvPdV7i/PuzG1hwuQs14peXPCPdSRs0wD9iTHSHsmlP+0idLB9gwNiOpHpPLUTziHn+txKQGFXgkmXPyIX0e8X+FX4Z3VMKEv3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(261028144727099003)(261021121427099003)(4143699003)(261009223027099003)(56012099006)(261022105027099003)(261021135927099003)(261026140227099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1p5RUFDOU9ZTTVybkpuc1pHUFUyUG9yMTZhZEplczFNRlVqRDJpSWxtdktk?=
 =?utf-8?B?MFYwYWR0ditoczVTT0JnQmVCUmg3WkMwUTVrc3dmbk5seVV4VHJQNGw4cW1z?=
 =?utf-8?B?dzVpLy9RM3lQamozZGdLZFRtN3JFRkU3dXo5UnpON0I1cXBGNUloMThoakxB?=
 =?utf-8?B?bXlrL1k1YnB4R1lpMGtkWXcwWUxJcjlwcDRVT3B1ZjZ5NFBTSEFhZlRScHpi?=
 =?utf-8?B?bFgzbFdqclp1bnpNR3NETFNIcFZuZnc3Q2hUSUF4WnFKOGFDZDBMU0h5NHhJ?=
 =?utf-8?B?aEZLazU1RXozcGRpT2NmQnh5RFA1NGJadmlYMmx4WW92TndkelNzZFJ1VTB0?=
 =?utf-8?B?N0N2QXhWUUJQR2paelV3SGQwOG5tQUhJcnlDRGgzemJnV2R2SlJPOUZvaWw4?=
 =?utf-8?B?TWtiYWExSnQrSXZhOFgxU2QrQml3RGQ1elg5TTUvMWs3Mkd3SzNwOXlNUWpB?=
 =?utf-8?B?TmpWdnNhajYxL3gwL2NlZVpyK3h1WXIzSFVkWlZCS1RMV0o2LzFJTXB5OWdN?=
 =?utf-8?B?N1lmZ2VyK1NheFg1QUhtRnA0OGVuVjFhMmllSTlRYytMY3BxbDlXejd2ak01?=
 =?utf-8?B?TFVrQk5Md3grZkFyenN0STQreHlJL3RKUVYxT2dDS2M1ZjBtQnlmeWxMK3FT?=
 =?utf-8?B?NUswbTVqdHNEUkVWQlFKdi80UnF6NmpjZEY3bWlUN0JwaEdETzJBdXpIOHYw?=
 =?utf-8?B?VHV5VGNZTlVmR3hGUHphejA1ZkttMHRkUkc2ZTMzUTBDamhtWXZZM21PK0Jw?=
 =?utf-8?B?aGd2WUJjVHQ2Y0RBSUlHaFh2UEkvOXNJQkdvRFdyYkJpVXZTYzVpYk82WUZ1?=
 =?utf-8?B?Q0ppdE5qcmYwZmhHVFAxaWxZcUdORldFSTZKVEZGUnZYZXpPc3lqMnlBL0xF?=
 =?utf-8?B?VmhqekQ4aVF4bDFpK29vUVNVckdrY3gvaENPRU00YnAySHlWYnQrdGtwRHlU?=
 =?utf-8?B?U3ZLcGM1SkttbkJ5aXZnbXh0OTMySVNvalVrQ1FBVGRnQ3I1bWJ4YTRIaXcr?=
 =?utf-8?B?azlpVEx6RVpMTVJRT05JNCswcnFFT2Q1d2NyNnhGekUvUUlBWDVGMHVHWFYz?=
 =?utf-8?B?anpWSWM2emZUSHU3OEZKcWZVbjc3SkVSZEhsdXRPRnYvMzZLYjF6R044Y2N0?=
 =?utf-8?B?RWlScSt3aWN0bWxBUFZla1BOaTNGSlNNNE5FVm90cHBiOVpPQkp0Z2x3TmZq?=
 =?utf-8?B?bUNlK09RNjMrZUQ1Z2R2ZCtsVVVBU1JiMTV2SGxoQmlKM2hUaThKOWNQWStE?=
 =?utf-8?B?eDNoeXZ2TjFvamRjdnpEVXNoRms1NXM2OFRBaFA4c1pOdlRiSVJhdThpV3or?=
 =?utf-8?B?VFFNR1cvK3FuUE9OTXBTVnFCQ1FFaVNOS0czUnZLWG1Pb0oxM1h2WkpMOHdr?=
 =?utf-8?B?WjZWMHc3dXNzTjFCeEo3RDhldVpXUEdZOWFtSWJNMzBiaHhpMjBzVFdLYmxz?=
 =?utf-8?B?MnpRc3ZwVVZrY3VmSHI1UjEzRk1sUC8rMlFpVWZQUDhjNXE2VHdpT2t0eml4?=
 =?utf-8?B?bTNnUnB2ajZNcVZhSHJmdjZsQ3J0TFR3OUZhWTVDSmpST1UyKy9PZHZyL0pZ?=
 =?utf-8?B?NFR5d1ltcHNsa0MxV3JMM0ZoR2oySHltdEN3MjRnMm1CZkNZZ0YxTGUwcmkr?=
 =?utf-8?B?cGc0ckVDM1FsaUZRZWpqM3VlenQ1azdjanlKS21ZYmpOMDlWdUsyUHg0cDZQ?=
 =?utf-8?B?VUl4a3REN1A4VlhUeFdMeUZjNXhobXZ2T29ncUJjYzltakg5VTRpZjF1bzhm?=
 =?utf-8?B?dUhva2FyaTJML2c3dGovdG1hS2doRHJmYU1iRTF2T2Frc2VlZHV2ZlJkQU1F?=
 =?utf-8?B?SDNkbElETXlLT1VCclZVd1lZQ3ZyckRQTEpWeTV2SmQ4TmhtVjJRbVpleFF6?=
 =?utf-8?B?UHYrVVlHdmlTRzZwRkhjYkZaQ0hGME1oZjFiTDZZaDBOK1l6YUFIWTNsN1h1?=
 =?utf-8?B?MS8yOU1qQVRwaTFlQVA5eXJnaC9MSisrT2dWZHN0S2hhM0hMN2MydXVjTG5x?=
 =?utf-8?B?a2FVWmtDQkJaSTZaUjBTUGxmeFpsNkFQWTNkR3BTNVMyMHhDREtGN0FwUytT?=
 =?utf-8?B?N1ZrY25zR1N4bkIrYzl4aEFOSWV3ZlV1dlE5RzgrcGtBamFZZ2l6UW1SbEJo?=
 =?utf-8?B?Q0tsM0plNVRxSGVkTHgyV09hQURlcmg4UmM5aWNKQ0VHVHhUdjhmK29JRkdr?=
 =?utf-8?B?eVVHa3BjNzZiUW56QTcwR2tBNzM1Q0ptN2dIL1F1NXQxTkdBWjB1OHhGRW1K?=
 =?utf-8?B?YUgzYVFaK0ZlYlRwV3JmZ2cvblNrejljQmFmRFYxZGhDNnRPNnJJdUUydGFE?=
 =?utf-8?Q?+TClyN21S2qlyhOJ3x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab1bed4-6e92-4ab3-788e-08df49e7dcc7
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 05:00:30.1567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmK06fjxZNNkz3OCKexeq+DjoYdx2upecLC/1rfdMs+s0kzqzwgfCHHseJSM57rY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751

On 11/18/2026 7:50 PM, Shubhrajyoti Datta wrote:
> Add the amd,num-ctrl property to describe the number of DDR memory
> controllers enabled in the design. Valid range is 1 to 8.
> The driver then can enumerate only the enabled controllers.

Nit - avoid "driver" usage in binding commit description.


> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---

we should also explain why it need to be a DT property
and can't be queried/derived from firmware response.

> 
> Changes in v2:
> Add amd,num-ctrl property to device tree
> The property was requested in the discussion below
> https://lore.kernel.org/all/34ffba5a-8e9a-49b9-9e36-c31d0e4369f8@amd.com/
> 
>   .../memory-controllers/xlnx,versal-net-ddrmc5.yaml       | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-net-ddrmc5.yaml b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-net-ddrmc5.yaml
> index 479288567d0b..65feacd007a1 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-net-ddrmc5.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-net-ddrmc5.yaml
> @@ -27,6 +27,15 @@ properties:
>         with remote processor. APU primarily communicates with the RPU for
>         accessing the DDRMC address space and getting error notification.
>   
> +  amd,num-ctrl:
> +    description:
> +      Number of DDR memory controller (DDRMC) instances enabled in the
> +      design.

Mention that : The enabled instances are contiguous.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 8
> +    default: 8
> +
>   required:
>     - compatible
>     - amd,rproc

