Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B4A2C032E;
	Tue, 17 Mar 2026 13:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754766; cv=fail; b=ElJUKxfIQn6Bl4j2VN7Ti8TklFbkjpfeRN95DSVhqyLv9HSa8Z2XnYsBymPW83BIK2xQwXGa662oriuqOFEFlAXi57MBHvbS50dsRzIabDf/fiapG44yYStCan+sounMI0q4J4/xzoYzS6QBsXJ9470QQHZJk30BO1nKW7Wqu8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754766; c=relaxed/simple;
	bh=zRiidD7tVtjWM71r8iP9jvBs0lfWcK2M9kwEZOYtX04=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V9pCllUmnhwgyKK96RQ1F/5SnOfyEmLaJrgutBevQ/SA+WRky8hkJhtFEXVmf+Fo5XJfz4s3NVRY/UqAoG2KYSBry4zxu3Fvo+La+DXP/bBTDP3KHXPSUmkybu04GHoXLXKIsC8jJHn40+h+JFtJT8dXbh12xXuunOxwHAC1H1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OjHKFNu+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YI3ENjuU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OjHKFNu+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YI3ENjuU"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GN4u4P1347797;
	Tue, 17 Mar 2026 13:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=THmKOve7znEK8ZfFOP43UYft/JT4pZGu3HgFHhvmk9Y=; b=
	OjHKFNu+VEMxxKmkgkAmgbE8LleWW/JivMfBg00laKVl0Cy5Vq+6jk44/Y8SkEHg
	L+eGW3SfcLmLPJq0UjTyWlqyPxkuT6sQ4Ah3kV7lFCSgAQ36hDgVIi63BBSwPdoP
	V1iIMxerjtRBCM4Y079td5hhVSLtLAmiHgM480LI+dc+8FTjRziLLKqlLPXbTuhx
	c9jokfHUowYlYmdDg8eZW/ospNIhxkF0/4VwD4bH47u8uhwfQ7e7WkK6N0fjLXly
	rQ7vVKOW7vz2+MKa2IKWOxRFq0B8exZhVgksBk2h8dXtaJXnYQqR8uECWA8txu9b
	n/XwIIUAHmqWlvamGQeVZQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvx3b42xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 13:39:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62HCDmhf014101;
	Tue, 17 Mar 2026 13:39:04 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013011.outbound.protection.outlook.com [40.93.201.11])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4a3mne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 13:39:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dl/eCYUbwzb4h0+TcfjIV/WfK4/4rAR7H7qkLDLXkf0+LsgD5NHXuVbQnXz2ejfCmhOWLTb+RrFL6qhO35qvAiV7Ovpfsvpf57CCw77gzsSAgAdFHwbHnop9+AaKfFlexKUvtm8wtx69oEJGXI6D5kZJYAqzqbr7VHUxUyMjq3rXaPAlJLEngdd/AwbfXHxQaQuUvdTbfdV7TrEUAAQ3PIk4bS50mAr3K+7DNXb1CDlPyXdFqsICqzFsl10C3ngSzeSppeckqqpGfWl+t9Bz3eppg7x9xMisUkUgoLeE/6ut6+LyI4poxbfYVYmg5w4DaUPp5Zru5fkSLkCz2tWIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THmKOve7znEK8ZfFOP43UYft/JT4pZGu3HgFHhvmk9Y=;
 b=iBxn7dFvnS675nDUBqblWxI3BgyJgEg2ZA2I82aEmNtahUnwUXhQPZ+JMRF5Oskud0NlDi2Z/0idQt+xDOU/ODeVV95msrAWEKPE/TdPk6jNrfDol2WJD6jg8nAQzRoqeZb3t82EzV7Xk8liOPvzLRYNnI8LwnhFbYG0r2RZBhmWsDx8rwdiascckoCBo5nLWCrsH2DPWW71Gi+YGg202fyEDDkg0bGpu4lot96NEfKJsyb9beqJH74Y6EIwC1vi8djvmJOC4+XHcwRYmQ9O8mBt0oGgMkXEQJeuM1a4mUtb/8exXIvtICB8J3t+SDzPa1sF0ACtVSfmWUV6PQ3K3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THmKOve7znEK8ZfFOP43UYft/JT4pZGu3HgFHhvmk9Y=;
 b=YI3ENjuUIwAehHhTHN4Ojbj5btelcD9m9YcyRcJV4Nmi53f9Nz/v8PGEzpDVo5caidF+wC0rUkR+fdLBCo04IRLiDn0Cwj9YuQ51BpoTHNfdgokR6fy3+dCrhMdlRud17wcn2GLaegvymuvNAQ6WVfD5/BXVOwZweQ06Mw/5Psc=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by BN0PR10MB5126.namprd10.prod.outlook.com (2603:10b6:408:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 13:39:01 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 13:39:01 +0000
Message-ID: <1c7f33c5-b1f2-4af3-ae82-37723a89cc96@oracle.com>
Date: Tue, 17 Mar 2026 14:38:58 +0100
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
Content-Language: en-US, fr
From: William Roche <william.roche@oracle.com>
In-Reply-To: <20260317133247.GAablX_1ECCF-CKgjJ@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0060.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::35) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|BN0PR10MB5126:EE_
X-MS-Office365-Filtering-Correlation-Id: 52bf5fa4-3620-4f31-bc20-08de842a8c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vIz+hQfIb+QHa0E2XHy6xf8JkYt9A/vH7r0YuMmS0WKwuRkbeAVEejQIflBLXgA9JUpRnnemSFHoI6l1f7+TUeDfNjVQXq3K7wNiC5/pwjsWA1HbaMNxrNtBqRtorhrmQduuVPpWp4YTIQZZYiOShwdxX2r7sUl5MLifkIv2raxWx6YwDo7ztn1pZKJ2FmSgG1gPdA/9ursrD5ZNG2Dw2GVCQlF5oIJUkMSd8TwsdjE6mOGpRPEAyav5QWlsZlaOxSh2YnduS7KMUejsZENYOzaRYKcgpeGf+oAmPUAi1cTpLCZSJWgtFxCSZMqqzpFa4WaJjStuZiB9p02mDyktOd5oa2YpwkKFrQcRInMQe9v23Jvx8g505UVUnwhnl/8tVitQgofwNS3P9T10SCTIo3pTy0SV5F/vsuEZT0cnconTSXBl65O4rFK+3+Q68Cohq9VbsjiLzxBAgZ6fKa294mf0fYsln72qOCyeaS/FmTI1Eu19FhWGaZBGx1hllxQsh+ss6DDIhDrSmZWROr4cP56TfrdsKgSQfTblzMhe8izdUL9d9BAdq2zN/ph3vs0EGOmR6Ga4EvcCWIe30GahJVx8GHCnewBUOBBeAf6S4+tTr5yFVsQr+daF/KccRC3gQ3kBrdn4jjBZoAtjqq8jjBcrtBmI1B+RTgCt1yCIZkU/l7AQqGDfbYDYt/Orua61uj/tU9Rck8SnUBLK4OYx3wHqFE7BYMaq6Ks/NzGHlo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzBiS0lHMnhCbmpuNUtqeFlqbEVVcDdvcUhCZXlnTCttcWJ6RkpoTE8yQUhq?=
 =?utf-8?B?SDhIQXpoNFhkc08zd3ZiSVpaQ3drOWlhY2Z2U3dTQ1ZXa0tzSUZGdGRsTFgv?=
 =?utf-8?B?dVlFemlyM2xjZGliZFpuSDBES3BUMzgzWEJhMUF0VUhTV3ZXMnFuVUNPajVE?=
 =?utf-8?B?RXM4V3JVTCtpcHJCdHdBUjhKYVdub3oxd1ViWEM4TXlDYzA4RkFLNFY3OHBK?=
 =?utf-8?B?WmkvL2Naakl0ZWRTSHkvRE8vWkhnNkFRRzdIa1B2OTYyZFlWaTRWUUhYZS9l?=
 =?utf-8?B?bm1XMnArbWpKWjJSeFE5REJMbkRDOUhya2xUNUlqWFFpU0JadGd2b0l6ZTVJ?=
 =?utf-8?B?ZnB2bm9xRjVKckVFbGU4cEJLYVp4QUgzcWNlNnVQTDUvbm43VnZERGd4Vk5i?=
 =?utf-8?B?S1VLVjNGc2RlMGRCaXJhUXhpb0VrLzEra0VsT3phRW5nQzdJMlpTN01jdk14?=
 =?utf-8?B?cU1keTk5UTl5dVFIRlpleSttTU5FTG1MY0hkdFF3MTVNR2k2NFJxVHZBSlN5?=
 =?utf-8?B?RXlRQ29oRHZZNDg2L2JrUTM4ejRGL3I2bXAvSVpJYUJxWHZRVnNrVzBLVkNH?=
 =?utf-8?B?WkwvdXVnMURvNHZINkNKbGZBVnVuNG91N1FmYUdPWk9nVTBzdExRR2F6ZnZ1?=
 =?utf-8?B?MmR2YlBob1oxaE9IUWNGSU8xTmdaQ3Q5L3VsalA2bnhVTWlqL084aE0zOWc3?=
 =?utf-8?B?NDdYQXMvTEFTNVVkQk53blR6d0JIUmttb2htdmE0WWpTU2Zub1ZrcUZtekVZ?=
 =?utf-8?B?dEFFNFcrM3U2dGdxWmhhYVV6VFNiVFAzNTZtWVNoUm1CeG1lZFpnN1UyRWF3?=
 =?utf-8?B?dVh3dUVYc0VrU0ZxY2FLRDFJSkZNSU1lVjhNa0pEU29RT2hBN2xWNVZjT2ZK?=
 =?utf-8?B?UUQ2SnVibDZlZEZhZCt6RDRhZmpQd0lwZ2d5emhkclJJeVl0NW1MNUwvUkNl?=
 =?utf-8?B?RXVBTk1DblY3bzBmTm4xek9tQkNVSWF6QXY5MkZFc0V1dm9pSjZYdWhpalN4?=
 =?utf-8?B?b24vbFhWdnN2c3BRMFZUWmRQK2g1VzNQU3JEQm40MFFBUWJXTGRuL3VVandQ?=
 =?utf-8?B?VEduclNONGdieTBFU29XYVNBakdBU0RsaXN0YWkwTWhmM1dxMXhSM1VkT0NW?=
 =?utf-8?B?STJhUTZmTW92RU5TTlBHOE0ybkh0c1gxUVc1OUhXTkRydndNMGIrVmNsYnpY?=
 =?utf-8?B?bWVLSlpmQnJycFNKWGZYNExwK1lwTEFXVkFwaEFpWDBTeGw3dkVjL2FmWEc0?=
 =?utf-8?B?ZWlKUVFaY2JEOHdyc010KzhraVJldFkvVlA3cFFDNG5LdTcxaXFIeTNqL3NF?=
 =?utf-8?B?bVgwRUlwempPdTR2M20rb0NrcGlXckt3S2haUnduUWJ3bklyR2p0QkZ3bU5y?=
 =?utf-8?B?amorck9EN21VWk5rRTJJeG1JRGllSS92SmorVDBhR2RnYWlsMlJaMmQxSTlh?=
 =?utf-8?B?QXo0VHMyQmt4R2lEVzlqdTUzTjE3bGdLWm5VanYwRFNhYW5lbHJwOEhNS1A4?=
 =?utf-8?B?UUtOWUtUZGJnSDFaRzM5YkJDcTVFdzgxdDNuUlZxV3NlUktEM0J5RUF0UFVU?=
 =?utf-8?B?MEllMm8vSWEvZEwxaHFrOVg4U0V3bDZERm42VzdKek55alhkYlphZmVrQlRs?=
 =?utf-8?B?N1hkZTBNRGk2a0l5UzFkM3lvYnE0bnpJenhWR1ptNm1XZXZXUUE2UTMxVmxV?=
 =?utf-8?B?Qkc5Umw3ZDRKekcwMlBsYUY3c1U0VW5CUUFLTW84MHhYd0YrL0FnMjhZWUdp?=
 =?utf-8?B?aE01Ry96VGd0dmNmTUxDUWdGelNYd2tKeXJ6U3BVbkFjODFMNExPNnVmU21h?=
 =?utf-8?B?SkJvNzAvUmt5QlBWdU5aRkwzcW9NYW5MSm9vaGFRY1E2WHVGSmdETUJ3YWJo?=
 =?utf-8?B?U3M3dnZaVEMyai9EZHVFU1BDelZTZUR4U3c5dGlJSUZqTHV0M0hwY3cvY0Js?=
 =?utf-8?B?bUdVWjVVUjVoVFlpcVZqanhrUERidG9UUGNhTEprQnZNaUZqTHlQcnlBWFRG?=
 =?utf-8?B?QURaUDJLamZ5ekQ4dDM2S2FYVjdhQ3lPV0FwT2dnRHV6dHIzeVdncDRWc2to?=
 =?utf-8?B?U0lndWpKaE1qVWJKR04zSEN6Lzgzd0NPM3c3dDBwOCt2eXNmSFQwdFAvN255?=
 =?utf-8?B?UTdPT25Ra1RJcXhmTk1tcFAvL3RRYkk4dVgzWmlqQUc0WUl4RW5VS3dieXYv?=
 =?utf-8?B?RTNrNGo1ZkRPNXpiOXN2R3BOSmd4UXNlVkttYlBSZ3BFaURzeGxoN3hwOGlq?=
 =?utf-8?B?T2VrYXcrV1NGM2RTMlhPQzh2QXc2bEdxOENYUUs0dzlmK2QzVTJkYnpYaGhQ?=
 =?utf-8?B?NmVBK0kwYVhWbFpJZ3Y3MWh4Y1hXZ3ZJelIrcENOR1c4ZStHRE1odz09?=
X-Exchange-RoutingPolicyChecked:
	aeimQLub901ipFSXQdw+Qqt5EAuZuu2Eaxkt2kkmzcQXQjks2s/CtFaJ2Gz7yOXggPtklk539chJdtHLsS5UPBg3Jbm9DWdWPC12Dc9e6Hn3TgtGjDboz2gpRkAktzwkyALdmbfKSvmaDufhrhzoNPv3xoZXBPejkQ5TavY0CUrtETSknbF+c2SICeM2eGLiH7f8cVa6Z59uFnKbkIfHG8o+EJugopX/sLXt9mqoaukLzZp3/rDKS9YwGA0SlyxVpyOL+My9jGdQuyT/9YhfmjowudhxTT7ABh1BaOv0FJDMlCIoeXYUdlyax5A5jqQyTdV0/SJAQSVodQA48DimqQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J7oWFD3KyTorsfvCDcWgHFNE49G4UqWzJjXMrsx10lRLLA7ZYG0Z6Ypp0KKDmk761jEGz00rBfCY45oLTrL13T6Bc3jz86dbpU0CEOh8ZSQiqByCTJzBW1SfaPHzz0hR6ZMjLzSbHrBawIuUPpy9oTj6oaVJk4U5f5WZYNVXsDwq8Pj01RckKbxdqJza6SG3zw8xYghQJfOwdm+PP7io3Fg/v8rWahOhQcWTZeB8V2XOmv9CGbbd03pDIy8GEpDg570UuvTtn0xdYeqbHHTU28aOzv1vAwRyBq2zJAUHMaAEG+4NlqBA+mPjTHL9O0k/i+q/+fgyqDACZ5cUfm5RIF0HaFKfCuAbmaFmvCtuyvqYgwLgR8s3xOrmjPJxPYXuwXCnaFZZFLjAUtWBlU/kGSOwuMSGU4tvToBXgpoxKQGU3vqytBJo4dtTIz5zNBmX6Wrwl1fqZHZDRwsCl2eSoL+qz9MvmLxCVVTYZmAG9Ww6DXR8tzEuMjUdSbG4DO2x0QSl7rYSXAzw7KcXgYVAs/NfyzhTwJ7yB0ZDyXqZ4tp72E8fepTuBUwTgWkNHjLpjMRBMPLduvK1PJFxNhld87gyiUcY3uVJAIwSXuhgLnA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bf5fa4-3620-4f31-bc20-08de842a8c5d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:39:01.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gx52rC1jiwbeEFH3rBm098K8PTtOvDxOQ98iciEx1B0eyflS423gYvj/At4PdSuQD57DHEh5Iu5YQ3MwAX4UZjXatk7cQTahsRikw0pv8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5126
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603170120
X-Proofpoint-GUID: WwhITAlhItrE2oQjYVtHfdHYotxnUv7u
X-Proofpoint-ORIG-GUID: WwhITAlhItrE2oQjYVtHfdHYotxnUv7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyMSBTYWx0ZWRfX4d/8s+cQJHsa
 nNEhitmAkBwWLEgwbimJftuQmZMYCMHbiujtxLuvWdqj3zAH8A+tXU82CjlRkTIxg1YshYcVH/2
 oPEvXrM4QwQvgjJiCjORIYzW/V0dARpxYGz4KqQi6AKzbc0iXqYfcocwmLjeWY6wjIsmWydmiYQ
 3e4koS2pmgWO1p+KKJ9ApZzTfAK/DjYRMVVhQdKiPTBwR4BBCPSx3APm0cYVhSl/b3E5toEaqQq
 KUxVhivSV6xawQnSM61KqPN7jy38AQryQ7s0iBXWD0/1tNLqqvDSWwWkCftIz4O66HJHnmhiV3a
 iilhwj3jjKW7x5KbydIRIMZ/bacnyhuTNPcFAAy3JD18AbpU6w7D3HWC8pI2Yderny3lzhak97R
 5B5FYGs9LuFsBq5e4N+NeEf9cVEBAlfYNro5DRYVV6tq27wbHAi6ocrjXElSoHmB1dRUWC8JKxl
 L8zMYH2dTwln7hpCR5A==
X-Authority-Analysis: v=2.4 cv=IN4PywvG c=1 sm=1 tr=0 ts=69b95979 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=zd2uoN0lAAAA:8 a=bhbUjkn6gIn0x7P3AkkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10

On 3/17/26 14:32, Borislav Petkov wrote:
> On Tue, Mar 17, 2026 at 10:38:10AM +0000, “William Roche wrote:
>> From: William Roche <william.roche@oracle.com>
>>
>> Access to SMCA specific registers like MCA_DESTAT should only be done
>> after having checked the smca bit. Avoiding a non-SMCA machine (like
>> AMD QEMU/KVM VMs) crash during deferred error handling.
> 
> Not good enough. I rewrote it to:
> 
> Author: William Roche <william.roche@oracle.com>
> Date:   Tue Mar 17 10:38:10 2026 +0000
>   
>      x86/mce/amd: Check SMCA feature bit before accessing SMCA MSRs
>      
>      People do effort to inject MCEs into guests in order to simulate/test handling
>      of real hardware errors. These efforts are of a questionable nature because,
>      for one, a guest cannot really make any assumptions about the underlying
>      machine and especially which MSR accesses the hypervisor filters and
>      which it doesn't. See Link tag for the whole background.
>      
>      However, regardless of virtualization or not, access to SMCA-specific
>      registers like MCA_DESTAT should only be done after having checked the smca
>      feature bit. And there are AMD machines like Bulldozer (the one before Zen1)
>      which do support deferred errors but are not SMCA machines.
>      
>      Therefore, properly check the feature bit before accessing related MSRs.
>      
>        [ bp: Rewrite commit message. ]
>      
>      Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
>      Signed-off-by: William Roche <william.roche@oracle.com>
>      Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
>      Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
>      Cc: stable@vger.kernel.org
>      Link: https://lore.kernel.org/r/20260218163025.1316501-1-william.roche@oracle.com

Thank you.

William.


