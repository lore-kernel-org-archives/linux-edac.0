Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BDC3148D9;
	Mon, 27 Apr 2026 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777315773; cv=none; b=tEVsI31rEYv9qDhuXid6Yp3VhAbeHX8f4njnEt1RQ3QfLTYcvsNbgtj45VA1QtW8sxMiMDraZDbjtPaXN2jTHeTWuVG2ON4D4tEnnu87PITelEvGX2AYZ/zuUx4LTJh8s1TKnhzSQQLHdNuKmoVB36x3N0KItJ5RLs9GInnUnpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777315773; c=relaxed/simple;
	bh=jcnV3AUTLUj5skdvHfAWPytKuLuOE4FOz97e6B/Soa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxImRvIdWY4CMnO6roXoVDdK0xUyKs0TO/Q+pZMcwKODbcwfE0Z/kmUh8YOqh9jrg0eXtYS4qcu80EY/fQo2Kn6+zamBvHtNEa8izrj+zHC+AvoGGve7nL4RSnOucqvCnNmkAFFJf1lD0odfsHs4sSdlItfnAK2GNdmNoDsSc5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=sXUz7uxZ; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="sXUz7uxZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZiF29MWhxc/MPyNfGiv5swIWp1VCWnTAZXlxcERVxB8=; t=1777315771; x=1778179771; 
	b=sXUz7uxZ8Umj2G7iTuqHe5YV2EduH1KqSnCzoaqAk3z4QQmlDpJJNjMLBwUiO9y6nbXPqJmHClT
	6wNaBhLRGFitfJEQAgABVLDyYaUiJTSDrAnkZ3a2HqJjvYngMWKumom7dsnLvlt6cw+r8tTb/ckLi
	iLBtFAdtocq49i+GCWeGNYB6hFIrEtlWhnf3IsALhlRdhW6LMr4e5hmkjarp4yO1zg/dDlyELB7mi
	75eQVNYIdc6tieV4Q23leJkdtknNmuvkvfucGwjARWd1lN0eckNyCPKBjHRuXiBAbQhCWOjK1ADCD
	IIIH6gnYLlLEFFzmN7mjY6zo3O6l/Au1Io2g==;
Received: from [49.207.232.121] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1wHR1H-005Q8r-5b;
	Mon, 27 Apr 2026 14:49:23 -0400
Date: Tue, 28 Apr 2026 00:19:12 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"ptsm@linux.microsoft.com" <ptsm@linux.microsoft.com>,
	"shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH] EDAC/versal: Report PFN and page offset for DDR errors
Message-ID: <ae-vqFb1GvTkj9e0@csail.mit.edu>
References: <20260415060239.733200-1-shubhrajyoti.datta@amd.com>
 <aehFVdYNiGMh1rry@csail.mit.edu>
 <DS2PR12MB9821117564B73D6C805727BB81362@DS2PR12MB9821.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS2PR12MB9821117564B73D6C805727BB81362@DS2PR12MB9821.namprd12.prod.outlook.com>

On Mon, Apr 27, 2026 at 06:27:36AM +0000, Datta, Shubhrajyoti wrote:
> Public
> 
> > -----Original Message-----
> > From: Srivatsa S. Bhat <srivatsa@csail.mit.edu>
> > Sent: Wednesday, April 22, 2026 9:20 AM
> > To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
> > Cc: linux-kernel@vger.kernel.org; linux-edac@vger.kernel.org; git (AMD-Xilinx)
> > <git@amd.com>; ptsm@linux.microsoft.com; shubhrajyoti.datta@gmail.com;
> > Borislav Petkov <bp@alien8.de>; Tony Luck <tony.luck@intel.com>
> > Subject: Re: [PATCH] EDAC/versal: Report PFN and page offset for DDR errors
> >
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > On Wed, Apr 15, 2026 at 11:32:39AM +0530, Shubhrajyoti Datta wrote:
> > > Currently, DDRMC correctable and uncorrectable error events are
> > > reported to EDAC with page frame number (pfn) and offset set to zero.
> > > This information is not useful to locate the address for memory errors.
> > >
> > > Compute the physical address from the error information and extract
> > > the page frame number and offset before calling edac_mc_handle_error().
> > > This provides the actual memory location information to the userspace.
> > >
> > > Fixes: 6f15b178cd63 ("EDAC/versal: Add a Xilinx Versal memory
> > > controller driver")
> > > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> > > ---
> > >
> > >  drivers/edac/versal_edac.c | 36 +++++++++++++++++-------------------
> > >  1 file changed, 17 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
> > > index 5a43b5d43ca2..18045f96610e 100644
> > > --- a/drivers/edac/versal_edac.c
> > > +++ b/drivers/edac/versal_edac.c
> > > @@ -414,34 +414,32 @@ static unsigned long convert_to_physical(struct
> > > edac_priv *priv, union ecc_error  static void handle_error(struct
> > > mem_ctl_info *mci, struct ecc_status *stat)  {
> >
> > [...]
> >
> > >       if (stat->error_type == XDDR_ERR_TYPE_CE) {
> >
> > [...]
> >
> > > +     } else if (stat->error_type == XDDR_ERR_TYPE_UE) {
> >
> > [...]
> > > +     } else {
> > > +             return;
> >
> > I like the cleanup contributed by this patch (in terms of reducing code
> > duplication) in addition to the actual fix. However, this patch also introduces a
> > subtle behavior change - the existing code calls
> > memset() to clear out the ecc_status struct unconditionally, but this patch
> > doesn't call memset if the error type is not CE or UE (i.e., in the early return
> > path).
> >
> > Was this change intentional? Wouldn't it potentially cause stale data to be left
> > over in the ecc_status struct, affecting future reuse?
> 
> Hi Srivatsa,
> Thanks for the review.
> 
> The early return in handle_error is intentionally safe.
> get_error_info is always called before handle_error:
> 
>   if (get_error_info(priv))
>           return;
>   handle_error(mci, &priv->stat);
> 
>   get_error_info already guards against non-CE/UE events:
> 
>   if (!eccr0_ceval && !eccr1_ceval && !eccr0_ueval && !eccr1_ueval)
>           return 1;
> 
>   So handle_error is only ever reached when at least one CE or UE
>   error is present, making the else { return; } branch unreachable
>   in practice. The removed memset in that path was overprotective
>   dead code.
> 
>   For future events, get_error_info always reloads the data fresh
>   before handle_error runs, so there is no risk of stale data.
> 

I see, thank you for the clarification!

>   I can add a comment above handle_error noting this precondition if
>   that would help future readers.
> 

Sure, that would be great! Along with that, how about also removing
the else { return; } branch if it is actually unreachable?

Regards,
Srivatsa
Microsoft Linux Systems Group
