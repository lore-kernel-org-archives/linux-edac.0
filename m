Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1724219FC;
	Fri, 12 Jun 2026 02:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781232007; cv=none; b=VMYDu+jb583vA0XbPRqR37/ZZR+dku4mPPCQisdthuGrcUOeil3yKZaXX1FiNab10ymn0XuHhFlp1GfBnKcVbeXs5oftt/K283IeTgoAZ+HTzsguhmfUzZY/+E6Iox+3LN/NCF0uaXf3F1sjhaQq15g6wimXJ0JRaDu492jrrMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781232007; c=relaxed/simple;
	bh=0A1H/Aho/IpXO+In03rh+04QGVX7XJa1sriBbUAo+uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAt6Z7AZPqinWaVz1tCdPSOTux+hhRbK6Ai0ezEJhQtKaC89OwOdfeUvLyTOha9EXADgupZ1qTq7mXF2Wc/ADfZd8fjCryjHfo/ncUATjwmVKwhPjz2AB6orEfAsJ/8aOr6/nPlFy/96xF+wzY4FxCsUQcwyuwoo7Ra1aWq0xuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=K/w06sTR; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="K/w06sTR"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2203A40E0215;
	Fri, 12 Jun 2026 02:40:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pgiEr7NiTJxa; Fri, 12 Jun 2026 02:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781231994; bh=3SXAOdeUPbuSJOQx88hRDLQL88DDxs0Gtvpcqx5davI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/w06sTRQkIsOf2Dux4Qww/P+PiEM4q73mvLaO+4FRJzDGWTgajrNOrwqJkpBHbZt
	 Lm5FYkfCXdtP9cOro5GhBE6mJdrWbzNevRjnjUQc0tPoQb8CFrxmPvL+V9By3l+kEf
	 lY3FonItALcFCp0TDRuE/4RU7rsxTOkRal+xaQMygXMTy/w0aLg5drQyCazh/ABkYF
	 an/NTTuA6KFqGt8cMIQK0DG+ZDKPSgjG9VAMqCOIcAsudLbQb+E6uvZWnPFinCIWRP
	 NRHqzUdQ/4dIDee0xJS8uNKUCeFWMYt8tJTTr/fO4QVJdrUgbsg7I1u7VA3uWjYTfl
	 BBB4+fTlyveQYAa7v5VoJamarnvRaqM/QbDNmiwloSpWmlwtOSihLnatIgHjobd4bX
	 iGEPJjJzEGjoUFyxvBYv712//lgIKJFcCwXMgU9D6pG3+lZtJTlie3BkfEOZo+2W09
	 qBvQI5zqP+QeMamNeVdTa7wbLM9Tw1eTJHYpM+azSYTqxrKOYJ+up5wM6Gs3MFvsRK
	 z4oswsFlTZWRMTkmRRpQehjVGTQgotSkbQQYDIcmn/Uj8yein8aH3U0/NgczwiV0Kd
	 nUf1WzvUx2p+jAl72hLEEclMJb51kHRLPz10QVzaqHYFixIgac2YhCgDDgUxdjWGuI
	 sC8Lnfpp7ueGgSvaF/wW90Lk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9022040E0176;
	Fri, 12 Jun 2026 02:39:48 +0000 (UTC)
Date: Thu, 11 Jun 2026 19:39:45 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Message-ID: <20260612023945.GEaitxcTF7rm72JkxK@fat_crate.local>
References: <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
 <20260601184100.GA4547@yaz-khff2.amd.com>
 <20260601210535.GFah30HwoSEavRkLXu@fat_crate.local>
 <20260604154856.GA1625873@yaz-khff2.amd.com>
 <20260610003516.GBaiixRCclQEMwY_9d@fat_crate.local>
 <20260610211541.GA831811@yaz-khff2.amd.com>
 <20260611012336.GHaioOGB0NBxv5BZXS@fat_crate.local>
 <20260611141138.GA978852@yaz-khff2.amd.com>
 <20260611161611.GBairfS4UTuG-cwKjO@fat_crate.local>
 <20260611165458.GA1105@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611165458.GA1105@yaz-khff2.amd.com>

On Thu, Jun 11, 2026 at 01:01:07PM -0400, Yazen Ghannam wrote:
> IMO, consider the risk and the outcome.
>
> In this case, the conditions to hit the issue are rare.
> 
> Real DRAM ECC occurs and logged through EDAC: rare
> EDAC_DEBUG config option enabled: almost never
> User is doing a fake_inject: practically 0% chance
> 
> If the issue occurs, what is the outcome?
> 
> The "other_detail" string gets messed up for one of the error logs.
> 
> Of course, if no one is using fake_inject, then removing it closes this
> small risk. I guess that's the point, right?

We don't ever keep broken code in the kernel. No matter how many people can
hit it. I know, I know, but what is the chance?

It doesn't matter. If we know it is broken we either fix it or remove it. And
sometimes fixing it "takes a while" and there are bugs which linger for years
for whatever reason.

But we never leave stuff unfixed because someone might use it, someone might
depend on it and considering how many people are using Linux, you can imagine
that "practically 0% chance" is more than 0 in reality...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
