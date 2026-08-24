Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DC52931F5;
	Mon, 24 Aug 2026 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602841; cv=fail; b=oDa7o5WlXGNFSyrBY4cMtSpnSHFvOw3Zq78dXJijeiF7gnEPgDR6IIosgcs1YFxBCfwg21ANDLHztq/UvZh1xFy4ZnXRFHf28k+MPjoxNLpU6NUwKhqppQ8Ne1o7EVlv5UF6rzEQ8yLWBVODiSD9VuzH94hx5Pb81GGBqCjCddU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602841; c=relaxed/simple;
	bh=zSZxcw+0D1P0S8ia4zLr1Y9p27JNmHhW9ZQAH7og8vY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aFL+8ayU7PwE4+pQ9KfVTb68zJbmy7vBO7AQwD1GTlfoFseeXTF/e2Yq4XJeFkUYo0FAVN08nvXOfuSbIo3Fq7zlz8LMvd0mrkRwfuqJBElBq92oclyOL2VzA2dRdFZQnq2018RoK/Z9zH5tbWYG86XF7R/7LXkT/luNFmS34u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYyhHeXV; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYyhHeXV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787602839; x=1819138839;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zSZxcw+0D1P0S8ia4zLr1Y9p27JNmHhW9ZQAH7og8vY=;
  b=PYyhHeXVI9se7DX/COVAPxEJ/qTWwdwEN7kDMHlL4zQb5J68bzK8H2lt
   NDG1Qr0W2jAe32f5FGCv8G/Ix5CmqYjmatmDWDLhqj8UkNRxBYEkj7ZPc
   X9t6HFZ4dSiHvY0YKN/RMI+FH4uSDvOQC6/8VKxmQ73g5rMQJEKVBwgT5
   qmpk3ApzFPSWLMNjyCEfQ5e74HvvbF7Fcg4hhlWV82TPBL/NLL6Cs9EoT
   +d3UoB3jh1naNEC4QomJqhxsqcFIagr3Q4MZlhiliroJwTj04rzQRkXKc
   25wV8/1I2ZPAwSMJttsIIcmHBd1B/hcRFzKw5222IJHrN/ywjFddJxqMi
   A==;
X-CSE-ConnectionGUID: sLuHEtLgSEiMoDHGrwpR+Q==
X-CSE-MsgGUID: ARPqGxniTsqMRqE+te7hhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="90579568"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="90579568"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 13:20:38 -0700
X-CSE-ConnectionGUID: wT2TXOEVTg+6VFjz3AgCBA==
X-CSE-MsgGUID: Rm4brvLwT5KbV5FccV6z7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="262794008"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 13:20:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 13:20:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 13:20:37 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 13:20:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsfkAnUV5OzV1KFL/CePCu9qMdaCVOud73y+0j93zbNQwTp9VtO/3SJ5rj6IjUUjTIbqSj8VUgZf/fPC9gozT7PWpqD0Bn6HajTrxlWyfdj/hj1jokmogT5/iTbqS18/ihs1ZTGY0jultyHCL0+zGNnXwoFruIU/sXN3TsE3mY/Ua5/OdKPejoo/GU8GZiQsRwiIFHO9bcIWlhme4qVSm1LpLlQ4CbB5wiavoiQymsCUug1Ghw8mtdzIqRigQ+gGacPUj7SAu1JFMkeR24PURNuo/rQ8xbypt5Pt9KaPe5F93nnLE1eQolwzny0WwDlBlzTMDoEdHoD+d10tk34hTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UnVN0hzbgkICAx+4YV3XqSRmrD/FAm7wRasRhxyfek=;
 b=FBt/3D/3KwL4Ucx3fZfh8/WwvNzLB9YaXh7tRruvRSOLygjYCQwnZc6s/sfBqtMJnGwVQXJleQPgBt4RvD6z4DNnrNU67KQvmL3a5AD8I1+svXc8np0PQatgBmXh0uPYC6r9v6lm/G29u1jdqPrklNr4adgz6+Ddiuxww5u2p8L5nXLQO4K4ljuaw5kgtAn2AlJMD44ROKy3lOQ7Ob6dGrUBbGkp2r21vQagW7MjD2lFWHRMvoWTYff9qA4yNWx86VUbVanUYx8KXMwNVYk6thecvO1104EmDhW22rKQs7yaMkTkf/2hkNcK2m5GAy5R5NjuGX4hJXdSBCrANJRv9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:20:22 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:20:22 +0000
Date: Mon, 24 Aug 2026 13:20:20 -0700
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
Message-ID: <aoynhOsTCcapwRbl@agluck-desk3>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
 <aoiBy3vg9eSvGhIu@agluck-desk3>
 <aowABmagul44ENde@gmail.com>
 <aoxxxmM-xIpyAE_Z@agluck-desk3>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aoxxxmM-xIpyAE_Z@agluck-desk3>
X-ClientProxiedBy: SJ0PR05CA0156.namprd05.prod.outlook.com
 (2603:10b6:a03:339::11) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8ad605-c3f5-413a-8f8e-08df021d1fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10067099003|3023799007|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: FzpeizQvu+p8AYb6LGITJJXEaYJIdbsN2Q8jcVfoqsAqVr0q9WWGcQi04+wtcpCoTO8tkB44pwgZ4CyntvG3YZshFgN9SGaBYBcomVoFONtYbB7QhjiJn1vQE4U4kkovAhy4R0rIYBOf9NUmPBzViZu6dSKs2CGjQzngqE4kvVX6mpaWR+STpp1euj/TecYc21NVN/tEWjRA+Ctf/ah2m0o9UqRheO3O8Bu0QhYvRWFpDB/jSDa5FRzaz/zd2AN09TjdTsKoymiQ7AvCgaMJnpWjCJCcGsu4SLwRdSdQzUx6A5XcwAfc2rXtMgdkwQDebhZGG6/qfYNdGDGa+Pns4NttwkpTo9lV9i2f8Fr12/tHBVCaOP3XbEbRolct4SDAxf7UsTswXpVapfJet6qdXDRs4QJXFmVoraPVdZzfDKrvBjVJeEfj5yWyG1NSB66EPhNSecfzn1SWHO5T9LWs0uEHMg4x8AykMN3hVZPEoo+9KKV2f64yiKHZ0dzJ0APv7WHf9blxtK9197zB37cK57M5oSLpfgwHMBUPlAi1dsPItSN2UcTvRatgHe4AoVDQPjooGCPSwUcdKp58KcbH4LO0KrbXqUfpT92YBz2AFo9RmTxy5WCYKhhS83iwuzOueikoavVfdgd5VECmEvJTzPOcudAxubvAaVtWQkgt7iU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZlRUMKnF+eGiTnhWNCAT1OQYxqjrX9Bmcx6Vyl8hrZMc/PMyBXUsJIdnjzvp?=
 =?us-ascii?Q?vx+BJNOPaFm7wddyQ1Ew0V7SRS5JCyZgQjatjpPe9ATcLhVEd6/nzjOgV5k5?=
 =?us-ascii?Q?dTyZokuGz46B/gMT13+6t6fHjPBq0teeuvPMsnpgxGpuvGlQPWhqJOCnqiSw?=
 =?us-ascii?Q?hq0dpXgEegt0kDCR/JD8hBFJ7K70DhwbhUeiSznyvE8UnbpOLBhd66z0i+2x?=
 =?us-ascii?Q?w8j11JyztGKM/5kfxQMcBPeNkfV6KW5TJoYrNxX/365R5ftCBxVxuEtjJ5N+?=
 =?us-ascii?Q?xDXyhVyT4X/tB1hPKChU7dS7gQHMgArfDU/9ZXCfvDHNvKR1Px/NxO07zAT0?=
 =?us-ascii?Q?m3/Z6j/3RRBiYx7gR19V2g2T2if1TcM7QMcoQsXFxeh3MZc8WyPPnoo+PK5S?=
 =?us-ascii?Q?ZbcBGJ+3DQy4OTDWrU0A5Anb8/35nNQplMC8FL8lHZIZJoSacZ0DkpMDAVk0?=
 =?us-ascii?Q?QOOgh42xOqj5yDpr+E4ZV20KmxYz466MBhtngmvEiqzXA04uu0a/bqc7ku9+?=
 =?us-ascii?Q?MqBSXoZG9v7bh0Yef3LUvnlA1whBHrmms1HsfIllDKsbek2fpvS3UVmY6VAo?=
 =?us-ascii?Q?e2NQPaGk+9frhio4NYL/1fcLE3cHUQelSIkczWUnKrtTCCZV6mLYEnwip7bh?=
 =?us-ascii?Q?V+OWrM8IBcPTK1+W0pMqgu+RnrWhbV2SxlQkcqL6Ke/ro7Q1qTsvFIqbZkMk?=
 =?us-ascii?Q?5gkRg3zr8bKm3tJN5B8HSdaFm8ceg6Pb657x1tYjnsKjCyYSgaHuRX11ow99?=
 =?us-ascii?Q?N2so9KEhzJR3Sf6zbY7lQsDhjm2cRIfX+dNsU4d/h7xQjRYnm0llEDzYBdon?=
 =?us-ascii?Q?gtWVTeXS6PVyZpQK/f0HOyqoIRVdLLgi0ioA3N4fkZWMrmT9DeNBSgnFreKO?=
 =?us-ascii?Q?dOBXjSER7vO+mpoXoVELt8q2RfTpW0uz/ws/SYJH48EdFjECwmyEEmQ0TR+D?=
 =?us-ascii?Q?p4BA89xR6GWhS4pWb4E3rZ4C6ieNVIhPrP/YCw9vny5XlS0j6h3RGch8SA+m?=
 =?us-ascii?Q?pqZmMeNUHidWCtmMX3b3ZE27d4A9sRaA8p4z3IOm1MlyTMYUX2R9aoBjoYn/?=
 =?us-ascii?Q?emPH4y9LBh4Q3SY/LWV2JPBs2hnnyssMg6d2dgZKRmeXGiaZ/z1xnUcxhoVA?=
 =?us-ascii?Q?2PI7anNi6vtrfNIRnAgNcKwP6ic1Mo8p63xhQ9ly5kE8OeFv2tTx4THSYzBk?=
 =?us-ascii?Q?TEqGpigDuesI0XNTBkdb1kcThv5dQUzntkSq+l89lKnUdKVYTiQ1nxiKzsPO?=
 =?us-ascii?Q?VOlrFvwXGBmps6030EO7UIvAWpua1IVyMRRKtpSXXTeAJ4SYSz8/oUQWe6N9?=
 =?us-ascii?Q?3IRyQxaf+/+lAkARRqN6Epc2XXYe3FwmUExQYb37lNYW68DGyMIWA3p+SMxM?=
 =?us-ascii?Q?FwFQLDBtuwgJcduZ40bEFdXgxUCJW0uBEGHe/QO5XhPqLf9audW7XwngFSaa?=
 =?us-ascii?Q?JuX8+Cqxzog01LnvdIH1JCOUW7/FVXVgviB8tBF62KA2O6lEBirv5jkUzbdp?=
 =?us-ascii?Q?VfozV/xOx2eYt0wWVWYM+DbD39F4r9i7lNi051dMrgzzDidxa6u93z+0/hSy?=
 =?us-ascii?Q?hotogWKZ/y2Q52RYN81QudMozzoTPXVhQCgtey3gGwf6VGBUUvJpX7NXwtNC?=
 =?us-ascii?Q?32pALd7vJ0rygUWcb3k7Ycdu8vsniBCXkSTVJyblpg3ZJNcGHiqt0XSCLvGE?=
 =?us-ascii?Q?wkTc1nCuto8pS04TqTX/OqG4km0sRgTVsozxD3d+lOPYx/DzkRaFtCQHfK6L?=
 =?us-ascii?Q?m5xoKxO5rw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 0Nm7YbMFms4Ng9flskp0A/yj/hi7a7EenDgTm79GG2+cmo/XpPhzFDgifSO+in/fG7nE0Z4+BbhiQmyqhchzmcBNXFEBsfJndQd8/EpetNbV5Kq/qadGkSGZQ45Nb3LJg/l3v06/SB0GH/DrXUOMxe35Wg2ET4/02xjqqH0UfBc1wO/+Quc5i5A1dSzpnyV7p8gigEPm+2+SlwjmRFDgLVRwWF+L9atOv/rsFFui0i5WyN8g8u/v2zRF2jZ875/YlDnDdrGiziEYR+mj5qwVYLNjdolXye+h0FdeO8hbTATHBdCctXy7PWmmqSie62xXCXmwUphIjT41ac84UCVjOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8ad605-c3f5-413a-8f8e-08df021d1fde
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 20:20:22.3058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIqlTbPAp3nCz1+Z2M/iBt6HHqY0D6shOftkul9anpAGu7CFYA7ImnksMWZ5ycAPo1k1Qhn/EzInV+9fMG9iKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
X-OriginatorOrg: intel.com

On Mon, Aug 24, 2026 at 09:31:02AM -0700, Luck, Tony wrote:
> On Mon, Aug 24, 2026 at 01:29:18AM -0700, Breno Leitao wrote:
> > On Fri, Aug 21, 2026 at 09:50:19AM -0700, Luck, Tony wrote:
> > 
> > > > Count corrected errors per bank and add mce=panic_on_ce_count=<count>
> > > > and panic the host if we have more events than set.
> > > 
> > > FYI. I don't think this needs to be fixed, but you should be aware and
> > > perhaps document the shared bank details.
> > > 
> > > This won't count accurately for banks that are shared by multiple logical
> > > CPUs (you've inherited this from the storm detection code that introduces
> > > this problem).
> > > 
> > > E.g. a machine check bank reporting L2 errors is shared by both logical CPUs
> > > on a core on P-core systems, and by all cores on a module on E-core systems.
> > 
> > Good point, thanks. I had not thought about the shared bank case.
> > 
> > I will document it in v2, roughly like this under panic_on_ce_count=
> > in kernel-parameters.txt:
> > 
> >         The count is kept per CPU and per bank. A bank shared by
> >         several logical CPUs -- an L2 bank is shared by the SMT
> > 	siblings, for instance -- has its errors split across those
> > 	CPUs.
> > 
> > plus a line in the changelog noting that the count inherits the
> > <per-CPU,per-bank> granularity of the storm tracking. Thus, there may be
> > more errors logged than you expect before your panic fires. Would it be better?
> 
> Yes. Documentation like this in the commit, and under Documentation/*
> gives fair notice to users.
> 
> > One question while I am here: is the approach itself something you are
> > willing to take, or, just a just send patch [1/2]?
> 
> Boris is the maintainer here. So he has the final decision. My
> opinion is that this is a bit niche for the kernel. Maybe this
> could be handled by some user agent (mcelog? rasdaemon?) to
> raise awareness to system operators about high rates of corrected
> errors.

I chatted with someone internally. They'd be very interested in being
able to see these running counts via some /sys files.

Perhaps your use case would be better for that too? Rather than:

"Everything is fine"
...
"Everything is fine"
...
"Everything is fine"
...
"Everything is fine"
...
"Count exceeded, PANIC!"

> > Thanks for the review,
> > --breno
> 
> -Tony

-Tony
> 
