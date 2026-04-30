Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738C2436344;
	Thu, 30 Apr 2026 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561194; cv=fail; b=NtPiumPo9xEBJ0c4G2EuHn63venaLDB3i8WrUMyQrVV4NmqE4XwnOXk9SL3lWu9j1kYlHgxgMjNh034jmQNGs9KBJcStwh7YzsV25aIT5F8Yk12wcJJEXciPUS+4TMkrQ0H0ga9R7YYAwlmE6eWUffuGzeRPQLWNR/8fkcJf8xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561194; c=relaxed/simple;
	bh=HmTaSKTzjNlSjfKTsFbqRhHS21am4w8oYISPskwG61Y=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PWrgyCR9ePHAFfM4MErsUnAF6hCyJBfhvI/9b72PwCLgGAAKghMMRe8uj3zoS1+jb8sTPM3CfvYsPN75dlRsltYWtg5yAP0LbPfZF02pkqTyCGFuWLeJvkomdUJN13ZRpq+k9iwwHhpriDAp4m8AC2Y+Y+OjmDkK7fyV/tPp4V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkJB7gVo; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkJB7gVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777561193; x=1809097193;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HmTaSKTzjNlSjfKTsFbqRhHS21am4w8oYISPskwG61Y=;
  b=ZkJB7gVoudhiBtw8y6OLO8iEHaE/ufX4m1lzxNJn630ihNp7oLeQU/nu
   sx3GcL3BorSNBCFDdbsWO3nzfa5XxwfU4kbWS035C6jwaicjNnbis5inb
   3wn0b5t0pZYooxRV08dntqsJ7LbAEhsPlNPcAcZofb5vw3QmDl3KfER24
   GWsrVPk9Ps6DeMcH1BdCw4pAugb7Ot93fz9U04nBuouPPYernmg9JW58Z
   fLKTYqdyKata2ne9YOqnP5P8p4f/oA8XmjfobVwDgeFuBgE0zTeDLvMjJ
   4xC6JZkc2eks+zcJkHdng15MeLP5sM9yIWMteRywHupSIqHjaCztxF6xv
   A==;
X-CSE-ConnectionGUID: oJAysbQtQI67nIG8ZJmD8g==
X-CSE-MsgGUID: SOfjEffJRmSXQWRZ2pD1+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="66045772"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="66045772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 07:59:52 -0700
X-CSE-ConnectionGUID: Db9C3bbuQGGnUBAuCto/Bw==
X-CSE-MsgGUID: H0EC0qHbR1mm0ezQzZYaBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="228100390"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 07:59:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 07:59:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 07:59:51 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 07:59:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKGHpH0b59GppSU+Vv3dO259jzyAv3VI5ViA2SVx+ia9lyOO4HH7c9LEqNJZLjuaYvCsV+hCRAqLha7W+KfzhLrHVlCFqwoZnCYEMVi6lXdsNch7U2l79MKERTQsdGAsNRnYywyd7+iMgvZaAXh9rSygGBUYJ0K/LsaG3GY2Hj9v5LQrHZkGaBn432XBTLd0GZU4Z1oQiSo6m91mz/RpYRCB23zVfYa8071jjq2IGdL3TmAnnBgDIERVrqMVOonGQwGBla+EIK8PSq3RWj13qB9ILZFaUBj+e/e+RV2ZygPs9ubKvhmV37oBbfqTdEbEzoY3pSBTnB/+LBzDY9waQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNyeZDii5BETILMmQFO5oYWlPbKGzHF6vfQTWuBOIGU=;
 b=DtK7NboJWN4w1SmhIvtdp5W3ZIR3IoEFBE7lpmyMtalBMSQAobw50EOWTjETl3QyV3dxj6hvCin2+H7NgdujqU/whT+IE4PAgiTuvXsyOHkhClPXaxbYwmkonUI/AFtoLzEzyiJQDBXZPVMw/IZHKRhQz7L8Eh+rEVMkKMkVFP71lxV/N3BKQYM0rCQfP1JQFBuK/ZFGMC3O0IC2UinCFcnvxpsn/gVTH9Rgayuj0NxADxKy+1T0K6e1Kv/bapgCt54QuU+duD4BnNcaG/AL7iDRXJvsyA5aIPmMmASd6pDu98Oyn1LyHqac6Gxi0go7qYwDqTuJy1XHrZDpr/jBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Thu, 30 Apr
 2026 14:59:48 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 14:59:48 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Borislav Petkov <bp@alien8.de>,
	"Luck, Tony" <tony.luck@intel.com>, Doug Thompson
	<dougthompson@xmission.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] EDAC/sysfs: Fix error handling in
 edac_device_create_instance()
Thread-Topic: [PATCH] EDAC/sysfs: Fix error handling in
 edac_device_create_instance()
Thread-Index: AQHc2Jkvge4PLvwGC0mCdq4SHoagWbX3rDTg
Date: Thu, 30 Apr 2026 14:59:48 +0000
Message-ID: <CY8PR11MB7134859F653851C59277F12689352@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260430120019.464049-1-lgs201920130244@gmail.com>
In-Reply-To: <20260430120019.464049-1-lgs201920130244@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|DM4PR11MB5277:EE_
x-ms-office365-filtering-correlation-id: 613d7db2-3b58-4e6c-6a35-08dea6c91f90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: Z0Eyaj9xBeeUBp+XQYqPTQB6+/FNyJEgN0XqWJLYAW3RbnL8rrCaTm/DaYhf4CA616yNNqf7YBRKQAI3v82CjmOVTkrWZS0SHY0WQdzevJtQrQS3QsKt+NAJL9LWScbY5dk1FvjL2fhjFaCWRn1orGXHwmuOEH/WuCU+gPj5hUpDyLM2uvTp68Z5f68xeh3IdY0QIAuo9AwIpf2bAM2l5UI/e5RAVa/CvSQKxPgEaPBP7jrXrbWGjDHdWRHzZi6EqO6xI6zM524C3vvN5D5yOOHTf0EAyo8qG7dd4bpqkZP1bDK+cGcGYh1TMk6hnLfVYzVpZJxcpY6A8huGgADGXaYGDL1loiyh/SmazPRzwmPEA6IdTB5LZeTN+Z2619AydirVOW7DoJG8FWjHMVd08JmMr7CgJGAFJtonItRUXkMqZgzNgS+fpx1k6vJjxitRtmzArBIACBH5H+6hXlsTlLwCQfiOD8BLo0I6CvHqXfEWnlaGuKWUIJusdr7mqXQvQFwwOAJmMHAwN+BSp61vHUyUpwdzlEVXyZypDjx0rwN16tC5YZtWpHT1oWEEtKwPyAblXIJqsG/sZ1Gdui4gBf5Oy3cHY5YjJKQY5HO5vyKnIvegmmhGUYBGG+nqPOQmr+r79ddwkypF+5ftw2fBNbkuGiN0BgmwxA1PLwQoM/IO5SdSkY71kurf29FQ8oj6YhXFKKd3MOwrxUPm1tDHFaUcfyd3j/Q4tSkOBIaydqe1AwGX6uKG1vY+q7mbHgDM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Gttz/+5KSTQ22gIV7xbxLUG9nC0/06KPXLdvAtMpIn9vcxB7g9bC9rBRG2GN?=
 =?us-ascii?Q?Jtwwe310aGHQ+4WUY35FO9u65FHEvb0TTMoKjv8A3pIXtjiRPAwfm5yGZfFR?=
 =?us-ascii?Q?zVkLaDiRtR1QYbAW6/LD4PritJRboHBvr3AwXBduciCddECPxVeKIOWFJjjv?=
 =?us-ascii?Q?ciAijblR0mXXcBXWeqn2+3LSjEQUHgwrSw0fMaveRxJsQ95tWgU0XH/YYFDG?=
 =?us-ascii?Q?+WxaZEgTWzUtgwvlWfTa5jwxuF+NODmreBocmJjfl5SRne1fwptD8d3kqpyA?=
 =?us-ascii?Q?LmYEY+SCmLLxxk/FChvVMSe3IaWFesJHXCCDWv0u5WPDnFwnEATeHLc97bim?=
 =?us-ascii?Q?srrpavGKCCk1vUzcaQfsQotz1PF7cGmd7+bFlgbpD4hfEArMqEMgJ6JBVKqD?=
 =?us-ascii?Q?T15hUyG8wi7aGeCxP8BMgo8TebbdSQb+GLpmSr3q6WKvvCtOU9XZocMGrSWf?=
 =?us-ascii?Q?XoA5Rat8jK71DGdo4H98NfAb7PNQi2nChEWyVagx8hzJzPR5KNE28XjhX33f?=
 =?us-ascii?Q?J6kNi6fLOzX2bQtSQROShxITwzSomhCEpST1kwsUSLwil7hyYYN6OBJhSKRo?=
 =?us-ascii?Q?vhFQqHiwMkolZE6xiAt8MQi1BJO43mNsakYKYo3NNUmermqlO8tm69Fhj/3y?=
 =?us-ascii?Q?PlD79fYlZdlvhbxNiXJfVj8NqljTJomwYkYZm3V92ktTQs1bm87GkSa9sZQl?=
 =?us-ascii?Q?AmVbnJFUkMGxArqRGXPIKkR9pQuU4QjJF/tyYhjnysI2J/M5Fm39qm0zwdAk?=
 =?us-ascii?Q?Fbr1pUmZsL4Xc0hG7EOJAv6GLvze5Rfpv5jllcbnpgkLP1Zhlig8f50o5voY?=
 =?us-ascii?Q?JX21xpec9XRYn/qg34Fa9r6oLQJNZnINzknz/blaMDPmeQJy/rU88eFf53bb?=
 =?us-ascii?Q?2llP8JcbExEQjt+Inee4p2OOGE+3zLBCVHowg3uBflEtQfdUt4V9fiLbK52w?=
 =?us-ascii?Q?0MHIMbD+T/xKNOUVBv0v/rBk14Ktj5sNd1p3TzZ8DMls40+CTPOGr3/VPbw7?=
 =?us-ascii?Q?EcxhXL9csH3orr93ZENoUIeH0vwpjinl4wpdv0nd6nHMVgF5SvRpJMHowciq?=
 =?us-ascii?Q?3SqFR2l/yOTCjObLm8id3XZ+J8wTBL1c1XH87MWypt2s3se5tUR93hhVn0D4?=
 =?us-ascii?Q?/IotfrZh6jgs8kRDA0cl289HGZZOoCSV5e8KPUvwbDvqMwfyL+sy2Gz9F2Bv?=
 =?us-ascii?Q?+uckLQQDI1pbU0en84UX4PiXx68zHEq3TvrZDu2wLDtSc/ujINWBcR91cXZr?=
 =?us-ascii?Q?NWjXqYpjQAxRPqFqfcxWm0Pv83uIjRnxTZk9Nj+z08Rjuw/uiVaeJPkjsoGm?=
 =?us-ascii?Q?z0ikqV9nvG4XQ8fGfbsHqjLZtbr/L02y5folPCG5WtEJLNSNsbzX5fq/b2dG?=
 =?us-ascii?Q?veFf7FviPvIRrSFiVKJT/ZWMqfu7vwN/cjfVgZdMEwY85cViIY/xKxT9Afxu?=
 =?us-ascii?Q?s34gzLmlqckyHNclFddsCO4XBeNb8NfRO3nL+rO0ieXZabwxFaI+oQxD8NAu?=
 =?us-ascii?Q?4EQ/cRr+ugCWEjGZX9isyMCPN++1g3QizavIdMR74IplRzM3wYYrllOikJaG?=
 =?us-ascii?Q?wziVlZRKNZ10doF93aeRt9f6s1/iNsoE16o58ComXM2ueHHUQvB63Txw0DV0?=
 =?us-ascii?Q?3UfQ8uv2+OoFdE7y8JBHSex6BfzjdB6qyP7q0ANogPV0nUtstoKhjjV9byFC?=
 =?us-ascii?Q?mbDe6SqwGaO2lqnQ1vJaa6dLx2MZCILA35Ta/k2ixSay3z1S51B5quzl+8xo?=
 =?us-ascii?Q?lIEId/TK4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rctMwNxQ3GBl58CNkkiWkZ1fD79dVIXvAJ1qxKtsBDP/gJehcMi7fqrmP02fovG76QmmMaHHJPf/oT9zNXGHQPOoo00KrcSv4abA/G0PEOV21oSWHpK820+43UPKNfwffdbxIORAJXQtOLuu+FoZOPos87QTyiEsA/ZZtVh84cIRyuZt6q73YFFBta4U9ql9Ihl0+oNQFPgI6Yq4WMUtIX2qLof8y6ZQVRbARWgFU43Q1FJ8dU0lCUJ7GWjG+BX/pbW10kscInrKAFs6efm0vhqHNKTKLZCpbQQtHBydrt/hpy1ebulWOBEdutmBJKjPcddAV6GuzN8fa/6UGcPpFg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613d7db2-3b58-4e6c-6a35-08dea6c91f90
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 14:59:48.0802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 20oLNFr8RtQV20sY3ys9helX5dNZtVEXgTX7+Y3KFl3khyH3I6HFcFHNUGP6IeU36fbbi9UAWI0O1LC9TOqPWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
X-OriginatorOrg: intel.com

Hi Guangshuo,

> From: Guangshuo Li <lgs201920130244@gmail.com>
> Sent: Thursday, April 30, 2026 8:00 PM
> To: Borislav Petkov <bp@alien8.de>; Luck, Tony <tony.luck@intel.com>; Dou=
g
> Thompson <dougthompson@xmission.com>; Greg Kroah-Hartman
> <gregkh@suse.de>; linux-edac@vger.kernel.org; linux-kernel@vger.kernel.or=
g
> Cc: Guangshuo Li <lgs201920130244@gmail.com>
> Subject: [PATCH] EDAC/sysfs: Fix error handling in
> edac_device_create_instance()
>=20
> Once kobject_init_and_add() failed, we should call kobject_put() to
> decrement the reference count of the initialized kobject. Or it could cau=
se a
> reference count leak.
>=20
> The release callback of the instance kobject drops the reference of the m=
ain
> kobject, so replace kobject_put(main_kobj) with kobject_put(&instance-
> >kobj).
>=20
> As comment of kobject_init_and_add() says, if this function returns an er=
ror,
> kobject_put() must be called to properly clean up the memory associated
> with the object.
>=20
> This issue was found by a static analysis tool I am developing.
>=20

You may run:=20

   grep -rn "kobject_init_and_add" drivers/edac/=20

and see there are several other places that need the same fix, like [1], [2=
] etc.
=20
Could you please address all of them in your previous patch [3] instead of =
fixing only part of them?

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/edac/edac_device_sysfs.c#n519
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/edac/edac_pci_sysfs.c#n175
...
[3] https://lore.kernel.org/all/20260428160828.377129-1-lgs201920130244@gma=
il.com/

Thanks!
-Qiuxu
