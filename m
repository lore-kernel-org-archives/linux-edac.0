Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743AB8C1F;
	Fri, 31 Jul 2026 02:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785464965; cv=none; b=HJoFbfSdy8xwb7gN7fTp11hXGyiyxzHYRoecJa7kYTKXakDw90ZlPj9dL0hgF7ybhOM0j2C9jtYv89sCltRbNEKzOpkYY0OPhiDLl77QQiEEkcfJ28L543dvJW88SgGwfflM408lO0FemgCWO58ZJr3X6CGoW7lLHbTqsxQmT70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785464965; c=relaxed/simple;
	bh=6pYxsUZehJC8ro+NbsVcxdZm1v3QxjXvHuXFQupyHgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0/HvDo0Y+u/z5T00PSo2xx5cQBSp+lMJ4FPr+kaYt2D4WUGVlpSMPdvknhEgt7QeT75JHd6WuTQOKsUgN4QjH2dehh9nI29lh6OOv74O9xCeugQgp9HHvuaqRq43RA4FZeKLG1Gbc2736prLywUln2v8VMKByXkuKP70SOfVlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=e7ZtD5kN; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="e7ZtD5kN"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3F6EA40E014C;
	Fri, 31 Jul 2026 02:29:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QkcLnvcNnX16; Fri, 31 Jul 2026 02:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785464951; bh=1sB0jqLjwS21h/XSayp+OK4nt0HLJSEJzxtB2mgcB0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7ZtD5kNcgcQGqnfeaH3eazd7UsRBtXpmHNQ2qybbqQScers2Lz5rh8NynV1wzGtP
	 +4Q3ziZIRZn7ohrY5f2M2uXkNaUMA+weFsoxFXhEz/xgxeUbHnt3/BqIJjyv1une/i
	 GPho2cYGi1V6Pef//+6r/qk4NYdJGNOKejip2Rn/rxRowL62JlOHmE98Ppuv59TX2p
	 /T9Y23w8bj1x52fo98tMFe5Bldbe1yp6RfVZPMP7A9pcXPMWEZwvMlSyA/06UeK4XH
	 PUxnYK+e3bDhsHLL9WBpMt1Zji5eImOGJeHiiCUACW9I7J23ZKhXPI97Wp8+MYyiV9
	 1JyQFOmOk6LpPVsIjvgTxC92Cg9L2H3qhRf8rIQJjHwh10E8Ei0rIvJGiTlXXWZ3ym
	 xXn1Kux8QWrYbtZNykq6j6JT3SbCrTOazWPnwufxewPSKA1LTdDOtSveU8Cjp3046Z
	 5FoD4Qe42Moz7tRVvqQh6x4ongXvA1rYu7iiIeKMYRvP0MWy7+Tt846sEsmM+J4vQ6
	 i9CurrGXeUx9dU9Wx0LQe6NVZaAsfA9H/olaYujVFDWcxjP8PvZF9D8XE5Sw9Fo9SA
	 3wvXyzZfwCw+CAkz0PKUhPAOkgjXRHr/pY0ZuqM9GozCsm3wHZJkrKKOD4QMa3j9La
	 KpQsfLtDQcT68lChuwb2jxl0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A008540E00B8;
	Fri, 31 Jul 2026 02:28:58 +0000 (UTC)
Date: Thu, 30 Jul 2026 19:28:55 -0700
From: Borislav Petkov <bp@alien8.de>
To: Michael Walle <mwalle@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Tony Luck <tony.luck@intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Takashi Iwai <tiwai@suse.de>, David Heidelberg <david@ixit.cz>,
	linux-edac@vger.kernel.org
Subject: Re: [PATCH RESEND] powerpc/configs: enable CONFIG_RAS to fix EDAC
 support
Message-ID: <20260731022855.GNamwIZw7Fz4Yhk__S@fat_crate.local>
References: <20260730105546.3658570-1-mwalle@kernel.org>
 <20260730185620.GDamueVIGV-8iIzozX@fat_crate.local>
 <DKC6Z5YGBF2O.TAJAN566BN0L@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DKC6Z5YGBF2O.TAJAN566BN0L@kernel.org>

On Thu, Jul 30, 2026 at 10:35:20PM +0200, Michael Walle wrote:
> I don't get what you are trying to say. CONFIG_EDAC_MPC85XX is
> enabled in the that config already.

You mean, *because* CONFIG_EDAC_MPC85XX is =y, then RAS=y? I guess that is
true for this particular config.

> It's just that the mentioned commit broke it because it removed the "select
> RAS", while EDAC depends on it.

No, that commit dropped a select statement which is good in its own right.

> Still, it's already enabled in that config and it somewhat recently
> got IMX9 support,

Who got IMX9 support?

> so I guess NXP is interested in keeping it.

I have not heard anything.

> That being said, I have the hardware, but right now I don't have
> much time personally. 

Welcome to the club. :-)

> The best I could do is "Odd Fixes". (I also have two pending patches for
> that edac driver, yet to be posted to the ML).

That driver is orphaned and no one maintains it now. You would be the only one
who is using it.

I can pick up well tested patches tho.

:-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
