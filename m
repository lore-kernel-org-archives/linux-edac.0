Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A481386C25;
	Wed, 15 Apr 2026 19:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776282844; cv=fail; b=QRe994tGc5kwSDFT4BkYTmPFNupmPXtnC6khbwkKF2QarimgF+5Q+X5u+CafzjfHge+EOYUeo+a3zY65ZH5gCe+TteIpiA3rNKxcw6OmvTs186Pjlt4gvdKkjx08+Txb2tg/tdN++AtyUUYMFb9ZVJWNtR93Uew2BQLf4jYrjME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776282844; c=relaxed/simple;
	bh=wIS2xwfiP4XH8I2h1VBdFpYBJjlvCqkzojBjf/ODRsI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=vBDUnX5W83vZG5Dr0j35zM3LIXzJsIOaVKN7tCnJiOP2a2o7qR1b9NMqL5KxYuVxqB0dEU/3V/J0/a/uph2GIj4a70X7huqoltOKUwPOB4h1PE0MrqmsGEOjKF4DF22ABJaHeTzuSKXmLGEhLBqeYRyptPJaVsWV9Y+yqsRRM2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecywpxT2; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecywpxT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776282842; x=1807818842;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wIS2xwfiP4XH8I2h1VBdFpYBJjlvCqkzojBjf/ODRsI=;
  b=ecywpxT2rX+2P3ZkZi4SxcJR80QVhb/tm+5YlazKRYO0eYIqRqJFT8fg
   sO5iMBt0y4GI80iJx1YgfMlzfjVUNk+s60I3h4KsS7UU9rYFO8N7noQ9J
   QUtfd9eQ0XzQ6dxW/67UR5Q5yERzbxnundJwlDjMzS3G40dNDwXH6hXzR
   bFnFcdSYXEL36DI4o2Ud6hgw5tIuU5ki0yLeLVVE+eeM5lQr38Eft2NcM
   y7AKJcQxFTMuzr3HTDzNXJ9MMGS/DrcmJtWRFFheymb+GRZ5+/mfiEGPd
   u9CVXX8mlw09du6YDvKsU1nSGeeQH9It8mrw/dGGKQjVDcOuUYgPkO23H
   w==;
X-CSE-ConnectionGUID: UUS8FMRaTyGV55V2H544KA==
X-CSE-MsgGUID: qo2aDM6NRf+qtlMzXGTQTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88724028"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88724028"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 12:54:02 -0700
X-CSE-ConnectionGUID: ct5xsSicQ22nCAQ2soaNyw==
X-CSE-MsgGUID: NwsD0xn2R7mwmAgqHhwlqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227350325"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 12:54:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 12:54:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 12:54:01 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 12:54:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjRmQELjGgybpPMMk4xeVt5bvpFoN0ygDHK72HIVXrwBqn1e0NQivRKeg7mgWphWbSAqTv9LgQ0a1MdSlOSx/m+UsKkhaCHPOZJ7pB8RwUOJ51c0VH5IQ8Xbov9liYvDU2RHxiCsSGKKTNQUuZv7hGzFPXhQzJifF1OsDw9ooVQAtC1qjiKFudbfRm42xkssvhH8GFYco3ViNxw8NqdCbt1iU5UubJIQET41x1xu+w+tZcZQeI8WgW25XjEYrYKcITqHAlnNbCCo3NeDhoNHKV8Ad7JzMJZP1+DDhB1zPROAmjy4lnktoFFFIN8cjPiO1RHUVeuemDcItq41UGiWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIS2xwfiP4XH8I2h1VBdFpYBJjlvCqkzojBjf/ODRsI=;
 b=oCHog1uzvOPk0OGgxZAew081ViUtkaOdPPWodmunh45MR1ARPX/pgMqhFs5+rjiEWwAv3ur1Q/4DtXMocOWap2oG7xfAE7EJfP4G0FrDjPsCAtb8tz45Pw/mhKzsAmFFWkdHLIUFucCYHXGSFEFjoyMmj/5zt/CawXXO1pyyw6N6GgktMfZyBREMZGNzWUvKOyrnk6jOzZZh+btTiSA0NuGUCrgiJvP7Od4PfV5qwlgfHx/fsSiunOEaIxAp5v5PqLubrEueYLLvS/XottTxwgI7rgVRGbgiuHq/SuaGXfNapNUjWx1vUYNAcU2OnrZb3Q6FcGDhGlPq/ff0jtsOwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA3PR11MB9445.namprd11.prod.outlook.com (2603:10b6:208:578::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Wed, 15 Apr
 2026 19:53:58 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 19:53:58 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, "Li,Rongqing(ACG CCN)"
	<lirongqing@baidu.com>, Nikolay Borisov <nik.borisov@suse.com>, "Thomas
 Gleixner" <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H . Peter
 Anvin" <hpa@zytor.com>, Yazen Ghannam <yazen.ghannam@amd.com>, Avadhut Naik
	<avadhut.naik@amd.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>
Subject: RE: [PATCH] x86/mce: Restore MCA polling interval halving
Thread-Topic: [PATCH] x86/mce: Restore MCA polling interval halving
Thread-Index: AQHcxhe2durub+YkNkuJuIdUkPV4FbXTs1wAgAtoz4CAABH6gIABYXCAgAAEi8A=
Date: Wed, 15 Apr 2026 19:53:58 +0000
Message-ID: <SJ1PR11MB6083E24844911D87A89BCBA0FC222@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <3748e8c7057a4182bc2a361b44dda51b@baidu.com>
 <E4BFF14D-85CC-44FA-A217-603C102B1D66@alien8.de>
 <3431b52760444d209f8460059264cc13@baidu.com>
 <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
 <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
 <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
 <ad6-H5eihazhqsmC@agluck-desk3>
 <20260415192723.GAad_mm7YFTi7ypK5I@fat_crate.local>
In-Reply-To: <20260415192723.GAad_mm7YFTi7ypK5I@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|IA3PR11MB9445:EE_
x-ms-office365-filtering-correlation-id: 9cb3d3c6-4d51-46d0-a4e7-08de9b28bbf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: XLuPyHDc7N3uslP1M8MmsYy26LTV0T6y1K7o2gWi0fgdqOWi54Gn+c5R4T0QwWw4fAd6pgLaWkxZ5MEWgstwTjMaUJso7+6zB3HeR1+J8CxbmTGAupC8TSGR1gymjGdjoWZ/Ev5Sh8Kwy7jQ09fYYztdTGvziwGPAWYZEQHFS/aVhVIWX1pLGdZP8CUmAgSeuLVvAorfrlgf+p/aIWdU52XqRzIuE7vhmqsBx7z9PBzbp6nuJGzo02r3rlGOKcL2IuMAR9MXoXXr804UOBAW3XHs0gbLHa0PX4BzngXGFfCEmJ2POxb3kDvHJREOzuxsFJKNsvUPCgKK8I3D/XaJB92Iniw0cxbmulz/V3AULA0yysAhPCH1EozJWWACvH9QYID2cTW1Plsg5jrWdHPEPjui5XqxgKFmxnHqRbMzGpoeWvxMNJrz7tBhq7uPa1rN36odHGc72+CUhD9SQBIkOiUZcP5njiQw3ub4NmeRnMtQufAbguGwpkDQ724ELPwfdDYehBGsHR2SLqyj0nOi8M7+fDe2fwoK+F7CrlnY5B6I9eCTQxvljo6I86PWUjWgty8X21XzDtUYL+9ZjpruY25zLnFwVvmPIJa6Kf9rxsWYrEqG1fd/HP0DVB5Ryz0NJih3odTpDd57eM/g18at4ycV7iJV+aZQ8epDqJHVslorBDkEyUPtW+Zfiwo/uH8nqOGoP6H1l9vui4yJgi49gHnJAdIQU5EWO+oYX65sVcqUEWZ3geSX6N8YWKxdedjmE7TBM2mj1Ox1Yu4pH63c/UWdxfX3Ei5HXaxc+lZPkgc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHRvUjF2cmRyczd2OG9IMlRLVmNWcjlvQlNENERzSlIrUjdsS2krbWZDYmhE?=
 =?utf-8?B?eWhrQVFVNk05ZE1UYWZUMk1DMlFTYkg3ZkhrcmVseFJUcnhzdVIwUGNleVJS?=
 =?utf-8?B?enRMdGZzMTZhcm1CMUFlQ0QzMGN4QnNCZjRNNDlCWml4TWVZSWtWbXZ0RUFI?=
 =?utf-8?B?TTl3QUNLWnFKZ3hiRlRtRWlOTlRFWkFpMHJxVXRwU0VxV2pCeXFrYlZJaWZN?=
 =?utf-8?B?SVpLSS84MDdVcU5OZVVOMU1pWm1iOGtYWThtS3ZVcXE0VjBZbk9KUFFPTkd6?=
 =?utf-8?B?cXZKMExMOFNWNWg2SlcrWG9VK1BzZjBDeTljbUtTNnpCa1FaWGpiZ29VTkJJ?=
 =?utf-8?B?Z1lMRHUreTVKTG1URG9xdDlOTGR2dE1UNEo3aEtjUmprV29VQk5adyswS3kx?=
 =?utf-8?B?ejhCNmQrWU43V0dIVHdLN0lxTGE3dWNTRjBRSUNTUnpYcGY3Q2F4MjR0bVBn?=
 =?utf-8?B?bG1kQnByWXRjUzZ4Uk9VTEhyRUNGQy9KTit5b1NjcmpBandNUDUrZ2ROUVpM?=
 =?utf-8?B?bExEQ0FDUkk1RjdmVmpXN1M5akgzUXNHdHpFVStXTW00VmdrVzFmcE1aUlMz?=
 =?utf-8?B?RU94VTZBbnpyZDlpRHpBb3AzNjJ5WldaSG5ySVMrdlZsdjNESngrODJjMkNz?=
 =?utf-8?B?NVU4ZUhRcVVpWjNJOUJMZFJzOVBURG5LaFFZMnV5K3ZBWkZLTXZ0MEIxYzFE?=
 =?utf-8?B?b1JsdXVjOENOUG9JeGRMVFRlenN4RnNzU3ZMTFdJdXBVaEVTWW1BNUlXZ09W?=
 =?utf-8?B?UFdSMlcxWTdoOVg2d0NZYUJ5ODRuS3d3RFk0MkxQSDZBUjUvQU5JSjlUWmw5?=
 =?utf-8?B?UG1ITHhPeDl0QVRaQlZPaXptVGllZHJNU205a2VIeXh6NzFnME5IMmdVMnc3?=
 =?utf-8?B?b080RnM2a2gxVjNDdGxReTBGTnZVd2hmWE93NDViQ1BvaHVjUjJTUTV1UmRm?=
 =?utf-8?B?MWlsRTBLK05xRnpmZXd2RlNIeFpBOGlDK3haK3VUTzNXckRtei9BdnJhTWhT?=
 =?utf-8?B?MFhPby9FczVFWERDcmc1QitVaUJYcFRGcUtFcGgxNTZrdlYrYkhFUm1yRm8y?=
 =?utf-8?B?eWNZUEVvbHA5a1luRDVNZDBUVVVTQ29qSjZteVNpVVVkbnQ5dDM5aFBxUnJn?=
 =?utf-8?B?cytlalpFMGJKS0dlNEo2UEJNdVJxY0lhL0IzZXRuOHVnSVRVSmIxdXJWV05L?=
 =?utf-8?B?OS9jSStLUFM2UU95TjduRlNZY2pCOWp6d0hyUTl3YXdUbEt2YlJUT1YrZzJE?=
 =?utf-8?B?Mk1TUVQ5QVlmTjBtcTNWTjdCODQ1WkFucHhxSlk2NWhRN05MYmZhUUtuYnF6?=
 =?utf-8?B?aDFaSXNnTjNYcXFvVTAzWWFWdmdQRk1TeDk0TURMcVVMVU95bjh2S0JvL1RJ?=
 =?utf-8?B?MGRQcDl0dXB0cVk2c0YyZ1B4L2c2NHV1NTd3c3RLcTArcFJKSHVUTm0vUTlv?=
 =?utf-8?B?S25lNWpYaVFnSXJhaTJWVVNoSW40VVEyd3V5cGdqamd2OHVEZ29IMDhKWDlK?=
 =?utf-8?B?OE00NnV1ZkVEeTVVSlRudkpTeEZpWDNzZlphbzRrMXVCZFE1UHpZQVVIZ3Fx?=
 =?utf-8?B?WTlmc2tkWFk2NEZ3WUs3aWVGTVZuTGsyeXlmNGRScDhKTDhDYUc3dWZFMHc0?=
 =?utf-8?B?SHordzg1WW1sTzNQZlIrdlBVTzhQTG5jaGw1Vm81THRUczJBcmM5dzlKQ21m?=
 =?utf-8?B?MUxDR3UxbkV2N1VTbi9VYUlIVXpFUkkrYUFlZkRSRXY4cWlCM2NzUVRmaDF2?=
 =?utf-8?B?em5FL0orL3N1ZzhhT004SXVwMTZJUVQ5VC9DcWtaNXJmNksrb2pWYW1lV3FY?=
 =?utf-8?B?dzl3UFlpMFJNR2UzQVBKa1A0V3lHZ284OFZrL3pBM0ZjQms0UG9YVDBod2cv?=
 =?utf-8?B?SitrYkdCRElyT0N5YzRMWDM4N2Y0cFRCT0NnRWovWEEwR2liaE5MWE55c1B6?=
 =?utf-8?B?ZHhHRlNrcWcyZ1ltYkhqb2Z2b21MZGtTaFNLT1hMeFM5dFU4VzFFTy9taGVx?=
 =?utf-8?B?TlFFS3kxSTRHRThRekhXb3NwV2FYR0NRUmRGTXQreTdSZkxpN09qK0tOdHZl?=
 =?utf-8?B?WWIveGJwQUMzZmlhakpMVm82Q1p2ZnkxTnZUTVpoemI1SGcxVFBBeDd6ZVpm?=
 =?utf-8?B?Z1o4SEhBU1VYOWd2dkI4WUZzYVlEVmFmWU5tQzAwcjQzVWxpcG9Va2NKZWRO?=
 =?utf-8?B?ejdxRlp3MzNHaEhYbWhCbFh3T1NhVnFqQmxlUXdhSE8rTm9FQTZXRko0RWxB?=
 =?utf-8?B?MU5qQzJ4Vk1zdjhzQ3ArUFBLelNWQ0VabmVQQXNFZGkxSU5nMlIvQkZDc1Zn?=
 =?utf-8?Q?KRmLi/IowZHXtSFErv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VfAmC+JEMxcThWUF/EgtnoSfZ6maPL0a6+UNUlUc67zqcUu1ZOA53B6OTOhKcEl+EJgGDy1cSb/Jih5LwG+B82MuZlLfYbDv4vMdvWsTdfywUXteNdEwQ0H7HzVfzXhiVDrlSHHpDB2Cw81TxoXOdI9FjAyZ33D6wag7El9Pk1hGqrttpmd6faiw5bykz5dQmJlUwdJXthbPA3kSIUXHbYsaLvYSUsetRrXMhCtF/8fidJhLK0tr/jPuPaWDX2JE7N6jpWN1UfuZk+yq1f4cbMndPQoBpSQcccyXCvnNjVQH92cD9NYUxaPBGfyQVUs0z73Dbgfl4PFahp3W292+MA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb3d3c6-4d51-46d0-a4e7-08de9b28bbf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 19:53:58.7638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K00W57MokPO1b72r8F0phzk+leQMo6epG8EU+0kiNLnVcWvo7dxz0HwcSSJXb7n3vUAVkZ+vVTM3gD1WcqKN/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9445
X-OriginatorOrg: intel.com

PiBPbmUgYXNwZWN0IHJlbWFpbmVkIHVuYW5zd2VyZWQ6DQo+DQo+IG1jZV9ub3RpZnlfaXJxIC0+
IG1jZV93b3JrX3RyaWdnZXIgLT4gc2NoZWR1bGVfd29yaygmbWNlX3RyaWdnZXJfd29yayk7IC0+
DQo+IG1jZV9kb190cmlnZ2VyIC0+DQo+DQo+ICAgICAgIGNhbGxfdXNlcm1vZGVoZWxwZXIobWNl
X2hlbHBlciwgbWNlX2hlbHBlcl9hcmd2LCBOVUxMLCBVTUhfTk9fV0FJVCk7DQo+DQo+IElzIHRo
YXQgdGhpbmcgc3RpbGwgdXNlZD8NCj4NCj4gSWYgc28sIHdoYXQgaXMgdGhlIHVzZSBjYXNlPyBJ
cyBwZXItY2hhbmNlIHRoYXQgbWNlX2hlbHBlciB0aGUgdXNlcnNwYWNlDQo+IG1jZWxvZyB0b29s
IHdoaWNoIHRoZSBrZXJuZWwgY2FsbHMgaGVyZSBvbiBhIE1DRT8NCj4NCj4gT3I/DQo+DQo+IERv
IHdlIG5lZWQgdGhhdCBzdGlsbD8NCj4NCj4gSWYgbm90LCByaXBwaW5nIHRoYXQgb3V0IHdvdWxk
IGJlIGEgbmljZSwgYWRkaXRpb25hbCBzaW1wbGlmaWNhdGlvbi4NCg0KSXQgaXMgZG9jdW1lbnRl
ZCBoZXJlOiBodHRwczovL2dpdGh1Yi5jb20vYW5kaWtsZWVuL21jZWxvZz90YWI9cmVhZG1lLW92
LWZpbGUjcmVhZG1lDQoNClRocmVlIHdheXMgdG8gaW52b2tlIG1jZWxvZyAoY3JvbiBqb2IsIHRy
aWdnZXIsIGRhZW1vbikuIFRoYXQgZG9jIGRlc2NyaWJlcw0KdHJpZ2dlciBhcyAiYSBuZXdlciBt
ZXRob2QiLCBidXQgZ2l0IGJsYW1lIHNob3dzIHRoYXQgaXMgcGFydCBvZiB0aGUgb3JpZ2luYWwg
dmVyc2lvbiBvZiB0aGUNClJFQURNRSxtZCBmcm9tIDIwMTYuIFNvICJuZXciIHNvbWUgdGltZSBt
b3JlIHRoYW4gMTAgeWVhcnMgYWdvLg0KDQpUaGF0IGRvYyByZWNvbW1lbmRzIGRhZW1vbiBtb2Rl
LiBBbHNvLCB0aGVyZSdzIGEgZ2VvbG9naWNhbGx5IHNsb3cgdHJlbmQgbW92aW5nDQpmcm9tIG1j
ZWxvZyB0byByYXNkYWVtb24uDQoNCk1heWJlIHdlIGNhbiBkcm9wIGl0LCBidXQgd2l0aCB0aGUg
Y2F2ZWF0IHRoYXQgd2UnZCBuZWVkIHRvIHJldmVydCBpZiBhbnlvbmUgZXZlcg0KY29tcGxhaW5z
IGFib3V0IGJyZWFrYWdlIHRvIHVzZXIgaW50ZXJmYWNlICh0byBhdm9pZCB0aGUgd3JhdGggb2Yg
VG9ydmFsZHMpLg0KDQpJIGNvdWxkIHVwZGF0ZSB0aGUgbWNlbG9nIGRvY3VtZW50IHRvIHNheSB0
cmlnZ2VyIG1vZGUgc3VwcG9ydGVkIGluIGtlcm5lbCB2ZXJzaW9uDQo8PSA3LjANCg0KLVRvbnkN
Cg==
