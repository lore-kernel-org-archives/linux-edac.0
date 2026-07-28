Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CBA3FCB0C;
	Tue, 28 Jul 2026 21:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785274406; cv=none; b=WuylGxSMovKas5f4Olss9tZ8ZA2SRxnn6I7XUABGImXioXEuEFN1CA6cfAKCgsrjrmo4hBTPI6PDNIr3ySieWoA3iOSI8b1Uf9LsN1++6qm5uDZ4TNCBMkEqfs6x/TtpdlUQQepNLxFkdLWvjUq2vwjD41a5tyFBFzfEHKuPtBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785274406; c=relaxed/simple;
	bh=UNFpjt17zYGVEUzBZ/wlmHDIvY6O6pUYbAWhA5bcq8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOwZBjtrhsiqS+/O+Hvk1C6LfAmD8K9xOKh7YnNiqwnpw7bSnORrvqfSf1yxe6dk6nJMqJZQBsqjFzmpQEZN9LIXxo8YatQjCe2eyF+g9eaT7CKqe/09J5lHnqM6u8Q3vC+G3VHmeEA9GgjlzWVpuXbzz7r8AzlQxYzVbs+Kehw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kX3Hca1i; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kX3Hca1i"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AE51E40E00C3;
	Tue, 28 Jul 2026 21:33:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7iBlCvfYVdq1; Tue, 28 Jul 2026 21:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785274391; bh=2ic7C2r0bhHyeu0exF9T1oX7Ls1yQRkEslKS1WKUsHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kX3Hca1igFBY/gOsBge29XiAQgKES8rQNvmKdbnLTZ3JeZdCyjYjKQT4WNEHLpNKf
	 3FCoWJ4Ete64RsEUh7LCA3SvW936fMSrc58cSffCHGBoJkaSjimujInKAmRyWD+Mwq
	 pR/+Bd1O46zJiC5slhvcMqwW2C4g6qn4YePUhoX2fDth6Idh/35z1G82BpHT+Jw+Up
	 1IpYV+cYBb/gCaSEG8yEcakEs9rjA+T5xO1PYBUUO9wvmZMCCCzFmcGhkHIIT19KJJ
	 o5DBqxZ22hmipB6ffLyg4G2wvVqogSJJ1/pMNHcnjJTcxwOHqUgF8BhbmOu+oWQXy2
	 npsWijv9hRyHsR0k14L9ilrdHD2QSgCVZSftX3KmfyG/Wnabbi4qAGh4EoCxrRS067
	 bgaTb+rOgseQEVY/RczXtDnVGa2pIakYTJQwQw23o0m/65DtTxPvJwjXEWM47sE/tm
	 U/r6VsU+cBWT5RlrwPMhid7sm6CbTEaqFuRV1FSKA9UrpdmjRwSph+QZmCp612iNHD
	 cMg/oyD/g+P8JIN/x1l2/nk6q5jkmKK0ruRAbk5vGF0zFFj9mTYoM4ZSlVuCuGRZKg
	 CPHKdB9WHL38SHnZcxwmYIkqrENU4KDXbgKw8lCZcwW3KNDiNwMR6wd4akeaE2rry1
	 +d3ueROJBZd0Y5Cm0RRVYHzg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2D70240E00C4;
	Tue, 28 Jul 2026 21:33:03 +0000 (UTC)
Date: Tue, 28 Jul 2026 14:33:00 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-edac@vger.kernel.org, git@amd.com,
	shubhrajyoti.datta@gmail.com, Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] EDAC/versalnet: Add NULL check for mci in
 handle_error()
Message-ID: <20260728213300.GDamkgDK_DeaaHFHff@fat_crate.local>
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-2-shubhrajyoti.datta@amd.com>
 <20260726235228.GAamadvFK6GYNRx_dh@fat_crate.local>
 <511e62ae-79e6-4931-a7b0-4f0c3830cdcf@amd.com>
 <20260728013725.GBamgH1WcvOaEtAw4n@fat_crate.local>
 <5554052f-398b-4507-b2af-152a7695abea@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5554052f-398b-4507-b2af-152a7695abea@amd.com>

On Tue, Jul 28, 2026 at 11:57:28PM +0530, Pandey, Radhey Shyam wrote:
> One clarification on DEV_UNKNOWN: on Versal NET, the driver exposes 8
> MC5 controller slots, but a given platform may not have all of them
> configured.

Are you basically saying that you can have non-contiguous controller slots
present on a system?

If so, the whole unwinding path needs to be reworked so that it doesn't remove
the properly configured ones but simply probes each one, if it finds one, it
initializes it and if it doesn't, simply continues.

Which then begs the question should that driver even load if one of the
instances fail probing?

We don't allow that in amd64_edac, see:

        for (i = 0; i < amd_nb_num(); i++) {
                err = probe_one_instance(i);
                if (err) {
                        /* unwind properly */
                        while (--i >= 0)
                                remove_one_instance(i);

                        goto err_pci;
                }
        }

But I'm willing to be persuaded that it can make sense for your driver.

Whatever it is, the code needs to be made to handle that configuration
properly and that needs to be stated somewhere prominently why is it done so.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
