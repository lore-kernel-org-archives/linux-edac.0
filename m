Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4987639FCA7;
	Mon, 16 Mar 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674800; cv=fail; b=QsPY7dp/TF9crWi6PsaaiPh45E9k6erF0AlyI1dk8c09d6tRU3NcdDZMAJdP0uoXmOGs4SH1GiFQLim2JETekshLmydlCH2Mv5s1z35CO4jelf4kGPHjRTv9Kv4j9JdCJ79huafO3e1CyZ5TqPV17WuMa3crSqASyoW8/nTx944=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674800; c=relaxed/simple;
	bh=90PEiz6m61dPwkOR6+YPgIxDzUrvXQYmK7RMB/m2n/g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pDAOTse4LnPtIsLl7at/Mn6t2PgzkjaF/qFqCrrtoqKjV+ubtrt7qaC3u+Zr9xgD+2qyJEoJXlCQDtFKcKmfx4B0GFs2lsMO/kALz4maeJEiXw6Zf+eaxp9GmbM+bgQctP65TdTYKd2HioT7k/kmoa6OvPhskHF1Iz0rPR5sHpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TRRXfWfi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=agfuzAsj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TRRXfWfi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="agfuzAsj"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GF9bPX1711179;
	Mon, 16 Mar 2026 15:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Y+a6Y950B4YK/rr3zjZF0Pkwqwm7P8oEyczoALebAGk=; b=
	TRRXfWfiJmuR4QHe6gAmDXtnAU47p87PXFE9GvoOy+yvHsIbKJH0ImTc9tW8fXBV
	CSTe3FbrCCp872rJ1gIkfAkv8o4bTJPRfIoZ/cXal0dGtCdJ085/Ca64h+bm21/k
	gJcfvCrfk5UhujmuMl7f6wY9v/lImGJMPEMpTWZijuAXMWIkOMCGTOxl6sZbo4iS
	Ed/ydT/gD32xdxhsHnQ3YFOGEKCfLiRy2xEBmvVxfsxkWCF44+4TJw5uwB+vzUIz
	FEc2UL4dQro4gLNSpyXgBKvhs+1IO1g97EUtBa67/epfRfzCo+9rjUAaFcJRXG7b
	SkFuFvZ7mxXLQJsr28+GlA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvx3b2fsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 15:26:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62GF3B2t001131;
	Mon, 16 Mar 2026 15:26:18 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx48sjnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 15:26:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRGxAFDdMBW5rg0VdKJ3yx24dyk/623Y/DoDsEJkZBwOZ8EVfAbBr+hkcON1aW7vMSv07HPocvi0sjuWZfPgG3FI6mivdw82Hu8AYNvI36fwoxw5zys6iAvx0IkP5iZekGn3QzBsgGhzHCS7Bf3vFM7PPzVNMrol0DmPSvLJsVIK52EN4/9PqWEMR7QLYJ3gKE/TwfO0U7FXBoUY9FSfhHCaiDVSHZuNugNSPw3+D14czDaU1ScnI5WKlLq5LVBDHATIOJ5RSslhgCG+d/JFUCON6jFKBhlCpBBgmmlSIPXP/UdIIEBAdagfQFSdGwgJAVicW09kT39txMJCN5Fnyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+a6Y950B4YK/rr3zjZF0Pkwqwm7P8oEyczoALebAGk=;
 b=fWHgmsveSUu7nh2w27/HznSicLJrpI/2YfVCWAGvZEDI+LUB655f8X032QU1BOONI+HKPzBfQ8cq40cjgFx2bErdzsVorhb2O+JAhoepR+AtunAoNxKB0zA4toAc1gG0GpmlsxbEIUfvPr/6+eEnd1drJMyALPfkINlbJVzIOLXlF8qNiFb0WCYC1kUfyhWYa5Rj1Kj9DDKRtKfPq2gTdcJyMGhc3DvusFVIO5jXC7LYRVRhCupqex4RKK0hSK1qcvJ3zCQR0rVCysnd4n4qgZLbPlQD92v7Ye0idXocj3aZ6CbEM6PSDAIYb27/wubhatYEfoi6zGXg+LLI3pG4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+a6Y950B4YK/rr3zjZF0Pkwqwm7P8oEyczoALebAGk=;
 b=agfuzAsjhduLJDUuIlVzcfVIVrFrfX8KKQi3D/xVm0VRRiO5kQ5vE1OmrEFuNKhvQNQ/VipwD8nFOQUvG71zAvWE3uHPGG6g9s8NEK+Nwh0IC6JIGzuDVtFXpkW6lmH0pGg+7hJkkltEryPWP4vOkwfbjcVh6dBAy+QvaogvW2U=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 15:26:15 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 15:26:15 +0000
Message-ID: <1221e4c3-31f9-49ca-b50f-e79d37448d4e@oracle.com>
Date: Mon, 16 Mar 2026 16:26:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/mce/amd: Fix VM crash during deferred error
 handling
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, tony.luck@intel.com, tglx@kernel.org,
        mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, John.Allen@amd.com, jane.chu@oracle.com
References: <20260218163025.1316501-1-william.roche@oracle.com>
 <20260218163025.1316501-2-william.roche@oracle.com>
 <20260312144203.GCabLQuwFySHkkCyBO@fat_crate.local>
 <8e35298b-7511-4f7f-8f13-9b03738b286c@oracle.com>
 <20260312160453.GDabLkJfhslCLXZntv@fat_crate.local>
 <ff7008cd-db47-4a0a-a74f-dcf3e6ab1891@oracle.com>
 <20260313202618.GA221731@yaz-khff2.amd.com>
Content-Language: en-US, fr
From: William Roche <william.roche@oracle.com>
In-Reply-To: <20260313202618.GA221731@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0502.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::9) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SJ0PR10MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: bf235656-0b46-4a75-5149-08de83705d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wnACyzY1gQnjRVxHIM6BtfBWk6E37AOEqLe5V7QqfSnn+3JltUdomZa1tbt4Tew5snDm6vUkNUqUhFzmc//MILDj/0LH9q3lMsHZgmsuR6SVtNYWHoXgHHfr5T3/wxGJjlmqeqRuNgvFUvTGDpGUEDpN6GC/lf+qwBw+j9bNAPksqxTxbTFCZ0cQUlvoIGFNUApkuAyDM3woVpxb+tiMOW6x2DHjV9IJozkwLyOft0WedPTYc+lIIh92OINu6/+3ODhylkk1UYMyvO3kWxgkHrs2+EvMlTi2F4J4BOPLRAtEQpH2n1VcPLf4ql+DkfsAf0YyZuNYJwnDSn+Dn8kpR8+VL2Blqd4nvlwHebBYLI2nPXKa/+R2o4lqWhp6xaClJRU/G15GGChVchsqHZ8bi5uW4SrQL448VbDa7rM3CpYplwJJESGAxu3qci9v1sFIz/R5HCewG8+qB3s2pP8PZkCN2mJcORuzwz08aXjvdTtvDHc0KNCpH16WpNlHR5pTWKB86g3Xmz669iCQh7Bw1g48o9VaqVNDjPBGUDTKNKJZM3bUgNhUuAYoIzIXpondxe6fTKOoLjstkud5HSi3GRM/AAqW5gxnms8NDtZByJjROgvrWzxsfL6X/gMpzZYTYIcDHbRSaDHISf8mxDkyLzSn+gMWs4+ej6//hI/eOeIDNR5qSPzlDBYKOqIVcDp62tGTe2S5CDhyJ/AOZ9HzZKu/UPfPYRWhFLgEYtV74FM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em1qRE9McStCOTZkMlIrTlRmZU4zdU1ZeWUrRjNJVm5rMHJIa3I5VGlkVjhp?=
 =?utf-8?B?eENONHhaaCsrZTU4bTA2NzZlU3ArVkc1UEUzRXZ6aVd3NmtiMkp5eFBVRzM1?=
 =?utf-8?B?dEJMY1JTbmpJaFFtSTJhYTdkYmZteVByVDZMWVlEZnhYZG5LditNRWJseWsw?=
 =?utf-8?B?aG8vdGNRQUZ1eFoxTlREeW04YnZVUi9pUnc5VzBYbDU0Vy9XTFRnb0lRWEht?=
 =?utf-8?B?Q3RYRTAyRUJDN1cvb1RLak9xQlRhS2h1Snh3Tk96ZlhablgxcU5NWGx1eDIz?=
 =?utf-8?B?aGZsSHhZQndvL1pTRXRoZjN0NW9NZWpxUjdoM2VqQThwaXpnT0tCZktYeStY?=
 =?utf-8?B?Y3ZPSU5lQzR2S2d0UGhmK3RJRmo0c0xCUFNpSGdvdkQ5NXNWMExKYjJYU05M?=
 =?utf-8?B?Rk16dmpic0pRN1lSN3crWnJIQ0hONDh5V1ovY1JZMDlLSVpnQ1JVV3h1eHBo?=
 =?utf-8?B?T3M5S3czRkc3TVRyYWpsVmlmbHFRa2R4MDlxaW10YUY5SHRBWkt5SldFOTRo?=
 =?utf-8?B?eWs1UVdma3JoaUlJamN3eWZ3SVI1cVl1bVR1aUlPSEZHRTRuSGh5MzljR28x?=
 =?utf-8?B?eTJlSTZ3aUZ2RWRYMXdGUlJqUkU3WnQ5V1Zpd1J2ZHVGMTB2RFduU3A5Rzdv?=
 =?utf-8?B?UWN0aktSWW9qMTJRUXdMVW1BWnRiZm1XSGQ4TFVvU0V5R3kvYzE3UHlLQWs3?=
 =?utf-8?B?dXhGM3U0SkNEY1UxeGwyNVdURXdudDBjTzU5eEs0UHJydlJiNUxmL0JwazhU?=
 =?utf-8?B?VDEydW1lbWhOVzFqQnA5MkwvSnZ4OVZSRk9nMCtGOGt0UmJVWUJHNXB4ZTFR?=
 =?utf-8?B?T3Jxd3loTno5UnpzdU5EM01BVkJDYjlsejREa3Z6TERTM0RaZ0J5WUhHZWJO?=
 =?utf-8?B?aXRxWEFRaHpRck16MDVSUUVlS1hCRXdsV3ZHQmZBbFdKeUEwN05SY1hkZlNB?=
 =?utf-8?B?U0l4TjVkWitKSkx2UGZIWVBnYUMrZ1dDTk5aM1VsZWZVQ1QzY3pzZTNvVUJm?=
 =?utf-8?B?dlNzcFJtVURUcVA2MDZ1RitpNWtIMkYvdHZrV1ZVRmdqbHNFY3ZNTFlOdHI3?=
 =?utf-8?B?SWNySGYrVk45RXYxVUIwWXN6dGFuZjd2WUwrZ3RVWmdJZ0h2NUxXMFNNU2FM?=
 =?utf-8?B?TDRaNkNwL2NQQWw1NXluNDF2bzEvdUJEc1IrZExZU3djVHZUdkpVNU9MY3RS?=
 =?utf-8?B?aUt5bVVjYi91OFhManEwcjRIU1BoRXZnVGFQWWY0MzlNYjRNKy9lbXgrSnpC?=
 =?utf-8?B?NW5GL3JPOGxGR3QxaEN3NVNlazczMk8zelR1N2NZOXkxVUYwbzZKbDJIL1p5?=
 =?utf-8?B?bDFlcVdnVDhQOXV6SmhTOUlmNk1LcjBZRkhKYkZyOTVmcnJjZE5HaHVVWGN3?=
 =?utf-8?B?aDB3YkdHRFFyWFViWEJCbEVMSENtUU9PekVZVDBEUS9aZUpQVHhDRUJaQkdx?=
 =?utf-8?B?UjRISTgvMVZtemFYN2U2V2tOK3J0S0xXVkxwbVBuSTk5QlBDdG5Qa2tsU1Aw?=
 =?utf-8?B?aWxXaUN2QjUydnprUGJDZld2WVBVQVYwTFVub0RxeVFRNVh4bEhTSkV2cHFz?=
 =?utf-8?B?eFgrTkprNnlUR25leSt1ZTRpc1FxaHcyQktzLzV1ZVNnMSthdHd6RlAzcXFq?=
 =?utf-8?B?RUQ2TEFQRkdpVGI1UzNwRGpqaVIzNFhOVHkxSzN0eFFLRlJPaWFYeXM4QU4r?=
 =?utf-8?B?UEUwaG1qVEI1SVJybDhlOXJBODBxYW9ZNVo5NXFCbFFzajRnbHRocm0ySnFV?=
 =?utf-8?B?WGZkMmI3aHIvQWJPbEgyaE05c0V4SUpkUFF2TnRvQS9Sak0zVjZBZlg5OEo1?=
 =?utf-8?B?czhYcnMzVGIzK2cwdlI2NEN1U1ErOGsrVGMyNTNDVVBiYjllNTg4RUVSMWdl?=
 =?utf-8?B?VDMvQ0dVVzNVTTBUaHJPbGM1SEFmTE85b0JONXdMSjZtOS9NcU05b1UxZGJE?=
 =?utf-8?B?VUIrQWVTU2pWVW9vOVZoci9VZGwzeFozS1hxazFnZkQ4OUhoNVdXbWlaRktM?=
 =?utf-8?B?Q2ZteEU3M3ZSL3M2bzVxbVpTMDZJc0lzZXBiWTUwS1A1elhqMCt4cW5UMlNQ?=
 =?utf-8?B?akxaVjBZKzF6bDlXL2tQdzlsVWtUbHJtekFPaElTMUZRN0laNkVaM0RwLzUv?=
 =?utf-8?B?SmcxeUZDaEpUcEpWeUFZOU5qdXVsUy81UGlob1NUb0NsNSs2VG9lV2E1OUYw?=
 =?utf-8?B?Mjh4ZWI0ZXdUTzVoTC9BZDR4WDFNTjRxeHU5VFdIK3ArN0NBaTU1dmNYL0J6?=
 =?utf-8?B?ajV6bnZPRmRhWmFYeTlrbURhem85TWZId1dYZ0w0U2lQTFFOMlpjbzNDOFY3?=
 =?utf-8?B?Q2g2ZFM4dU9RMnhPbTFnZ2ZsSS9kMStlZ2VFbXpBZ3dLckNwS3JUUzBuVHFK?=
 =?utf-8?Q?PNDm/14dC68F0cRI=3D?=
X-Exchange-RoutingPolicyChecked:
	qbKOee6Z4tPZZHqEoHsLBCjk/mtbaYVOIARqB93JMzNYy4tV92iUflBmDcHg+mQ8pKeW87k9EbL1QBB+s7B25b40E3FKdz61ucerNPBtB/n5bZH7o2hHFQxLasXBPQhPjRbWXfb1ploFRPONoeaZxpHmCavEwHnyJ2SO+uc85sFL+b15pOyQhWfze5c9nwr00I/vULvG1xuKz3/dfB0SJ4bFfU5sEVDcUoAKKKWAEwsLKuvLBm1/sAx9KllNJwdidXJWRwkseRofciujCKeeCKnXzJkpPJCRGKuaNd4tXUA9vPLXGSdz77lK2QuGMePEUw8H3rYYust7L3cXG8agNg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	773S8N6nD8uyl0/Zgktp06ycFW3DCQh1oTk6PViMgo7IRT/935bLr+wksAPqu01kR1eKc89NSXRhD+6Y5ZsGyhmPYfnjfJ3fEE2J5elhtFFxuvP7XmbssvHvDC2T+rDTwnwlXKkzk2CO0STTSyGh84vksDJ/eWCpAotfe0ON4WufshCXI6frhmf0hxHBMCTcLNr5YJNb0Byv/IzUMGvAMddPiAGZjf7YywYy1MpDlnrjcUb+1actv+n442I/xnYBCAkDZQNIkt16lwzKN1UE7DiTjtoaPQy/ek0kVQ3JW2JQVECW+YMc1hNrRo673j3kh29VqOmox6plYxaNev98cHB+fMxbBP3R0a9m8lUQlGhTM0YIjESEzq9p7nQyqJ5I9vFgJXGC1nWRM5Le85WaicwHNv/4urDoK8KA9UU1jHQSGwsfRK7NpsT6pAfoNOHuVp5U8Ypb/hsKnYmwloMuBuPawHFGDXOTSPFrdJ93MFwxXe8YRdy+/zc/+2AllNgPmp3GexUCXVVAPynFyC2XfKRf37ZDiT2eSF5EituO941AQRmU5LpKF3UTCirJQ6X467MhrG5X4IQCpJCbGcEetfqjO8a0owp7u8SekSWEseo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf235656-0b46-4a75-5149-08de83705d1c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 15:26:15.6833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJvKZoO4q3PmkgzE32epjDYK4oEg3aEO+0YX738C3ys0f7dy0JhR12zIXHcFM3IJHFib27Y7TggU6bZSVyE5sUGLecgwsS8db5cxnKgeMks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6350
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603160116
X-Proofpoint-GUID: Myfb8xvj9pvLT0z_ntcZnX_6QGw-x2YK
X-Proofpoint-ORIG-GUID: Myfb8xvj9pvLT0z_ntcZnX_6QGw-x2YK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExNiBTYWx0ZWRfX9pnRMt2okpbd
 Otue9IKh6OEBXHey7gW2OeicXzXPqQJsm7rdBqGIK3N8sBRgv/woTj83ZHkMAEiFNIP7G/pACMr
 Hkbv9W3O1lUpVQdoWeCVEQ+FypCNmNRIvHeJ6HSOVYdPxcWvb/E+un0GymwREeu4cwHuIG9iN8L
 10/2OC/kOdOzC2KEWpgFKctCOV1qSXq4JJpFfE2paRRfG7xTDf6stDROPHYp4tLrG0W5VhuVtlJ
 +gBXi3eHd1KOtXw2VkLY96AS0yX8UmgxMJRrKRPJOSvzmjVIqyuZU82Fvys0bPMNXrBTvoY8vdk
 bsUX0I85m1lK7Dj+g9PaYbdJb3LGIEgEkqojpSbAFh4f17wiJtoakqcp4NaCizk+w2On4Uhh+eo
 AWNV/Ifaol4v1oSClAnvtkG0A1IUByjeLDTb4vbO0FUx4ihYkcyVEuO80ejK2b58o1EO11PNYm9
 la0aR607wzgIo2hd29g==
X-Authority-Analysis: v=2.4 cv=IN4PywvG c=1 sm=1 tr=0 ts=69b8211b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=AC41nx4fpQk4bs_jqkkA:9
 a=QEXdDO2ut3YA:10

On 3/13/26 21:26, Yazen Ghannam wrote:
> On Thu, Mar 12, 2026 at 11:44:04PM +0100, William Roche wrote:
> 
> [...]
> 
>>
>> Yazen may help us on this aspect: Could you please let us know if there is
>> an AMD specification for accessing SMCA registers on non SMCA machines ?
>>
>>
>> Now if we had a valid case of an existing non-SMCA AMD hardware that could
>> crash on updating an SMCA register, the fix would be needed not only for the
>> VM case.
>>
>> Yazen, could you also please tell us if an existing non-SMCA AMD hardware
>> could crash on updating an SMCA register ?
>>
> 
> All the systems I have access to are Zen systems, and all Zen systems
> are SMCA systems. I'll try to find a older system to test (Bulldozer,
> etc.).

I don't think that it is needed anymore, if the bare metal doesn't show 
this case of AO errors dealt the same way (as discussed below).
It looks to me like the QEMU/KVM VM case could be a specific case, 
exposed with your new change.

> 
> [...]
> 
>>
>> I have a procedure to verify the behavior: It consists of running the
>> upstream kernel in a VM (on an AMD platform) and injecting a memory error
>> from the hardware platform to this VM to mimic a real hardware error being
>> reported to the platform Kernel.
>>
>> To do so:
>> Run Qemu as root (to help with the address translation).
>> The VM runs the upstream kernel.
>> Run the small attached program in the VM as root, so that it gives a guest
>> physical address of one of its mapped memory page.
>>
>> [root@VM]# ./mce_process_react_x86
>> Setting Early kill... Ok
>>
>> Data pages at 0xXXXXXXX  physically 0xYYYYY000
>>
>> -> DON'T Press enter !   (just leave the process wait here)
>>
>> Ask the emulator (QEMU in this case) to give the host physical address of
>> the guest physical page:
>>   (qemu) gpa2hpa 0xYYYYY000
>>   Host physical address for 0xYYYYY000 (pc.ram) is 0xPFN000
>>
>>  From the host physical address get the pfn value (removing the last 3 zeros
>> of the address) to poison.
>>
>> On the host, use hwpoison kernel module:
>> [root@host]# modprobe hwpoison_inject
>>
>> and inject an error to the targeted pfn:
>> [root@host]# echo 0xPFN > /sys/kernel/debug/hwpoison/corrupt-pfn
>>
>> Than wait until the Asynchronous error generated reaches the VM (it can take
>> up to 5 minutes on AMD virtualization) to see the VM kernel deal with it.
> 
> ...hint for below question.
> 
>>
>> Without this suggested fix, the VM kernel panics, with the stack trace I
>> gave:
>>
>> mce: MSR access error: WRMSR to 0xc0002098 (tried to write
>> 0x0000000000000000)
>> at rIP: 0xffffffff8229894d (mce_wrmsrq+0x1d/0x60)
>>
>>     amd_clear_bank+0x6e/0x70
>>     machine_check_poll+0x228/0x2e0
>>     ? __pfx_mce_timer_fn+0x10/0x10
>>     mce_timer_fn+0xb1/0x130
>>     ? __pfx_mce_timer_fn+0x10/0x10
>>     call_timer_fn+0x26/0x120
>>     __run_timers+0x202/0x290
>>     run_timer_softirq+0x49/0x100
>>     handle_softirqs+0xeb/0x2c0
>>     __irq_exit_rcu+0xda/0x100
>>     sysvec_apic_timer_interrupt+0x71/0x90
>> [...]
>>    Kernel panic - not syncing: MCA architectural violation!
> 
> The code flow indicates that a Deferred error was found by MCA polling.

This is right.

> 
> I thought QEMU injects a #MC into the guest?

The way AO error handling has been integrated to QEMU/KVM for the AMD VM 
case relies on machine_check_poll()

> 
> William, do you encounter the issue if you disable MCA polling in the
> guest?

If I disable machine check polling (with mce=ignore_ce kernel option for 
example), the AO error is not seen in the VM anymore, and of course we 
don't crash because of it.

> 
> To my knowledge, Deferred errors are reported starting with Zen/SMCA
> systems, even though the concept is found in older documentation. This
> is another reason for the implicit handling.
> 
> I see in QEMU we set the DEFERRED status bit for BUS_MCEERR_AO errors. I
> don't recall why we did that. I'll need to review the old threads.
> 
> I feel like the intent was to select bits to produce the desired outcome
> rather than faithfully replicate hardware behavior. Specifically, the
> DEFERRED status bit would prevent CE filtering condition in
> do_machine_check(). And it would trigger the AO flow in the guest rather
> than the AR flow if we set the UC status bit.
> 
> Another example is we use the POISON status bit so the address is marked
> as "usable". A real DEFERRED error would never have the POISON status
> bit; they are mutually exclusive by definition.

That's the QEMU/KVM choice that was made about 2 years ago, and 
explained in the following comment of the *QEMU* fix:
     4b77512b2782 i386: Fix MCE support for AMD hosts
target/i386/kvm/kvm.c  function kvm_mce_inject():

      /* Setting the POISON bit for deferred errors indicates to the
       * guest kernel that the address provided by the MCE is valid
       * and usable which will ensure that the guest kernel will send
       * a SIGBUS_AO signal to the guest process. This allows for
       * more desirable behavior in the case that the guest process
       * with poisoned memory has set the MCE_KILL_EARLY prctl flag
       * which indicates that the process would prefer to handle or
       * shutdown due to the poisoned memory condition before the
       * memory has been accessed.
       *
       * While the POISON bit would not be set in a deferred error
       * sent from hardware, the bit is not meaningful for deferred
       * errors and can be reused in this scenario.
       */
       status |= MCI_STATUS_DEFERRED | MCI_STATUS_POISON;

> 
> But there may be another hidden issue: handling the error through
> polling rather than #MC. I'm thinking this isn't intentional, and the
> recent Linux changes exposed this behavior.

You are right about "recent Linux changes exposed this behavior", but 
handling AO this way was intentional.

With the suggested fix, we should cover this new exposed failure case.

Now if we have a better way to deal with AO error handling on AMD VMs, 
it could be the subject of a separate thread (probably a Qemu thread).
Our current suggested kernel fix would still be valid, even if it the 
code may not be exercised in the bare-metal case.

> 
> Thanks,
> Yazen


Thank you very much Yazen for your help !

Cheers,
William.

