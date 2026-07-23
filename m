Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8322175A7D;
	Thu, 23 Jul 2026 19:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784835878; cv=none; b=VK3yP/ye6Xrh3YZO5qwgPWIqor5mmRmp3uR6j148zwCzSlQyWKDwYo+S0OioZlMUptwGj8v+RLHWnj3bnnCGVuUNnwnZMxkIht98u3eWnuREpD60I7LPCcvNcv7FNe1bUte/bXeWdZ5pIrSnmlEN8vzkNL/hgpARFwWKsjQ2RGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784835878; c=relaxed/simple;
	bh=s+BXkNDaYF5MjZh6YkQ52gLqONkHRfkvXkSVnWN/dTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxU9u1WYizIKYzEK//0Wq1bpkB0g4gxeU45/rvQnkKM+9CU5UarVse++/HpsNyccR0LfCiSPeJtZrF0SNs8vXqKvlcidWaT1zBrQD+2lUKWCcv++ZGb/wO2yqDN/Xgin+3qhiyOd9AYzArQ453f+WwvJYE86aAxrufDxOlbLSIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MQuWqOt4; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MQuWqOt4"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A5F9140E014C;
	Thu, 23 Jul 2026 19:44:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id C6EJLK6xjcRB; Thu, 23 Jul 2026 19:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784835858; bh=HKOpKrXMKalCtRmZui9w1egs82pTtvh6125mPB+gO/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MQuWqOt4VWlWCpUmPw3VPRG6iPufu3dk/DUHPsU4j0dVUAXCl+YzFAglXdmkbv7iU
	 mPvqGLagKTsog0bOI5k/BqMnogSxaY1BkFh6TW8z8AY5GftSqsHtUpBpYbp+mfQMWb
	 cY1uZY1UeNDZMDVW4RYlDi58w7xmvZjVyLc5pkuw3lK0sW8awxcyzJ60huobRLuBHV
	 B3TDHblHP/CIyNGH2NHyGa9p55/0BmTvIBlU5GJu3bzMy5OgMugeFunT9NG1raZ0G0
	 18mT2k7zZPhDG8koQdk3lvZWZl5d62Z+/1TYQnP7F4kJk5fsIQdyd4qBnQ2DAE+bNK
	 dHLKY1MjA3Ay9ejIUAfOMMscyTdLs2Xa3ut8t+8kbmwpZcY49KKLrCWWDa3RYWSkNZ
	 Mx6fKEv27ajn9CRK9e4RQbtVH4Q5ME51A6xYKqHEeg7RBeBUR2Gt8F4OpW578CHsJ7
	 Pt5Wum7rh+62nqTMKq9HjCkjmat9CMoneUvZx6tTeU6fiF6zAstu2/oKCjvoBqGFzy
	 qtLhX1anv5mXQOm31HI5sKKzWfBunbjeFM6cf+TZp1ZlRmXr0bShinQWikiqpav12n
	 w4Kqu4eapIEql0oPWrXlHX6OFSZD/O5LhsL8Pxh6xPA4/BWFFDtKg9mE98iwEs/0zC
	 5BBi/dhh8rSp8nS7BoYOSMzQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0949740E00DC;
	Thu, 23 Jul 2026 19:44:10 +0000 (UTC)
Date: Thu, 23 Jul 2026 12:44:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Julia.Lawall@inria.fr, Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>, cocci@inria.fr,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 27/36] RAS/AMD/ATL: remove conditional return with no
 effect
Message-ID: <20260723194407.GDamJvBzzMfuyu-NTQ@fat_crate.local>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260723184538.3888637-28-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723184538.3888637-28-ekffu200098@gmail.com>

On Fri, Jul 24, 2026 at 03:45:29AM +0900, Sang-Heon Jeon wrote:
> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
> 
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  drivers/ras/amd/atl/map.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/ras/amd/atl/map.c b/drivers/ras/amd/atl/map.c
> index 24a05af747d5..4ec9333ef745 100644
> --- a/drivers/ras/amd/atl/map.c
> +++ b/drivers/ras/amd/atl/map.c
> @@ -771,9 +771,5 @@ int get_address_map(struct addr_ctx *ctx)
>  
>  	dump_address_map(&ctx->map);
>  
> -	ret = validate_address_map(ctx);
> -	if (ret)
> -		return ret;
> -
> -	return ret;
> +	return validate_address_map(ctx);
>  }
> -- 

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
