Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83561FF5E3
	for <linux-edac@vger.kernel.org>; Mon, 13 Jul 2026 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783909833; cv=fail; b=ISGzNpD/ivNJ5QvEAtlmK1XycVIV0onEa7RiRQMsraeMxN+7S0VsBoXRX+m+IyVPeqLmUd52Cyl+HaYgqBLDcNvPP8V9AqWb1483SSnkK5MYkVi2pFFjVYkq8SP0+W7e5jT97zEDbR+tBd2f117r3ewTZ7QHoti40wdn5wVp+3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783909833; c=relaxed/simple;
	bh=QrWkFcR/KmMBGAz45vFWlCneJkjf5y5g54NVpzM5YVI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EvZ2GGmIkzSiWmsHpkILA8931fdvJ/rgySTQ/0e7WyFyTusCyuKgP0rHnOulWwsgtRdJgjJHkhc7mplaX2vmtIqIc6CxiN0LoE4SuGt/IK/iRu7AWqVOzU+vdBHt1+CmKvzxVhy4IcQ7Yqmi+4+9d0N0kL2jfuS7KVwNwfaPSI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFbyqcUx; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFbyqcUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783909831; x=1815445831;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=QrWkFcR/KmMBGAz45vFWlCneJkjf5y5g54NVpzM5YVI=;
  b=PFbyqcUxIiRlCJaejp4lsvaFI8pcX8kmaIJihtTwqf8dEa1VXcYduI6A
   inafeiGZZqMvc3iMYwaP1exf6vUSlqK6ZqMO8FWKU+W/pxBber5Pw+VZA
   XQZtz+usoLWcTYJkH7EEUwfiDHikOsFRR2Pbdb7mvKU+dTtgjyiZOt7Pq
   bfGz0/6naP66wgi3rBrgCyWWxdscGyQDQw/TuM/gsNDI67cIUQlKnFF7i
   iNJT5xpiWMxhHzPCMaci2Uo7KniXxH5Uh9PfnTELiChwhm7v2tApQRjsW
   yylqbTSzqm/DR3BYWsiqM1HDyIcFNFcfLjSZE7qMuePpqXHQ71fjjboFV
   w==;
X-CSE-ConnectionGUID: OmoXQ0ynSkCOTjbddqsLDg==
X-CSE-MsgGUID: LawScdXNT+CFcdVXaOYNLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88197569"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88197569"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 19:30:30 -0700
X-CSE-ConnectionGUID: E2jZF6G8Soe2NaLV9143gQ==
X-CSE-MsgGUID: GewLMKJpTAu+pR9zZqlv1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253680421"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 19:30:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 19:30:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 12 Jul 2026 19:30:29 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 19:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUNuM4R3Gib9f74sAMN4WyEkfRTCrAoBCaMXRngN+j6A0XmNGSQGui71Z4+AhNo474RnZgRMP1cXoND57We7f7bFQlEVxOzwT4Xq5vGy/dQBOiaFZ5cfr7vqmv1/kMmiRxP4Rs8my/IJ10fd09G6EeR1HxtLLbAXijseixMsZaZaFswW7GBqLU5B5xtGEeNHRgG96ogz2mlDnnrfmUdLQV8zrTwXKLqWJ2a1tIDjXyE1hae4Uv9JXwISJQmraGbyySGhFYDE9vFmQhPgY7ocu+S+DEtTCPdEgJF4qxRnQdyGCbvBL49N1ym2QU4WykVQJoQ9ZqnRqiEEcpccuUyJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrWkFcR/KmMBGAz45vFWlCneJkjf5y5g54NVpzM5YVI=;
 b=Hyy5qKmom2Tb/CZb4NZ9L1hwnIuWExHwfXBak8hM8l318WjhsH4/2MUFet1cpUuQMb41nPCl9rqJLOtVKF6xeMro46Qv6TBw5Eq0NRtpinxGoL5U8N6qMalVVYfjuKfHyzhmAbE9PQ9ixjKpkNyJeONMHdzGaXPhXOe6ZwD0lnumnZXRWYylmbFAV1JD1PJUsahh9gSqf9vkDcr8tRH9qEwCYja/IdkeHz1wC1vaBHXXWvhANisr1++e6CHwYB1+uKD2/1R+QzJ+I9QQJAJK13zvUwiJgVyhltc/kcZLZOvfBDxiM6Hm3WCLa25yge8VaTCIFOyUEzhoCVCU8em+OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by PH0PR11MB9611.namprd11.prod.outlook.com (2603:10b6:510:3b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Mon, 13 Jul
 2026 02:30:27 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.21.0181.017; Mon, 13 Jul 2026
 02:30:27 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Emba Consulting <hello@emba.au>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>
Subject: RE: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
Thread-Topic: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
Thread-Index: AQHdEDl8giR33UKdQUiabq1WYsVwErZqvfxw
Date: Mon, 13 Jul 2026 02:30:27 +0000
Message-ID: <CY8PR11MB71345DC82A8AFE8146DFCE2D89FA2@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <SY9PR01MB108527BA385DE411FE1B69FB0A9FD2@SY9PR01MB10852.ausprd01.prod.outlook.com>
In-Reply-To: <SY9PR01MB108527BA385DE411FE1B69FB0A9FD2@SY9PR01MB10852.ausprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|PH0PR11MB9611:EE_
x-ms-office365-filtering-correlation-id: 656f20cc-651b-437f-fa9b-08dee086b38c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: 8/Fkh3attgqFinKRfKvXrufrlQjqikENA/iVY/XwpPOizl2NT67LZ4MneNqWsbkSJSEbbwrLOEAimuhSNUH2sLNX/0Jd3pDwhlR5WpAHVmjRPrqzWZssmmQxli09ICSBrKsBvIa9zmOwT1Pwh+01S3ULhOy+2qT1TzJc84w5JANbntJ8JttwQ118uv02E0R0O5+TBAMvT1tpT96yjOY6TcosgalM79znXCahpzNM4Lqz3Eti/4eY/dSuR2UWWYY8/Bn59Nc4qc1vQ/3RWGH3fvm+G2pRc0V/2YkiJ2fX6NP6E30qd5m3aZjE0ZzOSvOZLGmUAT+YzYLYA71unxOik0T3a9PRjCliTnkXAyjIJuEbrsbgljypksdrjjLJJhGYYepgGDnc54z83tRAlXV27x4+LONlXjN+CNDUziqdzxCgYkjdB0NKjw8hziBOmJ2ARb99qqgrlVtRyvQx8BmgzI71/vh1Rc4BjYDBvn/WYkLfDNirrRNlmdTLDAceV8woYAHR014oSSz/Ofcz9zk783E0FHUL09A9vHbrhi0JheT+uwIsaIQZCoBpDQ0S1PZCzwFPFQZCnDfMzXpWKxlmaLn+8TknlHlDmcfo6mvtg1bupZt4gss3jrnXxykc6ReV/zj8pZY7vcEs5PbW2L+ApcNSQhc0qf28xH1bMO5UadtKJmndV4n6ZKNDVUdC9YjEVtDh62Kkm53hOw5bYZLTgEuAdlevbxPhSU5aL2fRWEM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?91+F20FjJED4EPWCCrmtpTNhQ1xeNRLArUsjAr5ivwssEEd6mS4scqf9BX3C?=
 =?us-ascii?Q?qYf7sfEavprIh6v5AufrGEU9fW6GBL+C5tNf0WteWBOZ+vW+lFHNzDlAbxx2?=
 =?us-ascii?Q?k1vRkYIApM5S7rwSsMtEhbVRcGChoc0UeK3/XA0XRbek3vnZkcjINBNdp/Qd?=
 =?us-ascii?Q?mbsVLs4RYIWtI3TPUJctuFffb/15NdpcihDZZXyN8clCaBQAujRTqJK2nlin?=
 =?us-ascii?Q?COp7vU/odfDloy7qsCmp4kJLEFs3FXgis1GAS4CmS5TixPAk450t0+hmTV++?=
 =?us-ascii?Q?YS8ZffRCh8y2PmyqKliJYzaDwyjIHGnXyFyNsZdGApR7YGHd4ONW/fA/ZnwH?=
 =?us-ascii?Q?ojulqvymnG8bIew88cgUzRAIbLwbeS/jXz+i7WPbR7JuGou5qIkJ3lZcMe0I?=
 =?us-ascii?Q?pzCgVNujMIz1ojADD7ReZ9zlzp/qHXk/atfAcj+UQa4eLafUq+tr15WJX0VO?=
 =?us-ascii?Q?7ivic4XEgObwzLSkqrlx7sv4XJXK5QrIGkD3PmprDb94zker1QIA5HShuuQk?=
 =?us-ascii?Q?Ryj1ZgdJf8MpovGai3NdQp+ZDApabpMNjA6DN1/kyvX//ynSaKzWO96H9tZc?=
 =?us-ascii?Q?/oBU7wdh7PiJ52FZN/fKDtp02g1q8xm6WP+M14GqgceRaB7EvMSYUzNdwhhK?=
 =?us-ascii?Q?96r6cYd14j+pULLo9/VtUe8LjF9c2E7ixb2raSuFPQLKoAPI22l/RMV5/RTC?=
 =?us-ascii?Q?i9x3bm7HwxBQEfwu55oqi9WlJhCYiTPF62pEXRovjsA5qEINNrEDzAFZqp+/?=
 =?us-ascii?Q?/z8JWP8bx/ho7/yRU64SBD3eu+z5NHB3y8hb0HGivBHEZju1NZX3I3viyuq6?=
 =?us-ascii?Q?F91w3yJGyreXrABAodHyS9JaluQCzf3cYi1p+xVFGXo6xjMKPMogPHrf70V+?=
 =?us-ascii?Q?4uT6avdDKjPXmbF4ZM2+lUCPhfCUmwC7iAjx41vBr13FeS2R+JBgcrR70xq0?=
 =?us-ascii?Q?ILhjkWmt7OSkAOKwKaLqOCVD9p5EtvjHKsEgO9MM7/+AsDENsb8GbAlD/FXu?=
 =?us-ascii?Q?f1qLNgYuKf0VzDn5j+IMaNrvNw0cU5AByU3aSR+dctC9gfEdY0bh85PI9qDo?=
 =?us-ascii?Q?wB8J3QJJpL5RhuG3nRPRJfOONpqlHFneMGppnI8lG8iWrN+aE8ShokFusMGH?=
 =?us-ascii?Q?OQQ3rwJrefKOI5ctLZVT88mqtT+FZC2CQ8F7NXpA4vk8vI33+NqoSuJV+ljZ?=
 =?us-ascii?Q?4m1cWS0U0wGVlY8JRdPd1MT0hlCEJOd0xH3nMTwOMZ4Y6dikOweRT/A51bNe?=
 =?us-ascii?Q?Qq7X/uW3xaEgEZggAx4INpO48mFvORgqVLmNAhI1a6C0pHq+uAWXf65DYknb?=
 =?us-ascii?Q?yS+jrSLbTi+Gz8bTB11HZ+n7GJ2psvIjI3CXJhBcZ85IdCgmyvJU0McPn2Ob?=
 =?us-ascii?Q?ZMOBbHEAiXT4e/3fUuup5ufE31snzHJ8KQ7BrTft1BdhYKHRTrxGXaTh5qcW?=
 =?us-ascii?Q?+3ZXcOmtUsBgeJAbrhVEWUlGeVKfennVm4AlWu6+wQDlRHn0BsQCAFXLUtZ8?=
 =?us-ascii?Q?JjwcwlciGxqbOohmXbg24bHItJIcSu9D4wVqM4Uc14YQ3r+ZeL0x5pmMpq0X?=
 =?us-ascii?Q?ki6nAleUsohR56ctYNNQX0Ng1zzDgKtBHWwGY9qm15uS50veO63i2FVVfE6B?=
 =?us-ascii?Q?ger04Qv9If2kQs19P/wwKjgC+j844xc8MjVsMOUlQMc9j9HXFun1yFyqvMJR?=
 =?us-ascii?Q?eOkIQ63N5tiHHS4DActECHhUTpt60vO5BtX7XeEhUtdUg4I1ttw/gU3ZKlL0?=
 =?us-ascii?Q?HFX6fgUNKA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jcfKZnepETvoV47SGU527Rm1Y9JUzTS04BPrjlZZXnRIkJ22YOSmlhUbvjraN/qpV96ynVbQf+94kzvH0Cl9ymHRWHUE1me9pjXd5UzDGWgHv1m80GY/u4DI1E3yjJ4LDIhhdyvS/pbnwrYxL3lRcTZoUakzs9BpKX98BFuyGR0HTL/Dj89X3MiSmX689L4Jht/kEjghYhsVSi2i5qkBw9l2z/wpBwNh4t8xQ5YgIebu+M+Z1Z6TyOFGHLmIwIPIXzEkJ4WP08Pws0yPRZz3og1rBvWZGiSNT5T2KvUBVJHOph5FSoOQiH2+1hcGmAHqCOfmoupX5XJ/74xrrrZ4Cw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 656f20cc-651b-437f-fa9b-08dee086b38c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 02:30:27.5350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cUtrSezrR5c6a+9ApO99dLftk/cbKjC1hopMht5c+CdUicBInuoB9Jqmxh9k2lGH27PtGKN8WLzQBgrPEqpzpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9611
X-OriginatorOrg: intel.com

> From: Emba Consulting <hello@emba.au>
> Sent: Friday, July 10, 2026 2:58 PM
> To: linux-edac@vger.kernel.org; Zhuo, Qiuxu <qiuxu.zhuo@intel.com>; Luck,
> Tony <tony.luck@intel.com>
> Subject: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
> driver, test hardware available
>=20
> Hi,
>=20
> I have Arrow Lake-HX hardware running sideband (80-bit) DDR5 ECC
> SODIMMs and wanted EDAC error reporting for it. As of current mainline no
> driver matches this die: igen6_edac covers the in-band-ECC Arrow Lake-U/H
> compute dies (0x7d06/0x7d20/0x7d30), and ie31200_edac (which gained
> Raptor Lake-S, Raptor Lake-HX and Bartlett Lake-S support recently) has n=
o
> 7dxx IDs.
>=20

What does your BIOS tell you about the ECC type: In-Band ECC or Out-of-Band=
 ECC?

-Qiuxu


