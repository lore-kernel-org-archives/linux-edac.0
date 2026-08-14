Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097452F3C10;
	Fri, 14 Aug 2026 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731374; cv=none; b=ZiEYU0T0UfT6ZKraHG2NzBBgQG7hDmzPHXH+hMKb9kh7vxL/JU63o6ZLYKqDVwF2Fq6aKdU4N3AgdSmQ6DQpSSR/NpbHvLztcrYIGt+yRT00zTee4EooZkc/xbEndKDgPQHymI+PNR5y2MBwg01WXi4FzInF7aCaxhsvrNU/awg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731374; c=relaxed/simple;
	bh=fmWzr0jSbD6BW75wkch0Drev3ElsXy9y6TYpmc2rafM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ae/cDRUY+TPpM5XPMLQhMo/wldcP5pHKRjopguS3F+G1Y9X8+BPKvRXLA4RBNm9GcmsHjbqAdHtf6VyySEJKUUSQ+uUfWmprpdCX8/RCbWyuQBkOZXFGTUjMhvHd7VP0Lg+TlU0ImrQuUNoi5e/Sfv2ZrlAvTJM69h9v5soMKSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=N0uDw5gU; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="N0uDw5gU"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A3C3D40E019C;
	Fri, 14 Aug 2026 18:16:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id t4lrvG06H_IL; Fri, 14 Aug 2026 18:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1786731358; bh=Q6JZJoEg6zXgmZ2UTd5hVnLdKgm+IIvm5u59TpwX640=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0uDw5gULcwTWlD0gP2CQh7t0sPF9Rvu5yCArnvD3/VlceN1WF3U7PqF54A0IE1k0
	 lerJ26ZBtx9JBziKBJq2p3xibTCQFfwAih2UBESn9pKd3QwdCVb/KJ3uuns3Kgaryf
	 mjP6QPiQPCLDgdxPj3AXO9jWYMAPZXMd3teePLJTPq9a1IK+KJ/37qvKyB8AAy1fnk
	 pX4fN1L148TOV9EgYcPvVJxc2ok+ZLogeymhlGkWjQHY5wN2gf5rLy1/WeLuhmlUl4
	 eGv80BZxTy9ZBiohAQuvrl/Yn2sYNKKHJuXOT2JgZ2v5mvPKh48GHNVyGULCIEy+O3
	 wj7ptvbvrN2jUMUYa2nTSJKz9lH2SQHeqkQ3ye9DQbVCdHigMNoHiGZOrPLuIrdQ0K
	 YE9izOtIa2+n/YSpakQEX6URVtIV+fizrBvTSCvo3K6U3C1W+AKe2JsSGAQZe55wk1
	 MprYZdCTgoLXWiOWdHTKYLIgxJv7cEv2fHSNGU8yJVyeBdnDLQcYouyQ5SaaFV53uB
	 xBZ2a08I6vhY99bra8+Pz3O7yC9rVcJFILJkAwuSuo3VDtGiRf12Qjk7JsyB09HsHw
	 5gdNBkttaP1dV7GlmFGrozyZGw9S/KRN13aqSoqSm7ICWhjzea86XcKYHPWHU7VnD3
	 lL+Yl4EXjEbJQTd3wHfnTakE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B913740E014A;
	Fri, 14 Aug 2026 18:15:52 +0000 (UTC)
Date: Fri, 14 Aug 2026 11:15:49 -0700
From: Borislav Petkov <bp@alien8.de>
To: phucduc.bui@gmail.com, Khuong Dinh <khuong@os.amperecomputing.com>
Cc: Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/xgene: Use platform_get_irq() for IRQ lookup
Message-ID: <20260814181549.GCan9bVSKYJ4Dmj_Sp@fat_crate.local>
References: <20260814045347.13841-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814045347.13841-1-phucduc.bui@gmail.com>

On Fri, Aug 14, 2026 at 11:53:47AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The probe function propagates any negative return value from
> platform_get_irq_optional() and aborts the probe. Therefore, the
> optional IRQ semantics of platform_get_irq_optional() are not used
> here.
> 
> Use platform_get_irq() instead, which matches the existing error
> handling by propagating any IRQ lookup error.
> 
> platform_get_irq() also reports lookup errors itself, so remove the
> redundant error message from the driver.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  drivers/edac/xgene_edac.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/xgene_edac.c b/drivers/edac/xgene_edac.c
> index 9955396c9a52..aae7e03b0573 100644
> --- a/drivers/edac/xgene_edac.c
> +++ b/drivers/edac/xgene_edac.c
> @@ -1915,9 +1915,8 @@ static int xgene_edac_probe(struct platform_device *pdev)
>  		int i;
>  
>  		for (i = 0; i < 3; i++) {
> -			irq = platform_get_irq_optional(pdev, i);
> +			irq = platform_get_irq(pdev, i);
>  			if (irq < 0) {
> -				dev_err(&pdev->dev, "No IRQ resource\n");
>  				rc = irq;
>  				goto out_err;
>  			}
> -- 

So this driver received a new maintainer here:

49b35cd5e7dd ("MAINTAINERS: Update Ampere email address")

and I don't remember seeing it. But ok, water under the bridge, that's looong
time ago.

Sashiko reports a bunch of preexisting issues:

https://sashiko.dev/#/patchset/20260814045347.13841-1-phucduc.bui%40gmail.com

which need to be addressed before anything else.

So let's see if Khuong responds. Otherwise, I'm marking this driver as orphan
too and we're done with more obsolete stuff.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
