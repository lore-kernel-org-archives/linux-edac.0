Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663123F23C5;
	Wed, 29 Apr 2026 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777466997; cv=fail; b=JNh8j8fNJjLlGjJRWUaoELkgLFX18i4LsnzB833CEeuss9yuYb0iUAe7uoi/g3ZakGMPbKEoJ6mrnplV5WT7CFJQtRFMcgVGWTu3FRgS8w85J9Ns3J34XE6KHDG87vgtQVF7HZBXNtqbKRD+IfZAxW4E2a1Oa0Ip3OopzLFz6xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777466997; c=relaxed/simple;
	bh=pJlmvZQoaiMI5OiT1ZtVcNnd2M32m3LsHh17OwUmjLo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ua3fIBPluJEeNPG6+JllO+ohepPZBEfzOSi+asNXbMlI/xi1bqUSqiY1IznGFeu2MVD9cc3uoS6mwdn6OHVLy9YHzGGxj6/7cNh6QSe+Bjcxzpr+70sUg3Q5O5IBMt81WfjVowHXb8ITWyVDSPXrlDyjxVZnaF89hTCxmiuR97g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzlV3nOD; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzlV3nOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777466996; x=1809002996;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=pJlmvZQoaiMI5OiT1ZtVcNnd2M32m3LsHh17OwUmjLo=;
  b=XzlV3nODv6FTnw2Hno5jcA4h8eriZE//nr/hkvVoibyU5IOGoBdkyXmm
   d8kTN8jL9yQf11MsUylATKR+qeKhl9NvzeTCVtgoIePvhbvI3GwmcC2hk
   SrZ2gu8KyLMljv/YX9RSdgac2PVnUgvwQY9hp0DXPXKDc/fqlApJ/I8zf
   tvmpHnnH0TyEv25Rjo4yY5Ev2CSgqoaaB3U7HV7ptlEqXDAN5j0lzve3V
   0THXQUue7XpT0N7B4X9s4c1SVpDXiAcZG/wYFFEBEep8oaPi2xOT7zB+O
   sSOAToQhlLe/0M6kbcUDSu1UymQBS50DV/y0/7FpyM+a2kZcBVVO2lWHd
   Q==;
X-CSE-ConnectionGUID: 51WW3cs9QOydDUWZMa2MIw==
X-CSE-MsgGUID: uRjC4iDbRQ2msZpcOlDnzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82000381"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="82000381"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 05:49:55 -0700
X-CSE-ConnectionGUID: iFud+Zj3T1ipbcOgfbApMg==
X-CSE-MsgGUID: nR0GZhtHRf2Vwhg1h+jqVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="227750673"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 05:49:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 05:49:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 05:49:54 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 05:49:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRkPOfBRL88cVvf4YyHVsHiNY14v0Kkhk5+ljrbqKzFIucpAQUGGICEhsy/vDXK7Y5+/MlXDJyVK3apw/cya5tJ7la/sQ5Ucg/quzAbSwYoS7iBu6gEa8712yj7DmvUxAoX2JPBfM9xJdu2LXSpFpHNcsiToGTw+2rkElaVIN+Srs9KlIiRnokJTrzK4hFIyI/GeFXqFMHdKPX8iLVZ96E7AVN2j3lsQ/YK+hME6+DGYocSLAvxQFOY9uDCwihrlEfzV6wPgmbAI1wpA/RX7tpu8FzH41fpNc3sx4c9paP+V36uEETSUzzbLzaar221fSt/ddD/fW49xltz93Wkz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iVwhOQY4AZFbGrt8I/oIq4LdlxQW9Th8UEKnIOxosQ=;
 b=SaW/kbx3R1o0zlUPyvu7otrTgjeF2hmloF7vAaZAg2Dax7N+hXGZ+bz9kySRl0yp9nGlBiA5zJw6tQiTgwGJHV2bBMRKRsAI0/9gulzvp3sR9K/HsYhwzRjGWIguz1DO0vUURyliaprmRHOtdONXNvrJvgwrE27nrgmNSnGke7+yrgeoZMZBj7G0tctqGNnqirXu/XF3wsDc0/ZRPVQ+qjWWva0wPg3PPd1t8ig/PgOlheuQ2MPXgIA4PtX43CZgC/2C/RQlILM0d0dRhIZgbMbRwR7WhEZfzbuIg3u9U592at0hjzz41FQkYnP+q8lTVux302Cp7YI4EI+r4qmADw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 12:49:51 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 12:49:50 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Tushar Tibude <tushar.tibude1000@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "Luck, Tony"
	<tony.luck@intel.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] EDAC: i7300: disable error reporting if init fails and
 refactor helper
Thread-Topic: [PATCH v3] EDAC: i7300: disable error reporting if init fails
 and refactor helper
Thread-Index: AQHc172wo9fTvG1DXk6UYL400qmz87X1/YNQ
Date: Wed, 29 Apr 2026 12:49:50 +0000
Message-ID: <CY8PR11MB7134BAD0DF03D5890E82F94589342@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260429094806.25097-1-tushar.tibude1000@gmail.com>
In-Reply-To: <20260429094806.25097-1-tushar.tibude1000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|CY8PR11MB7897:EE_
x-ms-office365-filtering-correlation-id: e4f5e31a-0c82-4358-3a99-08dea5edcdab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: OQSLmP7T0WfmuSOmMGkCvnosLoW2tuZ/FP8+T2KmcBnoo03IodufcE/4GMd3gbsFUC2oHdy56MgZ0YJklatsZRmTBqxE5PgIVaOYkQO9z80B24hjM2nT2iTFSw7YLBnVU18Cqr84/nWhbWcbIW5OOHdDo9Tvym0fncRIcHx2AF33KGwst7q+G6dFjyXsS0yVlijMnA4ahhtQpGzWddcGQIoxDirYWEInVCKA6wDAkwuRxfMqGKEjJSyS7TR1G5Van0uVBLEqcc1pXyg/K6btroGyhHCZkHujWQJCm6n3bSAptVV4CIi3A/pAb4ui4De5KxHUsMPsyqc9PNsJk/6itDA1JPIgTO4PWSCxEtiWcJN9IfmqJ4JbPoDVGSFp7SG5vwg9Ox0DFnJRiYy7HYcWsjWpscLjDHJXgDhPL3i1F+fOHB7vQL/xmhErUWitBJDPAA7bx5S2wv3ksQPIvcuDry2mgtAQMaC79hgpTy5tl00ZIIGuwcic1OGQkuLJEJBR4ft+w40HDI2KiSvZBVLqx202B0GtXEXVatE2p/S94qvKgcChvqbAWtLxhIeYBuEMmnnXgdJKa4eznbgR76kT63DyHiqQMGlau08Gee96FGVg3kvuP//DHTDwJ2/e6+gaNL9pveoFgsrqo0APygPE+2SyS0pjcNUWpJu5Z59ED9qBhtyFapPMrA/cq0un7Poa0RuJpSd/xyk9jpo3M+uUhBzCTJnU4GQOQ0iUB9m++vSxBR7xJSbHOwGkRmeIH/FQleluuwjf0BHvP9X7yv67rq9e/gG5GTSS4q9MC6+W97s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EdJgLUE9sZI9EZ4Kk3SJ4rmz4NyUg9Ive94p1Q+WiYninAmbBKGD69gxAACA?=
 =?us-ascii?Q?t6AXj0SL6XvQc6mHvsRh8OXhH3xVOxTGymR81j4oY2Me8rd+rwf5GkY8tvKw?=
 =?us-ascii?Q?v/tiqWCtM0GUfjSmdjvfZrau4+7tUGlMY+MoIQtchF+dJ40khDJSElGnVtHT?=
 =?us-ascii?Q?yN4yp53yGwMasjRHRNemNbNkc2SNr5aRmpve4ruQPYs+R6pGPBnDw3vLkQbD?=
 =?us-ascii?Q?i7ELqO+SjHtqohQokZWDamuOKbjck8EXiHy3oN49gUFJXu6NVZUk8AxArvou?=
 =?us-ascii?Q?xZiXSpVGmQ0Uue3hil6yE1qtxVq4IWYB7q3HggebhhCKvovITjdTizixaiIQ?=
 =?us-ascii?Q?i5o4HfRNnC9BXliDthsJB3MQXnpj6jdPTDZ+xLTaWP8FmsSil28+CVODBrn8?=
 =?us-ascii?Q?wJriN9TkiVRCSKNJLP/vLcwkyQdq30DuvlBW867BHhQ+ZCQjAdsSQOuP3Mm6?=
 =?us-ascii?Q?USeq52x02Hg/KjW5cBpqPPDBDWWC9GikhZ972xYywODpMNNQhlk7mZwxYnCt?=
 =?us-ascii?Q?62f1aMxKhCfCqt0ZOgIcoZ2wdoningkhoewKPC9GP6aX3L1ZbP46hZiti1c9?=
 =?us-ascii?Q?JNRCfyVUb6eZ9LYp2radHbbL8HzIx0EcS+7F4+4uJjYzs/dUyt5q+ZU1md8C?=
 =?us-ascii?Q?DbnFUEJZrrDNzFEk/CthNbBlW0DojoQshRgs2iYGp+jQiM51UBSApBr0Pdct?=
 =?us-ascii?Q?j8jTJ5xm7O5opZU6IRVMydCsddq+p5vfj+pyreF+2spBEV7cZAQKevwkESQQ?=
 =?us-ascii?Q?6VONbjMXpMVW2Y/9uyxwQ5oRLWW7E6ICAfYjQLkgOKFU/d6A4RTUq3zm0DUx?=
 =?us-ascii?Q?CQz6cjbxhD12pM+kv/If94z5xkpYrN7RIh45hgxPcB29iymv+7CbVfnJluyk?=
 =?us-ascii?Q?fAnppm4ZUP98+QLCM35MIOIqDFVNVc3sfCTHEI1CDW9Y/7vJ8QnUnnA2sX1M?=
 =?us-ascii?Q?50SD/9HzonF5Z7BbULv6Ty1H3uTiML7jyjkuk1l95o3ynTgl4rcU+/yEzqyQ?=
 =?us-ascii?Q?B3ArKwjzo91G3qBU7uTYPDMUILkXyxOV4KTtnbwZT9P5Eo0bRZ3DYKKVkVmg?=
 =?us-ascii?Q?3MzcejiJkq7y+OR6xgDi6vGHb5NrZve2P6koTTSWRF6X8RhrAtF7b8X4Prlk?=
 =?us-ascii?Q?9s3otxIPpOkQfkIGPJ/rPC5DuGv+8fZOVieH0gsnemEjCfeBfT5nZ8D0zvTu?=
 =?us-ascii?Q?LfHrQWF9euNEjZ64D0Wrq5PWj5b8BfGZ4JP/gr2JaaaQ0e7qKS5PYARgpAXE?=
 =?us-ascii?Q?Sn/53nK0uaJbZXioiw/8q3UnGORt/9p42xPD2hv5PEOL5Us1OBleHHDH83W2?=
 =?us-ascii?Q?sCnYaaUvr1tCku+luwmM5i+quKt/BqfYVszt8EhC3GG72kvah11CO6myNu+w?=
 =?us-ascii?Q?xQb/PcMHnPUwQLlSgfgazGqX3xwqXem1pW7uSH+fsbz8m9OudItKyaUDrZhs?=
 =?us-ascii?Q?xIzflGB0CY2KJd3e1NcrdgnNy2xsKiao0RmXWtNzP/OrXutx334PVMtDaf4y?=
 =?us-ascii?Q?L2g7BRo9JkiMTf+wlq/lJU1dnEvf18euhbBcg0kyoJP2TTaL4n1P6b0yO/TZ?=
 =?us-ascii?Q?4e1lBQJXMMuq75WBKIavNzQkW1WJfYSdoPoDI5JLP8cTp+dm+i8iwg713hcO?=
 =?us-ascii?Q?3xFoXq3no96AYrfSIxRvxRUl7VF9ffdUJAqwyEnZVHWmxYl3eFnIoiH3Mqu/?=
 =?us-ascii?Q?GDI/zefuHQYPNgGXTY6zlxBmUohzRZErkKMXOEe/z/MgYFiChRoKZ+sMy/Se?=
 =?us-ascii?Q?37+eojXhQA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DriMfjf/j2GnJhXDGLWORBTIrtVsM0vjQrDMhu1FtSv/lznG6KA7N0/jCv43W6mjD9k1Ryo0CNtviu91vWisyk1J/4sZdSC/PKwWZdnYb1kud8o5RWA3hechJeGcBFlRU8HY33Yh0lfq9xy9LELqf/tqtQu9DTI9APAw0dztZm4saMcBABtu2hNt+lVZYBRbNpUseWpyC20MCKAczKw/PxBLyDHTAcMCGUfBFTFIFVmGzS/dtA2Ihzyyn6cEk4eWDtoEvu8NJ38dUxjRmNoENI86a7epIeDSMxxhzzMpMcPuyrBDoReXGcpSdQPqOM6sBoGV8BhIrVibGsE9Rft9+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f5e31a-0c82-4358-3a99-08dea5edcdab
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 12:49:50.9102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YST6GE7ULz0Wciauzu9AYvdeMdi58KKHKZWPla45XqDmgbcEYrVAGnvgy+m5C/+KN3hs8E1Q+aYqJL0dN0yycg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
X-OriginatorOrg: intel.com

> From: Tushar Tibude <tushar.tibude1000@gmail.com>
> Sent: Wednesday, April 29, 2026 5:48 PM
> To: mchehab@kernel.org; bp@alien8.de; Luck, Tony <tony.luck@intel.com>;
> linux-edac@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Zhuo, Qiuxu <qiuxu.zhuo@intel.com>; Tushar Tibude
> <tushar.tibude1000@gmail.com>
> Subject: [PATCH v3] EDAC: i7300: disable error reporting if init fails an=
d
> refactor helper
>=20
> If error reporting is enabled during initialization but initialization fa=
ils
> immediately after, or during normal driver exit, error reporting is left =
enabled
> in the mask register even after exit.
>=20
> Replace i7300_enable_error_reporting() with i7300_set_error_reporting() t=
o
> combine enabling/disabling. Disable reporting at initialization failure a=
nd
> driver exit, before call to i7300_put_devices() for cleanup.
> Add enabled reporting flag to i7300_pvt.
>=20
> This ensures clean hardware handling by disabling any unused error report=
ing
> bits before exiting.
>=20
> Signed-off-by: Tushar Tibude <tushar.tibude1000@gmail.com>
> ---
> v2:
>  - Replace disable function with i7300_set_error_reporting
>  - Disable reporting at normal driver exit
>  - Move enabled_error_reporting flag initialization
> v3:
>  - Move enabled_error_reporting flag to i7300_pvt struct
>  - Conditionally disable error reporting at normal driver exit
> drivers/edac/i7300_edac.c | 33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)

LGTM. Thanks.

  Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
