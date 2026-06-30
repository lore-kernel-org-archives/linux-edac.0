Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA97258CE7;
	Tue, 30 Jun 2026 01:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782784249; cv=fail; b=ivs/HnUlqMl7kzS51qbXrNLvUDmL2fMjgHkWbiyIJSK+93NnycDBwtGUESzv45SkZPntRru6lLervBi1tCmLczPgHAJK2TcG+DMidGkcOqf6CsJhWvl5Sbrj/RxX1TMCOPoWndrj5zLg1rjgE+UQqu5kyQrmMsgffJIJ0gBOOUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782784249; c=relaxed/simple;
	bh=98rEr1j91+sKa2MJq6g+WnNwFgvhlrUZCM4XYnRNJfI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EimGIluSA/pxVrV4j9v2B+INpfZ2Usjsd+mp4v2GuyDO8kPPn0WqcCyrFiouaamz0+88DONhhYe7l7Yk589efRoSDCmspwazsRwrzGv0b1qCuPhXZ9e70LuGHIOjtCq2IcMbBKL8vMhN5R5/PYqsIoqo4CEPzU7hy15DBTQ8rj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0IRtAak; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0IRtAak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782784247; x=1814320247;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=98rEr1j91+sKa2MJq6g+WnNwFgvhlrUZCM4XYnRNJfI=;
  b=W0IRtAakw2Y5QgwhSQYODBX2iGBLijLbSXcf3l5hcP5XVXli68oI3C1n
   AI9WmJIk6RF9cUbGbYmx0vLho87mPpbQ1fwDkMPK65vnGagEjs69kd7N8
   HC09xBzlUYvvKzRXAs0AvMMCdOhQ0R87eo/yDR7RrT6o0SPcWlz7BUfMs
   z7YCSDOWa/ILMaTIP16G0lmrZF25qh8yh1eZSTJnaiCl4CdWNgATou/MN
   1oDMN70gicHZs2MU1/dKr7OIlmrUPyj96Togl0P9IWnxkrfBuEWIHY5XA
   +lOvhGw/Qbvo8yKZlxA8yHHvP8Fl3LUvoZvaNEqNLhDrKC39TMT1Dlv6g
   g==;
X-CSE-ConnectionGUID: IznzSTROSraovG7krT5MbA==
X-CSE-MsgGUID: 0dAgZ6ujQtOq6YvAMofaww==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94639585"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="94639585"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 18:50:47 -0700
X-CSE-ConnectionGUID: eIIxtUC1SzCve9P/R49kUQ==
X-CSE-MsgGUID: UMaMUcsaSzqxPpIj1gkx6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="247665460"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 18:50:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 18:50:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 18:50:46 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 18:50:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iI7rThv9tO16Q0D0MslWOYCfGrV4FVU0J80a0lJHKOShj+Z9T2krf5TsedVbxSfHNRvJjLG9vWJ/IP0a/98UEvkopSzhLyZMVo2y/RWyktTasJG7d7bpDVREC+AV9KzE8ZAXswbdnm6mTN8vEor2MBZgA3W9MDa7fHAtKfgEAoepUABErkmWpOvLCq8CSNXyt9APv8sIeq68ihuMgPTlihDrbRc3teajxJrxljkM6zXXItRuXF62okd/Cg1XSoWasprx+zrH83VbSrswcM+lC9zBfRWSY1Ab6q/rOIjfJsCOJjxQfDM68sjxAdh1Ez2ypdc/68gK031AApI86rv0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcrY0T30T16RaK7VkCD6TihqDPTSn4XuIWyngCxaTHQ=;
 b=kp9POfS+bxYgZY/jUxApJE/xYCd5kMyMRoM6/j36AHCvwtsEn+EDwzR+j/4Y9QTuhftYTGjDuM1xVhDvqwJSlgTfegtXL6gWTBsMbOC7o7sApWYZgbLKG4Bb6fJQIR4hqkyNJGhA32Svr9tJ8T8m7ULHtBUf2tQLYCBynnJ4RZcNkd3VNBmCW77YmJ+aw1mwYH/3Cl3Q24yfiA7AXs9Tafx3TVh5j2q2vvdKtXHH6WPb7HTlhWAYB7r1fzgV0Y+gcXpl3qW/onipNrUQcCP0sFmPhuFC8PYCr1w1RPAgPxQoi6lLOKMq7hxNPBU9Qog/OIpmJv0Z6H4cXPMRJ6WZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 01:50:43 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 01:50:43 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Juergen Gross <jgross@suse.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>
CC: Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, "Luck,
 Tony" <tony.luck@intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>
Subject: RE: [PATCH 03/32] edac: Stop using 32-bit MSR interfaces
Thread-Topic: [PATCH 03/32] edac: Stop using 32-bit MSR interfaces
Thread-Index: AQHdB42G9wKzdXq7FEuPNLV1A8ewDrZWViiA
Date: Tue, 30 Jun 2026 01:50:42 +0000
Message-ID: <CY8PR11MB7134D3FB7DFB5144FE4BAFDD89F72@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260629060526.3638272-1-jgross@suse.com>
 <20260629060526.3638272-4-jgross@suse.com>
In-Reply-To: <20260629060526.3638272-4-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|DS7PR11MB5991:EE_
x-ms-office365-filtering-correlation-id: 0d8a2534-6160-4710-42a4-08ded649fed9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|56012099006|18002099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: 3fdpfeLBwa93Xq9A3WQ9tKXlLx2RxtpeStCmkWOtGO7Y/rWv5a3xVWuVZnVkTlM5am8rsZe9RHHVV+0U5t+Fm4hxmtmt+n+DpRRAxsW9R0QlVwB2QIKl0UC+ZOd/b7BnJtoCho8zOWZidvWuLBS+MWyZt0JHPRbK1lzGMiYCd2nlmEvNubzXSfqa2hYT1M3rddPWN4pwLdGtI+NZ8kLvjPcMLiJmZcNbXF/UAy0kR9CSZekEQziAgc/4APpanPuNuVW5WFuMATWTbms2XWaOhCP3d0BAGNMA1wWwtozkeEmHBdNksL+LEV9wPMLBx90lpQH5tIG7WLwXdDoPOtATF1cFpe70ZuTG/LD9saQIjNHcnp0co/gXtof4WnPGKlwJoi7o3XvIf5uhkBAWBwjZdeSry8SjzJc8oWE/0Ga7emBzOqfFM1bpPDpQe4M66wR29S0dKx9FZ2p2WURVFXTB6/3adlS3x7Zzc3OpUVgCd8ooOb6cSyZs51SmJ8eKZtG/2Auzn4X3fClXHSpj3mVfQu7OgMgx5IspvHrLapL7cNNyH9FRIyYRC5v00y/RpNM9h4x4NtXYgSNZb21Jb2B3nv/vC+hzbP/f0twJN1NTa9YbK7O79sJ6AvAnN+x0/thCpU1bLvJJ3VVMLzo3etMG4dikhOfmszawVoBtVERfP1JE9zifItb+aZD5zXTPaqEfG8Msj+CU85VthC5qyLDB0A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eQoaS2pgscuXG1a+9/wFkBoP/gFVb2p/welE26mbuwHqrrSNlu1K11oCqI0z?=
 =?us-ascii?Q?xV/ZHz3GQIa3PQDhYkA3j8t9N4IzVEqxb/xBhrDKAdEaM6BAtKtrrjmhszPu?=
 =?us-ascii?Q?cV7M5p5dmPFShOGYLlUfjQIPrCv3q1wpY4pP8MGVvNLIlPjFtt5BL1JM5Y5s?=
 =?us-ascii?Q?4YLX+k0Rc93O8Ugv9EihOTh6l32uN+N187pIZLhodvCupqFmVD8l0jzUe2P6?=
 =?us-ascii?Q?bpGHe4LeyPPV83032SANNf6cEcSOY3pPLzFvdlHgmdzUpAIbbJZiwgyUOSEN?=
 =?us-ascii?Q?FvqmYYis6A+FjL57GtuRrZxyraic8DxmVJuD4R10BX8vTzfsaXAzWGVjwbHK?=
 =?us-ascii?Q?m+aAPYzo/I/9Jaek2yJt9leLRucFwHsWrl/ShKdjuhG8s8KaNWgcsy0AuHaz?=
 =?us-ascii?Q?/KxTih12PnCgbu+LGQncHiKBoPx8BjeS36/A/I+2V+ha2qFLM3U0IvQvVvyx?=
 =?us-ascii?Q?c7ekdqV6im9i97PD9LaArmTWOhMYyDiphQjmSWahuq3NhH1h0Vp8a/zDTYsF?=
 =?us-ascii?Q?bfLcW96FHHt4rsWWf3N5VoMHiLC8pCDKsbhi/V4/aHW9foWKlriNjxmXRx7q?=
 =?us-ascii?Q?rtX1Ikwq34gRXjEfiZ/gyv+zl/NqAaf9Fm1v97tS2VykAtVKlTGdbZX7z/hJ?=
 =?us-ascii?Q?U2BtbYQRoJTmkYZQWxdHsh/5Q0vQMgMJl0+Lx9cd3qDDuaayOcA6vqGeJBIC?=
 =?us-ascii?Q?3RGMppi/OkGYT26XyYt+mLk2nNcljg1lCWdImEtb8QLUJb55O11NrdUCCpbX?=
 =?us-ascii?Q?Mzl249TVRzD26SKz5KpLE4tmryOA7cJ+TmvPMV1hkTOR/KNvjkykj/gFpgqb?=
 =?us-ascii?Q?gV0AAFjrPiCQJBBYWLt0QUi8V2uhg5PXjGVGQbOj8as8Ql8ywYGkiM72+pWX?=
 =?us-ascii?Q?rV5tYp4k4I3jjZCtzZLFY6KJA6+1CmqL2CQTM59DldjOEXMqcwcGWEojUaxz?=
 =?us-ascii?Q?JqkvC/hfqdcSpqouR9GEI8AUW7eLdopecfa0cjvgq7AZMQSooDpKlcSHcmTg?=
 =?us-ascii?Q?qIY044m/HiAa9zBBiKG9WeNReoswbMSoQU2NEzaLPbcPO+S/LkiHOwKFFnu/?=
 =?us-ascii?Q?DjPcnkH6t9kMdI+UVc1d+BtNS9UuldatwHO5mnzqX4CpyMbhQMRzM7B/Q0Gs?=
 =?us-ascii?Q?BQD7gG/Ds/eWJun9bsDzb0HeKwg/VSy16X8OWrtsU3DxRfLPVXI+DWCsle+4?=
 =?us-ascii?Q?EG5jZsZedudkoiUyRGMUSJi+Mi63bW0HHbpcVOargF6dmlmps54MIkWcsW1A?=
 =?us-ascii?Q?xl/W+6X4yeWdDhyN0vGFtOklBOR4w6OvrV7Hmll6s7HIFYetzLQSOlGlp86F?=
 =?us-ascii?Q?NWiIyw0nHxt/jw6PHVf4mwwxk5kFUESHXkurPjNP6Xwu45Q+ei3ZUDA3Jha1?=
 =?us-ascii?Q?v7Fnop5h/vqugYt/S36Wy6trxau3NZl9tshz+Qdm/S4Sorb9WRxI+ZhoObDh?=
 =?us-ascii?Q?D5wyGk8Ckv4vSOhp4S0OyvBVuhdb2L9N2Xj1jVAalAm8jBUxntFhAvi3Z2YE?=
 =?us-ascii?Q?JVLmlS0jeoIxbsAae46f1xEHK09xbB0Uz+sDM3shaPBDiXpkw24fDNMr9xvx?=
 =?us-ascii?Q?a57XJJ9LzTiTK1NSocLIAZei6+GI2BPtxxLWG2Iuu7De2WtwMdjJeh9uQ2r4?=
 =?us-ascii?Q?XRtLQ0Y9E+uvKmvpfHU5/2qTk9LsZLNPke6sr65NH3/NBi07FAbXRpdHydAz?=
 =?us-ascii?Q?9LfL9Z9Bi/nahqQB8EhRLAxxtZfbm0BPTnOjmVScBRSuCPvuDPn0PkKSYltS?=
 =?us-ascii?Q?V/geHkn+YQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CeEGSxH6PFSZU6tV4YnkQO/2jbjBgyEY+JR9MFDmNeuErJLDRv8jP1n/sR0fUsGq4/SLpVy0rZL21mhdd8bSFLAinvenmJk5FM8K0RrKm4NvSNjT3l4rsQ1QL9vegV0e0z1cXINsh+guf08PGJe69mjJgM5GvhltomsSH1L02e75aMxJAsBGjmuEBdPDjMMUx1wtOk2wCY4VDcTneTKiIE1YkHxqYTKBaGgwzJPBZPjHgjoMiZJqmo7qC8LEyiMP8vd3R20DGCtxtypObV0eGrvJ7/Ek+1dDrU/jo1Pt5mF0xBaBVuwcEYrDq4hfBTFVpX4xvR6vU19+9NFjFYPE6Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8a2534-6160-4710-42a4-08ded649fed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 01:50:42.9670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9qL4TVjiIAVlkxs2JcDZmJzS3lewQ4lX7ssLBOByu4CEr4W4OowcTpUs8zRwdfnftD/e2cB9PlpFUNCQvbxHag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
X-OriginatorOrg: intel.com

> From: Juergen Gross <jgross@suse.com>
> Sent: Monday, June 29, 2026 2:05 PM
> To: linux-kernel@vger.kernel.org; linux-edac@vger.kernel.org
> Cc: Juergen Gross <jgross@suse.com>; Jason Baron <jbaron@akamai.com>;
> Borislav Petkov <bp@alien8.de>; Luck, Tony <tony.luck@intel.com>; Yazen
> Ghannam <yazen.ghannam@amd.com>
> Subject: [PATCH 03/32] edac: Stop using 32-bit MSR interfaces
>=20
> The 32-bit MSR interfaces rdmsr_safe() and wrmsr_safe() are planned to be
> removed. Use the related 64-bit variants instead.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/edac/ie31200_edac.c | 10 +++++-----
>  drivers/edac/mce_amd.c      |  8 ++++----
>  2 files changed, 9 insertions(+), 9 deletions(-)

For this patch, LGTM.

  Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
