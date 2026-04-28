Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8896B34EEEE;
	Tue, 28 Apr 2026 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385208; cv=fail; b=Hnpld8/Lo5fJ2XP0qSNs7T7GuHHta+MGwD9t/9nsayxhSmqdpHS+ScZA7T+Pq7TB33IXtf4bnfIMCXq8SRHTR8o++RFoQfE8HEWcik+LBw54dZVs9pYoSF2J4kGklDPbXtth6qfxIadQ2Os1GYZTV5BLm23t2Rl/kWFP4TdsNe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385208; c=relaxed/simple;
	bh=/T0/ajRYUnxq7BihhhwXuGt1Npmjt4NkVXWxvcLUSHM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A9i1dyhRjJgoKf898XBXu93JEOWvkUnaKXsf7j9+ypgQPBf9XdQXW8cyVXtM5AV0BxQrqTe3i3AF9+L3bd3+NYEcirNPldb1aAAapDbhFZVxyijhpdOe+FGiLeNjA9jLSh/zRZbjN9FXXeVpPiaT/Ez8hmriYx/K8eSy+Kzy/iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJnRIsmY; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJnRIsmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777385207; x=1808921207;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/T0/ajRYUnxq7BihhhwXuGt1Npmjt4NkVXWxvcLUSHM=;
  b=PJnRIsmYG5LpVcAoHWYMX4o/gcFgHhCPV6Pb3CpVNztxga1aFSM9XzQR
   SFAHlxcoTXqctt1UNWNAfCuJlc1Ig51Plo+vrzPtXZjcpZS6kS69EcRdu
   mXdu3OywQGvKOe1aI2lV/K9HaH2N2cwvzbcZsUeoPTW1AC6rCPLFReSJP
   tmR/2jZlar7s7NRyaLX9wbmDXOxx9GcP4du4o5tqoatrqg4IAqAEFGsxc
   h4dXekq0KnbYm1fSlz9rrVsCiXfbyzavAbf4zRPJbFurIE53fPack/vLP
   KkjaC5ah2uIEdchWHXNnKF0AZ+Se2mJ/ew8QYU1ocvcdeMPA1n4zzLhGQ
   Q==;
X-CSE-ConnectionGUID: ZFKUd9KMTK67QuDwlBGFtA==
X-CSE-MsgGUID: e5tjHMrgToaI7bbTqtKr3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="100951720"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="100951720"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 07:05:35 -0700
X-CSE-ConnectionGUID: P9cuJ4SRR8myhR/Y0UK5iQ==
X-CSE-MsgGUID: Q+9aBTk8T1+Cfkk7Yfycaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="229604347"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 07:05:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 07:05:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 07:05:33 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 07:05:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTfBgXAQCFJ+oM4qzFpc+ECTpct4Ii8HRQ4j8peK+3S9pknXAXGtCmOP4wyaoi8qvjXg8q4VolH6P7myn7kLg8OSHOCbKNhKj+0cF93V/bV7J2CURBT2NBdckpnOsdbMw71y6g189Kfv1M3vYU0uhTbg2xsnplEVRQQL8sU9HJv5xprpNwiSL09f45C9mGd6rOafIyNKDmfm88x45LE5mU2TjI86/tIbpZtqLHrXRtyhdn1yAoinZFKyZTuMZjxOFouL9TAaYNBqXgIaf/QOKrpz/Pmc9UeEo0n6qFMFp0bg5r0c/ue227AaPMfi7ugqqqIoOmD1rbKUdM2Zgh308Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChIwGCXPKPIUeASTtYcPkQfgFxuwj0iY9yT2bqcSB2Q=;
 b=E8d5impxQo3v7yQP/4cLlAvbeBCRbOar0yTaJ+DDhJGtUfl5942+TfYImZbHYAnC7gK1rLW5YeZrWyPLklCjFtOF5KEIEMML0xezcv4Aw+i6QErx+U1JNvy7b/C94mOj6lmQsp6pwozc5U7WbAdNceI59dq3yxg/isaPtU76TlcgxKdkuoRafw5yGJbjcXzXnvR+Eaim/tuXyFPxlOduvXdt47CIxbFZ+UIo70UcRsow1Eh3L1maeEoSDcg+fV2WsTFxne4uU1b133ElMX011VAoCWoHj3EzhicQCArmMVjLhyl/Y0UY54TrzYtaHaUynZDFQLalVWEEAO9heL2GFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by SA1PR11MB6710.namprd11.prod.outlook.com (2603:10b6:806:25a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 14:05:28 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 14:05:27 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Tushar Tibude <tushar.tibude1000@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "Luck, Tony"
	<tony.luck@intel.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] EDAC: i7300: disable error reporting if init fails
Thread-Topic: [PATCH] EDAC: i7300: disable error reporting if init fails
Thread-Index: AQHc1kFYidC707wW6EKLTD67qKo/LLX0fuVA
Date: Tue, 28 Apr 2026 14:05:27 +0000
Message-ID: <CY8PR11MB7134F6586570031E6A550B7989372@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260427122622.14981-1-tushar.tibude1000@gmail.com>
In-Reply-To: <20260427122622.14981-1-tushar.tibude1000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|SA1PR11MB6710:EE_
x-ms-office365-filtering-correlation-id: 5cf47c5a-3ab5-4a2a-3792-08dea52f332d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 4QqIxQSxCijAqaTkcDSytcdb7Y4X+0i7Q2uNtW4RcunqlGBdvx2tXAJ+sLZYnX5Bs+iQ1pSMYb3csyrT4zhHWygakcZIzSVvSgbex+/jRciCpEJv9vFEa8lZYBM/2AEWIWtqQh0CRxfUVQvDhAQBSXzI3Ib0vUF+a2YW48X4t+25EuB8B5JsuyLeZjyyQliCfNLGjHrUivvI6DUn/aInqmFSV+4I/zIflFm0+wbSP3K/1ewivZomUXG49uaXk0M2DLXrwRpxrvVUaURrF+CD4KtWi7Bq8M+GEVWsjt7ZiJHdaKCuQcDvp0ICBRqFfXsw1vkKwXmOoiGKIUxMe/bV/eba6IInJSDIGX7+K2nT0bQ4Kp3oJI3ZbBCkC0fjaUDaVcXWuNEnuzvD0r7d0/DK8OkdkyekkF5vHNNXcWiaupZ6XyEFM/zCYrL7CDyKfTKNYq34f2EOY3V1N8YZinPbmiSjEOxNZW6Kwc/z8/U/9btrpdzkMLgrDIkthflu/fmyWwy0lZlE7j28A1CUTeVsHQR+xewfRQxZvglcC0kieXKqo7jFPLCu+Qv3bDxajyrqRC38LxIJhfr5Abxw1VitI5ZpzMOvG4t/SGNAjNvSvsZWL21HPrnCek9yCdxUPC8mZUffCyUBvaHHof4axR0sefiMaXWW6sSQOghiudH13x5Tl85jGwPNYaSGcsvm4YFyMOR8c1t+mM45ECWmHRUbCDWxCsnmzQOH0TxGUeFJ7niC6s81CBqXWJuQUjJet1+2luTruAQrTbR8FcM/LUYE3gKRgsqh2SCql7wkWjXJRSU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z3dZQH9yglfvQMgJThdxCAcWPk4eZWKLSuRwEutGL2ERZ5B/a5iILqrVKbvM?=
 =?us-ascii?Q?Fv9rAsfvBmB+OW/ln2bm/v2kphqkuVGAR0/Xg6o2Rtm4g5Mzgjdxx2yEVCkg?=
 =?us-ascii?Q?3KBYuFlHJ68E4cC6GNP9a8VZLF10p9uDrJzvxUjw9OxVcKayIioNR4OrKngZ?=
 =?us-ascii?Q?IvY+bleBaNHkyUzMjrzHNCf6GaaqUq3jKrRB+TrF0AsOUJ7Parw/wCj0/U/f?=
 =?us-ascii?Q?fngZpxSnREJa5gMz2H7kiYCLe+ArFelSHdOldXorlMcnBQZAUQOLZMLAD26g?=
 =?us-ascii?Q?qnSWIcgOniN8mketGLnO+y2lwPfAWv+6Tce8BlZ3viT6cz6DskL7juHAhn7t?=
 =?us-ascii?Q?EYPUJnAMyd3QWlPjcfXEG+PA2o4fVa0Jnhj7hH6n4sc9OzZPwBM3Nj0/nzgk?=
 =?us-ascii?Q?kdYaLUkV7t357XKeUKQqLHb27q7o1gQoRvpaPgTDyMO8MhsO7XIlnNL+4gy6?=
 =?us-ascii?Q?FNDfevfuNl1FbsEw9iAbqWfl9UylWfiNrjGG5cZQSWKaifJmyQ7WsfHtTSFJ?=
 =?us-ascii?Q?6xpP0B9twC55JQ4WKYlIsFXdILhjh5jnwlbGznpj4yk+MOE+ja2cSfjMrhhu?=
 =?us-ascii?Q?PD/qzCNgoqGB/8jbx73bBEBpO+e7n5uIP+93rDamY9aJYBlfEKLW2fWxcp/v?=
 =?us-ascii?Q?PXfY6F+Z0Vj3EWzum275uV4qysJQEzPQoSdhJACnhU7odvHiyO1Aaq1Ea5Ok?=
 =?us-ascii?Q?A1LHkQ2jLpxaBTmBNPoDbfnVwsvtZ5S1cVOiFng47MM+MVrVhJOkDHGV8X/N?=
 =?us-ascii?Q?ce+VfZ2LmQyoqjfcNSq8DfQQyo1L5fh1OKjuuq9I6nvRTnsZB+MzvRNx3Gb9?=
 =?us-ascii?Q?ImqdP996ovyHBQFSpxiUCEZTU5zbW77zFBrdZD9ZHHDGHU+/FMLkwftzyOw+?=
 =?us-ascii?Q?ZhKxzca0T8X2SPCrr1zOXUnd0Gb1kzEFi5aSCEC4cZ2s/L6BVM4ge4KK3TH0?=
 =?us-ascii?Q?brggGQOxLu1i9pwZXfYL8GoPD8WUX3zyp5Hsomb1NZIOZPBBxjQ+KYXGZ4OP?=
 =?us-ascii?Q?Uznofx6IAhbm26F/zkptmcm93ktmUPW4W+ck/MwzFy8kW7dYvZ0ef0ZNHPxX?=
 =?us-ascii?Q?r8mxow1+GYpDlY+wNO12M+EV8TUq2cnzMnuSExC0WpYKCam6Wg0SFK5gi7Q0?=
 =?us-ascii?Q?c3vPC3Ada+ztLV0iEjxHqETAy/9Rf3tThHFDswv8xeO5rEAdLRd+h/JzKujc?=
 =?us-ascii?Q?yjkzmy0B+kmww8iNofXyJ+Ccq20aMI6+Z5WFqouTyFSXapLV6llWS2T+rKAl?=
 =?us-ascii?Q?Bl2di1YD0MT2roZYJ2WZMpkckz5heYwwYsaMp0otVnksh9XiO2b6K1i7Ppdw?=
 =?us-ascii?Q?jzUL10BdMJqbEVlEmIXnjOlq9eotkPfCpzQz9jAyH51iWBBSG560rZmEiug2?=
 =?us-ascii?Q?lzWuwvne3AO0Edae+SqRoK1Z6NretV9HCxr0jQ9fb3BtzhGurd3cPBAv0PEG?=
 =?us-ascii?Q?nEspiWk0PV0AH9KfX+Kg3sQpkkuZMHJmPRJhpIASpYpHo6e7na7X3WB0A8mg?=
 =?us-ascii?Q?3st13+xHLhJQVDqlKSoGuNuO9fDAdOlpVMrr6FumRTw7OjTtKFZva8KytmqS?=
 =?us-ascii?Q?jvabd91oPwI1tFml9uUS+XkeFXJTuGa/v42P7izf9Aa23XQbjdvxPAYkozfv?=
 =?us-ascii?Q?CgW9W+JiwJcramQLDF1Q/BzYpj6tfdX/orwHHvniFhHjToViUKPAXSi2PYTE?=
 =?us-ascii?Q?xOSfVUIeikDhnJ7z7uJdOAJ0QgswSzMFjE148VMJkI9CcGjb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tkzv5UON82izkuanJ+OhZyROEM5ejiLgufRRLOabocJI+vht61sH5RgIypRRPUj2s7+3rVjZ4FkX/Gjq6chQDLzp1WumN8AEJAt75c9ZrJTW0SErVpa/59Yl/WJ6hawF4OLo4aIk0dTIVAF4JfnRgsM8N5WBxGn0rf6SIzlby6uX58L7tsQTBa/4RBe+gninXGSIbgsCspKI3NLMwgq4JcK17j7SReHgTijkKeb7YwidgsLawQtA0TfNCxCFT/UK3EDcKQ/Um8qV6ktYk5mPvEWJ3BE7jRlLZqGOljoF8CVHdD3UOykHYoevphd/8GoO00ZsCbQgL+tPCDepVrDbiA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf47c5a-3ab5-4a2a-3792-08dea52f332d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 14:05:27.3716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3yQWKtWkxLjy2qPYFjSPeJuw/jfgpdhZbwvlkLLNR70jjL2wwPcsmdhmwppTiKJBuklMo9e9U5Hviy9qEH2ovw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6710
X-OriginatorOrg: intel.com

> From: Tushar Tibude <tushar.tibude1000@gmail.com>
> Sent: Monday, April 27, 2026 8:26 PM
> To: mchehab@kernel.org; bp@alien8.de; Luck, Tony <tony.luck@intel.com>;
> linux-edac@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Tushar Tibude <tushar.tibude1000@gmail.com>
> Subject: [PATCH] EDAC: i7300: disable error reporting if init fails
>=20
> If error reporting is enabled during initialization but initialization fa=
ils
> immediately after, error reporting is left enabled in the mask register e=
ven
> after exit.
>=20
> Create the i7300_disable_error_reporting() function to disable error repo=
rting
> bits in the mask register EMASK_FBD. Call it at initialization failure, b=
efore call
> to i7300_put_devices() for cleanup.
>=20
> This ensures clean hardware handling by disabling any unused error report=
ing
> bits before exiting.
>=20
> Signed-off-by: Tushar Tibude <tushar.tibude1000@gmail.com>
> ---
>  drivers/edac/i7300_edac.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/edac/i7300_edac.c b/drivers/edac/i7300_edac.c index
> 69068f8d0..989cf53e9 100644
> --- a/drivers/edac/i7300_edac.c
> +++ b/drivers/edac/i7300_edac.c
> @@ -570,6 +570,27 @@ static void i7300_enable_error_reporting(struct
> mem_ctl_info *mci)
>  			       EMASK_FBD, fbd_error_mask);
>  }
>=20
> +/**
> + * i7300_disable_error_reporting() - Disable the memory reporting logic =
at
> the
> + *				     hardware
> + * @mci: struct mem_ctl_info pointer
> + */
> +static void i7300_disable_error_reporting(struct mem_ctl_info *mci) {
> +	struct i7300_pvt *pvt =3D mci->pvt_info;
> +	u32 fbd_error_mask;
> +
> +	/* Read the FBD Error Mask Register */
> +	pci_read_config_dword(pvt->pci_dev_16_1_fsb_addr_map,
> +			      EMASK_FBD, &fbd_error_mask);
> +
> +	/* Disable by writing '1' */
> +	fbd_error_mask |=3D EMASK_FBD_ERR_MASK;
> +
> +	pci_write_config_dword(pvt->pci_dev_16_1_fsb_addr_map,
> +			       EMASK_FBD, fbd_error_mask);
> +}
> +

i7300_enable_error_reporting() and i7300_disable_error_reporting() have ver=
y
similar implementations. Would it make sense to combine them into a single =
helper,=20
e.g. i7300_enable_error_reporting(mci, bool enable), to reduce code duplica=
tion?

'enable' is true to enable error reporting and false to disable error repor=
ting.

>  /************************************************
>   * i7300 Functions related to memory enumberation
>   ************************************************/
> @@ -1025,6 +1046,7 @@ static int i7300_init_one(struct pci_dev *pdev, con=
st
> struct pci_device_id *id)
>  	struct edac_mc_layer layers[3];
>  	struct i7300_pvt *pvt;
>  	int rc;
> +	bool enabled_error_reporting;
>=20
>  	/* wake up device */
>  	rc =3D pci_enable_device(pdev);
> @@ -1084,20 +1106,22 @@ static int i7300_init_one(struct pci_dev *pdev,
> const struct pci_device_id *id)
>=20
>  	/* initialize the MC control structure 'csrows' table
>  	 * with the mapping and control information */
> +	enabled_error_reporting =3D false;

Move this flag setting to

>  	if (i7300_get_mc_regs(mci)) {
>  		edac_dbg(0, "MC: Setting mci->edac_cap to
> EDAC_FLAG_NONE because i7300_init_csrows() returned nonzero value\n");
>  		mci->edac_cap =3D EDAC_FLAG_NONE;	/* no csrows found */

here.

>  	} else {
>  		edac_dbg(1, "MC: Enable error reporting now\n");
>  		i7300_enable_error_reporting(mci);
> +		enabled_error_reporting =3D true;
>  	}
>=20
>  	/* add this new MC control structure to EDAC's list of MCs */
>  	if (edac_mc_add_mc(mci)) {
>  		edac_dbg(0, "MC: failed edac_mc_add_mc()\n");
> -		/* FIXME: perhaps some code should go here that disables
> error
> -		 * reporting if we just enabled it
> -		 */
> +		/* Disable error reporting if we just enabled it */
> +		if (enabled_error_reporting)
> +			i7300_disable_error_reporting(mci);
>  		goto fail1;
>  	}
>=20
> --
> 2.43.0
>=20

Need to disable error reporting in i7300_remove_one()?
Enabling it during initialization and disabling it during teardown ensures =
proper pairing.

Thanks!
-Qiuxu
