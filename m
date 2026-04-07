Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA35C33D503;
	Tue,  7 Apr 2026 15:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574258; cv=fail; b=uL3oiSAOgnlC6PxMGAbhQQ7RGvci80BJSkClDO/PpnYZ2DGPdC6vHRqEXFIvI6feQ2vSSlTFcNPT50rNtNG8L0XXifzK7cxOXyFHlpvlXmbsEwA8Yx03S4FGKr+v5/FAUbOZ6eC+1wlCo5wplwNY4hzD8ZEPZ0jLMXv2oWCEA5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574258; c=relaxed/simple;
	bh=iBu35ztB7/IVnHhvBmHHWtgMc1i3z1jZKseueoy/+JQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q7bTmYCxy+8GIMYJ8LeAv5qzgS4tl8yj07ck4npVyvsU+sCUN1ZYon1QMhcnQKD+r0VCF40seRrGxWPTPLOXmr11nWqGGkiLurW+o8nxv+cDlDCTRLrgWwTH4uq/vLN4YbOc+YluG8nLaGnIbZWYud3I5rb15NeaXTYD8A+Yr/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7Lf7Cfc; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7Lf7Cfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775574256; x=1807110256;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iBu35ztB7/IVnHhvBmHHWtgMc1i3z1jZKseueoy/+JQ=;
  b=O7Lf7Cfcm/lTCRml0Bvcrlr88SPsTa366ZqquMUNahW5WNnJXlmRvVsW
   QuOFcHshaZF2Y6H5XSMjITD0PhTUziMpecejM4Eeh4j5PoIEeYkwPNLQh
   bmE2wBID/OxxcL5b43oZ+megDMzIZChjYRoV7IhCaRzqtJvkzXgSNbEz8
   R15rjZvG8akk8ayBKdJ849TfUhfv/YFXw+NpLOC0qaGPhMxNduS9WiMEa
   A0KjwzvdC9Nri3JDsZTfBour7BLNhCgHWe+CUMriJMGs2aWdVdOqRkaV/
   xSiuxSvtrmDLogA/bBe9NqbYRpmeT6Esl3uGlewFLSKo8Y/5vkggyCbaK
   Q==;
X-CSE-ConnectionGUID: Ypvu7OZ5Ti+YGJYqljRu5w==
X-CSE-MsgGUID: F3w1YNbWQKiWvGbKDOGtXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="64083081"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="64083081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:04:16 -0700
X-CSE-ConnectionGUID: F72Pw5/MTW2MpVjIBryKyQ==
X-CSE-MsgGUID: /kg+ByXxQMK/U3vUDOVTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="232227551"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:04:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 08:04:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 08:04:15 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 08:04:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJi+1PFFaY1wJldkynIjJLvKGLQRXitYaxOv0YKsYk6Y3/lCCv5zyBYJ+PhURh3GSl/i3lBYcpv6fxTjZx2MFgySGELphHSPtMeRjVftirJQWoCLrK7cOPTX8L5YREj1YgpaX3NMH/GYAvI3dP5hhRJRqrm7KsXHekbrE45N9b1xUYl2gmbVNChRxYao2Q0G7MSdQnC8NSpTM5FWAZE2uBRQgAHWFFKpwVDmInf0dAp+esHNMqXkW2lfz+zDpEpgmfmr4UAFgH4VzAwiQ9RmtRTYZZFlLChEDn7NnIie3SBWMqeBoqn3wihgAYsOnKBjUrcn4L9F2TMUY7RHl/DqHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBu35ztB7/IVnHhvBmHHWtgMc1i3z1jZKseueoy/+JQ=;
 b=Ecv1CRnGWGBQR8AJDBDO7b3iDmpmd+e8RNcFlURySPN2SAUa/FZQQIluhjxs8d34SuL+kP6d27eASXxxZaLXtgrQg8cMcCXxlt/z5zAwA1CQLtpyh5sKDHPisLoTTcIAeiwul9VxEMl0MHJfLPTdb5V4ShjWKLomHTOAQIGE4N9HnymWuNTn/KE8Vxn6cMlWxc/QBQYnJunWIeuGJmophTUVsGTW0IGMVQnRHLprIItjPYyDstSJdfWq0mJmuJ5yRGTfozVZYvUifCoCBoyG6xgk0xQMMrCa2ZZcAZ0QYBZberXIK9R4Gs7QtUqhTHIOqaQIx6jnpSUPj4paEMMYng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by IA1PR11MB9517.namprd11.prod.outlook.com (2603:10b6:208:5b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 15:04:05 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 15:04:04 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Borislav Petkov <bp@alien8.de>, "Li,Rongqing(ACG CCN)"
	<lirongqing@baidu.com>
CC: "Luck, Tony" <tony.luck@intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>, Avadhut Naik <avadhut.naik@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: RE: [PATCH] x86/mce: Restore MCA polling interval halving
Thread-Topic: [PATCH] x86/mce: Restore MCA polling interval halving
Thread-Index: AQHcxhew8U3ff10PFEaAfYGPFnZcQbXTsEPw
Date: Tue, 7 Apr 2026 15:04:04 +0000
Message-ID: <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260114135034.GAaWefKm97-CkbEp4P@fat_crate.local>
 <20260207115142.GBaYcnTp7maUDVv3Nc@fat_crate.local>
 <aYobX83_0kElO3NZ@agluck-desk3>
 <20260210150117.GBaYtIPfsP0Txw7iIc@fat_crate.local>
 <3748e8c7057a4182bc2a361b44dda51b@baidu.com>
 <E4BFF14D-85CC-44FA-A217-603C102B1D66@alien8.de>
 <3431b52760444d209f8460059264cc13@baidu.com>
 <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
 <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
In-Reply-To: <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|IA1PR11MB9517:EE_
x-ms-office365-filtering-correlation-id: 4eb095cc-0b10-492e-8382-08de94b6e918
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: KEicij7ZitXjvaf2c3MaLkKIGfygTj/s9LWqBhA5KBoLQ3OOcWYtbh+YGCrHFgSkTcIrbGqp3lrsb29CcI20tShFSLzt+oyEopPgJ8aNO6WpNaecnhfyyVd5qiASDN9WcDE39rZQ/15mAyXSuhWuwL/K5I5yvbKJ2569PscpLtqldbN7scq4imKX+wfZAIWT1s02q/ZcPd2yj8VMVNTXMU1TefZxb+01sF/Rlfxz+8GqkYN6WutwmZPi04GuwFSC8CaD7RwXNbpBRZktR1b/LEkMKwzcoysxlYXahQK/3pwMvpqQKuwe4lzOXKMeDpm7MKB1LIJm6aoCzRYZDOaABKM3Yi0FnYTAMpN5z3G2Ai4Buz6IdFshwdoTW8vwAxl7UnP+8+Wcfc7n9SV3B/PAGPlhkThtysi9TIW6UO//u9JUEx5dzrsTiPH/ak/I7ddgKTx+Twe0U9tkIM+7Q0f/214gIHRK+wqoAkk87f/D+Rk1pWwsRLaohtn4t6IDNK1pejYiepxqLza0ZPQRpfwNrZRt9mIOqWFDEP9N3wRem7hrGK5K80R8lXDUG7b4gi+3nl4FZh3laKt6PsYTA8P6gE2raK0glRDQktBSt4D476QG6hVovuvrQHpdyn1cj61HdWgNODr9RUsFpCODcsAArciuWysPCsUySIbigC5LmoJ4vNWzL1jwi4mhIUY8Cd8YGxPECUlE3HsyQHshgFWvSFBZc9HpPD4jnULxFXRViMJfnUnAdm+Yvtf2wM1rS5mLmFqLP8NQ65A41wx7IuBZgzXQBqxJGiupre2ZMKQVdWA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFpTdUZ0Vm84NkM4NUFnaStLREFYSnh2RkFPNjVXbjdoaVBYQXhPUngyL2U5?=
 =?utf-8?B?MVRvS1FsVHFzZnB0ZDB0M1Y3cmgzVWRqQjZpTmozU0wrdENmajdCbTJ1VEY2?=
 =?utf-8?B?TFU1SHlZSkFEajNHV2dQbWdFSkRUQkR3cUxuWVR0ZmNyYUxSVW4rS2hJZkVn?=
 =?utf-8?B?ZWJUazNrdFRsNDlWWkZPNXI4cWJRWCtvRmxEY3pwcHcwbmdhVGx1d3lUWk1K?=
 =?utf-8?B?eWxIbFF3Z0lVQ3JFQ09SbkdWT2VpZVlJamVXc3hDWk4xSGd4cmkybUFYRXNT?=
 =?utf-8?B?dnMrbjYrNXZHZzg0N1BjMUtQYkRjLzdqSllVVGtNUFR5OHRtd3NBc1ExRTM0?=
 =?utf-8?B?SFRZLzhRcVZhZ1FFT1czL0oyTjU1eVpYcFZLczNESGZCMW1kdW4va0JENUVG?=
 =?utf-8?B?aVhqWUkrWTVSSXRxNEpsSS9OTjBPbElTZTRobTY2Uy9CYVBTNmp0aDFhYTZS?=
 =?utf-8?B?THQxSHVnOHJjQ2k5ZEJkMktSWGxuYnhmeVZOcVdFaHZaeTVxUG9EN0hTbnJO?=
 =?utf-8?B?MGpIYWNuKzE4SzlWY29VVmtzZnRkU3hWUmM4L2p6OFJTTnFpazBkT0ZUOUV4?=
 =?utf-8?B?ODZ5ZjIwVDhsSWRoR00rbWxhcTJacDd2bHVsaURBdDMxRG5uM3pBbUVMZUc0?=
 =?utf-8?B?NWZLZkp4T05WWnBQeUM3NlE3bk1mdjhTa3RVdHVpK2p1bFdxdUlzYkVuUHhw?=
 =?utf-8?B?VlRrUVBycUR3enU3MGQxR2o2b2NhSEdpVUtnU0g1cXNKK3MzY3ZGUzJRejVQ?=
 =?utf-8?B?Q2puNk5ZZDRObldYNXR0d2pGalN6eXJualRuTHNid1ZicHhEZmlaSkZzL25a?=
 =?utf-8?B?SFZNdU5JM0NvSGR2UFdvamtFSWhZUmR5TVBqQit0ZFdFQ0tUYW9PbGR0SURP?=
 =?utf-8?B?S2luZkEvMXBKTHhMNXZOb3ZOdkg2RDEveWJ4MjVoL3pLbVhqTHpGMDFQejdP?=
 =?utf-8?B?bXZ0QUZialpaMnlGZ3ZoVmVXRXVuRmdBcGNERzY0cW9UMDJjUGhiWHhSbU5I?=
 =?utf-8?B?TU5pbmdEODJWQXVxUFNoZmQvSHFKVEhnVHAyemtlcjNWb1RsOEhPUktLVCsz?=
 =?utf-8?B?bXpJY3pZQnNSS1FNR3hjak9zQXE4b0UyWWFSQm5xWnp5UXM2andNYW1RWmU5?=
 =?utf-8?B?N1c2WTUxUFMrT25KVEpVb1RsVVdmZlBBcmZwNm8vZy9yTHA1MHY4VkV1Wm1q?=
 =?utf-8?B?TGpxL3lXYi83OTkwcndxZk9sTlFrcFFZeEdWdnRQZnJTQitrc0tpU3dmQmkv?=
 =?utf-8?B?VW1ja1B2RDVXdTJKaXRFeUhjNFZkcHQxS3dKRklORWRPbnRmTWpWUkFkcFE0?=
 =?utf-8?B?L3dZNDNMLzJJMG8zd05QdjhiWmUzRFE0Nk5XSkk4WEtpOENIVkw1MjhKOXNQ?=
 =?utf-8?B?a0hIK3Z3a3FQWjFiWGVXTjdHc0tPUVY4eWtyNUZMNGhGcTBtdlBlLzdyRVFC?=
 =?utf-8?B?NHlaV1QrbHVYSFRPNnNFenVjUUFKdHFUaEViTDBEMjhsU1h0Tm9kVkhYSWdX?=
 =?utf-8?B?U1hINmZQV3V5Ymo1Z2IvUFVjODUvZ0Y4OU5QcFpJYjlxS1FxdVozbDFEVzRx?=
 =?utf-8?B?S21TVFRkTm96Nm0rVTVZZTBwQ2JKK3VNTVlOd0J0SXovZXVCSGZMM0VGVlRx?=
 =?utf-8?B?eGVSdFdMVUtYVlVWZ2tIR3F5U0ZndzB3cGxLWGdrVnVwWk01RURoU3ZpQzNY?=
 =?utf-8?B?WHZzbXp2bDNwemVGdHhmOGhUUDZxamQrdm1PWU5SS1lPTXNyVERDVXowYlBo?=
 =?utf-8?B?eHNaS2lGSTArOFpEWmwreTZVT2lBSm1SYkx1cEMzMjVHVlU1aFpuenJHSEFw?=
 =?utf-8?B?Q3loVVJ5OThqY0lvNDh2am5mQ3NVYWVnS3dVek5CdVJVbGZYU1hoTk5JeVpB?=
 =?utf-8?B?dHJiYmxWMDBsN0ErV0xJdFZOTGx2QzdFYklDNFBwL0hhamd6Y2tZRm9Nb1dO?=
 =?utf-8?B?SjV1eSs0YTFrbUZsekpwdkFpT1lIaTQyVTAxVVdTekZoaHdBUTdUempOSmFK?=
 =?utf-8?B?bFJPdUdkQlorbnpBRTNRQWZRZFoybi95RW9Zc25hdXgrcjViaTRBcS9WT2sw?=
 =?utf-8?B?THhFcSs1QnlhYkpic29rYitTRmxZTURRbE00Ti9lSDNrQ2tpVytHWWVHRG50?=
 =?utf-8?B?TGVPaW9QNG8xWmE2dXptcWdKajJJbWpYMDJPZXdwL3JyNWVRNmRvTTZiQnRV?=
 =?utf-8?B?Sm95K05KZ1l5TkZkeXBLNmg3c0ZCOEJqMWtWMUNIZ1JkaUVsa3YwVjZMTWJi?=
 =?utf-8?B?K3R0NHk1a3dMTWdsK3FuT1JnUzFrVnB3MkJYUjBqbk1aZFk2Qm1qZG16Q1FG?=
 =?utf-8?B?WG81WSs4Y0cweDJOVDFOZHlPNCtXRnhMRSsydk8rdyszSUdDdHI5QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: E8FzofRxIro2Yo4kvivzApLDhLAOs2doQ/aD9B4gx0OAFILtav/hRBCPBwbSFj7hNWa1I4nPQt0BcM9LSZmN4RFh0ONNZwz8PkPPkuQBcn9UKButdhX2b/kNqEIc1WEwstVmY0MqBqX2V4a8Nuzx5k/XnqwPFag0IlwA492kwU2bbGmGmdbqLBxsLDi+S/p/bWXct8HxrsWzplq0VHoLe3uy/RnKQ0LsW204H/F6G4wPQPr14QOycL9v2CssSJOR5HPWaxUlbuvzvGDOLydRfN475R1A/xgi8VagfOj+59A85//gosg2am4lG0nuiyFL9of/aLRqZfZ35JBYoN8nkg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb095cc-0b10-492e-8382-08de94b6e918
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 15:04:04.7904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gp0aH0Rl1OJtcin55COxBXjvqbn+ALMoPFJpXkAJWDMnti8LSMmKFUs0u2AmgqskcwsY+S0UhgMg079QGoNVtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9517
X-OriginatorOrg: intel.com

SGkgQm9yaXMsDQoNCj4gRnJvbTogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+DQo+IFNl
bnQ6IFR1ZXNkYXksIEFwcmlsIDcsIDIwMjYgNjo0OSBBTQ0KPiBUbzogTGksUm9uZ3FpbmcoQUNH
IENDTikgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPg0KPiBDYzogTHVjaywgVG9ueSA8dG9ueS5sdWNr
QGludGVsLmNvbT47IE5pa29sYXkgQm9yaXNvdg0KPiA8bmlrLmJvcmlzb3ZAc3VzZS5jb20+OyBU
aG9tYXMgR2xlaXhuZXIgPHRnbHhAa2VybmVsLm9yZz47IEluZ28gTW9sbmFyDQo+IDxtaW5nb0By
ZWRoYXQuY29tPjsgRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT47DQo+
IHg4NkBrZXJuZWwub3JnOyBIIC4gUGV0ZXIgQW52aW4gPGhwYUB6eXRvci5jb20+OyBZYXplbiBH
aGFubmFtDQo+IDx5YXplbi5naGFubmFtQGFtZC5jb20+OyBaaHVvLCBRaXV4dSA8cWl1eHUuemh1
b0BpbnRlbC5jb20+Ow0KPiBBdmFkaHV0IE5haWsgPGF2YWRodXQubmFpa0BhbWQuY29tPjsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGVkYWNAdmdlci5rZXJuZWwub3Jn
DQo+IFN1YmplY3Q6IFtQQVRDSF0geDg2L21jZTogUmVzdG9yZSBNQ0EgcG9sbGluZyBpbnRlcnZh
bCBoYWx2aW5nDQo+IA0KPiBPaywNCj4gDQo+IGZpbmFsbHkuIDotXA0KPiANCj4gUGxzIHJ1biBp
dCB0byBtYWtlIHN1cmUgaXQgRFRSVCBmb3IgeW91IHRvby4NCj4gDQo+IFRoeC4NCj4gDQo+IC0t
LQ0KPiBGcm9tOiAiQm9yaXNsYXYgUGV0a292IChBTUQpIiA8YnBAYWxpZW44LmRlPg0KPiBEYXRl
OiBNb24sIDE2IE1hciAyMDI2IDE2OjEyOjAwICswMTAwDQo+IFN1YmplY3Q6IFtQQVRDSF0geDg2
L21jZTogUmVzdG9yZSBNQ0EgcG9sbGluZyBpbnRlcnZhbCBoYWx2aW5nDQo+IA0KPiBSb25nUWlu
ZyByZXBvcnRlZCB0aGF0IHRoZSBNQ0EgcG9sbGluZyBpbnRlcnZhbCBkb2Vzbid0IGhhbHZlIHdo
ZW4gYW4gZXJyb3INCj4gZ2V0cyBsb2dnZWQuIEl0IHdhcyB0cmFjZWQgZG93biB0byB0aGUgY29t
bWl0IGluIEZpeGVzOiBiZWNhdXNlOg0KPiANCj4gbWNlX3RpbWVyX2ZuKCkNCj4gfC0+IG1jZV9w
b2xsX2JhbmtzKCkNCj4gfC0+IG1hY2hpbmVfY2hlY2tfcG9sbCgpDQo+IHwtPiBtY2VfbG9nKCkN
Cj4gDQo+IHdoaWNoIHdpbGwgcXVldWUgdGhlIHdvcmsgYW5kIHJldHVybi4NCj4gDQo+IE5vdywg
YmFjayBpbiBtY2VfdGltZXJfZm4oKToNCj4gDQo+ICAgICAgICAgLyoNCj4gICAgICAgICAgKiBB
bGVydCB1c2Vyc3BhY2UgaWYgbmVlZGVkLiBJZiB3ZSBsb2dnZWQgYW4gTUNFLCByZWR1Y2UgdGhl
IHBvbGxpbmcNCj4gICAgICAgICAgKiBpbnRlcnZhbCwgb3RoZXJ3aXNlIGluY3JlYXNlIHRoZSBw
b2xsaW5nIGludGVydmFsLg0KPiAgICAgICAgICAqLw0KPiAgICAgICAgIGlmIChtY2Vfbm90aWZ5
X2lycSgpKQ0KPiANCj4gPC0tLSBoZXJlIHdlIGhhdmVuJ3QgcmFuIHRoZSBub3RpZmllciBjaGFp
biB5ZXQgc28gbWNlX25lZWRfbm90aWZ5IGlzIG5vdCBzZXQNCj4geWV0IHNvIHRoaXMgd29uJ3Qg
aGl0IGFuZCB3ZSB3b24ndCBoYWx2ZSB0aGUgaW50ZXJ2YWwgaXYuDQo+IA0KPiBOb3cgdGhlIG5v
dGlmaWVyIGNoYWluIHJ1bnMuIG1jZV9lYXJseV9ub3RpZmllcigpIHNldHMgdGhlIGJpdCwgZG9l
cw0KPiBtY2Vfbm90aWZ5X2lycSgpLCB0aGF0IGNsZWFycyB0aGUgYml0IGFuZCB0aGVuIHRoZSBu
b3RpZmllciBjaGFpbiBhIGxpdHRsZSBsYXRlcg0KPiBsb2dzIHRoZSBlcnJvci4NCj4gDQo+IFNv
IHRoaXMgaXMgYSBzaWxseSB0aW1pbmcgaXNzdWUuDQo+IA0KPiBCdXQsIHRoYXQncyBhbGwgdW5u
ZWNlc3NhcnkuDQo+IA0KPiBBbGwgaXQgbmVlZHMgdG8gaGFwcGVuIGhlcmUgaXMsIHRoZSAic2hv
dWxkIHdlIG5vdGlmeSBvZiBhIGxvZ2dlZCBNQ0UiDQo+IG1jZV9ub3RpZnlfaXJxKCkgYXNrcywg
c2hvdWxkIGJlIHNpbXBseSBhIHF1ZXN0aW9uIHRvIHRoZSBtY2UgZ2VuIHBvb2w6DQo+ICJBcmUg
eW91IGVtcHR5PyINCj4gDQo+IEFuZCB0aGF0IHRoZW4gdHVybnMgaW50byBhIHNpbXBsZSB5ZXMg
b3Igbm8gYW5zd2VyIGFuZCBpdCBhbGwgSnVzdFdvcmtzKHRtKS4NCj4gDQo+IFNvIGRvIHRoYXQu
DQo+IA0KPiBGaXhlczogMDExZDgyNjExMTcyICgiUkFTOiBBZGQgYSBDb3JyZWN0ZWQgRXJyb3Jz
IENvbGxlY3RvciIpDQo+IFJlcG9ydGVkLWJ5OiBMaSBSb25nUWluZyA8bGlyb25ncWluZ0BiYWlk
dS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzbGF2IFBldGtvdiAoQU1EKSA8YnBAYWxpZW44
LmRlPg0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMTEyMDgyNzQ3LjI4
NDItMS0NCj4gbGlyb25ncWluZ0BiYWlkdS5jb20NCj4gLS0tDQo+ICBhcmNoL3g4Ni9rZXJuZWwv
Y3B1L21jZS9jb3JlLmMgfCA3ICstLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwv
Y3B1L21jZS9jb3JlLmMgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L21jZS9jb3JlLmMNCj4gaW5kZXgg
OGRkNDI0YWM1ZGU4Li5kMThkYjdkOGQyMzcgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2tlcm5l
bC9jcHUvbWNlL2NvcmUuYw0KPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L21jZS9jb3JlLmMN
Cj4gQEAgLTkwLDcgKzkwLDYgQEAgc3RydWN0IG1jYV9jb25maWcgbWNhX2NmZyBfX3JlYWRfbW9z
dGx5ID0geyAgfTsNCj4gDQo+ICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IG1jZV9od19l
cnIsIGh3X2VycnNfc2Vlbik7IC1zdGF0aWMgdW5zaWduZWQNCj4gbG9uZyBtY2VfbmVlZF9ub3Rp
Znk7DQo+IA0KPiAgLyoNCj4gICAqIE1DQSBiYW5rcyBwb2xsZWQgYnkgdGhlIHBlcmlvZCBwb2xs
aW5nIHRpbWVyIGZvciBjb3JyZWN0ZWQgZXZlbnRzLg0KPiBAQCAtNTk1LDcgKzU5NCw3IEBAIHN0
YXRpYyBib29sIG1jZV9ub3RpZnlfaXJxKHZvaWQpDQo+ICAJLyogTm90IG1vcmUgdGhhbiB0d28g
bWVzc2FnZXMgZXZlcnkgbWludXRlICovDQo+ICAJc3RhdGljIERFRklORV9SQVRFTElNSVRfU1RB
VEUocmF0ZWxpbWl0LCA2MCpIWiwgMik7DQo+IA0KPiAtCWlmICh0ZXN0X2FuZF9jbGVhcl9iaXQo
MCwgJm1jZV9uZWVkX25vdGlmeSkpIHsNCj4gKwlpZiAoIW1jZV9nZW5fcG9vbF9lbXB0eSgpKSB7
DQo+ICAJCW1jZV93b3JrX3RyaWdnZXIoKTsNCj4gDQo+ICAJCWlmIChfX3JhdGVsaW1pdCgmcmF0
ZWxpbWl0KSkNCj4gQEAgLTYxOCwxMCArNjE3LDYgQEAgc3RhdGljIGludCBtY2VfZWFybHlfbm90
aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrDQo+ICpuYiwgdW5zaWduZWQgbG9uZyB2YWwsDQo+
ICAJLyogRW1pdCB0aGUgdHJhY2UgcmVjb3JkOiAqLw0KPiAgCXRyYWNlX21jZV9yZWNvcmQoZXJy
KTsNCj4gDQo+IC0Jc2V0X2JpdCgwLCAmbWNlX25lZWRfbm90aWZ5KTsNCj4gLQ0KPiAtCW1jZV9u
b3RpZnlfaXJxKCk7DQo+IC0NCg0KSSBpbmplY3RlZCBhIGNvcnJlY3RhYmxlIGVycm9yIHdpdGgg
dGhlIENNQ0kgaW50ZXJydXB0IGVuYWJsZWQgb24gYW4gSW50ZWwgdGVzdGluZyBtYWNoaW5lLCAN
CmFuZCB0aGlzIG1jZV9lYXJseV9ub3RpZmllcigpIHdhcyBpbnZva2VkLiAgQnV0IHRoZSBmb2xs
b3dpbmcgY29kZSBpbiBtY2Vfbm90aWZ5X2lycSgpIGlzIG5vdw0KbmV2ZXIgZXhlY3V0ZWQsIGFu
ZCBJIGRpZG4ndCBzZWUgdGhlIGVycm9yIGxvZyBtZXNzYWdlICJNYWNoaW5lIGNoZWNrIGV2ZW50
cyBsb2dnZWQiLg0KDQogICAgLi4uDQogICAgbWNlX3dvcmtfdHJpZ2dlcigpOw0KDQogICAgaWYg
KF9fcmF0ZWxpbWl0KCZyYXRlbGltaXQpKQ0KICAgICAgICBwcl9pbmZvKEhXX0VSUiAiTWFjaGlu
ZSBjaGVjayBldmVudHMgbG9nZ2VkXG4iKTsNCg0KICAgIHJldHVybiB0cnVlOw0KICAgIC4uLg0K
DQpUaGFua3MhDQpRaXV4dQ0K
