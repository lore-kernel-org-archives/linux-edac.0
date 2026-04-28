Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75962388E7E;
	Tue, 28 Apr 2026 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386838; cv=fail; b=UhuaENkYverNcN8Z8vZoPS0lDdYP+nHstkfvdTYPFXPdPNcACJ+Gymly9Ln3Lms4PwoTKi7LMIztDgubRRgQTKEu8/Wrt7FxwTlsrugKijgfsMM3gY+RqJd84ljEbfc1TN0sD6nDHer2e07n56Q/gC+4bOKUHxRnsyUuMT/HqHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386838; c=relaxed/simple;
	bh=z+jZljv+2qONT70OnBoRxfC3hKGzIEA53IH/jwdwHRA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u5+ghT8dxpbkOiK/D0rzS2dE9cU9NnwAnHl/Pmkv+BvA23u3jHdZ4b9dapCAs1LpSNho6O/z1Mpo6bIF9P7f8HjGIEc19dvlOFFP9uP7Y2p1b4qEYwzUzQJfBUm0tQl1ZJsKQJr67+S46k0GgsjWeroerGqj7y30f8kTJC2pvbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjPp6XDq; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjPp6XDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777386837; x=1808922837;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=z+jZljv+2qONT70OnBoRxfC3hKGzIEA53IH/jwdwHRA=;
  b=jjPp6XDqnCZ5A9M+1O1bVw0L91twBCHMVT0aEdu76LFS00nPhwCgd0x4
   BXvzfEUqXW05k1dYlNEwAO0Fjy7YyDRBugx+sKi4BngJT7zLCcJB2BJxw
   9cspn32+yuuptN8wqYFOTSBhNQg2gp5NfAFDGi7/FqwAahozCQUHPZ6D/
   aezHfCcGU3WXY+5Fyhg3fLwsvDm1D5d5Wse+N9pKsvqMEih3kt6++F0Qv
   KGwbo5ffQg9gVY1lz7PS5LgjBQZroIU39mN0/ALHpdyR0wTCqrUr94vo1
   j3hXwCa4yn9qFA+t87BU3M6em/hdVxgzh2ZDOv6DXRoCk3To5dRXQmu2Y
   w==;
X-CSE-ConnectionGUID: Qc2EFtAbQbq6iOzcGJVdRQ==
X-CSE-MsgGUID: 5XgUWWsyTBqYETPqCE0JMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82149538"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="82149538"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 07:33:49 -0700
X-CSE-ConnectionGUID: 60iYODfJRZmkE77k/86U/Q==
X-CSE-MsgGUID: AQq8Q43iRbqjdM8iIm6hHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="230821449"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 07:33:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 07:33:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 07:33:48 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 07:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+cZ/DzG8/meXR8PMl2U23um1EOr5vW8vbmrbS+njY/QGhtjh7aULeDMCqHy+V/YD2OWXGmECUetLWHj1n7T77pj44OayU1yjirikzvoQJZYlAFC0xatArgCg771ieEw0AreJiL/hedWDFrQAb/OPHCgDGYdsSt2zJ0LN2ZUTpBp5cXcefhKtaPT3xyyfBEswz7lXR1R1nkj4aVpQFgYXQ+M6dHVGqiXDRhHrIQT2nPNtHvbp4/6J817LUsTNNyYNFMcKslFI1BCdo+g0YhgGuf75Ucuw4SjasXx6vRDKH2cgmybeR/8XvvsA3wsTwupsySaR2oTzaix+rw0ZwvV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7yzYZrkmaDlRwTcZjtstnnSZFfORCGNlz8PXbsyFGU=;
 b=f1n1zh5Of2/mCxYMZ7zVJmI5nudqnHejwq06CK17CFiGd2diL4acu29RbVZ4asQBdDRIVPjQbEVjOjdtNAi1+IkIwt+89kGpuiXuZfPBijoetN1mRt787/uelat49M1mO9vUpwT+UH/mxv89qygZOVan68LEhCMuIVHCnPALIeQc4c9Hrba0T72z1wm0dZv5wFzfI2LfsP4lSspoePjOwaqyfRmoNQVw4kkBPo4tIJI356XQEmbAGNUr2P7TL8eKZXLRxvyh5n7oUlV5HQnOrkY4wiQi0Hib17G3n/zYbpyj4eT4UtTqqb9RlIJItGEeuFCKXzLYV6rrB5Yt23q+OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by SA2PR11MB5049.namprd11.prod.outlook.com (2603:10b6:806:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Tue, 28 Apr
 2026 14:33:42 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 14:33:42 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Borislav Petkov <bp@alien8.de>,
	"Luck, Tony" <tony.luck@intel.com>, Qiushi Wu <wu000273@umn.edu>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] EDAC/sysfs: Fix UAF in
 edac_device_register_sysfs_main_kobj()
Thread-Topic: [PATCH] EDAC/sysfs: Fix UAF in
 edac_device_register_sysfs_main_kobj()
Thread-Index: AQHc1xXIlrlPAUoBkk2dXxlCTdDDBLX0iH2A
Date: Tue, 28 Apr 2026 14:33:42 +0000
Message-ID: <CY8PR11MB71349EE6FB5C056ED1EAD0D589372@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260428130608.368025-1-lgs201920130244@gmail.com>
In-Reply-To: <20260428130608.368025-1-lgs201920130244@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|SA2PR11MB5049:EE_
x-ms-office365-filtering-correlation-id: 88b0a41d-70ae-420b-b6e9-08dea53325b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: iRoVVE2NRmQQa5QAHNBgQsSWEiHDhrJsSa/6VC2/wvnBlVq/El8DHz3ShY2IwtLHye5lY6JasBmt/aLINUn+twQVWXLYj7hvkCGou4oegk647FUrP/0/oXX0uSWeesNudpPFR1JVCVQU0kwsGdo9KxMrQG2SoP/1qQCYNGpdjeJMF5L8VJ5fKgeAwRioR/3Lt/P7iFQY4mmiNzKFAAsbWrSAWhUdQiowM659zb4s5HbjjGQI05R5Xv7vJToJMvVquNo+rV24WQ1imJlCFTe21Wmb2Emjl/6SUkcvqTPUVVRgB6mIxRgwP1Oiii4MuzPeSqjCea4ADwT7A3MihmX7ui+jruBsrACMliofGXwEJNekFc5RrNmGIZgf+qIMHb4aeW9rMDhu9di6AiNWAfIaqlAvEy6vctPfZPtFC4T9B+7BEyxMt52zs0c201oGVKtVgJfRPp2IYvlrKdWV5VQprHRKaHgSjPBsMeyVTak4DNV09h1J7+edbwGfz4GDW7lhc8J5ws654z8yzSZdyQPyr3z3YAPCwW416nj2vvhQRX+LHPq+lzeBiz6agJa1AndRd3EndzHzZJ+tplnEPWRnOYtLAhdVRohumBAdLOxLRa8xrhKPZqmR1vEj1c5eo0QXCOMHTuu2biuJJjb9UUAzDS8GUN8OAcMY24Oj7hi77z4h1dgp/FFOTWybTKEh5OEOl/h+cSoxq300pc7cqDxV4cZJMSVsQJovBNqaVRyOjCiNE7Q1Q8V5GzgugdPCZJJlgV60TUpTuG6QbZXueVv0l6amh7BfEXYeCFhMqc5R/7U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xTdMme1jkDvmkgL+PtC+swX7U3kTs1GE2aWlxyvEfBN6UxThwcqkdXfiAjfS?=
 =?us-ascii?Q?h5Xx+Eoq6z2dgAyd1Em4/zOK6y4nOgUNqsQMFYqd1JnBLvOwJa+IHsTZZ7sK?=
 =?us-ascii?Q?Boh575cXvHYm2607mpfjICVf/VxDXL7Took0yUZa0Dg/z8T9/3m57t1hiBPn?=
 =?us-ascii?Q?W0s/VYegr2QN8+ngk2n6GfMpr2nV+gj9SbRZiSQjGfk/gHWcPda8s4us3jw6?=
 =?us-ascii?Q?1o/9lR7JVNI0qGbHkF4RlrcQMdKt5ZQ8hWQ8uJEzSZXh4tRYww9GP7Y5pBGX?=
 =?us-ascii?Q?VcHhWwdenGuLH6F28FF8bgEn+mDTfF0Keoo1eAvdtyEBJFhG9EHMZWeszjkA?=
 =?us-ascii?Q?eg1tUEY2+4aOon41Tk1vJ91rz/AzxuXm8DSAOHXWCN0HBzUwShwGKH5e9e03?=
 =?us-ascii?Q?OS3mJ2B+7hvbOjJh0M8nB9pGy/VT4Wfmg8nBFZSlqaA9f1Hz51T7u/ARbfSM?=
 =?us-ascii?Q?6+pqI+z6s6A/CrJw84y2YG3onZN1OsGrrZs3nzSiE8bhdRkJ7fGEVY+OuKDE?=
 =?us-ascii?Q?8iVINjjF2z3ib7uMZKfrBh0iHotc5+L6D0x8HrG/2zo542ZUl/R2i0ufFWRK?=
 =?us-ascii?Q?lbmRy+NMzVKkJmtiIEJXU5JYah5u8mSkUdUk7pq8p9t+PH64lutX+6fzXcH0?=
 =?us-ascii?Q?ByP9WI1oal+mwk/S3QbvbaJ7ZNYrA7eaeaskHZ3FZjq25zNsK0KVT4gQibEx?=
 =?us-ascii?Q?qksxONC/Y4M7oq5BEn8jhC4BihIJon2BJ/BMwmDQnnXM6mudOT2Xyl+kXy9Q?=
 =?us-ascii?Q?GkkT9scC+SqbrdEeugYbAm+2Xd6umob1Ykk2CZxjj0l3UmmvBkHMjOfyJRJq?=
 =?us-ascii?Q?pjM1QZTDOUt4KWtz+Agy92CLnRxFkuZZMFocjII2ci6vczoF8PgGeKbbqieZ?=
 =?us-ascii?Q?OZKNoAYAT6aCVbUgOlZIvB4+edttNWkJ+z92SJzEO7cv9nju3OH2xxWY5K7p?=
 =?us-ascii?Q?ePvCY7ML4GqGeoGZpLO4arQovpjDvAfVMMS6gbtXY3lvea9i3LAdY100iAz1?=
 =?us-ascii?Q?Rd/RaXUXSdE7YkpHNIzppO9JbOS30w6wBlwLSa3p0vz8BfIaYAtKAUOfHXV0?=
 =?us-ascii?Q?63hvu5qnFEW2pjjViDKpLRfKxgpaPzcHtX+4/9ZSxXMlUY6gZEkJBf+FM/NK?=
 =?us-ascii?Q?xvdJdU/m4w+FrafrZZMex2rWgrkpABxJey8g5CILnR/5maLq7L/G0PkPbJmc?=
 =?us-ascii?Q?G+R5B76U1U1Dzi64NlNJC86FgZDUzAH+IJUhXxT3aSd4wWP7b843vVqvmOBp?=
 =?us-ascii?Q?2uOYuzRbRGFspA7zky2o8Xf9CEFm98HBEpP2SSvRjDa1Puu1AcJrDb3sv5pp?=
 =?us-ascii?Q?JBZyqU1ghWr1M58rHbYO78glX3FiFNIOKHisABszahK+f6KZ7rOUsDLHLJKD?=
 =?us-ascii?Q?/qLRsktb2ita+Fr85iwaY6nQWr5SHSx2KUiGmFGXvNA4P48DDT/tHwtB7lzW?=
 =?us-ascii?Q?RM6xoDxl4djqtfjeMpbj8Rvm2CE1pC9tMqJjMw+u3bsklWsrxD9YT47MyZXq?=
 =?us-ascii?Q?pZ3yAnwtneoQW0yy03kzt1KJmOQ6k7JYeoNQofO0HyN6TiwYLJHf7qYwBo3P?=
 =?us-ascii?Q?na+bXruc3+4PfaGxjn4X1ER4ouAgQtZ95X36I2TJkbaubclgJcR7AY01dRO2?=
 =?us-ascii?Q?Jji/hLgdRBcioXbxPGAMU6dc3K83TY/uK2vzOHuxieZPM+1slCBluvYGWdmp?=
 =?us-ascii?Q?qXVtYKj8k76jiKmrNo5EEG/3eQgKxt06dR0AJNbymFJtgMG4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FIk1wq/cT0Qi285FaKzz7WAiSGDo9tivauo2eukgIWpaqVNNmbii1fitcIgI/gjuXL1TE5RjZF340AfZfj8Euda7uQQBcQSmt8Q3byLrKrFG+RumLJFPTD20WulF5lfNPqzcKZATWnCa54EHslvEugy4fam1150Vi9uKTPb3Fn0/K1xGyx98QlY8hGyGEGVDxT/+vAQ/RrHluR662MEfgKfMsODHtdPvECdx7xE4GE/hWUxE+0NZavseCSQkfKK3eKbsY95SeN5eKJIhFn0rFyjlJzD9qpc/PFBWmBkIXdqzawZ2JdPS5DI9lEZ0QdEHk2wuSg9JGY+2rz7zuxUaAw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b0a41d-70ae-420b-b6e9-08dea53325b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 14:33:42.7257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0v7Ptb0aHkX9l1F95erasnTMg5lsZBkNj7DS55V7DBe0HGYDgSgTtLJmOn9yZa3Au1NDOSpwHPZ+Tn3XZTOylg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5049
X-OriginatorOrg: intel.com

> From: Guangshuo Li <lgs201920130244@gmail.com>
> [...]
> Subject: [PATCH] EDAC/sysfs: Fix UAF in
> edac_device_register_sysfs_main_kobj()
>=20
> If kobject_init_and_add() fails, the error path drops the kobject referen=
ce with
> kobject_put(). This may call edac_device_ctrl_master_release(), which dro=
ps
> the module reference and frees the edac_device_ctl_info object.
>=20
> However, the same error path then calls module_put(edac_dev->owner),
> which dereferences edac_dev after it may have been freed. This can cause =
a
> use-after-free and also drops the module reference twice.
>=20
> Track whether kobject_init_and_add() has been called. If it has, rely on =
the
> kobject release callback to drop the module reference. Otherwise, drop th=
e
> module reference directly.
>=20
> This issue was found by a static analysis tool I am developing.
>=20
> Fixes: 17ed808ad2431 ("EDAC: Fix reference count leaks")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/edac/edac_device_sysfs.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/edac/edac_device_sysfs.c
> b/drivers/edac/edac_device_sysfs.c
> index fcebc4ffea26..32460c6dfb7c 100644
> --- a/drivers/edac/edac_device_sysfs.c
> +++ b/drivers/edac/edac_device_sysfs.c
> @@ -231,6 +231,7 @@ int edac_device_register_sysfs_main_kobj(struct
> edac_device_ctl_info *edac_dev)
>  	struct device *dev_root;
>  	const struct bus_type *edac_subsys;
>  	int err =3D -ENODEV;
> +	bool kobj_initialized =3D false;
>=20
>  	edac_dbg(1, "\n");
>=20
> @@ -261,6 +262,7 @@ int edac_device_register_sysfs_main_kobj(struct
> edac_device_ctl_info *edac_dev)
>  	if (err) {
>  		edac_dbg(1, "Failed to register '.../edac/%s'\n",
>  			 edac_dev->name);
> +		kobj_initialized =3D true;

This looks incorrect  - the flag is marked true on failure ???

[...]
