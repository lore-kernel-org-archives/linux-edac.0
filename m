Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15763B4E87;
	Wed,  1 Jul 2026 21:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782942026; cv=none; b=UX4i+eCHAc04kRIXAMQaqhPVSfrRasOpt7sdvaudwOJkbExq+/x8KskzHBmRZo1zouvxiLiMqDX1vw7FjHQkQBLifu/uWQpQjBXCG72TA4Aw55OryBnTQeodx1wGzC/ozPh078i9DW60HLjRpK3JUarZMxT7J+XHyRI6xsvxAro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782942026; c=relaxed/simple;
	bh=x5aAaQkKYeoDO9cmoQ5+LyRnV3gcPKBhWmaZbdDNFW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUGquSgFep3fPpdC54BS5s44Mw5FmjQy+K1WBALVVTyyQSUsFeNTi/b09wmhaCYEwqfj1M/6tDCVLOTEcvjamFSuMeu+3Z2WTNpwpcNon4Jokkaqu3Kx+/E8Xi03PoTRt4pa1NdDTmQHRO49qfIR2B3zYOU0CJjNM12hdCOadU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Uhq17h5/; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Uhq17h5/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 16D4D40E01B4;
	Wed,  1 Jul 2026 21:40:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LoJEvWBV30ys; Wed,  1 Jul 2026 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782942012; bh=GZly7ofhtagYpM6UosAgogxhSB1xQy4a6MzAYrb2VFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uhq17h5/CoxKTVGUyZHl0NcPRVCFzKa/NyiC6t/aoQy6PaPRSKAKHDMEG++hx2l4R
	 PSM6xYhj+qklXucWKuW49Av10rqz/9xJ2QnN4KFvo1yQYPIAkjUyeQmFG1gJwXI7CY
	 ADRkvl5AB6uxdA7rQ7HD/Syr/FwJ9W0/mw0XO66FFcKUahUlNniNGT6MhvBxRbSllL
	 3b/9dn9NCQt/8uYz2VhuuWrZL2WAcLzphaWisOQUMNH251pXap6TfM9LWL0HszqB3g
	 Br0xJcLukoUNMwtWxpc7Am4/I86xj/ApXjdLuilo/QxLlfm65cAZLUWmuW74TK+ada
	 NqaPM3diCreIfkvfECF2Zi+H/GvEFEgsYBlvhh9uTVxXldwinP7vmqWdSDXBIIAvYp
	 qpo3evpyuWbPv5tPTkrm1NiBkGBMS/vw7SO9hTQjiD+YJjITDVNDYoFR/0qHvXjdJW
	 NIB85beYnhMRTU6kHF+1IRHRNeUAx1DgeRNgbPrPpJQ0Jbulf8vSopHOJzEaea63if
	 k2/fq5U85isZugvDwakhpND0DUBZNPTnV7mY2F7b4d0icIdW4i8PICvkD6GS9MW1zv
	 is5+CfHUm5TX7C+mxuhFE4Mkh3+kQhVxOhIJYplQOsmCpYEa4QJf0lp60B7fNzryxU
	 5nAQid8AXpuIZsa9wRplTsmA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 74AA240E00BA;
	Wed,  1 Jul 2026 21:40:04 +0000 (UTC)
Date: Wed, 1 Jul 2026 14:40:01 -0700
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/versalnet: Pass flags=0 to memory_failure() for UE
 errors
Message-ID: <20260701214001.GFakWJMcM3nZgQ1ddK@fat_crate.local>
References: <20260701095040.4139675-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701095040.4139675-1-shubhrajyoti.datta@amd.com>

On Wed, Jul 01, 2026 at 03:20:31PM +0530, Shubhrajyoti Datta wrote:
> The MF_ACTION_REQUIRED flag is intended for synchronous exceptions
> where the consuming process must be killed. For EDAC-reported errors
> discovered asynchronously via polling/interrupt, flags=0 is the
> correct choice, matching how other EDAC drivers invoke
> memory_failure().
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>  drivers/edac/versalnet_edac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 97ec05d68bbb..d1af5e175f7e 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -464,7 +464,7 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
>  		pfn = PHYS_PFN(pa);
>  
>  		if (IS_ENABLED(CONFIG_MEMORY_FAILURE)) {
> -			err = memory_failure(pfn, MF_ACTION_REQUIRED);
> +			err = memory_failure(pfn, 0);
>  			if (err)
>  				edac_dbg(2, "memory_failure() error: %d", err);
>  			else
> -- 

A bunch of preexisting issues:

https://sashiko.dev/#/patchset/20260701095040.4139675-1-shubhrajyoti.datta%40amd.com

They need to be addressed first along with everything that is waiting on the
ML. Then new patches ontop.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
