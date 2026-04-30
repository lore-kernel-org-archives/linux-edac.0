Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF80540242D;
	Thu, 30 Apr 2026 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558746; cv=fail; b=m+LYnn5NeagaSMZSrY/eup2RFrg/99O4EtzXbenA6+ZwKR+NGT6mut1tX8I4P+Cn5VSFAC5nGx/KDV5eg/wwLlc8yZS/jUB0+f07ex0IlONq39DBEmZKN6foOTUfD0gnID9I1ZBNdjghgv5rkKvM1+L5RkGTalbLxaqnV/5hIfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558746; c=relaxed/simple;
	bh=JCAqvjkIZ3uo+uauB54m0by2gucx6/AzdAVdJNrkKX8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aT+02XYwBSHS31nczzzopsMf/opaeCK9/Cr4oU/6PYiWOEUvvSRQTWVlpVvm2dVBhzzfZXLtmfWUQW2ei1FLnAJMIVER6cHut70dybffShOZi1YdorgtkdZk1V70knINBhfWF8uFDycHqntaPRs2qeNHiXS9uSxQzrducy1Z8SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQrfZJ0d; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQrfZJ0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777558745; x=1809094745;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JCAqvjkIZ3uo+uauB54m0by2gucx6/AzdAVdJNrkKX8=;
  b=HQrfZJ0d3q0E4MeJtoFbT9pgZPFK88Yh1kqPk5X4yRM4yvf1CumMyLtC
   Rg/OgnyF6ROMbEO90fCZchAyFcx7n/yuLvVjA3MCCQuDxeRbrjDzAFFFp
   OKmgBa6hzCrSQTqzXSenAPjyWlik36XDzaLL60YSpPyHL5RuPghFazFLi
   tJAeeu3iQNyAwXFCi7z03m0KzfoH+OPow4ck56JsDbt48nWDt4dTp8M0X
   wX/kXJTquUCSyi9yCixP5q7wpP4a0LIEcndFRPs3+d4/QeLDthaZTFk6G
   9ho3dnj+cR6gov70E/zdJ1VHslKzSS8c+P4o7fAds4zXozXcmDOtXwXYT
   g==;
X-CSE-ConnectionGUID: OpWNNThwR1yVgAh5uXHNgw==
X-CSE-MsgGUID: HRcrfe0hS8Ki/vWbGy8mfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89199991"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89199991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 07:19:04 -0700
X-CSE-ConnectionGUID: n1w6F3DZRzS1Ay4llbdrBQ==
X-CSE-MsgGUID: Q743cb8lQYuK9ibraoA2Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="233565297"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 07:19:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 07:19:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 07:19:03 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 07:19:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akr4aMijH5sLKPROQ+yBqD4zpN2tggLBXzu1OagEsRSKu+KNZzJ48jOL865GbmqjEcQo5LZ340JKh/7YrmW6NJ0+43F11Ps+quKRMja9iQ2oP7CM3RFKdEyTPed+2EmP/R7Da/CqyJIgejEHtkcHRqIy4GabakkXYVYdDXjqQLA+x9XV3gke8Ie0vfZy2Zgl7ktdiwCa1M8o/GbjOaTPZQSCAMrLDDA+a7MBvk/i0Z80X9H3oMQZM+2yBUt0PZZ3+bvjTrL4w1DVWCJ7mBixkFP9ngSjitFEuFwSW5cBApMDPKF4HZV1hkf1n0igHV6W6JKqqWWD0mLobENtFffjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCAqvjkIZ3uo+uauB54m0by2gucx6/AzdAVdJNrkKX8=;
 b=Fc/85PuBR1Peg4dd368LOyAIxMQJ0pxpqcbiMdTgrmPAKPw6bflKTNPy1lg6OjpXyKCJqviqbj7g5IToBZV3wcJP3pvlHrQi8QXrtrZNSkP5KmYiUVdwUtQYP5vEEO5eaXOl3vnknxz5mcx8Ondl7cDFEHH+mdsPPm4Y6yRz1JKhq5fAraulpxBoqM1fzC8XMuXr4IWyz7iMD/2LSvI2nooHEAqvpmub/UH+0PZYm6m8OZ5Azc/XwiTz9jTdo+gpwfqORkoUykGrPCPUJs7v/Brfxe0JojNKMkBra78MkI48sf8JnMR7B36zDOD4lJ8MBNr9W8TmUOSNRoU5CBpdKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by SJ5PPF8225D2149.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 14:19:00 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 14:18:59 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Tushar Tibude <tushar.tibude1000@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "Luck, Tony"
	<tony.luck@intel.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] EDAC: fix error reporting handling during init for
Thread-Topic: [PATCH 0/3] EDAC: fix error reporting handling during init for
Thread-Index: AQHc2H2yfmAheCaF9EKzY67sYFu3g7X3oFCA
Date: Thu, 30 Apr 2026 14:18:59 +0000
Message-ID: <CY8PR11MB71348FFB986C5620FACA9D0A89352@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260430084223.9298-1-tushar.tibude1000@gmail.com>
In-Reply-To: <20260430084223.9298-1-tushar.tibude1000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: bp@alien8.de,tony.luck@intel.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|SJ5PPF8225D2149:EE_
x-ms-office365-filtering-correlation-id: 2258ed6c-a4c2-4ab1-e5f0-08dea6c36c31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 7uYmPVJsf+JOaXjSu2Zdur4hxWhKJoc92tMybQG537xsStj3K8XlH2u2hrBxJgDewBzs+AaLdP5/u8SM39A0TwEgZdWuXxKJ+pNo2YVsnpSgfrS+6ci0FTEPdqK2IhgoxXkwjhvCs0kUOcJqIclXRTH8UyR8H08NU9hJnJjYkYYeKe5no0KfFG9Vj4bE6+94EnxjcQRcflKGjf+OtQozUtnbuL30nJEs+bJ26TcUK6Hu/UHBARjqq8PQja1H9iraGteHHvMBiKN3qdS5Br5pK+jyv20okc4oWh97aaEWno0e7S1706aSbzMLANZUPKHb+RcRl5ddl+KZJ7YrF/rVL5XiCjHT53NGDk1ygRTfuyVT+sbdPjqgcXJhgkVY6ArhmtWVn5dAo6pnXXu1Hw6h8hfy5B/NFMXqUEgrs6abeUam4hvUItCwqJlTSIHLXbpEZ4aEosPuo7h2XbyXimMmQ1iEl2bvazksW5H2B8waePq9CP5AsndG05Elk1mc3JsovlRjwxGuwvSSy3LKfMq+5u0yhyorVcKSvUMVikNFt35jXaUgnM3lqLc8mLgC5qkn2wSFMC0wP2VOerLY0HJQmj7s8NpY98Mmezo2gD54ktJjWzal4OPPEvf+ntHijdar0Q3cB56hw6oyGvBppPl2JyXDoUi8jQBcOG471HQIyYOip1cu+fvKlf+d++Nc6L9OWMREmis8o+WO5JNR4X3DlSQkhk00BZaxBznpeIyHv2uHCRZI2unzlwiFCTp9A9Hz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ScSdv//gt+ueh5qurcuRFrwyayR/ImBJr6BnXTr3kzfq1leIahUEciHPEFRP?=
 =?us-ascii?Q?bWT5669l79F57pFpUoOtMwXnYBgfEyC81IF/mFACjZv73WIIM22BPf0r13ru?=
 =?us-ascii?Q?McXdmDQwfqXJfGvMy0XAcp68sOjARjuryj6ny4DmZoIwGBXWFPvtPoGvEQjm?=
 =?us-ascii?Q?R4BzgrXpQycO/IP5yqa7fezbPQGHL7l9b+L9VmSivYGopWKz/WIV3sb94sfT?=
 =?us-ascii?Q?XbdnwE94dp5RTjF/c6GVzuDO56Tz26AkNMXw/P2Ut4oXHFYJtrpLytbGyeFe?=
 =?us-ascii?Q?kjHQ89eUWs6kJxutklHNe3q/OEf2rNHCy7GySFFfD7ePsudtNwoj9Q5Czzde?=
 =?us-ascii?Q?1MN9Vq/ipz9Gb6in/sFt8bYsHHvfPh795LTy7WfaII49N0lq/xjQ2+Cg0ni+?=
 =?us-ascii?Q?aWxxhqc8hQQE65mGG0SldgwgctS/HfUHX1dHLBBptmDpDoHsbf5KKGjdbrQA?=
 =?us-ascii?Q?KQeWJjVTJGNwAyXq6u+4tESRp+BvatoSjEdwpBY5H9plSKHN+JjXtrvlb9P5?=
 =?us-ascii?Q?7Vs2VBcffBxDTmYQE9L6qpPXOB2gi4W+etcUlgKE02MAVusrIWPAdncYrn2o?=
 =?us-ascii?Q?TK1a5N8O8IdjmbxITIhRpx5QkPfnoiE3ePdR5RjALEIYpNse1MCWsC2YMusG?=
 =?us-ascii?Q?IR3xLRZ2OWdSLI22yVAyEVRGO7kOOyJT60y1p+OLpX60kHA2/OUuvTqmgiRU?=
 =?us-ascii?Q?5m9lxk0gn0LDo2TMztQrfBbYHOgIfujdsbT1VZvgbmTLxruvu1oz5aExD91I?=
 =?us-ascii?Q?xNqTVstEvai6uH6yV73hHwWA+Y+eVizqZ01XumAjWSqWowqZ0DEuQF/baJ3O?=
 =?us-ascii?Q?OFkhGG/laK9MsEzoHjvC6Y5zySTEuuRwniHqMaIRypFi32yTkjQ2ED8eoFPd?=
 =?us-ascii?Q?2XlVwrg1f1sh7nsUYp0CeJyHrIK08s8MGJzj94l7OuksARayYYbLVBppRAjL?=
 =?us-ascii?Q?k6Un73pb/Gp9RX3bGt3icctk6Bwbj51xP54l0TzZIjCFGy7X+kfqMA48ruT5?=
 =?us-ascii?Q?/prneFL6SVv9/yXnlJdglDs9b5PMXrMrbStR/mBqrJva0mwzIbQC4YUrFfBg?=
 =?us-ascii?Q?VWnodMl7GD7xqQVlua7O00H9DKjivaC3Ti3VeCMs/VHtVkG7Lsux4dAF4wsg?=
 =?us-ascii?Q?xQTNMdpaSBWx3DqJo7ZXTq2k8pxb8hHCRdchRFedC0a4JM1qmPNwk2kW6R4T?=
 =?us-ascii?Q?jQW0f/ejsS3TOHAGna6M/JOa0CaSF+p2N3P0xGR5HhTtAirF6e4YGnn4xT7Y?=
 =?us-ascii?Q?Lo0fKgSvpLE0cumzlMcZWXVzqsdhsUAmjDqG2xuJgxGbAk9zELhcFumYj3Vi?=
 =?us-ascii?Q?KNL8VivzzK+IBlIwWZM+ZMfoxHXUdVorqHQ9OAl6q+wMI1hpaCU6+Wh6ITwU?=
 =?us-ascii?Q?uF/pa5EXsZfai4Ochtdatqojid54o5Q8OoV5THAmAWRcQbOXqhGGJ2B2Sliv?=
 =?us-ascii?Q?RGX5Bk1QqqxkPd9mMJDqQzDi3x2fFerddEsJQvRXDdANVC4jdGQ4qxS3X6tl?=
 =?us-ascii?Q?NQG/BvWqGyyVvcQqHcSihTbwB8okGGpSlQLOPWYwBZIAk2YxDlW/25/UKklg?=
 =?us-ascii?Q?SX3R6UX54Fftjn9Y1anKin1O3QmyectrKKX/8ffqkw+VYLr9yCKVBTdCEtvA?=
 =?us-ascii?Q?cvx+W7LTJcNxbpUSxfCuceFh66ys7jbqqlB13EhanwILwx5D+AN1tEMVy6gE?=
 =?us-ascii?Q?GX8Nm3QG4gY2zg1JBOABX3ZauCmUaXmGCKqMuFjdR+eCesgHyG2WVjznQhGF?=
 =?us-ascii?Q?DoQic1u1zg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fOS0lodbvPCH6hpZqTAxTBVSVOd69BSAXrqYxNMSCgnscTb2R4+1YXw2yrgkUwXoUpm1dZxRloUnG4sFLTCHwNLnq4ocS8NsL1k7xQXFamBuxc0L4yctHcBiyplNtCx1rmQgkquOjAmVtCbZC3tPhBTypjzBDgHX7BRz4139btp1II9z6wIdRMRWwZWTAql4nOITUCyqMTHZEBTam/jyOsrRu0IC1T3ahJVRf+cPs7/MilDcaiVUtGc/986N1mqK3t84/CPSgrjqzLwbTxDKCSUR5tadgYYF9VoTFyawJsxazjOZojlXE/kIZ6T/5Rf4i7XQupK5hsWNzp81nZ4zaw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2258ed6c-a4c2-4ab1-e5f0-08dea6c36c31
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 14:18:59.6602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zh46CMOqajdeHw29f64cLhRKbOKzDYPzue+K8NO7y789N2N2yhmMdukywChW3RKGoxN0tNZnY5DvNMWCjaA//g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8225D2149
X-OriginatorOrg: intel.com

Hi Tushar,

> From: Tushar Tibude <tushar.tibude1000@gmail.com>
> Sent: Thursday, April 30, 2026 4:42 PM
> To: mchehab@kernel.org; bp@alien8.de; Luck, Tony <tony.luck@intel.com>;
> linux-edac@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Zhuo, Qiuxu <qiuxu.zhuo@intel.com>; Tushar Tibude
> <tushar.tibude1000@gmail.com>
> Subject: [PATCH 0/3] EDAC: fix error reporting handling during init for
>=20
> For some drivers, during initialization error reporting is enabled, but n=
ot
> properly handled during teardown or init fail, and this leaves it enabled=
 in the
> register on exit.
>=20
> This inconsistency was first identified for i7300_edac.c and a patch addr=
essing
> it was reviewed:
>=20
> Link: https://lore.kernel.org/linux-edac/20260429094806.25097-1-
> tushar.tibude1000@gmail.com/
>=20
> It was then discovered across multiple i5xxx drivers:
>=20
> i5000_edac.c
> i5100_edac.c
> i5400_edac.c
>=20
> This patch series aims to implement a fix for each of them.

Thanks for the patch.

Since this addresses the same issue with the same simple fix in the same su=
bsystem,=20
IMHO it's better to combine this series and the missing fix for driver [1] =
with your=20
previous fix [2] into a single patch, rather than having 5 separate patches=
.

But please wait for comments from @Luck, Tony and @Borislav Petkov (AMD) on=
 whether=20
to use a single patch or multiple patches.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/edac/i7300_edac.c#n1092
[2] https://lore.kernel.org/all/20260429094806.25097-1-tushar.tibude1000@gm=
ail.com/

Thanks!
-Qiuxu
