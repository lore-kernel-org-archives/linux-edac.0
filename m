Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162A42E974D;
	Fri, 10 Jul 2026 03:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783652862; cv=none; b=cbGU6KWLPO10suJ8bGw0Wc18qBiXSdlwa/OPsJJgp3OaSZKkMoMe/wyakM+dGw7fwu55tGJKDZem36mVLVWDj66Wa8scXPMbEZLfsx+TG/4AYyxXjrgolocDpi9mnrU44vM1u4KNGDyhnNxtPhDwhHCUK5PPhc/Q1rehP6SvFQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783652862; c=relaxed/simple;
	bh=T+ESYc2L5kgeW2WdKKAx/mQp0rm8K62aP2mAh0hS64A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AI8H2jVwrz500COOmDs/vKDgCmI4CA0+zyl7fMtAMY+Hi7QuGn6qiv30xo1uZCbXAezDUVf15I+kMxoqQWCezRbSIrp66inR2PZHMkYauErZ9icG/ETc+sPMECCHpchj32GofHlMxKhm1XxOozy+GoHb9+EMQSn2sKA8OSyFL6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UtXDqY9t; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UtXDqY9t"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 18E6340E02B4;
	Fri, 10 Jul 2026 03:07:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UJCtiaP1OXeb; Fri, 10 Jul 2026 03:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783652845; bh=2GYJkHaMn75n8ytz3AptxrAH+XDKoGrmdTDdi/jO95s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtXDqY9t+p6Iml+I9leVb51EsMx+6J4/90q4QvvpCal50kB+3gvPmxAPIO6HRCFqD
	 kS5b4K2rFu4N0A0++10LK9AQ8qN1InBvmU4LJZFKR2tXBieRWUEYXvwL0KLcApSyIz
	 FHqqCrIVVEB0we3DWQGU8whWLsL3+xAZz+hfUMAuO3DhlxnWDHq67h9M0yQ8J/thnh
	 Sgnmie/zh2F/ysKeUV23zbnTgYa/JYd2GaHqoTaQTqnoVQq/2nDQopij5TZYSiZR5G
	 pqbNC6UjX+ubrvRt61XpOh1jN4F24aNdpizFloD+BbnpZtyNoUYI+ZC8v1Y/vD+7H8
	 fwiQZBNcbh9Kol72G7S+KGonRbzhIrVPIFaRB9Ob5xrF6defSjrbtbe91hYs1mgCkw
	 vwVst0+OU9mRwiJWNJlNVvN26W26ZxQOG7ac/t1lFi9nsPKcY3PXpUawsCy9bETJgZ
	 ueqbA1wHvuPmHOOcoqgUCvK9xstHR1xGZMWoRfhRtuM9ZBuv5izijRTh2bekfpMMMg
	 TYn4kgR4bpdBjkWHhP8CyvkR2CnunKMgO4DpkWGJP6+GgFr6JnxQK5eT3IhyMqKftK
	 U83cgIl369RSHFoqK8+FkdDHpL/VT57evP9r1QVroSUKcA0KjZvrvPjbx7XLFraA2I
	 urF454OizNxmcGMj+DoOKW+A=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 62A8D40E0031;
	Fri, 10 Jul 2026 03:07:20 +0000 (UTC)
Date: Thu, 9 Jul 2026 20:07:17 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rounak Das <rounakdas2025@gmail.com>, dinguyen@kernel.org
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] EDAC/altera: select A10/S10 behaviour by ECC
 manager compatible
Message-ID: <20260710030717.GHalBh5aBQdoub2_pB@fat_crate.local>
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708091135.94114-1-rounakdas2025@gmail.com>

On Wed, Jul 08, 2026 at 01:11:33PM +0400, Rounak Das wrote:
> Replace the CONFIG_64BIT-based A10/S10 selection in the Altera EDAC
> driver with the ECC manager compatible. Patch 1 handles the IRQ-layout
> selection; patch 2 removes the remaining ifdefs in the double-bit-error
> path.

Sashiko points out a bunch of (pre-existing) issues:

https://sashiko.dev/#/patchset/20260708091135.94114-1-rounakdas2025%40gmail.com

Folks, pls address those first before piling new features ontop.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
