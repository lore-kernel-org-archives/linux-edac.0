Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BA63D8119;
	Thu, 30 Jul 2026 22:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785449403; cv=fail; b=haY3lXXuNELK6Z/4ePw9cUd1cL5ZwsClxsU0/fo/Jmc58w6zB6k/VHUkn9K1pM6gcBnLQpi89joAYLSNLvg6yP8Y/KZ2wTi1W/fQlFbFqubdgVAWgUjrom3GvE05vDnmsN2ab5a4lejRGyF5qN4MTUGXRpcGL6vyaH5fYaAti1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785449403; c=relaxed/simple;
	bh=lceDh1ciYPZ/7rEvhz12FITaqL0FquWV3n41/SoMnD4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DkNMehHTlpNZkCol2kj33GAiYzEdgL1dFoTeYs/BdXjnfURdSTyP2IfdEMLmON2AsqS+w5Eb/r0cxzDBlomMJft3YKFOpkXh1U63JVDEgO7AaVtPL0xbGHnFx8xReaJamcMI4mFi0rsLsR/d3f/Tr3uQCHoAQ3XYVpriZTfyeF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fl0mnHsB; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fl0mnHsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785449402; x=1816985402;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lceDh1ciYPZ/7rEvhz12FITaqL0FquWV3n41/SoMnD4=;
  b=fl0mnHsB/zioPlxqwUjsrdto+XTP2KUQ0nthirr4vHc5jsoVLZ3SKDlo
   I3eORJekqG8NHIIZ86sSt7hoDPlGWd/w00QiYckqbn25ZVdWuqPekR4gN
   HbWAZ5/gmJVIVPTif1WQK34n0ZRNpyCVLOPkbgENOXI7P6M1aFibuf+1V
   nLPep4eNJuDMkT1KVdPU6is0aNRH3okkhe1OURe/8AQIdZEb/tfWbRr4e
   MBgIUDNAerVbwSo90FzNusqPowoJos8yxAzx26jHbZvdrR2jyUP2LEIYI
   XIYaC035/KJx2xiObobMIWrL8+ljHZg87o4/aDtae77ETq1ZWCWZHnx2+
   Q==;
X-CSE-ConnectionGUID: slBb/vR+QFOJ2SuaTK5Etw==
X-CSE-MsgGUID: i1Aj4MpZSDyAIfyKfROy+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86157830"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86157830"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 15:10:01 -0700
X-CSE-ConnectionGUID: 8Ocs0CszTG6UduigTc4uRg==
X-CSE-MsgGUID: WPmn7/45TIa+J9A83LGtiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="256107980"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 15:10:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 15:10:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 15:10:00 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 15:10:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLiUFFF8B6nbTPtMJH7+gB7YV4PKqZpCyNvkS1hfBTHwwvb3YLiHBcQB0aMg0iD2DNz1nETovBkEvQX8yKfvpC01ovbZmmDjgDiKkVtaTeG+HVtrmrYwdMSg5H0gKs1N4zXYkty/GcjqweINaM+1wXtxHCOp0J2FWKD/vt4Sgd8DmnIY1kzMVCnKXP7d57jNAs06wDNBY2ZPvsnBXvhYNKwaavtU5PECLXpkHlWB0S9YYUZoyrUwchjaLXM7TSnFOu6vXJpOTsYfJVsbZr2yVWn+oRdx2OafOTiXZubSH3ji1+6XO4XrV3Yfv1zyQk1zTH1TiEu0rxYpPCcNLio7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZLw8amsO54qksWs9PXglpseXWX038yDvnfnxj1fKD4=;
 b=w8B2J0xShz2aFD7f2ThZ3kG1MGR+pJ7PTRJ13uH67xWPkjfz05ZxLkKb73pPOvR06lDNM7wXqESoprBxTsjHkYLXaPaXoXiTBfkN5wHwep8TYLaBObSdg4QtNFOKIZB4GjgTgrWYgZExGoM1mcvkIMiVw+66CMaaHEUOWp86RU+AxLdPfK8scKWr+f1G1g7Zlv/3C0ZHJ7Gr3xx8KMsMzM516F2qPlwnSFxbBE2xTsqR8YJZRyyeL0pUKHAw3XEOBa22W9z+F8FMF1MceO/nzc7FDuikAIbgoIhkykoCTgleWBBeQDx26kx8uh2yK/KbBDABWLGWCAWecspCTCjsXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 22:09:56 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0245.009; Thu, 30 Jul 2026
 22:09:56 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, "bp@alien8.de" <bp@alien8.de>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Lai, Yi1"
	<yi1.lai@intel.com>, "Wang, Jie" <jie.wang@intel.com>
Subject: RE: [PATCH 1/1] EDAC/igen6: Add Intel Starfire SoCs support
Thread-Topic: [PATCH 1/1] EDAC/igen6: Add Intel Starfire SoCs support
Thread-Index: AQHdH8+eYuLvTU6vrkCOud7vaOMnBbaGn7+g
Date: Thu, 30 Jul 2026 22:09:56 +0000
Message-ID: <SJ1PR11MB6083B1B11276002B05A3C0FDFCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260730025454.4099934-1-qiuxu.zhuo@intel.com>
In-Reply-To: <20260730025454.4099934-1-qiuxu.zhuo@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SN7PR11MB7068:EE_
x-ms-office365-filtering-correlation-id: ba9777f0-8760-4858-5113-08deee874a59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|56012099006|10067099003|18002099003|22082099003|6133799003|11063799006;
x-microsoft-antispam-message-info: nBvsIhiCzCCWnamrMTe8UoPmjZOeBjlsLeCO111EFAQN1QiRSSvOvFnCXyx5TzdVe5gD89n36gKW3RveNh0UEHPpKsTcXGthiCxT1dr/mAkb53NQ50D3ZuOW7pkwtSNq2czCZKSV8Elwp2HolHsPZKcGWPMQpQemQtNIPr6EDulgkJxPzRpTsoUt2XT8RfXG/zh471pcZHgfnDVv34E3g4BRTaaN7v2fMlIVCbja57yHuValDCE5VaOgNO6Ngi0FHWonaDK73tcP762DMB2FJMbCoqrSEfaezFWgdyiBJBgpoHZU28kbmcMnK5ORwsn3oIE18Pde75HVFByrprg9qld46dxwy6n24QgVNJzT06ATDQq+ZHv5TAzqk7GNvXoUY3lMiaP6w9edMeCxRb9MVKpoh5pZjCLpwdty+kb2PIBfCtFWzF/Ebb+rDdeWRJ7lFADZssMz9+p0d9tZN953HCv40edAAQBNzD8ryG8XMe1OWiyGNVKA8HYBmYAB+EtIenwaVgq2wHUMgYu8wiTjmXfMC8nAlKi4lUT1z72UxZg490GQdztUgbXYs0/63H5opKYK39z/QkNMGdFaDtJyC1MsXWrS7hKfWkTWxPu41AUYhOY4SLPJv5L6JTNNxR/6Alio2q2Ujn66Iif08FpidRSkRyhY+00PyH29K6aPMdOQUo+3osy1EDlEkqrODAP+Nsy/KNB9WXNBNz8Luvw1S7DUzuMA2CPaMkGBIZTeVmY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KVC0OiGz9w9pP9LXz44IfF7qko21kH5btsoRwpA18a9V3z6ZKVpybQg4Efov?=
 =?us-ascii?Q?4hSVD00VSoqN2kvpni85Awk2FJqmYx8FeLbZlhKXY1nWJe6HkTqOkq5MRzwF?=
 =?us-ascii?Q?GaCK1Bf9b3HFl0LaDUbg1XZZBQsWkwlLMoUv4VXjdO1xVJks+JFankumTU3P?=
 =?us-ascii?Q?DafJCnV893v/03hNm2xBbNORb0Drq0VE6csmn2a81Zin8to8zNLMGR4H74/j?=
 =?us-ascii?Q?mo9nWc2NkMifQF8Vn9ud9/xbCbV1XmZepyL46kerZNiTF3Y+BEXjxQOKE9Cz?=
 =?us-ascii?Q?B1PArYt3L7Sy3uR+HgMT3qAsB4z68ywPAA7scJF+9O0B2L0zFxU2UIpbBSHi?=
 =?us-ascii?Q?QsbmyQ36tUG9XOTpu4HY3EUAps3SNSXcbv4pLCqzTaxpSj8FSc/pMd/KIRI7?=
 =?us-ascii?Q?LKF4pqBv+1XXZMu9Bbb1ezSUdZRui5op5t5S+SntN2J9/3iPBSbozF8o8n49?=
 =?us-ascii?Q?+znbiWLhYDdi/x+7FDPbfasn2eehtGhN9fGXfRXTpivs4q2OptUu5R/TYpjg?=
 =?us-ascii?Q?jTrRYIxfeVD4HgPYgICY6wdR8YtLUyMtRCPc/yfS5AkCnCtHQavkzpZo/P5i?=
 =?us-ascii?Q?Or2tozbx8N0XL+lWPExJkWsF95CbWotLSJdfF/QN42oxoYUFRtuX5XMindXg?=
 =?us-ascii?Q?tqcbxmHdx1Ey/LZYrasoYGP1EOgBQKgTYpdu/3hY4fvKd7HecEcTUQppczL1?=
 =?us-ascii?Q?s1CpfeF1kwUhDkg0pxtmay9V4v6JKjVmdNR2DKlfPG1vFVOfcYlBOn9M8tfg?=
 =?us-ascii?Q?nEjw6oG0+Eam58Syvs755aZu8VRuCo9s7UJnT9h2u0zLsR+AVW3ZR5hMHXli?=
 =?us-ascii?Q?1bMxfQfFqY1YDHGudIqiiZBuU10zDhZ3Odh9PZedEeCzdycyRXcRPgx79VRg?=
 =?us-ascii?Q?xZzk1dv9oI3nSFRmwErgR6fG2Bfdr57TY5hvZ+ABvdd+gK8fa+Aq7DZt6r4E?=
 =?us-ascii?Q?7fxRwLITVL/DPU4lE+sZWFYnciiJ/9HWyVH+4H/CYUy/iXor1oFbhEo5Bz7e?=
 =?us-ascii?Q?bYZRAPOneTzngsfXbk8KB7El6rjBx3nOJ3IHSxDcUG4pI4KTu3VhwYaZikVQ?=
 =?us-ascii?Q?g60wje42RlTznQLzZUhdfgDNzpQk4l75bCZn4VhVkPYdgOi2E68Lx5nX/yCA?=
 =?us-ascii?Q?kUWeVMYyMpj+rg/PkZRqmwv56VQqZdDjQCxVQ1x4wBHMXRHxiqNNtgfTtwmx?=
 =?us-ascii?Q?mlvD59DuyDOtYyL84R64Pui34Kj3BriQctsaQcI6Tfw2uXrN/Gl34nogPbse?=
 =?us-ascii?Q?sVxYF4qqYxvUVe6sJiDfA2FjY1ysW3eUHUNsoQWwO0jg+0thwwyCTDIJrhXA?=
 =?us-ascii?Q?jHlT9SkzZ1SRDLJwYCxLV1YiIwWevcRo6eqTi4rKhqucr7zbL7HXmVpemVp1?=
 =?us-ascii?Q?QGs8VVz7K4Wuqh67z8/VOyV2HQQur39wEZt1JlSPorKbFnSnTKxDkMpjIXnG?=
 =?us-ascii?Q?0Id1s813hcXoZY65aR3IlplKz/YEZA/WcXIzjwPSuM5lpauwZJW3CY+Zp0fC?=
 =?us-ascii?Q?2HjOaFzaikmDe99qjw/FLq/RvCArMJL/bCblQorq6ILexE4WKUpgsMZPL/pN?=
 =?us-ascii?Q?lROf3c3UlzfrNedSXHXgXWsfhKXZAdNCngSmvOw3lkC/I0oheaxQegOze3k6?=
 =?us-ascii?Q?0HT0GT5/VxmEEO7e2cLNYqOA9Es7yqkrLC56eBOlWvXaAJIhom2kd+MprIsd?=
 =?us-ascii?Q?aDYY4h1/hqKNW+jimWxDtHehpdSyH8yrQxZC14qTQfOp4J4f?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jEJuTD5ZyP8A8etLbU8nUdUk+FBVk81iTItotT8fwoGl9bpUMB7Cx8vyxwmlsnVTwjbPCQCh7Dtk0MTsm4ttGnv8Hib5v5U0JopvSxMP3FEow/gKghRlyo/MNz/H2vFVTgTpKylCO3X9Xani8fdRgmE3iO3ESdDIJ+mqua4oVTB0ZqjoTAFQSQeOa2RCJk+G3xRXwvcgSBJUrnpwU+ZPhK9nxop4oqYGzecDXJvt6BC2FP9NrnkHPYKDsbe1iJ1HWlsSh2YOrfE/2rB2zJUWskORtf4RC58FgOno0Js8kBfX+MTFyNJll2hrkRZeKaHcmpeud1uI4xiEmPefA1rJ+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9777f0-8760-4858-5113-08deee874a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 22:09:56.8303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r7gV4Nv8fwi4XXCj2WpcGK3pGhmqveRid53YxcOqXQPrHFCYcinR+jFo1sjV3L9zpt5FWOR9mJmzJibKCMOE/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
X-OriginatorOrg: intel.com

> Starfire is a derivative of Panther Lake SoC and shares a similar memory
> subsystem architecture. Add Starfire compute die ID and reuse Panther
> Lake's configuration data for EDAC support.

Applied to edac-drivers branch of RAS tree.

Thanks

-Tony

> Tested-by: Jie Wang <jie.wang@intel.com>
> Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

RAS tree uses same tag ordering as TIP tree[1]. So Tested-by goes after
Signed-off-by.  I fixed it here and in the igen6 series.

[1] Documentation/process/maintainer-tip.rst " Ordering of commit tags"


