Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24D9389DF0;
	Wed, 13 May 2026 18:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695485; cv=none; b=CCiqOPpESphMG795FZHp5q0P4DjsNKb3lDvczFtCVVDoHQ/rdhOhw95Po7Z4M5ukVe91QTV9/Q9h0OYL37+UHVurgKA16mZjtNDuGm9VdUUvBxBCK8eiyTy3xR5YJWombOxWdB3JwZK553Ril/s30ykGDjelAkP3/SjpMmAWIzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695485; c=relaxed/simple;
	bh=fMrMAl8JMaOv5LUmx3z8f+cbYIG5EnXKJ3uX4/hdxdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6heW4FT2NZRPw42XSz1pi0EifIKA/czTv6/PZlGGWxrsdumeVZ1xdQIjq6iRhioaoFVZZtcdmEpPuTxy5/p7ckD5cgerPIfCA/mpD+IuHTt4ytTMzqI48+SIOtmtlP327mtCT6U3XWbJpOJCpU+8lTNoQPSMmGlHKJr2+BW+ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=c9SugTsO; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="c9SugTsO"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A57BF40E019B;
	Wed, 13 May 2026 18:04:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0ey169loTaHm; Wed, 13 May 2026 18:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778695471; bh=0R3m17vCZe5a3YUABY1Dl2sPgjbTzHXK+nggNmoupwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c9SugTsOlVBWhh4rmOIbo1TW4uQGCabQuFkIAzA/6g3M+k6lLNgSJzP4nMFFxIOZ2
	 L7Kkh/AUHc6UT1oYUS01lFUbPPIxx8FNQGMHnTTFZi9fdaPndUU72/K+pQKLitCxx/
	 6/9oeR8Q8CxMtfTHvBNiLYrPn8Msn4KJjQHjrrfPO86e598obDD3nmBsf93QRsUj8g
	 uWiowmSglecSb4TVqlbLohRfIS8xNQHWU3FnafsZSrJ0IJxgKqBXPw941yMD0Lew54
	 Iu4xDCapABHD7tTTgD+lXiR2VBSAsep+ETY5S4oFo8XV5yPyE029DMHLcn5fJJo1nY
	 qfvwYtHTKk/C3A184TJ63o8/Dt1+ZmEVFkSkaI6sEqGtM6VIxT8pEZEwgiGksVddWG
	 EEkckwQiC/LalR6FljteZlbm4YdpwFldH23FUlQS1oLiUCvnAVRV0fTM6tuM3BYqbh
	 E6LO+YtNPNdxu6SiVtH4ml628XJcdknGHzgni990frI5esXlSa2vczJQQ4mmv55sFL
	 HQIPfW3J0SPxSTLnlIO/TbAoYbKVKLHerdcaIR1haKCyg926lrQYYZrSKw4Lebz+i0
	 ze5+Rbu1bOJ7FuLSDZ5nY5ejxBqYV45/w7cMs10Ukd35bDwjRmD+qE6Rt3FMsFIhF/
	 pMsCBF2V7CXZI/FVtiqv456g=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id A1CC140E00BA;
	Wed, 13 May 2026 18:04:26 +0000 (UTC)
Date: Wed, 13 May 2026 20:04:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v1 1/1] RAS/AMD/ATL: Drop malformed default N from Kconfig
Message-ID: <20260513180420.GKagS9JIx2amgiJEKW@fat_crate.local>
References: <20260513162253.365343-1-andriy.shevchenko@linux.intel.com>
 <20260513162744.GEagSmgKV9ceTtO162@fat_crate.local>
 <agSnXBBS_ur1YEYQ@ashevche-desk.local>
 <20260513170240.GHagSusHdkGcYLS8v1@fat_crate.local>
 <agSytQOxVcETeImj@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <agSytQOxVcETeImj@ashevche-desk.local>

On Wed, May 13, 2026 at 08:19:49PM +0300, Andy Shevchenko wrote:
> Yeah, but here is the bug report now for dangling Kconfig symbols
> https://bugzilla.kernel.org/show_bug.cgi?id=216748
> this patch addresses one of the complains the bug report has.

But N is not dangling - AFAICT, it is a non-existant Kconfig symbol.

So the N in "default N" is evaluated as another Kconfig symbol and not as the
"no" it should be.

So can we explain *that* in the commit message in a simple, understandable
language?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
