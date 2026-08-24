Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837F46C4BC;
	Mon, 24 Aug 2026 16:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589072; cv=fail; b=fLYDWcVEIgwApdWYTtWtATn9LMSpV+GKX36v7tJDb76I3sIk8wUlIJYSZxUtRg2PHcUSZipxNEvWvZTmv+qyQz9drCvvhg0CZLaihhJYP3bH+kc/2DhSGlkY6+dbzO1OsPWrMkWF+IzrvaV5FuHBqFcQfWm0nhIsJKSGSvSR4TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589072; c=relaxed/simple;
	bh=R42pBGGtwbhHRkharcLvsofEuDyGYUnB2KiwJL5aWhY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LIvyJQ2PVdKjt2t0Py3wZHnGKeD428K5sp6Bfq/pD1ZBDgn7QBr2+38XDJB9ApnI3W8lgphVXUB+9nhskyP34T3T+GugAdMhbR+oIYfyuP4RT45BZXr+SYiXgN5x9YxjgltUiFFCmJByguvKBLN/RRZufztgo6cu92GAfkUNgog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQ5z9PWf; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQ5z9PWf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787589070; x=1819125070;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=R42pBGGtwbhHRkharcLvsofEuDyGYUnB2KiwJL5aWhY=;
  b=cQ5z9PWfzjcUZKxzS2SJFwLZVpePx4iQ3MTMPYHBV1M1L43kxZR84xtI
   OifW1jaX2AqFBmkQyy7HNpoyHyz4WEuD1SAvLp24Myt3EPMATwnelCIED
   zVIgnFLJ4OMwAI4dbqRH90E+gOpvAjE3KlHzF+Ek1YHwNkQs6KlRtKQ4V
   uw74VfwvK7MLA6l6FjF784BRMSPyWPtQneps74GH4qDO8ct8XR+h3cJHd
   MuKd43DloT56hXrNgrfnUFPnzuYE+v8ZD8Nslph/qvhagryggKihfXUCS
   fEPb9naRn5EFNPWtHyMfoVG+At6Nu5qNThvmeJhKg7ja+/HNYIAxbZSGc
   w==;
X-CSE-ConnectionGUID: tcAGXD4PS9Wv0UtfqOLAoQ==
X-CSE-MsgGUID: pASMxy3TSi+BimWY1+WlBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91917240"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="91917240"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:31:10 -0700
X-CSE-ConnectionGUID: cJMcfZgaS729z2U8uoorAQ==
X-CSE-MsgGUID: YzBOKMdwQUKtizQUYbuhWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="260903854"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:31:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 09:31:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 09:31:09 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 09:31:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SV/GdULzQSoCyUZ47YxmzKXMruKDKGaY9A3YIvDRkceipR8r0w1emYPhnnLSHkkD0XGAVuMVza1QKbKnGYBohJSw8KnV8CM4u1JqwLn/CIAjhG6ME3cBI/Z5G/+djQuVdVJsCf25rssp9XsRTM3VSKHHY6qjFPWBr9NbNBim5B8haEwyvbSiD3plFC4YsMbtzg56DkycIrv4AJifdzV24dA6AlaiTu0ysNkcFgf5Regd2ZcllVwpWD8WIepFEyY9Ecitkfi28V7qyMlSyPRfOCqFkk+RQGOii8+GYToZsdrx1sCh5rBAVGkTkXXBJ6Gr/c/20aH9SjMiHfciOv3jrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjoUIFcJeQ29ZLOClRnmlJkAkvPzgqwLXlJNgCbjcrQ=;
 b=yQW4ZmM+eprQx2qHrohi1HtQTzPTekP/UN91TyDfFI/7jcvclJ686Vz8TzfVXq/pejHfQ2q9JV+m2bhB+/cgxBFoQB6Q75kYF7s54pirr4UP3CUxiC9bMwYy8eZuVf+48Okj2UWMZDdpV29SRTgjWnCySZvoU6GlAtwVrpgXu8UUSzje3unZWGfiYErTgVfNHhel86vH7vawwLzU+V2JeztWPXhTOu5uU92YvElTsESSAF+DSUyAFLFK6/2THgVz+cSWp0fupRhL5YvHHD8bpoZ1DvGO+cCRIn3WNpxz5JOTqjsVnmm9Mv96BrPJxoqhWD8wF1gfhxDCbWG5FcFUZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH0PR11MB5236.namprd11.prod.outlook.com (2603:10b6:610:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 16:31:04 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 16:31:04 +0000
Date: Mon, 24 Aug 2026 09:31:02 -0700
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
Message-ID: <aoxxxmM-xIpyAE_Z@agluck-desk3>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
 <aoiBy3vg9eSvGhIu@agluck-desk3>
 <aowABmagul44ENde@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aowABmagul44ENde@gmail.com>
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|CH0PR11MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: cc8e3fa1-e5f1-4b79-7f08-08df01fd176d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: D2aCI3GYPzlJNpzSQy0hVQzx8zBMLVBTs4Fn0BVJRnkXYiVAKxAY3tfblvTy3ZHYPXoBS4y2Dj7GN2fsvNir7geQTtKo70oAdsehbofjLJDSoM+yJIKAN/6RThZXEFjDhuTgas2+JyqiUm399hZRkN48NQOuBb1TFA0qr+zEhvUYCgwtDeJSWE6Q0EdqE1ICwoILKeFjiFlRG8ObBnvDj98tR2gtG677yi+THXUvz7MuTLqsQxaHGuEVq2UpqQuF52sH5gMMShuqDQwIMWE3eQo+TmyPPpEgp5sP5AdtkCrY0auCoMzU8v5UfFd8EayQ6wiTrlAuKmAKZYyqE/Wk1kJ5nu9uMoJMLHG2JrvgjeC51KdpUSYmmE/FVdNzsMbLbiriJ8Z4hIACUD/X7Q8GjBmn7ihnxXeBDOGhPSOV5GjAfc/xA91jWsCYrLD0jOwQrBIH7OXui3ZUMOW+sB+QR7vGMzviWT6PCZOfG0MDDYgTLPM6xhXHCVtM35P87rd7sFKQXT5xdNBI6+rEzQJXIiupxXTVBIHRjZCG+/DfGmDmb+ZvvLsXG6CvUxLtKCQIASHGm7PTqkzgF5RJJCoFpl8iigxcO4LzjSM6oTNjz8gD3VgcHF20fFyBDmZeEb0tsBgOQK8YY45ZLfXYkeKcQtxeKvQ+HHChbZ7XDobTFcM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X3h5K4HXCp9GP6BbyR/6LTHwf+FaFKjodSCIvtQVCQO/WbeLu/Co9JXn3jRH?=
 =?us-ascii?Q?f+s/ljSpcD2VLnLXcNKz8iqEm7gqmQZP2AnQ5Mf/1NfyDMM6KVHaT+4QqAKU?=
 =?us-ascii?Q?u2xe622OrX3MXjl6ryM6iYvTvYwnkO97Y17FdZ3NJLdYCznt5WwN9sINWz0+?=
 =?us-ascii?Q?oOXC3SPkC1VNOGXE3cyISQ2fzFEUEGhnIacp2DEX/PM1xtlyGtn68Ml8XCzJ?=
 =?us-ascii?Q?KX7ifxm2yUzJJD4FSuLRv3/t4Ltr+Y5YOXbp5R1U0ff7LaimMatVhMrc+Fqh?=
 =?us-ascii?Q?MFCiCITSPjYBsYTz7FN+s41HGHurGm5AZcyo3i6rHMve/CCCMzb2M0Z14EHM?=
 =?us-ascii?Q?KrdZyKvl/5iGQUMjXYW8PXdI9llCrmbW46zJcqZ0GtZIdiS3R6VfGEPv+js0?=
 =?us-ascii?Q?gJ7RApeyq4Hj7Gw4hAoLy/zGB2GKHptP0R6AvEURk4NP3b32y15KUxcYSKI1?=
 =?us-ascii?Q?QUbnD7yMOey9DPkyHkYRSSw+XgWdjq6+kopynfI3/U30KmJx0H5/l8rjruNC?=
 =?us-ascii?Q?Tf95XkV64ULZXAgWWGmbS/n96RgVcwZbh58ZAMfite/KFIrp9f+rLakk+W2o?=
 =?us-ascii?Q?wfEAER7KpxA2cfcxgV/zRdQ2nRixExusVUygso0BRuj+hbwOcgbqHKn7vmPC?=
 =?us-ascii?Q?WtSQiY6eTG/zpkIrkRx01nmQMra/m0diS4yE9qqteYyYhP9fCU7Wbj+plbN9?=
 =?us-ascii?Q?bT2v37etHIaBt/LCS2Fa2mmhzXGnlms6HnuGpNXjAX3mpicemDxMAbACDHkb?=
 =?us-ascii?Q?Qi/pWgrPKae28MeVoOBJYCjJ2wshbadWNFUW5FuJ3I86j4xYK9Th4+MNOEIC?=
 =?us-ascii?Q?p7b/UlxOOZSt/9pBzrvk78GQCmhu01FJmY6pRcmDhWDYnYh1Mu6DVAL+WupR?=
 =?us-ascii?Q?yuGr9Wg3yIj+ABVjw+eQ9b8oG8qxAgCthRB4uV9WZQVsI/xDlHE/gsvMoQ12?=
 =?us-ascii?Q?o4xxv3CfbeRLupHXio7MuyhYsmTdU56W4kGdT2V51v1swjhAidYoTfNJ95KE?=
 =?us-ascii?Q?QlXDTF1dXnW0YuK9ncYVoA/iy7gXX+NaDBBIuF1GRLRw+T4dDD4wbK0BnuhA?=
 =?us-ascii?Q?lePeqRSU8jLUijtaRAV18qEcR7aoY3x96WLu84AN/mtFe9OY27rf1DKVcDeo?=
 =?us-ascii?Q?Ujuhl7++t5cIW2BPWr8VmPVVtmvNkRbd6vXP/gF5mBN7HxH2NnQBOHF3nTj4?=
 =?us-ascii?Q?tYyTwQ9LwROIRnlcQv1q3rzALqo+gm4+q3ufN8c0YPbHPtvfJAwFhNb3LbiE?=
 =?us-ascii?Q?J1Qr4gXB19riyNn4h7ArW1fgJM9YJzgFb8eVa+YWL2ZeBGMrI/G/HA2DXGtl?=
 =?us-ascii?Q?QT2BW127ZbdMeJHgCH0jiO79xLBb43c4v+adYK3g3uLb7ESzamcNTuspba3Z?=
 =?us-ascii?Q?Ry1IEhk17HVDtSOoB49PL3kbbMwAgPkU0fBYywbVHwMy+fLnUA5YYfFtd3In?=
 =?us-ascii?Q?HYHTGsVWfWtpmNaJtIYVwXixw4IuZyiaxeBxg40Jkk+r3ba6MtWNaCu+6eYZ?=
 =?us-ascii?Q?q0lr3WXT8pwAF1RR0UtrbHUR8PoQilAsahzaENG3pY24UXqD7dtchzU6BE9m?=
 =?us-ascii?Q?+8gkcKRyyr//EdNZI1Xi59KlGzHXbd/GaBb3IWNTbp1W5do5c8kS6yEPC+LC?=
 =?us-ascii?Q?McTPpPOY+vFwjfW21upnLDaOUrlpwn4PjcM8cLkI1e+X8CrbtNigDvIqK7N5?=
 =?us-ascii?Q?rOdP/c76yuKmF43Cmj7x3CX7+aF/7w0VsZpX6DaNmLjcFPfOh7Wmtx6Fqbk5?=
 =?us-ascii?Q?YVjBbnk8Bw=3D=3D?=
X-Exchange-RoutingPolicyChecked: JD/9qt8Ov2eJNrD1khGBGLxtbcBCxTbfMQwLvs1k/+jvgqBGQtfE15dcQiPlPgq4gvmWiDGN0mJfXtbUUb2uSNZuzKsDNhEV3aF/QrKuYjTEMcv4ed8+fkgu2+VVwDPajWFe0pod/MmHm6FTIiveQ4XZixhcq3LLMcEqEPKzrmt8A5XLQyTUABhXEEhpOO5oBxLs/2h6OZIlkvpAhifgYso9xQ+UDOnUBrUgRO8lUme//wnTku0qHSMa3F4a2YTXM+ReSUyESEixlSasjgWhGe/L7GA1bpgnSasI9z/5I8EvgZzhl+0h/B16cVzLLGPM5bcGItFxS8bbGvWcCqsN6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8e3fa1-e5f1-4b79-7f08-08df01fd176d
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 16:31:04.4759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qnm3GHm5J7pqJqH+7UGSmTPZRBySk4DDB2dTLbZW43BWsf8VlThtXw2NQpU/chnIkWvG670Qmvd4YVELK4uCZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5236
X-OriginatorOrg: intel.com

On Mon, Aug 24, 2026 at 01:29:18AM -0700, Breno Leitao wrote:
> On Fri, Aug 21, 2026 at 09:50:19AM -0700, Luck, Tony wrote:
> 
> > > Count corrected errors per bank and add mce=panic_on_ce_count=<count>
> > > and panic the host if we have more events than set.
> > 
> > FYI. I don't think this needs to be fixed, but you should be aware and
> > perhaps document the shared bank details.
> > 
> > This won't count accurately for banks that are shared by multiple logical
> > CPUs (you've inherited this from the storm detection code that introduces
> > this problem).
> > 
> > E.g. a machine check bank reporting L2 errors is shared by both logical CPUs
> > on a core on P-core systems, and by all cores on a module on E-core systems.
> 
> Good point, thanks. I had not thought about the shared bank case.
> 
> I will document it in v2, roughly like this under panic_on_ce_count=
> in kernel-parameters.txt:
> 
>         The count is kept per CPU and per bank. A bank shared by
>         several logical CPUs -- an L2 bank is shared by the SMT
> 	siblings, for instance -- has its errors split across those
> 	CPUs.
> 
> plus a line in the changelog noting that the count inherits the
> <per-CPU,per-bank> granularity of the storm tracking. Thus, there may be
> more errors logged than you expect before your panic fires. Would it be better?

Yes. Documentation like this in the commit, and under Documentation/*
gives fair notice to users.

> One question while I am here: is the approach itself something you are
> willing to take, or, just a just send patch [1/2]?

Boris is the maintainer here. So he has the final decision. My
opinion is that this is a bit niche for the kernel. Maybe this
could be handled by some user agent (mcelog? rasdaemon?) to
raise awareness to system operators about high rates of corrected
errors.
> 
> Thanks for the review,
> --breno

-Tony
