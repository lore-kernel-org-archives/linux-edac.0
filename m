Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8A83F888C;
	Mon,  6 Jul 2026 23:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783380570; cv=fail; b=P0hY/EpQNfNIlsiCUGtekUqHHj+GNImH4Yc6tbs6PY9VSXuKVEchtCGzNOK23AAdAqQrv68y+X4ndpcEFurhzspa/boes7eF7Lhq5P4lrycCUpBAcRmKd5AI+7y/JB30uJlPjHbsD+UF0HOA9Mfv7re0Uj5Ka1jSXhkaOPU+N18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783380570; c=relaxed/simple;
	bh=me+UoTGo6i8MLXPY2EhvEtqVrCJp24GoZVWQYvYsAS4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gz4SznQxdbhFcWY2yH9OE8nz/h10SWcV5N0iZeBgivkTfWo4GCvyeL36BEFL9qfypkoHz8H4abd8egp+Sc5NPHpO1yFDjH1ljuTrTQTZIDloSOx7tuPw0HxTRz6doLD8DWysD2epVmcFXTWT8PxNmjQ+qLNtyieR4yvpq0hgcIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzUhLk8V; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzUhLk8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783380569; x=1814916569;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=me+UoTGo6i8MLXPY2EhvEtqVrCJp24GoZVWQYvYsAS4=;
  b=hzUhLk8V7nOS5Ki/tQfCevCASUsaUXR4cwNpr8OXsYFl+F1Z6JDECMNe
   m2j9pNH8Pt3+Hxv3qvdMkJZ9/PnXK+A6z06MhptI2OnvBy3Ort5tezh9m
   0wuLfBI8LVCBqKekntvdg6dJqF/bbU8IzkPSg6NNUT+tBsgzD61qiag63
   BLPyLE0zvmBJ0uBGhXfzhmOG3TgR/mFswKqdKc6oCsR9bRk3k47sucDwA
   DiyBTQbnyV3oeFrbR+/XteIvcgDPuM/Vg2KyQPOKRSSiHQJa0YravBAW5
   Tvv1nEzN/q2P9IhZkJmh3mTLPzBt3Y6TnZcq4/SJCFntVg7LRIU/K+Mmn
   A==;
X-CSE-ConnectionGUID: kgPs1st4QASnFkoC2coKDw==
X-CSE-MsgGUID: hXr3LTtJRYm5xA851ho0HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="87936035"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="87936035"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 16:29:29 -0700
X-CSE-ConnectionGUID: x6Iucx5sRXWpkSn6XwzvBw==
X-CSE-MsgGUID: AvoC6FGOSj2pIPT0N3Oxwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="253934279"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 16:29:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 16:29:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 16:29:28 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 16:29:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qemVH0vWIKOt9fAy3HOJzXezfmF8H2FYsr04zCgpjrH8qKV34eYses1bVF6KDlwtL2z9Q/Q/vnbQhGq20J3nBDB8F+EeQSK4Q1oHij4sI9l+Fq1GNRCQlnNKFRRqaKrBYxTeDpiKPQmJjR2kdVsFx3twUUNcJV1IF9RR4LOILVWLAlkm24Ptv1hKFp8hgbsKtZ4EjQnqym+bxk1XVCRHZwwxEscn0Zq6WM6TyUvtsCCgy8CF8ahTEjhZS00tUQyDA3RI8KQdjBAPQI6nKj7Qij0sFRLXLpxkorLkfuKfd7y3GnOuyYfju/d/ulj65tH5L+fGnqMv6ceP+3zsbMastA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaj++CI0PBs6fRdpFFqUClfdRPdEadLbjmy9V19y5iA=;
 b=WbRGT6nPj/IjAwKyx6ZVFqBswHmKh4XJSDz8ctvCKNEdbRIcseoVGug2tGFmJSY3CS6BV2TwvofI50e73St5dFwSClp3XXI06gWUx9oHxlEnudrjRA80L5bDhn93W99IPMJaFM76fqAr3B8NopH0K+MTkfkf4CVOLzOkYMcwoxpGZYLED+217C72PaRX7iHIZTqeAL89YhdSAQABWie+o5vALbpI9hUOjT95oBX8DaSsCW8WoL1Khz3kX/IgSQedXJoiihsc+I86coeeqHe+QhROYArJP2joCwzHC9udUGbDi2+U8NjHWNTMF1ydEgzbdOizfELBSCzwA3UOy2jVVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DM4PR11MB5312.namprd11.prod.outlook.com (2603:10b6:5:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 23:29:21 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 23:29:21 +0000
Date: Mon, 6 Jul 2026 16:29:19 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
CC: Borislav Petkov <bp@alien8.de>, Yi Lai <yi1.lai@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/10] EDAC/igen6: Remove redundant resource
 configuration tables
Message-ID: <akw6T2ViydORzd0p@agluck-desk3>
References: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
 <20260706032233.3283297-10-qiuxu.zhuo@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260706032233.3283297-10-qiuxu.zhuo@intel.com>
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|DM4PR11MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 695170ec-a507-48ed-5644-08dedbb667ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: ZS3HYmTi9jtlWWYoshshyfE7yzYet8S+JMrSRzvLZeFNlqxhbwm8UKG+X18aEe9fgpqYN6ancwvSmMqKoOEt3S6pMxDNMUyhjgy9SV7jkNaZauAAznJx/uRhSmqYc92Xe5UGV53Rvc3g/AAltp2J0d6wwlhDi9TPe2oVGJdhmj6r1dWKZiNv9EtNjFVHrT1WB3nE1eWHqGV2LBIT0VpOZNraEx2eETWtCrmvBGmEjKjba9g7kqB5kMhfgk1YrfFACawcrTs2Ng0bxIUU9tFaJ55DijyXMjb49QsV/ix5/gboJ/wrmh76ViZTjXVJ/pgERHCRiAXtVPwSIp7FQaiLiUu+WKmQW0LaZY/NnGmK6EBsWF96xP3uAbweqYDZTUc6Hn5GA6Koy+r+PcdHrthAqmA2xXic7sMBTLzrSMydALvGHf9daDc2BTZDL+qfS/hb0M70mxdAL1Y1sM3vjvEc/Cgc469VN9pa9H2qIo9hlO2/gZ1o+D7AV/flUlMp3VzX7N9GSe8pMqW9BpFembjytnWVG0xzQMFEPwbjdIuD3dE9rhH0uIDaeF2E+JRceNPR8KDVU5mtDc7O4jmtUYtuDdkki1Jncc75ekc+gleIBQp4c9DiQxtXgC8ExwXhiCxvpl2BqvogsZ52yz2KSdVC6a4bbcA6B4t/l9ndohfSP7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ge1wSfp0pA5CvuWaUnR0v43Z06miVfYK632YBst0scTIvrfWttFbTVGq+lVe?=
 =?us-ascii?Q?j7ZGN+Te2YOFHhbeKYGFsheQt/hRH+QAAlvCWsfK2qYOG5xIpPaf+GUq1xf8?=
 =?us-ascii?Q?dj2SUZxplkFb8mLTzS+BK/2SHAuN2Znwhf5/l5fLcZahCCCMf4FHOkozNoyF?=
 =?us-ascii?Q?4IddyabiypEVf/htmLBIv+DJEtQVh1j6W05ubcwFuZzIpSfunruVhN939YQh?=
 =?us-ascii?Q?wW77rF0uN2/3XE7tH9cgAQKao8G+5AFseH1FJk/7QQbO5oSntlNjSAvhnwwe?=
 =?us-ascii?Q?h5zrt4rwD3BRfqupjWCl6VklnaZFpSN9iMIMkSLMkKKOdsoInvBVv5PlcrmE?=
 =?us-ascii?Q?J1Wx+NvroLQsWgVQhjBYc46bz4XGlBS/hQ9kT7qgnytEF7MH6F3qIzeyW8LG?=
 =?us-ascii?Q?kky3gzLuSX74/N30gZGhmsFrjnxoXpTAPWWE/d4U4hJ3K2BIsaUTxNVeVCsd?=
 =?us-ascii?Q?yopW9DLBWH+uMuiTuqLJKdwFkact26NSx1KArTK3EpPEm0bD3jDPPwBz5DDh?=
 =?us-ascii?Q?eniFUT5Puz0RPvs+hfLRJ39AHYbszSoyZsBXVeWaQwgU8IBnFAKF4GmIf4hO?=
 =?us-ascii?Q?QQHrKOiYZoPIBMKSywc9QxTRXFpdlYyEtCAJu4gVkiNLESZ4HH+TiJA2eeMg?=
 =?us-ascii?Q?erVBwpa8tWU/h9rEtcqUtOBKAfzi/rfoY7EOa1BcdA0jGdF+pcNwKmxciD1h?=
 =?us-ascii?Q?TYI+xmrS3pREeiqiKlkVIPwMzPSrFSYlEzURei9+oD0JBX1Bbd98WLtK8PV/?=
 =?us-ascii?Q?Je/gzMK3u8EjiilcmjP5E6sFGOfpnsnbVbxE97I/nOl/c1IqsuELkzDb7rou?=
 =?us-ascii?Q?QwdNJjWC7gaT832ZyFzmQdwxq2QH24PuTtMW1wpJKAjw1/ld0cK+GWo7Pws3?=
 =?us-ascii?Q?q2boHweceLrPAMXqRvqiRjtlFHCSJhlSXQXAqpvKWnUaK+lM70j61OE8STvD?=
 =?us-ascii?Q?tyTic9IUbCuyytINvvRXjj8CLiH0HQAkRtWtC5FbL189YvbPd9VxR8w4tfj+?=
 =?us-ascii?Q?TXVlWIi6lE0ekp6Z/JeMk0iKPOyqYCvinRF0a7mdOgYTH9PPwDWBLmnP/Lik?=
 =?us-ascii?Q?Y+Ol8iu6PSFm+jbslfWF0R3TuA9BqMcjBtgsqa62hrDnk8jFZwn4hEGhR6gW?=
 =?us-ascii?Q?POfou885Fg21B3HXbo2FG5VEJPzewHFKXu6MFL6DB5fWJuApuZKpv4ErgJHr?=
 =?us-ascii?Q?CDi++O1258p2y85t6kcgfyqUD5qoNPE8kxCcWpa2+veMHzs5vkJD6kpluhIN?=
 =?us-ascii?Q?SjBJlRgLs3EUBDwmlSnb72+9Yjo16jwm/MOfoxn4MEBrn+ZY6Y74Yy0RXW+i?=
 =?us-ascii?Q?ufBVPNSUx4Uyzx9V7VbDUtl7qBZQNrM8TmGzDBq1Pqrl0Y9fYvOdZsp0homO?=
 =?us-ascii?Q?JUClJI1C99q12ZvVeRUdt5LMfcEjrW2XK7Gwu57zzwgHMZCUTyAC2/4dvJ6U?=
 =?us-ascii?Q?WkT0OnWfe+gcfFE/TCOfamABbYMgHK+4rmmgYVb/4DB7GZJs7a9Z5+QLmJ1z?=
 =?us-ascii?Q?2QXJV2OYVpWP2bqTlVLnAo4xcdRw3D4ML+v5oKjS/IsSwHo1zC0qB/qZTj5H?=
 =?us-ascii?Q?EiRkKjDpRh45hvInkPHRBd7xolXJ7KfSmbJhevHKPg77iqylnoYFT3znTCF/?=
 =?us-ascii?Q?mn8I9FwD9unfgMFlE3QEn0cc2czOCehQXVvcIP6YWPppIPwxfwT7UrbflKLb?=
 =?us-ascii?Q?8bdJtyV+Rgskcv6vqqHAVCpuU2agIvLZbf0/QrR4x3w1moc5IxlxxL9NmAYJ?=
 =?us-ascii?Q?Gt6N7IY0qg=3D=3D?=
X-Exchange-RoutingPolicyChecked: F61opDKQgXbStHiU7CseESMDTLjBkffk6zsAmtl4nS2jFMnc+7gxMqtqkXemSUFUlfZQsuf+97IuW36/JTew10539WbVuT1QdRA/XcczyM4NlXSFNj1zd8UiH49ccu/BQwCpCUvLsK6PW0UsjsnkWnkd7AS1Pm6pWFpDUIiZWEbCuIbeGiL1672VKQwpACHP4zMnWEG8KsQ5QuyEjdxYOTG41xsc5GH6YYmNYlM81o6rjyrIhUugvsAsNjyplwbHN50nrW6i6RXEtB7NPNjXyWfIrt2rKEP+uJ2w10ir+DkRAw6JeJSuBu7bma8ebwleZzYBS+MzJtO6KgUeRORFNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 695170ec-a507-48ed-5644-08dedbb667ed
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 23:29:20.9266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xnMnWO/Uva2I+1pTzoJxE7IR23fZW9ka2Xi11LGP1xcG82epeNd7jvZ10O9p1R31rhkQx3zQr2u4BP1BcEn6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5312
X-OriginatorOrg: intel.com

On Mon, Jul 06, 2026 at 11:22:32AM +0800, Qiuxu Zhuo wrote:
> Several resource configuration tables differ only in their num_imc
> value, while all other fields are identical. Their only purpose is to
> describe the number of memory controllers supported by a platform.
> 
> Since IMC count is now detected at runtime, these duplicate tables no
> longer carry any unique platform information. Reuse the shared
> configurations and remove the redundant tables.
...
> +	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), .driver_data = (kernel_ulong_t)&mtl_p_cfg },

Sharing these is good. But also might be confusing since the structure
names include the three character short form of the CPU name.

Please add some comments before each structure definition to list
which CPU models are sharing. E.g.

/* Shared by Meteor Lake-P, Arrow Lake, Wildcat Lake. */
static struct res_config mtl_p_cfg = {
 ...
}

-Tony
