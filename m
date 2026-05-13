Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A483138E5DC;
	Wed, 13 May 2026 16:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689689; cv=none; b=lICFjuvaqFUJpjx7Fvw8c3UE1NPxW5lNTFlTnHQSOoaXVBvGEE8Sv8oQAlz7YaWE1fbLTnQSKOY/kVE45WbEoGmCnVWR/huD6K+rhbTopKVNjDwlarNjSPYD6HP2vMdB6RohzHW7thitIr7ItQqPCLg5KwLFGAYvL5gv7S8+7HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689689; c=relaxed/simple;
	bh=pAsqeJFBsGG4Rs8PNmMHUrEjND/TaMhKY11Nu9zCabM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqJWdLnFcy3fWvDxTxhP/11rb7NIA8INBT5u056ddjrOy9ZM3cppvY4hYzB3GhuLH52P6xKwaGJcPg/+lBaNK9BmiK5yPJmUkyg0tikdTk1Zfbl8Hu/7bJRT02U+CRfOEL7boSI1fdn/17x24KZ5oVRBaoKLdiEvqzjkrtqdf8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JePcS5eD; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JePcS5eD"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8D8C840E019B;
	Wed, 13 May 2026 16:28:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cFX1HPNa7FjZ; Wed, 13 May 2026 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778689675; bh=wGxmaoialfwo/KvNF0j0ohz0BtbqETGHZ1ZS/NxF6aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JePcS5eDhzih034PWO1zGEA9t73SSCjHhBS+xBX26a9lMF8sNrwpB8RsxjxkTka/D
	 zfBpZ4w72iiCBaEJl811CPcEy5fWsJai0rlYubOJqWhZrF3Wwc2+atlXSSWGXjJkJO
	 GbeKnSw2femoJvB5YtFENPMgVWD7ubaA/XRpDUlCTIFn2gG3/2erJMIivcxLhZPIn4
	 8XwnnO7Oa+wUwZvB93XHqrnLs5IrgK9NYbZ3s+IqG4PZSTV+wn7SBQnAlk96MxviFL
	 xf6iELA6Qh/jztvlMtUbHyEafWIc29m55qJxuRS6ob76PkyWDnrEsenlLPwZK6n+RQ
	 j3XJAm4C0yCAxZjTT4Ag2bT/f9kuqeF9f1Bi/Nf+CgX7FrdsWfTIcHh4kqpdpwErLV
	 JaM/hjp9J+1TrtVzr5b9DK+Be7FVh/U53RucYYLLQZhDrPbwCGNzU7uXnn9jtNbDD7
	 8YzAE7CQz/SNtiLm393RKA7I4FLMBU9FlhYIM/Pnol8JtRd+tIJ6XMMee4S4t06QJ4
	 HeGzAZSJazfCU5r8E65dVmBk056xzJ2dbkV8nWLfDoz6kpl9UfSUpke6vpSFToV6rR
	 fTq07/2+pxEk1/V7bj0PO3PClb4+P/Gw88rAhn4Jdu1C+A0sUzkp2C6wUv0rCkI+mH
	 e75zDgEUHan/Cwrimgt27TQs=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 9DB4340E00C2;
	Wed, 13 May 2026 16:27:50 +0000 (UTC)
Date: Wed, 13 May 2026 18:27:44 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v1 1/1] RAS/AMD/ATL: Drop malformed default N from Kconfig
Message-ID: <20260513162744.GEagSmgKV9ceTtO162@fat_crate.local>
References: <20260513162253.365343-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513162253.365343-1-andriy.shevchenko@linux.intel.com>

On Wed, May 13, 2026 at 06:22:53PM +0200, Andy Shevchenko wrote:
> First of all, it has to be 'default n' (small letter n), otherwise
> it looks for CONFIG_N which is absent and in case of appearance

Who does look for CONFIG_N?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
