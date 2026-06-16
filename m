Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83A038B7B6;
	Tue, 16 Jun 2026 02:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781575373; cv=fail; b=WWouicNWy340Dc7S/qMOmi8Iaiw9bB7gAe2nslOkab6hEOeTKozO4RVfL0U81ObTgk0sFku+Q+ESE9Pabtu2Ua/1fzUwlE4mXnpHjfKAoWZgwWSA5eCUN5MQUyKS5gz0gERLLNWwej0xmXTaJAcuSssjPDxwSLqky4RuDDs3MvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781575373; c=relaxed/simple;
	bh=cbqAZBS515pL0Mdyu5cCMFbio1eggrXIdlPkgXomLt4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nmI9bjWQHUvqpdGFpEag2HqIO8MWxJqeeJQhZ8PG5ub6+UEvrtZoqnhtwawdkr8XOCj3s3iNkG6ebUDofusdnOLgyDnvTWoy5duKS9tDypRMptEnQ4F+lvwkQdFU4iCVBE8+XppbwTrJdDt2nu0wmi/8p6gHTo3Rv1haUk488+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzhWRYes; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzhWRYes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781575371; x=1813111371;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cbqAZBS515pL0Mdyu5cCMFbio1eggrXIdlPkgXomLt4=;
  b=hzhWRYesFls/6HlyYsl3TxP+t5mC799YwjfzVgpESuL2w1yUbntHTlE2
   58RSalOSlEEN0Sy+vXwcDdWtSXfhJ3WNPeBwyc2k1mo2FD7YcxJQELNZz
   g7M9UDaghsMYdRVeeOirdjPQBmZaXyfhob2g0UuGZLZH3xjoMbMA4EuGn
   UXjJetUYPCjlYLcI1ZaqPX6LMOnaI6w4m6eUZOzHCZZEofrplLyvIkjkC
   db0/7YP5ATVbA75raA/oULETUGgg9+bxKV/4f7i6m3S7k8jwkd9rwWAYX
   5wjG0m4vb8fuJD89wB6wBtsNgQxSaa0+jdgOoMcoGNwghSOWjQPJJ35aY
   w==;
X-CSE-ConnectionGUID: WQTNVhezSdC6/aE2og8Ecg==
X-CSE-MsgGUID: 6I6SPJCqSg6ap08KhAHLEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69875418"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="69875418"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 19:02:50 -0700
X-CSE-ConnectionGUID: 2QfaqwV9RbSqjfvzAAgTSA==
X-CSE-MsgGUID: CTFqICGuReSMfZhX8yWo0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="251927143"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 19:02:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 19:02:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 19:02:48 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 19:02:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlL0e5zStKbt2pzxh51aCGBzIDLb0PcUtMilpCcAfTC2IbH8doUOxh6MFp889rzuQM6alU9mGIs2S1ltQ8KBPyMB9qQzvYt4CtwttCGGUsVg68NKtc+hH1mbuOC4UlAOJufWTiHfEGXRYWxPJ6yPjuNArWHIjn/g+2WFZgbqw5nV4pOMY3fSt8ddjDbyRB5ffQsPw9P1jYcC3veZn04d5uNyVbSupcuEQmcW0/l6aLv58NVJZ49oDqcozopJvAepho0LC3pm+RgLv1alQJcr07ucVtHs5Vc+AnmqTt94oPxBx5HuHwQAZsXbucBAK4Map/vSRx8JIenOyjI/+BD0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbqAZBS515pL0Mdyu5cCMFbio1eggrXIdlPkgXomLt4=;
 b=gFPLZ3x6qNatvsmMVxB6CT767ygEb0Wds6odqFgDq2edTSkLoNPDkJGuNUYrGbVP3jZAYwvW/65hhZh+iUrIkDctaMgJ9z79KnqtwsdaBMPWIPsjehIz243vwetrjQnmy2HUKTghI+gjY4IIpdcgQBsJuqqyrz7lEDD9jjVKh9fdAO+RksW1wA+0i4oL6TlsVb7iOdUlcgUZWgCi3f+RPgPs51aCM0VsHPAoEJyfGfzICyv/RlJFHz/C3RFyy3qKwdunVErm5r/669tNMEmGwFoWdjgNcYJiTZ02Ud9HzVCyELqjxjKCMgqMneKEWTtDjpCDhhGeRdOk3V9fsvgl/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by CY8PR11MB7291.namprd11.prod.outlook.com (2603:10b6:930:9b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 02:02:44 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 02:02:44 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: "Luck, Tony" <tony.luck@intel.com>, "Lai, Yi1" <yi1.lai@intel.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/8] EDAC/{skx_common,i10nm,imh}: Move MC register access
 helpers to skx_common
Thread-Topic: [PATCH 1/8] EDAC/{skx_common,i10nm,imh}: Move MC register access
 helpers to skx_common
Thread-Index: AQHc6PTZXmYM+h0V7kiTc5KnbHEjRrY/CtCAgAGKoCA=
Date: Tue, 16 Jun 2026 02:02:43 +0000
Message-ID: <CY8PR11MB71345CD85C19EE1560A9F05689E52@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260521073112.3881223-1-qiuxu.zhuo@intel.com>
 <20260521073112.3881223-2-qiuxu.zhuo@intel.com>
 <20260615022625.GAai9i0Zb3_9TVwIRf@fat_crate.local>
In-Reply-To: <20260615022625.GAai9i0Zb3_9TVwIRf@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|CY8PR11MB7291:EE_
x-ms-office365-filtering-correlation-id: 7820fd9c-e0ca-4155-05ad-08decb4b5add
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|38070700021|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: ARcwF6TNoF6XnYfQoOVlclg9euxCrA+lqsLUCPmCIekf3EX7SJz6XT25e8+GzmB6VNQ8FoRh8s5Zq0ukxqzjfKCSCVXbNzCEFrUhGY4NZjG1QbSIly/e5Do4jjluN/vQ2xRam3VEY2dG/nqhI3JFApmRqclGm1NCSIaCGgSAkmYgL5AAJ1c3VceNk/4oeoCwm/YhtWGIJAvO6/L4Tp8QW5S9HF68lfBy0lr3ysktAvqwlPtnn+7EHYUBv97OdcYBXato3Z2GHFZIY+d2ZCc+5awRXeIiZmajihnX8SQFWy2Uo231w8gQZkMGTJh4XIUP149K7EQX57DVAyOdmfExeENYtG0QkJOmMzt/JqRi6Mv+Y4e6e/n5qPa3v3MTSLmUUiUXttbqL6Mdh72jwmTsHOt5V8Zr99xYAk7wnlVpj1Rd1ZwSFXAVFoOlvV4vaTV0PuLi/wlM97mW9gpJ1dLPjib0TzyUGdIIR7vE/nMkdEvCKZsBqpu1pVh0J1jVJABVt5NhViVJnW/+/aET7dF2AGc+h8jp2iBm351tbxvQbDDWld4/J3TZAYhhjbrLGYm+GzHdF3ZtU2tvA6n8v5dNX1ak1Eymh6ukw2MF9d2ejAdJUOZQU+a3nr6BmsurNyLrg/B6yKmDXh+uJ5MKo0BT9AhD/ms85B3Yx1wiFz6syiOXtPv6GGj/f+SoQpE+Mhwfpc9tQvDaNQdRx2QeM30Jc9mKsgYnNQ2ADrcf8AqjbYJi+WZyqEkZlyQPcF0WHesW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0oyYjBBakl6a2d6K0YzZVhxcHlhVCtnUVA5blhKV0NQM3o2UU9PUnRLS295?=
 =?utf-8?B?YVJpZ21GbExQUWFuOS9yblBFL24xMmtsU0U3RndpZzBibWw3RGVoUWNLb2Zy?=
 =?utf-8?B?bmxtdXNCWmROTmZhZ3Q3N2Y0UnFjd2JWT3NhSzdVajdxbEJ5V3lzNURFUFlh?=
 =?utf-8?B?ZVNuRHdscksxc0ordjlPRlppQjdOcE9Ua3UxN0RrNlNZbjZISG9EeUJQVU9k?=
 =?utf-8?B?eGwwNzFsNXFNRTc5TEZUbmJZTVFYbEhLb0JjOEYrMGx0UUFhTlU0aTF3QmQw?=
 =?utf-8?B?eG5MdzJmSGZzM3M0cERvbWdYTDB0ekhxL0g4N2s4c2JUQzRmRW0vR1JKT3pQ?=
 =?utf-8?B?WEtpNEJQWHJTYU5DZGV5cE1KSytYQit2TG95WDd6MEdPQVBQSGkzeEV5L3ph?=
 =?utf-8?B?bHlXZHhZSUVHWDJzQ28zNlIwR3pUb0JXTFNqdnB3Y0xiR1dqNTdEcytpWndG?=
 =?utf-8?B?VkNHUmptNDVrYzNqU0w4RWlObHpDV2h1S3Q2Y0JYRjQ1clZGYjRXRmJtdXNu?=
 =?utf-8?B?YThDa251QndZTGtKWHRHSDRHN0huQTRISERqblRrWkFoRlZBWFVIWmtGU0dQ?=
 =?utf-8?B?SHNlLzBNSFVSbG5PUUhFMDZyS3Qwc3hUMDJaL3c0K1BJaGFtd1ZtUU1ocHVo?=
 =?utf-8?B?S3pMNXZaUlNZakFzaSs3bHV5VmZ0V3BpR0xaTHJhMnpGRVlYOVFvMzc0cTNu?=
 =?utf-8?B?ZzdHa0Iwd2xQelpwSGhYbjJhZ1VXTU1McmdNbzVPTi9Vb0tEaWZLdXA1SWph?=
 =?utf-8?B?c3dHZWM0elMxWHhwa0JCclpZYjVSVms1SlhNbFlCSFFETFBlWkpDODRSUXIw?=
 =?utf-8?B?b3B2Q0xNY2lKMGJwSktGbnN2bXdpZHpOS2lXWXY0VU5EZWlaN2pHMXZvaWJL?=
 =?utf-8?B?TFUzTVZtNWtXTW1VenFFRHlMSG9uZ29LaTRiTUEvdkIxbUtFd2RSSEJ2ZE9W?=
 =?utf-8?B?UkNDY2QrUHVtY0VzdXhxRUk4d2dFeHpqMVptbFRaUWcvSWlTZW55R0swN0lS?=
 =?utf-8?B?ajhuQ1NHTWRDMVVhTCs5VGFRYlh1QUttaG5FZ1JoOS93UHNtSVhLQlJ6dXFP?=
 =?utf-8?B?T2ZUQnp2ZnF1K25vY0htandVRERwejdFaVg3ajFSN0VPWmVkeXJGcktPbURO?=
 =?utf-8?B?M1BSMURoaTlvUWIraGU1ek1KTUdHcEF4dG10TDIrVWJPVXBDVE5na3pBdlJD?=
 =?utf-8?B?bDdXQXhlSCtUSDlmY2x0UGFzb2ZUUU5Sb2twSzljMkxvQTJrb0tpK3BxZnMw?=
 =?utf-8?B?aG5WcWN4NXI1ODNLbXRCcW03dEpoQ2R1MWsxckh1RjNuSnBZZE1QcXhEa1JP?=
 =?utf-8?B?a2tUOWk0RUh4WHdCUktWUXNpS09XQlp6NGRKbkttM1FNWk9mU3JOcEJwSmJ5?=
 =?utf-8?B?RGNDU0xOYkgyTjB0eEhnSFlWelFCMlYvaEZtcy82aGx5eERYR29YaVNTZHYx?=
 =?utf-8?B?V084YWprYWpVWUtzNkJlQnlBaUlnbnEyeDdTL0RkR1V4YUxQckpScnRNYnBB?=
 =?utf-8?B?YVRQQURLNitGUVNuRWpmendhQk92NGlMYXZFR2pmVnhveXhMWndrTURWdWh2?=
 =?utf-8?B?cXJZNTdZZm92Nzd1Q1lHTFExcVlEY3IrZ1lLeFM4eTAzdk8vclhTai96UFFK?=
 =?utf-8?B?SXBDeWhEaEQzbDVnMFhQS3JpRGZqYkwzQ2VWRStpaDFuZVJ2K1J6aitYQVRz?=
 =?utf-8?B?a3h5LzdqVDNqV0U2eFdncTRSeVZ6cUFEaHpVMXNRWWE5Uzc2dzZyWDZvWEZ1?=
 =?utf-8?B?R3kxQWI4RG9Sb29UYTZKSFdFZXJ5cjB0WngybzVkMEpPcXhPU0FGc3pRZVlY?=
 =?utf-8?B?a2t6QUZXblpaRXoyTDliOFU0Rk9EaGVuR2Fmbzk5MW1IZ2RyUFBYQ2hOYkhq?=
 =?utf-8?B?bFdnc2V4Q3ZONkNweUh4NUdXNVBFdzZzZUVibVJNQStILzZ4UnE2QWxkVGg0?=
 =?utf-8?B?dmZ5RUVkODY5bVBsYzhEVktrQ0E3WEVtdHZUQkFOVWZvVkNhYnVmYWI1TmFv?=
 =?utf-8?B?QlFLUG5VSzh0c2toT3l0MHhyQmVSWGpRQjlTTFVEN3dKWThmS1FtY25WRDdv?=
 =?utf-8?B?bk1NYlgvVHNVdng2cnhuZEl3NzNYNUlTbGVMc1FKL0VDWXgvVmVyRHY2SDM4?=
 =?utf-8?B?TEpqNGlTM0NNRXVQRDlRbjRqd0U4T3NEc1B2WWFUN3hDLzZFMWZlKzNhT29q?=
 =?utf-8?B?bERjZnQvNk5wSjczekRuTzQ4dFpzT2d2NFBVNGI2Yk9mK2Zxa3hiTlJOM21Y?=
 =?utf-8?B?eE9Vd1Jhelp1YkRlQzdiQnpzbUpoMHJkYXpYZGp0VEFoa01pcTV1bG1zakgr?=
 =?utf-8?B?bnNXNlBIT01wWkFSSWo3ejEwMEJVYWlRS3ArellXQjlRUzFtUi9FQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GJu0ORAveeiCi8RAfcqrIqdd7bFI9LqOvdRUj4R1QdLm2tO/mFbQS2/PrXoj0E9G09QGbHGknZhmTb54ipGvhku7DKrfl8RmwIeimrH5eb3K6IOt+8dgV24wSXjvUA+BRXig0pYGH+JXwP1K0nt4MEeKpUxV4ARLao8c7Qz7vwc2JFdC4oJKc3qTSDH/OWckPiy7mETHFY+lNfPg6+XbTL2BHEvNFRMeENePoMW1lUZtO4bFWdSkxUiccCRDRyrv+HG/1DYFWPK2snCEc52KJLwVfXQQRTDUiN8vzHhW/7F1A4xEU7Nzd9sgj+yD7Dy8PBXv4FSdEIxg5QTAmt0thg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7820fd9c-e0ca-4155-05ad-08decb4b5add
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 02:02:44.0077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKNRbib0hHbvjwVyQqXI/TLEUA7JzWdlHJzH2sBRyKCLqO/Flyk8eYrpWQRjUfaCKEbruxRFI7+RYh7D045phQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7291
X-OriginatorOrg: intel.com

PiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4NCj4gU2VudDogTW9uZGF5LCBK
dW5lIDE1LCAyMDI2IDEwOjI2IEFNDQo+IFRvOiBaaHVvLCBRaXV4dSA8cWl1eHUuemh1b0BpbnRl
bC5jb20+DQo+IENjOiBMdWNrLCBUb255IDx0b255Lmx1Y2tAaW50ZWwuY29tPjsgTGFpLCBZaTEg
PHlpMS5sYWlAaW50ZWwuY29tPjsgbGludXgtDQo+IGVkYWNAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS84XSBFREFD
L3tza3hfY29tbW9uLGkxMG5tLGltaH06IE1vdmUgTUMgcmVnaXN0ZXINCj4gYWNjZXNzIGhlbHBl
cnMgdG8gc2t4X2NvbW1vbg0KPiANCj4gT24gVGh1LCBNYXkgMjEsIDIwMjYgYXQgMDM6MzE6MDVQ
TSArMDgwMCwgUWl1eHUgWmh1byB3cm90ZToNCj4gPiBCb3RoIGkxMG5tX2Jhc2ljLmMgYW5kIGlt
aF9iYXNpYy5jIHVzZSBpZGVudGljYWwgaGVscGVycyBmb3IgYWNjZXNzaW5nDQo+ID4gbWVtb3J5
IGNvbnRyb2xsZXIgTU1JTy1iYXNlZCByZWdpc3RlcnMuIE1vdmUgdGhlc2UgaGVscGVycyB0bw0K
PiA+IHNreF9jb21tb24uYyB0byBlbGltaW5hdGUgY29kZSBkdXBsaWNhdGlvbi4gVGhpcyBjaGFu
Z2UgYWxzbyBwcmVwYXJlcw0KPiA+IGZvciBhbiB1cGNvbWluZyBwYXRjaCB0aGF0IHdpbGwgbW92
ZSBSUkwocmV0cnlfcmRfZXJyX2xvZykgY29kZSBmcm9tDQo+ID4gaTEwbm1fYmFzaWMuYyB0bw0K
PiANCj4gRm9yIHRoZSBmdXR1cmU6DQo+IA0KPiBBdm9pZCBoYXZpbmcgIlRoaXMgcGF0Y2giIG9y
ICJUaGlzIGNvbW1pdCIgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBJdCBpcw0KPiB0YXV0b2xvZ2lj
YWxseSB1c2VsZXNzLg0KPiANCj4gQWxzbywgZG8NCj4gDQo+ICQgZ2l0IGdyZXAgJ1RoaXMgcGF0
Y2gnIERvY3VtZW50YXRpb24vcHJvY2Vzcw0KPiANCj4gZm9yIG1vcmUgZGV0YWlscy4NCj4gDQo+
IEFsc28sIHRoZXJlJ3Mgbm8gdXBjb21pbmcgcGF0Y2ggaW4gZ2l0IGhpc3RvcnkgZWl0aGVyLg0K
PiANCj4gU28gcGxlYXNlIGZvcm11bGF0ZSB5b3VyIGNvbW1pdCBtZXNzYWdlcyB3aXRob3V0IHJl
ZmVyZW5jaW5nIHNvbWUNCj4gcGF0Y2hlcyB3aGljaCBubyBvbmUgd291bGQga25vdyBhYm91dCB3
aGVuIHJlYWRpbmcgdGhpcyBjb21taXQgbWVzc2FnZQ0KPiBpbiB0aGUgZnV0dXJlLg0KPiANCj4g
QWxzbywgaW4gYWxsIHlvdXIgY29tbWl0IG1lc3NhZ2VzLCBkbyBub3QgZXhwbGFpbiB3aGF0IHRo
ZSBjb2RlIGRvZXMgLSB0aGF0J3MNCj4gdmlzaWJsZSBmcm9tIHRoZSBkaWZmIGl0c2VsZi4gUmF0
aGVyIGV4cGxhaW4gd2h5IHRoZSBwYXRjaCBleGlzdHMuDQo+IA0KPiBKdXN0IHNldmVyYWwgb2Yg
dGhpbmdzIHRoYXQgSSBub3RpY2VkIHdoaWxlIHByZXBhcmluZyB0aGUgcHVsbCByZXF1ZXN0Lg0K
PiANCj4gV2UgaGF2ZSBhIGJ1bmNoIG9mIGdvb2Qgc3VnZ2VzdGlvbnMgaGVyZQ0KPiANCj4gaHR0
cHM6Ly9kb2NzLmtlcm5lbC5vcmcvcHJvY2Vzcy9tYWludGFpbmVyLXRpcC5odG1sDQo+IA0KPiBh
bmQgaW4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QNCj4gDQo+
IFBsZWFzZSByZWFkIHRoZW0gYW5kIHBheSBhdHRlbnRpb24gdG8gdGhhdCBzdHVmZiBpbiB5b3Vy
IGZ1dHVyZSBzdWJtaXNzaW9ucy4NCg0KVGhhbmtzLCBCb3JpcywgZm9yIHBvaW50aW5nIHRoZXNl
IG91dC4NCg0KSSdsbCBwYXkgY2xvc2VyIGF0dGVudGlvbiB0byB0aGUgcG9pbnRzIHlvdSByYWlz
ZWQuIEknbGwgYWxzbyByZXZpZXcgdGhlIGRvY3VtZW50YXRpb24geW91IHJlZmVyZW5jZWQgYWdh
aW4uDQoNClRoYW5rcyENCi1RaXV4dQ0KDQo=
