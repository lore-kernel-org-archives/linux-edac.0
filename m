Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6363D646C;
	Wed, 27 May 2026 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898694; cv=fail; b=JanWQ3238MseAoXERvMtCYD6KH4yUM3hsGtxExrNy5BWYLMSpiKc2ZX6/nRR7R+iaogIIimNyi2MCNicAXxO0mLJ12dus/hnTWtsy8u4anp14yu7FoHCIkkt3D6efuphN7Mnm/ilGMl6ZmWkpjq5Dhu+AHlP1PpRddjkyoIovGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898694; c=relaxed/simple;
	bh=Vl7+TSd4fm3dpAR9v3dlaTojyzv7REQoE7XT89bE428=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=goWW8hgTNlr0IyHisInTnjGBwNurot7IXjHqfkdUONo+hngpJh98EVOeK2JvAryu+VpjI7DocGsSh8/LefS20LtTfQwq4iiLRdswIp/pAOwT4Yb1mD2QDhkCDOqmhcSDuimLQ3Tgc8q8NmTroa9rcIvcN5AMm+J6g0d0f6wJVYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVluw04O; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVluw04O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779898692; x=1811434692;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Vl7+TSd4fm3dpAR9v3dlaTojyzv7REQoE7XT89bE428=;
  b=fVluw04OM/VxWh1dmnQXffGVt6oLdLxcgkCdz9ZexGEmVMnf8v1aAu1W
   5VtigV3OVkW+ifXhMNeTHbzdy3dpwS9n0v6rOSgpNMsdAmYLqYpj0d9sY
   gSSL8mzunoj5v66DZRCUb4SNHm9VpIUAvURackZfCy6FjnaXVDNoqPsLD
   /fN37AuswEoEO7ZgYwqSfnIBKZ1B4MwcQgKud8LWV+gG9WpWbsr4ukhA/
   3Eg820j7q28rgSKdNcFd5V/mz15pP33AOuFKRUSxaxQzCMb/eIOV5i7ol
   Zr0Hid3pDSiCt1N3Amc2ovpqRd2tVERMo25qXXanCgHXXjyH70/CV/ShV
   Q==;
X-CSE-ConnectionGUID: L0th0BtnQRuAcRddlldBlg==
X-CSE-MsgGUID: tjlE4dKDTXGgCCo2Gf1Mmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80721998"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80721998"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 09:18:11 -0700
X-CSE-ConnectionGUID: nyW+KCo+TyeOJ29Chm+KYQ==
X-CSE-MsgGUID: oax9HKCUT+ymFmo1DtF0mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="235908545"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 09:18:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 09:18:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 09:18:11 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 09:18:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X60TiDWN5iqPf4sa/M1Bp/XNcfXspw/+yMGyK4gYAchU5D23FQF33YeePEbKx6iooGRdFRaJFHYG4uZ3rTQYV6hbubxDNxvCQgaVMFBni1Se0DEeHYrju5xtMdFgX70RAtz7AbZPGvbn88PAhDwhlmfXxp5ErDo41LfpaKv75Qdd25kBhUktHfIG6pYzz+GhpeSoLU5YbrKy86H2vG/3QOVCGpXlcPxRlHHfLlI9utnGGY0MWkIPJzDUHZYlV8ah49B8YI4Rsir/e9JZR7DwAM7NqqfQSg5d1MmBoWRAzMcvXgh4AEHyI3ErgPQNVPsT2QKux8D8S3IweDWF8dKKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQPIUz/zLGjtQqIA6YIldutTMT0xFUNSB/0Ap2Rvsag=;
 b=u6h7bm406GveINrXdihLB9JMGe7vEXuLbvAymus2WNDyJKl3De8KXz/w60r10MiyjpFBvmVcRwODH6SxgpfVxy6FQnZxgEdbSyO7cTpQUWR1wkHVivt7LFJgUHM2gByuF6+1Dag+jp+n4gKRGYsdaLx2TcsnmWCa8hPvYtMo/Zz82vvvhFCPTkI98sSYQv+GCT7HEykQunl6Bi5EXg8ad6kl4dOTjjjm6jb6D3Wlt7IyMnGeUL8kWh955ZOBW++nDRyyzhltYL5YZyNDsMpg9aGEO19G3+EJuVbvfPiOjnmOL5+23PbMHOhsGcrv0yZsMCv9CZmRchira7/ReGXXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA3PR11MB9350.namprd11.prod.outlook.com (2603:10b6:208:574::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Wed, 27 May
 2026 16:18:08 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 16:18:07 +0000
Date: Wed, 27 May 2026 09:18:06 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
CC: Borislav Petkov <bp@alien8.de>, Yi Lai <yi1.lai@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/8] EDAC: Add RRL support for Intel Diamond Rapids
 servers
Message-ID: <ahcZPoWQTF3pGPtf@agluck-desk3>
References: <20260521073112.3881223-1-qiuxu.zhuo@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260521073112.3881223-1-qiuxu.zhuo@intel.com>
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|IA3PR11MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: c2fd4840-2a34-42cb-2f8d-08debc0b89cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 5hkChgAOUjq6700qvH/e/mgI8n1pVNYbwMYeEF4HUXp72kKfMEPjGus2vn42xcHHDIs5Vi+DDw8o/lzldsxjmZyv9X5jimxeL8LgfuuVmo8//1QD0ee9cteT9MtY4vsQzOtlwoiywZ2yx8a2FDDcNKwVyfzz3WmxEgEP6t7GJW7Jdswxx84/gORplVG4+hE8S4CRdSNzr1lsH8qfBa8Q6y41nHPGolIxL/ebAGoSRkTLAN6g6EOgcwnaxne7XPmv6x4Rsb4FgFL1PU0wGSrwYzU6SQLpoKRRAQMkDVUHIhifK7cBbz92fmAznY9UrlDJsVfDgTHrGT/8HUl1tJOZ8QPDbXGGmBSxnAs3Fxt1wGZjb2OZ0kpfOeVm3Nhk8IfeC8GAgjvOuNxhvS9lv3EEHhFGuJu4jdLQwrRQw81x22nLfn6Yujiog+rvPrMn94TbXWCFYkz9Y+an2TgSBotrdnz78p4zd5atcz0j6r4o7+BjWoG/NAU5VhQGmDBhH2O84VXPaQoX7pWvKDRsjIzs6IsJFFkfQOMWFZ4S3Pw7bjTrTeLfhS1/idSn/Vcm+w7dN95lrqBlntur62TxhmxutKodPv9VSkBHwMy1+fD5Mwlumd/oPFZ3GSA2hHS/9Wt3joj+4wZqx45HkpPo+lF2X6EKpq4nfc/rKeYjNXi8BXu67tYdH5TOILMYdsLHGOBF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hJJf9Xs37unL8yzmVvVdwnsP2M0ag9RXu+3Z0pIzU1nEGkV8niqA7hTePghr?=
 =?us-ascii?Q?q+Ajd2L8DVDWVDETihv19ms2H9QmPPlAL0RJ/FM3xGzWk90XzG9pbsSxYDYr?=
 =?us-ascii?Q?A7yYPXZTtz83sK/221RyAtofPqCJWfCnnvp4xe5jUdwAU+sU2r9DGBfMki38?=
 =?us-ascii?Q?vxqKm1iilyNVilg6w4mIuLbAic2J4+YzNsWOMLEIKkLwRmj4i9FpAdbfT5Ox?=
 =?us-ascii?Q?A2+kTdXl5GeAqpMPXoLJRyHqkExZdA9zq/iOe1jRsuBALHIh+SiJJT+4YtA0?=
 =?us-ascii?Q?fQMwC1qYN4urMFZpqRAC359VMoyeXEvOZzxR7h8TdeldfrPYtxz+q2Xrysuv?=
 =?us-ascii?Q?ole8UTf311bCnS44LXcNMGLrqatqfobfCyMbkNT73F2zKpgF5fSS0VMythQr?=
 =?us-ascii?Q?YvgYJbXA4Tv3T26o8+hk5T4CJEUf6UxnybL6mzJ2pLAKo5CzpxmFsdgcrwNy?=
 =?us-ascii?Q?zi4FB6p8fEm64f2xfg5ga8CEYALsZ2B1nD5bFCOqDFQiiKUcFlG0lG5T482k?=
 =?us-ascii?Q?0ePuYZNLXfwQk8KTeIV9e9LqIh/F045XLly/nEkBugeHmKx4LK9u4iTk6PSZ?=
 =?us-ascii?Q?sdEy0DqiJfh0a67IQ3dFQPgsKzfMyFVQhepOJel5YMkqLrfHyy9OzWEyHi4T?=
 =?us-ascii?Q?8TY7yefcm0iKlJ/8DpqDtSsdC20bcYyHggXo673ZmftlcGwTbyuvTpL5YQWC?=
 =?us-ascii?Q?+y6xIJMoItBorIkUAlycWM1JUwpn+9QmWztTVu4+KP7uqAZIi2r8y16k5YA2?=
 =?us-ascii?Q?ncler2mbbrJQ04bbH1U9go7f24Lnsx5MCamo6KGyRTNlqyazP8YBLuawZb3u?=
 =?us-ascii?Q?QLVJKjk0lqOT8l0h5D0vcObxT4Ijn1iDHMLFZSRydHGOCne3BtTI7tEtmXaI?=
 =?us-ascii?Q?qIFAlWhDtTrxsK1lW/+28daQKtdcMIId6kqARVEN8qF2KH7rfhCcO+neIF9T?=
 =?us-ascii?Q?6sMG6ZUylQTof7jGgsuo29T3Sv7ImcJ/pylZIJQ22cCxWEsnHQrQt4APer7+?=
 =?us-ascii?Q?iczfAOQu0W9RZd09EMY0rPFNaiAG0ab72BqbINLW50u7dDPqQ2tZ84YxdoKQ?=
 =?us-ascii?Q?KjoO4Hxj/MCCy0jgZ0Mep9huvS6D7S/oTCNLaLi8cJ/sPg8Bs5pqv5nXzV0/?=
 =?us-ascii?Q?3RK83Z75ly0h5ZnaqdIsmPntYDas+ULH1tb9+oOMMohKhwbDDl3L0GvdsOoY?=
 =?us-ascii?Q?JnmIXVkcmyxzEPencydKiQwD5zXO+hzCnq5SvJ2kFheTKJWNkiftYC2BMTau?=
 =?us-ascii?Q?WCf6z9u08lEN1NPgvcvWLaExrmJ/lYYCiK5qs9EdJ9k9yVzbjYNU9XfyB7SD?=
 =?us-ascii?Q?mZTIoITNz2WOuQvdFUuoGZa37XljKk872vA/ibuWX35Uwpnxynqa/lqddtJ9?=
 =?us-ascii?Q?ANPAWN0IVzBvYuL0U5DmCYMH9BhQjUVIp/kIJA/zz0PQhd9abuIUfSLoucLO?=
 =?us-ascii?Q?M3g+t4Ze17u5gqZ3TNG+oXiYQ4EyIZFFPyW+6RL8+IkPiGoa8nXcgCzP0bvl?=
 =?us-ascii?Q?QtSGPkv30ycj4peNOy0B8y/IjMkREq3qM9/lBChgYO+kV0HbDvjz77KD4dyc?=
 =?us-ascii?Q?aMI6GzMAdtk5vbHFd9tLJ6gVLqG5Y0/92JLUreq7QMPMrWgEmkM8uUfJKzzc?=
 =?us-ascii?Q?voT/gmffXBF0XCck4gQxe1cPZFX8w1QubHrHxfB5mftTud6wSB5ds54Cl3b4?=
 =?us-ascii?Q?5Oxuw88G3V8YqsQg5SLyKuCyPf410GgE5hfXDmDXkmrvfpsjZ0QoECb8+YeD?=
 =?us-ascii?Q?QSc9fd1jHg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Y6tSKPKxGg2gol5A5lP/KdtcNlv43KVeG+45k5ChZ4tZYpS60/Pf38P+y000qofAyvoyGchx6jez5H5UdRjn9Etl6L/PhDk/HEre03ng6y7s7Gu4fDf5rRGk0EXpCiWfpEtHm7KHl3T6VtJV/lYvc8efkLvbQ8KduTQR9gE101A92IdWWykmNYpDnl/oq9TISq3zvr1y5/jaq2R7RRnuinqhT8Rell36hX523VxHhtuh3MmnMvTkuopdt/DrHy8PK4kvQ/o+NvmQDXOPTprHgU/bLJ0ymlvxMEaMUnGrJyMzX3XX1pRIWKVKOgWbPyB+eeKRrVy6hBxOo3j9MKlURQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fd4840-2a34-42cb-2f8d-08debc0b89cd
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 16:18:07.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mj5Us3yt0nPMy/xavOZ0IZu2Loxazw/Y/GMkrOYc569OAoPtxA8ARINsDJhDtTCcHYZQYUO/K/h+cPSZB5CLXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9350
X-OriginatorOrg: intel.com

On Thu, May 21, 2026 at 03:31:04PM +0800, Qiuxu Zhuo wrote:
> This patch set adds RRL (Retry Read Error Log) support for Intel Diamond Rapids.
> 
> RRL provides detailed information about retry read errors reported by the memory controller,
> which helps diagnose memory reliability issues. Intel Diamond Rapids introduces sub-channel
> granularity and requires updates to the existing EDAC RRL handling.
> 
> To avoid code duplication and ensure consistent behavior across platforms, the existing i10nm
> RRL implementation is refactored and moved into common code shared by i10nm_edac and imh_edac.
> 
> 
> The patch set is organized as follows:
> 
>   Patch 1-5: Refactor i10nm RRL code and move it into common helpers.
> 
>   Patch 6-7: Prepare ADXL sub-channel decoding and extend RRL handling for sub-channel granularity.
> 
>   Patch 8: Add RRL support for Diamond Rapids.

Applied for 7.2 merge window. Thanks.

-Tony
