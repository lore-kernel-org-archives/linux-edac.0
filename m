Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A04A421F17;
	Wed, 27 May 2026 14:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893861; cv=fail; b=dSBioQIfRoYpcQDOdxwHtbHfjGN8mcaFXOWdNWoPAx5efoubbdNXR5rY3e3EOAlVpzz3ERq6q/6dQbcxCNL8n5w3/rUU9wk2tILJ95b6FgZSsMWHYG5B/ds+iszQbBqRZ7rN/dgD9RPj1iUCeoG43q0kSFLIbcnt5TY1oQTsO24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893861; c=relaxed/simple;
	bh=uMHAJ5G0vTwQyZosloQfhr9SeCffWhAU30gqXtdZm+U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J+O1wowwEepl9TAb913H+NqT9DvNxrVsxO4E3z3olHmCigw8BoWBjBXo3HAe0FHp6vYl1V/cajSZLA+56LvaTTq70PR7PlnG2XVNmcsPwevTb5uOF/95D+Kv+I75GADMvmX0ccUZAM2eCAMSjY4U5nn4Mse1Qq04AYp5bCNMiaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCobc5RD; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCobc5RD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779893858; x=1811429858;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uMHAJ5G0vTwQyZosloQfhr9SeCffWhAU30gqXtdZm+U=;
  b=SCobc5RD9QP4E54AOmZ3ibbcBeF8dlI4Q5omVMYCrF1zp90BPlPfk3ra
   2e55/4tviboGebC/Qb06E+HCOJzoUGAd4ZtwrwzLqEu3Zf4qjFc48iKY2
   jxxI9MK9SzFPh2RsxB9ymJoRou7+12hMgrfqunLdDe4vrqIFVaAJ+fNpF
   8Yj6YJpMdQPKsp77Gdcz4jb6mTk20Abpcw1wsF/7H9Yw0ZCCn7vzJm9Hs
   JCMlevzV+pxvv4p+XrJUl2eLpW7l2KrVsxWGenXzJkgcxencUOtxs5ZGB
   ZFncRRMUWEHgFvsKGxE4o6H+jbvaE3tmlvbJQfuH5QlKd7fHjrfd3groJ
   A==;
X-CSE-ConnectionGUID: npe7sbTNToy1oFjuJBg0BQ==
X-CSE-MsgGUID: UCGBX/bLQbGfsd/NhjV7oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80630296"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80630296"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:57:37 -0700
X-CSE-ConnectionGUID: Vw4+HS+PR/Gbw3ucSk9RVg==
X-CSE-MsgGUID: TkNdYGV3QIq4eNkrDPVfHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="241223765"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:57:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 07:57:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 07:57:36 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 07:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjPQ798IMSH5B97RMbnQITNxkYH6rq5jfg/apl6gPXeXxTVeHXN0AewNn8HsXHx0F/DRbCSATOEaz/oT5TYe6bURj4bzXvhYA1IwZQdjEKNQUiSeVYrsrhsiyCRscWcV52AcDqOFOXBTLOyGW5WAgw1qTLsjjjFnoXHtPhDqnGvdgCzJS5TG/e2msyuuxmniaY9EttefLkuNm1ZHnlfWzaYQhwDr+TS41wJpeqKuxfovzUmeRNIcaUUBmRq9xbJRIy0IWtVktXimbAb2/OdpylnNw5/DA9q8yR+UVr+t2Fo9mD8e98PIMfghr4aDuQO9M3JzGA7yKk4clPkTyTy9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMHAJ5G0vTwQyZosloQfhr9SeCffWhAU30gqXtdZm+U=;
 b=dq8hb5vbMgx3SKbqd3g+E+Ae4uO9//CG6PwUOiLBYQE//UBEAEZ8vBSgZytPL091FuhNknSGdunDriYzK8lmB2L2tuEO3Ci7XQTbBasvXX66LNk6CyQYjciCwM6tvYNfaMBQloFcYhf03F05tfwlozrCBGb/q4D3gqdS+Pc07rTJI+7pawzyAQFG5Xivu5bqHmTP9CFhpf8sGeYvhFDQ/o+ITtquXoI6/OtkYNzebtqsKdJObKeT3oVjWoB0rc0HU6reFiBJyPX0Y5L74fABLDk+/Z8YxZwkowR2mR7/2Xo5D3Sm2NSKfqtVKMJRC3CljZKbQWfdBoC/Zd469+xMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by MW3PR11MB4667.namprd11.prod.outlook.com (2603:10b6:303:53::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Wed, 27 May
 2026 14:57:30 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 14:57:29 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
	<u.kleine-koenig@baylibre.com>, Borislav Petkov <bp@alien8.de>, "Luck, Tony"
	<tony.luck@intel.com>
CC: Mark Gross <markgross@kernel.org>, Arvind R. <arvino55@gmail.com>, "Jason
 Baron" <jbaron@akamai.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: RE: [PATCH v2] edac: Consistently define pci_device_ids using named
 initializers
Thread-Topic: [PATCH v2] edac: Consistently define pci_device_ids using named
 initializers
Thread-Index: AQHc7Z+kAOKcd0iPmk2Hvbs6C2C3QrYh9JPQ
Date: Wed, 27 May 2026 14:57:29 +0000
Message-ID: <CY8PR11MB7134270556DCE32FE14969B389082@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260527061057.3796383-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260527061057.3796383-2-u.kleine-koenig@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|MW3PR11MB4667:EE_
x-ms-office365-filtering-correlation-id: d3f1791c-e2e4-48f1-7a7c-08debc004639
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|5023799004|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: t0x4EmW344voDm3JTbMCCmpNsix+dUL/hZ1HKvrg1CTLNmitIcxvbkVnQNuE9tSUTWuG2Ws1MESDYdF0cmpmVdXRWvJN7edcplNFY3drfTg7ycuQnznU2qxmRQrq6XDP8V05WsqDfuMja7WKc/QTS4vJYkZx2ThTtfL2aXT5kcMcguYcKRbmw+HAI6I3jXa60IAueJf3GRWDTDaz1FHNc6iJzVNJjyIQqcLSda41EcSQbyDRs3BBJOSINjT08SVrM+EKQmBlK5TQYOFYoOHIPSfG4eJG7Md1nbcN4l/c160yvzZRP0NYrHEYsXDriR9jHO7MX8a4P6zosLctUIXBkaa/Q5g0srA2P2TbEvppuUXsawaNlqbCuxiU6ObXUoo2J/1kepLNjKQM2/SEWwJ+F/W1eoSpNP4uOTYnx0MdX9uXRcSUqKkHB0Yj+BKmvm4C11SDopfoigNaTljqY9I7YHnF9BfJC8twQATqULulFYM6niZkuIa1xjWhLyVf0PiQzr6qjHQ22RVuLiRhf1a9ertgjD9WuGaq5XYLecpXUweRl1HPNccZRnAom9eKSYsecBc9i8PzgAqOmKH2X2zYCJtoK0sLALQ3u41jv2CueBrmgoW7XsZiOz20K3hYF36ZZh/z3/YTgXQFeqRahPw9cu8onw4CLw4A1ifikZZiX7zzy6yAOspwpiXoGA36joPSfUMqSKlWg5ZB2t5JLfM/kuoqLNdQLWNsmGNqg1jo1uE74iU9nVUuF3reZn5qWotu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wmx3cnd6OEVXNE5RSHJ5V0FVN1VMaStCd3RFT2daVUJ5elFncWhrY1lQVVNT?=
 =?utf-8?B?c3UzOVovaFQ1WUViUDBqcHljc0lCZDJ4S3lSZHNEUTV0d2JWYmdsdU5aQTkw?=
 =?utf-8?B?YjQyM2dzTkF1QmlxYkRNS2RKcjVPMTBhajY0SE5YdFkyRlJSNVhSQ1Z3SnQ0?=
 =?utf-8?B?cWUybFMxWGFqNjdFcmZFWFJwYzRmSEYvbUdLNDlDd01Od2VqNis4TEdqMktv?=
 =?utf-8?B?SVB5WnR5cUQveld6bW1aYiswTW9JMy9sM0Nab2w1ZElXazdsQkNBbUtjem5M?=
 =?utf-8?B?aFFqWHZrdCtSbG5LNVdNSFQ0Z1ZyV1pnTUhtbDdTbVBQYXIwZnVsSHpiTGtT?=
 =?utf-8?B?SXo4TFJhb1dHOFMxQlE5cUcwSGIxcGZmSm5DV2lZczBydXNScm9zWU5tU2ZE?=
 =?utf-8?B?WkVpUlcyN0pTR05vbGlXVW1RYXdGUmlWUzBQTTVSaktRcjBEY0xKdll6RWF2?=
 =?utf-8?B?QWJDOVhwVzc5djV4R2hMR0FRRXhxZ2Y2eW9oZFBHdmVOTUt3NjFLUkVnVDdO?=
 =?utf-8?B?ZHZBV0V6V3NPQlFBOVdFemlob2dSOTRRY0FtYW1MMTBidGRiWmNLdTM2OE9B?=
 =?utf-8?B?UFprdjRYNFYwdld6d3FIK2lJeE1TSFBFTmlRTkVhUXZBNEY5aTZ0Sk1PZWpM?=
 =?utf-8?B?MUFTWkZaSFc4ZHdRblk4N0hCQTZkMDhybml2b2lCNjFQbjRKaHZyV2tDMExy?=
 =?utf-8?B?R1MzbWdySWNKcTU1VEg3Q2k5UGs3VGxpMWVMUlhZTWpyR29TMUhVMlQxc3A4?=
 =?utf-8?B?NGZMQUxvY2p6UHZHVVNBcmNQWEhEMFZUYU1VZ1NKY0JNY0ZrUCtrM3BVUFh3?=
 =?utf-8?B?cXg5S3dGc2tnc2crQkZsMkNqRVVUYTBPekZtazVMU2Z0ak9vV1JFeW9UMVFR?=
 =?utf-8?B?ai9HQ0liL2d0RW0vdm9ITkYyTXV5dm4zME1TY3liY2dwSHBvcXBtdmRoSFZQ?=
 =?utf-8?B?OURMSG05L0t0aW5DZjRsQk4zc3dOZW9acDVPYjNlRXJrTXNkYXN3SVNKcHpV?=
 =?utf-8?B?cWR2QWE5MkxnenlaeGl2ZlBxYTNlekNLalE2SFJWMlpwZldOSkExbSt0cjM5?=
 =?utf-8?B?NkQxVlIvOGtYdnBtR1FyNUlLd29STnQwS2VSM3R3Z0FqWXArNlkxSW1aajJH?=
 =?utf-8?B?S2NoU0kwMGF6ZFBxQzN0dlhjazVlNEs1VnBQZEovMFJGald6MEdXK0RyRjZP?=
 =?utf-8?B?alh5SUhKdlpabzI0dDZwUkFSNkk3RXNIWW1GYmRHR3UzcXU0Y09IQVdKSmRT?=
 =?utf-8?B?NEl2L1lSbmJXenlaaE1scWd4NThYQ1hBenVWU0VlbWQwSk4vdHVKNVcrMk9P?=
 =?utf-8?B?TEVZekROMHdYWDdyd09JUDBuY2NIN0dSY3JaZS83SHFhQ0Rwc09RVWh6WGtS?=
 =?utf-8?B?a2VxeUU0ZEgzZ3F0RDFIRVRqdVZtZ3RLcFRrQ1BsYlJyeE1zdXVQQW9QTUpN?=
 =?utf-8?B?cDEyMTM3MisrdnhUYVdhSm5wNUI4TTMralY0M1BaTmtRY0tnQTMzbmlrdms3?=
 =?utf-8?B?MkVWaEY0NmRyaUpDYUFiNWZIL0xiYkcwNmh1STduSThCV2lqeW5qbTJaSHYv?=
 =?utf-8?B?RUlrbGhOc1RaQzlrZ3UyZWtNM2VPZCtDL2xnQWhuY0NuOS91TlRWZ0tGM2JR?=
 =?utf-8?B?SVZKQnp1QTJFS0RqUjMwQ2VpNk96b2FYYzJyQVdnZnVzSW0vZ0FzRGN3YVlW?=
 =?utf-8?B?N01NbFBsakpSeTNudGpwaTN1VlZKR3hUMUxYYTBlMWt4bHJkZEJPTVUwdkJo?=
 =?utf-8?B?cFpyZWdNbmRCZTYrWHR6ODcyNG9RZW0vTzA3Z3I2UVplY3JMZnljSU1KaWs0?=
 =?utf-8?B?V0h5K091RWNhamUwUXBJMHphYXVRbzZQWGtHZ1BzMi9xbmNsYStsd0FYNDNv?=
 =?utf-8?B?bUdZSk83TTZwa2JhR3pnalNSQ09BbCtnTEl3NHhNZ29lVkE1MnRKclBJd1Jw?=
 =?utf-8?B?emQzckZMWmV1b0E1UXQ0Y3d2QjQ3cklXQnFJY0l0bmZoczFVZm1YcUpqR21l?=
 =?utf-8?B?dzdrNi91VXFUWXlTZzgzZDJPSENyMVgrLzlvMVVDcks1MXdOT3ZzeHRYcHJ2?=
 =?utf-8?B?SzRHczg1WE1wSjRJSkVKZitlUndKc3dMQVlubHNUejhvYWRLSUxRWXVUNGdl?=
 =?utf-8?B?L3FhZzI1L05SK3p5c2VLTkFKeWY4NUNsaHB2QmRUdlNwVURVeWhZK1F0dWF3?=
 =?utf-8?B?bDA5YWNYUjRXVzlDKzRhTEZRakczaVhoMGhmZVZPMU1maFB1UWlsWTNHZmJq?=
 =?utf-8?B?aXhURFQ4RUg2OEV0c3dXcUVkR3NjQ29GRUczM1FkL0JSMnZlSzhsenNFZjht?=
 =?utf-8?B?ajdPbkFydjYrRmRoZ1A5azZNU2RJUTJLaW9FRFc5cGNVWlZTei9Udz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dndtlpwT3KwbwhaV1uEJ1G3KTC2cELbNm87lXlnGjI46Azjrk2JuWnv2AC3UTLIqnM+SJHeQy1+2TJvTo+UqHc+srPS2FN3LrVgfVppXReQrp+UXO7xXhfcblJ2De3BP+rTKDHzu5AFvVt7Yh2VTE9LkSWrOI5W8OSrFciYFZrAwMEJaH3zJTMxC178CusSPF8oI/K96c5pJk6DX1bXvv3BLKSe8nxwwJZpPI3wR4+ZO2a3OR7/Ql7OU/IgCERjsc/zNakYp8MaW7BiZiHOfw8uoCf5HgCmCt3AC4qTxdB0/t/CB9nEs1fFlgf4ryN6YGGCpV+VAc1fLHqSRDPCleQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f1791c-e2e4-48f1-7a7c-08debc004639
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 14:57:29.7205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SJLEL5DkI17UBHsMmfAkwlS7qd3HFIdeusiLmKIXGluTvG6s8WgygNLl+icGxd1UScuL5AQCV9z8iB2kltW/Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4667
X-OriginatorOrg: intel.com

PiBGcm9tOiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVpbmUta29l
bmlnQGJheWxpYnJlLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXkgMjcsIDIwMjYgMjoxMSBQ
TQ0KPiBUbzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+OyBMdWNrLCBUb255IDx0b255
Lmx1Y2tAaW50ZWwuY29tPg0KPiBDYzogTWFyayBHcm9zcyA8bWFya2dyb3NzQGtlcm5lbC5vcmc+
OyBBcnZpbmQgUi4gPGFydmlubzU1QGdtYWlsLmNvbT47DQo+IEphc29uIEJhcm9uIDxqYmFyb25A
YWthbWFpLmNvbT47IFpodW8sIFFpdXh1IDxxaXV4dS56aHVvQGludGVsLmNvbT47DQo+IGxpbnV4
LWVkYWNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBNYXJr
dXMgU2NobmVpZGVyLQ0KPiBQYXJnbWFubiA8bXNwQGJheWxpYnJlLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIHYyXSBlZGFjOiBDb25zaXN0ZW50bHkgZGVmaW5lIHBjaV9kZXZpY2VfaWRzIHVzaW5n
IG5hbWVkDQo+IGluaXRpYWxpemVycw0KPiANCj4gLi4uIGFuZCBQQ0kgZGV2aWNlIGhlbHBlcnMu
DQo+IA0KPiBUaGUgdmFyaW91cyBzdHJ1Y3QgcGNpX2RldmljZV9pZCBhcnJheXMgd2VyZSBpbml0
aWFsaXplZCBtb3N0bHkgYnkgb25lIG9mIHRoZQ0KPiBQQ0lfREVWSUNFIG1hY3JvcyBhbmQgdGhl
biBsaXN0IGV4cHJlc3Npb25zLiBUaGUgbGF0dGVyIGlzbid0IGVhc2lseSByZWFkYWJsZSBpZg0K
PiB5b3UncmUgbm90IGludG8gUENJLiBVc2luZyBuYW1lZCBpbml0aWFsaXplcnMgaXMgbW9yZSBl
eHBsaWNpdCBhbmQgdGh1cyBlYXNpZXIgdG8NCj4gcGFyc2UuDQo+IA0KPiBBbHNvIHVzZSBQQ0lf
REVWSUNFKiBoZWxwZXIgbWFjcm9zIHRvIGFzc2lnbiAudmVuZG9yLCAuZGV2aWNlLCAuc3VidmVu
ZG9yDQo+IGFuZCAuc3ViZGV2aWNlIHdoZXJlIGFwcHJvcHJpYXRlIGFuZCBza2lwIGV4cGxpY2l0
IGFzc2lnbm1lbnRzIG9mIDAgKHdoaWNoDQo+IHRoZSBjb21waWxlciB0YWtlcyBjYXJlIG9mKS4N
Cj4gDQo+IFRoZSBzZWNyZXQgcGxhbiBpcyB0byBtYWtlIHN0cnVjdCBwY2lfZGV2aWNlX2lkOjpk
cml2ZXJfZGF0YSBhbiBhbm9ueW1vdXMNCj4gdW5pb24gKHNpbWlsYXIgdG8NCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsL2NvdmVyLjE3NzY1NzkzMDQuZ2l0LnUua2xlaW5lLQ0KPiBrb2Vu
aWdAYmF5bGlicmUuY29tLykNCj4gYW5kIHRoYXQgcmVxdWlyZXMgbmFtZWQgaW5pdGlhbGl6ZXJz
LiBCdXQgaXQncyBhbHNvIGEgbmljZSBjbGVhbnVwIG9uIGl0cyBvd24uDQo+IA0KPiBUaGlzIGNo
YW5nZSBkb2Vzbid0IGludHJvZHVjZSBjaGFuZ2VzIHRvIHRoZSBjb21waWxlZCBwY2lfZGV2aWNl
X2lkIGFycmF5cy4NCj4gVGVzdGVkIG9uIHg4NiBhbmQgYXJtNjQuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVpbmUtDQo+IGtv
ZW5pZ0BiYXlsaWJyZS5jb20+DQo+IC0tLQ0KPiBIZWxsbywNCj4gDQo+IGNoYW5nZXMgc2luY2Ug
aW1wbGljaXQgdjENCj4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDQyOTE1MjUx
My4zNzU1MDM0LTItdS5rbGVpbmUtDQo+IGtvZW5pZ0BiYXlsaWJyZS5jb20pOg0KPiANCj4gIC0g
UmViYXNlIHRvIG5leHQtMjAyNjA1MjYgdG8gZml4IGEgY29uZmxpY3QgaW4gZHJpdmVycy9lZGFj
L2lnZW42X2VkYWMuYw0KPiANCj4gQm9yaXNsYXYgUGV0a292IGFza2VkIG1lIHRvIGRvIGEgcGF0
Y2ggZm9yIGRyaXZlcnMvZWRhYy9pZ2VuNl9lZGFjLmMgb25seSBvbg0KPiB0b3Agb2YgbmV4dCwg
YnV0IEkgaG9wZSB0aGlzIHdheSBpdCdzIHN0aWxsIGVhc2llci4NCj4gDQoNClRoZSBwYXRjaCBM
R1RNLg0KDQogICBSZXZpZXdlZC1ieTogUWl1eHUgWmh1byA8cWl1eHUuemh1b0BpbnRlbC5jb20+
DQoNCkZvciBpZ2VuNl9lZGFjIGFuZCBpZTMxMjAwX2VkYWMgZHJpdmVyczoNCg0KVGVzdGVkIG9u
IEludGVsIFBhbnRoZXIgTGFrZS1IIChpZ2VuNl9lZGFjKSBhbmQgSW50ZWwgUmFwdG9yIExha2Ut
UyAoSWUzMTIwMF9lZGFjKS4gDQpQQ0kgSURzIHdlcmUgY29ycmVjdGx5IG1hdGNoZWQgYW5kIGRy
aXZlcnMgcHJvYmVkIHN1Y2Nlc3NmdWxseS4NCg0KICBUZXN0ZWQtYnk6IFFpdXh1IFpodW8gPHFp
dXh1LnpodW9AaW50ZWwuY29tPg0K
