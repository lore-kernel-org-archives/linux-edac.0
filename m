Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B3212548;
	Wed, 13 May 2026 17:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692795; cv=none; b=VEvPXqng36oiH3PXXfv3DlEWTMHLffjDX2KO9EzPZC0KmSxVF6JGX3u4jw4uRKW/XLi9Laj4HifNMXS24HgreLp6FH8mi4G41DUFWFK1rzdmC+f9t+xMacE5JXTX4P6RMtbrEl7T1w/kMMfqhbYlD5Kc/1qRbFE2CtWoy5J4X5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692795; c=relaxed/simple;
	bh=AqprdTrNdggpOLWVxQsoRsSzBK8qCJyIC7Ep6FvVoiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQyplsIprNauemP19n5SMQr2giJQInBQsMoa0NU1zdiVqlXhy+jNJQUtmEx3/uk+xghEh+Sz5y8Bx0FzjRfYHS2J6ISeO9QZsnZt2TdqdHWusl+EPpWkSSyIoQX48HP68ZL/0Vk87Pb5KieegEjaCm17rLdT+nd4ZXBttAMy6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIxuN6Dg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIxuN6Dg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778692794; x=1810228794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AqprdTrNdggpOLWVxQsoRsSzBK8qCJyIC7Ep6FvVoiE=;
  b=bIxuN6DgXYSMnoWTdS1vZlxiX9yWjBUnaAN6CcM/fDtBcq/eKrBgKgcR
   UfniMiZIvXskZoSiq1hFBCLxmp1i5B5zyd+NYNBhK0pMvvNe9gz3pzq7C
   gjxWivrvc7JQafhWgc+EAqK/4RVeU2i//wURY4M/CNt+CwoPibJtEr+Xj
   3749KMycp5Y1+GVe/WgbPRg7ybya7szpC6efzW0ks8iJN40aJGx9mWLme
   CAoR0uVbN5PRU3Cz9eH6AeAlNdNiYLbgMsN6bZTpa8IaaqNiGZrHzhBSi
   +fzRU8/1ozfht5j3b4J2qvAyUdeFDDHQ7ZopZa6+jOP878U7rnCBdBW1R
   g==;
X-CSE-ConnectionGUID: ijGw39XEReiU0lP5gzruCA==
X-CSE-MsgGUID: kPCibuB/Taa3vcoUVcDDBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83240317"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="83240317"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:19:53 -0700
X-CSE-ConnectionGUID: EaQvq9bmTzef6RncTA2dTw==
X-CSE-MsgGUID: XzVyWAVAT763QgtAA8t4zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="233875043"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:19:51 -0700
Date: Wed, 13 May 2026 20:19:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v1 1/1] RAS/AMD/ATL: Drop malformed default N from Kconfig
Message-ID: <agSytQOxVcETeImj@ashevche-desk.local>
References: <20260513162253.365343-1-andriy.shevchenko@linux.intel.com>
 <20260513162744.GEagSmgKV9ceTtO162@fat_crate.local>
 <agSnXBBS_ur1YEYQ@ashevche-desk.local>
 <20260513170240.GHagSusHdkGcYLS8v1@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513170240.GHagSusHdkGcYLS8v1@fat_crate.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, May 13, 2026 at 07:02:40PM +0200, Borislav Petkov wrote:
> On Wed, May 13, 2026 at 07:31:24PM +0300, Andy Shevchenko wrote:
> > On Wed, May 13, 2026 at 06:27:44PM +0200, Borislav Petkov wrote:
> > > On Wed, May 13, 2026 at 06:22:53PM +0200, Andy Shevchenko wrote:
> > > > First of all, it has to be 'default n' (small letter n), otherwise
> > > > it looks for CONFIG_N which is absent and in case of appearance
> > 
> > > Who does look for CONFIG_N?
> > 
> > Hmm... I need to rephrase that. Any suggestion how to refer to the Kconfig
> > symbol in a clearer way?
> 
> So I tried searching for CONFIG_N in "make menuconfig" and it gave me many
> results, but with or without your patch I didn't see a difference.

And it has to be no difference (with all my hopes we do *not* have 'config N').

> Just point to the "default" grammar definition - I see
> 
>     config NEW_NAME
>         bool "New option name"
>         default OLD_NAME
> 
> in Documentation/kbuild/kconfig-language.rst which says that default <symbols
> in caps> refers to a symbol but the grammar should be properly documented
> somewhere too (can't find it now...).

Yeah, but here is the bug report now for dangling Kconfig symbols
https://bugzilla.kernel.org/show_bug.cgi?id=216748
this patch addresses one of the complains the bug report has.

-- 
With Best Regards,
Andy Shevchenko


