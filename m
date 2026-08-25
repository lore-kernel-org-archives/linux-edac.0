Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DC9360745;
	Tue, 25 Aug 2026 20:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787688091; cv=fail; b=hABmU4FzwiZi2dxLeoPtKo+cEJzBAKkjesYiN42aflQrmzRiax4h3nsugAOXWkkRMZwnj1l3XiBNohmLhjKMNjCNR/LQVAUxIVCeVEVRIXiOAbRN5gsMAwY9O0Ry+5OMcRFnYxKOD3ZO49Qjj+arlFfyJaATbfZGYFqdr3geEjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787688091; c=relaxed/simple;
	bh=+uMrP+9SrdLbKCtRc+2QEep+Y3vAt4kKtpU5QFZoDd0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XlusP2Jh9ZE3jcpsjlMRh16kNAHPGi3P6jolMzoujMpbB7aPMH07BBpirkr/7B56X+r3lrxRdnd8mKCWYHeTVZAEiu2DcxlPHocvH69j7OBq+sSRFTYZS84tGyunCerFGluUS9qpG/qa+RpqRbxL1hzq8qa/gaveEHZTNcBiWmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J55W14N5; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J55W14N5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787688089; x=1819224089;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+uMrP+9SrdLbKCtRc+2QEep+Y3vAt4kKtpU5QFZoDd0=;
  b=J55W14N5SVI+tmk6OucQLf9CZNhmByjvqtNXleBRf3bXjqCYjOwWs8dt
   6rIOPzszrkmJklhi3VCCWN2liBV+qXHIbFZkpLY59V2wJQhBg2V1oHYsr
   jOrSVkHgkzv1Svbwpg5YqMKW6UyLCV1Utsz3D5M8wIPhFyb7QPjcaLDzW
   qFZZHXmHj7MkXYSdo/9I6uRTQs9xLNgImFXeA+bzzh7WrXkC5YHDWdOVD
   n1vtCWnHYmAk53wEo1/GznHlu0QhhdPunvoJCBWo8+JLU/6TdLqqyN5CF
   XuUyhhlL7YD14ifozqZHjPM750ocCPynWpxs4lee9F71EnrezJhsR+mNH
   g==;
X-CSE-ConnectionGUID: tsS3YUFcQsOYMdLIew5+fw==
X-CSE-MsgGUID: RuFx5+3MS9mcOOcL0+bDlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="110947848"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="110947848"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 13:01:28 -0700
X-CSE-ConnectionGUID: 6b1BSez/RJG4oGHPI9WeVg==
X-CSE-MsgGUID: tOkYzf34Qe+sUVrPCYEIDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="267952136"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 13:01:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 13:01:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 13:01:27 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 13:01:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGRbKJ4JFsjMsFi9ghotHauBcjJt/dDgOPE2RwfHOiUxtw1cS1Jer32UDDhHos0ETjFKl07B7wQc5KkXxvzqjUUpuKk0YSt5RA3AwJWCr99RH1ogvBFpwoHE4ZNRCaw0yMLlTkiKCjs+HUteS0PqeCJbu3Z4RI7TYTtSP5ZuFNTICVBm/sELAu/RtTYSl/mVONbU24TgJVGfH/7NT++SVyN8fASOAhJuWR7X3fRXulJ8Q3njpErT6yn8Zoq1xGU5C/DUtjNEUYv1lA/fIxFZ+vQzvROpuOTM+lYv1zKPO+QNnX+yadCXzJuENaVwYIKSLgXVqK9kjU8ozDfn9zM/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uMrP+9SrdLbKCtRc+2QEep+Y3vAt4kKtpU5QFZoDd0=;
 b=caREgpDb3X664cOReiG1BJLRMj6yIe8mTxHDSV3x8A8fd8K4Izxwh7BA77gjyCcQgiccKAe9jdSC/2D1ooCYCEnMoGambtBO2ecFn8BTbGa2Ii414G8Iwv4n0chHlLrSx8WcR9fw+q6N43Y7kSzqenwcgNor0Cn/qjx/FwnO2MekQKfkY1I5zDUH4H2Yn1bXNI+X8yLubLwSfZhk9vb83wtFK/5GzXuOQ7shNONGVJ7LmsYhmiwOM+uIvxtFFnvWHJ3C4/Om5OQ+/4RW1IC3p0bomXqaXEyQhYvV3PrfTIQYgFRJxuOrhDnLohFJS2+cPBr4Ruu8btLopixUT4fIJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA3PR11MB738705.namprd11.prod.outlook.com (2603:10b6:208:61e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 20:01:24 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 20:01:23 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	<rdunlap@infradead.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "kernel-team@meta.com" <kernel-team@meta.com>
Subject: RE: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Thread-Topic: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Thread-Index: AQHdMVdZu9LvjxfsOE+e+t5cGld7Oraot52AgAQrAwCAAIaYAIAAQBEAgAEmvoCAABgSEIAAD1+AgAAA5NCAADFCgIAACXXw
Date: Tue, 25 Aug 2026 20:01:23 +0000
Message-ID: <SJ1PR11MB608315809B99B7194D167D8EFCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
 <aoiBy3vg9eSvGhIu@agluck-desk3> <aowABmagul44ENde@gmail.com>
 <aoxxxmM-xIpyAE_Z@agluck-desk3> <aoynhOsTCcapwRbl@agluck-desk3>
 <ao2eT0TWS9EaA28N@gmail.com>
 <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
 <SJ1PR11MB60839657B965AC3FDA53C186FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825191555.GCao3p63v3fXzwa7E7@fat_crate.local>
In-Reply-To: <20260825191555.GCao3p63v3fXzwa7E7@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|IA3PR11MB738705:EE_
x-ms-office365-filtering-correlation-id: 5d038b62-ccae-42e5-e8f1-08df02e3a3ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|38070700021|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: A0EUJEoTc8Lt5GiZvL00/jvBXg1bLboxpxCLR+1ZsFyndY7FOiEnZVDeUa0kJTt2xyDRxokXvIClyLDIuUyt8negtc6CdA7dqzgYOWGgavawW/m853SmK/g95YstCyUydfpyDeatxL2GLKnnrGn11kX34+/RDy1FP6c5U/LKDt83eoYuRzlsQOyMM7AxPNL/5Z/VhW44BPVH0JsGE7OdFlvpeHDuT1W95xm+8KxjpoNkXWQZrBLFaronuq61onNz3ODvCkv1SPFba/XLYIEqbojcsBUvQpNhtxfNMrs4eTnx72t4FxMwBnoMMXd8xvTtWujWPVYNBfypgtJor/N94kxO6PQDHEkuEMH5qDaz8OEkHx+3i7MI9RNyIgSLam+HwmXs+PfsS1TNrWrtJR4W/8p1MUB58eHHdVqYwfxTyvl+/ARqxcP6vqlwQQPqWsonepbTjckQIJuCFxyfIKser//pR2nedYIw5Csydc87rByA570n8iAHwPnvnGCwESk1Dc47D+Qq3rxssgxBvYC0jlklADHQ2+slbAqMoLuvBVOE+m9CdJKtcgfacaMK+k82zBGivRKKsZINh9zW0R02Yn8Dd7kcabEgtwMUmGjKptLR8P16S9pwF6YxyLmEz0MDni9dD9Cbw/o08zuuXJKAUTj78+YgqPybNZntCENYbL/TaLt3yrGBbv7Ye1wEE+gt6p3l3L3QDE4U8qBmTeviYUor5yN4uWtLgkT6PQ4/0q4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(38070700021)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWxwS2NvNTdjRlplZTlwVTJsRWNJdFh4L29RN0xLSDJ0WHBUY05PNisxc0kr?=
 =?utf-8?B?L0YvTVZyQmJOMnk3SnYxRlE1UEVUWHlZb08rc3JibVdlOE4zRkVyV0Q4ZzFs?=
 =?utf-8?B?TDRZb2JkRHUzdmJScHlwNlUxOXlHZkJPQjNtbHkvUGFKSWM5aVRkRXRKSENW?=
 =?utf-8?B?QU5KcGlqWE1hWmJVb2lMOUpRZExHTUJzSHloNC8zU2ZseW43NDJPR1hkMWs3?=
 =?utf-8?B?bzM2eWZmMmZLWHdpK3hpc2pxZk53Z05zK3owUE82V1VxU3FHYWo1RTVsN0xI?=
 =?utf-8?B?aU43MmVSOVZBZmRxYmJ3WkF5UFBzMm5PRzhIQ0V1MmlwVGtVeFMrR2JsRU16?=
 =?utf-8?B?ZFordXQ4aXBqTU5pNlNwTlVnODM2RkRjT0YwSmNCQXNNQUpMQmhKcjlkYVVF?=
 =?utf-8?B?QSt0ZkYxQUx0Rk5PUWpSLzJFckh4YTFqK3hNR05VV2dwbFlhWVRwREwrOWpV?=
 =?utf-8?B?OWRULzFRRDhCSGhXRXh0NmM0bnFpM3dUM1RPZmpJcFFud3gwNU9LZzZtejd2?=
 =?utf-8?B?b1NmWVMzQVFjdzVMNnNnK3JnR0I5bnU2aXVvcytrWFl5ajl3aEhnUmpROFpv?=
 =?utf-8?B?M2pKUkhOVFNYTmNlVGJ0UWl4SHBhNnZnamZsd1NyTHlsOEZTeXZscDh0ZVhv?=
 =?utf-8?B?ZEpsQ3kvWC9wTlpxdVM1OWRmWnJ3U1IyeHMxUWtya2w2cWhwS1htTloyOXk3?=
 =?utf-8?B?Q01xaG04UkJUWmdFWGtmUy95QjZKRHg5TXllYVFUcHg5b05NTGl3V0VpYURZ?=
 =?utf-8?B?ZVB1Z0loWUg5ZmxYa3lBL085Rmk4d2Zud0Rpc1ZGdlV6b3V5eFpVTkhDTlky?=
 =?utf-8?B?OGdhSWhvMGo3S2Y3UDYvekJoSjAzNVBnZFNTczlLbmpMRkhOelEwV3BQOVZL?=
 =?utf-8?B?L2hEZE1mTjNiUGZWMWE1aytaNmhJcUdOSW0ra2pNeTRQd004R2hFQkxGTEQ3?=
 =?utf-8?B?UGIxVlgvL0tiTXMvVHpuelpIVDVwcHM5RTFaYTIwSTdqbHFja1p4WkR6emVl?=
 =?utf-8?B?L282RWV1c0YyKzkvaWNaZUZZVFFpY3c5VDRPUVcvUjlyVHMyd1BzOTV4UkF6?=
 =?utf-8?B?WGxLOVBJc1B2b1E0U0ZieGFZWC9HYytkVHFmbTRyb0swQzBvc0U5bThEVVgy?=
 =?utf-8?B?UTJSa1U2WGtMMHVhVytrZmNNOFlUV1RlOGRKbDJ3TEZodnBTZnk1RFYzTzkr?=
 =?utf-8?B?MDNuMTlzMGVTVWRSV1Uwb0cxMUJQeFIvZUswYkFmdWxhbitxUUxQUmtWNHZV?=
 =?utf-8?B?Vmp4NTZjeWpaMnIwZElFcDYzSHFUTkxKeVFyR2ZpOEFVemdqTFA4cURObUJR?=
 =?utf-8?B?UGpHOUVkK3lQOThPb243dEZpR0pXYUIxZ3BMejZ4cUZpZ1N6bjFkM1FHUzBN?=
 =?utf-8?B?bXpNc2VDbEY0SE1pempzVWhWRlprbHZtUjJVSFZSL2l2MjJXL3E4YmVsaGpw?=
 =?utf-8?B?Y0Fmc21waXd2N1VMbUhtMzg1dnFEdFJHMlFvZ0hlN3QwMU1iWGh4YVdEandX?=
 =?utf-8?B?WG53VEJ1NU1Qd0V0bUpWUnR6NVdlZlJXcFdPQ2tPRDcyc3FveDR0Q2xxd3FL?=
 =?utf-8?B?WGVienpBclQxUFFPYWJjK1pOT1VMdjNKQ3RUNDZoV1c5RkE1MlQ4MTY4cHY3?=
 =?utf-8?B?a0JIcGZqQUJEUmcwdVJMWk9tZElQcWc1Y0Q0b2ZlUHIyME0xZTNOOUJqR2Ns?=
 =?utf-8?B?OTlmaVJ2dit0UUlIZzRhYmk3eFFrM2x1MUpZSU1BTlkxMGY0dWF1NDVUaXBz?=
 =?utf-8?B?dDVJT0o3Yi9xbU0yOEwvU0JVeC83V0MzVS9yd3lrYkFWTHFWd0ZRRDJVWUJI?=
 =?utf-8?B?SllpaFRFM3J0bVJYSWxDWkNnZjFBQ0ZvTXJQVHdSRlhFelNDMDlsSTFJcG5L?=
 =?utf-8?B?ZjNvVm1ub2dzZUhxSUtvUElINGtrbERCcnlISy9pT1MyY3FoOFgvVkNmb09H?=
 =?utf-8?B?Z2h3SC9vU2g0akRsRG4vNEtiSG9QeFZLZTFQRDlnYjkyQWZyUGFlWWs4T2NZ?=
 =?utf-8?B?cm5VZExmSnlNOE16ZjhEV0E4Tzg5cEk1RURlQkoySjZMVlhESS9OaTJVTXY5?=
 =?utf-8?B?eHlndWo3MFNEUllBWmg2V1VTdWZFQ3B0UnBQTllXb0RHWXNZZjh0NFgyYm40?=
 =?utf-8?B?NDhQamlHb0pBQ2kzemh4ckN3NmFnTnBQeUFjUUNOQVRra3JaRGNTQjFhVFds?=
 =?utf-8?B?ZWwrQ25yeHNKMjk5Y25CYXdwaWR3bkw5UG9XRWpqTGZDR0N4OXJPTGpTL0tm?=
 =?utf-8?B?VXFDYksrTlVCSmV5SHovc2dmNVlSY1dHV1JNMEhySW1FbHh1anFpSXBncjhS?=
 =?utf-8?Q?X4Vzs6nTUHFlAOtwIb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pJpupszInnDahBamWi2qkqAKLB13O/+Nw8ofLYSLgO95Aw8tLhnQoMPNh7U/JZxzijs6TF541eQHjQGqJB7XiN3GSGSXLohi23W/GIXTFw7nrSJ/D7MOdQ/GScJa69UTwWEU6nMKqVMDyU/DMd2Zdcybw2MbWM92svzm9CCGkc7n8ADqxz7u2ShtrwFbxhLBdjAg0VzhuKScZ8G0C+H31zk2M7KazieubWy9jrkrE+vmOhGLXwF+fvAGnz/Y3cCBl6tURkxiTh10rvxO+5EtpR7XbYopd8IRgiA6tynDJD2T3cSYuq0IMpsoTF0WmJSmohzGAGB385aE4CE8+QU+4Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d038b62-ccae-42e5-e8f1-08df02e3a3ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 20:01:23.6863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D5jc3ZZCAj8pla4PulSBGdJa+7hYcS0sFzwY/LbYXyOw8P6gajlRwcYDEwo9v0cOz9DBqNRJqpadbO4llmy8rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB738705
X-OriginatorOrg: intel.com

PiA+ID4gV2h5IGlzbid0IHRoZSBzdHJhdGVneSBoZXJlIHBhZ2Ugb2ZmbGluaW5nIGFuZCBzaHV0
dGluZyB1cCB0aGUgc291cmNlIG9mIHRoZQ0KPiA+ID4gZXJyb3IgaW5zdGVhZCBvZiBkb2luZyBz
aWxseSBjb3VudGluZyBhbmQgbm90IGRvaW5nIGFueXRoaW5nIHRvIGNvbnRhaW4gdGhlDQo+ID4g
PiBlcnJvcnMgaW4gdGhlIGZpcnN0IHBsYWNlPw0KPiA+DQo+ID4gV2hpbGUgQnJlbm8gd2Fzbid0
IHNwZWNpZmljIGFib3V0IHRoZSBzb3VyY2Ugb2YgdGhlIGVycm9ycyBpbiB0aGVzZSBtZXNzYWdl
cywgSSdtDQo+ID4gZ3Vlc3NpbmcgdGhhdCB0aGV5IG1pZ2h0IGJlIGNvbWluZyBmcm9tIGNhY2hl
IGVycm9ycyByYXRoZXIgdGhhbiBERFIgbWVtb3J5Lg0KPiA+DQo+ID4gVGhlcmUgaXNuJ3QgYSBn
b29kIHdheSBmb3Igc29mdHdhcmVbMV0gdG8gc3VwcHJlc3MgdGhlc2UgZXJyb3JzLiBUYWtpbmcg
bWVtb3J5DQo+ID4gcGFnZXMgb2ZmbGluZSB3aGVuIHRoZSBwcm9ibGVtIGlzIHRoZSBjYWNoZSB3
aWxsIGp1c3QgZGVwbGV0ZSBhdmFpbGFibGUgbWVtb3J5DQo+ID4gd2l0aG91dCBzb2x2aW5nIHRo
ZSBwcm9ibGVtLg0KPg0KPiBJIGhhdmUgYmVlbiB0aGlua2luZyBhYm91dCB0aGlzICp5ZWFycyog
YWdvLiBJZiBpdCBpcyBjYWNoZSBlcnJvcnMsIHdlIHNob3VsZA0KPiBzaW1wbHkgb2ZmbGluZSB0
aGUgY29yZSBvciBjb3JlcyB1c2luZyB0aGF0IGNhY2hlLiBXZSBoYXZlIGEgbG90IG9mIGNvcmVz
DQo+IG5vd2FkYXlzIDopDQoNCllvdSBhcmVuJ3QgdGhlIG9ubHkgb25lLiBBbmRpIEtsZWVuIGJ1
aWx0IHRoaXMgZXhhY3QgaWRlYSBpbnRvIG1jZWxvZyBpbiAyMDA5Og0KDQpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vdXRpbHMvY3B1L21jZS9tY2Vsb2cuZ2l0L2NvbW1pdC8/aWQ9ZmZk
MTAwMTQ2MjJkMjBlYjA4ZmQzNWIwM2Y3NTY5NjZmODBhMDhiZA0KDQpUaGlzIGNhbiB3b3JrIHdl
bGwgZm9yIEwxL0wyIGNhY2hlIGVycm9ycy4gUGVyaGFwcyBhbHNvIGZvciBMMyBvbiBtb2Rlcm4g
QU1EDQpDUFVzIHdoZXJlIG9ubHkgc21hbGwgZnJhY3Rpb24gb2YgY29yZXMgc2hhcmUgZWFjaCBM
MyBjYWNoZSBpbnN0YW5jZS4NCg0KTDMgb24gSW50ZWwgaXMgc2hhcmVkIGJ5IHRoZSB3aG9sZSBz
b2NrZXQuIFNvIHlvdSdkIGxvc2UgNTAlIG9mIGNvcmVzIGZvciBhbiBMMyBjYWNoZQ0KaXNzdWUg
b24gYSB0eXBpY2FsIHR3byBzb2NrZXQgc3lzdGVtIChwbHVzIHdlJ2QgaGF2ZSB0byBicmluZyBi
YWNrIG9mZmxpbmUgb2YgQ1BVIDANCmlmIHlvdSB3YW50IHRoaXMgdG8gd29yayBmb3Igc29ja2V0
IDApLg0KDQo+IEluIGdlbmVyYWwsIHVzIGJlaW5nIGEgbG90IG1vcmUgcmVzaWxpZW50IGFuZCBh
cHBseWluZyBhdXRvbWF0aWMgY29udGFpbm1lbnQNCj4gYW5kIHJlY292ZXJ5IGFjdGlvbnMgc2hv
dWxkIGJlIHRoZSBnb2FsIElNTy4NCg0KVGFraW5nIGNvcmVzIG9mZmxpbmUgbGlrZWx5IG5lZWRz
IGEgYnVuY2ggbW9yZSBwbHVtYmluZyBvdXRzaWRlIG9mIHRoZSBrZXJuZWwuDQpCYXJlIG1ldGFs
IHN5c3RlbXMgc29tZXRpbWUgaXNvbGF0ZSBjcml0aWNhbCB3b3JrbG9hZHMgb24gc3BlY2lmaWMg
Y29yZXMuIFZNTQ0Kc3lzdGVtcyBtYXkgYmluZCBndWVzdHMgdG8gc3BlY2lmaWMgY29yZXMgdG8g
cHJvdmlkZSBjb25zaXN0ZW50IHBlcmZvcm1hbmNlLg0KTWF5YmUgdGhlcmUgYXJlIGFscmVhZHkg
c29tZSB1ZGV2IGV2ZW50cyB0aGF0IGNvdWxkIGJlIHVzZWQgdG8gdHJpZ2dlciBhY3Rpb25zDQp3
aGVuIGNvcmVzIGdvIGF3YXk/DQoNCi1Ub255DQo=
