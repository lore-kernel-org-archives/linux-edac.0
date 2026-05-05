Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780D0318B9D;
	Tue,  5 May 2026 03:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777951779; cv=fail; b=CgExww+RoxgyM80Xp0TPKbJiTxKif5ihVwjeOi31Re85bg+URB5ln0LbnZJWHQilXO2VV36pdOMS9piXO2XyeXM+7Xv6GgY0OuEyuvOvAH5ekXfXcrMiLDu9JqgmiXJmGYYtLs43tUMKB/5VUyHiasMVmvFQh2fhOc9i4clf9Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777951779; c=relaxed/simple;
	bh=d74qZo7ZUwajX0++Cu0JirYLWSn1h02GvxU8t/A8Fms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=invpZXUNC6VBhhDgJxD3v+DV5y6GfakoNTibFiCkB6w57XBBUFWD6Eh1j6ovpOCA0Msfncvm2iuzHYih3dxmGqmkdUHXgen5Jo6x4wG+go6Bjycu5JWk0NjC4FbOKyx784FdoSYSDuZyfpMnczgpAnfdIGws5mFa5lAu0cmSERw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeC26+C3; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeC26+C3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777951778; x=1809487778;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d74qZo7ZUwajX0++Cu0JirYLWSn1h02GvxU8t/A8Fms=;
  b=SeC26+C3h8OVBjo9mxyzrz9G8v8ZS/luqyDoxVZObzJnGJjkRkGP8N7H
   qD+ypngINipdMg41AmDs5OJxp23qCr0oMJUTkj/d1PnsspwlVD4Ff2VP8
   671bqOXhuUqDCa4h0inJNAky24m5+2GEwnkxviy/UoFObQgvGkmtATEUJ
   TOM4dpiRgVlfgF/UbcBSM2cKlSolaCKeQ6Jefuo7LxeLjoOdwMPonxvex
   UWzNaVb9gVjTSu4FBKyoo4HBXhHXJMcu144NpbMra2+IegxmDzj2C/UxG
   xQLYE0Bz0Wc60XvA7/RMt4QIxbQ0GdTZ+zEWiuyi1fZqIChdXoS3jG96C
   g==;
X-CSE-ConnectionGUID: HSkUdAdBTsSjt+QwerZt1w==
X-CSE-MsgGUID: z0KIeU5pSUGkhHeaOuwYgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78805700"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="78805700"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 20:29:38 -0700
X-CSE-ConnectionGUID: 6dQe45mUQLSRge8iUIhY9A==
X-CSE-MsgGUID: GXejY1JXQ5KT5JC2yUxzpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="234816962"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 20:29:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 20:29:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 20:29:37 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 20:29:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUQrPdG15y/DUIyChQiImekx883Sk+AH+J66rq0DJe3LRG5T03zkESENWDOFQdMpUUBOMg+Ml2PKZmh5QjMfXRhwRtVGepXWN4Q2jCpcGRtBJOW6OdFDzyQ2+4MNGlQY+zC9BiS4mAbBf9hzGBXdhofYNjpzMZOHDE1GQ3uu+MMKBn2DM0gBA4du8W5ykXvZ4pbvDYLc80HStZb9+Fj/yfKSiwataylHJKnCbZjvEb0ImO8cwn5tAo5A+qkRbAWyJJBI782EIU27gafr6aMMvxgWcWdWNhBh0Qt0M/4hMK8u3Z3KC3Wr2oNIDRxQMYc3cXuhEwRuKX1stKdmvBLl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFfAI5DkmatJ5+KmyGwt69e9nrRTU+ZhfT+8oaf+4bg=;
 b=fU8vIty1WIg+UkpgOnMOQl/A+PR55x8+W9pQKUDks3SW6Y3Q4UZr24WrGxVVR6w8AhGUynKg9PAzfjlM9KbHlayBZu939FvC3tQBYUpzKfRY6lrCTQakvP/cd+W43yknBDInlMepSzA2sUgS66CuVKIEqmEwRhJ9VgNLqdCTEk43tmijodi9VXOo9DHZl2m9m/z6ZfN+e0nMBrYKbafaUYy83zMsp7YWKLH3B9he5zVCygItBJyl52LiWx0pO0mwUIf87t9LPJJ3czKPOuA5YtG/92XMYU080XrDBtlBQ28FJ7ivOr0223HhrkW+DipJN9Lg1d1ZOcnCAKCCgEhIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10)
 by MW4PR11MB5909.namprd11.prod.outlook.com (2603:10b6:303:168::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 03:29:28 +0000
Received: from SA1PR11MB7130.namprd11.prod.outlook.com
 ([fe80::fc98:7fe:bac0:f2d4]) by SA1PR11MB7130.namprd11.prod.outlook.com
 ([fe80::fc98:7fe:bac0:f2d4%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 03:29:27 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Yuho Choi <dbgh9129@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
	Borislav Petkov <bp@alien8.de>, "Luck, Tony" <tony.luck@intel.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] EDAC/altera: Fix SDMMC PortB OF node reference leak
Thread-Topic: [PATCH v2] EDAC/altera: Fix SDMMC PortB OF node reference leak
Thread-Index: AQHc20N9FVUVlm9T7ESW4aoBNKEJgrX+xyVw
Date: Tue, 5 May 2026 03:29:27 +0000
Message-ID: <SA1PR11MB7130000ECB2F22787F8DBCA8893E2@SA1PR11MB7130.namprd11.prod.outlook.com>
References: <20260503212558.2811480-1-dbgh9129@gmail.com>
In-Reply-To: <20260503212558.2811480-1-dbgh9129@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB7130:EE_|MW4PR11MB5909:EE_
x-ms-office365-filtering-correlation-id: 5837b6e4-63d1-4dd6-16a6-08deaa568329
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: da4/RjVz5JjZrHt9T7sEWsfFqXCh+5cbhx2wwc4znLlsMfz8/iQgIOogzCYAWhcDOzftIGdncO3feAdUj8YqpGUTdQoV6t+k5WvYlHMoaHdrg1D54DQj8dwqsUE2l0qI5/nPeBiaRTUG8zffmQWMJwE5N0YWvmM0gQ75WYRZd0XXAy6MYe+kpVZq6oEJF3ldI1aWm9QQkR5x4Gjx05JX/7Cd/eNhXSgB8Fe3b84K50hR1yvUBonKhbBVXKpvjq30nQ1C/+dNpEjoBEUtVpkXTyZoIIBPldUJKwxkz+C5yIoKoqkkvp166IAaWGsVVz7TZNi56oYIMwFSnqLENLoXO7u5RRn8WohgFFFR60qDvR5Zx5kk7oTBitbQZ2Mno9Qn1Dey/KChhWd9q065BJ4YDBfRJstsevMPdaadnbvucw5W8h6MNafafZiz6KOT8dqs1kgIuA50vQ40hrd6LLs29DBo4eD2qTyCGFhPAP3gk/SK3mfm0jpLz6TBs/a1YHUNOZvvXRdG1HZ/D00SDbysugJVe0gyp+bPZHYaCiVdTIjqUTQ8zgm2cCmGNtZV5uh2ZgziFqMtCsdzXLJ/pZj0i4MFpzcpkpkn4rMeBOdJIXuZ2ondaYycLuc3UbOrv3E6B1SAW9iCDJ8zSHug/R/DoK6iC2KXcsJoXK7jQaRz7FZoSmZposUeJzMhiRLnNavhTXQMVnArH3lQKB2rr+HULAcsS0psmOI9ZKq7vpzPQkb8TgsIM6ydB6gJ9R1Nuifa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB7130.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2b1MtxvWbjEQ7FVAsqutYIatj77BsrXXGbXhkuiswMiI3uXu3S1PLp9hkVcI?=
 =?us-ascii?Q?VANFeXDkbNk+XLC5RmMt/nPOam4pveHHLo7WgH86cAGakYjiX1jqWS0Ut30y?=
 =?us-ascii?Q?R97VnD4rY/sJAAKaSKgsxPlj5qlhMwh+JaumcdKiX6ZNBbS288nJu5BXVQag?=
 =?us-ascii?Q?0QfmIBn6sKCn7uSnm51LFiKYixvme+zHuHQq6TjcadlL2RZU4PIIKeKWCIFH?=
 =?us-ascii?Q?BRiW693mJwZ3JWGyoRui6hyaBMu5I07j5ul11usNb+hRKgAad3YpNcUvpT8U?=
 =?us-ascii?Q?W6HgVXZF1dDS/5b04IfoBsR4+h1NswnTtm2Z7ePz5lQk5sk9cQp5jAQsUVN5?=
 =?us-ascii?Q?UDZ4sYDj0JdxVrLrG6c14XmOrEJAlMIh5PkubPrdHp+9cbq8uoFva25J+XWd?=
 =?us-ascii?Q?JgBe6S3dhm46P2P84DSF1zoqo/dInEA938oI1uyerxDl6Xtbw7r98Um5SBwW?=
 =?us-ascii?Q?jxY33gF3YzP4akdY1uICNrZIx2QB3VSLeGRPW2yQCcruGxOmnFypWP4ApfY7?=
 =?us-ascii?Q?M5pa823QBNx6I8C8hNiVG4NDWCSpuLzKo50A31PRl7sXQ0tAR2cQ3qyDYoOa?=
 =?us-ascii?Q?BMhw3llXsL5HMsdo7fp9yt/oOxMk9yZv/a23Ws5qczvQLuTv4EBbbFtOsy17?=
 =?us-ascii?Q?cVeDTEmzv6l+q9jo4imMJ1Rx2e+rOPKrFxueE/TGT4M1iGhARJnAh8B5JkA7?=
 =?us-ascii?Q?6Mgsiq4fyTchK6QfzsAH5rRs0YnnMqj03WwQNnP289lJM0g4vgxp0jwg/n2G?=
 =?us-ascii?Q?VInFv4U3EIhv04mRJTnlZsCjaGzgXL4kLlAHPW9yedyIn7XcL9ft5XGJxBpi?=
 =?us-ascii?Q?C4IltAx3nB4MgLaVDTtA/Bx+Q5ILEqwc3lhwuh8C5WWwIKb4zgrWRXYEgUwz?=
 =?us-ascii?Q?MhFZKUBjUYRYp6NFqeyrmiS4/9AQU2y6WYBcyy3voR2YPvinNGf3HX/13eZg?=
 =?us-ascii?Q?gFD8OfqRyMPX5e7VDFQHg56gOFgVEMeCalgNzNUav9CQwnaRgWMv074PGAIQ?=
 =?us-ascii?Q?U9g0Gm3Bh9qGyUpf4mxIJ63BM/lhPU5OHxIVz0n6/qeSB5qiNN1q1oYo+Xcm?=
 =?us-ascii?Q?BaXYkiLxkk5Y59fwWRORHszMGUk6rV3gY27wc5WeAEKWtmwQaLKHhxeT1Tfw?=
 =?us-ascii?Q?Yhttmh/FX13LT9SPyigwxD+P+awW2FvzR3gDdaEEciD3I5F4xU1XFnS9UO8j?=
 =?us-ascii?Q?OD39XSmzguwB3HExpKUAHHuoj0rDbdLn5gGoDQyF8xyLyCLqc7A7qM+r88aN?=
 =?us-ascii?Q?kbsMCcbPtHllCwH2TLiSrn8CZizWAsWaDF2CyixumgdKgmC4ZdtvZ8898pK/?=
 =?us-ascii?Q?+hfftPAe6y3XwVE/XLskSgq3JqwimlzJp3JrQLTjecvnuZRIOi9KqDP+biZx?=
 =?us-ascii?Q?URoW/vbZs4dfpqDShT+FTEcdO4LAe0sIIUYirV2hquSrdikzIbaww4ZhKdEa?=
 =?us-ascii?Q?Cayz3KN31NFZ3ZjSArRdjDzujPGZpTB70Scg8NUdiNnNHI8kB+/KnLmuOew1?=
 =?us-ascii?Q?4K3v/VIQ6kFuD6g01h36bpdWuDEeLRzBVaXx9V230I5y59HhYn+qKR6yVW4p?=
 =?us-ascii?Q?C7fyzzNrdEn29M3bCWV9y4/z4Ms3UU9B7WMFbrvN3/B9eE0pNZ0GSW86YOjU?=
 =?us-ascii?Q?cUbAhU+O58AKMLrYZOjHa8ExvFGQ5eBh3B3KmvLkjNCPDgTmMF4n6vONJWay?=
 =?us-ascii?Q?i23QusQkkodLrS+h+8JLcm4dUE9MzevL+Yu74YP/kat/0hkvAf+jWDQZZQYY?=
 =?us-ascii?Q?E62+D/uXkg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: prpaQ+ORigJUbmMBM5tPy6lpb+p02VWDCBxBwAW4yXiQ8aqskQC5j8FbhmIpRydlEBhrPmYo6ku3+ASVX36TsBjt5EcJhgQcAhEm/bfvp4VhMHtnkW7ZEu1wa3+HkR1O3uA6kbgi23YDQfJ5SyrXEHN18OkI808ZHeZf91pa9TXu3ie02cg7CxqVQNYY08ZxOCe+fE0oISqiAFxo0H5onuV1jpDo7+pPwidZunxCNNb/h8KA3wfB56nL7/uFKFKBE0oZPXkVt3vAyIHXnM8wDxFTs21lr9EyY3AfxrDhRr4taxVL3FvJHT29t3Kr6riZCaNbKlrZUxqVso9UWJ//XA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7130.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5837b6e4-63d1-4dd6-16a6-08deaa568329
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 03:29:27.7043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdX+VthShQigKz3vegzcHwXArq6s0eLBlyN5V9hniBgcMNAxnlD7AxrsyAxzXDHfNANJ5Cn6gyjyXVK5wlBzSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5909
X-OriginatorOrg: intel.com

> From: Yuho Choi <dbgh9129@gmail.com>
> Sent: Monday, May 4, 2026 5:26 AM
> To: Dinh Nguyen <dinguyen@kernel.org>; Borislav Petkov <bp@alien8.de>;
> Luck, Tony <tony.luck@intel.com>
> Cc: linux-edac@vger.kernel.org; linux-kernel@vger.kernel.org; Yuho Choi
> <dbgh9129@gmail.com>
> Subject: [PATCH v2] EDAC/altera: Fix SDMMC PortB OF node reference leak
>=20
> of_find_compatible_node() returns a device node with its refcount
> incremented. altr_portb_setup() looks up the SDMMC ECC node but does not
> drop that reference on error paths or after successful setup.
>=20
> Route those exits through an of_node_put() cleanup path. Also free the ED=
AC
> control info if devres_open_group() fails after dci has been allocated, a=
nd
> release the devres group before freeing dci because altdev is stored in d=
ci-
> >pvt_info.
>=20
> Fixes: 911049845d70 ("EDAC, altera: Add Arria10 SD-MMC EDAC support")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
> Changes since v1:
> - Free the EDAC control info when devres_open_group() fails after dci
>   has been allocated.
> - Release the PortB devres group before freeing dci so altdev->ddev
>   remains valid during devres cleanup.
> - Keep the !dci failure path limited to dropping the OF node reference.
>=20
>  drivers/edac/altera_edac.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)


LGTM. Thanks.

   Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
