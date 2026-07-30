Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22583D6CC6;
	Thu, 30 Jul 2026 21:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447211; cv=none; b=IwStY81YrgvTjEyBZQWlxZmpQtfAXF/F/rk3oh/cuNP5qomjVHiC6U6ZzwXweN9OIvZER+PFsPaTE1n1qU2HiIfYWVc0QP3F/ybRbjBEAeEGLenvbdcPArdU7N+ZzTudQVx4vC36bk2V5DscTzbMGLxxeLC6VBWEaxw7KL+aIqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447211; c=relaxed/simple;
	bh=WiUgjJXg5SAWRuRYEnWwoEDeaxYk8k4mRnaM3lUJdBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uppl6o7xjmntzOtqPjJiyOBJXLMX892VUaQnA4MMIQiKdk9ny+PL3dCRa4sxUyKfbtPkLKm9GVGxAAbqw2/XR/5PJAf7hwpVfpHO4M2Xuiu73q26bkjaGTvVef8FR1UdoR33dfsZMmVPTcjHa4kZykHyiaUgNBj/2X22q4V2RlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=c+dIN9Lb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="c+dIN9Lb"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BE4D040E00C4;
	Thu, 30 Jul 2026 21:33:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eK-dBx93nDYk; Thu, 30 Jul 2026 21:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785447192; bh=cxp6COfABE5+lpkLWusSMaYG2qjx4LnDxGxwiLN2olA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+dIN9LbcdMcWi0rA75rlw2kAkwxTJWg33gQ5/zLXEJTjhrCSasWcx41VbfSGVvjZ
	 nbZYkKrFnG6O3KMA28aQAc00XM4vpR643xXfmr75kHdB5X8FaS+lcoT1+39ijzlwP0
	 iuDhK9CEN+dC8NWMP8iXGogRyiyU5wPD+P/L+GtrEd1LE6Tx4048m96PzJDi1fX3lc
	 pHKfxE7LvxXmJ7SkoWXc5THXmrXEvnvmHep1jef4hI5IYxhd9RFuyfkVGqwBC+1GCb
	 /RtZCfQlhVDM5SVjEbmiHOIm7yuvw2pbdGrm+FbXdmnoOSeIIC8B3MIgTTfo6xs0jD
	 7NKm5/OK8F6EiEXuB3fiA9sLcoN4/AuMlX9lvpMxZEf7MrHC6nEJU/c1a+gzNZ0JUA
	 3E/g18U07gEmN07XOt9rIbKFprEBigosKxnrfBdojRdDUiLMKHAU7Rq2JIWz7devlZ
	 n1Ht4eUqYocmhgNiDmoqq0KMdI4yF/7O5+oH9kOOzcfFkND/GkXnU16X1Wcehqp9Fb
	 fGukZ+cq0IjOUClRT2/mZkBv5JyymmasgfZqyNSax5lmtxRwpU4A0OkwYxGHV1TEGt
	 f/ZlPM/bugTf0se2fzMojen8uILmI+kanjW34o3gOMJf8dsOvRElqqZP4eWfr8/ucx
	 IAIen+earqKIawIErB0qqwQs=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 79CE240E014C;
	Thu, 30 Jul 2026 21:33:06 +0000 (UTC)
Date: Thu, 30 Jul 2026 14:33:03 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@kernel.org>, Tony Luck <tony.luck@intel.com>,
	linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/dummy: Add a dummy EDAC driver
Message-ID: <20260730213303.GGamvDD03481245QAt@fat_crate.local>
References: <20260707215307.396571-1-bp@kernel.org>
 <20260730205545.GA2624247@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730205545.GA2624247@yaz-khff2.amd.com>

On Thu, Jul 30, 2026 at 04:55:45PM -0400, Yazen Ghannam wrote:
> There can be module parameters to describe the layers and their types.
> 
> Examples:
>  layer0=all
>  layer0=channel layer1=slot
>  layer0=slot layer1=channel layer2=chip_select
> 
> With this, we could test all the permutations of enumerating the EDAC
> sysfs interface.

Patches are welcome! :-)

But yes, the basic idea is to use this for testing the EDAC subsystem and in
a VM for drivers where I don't have access to the HW (and I don't want to have
access to... :-)).

> > +config EDAC_DUMMY
> > +	tristate "Dummy EDAC driver"
> > +	default n
> > +	help
> > +	  A dummy EDAC driver is useful for testing purposes in a VM when one
> > +	  doesn't have all the hardware needed to test aspects of the EDAC
> > +	  subsystem code.
> 
> This is verbatim the commit message.

Yes, sometimes one doesn't need to talk too much. :-)

> > +/*
> > + * Simulated "error syndrome". In real hardware drivers this would be
> > + * read out of a per-CPU system/MMIO register. Here userspace (via
> > + * debugfs) or nothing at all drives it, which is exactly the point:
> > + * the driver has no dependency on any physical error source.
> 
> This needs revision.

Revision?

> I find this approach helps clean up the first draft. And it seems easier
> to make minor adjustments as you go along.

Maybe.

Frankly, my experience currently is AI is getting more and more in the way.
I'm faster doing it myself instead of talking to a LLM. For review it is fine
I guess.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
