Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971937F337;
	Tue, 25 Aug 2026 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787671684; cv=fail; b=OOwWyvFHpoGxiCu8Voii4QalCusckQJzEE91ZNW7DwFWiPiHx9GMzWK4J0zZ/K+bEGYezXyOt+5ly/UE7SoKUmkXf3ZHCRlO1Lol56ZnOfrLaTMgEY5SwVMCZjxeHIpD4lNtQxZFWtAemuZTVVquTLN1zHGDAS55CLYQhA34gZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787671684; c=relaxed/simple;
	bh=sDboiZsqe3fj4QK2CEUlSo8c0x8MT173CpZjWzgMsC8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iROLkhYXMnTPDzhXDdXkl7rcQqnCgu19YjGj6CcI2SphtpPQcx1FEn46NTQ8yEjYzw5eF9Z3IAOznuJgfbXhXmMLEXGbGEwWjpxXCY6pgzz4lAKjpL1opJJZ9b7T+r3iWY7Egdll8uk+1M/mVFEvTOJFSRLdK2sGrxrHFpZQLOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kih5RMLg; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kih5RMLg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787671683; x=1819207683;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sDboiZsqe3fj4QK2CEUlSo8c0x8MT173CpZjWzgMsC8=;
  b=Kih5RMLg2LGxsHx0RE0wwKDH+b1Whrc/jnx97UI9nzn+NuhBkAe69S/6
   Rdde8musKZm4tr+kvy6dRINk1V+r3UTRbFsszphKmGOdWUbx6Lw4nuZNE
   p2XqtIIg1mXMimcRNCCloIo1F5s3MSM/BEOQq7+0L3kus1tl4ktP3BcAu
   trw1CL2MnETvMKrJZ1GNqkP7hSsJv16FOuManXpWuwOKDl8vClDLa7fOC
   7uRv8Gy5+8SRowi1DNvpRwR8ApEFfGHu09qV0PbxYmO6ByutfDjFsmzDl
   MPDhobK9d/6JhOwjN9TXbQy8VaGm4oQe73B27gMw19FYz4eu1m4vVzx+H
   w==;
X-CSE-ConnectionGUID: FzdGaM5tTLWE7hHj4DCDgA==
X-CSE-MsgGUID: kS6lX6HeR9y1hU1PodRmbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="113678032"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="113678032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 08:28:02 -0700
X-CSE-ConnectionGUID: 0dFBoRSMSV2r+Ijk9G3Myg==
X-CSE-MsgGUID: WG7xE3KZShaSAofsxq7LFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="271516588"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 08:28:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 08:28:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 08:28:01 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 08:28:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXst6ZVptn5DTHmDQXSxiPnNgqtsWCNSCeoD6zXsqu7QX/s4leGt+VNVk0r0ZMJQURjp0AWaoKLzf4Sc1RP4KaBGEPiow3VFEYUnpB5C2TvbTALS0g84KJyhHYOEjIKcCVP+E+leIDgbvhoMqy5bpMEmM7oMUVQy73Bivqw2x2pE3L9JFzxZu75Wcbmf0kZhs0z1bI9/erR2kPrpLCMK9Fx770L0Sy4ojY7H48bLUgcQGvb0DDWeGD2Liro0O8asiW9hKVcRgBx+BS4cSXG0hDYfhkOhTFaXP4iCMZBqgCWyk+1H1PR+zfHhj+b64/zY+qQO7KCnj0wfBPNeEIOHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaxKXlgVieXjyX61NHvwbqQhdHCUFC36DRnqCamxdwA=;
 b=m2uFbv0HLhzxwl3tjB75RB/rucrhNlLW4kBjQRZ5zdiGrqKEv3wBtiPfjVfjEAYyefsVZ1GqSCbBDRCx1kJKrACAP8/dfdZM2IDpGT4WvZxUQx6s5LFLBz3C5UrsDumAo8S+QOKTm3xGtU6kMLvWD/Dxwgsy4dbdM4k/XsPGH1RqI/eYHeZTH81kmDDhPQtHDwN95PopMhtYJVdq+EeNPZgbzsXsfHjb8vGbCXEgf2ofxHI6+PTJyQZadA+V2e6M0LEsFax/LmZ+uTkFVLmzirTECbr18YMQxUfQOPZrFJrL6JyfXZ5rZJycrMgMCXQhkIYInfCLp69TfWC36TKLlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SN7PR11MB6873.namprd11.prod.outlook.com (2603:10b6:806:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 25 Aug
 2026 15:27:55 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 15:27:55 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Breno Leitao <leitao@debian.org>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, "Ingo
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
Thread-Index: AQHdMVdZu9LvjxfsOE+e+t5cGld7Oraot52AgAQrAwCAAIaYAIAAQBEAgAEmvoCAABgSEA==
Date: Tue, 25 Aug 2026 15:27:55 +0000
Message-ID: <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
 <aoiBy3vg9eSvGhIu@agluck-desk3> <aowABmagul44ENde@gmail.com>
 <aoxxxmM-xIpyAE_Z@agluck-desk3> <aoynhOsTCcapwRbl@agluck-desk3>
 <ao2eT0TWS9EaA28N@gmail.com>
In-Reply-To: <ao2eT0TWS9EaA28N@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SN7PR11MB6873:EE_
x-ms-office365-filtering-correlation-id: 6f094698-b5c5-40fa-7dce-08df02bd6f6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: fqi0yL8M+zd/oqHyqDqroraBVCe3wwL2Nq8PmhJTK5xiOrEB5KuxIY+1l390uA1Pritx635YdRh1/xgiaY+B9ZkQ9qtuuhDxzDUqCsNuW/hIekRrKRSHFX/84ob9U4z3xv3E0MEeTJKCAatAA5B9fzCgJ+yD4thvrAwPYqrSOIucFqtzj0ZYfH0e7UB7ZHQyRbfunsSKciv7jMPlP2Bbx+HQuhgZ+rYZfm7dT1D+V3N95GK+VLdpiZcdaOaT1OqDJi/M5WJlDhLoQC6g4cSrD9k1hdQYNNxHDYeQRMBp3i/wxiRU4Dkixh5KhSODeDdTt5ySoa4yfNEk5BDXL7L7OgdGeSK1AACCQdbIO/vUs3KE7ThPDQvUUNtavidLaeegzbhtp2fxno5gCI/W1HfWxXcwCXG4n5uNEmLFAvSMq4H/PTaVQfe3opT7Vi6g/axyxR4yhCI623k2BLApTgNSK4YdHSdaAz/sScxlIoLk8Ai4/iht+ZnvF7JCZeijgZjhjxz08SuA8IIlSh/o/SWlsfbzwMDGrLqlxLW340jzz7GmgsnAyanYl3QxHm3vF2Hsd0b5rihQ+ib2Dhb5HRgZkQCWceCxxKc/ViYUuprsimSAk39IAIG4+yrlBvIt46anqlDNytp0cSonL0n0vsLuMvAGsr98vGjCtaZ5w7ddpLcrVmcG4KIrKz2cyt39GcFTaeafqCWiUb9EjDRJSKNmW8sEfDxbT8A1sDxTIx1azNw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GZIhKQeSda1FSTlFHeL7D1+73OYVRhhV996ydirgI34zX35oQWCBJ+dqpMHu?=
 =?us-ascii?Q?78fD/yqZr3ryaeznLoaMlDM3+eA0BKjwEzA7zR95/yYYdXfaXElw7OqJv1YE?=
 =?us-ascii?Q?yYXG4UnHPepc5wZKaXNfNNWbECD0EPsd5vNjWY1eurAww4/qIAUj16lB9CsI?=
 =?us-ascii?Q?fY4RriXSVu3ob3JhEYNYQX0wg/80c95FTaH/lUzbiXLRKTQFGMZAd87clK8S?=
 =?us-ascii?Q?XlMV4L+hwsyYfr56P4e7QT8CjgDiST2xFM7hV4TfXC6TJKOOK6R6Hp9OMNMe?=
 =?us-ascii?Q?2jHGnn5b8TU+rdXhvP8FywST9ZKKVfRwN2OOs30oxxJ0RIDSUqMN6/IB2gTA?=
 =?us-ascii?Q?bF6NGrb69T0l/V3f3S2I7l+wjVGQ5n9vQG1DKfBg0QreiU21QMInkZRf0GsM?=
 =?us-ascii?Q?bWTY8+Auy3wQ5jPfH/rKBNmVKQPyusETz1soh5waO/8Nn/GyVSAcVaVKJ7N/?=
 =?us-ascii?Q?aQ7iEw4AinnR8ZYfMpr9DmgQHlLkMOGJajwF9uKbYeX6Y1DCO8YsGQjZvydr?=
 =?us-ascii?Q?faPaBwVdF//mbwuJFrIIvp99AZu9f0Cb8+eBZ0GwIbZlnTMXVF1bRExavBXA?=
 =?us-ascii?Q?7Oba3F3S345vOPcXwKPq1GKYVHbHxvcqP4CBHfL2OgKPcty45hgPXN9vltqM?=
 =?us-ascii?Q?Nc9kNFHWMDku0RejFOjQ9WDYPwMTJMNv+firEAxyeXDCmtbrGrdwH6axm38s?=
 =?us-ascii?Q?606mCqIYdykr+HoTkYl73Mik1H0WhYJpszQ1LxatfrOg58cuTQklpwg9U0FF?=
 =?us-ascii?Q?oVVmxg/PSDtf9ePVfXqQX8nwfl0rZ4ypXMLHsMoXpogCbqEBOn4qTpWo/wbQ?=
 =?us-ascii?Q?kWv4311bI/71r9g9oPEOc8ebwZF2sj/nFJZycta0WvJLDDa62eK7wb27SShm?=
 =?us-ascii?Q?t0LjUW03KAQYNjzdHdHUU8cLS5H5aE/jU5v8VhyB6EkFxB3uJlVMdirlnnKv?=
 =?us-ascii?Q?kCk631NeQTkd2U5k3VOr+qH3WPDtWEbkFNLtmwlvwkFW+JbfEK6mMZEDe7CU?=
 =?us-ascii?Q?5L8tgc9khTdLWpZ1DKsjEcYCjy2ldpbZ5FLtIUeFC1TpbzQXDl9Zz4kQ/Aws?=
 =?us-ascii?Q?oGRd9RXqSZrB3QCyzL4hfwI3aeJALwJvqQWvukaswnhc7DvfsaxP4tO7xODM?=
 =?us-ascii?Q?mlPCV1WHOrUvi6+eYdVoFWanexAhijhnl+RXeDDNV6bJvo6zj70PRhKaJtZi?=
 =?us-ascii?Q?5sbv9y/6O5GksiuJydbhJeEl5qYzDTKgF//cCigyUvmGug/wrgY9rnVEcbly?=
 =?us-ascii?Q?7yloexjZ2kD0WNtyG5uTCpuWT2gufr3/3TGzuqJ9By06ZK2YAMZIi0L14sam?=
 =?us-ascii?Q?8gDW+/ZiOlSb1czZSsjmbWeHAKppjKZYqqt6vI486MigfgfJ4MjuzzdCutwT?=
 =?us-ascii?Q?b96MTfmN1NX/PHCM/vII/tSplySRTi3qwpxn/mN/ACWIBT8wyHPQH4bg6A1C?=
 =?us-ascii?Q?xjCwKKWoY/lfGMkj3mzNm64oAILzb4ZTdalbEuGzlhAN5rnu/bCUeLjZ5EOf?=
 =?us-ascii?Q?VGwv4lLnKXaRIIMdgtXtCocCYD7gF/37lwWHAFJ2A5tMG5OhihmCYN4jytMM?=
 =?us-ascii?Q?LGmA8k9qHWvGI5IWnUVdyHYqu/g7HVympiCbf1LdmoktAoX92/n5E/NpCJYC?=
 =?us-ascii?Q?AHBCPYQ4lrJTRx6QqUGDkwvwx9LvEZxsrVEV71tcMIonE/2SG32mIhIj9n4U?=
 =?us-ascii?Q?ToZOmBy+00MEfYBwIA6fWZ5BwSrsdxO4WwJrFQS3AweFHv1X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fIFihAapdJTTAfLSGYulJhmwkX86P7AP4DNi2l/6jnpMWLsjVFD6Li42ju5Ab3LsL6OyLj6WLhQK3a0xI3sThuMow5mpL+yYbTIS3FIwaXtwPNOywBI0Ba68dAxUWQ6HUUAeY/ovo+N6TyKA6rxJMLidsk+yWperfUBU3nNKdoPwtOja0nv4RBL901K9ZgHLt/IgD6yM7NZIQUJF5ey8Y9TIz6cF9P+4NDZZYaxjsu2wzgBucM2XnyAMsrNRi9dJnqBB+qBe3LYwZaVNR+RqMIJaEYNqHSV2yuSiKKlbyKK4uwRZpxqGkm+LwSPies9AsLYLzIMxavb9pjmVdG6fjQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f094698-b5c5-40fa-7dce-08df02bd6f6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 15:27:55.1181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iKuJ9uJjx/yN57mz/FVOSpuTn+gtaAErSElFvvZqmPKxjw29P9+Cb9SfZ/mCyg0Ak28nhJCsvKcJzhws/MuWpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6873
X-OriginatorOrg: intel.com

> > I chatted with someone internally. They'd be very interested in being
> > able to see these running counts via some /sys files.
> >
> > Perhaps your use case would be better for that too? Rather than:
> >
> > "Everything is fine"
>
> Sounds good, I will restructure v2 that way: export the running counts
> first, and add the panic on top as a separate patch.
>
> The count is already kept per CPU and per bank in struct storm_bank, so
> the natural fit is one read-only file per bank, next to the existing
> bank<N> knobs:
>
>       /sys/devices/system/machinecheck/machinecheckX/ce_count<N>
>
> Is this the right approach?

Breno,

Yes, that looks like a natural place to expose the running counts.

I'd argue that the files should be read/write. My rationale is that correct=
ed
error counts may be increasing slowly over time for transient errors caused
by particle strikes. If a system runs for many months, it might reach the
threshold and trigger a panic. Allowing the system administrator to zero
the counts would avoid this.

-Tony
