Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480298;
	b=xKnKxRQrNtTYqbcHp+Wnf5BrbsAfY4+Pr7Zc9PXTyNPPCixL+VALqK3lt6BFlZXvBZmw
	 cNNjT3ua66tji/90odz9q7BuftRziWTyDC4smIGuy5+Y96VIS88gYtLecP5weBCmJ8JNz
	 DIHsjIx8hLDQElFgDY7AQtS54IIntoF4J2aFYS+V/0HwiLQOBzWEaYYyrA65/xHg2Dd/h
	 QxbuZSZFwcK07mkJ2+cwulhRaeRC2stSd3KpaQFDBEzZ8/QCasNSyJbfO2szzMd8P+qn7
	 ytCIywkrMW1R4StFbwUuMz7H1nChxDtIDHO+cmCK0R5aJBAZnN+bMiH+Isn0qz2RwHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480298;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7IpkPkVFHEadLY409nUalcnMRClqdAQR7VTRSz1ZcO8=;
	b=qyQrjrFNCFCUO1ils7QTCM4/OtYxZQivJ8O8SAR0WfzPkWscH3JswLQeY6XRJG0DQ6K3
	 Vc5b2RYdAecBiRmbNxfF64NE91nf6H0bbwqCUADycWpgHE7ml+zgmBq6hlorRCm1u/f9Q
	 2HHE2OWLG/4JEo/NPjENJd14/lvcW0fl2OtivjTOr8My6bdCgQk4X1s6HMBWbengobAUD
	 VI1S/sgQXWotlrVnma3fB5EcNDOMh5vv+dPxgOF+9AwxXuWJ7xoZjjJ5sPBCszHAtb7C4
	 vqr4dv6zprS1xPYES8elUNfVE60Xr1dQcMOL/fgk/zonMi3eDEVpWGFNemPLPoTmd3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dxtTMzrI;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3F4606A321;
	Tue, 24 Nov 2026 00:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C3F4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dxtTMzrI
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 025B340E02AA;
	Tue, 24 Nov 2026 00:31:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xKx_-KTIfSpn; Tue, 24 Nov 2026 00:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795480289; bh=7IpkPkVFHEadLY409nUalcnMRClqdAQR7VTRSz1ZcO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxtTMzrIL2fiuW2uuAg3o2TZ7OmmjPyRs4XTm6+40JI43cDYin4TG1Ke8hvvdeOE3
	 6VG7vmghoywou2l3QfBlsSZU5jaKZwecLlfOjb/FNHgxaYyBvWTRdNjlBqQlNXBn0f
	 V6QGk4z05IY5zZMYcoWYkMnjBmIXdyoCoJ7DYF2R7rPJY7QSObTY5zBZigUEH203Ys
	 tXd5zqDVZA5syLn/Zh3fu+xApkDk1GBT5soKeVyvicfMGZ3RqLZhpkf8DSGmgWhzqg
	 RwDFltz3o9zqd2Jt1MlK/Bqm/OlH1BZ0ZAkIzIcEUMjaf0j+fSsmEufdA1a2qG74fl
	 SPKkcYEOplQX7bntkepvRlsTHKrYWUGIxh86h69Zjb0olSEsXO8M1BLxnpbqtQNOjt
	 qvpnfeWTlaYTckcl1ggafe8aCh9mMzbf3/+etfuyv9BhcvUaK3gHV2KA49g2cV/A5Z
	 rlZx9W+idJ2eEFHHWOWSo+13fZM+3L0F4+Zm43SI/6RTzonngU4uZxRKoCHjgjt+4k
	 2avTfLz7xn0sKUaTteGBWjNYj8INDKK9ddwqE3Y5xZdNCZ1u+JT4D7saRDTkjIaGJ6
	 AHYoXdF9Rrqdu6xQtkEKC7XeRX3ZMCt0Dlp0bijOwauJ2ycqiAq3+BJWSH6FGnNxH3
	 wetm2jf087EkhHzioUWE3XQw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E18E140E0240;
	Tue, 24 Nov 2026 00:31:13 +0000 (UTC)
Date: Mon, 23 Nov 2026 16:31:10 -0800
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v6 0/4] Add Aspeed AST2700 SDRAM EDAC support
Message-ID: <20261124003110.GHawTazmnfEiwzjh-0@fat_crate.local>
References: <20261117-edac-v6-0-a2a747b95c3f@aspeedtech.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261117-edac-v6-0-a2a747b95c3f@aspeedtech.com>

On Tue, Nov 17, 2026 at 05:26:37PM +0800, Ryan Chen wrote:
> Add ECC error reporting for the Aspeed AST2700 SoC to the existing
> aspeed_edac driver.

Ok, I thought I can fix up small things while applying but there are waaay too
many issues.

1. Split the biggish patches - a patch should do one logical change but yours
   are doing more. Do not do any drive-by changes while adding driver support
   for some new chip. They need to be in a separate patch. If not sure, refer
   to the documentation I pointed you to.

2. Write your commit messages in English do not use made up terms like "DRAMC"
   and "isr()" and so on. Those should be readable by humans.

3. Do not explain the code in your commit messages - only the non-obvious
   stuff.

4. Do not put in the commit message how a patch has been tested - that goes
   below the "---" line. I think I mentioned that to you already.

5. Drop the "aspeed_" prefix from all static functions - they don't need it.
   That can be a final patch ontop if it is easier. One logical thing per
   patch.

In any case, tell your Claude to do those things because there's a human on
the other end reading and human does not like it when Claude does a stinking
pile.

:)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
