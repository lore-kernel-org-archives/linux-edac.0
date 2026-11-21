Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795274948;
	b=BPQCDyETrQjTegtOSu5QtSGqrI5DCFXraROSllyXpC8pWgJUloY3l8Bj+aFJ9MFcEDDd
	 84+MC+ym30g2XO+k/ec/cLFkWw2oZmW1Vuy9IT18LPPD6wRKY4+jAh4jbN7TtRciBVOfJ
	 0aQaAUKFbZJhmfG2NFQOCte6iiIACTuBISmilAutTJB40pqrV+5+A9ezzXB1Ttxywybgu
	 emX0qlA4VVlzbFzn7FnLH7jEPC6kb7Ne7lTJNf69RlGK6noP8zWJnGPb157FasUw6q3kc
	 sqQF91+DLG/rp+vTePwbVphdOQYKuozb+3sO0zEXReU68GVGMMDIAT0JoUkpoY5T9xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795274948;
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
	bh=KErUAvnZA3R5ArxZNa5SSoH/zK4AoVNbQPo9QGMl5l0=;
	b=sg3e0ECCnPj8mNJi29+r+tUSo5kZMGs2vlnwNVX9R7xiil3LJePsDuQDqrYEBYjmO3T3
	 84+UcYn39nbXB+5qEpimDdfIB9+u8sBRQS78j35MhrGDRNpJ0R9MKjspn5Z5Qa3QjQt+C
	 lTY5Se1/e38WcWpc9sPqICZu/K3lCrs+ttMBvCafsKcXvaZb7ABMXfa2n01bjluykwGC+
	 MtDRNBoUVI9veleCw1IETRyjzNPFLKV/LB4l0fLPX8Hyt2NNj3mvDoGDjYqSL9+MRxz+m
	 ilkqiU+PHQdWjY4+N0PeSOiyODy9aGE+zbcp+ABB1/yZZCtSVOAwNv882dcJfopyTMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cxtzH3GU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.43
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011043.outbound.protection.outlook.com [40.93.194.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27908606A320;
	Sat, 21 Nov 2026 15:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27908606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cxtzH3GU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFh7CXVDkv3D2XhLXy7u9QKRoprU2J/lZI9GjC2O+sN5oQ0Ytb4fQkkY90+oZ7Pifo2bmFrolP43r9e1Bw2sup6w3GsDWPOP7iT/CxVr1zpKIXZTNqT51f0X94PQXq8naOV58zqybKyGP7m3qaGmbchj/nbauJHFw4eBmLMUVvZogEfxOq4iKwDoJ3zzfc8TmTCLLV3v73dYNrN0Leu3lf57zKvCnpBbcipGeP5X9U+zOrXIsVEtauZUuz4uB8f6WetNk8lOLBss+0Eecfo6VNy5gf2zVWSb7atVZqPWA5Repr7qVr2nK7l8vah2gIH/RpFdASj9mv1HToGFTNdMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KErUAvnZA3R5ArxZNa5SSoH/zK4AoVNbQPo9QGMl5l0=;
 b=E79ClbQ3Ukkj1BtVdvwNO8XsJenQIIXy5cssqlpRp4j3wg2z8lEXKEl4HwYh4kIyw1dPbuiPK2afQ8HM5vEhCuQZn8p1qF8jcUY9KFyqnwRjZoOIcV+aGWn0OoWxEpiwdghhtXfUYPKxsK3OjyXaiS/cqu0MNNPSOd8epVfQh26pVOGbIND+59q+GN9rWa1IeYA7X3dD3RXChPXzR9VKHVgok4r/2hqi3LfTipXqKuW5vWBwpf0cyq1PWDGHust9Y7R9dcpryD87ypFKpSNkP1ukdTp4Mpt7fCAglIsmj72GtRioADvfnvOt3E3GiT+k8DRaZx7buDHrnG7fpoVJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KErUAvnZA3R5ArxZNa5SSoH/zK4AoVNbQPo9QGMl5l0=;
 b=cxtzH3GU79DM4cIsVrF2w+SWSfYybeg3UlPNcUPZt+MKlWAMHK+7k/PTHBTZjc6ki9z9OK/4wVjVhBj0L/rnKX4NDmSK6KtKWU9ze3KG9yj7P70t3/wmDQ+6FTB9bcXEm+h5WxCTDBsvwe1PuSJw+8ifCAzyPlYqVkTGXZweMaQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by LV3PR12MB9401.namprd12.prod.outlook.com (2603:10b6:408:21c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 15:29:03 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0615.013; Sat, 21 Nov 2026
 15:29:02 +0000
Message-ID: <eb3ea65f-7602-48b5-b983-b09c091a816e@amd.com>
Date: Sat, 21 Nov 2026 20:58:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] EDAC/versalnet: Wait for RPMsg endpoint
 initialization
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com, michal.simek@amd.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-7-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261118142213.100581-7-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::14) To DS2PR12MB9709.namprd12.prod.outlook.com
 (2603:10b6:8:276::18)
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
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|LV3PR12MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: 496cf01f-86ad-497a-7b48-08df47e42bb4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|4143699003|261022105027099003|261022075727099003|261026130827099003|11063799006|261021135927099003|56012099006|261021130227099003|261021133027099003|261009223027099003|10067099003|261021123027099003|261102123227099003|261021121427099003|261026140227099003|261022113327099003|261026121527099003|261022115727099003|261026135527099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+uLapBBtTQCCM6TsL30ZndlP8T7t3e+NxncXdtWpZxDIi5hSmzxTg++BKsbitOZZDtSLm4oPF995nEPhF5nKQf5lFPVwr4fi9ln0+HYeeRSNn3uwu6xtJUITVHMXQbVRAoRY88H/efWwfc9pUbOz6F3dEEzuFvIsf5/dpa6FKiTZTooMLiBFZFiZxkUrbNzlMNeOoIBUTgq3AR2zh+TlGP3FzyyOFg4nv7RS2ANhdnK78gUXqFnSO5rGzY1FZN222aZzEVO3m9GsVzCz88oH++TNlKeZT0QWQpNWUN0z/+n2IOXrFysAtDIsFPzFoGVPHVN2bvUi5m5g0xcaCazpn28qMPSxTt+YimyQwKelbenxqamGBzVDeU9YjcJAo0kTT3UPYY5f5InWuJ4Db2zBBHWKtHBCuFtlAs9SBgMRru/vXenmIA1QWcb1+myY9NrTls1vka6LmMsXjVklIfi640oTZwBrCNcNplmTxNrUiohga+Y3QUbJQnWb/Vj9j6hZscoaEy6q5sZbMAIYRV1f3pByMtumiU55hrBvD0p8aE1iPh5ri8/kNHxOl40aH9xLO/Qi6rSLC0+1WQS1gJyHnkj1U1tcBwWt6l0nzchoZrVXXsRguAXtnn6/UjPez7Qyq0jIDbMnoE5FBh/axWJEBmdB5owzmuDd3xIX6w52KaA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(261022105027099003)(261022075727099003)(261026130827099003)(11063799006)(261021135927099003)(56012099006)(261021130227099003)(261021133027099003)(261009223027099003)(10067099003)(261021123027099003)(261102123227099003)(261021121427099003)(261026140227099003)(261022113327099003)(261026121527099003)(261022115727099003)(261026135527099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWpsckpBMHh4aUIvSzFvOEsrb2VoSDZwajFjQ0p5enpaOGRRMnBxcmN3d05y?=
 =?utf-8?B?bFk4d2o2bHV2SWF5NW0zY3Bac1djcXVtZ2IxcTdQd3dNR2YrVTlnbkxEbkxR?=
 =?utf-8?B?OWRZQklCUCtJSVFTaXNsNGxJZ29EWWhmMC9BZUtoTTZSTXJ3ZFNFSWZ5Rkpj?=
 =?utf-8?B?VzArRWhYT2piOXdBdUlwcmZZK0pteWZOdEFaVG5rT09ZaEt6bys3ck5lS2RE?=
 =?utf-8?B?aWE1K1B4SjBsQ1o3MzBDSlNMWTJkcVlsblhmdW9HVjlYSmtQYWJja0xLaHB5?=
 =?utf-8?B?aXZSZG5DSjhSQnI0dm5VZ09aT0RZTDc0R01HR2JYWnZwNit4T0poYU9qdFFS?=
 =?utf-8?B?YVRSemJIQ2doSGRsRG9HQk1tZWloZWRodmEzTGY3dUNhNytHSUxXNzBIZ1BC?=
 =?utf-8?B?cjFUenBKV0RvdWkwcnNKZEFFQWFDek1UTnNSOW9CQU9EK2dGTWkrM1JtNTRX?=
 =?utf-8?B?YytEQmgyczJSZG1tUnNIalRELzNGdVArY1FwV2hLRVlYaDRydk5KYUV2bjI4?=
 =?utf-8?B?SjROZDFPQ09UQmlWL2xVMS81dmNkYnVjYnhTRU1EbEJuR0xKQWJwZ1Mva2pO?=
 =?utf-8?B?TUFpN25EdlNPVmkxWjJnZDA1NmtzeWo2OU1Dbzcwdk84djlNTm9oZ0NlZDUr?=
 =?utf-8?B?NDBEcVNhT1pZTmJBeGxPWnI3VStXcDVnWFlDQkNyVmtEWGZiR1d6UUk1ckRI?=
 =?utf-8?B?WHEyVm40VmszVUZra0hkTXIwYnJiYUdyVWliZkptTVZxZnlNY3VKajdGU1dB?=
 =?utf-8?B?Rk5DYkFqcWE2VHgrZWs4RERtMkZKczY2QU9zMFBDNDdOZnYwejMvZ0VoTm55?=
 =?utf-8?B?TUJTWHk2NnZ0SkI5L2ltdnNxQjdNbEo3cER5bDRaT0sxV2xmd2g5ZHlibHV5?=
 =?utf-8?B?a3ozTjBQNGw5YUFDTmw4aHA2RHlzbmMxS0FPK0FKbW45eVVPVVBLQnpMRi9o?=
 =?utf-8?B?V3ZIUy94bkNmSGpaTmRnbGdBWGFnWW5wR2lCZ0tHK1dtU3BRMjZkY3RFUEZT?=
 =?utf-8?B?QTBuV281MTJ3WWdoc1BMMWtrS0xvdXZ0enIybXltTFFncjMvT1lLQXk3SjU5?=
 =?utf-8?B?Y1hISWlMeDM5blhKdHE5VGNxMUR4WC9hRnVDa1JldWZQWUNxaWYyZUZTWWdk?=
 =?utf-8?B?OGxuTnpVanJJZnlQOW5QUjZWRzAwd2xNNVNzaFNvMHh0QUVFdENtM3pkdXZL?=
 =?utf-8?B?TUtzTWxRNjFOUWV5Y1d1Vm43dXo1SkVNUHl1WE9naWkzVHBpdnZHd0tTeFdm?=
 =?utf-8?B?a2RhQUgyak9CN3RYWStjVXYvanQ5SURsWXl4OVBER2h5SytQUGNCN0FILzd3?=
 =?utf-8?B?eWg1LzRZb3Z0cXQxb1FkU2ZDR01qQ0FKVWNiYTBON0JoL0E2bU8yMW1TOUpB?=
 =?utf-8?B?NlI3d2k4ekhIVGQ3aldsSGhzTDU0dlYzOThlY3RLUWNERS9DRDVlTG13bjBT?=
 =?utf-8?B?bWxKTVF2bmFPSVVWUHJMTVQvVkhzcDNtZTRmY1Bmd2k1ZThhRmFVNkhnQUtN?=
 =?utf-8?B?Nnh1U2p1cWlFUXNLbWNaMW5ReFlHaEU1WkZXUHY5NEhrQldJTGVHZkhsSUtO?=
 =?utf-8?B?WEV4RDlhREhUbEdMNHVhNHprTXhndHJzSDJ4cFQzZVU4VTdHSk9jZVNOUGNQ?=
 =?utf-8?B?UWdQU2tMQktERGp2ZXdqdTh1TTd5Zzk5dzNJLzlpUWd3clBpclBoUktPZzhX?=
 =?utf-8?B?dlZ3ZzlLWmFicmtGdlBHeXNiUmJlSnRFQmU4VEtlZ2ZXeWdHdFd4ZUdhQmla?=
 =?utf-8?B?NXZMV0lWUzZHREZYQ1ZsZXJjQ0dkTkJlbDR1VEdxU3VjYStpRTBqSm9NbFpz?=
 =?utf-8?B?dTZ1dDV1am90TmFaTktlOFNMWFkvaWVRTGMrbnpxVEtxOFAzOVcwTGZiSHVi?=
 =?utf-8?B?SythczgyMVB5ZHBiM1dqSTh4Q2VUMzB3Z0pza1VRdDVkT25PcDdPSm44WGhR?=
 =?utf-8?B?dlBEZktBNmFPMExlU1hpQURFcXBaK1JQN29rby9DRjFzNzNKMVRrTGNuV0dJ?=
 =?utf-8?B?YVlMdEpnVzlNY21udFljQ1hmbzZ1YkplSStvWjM0QjJKdWl1a1Z3RDRIU0M1?=
 =?utf-8?B?eER1cExhVXZZMndZYTZkMVFIUXBxemo5Rm9MRUxIcXhFOW1mSHlwR0JRUTRD?=
 =?utf-8?B?cmNMNllFV1hmOW1VZWtrVktNWDZEMzRTSHBNeW1BejZmVWJUWjlVa3JjTWxX?=
 =?utf-8?B?bXR0UzVsTlJ1UG9vanFiKzlCUGFySDJiZUgvUUU3bmQ4aUFiWEwrM21jSm5i?=
 =?utf-8?B?OTIva0ZaVDVNaUptU05kdnRWNnd1NGlGTlBMZ2NJM2E1aXRPa01pUkZSb202?=
 =?utf-8?Q?e1i+AgWtpIKvVZfq8F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496cf01f-86ad-497a-7b48-08df47e42bb4
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 15:29:02.7722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNvvPYj45pU+SBNTQr9wswCUmBMxe88GemvGeaTtJkv1DdkHADg+1OcAZlMneKqV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9401

On 11/18/2026 7:50 PM, Shubhrajyoti Datta wrote:
> From: Hayden Rinn <haydenrinn@microsoft.com>
> 
> The rpmsg endpoint can be used before rpmsg_probe() completes, and
> can race with asynchronous rpmsg_remove() teardown (e.g. R5 crash
> or shutdown), both leading to use of an uninitialized or freed
> endpoint.
> 
> Add a completion so mc_probe() waits for the endpoint, and a
> "ready" flag so rpmsg_cb() drops events until mci/adec are
> set up. Add ept_lock to serialize priv->ept and priv->mcdi->ept
> across mcdi_request(), rpmsg_probe(), and rpmsg_remove(), clearing
> them on removal and failing mcdi_request() if the channel is down.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Hayden Rinn <haydenrinn@microsoft.com>

Why Hayden is missed out in to/cc list?

> Co-developed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v2:
> Patch addition for the rpmsg endpoint race
> 
>   drivers/edac/versalnet_edac.c | 123 ++++++++++++++++++++++++++++++----
>   1 file changed, 111 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index ea90d3ce3e70..90918293f76d 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -5,8 +5,10 @@
>    */
>   
>   #include <linux/cdx/edac_cdx_pcol.h>
> +#include <linux/completion.h>
>   #include <linux/edac.h>
>   #include <linux/module.h>
> +#include <linux/mutex.h>
>   #include <linux/of_device.h>
>   #include <linux/ras.h>
>   #include <linux/remoteproc.h>
> @@ -146,7 +148,22 @@ struct ecc_status {
>    * @adec:		Address decode registers.
>    * @mci:		Memory controller interface.
>    * @ept:		rpmsg endpoint.
> + * @ept_lock:		Protects @ept and @mcdi->ept against concurrent teardown
> + *			by rpmsg_remove() (e.g. remote processor crash/shutdown)
> + *			while mcdi_request() is sending on them.
> + * @rpmsg_ready:	Completion signaled once rpmsg_probe() has run to
> + *			completion success. @ept is only valid to check
> + *			once this is signaled.
>    * @mcdi:		The mcdi handle.
> + * @dev:		Platform device backing this driver instance. Stays
> + *			valid for as long as mcdi_request() can be called,
> + *			unlike @mcdi->rpdev, which is torn down and cleared
> + *			by rpmsg_remove(). Used for logging when there is no
> + *			live rpmsg channel to hang the message off of.

To big description. Lets trim all this AI generated text.

> + * @ready:		Set once edac priv data is initialised. Published with a
> + *			release store and read with an acquire load so that rpmsg_cb
> + *			never calls handle_error() against a @mci entry that hasn't
> + *			been allocated yet.

Same here.

>    */
>   struct mc_priv {
>   	char message[256];
> @@ -159,7 +176,11 @@ struct mc_priv {
>   	u32 adec[ADEC_MAX];
>   	struct mem_ctl_info *mci[NUM_CONTROLLERS];
>   	struct rpmsg_endpoint *ept;
> +	struct mutex ept_lock; /* Protects endpoint */
> +	struct completion rpmsg_ready;
>   	struct cdx_mcdi *mcdi;
> +	struct device *dev;
> +	bool ready;
>   };
>   
>   /*
> @@ -508,6 +529,12 @@ static void mc_init(struct mem_ctl_info *mci, struct device *dev,
>   
>   #define to_mci(k) container_of(k, struct mem_ctl_info, dev)
>   
> +static struct rpmsg_device_id amd_rpmsg_id_table[] = {
> +	{ .name = EDAC_RPMSG_CHAN_NAME },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
> +
>   static unsigned int mcdi_rpc_timeout(struct cdx_mcdi *cdx, unsigned int cmd)
>   {
>   	return MCDI_RPC_TIMEOUT;
> @@ -517,6 +544,7 @@ static void mcdi_request(struct cdx_mcdi *cdx,
>   			 const struct cdx_dword *hdr, size_t hdr_len,
>   			 const struct cdx_dword *sdu, size_t sdu_len)
>   {
> +	struct mc_priv *mc_priv = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
>   	void *send_buf;
>   	int ret;
>   
> @@ -527,6 +555,24 @@ static void mcdi_request(struct cdx_mcdi *cdx,
>   	memcpy(send_buf, hdr, hdr_len);
>   	memcpy(send_buf + hdr_len, sdu, sdu_len);
>   
> +	guard(mutex)(&mc_priv->ept_lock);
> +
> +	/*
> +	 * The rpmsg channel can be torn down asynchronously (e.g. the R5
> +	 * remote processor crashing or being shut down) by rpmsg_remove(),
> +	 * which clears both @cdx->ept and @mc_priv->ept under this same
> +	 * lock. Bail out instead of sending on a destroyed endpoint.
> +	 *
> +	 * @cdx->rpdev is cleared by rpmsg_remove() together with @cdx->ept,
> +	 * so it cannot be used for logging here; use the stable platform
> +	 * device instead.
> +	 */
> +	if (!cdx->ept) {
> +		dev_err(mc_priv->dev, "Dropping rpmsg send, channel is down\n");
> +		kfree(send_buf);

Better to do in start and avoid this kfree.

> +		return;
> +	}
> +
>   	ret = rpmsg_send(cdx->ept, send_buf, hdr_len + sdu_len);
>   	if (ret)
>   		dev_err(&cdx->rpdev->dev, "Failed to send rpmsg data: %d\n", ret);
> @@ -601,6 +647,18 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
>   		cdx_mcdi_process_cmd(mc_priv->mcdi, (struct cdx_dword *)data, len);
>   		return 0;
>   	}
> +	/*
> +	 * The rpmsg channel (and thus this callback) can become live
> +	 * before init_versalnet() has allocated priv->mci[] and
> +	 * populated priv->adec[]. Drop reports that race ahead
> +	 * of it instead of calling handle_error() against incomplete
> +	 * state.
> +	 */
> +	if (!smp_load_acquire(&mc_priv->ready)) {
> +		dev_warn_ratelimited(&rpdev->dev,
> +				     "Dropping event, driver not ready yet\n");
> +		return 0;
> +	}
>   
>   	sec_sev = result[ERROR_LEVEL];
>   	error_id = result[ERROR_ID];
> @@ -721,12 +779,6 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
>   	return 0;
>   }
>   
> -static struct rpmsg_device_id amd_rpmsg_id_table[] = {
> -	{ .name = EDAC_RPMSG_CHAN_NAME },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
> -
>   static int rpmsg_probe(struct rpmsg_device *rpdev)
>   {
>   	struct rpmsg_channel_info chinfo = {
> @@ -734,25 +786,56 @@ static int rpmsg_probe(struct rpmsg_device *rpdev)
>   		.dst = rpdev->dst,
>   		.name = EDAC_RPMSG_CHAN_NAME,
>   	};
> +	struct rpmsg_endpoint *ept;
>   	struct mc_priv *pg;
>   
>   	pg = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
>   
> -	pg->ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
> -	if (!pg->ept)
> -		return dev_err_probe(&rpdev->dev, -ENXIO, "Failed to create ept for channel %s\n",
> -				     chinfo.name);
> -
>   	dev_set_drvdata(&rpdev->dev, pg);
>   
> +	ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
> +	if (!ept) {
> +		return dev_err_probe(&rpdev->dev, -ENXIO,
> +				      "Failed to create ept for channel %s\n",
> +				      chinfo.name);
> +	}
> +
> +	/*
> +	 * Link the new endpoint in under the lock. This also re-syncs
> +	 * mcdi->ept on reconnection after the remote processor recovers
> +	 * from a crash/shutdown, which previously only happened once,
> +	 * during the initial mc_probe().
> +	 */
> +	scoped_guard(mutex, &pg->ept_lock) {
> +		pg->ept = ept;
> +		pg->mcdi->ept = ept;
> +		pg->mcdi->rpdev = rpdev;
> +	}

[1] Critical: rpmsg_probe() dereferences priv->mcdi before mc_probe()
     assigns it.

priv->mcdi is assigned inside setup_mcdi(), which mc_probe() calls
after register_rpmsg_driver(). If the channel binds in that window -
only a kzalloc_obj() and cdx_mcdi_init() wide, but the NS callback
runs in an unrelated context - pg->mcdi is NULL here.

Pre-patch rpmsg_probe() only touched pg->ept, which lives in the
devm-allocated priv, so this is newly introduced.

There is a second, wider instance: if setup_mcdi() fails in
cdx_mcdi_init() it returns with mc_priv->mcdi still NULL, and
"goto err_unreg" runs unregister_rpmsg_driver() -> rpmsg_remove(),
which does mc_priv->mcdi->ept = NULL on NULL.



> +
> +	complete_all(&pg->rpmsg_ready);
> +
>   	return 0;
>   }
>   
>   static void rpmsg_remove(struct rpmsg_device *rpdev)
>   {
>   	struct mc_priv *mc_priv = dev_get_drvdata(&rpdev->dev);
> +	struct rpmsg_endpoint *ept;
> +
> +	/*
> +	 * Clear the shared endpoint pointers before destroying the
> +	 * endpoint, so that mcdi_request() (serialised on the same lock)
> +	 * cannot observe or send on a stale/freed endpoint if the remote
> +	 * processor goes down concurrently.
> +	 */
> +	scoped_guard(mutex, &mc_priv->ept_lock) {
> +		ept = mc_priv->ept;
> +		mc_priv->ept = NULL;
> +		mc_priv->mcdi->ept = NULL;
> +		mc_priv->mcdi->rpdev = NULL;


[2] Critical: use-after-free on the probe error path.

 > @@ -745,25 +786,56 @@ static void rpmsg_remove(struct rpmsg_device 
*rpdev)
 > +     scoped_guard(mutex, &mc_priv->ept_lock) {
 > +             ept = mc_priv->ept;
 > +             mc_priv->ept = NULL;
 > +             mc_priv->mcdi->ept = NULL;
 > +             mc_priv->mcdi->rpdev = NULL;
 > +     }

Combined with the unwind in mc_probe(), which is unchanged by this
patch but newly matters because rpmsg_remove() now writes through
priv->mcdi:

         err_init:
                 cdx_mcdi_finish(priv->mcdi);
                 kfree(priv->mcdi);

         err_unreg:
                 unregister_rpmsg_driver(&amd_rpmsg_driver);

err_init frees priv->mcdi and then falls through to
unregister_rpmsg_driver(), which calls rpmsg_remove() on the still
bound channel, which writes to the freed object. Reachable whenever
init_versalnet() fails, since the channel is bound by then.

mc_remove() has the right order (unregister, then free); only the
error path is inverted.


> +	}
>   
> -	rpmsg_destroy_ept(mc_priv->ept);
> +	rpmsg_destroy_ept(ept);
>   	dev_set_drvdata(&rpdev->dev, NULL);
>   }
>   
> @@ -920,6 +1003,9 @@ static int mc_probe(struct platform_device *pdev)
>   		goto err_alloc;
>   	}
>   
> +	priv->dev = &pdev->dev;
> +	mutex_init(&priv->ept_lock);
> +	init_completion(&priv->rpmsg_ready);
>   	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
>   
>   	rc = register_rpmsg_driver(&amd_rpmsg_driver);
> @@ -932,12 +1018,25 @@ static int mc_probe(struct platform_device *pdev)
>   	if (rc)
>   		goto err_unreg;
>   

[3] Critical: the completion is waited on after the endpoint's only
     pre-init user, so the patch does not fix the bug it describes.

The wait lands after setup_mcdi(), but setup_mcdi() is itself the
first and only user of the endpoint during probe:

mcdi_request() takes the new !cdx->ept exit and returns void,
so the CDX core never learns the send failed and waits out
cdx_mcdi_rpc_timeout(), 10 * HZ. get_ddr_config() only copies on
success and setup_mcdi() returns 0 regardless, so adec[] stays zero and
probe continues: init_one_mc() reads FIELD_GET(MC5_BUS_WIDTH_MASK, 0)
== XDDR5_BUS_WIDTH_64 and registers MC0 with fabricated geometry. (The
announcement normally lands during that stall, so in practice only MC0
is affected.)

Pre-patch this at least produced a WARN_ON(!ept) from rpmsg_send(). The
guard is correct, but without moving the wait above the loop it only
silences the symptom.


> +	if (!wait_for_completion_timeout(&priv->rpmsg_ready, MCDI_RPC_TIMEOUT)) {
> +		dev_err(&pdev->dev, "Timed out waiting for RPMsg endpoint\n");
> +		rc = -ENODEV;
> +		goto err_init;
> +	}
> +
>   	priv->mcdi->r5_rproc = rp;
>   
>   	rc = init_versalnet(priv, pdev);
>   	if (rc)
>   		goto err_init;
>   
> +	/*
> +	 * edac is initialised. Publish this with a release store so rpmsg_cb
> +	 * running concurrently on the rpmsg worker thread, only calls
> +	 * handle_error() once it observes @ready via a matching acquire load.
> +	 */
> +	smp_store_release(&priv->ready, true);
> +
>   	return 0;
>   
>   err_init:

