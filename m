Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315FA78F2F;
	Tue, 25 Aug 2026 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787674621; cv=none; b=crb0ZYavrA/1LgOFgFGSMq+fEKqEr1jxZgCJzUdfuu2a+PynTGzsuG5k6pA7AmJOCRgexeN/8VFLKDCx92GC+faOwoB377IRiblihdKcnnRyR1gUaaLHufhDs3PP8JdTSOq8ZqiPy9yubK0MLKVTLjTwmJ6Re7fnu+YRhClimCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787674621; c=relaxed/simple;
	bh=k4cg8z1cR9BjOuP1aCTM2YRV4GlI9Rf8Eny0nBFwcsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPuVuGH/pLZJdoBiMp0HJ/VFC6P5O75ArA18K+nW5yqNMe51WQC0b8m/+zQdh2J7jZBurF3Z/oFujsWZiC9CxTbolN5czvBGPpmoRQIOdRyoaLDr50t+2mkx22bbCTcMU6R05cvistbrVOrCC3+bWY9mjKQmhULFNGmfvCa6LP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=B0wUdmaD; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="B0wUdmaD"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C506740E01E1;
	Tue, 25 Aug 2026 16:16:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PQGr8VjqZKU7; Tue, 25 Aug 2026 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1787674603; bh=5rFU+y5k5qsb5d99TxHBZteSseuvVxWOP7iV0/srPjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0wUdmaDuE+y1RCRWeOIdSpLuSLngu4Tj2VFfhpDKoCkRljswkRxGPuKNwR6tQc9k
	 VDbfoLdwWlCdvF02wvFQA+WddNJPFJQWmNTwG4FbuhJj9X0toyDfnbktO3WAnOzB+h
	 Wtf7JPWvAw7k2QFMze0U9oav1qpvwlG6Hv8IFMw2CteFfT966IlFU7qwbG01mlVe6k
	 Aq92VSlseKmkU7xiIeAX3yy1HWvXBACrEGTeweNF2AwCahNeyZX0QqXzLzrwSoN9Kz
	 oSX/qmBoIXKMsQx1aFiGce8Lv52xyIYRpL9PdgUV8r4zPbqPp0uxUJJOH25Pnjylgj
	 /ew7iXiAb8tQBu4icDNIs2tbiF1V3wyX6sfWtKg+XmY7HXrE8i/U6YrSC9p4I2DoA/
	 iQiLsBbUhTHERZTcZVoYvmcEGFtWymOX1fH4UrQLCBIKbseBwZX9bMVUFqS8/jKrOB
	 q6DwqHzEW+wzrRsJIQAQGzh3O4FzEsN6hYr0Jyl5+XFpjyFjmK/7TFR6YFK3Lk43Gd
	 cphjFG5BzbeqnhsxPOdDJAehIA951Y/cqaI7Tk+YrrK1OAWi/Y2Jtour1it5DPzXUe
	 2rCrFKCfjNbBr/pvIQ0IThlCUxN/ELCSxzi8yfRvbrfyFcStwUhe6CAMKddkjM8hJy
	 jhFQNuOvctAD4CwHN4oXP8Rs=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 239B540E016E;
	Tue, 25 Aug 2026 16:16:28 +0000 (UTC)
Date: Tue, 25 Aug 2026 09:16:25 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
 <aoiBy3vg9eSvGhIu@agluck-desk3>
 <aowABmagul44ENde@gmail.com>
 <aoxxxmM-xIpyAE_Z@agluck-desk3>
 <aoynhOsTCcapwRbl@agluck-desk3>
 <ao2eT0TWS9EaA28N@gmail.com>
 <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Tue, Aug 25, 2026 at 03:27:55PM +0000, Luck, Tony wrote:
> > > I chatted with someone internally. They'd be very interested in being
> > > able to see these running counts via some /sys files.
> > >
> > > Perhaps your use case would be better for that too? Rather than:
> > >
> > > "Everything is fine"
> >
> > Sounds good, I will restructure v2 that way: export the running counts
> > first, and add the panic on top as a separate patch.
> >
> > The count is already kept per CPU and per bank in struct storm_bank, so
> > the natural fit is one read-only file per bank, next to the existing
> > bank<N> knobs:
> >
> >       /sys/devices/system/machinecheck/machinecheckX/ce_count<N>
> >
> > Is this the right approach?
> 
> Breno,
> 
> Yes, that looks like a natural place to expose the running counts.
> 
> I'd argue that the files should be read/write. My rationale is that corrected
> error counts may be increasing slowly over time for transient errors caused
> by particle strikes. If a system runs for many months, it might reach the
> threshold and trigger a panic. Allowing the system administrator to zero
> the counts would avoid this.

How are you going to handle this on a large fleet? Surely not log into every
box. IOW, if anything this should be automatic and not a sysfs knob.

Why isn't this whole effort part of the drivers/ras/cec.c thing where we can
do all kinds of configurable policy and so on and which is exactly for things
like shutting up banks and not overflowing dmesg and memory_failure-ing pages
and so on?

Why isn't the strategy here page offlining and shutting up the source of the
error instead of doing silly counting and not doing anything to contain the
errors in the first place?

Weird...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
