Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B81B3B0588;
	Thu, 30 Jul 2026 22:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785449202; cv=fail; b=aRDUl2N1MC4BWzo/Jwp8fxLlcvCuvqq7d2+EECh9irMeXTdv2sSFh/8RZpE4bmY68QkRnFWawItfwLPzgEYCOYMZjmGKNSN9C5Lboblq538GZ/t9ROFWmq9KZyBBbbaXs/gj8gBO8IBLO7T2v9THZVL+f7jrbkTI9rQz1EWYMH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785449202; c=relaxed/simple;
	bh=ngY26PNGRILmTvNtjjo5OS4J6YbjJZrpsIM2PHX5ATA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tHm+SzgkHIFB8GQUPiEw8bVag6ilrSgALIl0lxqO629g2IhSkVM/dBhHrqgQi6O4hvWArH54q55HV6PzeMRUMElV9IxT12z7Tef3TeZC8X/lMUyrsCDOumCCuO0JGB4YP8k9wVcXZHAmDOeYBZa4h1LAOEezaQDoJuwzOB72GjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APyt1kAO; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APyt1kAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785449201; x=1816985201;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ngY26PNGRILmTvNtjjo5OS4J6YbjJZrpsIM2PHX5ATA=;
  b=APyt1kAOkPdv6QlMbuobUZtCQmrj6rynaMz7IkL5DhZH/wQ2Ds9YmkSF
   j7u52aYqW9vA7A6UfhFE06CAxHqTWep9gpwT4EDJBXh0qWVPXNZtSU8/R
   KxANuYmpFMB4lxq0vIIc0Px0RuD0GFiLYZ3viLrVPL7FxbNH60W2RiWGI
   wDJ9Nn7+T+ZE5XzQuoPYWDa8+lkThFFGfFtsYBONGRkXGUWYvjXBZ3aU6
   HdmbQ0WfquYYvmbxJF5UWiCZ9MeeJImgfI8h6fppWnklsyCQ2TFR9nbKb
   +HLjzqIrNtOWrlFzHKtD1yk4GZBaH4+PNZzWnaG3kjxUrW+kGzrnMFKGC
   w==;
X-CSE-ConnectionGUID: jgGLFcXcRvyBKGkWxVfAjg==
X-CSE-MsgGUID: rz0ZdG3XTGaZAuGAE1TbQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86157421"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86157421"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 15:06:32 -0700
X-CSE-ConnectionGUID: +H6xsNkRQv+n62PT3qErqg==
X-CSE-MsgGUID: ZOdw0zi9RcGvczx1DujG7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="256107494"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 15:06:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 15:06:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 15:06:25 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 15:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRjMdS9iAjdvJHXisrHrBAU1olUcbE3yTOa1293ym57HBvXhJ8lCWC97LiALakU1GvMjPJvPEpkvI/wjQBHoF2hANR60sffA9sqqn7AjfNI0X5G4aVQepaKHRPAjax3rja2tY0BB+BVOo/1hX5eA+WbchPsvCzHKUGORL+0BBKDYZuvELMuwh+ubEmRE11JRpOIE+2yeHlqX0EzeP1m3mL5R5OpSn+ZJZUbe57na1Dhy1zzMBNedm335A95HFihPPt8IwhrBoig2NlygIhu0MrXSa0WR43WEBd+JYSbzb2bTPJb/QwA9XZxsR8Wb6fu54KTk79o66iVgHnXh7xueew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngY26PNGRILmTvNtjjo5OS4J6YbjJZrpsIM2PHX5ATA=;
 b=wF4eDYF5VfwG0bzkX4Gvr0ltzwUE6Azzhoe9SLopPEVjvV3rn9Vs4bFc2p4397JG3OoQnzSv6HBauKHQphlRgCwvjCEyvyV5kJjr9Yj+w3BsINvbycDof5ji9nikrIzJguvoXcxvCUdaeftmaLCa7Fvl+PBPiOJajt/uSwRnS/gHbL7FJAn9SL/+KU6zV8pJo9bg89fQrrePBCdRYUzQuiPuAqc9mnRN9D01AmRmc/kEXD+0UrYGzwPJTp5a/imKXzrUssSnGmekOdSir9r2Z3urka/iatSkJxZMDUL8avDQqVhwA+vzqD2xBoI2nutmfk6y8oH1TQ3ZnVPwqBFlTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SAWPR11MB9709.namprd11.prod.outlook.com (2603:10b6:806:4ca::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 22:06:24 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0245.009; Thu, 30 Jul 2026
 22:06:24 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, "bp@alien8.de" <bp@alien8.de>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Lai, Yi1"
	<yi1.lai@intel.com>
Subject: RE: [PATCH v2 00/10] EDAC/{ie31200,igen6}: Fix address decoding and
 detect IMCs at runtime
Thread-Topic: [PATCH v2 00/10] EDAC/{ie31200,igen6}: Fix address decoding and
 detect IMCs at runtime
Thread-Index: AQHdH83h6TfpaTv5Ik2So2s2R4drk7aGn1eQ
Date: Thu, 30 Jul 2026 22:06:24 +0000
Message-ID: <SJ1PR11MB6083E8B50C829C42E3169411FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
 <20260730024238.4096623-1-qiuxu.zhuo@intel.com>
In-Reply-To: <20260730024238.4096623-1-qiuxu.zhuo@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SAWPR11MB9709:EE_
x-ms-office365-filtering-correlation-id: ed54bf28-62ad-4059-efd9-08deee86cb9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: t36gAryyJ3Cu0hjEjzt/JJlzYBX/y0CGcfIzKVSVMYP58LF7mn49oNaUVoBXAXtQPmPZOfrlk3ooSZZimMBI0pCQGQS+5DtkL4Ptv8XHeFrheyNcKq7/MKSdlofcyhEc94jityy8qP7NtIpxj0fnHj/oxiA8LbUN8nF7lWX/C+2L9ern3VnkKGn7TwONadtDPmzCJ+aWf/UtdVRg5vZRV23CoA56UyRcXuIqUo7jyKPDxPPlB5k4zyYFSUPn2XFITGuGOyEQSldfhSmULp5f5QmDh+A9QzLqbzQmtjJoXa+PJgTtY+kE95wtQklB1LLpo6b2fZOFtJWe7OmPEgcoZp14O4iRnAMO1WizQjkdLau3eq4V7YotZrYhHvX49UYQswZuNn3ICqhBOZlTu7CNIOH7NktCFaG/yY7ZADl6tZXFp6Qp9HvKaDZWwghm5Wa2BeJJKINDFYyX054N2THifKfZS90sZKgGmj0DbIBj6if5JsTSIZtByex12+BO4zHcn/6o9vbO8Mib7rIMlHC7ezybTfUyow/wBwJLBy80IH9TBCQR3R5paRI+1ojXMpbDzGizjzB33y2ccBg59QXTL630c+acVrxWaE/XnAkkjVKQItInNB/LVWme3vVTkbFmOR5jtNppCYH93sHTg/HGmQey1M4mbpK247CxuaHkZeYmkdj018yY+1zRipNnLW5M1IMY4Krkk6iSxu3xCF+F9+IZzASnGQcuTEcibPurexw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AOAX8VaJUPQi+2PQTtsfEVk79ORUcSkaZXpT6ureL5Uvi3L36ifl1XDa/att?=
 =?us-ascii?Q?mYe4vPxbaz3FFHEvqI3BMO7koWBrGk0lyB9XghETWN3dLFOLjM6P4ow1eaWw?=
 =?us-ascii?Q?0fTQEqF6sc6h8OIqDoiyC0Xkg9MM25K4I9D/hbPtXlV/j9hYJDv97ZjHy8u4?=
 =?us-ascii?Q?VC7E2RFpp0aURuZsVZ4NDJcXov8wdD0MVOEq1Uh8MuQakAzXtMb0uQb3Og5A?=
 =?us-ascii?Q?vhj8UpqYkbn5VUgok6lc5+VE+kWDUJ0Qv7LOVjIEKBwGGj8sjrvzvfaWpg4E?=
 =?us-ascii?Q?Ynjq4ySz/5X/FNmBWyarAAc6zwqUkLhnXIcV1lMBPCPXMCB/NKT6nAj7z4Zt?=
 =?us-ascii?Q?c1y0UaGWC+LzPVzt7uNsbxJht4c1YnlDAbWbaer7L6OFIZJNijfrWiuDShgX?=
 =?us-ascii?Q?KQRmDIlvFsumnz7jSKA3JJ4ewH5Eg6h7aigVnhimhjjXpD4jBXmY3+138NPi?=
 =?us-ascii?Q?JYyp902wgc8oPY98f6PnCdH5bhB0JsegEnRaODobY/+x0GOqCHdwqH00GxpY?=
 =?us-ascii?Q?8Z82DRJEwbBPCt4KRvdVnwaPkoFPbQRZ4xgeHE2d1aY7v8gy624OykW625wg?=
 =?us-ascii?Q?CxcUaVUNkre+UVKVDoa71nLG+oKa29NQDurtV5tfI63II/7zuQ9cJTwZmpw8?=
 =?us-ascii?Q?0MvQlIldbre5MMUUpXxC5izxMycyn/YPSX3eiGGmSFyoQCeG0k7YqRnNFJrt?=
 =?us-ascii?Q?gRIZZuoVTClhkjwhfHP6ndunchwn+YqeWUPfFuFXTZ18b8QcZftvPUFIu+4h?=
 =?us-ascii?Q?Eu9ktsGKeaw94mcmIeDPgxu4eeu8vIcXipAxP2buLUHUkoBN09XapetVxF56?=
 =?us-ascii?Q?0bY4aw/1vKfbd0dZUpO7IOHWIao+niAhBFrBCEoSXA12F5KK0HLeT49zdyRR?=
 =?us-ascii?Q?PeXp+bO0N31ZYJ2fjNjbirV6W7uM3GUx3uQ712ov2Y+XSSykTJjxirMvYCas?=
 =?us-ascii?Q?hGiD+NesNTZOFn7D7WgOOrZ6seSIaHtYSgZ60oYxmxq3zplHAKSSWgBpp7zR?=
 =?us-ascii?Q?5+MCM51o1H0O3Q1xIXCH6DUnKZVsXFu/6X7xvSgehYz+QMAE4abX88+N4DEB?=
 =?us-ascii?Q?psuXVF7irt81DkmM6+Z2njZ1PwlNEXdXRtx/vSo3qMSBaTHl6r6Q286Tax1r?=
 =?us-ascii?Q?VKVL8IKpduEHBl22JU0s9nR64XweTPE/BEBOLqgyCtpf4AIrkl5U6iJpxQhJ?=
 =?us-ascii?Q?KGKHaCUoB0L3HFcLD4XViUjHnQVUjO3igCufsrz5PFtvnu7NQ+GOLqiBAF4a?=
 =?us-ascii?Q?DoV5kofC4nMgMYRvqX31jCvShanC7R4z4a4HzYyok94ELgEYKtkP/qqW9+dZ?=
 =?us-ascii?Q?NV31vqTM9yKQl4VhS7+JkyGCETiAWjNjTstaYe19JwYCKmyVr5rVVYOFt7PD?=
 =?us-ascii?Q?XbkCIrP37jGUP3PupFTVPavbT0wzxJMPuMRC7wzqll10jqFU9qAcIPtHa5FC?=
 =?us-ascii?Q?dwtD8ZIaXWxKk5GEaEUy2rmy7XnxAAkMLDuMryO71MYbuRun5d0Cn+2p3Vzr?=
 =?us-ascii?Q?TrtgvrydbEoDqN/APjSjA/y9W6MHqZG6TJw+ooe3BTSaSnkrPYjY/kKD/818?=
 =?us-ascii?Q?UjaCK84veZ2DzScy7pJ1O7Sd+cTWk6DfQtSqmOXl2f/t/a2GHeNi58wFxq1U?=
 =?us-ascii?Q?5h9xca5pLXgPomga2vB6BmJ5QRjVdvSXKwPG7nxqfxMPtp56sqnAD+N8hqW+?=
 =?us-ascii?Q?p6GDodbu6OEIbqIsV9Wx3ImeM8CSfHHIg0EK2Hupj8sOJ9tT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SsDykZsid6QakkRZh14XSefjuvqhzcO5jcCmiI0jLl4TcyZS4GecMuJ7fnCte92PjGGziAFxJC0NnBGO9nHoXI85w/NZDD8J961DPXdTNWvymVXnk+oab0ePfaOQPBCG+ZxFrYdHI8q6Nuz1ixruGthIanhuAR0hNGZ2TYDYsyWuG5HRVeF45uybe7BY2n+XY3lFnDnuoHpo9eMgvTNcwSnvs4thg3GFNpKxHnZaCMtk1w4Q0KsgVdONHJgV8RXbCWqCNLpqBLRhu0oq2kloI2OSgBQYzhKql50jtYwYXbsgBdHbTSFlTsbR0Na/1NmKyWqdDtzNycihnFL6+jNbpg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed54bf28-62ad-4059-efd9-08deee86cb9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 22:06:24.1533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HX/MDQrsIAtd94h+QKBrkWXMA1Nqq2c4b82KZ3iEUFo97mEWlozu4ieg6l8Q+E/4fZ4+XVynWGx4qV77Y0iDuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9709
X-OriginatorOrg: intel.com

> Intel client EDAC drivers duplicate address translation logic and rely
> on platform-specific IMC counts even though the IMCs can be detected
> at runtime. This series fixes several decoding bugs, replaces static IMC
> counts with runtime detection, and consolidates the common translation
> logic to simplify future maintenance.

Series applied to edac-drivers branch of RAS tree.

Thanks

-Tony
