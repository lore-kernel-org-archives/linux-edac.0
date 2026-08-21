Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936443403F5;
	Fri, 21 Aug 2026 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787331040; cv=fail; b=jag7P/jwfxA3+GhgPQ78YSDCOp4BG+nmco+uLpZxVtqVPlDxwU5gEwJN8+7L81IMXcQ1Z2dSv4ot9MkeeOJn+4b7QptnKRHWu/5q330EQREXPkqR0HW0DdDlUQ8L6aSJrugVMWVGiWXAQ0lsGWbAAmH5z1JAEJVFCcTivrBk/38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787331040; c=relaxed/simple;
	bh=R9XqmdcK55DykcC0mgmSGeFoQZb1o6ZgSamc6yyeRAE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aR+8InCWAMlFDWNw3+w9jl9aOqnzMWAKfeVZNo/OGFqQ7Ec43G/EfkY+l1Luw3Kf85SAAJdIxAM9FoblpENfDKe92psmNw5drVZ6pVOFHI5s+HqolpQSiWuaSkw2N4B5tEOx+GfC7OahB2XuEun/im1MyCC9Mwy+lLccTJaH/a8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTQWxdRi; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTQWxdRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787331032; x=1818867032;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=R9XqmdcK55DykcC0mgmSGeFoQZb1o6ZgSamc6yyeRAE=;
  b=hTQWxdRi7qjT621GIZvSnhaeURQCgoi9JUUPVAh4rcSxkHC/4q5UsqHQ
   pZcYsR+jtYq1AiSw+PVDrsyFyCYmInIhrRkkEoPl3ZvOd3cQY7yemg6fN
   gSzJY5buq3mc4Ktb/+Bfc648l/xHuFM3FOdT0t/JiMoJ0yd2iZI0cmSuX
   XXuAQJjqsP7gEcOpG+Kw6UjeHjHLzisciQfaBpDSNzv0IGKo/a8gm5/lc
   k5FvTSOk2SC3L6YVnM4YY8aXYkblOKlK2f1Ml6fYGf5aQciMQUxtCZjs4
   m6/qdEqKUHHb5xvXV7lqB1u+zKtaJU+StT/9uVcryhL8hD6yPNElZ3u05
   A==;
X-CSE-ConnectionGUID: 3Gz+i6j+TiSmMhKVCCADaQ==
X-CSE-MsgGUID: zkexlXQURVCXYAEyU4joXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="90400896"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="90400896"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 09:50:26 -0700
X-CSE-ConnectionGUID: Fpj36mTiRdCczz+uM2ZLQg==
X-CSE-MsgGUID: O5zqb4ShT7i7lUYid4TWQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="263747251"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 09:50:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 09:50:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 09:50:23 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.17)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 09:50:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zsmm9x+E8uwTnupG0XIosJzlIi/FJSARFyuE6H/zvPlFTpnCx9bjvlJVDSDh2h6e2pQiIJ4t1qt9kgIwpF5fJv8x8VYQFxIoIR/sVVE79b4gyEqWkuLT+hY6YLQZlKLgP4QzUrqa0hQFUaGT8N0DYhYFzvrQRdbrmaokkWcyP5ybMH23WjK/pWfHPzTDRYxINDSJCxoFowUx12NAn3rSelkTbEY8ONvf9lsb6tsloxwDP4KNvkFNDt8KJawaPz8uKsuPcKrJetwg3VCZbitSb3DPsGbRLAd5a+n8SH8PpPDn/J/dqUelJvFHv1sUSRSRbrie/fqJ7NRn6MYqQ+IuhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEXCPs1tsgiIdua80hp9nx7mv0KhWkQQoBAAsrIJlNU=;
 b=Zf9yRqMCfrIKGmPn6W4Tr++e2wuHnvtc5LXzR5oN60tkX4W8g8iOAdZ/HMS0PlfWS6aMcM6Aav3TTozUpC4TnWuBr4NhkioQ09xw9nKvt9FeLUqToue5g3qHwiNxKlH1aQhI/oTtge/IYH6khDn9kdwvlPVBpmiTKm0xHCaGwLaJXAwOQ8oR0x5RHveSuuXU9OYxHEIGV7hqn2JfIvPL0buzHcYmLkkGL49Yk+k0/BsauhJJV+VRud84FmMxJNuSWJ0xujYFiDIppwE5H+LyGWf/xFlFgFNWOSnrJNX68mrRRtrNVL/71L31Kb23D0AG4eoWCxWxMuFwn9WzORpGzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 16:50:21 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 16:50:20 +0000
Date: Fri, 21 Aug 2026 09:50:19 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Breno Leitao <leitao@debian.org>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	<rdunlap@infradead.org>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<kernel-team@meta.com>
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <aoiBy3vg9eSvGhIu@agluck-desk3>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|SN7PR11MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: ffcff687-7017-40d2-c682-08deffa4498e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|56012099006|10067099003|22082099003|18002099003|5023799004|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: DuPqp4YxaYqOtPK6Q7xn6ViMj2Toqj4YuyXBQLBhti1ihpHdwa7GykInjUlJFe6ZCXoux0D7nsllQ+CHYY7fXao0JsPleLsNb4XX6bJV0aU5G5hMMgn/Il2mRIbNd9IFWVOigzSLP30qSeKOtfJsbB8iWkibJgqvQqtyifC5fOCXuiufGK0pFe1ZNTeB+QsTH19Q7q4qjmAskOXHFbhVJI4I6rxUwVxXyiBjozECGYgZL2825Px4zsFLUpknggb4vqS7L5pyHjfrZWMdRPVIbZ0DJJZ8Q397u8ySpFC86cEivJ7YkbBvYowlEFhMEr48qx6RpaazIqtPUP2iNCtjkVYZYvRu+jswmxval/nMygxUVp2HjpagTOATV1dxV38RhHOzLq8E2cY6Scwcn663lcZ7GZaU02VeuE2HhVwgmBypY6J/nDdRwuyhK3Zp+84zFfKy9XtsPf8hUhXodcCFhjMysEjfhlQD01HpdWJS2g8/YkI0R591kyVIfGiDMz3lWV+z/fFL6hzCg1+RGi/F+2RZV7hU9eD+l7PGGpGPuyEuC3Yhy23ymdxG3ojNoX8eKrsF5WZJHkP/SF3Fifyp9C+NTqi8nWr5oaUGBUSPJT40fWSHpUz0t/47Rv1kmhwFUnyh4VtHOIrWm3HYM/8GRArglXsl3v2xa2uFtax3LVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(5023799004)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?skMZqMhNDEf08a38Wmm51SrTkvBxfrT4RIuzNIsBqECVDdh9o5KwIXARW3rA?=
 =?us-ascii?Q?kRQfesAWYHi8g3fMgRR7sSY0XE6S0WLqAuBUOWxqVAUr50Ge9Mwoe7hI3Z7m?=
 =?us-ascii?Q?3qFEh2RMRi5OlXNKcsH5GIDlvN4ddpuUg22y5YBnHnAW0sbwH0UVS5lC8wbx?=
 =?us-ascii?Q?wAU8JMxIWZjt1+koUcWePRDvzsvWACJMORB3BDGIq9Abuy6JFXPIChieNGJz?=
 =?us-ascii?Q?J1uGRX9tj170Ek8RAwk8JGitkz+lrVrernAE7GhnUswU8DP8y8/xuuHJ1cO2?=
 =?us-ascii?Q?iCY9Loeg6n5YzNJATnDu7leJAWLopLVrqvqvP6ycvqYliCf1bI8rNRKkwYpO?=
 =?us-ascii?Q?E/LJXXbJueVD3N9PL3lrtvvZCXwFd2AKFhOZrH846SBqSdlXb92FGOY4CP3D?=
 =?us-ascii?Q?Ud5NSqzagFtAArLGdnY8t9u2hKzcS/QoIMDsdcKkWUmqdie95KB2a+REevwr?=
 =?us-ascii?Q?aYcCNfqRWqMrqhaWb56px/id0pWuyag81VYiKgGKhGj8kCEZxhBeh2+493ht?=
 =?us-ascii?Q?W7wxpQaUvFr/tRR7GpUnm9kkT0izfaTFbYSTw/ZmHicLCH9/n3/vnCfVvzAt?=
 =?us-ascii?Q?dCl2Gsck3vP+zJIU3EFEfofx+aIqpac6DT4gxqVt2sC7r5tLQIJrHnJ3qHzK?=
 =?us-ascii?Q?S1znAsUwHrxTZl63VJep2VtXMGLhsJv7lJ0Ka+M++De0RvGtbaQg2iN5rbvQ?=
 =?us-ascii?Q?bejV7nU/CtSjheiEe+AzgjW/gqwX+vRUz/oD6KBh2D6MS57jrwBTy7y1jzuU?=
 =?us-ascii?Q?kC1fJkQ4azq4Jlp5EjiRU/w+ufgQIvOkS06oRt5acmeGteMW1DHCUKIp3zBq?=
 =?us-ascii?Q?RQDEjGrCaW1QMflyc9EEAAPkHE6r7OrX6l1OFk7vkmTpFWVdghSj7O/Bh5Na?=
 =?us-ascii?Q?NNK8MH/CqgwH2FmwLIY6P8m6wjb/Ji6No0O4wmsUQAp8klhXgZHtUfOckEfD?=
 =?us-ascii?Q?EgBXaFrYDP7IA2OiP31Y3nKsNjouGCeaGQ4olw2bwyfXkpwBS+q2GoRowU5J?=
 =?us-ascii?Q?h5SYBY3beKHDpj1exbBdI3RNdrnc4AipHlX+O2Ub+uU/ZVOYj2o1IZ/C+4JD?=
 =?us-ascii?Q?zsyCyC1H8NoB9v3i2BMEtmF84/EUkgRtaqY+1BMFlmddWfcF0lTpZTGUsYnT?=
 =?us-ascii?Q?dWIjFLr5k062kLVvUH2pCRwr4W6J60BL/tq0vxn9eRwXdJIETCY1BtIhDZ4z?=
 =?us-ascii?Q?wZqNNFL629t84IPt5iO5YQGAD9D3o5L/MOkJszWRJb9/nz7htoBBBV4KP2ey?=
 =?us-ascii?Q?+3ia9LaUkSPJteBkuPEhEjWKqgCzUCBproPf5RoJtaacrBzHikEisLC29Y41?=
 =?us-ascii?Q?DgwXKTEnkwrImhUcFLyoLp2CtP6RnKJAM2yK96X/Pglnba0UAd7uWATt1xe9?=
 =?us-ascii?Q?i7JFsOsGcls8a3pRwNxQBbohf0QF4dU4GXQ07Ldal7x66aUQv0XR2v7NJ5C8?=
 =?us-ascii?Q?lqFfhfURamQPXgQTeeSvn/U7rw4WEovwIsTSxryqTtIhhdw6CEJLnRGdMD1m?=
 =?us-ascii?Q?J+A9DKnj6uGvqNLcQ4ajQ5Q87YkS0++CcHugTpnGT84FUrsxlYWlAKl96yc+?=
 =?us-ascii?Q?FuLhx41g4+U0BUB9nflEBZtVjFtSs57aJlWI5NWEZOulDTNiaueUOn3IQH0Q?=
 =?us-ascii?Q?4b6iafGrzFmwEsiYBIQk78zH9z6LoTm9oV/L3jZmT3zTK75OoMXhTZz22qBX?=
 =?us-ascii?Q?NygxNYjSIZ/KqOri5BAuA3L3GG5gd48mWTTGYIB7lA6fN05oNLfSlNQu2Wjz?=
 =?us-ascii?Q?54I3fyVQhQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: ehoCiHsbFny+g75JPiiGpE4pwYh1rKgNiFq8A3kxEvuMnRXTLT7zSaDAiJB/iLNCMmFf4qeoy3d30YHy1qiCWOqXK8ddNuXPKL5pWGETlX+lzhnIoRNfdzo1fv+GtBewzxQkSSV3/XjQ83VzMM7EMe6icA1D+enlO3xyzOp2fmf+i6HPijK/RnEv5RF2d3yBGcf/ElBRsc5vEBtmPA5XgaQNxAngUmFjBeGkX7jQMqZlfLRT/AjTpZGsDg8rAG/MOJ9PU5LqIe69LEprdOEymCWM7t0g53fotMr/NAGQuEBfvwd3mQRLs0FFbvnZSwv0hbZSPEv5d4OrE1M9/2uG8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcff687-7017-40d2-c682-08deffa4498e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:50:20.8695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmimZlcCMYN84SSc3XQ+8L0+uM+HGWJo4tuD8N+9co0zBWJdxm828bDbSwbq7maDPMUROEyI048ZqFjKQCQwjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
X-OriginatorOrg: intel.com

On Fri, Aug 21, 2026 at 03:24:08AM -0700, Breno Leitao wrote:
> A machine check bank producing corrected errors faster than the kernel can
> drain them is not a machine anyone wants to keep in service, but nothing
> takes it out. mce_track_storm() throttles CMCI for the bank and the
> machine stays up.
> 
> Count corrected errors per bank and add mce=panic_on_ce_count=<count>
> and panic the host if we have more events than set.

FYI. I don't think this needs to be fixed, but you should be aware and
perhaps document the shared bank details.

This won't count accurately for banks that are shared by multiple logical
CPUs (you've inherited this from the storm detection code that introduces
this problem).

E.g. a machine check bank reporting L2 errors is shared by both logical CPUs
on a core on P-core systems, and by all cores on a module on E-core systems.

But the storm code keeps <per-CPU,per-bank> counts. So if an L2 instance
is throwing out many errors, some will be counted by one of the CPUs, while
other errors are counted separately by the other CPUs sharing the bank.

The net effect is that a storm won't be trigged until one of the CPUs tracking
a shared bank hits the threshold.

Similarly there may be more errors logged than you expect before your
panic fires.

-Tony
