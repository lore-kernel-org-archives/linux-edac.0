Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813A71DDC2B;
	Wed, 18 Mar 2026 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773852419; cv=fail; b=aoQf6Mvuf/G90CrTUXKIkAUqveD/Rx+s4u1/Rq2Fu3Qid5tzimN5SQu+4lAciHXIQOguqP6Qid4J+RHyrpiabScMNcmJdPS5yHElLtQx65+FOE06TnxiQjb32U95B2597G4B3HKHndVmBWIrzNDmnoO/KissB6W/vlyzb6G/lqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773852419; c=relaxed/simple;
	bh=t05uAcSvQDazJsO4yYuLDlZbV9TS4BelBddDyoYvUAU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iADPtc3d0UAMG6rl77EPYMDJ4vsr4/+s6ctCcdwgXVjJRYokPI/jo+ChAgOkL9FS52RqjtitDDcvjXSWsyWUGhkL+cw39NqJ0m65f/lNM+/Bn9E7jm2GRaoEU7XfurAvdvkp+6nUy/qZyuGJHw945x9VNfmaK7u8pnbKeYXAljA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYC3sj4a; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYC3sj4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773852418; x=1805388418;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t05uAcSvQDazJsO4yYuLDlZbV9TS4BelBddDyoYvUAU=;
  b=RYC3sj4aY1zj2Q8D31Ul37ZsN+odvvVZ7vopEHd+MlG/4XaZqWP2HuTM
   GH4hf0hX4I4guKzIxP/anqRRWYrCZyjwvwRnLPU64x9+Kldq9Qr4prXrr
   Cv60GWMtHBV70cqvOkg31idalKYeHWFaplDQ+dB6yHicNZqR9AJ7vncBA
   pDoQVRIEe24Nf8xUmpkxoSho6bIioZmuEXiWbGm6kZjX9U5NLAavhl/Er
   I46cBK4TXOtLUvqDUGvWlm24ecMbIIU/hWdnYDXrfl0Tk86jOmvLAGTtv
   iZXs+yT/iDlbrqVcv6tL4KzdVxTCRoWjE0r+yZRJMYy7RqBO1u02BZiDV
   Q==;
X-CSE-ConnectionGUID: IcH+D5i5TSq7Zpez+juung==
X-CSE-MsgGUID: HiSaZShHTPm37kjglyOwog==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86389904"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="86389904"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 09:46:44 -0700
X-CSE-ConnectionGUID: Ynv0Sre/T0KYkSe4W1ux8g==
X-CSE-MsgGUID: myj7g4ZLRUCiUj8fD/crHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="221913450"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 09:46:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:46:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 09:46:42 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:46:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpseXkV2TlHX0FSgbW2uALiPJh1u0cag5qaJTRULgPrnZ5TH0k442cHSmcexjF7uS+mYvwSr2eRub9hsBFv87OPAvhiEl7fOdNZB1UHEDJIpHFd6ExSW7Q3fRJBT282T3nvBI/9zCjVxXDyWNFPw6pHsfCI1+77yapx5Bgg3wE2nOvS4GOty8qgFLLBs+Lt4JWD9kwSaB6lbX/Eqbs3YDpw08HQ6TF7dQwAitK4wRJpBUL5ZDHpT5fBMBCVVj4guigMoM2X5+s5d9DYufAnVaOj85YLretfcLssgxDtbKCwKG7NtUNrOl3A99+BhOHYll54dKoNdNMWVomJBzlwM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t05uAcSvQDazJsO4yYuLDlZbV9TS4BelBddDyoYvUAU=;
 b=YUkpjrVUId2LgjThzkCsOH+J4UayL5LI60fs6q2ZAo/muSOpLlMeQ3O1XwVf1F7aYDZidcErpp2NWPWn3xS8EgbU6sURjc8BhsGDTB26XEzGHn8dtiZojVFCS2DfNsBTj5rhJZcdaJlcdO5PJ8qISmnpqT2BkQEZ1bBCLpyua6P07Kw4Tm69IrgSWcbjISwc4oWKcZ+1PrS7iX9+WWna8WFH4X/f/z6ooJF8L25EyPS8qlk146hkKqqjciNuvi20gGd0mpsWUt7O9ee3BlLbgPVdtWmoSuv4B0UV3X2D9/qkHuG9F2h+LwW9c0+05MsGJXC4LKr0zqE87mquL9odgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CY5PR11MB6438.namprd11.prod.outlook.com (2603:10b6:930:35::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Wed, 18 Mar
 2026 16:46:39 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.20.9723.013; Wed, 18 Mar 2026
 16:46:39 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, Borislav Petkov <bp@alien8.de>
CC: "Fan, Shawn" <shawn.fan@intel.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] EDAC/i10nm: Add driver decoder for Granite Rapids
 server
Thread-Topic: [PATCH 1/1] EDAC/i10nm: Add driver decoder for Granite Rapids
 server
Thread-Index: AQHctn/UevCM8W2/VkKIzVBEw7RPh7W0gFZA
Date: Wed, 18 Mar 2026 16:46:39 +0000
Message-ID: <SJ1PR11MB608341C75949A1A59E11DAB0FC4EA@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260318023118.2704139-1-qiuxu.zhuo@intel.com>
In-Reply-To: <20260318023118.2704139-1-qiuxu.zhuo@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CY5PR11MB6438:EE_
x-ms-office365-filtering-correlation-id: 98f02b32-2cf1-4019-0183-08de850ded31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: HNQKhwiiU+2nVYLvVBwZYNU5KFeUtSVOLbMhsJKCHSbMhj+aZbNhH9NGDopOT1W4WAzR1TA/EXRpTUnxuA14jduHdYvzpCa3kVZp+XROZ5gzpF6zBHxY3v+KR24mIpnvZs7BQ5oF8xJrZxEXId6knyOZ6q2kZG7/El4XHGddgw1vCSM7XJuCTfYCfBwBsDwhNt7H5ZDuoWtWNHnj1IVSbY/1dNpp6HBbMZJHZ1uzpse2PkPsJr3ZFqFbZWl7dSu6aqPjZOvhxoeSWN9vGpyJuN4zEqHMLR/7XFFeH5yHLbxf39GBBw+WrRmpzIfIRgiT9bTtiLOOOWhiMnaIWC2iGwNXazz+N0qXEAnZ1fGa7EYOboxCZk87/KGxA1k8cfgIZiItf9PYL0vUvgVcNzn9FxD29U6eAXYARumE8OA6t8p6khP0om1NtXIXIgG2jhx+Lz6eiNxIOZ4B8gG4gnPRoTuBGfus1LJIpwwvBI3WzWTavAgeWIDv9RhuXgA15WKjPOzZ+Q0NWISI/tte1/6RWXiFgeySUbb7O24bK2dOXrk10t/RneemFTiS1NmXxxaG1S91INXBQQsUkueuNwMh1bV9ZCg2Fn18m/F2Iy7cgz+8Hyh/vpmmJuDTJYOscdyOSkZtUtAiy5uwPKRwBP2I6CbD652uu0rLxDXN0yW7hEH+Zk9Wt37hboM6QubxEBAtQTZfnpGYye6GJ2AeMYb7Kr+DAIpcYEdOgyIykf2ImV7145hY60FuiiOIY2XVIxMm7eBeNmo54VBuEa7d1nxoeThoLP61U3gr07a9QcEJcWg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RHZvWNyNKF8R9bfi7B6kGPs2HuwOz/50u47SY3bDtdwqSltInZsQTG6Z/wWr?=
 =?us-ascii?Q?UBlHtp0mOG8EIjOAKPc5VBc9k8YRR8TpybKqIZgqb/WjX+iwjpLGDpscVHdq?=
 =?us-ascii?Q?4hP9NN5qqptci1v+lpJo7o8FUGZI4ItLtNN5i4hCxPWUPrdsbX2LMM6LOUC/?=
 =?us-ascii?Q?SwOETzCOkRng01JTF/ktPne5/8ad+whiGZFjrmlvIbQBCLqMGYJxcoi6h7Wz?=
 =?us-ascii?Q?4cF3uOfkxFJ1O7o3d++JeQxMBuRVMgsJ++wL2wkObRS/jh8Dq8hfiTbLxVac?=
 =?us-ascii?Q?kZxwxIc31Ki3DUPq2dnlpdoJzHXFtF4+FG7+UWMx+s1CasBOANoZ+xJ+hECd?=
 =?us-ascii?Q?kdc5j6fUg0J1iD2BMMjhF3iGsVPr9Q5c9XQRWFV+sS5EtQqc7ziFkZKF9u7o?=
 =?us-ascii?Q?DGQtlOhajw58b1PtdSTGdWWMCpTESyP48v5KhR6xqOQnRhHVqqDrP0t9LuBr?=
 =?us-ascii?Q?ChUvjnrNaDeWjcbpdw6ZjFVJAlakW34xIDZRfpZCrykTb85jK9CoIyU9oc9Z?=
 =?us-ascii?Q?stpm+VCTm2T9uqVmz3PR6lIiSspJu/1KSVYLtfMY0WJAY2gJCXr89SR0/rpR?=
 =?us-ascii?Q?pa0bbPz0mlfZZs65hmpa0IuYhf3r72T+oyj8zAh+VJth9ZOF6dkEXCBOD3Uv?=
 =?us-ascii?Q?jakEeieNANtRWRT4nyfpGg7S7JPsMHkl+K04KNNSixFyXpCod8GVjzET50ea?=
 =?us-ascii?Q?8zig8c12xEXXxmVRPi97HjpONF79PY01c9X5uC6eoA7NVMbNYXPMQbKYy6h+?=
 =?us-ascii?Q?lhwCLcYywJodNpGbCd+Dnf+ALgVrHfJDDSzrE2DyBbm2qZrnBEQHSeySWd7g?=
 =?us-ascii?Q?exkkiY18ETgS5+2wchG0uIqT3jNd8uGuJHqAxm1a8qmggFkuGYHeB+7P/9D6?=
 =?us-ascii?Q?JEze68kgXUnk1n0Vt4vLFr0CrBknWIiMHy3XptajkgHzxDsXzadOi97/RkBE?=
 =?us-ascii?Q?3Q+752gvBDBKMzKViboDapxacreQonEtVKGJYzX1M7znFJNiAkdJdl9VQgWf?=
 =?us-ascii?Q?R0oIc34fAlq1/rwHIsFga79ts4mb7M+Bzi1q5H4/2z5TBBFu752UGncxWVE2?=
 =?us-ascii?Q?NmG4vESRAnoFndsMnR7DCw85EYCqQNM4FNB1M+D62q0n98TN/T7MrWbXPhK6?=
 =?us-ascii?Q?Hr4Yn805s3E1+Jz900Bz6BHA/1pWccdDvunAfJ70ZHm7w4gNJQGtXLFBSK75?=
 =?us-ascii?Q?7MeF2VlrzrYob8CZKKPN55V57bL2TTkqhV9wzcPcC4+rLF/LcFzDubiqndGW?=
 =?us-ascii?Q?F8Iw+aIVmit0+Q7pIQONQ40WHjfLuFNS14fGYob8WL/6fXm1m4qcwZpVCVwy?=
 =?us-ascii?Q?pg3A/UIyAt5AYhOhaJD0TP6iyG9DZpDxnYNxZ2F0Vv8eLJwt1nCUNsCrNyzH?=
 =?us-ascii?Q?cWRLZWPTsDHmznZwoew9ioAbYKgCgkoxPnRPFdvhwuqqVHyxQHetu+XMlJg4?=
 =?us-ascii?Q?/hR4PCbQrkzM6jgQLE+iFhruTeK9BTof66xdjRAavX3iih9CU3Po7tjQTewQ?=
 =?us-ascii?Q?rd0IXgxS6T/83wTWrvmNHvlFK+HvpBQmR/i6HgyzxzZF76BzZg10KXYciNxN?=
 =?us-ascii?Q?CH9WLHt/y2qJvz/QC+UZ9rzglCwAWrbVqrlsAedDM0J3wg0fG1TyM3l/zzYt?=
 =?us-ascii?Q?LEljHHocGkwBksnko+Wgk2ER63ENsSlyIal3D2e+YEec9lZk88mHFL5Uj9ZX?=
 =?us-ascii?Q?s4wOfHb9+nD+utiNfbYYIhgImYs5jbi+GhEra0ybZuBjqilJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bEULuh+a8KSYzTIydYUTGRaqvJb3uyd7/ZNDoyuWQNu/Dk9hPVxEOjBS2eLwXZSgjz/No3JhFRSCjoYyfDdvheJk+fhHdOJLm7tL1qtDfo1JdhID29Q4G4Q+hxuFPRwuaMWDXV9VqyLJReraV49MQ4z+A4XCtdToZt7jRcdxh61R3CA24qJ2KvWx5GnAIl7ycbrUbq8qugtIHVmvhh235ZuY757GWe+XzUHCflwvSLEm4yzemqPPXa2S9tthPQhUFQaS4ZUDQZSIuxbgYrThdOmdj1GwPXs66KFP0lsF5oZ604NCP4Ih/d17kt1D2phiOD3WMWHEfiBXTui0/a1Txw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f02b32-2cf1-4019-0183-08de850ded31
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 16:46:39.3478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xWaFESY/4hLaKlLJoIIVbQFM85+kzBqh4X3toP+a+3+CuWpy3iiYuWdWGwTlfXC7mK1S9hhGOr0W/6d/wieuKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6438
X-OriginatorOrg: intel.com

> Current i10nm_edac only supports the firmware decoder (ACPI DSM methods)
> for Granite Rapids servers. Add the driver decoder, which directly
> extracts error information from the IMC MC error codes, to improve
> decoding performance for Granite Rapids.
>
> Tested-by: Shawn Fan <shawn.fan@intel.com>
> Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

Applied. Thanks.

-Tony
