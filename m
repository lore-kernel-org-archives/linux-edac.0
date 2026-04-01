Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D1F313E1D;
	Wed,  1 Apr 2026 02:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009480; cv=fail; b=iOMTMgEppF4yPR4YVuJOnqv9k1s/I+hd6EojjTKBw4gQLLysy4jHqu3+zKFs0hj2E/1bzQgFX6/kYffq8j1Q5ADZAw8NB+PZ/vaCKz5fHI7EG+bym0cv/b8T+Gkop9RWplmZ/DV2NTfjnpvJAaWphCsggnup+kWv4CB0X63GAnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009480; c=relaxed/simple;
	bh=9hT2c4jgA1AG966kBjNWVPyfhjZ+GxX2YaGWJc2I2LA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BhLw9uUAplqEq5xEoJTxsv9bAnkY1D2zVikk2bsAAaqreTxS/JOU4WXGeUkIHRVd/pjZSu52dmowVS5vLaJ0TPTkL/8UD4CbkPZ0eKSwGKA4gjt95QY5hD8JWNXqufEUWPro1/xqqB4GQbIbsSTbrzJDdPbyeS3W2I4QeyAujdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfVLmVXK; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfVLmVXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775009476; x=1806545476;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9hT2c4jgA1AG966kBjNWVPyfhjZ+GxX2YaGWJc2I2LA=;
  b=EfVLmVXKZcx3+4STe5KIKR6hH79D2D5YSJh3bn613ljoEGezTb/p5Gbi
   HnEQK5mAk1P9On8zWFI77aavm1d47HUH2gJj3n3732R9tsmvvr3mUlrDU
   Nk5X9obBK8Svf7NUSDjewVVpfLpzf5byqfUMHIA8205IrlYmBLh3034RW
   ruZ/JMCV+R8+MPEiZBRJrlFc1HhTVxBjl6D5hvoyxNoShr3cz5n12aB27
   zruN55zU2HwXfFlcok2zC/zpewr9CirNRlMNEFP+uDsefYeZztNEhVVDm
   6SNMm0hLPeMccN0+Qei/u6On8yLYtuOfa50SjKdjd86xXCsFhIsRN0zEU
   g==;
X-CSE-ConnectionGUID: fwCeSxo3RZWEeRYfsJGJHg==
X-CSE-MsgGUID: f9vEL/WtTg2lOpJEWLpuQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79643128"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79643128"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 19:11:15 -0700
X-CSE-ConnectionGUID: F2B45BzOQtKtBoTMvy+wjQ==
X-CSE-MsgGUID: nPrNlmP2TXmZRVVZSEDJ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="264468356"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 19:11:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 19:11:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 19:11:15 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 19:11:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJpTpTo5ozL879vDccvcy9MHEm7PicAUp98WZ3f4RD3SCFCKTSDX7rGfKtXwAOj19y8oKzmjzZ6Kpzg+giSsI5l6lhKh/rC+RP8/1ILfo5WgFCD69PbwRyS0NJ9oT88pkz/sSrtS+OFLq3V1LYR7aiXKsBQA9ROvQnRzZRmalhFliSCyWwFRKMpvFcqwzzmROqE1Idskkx7ASLptQBvoVqKHoEHk7MJvkUpmydGgMPYjaIOyCpoc2XdTyyzSaDqTNiV/KjcvVQx1azl4N8hbaz6zsHch0MctCQLF3Nz8oZoiPfwA6tsStwd0362sBQ41GDadxmf1MXGAqzCaEuUoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODU6QnL79SiVIbsDrvF0yFQWZM+b4Zel+f+722vc4a0=;
 b=YfusJYqDcUnJuWuaRUeE/pF4rCs0aJfRNiNOyNhbXLN0EeVqjSVNIUJlZfo5A6TPOUC0V+kUJEpHg1RvsSBZZJCHkcPbmtxMb8EvXVWQHiSipNvOloAreJLbizZGx9eLoyj3i56OVWz4Sa3ivPL1kGUZpx98HDSehU1n71YUvCPs44KZA1uNRM9MK76k133eRMUSvTjW5uKJrIlfocFq1qhr4z9C9AoMwVZAQWSpJ2I46bDtTHXJIwcV1RLzNK2JtniTsX9sSc6p1ojdwVn/Zzkwx9RzUBCwR87RSBmTX6bhJXFJW0GaflGYhvbj2gCPCAOi3pgbBvVqk1+Z2LI0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by IA3PR11MB9039.namprd11.prod.outlook.com (2603:10b6:208:570::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 02:11:11 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 02:11:11 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Borislav Petkov <bp@kernel.org>, linux-edac <linux-edac@vger.kernel.org>
CC: "Luck, Tony" <tony.luck@intel.com>, LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>, "stable@kernel.org"
	<stable@kernel.org>
Subject: RE: [PATCH] EDAC/mc: Fix error path ordering in edac_mc_alloc()
Thread-Topic: [PATCH] EDAC/mc: Fix error path ordering in edac_mc_alloc()
Thread-Index: AQHcwQjLzPt6rXxH/EmUNdvh2ulUjLXJdxyQ
Date: Wed, 1 Apr 2026 02:11:11 +0000
Message-ID: <CY8PR11MB71341D742BC9240D803458A48950A@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260331121623.4871-1-bp@kernel.org>
In-Reply-To: <20260331121623.4871-1-bp@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|IA3PR11MB9039:EE_
x-ms-office365-filtering-correlation-id: 246134a2-0580-4c9a-9245-08de8f93f1fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: VLD8Elz0zA2Ba45/XeQrD76rMeSqhT2KHgUQ8WspizsH9mwuCRJMreLSefZfGMwvA9Vj5oyXs3t0q1b/P706IS8OMQs1+uyM92TYlUcvHdvJtwykodyrCEbsWqnH3/o4EHeVfMy9k1ogjE8U4LtgbsC8Wv+jk/HWRcYP5mZfVPlUD+qHgLufxam0BB9euzbrA/5RGn6YdWYxL2GvUDzHHCQMWmoBuoFnSljmWdqvRd2zRFrpcppjWOifeG0zu/4i325p+9iqby4RhFB50rBZDXE2gJFbsj8pRjKV+G0IpAq6r0EGj22uDI+wMdHmCo/uKYOLJGMjCGUpMpGRjGG5AMNaU6EJplA515TRLV7LFxKH2tbF/nVfQRRMiTSI55TJJDkS9aLtatmPSNMX85xQFtaDv0UV8sFr/4OLAthcHUFcLolS5hmGVOXMSG/kzPUHB2RypujZBGAPeESmt0yhNI7dQhnC1BqgkxSEiD/S87RAhFhoi30BUmVXj9o3F73YNPuBfPx0KeduxuHpSx3RQN4ebstKutnut98vifUeW32nnv7McMofzzl1Ov+jUnqINn2K3fiYBzzMn8TxWoRLDal8hOkWweYd3cvdYJ5P8youLZ1TzRUJUNTRfIGr1CVkvhSZ4tRAOeBGk13kFRCbUhKW1feq/bTxJPkA4LuTeQqIRTwv+BS8Jh8dS34AAqEdgMeEscNwOWFd59nQ2t/zXL6gAAk+qN047Q2W0N4oukIXxFMcKBFVShKOpxU491ApQdwH/Aw2MNj34FUK5klIZAXWrZunXtyDPnxFP/OlQ84=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iYH8K+KniQ1YxiuxXoZMXJikn63zqCRwNgr6UDEGXamQjB7eOIm+n47xRoi1?=
 =?us-ascii?Q?WIrIEC1RNjS+eylE/RPTipSJ4jU12CXdpbltzrGXHTzRzK8okCdtoDuIDuDO?=
 =?us-ascii?Q?1Qta6oUoIU1d/UAOBqPWrrFVpUIA0l7RkwE5x6zkzSyq8FedBFkskNDMZnd3?=
 =?us-ascii?Q?ApgWj+0VZO7ruUOx3SMdbesBgANug8a/0YkV3RdlJZ15mYlzJR6OokWRi6Lp?=
 =?us-ascii?Q?qFRxK3estHPHxQs2AYmj9JNMhuGxARW7WGMntf1XZRLxxKwuH7ThBPqDGH2S?=
 =?us-ascii?Q?gf/hVz8mjsYpWiJ8lNbw9NjJe0HobtpwQN8nP2Onq+5i3rSfppfh7En7mRz1?=
 =?us-ascii?Q?gy1VhsfDrNCGdHrQ+zJQiResTeS0cTzkuWhC+lvydLaHiOEvoSlzAcZpn2gT?=
 =?us-ascii?Q?aaxGPTKGKOvIsjur1WAxm9eVk4joUhbVh+OPV+OCjLk/cZxQWAODRu302zbs?=
 =?us-ascii?Q?asAwkzJVjmBfLMEx4P+fbwgNtxebc5V0EUm8rKWOPMxIfqJOxXleEEfhUwgn?=
 =?us-ascii?Q?MxqUOVyRkGcqHcJ55oT8QEuu9VGqcnLDIq2W8yAMGUwwTJiml1NrdpTUqMHZ?=
 =?us-ascii?Q?uJlgTEXZnzKbLSzrFknWzZf/gEBM1CBD4uRnKkL/iWbQAAwy8MVi76mUBwW3?=
 =?us-ascii?Q?vJh8Kc0Jb33lQ0I+skDxxQEX1IUd2dUUEziOMFhr+z5WxF7sO6t53EpYQgs3?=
 =?us-ascii?Q?UaCWAXxyNnQZfiU7+xvjM4k6AMHMHMgmKuUlVNRyCRYQ3bzcmbQef+D+FUWR?=
 =?us-ascii?Q?Z0M7OK3bjU/RyHwAisQEU15KI1nyRQxZ2KsieG+mvxHBtmeR0RdzFhPR7BRG?=
 =?us-ascii?Q?bRxeve6gegpkJtwoWBw/pgevfRhvjR4vohPmHL12HqIU9ip57Fd8cifiSXWo?=
 =?us-ascii?Q?M2rzXwtLtwdzSJJCX2uRUri7SwbwEdDc2aqK6+rmhCyc+bPOERabQKW5ONf5?=
 =?us-ascii?Q?HZ6GmH3wGjoRM3XbUVTDZJ22TUUxT13IjN3GHSic4jvndmfyK6aMzy2WbYHI?=
 =?us-ascii?Q?xw4T6bTbF564VV212ZetoJSZU2HieG/zZPyJh/fXabm/ic2UGUu3UfIRwUb9?=
 =?us-ascii?Q?oKfMRZoyA032sC+VbKhSdGCEjrMsTqUcAIh7OTf+x3rNDjwWhPfI4vmKznXu?=
 =?us-ascii?Q?dCKaCU5jOHAdwUahVh4jJuPFyJ+OT2OkdBRmwSD2HBx1vQAHO9o0+lPhJXpg?=
 =?us-ascii?Q?UN8ZuJEbMjOOh3/IMSOoJb9BL1JjNwUGaMOvesRtvQR+dbW74dPticpAuO/D?=
 =?us-ascii?Q?W8ZUV2jkpqiCp5qgExt84qAup3eKK1TJ1xb/dEI7Zoi9UshU3T1AEwWsi4ps?=
 =?us-ascii?Q?neMft7qfD0wjxBKICZGgsX0kaC9aMpBQh+TOatidW1WFql0V3HXu+fqfi8gF?=
 =?us-ascii?Q?xEvQ1TqKHhB1DmZF4yjxIG0vOjCHkEkbE3CBQIQd+rmwGddqR+3VZYAu81FT?=
 =?us-ascii?Q?euEIIm+uAaQmeiO7xscgXQamGvz+9n2rmD3TYWr2z0C8Tt9hxdScXgbIBwJJ?=
 =?us-ascii?Q?uF2XEcUcSIqUQJrNMVqy3YlSywYbqMCQSRTEiDI8X6g3IH4xYvFeYIJyKLmU?=
 =?us-ascii?Q?0MeDejdEml5Wr+/EUX/Foticwwc6c500E5c00WQmnm343vTRr9vd9r5C80J5?=
 =?us-ascii?Q?9TFkID9z0kYoH1SzKy/Ln/nBHfHM7kUW7K/7yFS9wjlbcKkr0AaqalOCsYZZ?=
 =?us-ascii?Q?UU8L+sU21YypihVAbL2i3WB1vTepwYvHjrsNGcPW6GgKdl3237jRvrSy8pfC?=
 =?us-ascii?Q?oP3xIAHQmw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YR2P+JOr5/EtgsAUv+0Kti2Liz3Zb5dQM0p2h153Ex8kjIhGwHDUTVvqjdZOb/cX78/VagEIKFArALFDQyDF/Cekx8lzju+kJ9X9XFNvyc8AoVxMN+ZOmOxf6XV0b/6GYbLMKOAzNwOTDlCULcFpd3KvmcRBOMUSPBW+PVhGPKnqMlyVcfsjM2nk+3DL21uEh8YzuK9E5lLRu3rMUUznVCAwWoEzrTJJykFkaHbueqD96HHT/gyCRXsmi130xyYBBDPNQbMwiB/CyfAuuQNYoGqUshs0jzsmCnDHCufibthYDZjTq2O4aojZCoPINEePvrzbQ2dnUY9eteblyRaW6w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246134a2-0580-4c9a-9245-08de8f93f1fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 02:11:11.5583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4ifsJ4DYU7K1KGLtQViqG+seVBx2f85k5XEYCe6yn3eP5mrD79O3o9n1B7x/mqvOakNak6CYf/wFEUE3dRKnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9039
X-OriginatorOrg: intel.com


> From: Borislav Petkov <bp@kernel.org>
> [...]
> Subject: [PATCH] EDAC/mc: Fix error path ordering in edac_mc_alloc()
>=20
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
>=20
> When the mci->pvt_info allocation in edac_mc_alloc() fails, the error pat=
h will
> call put_device() which will end up calling the device's release function=
.
>=20
> However, the init ordering is wrong such that device_initialize() happens
> *after* the failed allocation and thus the device itself and the release =
function
> pointer are not initialized yet when they're called:
>=20
>   MCE: In-kernel MCE decoding enabled.
>   ------------[ cut here ]------------
>   kobject: '(null)': is not initialized, yet kobject_put() is being calle=
d.
>   WARNING: lib/kobject.c:734 at kobject_put, CPU#22: systemd-udevd
>   CPU: 22 UID: 0 PID: 538 Comm: systemd-udevd Not tainted 7.0.0-rc1+ #2
> PREEMPT(full)
>   RIP: 0010:kobject_put
>   Call Trace:
>    <TASK>
>    edac_mc_alloc+0xbe/0xe0 [edac_core]
>    amd64_edac_init+0x7a4/0xff0 [amd64_edac]
>    ? __pfx_amd64_edac_init+0x10/0x10 [amd64_edac]
>    do_one_initcall
>    ...
>=20
> Reorder the calling sequence such that the device is initialized and thus=
 the
> release function pointer is properly set before it can be used.
>=20
> This was found by Claude while reviewing another EDAC patch.
>=20
> Fixes: 0bbb265f7089 ("EDAC/mc: Get rid of silly one-shot struct allocatio=
n in
> edac_mc_alloc()")
> Reported-by: Claude Code:claude-opus-4.5
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> Cc: <stable@kernel.org>

LGTM. Thanks.

  Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

[...]


