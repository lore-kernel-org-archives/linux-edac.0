Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE65B194C96;
	Wed, 20 May 2026 01:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779240039; cv=none; b=duLo/GHrR5QdfUVewdxkmTMHujBSGvukNuJtBc+L7Ao0CIW4P4e7+tWw/DaukGDY1TssoNH5qTNQFGzoYCGL0xbm6g3eWgK4y2bamr5fs1ICdhKnC9l8SdXBnhApvf8p7Ph0EBPG87UNOwg/ML0ewhbIBAw52YbH7orpSFN8wnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779240039; c=relaxed/simple;
	bh=IC+bylevJaINvxr9ZyeQUEUBZilaA3yCKMn1wmBYeXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s14BY3ialpM4LVFHIFnJXBozqChovVQUgo8/lvOIlU1K6gtR0fMWoN77tHYxM8Er5t9eBJAMSMiFyTlpejuArCZCrld/tlyW6p2ftTwGASKfJN+RyujwQs/sYUdzHwAXWuXMJTRdEluZ0ha1fZYm1l/FGyT+IOlcT2eYwLspjk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZL1OtJn5; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZL1OtJn5"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 97F0740E016D;
	Wed, 20 May 2026 01:20:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id b4ahgT49SlYh; Wed, 20 May 2026 01:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779240016; bh=eIofd1xtrK4btstbNiN4J94kE4L4h8Yh6La0sO/crgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZL1OtJn57FIIFdO7GEQPe/sHRUTp9zK6bc08BFKWUc0jxhXihhYpylSNsmpmKhUvR
	 Ex+1lLWhxk9dDZg9aY2mUTiwfQN5eOiKm/TfHX9qbBcjtsJ3TU2B6VRaKvu75d7v81
	 s97AvhNDYr6pkWQ+s0RiRrFOSetRPGQQ+e81q91LARPq5XIPrY+gwQM+fb3Y8ZHeKZ
	 5dB9jH8BQwU83ZiJNHPjStCWuQljKk6RzqBO5Xs/xV+U4CpLohSsz2P292P6fCLUMq
	 lStVOF4bWTskWFhoyJhqB4FPXe/NETQUJUfcqB7vPK1rrL7IoAiBhWZhGdfY/DK1L5
	 Syf3ua5fPRY/eZdVPewM+j/lyhYbJxz6TZrSZ1QqOFWuMKv+U1/r4J7vbzuodj5mg/
	 6qVvrkpNuGRdmUdP2O5tTQRk4LFFC7S0LRULNxWIuCslWnqygLNPaNvhrNkZ5x71G1
	 dzaEyLpiIRSxmK3JAfe0pWjLl9cHbfaOHvV6ZUp9t6/A5A2i64r0Y2RgmF40dt6kAm
	 lu7vZJ3LBXgDTJiaXt9OoeW5QtiMPWMRmn26FrRngzAPpYlrclQDVtFKCm/x0wl50o
	 hXhWGBiMgp+SonHgjg8QdQV4zfyZnL4S35eXzUFwnNGZGT+UVrXXkTUGxKu4CgN9ky
	 EOo0jDFv8IoehIuRunwrB3w8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:8116:5be8:f847:a2b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C11F440E0032;
	Wed, 20 May 2026 01:20:09 +0000 (UTC)
Date: Tue, 19 May 2026 18:20:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] EDAC/altera: Guard SDRAM irq2 retrieval for Arria10
 only
Message-ID: <20260520011932.GBag0MJA5NQkiMl3lc@fat_crate.local>
References: <20260515050444.10380-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <c3af86b8-7187-4299-973a-d89ca0d52e9a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3af86b8-7187-4299-973a-d89ca0d52e9a@kernel.org>

On Fri, May 15, 2026 at 06:41:05AM -0500, Dinh Nguyen wrote:
> 
> 
> On 5/15/26 00:04, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> > From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> > 
> > Guard the irq2 retrieval with an of_machine_is_compatible() check so
> > that platform_get_irq(pdev, 1) is only called on Arria10 platforms.
> > 
> > Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> > ---
> > v3: Fix commit header formatting to follow EDAC/altera: prefix
> >      convention as per maintainer feedback.
> > v2: Move irq2 = platform_get_irq(pdev, 1) inside the existing
> >      of_machine_is_compatible("altr,socfpga-arria10") block instead of
> >      adding a separate duplicate guard around it.
> > ---
> >   drivers/edac/altera_edac.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> > index 4edd2088c2db..ee6ced033f2c 100644
> > --- a/drivers/edac/altera_edac.c
> > +++ b/drivers/edac/altera_edac.c
> > @@ -347,9 +347,6 @@ static int altr_sdram_probe(struct platform_device *pdev)
> >   		return irq;
> >   	}
> > -	/* Arria10 has a 2nd IRQ */
> > -	irq2 = platform_get_irq(pdev, 1);
> > -
> >   	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
> >   	layers[0].size = 1;
> >   	layers[0].is_virt_csrow = true;
> > @@ -395,6 +392,9 @@ static int altr_sdram_probe(struct platform_device *pdev)
> >   	/* Only the Arria10 has separate IRQs */
> >   	if (of_machine_is_compatible("altr,socfpga-arria10")) {
> > +		/* Arria10 has a 2nd IRQ */
> > +		irq2 = platform_get_irq(pdev, 1);
> > +
> >   		/* Arria10 specific initialization */
> >   		res = a10_init(mc_vbase);
> >   		if (res < 0)
> 
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>

https://sashiko.dev/#/patchset/20260515050444.10380-1-muhammad.nazim.amirul.nazle.asmade%40altera.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
