Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E8619D08F;
	Wed, 22 Apr 2026 03:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776830362; cv=none; b=oUCeL6kd6B5iwxq5Y/lQzPc7DfKXDQb54Usz88prv7VX0Zv/kGe9+aMlghGc3PJiTDFA7Lwh97K4mAA6De3XBpz5um3memI3Vh2nsG7XJKx51m5EmfMyVPmlMnqITOoRiVrEgKtGVH6fPSpRNm8lNKC5dQzsFVYUuo1U3J6D7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776830362; c=relaxed/simple;
	bh=CXkZKgdthaeUmJxT8f5X8hCycQkr1cfSUPUf/VofJ/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIICbbjupKtpAr6tDAXC2+mCg3YzvqHaQUD1Mf9nVVOQXfP8/EKZr2d2xzszWQOmlvRrlfB16wCLTGRiyNV64okF2B7QxYCHy6LHtDrORUWTqlY2YJLFZJ1a5Xs0K7UGP+cpWBYedJHpYFekbUslWC6u80ZEVn2PHe38wSzcXUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=ji4csSQC; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="ji4csSQC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4in8P17k5sMKZ/AyUJWvRDGqCumZeXEYDW6n/V3EAVs=; t=1776830361; x=1777694361; 
	b=ji4csSQCyph4jc46qAAugNrrAozUafT0oTNdW2SsiKAYDtqz/FFpQO6743+Ld2ephAiDkBdkK4d
	eFUOQ3PC739pF4mBXwbZT9rzB34PsvNZ9XqjcSe5fLJwtPrqc5D9/8wr9pZBIoJvWgzxXCOFyM6VX
	2qb/0IILBwuCvUIUbo22oCF87XF69NaRN8Ac/andgOi55IgIeDGoNKbMpqCCx1gEAUcdjsNZ+t0Mu
	f02BTZbSLSoojoDyqIQ5lSHE2nyEx33AK4NGplsZgJ9iUzTmHEqvjlSGP+Jqx2tDxpXd9isRmvOJo
	kKHLXoHZXaooz1ExVCKLgDOyu80uQhM1TBbw==;
Received: from [167.220.238.94] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1wFOkA-001HcU-7S;
	Tue, 21 Apr 2026 23:59:18 -0400
Date: Wed, 22 Apr 2026 09:29:12 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-edac@vger.kernel.org, git@amd.com,
	shubhrajyoti.datta@gmail.com, Michal Simek <michal.simek@amd.com>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/versalnet: Report PFN and page offset for DDR errors
Message-ID: <aehHkO9fhiyoxf-e@csail.mit.edu>
References: <20260329124400.4064739-1-shubhrajyoti.datta@amd.com>
 <c4a7a3ec-cb87-4edc-ad6a-32dbed15197a@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4a7a3ec-cb87-4edc-ad6a-32dbed15197a@linux.microsoft.com>

On Wed, Apr 01, 2026 at 11:28:10AM +0530, Prasanna Kumar T S M wrote:
> 
> 
> On 29-03-2026 18:14, Shubhrajyoti Datta wrote:
> > Currently, DDRMC correctable and uncorrectable error events are reported
> > to EDAC with page frame number (pfn) and offset set to zero.
> > This information is not useful to locate the address for memory errors.
> > 
> > Compute the physical address from the error information and extract
> > the page frame number and offset before calling edac_mc_handle_error().
> > This provides the actual memory location information to the userspace.
> > 
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> > ---
> > 

[...]

> >   	if (stat->error_type == MC5_ERR_TYPE_UE) {
> >   		pinf = stat->ueinfo[stat->channel];
> > +		pa = convert_to_physical(priv, pinf, ctl_num, error_data);
> > +		pfn = PHYS_PFN(pa);
> >   		snprintf(priv->message, sizeof(priv->message),
> >   			 "Error type:%s controller %d Addr at %lx\n",
> > -			 "UE", ctl_num, convert_to_physical(priv, pinf, ctl_num, error_data));
> > +			 "UE", ctl_num, pa);
> >   		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
> > -				     1, 0, 0, 0, 0, 0, -1,
> > +				     1, pfn, offset_in_page(pa), 0, 0, 0, -1,
> >   				     priv->message, "");
> > -		pa = convert_to_physical(priv, pinf, ctl_num, error_data);
> > -		pfn = PHYS_PFN(pa);
> > -
> >   		if (IS_ENABLED(CONFIG_MEMORY_FAILURE)) {
> >   			err = memory_failure(pfn, MF_ACTION_REQUIRED);
> >   			if (err)
> 
> Nit: pa and pfn calculation can be moved out of the if() condition.
> 

Hi Shubrajyoti,

Could you revise this patch with a similar cleanup for the versalnet
driver as you did for the versal driver to avoid code duplication,
please?
https://lore.kernel.org/all/20260415060239.733200-1-shubhrajyoti.datta@amd.com/#t

Thank you!

Regards,
Srivatsa
Microsoft Linux Systems Group
