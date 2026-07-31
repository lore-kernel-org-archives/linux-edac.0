Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D3331ECF;
	Fri, 31 Jul 2026 23:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542145; cv=none; b=qZSL0x7EkjjcsgVyzL4UMe4FnnFFCfdmQXR12yXYkv+dOB4O8b5R1pbs8EQRoXiScsNqRTnl0cPeH/EuwboFA3LoWOg2fQjzCY9+rkBPf//fApFjGCpUPVkiq4mIe9G1PxcMX0Y2VzD0U6MSpze4XkhrPP0eERcCf3WcJY38gv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542145; c=relaxed/simple;
	bh=VSRYLjKWU4dlqBDp0RWVqI98jm+oAb4aUp3kzOEACSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KL8TuSS9flcHiy9xSF4cV8WUddDyUwLZULYXac7puowha/YI7XMhOuNxcX0yGwcWtJM6XlnqZc4U5WBewtSOr2lSUFPFq85p6uUgPSmmOh48F/Cp2PQoK+y37H+zdsr+W3COFG6ZK92Gm5FCqvcUGq/3RSsXKPt0rF8vzSlAUBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jdmJcyiZ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jdmJcyiZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3A3E340E02B7;
	Fri, 31 Jul 2026 23:55:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ya3bpDILuunr; Fri, 31 Jul 2026 23:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785542131; bh=j81pWlau9WbIXoUJnI0Fe5WZvSwUNDwAEp2Ej3WYeD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdmJcyiZmwBAoPn4rwXuG8p0Nc9fCrgAP85wwL1BeNCsLS6ITQhGIhFJUHVsOtq9x
	 ZPiWUG2oHglwtV10M7zsSxsAZ8+Haq3SnIe+gKhjQ+H2ylq4StWu/rYEZ9a4ukkhdr
	 GCi6gmxbYO0Frmu7Hj42B0JvfDqw+u7TXKzhXhiC6wj82gfOwfztCdEMospbyHe2A3
	 Kzpo99hiUJHMVvJ2eNR0eNffJjAfWrfMN1Obsqr4bDoQdcWSk2NIPDsiM0dz+LwO2r
	 jdmpdihkKrSelygdQA6jOAyqtedzyNDf/+hqnENIwFjxpziHQmEKkP5a1SahfPIX7y
	 aK6eb/W16BpHCaMOsVVHD11fCtpOuevob72zexek7WQPcqeG4VpgDGrZrvAWec/3Tz
	 kqr3q9rRMeoDz/y9zTpN19dJ9iTxfSFfMxOYX7Hgc8qIrYpQqWKub4tLxDhyj43Yso
	 boE6M6COHJZ20+PGxlT/14AOlgZVCOHbucztnJU3x096QB261pQDz553HN9O/OH1TJ
	 rfmbKRuff7fttCGSveNQsYePXuqaIrB+Uus33Myth8WWnRkMq93OHJsUbzuRpGNTAQ
	 N5zORcJndFV3LFFdsLHgcKX9UlViqHFhvTRTr0OFuZOoFfZyFFRKb5w2LS/7K03fge
	 xyesXZPRRwewQoDwfBVCdZpI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B587140E01CE;
	Fri, 31 Jul 2026 23:55:26 +0000 (UTC)
Date: Fri, 31 Jul 2026 16:55:23 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v9 1/7] RAS/AMD/ATL: Always build PRM address translation
 support
Message-ID: <20260731235523.GOam0163w6pfMOm9oU@fat_crate.local>
References: <20260730194834.3203601-1-yazen.ghannam@amd.com>
 <20260730194834.3203601-2-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730194834.3203601-2-yazen.ghannam@amd.com>

On Thu, Jul 30, 2026 at 03:48:28PM -0400, Yazen Ghannam wrote:
> PRM (Platform Runtime Mechanism) is the only address translation method for
> current and future AMD systems. The library should therefore always include
> it.
> 
> The PRM helpers in <linux/prmt.h> already provide stubs that return an
> error when CONFIG_ACPI_PRMT is disabled. This lets prm.c build and link
> in all configurations. The library then falls back to native translation
> at runtime when no PRM handler is available.
> 
> Drop the CONFIG_AMD_ATL_PRM option. Build prm.o unconditionally and remove
> the now-unneeded stub for prm_umc_norm_to_sys_addr().
> 
> Add -EOPNOTSUPP as "PRM not available". The acpi_call_prm_handler() stub
> returns this when CONFIG_ACPI_PRMT=n.

Please tell AI to NOT write what the patch does. :-)

New commit message:

"RAS/AMD/ATL: Make PRM address translation support builtin

PRM (Platform Runtime Mechanism) is the only address translation method for
current and future AMD systems. The library should therefore always include
it.

The PRM helpers in <linux/prmt.h> already provide stubs that return an error
when CONFIG_ACPI_PRMT is disabled. Make prm.c builtin. The library then falls
back to native translation at runtime when no PRM handler is available."

Yah, looking at prm.c, I'm wondering why we even Kconfigged it. Oh well...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
