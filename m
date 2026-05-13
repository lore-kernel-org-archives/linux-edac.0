Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11B538B7B1;
	Wed, 13 May 2026 10:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668666; cv=none; b=MZUInCORR7T6NDk7EIVfC3Lbe41N/9Mr0j5mrwpAF8P8gf8kvWOYwhiF3TDXv7rCwD9Om3DSvzPMifhpTF7jeVGk+Lk/oWkZs3zIsc6ZpXKgqJuidlZ4wX32tAfFjEMNUGN4SRvvfrTXaCOb+3lvfp/FW7xL/5rRBkzwiRyProM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668666; c=relaxed/simple;
	bh=mDkTNBdPxoXj04tXh+6umU4Y9T9KUwbRmq+TMZ6m168=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR23msIGGaTi6ljg8TvGomSPAyqidCbdmAF5ob1cBpIhrRx3PQ+I2ZxyFIrqFcwB+CyQZXimfEv3IZdRy4xoS6f1ghl+lOgJeM5Q2gr1IZqfaEDZrhyeb32WK7GeCl+XHJAEqDxLushYY/I+TOUr1MhXX2RgdEk/bv8H5oSIF5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=iokxFphX; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="iokxFphX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Nfx65Rj3nkkg7S91Np3UbI/nMT4YHgGx/POti+e7FLE=; t=1778668665; x=1779532665; 
	b=iokxFphXgIv3KbElz/ra3AxdbbSP46amkZ8uKa+TPwijhQRMOhChcdyTnoSOydln+cLeA+d88r+
	Ol3UciRkpkFWTbFAdU7RGACCE5tubRS/zc7cTy26MrKcuFd3uUiRE53Y8TZCGLh6nGGJ49i0+d1iS
	tK1HvI+zxUbSJZhCt7O4OQUI72G4o3wBUNZwDtmr9dSeiBlpGGPuH874nw9+NPov6qE0ozhhqYpci
	4msytLvVVHKl/NYgPSNOdftm56ZCV7v0sVkaDboTfa6s95VDQ58mSAQO8Nsan+aFb6zHhPeMkX+vN
	U4v7UR8Slw+pAIYbjcIxiAnAjM5M8espB69Q==;
Received: from [167.220.238.85] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1wN6sf-00GJ7h-KF;
	Wed, 13 May 2026 06:31:58 -0400
Date: Wed, 13 May 2026 16:01:48 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, git@amd.com,
	ptsm@linux.microsoft.com, shubhrajyoti.datta@gmail.com,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v2] EDAC/versal: Report PFN and page offset for DDR errors
Message-ID: <agRTFM3GTU4fuYG6@csail.mit.edu>
References: <20260428102850.1372502-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428102850.1372502-1-shubhrajyoti.datta@amd.com>

On Tue, Apr 28, 2026 at 03:58:50PM +0530, Shubhrajyoti Datta wrote:
> Currently, DDRMC correctable and uncorrectable error events are reported
> to EDAC with page frame number (pfn) and offset set to zero.
> This information is not useful to locate the address for memory errors.
> 
> Compute the physical address from the error information and extract
> the page frame number and offset before calling edac_mc_handle_error().
> This provides the actual memory location information to the userspace.
> 
> Fixes: 6f15b178cd63 ("EDAC/versal: Add a Xilinx Versal memory controller driver")
> Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Reviewed-by: Srivatsa S. Bhat (Microsoft) <srivatsa@csail.mit.edu>

Regards,
Srivatsa
Microsoft Linux Systems Group

> ---
> 
> Changes in v2:
> - Optimise the handle_error for it is not called for non-(CE/UE) errors
> - Remove the extra else
> 
>  drivers/edac/versal_edac.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
> index 539b46d4f610..5e049cbb3e9b 100644
> --- a/drivers/edac/versal_edac.c
> +++ b/drivers/edac/versal_edac.c
> @@ -513,38 +513,38 @@ static unsigned long convert_to_physical(struct edac_priv *priv, union ecc_error
>   * @stat:	ECC status structure.
>   *
>   * Handles ECC correctable and uncorrectable errors.
> + *
> + * Called after get_error_info() which
> + * filters out non CE nor UE events. Therefore
> + * stat->error_type is always XDDR_ERR_TYPE_CE or XDDR_ERR_TYPE_UE here.
>   */
>  static void handle_error(struct mem_ctl_info *mci, struct ecc_status *stat)
>  {
>  	struct edac_priv *priv = mci->pvt_info;
> +	enum hw_event_mc_err_type type;
>  	union ecc_error_info pinf;
> +	unsigned long pa, pfn;
>  
>  	if (stat->error_type == XDDR_ERR_TYPE_CE) {
>  		priv->ce_cnt++;
>  		pinf = stat->ceinfo[stat->channel];
> -		snprintf(priv->message, XDDR_EDAC_MSG_SIZE,
> -			 "Error type:%s MC ID: %d Addr at %lx Burst Pos: %d\n",
> -			 "CE", priv->mc_id,
> -			 convert_to_physical(priv, pinf), pinf.burstpos);
> -
> -		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
> -				     1, 0, 0, 0, 0, 0, -1,
> -				     priv->message, "");
> -	}
> -
> -	if (stat->error_type == XDDR_ERR_TYPE_UE) {
> +		type = HW_EVENT_ERR_CORRECTED;
> +	} else {
>  		priv->ue_cnt++;
>  		pinf = stat->ueinfo[stat->channel];
> -		snprintf(priv->message, XDDR_EDAC_MSG_SIZE,
> -			 "Error type:%s MC ID: %d Addr at %lx Burst Pos: %d\n",
> -			 "UE", priv->mc_id,
> -			 convert_to_physical(priv, pinf), pinf.burstpos);
> -
> -		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
> -				     1, 0, 0, 0, 0, 0, -1,
> -				     priv->message, "");
> +		type = HW_EVENT_ERR_UNCORRECTED;
>  	}
>  
> +	pa = convert_to_physical(priv, pinf);
> +	pfn = PHYS_PFN(pa);
> +	snprintf(priv->message, XDDR_EDAC_MSG_SIZE,
> +		 "Error type:%s MC ID: %d Addr at %lx Burst Pos: %d\n",
> +		 type == HW_EVENT_ERR_UNCORRECTED ? "UE" : "CE", priv->mc_id,
> +		 pa, pinf.burstpos);
> +	edac_mc_handle_error(type, mci,
> +			     1, pfn, offset_in_page(pa), 0, 0, 0, -1,
> +			     priv->message, "");
> +
>  	memset(stat, 0, sizeof(*stat));
>  }
>  
> -- 
> 2.34.1
> 
