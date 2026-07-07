Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507B52F39B8;
	Tue,  7 Jul 2026 00:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783385599; cv=fail; b=HbNfIBv8UJRJX+fECE5eWIgVaOyULIAARIeiJIL36Uo9lgRBAfDnPRHbQO2XtdWhpN6b1ygy0ZKzcCOMkCgSu0/kCEodjQTfkIz4zPZAJz9oWdZ0Y2tS1tC/hnKAJw+1hQXLeDR22x1m8QjrA0Et+Hvuhk2fEViWToKDWVfIWd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783385599; c=relaxed/simple;
	bh=TZWxz3ro9P7HUzl7ZPNoQAdiycmRggzWxq7h1iaqmJo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IhDgFnGyl+QXFc0RB+Cf3i3zP9EB6ZLnsGYxEELZ7D5Agl8qBZabG+0kH4sJUmC0m3jfn4xOh2pd+oEJEjGnWf38SagxO+JeXlV5SuCy1IcUHdIeICxjMxrK0AWWO9SLtnS5ZsXKXDR9Urh/4UZcl2A5Abvt5UllmKDD1QqXYTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8Eg4OEt; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8Eg4OEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783385597; x=1814921597;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TZWxz3ro9P7HUzl7ZPNoQAdiycmRggzWxq7h1iaqmJo=;
  b=a8Eg4OEt8RvM+gwqPSolcCrs9v4WRBdlFxyr6OrYTDXJHPDCFb0YHRah
   eblmkNH4oOaOinzBE9r3/ZhfrqtjMCEHfVf1yvdfXo5aEAJ2qgGAEfwOb
   OSPGBWKFFdrac6oHJB2G8U9kVSFwAGTajdXdAm3AfeW5CyOQKIEdXhenP
   XvVrguLk8wWaTNEeA9gJSUiVbYeM+GJXs/Pyk9Vq7l2/lz2OBHp/ZQFV0
   IIfcVGyaV3bLL78y5AUVCfb170T2awHylEx3asJCLQRnkvTtWUezMFnQ2
   ZCKUWng9jsGc0rJGyoRHISP0yXOwEI5jol4h3j44ie5o2AWynwtlwmW+N
   A==;
X-CSE-ConnectionGUID: 67IU95HORDaUDP/yEqitLw==
X-CSE-MsgGUID: qPGWRgtfRw2MIoIZJ23VHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="71547313"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="71547313"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 17:53:15 -0700
X-CSE-ConnectionGUID: vj8PsvRkRDa+XDNK+fIL1Q==
X-CSE-MsgGUID: En/P8YBqTy2R0Xu/Uv+KWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="277068399"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 17:53:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 17:53:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 17:53:14 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 17:53:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VE+gPcqwky1+LPxMvwHnpysbBVeC06LqreGw+YtbuWDzje29nO4USMA5KHDzj+oES5YXa52+c5+LvGqwQ3Ba/Io8WlC4M3X+Jm/vCFuwZPlR1DIaKPnzfw+sl/U9IITHEdAhjJWBAz6y+MyqxnFT4325K7lb0TOnwWK2pzlAzGv06LIvLuB6vSRtWtBH5GtkJyR7JmvFj6A7FAGAYRVhMgzg0JrKdAQgrMaNKOmaHoeAdaAZceL4K9sYJL5ALQcOcwmVLhUE7yZmF1gUkVGSfMU4UpQFXl+/H6bpiYwELNVnvm3g7T8zJooZTWyLvQ9VUAgfkNyIIg6nw/te6U/6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saVQyMjWch+d4UFt5d8B5ibn9CteFO4NSis1xnOKn3A=;
 b=U7cT620WESsPY2+CLmiltWc2KKXK33SOuFRNrsXyeUv+w0rj3bB/GWjqftPRoIDY6D3uzTjZAh7SG95qS//pvQpvN557yGzV4Q+1ObsPYBFcaWZzdv4sUkQDs+/fe3Top6CZ1XQsZ/O6UcZ1SLx4Qm00dRSOsi3+uYMdAz31D0g9FkwfMjbKCDzGLHzx7SpIIMZj9K/YZTFSjrRAN+M7PM4AvIQ2e/LcXUK3hExhzi6Cop0ad0uoZ+F0OMFL2zsyrFmiBvRpVRYbAO4Hwv7gVZSzg4TfQWONXrqlLlkTkkHylu3CePE362l7bSrmGtN2MXqlS+DYTpm/olaGwL6qPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by SA0PR11MB4608.namprd11.prod.outlook.com (2603:10b6:806:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 00:53:10 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.21.0159.018; Tue, 7 Jul 2026
 00:53:10 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: "Luck, Tony" <tony.luck@intel.com>
CC: Borislav Petkov <bp@alien8.de>, "Lai, Yi1" <yi1.lai@intel.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 09/10] EDAC/igen6: Remove redundant resource configuration
 tables
Thread-Topic: [PATCH 09/10] EDAC/igen6: Remove redundant resource
 configuration tables
Thread-Index: AQHdDPeLHD2OHfdZQkqBnOEJNfuU+LZhJJmAgAAWunA=
Date: Tue, 7 Jul 2026 00:53:09 +0000
Message-ID: <CY8PR11MB71344D2EE376F84212D8C1B489F02@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
 <20260706032233.3283297-10-qiuxu.zhuo@intel.com>
 <akw6T2ViydORzd0p@agluck-desk3>
In-Reply-To: <akw6T2ViydORzd0p@agluck-desk3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|SA0PR11MB4608:EE_
x-ms-office365-filtering-correlation-id: b7a73a35-03d2-4bfd-fc32-08dedbc21d8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|38070700021|6133799003|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: Wbt6T2Yh2r2+sDro1BhBBad32yOSnCxNvj4a8DkGvqiX89upJv5qSOT/XDTXt0VOKeBWKnZbfRJm0iMeP48gTD0yN6P48yXOcxbSyIP5j/m6JzYncXZ1cukcQJTa9tlqTTlJoCRc+b+P0SUmbcE3KQ8TT/Cmzxo+ONBxS6hD/gWBT+R5cgVSGhZV5WMTJX4P1nradqJa/anP2VfVcj2rmF6YwqCpyXscaZstDIx00H+mVt4yxGhjDr8N3/Ufft4RgBqIOibLtCZzbxy1fdK87hnZABsJIMKawQWwzXBh1nozgl/eQtuQFslGVd7TT4csyXfauv2xgE4ipq4ICgfkR9gpg4ECMZZgMGCtylsGXHpEWO/VpZ5TFKC54TT9EMxI//lfTEBZWzbz2uzqcTV1vZ0dPhBFIAX1qx5n8aQEsM4y3jUysUUYsu+KlHBi4jzePEGQYwWmdc14Nt68npq/XlOMsDyuQP2g7V13EoDz6RIbSCSl8VDRZarGv87RwVdYUOvninrvJwljXgOLSz8LTWi1RDLqrFaHKIz50s8XqeXiYy+NmKzhiU+3P4YigmdFMDXVPftbswfIOlZWwUCyBEQm6KGulSmt1E2yK/BddGm8E3rBKw4HgpGO1gpyxlrEX5DY6u2rJ41FMjUnT1LC1x4jWse+E2exKahq435z5C+YwFR/bJ8JAHeerVyVdcQHTbCuMmncSh7qXenv8IXAbDJ/udicl17rVgb5b0SOnI8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(38070700021)(6133799003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GTU1C+0mbUVXEHOn60ns/pIpsv26YbJ+GlLifLTeYX34Jmk4a9OwTspUAk6R?=
 =?us-ascii?Q?oyB8akM5VSrvC2puYWGcc9qJxE2rTI1rdtdjbJ0CTb4xjLxC/VEWiDG3zZsM?=
 =?us-ascii?Q?89eb9VtMdkhKaEMvdaQUBnRlu4PULU0wUwVf95eSZYLH98bQu+gxgOCOkiww?=
 =?us-ascii?Q?mV0T8IrWLuJBj+5slL6jNRcmyPPh5tLlCjbCM+pQon/voyxE0nU3XxjyH5Lk?=
 =?us-ascii?Q?xcbLJiYxcny3kofr+wwH4cm08BJgLddDaDy/PPLu/nEUaVVsWAOiFBcuTcaq?=
 =?us-ascii?Q?kEHCFnErvBn0PvFmcAa3NvyvRnhUuKIHNQmjVIQAq2kPYdmq/uKidZoTs074?=
 =?us-ascii?Q?n1G4BeAJH/4Fw13jA1QDqltg8Ap/g7Ss5ynoLUz14YXPLwdMieofQ+zqYL99?=
 =?us-ascii?Q?NDoSL0EVYf+UMVU7NHFBezPB9F6QGEfBJ1JH0l7dR9SNjA7/2mxValUspcz4?=
 =?us-ascii?Q?bXO5/vu7VHFv0vTEgBcigTW4MltopTS06DX3jiiiee+7RnPsNVn/HUzVMt6S?=
 =?us-ascii?Q?fXmOjx3Z20JvJW3Ox/A+BFRZ7jERrHxA842D3MlBRH/Edd52RGUyX0Jq9dVy?=
 =?us-ascii?Q?7VcOWITGIDyIHuENv70KTvuelfb/DWC+bkXDGKQ6vP7RtLetW6FkvB2x4w1k?=
 =?us-ascii?Q?/ZE1btEouDuAtMuUqrv6Oe1vwIKZ+vXpbGFQS8gQACsyDoo4R+IYQBvgOKDD?=
 =?us-ascii?Q?Cb1mSpzdPjZp7WCoG/TXDE0uKXipi89mPwRbkpf74M029B8JMHEo60Up7g4V?=
 =?us-ascii?Q?7pIIwiiraVlXjPvI0SvgeuPU//fk49cijjMCd4kAasOWoAwsPjPIgt4Ar5ih?=
 =?us-ascii?Q?4q6yLjsdeWhQDsMcEeG54IVnQUx0Krpe06VUaonDZr+nJigTjj8jefaxeGuk?=
 =?us-ascii?Q?hNeWCO2oeMLsL+5cCOlkMJnSJyVZ9+nLtAF484wTNC59egEuFZEVZn94jPJW?=
 =?us-ascii?Q?7we1aQPZHl8F2MzIwsgLSLe06Q2tf6E7kSCFLyGUWWyJrDwLx2fqXCAdRqwH?=
 =?us-ascii?Q?sHzmkjAlRGuU0TZAotZWv+ivQ2NNLiP7OTE+iOAcI+LgNlviqmWsgr9EOdgd?=
 =?us-ascii?Q?fviFeP2VEF8UbJZybGo4C/pjDgTLW9+5YGjU+q6wAYOTqKBxuTG0moENIAT1?=
 =?us-ascii?Q?vXDozeP76k2q24cSVQZpBcz6Lm+yb+TudgedJRomN+0fwg8ZymfqcKGUCCi/?=
 =?us-ascii?Q?shz82wJnSq1h16fzDbd6gj8jdnZYKqT3yqoTKaIHftJEqpk6AgFdx7LkX26b?=
 =?us-ascii?Q?JRt1FactO/yUIXTehQgagGX5g0lg6fWz3jnVP2imhH34pshdbSVhuDO3aZsC?=
 =?us-ascii?Q?Fh8MrER2cQZ9Qe9CkVDtfWdnZl9xZ72vH7KaU+6UepWCylWo+TgI/YGQWFfR?=
 =?us-ascii?Q?OkySRlOnpkWSKLtJRuGOejSZjR8eRminxeHEPVsxmKM7q43OC5XR5YL6tYqQ?=
 =?us-ascii?Q?Scgfm7pfEI1bWjMW7TppI1qzTowweaAML8mPivldQxSJCeQJi62tqJ+OyltD?=
 =?us-ascii?Q?jbCsbYI0qpIMXfWtlR2WxQVSVDcd6TonBMzrKzVhsvSvrNvbC2b1jRP05Yv6?=
 =?us-ascii?Q?E7XxT/ag7pXJVlZgWLR7rMUa+0TtixZbjH+nTIdlFw2QBoKa7amnDzpDeLCS?=
 =?us-ascii?Q?M0wRwvfYcxxN5Z9zGyF3qhbey748YQca8rkm6I6PhLiw2wuWp7/D6yjhbNNM?=
 =?us-ascii?Q?WPbe6MH+ry4mADtytEbofTEgFwdQQsX94o+GH+oSE9c9KdMA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CFBu03A7ozkCOpQ5IRVAjOjqsNXMaKvT5IiXcClHbiIcwmCya+JF+WLb1upZMmbZScldAp5WBdqSkrOhxuBbbAuy/+tbE7mIhislyHohd5VXLQeuMRDkJq0pjuSkevgzbPkf2IIynbiMcTNK6QTKksUgbdZu2Ma3HNBKmdjEas6j1drnatTptmNx3fXn1i9R/Z/hnVh1PNnnSABi2oe1QVB8LsnkUK+FTF298jbma0z6CmxsPRzVagXgWAClu3aMQFylQRDpmEWuH7rq8DAtee/ndZfSkqasFe7Va+bxJ+BImnfu5p3ViBh69hQYyKdqBX7cgHbChQfeJOPKfCM9LA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a73a35-03d2-4bfd-fc32-08dedbc21d8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 00:53:09.9019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S2XcTQqFQvVMY8x0nhOBxzBHReJZT4aR8Pj8T+DT89Qwr+qLrfXoZ0Y+NNssIpMeMp8mAKqx5ti0PktVsh9rzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4608
X-OriginatorOrg: intel.com

Hi Tony,

> From: Luck, Tony <tony.luck@intel.com>
> Sent: Tuesday, July 7, 2026 7:29 AM
> To: Zhuo, Qiuxu <qiuxu.zhuo@intel.com>
> Cc: Borislav Petkov <bp@alien8.de>; Lai, Yi1 <yi1.lai@intel.com>; linux-
> edac@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 09/10] EDAC/igen6: Remove redundant resource
> configuration tables
>=20
> On Mon, Jul 06, 2026 at 11:22:32AM +0800, Qiuxu Zhuo wrote:
> > Several resource configuration tables differ only in their num_imc
> > value, while all other fields are identical. Their only purpose is to
> > describe the number of memory controllers supported by a platform.
> >
> > Since IMC count is now detected at runtime, these duplicate tables no
> > longer carry any unique platform information. Reuse the shared
> > configurations and remove the redundant tables.
> ...
> > +	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), .driver_data =3D
> > +(kernel_ulong_t)&mtl_p_cfg },
>=20
> Sharing these is good. But also might be confusing since the structure na=
mes
> include the three character short form of the CPU name.
>=20
> Please add some comments before each structure definition to list which C=
PU
> models are sharing. E.g.
>=20
> /* Shared by Meteor Lake-P, Arrow Lake, Wildcat Lake. */ static struct
> res_config mtl_p_cfg =3D {  ...
> }

Thanks for the review.
OK, I'll add comments as you suggested in v2.

Thanks!
-Qiuxu
