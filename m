Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8112133EAEC;
	Tue,  9 Jun 2026 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015183; cv=none; b=S5of/kYTXlqaFt9ArCL9ny4qNfb+kzsaXQKoldoO0hRT26teV0Zqt130h9eAFK6g3itWkLz5zP3+6brnU0wUeYN3uuypfQ7cjVOMCPxTVgW4/UvHviKFnr5DZ/jbMQMP3LblfVKqVVF11KPEd5r3P3SrKx0xy3YaAVpB6i7ab8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015183; c=relaxed/simple;
	bh=3wurHljCnW0W8RAQxtgGel2QNoX8AcpcDU92+d9z+GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsZe9Y8c5xowhseYFQ7pD97RvryUjnL+Usx0Vskvr256qBvzYr6sVUjdGs7F+xy3Dk5YXJW+EnDEkFlVJ2oqJElw9o+hSATIXndVvxe9jgKT/fuCCgxm0hDaCZcRaonoNDXIXlhTdFQa6ACDNisb1EcuhbHi6Pm0+oJQDUD++VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzDLbqGH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzDLbqGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781015182; x=1812551182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3wurHljCnW0W8RAQxtgGel2QNoX8AcpcDU92+d9z+GU=;
  b=nzDLbqGH6OyywLkFDBp1+ccMA+OwTUK4A7cNJVYimYLh0pwalg8cvQ49
   TuA+MHKYbGIaIZLFgtoyNdo8N8MWb+EMv5hqDTjml3ch3pb+RaVQoVMxp
   hi+mPBgkQldP+RTz1S0/z50CO8+CqUChKVc5wg82+V8wFPi9jHPgKumMC
   Y6e7p8+crHS+Lglan/+Xtfq4CjpksR8TnBOeGsOr04mOGXkdgqkcAHQlB
   uCUoZKwTBSABR/cZpM0JbTrOzynn6x7M/yFU/3cIdpv6Riz6D78aP6mHN
   lFgIeY0fEOvccFNixcrm74C78JF9t53SinxXtuBQ5txHMkxaarArzHJHG
   w==;
X-CSE-ConnectionGUID: Tgc3IeCyR8iqAdxUQZ3TXg==
X-CSE-MsgGUID: 7PxZxJMjSCCNpmS9lUCBCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84343581"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="84343581"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:26:22 -0700
X-CSE-ConnectionGUID: iSBqO5+nQP28HlxbZ2HoLA==
X-CSE-MsgGUID: Kc5GXJ6CQ8eu3ZaT821Q4A==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:26:19 -0700
Date: Tue, 9 Jun 2026 17:26:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Mark Gross <markgross@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Prabhjot Khurana <prabhjot.khurana@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update Mark Gross's email contact
Message-ID: <aigiiLMTcBY9bNys@ashevche-desk.local>
References: <20260526-arrogant-lime-ibis-3cf01c@meerkat>
 <20260526193238.3622176-2-ukleinek@kernel.org>
 <aifwwRbyH-lCxACQ@monoceros>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aifwwRbyH-lCxACQ@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 09, 2026 at 12:59:45PM +0200, Uwe Kleine-König wrote:
> On Tue, May 26, 2026 at 09:32:38PM +0200, Uwe Kleine-König wrote:
> > Mark's intel address doesn't exist any more, update the maintainer entry
> > that is still using it to his kernel.org address that is already used in
> > other entries.

...

> It would be great to get this patch in to reduce annoyance for patch
> senders.
> 
> @akpm: Can you maybe pick up this patch?

As far I can see this is crypto subsystem. Ask Herbert to take it.

> I didn't hear anything from Mark himself about this discussion, so an
> alternative is to go back to my v1[1] that removed Mark from
> MAINTAINERS?!

> [1] https://lore.kernel.org/all/20260526173806.3227828-2-ukleinek@kernel.org/

-- 
With Best Regards,
Andy Shevchenko


