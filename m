Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E561E492D;
	Fri,  1 May 2026 02:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777601280; cv=fail; b=OkK1oo99WTzbBbjmk36YjU60AD1BNeP1UkW4ugVI21V4IbbzNjviYTceVPDgQUewXyV6L9xHTWMWiZAJdH3XhRKJzQ5SLSIjhuPH1BaTOZ9PsZZDjLF4bfXuOlcXhEDTW4xypbCMRhUeq+mxnXOOdLgLZcgROvtNkOGN7lRYTX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777601280; c=relaxed/simple;
	bh=4EmUQNYD3NoTgCtVt6Htu1mcZFGnQd/NnYLTiMND0i0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QNUoRj3Q/Pi0MKWymkso21kvnQRT1k/tbTsYSJp7jcVhs1vEzEtur61z21VQ0ZcbqpIizuxogKW+Lm/BJqqwpIu59uMYd6+ckBgVtTtpyTXMEbECMQ4bQSuMCsdvt5fxsy+t2i+xqcSdT9eCHRAFwpyp9eoHxIUtqAzlZVXZfdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7iGz3uT; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7iGz3uT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777601278; x=1809137278;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4EmUQNYD3NoTgCtVt6Htu1mcZFGnQd/NnYLTiMND0i0=;
  b=f7iGz3uTafuSy4+h2p40Vds/VPKqSvqCESEFoGmWp7sEqw1S/mTm2ToA
   i6aMv0o2aTpI8Tl2vJ3XctbApmtCv2nY8Wsf1EpQbi1OwHLDxZ6GpbMtt
   8c/rAvfaG758aeeA71hBxRzdx5FX8cUDp77PD3lwl1IVrWLCsI9Jcromq
   VukEhFBnrAgMc9S+kBBv/WOjpo+ieq43AqjYsagFP60uPp8Yph/yN1Y5q
   oLSoq2cb00IcjDkESZiWB5OQFiphl7sLZjM9mjYkfQ8PH0XduzeK0jcCv
   DlPH1wMHg4wVVtWxCXHqTqfJKzoLGVAOJeHJ8cYowFFbeu72djKIIhbYM
   A==;
X-CSE-ConnectionGUID: WSHzJAahR6+hCC972/feUA==
X-CSE-MsgGUID: I2bVIlH7QjSN94Efgr+C5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78672397"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="78672397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:07:57 -0700
X-CSE-ConnectionGUID: 8vYIL8FaSqCnlPEURK9K/g==
X-CSE-MsgGUID: 7c5Al/fSRM6eMJpdQ4Uu1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="239760715"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:07:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 19:07:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 19:07:56 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 19:07:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QumG8h/+Jy8jIYl7QdSR61BNamUr6WFrUHZC68lJ820rHLQS+b4Qdrdy9GrrrgF9KMZMVXaM292oQFyJdJMbRiyVdlop3vdHUJ8vCDOlgQJgxwYUK1y/3+AWtoiNO0QzYBPFx6kL1K9OG1Kn9g5gvLABHvXu0JllavWax1qqfrOPjeON4HNHKo8BkIwTysLSIlTBiKo15XPNFTuG987mIqPOLJapD5M4MRbJWQJp9NoKir6iTiZWFLWuyzXmdXLfXDGXmFBeo8tFQGCxCehrvcPuVnmNtAvqeg+MIrFfcNU8WNV1IB5S1ig7oBdsB2pmlTsesEGEUj6mHqFF04HXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S39p6ffAZ1VngTgRxclwk6jAeYmLXqZCAgM7SyR33cg=;
 b=abf4HYCjkk4mpCCaFEIBkBTl0vWeiHBTAxw7B+nXIJlpOeh+Q27bGnZ7lBXtDav2kBOcwk5SEpspGhWPNM0BAugKExZtgtT/26f0PdmLm3w4xZ1blsr9BFb+Caa70Zk13H3VXIkpHKJQic/An92bqg0D6pRmMSgs7rLObff/3V++a97csftEMRRnlHC4QXRO4sX+dpbX1KG2b9G5389rDklBRAjuPufOpTfFoVbPG+OpInnl+jGzLq1F70JDy+RVKHF+fWRsVtnzSfeR0gJprhri4K9x+fOIiX5Lizn51OtPVulsRS1qOFfuYwgd8+GIc1GiFo/G9EP4I8imf8Uegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 02:07:51 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 02:07:51 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: "Luck, Tony" <tony.luck@intel.com>, Tushar Tibude
	<tushar.tibude1000@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"bp@alien8.de" <bp@alien8.de>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] EDAC: fix error reporting handling during init for
Thread-Topic: [PATCH 0/3] EDAC: fix error reporting handling during init for
Thread-Index: AQHc2H2yfmAheCaF9EKzY67sYFu3g7X3oFCAgACTTgCAADcBwA==
Date: Fri, 1 May 2026 02:07:51 +0000
Message-ID: <CY8PR11MB71345619C4E0ECEA4E8B2DDC89322@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260430084223.9298-1-tushar.tibude1000@gmail.com>
 <CY8PR11MB71348FFB986C5620FACA9D0A89352@CY8PR11MB7134.namprd11.prod.outlook.com>
 <SJ1PR11MB6083FC71A73FC3C2D3AF566DFC352@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083FC71A73FC3C2D3AF566DFC352@SJ1PR11MB6083.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: tony.luck@intel.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|BL1PR11MB6026:EE_
x-ms-office365-filtering-correlation-id: 78c58739-7dc3-469b-1a1c-08dea7267327
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: cWtA9hmsGiFjdE6QQ8AnN4fmt8BgXuNMHTFGgs2h6zlbShuZaXT+fEAmRCVFqgPRf6xufOgHEvzVBWHyfYMve5fcWbm0Fy2eotvzjaugr2rPFZtiu8RNHwGeXo/4rIAdn6HBa88MM4I0us3K0czHEVdHQC8dUfqfAn94pEVgeueQwOwhuOp5zrTE2Z5O15d1uVczbo+xymjI03RKIqRLzXiu91dnacUEqLTlKT6qlbebcKQT0d6nVMavwo5UAVE33P3FW9/SLWhcGwnXs32MomAdeExEGe5RnRthNiSfAwZPzKDQbL4bQwabCrR4eKGLhaVjKq0oJw4Kkyv21hjTq8zMCOXQwk7kf8qq9UGwbIui7xN2Jw+KQOxgCtjgtDfbwBQffv6PhT7Z+wvlzS4ZYOt3VF4SV/GPn5dPflMWNGPR8JT0j5fN4ypveNEoQifK5cOknuSqbojVACFym6U5Yup+SZF4QWKjJT9P/tiCu37v6Z2o8SMC5yo3eplD4iCXLeZMKMXslzt1N5Z0bhNzmvkjBCCJgMmMWNLzB2ou70157R4YvJ55HoTsMD4mqm7OVKpPpbth3RtqkvPPKLDW3ZbEzephQO/BwMEVFD6FwY4pqU8G8b9g5wduorp2005jcIodN9zKSnsZl8cW0PGJwrO2LPR4MC+XmUgFgo7YJsLkn3yMkRWPfopct4JfivtdNlM6ldpNX4VOtIbBgY/fPEqJdtt6EzH1IfpNzITcDDZqNhiW9i6vdjDMKMdrg8rs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GDM2JBChu+FzkfWpHuwdMERl2cM0c5B7RZxWHexhev+R13wgHRLXHl9ojIWm?=
 =?us-ascii?Q?GGqn1+8CMFqsOFOrWR1hoQYUUPVEJ8hoqhbKlanFvdYRKGGl3zoWmdfRj5uM?=
 =?us-ascii?Q?2WA1qXGBMcZz1+R0MlWegYnKeMZwPrIRO/l++O4XGsTmBWAcR4cW8MDIQgla?=
 =?us-ascii?Q?7BPJLri614juVSJeHkVoYKP33f0KIAz6zofOU2+7ptwQGjMYKuvnNNDhUsx+?=
 =?us-ascii?Q?IxK65xrXv3OSiC+uTSDVxVIhK6Hot5vAnj6xWqIzMh2/l/b1/ghDJCRiJqrG?=
 =?us-ascii?Q?t75qJSiLQlsTKzpcml+cNRMAF85uRdwH7pvLC8ma9/96FW9x2IIfztme4cJ9?=
 =?us-ascii?Q?ialxGLRkGRr7jzS/OnXHtC7q88bWeFfCUm702uJ6arQ3wmErrCK93O5wSpaL?=
 =?us-ascii?Q?4bK2CftXWOM6gKEq4YwgPAQBeSXZEVGkjx0xCFbwDm34TlVix9L2AoXVPjqm?=
 =?us-ascii?Q?Xq+0xMTtK5I+/+MGvhYm71GIi0C93/3saHdtx/kKjS06Wh5xoYLBfrI6mfQs?=
 =?us-ascii?Q?BxAEplmLnDm1NUbqNjTJiRDEei38J/fV6g8Pu92tAiXf7oS4yKtnpc9deE4q?=
 =?us-ascii?Q?gv/UkqplSR7QQ/BiCQ0CAZoyzCCpCKTH5XrynK9/zv6hiySYUgxumpPWYt9o?=
 =?us-ascii?Q?/x6WSCft31XX9sf8SzRSjAMsUj8N6u5LM10P7MtIvn8FP2lOYxK5TOwvhZEj?=
 =?us-ascii?Q?JpY/pjMNp7t5mk1bwTZQH4q+QCEYYqqahq0/+KAE7PYoi5FI5susx9Si5hel?=
 =?us-ascii?Q?oG6cfuNRFDJ/NTxq8uB17sv+NmYhCTgcfU/dwvej5SeEeEaHsMqogROihWIZ?=
 =?us-ascii?Q?GdA2QEGfM10cKQzog6AARTgozBmBtl4JKBLMZFr9Nflzw2DA9AsSh66U6XIx?=
 =?us-ascii?Q?CSi8U5I47vlK97lD+bP10rtzQKMlMIjTl0V8k7UPDe/6gdOQj9JNSSIz0WC6?=
 =?us-ascii?Q?G4GuHLBrw8ihavTHdIQeQVVZxT+sXalC6SNw89rKyReojQMfNxguhXp2+jSW?=
 =?us-ascii?Q?fQSIG+cxw2PQpTGDeQpS3hGNzUn2ngblYhihHgxFpBbym1IbQSHl18a4UYik?=
 =?us-ascii?Q?srHK/aqG7FIcZr0DahTJCZv8g7BmaTtKqy+Y0yLJFKsgax9lomPcferqi+B5?=
 =?us-ascii?Q?SPvx5SFKkIghyFVw+kncHpQ3N15O94GFczFdu+lHcATfV4nocDzhVC0dE3WR?=
 =?us-ascii?Q?rZrsSgD0aFHNpZA9hUx3CqjJZstTUTjp3xb1clCfSItnrAn652LiHRw1Ps7S?=
 =?us-ascii?Q?n9Cl3wv+2eBhk9JHlc97F9c2VsWFS0uEUn6NptagDe+gFEXJEXwOSO0mAS6R?=
 =?us-ascii?Q?0ek8AGoYT6FUd0LtPCjAHK5fncNRXrFqX/G+qEE78E0m4K/+0eAqslo8rJCt?=
 =?us-ascii?Q?UPkkcCd6XaWYQRKtRl13NYnKZVeI3Q44YX9abTIRK/bWu9RdjSL8ZGI4cGy0?=
 =?us-ascii?Q?0c5QjiS2w5z+qeUDTils3PeGEiPLC8rfY2WZlkTnVVwMlsFtOgKYzrlnLzx7?=
 =?us-ascii?Q?giqxpD5dACBj6NEGbpFWQR7gQBJc/WH+pV6W1u6JCqSoJ36bBzGhlXpyLUma?=
 =?us-ascii?Q?YtG3+ltleh/fhSIZxMrgiKKZb82VMivKJgFEQk+Vzzr+Vd6U0EvSIbdBzTYC?=
 =?us-ascii?Q?N2Vv4PxyW8dclqbgmGSyMz/ewBQ+FXWkvNs5HVmktZgZA76QeDOS5v9Neg5X?=
 =?us-ascii?Q?bYXq+mWcY3FVq+pI5mB1RNYTHlQMUHjoiGzBDrQ7nAn8RSo0iqMOmpnr2czz?=
 =?us-ascii?Q?MlBOW9e/6g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gkw50JRjeTXMy5x1PQ0/21erpeg6YiXdi33KJ6EwneD0PoTuH5LU1Wfvfley9WpC4bOL5biQZFJxHbxA+LEDIS+jAebSCLHRRJtzwvuZkvmI53QMRjw6CRFu5LmvOB6UvmL8SDUWZlCVKDckbUhitQZixaChet7mRonjtKG5PIC2KGJ3Y8lbyx3qqI7mZ4/zyJTPiXy69E53cF/cskJzctLtAHwY687pSQn4GgDIcELYlWWri6wJW+trmaYXF6mPZd7YLrIKUzHnGtpNhlYq74dXSWQdZlNm3oBZNjisy68Wr8InMVLh3lpzUxA+pjeOc2A7AG9bybc224zW49Kyow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c58739-7dc3-469b-1a1c-08dea7267327
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2026 02:07:51.5305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3+Dc/S+gKgv1oZ3WSAPc4lfDkW853xrQDw+X0BPPCw4yvBxsaGRlQ4Cn2ozN7jzFVHpLNbTnBNZVmIZcIx1lrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-OriginatorOrg: intel.com

> From: Luck, Tony <tony.luck@intel.com>
> Sent: Friday, May 1, 2026 6:40 AM
> To: Zhuo, Qiuxu <qiuxu.zhuo@intel.com>; Tushar Tibude
> <tushar.tibude1000@gmail.com>; mchehab@kernel.org; bp@alien8.de;
> linux-edac@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH 0/3] EDAC: fix error reporting handling during init f=
or
>=20
> > Since this addresses the same issue with the same simple fix in the
> > same subsystem, IMHO it's better to combine this series and the
> > missing fix for driver [1] with your previous fix [2] into a single pat=
ch, rather
> than having 5 separate patches.
> >
> > But please wait for comments from @Luck, Tony and @Borislav Petkov
> > (AMD) on whether to use a single patch or multiple patches.
> >
> > [1]
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > /tree/drivers/edac/i7300_edac.c#n1092
> > [2]
> > https://lore.kernel.org/all/20260429094806.25097-1-tushar.tibude1000@g
> > mail.com/
>=20
> If the patch was only 5 lines of diff, bundling them all in one patch wou=
ld be
> good. But each is around 30+ lines:
>=20
>    drivers/edac/i7300_edac.c | 33 ++++++++++++++++++++++++---------
>=20
> which would make the combined patch a bit bigger than I like.
>=20
> I'll look at the individual patches and if they are OK I'll pick them up
> separately.
>

Thanks @Luck, Tony for the comments.

For the patch series, LGTM.

   Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
