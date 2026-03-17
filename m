Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4111E3644BF;
	Tue, 17 Mar 2026 20:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773778043; cv=fail; b=mEpHsHw2th5Bt/tDUgH+ddm8kPtwVkk+8mYN+G0CeIzxNjZ0FlsM6ETCOrOV90mm5tY0H6N7lLtRZrBaSuH22Ro2Cj7Edxur7bcITigFjoEJ+yIIXoMbPzApkYikME/6C5KfX5cA4tH+N1zDBJZ4xPEx++gbUkmVYYUEVoHT2QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773778043; c=relaxed/simple;
	bh=KHvrem6yhONJ7MouoVbOPvOKHEJlZ4khtiBuKmCVlxs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LWkOjmIprkVzMRhXaAmt4RYZPXmNj0P+6HzguM98wr2JDfVEWMmgWwe2RPl7MA0trJSpdNsZkd2n79KTuuoCkjwtauBpFUGe1WkrtVROR2gxs3gpWZvre/e4osrQnHFwQWjxloCS45u00/iWpXY8apqbnAeh701WbxA1uzqdlOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DoarZizv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EOpWxNp/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DoarZizv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EOpWxNp/"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIujdH3050954;
	Tue, 17 Mar 2026 20:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=96vjl8BX6uYANozg2u7wgQgXNCjMQlMweYky+mr8ShY=; b=
	DoarZizviENASRvS9qhQbkrNLFl10UBV0oPRhNnnujwFu5Bj2QUb9Ldb7XJKwtQv
	VsheQJQQaREAZEj3hcqXivJdwLsmuwvi+3vEj5QSeJsxNOiJfLFFpEuomJGlZpD8
	VWhKpQqsQt66lMX4Dn2zPIlY0r5fhdmNfMM1a6zaUKfCUkWKKVpFZwHHzrUubDWi
	LNBo7FFwNFVq/0+8CCI0ye4FptaBpWOvXjExgtgtPlqm05c9DuSlHDYHY2s64hC/
	kAPKuUjAABYoJXfbSDBty9AleXhJ1ULjJhws6tMB9bzTVCfwXx+tmRo1LOXO6IRG
	7UgbRzZKt/aNbHoJX4cCAg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvyqbvvvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 20:07:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62HJpL9J022063;
	Tue, 17 Mar 2026 20:07:01 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011039.outbound.protection.outlook.com [52.101.57.39])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4nxaf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 20:07:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1vJ5g7uHdsMX8+VyVjKQtYqMigtm0eToLhXFNDp1KttEbTGNi1gjGGKE1O3AOlLS8I+gmqQpkHEwSTjgWEInQwFqcUlBLEvX86XtZtXNZqUCnZZGTK4PQhJciBDPLJ21jdtLrsA/SY5k7FnEvXFpUHZfGJn4b/s5OfeKX5sbvXuiTSdM82JCgUAv7D1hOCAFm3UQFJ6KJls1M3G0UMB3I1YRFpYOnKiJhC6B6l3uk3GR90GnxZR5lSC6a78iiKfnnl9zL2RhoAXBnvsruz39KqJpud/1cc0YM1uA65vRTEwnab1L92Gr6ZpHnD0BHm/ivFQ3FDHOz2jvtWIYcq5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96vjl8BX6uYANozg2u7wgQgXNCjMQlMweYky+mr8ShY=;
 b=w0e8BAnndhybCGxdgwn1t6zl9PKa9Gyf1UZocZ2X8BdFh4ZEeLzBnJy4zcUeZAZlNT5XSGpGD1LWZwCrsdFfB0oALqHZoFL3TpJRh6gtsg8xbqR+1PuXHs9CaQ/yCSklzt2O/+f0rbruZoHyAEsr17+4f3hbbCVckQcw549iWjRnJtAUDSaeJhlMQfYIgdiSMFDNR/I+/S4tiNXuH9sHscEX/PDoNr2pLyqOS5HhxiOpHDk9CNHg0Qr/pc91GdKtke5V4pGkv/xCFkVGBGKF0ai4xuljzLzLCZfwr/hxLHIoPLTYX9nfwZpqzdAYvYtf7Ds/8SiVHHNC5h2IofFihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96vjl8BX6uYANozg2u7wgQgXNCjMQlMweYky+mr8ShY=;
 b=EOpWxNp/apu7xSRI4MPOVtye/V82XQqRYaFzqnLLpe3op4PefvSdubFocFfnQ0k2aEWn56PK+kYOCcLbbZSk0f9sTODKvGBUmAl7dnrRRzTvGjvps2xn5ZuoiXrmUd+w4CR4QOXs7sE0lJN2YAtATEDYHXrF8oW5ppllfGrkasA=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SA2PR10MB4747.namprd10.prod.outlook.com (2603:10b6:806:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 20:06:58 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 20:06:58 +0000
Message-ID: <6b62becb-f323-47d9-97d1-b1f8c7da41f4@oracle.com>
Date: Tue, 17 Mar 2026 21:06:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] x86/mce/amd: Guard SMCA DESTAT access on non-SMCA
 machines
To: Borislav Petkov <bp@alien8.de>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
        mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, John.Allen@amd.com, jane.chu@oracle.com
References: <20260317103810.2492661-1-william.roche@oracle.com>
 <20260317103810.2492661-2-william.roche@oracle.com>
 <20260317133247.GAablX_1ECCF-CKgjJ@fat_crate.local>
 <1c7f33c5-b1f2-4af3-ae82-37723a89cc96@oracle.com>
 <20260317181731.GDabmau8-FycDqbzZ4@fat_crate.local>
Content-Language: en-US, fr
From: William Roche <william.roche@oracle.com>
In-Reply-To: <20260317181731.GDabmau8-FycDqbzZ4@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::11) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SA2PR10MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: 76fd3da6-dc2f-46d8-4064-08de8460be85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	w7JNW9q6c0sOxyLaAf2D9GZ1TZkaHzU1BR4D3n8bNoaLkmGQQu2B4MZ+J1xUnckheNP4GRLbqgzUwBfaqRkLRVbeVg68WjyXc0K6z25HPOE+h8Enzs20woMx+Ywq1t4LnUMicCKjMXEz/VPwkylsirQPay+bJaRJbscdX7w2F2LQh31YYyf9j1Y5fWQCultLQ5/thzAHq+eUQczApQtb+BlB1zarMzGo5me5zMiBobPG/xrhgO6h3hB8ELaAVsH5w1pMhERM+taRXkfvWFF7LeZyv6lqYxZ8+hI/mQBlUfe0ugmte2Lv0E9cEBOhtD3r6oJEfK0ZrdoWEXT7mtLPc/XO6EyzuKk9uroDgu/DffeT10+bhmPGKlU2ynwBFJ4kopNNWaie+2eJiMiVBqpxN3Ak+K21BvnFsABY/X0HeOF9zh4Mnfb/txp8FwSXUFL3Ywvm5meGc8hOTyc2INcaNxYiOaVEgEjd0jbGIEaDBhpOWlss+U5H+P8jZ1ERLR0ee1dWyj6Uhp3NKSm3DahNIAujON0l1YLdBYoa0RQN1yIvyX+e4Rm+URVC66P2bfFKna0Os8k3kM8kEn/t0LZl1jmqh/EDqZuWKtcD8sraXecWPw633Eplck1cL6RGxRHm+QcHOgDt1XDr+bYSGDpRJyIdKEwSVIkDAUFchAmYp+6FfM4dclWzryRb8K3fW/4/Ohkx1i4m9I+rOVsFZg5uHeqDqxnmYygoApaMTlvD/sk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2lDZXFEZDdIUktPMVJBUEF4VDJ1cFRVRWtaT2M5U29vVjFRaUszbEcwMjR3?=
 =?utf-8?B?Yk56OUZCNjRvdzhwSXBRSWNoVVYxUGJHeEFmRUQ1RURxclJRNWNsUmZYTlJO?=
 =?utf-8?B?cURMbHVCQjJTK0d3KzJkeUFocHRXeUI4bmR6M3ZkMnE2RXZHdkJLRUhNSi85?=
 =?utf-8?B?NUFuTG4weEJzZ0R2dk1rZ0lWQmJUOUVTMjNxQW4zWjJnVFhRRjg4TEswVUJj?=
 =?utf-8?B?OGFicUxaY1YrOC9vY09YQUtzTzBPYXNhVjNDb3VvekpQYTl1ZFVVRHA0cGNT?=
 =?utf-8?B?VXVObjJVeDMyMnlPSnVMNnQzcDQ2ZytLZDFwczJkc2hHeEtkRG9WV2NkN0dE?=
 =?utf-8?B?RDJIaWNFdHAxUnVLVHlPUkY2dlZQMndOV3hlTmNnZWpTSzAydjdqL0NOcGps?=
 =?utf-8?B?aUZrQk1ST29UQXkvSnM4bzJpa1JtR0lxRkg5ZllEdU1Qdnh2dkNvekF4NlNE?=
 =?utf-8?B?TGxQYUl3VmZNQ1lMdkhQWFZJWVg3SVB3K1RMWEkvZ0dwMjBFOEFhRXZDek5S?=
 =?utf-8?B?WGlxZWVSU0ZTKzNoZUZObllHYjFrRkJNRVR4RjFBaytpMm9Tb25ZUm4rOXFa?=
 =?utf-8?B?OTQ1dzZqdzYrekh4S0h4allmSVo3NkYzSFhVeWFORENyYTI5amdKa0NoeVd1?=
 =?utf-8?B?UjgyVTN2YmZMRHE2R2lFVWhXNmZQTkxTTWV5ejNJMHU3U3dkTEh6Q1lzZEFv?=
 =?utf-8?B?ejFYUjhZMHprczBkTVlNNmdTbUdNQ0tnWnhJaTU5ckM1ZVp1a05LcHJlNWUw?=
 =?utf-8?B?b0FjYWI0RC9hT1JjZ0pKOXFHNnJUL2hncnZ5c0ZjT3dWWUxKOUZyOW0zd1JD?=
 =?utf-8?B?WGU3TWxkcy8xZ01wa0c0R1hOd0FOb2VlbnZmMHh1RHg5Tk4rV0ZYZ3p2dUh1?=
 =?utf-8?B?RUk4M1BNM3ZZRFQ5UzM5VlhWYm5sdDJBL0xvOWx4ZDgzQksxdnE2dlVxWEpN?=
 =?utf-8?B?WFdsaUxVVzhESjZ3Q21acmJ4aVhUQWdIeUd4T3JocktBbHRUU2s4MXlmQW9R?=
 =?utf-8?B?cE5CN3VsUVhrUmJpRG16UGh2dnZlRGhjT3dibHR4RlJtVXpvaWR6Qk9vQU02?=
 =?utf-8?B?UE55cjVvU2hqYjVyUElhSFBDdjdrUFozZ0hldjRZNXdJOFMrTU5CZGlVMmcy?=
 =?utf-8?B?QW9NNDV4OTBkZGRqaGk3UXlablZ4d2dZODQvZ1RobmRrSUd5Qk5OVDdVYis4?=
 =?utf-8?B?VXRubWh6QjBlWk9JYUlYcmM4eTNHVUZJRDE1NXZwVzdXa09naVNJK3JpQmJ1?=
 =?utf-8?B?V2d1SUxRa0g2WEl4Uk1CZDlxS3Y3Y1Q2eTlKeXJDNHVaQ0NrVlNabE5MZDlh?=
 =?utf-8?B?VTkvZ3c0U204NjFLZ05uWHIvNnJNc1N3QjNkNm9adVkzK050aUp1U3BuUlVE?=
 =?utf-8?B?RXdmdGJtb0dJdWsrdUhrTHRhc3c1UStka0FxaE5oZ05NR0I1cjZERUJEZUNi?=
 =?utf-8?B?S0YwRWU3THNOZnlLbzZiZ3FLQ3NCTzZWT2VyemlJSzg3Z1ZQcDhjY21qTmRU?=
 =?utf-8?B?MmFFWXBpU1hjanJvTlgydXRvaE9qekQ4dEhLZ2VDbmFoY29xaHRtL2tSMmRC?=
 =?utf-8?B?Rmk5SE5jd3pOenlLRUhJYUZsRi96Ynl3MEtIYXQ2NVkwU01KVVlIRHBTZXJK?=
 =?utf-8?B?UHlIaGRCSkhYcVZPTTZEcXlsYmZ0YmhyZGNGclhyWVUzZjVUQ3prMCtEMlEy?=
 =?utf-8?B?WFJKK2ZuVWRqd0paNmlleXlnclZySUJNTW5QZ2pUTytaMHV4TnMxSjUwNVNN?=
 =?utf-8?B?TlpsbDVOcU1nMTJ4djhVcElJMWF5ZWxBeWQ4TXZaZ1RvdEpOa0NMbDk3VmhH?=
 =?utf-8?B?eEEyazMwR1FIMlRVQnAzNXliR01tbGxjRW81ZVIxeWQ3L2NRa0dxOUNJY2Z5?=
 =?utf-8?B?NVZ5RjdUTStyV2l5M2hkNElEY3NsYVg4VTRvbk8rZmZ4TTFmeWthZXQxOWkr?=
 =?utf-8?B?c2t2ZGRiRllpWGpXdUxzUDM4dklUeXdTYkxISXh1UnY2Q0pERmxUVW9lTSs4?=
 =?utf-8?B?OHBaY2JnVExDbVd1VmZEYjFaT29kTXdYL1dTYk9ySkdoQXZ2dmRzTXRIakkz?=
 =?utf-8?B?blNNRlNQTDdOak9MVlBnbmYyRzl1WUE2UDg2ZGwxMXYyRjl1aElIRldJTkRQ?=
 =?utf-8?B?YUQyWWpyUlRxOGhvaGZoTWtnY0RHbkNLbTJKOEVhaUtVSkN6cGExL1JkdXBI?=
 =?utf-8?B?N0ZxTUNONGJla0QrSW5QNWJlei9lS080RmN4U3MvM0RhQUtZckwzU3ZZdW1p?=
 =?utf-8?B?cDlVVW1WbENFVzJkT3J1SmQvSWQzbytXOXp5dGNGQy9aa3phaWxKeVRDSmNO?=
 =?utf-8?B?aFQ2dlpOZDA5dGhIcEc0YThJazNQSzh4ZTFWR25MU2VGUUJKa1NpQ0E0WG5S?=
 =?utf-8?Q?noil7e8xqdP36oj4=3D?=
X-Exchange-RoutingPolicyChecked:
	UljCHmLkWEkblTXSGMJLd88/rE7/qYBT8Hy6qsjqhA8jgZyLluaFE0vpOFnqI/Gt6kI7TZyFJsKrLvkzIFOanrfnVUKYSPlqMSoLD7GsgUocex1jayZTDLyT1vAQZU3uloqkfN9RUgvKJt/N6HFV1Jk6mAWkpuzSyuGiMc3StM9VVZgD4ew8gvjt7xDr3twWiCWox8VITdEeZ6Ynvah8Xha/na9MCaATLTd6KQBZL7KJ0rZEcOkp23VPdJ6rjdALywxujcm8Yue7e/mbw7ZWrfLTlFuDI8/0QPvdPDir5itdXNKXwOz+M8zGu16aA+aXNz+6kFY5OD4uNErcIZAI3A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DcgbL59Np4q8SKNln7Jwr7OLwVoweJpuSCoAcIjgFSN3x++L71HanYGF+4Rv7GPTHArSiJ3EnlBtOQfcSbcJwydpIxI+Ov+GgxRfQaA5vvKqGIW9otr9NGIeMptXjHNgRDPNcbeSns5WdzO6TOIqIsGuc6c6IyTKQ35tPlRrJp49yugrzqXahBSsqXfu1CGxO0I9cIFHGF7TZ9NHH1UwlGWbRgilDGinRGtziUoLcGM9j9Lju7c7UxvqgV9zVMf7VNX+TuOlQExbHS/2NU67DGP/rW8/I0ub6Jn3fuc1/e+TdAHDnxQlPFR6X4s16HeSuYSycHszh74JpmGyzXv0xfZVFaQMZdHP8/uWTpXuiRnAZYpwKm8TEr4iSLEnXpK0dE+8NjYLXtaQyb4TbBwKpLX2BauoqWJdgTZ9HuGxIMDwAfTzkw2L+mcx85rUOfQLEHu+g6/8v/gmPSxJcJM3VeSj3KoMiZBo0TKuiMOLs/5j5JH0llzHbLJB3xewUzUk9KG2IWvEHlK3a1q4JAD1UBaiiEOqVAf45R7/sNHzWGR/Kxzv0O3SH903Hsg9GJAwGxP98MTmye5o5dWttxIPwJOvHj2s80fildmVxWZXc8g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fd3da6-dc2f-46d8-4064-08de8460be85
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 20:06:58.2782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJunFw+dujMfKKihM96eHK/vovvqjTrESKQY3///sRGr5DmLhtarwasLmWTF9N8aMGgDwdh8cHMZ/b2ivZa1BK9rWCu+zIRjYnUK+6wfE7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4747
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603170177
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE3NyBTYWx0ZWRfXwrQ0jX8pmjQO
 8OEYOsho6yCCFeSX/JE6TfoIlGzAN04iwAgC03HTB6RYlTuWYR1gjePC29pjBXNhBZ3TznfK9a9
 wg87wEJYIQhD1ZijDPJlZ3TgI6CrELc8j1SSQ3jY9QEOvYsqfOteHMy0Nok+DiDiXiXKQSttU3k
 V5gohV3ggxfz7WatmuL9f6ZT2eKTcjPGTbrRJsL8htg+Xa/mYBXqku+N4fOB/fMM89CyChXBtzB
 jTcSYcet9YPJNPuYjwiEefzgKgh+H/aFQnXKBm4rlEBxdcB78X9+z59txaA9S+GEohvwLGWHdlP
 XBNdHvIXhqaZ3SawtnWvZ3kBD0CImOXvJS3xKhQe6xxFOV1sz2nhzrZLTBWmrhJHdQ95L2Ywzex
 ypyz3D5+DjV2PNEqReY7I+LhhrRRQu/Bvf4p8Q8Gg7c4bg+Hv9bu2NcWvwxVDgxiDSzggbHxHyh
 C09JrEBhogrn2G2T9qksoFS0o5Ru9++msBS/RenM=
X-Authority-Analysis: v=2.4 cv=J8WnLQnS c=1 sm=1 tr=0 ts=69b9b465 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=ytDBNYuGy20sedwZuzwA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13824
X-Proofpoint-GUID: QArb6zYRHErxXgZHJ07OlUrhp8kStNBF
X-Proofpoint-ORIG-GUID: QArb6zYRHErxXgZHJ07OlUrhp8kStNBF

I just wanted to give a small precision about the VM error relay mechanism:

On 3/17/26 19:17, Borislav Petkov wrote:
> Rewrote it again after talking to Yazen. A patch needs to have the proper
> justification why it exists!
> 
> x86/mce/amd: Check SMCA feature bit before accessing SMCA MSRs
> 
> People do effort to inject MCEs into guests in order to simulate/test
> handling of hardware errors. The real use case behind it is testing the
> handling of SIGBUS which the memory failure code sends to the process.
>   
> If that process is QEMU, instead of killing the whole guest, the MCE can
> be injected into the guest kernel so that latter can attempt proper
> handling and kill the user *process*  in the guest, instead, which
> caused the MCE. The assumption being here that the whole injection flow
> can supply enough information that the guest kernel can poinpoint the
> right process. But that's a different topic...


Relaying the error to the guest doesn't only have a value to target a VM 
process but also deal with free memory or clean file cache memory 
impacted etc... Cases where a memory error may not crash the kernel can 
benefit to the VM too (Kernel RAS features that are, as you said, a 
different topic :) )

There is also a small typo in "pinpoint"

>   
> Regardless of virtualization or not, access to SMCA-specific registers
> like MCA_DESTAT should only be done after having checked the smca
> feature bit. And there are AMD machines like Bulldozer (the one before
> Zen1) which do support deferred errors but are not SMCA machines.
>   
> Therefore, properly check the feature bit before accessing related MSRs.
>   
>    [ bp: Rewrite commit message. ]


Thank you very much for your feedback !
William.
