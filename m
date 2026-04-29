Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E11135836A;
	Wed, 29 Apr 2026 03:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777432135; cv=fail; b=R3QdKYxouJOFRGxCW/q0eKLtWBaZVLSJAIr7kvhdaGnPgoNP+dr2YiGzFzbqCh4cwvSri3ZpdfjzMYqZ82nWUIdtk95StDx3hdV2Cukuu4eGJ7XTtYRQaOEMlX3IuJCJ1GM7BOsNjbI0XTUm7ZDLAxSRYR6KyTir/m5XfjNwp5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777432135; c=relaxed/simple;
	bh=vTf+LDSA3Cjtmojtth0z7EAiyDKtSi1mA6XFWy/gSKs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ye8BYCOU77Ohye8Pah16DaBedyXxLo/za7viw3daYiQ5s+x3CVs3555sIVr+lnaf803JvtYavvjY/VJq37kuBNqxaFAkGOfdqvXEfI42ChtSizHWJ2x+nRW9OzTlAa8q7Bcn0j2FOLNPRIXGUp1J856EfP/tFJKoOQfOdDRwUVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PVJTSPwI; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVJTSPwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777432134; x=1808968134;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=vTf+LDSA3Cjtmojtth0z7EAiyDKtSi1mA6XFWy/gSKs=;
  b=PVJTSPwIBOR67IXaKeKc9CAIlzqMKAVsa2eLAMwdmkvl1jgERwu4oTHh
   SZLs9xuKPgO8sCKUAqF5pLZzxtTSZb4Itp2bopDIU8HOhFdhsDeSg12is
   jCZj30brqYDtD6MzvtiA8xkc32+WXJmGzYRx8TzMY1rmwPcFcdyO9ZELs
   rItTOUgenzOI9m4Zgpk0I+bcUJ4RMDfw0GihNRUWvSLoYVVKXeneltH+r
   5I6m5Ehe3lT+0Q4FGXnuOZ4/iyWavbHSpePoZzGAuayvcHGQvn9KpbuVW
   dAy3ZXuiW5AOpuZxi4qUTkNtGHtJKVXF7Q7IklUPxoOBSuFUvotLvdDSy
   Q==;
X-CSE-ConnectionGUID: ynLTHvdXTfG4PjXdYxrMEA==
X-CSE-MsgGUID: xIxJnVs+TW2lo+g1BDyknA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="81960876"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="81960876"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 20:08:53 -0700
X-CSE-ConnectionGUID: 7FFApSpWTFCkoePytRi+fg==
X-CSE-MsgGUID: SW1PB2RXQjiufFmFyaoEzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="234114755"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 20:08:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 20:08:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 20:08:52 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 20:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIN81BGkjuVunIZ0uHAt/wNfTBUpBt9u8c7nmPN8itxtojVZW5mEOV5yFW/hXddoc715hvaUjt8WzNDaSmhQzcJlmWJ0jAjyFatkS0RtDXyM1gm5yqQBVclBk9FRFzlzK/KBhgZ3wo3ynmKDHPrXcEO71zc/K9pPFrzmZnKdGzYVGZd81jErpKcNRR9/0GpntgrnGDfwEakAYjL59RwzcyyUgFR14HIsb0lYx3Syt/fCsGVb7YPbVRA7yMhddYHkLkTXbpmS8KfX2VShkpSWzGwlvTFsPHnHxHdnCYM/qEbZyD856pl7rtDIVExAo6iuEcCix0labMc2DKsO6Q1IaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukH5sY9j6NXYfH9deXDuj+If45h4hRgANs1weo+0sp4=;
 b=D4MRTPGeqS5/z5IFsZA+FSpyXQ0+I2NbD8Bve9c0GSaZXYhlK1GRnWv02ZOfx8c/UijpW7c/MtB1hezJTbkBkeKcmOyekgtg5f9YUmolm1fnR37eSCHDGk4+y4Wqh8NV57o2oLZvIz6k3pucKgsweZf76i3SCty4Onq6RN0njqTNr2eVInuIcnsNarYzj3LMDd5ew9GLsBvlYmP6ye11FAKfRN2vgasAe45mKh3k3nIPFhSnB6tSZVqzLsOW5DaCkrOznC19EWSDhTz0adq3E/6aQexJSlOZZR3F0tzJHEV/9SikLUo2qOgZ5HdKYGhUw9olIlCApBQfGTseqYsokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 03:08:48 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 03:08:48 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Tushar Tibude <tushar.tibude1000@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "Luck, Tony"
	<tony.luck@intel.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] EDAC: i7300: disable error reporting if init fails and
 refactor helper
Thread-Topic: [PATCH v2] EDAC: i7300: disable error reporting if init fails
 and refactor helper
Thread-Index: AQHc11ff5JC6HMehkUayXY7igkBMfLX1Woyg
Date: Wed, 29 Apr 2026 03:08:48 +0000
Message-ID: <CY8PR11MB713407D5E4CB378072E5F2B489342@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260428214116.19230-1-tushar.tibude1000@gmail.com>
In-Reply-To: <20260428214116.19230-1-tushar.tibude1000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|MW5PR11MB5882:EE_
x-ms-office365-filtering-correlation-id: e1492ba9-c3dc-45ad-1777-08dea59ca1c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: /s6JObXzW9/EnHVaUGhfTnPIzLpEr8I0WkjNkhbCTFgXAniYWKLxPwZXVgZ98sK7k92/5S0KAySDsv/Eb3Z2U94UTdZA1DsXo5oKKrxpzCa6JtTqT5bi4GGBxOxtUD+whoIX9Aeg3E4gAtA2nMtKFMNLKkv1uZDcZQLK9YEdKqTSYJZDVyZ9G2p9XznbDaZVScqsMTkEEcDP4VwR1p+qcY/Euu2B+xWNCaAmEvMsTHP5WJsxyXDG1l7Lu0K4KIEffCLfOGWE73N79SFIzon7xIeDy5swIEDeHl8l5SyoEhGpet5lLELJTVzqtOAvS1BmB9Y6pE41UVE1nhqs/4WDntdrzPE/DvEkJMah053b/lt/LFWJOrmOq1zyhIIe5FkrcTI88BVcqVbStmaJ3dPFwAe0Q3LlAYRvwG5ORX6BbOe+Bc+cJsqHW/fkQtzq72SN9V4LFj6WqAuAkXABhRMKNTIPHYovdcGgLgZ76nspSyyiGMpltugWbHN6CDbc4TfiOL1NHeN+4lOCx5E+hfPk3tsS7UCbeQYyk67e/b4fuCQiighZEdEUEntbYNWoFMmV+Hf7w9WJmb9TyUmT82ZrEXBnoWMgABZBpGWCzkq7zJOUN3okOvLxz94PNYrtU1J3dP/6eMQRxGcxhxKVNKGcvslyDyamU6y2cLV3myXSckj+HfeLQ6B6S2cD/eNlaf+yLQv12iHLeGfuiISYBdg/E8bG7vqa6ujFD7/MlatbI8fPjW80x8bO19D2B2SwKVAdfNi+lBDq5YInKOMnEAQlJEZRJFHzpy7nhLBcSWyA95M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c+lcRc40S4oHaxuuGdWfSRnp6ht/RW/lesodBI+yzVm9qGopr3nGirOiyI/a?=
 =?us-ascii?Q?pGRk8zcDqWoegeUMM8yVMlew+99lT418t4XB0NT/o9Ak/muzM/4eYamomiNx?=
 =?us-ascii?Q?8hLDQ8XgoKXb/2dRW0GSoUu6JZHONijW++WIYY6NWWuJjYJb4V59WE1gIJwF?=
 =?us-ascii?Q?NegaHPSUTCioQvw6Qxe0dVLq2lMorgxpF/nI1zB51ldzCbEw+TjGhBoKF3mC?=
 =?us-ascii?Q?uaXsVtPnSfuNixL4s0OBJgx683fA1VUn0V/szxPS4fRKZjiP9uMUjhPAmiGQ?=
 =?us-ascii?Q?6xRnc/K/4Gy7570sCsaZqpyCXS0Twd8jRxNxGgtZ1ZLZ+13xlXmlt/tEi4CZ?=
 =?us-ascii?Q?j/5KB/mX+vx2pDfl+g+tzZWIUhBLs1GXCoS9wpZLiQXNTDNrT9Sn8rtCIkVB?=
 =?us-ascii?Q?8Bod17uw+qJFNGoHsKxxL/8YAUfCG/Q81fp2gE043z0JFzKduj039jcpHpBO?=
 =?us-ascii?Q?ClL1GLXL0gIBdLN4TYkTw4qk3yHcoaC9sA5IwZIMjBRI9mM75fhbCEkxgrl3?=
 =?us-ascii?Q?aPHydpZ/J5e3/lQ9GXAYynzoHNCnCqQSIUkkITqgJIhkgu292mUyzPFkWehA?=
 =?us-ascii?Q?qb5LfzByDToQd+EG5Jd4EdWU18ESA+/OKil/3CRnR2yvJafS672+PmJO2INf?=
 =?us-ascii?Q?4YvB8Vx5WuV/fnhfqFh1iwbfLHHFaSOr7Bzo0753RHmdu/qNzCri9SvflYHl?=
 =?us-ascii?Q?hfjweh0Bgpbefhc3vFodWyusoPHIU+e+zos1KHRfpdNDQd5JaW+h5mNI0p1D?=
 =?us-ascii?Q?ANF9ExRuReuMKWob8zc6fRW8EPZBQHGx39TLFB3d+Xj2wvsxBnV5mbJ7JGxg?=
 =?us-ascii?Q?peNRct6XXu0YZIeD9z01jUucOhdl2QbK/kFfs1Mn+EbDEWvbo6EvZJWNYLR7?=
 =?us-ascii?Q?ti91mxTG6OQb1GGuiNNaNayg2SgMqVujx81YBLVFoEqZyxNRyruz00Ja+Cgi?=
 =?us-ascii?Q?UFTl56oloa7z7xViOn6MrNmr3qK+nA+cRnJtXTAA/8q8qir9uNqKyEGLV7E1?=
 =?us-ascii?Q?1sRKqMyQZS9IY8sMnRWm54e/Gud85lexrjE/MCH2ijhqEo4/EWaEGxo3970s?=
 =?us-ascii?Q?RrH+Hx0wJQd4kA4AfsceNHC5KiozkGbHoxAOFlWYNNfqT86YnB7SMRCBxvX3?=
 =?us-ascii?Q?UbpnA2DHxW0xP/mW7EU13OmPs5uwRDVrjdP5dAosQom0lkcnzF20KgzZcyu5?=
 =?us-ascii?Q?5PpS0pKgGVu09BZKDTBt7xUVk6UEwnm+aW6QogKb4xdp74+RZ4J0T//BNufQ?=
 =?us-ascii?Q?bVIjSWIjzSOZDv71a1CNBNNUcbGi4+E8ZKY44IzuBpyUqiBjRGHLYBYopjB0?=
 =?us-ascii?Q?c7IkkP7CFH+JXg3/RBGMdJe9wUDL9rNl2zqpQuGr0egtGiIYY1oXEKOsGEcX?=
 =?us-ascii?Q?5X6M+vGNTo/jwL8NP6rCX+6AhnJ4wrJtoEyej97Dl6aUle1QxelV5gUvgkot?=
 =?us-ascii?Q?bteaRnuTSNBqh6ZjDQnv/5xyISTok3NR43pndMi5sARhsqn9O7GammUq83kY?=
 =?us-ascii?Q?SXS87hYpTfyjpXIwgfE0oX+1gCSd4cmN1OQOGGcCBMxXVdPmqlePHiO92aSW?=
 =?us-ascii?Q?SFbhbRjqWuBOujPSBWVanQ1NJqtPtRRyYgimNCdoTfp+TLj88eHh1mYY76Ks?=
 =?us-ascii?Q?4OUb6N3LdR3CdIFCI6WLfCkSl7PaplyrQ/9wboC/cH8DtmqXiH3Vk2iNKnlw?=
 =?us-ascii?Q?WrFXTQ5F0Mdraec/NzxwCKGuRLJaDQtVTXI84cAkC6JHro2KNzs1ghwj4VJC?=
 =?us-ascii?Q?iPxQToRAWQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nhJ6eO+IzdgNcW4qUhqscwnCc+MyPh2WIcGk7zltKjA3OffXOM5I54nxjQzCpDjpJwQoqnBhR2HMJMAFHExrqU4VV/4zX9+L42/DEnzDZRysKNytUtW+rEiGVqfBDdNsLXdkSy6i1ED70b9QxAJnWXM9ZaSKBxujTMY6wgUZemhv0gvJTLxZDewF8XhhkyulKupbLV6RLi75eyLP7GOrSHmDq0/+cbf58wLi5mlUwbNriYbonK+c5PuPWQZZ+gcjl8zv57nNjVNnumSxz+FaNZP0oq3e1E/1He/AohFY3C1O57CICRPMYyqnhjUnVE5n5l94UZU/wtRQoDC9dQpBcg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1492ba9-c3dc-45ad-1777-08dea59ca1c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 03:08:48.0791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 47qKXqCJTreVy+29l1I4/+5zHUYn5hw/ZdrDgZJ4ZncnQvgOBg8Kp8auTcbLDnllmqtfG2uq5/1NC9tWPQSWoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
X-OriginatorOrg: intel.com

> From: Tushar Tibude <tushar.tibude1000@gmail.com>
> [...]
> @@ -1147,6 +1154,8 @@ static void i7300_remove_one(struct pci_dev
> *pdev)
>=20
>  	tmp =3D ((struct i7300_pvt *)mci->pvt_info)->tmp_prt_buffer;
>=20
> +	/* Disable error reporting before unregistering device */
> +	i7300_set_error_reporting(mci, false);

Do we need to disable error reporting conditionally when unloading the driv=
er?

	if (enabled_error_reporting)
		i7300_set_error_reporting(mci, false);

>  	/* retrieve references to resources, and free those resources */
>  	i7300_put_devices(mci);
>=20
> --
> 2.43.0

