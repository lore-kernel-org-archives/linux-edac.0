Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89F9199EAD;
	Fri, 31 Jul 2026 00:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785459469; cv=fail; b=Ms5EfwHAkPALivaX6hXpAkqhjc2ELw/WFrBbkh6INhIYrmGdTOLhg2wZ/ycepi8zbmjeyqxiVKuSdV9MdMey6BTaSR+2O1hR1o+5qFfgWSvGIsk986tFI8Y6rjZawYKvvOlpW5EmyJ7Mcad7bqB6+bWztd8X4W/JYwfP+HAEGpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785459469; c=relaxed/simple;
	bh=rHLRVt8Ouv6llV8D4dPNXLX78gpgPk/efSppZH5EqmY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HpDfGJx/XF9sbudCiEBNZt546fZgIK2SopyOoJ96F76kP8sMKpXNPPz7AB9t8CfJum9+xOCGF96z3WxudS4U4mdBwJL4W+g8AaZ7ZW3hHtuDoBVYg6ot5A+LqfBgPVnN3tMprQc+CEuI/TzyafomP8fMJIOzeVxQH6DcGh6MHLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adQJbYdo; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adQJbYdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785459468; x=1816995468;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rHLRVt8Ouv6llV8D4dPNXLX78gpgPk/efSppZH5EqmY=;
  b=adQJbYdoM5xdP+EgtpVg6WUkSQfp7ake989VEYnquHiCkHuKWHPHLwZ+
   EKtV74Ys1022rp3zFSXExfajpm8HoODzvTwzqV1aVbt5nrBNEcJsmo60P
   mBnLA0nlNrRZtHTuoPzTjTuj9RfIjN0MoasCc471Lyo5H1kIyMwvkC7cR
   HsV2nN8CCbcytu2n5I5ncHE1AO4gUwnmwPJutWhJOaFOzX1LXXhfKQ54o
   qYMp6hw8l3v9sy+JkX9MT0HbnhO5uvHKdPimNT2fdKgVujWSf0t3Ftiid
   jSTdoCSOTyF6fir4ztDlDDfApHGUiSJfvNvRUhFtnXdIZ6d2rWfuysMZZ
   w==;
X-CSE-ConnectionGUID: 1fwvLtm9R5Ghg2SsVB7gEA==
X-CSE-MsgGUID: 4RVVS/duS/a77c8EEc014w==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97243831"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="97243831"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 17:57:48 -0700
X-CSE-ConnectionGUID: RFXhwc+QT0yho2hckDTckA==
X-CSE-MsgGUID: pZUMRgb9SJ+hPD+yMQLDpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="290392285"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 17:57:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 17:57:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 17:57:46 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 17:57:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQT4Y9OCnzyeEJ/6QgDtsQKmyzZqMzKLpTsSaSRAmd2zvgnxg+AC8i14k4vkLHN039AAwc39QQcMa3VoNZmju3FlM0rRqTmLkz0xJhJtSC2znE5Uc64kL2kLUHYCfn66LXBydF7bbsIfCuuWi1FVoNveZ7mr5dZyBWwlIvO9vE3e7GftwFHHzY27OO9FyRGtuZTKVN56Ze7/F+KaPzCfCrFdUOy4sQpYki6h0RD5KS+8MI/sCK832Qn73XPBCR9FEP0fwi4dbQb/MmerDmiif6mK64tpIoiSdt2Zo33YmK0ID/lewDkKu+J8PqjaP1hjBipf1ZuzaPx48CQnmxSImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxr5HtyHwmAgnRZoR22hNmwNfJHtiVgSYnZdqm/EVoE=;
 b=E/dueWbeqwGr50c3YOGMjLeaMxFGfaTTIEnVUZKDhnw8/OF7hSz29TlEuXl7LilBTYZX3qGGFjl/M2OJLkOUr7V4WGZYLcmYofqhqsbQNyJ8T/nzjBiDhPURs5rDbrqADvdloBdVU0tyqN072tqqd29RPYxbeVSkyRkHF150aHhy0ynuJn1k/OjA6JHECoTVyy/BA4y5hL6gRzctf6Ee3zbLuXsS08mX/6oKqNyJZo0O63B35MX81Ix/suJERd/tIx4PHAsRQaBTk4Bq6vtKyrmreDAkNkjo3j2KK/9jwfPEWQvHd6jJmvXlsBbjF8+Ih75YUIfqET0Ip7YmhYWVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 00:57:43 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 00:57:42 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: "Luck, Tony" <tony.luck@intel.com>, "bp@alien8.de" <bp@alien8.de>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Lai, Yi1"
	<yi1.lai@intel.com>, "Wang, Jie" <jie.wang@intel.com>
Subject: RE: [PATCH 1/1] EDAC/igen6: Add Intel Starfire SoCs support
Thread-Topic: [PATCH 1/1] EDAC/igen6: Add Intel Starfire SoCs support
Thread-Index: AQHdH8+evrIazbmOCUqXEmTGqEKmNraGoK8AgAAufIA=
Date: Fri, 31 Jul 2026 00:57:42 +0000
Message-ID: <CY8PR11MB71342D3AF80AC2E9A5D0C88489C82@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260730025454.4099934-1-qiuxu.zhuo@intel.com>
 <SJ1PR11MB6083B1B11276002B05A3C0FDFCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083B1B11276002B05A3C0FDFCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|CY8PR11MB7846:EE_
x-ms-office365-filtering-correlation-id: 470a5f25-2d45-4303-bf35-08deee9eba13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|6133799003|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: 5x0Dwo5I/J7DuwydqoxSLR/b1FwIkosLwzGiOfWhYcI1Yz48tsgDod6Ivx4PWtqoiElxJOOMPX9+Gble/JiibpbVeudQ7hqTfzMjjZ78ttgO4c2h6/VJzqoeUdbQskKoI2jTU5W6WhodkJs6WhFCl8Gz0Ef21P3wounVQ4EXF01b5wV873mDqldsHG/KdhUkyEyoyFsVrCUo944wAyfHiqRy2zXu29rpr07hPkz1bHLCJdB0CnbRnGRCoEvlps0eIFFS023tXWTwb1/I9HqtP2XsiQvdr4lmr9BKu88AxK4QYsbYpfuXegmK+NfjWggtjjqRkirW9XRIOVGOlmjmHVef08DBhMp2rqIUXMgvMu/zLxBd/jJL5z/aaLo03k2kIN1qjfhBFoT6LofSEXNHi3mayhubAXlbuuRY9H/88nWK/bTphTaphfnRCht3po+2pWyeOKb6m+cHu5r4Vzaj58oiz5IPokr6jkRJd/t0ktPd4BdEWM5dVk6Vx13zk++k4q1ASolpdEs0boGx4xMBZWR8Avu+MjYzp6AijtJ8NvlB6hUFCcKTEIHBdATuX9tgtz+AmepsTk8MHnXoKTzeynYgISxCvx3u6hMdvEu5mrVaHkFUoDZB7l6efGO2evVS+QE+N9AjEJs+pRDIDSi/7LdidVxjUjMFguTjCj2w1gVZJDgzGYQH1hdfveoqT5RUV2QPFlpF7UNWt187cHC7oLBtfQPktos7r++kdxy3mlE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(6133799003)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YHmcfG/DxvymUhj8Mn7j5QihrEJjP72fqUeJAd2Y2nkIvQEUvMup47XDa5cT?=
 =?us-ascii?Q?SPYLVA5gE+RirQWVr/tarsSorPZ2dDADfDOr752k1CsApYK+9CxdFJjG8P3t?=
 =?us-ascii?Q?fH9iQz1B1x+0YRd1FzxaDS6c7iFgTAIYm7Q+UIFGXaTHbtjzAfJ9myacwhcl?=
 =?us-ascii?Q?XfKiyLsi6cjLrFKwQGZSw8tP572EpAU382aSyk2Antwu0jTuW5yPVQnPrLzW?=
 =?us-ascii?Q?14VSTry2A+M3J6c/XUgdTUOJyk6mY0jFBe7lULphSg8ZT6EqCOWV5TjRoLRm?=
 =?us-ascii?Q?FLzo/pX6QZQFpeaPkPmE92UiOKbLeFBnAo/rPS/L56ddtgF/HuaJ86hRAh/x?=
 =?us-ascii?Q?ZWxoiIFUHrYP09mUdyVVp+UCpbGUIVwQClnvDFL33KVHCANF4eGqL2BuyTio?=
 =?us-ascii?Q?0udqSpkpKQ8Grf4Co9lH9QAvE54fxWEOEluEX54dWVsgEIxtLvvxVNoH2Ycu?=
 =?us-ascii?Q?fRsD8MMGTP1YqH/FPA33pnXaq/90bH/ApvLBc/IMq7DDt6AJoGa9Qi+r6nFq?=
 =?us-ascii?Q?zHq88sbPqn9kMP2f6wCBfo3vPW9f5LclvJG2O174or9AAMVg84Zq0XjYWoWs?=
 =?us-ascii?Q?+NTAvm9hZPMVtQwmb7dhYOqtjxTSPReE4qs0Hl6ncW1kWWhuAcewVcagKlB5?=
 =?us-ascii?Q?V6Ba8g9QN9pFEpxtEwrmvJhgMh5d/ArBG/sAnnKwkQnukzcFbPN1aeDT8g6b?=
 =?us-ascii?Q?WUgwa9OMq3x9Io0848mXs59gb/5ndpnQs+zQl+zP9V9wdk4xZc9NGXZfQ9b7?=
 =?us-ascii?Q?TTN/6SpBXFfw0UylgzU32l33Q9fd4ilDXDIqVm1f6cOFJvIQOtNrnVH/fchr?=
 =?us-ascii?Q?r4I2vQrsC9W+hS1X7dKW0eSlA+qUSscX17lfWkgXYovfTB+JmL7LPJP+wRsa?=
 =?us-ascii?Q?eEeGgGJI4wrKwfVV6/tzB1ycPSRBbKft/+F9ltcDLGBQwJb1ZjDaIxeiLSuX?=
 =?us-ascii?Q?//0L1Z4gKuAZyq4dRQ7ORZf9c7Aa8TDHS2Eh714fIGJoNAB/zqanObK1H6fa?=
 =?us-ascii?Q?sBa0NVg0Z8HfgHQc0MWshkmRTnzPiNci+WCp28TRdMsqw49cXWFlfEc6X/Gr?=
 =?us-ascii?Q?QodsOKY2D2WK1cuTkeFUQ8O1TbU5UWxo+bbMGv0DP7Ha2Mms2NDQ85VGlCq2?=
 =?us-ascii?Q?I5Pxh97r/WxqXmFYJYqJ6NP8aWoSZQH0EA+3kvvv2wVK2jiiNw192WoKP7NZ?=
 =?us-ascii?Q?ZNUdC3+KYZeDKV5F02gMvZ0uF3FP5Lc+tM7wQDIOmu8wVECGSIBJB4pE+hAM?=
 =?us-ascii?Q?DZ43c7Y1U32YwAgohr50QsKcrQQnkwEL/+uzGUw3wAMi6Mg3CuRWpHGbvTb9?=
 =?us-ascii?Q?m4yV+iV0kWr+JAE7VWftp7qaJXv2EL4tAmDVyFyOP0t5Fc/UtP+NnKF+5B/P?=
 =?us-ascii?Q?GFr/4K4D7CRDQCxqJW0sMnfEB80nIUGGbf0qzAEKKLv11ljS5WW4orpgQ7Ik?=
 =?us-ascii?Q?b2ryPIU0WdiHL+CZX1IwsPgcdZ8cXeMa8EPnQUd8qTBiY9eXx1C0wt4skItz?=
 =?us-ascii?Q?wsFeUPq+/PJgNxJsLw7SDTmTyr9z8YjIONnqWcs9X7xg++LJfj2Oe51hIuhN?=
 =?us-ascii?Q?J1eIxl1d+LBvet1zzbzD03EOv9SOImLGGN8xdO/bJJS7qAyHIQSsbgVWXySO?=
 =?us-ascii?Q?Xl3eFTSnMBiAKPXaKHIJMuphEyav66vn3IWMc7Km53Q4a5/8UWv88bFTd9ap?=
 =?us-ascii?Q?9RScsOJN3O4XOOJCQSUIQSS0cXu9jWEn3whLMPFDQjjQnlX7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EkujD4vi+aCy6Qzl55F2bXdo9RTrRhqfmAisyMLaBRGxtouEIJKVhBCGxiYn7fUuNTBW0+HEh3oNGbFNyAAppjIzOLkixDt9mRIz7x7PTMu5bue26/K1SgrmdBEEpZ6ER631JyRV57fbEhM25HdEiJgY7IQS0/m4sD3ADUZP2lzjfdng+fZ2j1XjgQ3mt3H7zEbghc15CNrSlEDcXVbpy6npCf7MZWJhTw4GXbDF5cI1YZoGwPg25Q99pxPQL+2qS4XPpMKZm323AwIeIiMWpv9rDZkBeRZ1yW1C7oZ9Apgg1awhnTlyDQaid6KjjDlm1avhTqRSwNYTE+2zkLjV7A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470a5f25-2d45-4303-bf35-08deee9eba13
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 00:57:42.6857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: za0zW0OYZvqYxGc3lkNVSxk4sH/8RovOpbteQyw//usObIG6AIEP032CvOr0FFwDuUCO+DJHgLqVzKVvcT8GZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7846
X-OriginatorOrg: intel.com

> From: Luck, Tony <tony.luck@intel.com>
> [...]
> Subject: RE: [PATCH 1/1] EDAC/igen6: Add Intel Starfire SoCs support
>=20
> > Starfire is a derivative of Panther Lake SoC and shares a similar
> > memory subsystem architecture. Add Starfire compute die ID and reuse
> > Panther Lake's configuration data for EDAC support.
>=20
> Applied to edac-drivers branch of RAS tree.
>=20
> Thanks
>=20
> -Tony
>=20
> > Tested-by: Jie Wang <jie.wang@intel.com>
> > Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
>=20
> RAS tree uses same tag ordering as TIP tree[1]. So Tested-by goes after S=
igned-
> off-by.  I fixed it here and in the igen6 series.
>=20
> [1] Documentation/process/maintainer-tip.rst " Ordering of commit tags"
>=20

Thanks, Tony. Got it.=20
I'll follow this tag ordering in future patches.

-Qiuxu
