Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39682820C6;
	Thu, 12 Mar 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325468; cv=fail; b=jP23cQsmItLNr+M0P2/xgnK6uMxlTnD+LwI0R4MLHwXvdidBgY55ZRpLRxiIZ+D/gMhvO3yl9wKxuR18mjcLJyVafaATkZVwTx1G3cNZSyfyXRRiEuZCiY5YqaSUwfXsE4fymDqx72IbX+wyhx2x21KOp5E7k29x4DS2V6bYVLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325468; c=relaxed/simple;
	bh=u0yivC3gCvPmklO4KqaMWvYdmM6YpLhU34xF0tuvCx0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EWfnlfUx/gNYP5oEoHlQD2f83VDQ+XabCNdiSHdtq+8rxKIKdZ+zBoOVDNPQPiVtciAdHD1OU+w2mAKllFcdEsdTojSTLt+kku6XXhoizfn5ZtQ3xFjPuUWaXuzGfGMQcJ1flUTloTrd2SnyX/11RbZEjepx6rQe+fULWW6qces=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kGWr/RDZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eVMaNe4e; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kGWr/RDZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eVMaNe4e"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9GhdI680382;
	Thu, 12 Mar 2026 14:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=hw5i9WNiDue91VIrfBqJKZZ81AZA5YqttIN7BAvfN6g=; b=
	kGWr/RDZ8LFkChqL0XShMvn7bHFdrmFyr/SY3Vtx/6fAEtIpGEIDt2rf1IKJoudR
	qFnQpR3IBPLQ0qzjsmZngQcuQ9FGdr4UygAiRwBIHiHN8+zT5jlwceLTvmlx2Cwm
	q5WnwlkmH+7qKej/q1JE8Weyv5NvX598VxXtCF5LKnSwLiZLMmO08q4POWxqhRra
	kYNSbfHPC1iEWexfqt2a9vB5Ch6vIEMdESHxPmIH3hmu46P/Z2121uYvw2oerZNn
	Q/HLhC8ZXveAl8nx7OijAuHkSv9zbBh4fiKuHJ60nmz8uFnaVRxpIBwG1upmy9Dv
	zVkkWRc++LoALvlNf5OP4A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cuh4fgytp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 14:24:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62CCixmM002098;
	Thu, 12 Mar 2026 14:23:59 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013008.outbound.protection.outlook.com [40.107.201.8])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cuh5tkyu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 14:23:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2xAiQpPs3YoCXGPZZQFshNjdCEzDe4/b5Ovb0Ca+pTD05GHFN/ws6hTT7H6w8yPz08w4IIg35vd3uwamgKYhBDRSPLvLCKWohRxlr5Nq4xyOyRPyGsQfDab+TKzFgivEgXI8ooZbd0zpXha9mu5NFLnVEg6OYr2buvQBDhEviwaQ6RuhnBOINUbdxbeKTSHPaOo14bjTPmvs/Uli6JGnoDUum/m4XCdb80GtGs52intr3NgSxdiTM+V1g+noSs9Emv8DYsuPhRcTtPJSnM+dlgQsDEOjsneOF1Karrs4D3jVYjWdCA2N0lr2sg2XRxIHJ3cMaH2/laGJNFLuewL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hw5i9WNiDue91VIrfBqJKZZ81AZA5YqttIN7BAvfN6g=;
 b=cLn+I/ig3A3T4bNy4l1vCTWbYY0J9B4Ne5QEbujhrimp7aPHrLBJOw9IS9XHWpngdC0tn6HeBi55epyc5QeyMCSv0Jt1qM+aUuqvTdeNiOTue365BuaYAquRRTGY/Ds25I7+CtAmrHeoN813FgtbXZvqcaAxKjnS83ZS/wbm9yut9NzfKSttQ9BkLjsGw+oBuOm8cpEOL1KakPsBLBSxXLMuQP9hdQxuuGm4x2ugVMSAZ7MNBlWKkew1ok6WmkGUrqCz/nPsOLbLG5RzOiCP3cy8gGe0j3yZYXd+/+lHhwrEq3yemqUqKCgD7ePdI29FTBBXtaKtJhfHoPlmdOsErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw5i9WNiDue91VIrfBqJKZZ81AZA5YqttIN7BAvfN6g=;
 b=eVMaNe4eTQlCIm8OYtwNEDtn+AVndSh9I1J48ldFsjPKq4AOZB3CdKH63xqHFDs3FD2zfuUAPU3pyLq7kSaudXmCadhKh9DqhgUfQLr3BWfYLo++m+qWj3dxXEnlLlGewd7ypTIAzqqrGi/+/cOO0jJ4E7dq6Wp3xTSJ8ssAQ1I=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by IA1PR10MB7446.namprd10.prod.outlook.com (2603:10b6:208:447::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 14:23:55 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 14:23:55 +0000
Message-ID: <6b6619f5-1c0e-4a5f-b1cc-25d0c8d2399e@oracle.com>
Date: Thu, 12 Mar 2026 15:23:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] AMD VM crashing on deferred memory error injection
To: yazen.ghannam@amd.com, tony.luck@intel.com, bp@alien8.de, tglx@kernel.org,
        mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: John.Allen@amd.com, jane.chu@oracle.com
References: <20260218163025.1316501-1-william.roche@oracle.com>
Content-Language: en-US, fr
From: William Roche <william.roche@oracle.com>
In-Reply-To: <20260218163025.1316501-1-william.roche@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX1P273CA0021.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:20::8) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|IA1PR10MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 507f6dbf-09b9-4a6b-aee3-08de8042fde4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C22B9QFhaOF21ZjfuQ3caWSuKP1lcsyyWHyOEy5CPs+7uf+kBZXEuWAOt4u5LEzK7VDMeYy2+/bNevGorQsJG3X29lJOZtpaTcC7/9yUmECIKGiu2b8tpzqqAI82PeMGUylf7ZPSi6KmjnH1oUTzomQCCG4fn5zvbGunzQINRw3kxtzrO47shBg5NWLA9e8IEH67LT3c23t8H27CSH4K21eH2H2kJenOkFnfDOh+6uutx3/4Wwkg3hmuh+AShYPo7gTg846OODDG8v0FU0XJ4Apm4KC6lYWzX8Kg4HLcS+/AxFh1wrD7PF+0a4mmrVhXDoD4xDX+/wCQpFkpjUPoWpaWeePJ666duP9iCPgEF4NT6HMHOooagsoikYla8YPwmWoihKEgqyyi+rZPFyMEoRoN2MExbvNlZQUMf2HkmuMDOvasP8WHfu7WJZYfgUXm1E6J4c3I+WrbYyPG6jc0bl0R27HYajupLO2iselyXKQm/2Uj000r/rpAaP4ANFzRbj64Tt6XRIhLhHj9fFDpOT8ma47D9WMwMZRFDZFnfodIGDVCXI3lDodQoYCqz5iyTukDsGNiaz4fK+8l7x8MEs6mrJqJCIKROiyNbpWyYFMzyxwZPtZLBqZsUXmurih6AFJ+3y9af2/NtfD5mQnuxArW3Vz0eSH2KrIfLlKYaRoI8yoYCAH379eXwri0PVpS6aNtDIGJodgr5rvZRwpfP3AKZtuiEFQD7tfWYvOcghJeJJvLBL2clMwpTiizcu5QBsOu05lHSSwNKNDXioqIPaXwyycc5wZf0JLj+8EriMo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1lLQzRieXpSMVpjOEJGTUsxb25KbXNIeVNXMk5zTmdpVnY3UjJONzQ1dUEr?=
 =?utf-8?B?NEgwZDBZTCt2YzZJL3FYZDJlOWlTTGxyczdLNVlYWFhwbDBmcXlBUkJDVDVk?=
 =?utf-8?B?MDBaeG11MGN4REQ1NUFxVW1CUExRYk16UGFZbmRTMXpEU29lVlU4clByWU1s?=
 =?utf-8?B?YnFyVGVtNjlMOXFNZUFwNWxqOFhtRE9zLzVVZVJGMXlqK3RBbEF0RWdXLzhQ?=
 =?utf-8?B?MUlkc3ZRU1B3RGhuNnZDZ055Zys0YWI2NDVKWk9MZi9JaGYzQnVaQWhEb3Z2?=
 =?utf-8?B?RlY2UCs2d3hiVVN5Q1B2Y3QxdnNDQmM3YlJqYUxqbmRjcm1yTkdyVXRSTnBD?=
 =?utf-8?B?Q1IwWHl0cUNzbUdmUVRETjNqRzJSWDdyTE1Ibi9XWThScjhjUmZJdGx1T2wy?=
 =?utf-8?B?YkttaDdLVmthNEtKVFFtTm53SFplN2ZKRkZkMm5TRUN3ZnBONEQ4U2FCL2dE?=
 =?utf-8?B?MVZSZkcrZm5BTXpTSWViaThPRXFTUTFZVnozdFduMjFOcHZZZkxONUpCRE9J?=
 =?utf-8?B?OUxwUzQ3L3VnNmJsNUVUNnpRLzVMd3FycXVnZDNxU2hDNXFwckhiNm4rakNB?=
 =?utf-8?B?aEVTa2IvMG8rcVN6SkE2OEI0bDY0SHc5MThrenUrOFJzSHp4YURvTFdnR2c2?=
 =?utf-8?B?clNaaEdNdWFxdG1rUGptTzhhVHlGcG1IdXRqQXlFa3VNY3dwRU11bFlMelkv?=
 =?utf-8?B?YWl0cFhBSXNqYmQ2bEd0ejJOdkZYVkN5WE9WbnJYK0pHVEltZ1lZbzNWZ2hQ?=
 =?utf-8?B?UHczSnAzOHNRY2FERW1ETE1nc09oTG5CZlRSZVVkYlE4TzhMam4zdnVQbUNx?=
 =?utf-8?B?Mk9qZUZFM0x2S2x5TTk5Q3V3cDBzS0k0RHFXaXdmdkx4TDkrY3Fpb0tUcHcr?=
 =?utf-8?B?ZjRBUi9BWlhmQlZncTkvK3VJdG4vbGZGMFJRa0wzaDJWZEZ4eWN3Sm1lb1RG?=
 =?utf-8?B?SDM3TitQTDhQVFd2aE9BOEV4Z1lGTTJqUjRWaEhabzcybVY4dlhnU1JiRURT?=
 =?utf-8?B?L0FPZFNjSFB3bFRKaUk5VnJYVkxqZUdwY2ZSYy9zV1FQVXJ5OUpHaUR4TE9C?=
 =?utf-8?B?WVBoY2luSXBpZi9Gam02QU9GZVV0czNES25JZFgvS2E3VFVXbDdTZnF5bFlT?=
 =?utf-8?B?QSsvbnA0TFM2dWt2Ri9YTkxFSmtLMUNSY1d3RzBsTFdIbG1lYjliVDBFMjRo?=
 =?utf-8?B?N3ZNWTRaR1ZhNmc3ZUEvMUhLRXFXSVJvZkU2Y0RlL2d5bG5VSmZocnhoMit1?=
 =?utf-8?B?a3dTbmFHMWhjdGgvQTg3bGZueFVlMlFIRjFYNXpOQ2l6cjYyVVdqN0JVWHdW?=
 =?utf-8?B?bUZHeEt2K1NCbGZYRCtOeVNjZE0zU0R4cllrNktqQzJ1KzhwdnZ1dDJ6RVdv?=
 =?utf-8?B?dENDakFGcC9NQjFoa3R5djR1NjVzMVIrLzBUVnpMSDNTdm9xYTk2NlVxSFZ2?=
 =?utf-8?B?WFJXa2gyMDZmdzlEOWYwRlh6cDR4bmhCOUVKOER3WWNob1VlejlkSXkzaUh4?=
 =?utf-8?B?c1BBbEtNSm81TFRTZ3RJSkt4QTBGVGtVS1VNb1FhY3MvMi8wUXpUK2Fac21u?=
 =?utf-8?B?OTZuTWFVWkZJUHBweUgxcHN4VlQ3d3cwNEhXRC9WRklmaG9mcHNnZmd4ZjZY?=
 =?utf-8?B?ZThuemo5VzVVZjVRUUdSL1dlVk1oVm5mVzhyMW5uY3ZxSkV6Q0pFTy8za0F0?=
 =?utf-8?B?VGNwUmtnS0pyak9RUTltakEzSmM1OC9sQTl5WCs3V01kaVpXQXhEZmFzaDdD?=
 =?utf-8?B?dmdLenFRWXU2eVUwVGpQWFpkN01id2xSaUMyS1Q5V01NYnZvZ1VuaFI1c2tK?=
 =?utf-8?B?Q2FTWFg3MURyTmFtbDFzWUtvVkJEYzUrM0M1U2w1L1pEdjQ4RW9oWmNoSkYr?=
 =?utf-8?B?RWt6NEduenFzYytqTW9jNGFmZzlJSnJDcXV2bzM4ZW1yNzRmMzBodEpGeUFy?=
 =?utf-8?B?UUhyYXcrYUdqYUQrejU3aHhSclJiYmhydVdkUzFUcnM5VlQ0UEdvSHJPOHFU?=
 =?utf-8?B?c0cxV1MyOFp3Y3lsdmxTbENrMmRZaUZpM2NteXZpS25MbWY3NVFxdHJkaEk5?=
 =?utf-8?B?WWhDcmtSNERFNXpOTGJ5ak15eERGdktyeldWeEpYRnhFMWo1WDkvNTVCZXkw?=
 =?utf-8?B?YmNXOWZJR0wxeXcrQXpMc1djbEVSMi84dWgyNzQ1elk5YVN6UEl3cGljVzQ4?=
 =?utf-8?B?TFkyRTlyZWxBM0Vpem0wdmh0RFhhaU02dzdvN2JLSStlandjdHZSaGJ2SFQz?=
 =?utf-8?B?aFZCQ2hlZFpVa2VGTkd0UWhJYnh5NThhQUNCbjVaYjRXUTcwYWRDVjVneFJD?=
 =?utf-8?B?K3lkWW0zeWp0NmwrSThoSGtDc2RWU0NHbk9kZDYydUo3R0hBUG9Xbk96Nks1?=
 =?utf-8?Q?7B1mRepfwZnWSgVc=3D?=
X-Exchange-RoutingPolicyChecked:
	GWPa6+P45VoBYMYAuehX8K0FEULKrg8xyYDYTD65s6VA1H0nomHznt1tHQiJOkRKzYHaDE4dwK6XQNiXza8YYIK5vWRvI14/EuC1fS1KtgTANFMvLLo3leYjhT2p1UYc9ig+pJIiUNvi8nlOdYFoOPRubP6x2Yppnfwea5PmC3BwLHwoVl/WLZxzGR8nzOAQclHXynObyVN8fn/hDW1D2Ik16u2TCcuLMTFWcdK0tUh/EZBIFNq52jvzLBX1kJTSyk//rTPcyaEQwfYV7c8TtmqHekRSMPyEyw/4zUimaCSpiqbE4pSV/SwjPitBnu9lrMNtn9ak2cOlz783YWfeSg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sWmM4IAQdSlhS3BDPpUgF0obJ/fd5rj7y1TjV5tl6k+qCd1ftTJbxPzlu7LqPU9W9JK3eIhuIkCJrHPm98vkSmBgdU0u/+dNEJ6yeIBrEos/aTlyygxEnPOCrQcwKYSQ92yfYm90FRkARsf9/Idkj/faWlsUO3hRIUqiZE1/0T6nrxGDWkblXuD3iCafZEmWeH+2mTkLL71lWgpMWUtRAEkeQr3bNQFoOanUpggHklsyYSJ/F8xxCC3D3X8hcsMxgnkqB/8FMjrL3eIa2Ir0LRFHeoyQlluYyjl6pzJDdAWrtrfHHqO2SP6YPH7AGDVIpEQ5AN3kCLwlSIAjhTGiWpgIhOjLovkHSTYr0bLoS71Vg9Y5tss8PlzMlyy5ZpqhVcBashZBVfyWr2jwiMXdrcYEsQx97Sc+HVCmqovEvZxaJjbDYsyueB+ZXj/EXdKJUdNNwduzC5eMLJoNYGapCvWdneYwSXyy4c9DaQEOFYYqfvmVauK7v5I6xQS8nqMC541qbzEkl0XXnb569lQElXzUw2AJhLo3Eer/eNulac7WiQUqsTQ+EEBzsU6CMZ1jcdw1i6i2w7M1tjWYCJOIJ4OD+WeA1myPaeuQvRdUMY4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507f6dbf-09b9-4a6b-aee3-08de8042fde4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:23:55.5663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/Aw0KIBXey/28qbPdb8rJe6svSUoXKGcIM0R0HrW03RYLZ4o96+O5LTVDnANuYxOu2TT/mSy2ze5e0SbEUAA+H5scpVfXUeT+PbkwkG2mM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7446
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=939 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603120115
X-Authority-Analysis: v=2.4 cv=c/qmgB9l c=1 sm=1 tr=0 ts=69b2cc80 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=oUWXzLAT7utt5AZBDUwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12271
X-Proofpoint-GUID: Uj4zkEK9S8LIzfodNFgksCg5udCw-sh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExNSBTYWx0ZWRfX7qVUgXgt8DeL
 DqE8JA2oXsdRFbKsjpWAkLiLc63bNZnEwyjBoEIu2AP4MWL42ekCdDrw1J4+9WHmU/mw+ETZSNc
 Vp7lavDEc4TyjeNw0gUB44ROzxIpZndl7CJFPD/ML1tirxjbqYb+g9KhhPhGwjD/TQSnfoEcXZb
 S1dbSPEqd5wXMV12DguYWPnCJIQy9mdsa85FbykqOUzCq2PoohasJ8uR1/X3eV2SqZ7fJ/w+aEy
 TzRV6ZWHAlUzCrGz57dmWb8367AXJBQyWldoDMwKaZM6QwSJAmiZB7x0yMSGRLzuN+yjBfV58eA
 Sqrqw1kBgHmvrAcpG8gAxQFohll4EZgeirToD/t5Qu08geUwnk/dV+UWnOpq8u8bQDpUKRRtPwZ
 HtB8C4seC/5S3tXCfNpgvAnPUgr//nFqIA3z99DGmipGmzIhMxT3I3s3FmcwbZYXetzETgegIG3
 JbxBM+LoLpR7nKzNfM1G2EmIKqObBxk86Jw5JlRA=
X-Proofpoint-ORIG-GUID: Uj4zkEK9S8LIzfodNFgksCg5udCw-sh-

On 2/18/26 17:30, “William Roche wrote:
> From: William Roche <william.roche@oracle.com>
> 
> Thank you very much Yazen for your review and all the suggestions!
> 
> v2 changes:
> - Commit title changed to:
>    x86/mce/amd: Fix VM crash during deferred error handling
> - Commit message with capitalized QEMU and KVM as well as the imperative
>    statement suggested by Yazen
> - "CC stable" tag placed after "Signed-off-by"
>    (The documentation asks for "the sign-off area" without more details)
> - blank line added to separate SCMA code block and the update of
>    MCA_STATUS.
> 
>   --
> 
> After the integration of the following commit:
> 	7cb735d7c0cb x86/mce: Unify AMD DFR handler with MCA Polling
> 
> AMD Qemu VM started to crash when dealing with deferred memory error
> injection with a stack trace like:
> 
> mce: MSR access error: WRMSR to 0xc0002098 (tried to write 0x0000000000000000)
> at rIP: 0xffffffff8229894d (mce_wrmsrq+0x1d/0x60)
> 
>    amd_clear_bank+0x6e/0x70
>    machine_check_poll+0x228/0x2e0
>    ? __pfx_mce_timer_fn+0x10/0x10
>    mce_timer_fn+0xb1/0x130
>    ? __pfx_mce_timer_fn+0x10/0x10
>    call_timer_fn+0x26/0x120
>    __run_timers+0x202/0x290
>    run_timer_softirq+0x49/0x100
>    handle_softirqs+0xeb/0x2c0
>    __irq_exit_rcu+0xda/0x100
>    sysvec_apic_timer_interrupt+0x71/0x90
> [...]
>   Kernel panic - not syncing: MCA architectural violation!
> 
> See the discussion at:
> https://lore.kernel.org/all/48d8e1c8-1eb9-49cc-8de8-78077f29c203@oracle.com/
> 
> We identified a problem with SMCA specific registers access from
> non-SMCA platforms like a QEMU/KVM machine.
> 
> This patch is checkpatch.pl clean.
> Unit test of memory error injection works fine with it.
> 
> 
> William Roche (1):
>    x86/mce/amd: Fix VM crash during deferred error handling
> 
>   arch/x86/kernel/cpu/mce/amd.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 

Hello,

This fix has been reviewed by Yazen Ghannam. The code tested with 
QEMU/KVM virtual machines on AMD platforms. The commit that is fixed 
here (7cb735d7c0cb) is present in the stable branch linux-6.19.y.

Could you please let me know if anything is missing to integrate this fix ?

Thanks in advance for your feedback,
William.

