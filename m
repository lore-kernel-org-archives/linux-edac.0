Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797C2273816;
	Sat,  2 May 2026 11:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777722015; cv=fail; b=gu5UBz7jml7gwIxS5ZXobXQOLjC1Q25IRD8uO8FeHNXOkqlvjwojxzSZv0qDvYfhnfNXCLsvK6/30wFllyO+/z8HW0HvKh+uFt75yi5KPcW3KWKkGf/EBWn60Hdz/Igihtpye7/qLzoiYmjd1GApowBTJZqB+8hCxp7AJ5I6ABY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777722015; c=relaxed/simple;
	bh=khHyXb8ADkQ4SF3pkpb1b0laSVMHwqaWFaWkxFRhusU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NaOnhcmRA8XHSh7LuqrldH5gjyX38jTASCpyfE6xhD+KxKvf9+8h1EZWfkaC/SG+jNJiHjsFOCMghR4/cQcGq/3NLaO4iafDvDBXiYW/UFPrlKPHx5DEN1f5SlD3o2hC2rQBOLSg0uF88P2SC6Ar0LZJ9J6jJdaRi4EF45TfJks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKZWGE7o; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKZWGE7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777722013; x=1809258013;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=khHyXb8ADkQ4SF3pkpb1b0laSVMHwqaWFaWkxFRhusU=;
  b=hKZWGE7oN0lrRWWpxSNjOhT8eFoSR5TQc0nIv+Rtcm8GbiiQnPQqqkEw
   Gxveyz5g0lkl8WATKRebEl+5yeYG5n4NkrKi9k2wG39Hai/tx4tPtun9u
   Bn6MjXf12d1Z4hrIIxA0mutBKSzwDIAnuHPxc+BzC1NcdX+t4JmzhLfCq
   czou3P7dUh+pKTLOXL7E5TyRsdo3jQ2QwVk++642Rcxh8+ZmjGhgG3iqY
   oflLVeZjnGEvMUxBT45Tz4wtZIs+yeIrLLI4ygHjOvXEIYQBqO4FAHGT/
   tJ5GaHgVDe3mM5XpD6IKvDXcs6D+cSqJIBbpA9Down/IiJ9YnfkeLswka
   Q==;
X-CSE-ConnectionGUID: IxyE5oYgTFe1Tvk+dQyIuQ==
X-CSE-MsgGUID: C0FyL83CSuiAT8Lhk1HwxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="82530407"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="82530407"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 04:40:12 -0700
X-CSE-ConnectionGUID: RZpN6WrxTfaVkV8wOgSIHA==
X-CSE-MsgGUID: PqoEL8VZTrS3CUhGjBMkaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="239411746"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 04:40:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 2 May 2026 04:40:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 2 May 2026 04:40:11 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 2 May 2026 04:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBklIfaXPOGKIf6Vsjbdy4i4wbeduzeEYX6sxYKWzmKPoC7Uqn5sCYZShf6AI8EhH/PBFin2ZaUYiFop+nhqHnYVawJtsKle2R5iMVAYlwwuU9v0ObWFVxz7uad3rJLQ/4EeNj8Y5J1podOMLoZNlP/qZg2su+h60w0ePPBQXfz5OiOAOWqAsHNT4SnhgGMw375IlgZqhQnksGYvYYxHlcU2qr1RxcKZagBPuwdLGf/ZaSL9XE8imjwQqF14WQLKBf99eIH20akuxDPwClQTnquWyrGO3fDHAl8++QcKb/hNdEnnSlROGlrUgRUJPUzG58goX9McNgQ6GZF7u9QWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9EnarL1Yv3vJBC2m8buF7/Jehva/XL1AT1C+aN68QY=;
 b=Vl5w+49pXmKaj2Sa6xBmAh8xbA/R3u+I41Zp+Ex/rdo8BkTv9gmjq6Q/B4g2QqKK0N+UYV/Ok0YToVZhyTqMowMQIYqbw0gM9+SIFjoBhQwFpM8NMfhMXqbq32ND7sUzUWgM+9nuNHeAXzkoovYioyhvM7FOuGc/CG2e3+TNZoTIdgI3TfljXw7lTizBiKUjSNwRTS1DL7ZeqFLKro2z3DCKM6gnTQ8Ms9P7RbnXIhu3VQzGKTvZWHIIIn082ZZTNZzD5LV26e8xqB445NYZ51DOpycvidsqjlL1PlAlVxFciHi+eHo3pxAlQxapDQ5Rs4zOQmSuBOs1/Xj00DrGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Sat, 2 May
 2026 11:40:07 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9870.022; Sat, 2 May 2026
 11:40:07 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Borislav Petkov <bp@alien8.de>,
	"Luck, Tony" <tony.luck@intel.com>, Qiushi Wu <wu000273@umn.edu>, "Doug
 Thompson" <dougthompson@xmission.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] EDAC/sysfs: Fix kobject cleanup after
 kobject_init_and_add() failure
Thread-Topic: [PATCH v3] EDAC/sysfs: Fix kobject cleanup after
 kobject_init_and_add() failure
Thread-Index: AQHc2gq/iol1iEhlDUO/jQomqJYK4LX6nItw
Date: Sat, 2 May 2026 11:40:07 +0000
Message-ID: <CY8PR11MB71348A123D8AE16EC80E9CEC89332@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260502080647.522511-1-lgs201920130244@gmail.com>
In-Reply-To: <20260502080647.522511-1-lgs201920130244@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|DS0PR11MB7788:EE_
x-ms-office365-filtering-correlation-id: e53269da-5d8e-48bd-4bc1-08dea83f8f7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: +3J3OeBtEnwqCGpLpvPtrcDU7fHyKGenwni3n4s8RvDt1IlcPH6EUP1+iYKmsEnDDZAlabRHJNzNlUMhvANpSkqROdLd4qMZou1ro8L7VqjjPb9+U6WQaSK/uRL9C1XVCEXm0n5zJ9P3M2a/gAn88WtdY55djaWehjHt1Y46RgZE8a+NGPrcjCLmO/Gk+/XVLU33m4B3+wrCFV8P20L+dfJnGYDhml2xjbXDEnB90H3dZdvnAI/YCsu0zWzUURb4dww7Bt62VivOtUE1Bc+xsXuBOZOlt2KfHvbZCEViBI5XhZcUs7IRY8HBsQQw76VxImKUHnvq14eQMwK1CYHXgxZ3+GsS76/JM6UmS615Dsqya+p1UC7g9E9Hk5JVLsFia7aBPtphHErdACmZNpIF9iaNPpE6IEQ3FiRSSBA6k+kSKe1+RpPPPjaJjbM4Dw1rJPv6PY7+WKbehaesJu5cycJAwRxcqw8ag49+i8YvMxYf4HBvIQUW1UwA+aONt88BLU39iv9gZs+y2ernzVVerwM5/e8jlu4IL9e8a6HXQA6UI/YQg78PbBz+rcECkvQYCjDRsq5kbPszUf4VJ6/Nla+qRR8ZfJ+JCKe8PYruecmvZ12P1fzz3cDD2hqJRB/Xc1JC6uN8dTn1j5XI6x+XW8elhN3wI4NLe00RdbPXFzKghL4yod7Ii80HbUuGPqRFF35jPFoAck+Nd32FnTNIllQIIoGd6GsKKpmH2fpjwNL8A6pgJR8zgwDi8YOp8DJM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yNTu58lXxKCLBqCfTqEjuxa+whLp1FpPZ7nOLUl0A+aQEpMxtmQ1P9TrOp91?=
 =?us-ascii?Q?/+rg1Z1qPCyp6w6gxm6eg+0ra43/oyLFqiTT9GXvbQ65juW5Bv7Mpw+O4Osp?=
 =?us-ascii?Q?ekK3UqVWxWpPZkpvZ87gZE4F1XaPCTm4yhdgxK2hvnggRzaZpgiJZvDqAE3x?=
 =?us-ascii?Q?Ur0+hEM5CfdFCPYZrYDD3UOJzJoPZASl/bp73OlKybF/1jYaUr48gkiscYA7?=
 =?us-ascii?Q?o9FGWinV5q3lyTfzFZtU6D/N6/5gpea64s7hGBnvtFTehJJM6WHomrlvepIt?=
 =?us-ascii?Q?+37mO6Refp0yJf/IP3j4Rqq+BgNAq9QLCYbtBzexR6RNCkHv1D7iu4x7Kk3w?=
 =?us-ascii?Q?ftl5KFXbZteWEvh8IS2EGUVPiAgKZzDRT3ODX3Zl37+31gB2UBr28QzR2691?=
 =?us-ascii?Q?XZYLl5v1gAW6Xg5lA4Y88ztd8+DQDghzhkZDREjNiIve6KndXpsX9UAme7hv?=
 =?us-ascii?Q?6R8f5syWSE1XE/LUSFqF+IwWXZ0vvNVME59Hx+GWFfTTkJ6Ze05e6e2kUz4e?=
 =?us-ascii?Q?d/8gkw9bwN3A/DMWJJmpJ3kgpXmQY0JCDmUCt1T9TJAuaWmMwfz0R5Yqi9Wf?=
 =?us-ascii?Q?0WdHU3S2ON+X7JrNLDJ+sEMUcY5a3HIqwUG/xpTS2kHZjfMtqrXmSNWc7UWP?=
 =?us-ascii?Q?bEeC06mIlWUir+0wnVcxc8B5xBsL3iqQLJ+6A0A9uEWa3ZujtKKxQ3Dnw51r?=
 =?us-ascii?Q?43SjumGHWsS6E1yTsZVaKNC2A15/Rw9uS5GIUkx+IFe36dJiDx5M+70skvlF?=
 =?us-ascii?Q?ShAbbFafDHalzabTIkKbq/WwLjpNZpfHEMmzYfoVumBdvuCnh7gUubO2hgbG?=
 =?us-ascii?Q?VjjA8mWH16xAlVqZXUJ4v2d6eUX7kXSWhGESH4IqBtZTAH+YBBSvWRiQqnt8?=
 =?us-ascii?Q?HY5/tCpXt/7UBQendm0266sJCBS66Uv4TnFDlM4P/ZqRhd3+0odDAYm1ylK1?=
 =?us-ascii?Q?y4Do2giFu0JymB3TuwCj9nz0j+VDlTDdpBE5kS342B7g7g2xJu8Q4A4oIclM?=
 =?us-ascii?Q?4aSFzWHyUWxm4Rjb00HynPjDXeprGDrkLFE9HDzkHZCv7U5XkY4B7ScJDdq1?=
 =?us-ascii?Q?vIANB3dDZc2GHGzqgVVXzmtaBSmjavcijmwZVSS52OYFoawWciyqC9kuaJg1?=
 =?us-ascii?Q?GjZ5X209HSG1UYPu0UdVLteqy2w1xUZk2/rSMdTnTybtQ++Ei5aqLSAkP2mA?=
 =?us-ascii?Q?opQuQzr75EMsHgqU2xIyFKK1qLyLdCbAIUEBVmX3emKhQE9rom+3clpWn5hu?=
 =?us-ascii?Q?l0xBKXw7L0nGnr/Qlb7WZ8YXlnqLKJORdYhUcYv60nB0Yll6fDStnVQBXw7/?=
 =?us-ascii?Q?35HHkA39YTUgoY2c6x8DAS5k/cHjwhw97ZWdH1ZJoTFt7C5OdPOn/wsaqa6I?=
 =?us-ascii?Q?lRuA2uWItbAXT2k2VvvkE2QGSslPCAQm418qlFlNKpY6VBTOksUq3XyapbFa?=
 =?us-ascii?Q?jboPtjvIsVqdb6b9grGbd91H8G+GwhPe6Vnxeo8SdCw5T19o6DVY8AsMDVC0?=
 =?us-ascii?Q?Vm6g2f+pUHJ0i4uc44ERTCNAfWymVvZTjkuVsOdkJjPdrf0o2d6C5PyldNJ6?=
 =?us-ascii?Q?hPNxKMJAGqa0kQCMsahq2K1xu+jrEybH6jIaPzL85AROnwVl8wh5wEM4ZcBH?=
 =?us-ascii?Q?AKm3ptjnr3Mwoi76f68VPtgyVXLS1TknQQW0XK6Rkn/uOv38kSldhCaKVeVW?=
 =?us-ascii?Q?aoZR+WMNAshYqhxSExh2zGbXhcPVp8jP0bHgcNda9LgEesqAk5jOcPyoANcI?=
 =?us-ascii?Q?z2BqBkJbBg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hZMWoFnc77tNgtiHvvxZhStfote//VqUWmKHIXiAc5mjOrnZ/oJx5DV4ESFNrI9kT8iO3AqNkMV0RAnt33rGKi0xZOVMIbjLgsmgt59A8KfVRgCxilKAEUpBPqHdHjYKx/i2UZFw0SHIp1G8P8fpWvZGsiNrzlarVs3TAWj2YEoNRIeYkAYfuiCPR0cN6T6VODJKoMLK3dNx8S7ms0Piytl9TqDhQu1XgyK6hYDT8fJNFlTQ9zNviF4mPspMAzPep/L7HxfDHP1l3pfetsAUdD03a2vDRM8o3nNoZ3Xhh6tEqeC1ZEU5GuPmcGmpkhoBJf9/XPSwbfCjNlhqLbOOQA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e53269da-5d8e-48bd-4bc1-08dea83f8f7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2026 11:40:07.6829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dI+W8gPGvNDj2aRemiCsvg32ZswrJB6LgYcb4IQP3vGDw9ybUuLKd1V96WIVrgVmo2onaRu4XzfPN8FbR+8ixw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
X-OriginatorOrg: intel.com

> From: Guangshuo Li <lgs201920130244@gmail.com>
> Sent: Saturday, May 2, 2026 4:07 PM
> To: Borislav Petkov <bp@alien8.de>; Luck, Tony <tony.luck@intel.com>;
> Qiushi Wu <wu000273@umn.edu>; Doug Thompson
> <dougthompson@xmission.com>; Greg Kroah-Hartman <gregkh@suse.de>;
> linux-edac@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Guangshuo Li <lgs201920130244@gmail.com>
> Subject: [PATCH v3] EDAC/sysfs: Fix kobject cleanup after
> kobject_init_and_add() failure
>=20
> If kobject_init_and_add() fails, the initialized kobject should be releas=
ed with
> kobject_put(). Otherwise the kobject may leak resources associated with i=
t.
>=20
> Some EDAC sysfs error paths currently drop the parent kobject reference
> directly after kobject_init_and_add() fails. However, the corresponding
> release callbacks of the child kobjects already drop those parent referen=
ces.
> Call kobject_put() on the initialized child kobject instead, so the relea=
se
> callbacks can unwind the references properly.
>=20
> In edac_device_register_sysfs_main_kobj(), kobject_put() may call
> edac_device_ctrl_master_release(), which drops the module reference and
> frees the edac_device_ctl_info object. The error path then calls
> module_put(edac_dev->owner). This dereferences edac_dev after it may
> have been freed, causing a possible use-after-free, and also drops the mo=
dule
> reference twice.
>=20
> Track whether kobject_init_and_add() has actually been called. If it has,=
 rely
> on the kobject release callback to drop the module reference; otherwise, =
drop
> the module reference directly.
>=20
> Also handle the EDAC PCI top-level kobject setup carefully: if
> kobject_init_and_add() was called and failed, use kobject_put(); if it wa=
s
> never called, free the allocated kobject directly.
>=20
> These issues were found by a static analysis tool I am developing.
>=20
> Fixes: 17ed808ad2431 ("EDAC: Fix reference count leaks")
> Fixes: b2ed215a3338 ("Kobject: change drivers/edac to use
> kobject_init_and_add")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> v2:
>   - Move kobj_initialized assignment to the kobject_init_and_add() call
>     site so it records whether the kobject has actually been initialized.
> v3:
>   - Fix similar kobject_init_and_add() error paths under drivers/edac/.
>   - Fold in the previous edac_device_create_instance() cleanup fix.
>   - Put the initialized child kobject instead of the parent kobject.
>   - Avoid calling kobject_put() on edac_pci_top_main_kobj if
>     kobject_init_and_add() was not called.
>=20

LGTM. Thanks.

  Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
