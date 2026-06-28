Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4B129B77C;
	Sun, 28 Jun 2026 23:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782688670; cv=none; b=CvVPvBdwZbGuHqU6RIvde0019u/0o1NRmkVJJV4Vlp48YUSXHwCI6kdDp5+yti3u8/+mZr0MmWvP5a10hdjo291cb9lvNtAhAyOq1yguEB0svYnNuSx8VC33o8Mae9HeCSdhV9jnOJScqoEM8nYV66OlELKlwSLCjxHBqdj4tjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782688670; c=relaxed/simple;
	bh=umPLaydlrv70HwW74e+F+J3csmZE7YsoaoWTcp1gMnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKqpzzbjbifQgoFEFm1ZC0+9JmlFE80UcPJyUToh3+ePRSstAdG+07c9k2ZkAMzOVlVZVkVm8Acs53DDMVSS4eX939qcFiwrVNbUujMAUyKqYRHsostl638TGzzNJjyIzdwGIsI7ceS4Hpl4IJ1H/d7MECl2V4isncck4GcuF1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RihYZDdl; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RihYZDdl"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 483BC40E016E;
	Sun, 28 Jun 2026 23:17:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4xwU7X86fgSN; Sun, 28 Jun 2026 23:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782688647; bh=CQwZpkqK8xLu1gqiGT/QSrfFeYJGhlTP7HOb3sF7NQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RihYZDdlzm/SFIcB5tVovxMBNrFdsffLAfoJVYf+reOOInKsIH5LdMvlQSLQucx0b
	 9ZIfA24CaYYr6FQGDinV19PFn5Aof0nDiBirt8/fgssJXduaasZgEYXvjBsiia3NSL
	 XLg8FTpRYmCOgNDz4oehjv5IYUK/0ESTStws/RvKqT/auUkIIO6lcQcH7et3zJaXtm
	 eDE9Sm1zRPBQrrPoa3aL2gBCdQHfv0ioy9MhZG3+KeusQve4OJ37K4DGmxOUx7ab9D
	 Q5zW+2z2lYatQHb0/QCiUSuAgV3RBSjX1zbLy1Htxxv60r0PHuKGVuitqTUlWh2iy1
	 9E0yOj1HPQQsg91eQUE/AIJD3/l+J8B9k+tXXedCqzmjcM45Tf19jkEBWWEQ+fkIGQ
	 o3YjVcrMH/UIP40LWEdnRRb8Eo7hcG0f/vrPOxuq1FqSLUUz4FGiju8+/qrHHWI4cz
	 dW9rno5dSbr2YEoCh7QJB++p7dtlTfmhBN7U2Hn8OPgLAbpsiAJ/T70qf2DIaahOOr
	 y/iscMEOo0yblJXzruoO+krCUXhehOrRG899IAGXKjnFlq5gTMeuTAzTir3Jxz/4Fw
	 qUZ7719PXJXmY6T7FWKb93hopKDiOr/eAkKfC9C5yLe6o4I5XUdJ8zL7Q2d8JOJBg/
	 0lMeeusukCy/iLma+w1b+OKA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0B55440E0140;
	Sun, 28 Jun 2026 23:17:21 +0000 (UTC)
Date: Sun, 28 Jun 2026 16:17:18 -0700
From: Borislav Petkov <bp@alien8.de>
To: Johannes Thumshirn <morbidrsa@gmail.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org,
	Tony Luck <tony.luck@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mpc85xx: Use platform_get_irq() to get interrupt
Message-ID: <20260628231718.GAakGrflyHuHxoSHra@fat_crate.local>
References: <20260603191908.5618-1-rosenp@gmail.com>
 <16fb1ca6-447c-42b6-b4f3-aade5ce7f90c@gmail.com>
 <20260610173352.GBaimgACY4q6PkkkUk@fat_crate.local>
 <ef8107c1-92e9-4540-b88f-0191d1b7a4e6@gmail.com>
 <20260612153839.GCaiwn_7qOic4KLF8P@fat_crate.local>
 <add460c5-0403-4054-a85a-a1c76925def7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <add460c5-0403-4054-a85a-a1c76925def7@gmail.com>

On Fri, Jun 12, 2026 at 07:05:47PM +0200, Johannes Thumshirn wrote:
> On 6/12/26 5:38 PM, Borislav Petkov wrote:
> > On Thu, Jun 11, 2026 at 07:55:35AM +0200, Johannes Thumshirn wrote:
> > > Yep fine from my side
> > From: "Borislav Petkov (AMD)" <bp@alien8.de>
> > Date: Fri, 12 Jun 2026 08:35:50 -0700
> > Subject: [PATCH] EDAC/mpc85xx: Orphan it
> > 
> > Johannes doesn't have the hardware to test patches on it anymore and
> > TTBOMK, no one else has shown interest so orphan the driver, for now at
> > least.
> > 
> > Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> 
> 
> Acked-by: Johannes Thumshirn <jth@kernel.org>

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
