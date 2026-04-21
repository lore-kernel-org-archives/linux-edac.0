Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90C312836;
	Tue, 21 Apr 2026 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786556; cv=fail; b=AV1Z9nyDE3ZeNG0X9Z5Z5ciHPBd+O6bnAvfeNuMjGr7CdniZxwkD1xMELFaD4fIeQ7p9MDdeUWlpisySyuzLV0CAJHgM4EOcpSMAyVMeJFyg/UdOIJAP+KE7aijlj4WJsSx1cjUQHooc7efH2OHolEUJnV4aWCdnqvw7gR0H85Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786556; c=relaxed/simple;
	bh=iLweMaSheEXQw446SBj9OzDgqx6TNNbNi+ryyXPE05w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ochk3rntanU9nKewuWQuigrKzCNXMNAal7L/rJKl1BSwc91W75DUWPOX8EhsmPVPf3DKlGzIiAs6lx4ZATz96OUSLGU/GFQSMPUjjxIPTjPSt6R9iJjVZvKx97LRb9q+8gUC1f6O2oVRlNu2XU9fyeXenca4KAciF0jHCBnXboc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLOM0P/z; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLOM0P/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776786555; x=1808322555;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iLweMaSheEXQw446SBj9OzDgqx6TNNbNi+ryyXPE05w=;
  b=JLOM0P/zBmRT0Hcp/wZsao9gdDNQWhhTic8Co6fK0uwzLHud88MPTpk8
   nIpTqwADY0lhRG8i5DdZVdvNKhWKdC5yDPFaeh3C+4k/eTOYuMw6XkWXH
   hoF6hV7zSoh42OLRRTq54+duig1EhK4u+ViH7l48Uvvuks9QwE6P6KSe1
   hio1mEVIizrnXKAH0Hmax17v4Aba6/vfuCzgpz59DyOW3XMefTVSCLUK6
   hIsdgr0pGILAL+Z/S9eenx6qHN/yooKkv/2Kvg5PJJAmoo7/g/BHMq+HJ
   myKA4xKsvRLtsE/BordCgH3swde0VQa3EgSjnuxw2wfOYR1J9fFlb1ZTB
   A==;
X-CSE-ConnectionGUID: QEIaw56GQh+62xUFg1uuKw==
X-CSE-MsgGUID: gOJzeYQDTDqRMFTuVnE/ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="80310900"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="80310900"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 08:49:14 -0700
X-CSE-ConnectionGUID: lXwUesFNSG+jeVL80rICvQ==
X-CSE-MsgGUID: pbmA1TqGSFOZbnVpd/TNbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237049047"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 08:49:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 08:49:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 08:49:13 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 08:49:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIZYfrGGUKMQNadd7FBqGYy/5wHetNaWr3eVW0q3B/xmjA9AJehGH4IEV7GkhYhXzS6IFAEZxkdgX9MY9PaNnHnuJE6FEMfWZnm01S3PoEpX8GdTDrbtUlszt2WRS+y61FK61pqUKzeSxIfBQL0Imdou+CfpA6COEIyLOjq4fkT+E2YEdF97Y2g/Y11H6Juxaz1dFXih1MHj1mvWd60J1j7K1+s9Sd68xT4KkTIATqPq+P/vCmFbWi8CmI+L4vdw3vfYJaIi4IVLsojPoEhELK3lM5fuqlPnpzPIhRxeVoN6FYogSroDs1w/NH3N0lbn9efIjE009rBar0PpTAObOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLweMaSheEXQw446SBj9OzDgqx6TNNbNi+ryyXPE05w=;
 b=GIGdYN02NSqAwdqrMBaYS0ZQqbabW1/uQHBYX4uqWGGh83HjkvCSFOz0eqRk6rbDohDsgrEfo9jJsa4qMefVXzMYWvQC/Zrv0OBAUrT2U5Orh01PL0EDbpzHzFlax9QVaQgZpqkgk+ky4FX7r/Ryl9nFYUv3iuygCdNREFuH8lnWsOaKKgZNHloDbAaBA/eHE6Tegg7ZHmVEqF0PPwrDA4E+N/IEBtisgqHIhtAgG5ybYe3umYsrLpUHEMPJgIqNrBIGmwP1UW/xxbDzaUAbsbbnHbCmVZltnkynk6NyALbToU0/ajtreBuB7XMPoUIQS6SPn50gvAa4WrgtYHklFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 21 Apr
 2026 15:49:08 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 15:49:06 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: "Luck, Tony" <tony.luck@intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>, "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Dave Hansen"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H . Peter
 Anvin" <hpa@zytor.com>, Yazen Ghannam <yazen.ghannam@amd.com>, "Avadhut Naik"
	<avadhut.naik@amd.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>
Subject: RE: [PATCH] x86/mce: Restore MCA polling interval halving
Thread-Topic: [PATCH] x86/mce: Restore MCA polling interval halving
Thread-Index: AQHcxhew8U3ff10PFEaAfYGPFnZcQbXTsEPwgAtr6ICAABH6gIABYXCAgAAHbQCAAAJCgIACmzGAgATPNhCAAX5gAIAANn3g
Date: Tue, 21 Apr 2026 15:49:06 +0000
Message-ID: <CY8PR11MB7134949131A571C48A6A5C3E892C2@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
 <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
 <ad6-H5eihazhqsmC@agluck-desk3>
 <20260415192723.GAad_mm7YFTi7ypK5I@fat_crate.local>
 <SJ1PR11MB6083E24844911D87A89BCBA0FC222@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260415200203.GBad_uu1gC_V_LFH0u@fat_crate.local>
 <20260417115001.GCaeIeaU8eS_EMNq6G@fat_crate.local>
 <CY8PR11MB71343373617F535A8EC5A2C0892F2@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260421120516.GDaedn_OTOE2Agrl59@fat_crate.local>
In-Reply-To: <20260421120516.GDaedn_OTOE2Agrl59@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|PH7PR11MB8250:EE_
x-ms-office365-filtering-correlation-id: 94ca2e49-3670-49b1-445a-08de9fbd850b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: mbs70tAYOGWp3b1pvVsMRCqk0jJ4FZmz1RjXv5+lQLpqU1FgTU4hypVG84sA4BzmdE+ASA2NrQkSCteDDjB2pjMgrY01MOdJi7d0tbtJ28iptBGgKTbW06izSLhF0E5N6q6Ykn2h96n+Lv3BMBkQbpRnVwasL1J4nwSETvqNTbsC1nZz3pdltkRduXxhswdwTis8RawwTXVkl7kVOpLABV8v3teCBhEypBXWoenSgE085oM8A6oXc0S4BQQpFeudkyUeifOHncwsji9qhv3GAxk8CEPt/ueSSx6bBiCrdx89FhmtvRAEJxRCHVQgc0tY8gWCv6RxXzTxEDTy4mwhjATGYWOmK/P127PcTQjQxTmVB+jX7cVZbXYXa+kl7g6/7Z6wxldwDSWMY2BxG7I7ZniAWVzLKjdu0/Cozq31cRI79bgzL5Ca0tQNBy4O+UqGNEBfT+vRU38ORVwkAOhg+cll6ZHeliqEtefEWrfRcpsFBJO33v+Y+9T9owNObts/EzWTkZ9uCAS7Y0RQxEfz0Qf6GimjhHjw6I/keCRRNM3cT10GGZI1YaRhHBJ70B/E2RANuH+r8T+sO5vprqgn+ogvh/c6YQSgthjoJJY5Rr0o0PDzBluWGDugQ9Nhf4hVsoA61zWUpwh1Dn7bPZMAF1JUeTZUgpKL2iuAZ7nCpS3zYG5k0HSVyHIMjW7jB2zuKx2rzejPxw5b9Lle74NvpkGqcUfHHFAfVbYYQ2SFGlWgNrVRpQF9bx0BNlB8hOLoO+CZvYEniQnxniJiAEp0CnKf5DWG8RfctMLUpKnk6CY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTd1U3ZvOFduVElGL2FwOGphRzZTRUcvbHRBdFdvRm90cnU0MDRObUFOVGgy?=
 =?utf-8?B?L3h3amlaUlpEV2FzekhXdVpENFFDRG1UaWhqbXFISytpMllhYk5RQU9aQjFS?=
 =?utf-8?B?aWU4L2ZidTlKTFJIY0UrdWFEQkFNTjRnUWpQUTUxOUZqNUF5Q3JKK3VRSnhT?=
 =?utf-8?B?WkdYVk91eFhRQlVRNGQ0Skxpd1ZVY2tSMVhWMGJRWkZnOWRDYmlmREhhL1Rx?=
 =?utf-8?B?NUZjbkd6cHZSaSsyeGxVUlpUdE0rZEQ5c0xxRERVYWMvR0d2NGxrZzY3N3Z0?=
 =?utf-8?B?cmlxNWZOaEVId1RkK0ovTHc4dVFCWXh3Y2RBSWJRSnIvRm8yM1F1clc0VmY3?=
 =?utf-8?B?bDU5eDgxSGtOSXhwWEdrRHhEQU9FMmRoYkYxdzJpZVBoOW45WnJ1OUgxeTNI?=
 =?utf-8?B?YzJ3RkxNOTVxcmJDdHZjMlZ0aGRPaWtmbnIzcDVqNzNlODhMYzNzME8xOElJ?=
 =?utf-8?B?ODRjL2FMOGJoejlWVVBJZGl4T2VxS2NmUWhBamdtMzFzdmcwTDd2ZEh5OHZM?=
 =?utf-8?B?WXJJNmpBSnBvYmxEMHNpQ2lHTVNPMzljZVloU2haaXlOaGpRR0kzVklyenBI?=
 =?utf-8?B?R1dkTlZ3b1A2K1FwWmdOWnNSbmgwYUlISTl3dWx6VmpXdGllcGFyU2U3b2Ur?=
 =?utf-8?B?eEpjMjNFc0h6ZVREZzRaV1VPS3F4dE5oUmZBQ0xoRXdCRThnYXovK0ZML2dK?=
 =?utf-8?B?N3hpYkFuajBuTVZCWlhJd1FwRm04WjUvMHlrd0pQS2ZPV0NRUDR5d1QvVHJ6?=
 =?utf-8?B?WmZ2Mm8zWHZST084Q0VBb01STjgraVd0bEFjTzA4elVBNWMvVEFZQVBtaDJX?=
 =?utf-8?B?ZFgvZVA5WkdxU3lnSHNqaG1jdklvWDEyUDVFeHNrRHRUaDM2dTY2TTU2N0Fk?=
 =?utf-8?B?YUFzMmVGVXpPM0hCQ01LRXZrbzhvLzlUK2htVllrb3d6UjF3LzVlb0o3RGJB?=
 =?utf-8?B?NUZ3NloyUmhHUFdlRUl1M05ZcG1OdGI4dERWZmFPZkhFTGtVVHhVMmRZNitO?=
 =?utf-8?B?RVpOeVp0OG5XMVBLOWhwWlhlTUI5eTdJZ0FOWGNrSjk2ZEwwSnlXL0EvTitn?=
 =?utf-8?B?WUJ3eERERzhlQ2JvYXljYU5pM0FqNEtSU2xwemk5b2VMTlFQcEx3R3BQYjYy?=
 =?utf-8?B?RitOSko0cXpybnJnNlI0eFA1MTZ1YlRpS3g5TWJ6ZlpmRUI0WklXUmlYWCtl?=
 =?utf-8?B?eC9vM3BQQmoyYzc0c2EyUldicm1HcUNObFdKL2x6R2dZVHdTdUtURUt3c2RD?=
 =?utf-8?B?bWsvQmhPNndjd3c1OHJiZmxWUzQxWjl1b2pjOVZqUnphaFhSRVFCQkV1V1VD?=
 =?utf-8?B?RndzVDhzbGM2YWZYc1lrVEVpSHJBM29XcnZlRzNIUzNPcVgzZkpZK2gxZWZ1?=
 =?utf-8?B?cERYYzNxN2tTdVk4VWZDajdlUFhPdFVGVDU2N3lVTnZYVXh5cE9nZUs0MENG?=
 =?utf-8?B?bWplY1RibUVVaEcrN0tBOFJVQkZQbGdvTHp3VEpROFEvTERFdnplTDR3aEEy?=
 =?utf-8?B?NzI4Tkc1ZjZvZTcyR0JseEVUb0FYdk1IUkdFN3lLeGpRKzJXc0ZQeDJvTGRZ?=
 =?utf-8?B?OVR4ZTV1dVNVNmI4aDRvR25KTEdwMFNUVElLeVQ3ajVzVUFLQkZxdzZPdVcy?=
 =?utf-8?B?ZDlKSmVFZGx6am93YUx1LzBoeUxESlJTODRZTXNMS2dIT2R1TGM1YkhjQmpa?=
 =?utf-8?B?a3huZVo2bzdVaVNkRHk2M2drZkthRDVrWlRvY0hCS29KLzlHUWttUDdGMk9l?=
 =?utf-8?B?cHgrbkNxSXhjL0F4SUVUZUNBdEQ0L3c2MlBQMi9QRERGUzQzTkExbG13eXhO?=
 =?utf-8?B?WkxRdkpYVTE2Z3lWcXFZWWRMakN2dzJxeHRtRjVGUE1QbmlZNUMzeE1sWHlF?=
 =?utf-8?B?UWp3LzVhSlVGd1RRV1JWanU3dkg1NHl4UmJITHFEbW5lVGwvWFdobFZ4ekVD?=
 =?utf-8?B?YUU4eTZDUi81V1Jna1BYNzUxSTR3dUJFRDVjVC9LTzJKL1QwN0FGTWp4N2wv?=
 =?utf-8?B?bi9scUxxS1NJOGg4L3VvZDJIRXNkTEgyTEZZbWdiNjRtbEVaM1FVbVVaQVhO?=
 =?utf-8?B?VzBLdnVBS3YwcWxlcVpNdWR1R0J3YW5jMEZSK0RrcGc5Z1hZNWo5OTlkN3ZW?=
 =?utf-8?B?QzNvQkw2ZkpBazJrSTFocE40OWlkWWdkbTlaZkxwSmQ4N09kN2ZER3JwcW5M?=
 =?utf-8?B?V09ueXVvaDkwNXRua3B0Um80Z1M2MDlVSGZYamViZ0tlQ09hVWgyT2h6cUxN?=
 =?utf-8?B?V2g0eHhpc1ZPaitWaUIvM0FPZUgrWnZuK3Jnbk5MOWpKcUNSZVhsYkw4dGVB?=
 =?utf-8?B?R0pWd3JzMzlWME1tQUxhQjZEMXI3Q3BMRExmRjdudnZuY3o3blVYQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tLdrDL44zfGyigGFhmJ9mJ4ODZFsTY1fjw6yvej8FWbbQh4HDERt4DTepyL5V52U2iiEUs6cOdisAkTGUH8tWFsnhr7DfdNDTHSNE13OjujN4nMlO9ogGHsMP0kudh4GWV3HS9jJsuWyDej/WxcnVJh0oWbo0y31XFe93eSiGQktqPFmq2MUnHMgDe2c7CNqUNcT3vZKtn7KSvhRY435V5W8T8urYiX7giV6CLjiUvdueqwN5knmtEyqLRDRUhcJIbpXTRnCE4mw7h+GpiFL4DEa9XBmS4nEBPxEzoPQginBvukCZeIXfFO6D9QrXP98XE8JI3TgGuY9ykoVXIUSBA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ca2e49-3670-49b1-445a-08de9fbd850b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 15:49:06.2608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dtUW9GIGbVJU0wGSftUiBQi5B3Z/x4w4s3E9bqMMaHBH+Or7I3WkcivqVHhQPb99Pb+jUlApgpwfXXGPJFKWUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
X-OriginatorOrg: intel.com

SGkgQm9yaXMsDQoNCj4gRnJvbTogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+DQo+IFsu
Li5dDQo+ID4gbWNlX3RpbWVyX2ZuKCkNCj4gPiAgIG1hY2hpbmVfY2hlY2tfcG9sbCgpDQo+ID4g
ICAgICAgICBtY2VfbG9nKCkNCj4gPiAgICAgICAgICAgaXJxX3dvcmtfcXVldWUoJm1jZV9pcnFf
d29yaykNCj4gPiAgICAgICAgICAgICAuLi4NCj4gPiAgICAgICAgICAgICAgIG1jZV9pcnFfd29y
a19jYigpDQo+ID4gICAgICAgICAgICAgICAgIG1jZV9zY2hlZHVsZV93b3JrKCkNCj4gPiAgICAg
ICAgICAgICAgICAgICBzY2hlZHVsZV93b3JrKCZtY2Vfd29yaykNCj4gPiAgICAgICAgICAgICAg
ICAgICAgIC4uLg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBtY2VfZ2VuX3Bvb2xfcHJvY2Vz
cygpIC8vIFszXSB3b3JrZXIgdGhyZWFkIGNvbmN1cnJlbnRseQ0KPiBydW5uaW5nIG9uIGFueSBD
UFUgaGFuZGxlcyBNQ0UgbG9ncy4NCj4gPg0KPiA+ICAgbWNlX2dlbl9wb29sX2VtcHR5KCkgLy8g
WzRdDQo+ID4NCj4gPiBJdCBzZWVtcyB0aGVyZSBpcyBhIHJhY2UgYmV0d2VlbiBbM10gYW5kIFs0
XS4NCj4gPiBBbHRob3VnaCBteSB0ZXN0aW5nIGRpZCBub3Qgb2JzZXJ2ZSB0aGlzIHJhY2UsIGl0
J3MgcG9zc2libGUgdGhhdA0KPiA+IG1jZV90aW1lcl9mbigpIChpbiBzb2Z0aXJxKSBjb21wbGV0
ZXMgZmFzdCBlbm91Z2ggdGhhdCBpdCBhbHdheXMNCj4gPiBmaW5pc2hlcyBiZWZvcmUgWzFdIChp
biB3b3JrZXIgdGhyZWFkKSBpcyBzY2hlZHVsZWQgdG8gcnVuLg0KPiANCj4gRG9lcyB0aGlzIGFu
ZCB0aGUgbmV4dCBtZXNzYWdlIGluIHRoZSB0aHJlYWQgZXhwbGFpbiB0aGUgc2l0dWF0aW9uPw0K
DQpZZXMuIFRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoaXMgbGluay4NCg0KPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjYwMjA3MTE1MTQyLkdCYVljblRwN21hVURWdjNOY0BmYXRfY3Jh
dGUubA0KPiBvY2FsDQo+IA0KPiBCb3R0b20gbGluZTogSSBkb24ndCB0aGluayB0aGlzIHdhcyBl
dmVyIG1lYW50IHRvIGJlIGFueXRoaW5nIGJ1dCBhIHJvdWdoIGFuZA0KPiBzaW1wbGUgbWV0aG9k
IHRvIGNhdGNoIHRvbyBtYW55IGVycm9ycyBiZWluZyBsb2dnZWQgYW5kIGhhbHZlIHRoZSBwb2xs
aW5nDQo+IGludGVydmFsLg0KDQpBZ3JlZS4NCg0KPiBJT1csIGV2ZW4gaWYgdGhlIGFib3ZlIHJh
Y2UgaGFwcGVucywgaW4gdGhlIGFidW5kYW5jZSBvZiB0b28gbWFueSBlcnJvcnMsIGl0DQo+IHdv
dWxkIHBpY2sgdXAgYW5kIHN0YXJ0IGhhbHZpbmcgZXZlbnR1YWxseS4NCj4gDQo+IFJpZ2h0Pw0K
Pg0KDQpZZXMsIEkgdGhpbmsgc28uIA0KDQpTbywgdG8gbWUsIHRoZSBjdXJyZW50IHJvdWdoIGFu
ZCBzaW1wbGUgbWV0aG9kIGZvciBjYXRjaGluZyBmcmVxdWVudCBlcnJvciBjYXNlcyBpcyBhIGdv
b2QNCnRyYWRlLW9mZiBiZXR3ZWVuIGFjY3VyYWN5IGFuZCBjb21wbGV4aXR5Lg0KDQogIFJldmll
d2VkLWJ5OiBRaXV4dSBaaHVvIDxxaXV4dS56aHVvQGludGVsLmNvbT4gDQogIFRlc3RlZC1ieTog
UWl1eHUgWmh1byA8cWl1eHUuemh1b0BpbnRlbC5jb20+IA0KDQpUaGFua3MhDQotUWl1eHUNCg==
