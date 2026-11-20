Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197930;
	b=is2TKsiDP3NPEUyW7uiIuriCxZJ9bauZdJsZ+T19IgONzJXol4eT+mkGjyC1CpCXytOz
	 jA7EzZ769ASwgyo6GKlL50w7Jg0WY6ugjtWtSpHHClO2cUrNAaLDt5MQgl2HAnWagjA+Y
	 Z0Cg7P9VT2DIfmnHmNzSSgMrJRcLI3mQtQewDoinfATEDvuVvND3DfNCLB4/i/dsr2nK2
	 Cccq1JVgF8h2xvegsmpJbGlutg7rE2XSWNodef7nUDPtK9mM0qTPHJdkhm3nTKkMNLh8Q
	 +qTG1nVNmXCRVxLAF+O+dOI8HH6KpGuzUSsgRAHEsLgsYakfu2EQiajVAeqq14fvjSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197930;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=e+Tfk7p/S1gKWT7EPAhe14t+n9Uf5ZIE2e5ifVFyo6w=;
	b=iCQbAoadWLfAdQRosSjcW9rqGavjLEnv5aKTQzVWeoLtLpIVBA0fPvCZKzaJNfO/iHaG
	 K0hMG5HIPYooYtrPSuix+HNXw6IbKAHTHfXx+gDNmfwdCd7eY5FPITL/u6V/Fed3zODGH
	 UGLTMu2dvogW5P2bCDLavyfAbKurZvIufpj35Nr3xCghF3RS8lmAnw/BozD91TFXnIyxB
	 pO8FH/w/1W0IMhzxb0Zf7IE4RTP91c4UAqZW3qsbQZVUXkA7olEk1Cgjpu4DjNp1KpcRO
	 HQWV3BGNAQ9n0wru+UOcgq2zOp3YOy3mZYSZZ44vZostRjAoW33WTlPRywA9ZzcJbXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=LcDJiWMe;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AED606A335;
	Fri, 20 Nov 2026 18:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01AED606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=LcDJiWMe
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1BA0440E0218;
	Fri, 20 Nov 2026 18:05:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zLcvQwZD99pf; Fri, 20 Nov 2026 18:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795197917; bh=e+Tfk7p/S1gKWT7EPAhe14t+n9Uf5ZIE2e5ifVFyo6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LcDJiWMezofICs8s3MettE5E0C1jTn6g408qnwnH2NkiC6G2oP7ns80JFM2E5/lj0
	 sQd1zNQt83MPhk4hhso9JFszwKoqHqo6J4lG20O2BIpDKTz/5GEjpqleNLvHRJmkYL
	 hjhlI/TUDdbLhRI00kkymqJBquhqbdycNrYzjFjkVkPgCqHR+V54VBXcepu14qjxn4
	 8DD2HiBDaAa2gW+kRFoz7QMxUXbr2ruWqadpOjVQkGk5yCtCFA+PRz6PIKGKX1UOZU
	 2gt79zQXKMsyrVcdWqWwbM4aWpAZpZDk6EZ475UEcfOUSQxB6NdHsV+R2tSXSH8tGI
	 927B+v7WqOEorUIsAhYBpJ1StiXYFT2EcaGDrBBX2gQelZsMZSNTLxZC8XfFpcfknE
	 VtP6MuVAdCwA5SGL50PQ+3eSoA1sH56n7zVIOCMC+evtkAlM+XtDAWhpUjcql6O4mC
	 d2tNKwlG4HVp2hzyQlbyQ7os/9mTeZnQQpsZG+BGzpS78EUnVg7PXlY1nFY7g+Rl78
	 +b+aNhk2lIVBQJRaYx3TLCflGDpg+GYC7udQN0jNk7JMBcyVtvYY5Xa7IU9npb/9L6
	 PH3KWbxExbzNGCqTpNj5Rk1ZhtRpdMxxyfwHi6kYhE3C6sZ1t+5ebUGClu+ViEeNYl
	 6Ju9kr0iQCzIb0nsrSEWRyXE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 37D0A40E015F;
	Fri, 20 Nov 2026 18:05:02 +0000 (UTC)
Date: Fri, 20 Nov 2026 10:04:58 -0800
From: Borislav Petkov <bp@alien8.de>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v9 0/3] Add Renesas RZ/N1x EDAC driver
Message-ID: <20261120180458.GBawCLylwSxJHsDsUr@fat_crate.local>
References: <20261120-paul-v7-3-rc1-edac-v9-0-470f2e6928cd@bootlin.com>
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
In-Reply-To: <20261120-paul-v7-3-rc1-edac-v9-0-470f2e6928cd@bootlin.com>

On Fri, Nov 20, 2026 at 05:08:33PM +0100, Paul Louvel wrote:
> The Cadence memory controller found on Renesas RZ/N1x SoCs supports ECC
> with SECDED.

Please throttle your patchset spamming:

From: Documentation/process/submitting-patches.rst

Don't get discouraged - or impatient
------------------------------------

After you have submitted your change, be patient and wait.  Reviewers are
busy people and may not get to your patch right away.

Once upon a time, patches used to disappear into the void without comment,
but the development process works more smoothly than that now.  You should
receive comments within a week or so; if that does not happen, make sure
that you have sent your patches to the right place.  Wait for a minimum of
						     ^^^^^^^^^^^^^^^^^^^^^

one week before resubmitting or pinging reviewers - possibly longer during
^^^^^^^^

busy times like merge windows.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
