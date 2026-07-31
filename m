Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6AF48986C;
	Fri, 31 Jul 2026 02:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785464149; cv=none; b=lteVagOQMQWAvM5ygcrLKpFVA4Mb3GIRE08ru97aWjssoMuZ9v8n4KqJMcezoirgGOfuQNfALVybMQFsfc52kP+oiZhiIPjKeWjYz4JyThebanv65vucSn2AJtY0hj2VFc0THSz+TxZqGCzwgHdhrogNqjSe8cOA6sgF32ZZKmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785464149; c=relaxed/simple;
	bh=2UM10BPZTHNgNtTGkq7XAMGoGBi8oiKtt8v/3oz6rR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyJj0d2LPxX2lm6ISTIgfhvKwfiBJD5/MmBl9KaGYI/Wi9YQlEhyC6vFgvD6wyKlm2rz/49JdOumHkDMm4SN7F4tlitb5mofhx4TkngJzMj4p8XLB9zzIHD4Xp7UiI3StxHSeKdRivNDYRNO2cZxicsd2hISdEhQ0xmzeakAJ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XSusl/JR; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XSusl/JR"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C494340E01CE;
	Fri, 31 Jul 2026 02:15:45 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bj03s-gKjqJJ; Fri, 31 Jul 2026 02:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785464135; bh=ktJlEaNWc4j9C6lEcsRkLFYZsUQ9UXeFaIMH9whgdpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XSusl/JR3xM/V9Uqn8NEcRke/CvRgz6+kMnHdXx3uGIjuCEqcOK16H0RiNdjgPbVi
	 2xGi5378/Ytb0KkS3B2jE3u/A9Q+i9ObAE8B5pK03JcoQj43yJyhMbSZcMtQbjzqk2
	 pzn9b9HaWQHTLMzuwBnj1VgqWT66r7ZfkOeTTs8yHzSbKWB8orlmJkLlc/Ofoonpn9
	 8hGY9S9rj20AwgJn1cz1EiQRpmjlgnoQIv2vjT0elFToSMTfQyJyaYq15kOWZQOI93
	 N72L8h0lSquSDMz0nqefFeq5FmssC7EC9AbSHRbF6VgNkI70RGsjdtu9Z7VJ7WSJZ4
	 PC28CuOUYZmmrxAOwvIZXnv125sj7S4+RlfbO32H9ApJVoHxcli/IhXMxDXCfbYfaP
	 C/pSdTFD1xOmDHl0Fb5IExsHUNO35ekPeYcbdERKSVogiMMtvparP9FogEidJsLZul
	 Ps121cTVNF7Jh7+2iy07GziSFWYXFtR0vlKdsGgKs9HDOa5wsnX8jede5X14xSAF0M
	 UxHt4qjVhQKiisxlcyjzj1CXqYSs6gvfl0in3ULXxgEX0B/YO6l+7q70os+iFeFiqx
	 ReSWkJ+qOvXHhyDIJJKn+voASNGUVOQkPFpmr2nUvHP0t0epFMfCRK8Z2gBSSNUkIq
	 3UOG3ew0NYRn0v6MJVFWbrHY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 42C6E40E00B8;
	Fri, 31 Jul 2026 02:15:31 +0000 (UTC)
Date: Thu, 30 Jul 2026 19:15:28 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mpc85xx: don't use devm for request_irq()
Message-ID: <20260731021528.GMamwFQMXHuufR64w7@fat_crate.local>
References: <20260731011213.1211378-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731011213.1211378-1-rosenp@gmail.com>

On Thu, Jul 30, 2026 at 06:12:13PM -0700, Rosen Penev wrote:
> Use modern irq acquisition APIs to avoid having to call
> irq_dispose_mapping() since there's no real need to copy the mapping.
> 
> Use non devm version of request_irq() as IRQ need to be freed before
> edac_device_del_device() to avoid a use after free issue.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/edac/mpc85xx_edac.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)

You were on the thread where we orphaned that driver because we have no hw to
test it on, right?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
