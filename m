Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FB9CA6F;
	Sun, 12 Jul 2026 02:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783824936; cv=none; b=s3tN1eObKz7/joq+rVeGxbXvvUMPfxafunyktl2ntTu0gUqORnr5rQqkquEthmDQiwVfnfDV6Sf5Jgt0kcguLCKyY0ISTGgSUmz0FSvewDpxXh/FQwD6UoDc1twvaNJCdBbnUwK0Vq4GqCN2UFWGSv10LE8yd3JAikSoaA0I9HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783824936; c=relaxed/simple;
	bh=KLUBxkVzJj2Rtgo+1qonCtfBDWbXfLwJKfHQw6xh//M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+LIgkd3jT/jjOlKjaRTwY0igUKSrti9FBBbOR6KJa13q8lvw4g84dusYr5vwkfUfExinmznp4+yBR3Zu+RR3JTM6nN7qAiPyCNlV18dKV5raI0ca84Js06Cz/P+SVWSfahyhYJFaBDQoG5ZfmEpvOWW2dM/APca/8ekTwChkNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=X+igoe0u; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="X+igoe0u"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6842840E02B4;
	Sun, 12 Jul 2026 02:55:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tjkojJKHkd8Y; Sun, 12 Jul 2026 02:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783824921; bh=+prnW87ASzRJuXnKLmuWRzyU7Wyfz3ypPQpZ7FTE2sE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+igoe0ub/MlHPf8ms+dHg1/tvLGhfOgMXC+psvXNztX7StVgvP4Ad16NwERpUmyL
	 Y+D1CDRuWUH5K8UT42YSqLggshTpDLmyfj072Orgkuar4cvlUvz6bTLDfolgt5P+J/
	 29R9v3MKD286I1kPuJiFEvBi0e1MV3iVRFx8o4h9dh+9+g/IVAYGc+NBdo9ag9ujGx
	 CBaczYqVUQ1IJC1Wwn+coGObg6G3GfR8ukGFLo4v8Shwp+Tc151ZuILnZJNa4M6OE8
	 WalokLYXQo32Px/Tg6IzQoJJQiUI+Ny584qpeq1J3Bm3W1+l9uVdY+NAEkk9rUVdcN
	 aGKzR/KpLDudyDPfp0jvWC2a3VrvvYYzt/8pVoTbe9T5cSd1/1ief+f7vGj6nR3H/l
	 ccz4HcahO/sij3RqWVzOoxd5zalrFpcWByO/gpADWPNpwpnaS4eI0QLotze5T3M8uY
	 93ULetWvIinz5CFKbp34GVPmty/UF5hABDKZnRzdctS2Pqz3o9AD7AaNUSzPsr6deA
	 vrCqkmP2auG861mvRjVtPi4PBd8df9Eoo+GXq3B2EJhKaY1JitVVONMIFdc1Dy0106
	 pp1dhaSoeE9Tz0ir6t2dnI/Su3aYkHjpwRipngiBTfHlUADIpvZZEkqAmRevxDSSHE
	 3llbtf6omk8/eBUdY+NMJQUQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A8D5640E00C0;
	Sun, 12 Jul 2026 02:55:15 +0000 (UTC)
Date: Sat, 11 Jul 2026 19:55:12 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rounak Das <rounakdas2025@gmail.com>
Cc: dinguyen@kernel.org, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] EDAC/altera: remove remaining CONFIG_64BIT ifdefs
 in the DB-error path
Message-ID: <20260712025512.GEalMCEN6bmWh3imvY@fat_crate.local>
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com>
 <20260708091135.94114-3-rounakdas2025@gmail.com>
 <20260711000801.GCalGJYR1iaup7oCwY@fat_crate.local>
 <CAPYTKoMLXheN9HjQEPNtvK_JCJfZY6HabrC27UGVnHzC2zDbGw@mail.gmail.com>
 <20260711010038.GDalGVtqJ6MDh6fYxV@fat_crate.local>
 <20260711023527.GEalGr7yqKN65ftvjF@fat_crate.local>
 <CAPYTKoOUhmmJohfQXo8hQkcc5DLOatO9E-wrpimTu6XrJVYN3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPYTKoOUhmmJohfQXo8hQkcc5DLOatO9E-wrpimTu6XrJVYN3A@mail.gmail.com>

On Sat, Jul 11, 2026 at 09:55:35PM +0400, Rounak Das wrote:
> The merge resolution looks great, and the builds are clean on my end.

Cool, thanks for checking.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
