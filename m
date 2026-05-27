Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B6B3ADB9A;
	Wed, 27 May 2026 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898636; cv=fail; b=mPSM3da5D2RqGhHAstDQvp7W91cm1dy7z2c77LJU+7xaJXX+x+BZtr8GSud2vYpw95j4R4W44Zfp7/q3sFfjMWmMbkzkVwF/L+Tv5Kbj7muDAtWnWSIZ32aV7x1hMaTap96zltNSuArHcfJtxvvi1Kurw8izaq5gye57Ay5Qb6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898636; c=relaxed/simple;
	bh=phx278Gfj3E+NZFhIYrHdV1JFX2l/ThZHtF9MEvImV4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tdHGv2qmGL2LcM+gHNued09YyIECeAecH0/ssm+uDvmGtjcJ+VTO51q6RYL/BtOZ9NNYT8IYxbQska5Gtzjqk/L/2yLyh1JQx1KWdd/Iu7DiWFS94diyuPnMAxFyYlolANgUzAcj+wZWLnECXXngOLEqp+b66ZZ10Q8qJUJ7uXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wd3gQxvV; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wd3gQxvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779898634; x=1811434634;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=phx278Gfj3E+NZFhIYrHdV1JFX2l/ThZHtF9MEvImV4=;
  b=Wd3gQxvVUtAtCwm8Kfh994cMiVeCi35TrAwu4CRGxFyhfy3180s2uc9t
   RFhGdw3KrlEl4fgTpkrtIo9gJemufB+L8DDMQGYcItOLFjCVFVMdfo0qV
   r2n/4mbILFPna/Wzsuv2y3rVCVoZCrPdKxcYKjugHTylE7HRSpJanq1Cq
   YnSZPxahmYbVtE9ktOut6jtxxuZxFr7950+ABFRhKy+FUbKBDedj5lFNs
   drrGzxyFxGKbMl4f6z6yI/mMwkeqyc2rFV7q1/vdp7OpUlQxCvNy/hZLT
   e65LDGvUGPFEX8bYwOmyuA7IO8xd+Q8MdbHVykcgWK3ik0KX+Cu6R4sHW
   g==;
X-CSE-ConnectionGUID: nRuM+XiCRkaEueTntZF5QQ==
X-CSE-MsgGUID: MwcCJQjoR6GBVQAKBB53RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80461182"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80461182"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 09:17:14 -0700
X-CSE-ConnectionGUID: ZvKT4bs2R/q8q/IBHynzvA==
X-CSE-MsgGUID: whtUqob1SdCu6ybl7v/f6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="265896043"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 09:17:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 09:17:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 09:17:12 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 09:17:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hX06/XYDL+J9eaw+h6szFW2lGLVFXPTzO4TGDR2H+faNiL27A1cFZcRF5Tm71F2Vpp3t33JykXnqYttdIr03R9phQNxrzBBCppvrvX9+tEmi3LE2CSEJPLQyVqtxwoVWmyUtNA6U0vg149VAvcV3cRl86qPscbW5HVSfy0mxP+OrI05rie/9wdfMEqQlMAX5d6EnmQxn+h6jB3Cmwf2UnpQ5ZuFCk+67lOqk2jozrbJ+le9OoT20fg0EtmyDiY2w5DtM5klWLWrd9oiLnovlLjSKmwDTjtNcAmhYjEN0RgHUqAx7nsiEMFEdxiXE7nwI0EhJZc3RT8s3gL5mkYARTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ect175VDxTOQvdyxXqVpAW+BzVeQCSAMCCzo7cb7X6A=;
 b=LeleImv6JNsW30psnsHjzKLQs8kwl5QjXVc8UlV/hjG0ynXzQgmhuMwEotTMoG36p28KKtD+YF9ONqfgM6geEG7bq4wtBEpHc/OAnqzOuSepYMV/ZHZBTwAdSr0vDOkAlwkWuNGB6aAr+hHdNkTe6o/xjnmxMpr1hJKirQhLH8Ab1KiQTEEfF6IjBmV7iZDX5FJ2sRRty1fMvJOYK+OUovXIrVJ+lcimmIWpWlKFwgs6sMZQLBqq/j/x1rwqEwCRO683al7hRgcPPiHZMsKAV5RxH3lx+u3MWgxD+qOs9nzCl9UWmQBjTBwLKzL8DNZTZTwZ4EERT4khaBBcttMBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by BN9PR11MB5308.namprd11.prod.outlook.com (2603:10b6:408:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 16:17:05 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 16:17:03 +0000
Date: Wed, 27 May 2026 09:17:01 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
CC: Borislav Petkov <bp@alien8.de>, Jie Wang <jie.wang@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] EDAC: Add Intel Nova Lake-H SoC support
Message-ID: <ahcY_S57E06nRFR6@agluck-desk3>
References: <20260521123812.3961038-1-qiuxu.zhuo@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260521123812.3961038-1-qiuxu.zhuo@intel.com>
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|BN9PR11MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: fc169eb6-0bd4-4659-8ff3-08debc0b636d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JxrzzuWlNVfEzs2lNOusnZIxsB+InJgqIdbPT9agrqKyRQ5J/ymRydtmSHzrVm+IHkSDx/v4PbsfsrdNk7A3kKThw3s6SHMFnJHkUjNQZmrTFcc0TebdxCLsZvU5zw5tO/3NzeLkFE18E5BvNEX+U8BLvkWnxZDescPpTmfeuYjuZYRpIvLaId8CO5MZhCJEZnmVbTzVLtmUTYLUgxzvd96HuzMAXHbEfqiBwKV9gPFnUgDZKV+qoG58oWFhU09L5jJPOscO4XQt4Afez7gXQbpUN5XdeGxASDdG5cN7swxEfRxlSKXdEwZm7XLx8E5Ff+xbnoU+zy/1tXrfREPteZUnSG7+9xrsKPJR+TZNMhINkDUfESerHBK12qD9Wa7v9bUL44RnJ8nMp/aVIWfBrx0ltcwXANcO+K8pE7l8n2kngmZFE2tyZND3Pjc75eSxJ/V3h93/FhoxN8yXLVnn1dXqI9VfYMaclB4vkmPtsOvL+MDiK5ON3BiBFrhjnX4JVfZzwmu7GeyqxM7q+ahX+gVeYWiriTOANcmYGtfzJDWzMgoPf6qcPF0is54jsoD7NKrg5f1QmxDxtBZuPg3cTQeAP6/ZygPGZh8A0vzJQpQj/WYzGDTAMdmWthB2d1Ced9rzWJXsJ79cs/+STWquu2UTn2vJoHXdc1opt+CvO6wLLy9NuAnqnZQ7YWpd4f37
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M7Nr5NSEFEU8a9XxlrouvTyzFI+edUc00XXkx8i0UgnL8Y9AyhRsIFB+z3z6?=
 =?us-ascii?Q?Q55+/ShxBDa+HxHrEoLqT1qd2Qek8RO8NlAMp5iMs2AW+GpA9zGEl3Zk9H74?=
 =?us-ascii?Q?e6HUlWjCJ8sBIGpC82nW0nIMoUDw9ww1UMf4Dc+6cEOTTQuQgV1aKv2qu+qL?=
 =?us-ascii?Q?WkD/TYoC3wIrq9CcmLcx+i0c8MTH/8O9ckvQmAflipJOeTny2s0kJEMmZ2Xr?=
 =?us-ascii?Q?GDDuqs8Fn8g7qs4N3r+P5DkcsO/4DsEl0cRI1PEfzkyuI2Fdrwf3YVvjDi1Q?=
 =?us-ascii?Q?5wRUMXmC2lCN3qeN+nM56pE8YNf3EvsidaNrq0btOQEvnFkBReoRqMTWOZD8?=
 =?us-ascii?Q?iMqVtTeIWzQhQiUFr1vW84WZXHbb6C0dLSE/71qu2+s62aVH+bX0FrUX3HZn?=
 =?us-ascii?Q?BLoHj+PnJGwgjcaAQmxuH/wDnb1PUgoCnwhajdYnM6jmatbn6OMryIetVdRz?=
 =?us-ascii?Q?2s2dUgxej8ti/pjZlmWF7+Eqf9yThhn58yRK/Lh3ndI9mw8f9tB4+HqSF3CC?=
 =?us-ascii?Q?jdrgwmZCAy8MsmKWlBGyNzwGRErT7UXkVz6aYmk9iUEs+Swm+tpD/ftUKt7V?=
 =?us-ascii?Q?HR6LIEPCUE0UGRBlrDsDqbys0wzQGBVVSisGrRS6u64i9zCk8Y3K0T3i6rLa?=
 =?us-ascii?Q?4QaPcrQWFR+W0A62w+z2M/gj7kr4JB2HRg94Vvw5+5eLAZyfiGX9I3Vxqx0a?=
 =?us-ascii?Q?ogFULt2QO/2GdM055dq/y/V/ruhIqLTQUIJpqdVwto/evWWlKQ5QPemvwN3v?=
 =?us-ascii?Q?MFFcZdKJ1BVo2F6vHYjo6D8OQJx90VU0k4ZKoIJtZuFmLMlz3KfB+BLXM3t9?=
 =?us-ascii?Q?bEEjHcm0ilIqDXadnIzYlKepC1jXb4bWYU//y6wCHROL0zrHNiXy/Zv9WHJd?=
 =?us-ascii?Q?qV1z++KTwjQQbELGUgHFZaeS5gRn77uuA3IgcE5gP+yTNp7jjFQLht30JrNS?=
 =?us-ascii?Q?KYsu2tiTD/Ijzr/c/HgMVM/m+K/op/l40pS6MkhUBm9agvwOjP+Sn1kVTAZy?=
 =?us-ascii?Q?xS+KU08COUcIjBG5f2e1TVzyiZ7BuQeVzT1h0c+62ychrnoMVTPw30MK5y0V?=
 =?us-ascii?Q?0jL/SeEexpFpc+QiNsR8WXQzllkO+Es9RbcI2Cm3FkrAsV3WoWwb4+YXAQeB?=
 =?us-ascii?Q?GYle+xnME2BRDP/8Sbxh7KVRzoKRCUbnLlr1suWK+JNrzkbJNEyXwHMHmyfl?=
 =?us-ascii?Q?3hFkiQskvR9rFy0tdN7HRX8+l1n0mTFhNbnrf0uTR0IROw63yD/0G/nLg5Qt?=
 =?us-ascii?Q?CV9UOiY1psWM933aN/Agewb65kxBWImzNQeRNTR1KHSLNy9iABPhAq6yz+Yt?=
 =?us-ascii?Q?8IPypc0uFuCU+Hi3RJ3lr3dJj3YYzLcKbeEhyLlpizMSF6lu0K7MB0w85XmL?=
 =?us-ascii?Q?QnAHkpQx9PPzbioADaqbSuHVpSg/gsSs3UiBkdgXK3VNHqP3jo/vkHiB014S?=
 =?us-ascii?Q?gde20Jl2DP0dL+RQtua0egq7pVAi9WI5TDj68DLNv2TlqkJvEwpDZUtg0oXE?=
 =?us-ascii?Q?qupRBUv2imo9ltb+VzinNJtRDzBRa+NdlNFZkuPrdbD0QkDLHcM+QDUaaHxV?=
 =?us-ascii?Q?XedinLgEpLAs/0X3RforaQxWfWhFezBhhyhh2LuU+y6akbL9oZSGd2q9ANR9?=
 =?us-ascii?Q?V4or2oNbhv3ryALkRFzR7n+zdaa/VJHFwbg2rUK7E30JSrViYxGizoE3H9xP?=
 =?us-ascii?Q?z66lAWxPKscSB8VdZJZ9UfKG8dpUUVO9UfhAIRjnCCUobh1JRDmFzRFwv6u8?=
 =?us-ascii?Q?aOCYq37RhQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: HTHaAGB1xd+MsQeg1pPBFIqGnT6Gy/p7M1mwop10d5WOzRE0d+NJKMCvIXYUIpx29Evi2/MQSSu2EwqRnsvQpWwdiuyqR01F6F4aQUHhcH8SRtR03dK19SGdyaa5EVpZwY356zvk9iO38B9iwm0Ed6aI8+uMchBWD7VhUu5urqQ3HBxX4NSi41mOT32QQhWDKYUtZ00bf7J6boI6TrYvi2Awe6cGNf9f/YPn/OKQ1/MQRm2mcApoOhYC9j+h8zHQQmF/Fmo+xh/ATxpE8cYIedNpv1X2dFZPACk889/VyaR4eWBkMjoFYMEHNZSh/8OevGQMPBKG7ttHNgpvz+epSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc169eb6-0bd4-4659-8ff3-08debc0b636d
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 16:17:03.3857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZNkzMJHXnvAzc+I6mo0Pen6Kl+dy5taCfJQw2bvLcUKTzKAMSJLIWbiLxAvyZkWikyXCNsvcDimUKddEP/XmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5308
X-OriginatorOrg: intel.com

On Thu, May 21, 2026 at 08:38:10PM +0800, Qiuxu Zhuo wrote:
> Intel Nova Lake-H uses different IBECC detection registers than
> existing igen6 platforms. Make register detection configurable to
> handle platform differences cleanly, then add Nova Lake-H support.
> 
> The patch set consists of:
> 
>   Patch 1: Make the IBECC detection register configurable.
> 
>   Patch 2: Add Intel Nova Lake-H SoC support.
> 

Applied for 7.2 merge window. Thanks.

-Tony
