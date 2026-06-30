Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012037.outbound.protection.outlook.com [40.107.200.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C23E44ED;
	Tue, 30 Jun 2026 14:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830923; cv=fail; b=K3AnTseqp2bdfQXNPtMtoILBYOUZobMJ6Yrl9mqMjRLLdCZeNP8FcVI05y6kIN0IeOTb04W8pTWjL6zJq9W57KBcdzHBfu4mv95iXn0vWfq48yDmVi3jVZESvOOedaMxoyBVJYqUuJdaudDA5GcvqOz/7uxbpHbAd6O1ex4mbFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830923; c=relaxed/simple;
	bh=CrttBaf4w3thomEXNB8v1xhALtPx1HOu2wc7lAHZLgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jwnr/iFDSW6jepfpyCtTQDeHiIZYMlhExJJwBK+zlWPQsLOZrejX4fGiIEaBdhIKlU2YicRjqHnftJc3TtGbavjDjhFDlAW4RsieAQHWhAHplMeLuLW3wvIXMldXesbj7RfFlGIg9NZNAvBOYN64+QKrh7J13Q+EG+Eiwu4ZKmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qVrXgIFC; arc=fail smtp.client-ip=40.107.200.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qVrXgIFC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPnSEnhECbF/ltcmjQ0aSNA3mw2yCKDXIMYxaxbp4Agt8nzOvUX0PpPn6TCVJB+hVSjbCf+QPQKaQJ5KfH2dlFSKmBWLVlbRvXFVV/ujQi2Cbn+NCeyTZV9qCKpcc1aN8moccxq98qqpBuTYJMyv+sKISbUH0mK8GS4siM9y964FAuFOlJwua6+fqp4fncld4Ya55mqcZnYPzT4I0u4cLuTBShlCc13zmvV0L3V/H4Z3/qmDx+eaDnjGJZVD2GMjV1BrTy5XqhslxsBGF6PvnQjftdJ29Vhdv2k2PAH2anQ1T0+CZmGMInLx3+O4Xos6eAg6nhnv2ADR54kVLDIFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIFWX4iW2MFYH85bc/8tXoHEwqIi/3FGwFZKExNAfXY=;
 b=ItWPnNeV3Cv+lZgrm1DH9q5qnbKwfz/XmX/XIzJn48YwSoDPDTIg5R68JzqfCUKP2BRmtwSJiprkjoIyV0ga458AEw6eaUro6/ymFd3TrNAdoyQocIhWNSR2OvqL6USWbQLvhwhlia+W/ZWcn1dxS+bZTA7UcApSTO8irC25TboWvjMSjzffqT+uJoDTgitONi6kRZ/fd/3/IoMLuC2YosLgffXmdUw058QaaOn7qzO0ikQ0ruSeb3gcHa3VOcp39NKQT/7f9u2BNMIFjl+dnvmMcbAUe9alzFWrmVPTRVDBy+T7JLD2Rz5EhDQ3Ro6DsmRNDM0vmoiKEbE+FEvbXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIFWX4iW2MFYH85bc/8tXoHEwqIi/3FGwFZKExNAfXY=;
 b=qVrXgIFC6k/SSEgBrzz9y4XgOv+/QVgOpvzJlJjh/UuIKYvm2tVKBqo+gG6TjCTQAPqXzW8RbCGpN8qRbkbkHaIXa/bHA8jM8cm4U1rAhmpgqHSHHu9UKxtHuJYxcY2wfzVHf7uwzXfVYBawUx6FOM7MItzefCwiYiGPnKKA+nw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Tue, 30 Jun 2026 14:48:37 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 14:48:36 +0000
Date: Tue, 30 Jun 2026 10:48:29 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v6 2/3] RAS/AMD/ATL: Translate UMC normalized address to
 DRAM address using PRM
Message-ID: <20260630144829.GA4322@yaz-khff2.amd.com>
References: <20260629150731.1009605-1-yazen.ghannam@amd.com>
 <20260629150731.1009605-3-yazen.ghannam@amd.com>
 <20260630053339.GEakNVM7XFpJobZQQ-@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630053339.GEakNVM7XFpJobZQQ-@fat_crate.local>
X-ClientProxiedBy: DM6PR07CA0116.namprd07.prod.outlook.com
 (2603:10b6:5:330::13) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS0PR12MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 478a7d54-65c1-4873-a8e8-08ded6b6aa5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	dEvor1LpTt1Hzxe6hTja126IvRwjIbRyKSFnVyb59ty5x5jYOdfkjccIHTbjASlXgukd3DVd+TOvBfIf2mI9j7zXjsQxWNbh78JPp8mbPW44MIVYGqAcA8LT5v/B5pe2HtUp3UmtX6G3/bJNz2TW7kMqJubl7U6EMVolHKrqvt8A/U3NsVY4XjH56fuPGAUFy6QGS1RPI6JgdwK13sgkrJFPkC2l6tIRT7DD6Q7YBPzIZCKDMEObCuBXa8BQtdB9SIJ9ceE4/JcdCEj27332EkR3anYPGEUJVixbS8c0cbf12fkfCR+liR/ENNXcRe+na45/msl7wxv29VZcFMvzM8okTKOgDXsrNdpe2E+h2byKmUCRKmm0QKnatShZKH8/tSSPhHW2aTeHoSTk01oM9qi81oMfTBy0loepfR3PYsDW+c0Ev6LYg3zfuaIssGB4NP+6cYuYlTKsL76tSQKRZ+mvWSgIUHxzduhPXlYSvwNymEkuMBr9oqRcfOtcx/6nW7ZbOvLjmzZoRCJ/9wrRjZkb4GbjC8pL9LwTfNt5wizvi+jRb79OQHRzHZV+CS1jb5CRjQmOhuOUtsBGaMNsWtdZ3IPGqvwdKroPCFzeSFXa4DgAnLVGWraChp4/cc23PODaCkm+naB8tkI2vqS7Ls0h96jTW9Zok5IKh9v9XcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P2LAE6NhP9YUz1FXRxwBt2IiJt/65Npn2+RdAA81ZGILOvp3r5tZsQyGYbJn?=
 =?us-ascii?Q?No8TIUZn4/qs6wBBUmFKfL94ogc9NCL0GRgXRThO2QwizYnhzAzowJCSgjpo?=
 =?us-ascii?Q?mpkX4qAZ/9GJv//Z13cDPR8icCGYu7YetOusBGn4uiJCFYfP5al7wTxfWYE2?=
 =?us-ascii?Q?FkQyxJsG+bwZQGbxOUYbwr1PPNlH/3XtFOMP6w1MmhtxmaGd91+3ljFA8G+Q?=
 =?us-ascii?Q?jU11O2rg6vZj4ldq9V1jWRZRlcE6mXMBVPY25Ba7F8/CnvHS1aByWiuKktnA?=
 =?us-ascii?Q?8mxN6df9WGYv+F7ko02qwfN2ubdq85/weLkYh8yQ2hK/Bm+b4nSkLnOZhtwn?=
 =?us-ascii?Q?6aacibIQY7UVJQx2FDxKZo1SGP7Z9/Y48Cj7HKl8UWqr5nFTT7/u9Aoy3KKo?=
 =?us-ascii?Q?tVjJuwqZ5c1dvqD9DRDzkkfy+isP3VhlCpkN29ZMulG6PZWyIxJ+MQ6HUpDl?=
 =?us-ascii?Q?8MHwuCnlb3d7aeN/kOkvhXdD6xc9H9XRft+zPRISqAj7oIIwQHoSSs+g8te0?=
 =?us-ascii?Q?DIlEH5y/gyhRg485iQ8O6Z1iAFybyt5YskFQBbEv4IlWpDkeQnSfhW7g7fCF?=
 =?us-ascii?Q?u6hNJgpNxV9/i3SztHPsrs1PeMjPyGItWtchV+qkFGT5gyXZ8ly4SVDgcF6C?=
 =?us-ascii?Q?aGN8l+Fb1KWDtnvwDsoqmPWj3yQbhd1jXA3lDBViZxUv6gkkvNATPLBwoGen?=
 =?us-ascii?Q?M9GXZ0LW+RWsaOCC7y8Oenorb2L386lLWwptiokZ+BzepHSRLTDqGQE2kF3f?=
 =?us-ascii?Q?RzRdm4fiQ4EeF1q7TFNONDzlHoGUbsgvgDVNrMZrIAf1UG67cI9pJLQlOdF8?=
 =?us-ascii?Q?ABtwXOwJXQdyXQThgBRea91hYWY8xY3tuHS+iq695/QaOM5J3JWlHyWn4i7O?=
 =?us-ascii?Q?KoRZFisQmVp1+VZ8q1xZWILzFPu5h+G6hHsCwWeBhWUX2xsm9kBsXtfdQtsd?=
 =?us-ascii?Q?pT8qV84/eFut59IHPyPtAiZd9Y6iY5Qx0D0h0kayzftzg2wPY/NhHvatJk5S?=
 =?us-ascii?Q?NND2mhbWLJym1IBA/gepq/CmzXG/zh5Yi7kErXHHvm84czl632wCvxztOb43?=
 =?us-ascii?Q?S89xozyl60vJfOlYPtmXIVT6RqopSsc2PIE2USww7M8MBmAxLmyGRhhDehSr?=
 =?us-ascii?Q?cS30lk67lsmsKr3GvCWkLavrAAIwuzOzcDF3K1JqbZYTSCepPy6OA8cASbSN?=
 =?us-ascii?Q?+MnkHasiRulfygDEeQaIYfG05oddyALNUs0Jw1l4o24ISgT+6gi1lm+qoyhC?=
 =?us-ascii?Q?kSHs6H1RpvqoKUo+fsEg5ROJXlob0kMIoINgyDcfkCPz8XxfdvxI4SmwY0C3?=
 =?us-ascii?Q?55+2e5Q7PWpeUHKRIdor2cGFIZON5Lha1R2sbS+4FAZCozm/rDYBjZoOcuYb?=
 =?us-ascii?Q?3Q1fBT3oFw1SxJex0d7KcPVTTKTNrsYUry1Gke+tB28Gi3+R57v1WsQwvPkq?=
 =?us-ascii?Q?gtm1f0w8k88rx/fepqWBe1TNzoiFc4G0RX9txr5oL7QNgBmqJ24FBA2taF/G?=
 =?us-ascii?Q?f0CQ/1CI4URuhAhrlxg8Vu2k1bQbY8ZQKl2CaBUeYb1OGILsNkbgLleqcGK8?=
 =?us-ascii?Q?dPQzndN1L5X5Ek9mbpXPzs53XzLSURSgK8QkndP43T7WZTqsiyysBOAR0QIW?=
 =?us-ascii?Q?MmJEHDLNxFwweHmDvXNHe+BqFjnHrhZB7BqDCgu7TaqW0/xD36WqCYFpJsM8?=
 =?us-ascii?Q?4oaP0pIIHRg8KLSvDnx7uwxyVbP3DMRKWCOXU4agPb0f7Rmq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478a7d54-65c1-4873-a8e8-08ded6b6aa5a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 14:48:36.6774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwkpFdYQWEntAQgzMHcxOAy8V3AKwiyuWRwrxUyfibwfMW5tIy3Mfiz5ATnZcVFHZBghjU3aVNoAZJzv00cVLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042

On Mon, Jun 29, 2026 at 10:33:39PM -0700, Borislav Petkov wrote:
> On Mon, Jun 29, 2026 at 11:07:30AM -0400, Yazen Ghannam wrote:
> > @@ -210,7 +210,8 @@ static int __init amd_atl_init(void)
> >  
> >  	/* Increment this module's recount so that it can't be easily unloaded. */
> >  	__module_get(THIS_MODULE);
> > -	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
> > +	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr,
> > +				 convert_umc_mca_addr_to_dram_addr);
> 
> This thing with passing in a function pointer from mce_amd was a hack back
> then. Now we're doing this here and we're passing in another pointer too.
> Yeah, let's rip it out and have users of the decoding library call the library
> directly.
> 
> Oh, and let's shorten those function names somewhat:
> amd_convert_umc_mca_addr_to_dram_addr is an unreadable mouthful.
> 
> Diff ontop:

Overall, looks good.

There are some minor formatting and build issues. I can send a v7 with
those fixed.

Thanks,
Yazen
