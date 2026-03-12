Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F296940DFD6;
	Thu, 12 Mar 2026 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328309; cv=fail; b=MYO/wY0dcOVjWUow14YmIlAyJk7uxNvAPvsKybMwAgC3ZSHiPiONvR+ctUnFBFSL4BPM8zHRVC2k/GX3C54SQNIBI9s1x8HI0v63YR8vhpVmaZB79zmWysWdh2Y/49+IO5rNkMQ6PtdCX5QN17UpDPQNsXQzFcIYB7PiKkI8ATY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328309; c=relaxed/simple;
	bh=pfP8/s8jm0j/a1ohIi7/KTHBtZb+IEpYczxpVWHQf6w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HzILuR2zPlAf8p+qq8K7oQtvsW+cvnMw5RI7X83hCW/xwYNetygtqnIsea7DQIloejdlxGfFloDBTXkNRPFSWeNenrDhGnN+ynOb/dvzUzMKqGhhTVxycFk7YJTQWx40lVk7tb7GIZGJ5ghdtrnc1mg5wcRj0qrcPtFJyj/j8Y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bxaCZLsy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kRfRkMTA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bxaCZLsy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kRfRkMTA"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9GlZH2333482;
	Thu, 12 Mar 2026 15:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Ij0GTbMsOA7UlbucY5bqn9yEU1wfICqd9BqEy0fjFAA=; b=
	bxaCZLsy3rtPKPxfVu2DFm0Q3OnfYvwel2+rUGL7RODDzMkIgHYGIAKaIz58nk/D
	RJm1KjjWg101auGldYKpW7BnP/I2oZ0B7A1U112ogzZaz80keWA+/qZluIgQctKw
	e+CkHD1dYpfzw9xDwNAHnVq7tyQe9CKX2QRM/AW0sfxgL5hTOQI3ZogWUzGFJ8pf
	IlRPL2YeAB/amJpS3tFXINe3SEO9nuCQkziRd+SZzQudSpyxkbqdhJCIlx/l1QEL
	5vqR21i6SOOdFefZFlvKBvXlSmTbPZDsbpmYTj5++abxuhWr1qgX6iNrTGeAcQ2Q
	n9W2XfzXARUjma9ZI9ZdRw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cuh4rh4n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 15:11:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62CEO6mT022330;
	Thu, 12 Mar 2026 15:11:24 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cuh5kdxqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 15:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5J/88MMG/I19rtQ7IpB8n2kzQIiiyuyAeTVaJKo+YblmNxex7C5+BGLF0qo4hSdSdimtfdE/62STatA7K+8hG7CZPg3a5kso6g5WsNOrZUJoqP/efRygtLlEEiwdbC81DPdZzXwObzrZSsv8Yz6ijcoAzUSZvKBuSw0j78H++pcXzEY5h7CWIEZe8O3FUz8YLLGQFuwqCgOJm/ywd0FJBCxpAv/ZF7jlk5O1m7gTXcn575gtGlX/VEps+b4mGfg6jbujILM7VpgwPliabv+nmrANMNLncctZplAWjwFhSEgz0Wfj2+v1aarcICbHt8WxzPK0ZVAPWTSEz81AlKTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ij0GTbMsOA7UlbucY5bqn9yEU1wfICqd9BqEy0fjFAA=;
 b=MifUE+MZgL/V8CBNaBkIrP5UtbrNvl2b/QcU5UWfJlOYu/UUc/MSqMQpV8A6jvfYrBfXKa0CANRpJyPd+nuC7lI3Kq48Y8mycGdrq072CnfKdc4AQFFEFpU8hbbALmGnV5EOQ9nAblPzjU39rBYpSkjxX3qQV1bYIUbRWbgpaYp7DN4/j3ZrwyULf0uomKuVHCzSjdPa4c+M6j9iWJlBOsaWKQtcFo3h4em/1hxrfr+sEFK1O27TKaqo4sHyb2k8xvWAc7G/VLraIqsvBj65QzJLU963nyE8g3jTpR5V8tWv4Minom5GhEuEm8yp67bQPwW4xNngl2oDRUNewDkidw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij0GTbMsOA7UlbucY5bqn9yEU1wfICqd9BqEy0fjFAA=;
 b=kRfRkMTApwZr7RMeqW5vP6T8tlhm59FFpfeKbfle4I61XjOYCChD7eEsc07VHV3kWPOjImYzSNL7vUvbNU8pRc9aFzLpkMprIWcRyBWq+iUp+JCmv6288Dl+kSiBqignAgIIwcSgX8mnHndthAEGgPX3/N5sPxuuP7wxgUyOWhY=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by IA1PR10MB6196.namprd10.prod.outlook.com (2603:10b6:208:3a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 15:11:21 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 15:11:20 +0000
Message-ID: <8e35298b-7511-4f7f-8f13-9b03738b286c@oracle.com>
Date: Thu, 12 Mar 2026 16:11:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/mce/amd: Fix VM crash during deferred error
 handling
To: Borislav Petkov <bp@alien8.de>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
        mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, John.Allen@amd.com, jane.chu@oracle.com
References: <20260218163025.1316501-1-william.roche@oracle.com>
 <20260218163025.1316501-2-william.roche@oracle.com>
 <20260312144203.GCabLQuwFySHkkCyBO@fat_crate.local>
Content-Language: en-US, fr
From: William Roche <william.roche@oracle.com>
In-Reply-To: <20260312144203.GCabLQuwFySHkkCyBO@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX0P273CA0085.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5d::15) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|IA1PR10MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: b4206f75-e926-43e3-8845-08de80499e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hOvv76D1y5omaL3Z29A2y3/ezLScaXrg7Hjkw9RlaecuWsZ8zzx2IL1sczC9kimNGYQPpHTn7JlxtSMzd4Zk3secJjKBkb9ZOgO63SZ1/2X+6uIhlNHX/VuzL1iMvAThysPOn/67nlcG8AJLpgTkv2VKv0o8thxw5L/QSb2cdmkBKkNibsG+VY3O+x8XtxUYDgGV+N0oTV7Bi7OP4JFc7MHt52MMmuwVHQboYuR+QVNWfXSV7BSMRyjr2ZFX3L7kmPUtqi/94ZMpHGkx/tjyAN2tmxn24Km58AhzQIHg+sRTPLh0zDh0Y2VunfX77vTqdQos57QMoKFXzVbaHXtj1Hvqy3jVHDzmegz/fZbl8jINSFS2xfrbEIewn7Jxq170Igyi2qt8DtvLTx7ZLrsfV1W+CBa6uygYx+B0NkszNc/SzEySlXHhvUwKr6zSx6pqauemb41p07TcSyNI6jq9RuB64asRTXbaOvbftvKXZOtFMJuSlnyFaqUAjil5Slohdk2LI+d5Qkd/Dhh+E0Xrv2eQuXe+cAQ7AwN1IPnqkkdQVZwkd56VDufBd0Nemyy2Bgi98HlSMetFYhsrshVyZmkSsAxf2DkqbV5gbhq7dtjZhaVeKDIpc97i4ztFt07nrWJa75r8wdn16QxaheERKLcWAyT1bST7BY0RAqKLYxxsLYJ5rYtZjFciAMhIWEp8GKkrw66j+ARS3GnDlVYn6nLoZSGhWslDYSUwwcRTUX0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmRQRitqRkpTWGk4cEdxSmJ1dy9CV0RucUc3ejlURTl3Y3BTa0VYditTbEpD?=
 =?utf-8?B?c2ZNdVJ2ejNSZnk4TE81S2cydUwvSWJXYU5ZNm43ak9QUUh0Q0NwN2N5QzhQ?=
 =?utf-8?B?MmFqSGxWVHp3a09zOTVqUkQvck91ZjNSTWVoYXo2Q2dQdUswSXFjZlJCMTBx?=
 =?utf-8?B?eTRza3RPZytMblN6TWhpd2JsZ2ROSjdDeW5LN0gyUmlWNVgyVlB5SThhayt0?=
 =?utf-8?B?YktNUE1SaVNEMDY0TVJlSWp0MVBtcDl1eVdNaVB6QSt2b2kwZktKdUdvNDdD?=
 =?utf-8?B?UTNYSG5BN25kVmxYQ2pIczlOaHlTT1dNUFI3ZXZPN3FsYm1EVzNuNWZFTUtJ?=
 =?utf-8?B?QlpCQ3V6RWJmdDRSV0JjOVdic1JOMkNYTFlRVkY2cHhYZjNmc3NWNEhwRWt4?=
 =?utf-8?B?U09qT3FUNjdraW8xUTM5TTFrTUhGMUl1TFFPemp2Z09kdXl4TnRjM1FJQ1Jw?=
 =?utf-8?B?bkFBL2ZyWUw4MkdCOXppL0VtWHVZMXFHQTQ4OTRvckc4RUh2dkJCbjhEbmsz?=
 =?utf-8?B?TzNUenBoTi81Kys3cGpQaXN3ZThUZUVvQzVjcU83MzdWRFZubFJVVTFlUmpi?=
 =?utf-8?B?RVhtZEtIWnk1Wk5PTG1wMEE0RnZKM1YwVW9xSzNQcms5YmdPZHhQOENyVEtL?=
 =?utf-8?B?RWJTNlNNc0lTeDhxUkl2SEhOQzNFdEtCSGdmTmdTdTE0THFaejdPY09sN3Bw?=
 =?utf-8?B?bzNxem1oMHg1UFBySTgxT1ROWnhqM0ZYYi9POTB0ZVFxZjNSemRwN1pKSmZx?=
 =?utf-8?B?ZWFpM2I5UG5Va1ovQ3pGT055OGlMYXRzZG00azJSdFdmeHYyV2Rpek9zdmQ2?=
 =?utf-8?B?V3lHOUd4c1FHYVU0K0hvdVBzMlRRRUkvREErRnJYdGY0QnEyK2EwQlQ1SHFF?=
 =?utf-8?B?S2xBYWlWMmVLS3Mzb016b01kQVR4T0JVNXVKSWRETFRaenR3aDRnY09rbm5p?=
 =?utf-8?B?YWVnZnEyM1lVQUZDVkZzQnhGN0J3MWhxcTJTbUhMZHdVYStaaFNaYnl5ZWpa?=
 =?utf-8?B?RmFRc3Y0V285K0I1TmNzaFQvdjNXOVVFdzRzUG9YSU1jS1JnaVZ4T1lFTDI3?=
 =?utf-8?B?bHZHeUNBZStaTUU1b1VWRHpqek4rVFpwZzdiYXFhcXFESE1Pd3M2SHBndG9R?=
 =?utf-8?B?VkFhaU8ySksvbTFwM0NMSnZTVDE5ZmlqNmlDNHRMbkQwMGhxU2pkaEpQdDMx?=
 =?utf-8?B?dHQ4VUlTVlNySjlNcFNuaWtnWjV1VXpzTGFrdkliWkNNVVh3azdNQ2tHK0dp?=
 =?utf-8?B?YjZuN1BqeHJnaU9lZkhWWkY1djJUR0l2ZzBrZjdVZXc5b0pzVnVBS0l6Z2ZF?=
 =?utf-8?B?dEpPSFJsT0RQcnJ0ZXFhanZhMGFFMWRobFVGMjNnekZGQTBzMDNkaEkvZUJr?=
 =?utf-8?B?bHl5Mmc4b3lHOHZIWkVOYnFnM05mZ28rM202Rmh5QWVQVXhGdGxic1VFeUkr?=
 =?utf-8?B?UkcvdnJiUDN4emp3WGJCKzRva0pHRkltQitUWnhOZmFmbWlZR2trTDkrQU1o?=
 =?utf-8?B?TUN1THZpZ2h2TXE5U3N2Y0tDRXJiK3N0dDVoY0QwWUEzZHRBRld1eVRWbDM2?=
 =?utf-8?B?OVhGWVNBclpnSkhObkpOcWZoYjFGNUd1alAvdzZvNnliamJCWGtxbU1DN0NJ?=
 =?utf-8?B?aDZoM1FtY2JiRVJKNFE2djJnVmNyMGNDMU9vTTg2MTgyUmI2QTVsay9XTGJN?=
 =?utf-8?B?YXpVWGtDTnpvTEpLUlNOem0vNFBVOTNMSnl1emFWT0tTdEt1eDNiU2NsMkVm?=
 =?utf-8?B?RUM4bTNPSDRkckpkS2RRQklEVmozaGZET0ZrWFNodHlQNUNTYldIMWlPbkRG?=
 =?utf-8?B?TDZyUm1tY1N5R1UyUWo4d2xGQ3E5QVM3VzFNcFJjRU1GZi9uZzlmQVc0aThi?=
 =?utf-8?B?VFdYTGIvalkwTVhKTWJBR1FLd1JDbldsK3dIRlNlSi9aNlkvMDZOdnFmNkZn?=
 =?utf-8?B?WW1RRG44WFNlTTNZdWVUeGNQaTVMKy90ZVlVM0VoK0tqd3JBQmVERVNGbW5P?=
 =?utf-8?B?RDVNYWZ4ODk4cjRBT2dkNGVJL0JBdDFXTGxOdFlKUTBsYm9nc1RCTkxSK0dX?=
 =?utf-8?B?RUwzL1FtdXo5UExzYWR6czl3K3p0YVFOMm93bVR6Ky91NGFYYlNRQmlYYnpX?=
 =?utf-8?B?Z3lKVlAzcUxnNnpMdFBnR1BTZndDSExLZUphcExLS1lSdVJPZExxMDN6blpO?=
 =?utf-8?B?ZXFDR1hsN3FKZDFCbjdiV3hFckF5a2djZWswekZLTFdwU0x0WTlnOUcxUFl2?=
 =?utf-8?B?SStPeGhWWXJ0VEliRHFET2xyamlydVJZUFMwemVGdjFsZEtkTWVLWWJKUGZr?=
 =?utf-8?B?VUpWVUFXNXhVK04wVStoUVlaZlgycDRqbVhSc3lzR1Z4UFVmV0Z1OC9MSFNn?=
 =?utf-8?Q?dwhSZaCwfTwbhhxY=3D?=
X-Exchange-RoutingPolicyChecked:
	R6fFh2IvG2tIJ5uaJymzTIQ+2R+didK4u6ZwPQGxJ8M/toTaXjdyIN6XA6AaA2UuMpyembBivtdsEePB+MxhBZTV2MMvmICtpOukRVX95pYLSAVOq/epjbwLV/JTUNI/x6k3hiTXDPJ1kk1j00ht1xmUCW0X79Zmjz+pHdWeV26ZHaySTWP6QsGOKpBsJNfIEaiNb3VBs76JXm85HZHDKQrIdBdmDeeVZBhuiA71OC1+YrTgyEtAiDiQUtDM6pS0OLXFSA5xrdHyKtWVYOKfBoRSYbVu3Y1bkR3ucHgRBIvvjc/ZwnNyIfKUTcA8eCzRq3VKMno2/2QtJropvkrkSw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	apv5oFFADQk7iQrJopxVI5TpMhluEQ18K5eoPA2EuV5WR1nLqb5EuAC+IEul/mbqdEbHjfjFbXLOxz31N9BZwjVCrcnc/Sj94bycFMhLIdLazLwH3JWLg9E16fN3CIZ1K8m9SqaIBHKSEpkacpAqlRXwCMz94MFnGdmAzfAdGi4EKt2ntCLqXgCLL0e4iZk67PorZ4FqJxXIOjcHFsGPWU4cpxJYdgGt4gaDH7VsdpA980kpOo/ZhPf0RUfLA4YMhkDZNWb24pJFVGh9pkkYU5r66AxIWPegQmI7DTfdX9HvPNkUrX0btX1SRS04TfvO+3u+dqIf5HMPM8mWagbH3q+BjSgsJ9rAevi2i8Wa/Su/V8TPjF/OTrErX8k1XMCVKhKNPH0gkH+CO2GED5NiiOFnasL0C5rPZ1mjISRfyY8zggs2M7A8QYfUGKLad9iWbPn9EzHu8asBn16ZhDjUJjrND2Ewfyvl50IGUfOXotHyfzt0UBGcMYGC/SXw9abTCEfnGJ3GuxnzhyLhshPOUdNJWOXxhycLA5KVZFOyr7xfnMQYOAnDMCDS907sUXaEk/yuGdYkR98JoqTWRCn17jHfMNlDgfjyHgHR81NNrZg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4206f75-e926-43e3-8845-08de80499e0e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 15:11:20.8815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NUEMCFDHd5xqZu+5lV/UohfGU22kbJuJ3q1JF3CiDwrli1A2ogDp73kaz/KRTkkxhvy4ffv3Jl/UZknp7LTWWfMFF7QzZv3G08Y1ia7OgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6196
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603120121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX/SsIARuMph6Z
 tGhvwxroeCL6wY4+HMr3SamjNa9m+Sc800d7foqYkQQ3S4tLM6Hdfo4TkhuVMPy4SoXXyaPjy+u
 j2zvp0NjRvhgONUPPRowrAIiX82UvfzvIDXp8hxeXv2vnLoop8bQm7ojPSsR9fC87Z82V5S0JXN
 37Ba4lGyyJukPaGnGmO+qyUjKEYeaUKg7GinVls101u1cuS3v+pr+YYxU3eOIk6r9mSx1pcGqtl
 4ZOAcY3bhZgwtyv4TbLvsad7baeGTakvQPkj0wehLnC/TaYhwKC94K2+DNVB2DF03dT0KLQkjLe
 DM38brcs2IsB74BMj5pj7g09zFc0L5XST0GwvZ0IFd6ezDBND+Nbxcfg7Fby5PyWgn4MghcLz5W
 dlvr+0GR8LkyDhz+bNFQ8qyHrfSZFjpT03flg+I0ll4tLg6fGEQlzigPfy3Nax009YVb7a3eQT9
 aKC0jA3QfrEmvDEipjMdM3b+pCkDaNJNGjUoaY3g=
X-Authority-Analysis: v=2.4 cv=FL0WBuos c=1 sm=1 tr=0 ts=69b2d79d b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8
 a=zd2uoN0lAAAA:8 a=VwQbUJbxAAAA:8 a=sIlhFsGIIGY84UF1R-MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12272
X-Proofpoint-ORIG-GUID: l-QcCoklr9BYArRUqBsarvLXGSiqa6iX
X-Proofpoint-GUID: l-QcCoklr9BYArRUqBsarvLXGSiqa6iX

Thank you for your reply,


On 3/12/26 15:42, Borislav Petkov wrote:
> On Wed, Feb 18, 2026 at 04:30:25PM +0000, “William Roche wrote:
>> From: William Roche <william.roche@oracle.com>
>>
>> A non Scalable MCA system may prevent access to SMCA specific registers
> 
> "may prevent"?
> 
> Please explain in the commit message the whole scenario how you're triggering
> this in detail.
> 

 From the kernel point of view (regardless if it is running on bare 
metal or in a VM), access to these registers registers is provided by 
the platform: either the Hardware or the emulation framework.

Yazen indicated on Feb 12 that "AMD systems generally have a 
Read-as-Zero/Writes-Ignored behavior when accessing unimplemented MCA 
registers", but you rightly indicated on Feb 9 that "KVM works as 
advertized" and so prevents access to unimplemented SMCA specific 
registers. That's the reason why I had to say "may".

This access crashes on AMD VMs and "may" work on AMD hardware according 
to Yazen.


>> like MCA_DESTAT. This is the case of QEMU/KVM VMs, where the kernel
>> has to check for the SMCA feature before accessing MCA_DESTAT.
>>
>> Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
>> Signed-off-by: William Roche <william.roche@oracle.com>
>> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
>> Cc: stable@vger.kernel.org
> 
> AFAIR, you're injecting errors. This is not really a critical fix that
> warrants this going to stable.

Errors are injected into VMs by the hypervisor when real memory hardware 
errors occur on the system that impact the VM address space.
This is not only a test, this is real life mechanism. With the fix 
7cb735d7c0cb that has been integrated, VMs kernel running on AMD now 
crashes on Deferred errors, where it used to be able to deal with them 
before this commit.
That's the reason why we need this additional fix.

> 
>> ---
>>   arch/x86/kernel/cpu/mce/amd.c | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
>> index 3f1dda355307..7b9932f13bca 100644
>> --- a/arch/x86/kernel/cpu/mce/amd.c
>> +++ b/arch/x86/kernel/cpu/mce/amd.c
>> @@ -875,13 +875,18 @@ void amd_clear_bank(struct mce *m)
>>   {
>>   	amd_reset_thr_limit(m->bank);
>>   
>> -	/* Clear MCA_DESTAT for all deferred errors even those logged in MCA_STATUS. */
>> -	if (m->status & MCI_STATUS_DEFERRED)
>> -		mce_wrmsrq(MSR_AMD64_SMCA_MCx_DESTAT(m->bank), 0);
>> +	if (mce_flags.smca) {
> 
> All this code should not run in a VM. So why does it?

Why do you say that this code should not run in a VM ?
Error injection mechanism has been running for several years with QEMU/KVM.
I must be missing something here. Please let me know.

> 
> What is the use case we're supposed to support here?
> 

Dealing with real life deferred memory errors impacting VMs address space.

I hope this clarifies the need for this new kernel fix.

Thanks again,
William.

