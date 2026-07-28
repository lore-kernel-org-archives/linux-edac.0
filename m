Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251EA19E97B;
	Tue, 28 Jul 2026 01:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785202672; cv=none; b=n0/zh+z21m1kk4qXnZUFZiWIBOeUMn9MNnJ6TN/1jNJKKv0xguukyUzEEVwEGDS7yPJ9UxsvQdn5g5EPznWkFHeBN7mfhqMwdTX5BaN30nh6VcebVv6FO/tcgou5akU61Qq8i7klfYXfmEapfbULo0MVWehm1Q+YNGgPNLQfO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785202672; c=relaxed/simple;
	bh=n+V6d3q5MUeD5kN429Rr5aW4bpg5KDwf41tkSeA2ZjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6Am+cugq7xwmRaERvLbdaEcjGcWZCffb8velQcdyUJ65ZPLFdHfzENlrniaoSbZt079xxOSWjpqQpt1bnd1p6DqjhjOPY6Gii0GvAG/5k3HQxRyRYYl9zGS74evYxcDkJtpWnmQ0oCdjBahDcsllUz+26NsWVLjzRICSarDpB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FF5aN+ts; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FF5aN+ts"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1ED0140E014C;
	Tue, 28 Jul 2026 01:37:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id a4gYT6XVNi6r; Tue, 28 Jul 2026 01:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785202657; bh=t9zGiCLb04KyeA/7GBooOoEL0xxsHg31jriQE9B3fqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FF5aN+tsuAYlzl8wk/kVYjFOPIsppnC2UyK8w7toZWvpouZBrqWGdyIIWrTuWg9Gp
	 33BqF3rlyYxqzjUOJKKTe2hoX82hzHE/gRgwQ6XcBaKFQKUQFqfuUAyynvZtv8kdR7
	 2SBeHdJgqGEE+BSQFCgrB1koNNB54/HnsHccb+aeQ7e47fTySZMVhgsjf7ZnXILqK1
	 TL+T6Bwkhpra1MPVE7BRMyFhnweXJ//M60ftAnuVVHHuNArNWylp9SspOyITyhM8q3
	 zR5l227gCUoyRnlF5WefKY9WMKPfzxK+LOz21dlCD1eJPbtcF15LIIKEmGC3ecXJLq
	 10GitELd979JFniNV6cFEsQaTr9X23DpVDkHJdEhtp9MhaFJNulHQMwhURnrbqhmid
	 TFP4UUUb3KZz60z6r47HY6X6DB1d9XGwzerfBJcny/JtqwO6lmxkbOrw/vapEVjVZr
	 UyREp7kX9tC9a4yIQ6uHUNtSK4V0JVF0Je+F3Lauj9b+wyFAaXx1yiIW92t43oZpbA
	 FIGGUc1xHH2wgEpUrlQBvtZM6wPwdUNeFeMGrT0va6GXNIGWmUdB+JIDKwdht2xHHO
	 1MHr/kFYxW6pY1qo6dwyk6D9lhc1kF5alVeVEnshueV9D59CCP/IJw5d35qjslz2SJ
	 RNrO4d2qDfhNgeLwP+M7sRLc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7F87540E00E6;
	Tue, 28 Jul 2026 01:37:28 +0000 (UTC)
Date: Mon, 27 Jul 2026 18:37:25 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-edac@vger.kernel.org, git@amd.com,
	shubhrajyoti.datta@gmail.com, Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] EDAC/versalnet: Add NULL check for mci in
 handle_error()
Message-ID: <20260728013725.GBamgH1WcvOaEtAw4n@fat_crate.local>
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-2-shubhrajyoti.datta@amd.com>
 <20260726235228.GAamadvFK6GYNRx_dh@fat_crate.local>
 <511e62ae-79e6-4931-a7b0-4f0c3830cdcf@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <511e62ae-79e6-4931-a7b0-4f0c3830cdcf@amd.com>

On Mon, Jul 27, 2026 at 12:18:48PM +0530, Pandey, Radhey Shyam wrote:
> The gap in the driver is that init_one_mc() returns success without
> setting priv->mci[i] when the bus width decodes to DEV_UNKNOWN, while
> buggy firmware / future firmware rpmsg error path can still calls
> handle_error().

Aha, right, so I missed that. So the right fix is to always return an error if
the function fails. So that the proper unwinding in init_versalnet() works.

> Happy to drop the check if you prefer otherwise we can keep it as a
> cheap guard for a firmware/driver mismatch.

You already have that at the beginning of handle_error().

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
