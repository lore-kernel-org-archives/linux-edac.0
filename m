Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9F215B971;
	Thu, 11 Jun 2026 01:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781141041; cv=none; b=aUmMhOu20hOECUrAkJoJ2X/RRegDDEtK6sxO9/BaO1HzmLZU0V5Z50o9R9Vuq56WJHgzWw3k433d88m5Ty9ZCcZbARkSjJ9qvzt+Cxk01WG4FcMQMf4cQKPhQnZBae+WkFI7GAJQSuJeDnUyvCNbqrBsiskiw1IsU7iNwEoKESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781141041; c=relaxed/simple;
	bh=3DEMsstt/ItoHDCtXkwtMgSChg2udaUltiO10dPHKLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddHhTwVkPhRUzI9RnWMgSCEsAG0mcn9h6uoTfnNZNt6Go7oAffwH78R3yUuFnjtSbhkMEasF0zGtX2KYcfgkVfwC0+BYvzBW+N+nkvg3gdT52MEKI+461Wnj+EeaGveZ/Ye37k7Z+wgk5yTQdInSfcV2rUD6SxIMRv7pJfV9xNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=i8B9UrNW; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="i8B9UrNW"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C477840E0215;
	Thu, 11 Jun 2026 01:23:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fU84wrwTBfqI; Thu, 11 Jun 2026 01:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781141025; bh=17m9O77Ss3xoEPWujezaUMKnP0YKiIISMFesoID2xjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8B9UrNW3a6DacfsWVtNle3S3SqYn+V9jGpqlnv/d5w+sJnTj3VBuKTBm/8kryVgB
	 pVcYCtc0p0NaMfOZ7dzOosnx95JXseggN7C4mWveDyvIijky1CZiLx9+Nzrhu1SsTX
	 8XlCtUBlbAIr1OLEAu4MNn+o8WekjNY+eJXkyLOQi7c1nAR8lf2x5L9rXH3XFKjDCf
	 0untQFGVjZxRfgrxjUKq+TYVKK9WVi2E3ZvaJ9Ts4Ew6h/LMtjVmG1yPfX5t5N7RL+
	 8hXoXWDoRTpp4GBdvsT0xmWpTb9e8vv+NQDZXyqZZwqegdBhAUaXh2tHDRYKT6PmY7
	 tv1LUr+d3JhjEk1/fUF1gx6vvMRzX87BTIW+/M0LYhdwRgaHgw+IF48yiSLpoIfNY7
	 L+Gcd6Ci/kvRORcMF0nFGlB/XFUBJYl8kYGp6UsaBC3tOVGCCs8BrGtFVFal/mU9JK
	 +HImM2O5d6xm9xh2tafr1XUMRycuPaEqnMixBxaM826B9WsOTQv+fnVOxmYXNdwO1Z
	 3XxBT3jmEQ9xIH+xu9ES8f591dckPkSQYOeJt/gewnrxUb5B+AMN1YmjQD+2DIPy1n
	 NUU6J4DN46AY1Dq/hukkY6UvOjtor3p9xCOHbgd8vw4zE2SJCj6I624hlWDKKgMhPw
	 16WYGWwbeKZMEFZlTLDavVhA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 21F8940E01B5;
	Thu, 11 Jun 2026 01:23:40 +0000 (UTC)
Date: Wed, 10 Jun 2026 18:23:36 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Message-ID: <20260611012336.GHaioOGB0NBxv5BZXS@fat_crate.local>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
 <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
 <20260601184100.GA4547@yaz-khff2.amd.com>
 <20260601210535.GFah30HwoSEavRkLXu@fat_crate.local>
 <20260604154856.GA1625873@yaz-khff2.amd.com>
 <20260610003516.GBaiixRCclQEMwY_9d@fat_crate.local>
 <20260610211541.GA831811@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610211541.GA831811@yaz-khff2.amd.com>

+ Mauro.

On Wed, Jun 10, 2026 at 05:15:41PM -0400, Yazen Ghannam wrote:
> On Tue, Jun 09, 2026 at 05:35:16PM -0700, Borislav Petkov wrote:
> > On Thu, Jun 04, 2026 at 11:48:56AM -0400, Yazen Ghannam wrote:
> > > I think the issue is having concurrent updates to mci->error_desc. EDAC
> > > assumes a single owner for the MCIs. The fake_inject interface basically
> > > acts as a second module/owner.
> > 
> > Ok, something like this. Ugly but it should show the intent. It probably needs
> > more auditing whether we have copied all the fields we need down the
> > edac_mc_handle_error() path...
> > 
> > diff --git a/drivers/edac/debugfs.c b/drivers/edac/debugfs.c
> > index 8195fc9c9354..034b9b3f9cf5 100644
> > --- a/drivers/edac/debugfs.c
> > +++ b/drivers/edac/debugfs.c
> > @@ -14,28 +14,38 @@ static ssize_t edac_fake_inject_write(struct file *file,
> >  	struct mem_ctl_info *mci = to_mci(dev);
> >  	static enum hw_event_mc_err_type type;
> >  	u16 errcount = mci->fake_inject_count;
> > +	struct mem_ctl_info *imci;
> > +
> > +	imci = kmalloc(sizeof(struct mem_ctl_info), GFP_KERNEL);
> > +	if (!imci)
> > +		return -ENOMEM;
> > +
> > +	/* use a local copy and copy the struct */
> > +	*imci = *mci;
> >  
> >  	if (!errcount)
> >  		errcount = 1;
> >  
> > -	type = mci->fake_inject_ue ? HW_EVENT_ERR_UNCORRECTED
> > -				   : HW_EVENT_ERR_CORRECTED;
> > +	type = imci->fake_inject_ue ? HW_EVENT_ERR_UNCORRECTED
> > +				    : HW_EVENT_ERR_CORRECTED;
> >  
> >  	printk(KERN_DEBUG
> >  	       "Generating %d %s fake error%s to %d.%d.%d to test core handling. NOTE: this won't test the driver-specific decoding logic.\n",
> >  		errcount,
> >  		(type == HW_EVENT_ERR_UNCORRECTED) ? "UE" : "CE",
> >  		str_plural(errcount),
> > -		mci->fake_inject_layer[0],
> > -		mci->fake_inject_layer[1],
> > -		mci->fake_inject_layer[2]
> > +		imci->fake_inject_layer[0],
> > +		imci->fake_inject_layer[1],
> > +		imci->fake_inject_layer[2]
> >  	       );
> > -	edac_mc_handle_error(type, mci, errcount, 0, 0, 0,
> > -			     mci->fake_inject_layer[0],
> > -			     mci->fake_inject_layer[1],
> > -			     mci->fake_inject_layer[2],
> > +	edac_mc_handle_error(type, imci, errcount, 0, 0, 0,
> > +			     imci->fake_inject_layer[0],
> > +			     imci->fake_inject_layer[1],
> > +			     imci->fake_inject_layer[2],
> >  			     "FAKE ERROR", "for EDAC testing only");
> >  
> > +	kfree(imci);
> > +
> >  	return count;
> >  }
> >  
> > 
> > 
> 
> Right, this fixes the race, and printk/trace would be okay. But the
> normal EDAC interface won't get updated. I think that breaks the fake
> inject use case.

You have the fake_inject fields, see edac_create_debugfs_nodes(). Those are
the fake_inject counters which should get incremented and I think we can make
it work by making the imci thing global and always hand it in to those
functions...

> Ex.
> 1) Use fake inject to target layer/severity.
> 2) Check EDAC interface to see layer/severity counters increase.
> 
> I don't use the fake inject interface, so I may be mistaken about its
> use.

... and neither do I. And I haven't heard of anyone doing so. And that's
perhaps the case because the thing is behind CONFIG_EDAC_DEBUG and only we
enable that.

So I'm thinking fake_inject has reached its retiring age. And 

452a6bf955ee ("edac: Add debufs nodes to allow doing fake error inject")

should simply be reverted.

Mauro's on Cc so that he can get a chance to chime in but lemme paste for him
the issue that Sashiko caught and that, AFAICT, has always been there:

---
> @@ -2748,7 +2768,7 @@ static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
>  	edac_mc_handle_error(err_type, mci, 1,
>  			     err->page, err->offset, err->syndrome,
>  			     err->csrow, err->channel, -1,
> -			     string, "");
> +			     string, s);
Could passing a stack-allocated buffer to edac_mc_handle_error() risk a
use-after-free of stack memory?
Looking at edac_mc_handle_error(), it directly assigns the other_detail
pointer to the globally shared error_desc structure without holding locks:
drivers/edac/edac_mc.c:edac_mc_handle_error() {
    ...
    e->other_detail = other_detail ?: "";
    ...
}
While normal hardware MCE decoding is serialized by the mce_work workqueue,
the EDAC fake_inject debugfs interface can execute concurrently.
Could a user writing to fake_inject race to modify mci->error_desc?
Thread 1 (mce_work):
__log_ecc_error()
    char s[MSG_SIZE];
    edac_mc_handle_error(..., s)
        e->other_detail = s;
If __log_ecc_error() returns and its stack frame is popped, and Thread 2
(fake_inject) is concurrently executing edac_raw_mc_handle_error(), could
it read the dangling pointer from e->other_detail?
---

(from https://sashiko.dev/#/patchset/20260518160716.171578-1-yazen.ghannam%40amd.com)

If this were to be done right, then that passing in of a string buffer
allocated in the mci would mean that all those functions working on it down
the callpath cannot ever be called concurrently.

Or if they have to, a separate mci would have to be handed in. Either way,
that would need hairy rework and right now, the simplest thing to do is simply
zap that fake_inject stuff which is not used anyway.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
