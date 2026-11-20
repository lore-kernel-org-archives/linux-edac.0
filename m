Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795189438;
	b=y1T7uVWPZ06k7Nosu+rDOn3re4CBTR/sPeWGumFUqT39ec+unVM+bm8w3fMtc0AozuWJ
	 IcxBlZHiEja6GOnf7XsRgnV/72gOmFYcGNa/qtHUl8eOrAWXwQzfTw/Qu3e64tIGG9P2+
	 w4mfyfKk8l9j/SSy61vcfc8y0aVwFCddmoKy276VzXiBD26CaNc0beHXXYnzDPU11QVjr
	 BXGddiogrfBYoWW1Jm867upqxV0AuuLHxvvjyspgXgncXk7xEtc08zijUqx2wt3vb13W9
	 GBf03Lo6JwmFR9PhJYxUMyt029hHa5gPKHCnwHtDw/glihIGwlzXdWeyVri6SV1CJRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189438;
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
	bh=qwHxGAo5AsifwepmU8qO3sN1WF9x18WK1Xjv7mDSZyc=;
	b=t3Nnd4b3wTCU78I6jSqX1w+HVux1LJCm4LNpqB1NO8KeenniRb5WCm02fw8aoYG9jP6T
	 H05RLHbY73/PblewnK+VdOq1ORdpCKH8Q3CxBGODbw/9WYGdgfzjz6o0jQY+jNSWRwnaS
	 E4/Zx1II2waK+N0ms6ccVCZ+qro6UsM02zjC7mzGi1fnro0Qjy8/kQ2nbDY/TMmV0jmuN
	 ey69c3ZaBsVoijjHNmzthnOz5+21soDj85jkZnJIBIYVM00UNxTN9zmjjaw5wICV3k3zg
	 Gfwpv/GxIOGMFYu2nVzZQlvxwc9iodwwJvcYRnWfpTaRw47nTwn4QaqXhG3PvKzF7MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HXqMByN7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.40
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D598606A320;
	Fri, 20 Nov 2026 15:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D598606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HXqMByN7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VE/UB14pae/1ruvECPs/TGd1FQveGfTz2oay5nYvOpmf9IbJ8jlmt7UARlpHObz4csCpUHxo5VUJkECYIOmrPuDURwVaIPtZwIGdfzlALSjEB0LlatlnWyrE4SiHazKNouGytwztyPJ7QYT209PIDXMBgSJO/ZLdqZb1ZMRcnqgZc8vTt6KKq/1uOlv9v4YXVTEU3jJj2eyOqIjtvYk5ltb8Po0JUNIAuEmqhe+yAKpTyd8zmHFKWbuxYWXZROw2YtPBHgfCXAgUCJynB0H+YO/EiB7ORCNb5qOrBS8iXYRfZU4OQq+SMxWso0kuHOdbNji4WITCeUgxcY1hkcBX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwHxGAo5AsifwepmU8qO3sN1WF9x18WK1Xjv7mDSZyc=;
 b=Fl2Ce78372P6opqiCau/CRLH4k5ndZrD5n0vOJ/XkmcOAcx3TAMbMm1EJ9IC4je7GXYJ2svaaJSzp8qEoH2VNG54pMMt9eP+NNShOhtmIQg8s1MoJp1v4v3uBiu/wpOuQJfuS6W+kVbMjzBm0YMCPCYjurBO8ivaLQxl8EZWRDFjgcAq11FPOJCbBzH6ULOibZS2AxxvccKPN0Tb0D5M28UfREQDQ5/gLpgzdctLiUHyUiBCFyHtUyNkB1U73hd0jBVZOL0HvBjfPGANXP2N+FYdaBXbjC/8OabZQK1Qx2lFOWjYufxFOYL0gxhh+erlQWd/ocwfCE8hIEf8llZ2fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwHxGAo5AsifwepmU8qO3sN1WF9x18WK1Xjv7mDSZyc=;
 b=HXqMByN7R6SeQNgn6qW5BSYn6IouAQw8qWh/au8QhtrbY84rp5jh4/XNqHjkueMMsuXhewyTZWoZ/1YszEV1fF/Zug6A2jzBjetKuccfSpo0ooPXm1p2xuTVQKiqkSQupvkIlNxDbYAm/HvqwzFncNfpP3nn9dQU3on7H9AoTBg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by PH7PR12MB5832.namprd12.prod.outlook.com (2603:10b6:510:1d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 15:43:28 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 15:43:28 +0000
Message-ID: <cebfefd1-bcca-4245-83f8-fc4557c1da62@amd.com>
Date: Fri, 20 Nov 2026 21:13:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] EDAC/versalnet: Add bounds validation in
 rpmsg_cb()
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com, michal.simek@amd.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-5-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261118142213.100581-5-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::18) To CY1PR12MB9697.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|PH7PR12MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: e110de6f-ad92-440c-4e23-08df471d0585
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|261009223027099003|4143699003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022075727099003|261022113327099003|261022105027099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	rkcoxCGUdShbupzB0+34u6Y9iJkhcJlTagBP6Ie8kSYwF3AmdXjne+VWKg2oVH8F251+qyjrTbkYVeBHXNsQzHLo1jC635i5jeBV+CApnsJON1Q2PHMcy/SG1Z1hz3OSnEK6zrYS1VqK7wglTDkCVjMAPuGesg8XIMBnQvSDFBH+hA0joygoi1jcTICv715e/xSCVFhmuVHe1nH8QE8ZVh5CXukUGrjGmtr3HrSvpRpSAxiCnOrfrdbjICSW117ahdMXxEBVPXYpPehFgLNqceFWcCQ3Z4UNaIVMQ81lZI0OZEMJ8cbbaOCyo+1TgsADC+n/Y8JHi6Ki+hFBtful010E7dOSku/VrwCXB7E97y3xQn+NCJSH40FJa2Pgdseot0oGrF6BdQJMtOoVXEynOEccj7HqQWUrYEpJ5MjUFYiGSXQ6fbveH/tdroGszo8vFX7k4aAL3WKQLhGo7keFzBj6ZYZsBBMg8kvyvnHjoopVxF+JVJ8Gk1XAygUUR4C3fizScysntMyh93+eeRZoXyVEStEC2QpPLKv2wca2Dsk2je4IsqQrbQPeR85LwxwK8McE5xuLe7Y4+nHBiaMr0q9A3GIY/3LHKjjwK5bon6x3W9DVfk4js1VdGbPSLsVUqFV1d4FUT5leyI+Gwv6EQZwqJWgwuaJyyB+42OAcVmE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261022113327099003)(261022105027099003)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emlYeFVwSG9Xa0dhZG44L1pNWFRXYXlMK1hwdUV6NnM5N1hRSjJyU1podkhL?=
 =?utf-8?B?bXVvd0dzQnZKczJCVk83V090UVByVVdZbUUyQmdVZWNVWUEwK1RlZXFJaVNE?=
 =?utf-8?B?RUQyMzA5eFMwSFJQelhDdFdpWHNheDltdHA0RUhXQno5S2ZJeTRvTGVieGE1?=
 =?utf-8?B?dytyU2tkQmJvckZDL21mNlBST2lEVGhTMW9XQnJPR3J3LzZzcmw4bHpmWHVQ?=
 =?utf-8?B?OFNCUGIwSVpwV1hmNFNkMXM4TkVKdEVoeUxPTlJnbU9wK25SY3FPMU9TTEVk?=
 =?utf-8?B?ZkVhVTdtTEFDZTQ1TDlHRHA5MnRHaUxkVlBqWjAvLzRmRDVmRU1BM0ZpenB6?=
 =?utf-8?B?ajRDR3N6SGE5MUlKYU14ckdKZTVSRlpYU2dZOVZEZW1MTUYvNUdXQ0F2SWVa?=
 =?utf-8?B?MVIwd0NQcm11eG9sZktPSGZxZk5wZC9VL2dJNHNWa1BvcG9SV01YT2YwOThz?=
 =?utf-8?B?RmkyM3FGRE9SV2dMU01TYVFGdVV0YlFEcmFtSVk4eUNtTExaZkp1em1kTGt6?=
 =?utf-8?B?bDd5c0FlVFlpWXEyTzY1RGVVaElTU1lUTWdleDdvNWZ6ZVlHKzdQYWllN3ll?=
 =?utf-8?B?NE82ZjFSbTNQQWVPZlZnaVI1czF6R2MwY0ZIQjdNdk5laExQRWl4MkhqNDE2?=
 =?utf-8?B?QnlJaGlRU2ZwK3FlUjhDQi9uMWpIOGlMN3RtTVhFdFJWV0lyQWp5U2lSNlZz?=
 =?utf-8?B?c1lPNFQ2QnRyQ2Rad2huNjU3K2xIL2hCbUtqTWRLc3JGaEY2VHNJQWRUMnhG?=
 =?utf-8?B?U3Q4c0NxN2oxR0M0YnYwcmR0V0FPdkhZRDhIa3d6RG9BSDd1Q0U5MzJWdjJH?=
 =?utf-8?B?UHRpcmhwcXRUOEJ1VHdBVHlGOVo1c0lzMG5SRGNwZ3hwMUxiTGdpWndaU2NF?=
 =?utf-8?B?VnB4L3RQTW1IbFJZQmdja1hBdi9ybWRma3BUbDNBMTJLQUF1OXQzVnRMUTZU?=
 =?utf-8?B?czlTUDI3QW04Y1FxNFg4MEttYVVVbVp2Ky9LaDRlQUl0M1FpcHJIcmpVVXRz?=
 =?utf-8?B?WnVGc2lRaUE4bTQ0L283TnVFaURteFVQNkVtRlp5M1BycGNSc3grU20vYW04?=
 =?utf-8?B?Z2Jsd1FiMkNLWEVTc2VTTjNQUnBreFI4UmM4MFJPd1Mwc2c4Y3BxMWpXempK?=
 =?utf-8?B?Q1NwMWtkUFhyamNJWXJNRHZub0lYbmcwOFRFbWs3ckc0UkpQUTlkMmdjOGhk?=
 =?utf-8?B?eEdmd0xkZ09ILzJTL1ptRXNvaTdFQmsrenRSVnVZb2c4TTJCR1JqTGZwVmo3?=
 =?utf-8?B?dG1BNnpHNGVRMGltMTFNMlh6TnFSOW54NGI2WTAxNjRQekw4YVFNOTdrY2hj?=
 =?utf-8?B?Qmx4aFowUWNJdVB4WW82dmk3R0RvRkRVM1g3VEdFRkk0U1dnYVhtVjhUeXNp?=
 =?utf-8?B?K0gwclZ0MlNMV0grcm5KY1pncnUwY3Rrb2lqbjFTU3UyMEE5QkY4U3lKZVho?=
 =?utf-8?B?dGVTYmF5VTRISjBmR3RpSEZObHBXa0JwVVovRndzOHlyU1RFYi9ERzhmdjJ1?=
 =?utf-8?B?V2RYNlNSQitRM2V4TldMRHlMWHVaK29ldFZUWEdaSG83RU5xTWNHSkNWRUVK?=
 =?utf-8?B?UzllUGtoeXBzTHBaTmtGYitDdktGVkw4Y01DZnpDSjA2L1VYMFRjbnRucUE3?=
 =?utf-8?B?ZFdRUkdYN3ZDdGE0eFZkaEJwQU5QSGJIUlFKekcwMnhWZnJSanB5SEY3TlBW?=
 =?utf-8?B?Wmt0bDVHZHdqTG1CVk5GWGNIQlhqZjZsMkxFL0xLRXFhTWJhMWdTc1BmVGc2?=
 =?utf-8?B?OXhyb2xJNkpjZHZIOUVLb3QwQlZ4RU0yZGd1NXhIcEZhZU1YM3BzSG9uWDdS?=
 =?utf-8?B?Y1g0aXBEd1lLV0FUeVRBUDBOZEU5TUNZSnNYNHZpUldjK2xVNm9sOVEybnhN?=
 =?utf-8?B?NFkvcG5MRXNjbFFaYlVkRWZIRWtsczZGWGh4dGZGQkhZOFQzczlwODJNcG9l?=
 =?utf-8?B?L1o4MHVoYVhab05xak1McGh0YVRwRHFVVmpNK2puSURycHpzK0JoRUwwSXNX?=
 =?utf-8?B?VWRYZWZPSU1WTDV5eEdXWHNUQy9lMXRmbldycGhoc2wzdko1YTZuYUM3eE44?=
 =?utf-8?B?WTY4d0pFOFZoNW9VQ055QWNoUGxSOU5kTVFzb1BBSTFndHlvWFNCVWxlbXVX?=
 =?utf-8?B?TlZ6NU95eDU2ajB1OFVXS3BBbFZweGhGTUZ3alJORzhoTGVhQ25SdDEyaitY?=
 =?utf-8?B?cHlLZnpMQVgyY3Boc05kWTBtOXRWdStwdGV4bFRXK0EzcEtEWFNNbnRmdU16?=
 =?utf-8?B?SE1ibEk1UDZiVWR1QXRmcHRpbVNFU3N1UjErOFk2TU5GajZ6enVKUHhvdE1I?=
 =?utf-8?Q?kBov3TbsLyN0t5L/ow?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e110de6f-ad92-440c-4e23-08df471d0585
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 15:43:28.4099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIAyQHqXj+QnDlnZJyAoc3YFe0WB184ojcZGNEezWOaspZ7eX9ALww/EVWuHqaDT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5832

On 11/18/2026 7:50 PM, Shubhrajyoti Datta wrote:
> The firmware-supplied offset and length values from the RPMsg payload
> are used without validation to index mc_priv->regs[] (REG_MAX entries).
> A malformed or buggy firmware message could access past the end of the
> array, corrupting adjacent structure members or kernel memory.
> 
> Add bounds checks for the offset and length before accessing the array.
> 
> rpmsg_cb() supports messages split across two RPMsg callbacks. If
> validation fails for either part of a split message, discard the entire
> message.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---

Let's fix sashiko reported bug.
- [Medium] EDAC/versalnet: stale part_len on split-message failure in
   rpmsg_cb()

> 
> Changes in v2:
> Sashiko comment
> "This is a pre-existing issue, but are offset and length validated before
> being used as indices?"
> 
>   drivers/edac/versalnet_edac.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 2d1417135e42..0364648d91a1 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -607,6 +607,13 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
>   	length = result[MSG_ERR_LENGTH];
>   	offset = result[MSG_ERR_OFFSET];
>   
> +	if (length > REG_MAX || offset > REG_MAX - length ||
> +	    result[TOTAL_ERR_LENGTH] > REG_MAX) {
> +		dev_warn_ratelimited(&rpdev->dev,
> +				     "Rejecting the faulty message\n");
> +		return -EINVAL;
> +	}
> +
>   	/*
>   	 * The data can come in two stretches. Construct the regs from two
>   	 * messages. The offset indicates the offset from which the data is to

