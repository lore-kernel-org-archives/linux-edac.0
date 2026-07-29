Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A24E26B971;
	Wed, 29 Jul 2026 01:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289473; cv=none; b=gS5EB4qxYAuiVQb2ipG2rBXgmGKlaGbXBw5y0xHNY7bTvDM2Qu14PmBFqmxs7xOr7xoeo0woAdTZgSU0a9n2R8hBJVQLU+/Sh2SIbjVF1Scm9HxEPHEO2wNwUnkAggkMHy/RdftMKmbM3A6KBhTaRuVFwGCKWKrB3qbPoVspef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289473; c=relaxed/simple;
	bh=Fqbe4DIhsNbuMpYapLU3a7u3miBm92r9HlzuqltQ0No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qy/Ox05rxlVlYzppkDJBDEiqyugmLIWpoQkmXbyn1Xlr8CdXZ3IhvT4pESfUVRtLo52AmOE0CAT8ayg5Y0x1+XWgeqvZCadY/zc451XpNCmwBeUPTGDTM4/v4jM1FzPJlVjE+0aXh1xH8F+gJNXmWxdybRqKcaIpCOkl6QrviFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=addTXrUh; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="addTXrUh"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2345140E014C;
	Wed, 29 Jul 2026 01:44:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vZWOZ8_P1VgE; Wed, 29 Jul 2026 01:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785289458; bh=lKZ4Wm81Nezr8Zx2gK6doi1XrjPscTP8e80QVTgDnxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=addTXrUhVgdOS72+/cbvtYN3uRPJKouR4WZMsNV5YbpG/RPmbbDvEuWL9vFZtzaAi
	 8C7Iq7CqVaWVtZvjcFmYGV00Qw0qPgkzJ+fhZVt3UoATQJzlzCxH2vriPem+qFdBjt
	 Pv64NlJLSBrgUKdOEIO7DTSK/ATDTOFUsDvfn3Qb+ooFuM73bS+xU1T1IBFI8ThX8s
	 ZO1hrWWsbLlKyL0a3p64f3Grj61ArdIN57lTT/TXR9nEA2f86+hk1IMm+Nav+a36j4
	 hKFqRl/3sUXjUalGb4tlw+wtnn2iOPoRPG8+PH3SSvOm3XlY+ws+kIzvU/a2oMNBCx
	 PlWJ2W9OofxSyibVwfUX0jKLfXvrfeKL9qAdOX0Rh36J4fOissmbUbkRxokEi2No3G
	 V6EdEdLoVA5mzT9oXvRbORHTtmZ92mCjidsnV/2GuqMsLyov+APMAo/O2GOEf6hiop
	 8IeiPYpKh0Sgfx9OEwYd0drQBT1CoFUeNaDc5OC7cuXJg7kbYbCXTMbCbitAvVFsGC
	 tjvztB0wy3dXAy/uBqpWGuSYffFtnpZYhGkqg3U7SfknqA5n6Iks9mySLmQIdkrS+L
	 tFcRmmtRYcKmDCsxIRitXjZEN+6uSyqPpouw8N1xz7lJJ7PTmtXU09agfIWyAQ/Tys
	 OZwEOkDjDdCj3M6LiYED7Owk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8CC5540E00C4;
	Wed, 29 Jul 2026 01:44:13 +0000 (UTC)
Date: Tue, 28 Jul 2026 18:44:10 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v8 0/7] Incorporate DRAM address in EDAC messages
Message-ID: <20260729014410.GDamla6uSQ-ihlCIL5@fat_crate.local>
References: <20260727212045.1810480-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727212045.1810480-1-yazen.ghannam@amd.com>

On Mon, Jul 27, 2026 at 05:20:38PM -0400, Yazen Ghannam wrote:
> Changes in v8:

More Sashiko:

https://sashiko.dev/#/patchset/20260727212045.1810480-1-yazen.ghannam%40amd.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
