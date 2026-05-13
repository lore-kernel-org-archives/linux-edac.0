Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205F4221DB6;
	Wed, 13 May 2026 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704211; cv=none; b=bxPRa1UKP0wGkIHw8Qw2KWzCklMDZ3WL7QHu1Sv3xrnTAIi00xBZtryErVG8svBgpIW/GnvDiJx79YLLq5p7kQ6mUWfn2glk0mqdOUCKwSgSwuEZUDiYqPnLfg5L/d7Vt+F/sWCuQQZE2/jl6a2K0GssEwCVWt3Pkq97nOuT5qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704211; c=relaxed/simple;
	bh=/+3qc8C5wE5m6hPQBjdT+tsV8QwxD4cEdmbOw6AHdfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYa3KHa4eb4DYCfLv+DpT3Knvw+qe9egqM1ZPUdgUEpG4EK294JRaRmXwW6hoSEGtEfz1E4jPTb83mK+a4b+7UA0zPPyyGzD7YdLRP+UaJChnT4/nlpIn5cTxIGt+6cOjN/u3s4AcG5DQsb0PJHVzKZa4XHfjTT7nqQZHyuFTYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UnclWqBH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnclWqBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778704211; x=1810240211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/+3qc8C5wE5m6hPQBjdT+tsV8QwxD4cEdmbOw6AHdfk=;
  b=UnclWqBHLYkD4ahRrbUTr/J26tiph54voBbGTNBNL8KFR1e1NlsjZk9H
   JYCrtgPXjuKaLopU8TnO6PUhDjP72elk9AilqVdhg3uN8dnsMy6gGFDG8
   2RUsUDv0O9cNhgUWSrKKYyBnOGg/blEBGPxV+H/6eZTTqa3vbE/8QT+7r
   IkAe0Dy8H8zTmxhKF10gaqeHIGUvbd0nqPwGxFemmypaQzg5K4OstJZMv
   XMfGaXr3lOAWzfH4lmeECMw4WpxdSp7kh3NXHOqtmw+SrIWB8U6jO6J0N
   5pAxOo1BwaNqFi9bPOCkQNn0gtP1qLmTMOOpARo8YfcaWLg4J89IE3nhV
   g==;
X-CSE-ConnectionGUID: Jq3ninTISeuFnYOYStbcmQ==
X-CSE-MsgGUID: Yu3F72F3RTCCm+xzK0eSEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79539058"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79539058"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:30:10 -0700
X-CSE-ConnectionGUID: x8QmUy5hSwOIFSSScpVVyQ==
X-CSE-MsgGUID: niXcfO4gRLyuC0Ov3PKXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238425859"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:30:07 -0700
Date: Wed, 13 May 2026 23:30:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v1 1/1] RAS/AMD/ATL: Drop malformed default N from Kconfig
Message-ID: <agTfTRce0SmyO_OF@ashevche-desk.local>
References: <20260513162253.365343-1-andriy.shevchenko@linux.intel.com>
 <20260513162744.GEagSmgKV9ceTtO162@fat_crate.local>
 <agSnXBBS_ur1YEYQ@ashevche-desk.local>
 <20260513170240.GHagSusHdkGcYLS8v1@fat_crate.local>
 <agSytQOxVcETeImj@ashevche-desk.local>
 <20260513180420.GKagS9JIx2amgiJEKW@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513180420.GKagS9JIx2amgiJEKW@fat_crate.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, May 13, 2026 at 08:04:20PM +0200, Borislav Petkov wrote:
> On Wed, May 13, 2026 at 08:19:49PM +0300, Andy Shevchenko wrote:
> > Yeah, but here is the bug report now for dangling Kconfig symbols
> > https://bugzilla.kernel.org/show_bug.cgi?id=216748
> > this patch addresses one of the complains the bug report has.
> 
> But N is not dangling - AFAICT, it is a non-existant Kconfig symbol.

> So the N in "default N" is evaluated as another Kconfig symbol and not as the
> "no" it should be.
> 
> So can we explain *that* in the commit message in a simple, understandable
> language?

Sure.


-- 
With Best Regards,
Andy Shevchenko


