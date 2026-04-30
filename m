Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A94439EF3F;
	Thu, 30 Apr 2026 22:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777588819; cv=fail; b=BEoYB7oxvNGYZOgJDy7keirSxh6N8ThTUMK9aBpvGWOiyZKN5SPRmZiFZlmxoOPOBshpnep/JTLoAHYj5mbioX3m3pvoZyY7Y/Y5kbpZDp7kVVPzGM89Ibm+5S65cGbWa0KfnMjv7dnQoSfTji6auqH+6RpEPNfxRYE2Q59+UzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777588819; c=relaxed/simple;
	bh=uGnto4it8YGMd1uFaqrycfTI/WZkxAQVwbQAUzp2H3U=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iTPJyU8Mfbc2/1iIWkx8gYN2aZnhliPY+30YkA7u/LgMItQWygyH+W8s+C/qscNsBOllFClNMjcMLVhwM3ZoTZNa3Tb7ZDzcUt+g9Ij1qCNBLJTB+tZ40zJDI6cUwdYP6O4saU99vxD1sGpRMx5pnXfVsNFv5Fw+IPndWkcv2nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+ezCH1C; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+ezCH1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777588818; x=1809124818;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=uGnto4it8YGMd1uFaqrycfTI/WZkxAQVwbQAUzp2H3U=;
  b=Z+ezCH1CETJ+6wuCfHFAdeyI0bv5oCvr9jypvZ5xp6J6DiAmwTdGYec4
   CODP4vT93o2e1AjopCXLiXk6DHZLyVQCRxZTTaUqSDq3E1oaBVacNb8jJ
   fAPs2dwpobKu5JeQkiZNoQlIvEoBYKOyvAKByLATdONDifNhA7TO+RByC
   SUgJQdH0xInu0PSykkM9w49gSOcRVpgcSzbIOOU8PWx1G6XP4kEW5R2d3
   WhH53AC7ZNmqwPSLKaLFYZnojoJ4+Y8tkzvJdrYxSzlkXWVS2whIuQuFa
   20ra0XWRrhVnjUljT4iPVHf4TQNetp4u/srmlTmjk7+ILRg3wyxVml6tv
   w==;
X-CSE-ConnectionGUID: M3S12CzLSbWq7sFi4cDjVQ==
X-CSE-MsgGUID: /eYhfVK9RtO0am9BGQdzFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="104011869"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="104011869"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 15:40:17 -0700
X-CSE-ConnectionGUID: JXZABJloQ2SQSZgYYGlvqQ==
X-CSE-MsgGUID: +GQrGD+dSgivQuNV4DUgag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="258299085"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 15:40:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 15:40:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 15:40:16 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 15:40:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aa4UKrtY7HGchnTn4MpvhXie2NGdbAMgkq621SAdmpSym7mVsOgQswbJaPGNAHnhTNAL73VNHL9I5dtxcTawzLUZxnla9R5HFENlS0WnaOLYRyKPo8B1rZQIb90gE7athGDUCmUL+aOUBGLUeWl/SDRhhtCpWs7YLZB1f0voizMY/ZS3WTMLBAY2MsigtsgF0NR4p1pu1xWBUoIFzki+6DZdYx3Hp2Ff8jdKQgsyo5qgtTscNiXdUZPDDahfcV3hzW3JDgdiYLwVZA+qwIGlHc+SZFtb8Pe8gJvEi5KQfdcRUg2omtxYZZOxxrgg3hHeAGrdw4L0YIXftNXepUK2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukwAPidST2Wsfzm5tAQ0RJiInUwEabWJ5dHIQHiHBgw=;
 b=MZXCoaYOcrkMFLmLWGd1Sq8JN6mkdWpfQAibLal3eH85vJspDieiJCDDR9XyzDqKKuqTVKHXs0qcHfT66y+9tlP9m92KZPmz382KS3+QYJrr3OYwBsKcLBcY2WsJphV14E/TArwwYDJzOQuJMmx17rXqesL78MkuE/zYH60YY9SYFaNZl2Yy/hzVmJMCSlY/3J3yUU4d2JvF6O+5RJQyfwILxOsVOBn7Wl0vptcqje1JjwUXyoqi3dUrsyzbnzQQKcoa2TMogDNIPOEvTBVPpDJxxpvWrQcb1N6gWM6xp5FmGI2OASp3bIg2QiLeYIo3Q9Iho8n7wzAxbPQyqC1AiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Thu, 30 Apr
 2026 22:40:10 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 22:40:10 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, Tushar Tibude
	<tushar.tibude1000@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"bp@alien8.de" <bp@alien8.de>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] EDAC: fix error reporting handling during init for
Thread-Topic: [PATCH 0/3] EDAC: fix error reporting handling during init for
Thread-Index: AQHc2H2xXlT53azPMkqhkR2K5s3mvLX3p5eAgACK5YA=
Date: Thu, 30 Apr 2026 22:40:10 +0000
Message-ID: <SJ1PR11MB6083FC71A73FC3C2D3AF566DFC352@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260430084223.9298-1-tushar.tibude1000@gmail.com>
 <CY8PR11MB71348FFB986C5620FACA9D0A89352@CY8PR11MB7134.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB71348FFB986C5620FACA9D0A89352@CY8PR11MB7134.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CYYPR11MB8331:EE_
x-ms-office365-filtering-correlation-id: 536c7cc6-bab4-4426-9723-08dea7096f96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: gImN8fYzc0sItEJyd1FHOKhXDlZxfCTpbXxJeCKKqgpNN+ZWFTk8Lw9usOevgKWtNrII+aKHRxI1DnvtxD3Jhd/9W6yYBJIq+ccw3emUrMQxunG6qRzF4r9jMIL7+JRafQH0+w1W3B2FiOqlwOn3dqI+45DPUXkrDkLjSXR5SalW7IeuWAH0YNCH8qKnWoT//9/i4rWOm1laS2o27ivtfpRzynkX5zla4XLUwlMA9+iYsSJIIpSsup070Ss7KODIMV9Hg7t/nVqswpbyBJkHWVk6C+NM8WqfHqq4GTPrl5aUKXWF0SSDpSD78vig0f6gwLd2eBQqPkLP78IEWH7N28QNqL4ddF/8NLbID7DMZmTdlzDmxa43622IUoi9z2z8VGicUaOnabekuWzkQNIfAq0qPztMmHle7r5NRoLjyaAkKZDMAimllXwFt410nN6cofzWGEdM+nMK3XZvqtnffEWhCPHcCWsz8Ch2SLVkn3EfqxGTjxf0EKBVoDtIX4zn78dqdrTJW4lfPR408E9itXscn2Bpiwyv4BW7EPMZbdWyA3etrV51XZD10gozu01S4WfxYqTCmJiP3IhCysOAqR1oFgc5536WzxAw8jPcHfHRmx0G9LTRTL3zcqbc94c3BYZ0IB5xBBw2bXIAl7/ep6tbnAlSgzAbJ3+AstgosIm8uZSjhbr+7cb95+vUQL5H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ndpSe6EQjvBiSyP3mgJfPP/S7y40lJkM9IZxlw/Vr0hTuOQGK73VLOTXTWCK?=
 =?us-ascii?Q?NU/7/4geVOu6al5krrRcZYvRTQ2uEtV6mHVWcQYeQE971GlpaIMUCsTndRqC?=
 =?us-ascii?Q?95YM0Y2zwD0td0YoD6TQKDbDuvM4sXlI9NCzqPCT2BekhsZHLCUEF5dseK0S?=
 =?us-ascii?Q?edqTJpJg+Lx5U7GcC38ZoUq39PhXQ9/2tHbBs5lBb7G10kz/w5Xc28VKtmdD?=
 =?us-ascii?Q?wjtqhJg9XYPcJX4fmRiDGWc0zrkwiMhHP9s7T25rNOvwHZaZCc8D+6lGDAcF?=
 =?us-ascii?Q?IYwD8RjlmfAXAxQd9CXAbrVNo9o5t9IGOSF284uhj0p0EDMnwqgHQUauL+1G?=
 =?us-ascii?Q?Q+XSTbQjKT4DKKW+LvRwT6XWox+D3dBvO6A5lIiWDbHaU5y+0eiVSMhXZrK4?=
 =?us-ascii?Q?iYdPmXRfNisPpk13N95Ry+JcedyvArr116UtvUAxqNKaU5CKqcJgKr6UQL3b?=
 =?us-ascii?Q?2wHwPsH9zxx0MDjNliDXuFIQKJUK7kICs17UlsIhy/0f8H65+jzF6Wwt2fNw?=
 =?us-ascii?Q?90DKsWeeIXaqQxpKCpkb6SBjMUwWNrE10U7Eax2JwIKsPZoaWTyULRerNRLU?=
 =?us-ascii?Q?T7GgsStbonJ4jXGdKJ5EmmUAYWm881AFWcKlwugVjZ/07lOrEDqhkO2nxeyO?=
 =?us-ascii?Q?uQa3xbr4g7cTCVxwxaBMSCx1waLfJR3Xw19/tv1FcgYE8EBkcADEOVEb+o2B?=
 =?us-ascii?Q?gDyYLoce1+Z+6EZAAk1JLCVZ7WctjzBOqTVsGFXduWT5u6jVgALAJxS21kLF?=
 =?us-ascii?Q?+KXA+Qt1m5FI8WiKvcrrwbpGV9C9hssFmst3tuHBZoT4IbUS9xIHAmqCwYfb?=
 =?us-ascii?Q?Fno7AYmUXxYl8+E0zbrxVxgRke1wuet23FNwveiIA1EWYpeCjbKIrVSQhV7W?=
 =?us-ascii?Q?dVaDjO368xy6bIu9p97ZEh618+WUl9siwcwvfHZIRvH38sJkyEfUtU9clrr/?=
 =?us-ascii?Q?d/hjjdPXo40O7hNsBxRE3MceHzmG3Rcq/NFu9ZsU0hJ9wHV0Y2zNrZXkISX3?=
 =?us-ascii?Q?6y8jMHvsTSGh75IJr9y/esE2La+P74cqsF53LocOIzwsODuJjN4UAsjNus4n?=
 =?us-ascii?Q?yxg2HvcL0yRlR3+IQQuPWBvLGMu+S8dkM51eAMMptqtanmANUhCbYcrPwr8A?=
 =?us-ascii?Q?joEOBkb+3RceuS1jQkUmDEz08F7D/3vEndlRXD9drcS/H0Hk5Io2KSCXZQRK?=
 =?us-ascii?Q?UVB8mH3h7OZmMjwchcUyMwcutu0nAiFqDLoLWu+GLNIwVWUkopDsHnMeZ9Fo?=
 =?us-ascii?Q?78spE63b6SZ4Cv+pneEe5KOkCczuHpkP7R1Q/wnPcxXNUHd4qyivw3C7eHZy?=
 =?us-ascii?Q?NXAmlciJFLCzZkisCQIf/7rFx24ghT6Zo4mqz6vKWe8v9WbaAHusgbCfAFYL?=
 =?us-ascii?Q?y2GNnW5UasFjRNszu0ViMrgBzV4025N7oPLwIJJ2yKa71/7OFzDv6jsJhJAg?=
 =?us-ascii?Q?rDtZBNnB3opyIA/0lAvVqiQgSCaTAhqwt7NNwDNtTXVJ/q7aTiBiLzTEq3Z2?=
 =?us-ascii?Q?ZqdpppcqAvVj7Ad5PGZbV2m5FW+QcVyht8xEswwtZsJ3UPE3ZOa4eZsoMAGX?=
 =?us-ascii?Q?g2rX1uCPeAcgDP5scjnpgYayw8SuStsPl/qnYIy00xxT2psmfbvtslJl+Ggg?=
 =?us-ascii?Q?b4uKVKDx5rmQFxT/q9TQ/9CBhglHbVcebBcTntVw1tqX+13xV3PV8s74HJaM?=
 =?us-ascii?Q?qPdIzOfpHn0H+TZ5xwT9xcm7mtVvO9MjmuuOquS5eNrmyp4I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sp3SYC0e6rZWSTt7IGgTuzEFKOEsME+5AZqb44znE9ZEJkMz1FkBOuAfF7SqRhPJVwGyBMgE6j4mI5jk42dScAgBc5o1u8xHYZr8JtQjfyFf/tusnor44QJuJQWZ1z5vFaEBlLwVocFt7lXhnUgc6tuGr4zy+K4tm89WTUjzhy+Nd9OhFqwNqxV1i9xRT3dX8SRdS2JO5FCEk4GF22R5ygW2KUsDeizUULxyO9twqKd1cOxXZcbjEMXDF7KKEYJXZ7oPaWPLGHP4dTfgpUX4O9FNEzahDFyOa//+t/sSOwvRvQQFzqpyI5Zd3zqG8bq2QVxaGxDYiKlgNyyfSg1kDw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536c7cc6-bab4-4426-9723-08dea7096f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 22:40:10.1242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qvV9yFURCp9LkNgH6Ea8oK7oHeYdDfVNngtAblqtii6dcwCVex41KKTrOCOIyX/qiU17T3klAmiTEChYSsBQyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
X-OriginatorOrg: intel.com

> Since this addresses the same issue with the same simple fix in the same =
subsystem,
> IMHO it's better to combine this series and the missing fix for driver [1=
] with your
> previous fix [2] into a single patch, rather than having 5 separate patch=
es.
>
> But please wait for comments from @Luck, Tony and @Borislav Petkov (AMD) =
on whether
> to use a single patch or multiple patches.
>
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/drivers/edac/i7300_edac.c#n1092
> [2] https://lore.kernel.org/all/20260429094806.25097-1-tushar.tibude1000@=
gmail.com/

If the patch was only 5 lines of diff, bundling them all in one patch would=
 be good. But each
is around 30+ lines:

   drivers/edac/i7300_edac.c | 33 ++++++++++++++++++++++++---------

which would make the combined patch a bit bigger than I like.

I'll look at the individual patches and if they are OK I'll pick them up se=
parately.

-Tony
