Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069693ACA75;
	Wed, 22 Jul 2026 15:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734530; cv=none; b=ii9Yy6uVASfmfElSz2DnLXfT9KnAkbwIY12zUHnCc3H5EySbLLFpHUyTGloLtEfkSvkI/csGO0S9VH+1nImrY6s+Gqn7jBKa8cOf0QnO/poVp8/2qpNsqEhRyInBZhRZvyggqEtbJMa1fNYMtU3crkROXweklcyiCW5n0AfGjew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734530; c=relaxed/simple;
	bh=XTf/DJyvg9QI9GSCkltAyIOtc4Wks3Rat1Y56dyDhfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLxY2aNa1xSjtlVUVoIwlR9QPvhIdVrLIL/mRQ0IEt9xjhLigfJsddVvX+VF2SIQKWONwfv277EOZqN4yBGg0p2PYAG/MSh8IxmJIvkv2m+h0e1x6JEZPcJWGbQUwzxHFgJpEJ4K9Ls+cDVU4UmfmxWtFV3cg+vgTP3fN+oeBU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=faNcpSa6; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="faNcpSa6"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5362940E00C4;
	Wed, 22 Jul 2026 15:35:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ut7K_oDegzWP; Wed, 22 Jul 2026 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784734514; bh=+XBZRhKpknaN9ie61rDFV9v+KJvFVfjWzRKaC3sDmO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faNcpSa6xVfsnQIYl/CUXMMs6ASkhRB0yoDgBH9DwQupc0uTRFB/F9/LJoPzrKXSI
	 x+2wiROamekYhcg5CsD6Szr6hqbF5Wl29eVEOfxYDPhZiOjFSaAdDRlMxFhPN3JsqJ
	 eLbheNeZguE+iajoxqT4O8h/V0AXeTS/Qj1U9QAVyW8PmXUYDPr18lDOhMyKbq41AC
	 kke4bENmeypiNDMI9PiOJ/nm5+6wdanIDXfwbV2Fxg5p4WsP7ketpZ4LohCRnaQq74
	 hryCQIHdi5nHIG5yu8awSK7Qayh/3vk4ASXTvLr3rZW7GAF3Ysthkob/CVgbgnRkpL
	 UnYRvhedHLUAHVNx58EekH+DLpMnwz8sIqUUn4PTlAXqx6UbqHeZaUwKTbqaSk3KAC
	 R3pWCKc2nxL2oc5Ys+yOPdd5MzCy7P9FxzWYW4VfUCljoNsw68yHDbSS+D+2CdGxnc
	 Zr3goeUiS6K4u8iajxvSpu1G1uoRFeR3J2Y9LMf0UF84C5QHrdFgs2pg1k2Mg+OO0P
	 QjwXmBGOTAXtQy998c6+3b0Y2dNP7Ztb4RuOrmqQJuUrh/v8bGyGIeSZpSmlDmoQzu
	 k3Y1cHRuKklPNBS6G++YxFNF+bjmP8Ku9mdc5ikN/WOiZKKWuM9m8JM7X+XFZoguzP
	 N2bKi6buZGkgVPY8LaiGpX0U=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F01CA40E00DC;
	Wed, 22 Jul 2026 15:35:00 +0000 (UTC)
Date: Wed, 22 Jul 2026 08:34:57 -0700
From: Borislav Petkov <bp@alien8.de>
To: Pan Chuang <panchuang@vivo.com>
Cc: Talel Shenhar <talel@amazon.com>, Tony Luck <tony.luck@intel.com>,
	Stefan Schaeckeler <sschaeck@cisco.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andre Przywara <andre.przywara@arm.com>,
	Robert Richter <rric@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	"open list:EDAC-CORE" <linux-edac@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH] EDAC: Remove redundant dev_err()
Message-ID: <20260722153457.GBamDjIXWetAs3s-U7@fat_crate.local>
References: <20260713131510.332386-1-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713131510.332386-1-panchuang@vivo.com>

On Mon, Jul 13, 2026 at 09:15:10PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"),
> devm_request_irq() and devm_request_threaded_irq() automatically log
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/edac/al_mc_edac.c       | 12 ++----------
>  drivers/edac/aspeed_edac.c      |  4 +---
>  drivers/edac/highbank_mc_edac.c |  4 +---
>  drivers/edac/thunderx_edac.c    |  4 +---
>  drivers/edac/xgene_edac.c       |  5 +----
>  5 files changed, 6 insertions(+), 23 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
