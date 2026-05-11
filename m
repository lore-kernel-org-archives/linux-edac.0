Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6D41E9B3D;
	Mon, 11 May 2026 01:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778463646; cv=fail; b=qIXaTtDHHedRsMZQd9Z+lX/lXZ7ZXdBs7Q+ffBmVY5TSJOuU1YeNlbhmv6eVvm+EZVKkhEFgRdi64gsRwYEjZr6LkSUvJB2CC5ETuvgMNii1dJtlIWmmTXX/JoyQrwvbXHrxiJFDlODPUzkKhsjI5n7nfpXC5BA4p09R/I9sdN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778463646; c=relaxed/simple;
	bh=dDATJnBIvqVdEVnGVaL1AT5FRmIxnjw053PZ6nlZ9G0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sjzrMBKgoVurcD3wtAUhXTOX8bba7XNIAtH974JZKVZ6m7HF0tQFZkSnXh8ILUQriHPXpb9m+Wfzle4PDiZMmxby976A/Uuw5Zs+VKT+xv9OCsUCTR0wxqQCcsI01chAwUN/p8CogWYE34TG5NyBxcn4pbsM6KEWPhFfQyiQ+lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThQknX3t; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThQknX3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778463643; x=1809999643;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dDATJnBIvqVdEVnGVaL1AT5FRmIxnjw053PZ6nlZ9G0=;
  b=ThQknX3tInPRZ9qPo0bC3GTLJONP7ZSSENvwZrO7tVp30dh39iHsb+hR
   6w+9rqppWOXr+Boq+NN2pk/sYewx0ck8Hjf7jFiKXeVrisMncEF4xGXIk
   ZFWBP3CuyrAlQcOoHSmhLJsv3ySvYWC3Mwg7uNY/kj4EpiD28onueiMT2
   4Ldl1Aw8jNEJOIijC8H9s1HjB9J2kWQ1a3pEbKrFgfrgiEmlwpdJsret/
   OFz3tOi7idkLBpGh2luoOvlRzw+ao80Dixgqza6BTVxKDvAtf3rmyaEwx
   s77Oz3HTR2F2tZZr0X4TH164WR5gkN7rB4E20tq6k1qgYCeoeuVfm5G1N
   w==;
X-CSE-ConnectionGUID: tysvbBl0SPWQA8sW7+BY7Q==
X-CSE-MsgGUID: bmf5R8s0RJCBEwfZalXCoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79369816"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79369816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 18:40:42 -0700
X-CSE-ConnectionGUID: 7PmtspiqQcOmRE6DNR+hGQ==
X-CSE-MsgGUID: dzpvvnRvSzStnnn8bfqHVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="237542173"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 18:40:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 18:40:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 10 May 2026 18:40:41 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 18:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nigF7lF1Y8CO960esACp0PhdIq9dbJNiYXUqFVMTg5F//RR75Vwc7hNbukIE1eUgaD8PV5/l9Srv5eXq4YfV1h7ZVxp1Eo64Q4MGbo0SJ1oarjeU/7h4YELI5blYYTal8Z6HKudr/YfwcH+idWSP4nc9Y9V/ZffvDD28sfn0Zd6KsSWWjVfypPFmyEim1pKAk/8jPkgr7mPke5snVuvx/ZwLdypjm0htQb1mAfwQPxBU+71gGfsBCnVSfLIvC2h/Ya7fhfmfDr+264FNVuIQuOtwzT3WoZMVbHhJEYwCV41gu0E5kwURoaiT6XJ2kGe92pnwAYRsd1vo4O0TWoCcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDATJnBIvqVdEVnGVaL1AT5FRmIxnjw053PZ6nlZ9G0=;
 b=nsZutf7e4by7vF+zrwy47u7N5XBh6BJifhnvqKYJ6mfVMmzvqThmwL/2+Q2+h95b/6N+fLb/AvRX61f0IwMHZwEwO4yRJS69DrSTT6VQ4/zB+jC0H2PX6j0bcqqB1Xe7Tixk/Fjg70bC22C72bbcka3jdW5OnjcnCupJVX1z9lpy25KKR9xpStYgm1vUkDsM0l416q/GqI6c50U+m2AA0TCK0GtVn0hJ/PMg0GIwqSDKtwsOuijQ+YV372k1g4UVtKHd9vHdcq4s3KvilqZ4VwhUYeqaJhNsvpLvM/1y3DlBNCIOiesx5T3xALIRnaM1JLWZWq0EPRR67aDaUsnH6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by PH7PR11MB5941.namprd11.prod.outlook.com (2603:10b6:510:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 01:40:33 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 01:40:33 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
CC: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "git@amd.com"
	<git@amd.com>, Borislav Petkov <bp@alien8.de>, "Luck, Tony"
	<tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: RE: [PATCH v2] EDAC/versalnet: Report PFN and page offset for DDR
 errors
Thread-Topic: [PATCH v2] EDAC/versalnet: Report PFN and page offset for DDR
 errors
Thread-Index: AQHc3tfnoG7CLlIO70uOYyNlN2PTnbYEHLbwgAKGegCAAWw0IA==
Date: Mon, 11 May 2026 01:40:33 +0000
Message-ID: <CY8PR11MB71346FF9A3BF466C30B43E5689382@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260508104248.1073957-1-shubhrajyoti.datta@amd.com>
 <CY8PR11MB7134C4903409BFF214412BCE893D2@CY8PR11MB7134.namprd11.prod.outlook.com>
 <CAKfKVtHZPq4JaqyJS04LbqVqhz8AKsG0V9esCQ4DQ4N1jX8FJg@mail.gmail.com>
In-Reply-To: <CAKfKVtHZPq4JaqyJS04LbqVqhz8AKsG0V9esCQ4DQ4N1jX8FJg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|PH7PR11MB5941:EE_
x-ms-office365-filtering-correlation-id: 5e39975d-89db-443b-2bf9-08deaefe4acf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info: sJNwravQEc09CuijONPHDuXnuU8Wo0OxoAo51uukMD+peWXx8QqaRerB8WT0zaSrEsrDU/Ie+GVKP8p0MOZv99RjCA4d7pkmn3BA49fuvF0R5g1YIM38tKN8KwfqXO/U2hlxMLB9cpwD0l9oshzeHDTzxMURnK+PRB/DT0UmCEuES/0LUsCtJB2qrLhjX3CGyDwenz9tO6m+mNKdpSIff3hBfNVQYgBAnTmVhykRXgOEsr7RxXFw9bzo+Gk/rqpA16sHkp906TeN+2fm7wkHKqXIbVAz+lSH5a93HA6zIijqHla6Fsrs5vgtwOdIHF+GOM4vAj6GFCTiiwFH/ydFtavHVeREP2jgAtlk1a97Zz45pTubXvOydKwZVVEWW6CDXFp5N0NctQVem2gpVvV+L4gRTGTh2D3a5N7XKYHwzYrD/lwga+tL9vhvH/eaRintKuB9UgoFr1tBg+JC7TitY3KCUcvkCNAoOySvCPcDiXaz2nGcpV1u3toWBuZlNlR+zaYmSPccrUq3DBq6Z4YKjgGts4e00mdk6H0g6L9LFZUxJHXa6QerQ+aG9U91VR7LdMOMKnwZAWaxrLTCxk+LoT02FJvyp061TI3ep/XSp0REmDdnWyoG6ZyZo11NqsTZdMtA1/9Yb8SwAmQ2R+SF0UxZVYje0PB+wZGOsn5UkD2H67XQPJiDO6bE6R5lNRkY29EB5I0u78ckYgnhMbmZ6l8DipajmNMHke2IAQtRUpWferAq9+s5GZrPAoXdF7Lw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWxRTVlhR01CSG52QzFuN1ZDOWt4WkN2ajRRaXI4VVlvSFE4eXJiYUd1bWlQ?=
 =?utf-8?B?NzNFMkY5QjN1UlZ4bWtpTjdXWWZQVk9KU0pSVTBhcFc0ajZrU2dmakczTDlJ?=
 =?utf-8?B?R29ZUGErWm1XSEpMMzlxdS9rY1crTCthZUIwdDZPaTdYajgxYjlLRmRiaXFE?=
 =?utf-8?B?RjdJODU2VWZLdlUxTjVIc3lob09hZ2RHSEhoK2ZIM0tOZFltN2hqZ1hkUjZ3?=
 =?utf-8?B?NUg1N2hzNStMelN5SngydHZFQW9TSkhZaEIrRFJQZ1ozTTRkL3FSaVFVQ1h5?=
 =?utf-8?B?N1pXTHpsK3lsc3ZXTXpEOVQ2NG9uUHRta0N2WHMwMGVIM3JCRUh2Y0s5NGJw?=
 =?utf-8?B?TFlycmY5VFhwRk5EYVkrd1hudGZzcHlsQjFadUNONmNtNVFSMExpaHVUaExy?=
 =?utf-8?B?dXJoaHd1WUJDWURjR1NJZm1NL25lKy9HQUNpZTEyTGNnUnNud0R4Z0ZrZ0dS?=
 =?utf-8?B?TUVEOXk2ejR5QzJXN3pSak1NemtTbUZ6M0VHay8yWVJOT0hsZmljUUFtSkcw?=
 =?utf-8?B?K0pESmlxcFJMYXdmUk51aS9ydDZvbVZZMm5OdnkrRG1jVUpsYUV4bEgreXJv?=
 =?utf-8?B?NlJFZWZCYVNkeGI0d3hEQXliRVZscGRzUGFBNmw5ZXByZ2ZsTmt2T2NTVmhx?=
 =?utf-8?B?RDNJY2VycVo0RWtyL3ZUVWRZbHVkd1pTN0lVbUcweFpJUFVkU1dYTUxWVGt4?=
 =?utf-8?B?YXVWSlFoWDJvcjljQmpjdFlMYmFicEJCK0FhK0tiTnFDQjZuUDdJU1UyZmFG?=
 =?utf-8?B?cDhTblJTeGFXTTFEcVJkVnhiZVBLd0pycFdmNUl2TGVwajBMbXl0ZE03RDcv?=
 =?utf-8?B?ZTRQTllTRmo1MUE2UVpVT2RndGkvV25nZDVxVTBKdHZCUmE5UE9MQ2VrQllq?=
 =?utf-8?B?MmM0dmN4S1hvb0tadW5MZlFkak5zZWxTK1hpUHZONmh5TGd6WWZDSkFRck0v?=
 =?utf-8?B?bHRJSGx4REdhUlhySUFSTkJ1aHFhQy90VXVQT3BHbkdDczFZYmlIRm8yenFn?=
 =?utf-8?B?V0ExOXovSkVhNFhJRVVGZC9tS0JxVlErTGZkMmxFUXp2QitkYzNyelk3Vzkv?=
 =?utf-8?B?Zzg1a3ZZL3NFbE5nNFFxMkhsejhRV05US2pxVnh6UVU2NkdnSzZZVzAzN0Jw?=
 =?utf-8?B?dDlabXVhNU1sbm5zY0I0RkJIdys0YVhNREdmRTNUb01kMXFoTWpCWTluSU5C?=
 =?utf-8?B?M3ZJZXlYV0xXOVFSbG5sZ1pPbWJIZjFxT04xcC9BOThOOXNXalN0WW1qdkY4?=
 =?utf-8?B?QTd0UmVSejJJd3F4ZnNQT2NmNjJUSjNySCtEVkR5OUp2bzJNblE3RHd6QUtV?=
 =?utf-8?B?bElsRHF2dGZ1Q1YyakFZNWtSeGVJdCt6aEh5dFdkMzBrMlB0NTUrYzhGd3NT?=
 =?utf-8?B?WEh1Q0pXakNGRVlYbWp1QlJ5ZTRhUGxaWXg0OEdlQmM0MXIvOTR6Mnk5Nkhn?=
 =?utf-8?B?cjNzQ0hPNGFZUDZxTTlORGpFdlBWcU1wOVpNck9acUYvSGpVTmFvTHdBMzha?=
 =?utf-8?B?cFBYblZXREJxYzUrVTFpQ1hxb0NUeXQyL3VoblFSQVJ3VHRaWngrcUh6aVJD?=
 =?utf-8?B?NWlVODZaQ1c1UHU3QlMyUnNwQ2JwVHYyQmxjNk92azJvNkZiVEJIRENDZ2Ev?=
 =?utf-8?B?YXZlUm9VSEhnbFc5SytaVm5aSVlsVnpzQmdhdWZ0S1FETVMyUjUwWlpyRit6?=
 =?utf-8?B?dm5XSXU3Z3BzaGpubWlpLy9ZL3JQMkdXK1dGR3VTVjhmaDl3Y21pNlZNdzNa?=
 =?utf-8?B?ZWI5b1dGT2JhRC9yWGlsNGcrZGVPb1BOUC9aVk1kYUZCdUFCdHBkTW9CbG5t?=
 =?utf-8?B?cWMwTDJJWU5STlYzRTFiNk4xTHU0WWEzdGJNNGpuTktPQ0xNeG40SERWNDJs?=
 =?utf-8?B?YTEvcGRaN1Z2YU9wT1B3K1EvWlRiRUlxNW03NUFFd2FVQW1qamJHSEtIa3Uv?=
 =?utf-8?B?VW45dytEanN6bmZrbzVwTVMzS2liUHJhVWJHTnhVZml2OHdFRkxRU2FSTzhx?=
 =?utf-8?B?a2l3RkQ4d1QvdkIvTFdBS0lUNnNWeGR1RUdjQWR5dWZlNGUwZittWWtCTFhq?=
 =?utf-8?B?ajk2WGVTeTlNeSttQnlmcXRLMmhCcElUc2tUa0M0QjdpeXBsSFA1N1RUeFBL?=
 =?utf-8?B?aTRVY0UzYmh1b09MQnViN1RmMHFVSmVRNStvTnY5dUVmaUV2VlNMc3BQbHJa?=
 =?utf-8?B?RXUzU3F0SGwwSkl1dFZJMkJSVHZGOXdHWEd0d1c2M0NjWkhlYmpmcUpNNm54?=
 =?utf-8?B?TDVBWGNaODJIa014YUlxdFcvVFdJUS9lNGNISDhkZCtPNFBQbzlCdUlnRHRH?=
 =?utf-8?Q?8kQyh3X1R998pKo3/e?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B++ABkZajDdxy5W0rFX8nRuDIQtcye7T0WFBPyfLOaEXex5XTNhbExuRACKIP6bwxI1Zna966ZZcxbzVtWd5OuYweVlbv0imnOZldA5W+Nr0AP3A0nzd3xagjysmhRPrBKlP+ur2LYu/KKxR4vjSLgQ5vrtLx63a6Ef+K/Y5brBLWXbPNBUllWHU+7Rnv2LOCK5EL+U+AhHYdLOyk2pjyYEIT1ujk9OiHsi9XnAbNw70HFDGYvfiHE7mSAj38ZmSkji0agjT5BD4t4OjjCWyRFGAxcDa/nxU4DqB/B+oZ9bblo2B4htZGEctJCrKg6i4nAO3uqifw+VXifgR2Eobxg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e39975d-89db-443b-2bf9-08deaefe4acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 01:40:33.2793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oM9NFHIHMYl4Flb3DnpkdWT5aJKPu1P0v0MuFxdnTKxBwkAChHgGrsWWbgvnbbSdHCtQqx8qvcHrf5CB4Qc/nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5941
X-OriginatorOrg: intel.com

PiBGcm9tOiBTaHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqeW90aS5kYXR0YUBnbWFpbC5jb20+
DQo+IFsuLi5dDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIEVEQUMvdmVyc2FsbmV0OiBSZXBv
cnQgUEZOIGFuZCBwYWdlIG9mZnNldCBmb3IgRERSDQo+IFsuLi5dDQo+ID4gPiAtICAgICBpZiAo
c3RhdC0+ZXJyb3JfdHlwZSA9PSBNQzVfRVJSX1RZUEVfVUUpIHsNCj4gPiA+IC0gICAgICAgICAg
ICAgcGluZiA9IHN0YXQtPnVlaW5mb1tzdGF0LT5jaGFubmVsXTsNCj4gPiA+IC0gICAgICAgICAg
ICAgc25wcmludGYocHJpdi0+bWVzc2FnZSwgc2l6ZW9mKHByaXYtPm1lc3NhZ2UpLA0KPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAiRXJyb3IgdHlwZTolcyBjb250cm9sbGVyICVkIEFkZHIg
YXQgJWx4XG4iLA0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAiVUUiLCBjdGxfbnVtLCBj
b252ZXJ0X3RvX3BoeXNpY2FsKHByaXYsIHBpbmYsDQo+ID4gPiBjdGxfbnVtLCBlcnJvcl9kYXRh
KSk7DQo+ID4gPiArICAgICBwYSA9IGNvbnZlcnRfdG9fcGh5c2ljYWwocHJpdiwgcGluZiwgY3Rs
X251bSwgZXJyb3JfZGF0YSk7DQo+ID4NCj4gPiBJIG5vdGljZWQgdGhhdCB0aGUgcmV0dXJuIGNv
bW1lbnQgb2YgY29udmVydF90b19waHlzaWNhbCgpIHNheXMNCj4gPiAicGh5c2ljYWwgYWRkcmVz
cyBvZiB0aGUgRERSIG1lbW9yeSIgWzFdLiBJJ20ganVzdCBjdXJpb3VzIGlmIHRoaXMgcmVmZXJz
IHRvOg0KPiA+DQo+ID4gICAtIHRoZSBERFIgYWRkcmVzcyBzcGFjZSAoRFJBTS1vbmx5LCB3aXRo
b3V0IE1NSU8gaG9sZXMpLCBvcg0KPiA+ICAgLSB0aGUgc3lzdGVtIHBoeXNpY2FsIGFkZHJlc3Mg
c3BhY2UgKGluY2x1ZGluZyBNTUlPIGhvbGVzKQ0KPiANCj4gSXQgaXMgdGhlIHNlY29uZCBvbmUg
dGhhdCBpdCByZXR1cm5zLg0KPiBMZXQgbWUga25vdyBpZiB0aGUgYmVsb3cgY29tbWVudCBzaG91
bGQgYmUgdXBkYXRlZA0KPiANCj4gLSAqIFJldHVybnMgcGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUg
RERSIG1lbW9yeQ0KPiArICogUmV0dXJucyB0aGUgc3lzdGVtIHBoeXNpY2FsIGFkZHJlc3MgY29y
cmVzcG9uZGluZyB0byB0aGUgcmVwb3J0ZWQgRERSDQo+IGVycm9yLg0KPiANCg0KWWVzLCBwbGVh
c2UgdXBkYXRlIHRoZSByZXR1cm4gY29tbWVudCBhY2NvcmRpbmdseS4gDQpPdGhlciB0aGFuIHRo
YXQsIExHVE0uIFRoYW5rcyENCg0KICAgUmV2aWV3ZWQtYnk6IFFpdXh1IFpodW8gPHFpdXh1Lnpo
dW9AaW50ZWwuY29tPg0KDQo+ID4NCj4gPiBJZiBpdCdzIHRoZSBmb3JtZXIsIGl0IG1heSBuZWVk
IHRvIGNvbnZlcnQgaXQgdG8gdGhlIGxhdHRlciBvbmUgYnkNCj4gPiBwcm9wZXJseSBhZGRpbmcg
YmFjayB0aGUgTU1JTyBob2xlKHMpLCBzaW5jZSB0aGUgT1MgdXNlcyBzeXN0ZW0gcGh5c2ljYWwN
Cj4gYWRkcmVzc2VzLg0KPiA+DQo=
