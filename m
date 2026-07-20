Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079F57261A;
	Mon, 20 Jul 2026 05:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784524424; cv=none; b=ezLIJ4KCwY5DNb336ud7SUWC9n2bx+DKXFEEPi0inMLcVPA1/SVj/hvd10iLFXIwTRmprzEgUsoOcLUg9mcfR4/Eoely+wxncLn9S6rpSQiR9xInoM6uSPi4VJA2ebt4dWgMlGZvuz9HFXr0M+X37qFHoLxSCXSF/ATHdDRo9YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784524424; c=relaxed/simple;
	bh=yqpA7UIb65u2FGiiIy2bMeYHCZJ5AzMaVyJb/NIZQfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFdCONmfzOFyidGgP23wGEl/RK0inSu20FCy+kn49fSoUy+3mKDmJ4pCYyVOooWA9jD3kTQs3DE1HwzbcaojRDV3d3rlgAUbW7/82XsRDLKuo4tODFv56p+gZF3R61B5roSFJFmfcVMib6CXhzB/LI+sGQSd7g5fLqcotP1r3sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=fAtekVi8; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="fAtekVi8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=auqxfyjqvg97ZI0Qq1FkdZriEifJJeIejxWMpuBlbLc=; t=1784524422; x=1785388422; 
	b=fAtekVi8p8RUdfG00rteahqVNn3cX6ZyaVu4Bcb2MwLkkFS6WnmgwkXangeaCRapoVvUj7XF795
	VhRb/bxBWhjwKds+gHbhfspysQvl+f6yw7LgR5w2XKnfQDHKtldCEr8MbUF6P71aPQ+rzjB/BvT+q
	29V0hQP7X4OuznQaAJJwXKkADWcE0swmREc1PHD6LpA1NUfTOvBTjgpE6dUjE6kJhdDJvDYOkvPQn
	fQ/KTOowHutRnQz4vBJnJ4fGt0qCFACFVX/tuO5n5ssf9di4KzlmCCS5Uqz6LGYhuFvwlPQ7GW+8M
	oiFQbIoW7VtWlL7tmVk9vP24oJGvM4gFhnMA==;
Received: from [167.220.238.20] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1wlgJg-008zHN-Lk;
	Mon, 20 Jul 2026 01:13:25 -0400
Date: Mon, 20 Jul 2026 10:43:10 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@kernel.org>,
	linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mce_amd: Do not print a stray newline
Message-ID: <al2uZnOfkGxXv1q3@csail.mit.edu>
References: <20260712031648.486110-1-bp@kernel.org>
 <20260713184402.GA364094@yaz-khff2.amd.com>
 <20260713232219.GAalVzK0UQ9rxlIWmT@fat_crate.local>
 <alYPZGTBJUDR936n@csail.mit.edu>
 <20260714130455.GB364094@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714130455.GB364094@yaz-khff2.amd.com>

Hi Yazen,

On Tue, Jul 14, 2026 at 09:04:55AM -0400, Yazen Ghannam wrote:
> On Tue, Jul 14, 2026 at 03:58:52PM +0530, Srivatsa S. Bhat wrote:
> > On Mon, Jul 13, 2026 at 04:22:19PM -0700, Borislav Petkov wrote:
> > > On Mon, Jul 13, 2026 at 02:44:02PM -0400, Yazen Ghannam wrote:
> > > > On Sat, Jul 11, 2026 at 08:16:48PM -0700, Borislav Petkov wrote:
> > > > > From: "Borislav Petkov (AMD)" <bp@alien8.de>
> > > > > 
> > > > > With error records which don't have FRU text, an empty newline is
> > > > > printed like this:
> > > > > 
> > > > >   [28014.094610] mce: [Hardware Error]: Machine check events logged
> > > > >   [28014.094674] [Hardware Error]: Corrected error, no action required.
> > > > >   [28014.094687] [Hardware Error]: CPU:11 (19:44:1) MC0_STATUS[-|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0x9c20400001010135
> > > > >   [28014.094724] [Hardware Error]: Error Addr: 0x000000019ba9a974
> > > > >   [28014.094732] [Hardware Error]: IPID: 0x001000b000000000, Syndrome: 0x000000081a1f2505
> > > > > 
> > > > >   [28014.094744] [Hardware Error]: Load Store Unit Ext. Error Code: 1
> > > > >   [28014.094748] [Hardware Error]: cache level: L1, tx: DATA, mem-tx: DRD
> > > > > 
> > > > > Move the \n into the last printk() call where it belongs.
> > > > > 
> > > > > Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> > > > 
> > > > Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > > 
> > > Yeah, Sashiko has a point:
> > > 
> > > https://sashiko.dev/#/patchset/20260712031648.486110-1-bp%40kernel.org
> > > 
> > > So we want the error records to be compact and fit in a block so that you can
> > > recognize them easier and thus not print each thing with a newline.
> > > 
> > > But those things are not unconditional so you cannot always know.
> > > 
> > > I need to think of a slick scheme what to do here.
> > >
> > 
> > Do you mean something other than moving the newline print into an else
> > block like this?
> > 
> > ---
> >  drivers/edac/mce_amd.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
> > index bd252cb3c38e..60d1a62e1a95 100644
> > --- a/drivers/edac/mce_amd.c
> > +++ b/drivers/edac/mce_amd.c
> > @@ -870,12 +870,16 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
> >  				memcpy(&frutext[0], &err->vendor.amd.synd1, 8);
> >  				memcpy(&frutext[8], &err->vendor.amd.synd2, 8);
> >  
> > -				pr_emerg(HW_ERR "FRU Text: %s", frutext);
> > +				pr_emerg(HW_ERR "FRU Text: %s\n", frutext);
> >  			}
> > +		} else {
> > +			/*
> > +			 * Explicit line termination to handle nested
> > +			 * conditional prints correctly.
> > +			 */
> > +			pr_cont("\n");
> >  		}
> >  
> > -		pr_cont("\n");
> > -
> >  		decode_smca_error(m);
> >  		goto err_code;
> >  	}
> > -- 
> 
> Another option could be to build up each newline string and print it
> once. The gist is to get rid of pr_cont() usage.
>

I don't think getting rid of pr_cont() was the intention behind the
original patch by Boris; he was trying to address a user-visible
stray newline in the logs, if I understood correctly.

> I've attached an old patch for that. Would this work?
> 

The approach to build up each string fully before printing it that you
demonstrated below does look like a nice improvement in general, but
I'm afraid it may not be a good fit for this particular subsystem
though, for the following reasons:

1. Given the EDAC subsystem's role in handling/reporting hardware
   errors, I think the logging preference for this subsystem would be
   to get the error message out as soon as possible, as the machine is
   already likely to be in trouble if we are printing out kernel logs at
   the criticality level of "emergency". So, delaying these prints to
   construct the full string may not be desirable, as doing so can
   potentially cripple the ability to get even the error indicators
   known upto that point printed out (in case of further occurrence of
   hardware errors).

2. The static buffer sizing for the character string (256) is
   potentially prone to buffer overflows in the future as and when these
   print statements evolve (without taking the buffer size into
   careful consideration for every change to the string).

3. This is a much larger (cleanup) change than what Boris had posted
   earlier (which was ~2 lines).


Thoughts?

Regards,
Srivatsa
Microsoft Linux Systems Group

> 
> 
> From 2035e5b829de2834aef8d84de24bafb5f4e5e03b Mon Sep 17 00:00:00 2001
> From: Yazen Ghannam <yazen.ghannam@amd.com>
> Date: Thu, 16 Dec 2021 19:06:14 +0000
> Subject: [PATCH] [WIP] EDAC/mce_amd: Construct string before printing
> 
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>  drivers/edac/mce_amd.c | 64 +++++++++++++++++++++++++++++-------------
>  1 file changed, 45 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
> index bd252cb3c38e..ea6dc7437cae 100644
> --- a/drivers/edac/mce_amd.c
> +++ b/drivers/edac/mce_amd.c
> @@ -744,6 +744,8 @@ static void decode_smca_error(struct mce *m)
>  {
>  	enum smca_bank_types bank_type = smca_get_bank_type(m->extcpu, m->bank);
>  	u8 xec = XEC(m->status, xec_mask);
> +	char buf[256];
> +	char *p, *end;
>  
>  	if (bank_type >= N_SMCA_BANK_TYPES)
>  		return;
> @@ -753,7 +755,13 @@ static void decode_smca_error(struct mce *m)
>  		return;
>  	}
>  
> -	pr_emerg(HW_ERR "%s Ext. Error Code: %d", smca_get_long_name(bank_type), xec);
> +	memset(buf, 0, sizeof(buf));
> +	p = buf;
> +	end = buf + sizeof(buf);
> +
> +	p += scnprintf(p, end - p, "%s Ext. Error Code: %d", smca_get_long_name(bank_type), xec);
> +
> +	pr_emerg(HW_ERR "%s", buf);
>  
>  	if ((bank_type == SMCA_UMC || bank_type == SMCA_UMC_V2) &&
>  	    xec == 0 && decode_dram_ecc)
> @@ -762,26 +770,33 @@ static void decode_smca_error(struct mce *m)
>  
>  static inline void amd_decode_err_code(u16 ec)
>  {
> +	char buf[256];
> +	char *p, *end;
> +
>  	if (INT_ERROR(ec)) {
>  		pr_emerg(HW_ERR "internal: %s\n", UU_MSG(ec));
>  		return;
>  	}
>  
> -	pr_emerg(HW_ERR "cache level: %s", LL_MSG(ec));
> +	memset(buf, 0, sizeof(buf));
> +	p = buf;
> +	end = buf + sizeof(buf);
> +
> +	p += scnprintf(p, end - p, "cache level: %s", LL_MSG(ec));
>  
>  	if (BUS_ERROR(ec))
> -		pr_cont(", mem/io: %s", II_MSG(ec));
> +		p += scnprintf(p, end - p, ", mem/io: %s", II_MSG(ec));
>  	else
> -		pr_cont(", tx: %s", TT_MSG(ec));
> +		p += scnprintf(p, end - p, ", tx: %s", TT_MSG(ec));
>  
>  	if (MEM_ERROR(ec) || BUS_ERROR(ec)) {
> -		pr_cont(", mem-tx: %s", R4_MSG(ec));
> +		p += scnprintf(p, end - p, ", mem-tx: %s", R4_MSG(ec));
>  
>  		if (BUS_ERROR(ec))
> -			pr_cont(", part-proc: %s (%s)", PP_MSG(ec), TO_MSG(ec));
> +			p += scnprintf(p, end - p, ", part-proc: %s (%s)", PP_MSG(ec), TO_MSG(ec));
>  	}
>  
> -	pr_cont("\n");
> +	pr_emerg(HW_ERR "%s", buf);
>  }
>  
>  static const char *decode_error_status(struct mce *m)
> @@ -807,6 +822,8 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
>  	struct mce_hw_err *err = to_mce_hw_err(m);
>  	unsigned int fam = x86_family(m->cpuid);
>  	u32 mca_config_lo = 0, dummy;
> +	char buf[256];
> +	char *p, *end;
>  	int ecc;
>  
>  	if (m->kflags & MCE_HANDLED_CEC)
> @@ -814,7 +831,11 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
>  
>  	pr_emerg(HW_ERR "%s\n", decode_error_status(m));
>  
> -	pr_emerg(HW_ERR "CPU:%d (%x:%x:%x) MC%d_STATUS[%s|%s|%s|%s|%s",
> +	memset(buf, 0, sizeof(buf));
> +	p = buf;
> +	end = buf + sizeof(buf);
> +
> +	p += scnprintf(p, end - p, "CPU:%d (%x:%x:%x) MC%d_STATUS[%s|%s|%s|%s|%s",
>  		m->extcpu,
>  		fam, x86_model(m->cpuid), x86_stepping(m->cpuid),
>  		m->bank,
> @@ -829,28 +850,29 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
>  		rdmsr_safe(MSR_AMD64_SMCA_MCx_CONFIG(m->bank), &mca_config_lo, &dummy);
>  
>  		if (mca_config_lo & MCI_CONFIG_MCAX)
> -			pr_cont("|%s", ((m->status & MCI_STATUS_TCC) ? "TCC" : "-"));
> +			p += scnprintf(p, end - p, "|%s", ((m->status & MCI_STATUS_TCC) ? "TCC" : "-"));
>  
> -		pr_cont("|%s", ((m->status & MCI_STATUS_SYNDV) ? "SyndV" : "-"));
> +		p += scnprintf(p, end - p, "|%s", ((m->status & MCI_STATUS_SYNDV) ? "SyndV" : "-"));
>  	}
>  
>  	/* do the two bits[14:13] together */
>  	ecc = (m->status >> 45) & 0x3;
>  	if (ecc)
> -		pr_cont("|%sECC", ((ecc == 2) ? "C" : "U"));
> +		p += scnprintf(p, end - p, "|%sECC", ((ecc == 2) ? "C" : "U"));
>  
>  	if (fam >= 0x15) {
> -		pr_cont("|%s", (m->status & MCI_STATUS_DEFERRED ? "Deferred" : "-"));
> +		p += scnprintf(p, end - p, "|%s", (m->status & MCI_STATUS_DEFERRED ? "Deferred" : "-"));
>  
>  		/* F15h, bank4, bit 43 is part of McaStatSubCache. */
>  		if (fam != 0x15 || m->bank != 4)
> -			pr_cont("|%s", (m->status & MCI_STATUS_POISON ? "Poison" : "-"));
> +			p += scnprintf(p, end - p, "|%s", (m->status & MCI_STATUS_POISON ? "Poison" : "-"));
>  	}
>  
>  	if (fam >= 0x17)
> -		pr_cont("|%s", (m->status & MCI_STATUS_SCRUB ? "Scrub" : "-"));
> +		p += scnprintf(p, end - p, "|%s", (m->status & MCI_STATUS_SCRUB ? "Scrub" : "-"));
>  
> -	pr_cont("]: 0x%016llx\n", m->status);
> +	p += scnprintf(p, end - p, "]: 0x%016llx\n", m->status);
> +	pr_emerg(HW_ERR "%s", buf);
>  
>  	if (m->status & MCI_STATUS_ADDRV)
>  		pr_emerg(HW_ERR "Error Addr: 0x%016llx\n", m->addr);
> @@ -859,10 +881,14 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
>  		pr_emerg(HW_ERR "PPIN: 0x%016llx\n", m->ppin);
>  
>  	if (boot_cpu_has(X86_FEATURE_SMCA)) {
> -		pr_emerg(HW_ERR "IPID: 0x%016llx", m->ipid);
> +		memset(buf, 0, sizeof(buf));
> +		p = buf;
> +
> +		p += scnprintf(p, end - p, "IPID: 0x%016llx", m->ipid);
>  
>  		if (m->status & MCI_STATUS_SYNDV) {
> -			pr_cont(", Syndrome: 0x%016llx\n", m->synd);
> +			p += scnprintf(p, end - p, ", Syndrome: 0x%016llx", m->synd);
> +			pr_emerg(HW_ERR "%s", buf);
>  			if (mca_config_lo & MCI_CONFIG_FRUTEXT) {
>  				char frutext[17];
>  
> @@ -872,10 +898,10 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
>  
>  				pr_emerg(HW_ERR "FRU Text: %s", frutext);
>  			}
> +		} else {
> +			pr_emerg(HW_ERR "%s", buf);
>  		}
>  
> -		pr_cont("\n");
> -
>  		decode_smca_error(m);
>  		goto err_code;
>  	}
> -- 
> 2.54.0
> 
