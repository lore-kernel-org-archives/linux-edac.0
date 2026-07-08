Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D043E8359;
	Wed,  8 Jul 2026 20:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543710; cv=none; b=tYZRSGuUvw+9g1EUuQGBRdfyZkrQaKwTgnKmI9ckSu8pvdgzfJlQwpz9Z3JD54L+Gwoi3dG7veI+16F9CTE2ZSOIxCqoq4CvZKpTmUCjccmQFdF2aWwueSwaM9ED27PYUlMmqK0Hp7phaF89TMuwT2r+w08O5lnBunAobYvCfb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543710; c=relaxed/simple;
	bh=Q2KrtDEMaKxuympfQkIZvEjpLVtNnvJL+xEc/VEnnlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9p5X08SjDjXKIS5PnYFrz4bVrB9JZHRJb5XaMevenKn4DpRmKl69gHaxH+eqeZzKtPdGYm7aTw5YMPh0AwcLmnp3IENF5jBNcGY9Q217fvvFk9N8xLD022KIxSVZSAShXwtyzwC6unMSZfXuyNE+cVb58FvQSJx4rf2tCQPuvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AM3Q86d4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AM3Q86d4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95B91F000E9;
	Wed,  8 Jul 2026 20:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783543709;
	bh=Ix77npbjtk5yxW8lT/mU7oCJ5RBDYQmPht+2iflq9k8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AM3Q86d4EGvV3dGAzMsbjjiWP+ip0kcklVyOITvGcjsTEPIURGvn0WGW/McplEvJG
	 uuzPzKyzH0YlYgWmD038WOhMfTN9L+XZF0hMbgwn1JjO3eaZ9VCeS3ws50+5ILBT+N
	 z9lNBIe8RDqlbmiWxu/xmOEg+hS7K0wzdhGZmiL8vI9hGwVAiaHt0vrhFTWUg5W8QC
	 JlZZcicjMsUGEOQTr19yympOspxHdNI4ASUbWUqlza5SLnZRkwah8SrypiKZouB+9f
	 fsyepCIWwfXad5F5Tm1SxIcn09xYIsBbxkTYYtIP2MgDGoQME+hBP3cWCgePXeaYrD
	 CggWIxfSjBPAA==
Message-ID: <3ccdd6b2-458e-4ba7-aaa2-3d309362e8ca@kernel.org>
Date: Wed, 8 Jul 2026 15:48:28 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] EDAC/altera: remove remaining CONFIG_64BIT ifdefs
 in the DB-error path
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com>
 <20260708091135.94114-3-rounakdas2025@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260708091135.94114-3-rounakdas2025@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/8/26 04:11, Rounak Das wrote:
> Convert the last two CONFIG_64BIT ifdefs to the is_s10 flag, so the
> whole driver selects behaviour from the ECC manager compatible.
> 
> s10_edac_dberr_handler() is now built on 32-bit too; the symbols it
> uses are all available there. It only runs when is_s10 is true, so
> Arria10 behaviour is unchanged.
> 
> Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
> ---
>   drivers/edac/altera_edac.c | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 24bdf7f5bac63..1d1e2b5ca14c8 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -2058,7 +2058,6 @@ static const struct irq_domain_ops a10_eccmgr_ic_ops = {
>   /************** Stratix 10 EDAC Double Bit Error Handler ************/
>   #define to_a10edac(p, m) container_of(p, struct altr_arria10_edac, m)
>   

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
