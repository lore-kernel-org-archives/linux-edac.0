Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1051E38E8A7;
	Wed,  5 Aug 2026 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785905507; cv=none; b=OqX8fiHwB99XZah7t19MVVVcB14Hm5a2ZmQHzOZTw7s9PeBh6h3LxkjmcyV/BT+wpj1CrugRmWaAM/xJq/QnQYVnPpcHbz9aA9zcs+aVJyEzqK1orwtlC81oBgCdwreHWCG69DQ2KxOzcDm6RVmGjg7pDm3i892NM5vZiXDJm/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785905507; c=relaxed/simple;
	bh=B5EtIVDXO/frgFhcGrDFUjB45D/vptyKSblhqEsLh8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaLXIXHx7P80t39gBkur9Jr8EPuH9hnPvH6Lg6au6yKvBhD9dmj2zs+9gTpjZ9BugOH8jwjdL/0YQ/YCWVT/Ywvl6qXrIUVoDP6/G/zmSCwINEy0IcjpT8qtTODWwM06pLo6EaVnFzXLYIhvnliPs/zciZjiVPGVF7qywunnuM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=EfUrbITt; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="EfUrbITt"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1A8B740E014A;
	Wed,  5 Aug 2026 04:51:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BcM1QEfd84iW; Wed,  5 Aug 2026 04:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785905493; bh=07upcZ/uu2qxBu5lMSDQ3UJc2pdav2KbeuUk8GeEkL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfUrbITt/L3nJZeA9QNRLmt2C/KW30Lfc5LOXBau+n2LS4XuaN0QJSmXTG1qfruxC
	 4VKseTwZRtfi9ZWz+kXt40UDncO3XzRU3o6RfecroNzF08z2szBeAleispphVzw9qC
	 zpKVSz/4CwipaYNqMOA7xNPv35vfIhUgQ5YoDWBIHyHbdGwgwG3GAy9dEMJb60//pf
	 lGfwfqXG0PHIWvDslEoRkkvYTFyOZbNYEV5dlpvZJdRBISeJZrLMM4vQXcFfsPMI9a
	 lwMv+Mto2wF1FNLCs8jFLwz2wFnEWx+fEIdWLp6YY9wn/Lq8WL0Vmp5+JRuftmKKwE
	 KeeKLtOsnK0gKg5GwKpzIqjt66pbLq1UHlAWnlwZ0t0jpt0orb6cLALH3X8A+D61kv
	 Qez2dOduTm0D1vogcYQUrHqrUZO/sp5AX1iCU26gzLxQHKKB1Copx0WD+68ADAoiff
	 uIHZ5JhsIhGL/jzUWgVA7mQCS+20VAcZa5rQ5FLHOKSNfKRIWyiIxJNaZwEEF0FRuw
	 LOMNzvzbtZohSzZ4nmZ+fPBoQr9MIWDPg3H9N8cGRHNb+AU/DodvVYzkMuznRSpzF/
	 1WSc0UJPioy4oNyENdlS8wFXw4x882vwbCcsnQ+jr11qyDjnjFipAqYaVMF2O7lNCG
	 Swpq6/9YsPobYKNUrUE+qkDQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7122440E00B8;
	Wed,  5 Aug 2026 04:51:28 +0000 (UTC)
Date: Tue, 4 Aug 2026 21:51:24 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v9 1/7] RAS/AMD/ATL: Always build PRM address translation
 support
Message-ID: <20260805045124.GDanLBTLxUugaIa0Ap@fat_crate.local>
References: <20260730194834.3203601-1-yazen.ghannam@amd.com>
 <20260730194834.3203601-2-yazen.ghannam@amd.com>
 <20260731235523.GOam0163w6pfMOm9oU@fat_crate.local>
 <20260803152440.GA923@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803152440.GA923@yaz-khff2.amd.com>

On Mon, Aug 03, 2026 at 11:24:40AM -0400, Yazen Ghannam wrote:
> Of course, now we probably should put the 'native' translation code behind
> a config option. There's a lot more of that, and it's only used for legacy
> systems.

Sure, something for the TODO... low prio...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
