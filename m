Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789863655C3;
	Wed,  1 Jul 2026 03:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782875412; cv=none; b=anQYIDLPKlguoTBPY/P6lxfYr4HXjVEc2ZTXAd1PUKZ0WCk9OMMD7+nsiMaa2wCIXgApKkOrt4YkZSTaRKq9kPJNO66305siTr+aFs0Lg5vYC7zyQewrI6J6mh2Ju/OjD31AHWgGU/hC3QQIG21JFZbfu4Okxd8N4qoUz+dka/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782875412; c=relaxed/simple;
	bh=bY93S6nIikqjsIg/lvuuUDdySQkc/rbYDTLyYhGfHuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKl06lIauuxDPKnprfKoPYIqZ0egAN7KZBGKVGq+jT2Lvme63MJtsrG4Fz9Uz08AQPNrtMOfmRIR4Rs5Fx7F301sJUYoFM4UQfIuGKxv0pWKKwjKnaPy1ltgfyhLxZO22rP9Y4lNUM70/nFSLhJI9VGds+ET3kfuZ91KjPm9KPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=T5IL9zKQ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="T5IL9zKQ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7E34A40E00BA;
	Wed,  1 Jul 2026 03:10:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5LaeBfkyzURs; Wed,  1 Jul 2026 03:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782875397; bh=WasgGeCTO608o9vsostCfw6Lgr7KXOMi/bYzXCMfbfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T5IL9zKQr/n7m2TzJ7jnRc4Ssc+mWwkJYBiec8oxM4PQyZT7V03i9kVywfYdDE3Pk
	 SEFBxz35nEBG6admgYKenF0bweeY3yrMOdtWVj1f1oFvPX4lge27OZgZqD6OFfWrGu
	 6T83fQ2V3V433OleSen8gkGX4/TaaaZyGth/iz9wus2XSQ0xt81yzoRteHY7zXOT/P
	 BxbkM/nEEzgQVVIlJOEsY1uRb4TIucxfDGdNqmsLN9+yHlBT9DJ2q5SRiQUnfyBXT4
	 81w/Pct7J4p6M44ntqhC2gFwLsekXjWX1z1evfIlNKSeY97Bylw5ifuAWMpGk7KmlG
	 d3jNB3Haft7ptRM8rCBS0OZOB6gHYVdXWrc3YjAuXD+PsHRwcKrEru1aBY073rWgUv
	 mpvKwkBVvqcLVQN7HGy4z+22RNyP4cvxXOVGE9U3jJOM7FZWhnTfSL277XimbJ6Etv
	 V+LbJ0IS61Cdz8zm5Eqm5apyoMoWBMIyI5eHRtDKBtNQjOBJa0EUiRv6TM4KkOX5Bp
	 akbWWJY6DoePFTLmdGoGUJ0Tm9NIxf+KiU8b8OOIjwMXTbuDj8mbUPgrh2CwG79v+K
	 NFfqkbfBm6HWqbYYQy5nbnicCSxfaVPo9n9Mym+kDBwMtGM8tGF98uFyOBMk0ny6fj
	 GdepODCB+NugvPuhShItx5cU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 382ED40E00C0;
	Wed,  1 Jul 2026 03:09:51 +0000 (UTC)
Date: Tue, 30 Jun 2026 20:09:47 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: yazen.ghannam@amd.com, Tony Luck <tony.luck@intel.com>,
	Deskhmukh Shrirang <Shrirang.Deskhmukh@amd.com>,
	linux-edac@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RAS/AMD/ATL, EDAC/amd64: Only load ATL when needed
Message-ID: <20260701030947.GGakSE-yoo4xkrzyT6@fat_crate.local>
References: <20260630052610.808707-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630052610.808707-1-mario.limonciello@amd.com>

On Tue, Jun 30, 2026 at 12:26:05AM -0500, Mario Limonciello wrote:
> From: Yazen Ghannam <yazen.ghannam@amd.com>
> 
> The AMD Address Translation Library (ATL) will attempt to load on all
> AMD Zen/SMCA systems.
> 
> However, only systems with DRAM ECC enabled will use the library. Other
> systems will fail to load the library and produce an unnecessary message
> to the user.
> 
> Remove the ATL module dependency table to prevent autoloading. Request
> ATL to load from EDAC once all system checks are complete.
> 
> Fixes: 3f3174996be6 ("RAS: Introduce AMD Address Translation Library")
> Reported-by: Mario Limonciello <mario.limonciello@amd.com>
> Closes: https://lore.kernel.org/20260305154528.1171999-1-mario.limonciello@amd.com
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Tested-by: Deskhmukh Shrirang <Shrirang.Deskhmukh@amd.com>
> Link: https://lore.kernel.org/all/20260307144910.GA113343@yaz-khff2.amd.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/edac/amd64_edac.c  | 2 ++
>  drivers/ras/amd/atl/core.c | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index c6aa69dbd9fb1..01b1e569d98e9 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -4173,6 +4173,8 @@ static int __init amd64_edac_init(void)
>  		goto err_pci;
>  	}
>  
> +	request_module("amd_atl");

	request_module_nowait()

I still am not escatic about it but I guess that's fine, considering that we
really only want to load it on ECC DIMMs machines with actual DRAM error
producers successfully loaded.

Oh well.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
