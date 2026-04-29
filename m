Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10DD27281E;
	Wed, 29 Apr 2026 05:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441894; cv=fail; b=TJ4AsMLK51oHf2oGp56rRny3enAZYIDqAHn46E2KwDjjlmXkx504asnIcVCXB0wL+NywF1+YGKKpylwNtp4pSrgDOJfBcc7w0eGvPLL5CZXuR4xIrx06fq7PjE8BPR9HjUz+1I5PB/x2sS4wHT4uljsB120lkdHiCmOxXZopLjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441894; c=relaxed/simple;
	bh=m9kGWQFH5nwEHl7Nlo2Y4+NgS0l8BA5RbWZUCuWKvBQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a227r0UkUYt0mBobutnFJsyIlzNgbRLNm84XcN2//ZmKS8IsXzRuyuvXHpzkty7NCNPnIbmwlNEaQi5cNxCInr4FyJx3PvBiQ3R8PhwK1VEqg/xY2fxV0d7g6EuJ+ltK/CrNeDjybJ6xBWnX6nfyH0x8Nhswls+IvWGxTNXpFhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGHGoC+P; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGHGoC+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777441892; x=1808977892;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=m9kGWQFH5nwEHl7Nlo2Y4+NgS0l8BA5RbWZUCuWKvBQ=;
  b=eGHGoC+PS7peNG2VQu8WhSoWxkTacPi0dxRfChui1QD43JgmqG6ZKp+I
   jaoX7EhTKupsS4BsNCnR0fWl/k7MIOfLd3QMjsMPToyFX9TuY+137hrxU
   88gdS/P9/jaGUkjaq5cBdDfPcWS5GqKjSx8QISR3d23/7EPUdTIngWRmh
   KWBoPHSBm4RTx+W8h4CSnq/tLutKgEA/8jHZn1tteI0iz3vDXVQ4igB/2
   vvch/8lkBrIXR8Q8cFAjX9I9AdQjqB80/myYbE9wYWG4+T3pXnOnfQij9
   pdF25xwWrhMDMVLmdOepsMPi/Ew0SxOJu5LDC69s5xTgP6fTyv/x8G9Sf
   A==;
X-CSE-ConnectionGUID: 36Csbt+QQYiePYetWTugJA==
X-CSE-MsgGUID: q5wI/uDzQfS8oJtA9EP/cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="81970758"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="81970758"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 22:51:31 -0700
X-CSE-ConnectionGUID: d1qNUqtkR2CLBIXEUXlIeA==
X-CSE-MsgGUID: +RozVRZqRrykvuAqL1Vlrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="234451366"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 22:51:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 22:51:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 22:51:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 22:51:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7fkHVOmNO2SUbIh8jG7jKSOd1DOIdBIQ+wVBA1DnVYGI0o++gGsEEg5grFtju+a1svP2f91/I3Er1GN/cUhnggj+wMYfSoUP7oLX8miZ6jQ9LxupKMueTzwDnm1b1DEy7jYzodt1IWcHfZDh6t3VsozdZ/o2aNZWGHqx5w1tMTK3A/OtskvE9uKDdS7Nj2nZ1YP/HhrjnJLHVOXycEStL9bWx7BuzEiVUmUdU+jEeZlZ8+wnOzQK+0JGqgQK6Xny1158i7tSZ5EIY0yX/Na6dE+LaWsn9eeI72ZQYmbsqiBFpnc7NFIcRZ4FFXio9VRS8dhXmTDMmND07hoVKe9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2XL3TEHav+Im35DKOeNn51jJ0H5/VA9yRMGS1D1Y5Q=;
 b=CRLfwyIjcSuOl2xf0fQm4+f+OffT1ROB2uPbI5eL6CtOY4PaP5ZX4f062PvBZZBMZD4m3WgVxMeSLuBv4U9WXsqiiwQMayTBhpIm+wbdcoYkqMhrYCDOSW8weOX/E84njnrdZZVTB2w8+YyL39Tz4VPqx4eZ/SJRLGW0E789UTtjovbt47Pvc8Y1aSBHhdo9yFpILu2zg7e1mEm6rx6OPiFfzDQV4pwy3GXmfF1uL4lk10EYVeI/wIaxJRUVjRCjfxYUhXsa9HlMy0n0RFh2hn+g/X+5MdsDQGk4WMrTzmk5NnNe5Ij0Ora8ZezlH+wkUmJXX9X8SO1zLL9JGaQ4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 05:51:22 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 05:51:21 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Borislav Petkov <bp@alien8.de>,
	"Luck, Tony" <tony.luck@intel.com>, Qiushi Wu <wu000273@umn.edu>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] EDAC/sysfs: Fix UAF in
 edac_device_register_sysfs_main_kobj()
Thread-Topic: [PATCH v2] EDAC/sysfs: Fix UAF in
 edac_device_register_sysfs_main_kobj()
Thread-Index: AQHc1ywc8iKJZpGPpk69GZu2IG/1R7X1iadQ
Date: Wed, 29 Apr 2026 05:51:20 +0000
Message-ID: <CY8PR11MB713424165C5CF5894A8CE8EE89342@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260428160828.377129-1-lgs201920130244@gmail.com>
In-Reply-To: <20260428160828.377129-1-lgs201920130244@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|CH0PR11MB8216:EE_
x-ms-office365-filtering-correlation-id: 43204eb8-4742-4556-73e8-08dea5b356fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: QLFxeKNi1kdbngE4PSSnCFaTViuJPJGxT/GHQ9aXdjW6HqYK5qA+fkPmdio/u/Dn4fq/N6aHVI1S/uWik7lBm6Ey5XfnjYNVtDh7eU1YXfN3qYaTHguJ4VbjguYxGOS71sYFH6PwmRS0CPrX/3eHPhVHD8iqFGn97Y7lFEh/4c6STgHolt96TdNfJaHYWT7b+e1Cc/gm9xw6ACMcW7+bTNTb9l/tnj41WKlCvetCDHT5g84exXaRfhwd33+qmElV1gFz9xoaWm/8bDoe1eINTlWA5ASrc3TqAfNti6PGdeHWmBWEiSrcTOHD5RzR1j1u9Ipp51ULyiPJviMaH2Gj7iD9CX2x4GKrP7mqcb+4ZkmGiAf4clgSYQdLNkUh3vbLL3bQxEYvgmIyE+4deh77kov3F1yPJ+CXhoFF6VjPcGtEHhRUX65W40xzGcmXG69wJcfZ4cxbCUBnc3aI17htHkbSYD/eICMgTiTX2jLmTw4bQQBPyNXEUk2rA7w7OhcMbLEMPBfxCnbZdcE9QWSb4hW9f1hEqQsK5zRirVvKghAd9MipKlOHfguDiUrDqS5IuFOmLAmmy6OJVK7I2x30pbBNtXdakCGztFPFKegNDurwMlr+84QQYAGiQNpBYPG49J8NGg2MRdF9TmD4zXxo9fCkeayTX5J+ouDz36yNR5jIMRBYe5SuhSEHxUZSte7QZEvixF6EOEq2fskllQo3/2lcGNqrd4oCzyssKAGbHftH1faz7br6QPCMVNTWrCYp/aMKKpD/b3a2tnaZEwr5BSYYcazkSWK5NuonENTfovQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o6kFdwD5GCi7+ORkrK9yPfiY28rMmjcPFmm0yP2/3UUPJes/L8eFfx+dhr0S?=
 =?us-ascii?Q?bWOaklx238T8Q7J9DF+JoEA9Hfh1wFqkVwELdMpmZLFKE9s8H3xs4N6j/2AD?=
 =?us-ascii?Q?GS9B3zaIsHMNa+eRycD3Gn9/Z++iWay5Q6NdLfdM9zOO66JFL6kDH0xh4l+K?=
 =?us-ascii?Q?HzC8TAWmw46IPrOoZhp61UDyeHjqnqzCMGFrtF2O5+lEoPnhX37bJx8guEMn?=
 =?us-ascii?Q?Zr9qTTSe80vbhCbub6Kau/RscoxgY8nLJImxENVRvBs3OUSHDVcsN6gp3sci?=
 =?us-ascii?Q?2AHpgTiaoJawy8QGRoZiGsxEPAjAMJ59wyPaF1m76YNHpEigOB0ji42WLeQL?=
 =?us-ascii?Q?L/L0K8KnpMNkCLhUJveXb8RxTCwJ2XHVoTmpopVX4dw/ZbSjHNNbwJ485Pqi?=
 =?us-ascii?Q?JvSbm33XZtop1ilvOuQFY2cl1XJ0mBQ9x+RXtnG6e7pJjD4SAzYgmeX63hH8?=
 =?us-ascii?Q?eGwtGFClYKda/mADMSZN0ET3bi8W+iZ+mX6B0Y+80k0k14FfTIlPspCh2X7p?=
 =?us-ascii?Q?v7eg6SRtE5q3r2aAWbjRS0q9zmWP/2gijLX+A00l0TD+5XObuQEgyxfEkccr?=
 =?us-ascii?Q?jTvgBphoV0tKcrAtwi7eYmZcD02DZ9WamNVm98MQpq/GUZfC68u4f5cLjHLX?=
 =?us-ascii?Q?2X3495jH4RKuby4CJuJhS3E8wsATAOkDsjmeJO1/0SedzoEcHi2IKUfuh5sD?=
 =?us-ascii?Q?hj4Daa/i8xQCOtGfUtgf3FHLdjwhjOAmY5vU2h3azJIkt3Fhj5Ep+yyOJqTS?=
 =?us-ascii?Q?YMcJj67D0I+fFIKc5wx7OIVtJOKRtkGle4t+gsJuX0xZlRbk07buUz2anphf?=
 =?us-ascii?Q?NDb9M7JZQIIne2o5dNBco5VRfvz4AZZosXpkeWVtsBlyEKhRGF0Wr+5FvdMU?=
 =?us-ascii?Q?RknwWFJjiJHtyCh3cjQG12sg/J/UPhDMeS/SUBW1OwQEFyRDCq8XiSAFii/F?=
 =?us-ascii?Q?RZXmXecPBzcGFSVbM+E/hR0rJzl+TXq7kQYy2WC+e6VKo9DGR58Bf8LQi1Pl?=
 =?us-ascii?Q?ZzlXqk4UzIFpZP4YL8Sd+/6IpUE4mD7fj5QEOFSTWixW6qJCoWS6irVZlayw?=
 =?us-ascii?Q?MEIBoRTCleTjtXjNo66YsRfjZMCFvdOHIXUaGPYt3wipVqBkYNsdHUuHrMth?=
 =?us-ascii?Q?f6QlEbqhztMPn3dQw66J/f/I2YOE7WTmVXXVwELLoWmd+cUf7BQSARYQSxAP?=
 =?us-ascii?Q?WLooRSeb90GN5PYsjvU2dPy+xIcL9KRnb4fhOJUjCsqz0NJdZ9vDLpQq5LoE?=
 =?us-ascii?Q?EoqCoNioBwSKnQWwp9kqXv7oFRnZq9iv9H8z3rg9e5yXkpA26OAdr0xE7Oa4?=
 =?us-ascii?Q?3xHgEPJECa0VPvvUhOHWr4M8bKdQp3+HhOGX0R8stwzA/qhJ8aU5OmRQete9?=
 =?us-ascii?Q?C0BZA8UZuCctk0wjNezOmG6KiqyCHthAerFcCkVtB1wN71E31Sss+QHN7WV/?=
 =?us-ascii?Q?U1GHZXmos1q9bsTrXD2ZbmimouKQB47wIO1Y8KEeG3zGrxMsm1rE1hnn47rm?=
 =?us-ascii?Q?a02TQT1BqoEhIfIRuwUZT+/xzSCYKhhhb3eLEcjksY0tR1rTquYC+p2wND+v?=
 =?us-ascii?Q?am0NOcrtVUG1dEJ0B6l9ZmwuIdJuBg1GODhttnHSsJD1mRl6GyJIhSHhitRQ?=
 =?us-ascii?Q?cCnadoB6UozGKzZky1Vq/PTOjeucmceDM95kaxVxdcTFiadHcWW4u9h+1Hi0?=
 =?us-ascii?Q?nW1PJugD5uWmkuybTd8nWhXs2wOBHhbDMCPZYNvJdTsbSZeB8KbGditoUxlZ?=
 =?us-ascii?Q?axFQse6g+g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: i9x/KGPGJEZEr67/YseCXgi/3zGGEJyeJFGHIxE7owWWnoALAUYy1nuWTOzQJbmCyaI1P+rzYsuiPfONXhQwvj2w2peACzc6JB1ezXCqStv6/4wp4VUO1hAlO767efz1/9Ow7chnqrJ5+3GGC391wxaEW2sozffB2dXRXJGa5yIJgCGVyaGnStMwlPNkzeQh8XEsc33JiJlBzCM8gEEwbxG7eQEZjsvU+H3tzDBiZAt7B8XoEgI5cN12w5L9ryElC6KY07Q2aoMtWeeulmdTxqB0e6eo4FzemVp4WJMYJXqAQO7xg1nFwjibet2RBQtE22IyB1h60b5lP83pbNQDfA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43204eb8-4742-4556-73e8-08dea5b356fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 05:51:21.0018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T3N08K7LUvZabAroz4Hj3LMLk1nu9ucM3is3jHoZWw6bkfwNfxRbxV5wIyc5F3os6nGJe8HvgJQxUYbJVBQSxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
X-OriginatorOrg: intel.com

> From: Guangshuo Li <lgs201920130244@gmail.com>
> Sent: Wednesday, April 29, 2026 12:08 AM
> To: Borislav Petkov <bp@alien8.de>; Luck, Tony <tony.luck@intel.com>;
> Qiushi Wu <wu000273@umn.edu>; linux-edac@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Guangshuo Li <lgs201920130244@gmail.com>
> Subject: [PATCH v2] EDAC/sysfs: Fix UAF in
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

LGTM,

  Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
