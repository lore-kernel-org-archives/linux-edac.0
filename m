Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D62B2DEA86;
	Wed, 15 Apr 2026 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260357; cv=fail; b=gFtdIabP7OxwMed858Ad5g/lt/pSLcg4lY56gEsHQKfD0PC+o5rsvKglUMJPYpqwLfhMVHAkUQRQgemrvDZk6XjNGnazCbdjmne4W0bl9tJBwiBS9fKVGfflyR0L/20JYCy4wFEBuwYcu69SU3M/ddzUjmexY1ftwYvfXuDi4RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260357; c=relaxed/simple;
	bh=Q/RPbpDwUcXMuTIBvEePxxp6MOwRObvpDr4FBxaYJlg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MeN4luTTIuMQUEcs+elkI4Rd0PIPuKKddFogDn7XxB9M6GcAFqozdEa/1vKoH7p+P1xZ/8XAerBKVhduBeAsUlqaR0E7Pf+lpJgkfVTsKtyz+CN80Mo23pBRPKZoPfbyWCnjcpsmiMSOykYTWuRml7skmDx7PIVjxwFpu7N1F6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TW8SYjpQ; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TW8SYjpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776260355; x=1807796355;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q/RPbpDwUcXMuTIBvEePxxp6MOwRObvpDr4FBxaYJlg=;
  b=TW8SYjpQoNDEYBN4lsmU/S59YA5TnObxN6ryrsi8G6nMXTQEv/IzSgQr
   aPYbBW16uUIdSF8Z8EgVYYZZFuRUMo13NxL/WN7SX16tMNmRDKP1Fj0vO
   SO80Vb+KelbbzAouCEVFzUnE/jjWuzrWRCKFkxPDPBnI7RZ5LWWKwzTPL
   6zvDePl88Ph/lA6dPUYN/IM/PUwsMJNCM7QfrqZq3iy/rn8S/GHe7fZoU
   PPMxptdsfFHTi4fE4vDxakQdGf5j1SvVA9T/nVjw8flXEBkIOWgweV8V8
   x8gz/DyKC3UIsv30qQ2cNdMm8OHHBM9CUtshBYcYZyeWUBJ7qOfHte8zd
   A==;
X-CSE-ConnectionGUID: vXouHMl0QR2txmb68gahBg==
X-CSE-MsgGUID: 7+ids81cTn27HXzHYWjfiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77111568"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77111568"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 06:39:14 -0700
X-CSE-ConnectionGUID: GitJudmIQQCUkhiXZvZf5g==
X-CSE-MsgGUID: 4eAIczwRR6KhG92Q8ZP+oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="235379600"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 06:39:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 06:39:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 06:39:13 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 06:39:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSdq4WulQ8zY1v9Rhe+ZJaobVlmmqzcnmZgOtSQY58bIKewAsSQrif2+te9qrlutzVX21YrcY+1Ku8Ox7yn7uSwRRxctsNSzcZ/zQv8nLslyeRPS6/NA78QHKsTvNd1lpbYx450X/kZByUYa6F7bbU0PM/Dun6HxvYmO0f3oNmFnlHOC0xjdl+HgpMbI4NC6AqpMJpr21RHzL2WFUGUsIN8ysa+rmt4pjbH0EqTmPs9PEs+liZsvIDhvIu+y9fLzKLklT4piMWNs+J6E97z6u8Wguk5uX664sQvVKEzjUhweKPuzarQv7TwGTqLEohd0XuWwD0/XalAzGpIHwRbEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/RPbpDwUcXMuTIBvEePxxp6MOwRObvpDr4FBxaYJlg=;
 b=BGlxt8ciqoGQiMLjS1g8BOpcW0OP0RkOAHmzBNfuudVnriRSI6jccJQUeItBYidptlX+D4t9UQztJC4MoV+4iygJkqoTuPtmPTHc0MV6k5WG4qQABhZat5jmOORmaYUFOz3KS0Xdl1nuA+asqG3/l5iUmDt+Jr5f+l8C5H6+zNk+BtBUfv3Ib/4jA9Ty2rZsZcNLzhpFdojcKTKJdKyHOONj4s4l/Zqv4v8QrRB1meXYkMomPdsd/T4SIU4Wq6VpdT2wHdldnG6smFzo/ZDuuC1LAXHSCt2iMjXpJ/QsxLcbpUM1qAxP2C7dvNWug1yZpeUbRQG2y9CY5Thfh1iVcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 13:39:07 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 13:39:07 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Borislav Petkov <bp@alien8.de>, "Luck, Tony" <tony.luck@intel.com>
CC: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>, Nikolay Borisov
	<nik.borisov@suse.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>, Avadhut Naik <avadhut.naik@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: RE: [PATCH] x86/mce: Restore MCA polling interval halving
Thread-Topic: [PATCH] x86/mce: Restore MCA polling interval halving
Thread-Index: AQHcxhew8U3ff10PFEaAfYGPFnZcQbXTsEPwgAtr6ICAAQtmkA==
Date: Wed, 15 Apr 2026 13:39:06 +0000
Message-ID: <CY8PR11MB7134A78D08BA698A9EA857F189222@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <aYobX83_0kElO3NZ@agluck-desk3>
 <20260210150117.GBaYtIPfsP0Txw7iIc@fat_crate.local>
 <3748e8c7057a4182bc2a361b44dda51b@baidu.com>
 <E4BFF14D-85CC-44FA-A217-603C102B1D66@alien8.de>
 <3431b52760444d209f8460059264cc13@baidu.com>
 <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
 <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
 <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
In-Reply-To: <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: tony.luck@intel.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|MW4PR11MB8290:EE_
x-ms-office365-filtering-correlation-id: a99166b9-70c3-4cf9-cb32-08de9af45dd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: YD0dLrsVJR+zXnElbWkIdVfzl+u0YiVrJqljigZ+yuwGbA3YEAt/0CeU4U8fF2ZcGdESfpzhs3XS+VDPPtAnpDkCQSau9bZzZKRnsTk7XBbm2XkO7pQia5BC9mmQUfBkTiLOVOmZUeFDvyaAYbhicJkN8oT9fR3Jc21jUnh3cwImHDm0oRjB9dVEdelPNTEyPfV7f2G6orN1F97sMX0+LNJgVrk3yOZCwkWXT0DH7E62bz1P9X6gJcCYDQnr3QwG9lwsIXb+ylNvS/y9qDqS3y0C6Vj5ogtB/U7ILfORF5S03MwkEdvG17gwu/M6rKRadmCncsPXQZfCEFkfcoamFCeQUXznUq9Uh33G1lKKaSP6JoH0cSjanLlTQkdEbgACUyhZak+6NDua4YjOgWKMsxHPAxHCd6i94B/Gt4TpjNW7IP2rqewTTU+doaiwVAh+vYq9DHNMLeRVgB2nQ380ooCU61iavI7fSmpQ3uJ5N8V2juWdAVzgd+lTgnvSLMytWlTiVoRO1JuLVs12qbBO8CS9R9lrxTPiex1nhFXETnjId8QOv7UI42LD/zxk4BByG7TyuoOczECMfm/5kJnXAEcoOmjsaWzOeoi193fxcF/LScgbUZO+dG8inpN/3nzX7i7rBRGytfFMXBhqn0zNIw6wYmLtf4LMO63w8gsR3S80vkJ8if1PUKhUWWlCU2JleI34bDouzllPyfvQj02y/VvumqIInBkAKkCCS8qaTjS8yvKtvIdqEBX8yiYHgavrFxNjg1WrqU0EwuuDWZ/iRoP4saEaDr9yGBSeKLiZNhM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aC9hMExqQnNHS3Z0ZGFhT3lxMmtOS3lEZGluZVNEOWk4WTFWVGFTYmdBbGpR?=
 =?utf-8?B?Y0dBMC8vdFB2ZUEySjdsLzhNVmRJTVlCcmhUbmowSXB4YVo4cFlISEF5Kzd1?=
 =?utf-8?B?dzYvSWtlWTc5VWFPYTVZYXB6MXhPOUVpVVFrNnZ2VlIvTFhXb0hqSmQrQk5J?=
 =?utf-8?B?eTBWNmNqWkdHL1V4bENYVnV4NVRLR0dyT296c1h0MTgzVk1aTXB5Q1hxUDZl?=
 =?utf-8?B?RGl2ak13RFJXc2RDbmNsZURuZFpFTkFMZGxvamY4dmNILzY5VlJ0QnFDaGpW?=
 =?utf-8?B?NU80Y083Y0RLWG9MUkFSOFlkd0lGOUpuVmgrbGlITlRrdHY1U3NLdWI4Vk5Z?=
 =?utf-8?B?Y3hxVU43dCtOMzlRcVV5RnV2R0NVbWIyUkpHU0lIMnhla0c4ZHd3MkJUVHlQ?=
 =?utf-8?B?VndZbjlORUJPczB2U2VkbDlEbGgrZllJYW1DQThzdUlDcmxxeGkyM3VqTU54?=
 =?utf-8?B?L0tSb2xxZEh1VmhRL0h6aVRwOVVDWlg4V1gzQ3hNcTFoVGkvb0Q4VUlDZEp3?=
 =?utf-8?B?SmdOc3dpWUo5dS9pN0FTV3A1NHlOYTArbkJhZXJSTU1NbHdSN0txZkkzb2gv?=
 =?utf-8?B?eXpWaFJESzVWbkhhZ2Z1SlZOclRtcXJCQ2thUWNQbERjTnRVdnhnZ1ZLcER1?=
 =?utf-8?B?dE41RjQwWlF2Z01LZUZDTmszMGN4clRuUWlYZXQvOXMxa0MydFZXWTFCYzhp?=
 =?utf-8?B?YVg3RUJIYkpVaE1yTGNzRFAzT1Z2L2cwS2Z0MTJScmozcGtNVnZsaW1IYVNY?=
 =?utf-8?B?N1ZUSGdBRGk0d3ZRS0xQb0QyaUhqUHJWZG9iak5UTmgwRm5BV1IzTkJ3bnFk?=
 =?utf-8?B?cXpSOWRhU0pEbkppNWZZSHNxS2hidjV6N0VMQ3hkSnpTZlVEU2lUZ05kNjk4?=
 =?utf-8?B?VjBhZjgzVG5EcVVVYnB6UVltMDMvTThKSHFzMTZnWEVJS1JkTkdHUDJESHRR?=
 =?utf-8?B?MlJVNkV5b0s5N2RtZjhHUE1Od0RDd0VQZUd2OE42TzUxakhrS2owMVRWcHpv?=
 =?utf-8?B?c0JBM1RDaDlNVnIrd05jR2ZWaUlCSURKTDlSQ2J1b3RUY2lSaGRIaVM4NHJp?=
 =?utf-8?B?SlI4WksvYUs0TnVvV1VVRzBUTUxVOWMzSkxMUDVZQTk4emNxR09aQnhYcVdJ?=
 =?utf-8?B?WmpuS2NUdENhdVRUenovTG9wajUvNTJYdTVXWXdjZ3ZwUm1sZnI0aS9RaG1S?=
 =?utf-8?B?Z3k3Y1ArVEMxV0dPL2h5M1h0SUY0SzlpNmdSUkRNS0Z3VUU2S0RpUGlUY243?=
 =?utf-8?B?eWNxdmdrMkhzcGdnb3BLTG1iTVNhcHcwaSs0RjdQN09HK0lWQTlwRlkwTlNM?=
 =?utf-8?B?b3pOazJFTUttMlFCVlFWYUQrM0w2Qlc3V29OZUhHUzdubTUyVWhZeEZpOUxl?=
 =?utf-8?B?amFuTk5aMVNIVHdUanU4SFJtMWpFRTk2bWNTbGJERUdLSmJRZDhmejZibmlI?=
 =?utf-8?B?OGRoVjFqTEVMRm9xZWJOenQ5YVk4T3Fqd1NVelVURnZpdTlGUkRJZUlJQVNh?=
 =?utf-8?B?UVVycjRpbTNwc2hPcm9hM1JHK0Q5c0czdHZTc3cwaktZMjdFVEFMTjlQTXkr?=
 =?utf-8?B?K3dqRU5UUUpWWFdVOG9PUHNJWnFHdHFLK1QveTZrUXJhK1lGOEFCMElQR0FY?=
 =?utf-8?B?ekgyZUNCSWY1T21xZlVWTktHRERjTThQUldCNFAzVUh1WnBCb3dNY2VzbE1Z?=
 =?utf-8?B?TUtscFVGaUVOV1ovZGhscE9meHk4dmovMXFRYUJEZFFpUW8wWHNTT09XS1VQ?=
 =?utf-8?B?R2JnMFlmUFJMSzRZMUQxeGtsbzRReGNzODY2R0xTckN2bjRKZElNOHFCR09S?=
 =?utf-8?B?L0ZTMDFCOWlJVUpWWE1nNUdVUXhhRVlHOW13Nm9MZkJlVU9pMjFpaSs3bWxP?=
 =?utf-8?B?cnhJcGNLcnNGTElqdFFBcWVBdUVkMWFBSkFUNERuMUNQRXRKZmFMK0dWb3BQ?=
 =?utf-8?B?bUtCK05jYThBWmx1TExGRFZESGVydmpodWhKck5qQTh5ZmpBNlBSNTkyLzJC?=
 =?utf-8?B?R2VHdm9tZ1JwM2w1T2ZNaWxEZlJyYXE1QnlBaXkxZ2dVZDgvT3JnSDZGVnlq?=
 =?utf-8?B?ZHRwNlhtNU9oTUJ4eCtyN01nZlF1alo2U254MUlCZ21TbXE1VWNZWEdYbnNw?=
 =?utf-8?B?Tm15VWx1TnlGZHBjSjlvcWt5blJYUnlnVW9aOE1PM0tDQ2VyWEZHazBqVVBV?=
 =?utf-8?B?SWd5SWUvNUJsWHRnWDB2RyswcjlianBFWU41cnBULy82WDFheXluRnFPbWRo?=
 =?utf-8?B?VGgxUDEyT1Voek1WQVVkOUpuSnJkZVVBajVJWlNUN2NkazFOZ21naWtwYk5W?=
 =?utf-8?B?R1ZWTlV2dUhqb04vb3p4cFFIZ2JhL1hySU9neDlQVUdYNmlMSEZVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aLVfwepKKbOJxk3DJddYLh4Cv7yq+N0wLH5Lmh5J2ynA/gniPTahZAGZMNJ/5L+TDeb8gzZEhtwCzZVmoomJTDH8NkKzRVRVMHrMLPTNBwZvE8/q0wZ+neSvAX48CQ0+dWUahKsYPmXfYaOFFJPEQsJBDBTlSFDYYt8ZzZrOs8Xvl2hfgy05KolWcRozEV2PPMqoeIOlYUDmXEieFarPkay/XCNWmyZzKlark43Xn1oVGIvs4dmi6OMCz0tYLydq9p+sd/COrKe+JoCdJlFbuogoLCy4m9qY2jVPSJkHP/Qg4kHpu4jMyiMmM/sByq1sKXbrWkuz+UQFYiLK883AsQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99166b9-70c3-4cf9-cb32-08de9af45dd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 13:39:07.0230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Xy0xVC3Htl47Dd3ThKyI7++EIMQiFymEIRzWNw6kC3h2sHY28HGo2muucZbvhwMNBGpTwBqkwIn70iQSjaXdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8290
X-OriginatorOrg: intel.com

SGkgQm9yaXMsDQoNCj4gRnJvbTogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+DQo+IFsu
Li5dDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHg4Ni9tY2U6IFJlc3RvcmUgTUNBIHBvbGxpbmcg
aW50ZXJ2YWwgaGFsdmluZw0KPiANCj4gT24gVHVlLCBBcHIgMDcsIDIwMjYgYXQgMDM6MDQ6MDRQ
TSArMDAwMCwgWmh1bywgUWl1eHUgd3JvdGU6DQo+ID4gSSBpbmplY3RlZCBhIGNvcnJlY3RhYmxl
IGVycm9yIHdpdGggdGhlIENNQ0kgaW50ZXJydXB0IGVuYWJsZWQgb24gYW4NCj4gPiBJbnRlbCB0
ZXN0aW5nIG1hY2hpbmUsIGFuZCB0aGlzIG1jZV9lYXJseV9ub3RpZmllcigpIHdhcyBpbnZva2Vk
LiAgQnV0DQo+ID4gdGhlIGZvbGxvd2luZyBjb2RlIGluIG1jZV9ub3RpZnlfaXJxKCkgaXMgbm93
IG5ldmVyIGV4ZWN1dGVkLCBhbmQgSSBkaWRuJ3QNCj4gc2VlIHRoZSBlcnJvciBsb2cgbWVzc2Fn
ZSAiTWFjaGluZSBjaGVjayBldmVudHMgbG9nZ2VkIi4NCj4gDQo+IFlvdSBkaWQgZGlzYWJsZSB0
aGUgQ0VDLCByaWdodD8NCg0KWWVzLCBJIGRpc2FibGVkIHRoZSBSQVNfQ0VDLg0KDQo+IEluIGFu
eSBjYXNlLCBsZXQncyBoYXZlIGEgbG9vazoNCj4gDQo+IFdoZW4gd2UgbG9nIGFuIE1DRSwgd2Ug
ZG86DQo+IA0KPiBtY2VfbG9nCQkJIyBhZGQgaXQgdG8gdGhlIGdlbnBvb2wgYW5kIHJ1biB0aGUg
d29ya3MNCj4gIC0+IG1jZV9pcnFfd29yaw0KPiAgIC0+IG1jZV9zY2hlZHVsZV93b3JrDQo+ICAg
IC0+IC4uDQo+ICAgICAtPiBtY2VfZ2VuX3Bvb2xfcHJvY2VzcyAJIyB0aGlzJ2xsIHNlbmQgaXQg
ZG93biB0aGUgbm90aWZpZXIgY2hhaW4NCj4gICAgICAtPiB4ODZfbWNlX2RlY29kZXJfY2hhaW4N
Cj4gICAgICAgLT4gbWNlX2Vhcmx5X25vdGlmaWVyIAkjIHRoYXQgZ3V5IHNlZXMgaXQgaGVyZSBh
bmQgaXNzdWVzIHRoZSB0cmFjZQ0KPiByZWNvcmQNCj4gDQo+IE5vdywgbWNlX25vdGlmeV9pcnEo
KSB3b3VsZCBkbyBtY2Vfd29ya190cmlnZ2VyKCkgYW5kIGlzc3VlIHRoZSBwcmludGsNCj4gLSBk
dW5ubywgSSBndWVzcyB3ZSBzdGlsbCB3YW50IG91ciBwcmludGsgYW5kIHByb2JhYmx5IHNob3Vs
ZCBhZGQgaXQgYmFjaw0KDQpUaGlzIHByaW50ayBpcyBxdWl0ZSB1c2VmdWwgZm9yIGNoZWNraW5n
IHdoZXRoZXIgYW4gTUNFIGVycm9yIGV2ZW50IG9jY3Vycy4NCkV2ZW4gdGhvdWdoIGl0J3MgcmF0
ZS1saW1pdGVkLCBJJ2QgYXBwcmVjaWF0ZSBrZWVwaW5nIGl0Lg0KDQo+IC0gYnV0IHRoZSBmaXJz
dCBvbmUgLSB0aGUgd29yayB0cmlnZ2VyaW5nIC0gdGhhdCdzIG1jZWxvZy4gSXQgaXMgdXNpbmcg
dGhhdA0KPiB1c2VybW9kZSBoZWxwZXIgZ3VuaywgZHVubm8gaWYgeW91IGd1eXMgc3RpbGwgbmVl
ZCBpdC4NCj4NCg0KSSdtIG5vdCBzdXJlIHdoZXRoZXIgYW55IGRpc3Ryb3Mgc3RpbGwgdXNlIHRo
aXMgdXNlci1tb2RlIGhlbHBlciB0byBzdGFydCBtY2Vsb2cgb3IgDQptY2Vsb2ctbGlrZSB0b29s
cy4gQEx1Y2ssIFRvbnksIGNvdWxkIHlvdSBjb21tZW50PyDwn5iKDQoNCj4gQmVjYXVzZSBtY2Vs
b2cgZG9lcyByZWdpc3RlciB0byB0aGUgZGVjb2RlciBjaGFpbiBzbyBpdCdsbCBnZXQgdG8gc2Vl
IHRoZSBNQ0UNCj4gZXZlbnR1YWxseS4gU28gdGhhdCBwYXJ0IGlzIGZpbmUuDQo+IA0KPiBUaGUg
b25seSBxdWVzdGlvbiBpcyB0aGUgdXNlcm1vZGUgaGVscGVyIGd1bmsuLi4NCj4gDQo+IFRvbnk/
DQo=
