Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490204;
	b=F/OdVazd65S1vrF4oYzwHUracIfGipdkptwddToneQMezwrK6yK+h4WaLjiQESklX08y
	 0ZY8jYvT5uwGcoRvBBNk1B+zWu3n15YxYnEMzuUFX4urJaB+nY9k6J5INdYK26knGETrC
	 Bz6EkqsknBBeIJCLaEIjxIGs+jWY9tB0wmdIFPco2MTDCbXr0nKfBC76GVdGakDS861/B
	 n/fA9iTgb0G9z5MKymW89PzQLeMZhd0X7V+xJrMys/gTRnQMKkCxEmyKfBUE0KeMN6MmA
	 /IYI1Lq//y/XaHG0E2C/95Hy3EI8DELsG/7qHr3FJ/AuwDMZRkCodL9KyV4/ScuO3dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490204;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RkloPgeYnVworbSxGLqoxyXm4gptRQR8Vz5x7cCV1eE=;
	b=JVhAvYP6mkB5ULI40WjeK0UmJSvqR1VaXMxS65pxLhJBg0EEPC7WOCotMxrvoTQQepXT
	 Gt1/pA6W9FoKBzOc1c4JX5IX7C1DErSs6+OzrmbmA9FXjyDcMUVGMPfRmxt4ejLexcbsK
	 HSAAghCAoW8FvJjo0qnXztlz6aGBLw9dY1LMSVaaFQV6QPSf3UbkLggMKyxdQkL1t/Rzz
	 OIWSR8AjAeD6dHz8r4Yo4dUarS5e5Z/+BOxVnQE5k/OonwC0P8No76Gju0JN61I7Nb5IY
	 4u7UX07LdQrEsK+SFtAEkGNE6YFMGLRaiwrZxYLPmHAXs9srM1/Bsus+ELjAbNmOASA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=aKpHQdFD;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002A5606A31E;
	Tue, 24 Nov 2026 03:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 002A5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=aKpHQdFD
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D2F8B40E02CD;
	Tue, 24 Nov 2026 03:16:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 24w3iiim0GVx; Tue, 24 Nov 2026 03:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795490198; bh=RkloPgeYnVworbSxGLqoxyXm4gptRQR8Vz5x7cCV1eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKpHQdFDKeGusPE/tOflleC18Z3OLOFKakXGrLfcmVFlY62/veNHO1AAAKn2nAAsm
	 uMYfGrsCD/E9lP/uMXltUkeb1OPNkxNZgRkN25iBQgG/Jt2gA7mi4QNT6OMemtas/L
	 PuqGYV1xT/RLV6HlS6ycx1we2CPKQy9fsN9UmwsiFYgm2smm6+nvh8apABlB1pvbbf
	 vlJUjSaVIROQGNcMXoHxFiNI+stdwmxYL06YBdIXDNA4v0VRhxj+g+88KoFzdAUZwX
	 rO0TkrnrLtkpvysxSpziIu+oMABwPrEu7lRmC4DqV4D3wcUkTrZcbRU9QcvZyDDSI4
	 v+nBL2Krkh8hF8u60GTj/x2RMnBwN8z1yzK8vYT2z/q2Nws0BF/EyMBApDbbWk3J46
	 mcQmZVPGGmXVyPkOwv0dmC7VT7Hf5bhNFPDG8YygU7ErqYUHu3P26fBe/Gt++0evtk
	 BhmrCCTRgy7CU//eJFpXudqHdshJ7eeLpU3jhAMPJz3XoA6LOhCBTe/Nd3DvzWkXt3
	 LBVI29jtSaOToLr/O+OuEudMZgMRqAXTZPBT/VCSpxEJm+D45NGQ78qQiEWFc+q3Uw
	 bOCcFtXBBVMYPZxOqhBmBdj6byw+TEwSiYc2d57I5d+vjnuS7266epc5YBB3D5Ef2X
	 dsdniRpKDC+vaRjKHlJPoNig=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0949440E02A9;
	Tue, 24 Nov 2026 03:16:25 +0000 (UTC)
Date: Mon, 23 Nov 2026 19:16:22 -0800
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	michal.simek@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/12] EDAC/versalnet: Fix use-after-free in
 remove_one_mc()
Message-ID: <20261124031622.GKawUBhv2labxD1Gbd@fat_crate.local>
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-4-shubhrajyoti.datta@amd.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118142213.100581-4-shubhrajyoti.datta@amd.com>

On Wed, Nov 18, 2026 at 07:50:27PM +0530, Shubhrajyoti Datta wrote:
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index de97b2ac45aa..2d1417135e42 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -765,11 +765,13 @@ static void versal_edac_release(struct device *dev)
>  static void remove_one_mc(struct mc_priv *priv, int i)
>  {
>  	struct mem_ctl_info *mci;
> +	struct device *dev;
>  
>  	mci = priv->mci[i];
> -	device_unregister(mci->pdev);
> -	edac_mc_del_mc(mci->pdev);
> +	dev = mci->pdev;
> +	edac_mc_del_mc(dev);
>  	edac_mc_free(mci);
> +	device_unregister(dev);

Btw, if this is using device_unregister(), you probably should simplify
init_one_mc() by using device_register() there instead of the two initialize
and add steps you're using now.

In any case, first three queued.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
