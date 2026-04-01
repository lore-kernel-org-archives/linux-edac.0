Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303EE329C48;
	Wed,  1 Apr 2026 05:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023096; cv=none; b=MU9eAz4PUm83lppV+chOtJV/rHq/hAumvrG5GS0e7c5MkjECN7l2tjm+idKZjqKwaQjzUGl8KVGjR0nillJaKAvsxgAC4ubxQGeGLZ/2QsnX0f02PHPukaysTbbsxgPjhT9MAbwqFIaO7yEn9P0gENg8VFlSYuibSwlHlXkYe0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023096; c=relaxed/simple;
	bh=Rm5QjpkTgZaqKznG6/JGEWu0aN6Fi+7g9PcMZtA0cw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScD93tFAilkSm+JNgQDgc5kTcQ/F/XfBscWqB3RzTstHzs4OoKpErUiVKcbUoLgiz3o+j9qNYRDrOLgNVpPfl0i6RBMstWqOmcaom9hHs9oVo8kktDr0lNdBro/xO+siPFSDiZNiX+AkJCiHNwpyKxTraBFI521f5Fr1z6/Hrcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=a21U04lB; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="a21U04lB"
Received: from [192.168.1.37] (unknown [4.194.122.144])
	by linux.microsoft.com (Postfix) with ESMTPSA id C9F4920B6F01;
	Tue, 31 Mar 2026 22:58:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C9F4920B6F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775023095;
	bh=rrfUNyslPGGkwu2ZUemnPlo1X+gugxP3awesS3kK8Ms=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a21U04lBJVnPC6xHinySkoVab2c05EENvNFAVb2JilKjP8gN9e72GNTq9Emm/2Dfd
	 eloZHHnrjTT7s3uTn5DG35TYWHxz/YxnocUc4XXT/pbjjCpqIrxn2UOT7rcNClioKw
	 ot0G3vAKV8VHFWXpd8JVCpt4Vv60ypZD5ZDRUdRU=
Message-ID: <c4a7a3ec-cb87-4edc-ad6a-32dbed15197a@linux.microsoft.com>
Date: Wed, 1 Apr 2026 11:28:10 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EDAC/versalnet: Report PFN and page offset for DDR errors
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20260329124400.4064739-1-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20260329124400.4064739-1-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29-03-2026 18:14, Shubhrajyoti Datta wrote:
> Currently, DDRMC correctable and uncorrectable error events are reported
> to EDAC with page frame number (pfn) and offset set to zero.
> This information is not useful to locate the address for memory errors.
> 
> Compute the physical address from the error information and extract
> the page frame number and offset before calling edac_mc_handle_error().
> This provides the actual memory location information to the userspace.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>   drivers/edac/versalnet_edac.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 915bcd6166f7..66df090245be 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -431,8 +431,7 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
>   {
>   	union ecc_error_info pinf;
>   	struct mem_ctl_info *mci;
> -	unsigned long pa;
> -	phys_addr_t pfn;
> +	unsigned long pa, pfn;
>   	int err;
>   
>   	if (WARN_ON_ONCE(ctl_num >= NUM_CONTROLLERS))
> @@ -442,27 +441,28 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
>   
>   	if (stat->error_type == MC5_ERR_TYPE_CE) {
>   		pinf = stat->ceinfo[stat->channel];
> +		pa = convert_to_physical(priv, pinf, ctl_num, error_data);
> +		pfn = PHYS_PFN(pa);
>   		snprintf(priv->message, sizeof(priv->message),
>   			 "Error type:%s Controller %d Addr at %lx\n",
> -			 "CE", ctl_num, convert_to_physical(priv, pinf, ctl_num, error_data));
> +			 "CE", ctl_num, pa);
>   
>   		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
> -				     1, 0, 0, 0, 0, 0, -1,
> +				     1, pfn, offset_in_page(pa), 0, 0, 0, -1,
>   				     priv->message, "");
>   	}
>   
>   	if (stat->error_type == MC5_ERR_TYPE_UE) {
>   		pinf = stat->ueinfo[stat->channel];
> +		pa = convert_to_physical(priv, pinf, ctl_num, error_data);
> +		pfn = PHYS_PFN(pa);
>   		snprintf(priv->message, sizeof(priv->message),
>   			 "Error type:%s controller %d Addr at %lx\n",
> -			 "UE", ctl_num, convert_to_physical(priv, pinf, ctl_num, error_data));
> +			 "UE", ctl_num, pa);
>   
>   		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
> -				     1, 0, 0, 0, 0, 0, -1,
> +				     1, pfn, offset_in_page(pa), 0, 0, 0, -1,
>   				     priv->message, "");
> -		pa = convert_to_physical(priv, pinf, ctl_num, error_data);
> -		pfn = PHYS_PFN(pa);
> -
>   		if (IS_ENABLED(CONFIG_MEMORY_FAILURE)) {
>   			err = memory_failure(pfn, MF_ACTION_REQUIRED);
>   			if (err)

Nit: pa and pfn calculation can be moved out of the if() condition.

Irrespective of the nit, the patch looks good.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
