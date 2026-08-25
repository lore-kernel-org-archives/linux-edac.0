Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22F930E85D;
	Tue, 25 Aug 2026 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787675192; cv=fail; b=NRl5OjJ76BBO1R/j0oquYQPQZ0lqKWN52KEhuPNcNgxSC56nT5NoWRBPfnOIjxaP9F+8R8Mahb2pXm1598Z89E1BdqtlhYwsjrvCDNeNxU7yKowHdGnItjbVqHNn3Jqqy9Pfe1vTDWjY/lFXFc92/6+j12m630XV1dKRwyJf/4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787675192; c=relaxed/simple;
	bh=0zdfQgq5lbu0tHso9bC6CcpcX6E4P3ikjzvg96yj9/g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kUBhBwsmviuyH/zn9zRjLNrGlT1kgKvWodLZYWEOd10k/kIKJq0c15ZLY0r0oixqG1NxJ2y2Z9hhmj8N6Ue+07Kq+v291b2hBF+pdrjlfrtvq2S1CYlvzt9d4d265GKYL+K4Yp7HdfFPzr/aSes5BPtZ6BeyEru70DTzr1py7tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOn06IJO; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOn06IJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787675192; x=1819211192;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0zdfQgq5lbu0tHso9bC6CcpcX6E4P3ikjzvg96yj9/g=;
  b=HOn06IJOYpmAjqSEg+Py6IjFXRNmbyVzuM/tIns/2X16eLPaXQnQFqCJ
   I/UNmTn0RNFGzIdI2BebHXVsmOPFYMaHyXGGvzMva49eg6W33qmJW4IHj
   8vctLerFX9cjU0TAJdmA5+dOsWxjDuk9+pPr+dzLa9h0aIXGCF7+kPhWg
   1SJFyNLB89PU4umPDS0ocE+slYL6zfxokqGXvvGhuVTmFx/zrWVCMpuit
   K01lDiBa5TFzodiC7hwWAA8BLOzvftNLeBTq2yaZ4Ea0wB8xI/Y2tkEO9
   lDmtNftaodHvTwcAtWlpNFaKDLBztzLWivCMioqcATuQZeMk+7FVNEGTK
   w==;
X-CSE-ConnectionGUID: 5+NDTTFXRRWhHGa7Aj0gAg==
X-CSE-MsgGUID: PB497u2bQz+nNjGwH0euFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98739330"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="98739330"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 09:26:31 -0700
X-CSE-ConnectionGUID: 4kHbOwTsQ8eHcoS4fnW6TQ==
X-CSE-MsgGUID: fSm37aesTqut+d0qPuT8hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="270813063"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 09:26:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 09:26:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 09:26:30 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 09:26:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6vRScmyy0Qa2VE4lvipdl3makrNNjWeBOPDKssR6FeP9Z4Ge+agJERdWNJlKaCab8EEKQZ77vRbVAHgrEH1PFrcwRMhKxDCuHwn+H5NwbScY9Q81UA0UTfIlSTSCPh/9bXpYC6/RUWSQOC+Esp7odzfNXfCV8Wf9TzbF6YOAHrkQoaRGU/p4VQq36DVke/YxPd9/Gv3/IyDJOWIEGITyHT5xU4SV6kvYx9SE+Sb7/zK6iOrKJAs6xSD01o8ybqxo6z59bw0odjL8H3n0D+ZyiMDaNRY9HZPlSUHa97XClMAjpXkwGQPdA5L1QAOBTEvJjmNT7Xf1Etf9Z27n5mhzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zdfQgq5lbu0tHso9bC6CcpcX6E4P3ikjzvg96yj9/g=;
 b=XquTjFYNQLc8Z6BZ73+RJNCbhEcDoLMg28AkRO/sbod2KTYeLSj/ZLUquU+s3oE9PdcZbRKApDTDad4VQaEoSXH6ka4piOzhr2rtj/KEAwCnPfv6Bqk9NVdWoeQYpJ262J0YMAaiPzv1odzT2Zryqi0azFci5EemN065ihnW0NdW4ewuD0RlLHe20GPHxfg7U56rWodSM+YeqFQMi/pU2p7Q9pXxP0l2PuVMWlwmqer77uWmnLVh0G52uRC7nNWoaOEgArIPBug/zy3/BXGos1MnGjUh66DpfMQ/U0SoL7YKuVIG6gxNjUPMhsY26EPCuFDqCM6IhWe+pIv0EVcswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH8PR11MB9506.namprd11.prod.outlook.com (2603:10b6:610:2bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 16:26:26 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 16:26:26 +0000
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
Thread-Index: AQHdMVdZu9LvjxfsOE+e+t5cGld7Oraot52AgAQrAwCAAIaYAIAAQBEAgAEmvoCAABgSEIAAD1+AgAAA5NA=
Date: Tue, 25 Aug 2026 16:26:26 +0000
Message-ID: <SJ1PR11MB60839657B965AC3FDA53C186FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
 <aoiBy3vg9eSvGhIu@agluck-desk3> <aowABmagul44ENde@gmail.com>
 <aoxxxmM-xIpyAE_Z@agluck-desk3> <aoynhOsTCcapwRbl@agluck-desk3>
 <ao2eT0TWS9EaA28N@gmail.com>
 <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
In-Reply-To: <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CH8PR11MB9506:EE_
x-ms-office365-filtering-correlation-id: 3bd0a3db-f062-411b-612c-08df02c59c2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: LSdAOhnqIhHYrJ+rrIQguWNq2pd0F0VgP14uSej0IGOnuy3FECPZMIVC2K5FQfYYxEM3sl4MtKPDAfv69K7rYh88p5kva7hT0AI1ziGabNM7Go14WDlJ9yfs5z4JQgKmYVi3LObEhlouiXtxBQPFFe/nqTwwflKk46RtMF+RWqHY4ZpAy2N9G+TsTLmkTYud6JnEICu2kg/GzW4AHLRaOJlg5I4qQZITHqKOUnhkkvDPLxTxCHR+9nDLxqt88ZgyClEOjN4Qb6USx77h40lCi1vDd9jWvushUe4IQAPtVevcha3OWjH5J4N2ugOVmxRB+26O7NyyljwS8H4sMNw9gDvYT+A2h3aIwBRSx4nO1TdYbO9X7T1i+T6w88klJ/o9x0ewJ4y96nCKP6lI/bCZq6FwtpyhHN8Z45CZKWhPxC8HAWtg8N57DRjjD9WXdRmPgntEpKB0WbbnIMNiWFf4xEz9sicTUB5UGqbrKAyMrgoVV/dTWTo2DBJwgeBwIexx8ZL3m71vzBoswoF2g5qsP+3g0lpg81bCbvzEppxbLqkeY3mmQCYqNFlMybiMh7PnttcjtxHY511GMLFzVexIyo0wpxWHxZ5ct0GV4L1bfVgQUIByzUeDTut84oAHlBr41QK/SjoTT6Iqrqb8oeyc2/vUL3L3cgEmIcw1ZUG485zp+wJTTZOWFtASixjkR/hvlDGRvRYz1JAXZxr4/EuGyVZ2r0KIg3ZUCpxCFsUXjlI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmcyejFoR0FVanJrZm9PeEMzbk9MVVNsMnUyRFJwMGhRaExReHhHMU90NklU?=
 =?utf-8?B?b29IVDIzVk55aUlWbUJLVEdUQk1NOTVLWTJPaFdaMUYxYmpOMnl3cDJrTjRP?=
 =?utf-8?B?aEJsbE1GVlJkSmNVVG1XN0k1WmNXM1ZxN3VVQi84bWFxUGxsZGNHRGEvcHV0?=
 =?utf-8?B?L2VCdWYveWp1QldzRjdad3kyNkZNcHNwUVhBczZhUHZ1cGIwNFkvTmFtZUJz?=
 =?utf-8?B?dzU3Tmgvd05rYXZSRVVXbzF0RWQxb3BEL01tOUFneFZWcThrNHJJZ1pmTitS?=
 =?utf-8?B?SUZnV1pyNE14TlpGMFc5M25YaXFLTXpwYm1MbHdybXVVZ1ZTUGhtUDk0ei9C?=
 =?utf-8?B?OHVGYlNqaC9SeThIMDk0blUvVUZ3SS9BN2VnN0x1U1VuRlJGcUZ0dE5IRDRj?=
 =?utf-8?B?TDZqZnFnenVWbUdxRzJTQTd3Z0JDRWJ5eEpmOHBnRzBPMitlTG5MSXRPRjVx?=
 =?utf-8?B?aWNUaFhSVlJETFRJSGVSUHZPWThnVE1nNDZSVEdZQ29OQWd1b2VhdWhVelVY?=
 =?utf-8?B?Qjg2OXFIbHd6Rm5PNHQraG5Ic3QwNWtVN29vRmRtZWR0aDNyM3BmbldMYTBv?=
 =?utf-8?B?QXRhRkhVaE9OVVdKcTU1NStuVlNJNUxNSkNmTEJlcWhmUkcrUk9hTU56d3ky?=
 =?utf-8?B?dXBYMlcyTEw3SUdsRmtWY3JQM1FRdkVReEJIeVFJVmMyYlVJMjJibCttd3Rh?=
 =?utf-8?B?Tkpya1BDSFZrWStYa1BFQ1VZYXhySmlCejMvOEVHWUt3V0dtKyswTlNnbDgx?=
 =?utf-8?B?S09RVGMyRHF6a1NjOHhyd2Q1T1lhbVptVFdjZ25FakhNVlU0a2dQUWFHdStE?=
 =?utf-8?B?UHNUUTlhcjZMd3A0UngvRjR1bjBtZTRqL1dxOGk2dDV6eEgvUVN3V0RBOTBr?=
 =?utf-8?B?QmUyWEM0R2cyTFQ2RUZhRzdmckhlSkc0NEhyVExkRlNsK3FsS1B3akFaWGg1?=
 =?utf-8?B?bnhSVUo5WUthYnpBZkhJV0E1N1VuRnhRdVFYSjVjK3hrWC9qK2NZeU9rK0Zm?=
 =?utf-8?B?djltdFE4TkhkZll3ZS9lZHBwUFJtUExieTNHbWplTjd6TGZXTi8yZjhkc2ZV?=
 =?utf-8?B?RG9mUTJ0M3E4YTYwWjBGYmx3SVphaUJwQk15aDlwbVNqRjhoc3pibnU2azZN?=
 =?utf-8?B?TG15TzlQNkVwMmZlU295U3ZueVJZZW5OU243V0pMWWozZndHRUhPUUdrM2xS?=
 =?utf-8?B?NGVBTTkwQ3g0aVBNNGVUK0NQZFlVcFppakg2anB4bXNtMHZUTjRDcTFaSXdu?=
 =?utf-8?B?T1E5N1puNktvTzArQno1YWdOemdJRzNocFREcXdoOWxMTkJQR1ppNFZCYkRQ?=
 =?utf-8?B?RVZac1M1Z2lzUEg5VW9CaFdMZWlOZ3hLQmUvQ3ZVSVRTNmZ4QjhZcWpDZW1r?=
 =?utf-8?B?MWdBVWplSjM1NUF4OExKUEFtTU8ydnp2aTdMMFl4eTQrMlZudXFNVTNIN3Vm?=
 =?utf-8?B?VmNBT3NFOVRZZkt2Q3hEMmxqUWpQeHRPQ0s2UVQ0NlMvZkdoSWJ2R2VaTUtt?=
 =?utf-8?B?WlRsS2x3RTA3RGFWZVQwQU05YVhQcnVTenFvMlpCUTREbGllQUFlOU0wVDdQ?=
 =?utf-8?B?d0xMNjhYbFB1SEZRVWxKMlZzRlg1VTFwSFpmTk4wK2UxVE44cVVGc01TMHFn?=
 =?utf-8?B?ejJpc3ByZWtWNHpHNU14S3FLck92S1ZiZno0SlNWTW1CVjk0ZU0wWURCMnJt?=
 =?utf-8?B?SkZ0WSs5YXpmRkY3YVBPYzJaZWcweHl3WS9iRlNwTHNoaTU3RWRPT1FHcHhl?=
 =?utf-8?B?bTF6Y2hFR2NNQktpMXJGOXBiQ2JlL1hsWXZPWGZMZktid1YvYlpzZkh4aXo1?=
 =?utf-8?B?RDRUTHpVbmpOcnFwUTNvQ1diaVNHYTNUcVNQR1NvUVd2NHhLZkQ2M1B1dFBm?=
 =?utf-8?B?MHNMZ2xySU9ZNjlWM0ZNZVV0SFhQSTkraWF2OXowaTlOTXlVMUhVY3l0Q09B?=
 =?utf-8?B?Y0cvbSt6VGhsL1ZVVTdQeklBUlMyWTRna1F5OVpXTHoxTC9mMS8zeE1YT1dI?=
 =?utf-8?B?dkttaytIYlFDSUpsUWtDKzhaN2dBR1JaNkFLRUdSeHZ0Tk9mZVhCVUFRaUQv?=
 =?utf-8?B?emFEUDE2QnBwWkkxSUdUUHAzVTVES0wvckxSZU5LaW1tYytKV0dyS1RhU1NM?=
 =?utf-8?B?eHk3YkFtMFNlWGpLbDhZZlE3Z1NPcDNWVnRmZFF2WjI2c3NNbUMvb2VLQ1ph?=
 =?utf-8?B?Si8wOVBYUzBhaGp0MnIwVDdyUkhyeGJ1Z21mQTU3L2EvTStVSGR5WTE1Rlo3?=
 =?utf-8?B?ZVIyTUpLVS9aTFQ2WldUWW1od1djU21CK3ppNm5HS3VJbzJNS0dJYlc0d3dK?=
 =?utf-8?Q?879C7JT4h+ZRywa21C?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Z42sVTswI8iupv74a+otvel9CWE5rDCjmCgUsX36iaiy2+BTIvuL7mgFYW68jOPMdPCpceayjQ4mcvcys4vpGH0h4E8jg06M12uTuuW7h+fnd7E33Dni/ViPbDuQ6LGY2J+qcxcehJAMdDPSM38fQz/p2P0G1kKAIu5fO60HZqZf6We6VTcWHf2dTL89RWwK3yoIYc03cyDeRfyVcFTRn4M9knuHF9KQOEOpv4Pn1pkDJf+JGFJe75MuXIb+FrCJwsa3t/JUzvktI0GhjqH5WqBP+tfuG5NTmNMbe0Ib4L/Q5inPVRifiyypTq4fyo1vBOjM7ERqTxL25RqZxScowA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd0a3db-f062-411b-612c-08df02c59c2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 16:26:26.0813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EpCiGX3Twch+EK5ljB2dtAKUVKtCzs5Mt5Z35H0301Uzab31SUyvE7wyIBloVtonwdOmQXIT6lDviopiyjoQPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9506
X-OriginatorOrg: intel.com

PiBXaHkgaXNuJ3QgdGhlIHN0cmF0ZWd5IGhlcmUgcGFnZSBvZmZsaW5pbmcgYW5kIHNodXR0aW5n
IHVwIHRoZSBzb3VyY2Ugb2YgdGhlDQo+IGVycm9yIGluc3RlYWQgb2YgZG9pbmcgc2lsbHkgY291
bnRpbmcgYW5kIG5vdCBkb2luZyBhbnl0aGluZyB0byBjb250YWluIHRoZQ0KPiBlcnJvcnMgaW4g
dGhlIGZpcnN0IHBsYWNlPw0KDQpXaGlsZSBCcmVubyB3YXNuJ3Qgc3BlY2lmaWMgYWJvdXQgdGhl
IHNvdXJjZSBvZiB0aGUgZXJyb3JzIGluIHRoZXNlIG1lc3NhZ2VzLCBJJ20NCmd1ZXNzaW5nIHRo
YXQgdGhleSBtaWdodCBiZSBjb21pbmcgZnJvbSBjYWNoZSBlcnJvcnMgcmF0aGVyIHRoYW4gRERS
IG1lbW9yeS4NCg0KVGhlcmUgaXNuJ3QgYSBnb29kIHdheSBmb3Igc29mdHdhcmVbMV0gdG8gc3Vw
cHJlc3MgdGhlc2UgZXJyb3JzLiBUYWtpbmcgbWVtb3J5DQpwYWdlcyBvZmZsaW5lIHdoZW4gdGhl
IHByb2JsZW0gaXMgdGhlIGNhY2hlIHdpbGwganVzdCBkZXBsZXRlIGF2YWlsYWJsZSBtZW1vcnkN
CndpdGhvdXQgc29sdmluZyB0aGUgcHJvYmxlbS4NCg0KLVRvbnkNCg0KWzFdIEknbGwgYmUgcG9z
dGluZyBzb21ldGhpbmcgbGF0ZXIgdG9kYXkgdGhhdCBhZGRzIGEgZHJpdmVyIHRvIGhlbHAgd2l0
aCBhIGhhcmR3YXJlDQpzb2x1dGlvbiB0byBjb3JyZWN0YWJsZSBjYWNoZSBlcnJvcnMuDQo=
