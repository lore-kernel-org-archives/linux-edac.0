Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAB01DDA18;
	Sat, 11 Jul 2026 01:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783731662; cv=none; b=m13FVuv8odDGaECBQTODBL83esB71xLkuycnTZ3Jy2QYppA2z/4PWFz47ehd/J2DsJVWEdkh44ETJx+MEh3h50qr+tu+PhMfXXeq2+vLtfWChXPomW2dFWjkvG/tcRyr2F7bEZG3HxEvRUnNU+OpWNVk2YUcbsBM8S0JWhOoh7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783731662; c=relaxed/simple;
	bh=Ez5fPkuJ4xAX8bSCY7sjGVcFuHxlVY2AqlqR/f8ET1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bt0BCH+PWxD6q3uy7crdQnfqazMKjVoKFWGrQwPMeOYlP5aqZGEISwgWoZiBr+0NB48Nyn/SjCoOVBnXZ8GKgTLrcRlCHcWhwDd3hiGKa+hFCmYnOm4SIIZtRAUsD7sdyOX2KryIjd5iAEunFx8QKQKSl9hXFE0D61TLLXmxeF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=V0IyHi5L; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="V0IyHi5L"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4B81340E02B3;
	Sat, 11 Jul 2026 01:00:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cbWFiz9ouKql; Sat, 11 Jul 2026 01:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783731648; bh=gGqHc2kmR3cNbPPiTXEzDHWzbA0ZBxJFSvUEvbjl79I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0IyHi5LLtvLBhbZwlyPDxZYxnTT6L+YwBaopgF54iDrOS7YlPUDf5uCd2x9KAyJO
	 78TnIqxOoDI5M9+MkfqFPXKfUJUSqPH60tZst2791pkfTf1q+1WxMmMKgM22n8PRi5
	 z66keWYdsq2Zwp3SXzBWmOev9Pu0oxns0CrIk73oWXJu4vOaUgCcgVSTECp/Ibf9qc
	 BfnrrJW0MZ1z1nyrBfhSffq2WGmx9FEUP5VxnoiTY9NKwPCTwUrLhYm+WAnAjNYA6i
	 dKHJu5NzrxuNCrXSJcww92/qc+DGnt7Mryj3n5el96D50dqU1EebZC82rumKRodxmS
	 670x9Fi5LXAvIIfUzjWrDM8Fe9riiriIv5uKiBqcurdMR0x1HDUWH5RCdPpCEYrPpt
	 r9+69lw7bhZvein6tMm2ev8sq1lTNZfmPQnKccf1KETnimL7bBmxYmd0PqNm10un8f
	 zo7HKsi+7ehso2qMrtGtqR7B1hh8sy1ZCyQbbBGFjY7GxQp92PYBB0luvUBl6dxUZ/
	 9LByQCNPyIsfTmidCSlFtcvQcyikrL9tbb/v2mKWFZi0CNPd/uSNRnBWbFrdn6W8Lk
	 AMoHfYdis/gxbtpU1fuEl10cOEJvucb8B12bTCuMudzPvCq4bse1aqN/jyYRkFNVF7
	 zy+Ytwgrt6DAxGG7nzBbo4e8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C531A40E0140;
	Sat, 11 Jul 2026 01:00:42 +0000 (UTC)
Date: Fri, 10 Jul 2026 18:00:38 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rounak Das <rounakdas2025@gmail.com>
Cc: dinguyen@kernel.org, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] EDAC/altera: remove remaining CONFIG_64BIT ifdefs
 in the DB-error path
Message-ID: <20260711010038.GDalGVtqJ6MDh6fYxV@fat_crate.local>
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com>
 <20260708091135.94114-3-rounakdas2025@gmail.com>
 <20260711000801.GCalGJYR1iaup7oCwY@fat_crate.local>
 <CAPYTKoMLXheN9HjQEPNtvK_JCJfZY6HabrC27UGVnHzC2zDbGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPYTKoMLXheN9HjQEPNtvK_JCJfZY6HabrC27UGVnHzC2zDbGw@mail.gmail.com>

On Sat, Jul 11, 2026 at 04:43:44AM +0400, Rounak Das wrote:
> Thank you for reworking the commit message. I apologise for the
> initial wording, and your revised version sounds much better.

I just dumped all the words into this guy:

Assisted-by: Claude:claude-sonnet-5

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
