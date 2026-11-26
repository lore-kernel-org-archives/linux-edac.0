Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795677128;
	b=H23hQcU2w9VTiQRI4vpZL8yKpnGWpcBUzHRlVcXEme1TjEjwdgI0HP5ruzLZUA8n4LTT
	 xpDkGnACfD1zRVVJB7x2lvRrFOd43ZwunX6QAwlAZrO2VaHt9DXe7vk9X1Qf1A85H6lT5
	 vwAq2OlDfIwvE3CR9d8Qbx958hTpxXqIzfR4vjeB4C/aQOYxkjaSWC5D3dO0HuZeDaw5v
	 Mhjz+MCpzHPZVTA5cn7hzw09bFdJBvy9//4+u92O5RZzLdvIJfbYstzI8IweHqYUiSU5C
	 TVIFZddgx3Uifqd+N2osTF1I9CvGPXPa6pMPDXdKFuIaaii6+gzfjpqOn0FhxoFpm7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677128;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=2t3fYwWO1scuRS6YJKDQ1102gGOI6/ro58NZqc7rr3Y=;
	b=0SL16SutAjODT3a15pucmAQ1iXsjJ/6Qruf/2KzoORR6y8IYkVvKVKNr/3ATHOX+x16f
	 vw0UB9Fok3YY5NcjLkWpelS5skKHOTLNVXq5pUOoG2PuGxmJTBsladk8pnwQm8xzX0fTS
	 Zg0nQ1kXhHTBswI1hIva9Uz3EBGbr7W+GV1wadwEPAr0RWv9A++XaZZpwGjnFFZpoeBYK
	 nDxioaw30jnUYjrsPs/bn6p7h9J3joYIe6+tPWquj0h9HtQOGE0DgGUOREdq2vGwLaVyw
	 5LYddstEoKEdzmYipp4Fel2aSK5c1qDlidSN5E674C8N/KsHpqn5z0zuORIZQgR4fYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TtBTZ64M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.70
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C10606A326;
	Thu, 26 Nov 2026 07:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C10606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TtBTZ64M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWN52z3WFnDTZacktytJH00mu9rawkjqT/qPVfZ2oFWIThNIsklNyaCVYIimihis2cF1QfmXyOL/MdseVNF4Ge9cltT39A0TB85w8J71xBR64cp8dKs+le8f8iPx4HFybj3/tgE1VpM6UYvYZKd4msiIK2pGq+zih75n2S8T7EkeTLvI5pQPBrf7/XxhtW4XatwrO6b+YIkHc73I0huiuky2lYt3xE9/ZpgDaQio3EtqXTYCVz6xI6kxoxAzXrieiap57NiwrU8WOmRzGjpSG7JXO2jnvVYf1tQApY2Zu1JG058wkHzQr6CCIeOohVf7sGLtOxu3sczLnaK0zJE07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2t3fYwWO1scuRS6YJKDQ1102gGOI6/ro58NZqc7rr3Y=;
 b=V5Z6Cl945j09LjnBtbqwPOzYrA1KNvK8R+bw4mqQzb0JJMr3kH7Z7ozvvspPgo7ubKdO3DN/Zv4Zm4f8/Du5HSmiPirjc95usFNhw5leJMW0/jd+n4BD9wdHAaL0kI8x7pwJNF8CmHYbHOQ+NAt8cwp/VIVYFR/7iKiYhsc3wa5wUteTOEmFo5qx7eSXiGtj1Vg5/3ha2Wkv0HwV0bKoAbqo+iYqaY0jM1ShBdgMLAADeUH7MIhzf18SUyY/PoPSWvMPOceGGxa+fIehC+9WF0yMWwIKiWsRHbJxjyLcmBmBdz7qNpgnuUk5rvGBsESUfHe8RSudSooHX7Jc7afGig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2t3fYwWO1scuRS6YJKDQ1102gGOI6/ro58NZqc7rr3Y=;
 b=TtBTZ64MD2Om2FcetHtlNKvO4cJx9bEaKudS1aJ8yHlC3We1v4wiFbrQbRaAfrwzXwyWWOySSEFvsJ02ZaIN4k6wJZ/5AV4w9U2Sjx/K+JwgRnNh87Tr+EBGTKIUm/JUnFFtJkTTHdfR4IVqrr2pvWEk5oc0/AMSTSJGOqJw1ls=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS5PR12MB052986.namprd12.prod.outlook.com (2603:10b6:8:47e::11)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 26 Nov
 2026 07:12:01 +0000
Received: from DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48]) by DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 07:12:01 +0000
Message-ID: <ef4d910d-71c4-491a-9430-d882d3be7e4e@amd.com>
Date: Thu, 26 Nov 2026 08:11:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] EDAC: Add Xilinx XilSEM error monitoring driver
To: Yazen Ghannam <yazen.ghannam@amd.com>,
 Rama devi Veggalam <rama.devi.veggalam@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, devicetree@vger.kernel.org, james.morse@arm.com,
 mchehab@kernel.org, rric@kernel.org, git@amd.com
References: <1795313124-2138932-1-git-send-email-rama.devi.veggalam@amd.com>
 <20261125154828.GG2156781@yaz-khff2.amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261125154828.GG2156781@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::17) To DS5PR12MB052986.namprd12.prod.outlook.com
 (2603:10b6:8:47e::11)
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
X-MS-TrafficTypeDiagnostic: DS5PR12MB052986:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b034d8-1569-43f6-a6a9-08df4b8c9137
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|6133799003|22082099003|4143699003|11063799006|261022075727099003|56012099006|261021121427099003|261028144727099003|261009223027099003|261102123227099003|10067099003|261026121527099003|261026140227099003|261022113327099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	pLURXl0GQ8sxdAnTqmR1gicvc2KsH325w1dfC2O68lDLBG8cQqDtTheizDNhEtu68ZKaUGioRrvpooemVAw+iu/NpwQraDBhltpW/Ba3kyuwmrX9UmOZKk6CeMMnZaPA9F1bFzMNdplwPmeSyeOnx8oHyOLIo+jDUvvPTbtuqG3yb/+b9bK21B9/RLck1UNs7gjAgwcNQ7tTFUuSrtKDbbR+/9I024Q6QFvG/UCmuXpHzeBh1X51emTwXTk1sUfGfI0vSZPkibXfA0a+ovJy3z1VvbYmEZ0KupzeYdfhZuSjscH2ivyKtIcLsinckAtddB24z/8DynDS6jJ7LXwjykscfizXydw2vIVQ4LHMIPm1T6BH0LT50ZbcbwXo1oxMO7+zO8/gP3n5OnTCa58WGwRT6of/BjmIIZDEirAM1Ec+0eIo6QIebtyIOVKfsB32JBx8HdKM8v25nuqh4FpHZhgK46CxPM3fQuzd+cZEpdagQRP/qeW/HG6Nth63JrJPEZIzRVKjj/xToO65vIp+fXRKPM1PbaOUYZaP+eOr/k5iatC9s9unPm/R8sm04JC6/3pfb/7T0wemeS2zT2Jhzw/6yYzWQto3CqcoNsSNBE54JBp4Rm296MYFGxV+Tqvk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PR12MB052986.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(6133799003)(22082099003)(4143699003)(11063799006)(261022075727099003)(56012099006)(261021121427099003)(261028144727099003)(261009223027099003)(261102123227099003)(10067099003)(261026121527099003)(261026140227099003)(261022113327099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkRPOUZXcWU1SnFmUjAxVURrS2NpSVE3RWNacmdJdFdWYkRpVXBWYzhZTUFX?=
 =?utf-8?B?dlZTTDZaVXhzeXlBRkNrNmlyVHBRUEc4L09lcEs2aW5RcUwwMVlHU29lSjRh?=
 =?utf-8?B?KzlQSmZKaElJRHUwL245clUyTnV0aVdJTnNGeEJHbjNodUpjZkxOOXhQd3JG?=
 =?utf-8?B?UmJSV1gzR01WUGFpOWlZM3dhb1BVTjFmdk9nSTBySW43RTJObkJGamZhbWM4?=
 =?utf-8?B?MTBMemZCT3o5cVFyZFdSK29ZNnlMWCtFVDNsem1iempKYmNkVlpidkh3eTN0?=
 =?utf-8?B?b2J1eDlvc1l0d3ZmV1lLOHBjU05zdjlHRkFOV0JQUFVrZTRUZkwwVlpaTjBI?=
 =?utf-8?B?VmlXL0xxYzRvMXFJUk5kbkVEVjJKZGFWZUtEOFVEdXZVajNhd0pJUGZyZXBh?=
 =?utf-8?B?SUFTWGlsb0RUMXZuQmJMYjI5b0RWOVkvdlF2MXk5MlNTQ1ZTUzIvUGxOdjNY?=
 =?utf-8?B?LzdTbUZnZlNTZmtpempqQW0xTFJSeHF1aGZsTTk1VExIUzhDRlliRjZzWit2?=
 =?utf-8?B?anYvazg5T1N6Z3lqenFad3RKemxRM3VYdDh2YmR5R1Q0VEhjV1VUMEkxZXI4?=
 =?utf-8?B?Q3lYd25YaGtMem5icWtFVStaNDRaUllidTdPY1ovUnhzOFlMSXYzUFl1TWtl?=
 =?utf-8?B?R2ZhNEdaMzYxUnVQVjVwSkR3N3hKN3VsMDduNzd4TW5SNWxNN3VmL241U1FB?=
 =?utf-8?B?aVIyWkRrR2FpUGpiUUpCRVl1ZlJVY1ZqU3FlN2dIdjMxbzNicmZMeHVRU1Fn?=
 =?utf-8?B?dkZPWWZHL2cvVmxZQlpEZzZvQ1NCTDN2bVlqdk1henI4NWhvZmltRklCcm5k?=
 =?utf-8?B?Nk42Z0FyZ09HcHZZTm9HMTAzdHUvQVBQY25teW9JYTN6RXVobXVOV0NEOUk4?=
 =?utf-8?B?UVY2YU43a01YQ1Qxazk4ZWJxc3RLZTl3aUN4ejZENCs2c3ltc01YZkRRTnNl?=
 =?utf-8?B?K2hTZEJEZDQySGVQb05YT1hnMGVCK2lzbUFrakltcFRxY2ljbUtQQWtTT2Ro?=
 =?utf-8?B?OER6Njh1bk81WjMvZE5LMWlJR0pqbHQxQkhhNTJ3a3ZSdHEwRFpMbU1kMHMv?=
 =?utf-8?B?RHltZzJoNkgwWnY5cjZ5N081WVk4QXZPUnYxWmplaXo2eWo2bzNMMTlhbnBa?=
 =?utf-8?B?elpYblV4VnIzeEdZQ2hueEN0dHdFVSt1WFpVN2d3SmVSdm9CbUI1cjdCK0lR?=
 =?utf-8?B?YnZIeEJmYjEzT3drVGdNaDdwVUhPQ0pmZFlJUzM0OTgyMkN6ODVpaDJTaEpI?=
 =?utf-8?B?aW5vOElPdCtlMDFFQlMxZzJGdFJnMWJ6U3VOOTFnbWhJRlJqQUpyeGR0K3VP?=
 =?utf-8?B?R3BIRVBuc1l5NnB1NlBsZTdUbDJJR0l4dmVTUWNuSHZmYjR5T1lQbERPM0sr?=
 =?utf-8?B?OGRIamVjK1RNTjZ6enJFVGkwZGpkcFN0bWF4SHF0bWN1TlpWaFJpTXlBQjZs?=
 =?utf-8?B?Ti91N2I5L3F0bDIwbnN5bmYxTzVzVmlwVFAzU3pmblBVS1JsWXJoN1hERGI4?=
 =?utf-8?B?dU5sVDYyNlYyUEJtdjk3a01sRmlJWUlpTE50THdVQkx0VUpXRzMxUDJDRGJR?=
 =?utf-8?B?R3cxMEMxTmsveGllYTZYT1dDZ2h2SG9JeTFPdE9wRkN3cG40UDdodVFCOWRR?=
 =?utf-8?B?bTR5TmsrRGRhSVc0NVM5QVVHQlZlSXBGazU0Z1luKyttVkdsU2RsaVU5RWRx?=
 =?utf-8?B?d1IxUi9xM2lhUWJTM0RUZDI4aWpmV2J3Z1Y3YnlVNGFBMG5BdjFVM1IxNGtu?=
 =?utf-8?B?U0ZlR05oWFFzZmEvajRvbG1HdmJ1dDg2KzVLRHFFNEtkYlJMd1RiM0ZERTV6?=
 =?utf-8?B?YTkvOTZuT3dyUHFqOW1YbE4yamNlRmhJZjJkQ2o2QkprdzRhVnZxak1ZZ3oz?=
 =?utf-8?B?YUwyZzNVcTN4Yi9vZGJkRGVJVmY5RlZYR0V1cGplN1V6TjlBWHQ0dVl6R00r?=
 =?utf-8?B?UlNjZzU2K0VRSHpUNGVzYlhIREhxMm1PL2tEcmFHdEE4dnZ4djhUUDA2OE54?=
 =?utf-8?B?eUYyKzZCL1RNYXllWkprVUw2ZGdHTkp1dVJ6VDJHS0FWUFZHdU1nNGUzUDMv?=
 =?utf-8?B?MWpxcTVGNkNQN1RFWmlWZXk2MmFzMVJndGpCRnNFbXBVTGMyb0JRSjY1YVE5?=
 =?utf-8?B?NnE4bWhCWndYMFBvK3orWFIrU0kxRmxpQ3lxeGE5ck40bXVhYngyZTRORElQ?=
 =?utf-8?B?NFNkbTcybFRRL1N1VzdtWkNlREMrQWtmdS83QUdmS1FocTdoemFDTzArUHRE?=
 =?utf-8?B?RGhXM3ordmtySzhOZE82TkdYZEp1NXZZckVDdnYxY0JPSTZ0d2t0bEtzT1ly?=
 =?utf-8?B?MS9yVUtVdnJHUGxhNFgzY3VaZkhWVDRCamREWktTNW13aFpJcDZ4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b034d8-1569-43f6-a6a9-08df4b8c9137
X-MS-Exchange-CrossTenant-AuthSource: DS5PR12MB052986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 07:12:01.5083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hjMA/fOznvB+U3nO+4vbSxpKTKnyOoDoyxLc5WIvIzh9O23kgzHNHADSnu+ASFk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605



On 11/25/26 16:48, Yazen Ghannam wrote:
> On Sun, Nov 22, 2026 at 07:35:21AM +0530, Rama devi Veggalam wrote:
>> Add a driver for XilSEM (Xilinx Soft Error Mitigation) on Versal and
>> Versal NET devices. XilSEM runs as part of the Platform Loader and
>> Manager (PLM) on the PMC and monitors Configuration RAM (CRAM) and the
>> NoC Programming Interface (NPI) for correctable and uncorrectable
>> errors. The driver reports these errors to the EDAC core and provides
>> sysfs attributes to control scans, inject CRAM errors and read status.
>> It is a separate driver, matched through a single "xlnx,xilsem"
>> compatible, because XilSEM is common to Versal and Versal NET. Only
>> monolithic devices are supported.
>>
>> Note on CE reporting after a bitstream reload:
>> The PLM clears the XilSEM RTCA, including the CE count, when a new
>> bitstream is loaded. The driver reads the CE count to find the CEs that
>> are new since its last report, and takes a count below the saved one as
>> a reload. A reload is not detected if the count has already reached or
>> passed the saved value when the callback runs, so the CEs up to the
>> saved value are not reported, and the EDAC CE count is too low by that
>> number. No CE is reported that did not happen. The RTCA does not
>> indicate that a reload happened. A complete fix needs a reload counter
>> in the RTCA, added in the XilSEM and PLM source, which the driver can
>> compare. This driver is not changed for it.
>>
>> Note on xlnx_unregister_event():
>> xsem_edac_remove() unregisters the event and then frees its state, which
>> is the normal sequence for an event manager client. It is only safe if
>> xlnx_unregister_event() does not return while a callback is still
>> running on another CPU, and the event manager does not guarantee that
>> today: it walks its callback list from the SGI handler without RCU or a
>> lock. The missing wait belongs in the event manager, where one fix
>> covers every client, so this driver is not changed. A fix in the event
>> manager is planned. Until it lands, unbinding the driver while error
>> events are being raised is not safe. The probe path is not affected,
>> because the event is registered as the last step of probe.
>>
>> This series contains:
>> - A new devicetree binding for the "xlnx,xilsem" compatible.
>> - The firmware (EEMI) interface and the XilSEM error event node IDs
>>    and masks.
>> - The EDAC driver, with its sysfs ABI documentation in the same patch.
>>
>> Changes in v5:
>> - Moved the XilSEM binding out of the Versal DDRMC EDAC yaml into its
>>    own xilsem yaml, with a single "xlnx,xilsem" compatible.
>> - Moved the driver out of versal_edac.c into a separate xilsem_edac
>>    driver.
>> - Limited support to monolithic devices and documented it in the binding
>>    and ABI.
>> - Added the xlnx_unregister_event() and CE reload notes above.
>> - Added the L: linux-edac entry to MAINTAINERS.
>>
>> Rama devi Veggalam (3):
>>    dt-bindings: edac: Add Xilinx XilSEM
>>    firmware: xilinx: Add XilSEM firmware interface
>>    edac: Add Xilinx XilSEM error monitoring driver
>>
> 
> Hi Rama,
> 
> Did you look into the "platform driver" idea?
> 
> If so, how did it compare to this DT solution?
> 
Look at this.

https://lore.kernel.org/all/82ac95c0-2b11-45df-a6fc-c0888d58b2bb@amd.com/

Thanks,
Michal
