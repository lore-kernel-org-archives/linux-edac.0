Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F4D4D8D98;
	Fri, 21 Aug 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329131; cv=fail; b=mF2Xa+vu0pr4bZCF48Au5tCraiOP4bcjIW5fsKQTzDePmSrPjymL0VXw3rX6bRSgedibQHOVGey8RKyCcpnUIVRaruMmBuU9eBu6KdIyQ4IQiMLFmox20lna6Un2Dn/Vg/evxK7fJB4rYgk0XOBXYfwzBz2T3sGo8fa1+lBirXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329131; c=relaxed/simple;
	bh=TcJcAK3/wyqFNz1q+LBuCwPB3ZFK3MAIvZTDhKKPkE4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Sq1+5rtRBBA6lOf4bQxqTyKZ/wECG/zFhy62DIC/htnRWIX90XWfsZk1Swo+hu7b3IFFU1J9J/IbIJoMUzlIFe400fFKLue6kp7DsTlqqAGncwH9si5ReeQRXvTsiuAsf+d/nGjx3rqEGEtx54NvrfZnPLklJBoggz6ZPqLemeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ejn1wejO; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ejn1wejO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787329129; x=1818865129;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TcJcAK3/wyqFNz1q+LBuCwPB3ZFK3MAIvZTDhKKPkE4=;
  b=Ejn1wejO8Uz25NHLY/3DHEiFnJM2IIZuX1gBv+peBy6gw383gt9+4Bc2
   DSdT5fX19HxwcD8rKJGbiudszgapEQ5m86c4vnC7bVlPx33pSYONIPwdI
   YNkTlyJnbLwOveC+SJvPPDeDHCuKs7Omphjs0ew/JREo9qaR5xUzwAZgn
   cJC3PWOtYIh23kXQMdjbsiaXyhtK+o/l1Z7oSNDCmZwpPoM0HBmZZ+avU
   w14MVe5jbVrh6tG9Ofu4B6/8UzsWk6ZG74da1SaWhASYgQXIwiehuBNU6
   uy7yqC15VM7OQU0EhrKju7PtjTTGDBqjylMLUdWUid3Q3MiQSWfPH1yU4
   w==;
X-CSE-ConnectionGUID: VP38mPHXQKON6sLuQizaJw==
X-CSE-MsgGUID: 5UNNOTRwSomkDaXdnBpq3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="75418708"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="75418708"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 09:18:48 -0700
X-CSE-ConnectionGUID: D6Q1mOYiQleGL8ZnadhoLA==
X-CSE-MsgGUID: gYsMrJJVQiuYDfokLyCOZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="270618736"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 09:18:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 09:18:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 09:18:46 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 09:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2HTkLEN4DPtQ+2KRu+4/59kXt7BTzj7kF85t7QHjgrmR9L+Y8SAvQkwqTHxCSG8YKzbC7eYyE2AZTibiVY7WuG8DPkMHoJQnkE3r18QZ22ePFyLgvJMqwf2Xg76RX1ZNJWQcblN7MxGIuDyLppQqjBQkq4ZmsH60zMoL/z51zQAKBjNKG9FtDEF0HqmTILKEUEprTw6yfPTYThdaFtsacrsLTHLNs/xGCjEmxbCuQfpXQoNYgUCFjZgT6Mq2gqwR1k3tYQMyDonT5SPCE2DmJlTe8ecPkGDHw9kJrCfF9IMRVLg8MiAxEGhHh+AQgiF+26cTzBxvhfjXmBbDpe35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcJcAK3/wyqFNz1q+LBuCwPB3ZFK3MAIvZTDhKKPkE4=;
 b=L3dsTfwaWt5wXVxKIY2yWvmdhMSIgoDEvKjAXBSSIV6X+4b4JnRpHce3lXYFTynB3QhgKF1Wd7AfB6nDBDHeDCdPnABP5dRMvFRfCJ53ROJv+08qU7M6Ky9AFrSZkQxRhPs+wc2EVV01idX3T6Lo91tWSScFfa5Iem7BQjdEyqeBxdQ8BeNzqyw8VxrZpxJ7pkjooEaW66OpM0VIuNiAmuP/F6GZkedGYqtHSatq+O+9tnP2fWwCmCMSSD4CKbDjn8RxUOGDiQLj0mUWQs4f3wRQDQpVJmZaFTtifHLqmT5IC/ZqfYEjarWV9iOARXwJqSzi9DnfXN0Y+pKH6rJnCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA1PR11MB7294.namprd11.prod.outlook.com (2603:10b6:208:429::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:18:42 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 16:18:42 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Breno Leitao <leitao@debian.org>, Borislav Petkov <bp@alien8.de>, "Thomas
 Gleixner" <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H. Peter
 Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>
Subject: RE: [PATCH 1/2] x86/mce: Rate-limit the CMCI storm transition notices
Thread-Topic: [PATCH 1/2] x86/mce: Rate-limit the CMCI storm transition
 notices
Thread-Index: AQHdMVdSEb0+L9ku8EKYUUUp1Df0fbaorl+g
Date: Fri, 21 Aug 2026 16:18:42 +0000
Message-ID: <SJ1PR11MB6083DE19F9E5E6BADF22A237FCA32@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-1-7a465c708d82@debian.org>
In-Reply-To: <20260821-mce-panic-on-storm-v1-1-7a465c708d82@debian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|IA1PR11MB7294:EE_
x-ms-office365-filtering-correlation-id: bc1dd89d-49f4-4d33-234a-08deff9fde41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003|921020|38070700021;
x-microsoft-antispam-message-info: B0F7+alFsyVJQP/9i1RnExVuWXUssQDpu10G7T6XhFiurgvS+j2CgQY60Xcvn3TPM4JYOzeGMNafopcW4KcFzQPoivD9ht2iQD+TmesJokfZ04fCDUyKplYpdB0bm+SN1SHKT0lqQXEnNj1SdccHTWUULmJHSJd7NeYadyAar7CAjvjRtPTyaKR7CkyVCuOzpYiQwpe68Xy5ZJ5WQtXF7G6j8rM5W4eSHdiXZcijF/+SDVMxL8eM+c/PlUg6z6yvIL2nfgRX6aIigBzGneqtz9Vfibc4ycz+Sc+SqhmP9IcZwC1o8cDrqYgElnpGY1W/tz4U20r12UKPqJgqp2lRQwPpusqaOF0q5Qji6yEoFr7w1Qngx4vLapfGBhewCDmjycmv3oELbE17dZhYgimA3GWsaAErznCqPSDERVipxa6XCwuRyWKzgLXdKYNAHXvhYNSGxbRYENeuGMocicOrh9WMNMD8tzF5gsBEEncgxjj8rBdpR7jaNq/io5OsgnR/Md4abpGItcswjRA6ECZHIxFMGAOCppLHJcNpWXnkFeIlKPat4DHF0Xn7pwoLMpJlLkTf7JEiWdlL7c0gpG6d5gPxOn4cf06v6xDcvKSVGOU4XmFNCp8jTfP98SayUZfQqpG1TUMuhWx2j6y/7Xu6wTKcKg8TlrIitXYrIAdMh9LXP50O17YVnlU0QZWalsm5D5q56UWH18tJjkdTYvxan5JYV5vrtduqeccKrKB3t1k5aIZ/t60YvjhGjl0PGxas
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXptMzJ2aEVNVzJ4cG5oSDg3WTgxS1ZXRVpMdjU2bTVuNm16TTFYWG5JTTlG?=
 =?utf-8?B?VVpsY1J0MGYxeUl0dUdCTEhiRFRZNmZJNXl5a2czeWROWXNUaTNFVFdoU1Zq?=
 =?utf-8?B?eE8zZWJqakV6cjF4YjI4eTdZZ3d5VGwwdkZZV1JSN2NaRGdRL3ByNEN2YkVZ?=
 =?utf-8?B?UTVUVklRbnRrTjQ1UjhMUlBnV3duU1VNUS8zTG5VMXF0ZEQwL2ZRWUU2Vlky?=
 =?utf-8?B?WGNvR09tYW82a2NVZXlhMlZkbnBPbUhteUdyMkx6TmJwQVpuU200VkVYSDRB?=
 =?utf-8?B?cGc3cjF2YlNJNkZETHpOVEl1dEwwVTJlbk55a0prZkd5dFZLSWk0aDlSN1ha?=
 =?utf-8?B?NjMwV05qenRRaW9RN3VPWmVWR0hPRzJGdlB5d0xtVGRIRmF1U1VLWWg2UHls?=
 =?utf-8?B?Z21hdkt3N1F4L2FPb2pvcUJzT21vYmQrLzg0Qlo2UFE1bEZWWlhrVEl4N1BT?=
 =?utf-8?B?Uzlac1JnUG1uSmN3VWVUaXpzcUg1dnMzWU8zNWNieTFLRlB1NGRBZUlYWDdt?=
 =?utf-8?B?Q2dHak0xYnl1RHhrc2YvSTgzNW9xOFdVSEY4ODNyQkZhY0gzUEpOVGo5cUw2?=
 =?utf-8?B?b3I5NDBjVVlBZWtZdzAxOHBrcmxTT1krMGszUUVyc1crS0pHWTdBYUVTR29z?=
 =?utf-8?B?V29SVk52T1FjUDhpN0gvNkk3SGFla3NUYzhLWThWYU0yc3h4YVNGU1Jqc1ZF?=
 =?utf-8?B?ODZudXRUMEExN2dvQXNKSjFSNFVCRFE0QVFBRnQrbVJRN1B1TEYzMHM0akhr?=
 =?utf-8?B?MUo2U3FCNjlsbkFFRmFYVGxWTm1CbzR3aCt2eUxEQWZsZ1hSS2ROdTRDbWZO?=
 =?utf-8?B?Z3hjRVVnb0tmd0RNcHpCb0FIdnVZWW9HaUpWcmZjbSt5YXdDVnhvSU91M2Zj?=
 =?utf-8?B?ZGYzZTdndy90WEFIQ1NGZDhCZGJPYjlPZjZZVDJmWGNZRFpBVkh5TndoTGdO?=
 =?utf-8?B?UHBxcGdkakR3REZvQlVTN3l1cHpIZVdteFJRZHEwMWhGTzhJSlpNT1FnM0tC?=
 =?utf-8?B?c0ZRaE5VeFpzYmFGS0IyM2h4YTByaEo2QU1aQ1MvUTFoVlVCcFJHTlFJcFh0?=
 =?utf-8?B?WFRrQzdYRmVpbGtqM0d1WFpPSnoyaEx6RW9EcTk0U0YrbkVvOFlqQnRjWEtz?=
 =?utf-8?B?amhJelhZdC8xeDBXdTZXcTJGcStjdXdIMFBzVHNGcTJLd2tCbWl5WEZUNm9v?=
 =?utf-8?B?MXo0azIxbDFqZFZnd2laM1ZuUEY4R2Fnb0tGMmhXc3lWUUdkZmxtcTFuakVD?=
 =?utf-8?B?Y1dxb3NZellYNHE1SXhhdnVGK1ZmUWIrczk2enhIcDV0RFIyQjJzR2k0K2tw?=
 =?utf-8?B?VTVhdHZadDZjRGw2NXQ4RExLeEY1b3U4MW9KamhMdnpyd2N2aFBXbVhTVlZn?=
 =?utf-8?B?UlZKdGloTGlnN2gydGl4RFpPa3c4bVFoYXdUUmdsZUFKS05wYkgvYldLdG5C?=
 =?utf-8?B?dXVJNXFWM0FVVENFaU9iSm5wMjhkMHp1a0FHdXhZYXhQMlB3UUhWM2RCVjl5?=
 =?utf-8?B?WlNzM0dIZVNVUEJoWXJRcWM0M0NnczVrVFlLMHp1dmxvOVRPd2lLNml2Ri9N?=
 =?utf-8?B?ZTVhSjNYVVZDYkQrSjB1OUNZRy96UWJPK1E0Z050aStWK1BoRkY1cEhLZ1Bu?=
 =?utf-8?B?cUZmMkxvZ3JEMndsUzh2WGs4aG1SZTZrV1pqbklPb3dQUnRadlpmSW1oSWpa?=
 =?utf-8?B?MXU5OTRlblQyc0U4dlh1MFk4Mk9yRlRPbG83cnk3eUtiZEEzM2NjaldEOWZh?=
 =?utf-8?B?cVZhcncvVjh2Qkc1b2ZTVW5PaWpqVktlYmRqYmJrNUg4a3pCQVdYN1NzQVlj?=
 =?utf-8?B?bmI0NVQ5UUhnc0FNMmZieUtzRlYvcklnU05velVzVFdscWpGblRoVGZBTHhn?=
 =?utf-8?B?WVRrVlg0TXdYWTcyUnJ0dWduVXlFSWd6Zm8xNXRMOTVYeVVPU0VhVEhNbnh1?=
 =?utf-8?B?bVVaY0x2WUFUSTZyUEtmUW5KUU5rc2tCdmV2ZFVqdDN4V3lEYTcwUzE3TnQz?=
 =?utf-8?B?dVl6eXFndEIrUEVKNDFaeWJDK3ZHN3ZmamRRVlNJdlltdElMMUVQeDk1NExD?=
 =?utf-8?B?aHF5b0pBRndseHN2VGF3cGNuM1dwY0VjV2ZyK2l0Y0FIN3V6dFp0T2orN0V3?=
 =?utf-8?B?ODQzNHM5UC8zRk1wVEpQaU1xek40NTF1R1pmK1kzTzJieEp3b0k4Z0Q0Z1J1?=
 =?utf-8?B?MzRhLzQydVdCRUJnRmN6cWVNSkYzUGxUaXhmMlJRdzFzL2poS2N4MGNJOUsw?=
 =?utf-8?B?U0RaZWtMTmttUzZSeENMSjZoZVlLTi9OdE9ZdFlOb294RHFsZUcrRmNraFNL?=
 =?utf-8?Q?vD3a8AMSxQXl193Hhn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QqXBCAoHf9eTd2fG7d8Ddex6WhrM7O1wiaEWny1NKqmOIS8KsAeaI44uN5w6o03oRGK5b6JvBhNCNig63QSlj2qVaC8rgwV4EVSBexEKq6mg+5vrvogKtNMuxLA0Ud+YtwRaupkPGmQNtUHs2r/AvmE+Vtyjvs7xU3kwj7+P4VjNpz1NSvdk/E9dlrlMrNga3uI6p5htNdcA60AEarOSLUhGYJyfJvylA04ZNXG3sBXv3BhhDr4zD70JEgpycbXejAq22gE+KL3DoJBRBTjIlvcSkvWGT+fmv7kmH6kjGNXpRFryeplXLy/u+32CuWIB9JuuK+U6SG1dp8wmLLsOnw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1dd89d-49f4-4d33-234a-08deff9fde41
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2026 16:18:42.6236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DpdaECw866uXKHvCc30sER/XAzJTIbCQJyC+gk47+dJDYCbjDeBpv5TgVPgbcuneQWdKH6Ic7WAGTvMRDjT92Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7294
X-OriginatorOrg: intel.com

PiBPbmUgaG9zdCBpbiBvdXIgZmxlZXQgbG9nZ2VkIDk5NzA3MjYgIkNNQ0kgc3Rvcm0gZGV0ZWN0
ZWQiIGFuZCA5OTcwNzM0DQo+ICJDTUNJIHN0b3JtIHN1YnNpZGVkIiBsaW5lcyBmb3IgYSBzaW5n
bGUgYmFuayBvdmVyIGZvdXIgZGF5cywgd2hpY2ggaXMNCj4gYSBiaXQgZXhjZXNzaXZlIGZvciBh
bGwgbW9uaXRvcmluZyBwdXJwb3Nlcy4NCg0KTWFydmVsb3VzIHVzZSBvZiB1bmRlcnN0YXRlbWVu
dCENCg0KUGF0Y2ggMToNCg0KQWNrZWQtYnk6IFRvbnkgTHVjayA8dG9ueS5sdWNrQGludGVsLmNv
bT4NCg0KLVRvbnkNCg==
