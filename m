Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ED938E113;
	Thu, 30 Jul 2026 18:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785437811; cv=none; b=ly4MVcm9UfIvL/51MzVd5iZPv8SmwQAJVqRmziarQ16Tw69V64eBurhldoKJbuTkx02g9qJ4FYt19aAOHVmWjr+eki04ZP0ycGr2UgbKYso9mmNvQ+ssZ2XcIrkulzI4/42OKjdeq8eDEEfSEKFcY7gDCZgsWFY/MO7PIWdW2xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785437811; c=relaxed/simple;
	bh=lyr4/pb2PzbOsygb5W6pcHMqIdqXGCxZTe0frYrbcRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCiJ721HKShJHDowKoEzOeNByzHAoJ/cS0W6AV5lW9QEmlU2qOpCU2K4JgXOyb0CP+cq26usrQOPvzHNavahk5xU3rcQU8twCSJjtcCFn8mpv3BT71nKllXL9EqHGXqIrczevoX+L/DpcsetVqyl1VkLP61CQPv6IcwOQwZo64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=eGofO1bz; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="eGofO1bz"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B994440E01CE;
	Thu, 30 Jul 2026 18:56:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ceoLFlg5UfMm; Thu, 30 Jul 2026 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785437796; bh=r9y9AqYklBzxHjS0JUG0QMsK1O02i4JYhHY2V9bPyuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGofO1bz21zBADAQdUz4i85SXlmgrQZNHJeoP5hArTcrqoM8IVLKKjZGcp3CSMng4
	 sixVZKjjL8RsP6nNs4j9khBac9BxGukesWcdsD2+ZPgz4qw+ICj8+DezF9aDkVrf8K
	 9O317ULuX5GXKDIv1WnR6iAUvEVvXxyiTFV4IJsYRFQpH3vlKwuWmoq7VWadWcCpXv
	 /Z57OlkJalH+RIe2RmLj167QtCqKTzu0e6dT6JgnfbOpOeNoVOT2SGnXmnN2WJpMhy
	 IuklqwIg3i02oeO9yKaMN4IwNCSf/XzmuteepKBebd1IENWgOiozdeOaSQ/11Z7Ekw
	 r1mF8pwZGgbzIcOn67Y1o4Hi4vVKSgDeSEMl0Sa89jaQZkw6/IvdBND1C1BukLWLc9
	 4ZVnvaSyQ8nxcKYKYoVpjZshntEA4UjUdpnkME+qqaC/2F5RIzLWwzsFOB24E6EWLw
	 oHE+TuNDhPfO8aWKvyUBaoLjZ7auaPmf0aToPeWD90aaxfH+arqfEgddMfAjETL1gt
	 k59E9u47qxK5oZAq+wt7grw/IUfAT6/VTDt4g481xck+j5oGbGztWnD2FTRy0YX8f3
	 LXr5qVOoBGJuNI9GMyFy/pANhwIbSabGk6Awsl4lS7dv+2EUILkVGPIEh0JX/PBRZ3
	 sIpte0jyTzTpoyaEXocZa7Do=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E6DC940E014C;
	Thu, 30 Jul 2026 18:56:23 +0000 (UTC)
Date: Thu, 30 Jul 2026 11:56:20 -0700
From: Borislav Petkov <bp@alien8.de>
To: Michael Walle <mwalle@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Tony Luck <tony.luck@intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Takashi Iwai <tiwai@suse.de>, David Heidelberg <david@ixit.cz>,
	linux-edac@vger.kernel.org
Subject: Re: [PATCH RESEND] powerpc/configs: enable CONFIG_RAS to fix EDAC
 support
Message-ID: <20260730185620.GDamueVIGV-8iIzozX@fat_crate.local>
References: <20260730105546.3658570-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730105546.3658570-1-mwalle@kernel.org>

On Thu, Jul 30, 2026 at 12:52:18PM +0200, Michael Walle wrote:
> Before commit e3c4ff6d8c94 ("EDAC: Remove EDAC_MM_EDAC") EDAC_MM_EDAC
> selected RAS, after that commit, EDAC depends on RAS, but nobody enables
> it. Enable it in the config again.

I have no clue what you're trying to do but forcing RAS=y in that config
better have a real good reason why.

Oh and we cannot support CONFIG_EDAC_MPC85XX anymore due to lack of hw:

https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git/commit/?h=edac-misc&id=749c5102487b558cc7d73961a6d0da2fceaa022d

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
