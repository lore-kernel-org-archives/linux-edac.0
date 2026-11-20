Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795181990;
	b=lAwwK9e3WZsdPWxAMFA+t1ayIjR/AMqy4/e/6wfBJhZEdEF5OLAc9ptJjaIVpcyxUlp3
	 TYOoD3oY80jnw1KX5iRZQBta6a1RkSQQvc5mLbKg+LargRFeakwiIvCcGJNhrqEcXV+YG
	 2H3rYBFgY4N1WJqtasfdTL/RKGVOV964kZuHv8Uc24KWpzSsb3AxeT83zNjK7zeLB3iuO
	 1Hv8Esu1iin8DDs2jrw41+NraIB2OpzJYpbMtt9+9zMNM7Xi16tW3tVHLBM3RcvOQVmB7
	 wk5bQRfnNT/gxmyGh6tvjEe3wzddFTsFWHPY07vNoxJOZveL2EtyxLBrsfSK8AZHk/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181990;
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
	bh=9eX+5v4KHx+ifu5D+CqHQFW0RTv3p4rAwJeVN92//cs=;
	b=wu/Li3wgNnvEO+uP7BKAVOWv9k2AzO8YGLfSj7LC/qiBD/UEbg/eXrtio+apWh6qBVpu
	 UiRPCmqhtRY2CXncZMt8dW8DxnOASPTH1rb/q/drUgJHuAF3oHVGWnD+Zw8HwrmvQGww+
	 2+XSYxJD/wZThqNGsxZi+95IwMpY809fER+cDclCteF1NSt5FytxNjjR3QeiCqcgU+EVV
	 7IcXec+i4Db1zr6Ap0a77L46Ou10ckq3AOUDE8j1SUl5yfNWaW7GMognTIPfOSSpfS1cI
	 1OpRG7iN+IHmSgHLmVixc9975qL0Xy+Rwfhkx7+Bo7a7aMRAoRBW0sRveQGyU3avUnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="uURtPPw/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.9
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2481606A320;
	Fri, 20 Nov 2026 13:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2481606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uURtPPw/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBjgDs3rOC+WZlyufFviP+xZfD53IjqSYZGW5Sk5TM07Q2ItAarzz5fzfbs/LqDf6Xm3EaTBqy3yH9q3nVSUyxTkCma7AYQUJKUbr86z6f8rIXUn/P40rCMlmMnNECM/2xnqyxgZdL4K/qqW0hXpAg/2eobFb7z1YtiYVFIK30iaiJoa4/HOkCrYNLUl9HeVUbrmFfGyIWhbT/6RM8SwdfGrBTbxlLJxZPomnF6sFv6wxnFRkTsmtTzQTnwlbTCph9rJDu8kydwtPxmpw8nO7XacSyBqVXNnjqHUA/iOOy/3ienv7J1TrCU9oDYzdI2LmZKuV+laNX3mosif5su29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eX+5v4KHx+ifu5D+CqHQFW0RTv3p4rAwJeVN92//cs=;
 b=M7Mp2O8XnmaoY7de6Gub8aj/gEAX+4ceQ0upLiwFV5Ay+Hjt4OmwesWZpIaFLs4PLwaicbAxUgL54WDWJDa8rk6PU2Z3gGeN8AjGy/j/c1XXuVZ9EOqHGwvs4Exj6Rduha1EZ3dVXq7n4H+264IFusjEAGY1AkIDfhF/WnvXDB65Xw8w2SS+HOOe2t9pTVJh5qWVkQP2U13D9uZvlyKQbI+FieP+BH46LsI0wR91zraG4jrkSdCHvHwni13gN4v2UDDyX8a+4h/NdIdYADdmyloO62PbDe7dtANx6yeRsirYk7M45AD4kLWTnJCStCqpcpTb3wlXK9WD69oHOaKJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eX+5v4KHx+ifu5D+CqHQFW0RTv3p4rAwJeVN92//cs=;
 b=uURtPPw/TbBSj3i5fJzNCBigc1eJG44XfB8heP4TT9qI3cGYs+oHBdB6jI5QpJndfyuJ7vm9u9HFGJuzrV1cF0sm/KoEPBSpGUvvsFgxmRTLPc4M0pWw0st1ksR09FqFT0/IjPCsmYLtU8ggkUplr4Xy8Ql6/n0KIOFpOLyZEZY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SN7PR12MB7417.namprd12.prod.outlook.com (2603:10b6:806:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:39:07 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 13:39:07 +0000
Message-ID: <a25ac945-a2e4-44a4-9da6-948966db62a3@amd.com>
Date: Fri, 20 Nov 2026 19:08:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] EDAC/versalnet: Fix device_register() error
 handling in init_one_mc()
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com, michal.simek@amd.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-2-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261118142213.100581-2-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::8) To CY1PR12MB9697.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SN7PR12MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: 482fb5dc-6ba0-49ea-9e9e-08df470ba655
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|4143699003|261021123027099003|11063799006|56012099006|261022105027099003|261026140227099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	/9ZK9FqdFBA4XTz3qoV58DcNgWUnjKFCYnuktsGJ2TUfLRFm/EpP/kPqdVrzs/laTtunK6KtNa2IxssMmP4d0D0to54zsFsUyUpd1l4+/vzHO0+jMaIs99WSVIqZebBsGaP5do94RkwrphtnSpPOvsgEPTEZfA/JIHarq1OD5Z5+ZMKvPwWLB/3+5n/+Evsi8Y0FDxiOc7KsJUl7t6meCsxrQBJpXAwK1u4VqlkyWDR32sbJX9oBGaw5ioCgKwOcG69Fx3b3QbLdSSI+VTqgGvf386dVNsWCoiC/5AvLA7rgIFJJvKK6NmmZNdnbcBtryeDSDb/8Hu9lmtxO6OzDxMdf+17gW4d33LueIwRJzu7cu5/jMB1nlMk8a40kUvZ8IrFLlJBuTcFlJRsnxHF1/LsRi8mbP9fMAMM/nVU2WcPyMY4utZzcraf12KVGa7nr9QDLPZh3qPcAhffF1lBHeANeIb3pI1bgha2mOjxMi7i/Jg+9H4E6enrxnVIm1+PQstRws6TzpRQ1irpxZ4G2HlPE819iO5DE+GEgZFaiMNZJhFTybq/0am8iL//RzB5Egbr3K1j6YobiFZPGu3LVfy2z2fb2uiFlFoCcDlHM92ux7/nal7Mozo5/RKhY5bUfnJBFjA3CEQmE9rJVXHVAHINEycjOSMJYzgDUxMe8c9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(4143699003)(261021123027099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUxTSFBHa01Ha1hFUWdGbWdFV21uQnVMa3cvMHdYSGk0UkJMd3pWeC9IR3U5?=
 =?utf-8?B?TUNWVE9zMms5cktwdHNsMWl2UjhjMWdBNE52REFmNUQwaDlIdCt5d2Q2ZXNz?=
 =?utf-8?B?TnMyVFl2RFIrdmg1cFZoaldlcDVkdjBZdkJ4S3p2cTRac2RnS2pJR01LVjh0?=
 =?utf-8?B?QmlpK3RVTU81U096L0RYVWFmN0l5c1EvZmQ1VmU1dk8yVWFud2dqRis3cXBL?=
 =?utf-8?B?WlVqL0srbUFUYi94Vm0zR05uK29PSHU5Qk5FR2k3WXJydXJSVjd2bkVCdTZ3?=
 =?utf-8?B?a1NtcEd6NmZzWk1HbEVta2FJU0l5dSsrWGRRSlowRnBxQjFGdWdyeGdiVEhq?=
 =?utf-8?B?LytyRzFzNWVnLzRZM3FZVHdyRjZ5VlIvd3VhTEJrWlZEWnp1VW9IbzJ3TDZk?=
 =?utf-8?B?LzhMR1RMVmV2Ukc1NG95UHllMnhOLzRVb202dTQ2d3gybVByMTZCelRNVlYw?=
 =?utf-8?B?NFpwWW5FNDROQlNrVEo3N2xsS3NrSDRaZVpFcGQzUjlNdW00MG1RVUhsVjg1?=
 =?utf-8?B?Z3dsUkh4aHk4bHpSUjBpT0ZPZEtMb0pqYUxQRkEzZUxlOGdTckhQdWo5d210?=
 =?utf-8?B?SGRQOHY0d0NnOWJxUDVGR0ZHdjZRMEN3UjVTK0J4LzBYUjNMOEFVVXNnbk5L?=
 =?utf-8?B?OER3WkwvZHZ2TXNLQWxkZDF5WG5PN24vV3UvOGgzS0xHeU81L2QvVU5GZkg3?=
 =?utf-8?B?VjI0em9vNVFMemNDNVl4cDg0WHF4cDR1bXlpV2VtYWxPVkpYMWFSSjV1anFq?=
 =?utf-8?B?V21mQ094cldaWlhvVVM2TVZ3eGg2YXh3L3YwdUdtVmwza0ZtRWZUTnBzNldJ?=
 =?utf-8?B?WXlNN3VzVVA0SzJ5Mm96NzFBbVZKVGY5L3pZV3JpcFZyUGh0UW5IN2VSdkRX?=
 =?utf-8?B?LzE3dllpNGNjczNGM05qaGpqVjBmZ3YvV2VVQTZwREkrcGRTY3ZMTUhwVXVs?=
 =?utf-8?B?MFBVZnZwczF2Sm02YU93cUxIdWFMRmRIejhoWFlrODVsRkZjeDdLM2R1anpp?=
 =?utf-8?B?VURSSk4rc3AxcTM4c2lTU094bVE5RFNzeERIU05XcXlBMjU4ZEVsNGlZZGJm?=
 =?utf-8?B?VDRCRHhhd2s5Sy9NbXg5VnNacjlFMVhadzlZRlY1OElGZy9NV1JqUHhsb2t5?=
 =?utf-8?B?TjVPNGlra2dWVndvMDBpYXRRYkFTUTd3NFVjMnlZNVIzU1hCYitEWDBVSHph?=
 =?utf-8?B?MW14czBaYlpFR09Jc0hmTDRJUTdiRjMzd2dTaFdoMzYySi9sWlhsVy9ad3JU?=
 =?utf-8?B?TU9XNTNwYTFBQmVBZmlXZi96V3piTGdyWVUyTUZTbVcyMW5sOXhvKzZiSTZo?=
 =?utf-8?B?NkpTVmhRNlZqTUdGTThYK1o3NDhYUDM4d0JENHhJNDEzeXRJTkU0bjVpa1dC?=
 =?utf-8?B?K2lRVmNvNGRvaHgwU3hMRkYzdllKckc0OVZSZUp6SjFBZnFPM01FQWRRK0V0?=
 =?utf-8?B?Zk9Pei8vbjlCYkQ1ZmlyL3V2ODFiUXVxWWNsUjBhdDEvdTRFRnpGLzVwLzdR?=
 =?utf-8?B?T1kyTHNLYXFuQXAvanRreGVBcnVHTUFqVE4yOE1oNFhYSlN6TktlL0VEL3pu?=
 =?utf-8?B?bHFTVy83aW4ydW54dGNxZXZwRVV5b1pHTTVPWEdqbWlEZWV3VGZHSDNpVFZ0?=
 =?utf-8?B?OFV1empnRmJwc0luRUF1SnRRQWpMSlZnTnZxcWRjV3JFOXU0NlJFa29RTVNE?=
 =?utf-8?B?ZFAwd2wzZ0Y5eVJyclJzYmt2SHk2WjBjNTZaMmorYXJwVkRMRTd2Z0p1bkZJ?=
 =?utf-8?B?MnN5NlRJNEE1MUtNdjFPYXhSZmVkbUMyZFBNMHJYVU5jYldYWjl5ZCtZclI1?=
 =?utf-8?B?TkV1MDJMOEVpNlVEVUd1bUFKZTl1YmZFS214dXdhTVRYbTQ5bEhUQ3VFWXhs?=
 =?utf-8?B?b3FSc0lHYlJQVG4vYW5odGdnSUNaQkR1TXpocXNnczR3aEt4T01KbHNNUWFL?=
 =?utf-8?B?aHpNYUhZV1Y2dm9OSDB0TURVQ3p6N0tpQ0VIK2htWkpoKzBVYzNaNkhvbHY0?=
 =?utf-8?B?MkdmZlBFQ2I0SFkxNTRGcC9DdjRRSitGd0hIem16c0thSmFZbVRyS09lY3JZ?=
 =?utf-8?B?cncrSXAxMWRkUko0WDl0SlRZYm1LSkljY1FnMi9YQjlta1hRTDNJV2NDd3hO?=
 =?utf-8?B?Vjl2VnBSL1p4N2wwSDdzV3BpbEVLeUFISWlaZGdSUmJBeW1CWjdHUEkzUVBr?=
 =?utf-8?B?TGU3dXM3ZDZGNG9Dbk1tdSszRDd5d1Q3YWxhajRFeDVUN2x5eTZDZGQzNW82?=
 =?utf-8?B?OWRMeE9BUGVvMVllSlBBaVkrbHk3ZjhmWFhaaUt4clZZUXYwVTBIZjdiUXdG?=
 =?utf-8?Q?PNUtoXdnrloldhQh0E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482fb5dc-6ba0-49ea-9e9e-08df470ba655
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:39:07.5777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNg8hc44SDme7e5nHeTnD7DhaiGRVMj43+ST3ai26U54ZmWi+efqe2rIyb2nYFfZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7417

On 11/18/2026 7:50 PM, Shubhrajyoti Datta wrote:
> From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> 
> When device_register() fails, it must be followed by put_device()
> rather than kfree(), because device_register() calls
> device_initialize() which sets up the device refcount. The matching
> release function versal_edac_release() handles the actual kfree().
> 
> To simplify error handling and avoid complex unwinding, split
> device_register() into device_initialize() and device_add().
> Initialize the device early so put_device() can be used in all
> error paths.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> Co-developed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
> 
> Changes in v2:
> Add the codeveloped tag and remove the non standard signature
> fix the name stack warning
> 
>   drivers/edac/versalnet_edac.c | 36 +++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index eae9fea60db1..89672d4d17c9 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -70,8 +70,6 @@
>   #define XDDR5_BUS_WIDTH_32		1
>   #define XDDR5_BUS_WIDTH_16		2
>   
> -#define MC_NAME_LEN			32
> -
>   /**
>    * struct ecc_error_info - ECC error log information.
>    * @burstpos:		Burst position.
> @@ -777,7 +775,6 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   	u32 num_chans, rank, dwidth, config;
>   	struct edac_mc_layer layers[2];
>   	struct mem_ctl_info *mci;
> -	char name[MC_NAME_LEN];
>   	struct device *dev;
>   	enum dev_type dt;
>   	int rc;
> @@ -817,28 +814,31 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   	if (!dev)
>   		return rc;
>   
> +	dev->release = versal_edac_release;
> +	device_initialize(dev);
> +
> +	rc = dev_set_name(dev, "versal-net-ddrmc5-edac-%d", i);
> +	if (rc)
> +		goto err_put_dev;
> +
> +	rc = device_add(dev);
> +	if (rc)
> +		goto err_put_dev;
> +
>   	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
>   	if (!mci) {
>   		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
> -		goto err_dev_free;
> +		rc = -ENOMEM;
> +		goto err_dev_del;
>   	}
>   
> -	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
> -
> -	dev->init_name = name;
> -	dev->release = versal_edac_release;
> -
> -	rc = device_register(dev);
> -	if (rc)
> -		goto err_mc_free;
> -
>   	mci->pdev = dev;
>   	mc_init(mci, dev);
>   
>   	rc = edac_mc_add_mc(mci);
>   	if (rc) {
>   		edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC core\n", i);
> -		goto err_unreg;
> +		goto err_mc_free;
>   	}
>   
>   	priv->mci[i] = mci;
> @@ -848,12 +848,12 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   
>   	return 0;
>   
> -err_unreg:
> -	device_unregister(mci->pdev);
>   err_mc_free:
>   	edac_mc_free(mci);
> -err_dev_free:
> -	kfree(dev);
> +err_dev_del:
> +	device_del(dev);
> +err_put_dev:
> +	put_device(dev);
>   
>   	return rc;
>   }

