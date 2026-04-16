Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E35361DAB;
	Thu, 16 Apr 2026 05:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776317537; cv=none; b=ntd05u320GS50gMZ/lsYeEiD0svG9ZfWDYNKTMvDDtUJ/5/at0ZOUQctSHNShNneHd7I2cw3KIjdOCpNidlisy+ilTDe3ioJxzGAnxra4TKc4CLCHxIPsbLDmnYcWRIjHga/6/ontCpUC0h35gk7qwJjOT5ylGWvJsA9xgY1LwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776317537; c=relaxed/simple;
	bh=Ks1/f/JIlVROmNJ8gD3WThBCMXySwbHZbSfFcpJ9c6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bv6zlXWvxQ3B8aHtnOjbIwBtKlWaDTkbRuqjehtxygpAG/zPG4sHmsSF16d2y3X0DG2ZAjDURPvXrjoWpvApHiYYMKzMXxskDUiV+bCxXUah3ot7BvsZzXEHNDpRUdwj5B+kuQH4tHQaUNwwkkIbitsDpxfiArO48AWo7Ml0ips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=U5yt3Xhk; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="U5yt3Xhk"
Received: from [10.94.176.138] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3B74520B6F01;
	Wed, 15 Apr 2026 22:32:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3B74520B6F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776317534;
	bh=41b0m0DcgqSm7P1LIR/apCp4ESLP+xdC72UD9R+aMg8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U5yt3Xhk0deeF2e9jF5f8TWPG1aDRet1pXNQ4pLPluet/AuawV9Urk2OjLK/QP0XB
	 zS7Tfb6hl5+figRvF9NILlOd/qvFqUajvcSVuf0peHkk7gaL22BeyN94Evh4iGmOno
	 uuVg/4N0CXbJ4kZhhumrt3ymmmhy1RMEqaS1BXI4=
Message-ID: <181bc2a3-bdff-49a1-809c-51854c1f7953@linux.microsoft.com>
Date: Thu, 16 Apr 2026 11:02:09 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EDAC/versal: Report PFN and page offset for DDR errors
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Cc: git@amd.com, srivatsa@csail.mit.edu, shubhrajyoti.datta@gmail.com,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
References: <20260415060239.733200-1-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20260415060239.733200-1-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15-04-2026 11:32, Shubhrajyoti Datta wrote:
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
>   drivers/edac/versal_edac.c | 36 +++++++++++++++++-------------------
>   1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
> index 5a43b5d43ca2..18045f96610e 100644
> --- a/drivers/edac/versal_edac.c
> +++ b/drivers/edac/versal_edac.c
> @@ -414,34 +414,32 @@ static unsigned long convert_to_physical(struct edac_priv *priv, union ecc_error
>   static void handle_error(struct mem_ctl_info *mci, struct ecc_status *stat)
>   {
>   	struct edac_priv *priv = mci->pvt_info;
> +	enum hw_event_mc_err_type type;
>   	union ecc_error_info pinf;
> +	unsigned long pa, pfn;
>   
>   	if (stat->error_type == XDDR_ERR_TYPE_CE) {
>   		priv->ce_cnt++;
>   		pinf = stat->ceinfo[stat->channel];
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
> +	} else if (stat->error_type == XDDR_ERR_TYPE_UE) {
>   		priv->ue_cnt++;
>   		pinf = stat->ueinfo[stat->channel];
> -		snprintf(priv->message, XDDR_EDAC_MSG_SIZE,
> -			 "Error type:%s MC ID: %d Addr at %lx Burst Pos: %d\n",
> -			 "UE", priv->mc_id,
> -			 convert_to_physical(priv, pinf), pinf.burstpos);
> -
> -		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
> -				     1, 0, 0, 0, 0, 0, -1,
> -				     priv->message, "");
> +		type = HW_EVENT_ERR_UNCORRECTED;
> +	} else {
> +		return;
>   	}
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
>   	memset(stat, 0, sizeof(*stat));
>   }
>   

Hi Shubhrajyoti,

Looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

Thanks,
Prasanna
