Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5764376BD7;
	Mon,  3 Aug 2026 16:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774589; cv=none; b=MJPYlB8pHcZsJL0jAwB8bC2zUCh8TXdM4LgIChL+vL8N+n8/GQibRSBF9YEVZOKRuAjLFcProCzQWgtKqWSvF6d1UJuq6Rao2EwCEiVub+gwc9Kw1r6oAJYTW+pUK22P2lWZ+0ne2g854EDbzc3Pp8Zhs8XsNqc802oF801OP+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774589; c=relaxed/simple;
	bh=AwnHlRr2fT/X9aOt+yWWkznLfBRRb9QmCuohFZ0XUtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARcRjoedFLl9osnCfybyr5s3furwOuaIS9BlVryxhvDkRWNBDwFHf7yr4KevX3UpzDdHWIJ9jMAlZ2HmemkdLe4tojHrA52LqDWKta65wb19b+oQIRaAAjAiF1hDlyMryApTw8u0TDHCGvmr5DzEdntKia6g0HEp67SkbChZ9Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QASrpWR+; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QASrpWR+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8578E40E0171;
	Mon,  3 Aug 2026 16:29:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0QNi1DojAFb4; Mon,  3 Aug 2026 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785774571; bh=QFbe+HipFd8jbJ6PWvgn2djJlJL9TgeVgdRGdSFQxPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QASrpWR+65gf1gs0JAqL45tRcJzGHFoAmcDbfnKYEre2fdYK9vSdtNfcKOf6+dy3y
	 9N6lbsJrMDjSG8LSfWtv1We0psn+FMUg6eLY+Q4jqlCtFD7CyJYI295y+Ov0hLChPD
	 jN30bkOoJX3aWjUbBHegr4+eyLSvX6iA0oS2UnVoRxs0kk4bKXzJCE8NuFr0CT2sLX
	 AcfmJstD6eO4OvFAx3AJ2rYyhYksM9TmRMhPf6t207rjL3yArBeb97gfyJzn0qiztP
	 8Gq4Ie0BsxEmN/FzaTXj7rw13RwjFgZ4j6UnlFTeT61jZDKLRMR6Mx7agxzrQ0u2Uz
	 6CGeDFuhRP9BRQrvKxO0AeuQ/qQZEUcpEvAfVgIYDSduG29MsgrIJsdTZRrUU3gLft
	 WyqlXKsUcy+ZI2YJnp6zo2iNS+RzYhNQdivzJN3+YVzXv8vQrROvjcw+VRrpFdIm7+
	 ZDTdNKOzPT0ERFzxoOMQ0k659sqWzGOSeOCk1HB+u0vH87hrxQWbtE+jqQ7MaQyk5D
	 xrst9PzbrHIlLl+Zd9tuz7z6hIlD36TWvRAfqwfHXK6OMEOjxCjHDwFOQNlfD+nFbe
	 GaE7X2P0MX875FACMK+HTwyQZ08qGX8vn8KQrMGfzvEVeX5G3HclnZbwdmbyB0BUAo
	 ckFbK/OgEV205pcOk/OzSCto=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 236CE40E0140;
	Mon,  3 Aug 2026 16:29:23 +0000 (UTC)
Date: Mon, 3 Aug 2026 09:29:20 -0700
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-edac@vger.kernel.org, git@amd.com,
	Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] EDAC/versalnet: Add NULL check for mci in
 remove_one_mc()
Message-ID: <20260803162920.GAanDB4FyqT3mLMm-U@fat_crate.local>
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-3-shubhrajyoti.datta@amd.com>
 <20260802184623.GAam-Qf9-yes1DkNkl@fat_crate.local>
 <CAKfKVtFtFmUKwnWY4xGwcRQG+qJ2UdK6LK+3QX=Ukvr3v4Y7EQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKfKVtFtFmUKwnWY4xGwcRQG+qJ2UdK6LK+3QX=Ukvr3v4Y7EQ@mail.gmail.com>

On Mon, Aug 03, 2026 at 08:14:17PM +0530, Shubhrajyoti Datta wrote:
> The current driver assumes that all 8 DDRMC controllers are present and
> indexed contiguously. If there are only 2 controllers then the bus
> width will be
> unrecognized.

I just love it how you folks evade the question:

"When will that happen?"

How real is this issue?

Give me a proper scenario when this is possible please.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
