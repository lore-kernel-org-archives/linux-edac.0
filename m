Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0D37B01E;
	Thu, 14 May 2026 11:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758504; cv=none; b=C6O1wrCGy1MxeHMxw6cQrHLYM3/bZTjJz+v3E/Z8GWD/8J9wZZTtv714Tvjsuir9R9934Fjo5zt0CYKvSbngCaU01OknWMFBLpFa2Y6BJwwVqLGAJQ9FZjZGkpgJ8Fn4gOUA4QnTt4btzK9leiXUQZrtdf6sNSlUEAabOpvbNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758504; c=relaxed/simple;
	bh=vWfwiHf6n8ji9L18EdNV4iO81KUJ4No4sc98cpnFMxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0HbakpF9NOO9zWBPni/twYI64elUxVyxlDFf8ijYoMlNscLnP84hzH/zpr0whQ1L4S3N34NjIZwCvf68F4N3SGdyPwn02F67K1nQYKV/ajH50El52yReW+tk4WdaitJbGu6iJfFMmLxXKRu2mLg+XPMNYxZjByL0pNITLNcKPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=fv3A+KGA; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="fv3A+KGA"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AA12540E00C2;
	Thu, 14 May 2026 11:35:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PZok1zR-qXma; Thu, 14 May 2026 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778758490; bh=rIqIybb5iUJXheAS12Jv5v9xaXfS8NsxbLiWRy37Y/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fv3A+KGAz9h6ivc6C1osrMTm9OotvAok1uZyC3wi3ehGfwgP6SUDwuSNGw4RAXlLC
	 ngxC48MqV2vhsm5qraCDLLL6bK/o9lWiR5WbPYHV8dz0WtYXgors6CyDK84BriQt55
	 hAGlDj3glQqFqZfYKI11NWKtHgZ8HBHO2ovVmVgxj33Q6UaOyPVyEOgR/IpHkXi3gB
	 p9t2tBsRhEptn5j8NwFoPNrwCbkkmFDpUhzM9A9Pov/EfwA9Vjh2ZltVUNa2wU4bJD
	 vu9HmtZHtv/kKKW6QUwmJgBogmN0vzPv6elYCIOkBypTtU2hkGYWzpOXyooERfZ5pE
	 fmCLmNoaGH0VPrj9o+169yEbW1sgAih3tasa4swkisHvIOtuBZk67KrABq09IAqIjI
	 gri5MZUZPMelYsj9HCETxW6KZxjmcRkT8ySat5OgHUezJlo9zSLVNrKotE67N7zA64
	 PfvB/nIdXyzugzuFiwaUeKh/oy6b02S6tcZzRXDJwvfEYHS08bTh0ZiZUq0SiBeDd9
	 0hZT+27EpOnjxJc6t26RMd6GH0ijOEABStCWktSA0dJR4ERQmDA5kJh+VjopL5baYT
	 W5aCtnuaYmd1FUYaA8DEvJblmaSQ8LGMA8zxi8PCp8ZztbZT9hSKaVfTT5xXv3/NYG
	 eqRQf9/xqW8Mr5P2pqoENB7k=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 6207C40E0032;
	Thu, 14 May 2026 11:34:43 +0000 (UTC)
Date: Thu, 14 May 2026 13:34:42 +0200
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, git@amd.com,
	shubhrajyoti.datta@gmail.com, Tony Luck <tony.luck@intel.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v3] EDAC/versalnet: Report PFN and page offset for DDR
 errors
Message-ID: <20260514113442.GDagWzUpqA3Py2gw4l@fat_crate.local>
References: <20260511103529.1853270-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511103529.1853270-1-shubhrajyoti.datta@amd.com>

On Mon, May 11, 2026 at 04:05:09PM +0530, Shubhrajyoti Datta wrote:
> Populate the EDAC location fields when reporting DDRMC CE/UE events.
> 
> Compute the physical address from the decoded error info and pass the
> PFN along with the offset-within-page to edac_mc_handle_error(). This
> allows user space (mc_event consumers) to correlate memory errors with
> a real address.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
> ---
> 
> Changes in v3:
> Update the comment for DDR address
> 
> Changes in v2:
> Refactor the common code
> 
>  drivers/edac/versalnet_edac.c | 36 +++++++++++++++++------------------
>  1 file changed, 17 insertions(+), 19 deletions(-)

https://sashiko.dev/#/patchset/20260511103529.1853270-1-shubhrajyoti.datta%40amd.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
