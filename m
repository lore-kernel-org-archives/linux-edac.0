Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FF340B381;
	Tue, 30 Jun 2026 20:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782850497; cv=none; b=a9uf2VzGg2Rdv7qtWMqHIM5SI2sgV/ddQ8Ao1V3KTxfx710dMQ2MAxIoqQ7P1cetzbHoJfUVMa0T5d/Ryt+uxh6Ge172tLgju96WRtdUhYZ1tA/YgarHSzK24UHS/E9V5YvgVRMKSSJNdVxrCm3N4vltRDJwoadbPYjjRp+g1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782850497; c=relaxed/simple;
	bh=jQIf4Bdetqt8/zlR2/G2jRn00nevwZtUNpsahAN1D+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohp+qjXjcvDik/TBf747o2ACkTlORwHwIXmUS9hKvSpRrgWhIu0+0c6a2YsvPGifW8jItnb2i94xvEHh+rLTn+TQKZ2zGdz/eB/5hTao8EomCP73404686LBC3M/+KxbiVlvZsgoUUfsztSE4ALgglI8Kv1z+lakut8HXXYaQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=eGBfB69H; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="eGBfB69H"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B678440E0140;
	Tue, 30 Jun 2026 20:14:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id plkA5XbvNzQy; Tue, 30 Jun 2026 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782850483; bh=L/chkKnZyDCRfJL3DzSYEdFQ9bHm0X4hu896lWii7zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGBfB69HSJetRXDrbTEnNLk0bDdy82avonjQqFxs45MI6v97BUHtTryUd4Cs9IV7I
	 D1fFNqZu7AxQRwwVp9i6bSZqnkfkOXK4udK4sBCft574u7HgF8v6Zq+02thz/IpNrJ
	 x9yRuehYeBfXGOmL2rKmYAiguG6OUsPgJkb+4W1bYG5/uCZzCPzoVLyezYxBvwZJsR
	 RLtS9oOf4p64iwvLvgyOm7n/9gKy6aM+rtBXcC8MQhC5f/G5D+DSc504Mnugoq8n47
	 Rqdf18gmZf/M5YJg9vQQupCFNnEtt1pCaHNwTelCmZQpcDOY9s/xL2Q44S4LcvOF4D
	 axsWYLu5TwTtuonBmkLF04lY5Mm5ClrQ0Ss+Gj9YM8Bo0nU/gjRb31UssuSkvZz1Bc
	 wkIWu59u/YY0ZU6DI8oagbb7hvGFBK/zIfTrBCjBYKgEZyCXfoMkzD3j4HOSoFChnP
	 NFt3yNvfZZORNu6l2UKtAkexBkuZcwJyxIl4zrjC+dSkcDuQavfImR5bIWQ/5nexfA
	 0A2zbqwbLlWlhyCmcvvJmfvWJKQd2M8pK9vG8snWXAt6hVMHG2NPKQmhIPSmVId1fJ
	 9JrKr3PohLbgsKsZY1quOtUEmxtPZHZ40sBBgH/SCWa66g50Aspu0ofyUJq23WZSl9
	 RuIdwgqhTvDNPfpcoiFeuTTk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 56D3340E00BA;
	Tue, 30 Jun 2026 20:14:36 +0000 (UTC)
Date: Tue, 30 Jun 2026 13:14:32 -0700
From: Borislav Petkov <bp@alien8.de>
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: tony.luck@intel.com, james.morse@arm.com, mchehab@kernel.org,
	rric@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] edac: Use sysfs_emit_at() in dimmdev_location_show()
Message-ID: <20260630201432.GCakQjqIo9v89ATYw1@fat_crate.local>
References: <20250619202133.11843-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619202133.11843-1-abhinav.ogl@gmail.com>

On Fri, Jun 20, 2025 at 01:51:34AM +0530, Abhinav Ananthu wrote:
> Replace the use of scnprintf() with sysfs_emit_at() in
> dimmdev_location_show() to format the output into the sysfs buffer.
> 
> This change improves clarity and ensures proper bounds checking in

Avoid having "This patch" or "This commit" in the commit message. It is
tautologically useless.

Also, do

$ git grep 'This patch' Documentation/process

for more details.

I'll fix it up for now so this is a hint for the future.

Also, do not top-post or use HTML mails when replying ot the mailing list.

Some info about the kernel development process to peruse:

https://docs.kernel.org/process/development-process.html

> line with the preferred sysfs_emit() API usage for sysfs 'show'
> functions. The PAGE_SIZE check is now handled internally by the helper.
> 
> No functional change intended.
> 
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> ---
>  drivers/edac/edac_mc_sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/edac_mc_sysfs.c b/drivers/edac/edac_mc_sysfs.c
> index 0f338adf7d93..1b611650de3f 100644
> --- a/drivers/edac/edac_mc_sysfs.c
> +++ b/drivers/edac/edac_mc_sysfs.c
> @@ -500,7 +500,7 @@ static ssize_t dimmdev_location_show(struct device *dev,
>  	ssize_t count;
>  
>  	count = edac_dimm_info_location(dimm, data, PAGE_SIZE);
> -	count += scnprintf(data + count, PAGE_SIZE - count, "\n");
> +	count += sysfs_emit_at(data, count, "\n");
>  
>  	return count;
>  }
> --

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
