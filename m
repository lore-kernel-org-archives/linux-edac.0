Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B582F12DA;
	Tue,  5 May 2026 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987205; cv=none; b=t1Cs17CmdDjD5cwzengkzbXtpvRGdwqQVDnfMASGrdiQN2VYmtSVFGvBCzxKYqkpD2BG6H2vQCsB7xLtpXRmH6W0hjzSeQwaW7oRkuN5afAmWqqeInAgH/R+jj//zEs2Vob+UkBU0ZBTfya1jjnsKyYkA1+p+yuyzn2kaIijB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987205; c=relaxed/simple;
	bh=Euqt6rNAaAcnYc86qMwfnEvuLbj9qO74N53IS8F0Hjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcwVpzwG1NYfbnxJQ/po/yY7q3YuQ7+z3mcWdAS/1RmSO9S19i6eN1yjU9sn24K0YYLEhwQ/GW5s5HaoEkyFODa+gHJalQsgnkKyrcRBncraczjQhEi0AdxeeDzAm3OoAui/wR3rJ1ocgchER9U0zIjtYkXIPQ3jgdNH2GEsyhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KVnobAwi; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KVnobAwi"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4E8BD40E0032;
	Tue,  5 May 2026 13:19:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DgP61Babcmcq; Tue,  5 May 2026 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1777987184; bh=kufWeqE+dcaSGce7e9W+s/g1H73jZBbC/7SHq6mrKb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVnobAwiUsE8aao3JN1XLp0wKw1N0A1ShHQcyTXf+TDYjjlTafpzluquUJu1GljQ/
	 MfRrnjTqRVR3i/tbm8krb60vzCbbc4SVChhI1EfdmOrP0OX7ADAZ3KOXlE8DHzc8g0
	 E6EfvT5FY3gqUD3vZRbV3AWmXPYvBX0gBQGqEI8kgnzG8b0nX90DgtlsCM1KbmaRLm
	 bPvWAYX9jiuSZfHcJAFlnYVu9LMPNIcuravPsr24waPIM03BsceW73RfOsQuTkwooP
	 zwaTmZWPB5U1Wr1jdpKIz2U3HuWA/xkyeD3c5ustUZJj9BvKMC5xnbv+UL3nYg5AH8
	 dy7SEOvhDcnICVNZvz5fugtOF1keRXXjBtk2/NzzWcYL1vJKqnuhzdo0xSU43Mx+OT
	 efzoFSku7sj+Ejg7ESeQXJkKmH5T3pGiOmyDAqbg4IwT2fFByd9vW1NM76Ng+6QRLH
	 cDBE1uv4CAsW3OskniVjZg0TKbv5OJgwyV/Z2mZQWZQeMbWwJCisWXTyBoj44Zz6FF
	 BwPfMtnKIpzm1qc0dyOkR03WluSXCD88/wm9slkZrCUCRbtshZQ6D52EUr6vHLwQNi
	 jcp+EBNmMD37Lv4jSWZuY6VDx0SZ5fR4vTAwUDQW4vJeF9DZg1jXsAwfIDLyJy/YS5
	 38Pzi/+gfoPi/sD/ztQwmnL0=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 140B940E00BF;
	Tue,  5 May 2026 13:19:38 +0000 (UTC)
Date: Tue, 5 May 2026 15:19:31 +0200
From: Borislav Petkov <bp@alien8.de>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: ssengar@linux.microsoft.com, shubhrajyoti.datta@amd.com,
	tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] EDAC/versalnet: Fix device name memory leak
Message-ID: <20260505131931.GCafnuY-34TpS7Vub6@fat_crate.local>
References: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
 <20260401111856.2342975-1-ptsm@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401111856.2342975-1-ptsm@linux.microsoft.com>

On Wed, Apr 01, 2026 at 04:18:56AM -0700, Prasanna Kumar T S M wrote:
> The device name allocated via kzalloc() in init_one_mc() is assigned to
> dev->init_name but never freed on the normal removal path.
> device_register() copies init_name and then sets dev->init_name to NULL,
> so the name pointer becomes unreachable from the device. Thus leaking
> memory.
> 
> Use a stack-local char array instead of using kzalloc() for name.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  drivers/edac/versalnet_edac.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
