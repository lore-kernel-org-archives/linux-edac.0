Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8971922F5;
	Tue, 14 Apr 2026 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776205349; cv=fail; b=e+UCRMvPF7FGBg8BoMYl3XW1rWHcvxxeoWKrI/B8jCsnI/zZ7ck/mcLpEGmHO1MN+IFtfdB9a/wYJ4pkcft2maVWqAXOYbG5oj8upEwSmjUF38yDHNTkIG+JPaspoEkdTrRBpYCHTcoUW6NCX6sUQiIPmLK8DtsiNp3wYwNIIC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776205349; c=relaxed/simple;
	bh=TSy2As6x1pd7TbhkMMqYgC9OqhLuHrvTRy9oeoQQ36o=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DUxpNmE4GSfHcjk3bXdDwZs0b+7NXjZoANvt7gqfOECXaB8ZZsbEsTLkUTQ5ZKnPLcGQDaSBrtPodc/vSlx8rYzxqn+ej8W9K8qfOP93yCQS1U/+A0pRDITFTWYK7BRUt+65NDraI+86hiLXridTTrKUo6FaoDLke5w+72H2xpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKwrIZB+; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKwrIZB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776205348; x=1807741348;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TSy2As6x1pd7TbhkMMqYgC9OqhLuHrvTRy9oeoQQ36o=;
  b=QKwrIZB+YvfkuQN2HM4gykHZ17uDMBicRxSFpRjTXqUlOZJSo+Bv7XIr
   8olesD6sStGGrYvHgE9bBrV7EgDA8cGTvgq75kn24nfGkkXTp0rr8viv5
   47Je2Alz8rLXJZLbsamTAHodWsPOQGTY/kSccyD4GAdjwEBLFrMhjkSw3
   jyZODva5kW8QTB6jYbP1L+bGGosM6yaE2Q66COGMy5GA40RI6HdilGMGw
   7nwBNRPVVfRodXH8j2ldM+3DBWU5h4r0MweSzyra6s9TBA88CYSovakoE
   xAT90mXsCUVXWDo7cVTU+5PW5P4+wEm0abYnHIgC9P8RgDP3mOJsUsMNZ
   A==;
X-CSE-ConnectionGUID: LCT3MHq0RNufnyOFBjvvHw==
X-CSE-MsgGUID: w7K1wlC6R7KwkUUg2+AikQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="81039925"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="81039925"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 15:22:28 -0700
X-CSE-ConnectionGUID: /q89ReNsQxS3w6FZiBaoSw==
X-CSE-MsgGUID: 90oEuEwZTH+tfs09PKu43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230084467"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 15:22:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 15:22:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 15:22:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 15:22:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiFxcJGjlByjST8o7o+QNBfxs2Ro96AuYktTZzOjnQQLje1ncOfQZouQb73Uh9SnvRzcZ3UpNEiCZXWFujqvWGhZRN912v5iliT20Rrl0wn6PP2avaEEmGo8L/8m5LsgG3gQYZdILxHLAoj1gjFuA+wHJBiO8oKBDR7/WlzBEKXlrD1hNwRo0T+7j++6HSdhrMG5EhwXn+HqlqOjr4K2A8I/jiWqCQvwx+bD3PH+AyKSJG1DE5+k2/JtnpQwHV+uj+nqnmplhth+uQ+20P3W7G6k3bNwckynjDARE35K449U9Abm7/2Oi3QXrxRmH/yTEHBGQPyDjDDRm8OMmWzfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//bcewQTAtnT9fcbYfVXKtpLYoyLoDcpgop6D7Aacqk=;
 b=HRmA+42cQQrBwpcZtaEG+DOJOcKBDvpAxzi4/J//tK9e8E5O+2Lxw16TOmknuX+CiSB8JhHpgLyHGbnyMocUIJIdrMmXxPObgPQbjfLzd7Mfo9OGrHD+dr3N7baezgVfO1ieBLTe0N3Qq9WFbL4pLiVjJKPKyKfEJXdCT6+wH7HWuLY40t7r4sZBVpB+VNv7CJ0c9uJpGuVPwYY4PmbMjGwHluO9UrdBSgf2nW4t3oXw4H4oRNMhVlHS8FPtfYNecPaH4ICJewLyRWmvca/+g4ty98bTiVyuayrv8wKtncynwrOr3QpXuBcwBerMIuRl73Q10lL32XfoG4c1VGDGBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SA3PR11MB9485.namprd11.prod.outlook.com (2603:10b6:806:45e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 14 Apr
 2026 22:22:24 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 22:22:24 +0000
Date: Tue, 14 Apr 2026 15:22:23 -0700
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
Subject: Re: [PATCH] x86/mce: Restore MCA polling interval halving
Message-ID: <ad6-H5eihazhqsmC@agluck-desk3>
References: <20260210150117.GBaYtIPfsP0Txw7iIc@fat_crate.local>
 <3748e8c7057a4182bc2a361b44dda51b@baidu.com>
 <E4BFF14D-85CC-44FA-A217-603C102B1D66@alien8.de>
 <3431b52760444d209f8460059264cc13@baidu.com>
 <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
 <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
 <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
X-ClientProxiedBy: BYAPR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::27) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|SA3PR11MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: f06fd2e8-3a3e-4343-9f53-08de9a744dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: JzjsxAT1mfs8nUPsewcxXqE6qK6+yunFy8p/NW0UtkhtTEdXQ6hM0Gq5QmmgzhoGWsijK4d6RP9xJFR3Rutj/UxCKlH4ZJW6JYLFzeyFjauWuPEunhJ0AIlN+YiS/YeXplif6bbi9CmR48Jzg6KYNnGVgNuSzF5qTkzJeGvfX3Dp1Oxvt1RIn/1E0co1F77Zvsg+xv715uLvOU4xyaABXNALhYNV7lRxeTzTfkwk2oD+Q9uYUYAcocRheCXBXDF77eL/4qRZ5TzjElB5HdE42C++u5QA6dGHbCc8rvjOB1E36h1eQ08sKqn2jvsS45Zci6/MLfTua9DnELz2h2NcFy0348TM9/3ezEy6AfMjn10KF/bjGVPwZ8w0sNtOjKH3TmL5XGnGEq2RvBqddNzaFXYruCr8NNAPq8O8WOQgSdE+Ay1PlYrAQEA3q6l3negtBN0sbALoAx/h8+MRtuVx65siZsFhnwaNZvMHMM5IeWLWtXGdwbURWnzWuFDfd+rkFY9bXSo7WNdRBuHkXA9j2nuDcqwn8I/mdJM2shIvPOsgn4AWqljD90xocH1WGb0/Vs/AqECD5dNyQj09rY/OeFGbocTXNiMXQ5eBKjGgi89NDpc1Q35Yt0ChnZY5Sl8GhXLZW7z4Xt7Z20f7krZUXd3Asib28c89mjUbeaG9rIPP1DBU1/J/lkl84kxZ1bbYaNAXhQzYx9M9UzqK+DKXBDg0WXk6zCbZ5RGPi/ZjhdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2df+LzVJcmiZ2zb7izZfFFw0bMuD6168m4YWm38V9W9cpKWAuWoAyTFgBbRZ?=
 =?us-ascii?Q?7jcBUrBQSUcsTHlloEpavU3OPtyFALRtgxhxnDiuii6sfVQDnbgJdm0FPXOO?=
 =?us-ascii?Q?xXtkDiYA5DgihlecHQFvloNF9S8TeVaHVAt8iS6i68gHTXQKpgjO+tbc0G7D?=
 =?us-ascii?Q?t/1KKHQ8e9pPJb1WS8JsPbz3WSSAtpZV97OgD2YcPW+OT2vJy0Qhf/Jx1krN?=
 =?us-ascii?Q?GX29rHpjngnSSSjTQdZ+zUDRsExbHbHgoiJnYht79T261SbQ1D86x7mZNjEo?=
 =?us-ascii?Q?UNb/SF+52dIKtke34Jw2yo+489WrJW8zjloCbjgb/H9vRrzQFD+rY7xNVGPq?=
 =?us-ascii?Q?+xmEiOR8V+FJr7lNuje1Y1Q3dRNcp318ythY6ZRfLCCTmd7b7j0/k+bti2/v?=
 =?us-ascii?Q?vSWQNoDRo2MFVWqie/6v0Wdp+0+7TBFC/bk9vo9JkhXJvYJVirNtZf0GnmWK?=
 =?us-ascii?Q?0Yx7tC7/DG2honf3sx+80ucri6cKFyyRujPS2BQuO2uwe5WjKz3I/VstGwAU?=
 =?us-ascii?Q?tZ+dUeafZEQ27tY4ZP/DBgTQLWV4vpFFTtZxVxo9lbYay+JO0QY06P5Y5VgI?=
 =?us-ascii?Q?5E6E/mcMPHEDJvsI/E0LyNxNYShGbcUkJ6UjjqRz8dniodyvQRHIO+MBAm+q?=
 =?us-ascii?Q?B6Wlsapqq2M6lW8dhOOAowNAR2lfGAHYgD9HTqt79ePm9eYvqGHM0xhrG75e?=
 =?us-ascii?Q?sK3oWkcv8agZy8XN9761rEjQIGHCeTMBQHacjWM1s6goV1nkIgNbB3QVHDXo?=
 =?us-ascii?Q?9qv7qV6ABIzZURCbZf2F3X3lvWDRivHSvt/c/rVFpPBfF3WTims9EOXtQcfw?=
 =?us-ascii?Q?AX1HbgV13lzbxgjc0hlmy9bRIliqg99U/zXcdsAj36rUJBA7E6LgxycirEB5?=
 =?us-ascii?Q?0C1sf+KBYxYvSflWa0ER0FcNITRPAiA1fF+KtTfQzn7wUVAIdGHX54Sf8XkN?=
 =?us-ascii?Q?MhhykC/i1EUmarUt0dKZfvIzefEQB+D4Cwt0aSp0kwUoTwDPH/uoJlnKTsvB?=
 =?us-ascii?Q?XpfyVEUnLOBU9Gn7NSfs2u3jbr4ptnr1orFSvJFlKryJ1Yxu2pNoh3TXs7kn?=
 =?us-ascii?Q?boS6axbbM/lE06aE5RohayjybEO5pI7qIAOE2vAuoqxxvCoBwIfHYkV5RKc0?=
 =?us-ascii?Q?8xCGDbPJvRPAw8s1koiH++zbLYvn4hvbuBxh2b3HbqcjTjvb+HoK5E6P2O+u?=
 =?us-ascii?Q?OKrCiKQTQrTAd07qQTDdSz+Xof2zHasB0yViw3GGNq/YbqOZtOctGzjrlalW?=
 =?us-ascii?Q?HTdXhNYCwOEOVJl9cQgdx5dg0utRA7yjEtbrW/s8nHThAkopBRVBBNDYXytx?=
 =?us-ascii?Q?+SxxuocoNue9s5hnMq3SiuODYUM6aIAWIjnJS47PmISs7r8QyI/CBBDF1JrQ?=
 =?us-ascii?Q?vUUssiqFqBdG0Bqgitu3hlmCHyL1ehmXbP85R6Pw9PQUXDpqyXHAWJWtdL+t?=
 =?us-ascii?Q?9t39jk/rQ8UwFuzIvL3WjgDVHPG/aH0hrlJ8f7DoBuOXe7WeCDkDdxTh5nA6?=
 =?us-ascii?Q?l413o0+j61DwIcTksnDohcj0mcRudhPRjBgHMji1Wjb3K1E1gI8xMSB5ylku?=
 =?us-ascii?Q?OCvvg8fg23nO6Cv8NN0rtECuMdURIX3daUNWv+ED+35ITYfj06A/FP6xV+uN?=
 =?us-ascii?Q?+BdNtzDI7TRBRgXjPNR9qAyltCSvPT9D6oyEpmSla8Kf63XeY0lJNq/sImaD?=
 =?us-ascii?Q?3Q9/lcs2bzef3/Dk4x+GP/hikrdBu2F0RSHbGsq7Bn58ALaL+jTZGu0osknY?=
 =?us-ascii?Q?W8wsXOrmSg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Z8xZyEf9z5zcAffmn8GFCMjt74Yq56bpdNWCTfL/vWDJLUON0QIg9RkPeWikrm6wKl1OvnnGequCxJbnkUnL+kee210wMyaxvQsrsjBD1Ov9SNCrr/5QgyV+qXLkMYbt7bQDpfpzQcr5LSLZa50o+VGKraujtXmkxKBYwcailIwOkEfopZELSnx2dPiH+4GZ13z7rFFl2qC3Tn4nLOZ5LGpleDjbyAI4sReRD6qdggrX3w18QWA+CrFOPUHir19aMr8bDLEvIz6rP8WZizch6jnNzOI5AOVVKHJ+AfY4VT9JLUlNbFh2RyGkiRkHXwJXxRLadkFZmW4xQAg/TEbUfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f06fd2e8-3a3e-4343-9f53-08de9a744dc6
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 22:22:24.6332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BabrrW1iY+UH+8hagB7wroVg9gNxAYkXNowY2fiPD95dQNKBotJVri9h8sQJf4mYLiN6wSUVwoJ8S3dPYP6dNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9485
X-OriginatorOrg: intel.com

On Tue, Apr 14, 2026 at 11:18:03PM +0200, Borislav Petkov wrote:
> On Tue, Apr 07, 2026 at 03:04:04PM +0000, Zhuo, Qiuxu wrote:
> > I injected a correctable error with the CMCI interrupt enabled on an Intel testing machine, 
> > and this mce_early_notifier() was invoked.  But the following code in mce_notify_irq() is now
> > never executed, and I didn't see the error log message "Machine check events logged".
> 
> You did disable the CEC, right?
> 
> In any case, let's have a look:
> 
> When we log an MCE, we do:
> 
> mce_log			# add it to the genpool and run the works
>  -> mce_irq_work
>   -> mce_schedule_work
>    -> ..
>     -> mce_gen_pool_process 	# this'll send it down the notifier chain
>      -> x86_mce_decoder_chain
>       -> mce_early_notifier 	# that guy sees it here and issues the trace record
> 
> Now, mce_notify_irq() would do mce_work_trigger() and issue the printk
> - dunno, I guess we still want our printk and probably should add it back
> - but the first one - the work triggering - that's mcelog. It is using that
> usermode helper gunk, dunno if you guys still need it.
> 
> Because mcelog does register to the decoder chain so it'll get to see the MCE
> eventually. So that part is fine.
> 
> The only question is the usermode helper gunk...
> 
> Tony?

Ran my own test. RAS_CEC disabled. Booted with mce=no_cmci injected a
corrected error every twenty seconds. Added pr_info() to mce_timer_fn()
to say which CPUs were doubling or halving interval.

Results:

I did see some "Machine check events logged" console messages.

The debug messages are "interesting". Polling timers on CPUs aren't
synchronized, so I got random bursts of debug messages where some
CPUs found an error and halved their interval, while others didn't
see an error and doubled their interval. The machine check banks for
memory corrected errors are socket scoped, so when an error is logged
whichever CPU on the socket polls next will find the error.

Both mcelog and EDAC were invoked on the mce decode chain and logged
errors OK.

When I stopped injecting, all the CPUs doubled back up to maximum
polling interval.

Summary: This is working as well as can be expected given the shared
scope of the machine check banks. If Linux were to understand the
scope of machine check banks it might designate a single CPU in
that scope to do the polling. But Intel doesn't make it easy to derive
the scope. In any case, the common case is CMCI enabled.

-Tony
