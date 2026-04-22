Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08B479CD;
	Wed, 22 Apr 2026 04:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776831004; cv=none; b=FR6oZOyFcU1cCEBMXrSh7dOo5ZKzBUw4rppLboN+B2mhus+wIM4UsUmDicaEBgj3MZjXrwsjEdj3nQRG82ofasrMUuIVq7ihu9ZrYsRs4LwmkaYaxb+w2vmQKrLpg0tcbiPFFtr+ow91JEogGJNseOnRtKyp9eK4h4LuYd7GM8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776831004; c=relaxed/simple;
	bh=rc6eGePC4WGD3CtYJ0tebOEdiYxxLYdl9K9S4/VNV0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVncmEGjPRu/mCohGkZfoetLogZjUCYSJwNWE+79FL2GbTO/UCOOb0Bd5ta77vuBOSHiAL39YJ6MO+L0ZlgagR/vXg7wgvC7vRHH+wmRANTs8BR4VbB6/fEGIiDRMA0/ecgFnyfif+FOGFsbmRndXxtg6RmvogeH3YlBvtIZNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=OLuLj5Mn; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="OLuLj5Mn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LgeLNPqEonxZYoMTSblWq5sCVLTN5HlDpYOQUeY8P5g=; t=1776831002; x=1777695002; 
	b=OLuLj5Mn6eZB+swq1JPZd3XB9SO4LYO/TpxYEor8+p+PAIcEdrPDdIhXaXvwLq5iQkKjmzxPrK9
	TlHNpsVpEMNgmFB+jlug8nvGUPLKU+qU3lQqhujBjmi77IyGDI8AQWd+eYGerUJjUCDA26raR8p2a
	JMhQxdEIe8+c8gm+nulgO+njCnKCgRjxIG9829EQDevL7rkDVfQQ5Or5Hn0rAMhm0Vw0Q+IgLgiNx
	60y45sNzfboSTZ2sxxFkPbVbPhPa9cBHb3q32Zr3hd/FmcVHusQriQas9xolEASCl/+sEDS1vJQyw
	Gy1xAV47CPWovh9rqlRtwnmoT0vWknbdEpuQ==;
Received: from [167.220.238.94] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1wFOb0-001FzW-Ek;
	Tue, 21 Apr 2026 23:49:50 -0400
Date: Wed, 22 Apr 2026 09:19:41 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, git@amd.com,
	ptsm@linux.microsoft.com, shubhrajyoti.datta@gmail.com,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH] EDAC/versal: Report PFN and page offset for DDR errors
Message-ID: <aehFVdYNiGMh1rry@csail.mit.edu>
References: <20260415060239.733200-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415060239.733200-1-shubhrajyoti.datta@amd.com>

On Wed, Apr 15, 2026 at 11:32:39AM +0530, Shubhrajyoti Datta wrote:
> Currently, DDRMC correctable and uncorrectable error events are reported
> to EDAC with page frame number (pfn) and offset set to zero.
> This information is not useful to locate the address for memory errors.
> 
> Compute the physical address from the error information and extract
> the page frame number and offset before calling edac_mc_handle_error().
> This provides the actual memory location information to the userspace.
> 
> Fixes: 6f15b178cd63 ("EDAC/versal: Add a Xilinx Versal memory controller driver")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>  drivers/edac/versal_edac.c | 36 +++++++++++++++++-------------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
> index 5a43b5d43ca2..18045f96610e 100644
> --- a/drivers/edac/versal_edac.c
> +++ b/drivers/edac/versal_edac.c
> @@ -414,34 +414,32 @@ static unsigned long convert_to_physical(struct edac_priv *priv, union ecc_error
>  static void handle_error(struct mem_ctl_info *mci, struct ecc_status *stat)
>  {

[...]

>  	if (stat->error_type == XDDR_ERR_TYPE_CE) {

[...]

> +	} else if (stat->error_type == XDDR_ERR_TYPE_UE) {

[...]
> +	} else {
> +		return;

I like the cleanup contributed by this patch (in terms of reducing
code duplication) in addition to the actual fix. However, this patch
also introduces a subtle behavior change - the existing code calls
memset() to clear out the ecc_status struct unconditionally, but this
patch doesn't call memset if the error type is not CE or UE (i.e., in
the early return path).

Was this change intentional? Wouldn't it potentially cause stale data
to be left over in the ecc_status struct, affecting future reuse?

[...]

> +
>  	memset(stat, 0, sizeof(*stat));
>  }
>  

If the expectation is to actually clear it out unconditionally, it
would be great to document it in the comments (if not done already).

Thank you!

Regards,
Srivatsa
Microsoft Linux Systems Group
