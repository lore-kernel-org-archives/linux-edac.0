Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CF01A6806;
	Thu,  9 Apr 2026 02:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775701982; cv=fail; b=qZ7iSs145yyRmEqqDZ1BXUTXZLjDlH4MLzgHj5QIMf4C7orgZnx+WUU73sxUd/z2NwQL/43v2zZcVfSS4bbMZ1PkjM99/SyVmRlGBMgsD3vmoXkAgWlikM7KfMFLEpoTPZ0dgT0KSYx4xbDKQCO27yr2f4DUkgx3PzBzs16zdE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775701982; c=relaxed/simple;
	bh=U3mnNm6aU3oa/kKrHs+VgxG1nOaKbzC03afmYDekH0A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Fnrz+0H52TR1XLijHKJ1VBXdMevWhDKdM1Ev0vv7RPx9rUcahGT1tEiKfmLWn13AhxF/47hnxsE0fmZH+rH83eYShDKbAApvpxgat7dK7tnsNjZFRoobwR2kqnXTaxPadvmolrzKTzUwXzU/Loma2/wtopIODp6bWVP9PgYlBhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBpFKYON; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBpFKYON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775701981; x=1807237981;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U3mnNm6aU3oa/kKrHs+VgxG1nOaKbzC03afmYDekH0A=;
  b=gBpFKYONl89k7e//wVE4a9dLOhl7nFxD3VIRxpFKVebnL/zxUUbzyWG3
   hdEag10eqhjAP250ZOqsYMoTWtHIliX8puqsXA5m+Vum9XD0Q0B4VCaY6
   a6MwOrae1lNg4E4t88+hrIBFqtv97qNb+hITAXb/XxIRHz9Wv9FRyhZWh
   LoHQ++PF+bU0qYWY/wyr1J3y95rqSeU6ao4IgVHlY/0R0jZHl8aAnAVt7
   lVASsck/5EAgJZ3Fg6vYM3Xj4Oi7ml1iRBGfov/nvAIFp/Y1ZoRPOLKfD
   hcZ5DNyee+dckLdgsOeEMP28fxTomOebQEmZ37YoBFeW66i+1m5aLOp5j
   Q==;
X-CSE-ConnectionGUID: 0hKZjvsLSMKRwgR6ysGCsQ==
X-CSE-MsgGUID: fac+t9CNRxe7ssLiqhiafA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87775369"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="87775369"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 19:33:00 -0700
X-CSE-ConnectionGUID: vu4mnKQgQ9S8gdnH9dUX5Q==
X-CSE-MsgGUID: ISsvFU6UTlWLix7fSZ20Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="224334469"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 19:33:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 19:32:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 19:32:59 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 19:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glww/lOnnqXnWh6VBSoAt0X8HxAvQni/4PNyqLBVXspwhPh+OAVovPSBQ82lZVbu+ffVPtx82Znr84IqVlbgEiQpv9gFOMCG5qrif1p8Y5n760zKpMjaotBtreT/Ic3uwgc5cKYsd19iEoz3w3gkBEJNvMZLnq8N8DdHLCufvYnqSGA9u4qY8hgItjW6ch9zJGI9fCLsrwSEuSmr9woZLGL11RxUpJWziktvRGtI73eTOve/mqGhQPyNLyjyJcK5oLcq580NqmPn11XBszjpm7JXyKnHrOvWUGn9zB9wjY9oUF931pQhNrJ/HDLtMq8+gdoQFKI/hvN+HDi2CQHwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3mnNm6aU3oa/kKrHs+VgxG1nOaKbzC03afmYDekH0A=;
 b=TnsxBrWjHuyE0TE7Kapj+hTwcSQRLVnbWCqx9tQ7wVJ4WvJiyqFO1rT0tQGGwdrJhJtEGmr1AgZhwxFEqjop0jKV4g6766GosKg5+j2pL4lY7xDg6Udlt9a/WP9M4i3N+CRNRsi3vtAB7naBKnFVAumGD7NR5nxPRNx2ocqn9KQfFcJP4cn1l60+Ah//I1YgafKtT7aUP2lmXXtkCfY3fGGVKhxrhQYd5iDF69l11BUXPIqAjQZM3+efL+o1hjtfgH9/ggFly25yodFUgFDhrk29/bAEP0mIq6bgQ1w+5bkiZ2wGQ6kZvdx5KQGMEiGu2SW3d8niLRLNljsZComy9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.19; Thu, 9 Apr 2026 02:32:51 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 02:32:51 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>, "Luck, Tony"
	<tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] EDAC/sb_edac: fix grammar in sb_decode_ddr3 warning
Thread-Topic: [PATCH] EDAC/sb_edac: fix grammar in sb_decode_ddr3 warning
Thread-Index: AQHcx1aT0+W+6vjuq0e79KGqy/hbkbXWA1Dw
Date: Thu, 9 Apr 2026 02:32:51 +0000
Message-ID: <CY8PR11MB713481550769D31CF870377989582@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260408125141.1145434-3-thorsten.blum@linux.dev>
In-Reply-To: <20260408125141.1145434-3-thorsten.blum@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|DS0PR11MB7902:EE_
x-ms-office365-filtering-correlation-id: 66cfe9b8-9ab2-45d9-3632-08de95e04be5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: nDm8oDnKKJDJJ/Ktq059Eok2MDRmyoMxRUfzFATiUsoi9fuC4Xb39R9Ty64ZSlZW+fRaYso4b0IV+6wRlAPpCe+OptBf3xp/u4/E/mehhyR0Epr2j3WHtSTWFSUIwjU6C8PWVTm2rVkl0aUxsbZgCjtxANShzFRY2xwJqvUQ6lg6vCssDtiJcaSA54NrdSocvXrNFnLnxPG/us1EpnQzaOUwEnAsOmIRQ0yCdmWovQ4e1lIgj8kRKkZaZDZ5CfFkC7fiWgDChG7oIdvjajkEwFxAPIH9nOzxe6jHf9n7mBNyEroE1Qgx0/nWJ3oKd405e51eTuDVCAnCbNORfaP819/6l8jOSCbm1wtC7xW3uHJ33cLDPYQwSndDoAFQcjWWFrLl7plA3QxzmF3CbXLuAeeKIXOIL/q9BgwiY1Qg+WwRiivGwAma40/5wFJHUCRnO7jh9pXilBNmR1pfGmLBPFZZKc/SMC053xA5C4le9cOJG8E2ZXOlDhEgNLc3B/egMb6jPDu8rMXjkG0jOZxPP4SpPe65w8sBkSakHynFrtOEqQRcMEhac9vOYK3StCNjdyAqymCfYJ2t20NHXwzUganULCJ/wxLjqKuJ29/ZBMaxjfJNRGvtQnmL0kgTrQNVX6506mGFPtQO2u/rI10A9Dsi1EezJwiNPKYW1LCqRbUJKmOrOzRyybHYIaPwSZ4m3R3c7JEcReshcR92ApFEl+TaUyTSFJLCDjZLn3+fsllLCo4S8nrCbAG6xixNUmuBGDFYuTySmWABGLZ8fFzypmHRvAz4h+TduK5I2J0nUPw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xq082xdOeHjh9M8xA7BYPiMNK3TScm8LH3ZPOO00k0jezuvzT7hTD6lBOX0o?=
 =?us-ascii?Q?qoaOGPSyTH99h3uaYq1EbHtct1Wx3+pcqvJOJZ3SM1m43wFjepBCX8S4kqlV?=
 =?us-ascii?Q?2Df24J0zq6MSE64YTgUZGb2dogKwVQqkPnj361c+SCDrrwXUkII9wYsCK8f+?=
 =?us-ascii?Q?lS4xh6NkGRn7buAZ0nmeLQx+IMtMb8ZX2+1RLRe/SDHSiE60C8g1SX8Pv9Dr?=
 =?us-ascii?Q?kuk8nBUdmo7eME080mSazEOzy/n8HjEAsRo863HpikPh/kTU2yW8yIdF3/pI?=
 =?us-ascii?Q?IDVDOorXpSZfW+CQ5FeEIEt1jlBwEaWgttwjjqZ8Mv0RTVfrm+nxTEZbytN1?=
 =?us-ascii?Q?VbMWC/boMg6y1D51UtvSu8/+qvLoWo5KhCVS3sV4P2mNv9MEv0DRlMdVT5WT?=
 =?us-ascii?Q?+a4Dv2IQAPChpNaDhI0cjF7t5ri7EjvIHWtO0Ta/wsVh+Y/qYIg9zdzJJbW6?=
 =?us-ascii?Q?8fxmGrHFTS4GIHP6Yq6QL6jXy7+Ij7nB3ijNgK4kGvbCp1qKmSHXQmq/U8I9?=
 =?us-ascii?Q?+pq2nF3LMkRtduJGtIQ8CAQq1xNjSorGXw9DlndKmZs+5HlHgsAgRwzrUidI?=
 =?us-ascii?Q?JR4JFDSq5T4/f+qHLa7qX7YG552YHU9r7qNNSAzJ6kUU4T5YsuCdTa0ZsQeF?=
 =?us-ascii?Q?h+pIn+hmIocmC4n5eVv/0yksNWYeQ+R3Fm2LrFQ38AtKNwkPuU14/xJm2IFa?=
 =?us-ascii?Q?RcowIGB/57sMh7fMVmOJXw1xRc6n174ujG/aheVkS31hL5ZzVKZSyp4sZ5Ta?=
 =?us-ascii?Q?ODqHt0Il9bkBMnZ1yEgFN/KPMvKp7jEbyUEQ/HQuahVSUEXKLEUKzzZvko9y?=
 =?us-ascii?Q?oQigrOuKkwv3+iQqkEBFx0M8ktfC4mKdx1hwIOhL7GJuxgitfhescMsWTCIL?=
 =?us-ascii?Q?iBasISkOmaeiYHNzT3dDoSuQX6QiyRCOEDOZRhm9xcjlSvHBWseaSFcZSbvp?=
 =?us-ascii?Q?USl+8TzN792uT5fWkj2Zq1fDcVhWk4fg4wv3HIATlrHwNrq+RSnWU2Ofa53U?=
 =?us-ascii?Q?/6C7Jm0GJVNgXnlPK2Q46doVZ+mte2D9IDu3wHeBKWF6O4feAFKBHJVrYcKP?=
 =?us-ascii?Q?NDTXHbxtal/hP/BTZ1zDubhBXqSQiZpfc4CpkypkaeFUoHUFhy9bAPE2DRL7?=
 =?us-ascii?Q?T1bRVf0iL7L6nSRNZQqEu6ElVi0gk+yIBltXsAWuEmMUPcKDTdu2OR8Mkl84?=
 =?us-ascii?Q?YYbwZp5rON5qlbCvqR1Na1sQIMB/hGIqd31xbaGVZBZap2OUVXcDWNNMnlkf?=
 =?us-ascii?Q?Em2A3iJieQZxfWGV/uIA3iop0Tcb0KpYpTOOItEmHphaIX3x/dWEPhuXYLkL?=
 =?us-ascii?Q?3Xpii2xDsMNIeDKe0ymjZdZcVuT/8gGGlCLJ/jRPrzJSFYuXXZvE0Vq7giyD?=
 =?us-ascii?Q?aMxxyRtCiZZOjD4LZg/sYgzWKFY+72PUse4JtE9RnJNAdI+9C0M2uOJoIQgc?=
 =?us-ascii?Q?8FoKfvp3W8EHTsD3gc0yR1pqYYGFw0aT+koswlxFDzuFp1Mc8ZyAO4YV31mv?=
 =?us-ascii?Q?bw0mKCqOIuklsKMihOpN4NMJWSiXbvxwA2aR03XEzPZ4MmHu1RPYbsDsjYk6?=
 =?us-ascii?Q?PSFtLw+szU1yqN7BiVh3Tc4h45q5XmzBXHveoRn2A1nexAAxiI8U7IMDOwIh?=
 =?us-ascii?Q?p8GpQ8E0VLw/RRJsxCq5qpOzdaa800u3F3q2fPIoMFOX9zBN210UvKz4pLKW?=
 =?us-ascii?Q?wqhO1D4nO7oWeaYDZk8xdLZ4rAl3MTk04sPzB85/lkgZot6W2iOUEjt4IMkc?=
 =?us-ascii?Q?zxyDT+SonA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Cu8i5x9s+QjG/jihZTmK/2oQvjirnVdsFQtARJURTU3fODtw5/IQErWOR0UMhQR8EPkB7Qgh/Q8T7tByEurtvuWRhuRL4vjXns/H0u1kcQ8F+ETWdoNcNWg6uM2u8Ri6sQCwtdR+VNIQIwmC6JnogFzc3jWB6/oDpsmsBOTDpoIcGqEYVRgkyVWfgRsPAo4P/mIlCKrJdz9GR7SGjGNgd3dHfUcyd72eCfAbYDtBOEEPw268Qtw7ogKpsIVRn+O+TGedPz3VFcEBfCiC6+5kv+f0wcOvreCM0+N2XC9dxsEbn4AXb3dtDF2Bw3x6HrAmSfpy8WE3QidF3b4gvDosRA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cfe9b8-9ab2-45d9-3632-08de95e04be5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 02:32:51.1187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yeselP4aqfj0bOdTdRt9S7CP8434gh1AtHLgrJMj9u5aBiaSIk42geOIK+qLUZyxn+vLktrj5cmIcsIgRMI4ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
X-OriginatorOrg: intel.com

> From: Thorsten Blum <thorsten.blum@linux.dev>
> Sent: Wednesday, April 8, 2026 8:52 PM
> To: Luck, Tony <tony.luck@intel.com>; Zhuo, Qiuxu <qiuxu.zhuo@intel.com>;
> Borislav Petkov <bp@alien8.de>
> Cc: Thorsten Blum <thorsten.blum@linux.dev>; linux-edac@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: [PATCH] EDAC/sb_edac: fix grammar in sb_decode_ddr3 warning
>=20
> Fix the warning in sb_decode_ddr3() by adding the missing verb "is" and
> using "supported" instead of "support" to match the LockStep warning in
> sb_decode_ddr4().
>=20
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

Thanks.

