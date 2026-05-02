Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23285176FB1;
	Sat,  2 May 2026 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777722329; cv=fail; b=aaDwz2fqGuZCry+mWc9iPeJHWIDC/syG0VpiVeLDWGbsR761EiW3zgHfvFbxjxk4Ti8Nq0Kxy6Fz8S0KVRAgVm04QsL8VUmEMzJZPa8sfXMBHd9zYswWvwiRCfjYBTZU17VVestEfFHRi/kJ5MQUeNMCxV8NvW9ODwB2iZTlgG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777722329; c=relaxed/simple;
	bh=k3k8p5OJGqx5eJbWt8fAw6A341d8CILeuihjjSbzntw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Lb8ma9qFxW+1hKcKSDraFxR+qjGEwT4DP7W4Ub6FCTBR7ipQn2Eo0xHxScz6TOcsN628yG9ImlxH4xAlDMYjg/9XrKHkTW+qvZvpfUDX6CAMFeQSdcHfRRtkr1hti7c72KpVxh5uHYS+heCQRwcqs3iZGl3d9G3IcUXMlmGj2rU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYRQUbMf; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYRQUbMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777722328; x=1809258328;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k3k8p5OJGqx5eJbWt8fAw6A341d8CILeuihjjSbzntw=;
  b=jYRQUbMfwKJPjjxsu7i56uZMnmxM3XAWwOUrvsNVozbXxO2fkfLJPqq4
   SsHL0cQDtnFMxbRyTJxiYA+QHNpGglMe8E31l1z4imEd3fUoiD3lbXCJF
   douOTnzuBL1OeEo+wTUw4NUeVH7rrK/1l7zGS/DU2a15eORh/6nNmKBby
   DEHJcq6bNawZ6F6vOaOwmEkSgtKCYXiKPWZxcRW86Wgkv1JOLoKMRQdcV
   trp7b+xg9LRN6lrgvnonUbItyWj5FCYUhiK5xkm8Jl6aQ1SODcQUBn44l
   HVhwGHajwRCGpXBXNsPFlrjSmBH4WnnVgIIi6SgcL6c4HE+KIoIyVvOEf
   w==;
X-CSE-ConnectionGUID: 5wHoZgJNT+aF1tC1Hi3iGg==
X-CSE-MsgGUID: Vt5IayAoTcOKyCLz5DI5Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="89762139"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="89762139"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 04:45:28 -0700
X-CSE-ConnectionGUID: oR4EtM6/TLeP4HZYW9HT5w==
X-CSE-MsgGUID: ZNc0FSe6TSi8XSw6noM08g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="231948667"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 04:45:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 2 May 2026 04:45:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 2 May 2026 04:45:27 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 2 May 2026 04:45:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oImFwipHGWGE7Q083IqEZ2tpumwdfezAlmHwAdPZYo0I4kKkNc5HQybyM0JMLrh++hbgFZIBFTO6BhBuzE7MLZR1hYUwb40yRpwhuNfW5bm7pRKgwj4ISNrud/Vf00sgjVi/iDJc9vCBTlhnYgpyYoTvPIQWXJG0HyAR4RtukYWdsRQbHShNeAW1KvKNctR/S57Kl2fJQPvFxwqJv9UIR1mjXPkjywMzJaxQreERKwKyixQrW4xzUWLD96U3i3S5Hn/29K0D9TNoPvvMkngaeMEj2MtMDlBsjKufFbGCTRS7kgPHL+2NOwpyQKLDvHzZ8ViFgq1+vpZMWnclBzoE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3k8p5OJGqx5eJbWt8fAw6A341d8CILeuihjjSbzntw=;
 b=jbY7QGMD2NFWSfkyAXN0E57arRn8EeiAXBu5BuhuoQU45yOKlSX0sT68pL9+CTkmTP5FgELMhciDZFeER2rZmvgfLPnk5qHGQmOqbTLe8RiCi36CRZsBcCSESNm7U/bwojMfK2pz2Wet++eQ40euyXQ6WyeH1KWLq4j2dgsuHBJstwv4wMIL6T3Igip3KO07BheJUEgeHmlKrJuk/yk2ViyV0QmfvtVuS9dt/yuqad3nFvau1TyHBuaniSDNZpD+aeJQ1Svo9G1dw7O4y0geNB72sIXKKm31F3FcP2G3PwAbayccqf6/GrKYVYk2wr6Pq218ovpnzu+4jzUBiJ1WJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Sat, 2 May
 2026 11:45:24 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9870.022; Sat, 2 May 2026
 11:45:24 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
CC: Borislav Petkov <bp@alien8.de>, "Luck, Tony" <tony.luck@intel.com>, "Doug
 Thompson" <dougthompson@xmission.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] EDAC/sysfs: Fix error handling in
 edac_device_create_instance()
Thread-Topic: [PATCH] EDAC/sysfs: Fix error handling in
 edac_device_create_instance()
Thread-Index: AQHc2Jkvge4PLvwGC0mCdq4SHoagWbX3rDTggAKq+YCAAEmFAA==
Date: Sat, 2 May 2026 11:45:24 +0000
Message-ID: <CY8PR11MB713403179C8848A092901B1B89332@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260430120019.464049-1-lgs201920130244@gmail.com>
 <CY8PR11MB7134859F653851C59277F12689352@CY8PR11MB7134.namprd11.prod.outlook.com>
 <CANUHTR9TFNhakLCWjFQQ-7omFBUki47bB1+AXrNTdRGaY4T16g@mail.gmail.com>
In-Reply-To: <CANUHTR9TFNhakLCWjFQQ-7omFBUki47bB1+AXrNTdRGaY4T16g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|DS0PR11MB7788:EE_
x-ms-office365-filtering-correlation-id: da6f1dc8-bb7f-4ee8-b517-08dea8404c70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: LW8yPsDgd/n4g2kT7iMUZ4SYYBC9xlRDBg0CYivcUxGnv2i4exmkgSTiMV5ZCGUPtWhrL1/8dFOgKNYga16rzy88EQXIHYUucZxKFSTV9Oi/7XrPD5fnXJzrXssjU4L+2Hi2jP/ycRBEOB1lyW0wVNf2xVxap//zF27aMwO89+7u9owlpIA/ylCkO9Jg5Ir/qbWRoG0wdT30UeDJNFIT6RrCMCETEFVP2xdM33sNtyhkBATIAF7JYQXUV4RZRrZHJW61PambPZnSaupjdlwtJbU4VF4S93b0hOiUKCTD3xGv8L+2IZn+T4PsFG7xnHvRluEZNrPrx7Sks+F/8h1KAwyF0GSddOblTpUvk/0dLb6AntGC4pXawe3JQm+DW5p1q2C1JgDofKGETKOFPXvnuj84k9R8h7hI+ChMCYYJqe5i34MaKzGTKegLi1SGvpo4LoDpKzHL4FdswabGYvDWFcyln96/OEblJIHbM1Oa/QfJguMBl2o20S01DPkAyzDkrycVHm7j8C9SzW5Z3HTOyZZRx/sCw8zBJg8dDvFZF0dUciehECRxY4idr4fGOQLm8eIl9o+sW7jwMWjQ3BssCF4JBsAdoFq0TcR8q1f1IuniA5NArr9jyG5JBFsbci7go7k2X3YNoEm+csVSifLiBeOAkRpUG7FYxBM8HMqhGuUWIKN/cxS4sxSdNY1bqFTqcVFNY+rA5p8p6c1gBLGLMghw+wiWNiOMH+WgNlpOFr56kx9SJ09r658dnK99HXWn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUNuamNUWjN2WmxjYlRRTUNTejdZMXliZkRPamh0MXVmSmxMcXdnZ3BkNDJ0?=
 =?utf-8?B?NUoydHpHRFU5ckRWTTZxY0hIRm9haFk0bVdheW51T08xZUVtSlU0ZlpweE40?=
 =?utf-8?B?eHNoNWgzTzNSMTluSEFKS3lDN0xvdElVTis4M3B6UzdxdndoWmNCZ2k3U3Ex?=
 =?utf-8?B?OXNJaXdmeDNEdnRxRVJjUzc5ZHhPMXNHYW9tRDlYdjFoYU9Sc3c3Y1hBQlU3?=
 =?utf-8?B?eWpqTWhlNEtyRzRMU0NrRVNVQVhwZGZzTGJPTTAzN2hEUU9uNHlsR09jQjBn?=
 =?utf-8?B?U21ib01TVTVGOUVlOGgzV3V1OEdJODJ5WlVBRTZzYXVsQ1ZnbExpS3VKSmNw?=
 =?utf-8?B?RUh6OUtuVVFPWTlXNlgzODNsZTFISGhDeFlhNExoU2V5eUZtV1NuYVlFVEdx?=
 =?utf-8?B?YW11VXBxZFVsL2V2SFlTNEJQcHI3YytFRnkrbGdzSU51M016dVVHOUFFdE5I?=
 =?utf-8?B?bGIwNmlFamNlVVJsMzhDMEFWcTU5MmliNTltOGhkNjVmN1dqZ3R3K3dTOEw2?=
 =?utf-8?B?ak1GRVhPdlRPMlQ2Z0dTeC9ZbUkrcHprRnVORFkzY1pnejF6ZGI5aFE4YjRL?=
 =?utf-8?B?M09ZbXBnaHJIbGxQNmF6MlA4Q0h4K1M2RGRQUmtHOHRlSnkzSlo3Qy9wYlBP?=
 =?utf-8?B?SVkvK1NEZUp0a0haWnpzMWFDL0hEbFgrenJ2UUZoRUFRSjRBRFV1T25UamJv?=
 =?utf-8?B?TXhETy9JdEE5V0x6TDh4UmszeWxKQzgwaWFGbVBKOVozWFRQK2Npb2tmMkpH?=
 =?utf-8?B?ZTdZbnZXd1RyNjVJQkFRM2xTdlRpdG5UQ3V4c3p2cVB2K0tqUzRwc0trQWtG?=
 =?utf-8?B?ZVlUTzJKanNZcDJkczJvZUF0c1BKUWhqdzVySFF3WHp5OFloTmhtekxKcS8w?=
 =?utf-8?B?cHpwMmZuSjBqK2ZONEZSNFZwOWkvQ3VuWDZTbVU1dVBMYVdPOUx6ZExQbTVT?=
 =?utf-8?B?Z3V0MGorUi9Yc2tObWtweVl3YmpDRjgxUWdicERpRU1SNGFhMklZS29iWVhW?=
 =?utf-8?B?YUtaRmcwU3U0aWhPbVBlN1g4aVYwRVIwdWZYSnE3aHFaR2VwKy84dFhOd21F?=
 =?utf-8?B?Q05tdTZqUzJEVCtqdXp3MUJRZmYyZGRzek03UHQxTUZZVDFiVXU5MDFQNk9L?=
 =?utf-8?B?VTdtcHd3clBOS3NuRWlZYTlXYWtKZXZVMDFISlAyQ0ltWDBVTXZYNTdTamFl?=
 =?utf-8?B?UzdVQ2U1bUNuT3VPc1dHcVRaQjA4OEo1dVJLRFpzM0M5UnE0Wjd5Ky9YQTA1?=
 =?utf-8?B?ZmxITFFXNFF0SXhuTlFMSWxEU3R0N016WHE1R0Fna0RWSDNSb0xwMDZDVHpF?=
 =?utf-8?B?L2Y0TW04aXNRYTZNTnViTGtsenJ3YnN2R1cxYnNLWUtaZTN6U3FGZTVBV1or?=
 =?utf-8?B?OFoyVU9IRjVHQVhGK2hTc2JzQmNrY2s5NVJSOTlLbm1lQnlScFZJbFZaa2Zt?=
 =?utf-8?B?YnpleWVkYzNnTkNOZGNETWZaODFqWm05M2Y2MDB0akIrd09INmZ4Q3U0aDdz?=
 =?utf-8?B?dHZQczVTdWs2N044dzRBYjZUKzhCVCtVdFMwd2xkRk9XQW41VXZCNy9ORnRC?=
 =?utf-8?B?WXpadXd6ajVIekEvK1p4RG9RTzFBTzdQUk9rWHp4T2RqMFFoUWpkNVZweTYx?=
 =?utf-8?B?MXhCMTE5OEFZdXUweVZsZzZwMDg0RENBS2hWeVFwZHcrMDFrRHZIZDhqbGlZ?=
 =?utf-8?B?S3lKVjVNNXBlL2dYWTZqNllSdWdMVE9LNHNJRVRaV1pjSUdEdUJKYlo5VWNI?=
 =?utf-8?B?U3FxcWpSWG9RbTBGdEpUS1FoOWc1VlZpU0RZeDVxK2ZGNDNqZzR5ZUpLVGtP?=
 =?utf-8?B?OW9IYmNXN1U0Q2NxZWZtRTVZN0NMdzVrWlUyV0QxdVpOQ3dPeUtlcHpyWVFp?=
 =?utf-8?B?S0xEZEZGa2ZwVGF6T2M2VHVYdkVyYUozcFBWdlViWEd1dlFMdW9KbU1uN1pG?=
 =?utf-8?B?aWhRc0FtWXdEblNlU1I2d1NyaVVrZm9ScGdkUEk3bDkxL2RmZE1nbWFPSGdF?=
 =?utf-8?B?S2QrSHdIQXlHSmlEQmQ1dE9NYndobyszWjFTeDNEN2NJMTlCQ0owYi9ZQWR6?=
 =?utf-8?B?amdEcWc0K05xL1JzL1lyLzhQR2VOTmx6bElTMDlEbHpCVjNaV2tmcmJ5ZFl3?=
 =?utf-8?B?VGNBWUtrblRsK1AzZ29FbE9BUy96azh2aDRFbDkybGhFVFl2OURXQUdQS2JU?=
 =?utf-8?B?N2VkZ0wvaHBTNGw3blhnaVczYXJSL3hYblE0WDFNYWczYm9vTEkrb1F2a3RK?=
 =?utf-8?B?WkV6VEQwQ3lad0wvWTlQSzE2K2FvbFRHOWJ5RVppNWU0NzZXaXUrSDJERlhq?=
 =?utf-8?B?eFBwZDBpc1I2Z1ZyNkhCUExRSVc1VXV3RmJrZzNXRWs3Z05Ic2U1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AavLj6d42wMGcH1XxeyDjYLudGIi06AYukBc+qSornhvsyTvZ/LlLv9NqgYxZjAO1cLPVvgWJDL9eYGF5i7P45WA5ht94TlhFWL9rFR96ZsVC1PSvmzGH4ClwAh0vaFVzbGZhoiHKQesiZKF9gF/rlBejorEnGMvto91lXCeDJ9INFGIrYbv3rY1MwbN4+a8LjGMUsre9s5DdxinrXCRjO3cIMCgifd1h7Gfx1sYykA3swbwZKR1c1m39IFdOT4lKuKmSVw/+JoNQTUV/Wfo17PPXZ5OrvTIzzuP6nWlFWqX7rfolBT37Y85QwQVWx7jXOld3JVHfa8mD5ZGiYb2lA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6f1dc8-bb7f-4ee8-b517-08dea8404c70
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2026 11:45:24.6666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHd6IudtPy2sozkn5NRrRs5ve4uWrrU2chjt+5+rSs4Bf+6R2/PvyWMJrPc/CWbB7nB5vAnEZKkKisLWAYk+Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
X-OriginatorOrg: intel.com

PiBGcm9tOiBHdWFuZ3NodW8gTGkgPGxnczIwMTkyMDEzMDI0NEBnbWFpbC5jb20+DQo+IFsuLi5d
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIEVEQUMvc3lzZnM6IEZpeCBlcnJvciBoYW5kbGluZyBp
bg0KPiBlZGFjX2RldmljZV9jcmVhdGVfaW5zdGFuY2UoKQ0KPiBbLi4uXQ0KPiANCj4gSSB3aWxs
IGNoZWNrIGFsbCBrb2JqZWN0X2luaXRfYW5kX2FkZCgpIGVycm9yIHBhdGhzIHVuZGVyIGRyaXZl
cnMvZWRhYy8gYW5kDQo+IGFkZHJlc3MgdGhlIHNpbWlsYXIgaXNzdWVzIHRvZ2V0aGVyIGluIGEg
djIgcGF0Y2guDQo+IA0KDQpUaGFua3MgZm9yIHlvdXIgdXBkYXRlZCB2MyBwYXRjaC4NCg0KLVFp
dXh1DQo=
