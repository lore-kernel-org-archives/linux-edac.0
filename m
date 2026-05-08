Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA673EDAC1;
	Fri,  8 May 2026 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247031; cv=fail; b=Bt5c2Y8kvv7anM9/pJeV011E6Tj+LSwKwbcdhkTiUpRikmvazuqrj2Y/H0deIttWTXqw+2DVgQy2IQ8NfyvdogFROuOrUm017F5l7zZaz+ADcNL+O3DpO3Um6PMze20uGK7DkBIkUTbO+PYz2DF7pLhMAH/uM4THtofp73ztTaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247031; c=relaxed/simple;
	bh=tGEN6qAKE8RQx/jpX2fLcJBddLU6NIh465d0zeVYTk4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bxMpvL/OCwfPk+QzyUO8T/EOWh9gbm7EP78qAS5UqR2Zm4HjsratteRpfxJQQNI+rRx+W3+xiS48KhBw/q2zFeaArL2/zIE/Y+9Psr0cXheH1ANphpFNyJEgPjKWoq2OvZfE3lWsLobd1zbm6Kc5j3PsDtW2xXk1DkEJLiTgLfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+pQcAxM; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+pQcAxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778247026; x=1809783026;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tGEN6qAKE8RQx/jpX2fLcJBddLU6NIh465d0zeVYTk4=;
  b=f+pQcAxMf2m7M62H3um3hprolalSJQUsKdiDpgH9Ho92nb3kIUzkLE8U
   5Zj5WZVFaekQmOOK9QW/0t7qiHOnuspKbLW6bTveQ31kzZef+DFPcajDX
   Ey7vBTZqnb6S+4tcPxOmHG0fPAjJ+F6/m+iYRcQGMLQy6JeUefzieul8b
   fMXamLToVv9uqWcrhyHEwjzvwfEPqGh4iIUF8RU8EIc4/wvqf29jpbLMG
   tCvvUB5BDZp0eEkEvhZ3H5Jj/JmIQHOi4AKM84U7X/CFrMc9SDtYTt60H
   3B+vWI/nEEQGhLOSDAEFAKR+q5GJyoXrxh2zU75hUU49U/gRARJAIVg9t
   Q==;
X-CSE-ConnectionGUID: 4zoolqRFSDm4BAAulOqZrg==
X-CSE-MsgGUID: 62IBusi0QLSAKsAdfGHZ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89914997"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89914997"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 06:30:21 -0700
X-CSE-ConnectionGUID: NSPvbeeeQHmh5e/2nklVJg==
X-CSE-MsgGUID: YwQ6kGBlTPu8A6pJpEB4NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="260499231"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 06:30:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 06:30:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 06:30:20 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 06:30:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7p3FKoAwpc62SEM8RhGcXjIMARzXyRo7L0ys/nrnOcXGBdYHn5QtpceBTfQSgCXDvR7Aiwow7kHKfgFMRUWSvJ6MPMQROD77xXt2XH8Vs8wXbRidk1PK80l5Sf1S07y/WcW5OV+WJtmTJ5bl0FEsF1o70rHf1msm+LYY+dpQ4xVxuSUhSwREDq+XKPOp/l9LkR0I/rFeCPj7YbPSJuIF+5vRTcVQjFES2J7J04B2twNgLWl9Op5ZFh2Br+g53fjuZtRwyYbsT+vp/bxh6hzaAJwCREyRTfHNwRnkgD+q8CAs8++19LEs6DyQyytAaZYao42+WdvrUzl0KcsW9Z1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRQQxHnfBy2Y+bOTPfLqy0dR3h655LX8yPbSiBbLAYM=;
 b=C4yNs9quuWXQUz1eY7YZNpXdPA6a69TC7dzr1IKqxpZivVQVhxoaoysDrxHwZpbJCLGcQ0R8OrONrlI4d/voAK2Nyr6ek2FhvE80BpLc/vnKPJTt2KgvbM7q8h8CTmYgC3H77i77sGo1iqWMLjSuDp2ItUnOnEYVaFNT/Bft7ieQ5DPUQkP+IMb7b0fNgUyB3x8EyLJSaF2+5oQXGMl+FLbQUW5ZunKI28UWkfD1BKPJqSqLsNHrI59s1x/gVJhQfWwbCz6ZK8lCeK754nSBHCxrm8LUECPVRR3vXrjnZmUReBolZh2pC4SipnN7AJtX+G9zdMub7FfXJdzE0eClAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by SJ0PR11MB4909.namprd11.prod.outlook.com (2603:10b6:a03:2af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 13:30:12 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 13:30:12 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
CC: "git@amd.com" <git@amd.com>, "shubhrajyoti.datta@gmail.com"
	<shubhrajyoti.datta@gmail.com>, Borislav Petkov <bp@alien8.de>, "Luck, Tony"
	<tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: RE: [PATCH v2] EDAC/versalnet: Report PFN and page offset for DDR
 errors
Thread-Topic: [PATCH v2] EDAC/versalnet: Report PFN and page offset for DDR
 errors
Thread-Index: AQHc3tfnoG7CLlIO70uOYyNlN2PTnbYEHLbw
Date: Fri, 8 May 2026 13:30:12 +0000
Message-ID: <CY8PR11MB7134C4903409BFF214412BCE893D2@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260508104248.1073957-1-shubhrajyoti.datta@amd.com>
In-Reply-To: <20260508104248.1073957-1-shubhrajyoti.datta@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|SJ0PR11MB4909:EE_
x-ms-office365-filtering-correlation-id: f00bde82-b6a8-4562-2311-08dead05ee9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: He85G7zM2Tt8auIH0xyhviSSeqcvwbISEneEskWiT9mPCwSgSDQMg2+JudWtGXtOqZg6XJbBftw3/bDnovKDTyfInn9iWUE5lnEwBfooFpNAM8HijysimOlDgendepUeI00dcMytl59q94L33SMB9gPYUiKGnfWzUXGPO2DezTRbd3vKyAIh5SMyRtfIDBKZC0xtEyMz4tja884Tu0/VDLE6+HdBfB6Y2TLKLrMYtwK7O0YDQbJjUhJKEjG5swV1/I1wfX2Ndov+wCNOygw3mwlCXiqvfCYr2AKkWL5Pa5CbLbPzlYbYbqfH0GfjamLDnm7mPV4CWj1/0PG+ornKcROsrU2XvtzImYYZAAQG9e7Qwr3kqzC3JeL63KnyM1GbMc5CDEZDfOya4XTACVKIII2kWBbsq5CfSc+1moGfoemFNcM118XtLXYx15bc3Qtg3jpalJ3q0MGhXTl46EAQ2QduyyEkDYO4bF7gWt3p5VfBZD2Gl8hK6k1CEl6f4dPwMooFtLYRoYlbg2Q21lEZD9bh5f6aSvizYDII8kpMuJ/cxKA/YUR1e8JjsJcsVCFLx1TCggglcButxqVh7L/28GWv+BiukDTIOECfvp35imqLQu9lqCOijBOITTOcQbBv2DCiKsVPICgTf//nN5xPPjrsE3D9x3JtI81HfTZ3RAkHugZfl70qDASxmHL0P1tJ/rO7Aycyqet5izce8oFquA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zs9T8f7AGn3cswY0R9NAECA33GBUzSQxpzR0w/Kj2okboMlm06Drk28xfV8A?=
 =?us-ascii?Q?t3iIdXrLF3b3ZISmId63Uw5u+nGbMvLxAtACinz3O4RbYJd99nvGt7Po2mZ6?=
 =?us-ascii?Q?QbmH5JPhNVD4rkNXZ2bVwLaG/Zf5dPjlh77Seam1akhV0gE3DjzgEZo855tv?=
 =?us-ascii?Q?TqwuONOlufI+LhFTefr50oMHSl4TLfFoScgOdyZ6nVGv5Web3gfgtCEQdcyK?=
 =?us-ascii?Q?NDX9Wt8nGIKYVEU1zfXw7jmqpSM3gVowh4G2v4fMqUpo57pXJu9L//tl4che?=
 =?us-ascii?Q?0waikpjlKQaR8oz/76ynR8WSvrK7r07Ea7+V3FoBov062T7PlwQ1NFz/GKLy?=
 =?us-ascii?Q?EogWxWa7FPIcFtGuhb2wbsg/B0WxInnFAo1EF8+evZLN0I1hvAK7GW/07gla?=
 =?us-ascii?Q?Sn2zZynm/lahRGr/kkKToMSHf5uO5CQWwV47ZvqHooAkO/c+w6zILdalZsAo?=
 =?us-ascii?Q?njKs2dxF0SY1ah/f6HqtVOm6+sffNLEBM9kS/Zjf4/V88FJTD3rQKFKyRAuK?=
 =?us-ascii?Q?8n8GPP49sxG1JSBVIhE8SKeUX8UmZKaUVB1o+2a3uHuZqimSuD+iSkTfSsrq?=
 =?us-ascii?Q?zeEliq7X9N502ppc4rbdsH3svn46c0jAbqArxUcXVzggA0iGVUgGuaGXClTX?=
 =?us-ascii?Q?ata78c9euZS0s9NP/7vgRAIn3dyrm7uH/NXXOXKzHz7Tok7yJGLw2HGjqWoj?=
 =?us-ascii?Q?zktoTJSY2i0/LSyCsn+6zUey0Jk9aq13s4P6RD0kU6Uflcr5PrdWVdedLTiH?=
 =?us-ascii?Q?2tUlVmaKncCH7932OY0CAOUp/AuhBOqNTsLx3P2NWbCKNglbFZEqk8eWzqVo?=
 =?us-ascii?Q?x6dAiP4cdsfubn2MCdKQiwwWowjiaatmIsRVFfhid7NE7CdpftWFNImhaBEY?=
 =?us-ascii?Q?Fke8zd/4eKSuA1jj1L0E/4IAmCPYT06Qj1uET9mogfNEA0LvRmnJzxCQ+eXy?=
 =?us-ascii?Q?o1qGu22stkOlcbX9Gl4EgYZWhOpA3D/3rtoTNNhJtSldPjIYK5heG42leJFz?=
 =?us-ascii?Q?2m+DJo82GMnIMyRSJWsmHYVqjTpcUEZM4TQ5mMii8W5Cba/CIwmglGoPNw1U?=
 =?us-ascii?Q?nkhTtoVmPCiSItBSAf3rCZgjVfvy7RFNG/LyIhXBzypiznyjNe/QD1xSul3E?=
 =?us-ascii?Q?9Lqhq/+zPNuc1uE5/kJQRv09NvNbV6hpys/tKHTCUAX9rSqVwvJSoP2Iy/41?=
 =?us-ascii?Q?Emy5vBG3rtN8Qx+atOXHQB6Jt+jUHXsqYv8kJaXJ1OjJK/K2y3fievQESIVg?=
 =?us-ascii?Q?0pwljgjKGy9Hcu3RnR0tQQWd2Pnup5ivI4Hy7LSqWW8VgCgjLk0Nck7vilSH?=
 =?us-ascii?Q?IRwEddSc2xvnMmdC6x05bxpIjLYnmqQWNyh7VdMi0dVInkdcRD7esDfzgCvY?=
 =?us-ascii?Q?Eu28MZ7JbXPpNwO5HYFY9Aptw/yL8bnMbRhSMKXzZiG28WrI6IFIz/f3ZOub?=
 =?us-ascii?Q?o8XpfpsE3IU7uEdb+gsoyYeThK/5/6FTgDw1MV10u1mwfDiy9DLfMHyHFa1K?=
 =?us-ascii?Q?ScoGPDrgxM30U3Kza/RxxdNAceUSJ1dkf8C0HLNFHaNwQVFVsW5xtUyybh8p?=
 =?us-ascii?Q?gY5qsnOukPiTrLSOHS3XeKRWNnGC8PvQdutD+KV6IBJkT8hfhPMSlt7lLYr3?=
 =?us-ascii?Q?uxpH9LGtQDyUoPxBSTterYJ8pF3UryQrbVenjil/gSMwE9ViKxPjCrBpoIec?=
 =?us-ascii?Q?XAfBHcbWYAfcGtPCWn4kBuPMeEVwpFHMR9ym36hScRUT9jJgFWQ5B9UQCi6N?=
 =?us-ascii?Q?EY7610mzJg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YC9XxvdGjyPKjy9+Twx9hZHVqdOupua819RgAAfRbtkJ563G0pKIqhC8DLUni18YWBKbjftgojLxm5Jx1i0ohFMsq53/cmk4THJn/dhfhZVKTLmtTD/WU1RUGZAHgqFgHfyYN6fUFunOLpvd5AmMiClPT/9Wvj8f82cW8DVWDxqoFjurymt9SaqjUUPErb9RghWhCIwWRdwIr4cIRxRYAva99BIT//nwybnG8XBDLcbPPehy8mgsNrU1o9rovuEgICjMQroOh0VDiYC0LsljSdIYEyStk/S+HhnprLOjhBJtuI92Izy2xob47aa0cO0niMfczHsNB1/1OhdubXiEsQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00bde82-b6a8-4562-2311-08dead05ee9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 13:30:12.2577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F72FbYmymJkURIXHcUproEwrEjKh/0pw+NnGjR7oNSn4x9qiBElY+9rrRNPb0Gyu0pSWbwogxNSaXHfVsHGyCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4909
X-OriginatorOrg: intel.com

Hi Shubhrajyoti,

> From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Sent: Friday, May 8, 2026 6:42 PM
> To: linux-kernel@vger.kernel.org; linux-edac@vger.kernel.org
> Cc: git@amd.com; shubhrajyoti.datta@gmail.com; Borislav Petkov
> <bp@alien8.de>; Luck, Tony <tony.luck@intel.com>; Sai Krishna Potthuri
> <sai.krishna.potthuri@amd.com>; Shubhrajyoti Datta
> <shubhrajyoti.datta@amd.com>
> Subject: [PATCH v2] EDAC/versalnet: Report PFN and page offset for DDR
> errors
>=20
> Populate the EDAC location fields when reporting DDRMC CE/UE events.
>=20
> Compute the physical address from the decoded error info and pass the PFN
> along with the offset-within-page to edac_mc_handle_error(). This allows
> user space (mc_event consumers) to correlate memory errors with a real
> address.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>=20
> Changes in v2:
> Refactor the common code
>=20
>  drivers/edac/versalnet_edac.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.=
c
> index ec1315582414..85d1a829a8aa 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -429,6 +429,7 @@ static unsigned long convert_to_physical(struct
> mc_priv *priv,  static void handle_error(struct mc_priv  *priv, struct ec=
c_status
> *stat,
>  			 int ctl_num, int *error_data)
>  {
> +	enum hw_event_mc_err_type type;
>  	union ecc_error_info pinf;
>  	struct mem_ctl_info *mci;
>  	unsigned long pa;
> @@ -440,29 +441,26 @@ static void handle_error(struct mc_priv  *priv, str=
uct
> ecc_status *stat,
>=20
>  	mci =3D priv->mci[ctl_num];
>=20
> -	if (stat->error_type =3D=3D MC5_ERR_TYPE_CE) {
> +	if (stat->error_type =3D=3D MC5_ERR_TYPE_UE) {
> +		pinf =3D stat->ueinfo[stat->channel];
> +		type =3D HW_EVENT_ERR_UNCORRECTED;
> +	} else {
>  		pinf =3D stat->ceinfo[stat->channel];
> -		snprintf(priv->message, sizeof(priv->message),
> -			 "Error type:%s Controller %d Addr at %lx\n",
> -			 "CE", ctl_num, convert_to_physical(priv, pinf,
> ctl_num, error_data));
> -
> -		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
> -				     1, 0, 0, 0, 0, 0, -1,
> -				     priv->message, "");
> +		type =3D HW_EVENT_ERR_CORRECTED;
>  	}
>=20
> -	if (stat->error_type =3D=3D MC5_ERR_TYPE_UE) {
> -		pinf =3D stat->ueinfo[stat->channel];
> -		snprintf(priv->message, sizeof(priv->message),
> -			 "Error type:%s controller %d Addr at %lx\n",
> -			 "UE", ctl_num, convert_to_physical(priv, pinf,
> ctl_num, error_data));
> +	pa =3D convert_to_physical(priv, pinf, ctl_num, error_data);

I noticed that the return comment of convert_to_physical() says "physical a=
ddress of the
DDR memory" [1]. I'm just curious if this refers to:

  - the DDR address space (DRAM-only, without MMIO holes), or
  - the system physical address space (including MMIO holes)

If it's the former, it may need to convert it to the latter one by properly=
 adding
back the MMIO hole(s), since the OS uses system physical addresses.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/edac/versal_edac.c#n363

> +	pfn =3D PHYS_PFN(pa);

[...]
