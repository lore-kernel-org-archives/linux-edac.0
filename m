Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A3E288C0E;
	Thu,  4 Jun 2026 01:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538090; cv=none; b=Ndx6ybqCCxDYYg1KIVzxeNjVEnx1tCWNiKmVLrtddnysGl3FhV1UJj4dkuBAjixlUnm74RN6T5Re0Wv6DjAm9vwZA85sRXi8l0imJquYDAn+uaPboZEN6cpoSY6ZzESPkfDbhkM1OfAAzMmxYIwNo5VEbtt7skD0WymeEHeKMok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538090; c=relaxed/simple;
	bh=R5cvsyQwIHowN7ctWPwQb16rKp2OAkvrJDW1pQx21O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQeT6eId7hAmbq1Z2iFFk4Ah/Y9eZVSVaXvA3rG8RqcrY2e7csOpt4sLbsxrhlmuN0wl2rFNaEN1q0zp2aXc6Lgo7dHFpbBmrfvbhi5UD7Xd3Mk65m9FFixrCq8fNTtPbxDIDkRizmVxhRXtQ3bGZ952ozEtI/HtmWcaArtt0uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=T2zRaNlE; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="T2zRaNlE"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3E7AB40E01B5;
	Thu,  4 Jun 2026 01:54:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MxJDkLJjTcQ1; Thu,  4 Jun 2026 01:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780538077; bh=hsjaw9nYiprL0QttzOzotOZZv099MluPsmcWZr7NM8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T2zRaNlEN5np/7WN8aIOIujQiUMjj3sObuNbfkvpjpXfrMSXCqztehZ9//C20DuSL
	 tp7y24vCDOmV6wkCA7iyTYxsbHPXpfkFqpSD9InYIvn02D8aXSyQOJpP7EAMlOJ8pR
	 p2M1lZ0k8EqluHbXC3XgohAKqwS415afG2yj0djKDl3s34q0/9pTL4Hf46PtgSG4TT
	 w1rUrO5+gLWZoKz5UR7oG7c670ER3lVuJpwwkGEThBqg8MJgE/UaoPGqF8TPFdIjZe
	 Eu74RrGZZVmme7zceaxzCfdwdYQZFVVV4MvgoYZRapPy7msVRetZe4onCMy/BPk6Hm
	 AeejIx+jSKg/5r9qMBwu853kjK853Yk02OOX9RhEgURPkttHYsbVkgoAK1ayGsczsF
	 G1BsyIVFlvE7srkXevWprjiQ0SzfxGWQ7lhP85EJFw8+lEYrvnwoN55GsffMvvOyiV
	 OYsxRS7usB+rd+F8oMjc80eW7tx0TzNJyF+Xx572nyg5w+GhoGNpDVWdEJpQbgdqrr
	 Ja7O5f4kuV4zAFhg5wAwn7wciP7FGAw49HWQ7o98wHjUwsBSOk1BM0QG/DDD5DdVc+
	 WamdAgu7RKaK/MyrCSZ7IUqUiaqAOLEy35EfPn4MnM/TEuTY9za038TPon/Q7kDC8t
	 ftkBPCucaoiMGYTv/kkbN7Ws=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9E6B840E00B8;
	Thu,  4 Jun 2026 01:54:31 +0000 (UTC)
Date: Wed, 3 Jun 2026 18:54:28 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-edac@vger.kernel.org, Johannes Thumshirn <morbidrsa@gmail.com>,
	Tony Luck <tony.luck@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mpc85xx: Use platform_get_irq() to get interrupt
Message-ID: <20260604015428.GFaiDa1EV5la6L5ATr@fat_crate.local>
References: <20260603191908.5618-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603191908.5618-1-rosenp@gmail.com>

On Wed, Jun 03, 2026 at 12:19:08PM -0700, Rosen Penev wrote:
> Use platform_get_irq() to retrieve the interrupt resource instead of
> directly parsing and mapping the OF node via irq_of_parse_and_map().
> This is the standard pattern for platform devices.
> 
> In addition, platform_get_irq() returns a negative error code on
> failure, which is now checked. Since we are no longer using
> irq_of_parse_and_map(), we do not need to call irq_dispose_mapping()
> on error or driver removal, so remove those calls.
> 
> Assisted-by: Antigravity:Gemini-3.5-Flash
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/edac/mpc85xx_edac.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

I'd let Johannes comment here. AFAIR, he doesn't have the HW anymore and
I don't know who can test this for us so...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
