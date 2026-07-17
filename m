Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0026A3EC685;
	Fri, 17 Jul 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283910; cv=none; b=iqymMOR/NHBR7P3FjFJ/rvaYR1f8etonWaxT/3MRncHLm7X4+ptKkBv7PGTdDLNjQDM66er++3yyQLDoT6pcqH2m5Reo9wnalzKepthQO4YcMJSANVQYXWpqenPPCETgdOetaqnxX+dg/YUli708sr7flCaWl/1GGONTzDQUQ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283910; c=relaxed/simple;
	bh=5jmHf1oAFhGA/GSzCrYYeB0www3+D8cCOsUZlZ1KI/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AH9LCRZZlw83GPZhPybOthyHnq0sZGRf3kOhpZN3k604V3FNQwKx0+z0I1LdjqSuE1QXSOwT4phjxlK+cNs80uzoRLrBGNdlpK9MjyFwL5wlL/cLIvXP/HjU7OdTi65Y9GjgXF7DZ1YcOzaPYt3v+MvRtyi8yxpAVhi5X9PgLIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AamEgMq/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AamEgMq/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414F01F000E9;
	Fri, 17 Jul 2026 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784283906;
	bh=TpvL6LYuhnoQ+20bn/xHgI5jtosiQrtLz0BItQ+KAIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AamEgMq/10SfmMRWqtVz/NxAgXSJ1N2w+3K+ZT1JvuzZlIGOTiVN8IRSELt5K7Y2O
	 IH6t94qsosrA9BqEezQ3OsEzTZwuQY4eDP7/x13F+maFuRA72WAvGyJRgkIDQfW/LN
	 9WGovdw96TNGorT9uhEgtOwY2KPfowQCXX9Z7naEotbrxEjxQfn9eTXqgGQ9zvtkZ2
	 RWdRpAX4p3t+H+Cujelg1uIX99wKahP4pyjD7p1HGmA27z9qfllJ/t3ZgdxerJDMCT
	 kkva0/5YIprWUeT2oTb/dCS+UQGaIwQNemlPJI4+Pf4s6PFWlwQnPxL64nAILwlVrE
	 D5SV0+fKSIhJQ==
Date: Fri, 17 Jul 2026 12:25:01 +0200
From: Ingo Molnar <mingo@kernel.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] x86/mce: Fix build warning after MSR-interface switch
Message-ID: <aloC_RPlSLcRz_36@gmail.com>
References: <20260629060526.3638272-9-jgross@suse.com>
 <20260703105555.1758819-1-jgross@suse.com>
 <aln1vdH7dPKmh0kl@gmail.com>
 <b0705c60-1eb7-440d-91fe-ad329bbe407e@suse.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0705c60-1eb7-440d-91fe-ad329bbe407e@suse.com>


* Jürgen Groß <jgross@suse.com> wrote:

> On 17.07.26 11:28, Ingo Molnar wrote:
> > 
> > * Juergen Gross <jgross@suse.com> wrote:
> > 
> > > The recent switch to 64-bit MSR interfaces introduced a build warning.
> > > 
> > > Fix it.
> > > 
> > > Fixes: cff219368bd0 ("x86/mce: Stop using 32-bit MSR interfaces")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202607031726.ZOwu4snu-lkp@intel.com/
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > > Said patch is in tip only right now, so this patch could either be added
> > > on top or be folded into the original patch.
> > > ---
> > >   arch/x86/kernel/cpu/mce/p5.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/x86/kernel/cpu/mce/p5.c b/arch/x86/kernel/cpu/mce/p5.c
> > > index eb99f384d747..3c2b6cc918b1 100644
> > > --- a/arch/x86/kernel/cpu/mce/p5.c
> > > +++ b/arch/x86/kernel/cpu/mce/p5.c
> > > @@ -44,7 +44,7 @@ noinstr void pentium_machine_check(struct pt_regs *regs)
> > >   /* Set up machine check reporting for processors with Intel style MCE: */
> > >   void intel_p5_mcheck_init(struct cpuinfo_x86 *c)
> > >   {
> > > -	u64 q;
> > > +	u64 __maybe_unused q;
> > 
> > Could we just fix the API to always assign 'q', instead of this
> > ugly & vague annotation?
> 
> q is always assigned. I believe the problem is that it is never read.

Indeed.

> OTOH this problem can be fixed easily after patch 31 of this series. I can send
> a V2 of patch 32 to just drop the assignment to q. This will be possible as
> rdmsrq() will be a function then, and not a macro requiring a variable being
> passed as parameter.

That's fine with me, as long as the build failure is only for this
i386 randconfig. If a new warning is generated for any of the
more prominent configs we'll have to make it go away for
the interim tree. (Because it's still not 100% clear whether
we'll be able to do patch 31 in this cycle.)

Thanks,

	Ingo


