Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952B290DBB;
	Mon, 16 Mar 2026 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674887; cv=fail; b=TwHcwWpDWJPlTAATVxmmYwW1NeT8pDpIg16AFy3Qg9aciFlJKVcBgZ26us6a53Np/qq56JCEiBCs1FKZoqxO2uj7Kxpg+KuYDp4SqHGRlyofc7cTy8HSPxV6nQyeeq0/z/kk8jcnz1qX3hw4Pl6X5PXqyhA7fj61oMHcDRTUk1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674887; c=relaxed/simple;
	bh=7CybqPU9ekHuHiW0yyYtiVyJTIy5EjAEcQgHIgTT26Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=io/1xJgcwCtGbt4LHGw8zjyO/6QrzhVmCcOZ/wY/CGmlfg++lEQZserhMKxsz48u3kkc6cABJnB7aMa2+ZTzZdL1iYhJ/xvpD+faW2r1Chuprky/OcnyTc2iGjlINKkwUrAgx2JDLxSjvgVxeSzFPIV3EQZXxU/z1qHE+Q3XUeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I8+tmOXo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QJvnLl2x; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I8+tmOXo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QJvnLl2x"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GDPfSl898997;
	Mon, 16 Mar 2026 15:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AV3D1ZqrD5QGZnC0En6u8Hinhnc1yYwIkEtEZkwFbH4=; b=
	I8+tmOXo7vFiWcyqSqWa1rl6qT/Fso/oi43tP3LJLz9w/IPaLGoeHKO3KDG7XZy6
	vw6nlZ2CHR7S/qrR/YtNYtmOFCBsZn9v9acF6E9Xw/8APd/oeyRCyQG+I1jN8LjN
	Dz7QWGPI+pGWTfGGJcfA6UZTalRL9+8u85e+S3rTJ0Jnky0tn1W6v6iqv9agaLHy
	dzmbX5DsAeEwTJDa5lOYdzGWJ5yG73mYerixRFecGkH7dTOc5e6opQfLE7REoOxp
	vM4Hhmtzd3Qu1coqmtCvmNMDw0RNDTEQSwl17qfJGQ5ZueOjHUvBia7cqB09aeAh
	NKyLlj/ZDYhgKX93B1Cbzg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvxk8ajt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 15:27:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62GFBs4j014101;
	Mon, 16 Mar 2026 15:27:41 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx48s0fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 15:27:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHwtTudBi/sbnpz8/fidu1m8aakE4bTJINS3387AC0o8Fpm5ndioMjp53eDh68fL/688xQ0x5hMdwhX2DOq+jYMYdAOlf0qA6A19mVPNSabvgTEW3ZTwesq1sGQ8egZxVA1p0P/Rz60dqi0TAWhG1CFXa26+zorqbKdtXiIoVwRx9mPDoXO9ooJ1pjD6GL5H1BKGV2y68DRgSfC+IEfugzx58xFxrC3UrRSzFV/rRVgtEXmynUTpfc16v2PrX3wXl+h86OxW/f/ImuczhLXBSiVdtdaORJ4/YcXygpTQeIBjEIAyid/F+THuwqqHJg6e3MsFrNykHsqHxZV+ncQiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV3D1ZqrD5QGZnC0En6u8Hinhnc1yYwIkEtEZkwFbH4=;
 b=IO/aKpGqIcW4ZPkeX0aM5ZlYYfCFizJKGSHlU3z8PCASCX6CSsKKkZ8khJlAHPO9r4IbXPSi2M6pE78HqouBARld6mgLOG0BrGLLNzCn1BfBx1sqZH1QKJj0rh3WDWMCjwwxHHCsEZWktPbF147dz6+NfY2lAEzJl4gAeGTr8yWq2mW9y10Ca6aJ6P98DkydKmOEZFJWXeg9YIOBShyFBlDhtWdnVbhGlHMNFQOambempWTM3aI13T/nhyZICNe4hMw3b1hrbHi/b3rwpVnXQz8orxlUotHmzeQr6fj3BIy94VY+6UBH2ITXBTr7iKN+TOsoDn0flei79otn/5jrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV3D1ZqrD5QGZnC0En6u8Hinhnc1yYwIkEtEZkwFbH4=;
 b=QJvnLl2xztg1xUQyRjgm27zdTTx9pjeSMLLyIhpfx/OXIgBWES+ckiXFZ9S+jyVF5D8ahOXiE0HlWJzxL9ZwrfixW4pq0kzMyf5gIZkkOdMa8usbpVW3HlnXRvcsUpInqQ6ZgioTJDGh7IsnozQq2uXFgcsMidmBuFiWDGynbWo=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 15:27:37 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 15:27:37 +0000
Message-ID: <cedfbaf1-e2f1-4aa1-8825-d5faeeb09dbe@oracle.com>
Date: Mon, 16 Mar 2026 16:27:32 +0100
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
 <8e35298b-7511-4f7f-8f13-9b03738b286c@oracle.com>
 <20260312160453.GDabLkJfhslCLXZntv@fat_crate.local>
 <ff7008cd-db47-4a0a-a74f-dcf3e6ab1891@oracle.com>
 <20260313201027.GHabRvM1wcctKe2Kut@fat_crate.local>
Content-Language: en-US, fr
From: William Roche <william.roche@oracle.com>
In-Reply-To: <20260313201027.GHabRvM1wcctKe2Kut@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0508.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::15) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SJ0PR10MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: e173b614-ad06-4a56-a47e-08de83708d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	615F5QT3E+HtZimzpB/NxUzfhaRrxAEWDISqkl1gPKX67NroaM3yNSUMUIeOXiMuo2JTVlLGmTzQHYopFEuRV0Wyd2uPMKm/zy7qMJ6ABUBQJHkPtZ3e5ztlJsyy3qbCjb4bqTAZ0ahZ5QlfhcGjGupfYq0QYIhyBcxsEuddHi67A324JukTHEl7msE2ddDnYdUqlqEip0vdQT5I5CJAK85abulZxPM7uL0CGWQO6NZSnuMIucXIeS2RaFY34G58Zp5FOKY0ai/lVWa9voP2iIBMg9OtWJ4FNz7taCDP1+h4SumcGJxJUIoobamBbV5u8Cc4k1g1oWMjaE7eoNVl9NeuUXrZmsLiYfrghNLht0XOAiSJdPefh4tBgfdJRKTH22qR0c0qQugxozz/IVk5vdErcdVeye8Ml8uXahVm3Zm/wFh/jdA96tPxcdZctKmhx1iCC6uH49eATLjbfvzpkIHVBVrNjHXy90axxXdtchoj1+8cvlItB89kSgM3LKpkjAK+rTaJEczarO7T2BG2lXjxYfxGQrzDkYrPv7ep8iYhuSsi7RGq0wO0I8Q4F0SOtpMocZ25ZFEUMa/xNPMSNuKSfOpcaG/e225DHdRnSLf/VsjnGE/hogSgPzMruVW8uvZ9DQ38Gy4AcPU1XKuwc6ho+Qz402Ae5jazqXumBQ44e5x8gp/fcbYz/aR8HsdIiJTjXtt2HiXSmHVaiu/kDGIIEzYh56g32naSzFgFILU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUZkY2hmd1ZidnJQd3dUQmZyL2ZHbGp0YUR5RkdXYUZ4ODU1YUxGZHduMEZx?=
 =?utf-8?B?KzVSNEsxU2Z5L0t0bWcxSnN6L0dva0E4bllCK2lqc3h3aTJNTmM1enNWTENp?=
 =?utf-8?B?QUtUeERkRW9IQnRJWkZ0VWNnQlFDdThIQllTeTlWWE1Oajg3cDNyVWU3c0V5?=
 =?utf-8?B?b2NZSGM3ampkT0ZIMEU4cFB1Z0hsVTNxVGc1TERkMk1lNUFJcjFobG9Qb1ps?=
 =?utf-8?B?Y0dDKzB5WUFZWTF1ZFlqejhLbWxzK2dtZWFNTjhzZkhXZ1kwN1ZnMFUrbitF?=
 =?utf-8?B?TGdDY3loeEVSY1lrMXNtcFJwMFFWdTJVVFltM1E1RzNZY2JLZWpaOXVzVDVl?=
 =?utf-8?B?Ri9pT3JvZUdnaWxVTUc1b1ZiNmEwTy9GVC9rNjhBR3NMeTJZcVUxTWhkVXhK?=
 =?utf-8?B?azVzL1drTndsSUIweGlEVGg3aVRzdzhIend0S3FPd0tFS2tvUndadkRpZjF6?=
 =?utf-8?B?TGlvbGwzcGM4cVAxdmJ2RldWWlE2UVN2c1FsdXdVN3RnMFNka2VBZmhTdHl5?=
 =?utf-8?B?M0d2NjJrMkttNU9MdURNVXBXVVN3dHhkOTljVEJCMklqL3lHRzFnM1NWMGdU?=
 =?utf-8?B?MjdJRXhaZ3ZqMUdnd0tTVkNjbG90SkJTVzRSbE1ackM1cEczdllVb3B2ODRj?=
 =?utf-8?B?YWJKY2tVWGQraWF6QlZueXVxaXYycDhwbmNXV2RWVExnNk9ycjRycDlpZXRz?=
 =?utf-8?B?Qk5KOWRHSVhRRFR2UEk4MlFzWGlrWDRWM1oxanhsaExCNFZ4Z21Za3JtcUtG?=
 =?utf-8?B?akpEdnFqMmc5T0w0cGl3Mk1NOG5QL1M4aUNuU1ZJcUV5NjZwK2ZEcUNuVmJV?=
 =?utf-8?B?QkRmUjNJTERWM0pmOFZnZys3bzQ3b2hjaUxMQW03REh5MnhBSEozdVpxOFF4?=
 =?utf-8?B?bTc0L3ViN1drRWpkWHhxc0JiU2lUTEV6bkJ3Qyt0OTVIY1hwcmxnTnZicU56?=
 =?utf-8?B?UnFiclhVVCt5RkZsM3AzWExsVENxdHZBN1hrOVJQMnMyOXVqRFNhT3pjR2R5?=
 =?utf-8?B?cjJyRDVGN1dYV2lia0NObEt0ekJRL0tid3d6amxXeUxCQ2JuL1dXa1gzSHBH?=
 =?utf-8?B?RTMwTFF1RGNBWFhVa3ViVmMwTWU0bk4yOGV5NWVpOWx2a1pRZEdRQ0duaEgy?=
 =?utf-8?B?K0djRG9GYU1uY3d0UFVFVHU0ek0zbFptUGRWdmJxZkRtYU53S1RKUXpWZ0JV?=
 =?utf-8?B?S2VwUk5kMU5QL0hRZjQ4UTQ1aHB0dm5HbEw3L1RUVkQ1ZkZXLzU3ZGltVGdI?=
 =?utf-8?B?aThyQ21ncjd6K2hMSXk3MHF1S3ptSVBtTXpWamFYdVg2SFRsaWVRTnMvci8v?=
 =?utf-8?B?N0FTSm1vRjhHVjlxM0UxSnVBc25DaVE5dVY5SDJBbHdTZGgvZ1pKSXl5OVFR?=
 =?utf-8?B?RDRRVm1tTjF1RFI4d0d6eEk4N0hiOTZZWlNCSXFRSUJ2eUIzK2lyWThKT1hj?=
 =?utf-8?B?ME45NGVzVVRZQUNIcGs5ZzhUVUxqbGVrR3VQYlViVkV2U0dZWmlIWi93bFRx?=
 =?utf-8?B?ejduaFlUOVZzSDZJNFF6ekFWZ3oveUdadnNrcy9aOExFM3MzT3piYXErZ2pN?=
 =?utf-8?B?T2pqQ3lsdEFHN0Y0VEdTZTAzcHp0aTh2WXlydCtRaUtleExFeklLUm4rbmNv?=
 =?utf-8?B?cXZiTkpTazA2MEVCZmVvdW51LzBWL3BINkVtV3FMK2ZnKzV1djQ4aEpwVGJT?=
 =?utf-8?B?VUcvcWtSSHdCVisxbXZQenlCeE92U1dIcmRwK2R3a2Nnb2hZVWt5MjhtY2RS?=
 =?utf-8?B?UTE5RWExeU1ZYm51Ujd0LzF5STJtK3gzaHVsUDUveTd5UXI2K3E4NE4wc2J0?=
 =?utf-8?B?MHFVOGkzejl0QVZLdE5hNXFkdDJqSUlQWWZOUUtJaXhOYzBhUW1ibzA2VnFz?=
 =?utf-8?B?YmR4UURoNXk0RVoyTDhrZmo4RWRlb204K3FEbmRiZXBSc1hjQldHaVlGRWM5?=
 =?utf-8?B?TEhVWm5jTVNPV0xPWit3a1I5bXNxb2pBRm1yQldHNFcxZG9zOWZwVDBFbGM2?=
 =?utf-8?B?SlNyN2VraTM5NXREd2E2cWl6YmdVNUpaVDVqRzRydzliZTBINDNobFFwUE1i?=
 =?utf-8?B?WjNYcEp3bmMzV1NCbnNCNkpGNWN4OXlSUUpxc1AzTWl0aXA0cXNkQkM0Wmsw?=
 =?utf-8?B?SHJTZm8rRDhYc2xhdkJWVVkwK2xhSDZOMWErR0EvckVENjh0MExDZ1VhbU5x?=
 =?utf-8?B?WGRhOEczRzhMZTB6RnlwT0czY04zQmM3anorMDUyNkhPQkVjVmhpc0ZuSEVq?=
 =?utf-8?B?K2w4czZHWENmc3V6TDdBeWtGZmwwY2NGTHRJUU5vYWZQaHhvaVBWaCtyNGlK?=
 =?utf-8?B?QVFzY0ZIeXF0NS90dXBvV3BYdFNjVnRvY2NXQWc4cU0xa25zeWMrTWlqSXhT?=
 =?utf-8?Q?YQIIoisVtPGk8Z5k=3D?=
X-Exchange-RoutingPolicyChecked:
	oygNl41iZYk+pIOzaZw6cjbDuCNM0KBW5haym9ln/iAHDoIxvS22RrDltkvWxkRkC3dADqN1DotJHNkF78Y385pWIjhPx2LCFnRVq4C7MPnTjr4tX17Xy+f7Vvw0Qs0eFlX+znQnN492zNK82ljtyv23ZpGDYJxyMQLDIhqKAa6eaP/1zvT3b4rTAfaTM/3YDxu/OroH78tHVGjz6mNm3H6nqNZ0XJEypek7Q1qNaeFCHhji7y6aHuVBxlTpApjNOLCXIanagjWb35yk4S5OBu2Vv1o4tgT+W/kAd6VHub8m1k1vtmik7MZ2WjQ+fhIcuUhSDIDM5szzqO9y84ctqg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eUU45k7zUzJdUznda2J9mDy2q31gzCZk/gGcXrR3tM022uMjSKOPqWen30FK2Vplgvf+9AFefGPNIeuytQFFsaAui8vrBHHphs2xtBNWDudSSIn4hKhxfQOcbdYx9D3va6ktq0XulFNWpT71Cpg6AiDBhVIOvY8DYg6paCa6jtOBR/bJUaDNOpczKTZ3MOi0gGXT0bU+75sYk3AlRkfULQTAIYyfLZ9E05CwPhHpTuPLGrD/IArNDLsjvIS9IurFmRz+dnlEruOkbCgjDn2Ka8nHtsOokir/UbiyxeAMaIv1ZKKSOTIzfzNmfPRZowxtaiXBvOz8JV5yccDRgB967X6w/4FzVsVIRoD9vQjIm3gCKGu0ze3PXGAAcS14rMlmRA1C3VAeF9PugYiJrRR3RoAq8QfPBphAqb+uuE9SLDp/FeZYMOk6y9uORbdO77666F6RUA34vRbm4XWkOwRFB2ynTCcDWeVwR75Mj4+L2y9+7uIoZuOo0wVvvUPPFYW8Yar1/CAiuMa4B0rBZ2jTO8Ae5n1502gRmvgCy1e31u52Cn3sQmOq9CdG8zFAhwyPeXL6Updt2VLaBToUWdBDAdBACLOHNnqATMSRTRciezQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e173b614-ad06-4a56-a47e-08de83708d9a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 15:27:37.0016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drr960FbC5N8B7Bxpf5Aunl/7ZiMC8hgO3kMDR3Piz7xiabwPdBCJ7thgRYqeg7P4rdWZquRp8xxhnYb4dMfCa5HdyxO5efr4Iz+ub4Brkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6350
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603160116
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExNiBTYWx0ZWRfX5a9Tyumn2gwO
 5yZESnpr/MgwX5FkNaapc1dvR4gYhddKwOcuNoLudzEDQywuFjYzFQbuCCgjErrcOcZ5wGw57EM
 hbwHOYsvDHXwCfabFsqE/deWZpaPmv7mSpH+gCTFlOQ+prTz33OQEnKkd7CoJJYiLbbOXNQrhkY
 9Epem7x2/ZnmJgoxXw0HsPk4LcicWZ/Chi6Tu1Q7D/LbXaBFmgbfHyGjcV7vF0ERooS0SISyGLF
 AEWW62RMNCdN75PKQ35KpIBpB1FE3J+ns/VDQXCE5m3mX2Rl3ZY0lGsgWi7jZWbmny1Hhojf70m
 sDwknHFIkVmWWVAs9PND27ZNtxeKLzyjKqCRfKMdzPs2M8y8JWfOMp3lQvePbKYn0zEv3PpyCJu
 gBqBvJBpJS6dZrU7gAkp2vMmZ+i9jAm+QNPE3oxHge6slmLO1WYXjPbRgqu1pB0LbctC0Qd7RDy
 2EsfL2Hjdx6UinmhORQ==
X-Authority-Analysis: v=2.4 cv=AI0/m/Lt c=1 sm=1 tr=0 ts=69b8216d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=zd2uoN0lAAAA:8 a=VwQbUJbxAAAA:8 a=Cj7G3GHqCd4Oug8fhr0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: t1Vz5NZZLz0ZsfrXpH6TLIwKJY077vut
X-Proofpoint-ORIG-GUID: t1Vz5NZZLz0ZsfrXpH6TLIwKJY077vut

On 3/13/26 21:10, Borislav Petkov wrote:
> On Thu, Mar 12, 2026 at 11:44:04PM +0100, William Roche wrote:
>> Yazen, could you also please tell us if an existing non-SMCA AMD hardware
>> could crash on updating an SMCA register ?
> 
> So, the situation is this: if software needs to access a MCA_DESTATUS MSR
> - which is part of AMD's MCA extensions - then software needs to check the
>   smca bit.
> 
> So your patch is correct. The justification about it is not.
> 
> It should talk about how software should touch that MSR *only* *after* having
> checked mce_flags.smca.
> 

Ok, I understand your point.

> Because, it doesn't matter what KVM does or whoever - we all adhere to the hw
> spec.
> 
> Because technically speaking, this code should blow up on non-SMCA machines
> too because they do support deferred errors (Bulldozer for example) but they
> will #GP on access to the MCA_DESTATUS MSRs as those are reserved there.

This is a little more complicated as Yazen raised the situation in his 
answer. But I agree that SMCA specific registers are reserved and should 
not be accessed without checking that it is allowed to do so, first.

> 
> So please rewrite your commit message to state that. And then you can talk
> about what the real-life situation is which caught this.
> 

Sure, I'm going to submit a new version of this patch using this new 
commit message:

  x86/mce/amd: Guard SMCA DESTAT access on non-SMCA machines

  Access to SMCA specific registers like MCA_DESTAT should only be done
  after having checked the smca bit. Avoiding a non-SMCA machine (like
  AMD QEMU/KVM VMs) crash during deferred error handling.

  Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
  Signed-off-by: William Roche <william.roche@oracle.com>
  Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
  Cc: stable@vger.kernel.org


> As to your use case - thanks for explaining it. If this is something which
> people run, then it would be wonderful if we had a simple test script in the
> kernel which verifies new changes don't break it and so that we can run it
> periodically as part of testing.

That would be great !
If there is a framework to create simple test script running the built 
kernel into a VM, I'd be happy to know about it and create the test we 
are talking about -- as a separate fix proposal.

Thanks again for your feedback,
William.
