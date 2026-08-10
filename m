Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D533839B8;
	Mon, 10 Aug 2026 17:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786381343; cv=none; b=nbc2QHFMYo0PHXrT0Hmxc4/yHfobO7x5YuYNlbS8BFEAAGuLao3wds4fYuoo3E5kJcUct3IJZzo/nNXctnRg+8uXgr+yr0by16+uMD9wk4Go0QXl+Z/6//ifhgniqWxQHM8CuQ+ywXyGW7NmABA+BM+1xSc89Noil1Fc4RXNBuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786381343; c=relaxed/simple;
	bh=Q3B/MQyJnWW/LtPJP7X8i3BgDX45gi79rsh2xMn9lVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOTDDjv9QRGjRvFCw/BTCmFte+MXQBl/JKbDinPan0Pco7YXExpytpylXq1g9AHRmweRPWqSEbzhnN2/6M+Z7fWkL6LEax/ByA54ZrAM9yk9a/n53qeYUJC6wWXbh/Ji9c5LPo9aU86Zyv4Le9zgKW3GmfCmSeuIK0hHggYphik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kCIcuH5o; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kCIcuH5o"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 368C640E02D8;
	Mon, 10 Aug 2026 17:02:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0QUmXrGJwqI8; Mon, 10 Aug 2026 17:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1786381327; bh=iyAm3DmG38eKExCW4RstGp2TUqbRAp83MjdxOvvKRpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCIcuH5oeVaolaX/WBWZNfRc3yJ83M0lcvjZp9zLJE2RoUi5mw8GMY4OUbKq7xBMD
	 K6vXW7EZqEEcKX9ht9iyznm0hDimCXogbQ23aMtU9mEyEd1Ns+/GmriOfjXLrwAKIO
	 NeNEVEInTUYRr8hYmyn8iIuHjWdW/DFvUEodS4sReJnJ7PkskefIR4mD7asi7YivL5
	 LQJ2TLUCKzDYxuTfOGDYJOZyko9s9rbuG1KMDUFK3RH/7pAlmJsF3hIno7Q88ZVND4
	 v9z52gG4jDwpYAaJ32pLWn5r7T8yTqShk+C8er16+R88lOAuB+Ygbt5YeKY/BKAQeH
	 fedojyKnMEaGLHNibqpEQu13Fw4RzDXhVuxu/0+y1PFu29GciF14xZhaBMyx/GRrnI
	 s37bhX/4NZBmcBvXdHfW3NxPGTPCGAbIgR8IZrWUd3Z0RSG/dTTDAKoIpGgSN4DteD
	 b7Z3ejMExmJlCVUdRXeh3soE4GI3uowz/Rq6/S9HQX3wds4CDcTR+3OiBwDz+dm77W
	 hnhtUA2tdHHnPOGniHInOpw+jghgR68TNLZ/k+ivPF2nhBv3D7rLV/SPzUVJsQqoiZ
	 WqGCRHKHd0U/MxhzMGs5BfOzpqmMRtGqRTdXpcyH6ek4n0TeMJvOEkPOBRkADsWP5P
	 GH9mzOiMXpvdfC3l5Wr+5i+0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8681640E019E;
	Mon, 10 Aug 2026 17:01:53 +0000 (UTC)
Date: Mon, 10 Aug 2026 10:01:49 -0700
From: Borislav Petkov <bp@alien8.de>
To: Michael Walle <mwalle@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
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
Message-ID: <20260810170149.GCanoD_ZhL61i4rHsl@fat_crate.local>
References: <20260730105546.3658570-1-mwalle@kernel.org>
 <20260730185620.GDamueVIGV-8iIzozX@fat_crate.local>
 <DKC6Z5YGBF2O.TAJAN566BN0L@kernel.org>
 <20260731022855.GNamwIZw7Fz4Yhk__S@fat_crate.local>
 <DKL4118H7S5U.1FN3E4DBY4GHF@kernel.org>
 <20260810135020.GBannXHLXtUlqJjzqS@fat_crate.local>
 <DKLBIZ7ZBP1K.20VHSP02I6BW2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DKLBIZ7ZBP1K.20VHSP02I6BW2@kernel.org>

On Mon, Aug 10, 2026 at 04:03:17PM +0200, Michael Walle wrote:
> Thanks! Christophe already pointed out [1] that it should go via the
> same tree as the commit it fixed, i.e. the EDAC tree.

./scripts/get_maintainer.pl -f arch/powerpc/configs/85xx-hw.config
Madhavan Srinivasan <maddy@linux.ibm.com> (maintainer:LINUX FOR POWERPC (32-BIT AND 64-BIT))

and he said on that thread he'd pick it up.

But I can take it too if PPC people agree on who takes it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
