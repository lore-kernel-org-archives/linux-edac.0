Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997559;
	b=yqJJD3VTD/TgxNTFA15k7aoOCgUBaTCejR1hgcbalXy1zS/4R3APhFmuWXneZH44FCgV
	 0zVNO1OqL7cFE+oPFL6PKU/0XfZ8bLdI5RTgEWNfP+aK71jyXqgMvCLZqdg8XFtstTuWB
	 KyC3LGzxbqR3Op40dvC5iKWudo3p7yb6+HrBDii9n9t98wPB5gPrKhDsw5iz13XXJm72s
	 +m+6TUzcQTWQw2kku12BY197iGQ9LZOcsKQ3BlKNsFqdv2sErjxeXM+W+Vc7MoZAFEDrN
	 MWfnrerugIy53lN0UMT4nlDJcKIKFw2vdSY5YJoxtP6vIH16BztFT27lMK1iuhKXDQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997559;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5+A/JE9HHMD6dVa1CZzmW3mLu2nIXMpf4wNuwenC3+U=;
	b=T915W7zIiWOqK9ul6Sl5BNOh3+AakJ/zPxxKgTidoLuzyLH1O1XXhtF3AM8iDCUwQqV6
	 7t9Z6ycpgh7yV/VVKMqxsZ8W8XZt4CDzrTwLFrr+gDCGphpUg/PodRLgY+6fskhqeAWxy
	 Ra5gb2v+TDg2Q7sTH4OxEQHFSdw/KNhydyBNQFv8HMNtT8GbiPAOS2UFq+TzulF19/+tb
	 Qwd+kXIhaeMKBR6G0uavZgD1JMSYfDCJ9S0EoGI/vqGPZUMqwXc6tSRbkmZYgXkvF8SWr
	 Yo52osc66i9pekcr14+W/x2EviYZAzlEgluPgXM0mamI6Acj4FJMIGHaocdViD13Aug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=GxTQyBaS;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E99606A32A
	for <linux-edac@vger.kernel.org>; Wed, 18 Nov 2026 10:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E99606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=GxTQyBaS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5+A/
	JE9HHMD6dVa1CZzmW3mLu2nIXMpf4wNuwenC3+U=; b=GxTQyBaSgKQuxxOenLFT
	O84dJiQJBpcVrYoxyFGunEe+EqcW1TheaLc1BQWC+xBwFjJ2LpOtIOq+wvm2BFzH
	bKKJZ9qjN9FRSbQ/Zvlc207xaTyTcnZtgcmvAsPYsiKap7lbde0Rpo9PsSu6ZyNv
	TwrWjDnT7UyankInaIMJFf63BOUGe0E5AMWv7nxpBnze5To7ZNfyCKfwMLjhyA0l
	G546ZGw5rULm6VfXgJJyLiuIKvcA8o4V3ZmgL3Djn+AYCYDQsAD400X5mi5YxqGg
	omAXhygeDTQjxgjEZ65HveExb8xWXHMzl/K7mkQs3k+Z7qgBOnw8Vlr7AwIWVPju
	iw==
Received: (qmail 613206 invoked from network); 18 Nov 2026 11:25:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2026 11:25:53 +0100
X-UD-Smtp-Session: l3s3148p1@ocuBb4pgPqYujnsi
Date: Wed, 18 Nov 2026 11:25:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v8 0/3] Add Renesas RZ/N1x EDAC driver
Message-ID: <av19MPAXUdBRWyup@shikoro>
References: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NCYSeN1R4nBIFoOa"
Content-Disposition: inline
In-Reply-To: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>

--NCYSeN1R4nBIFoOa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Changes in v8:
> - After discussion with Wolfram and Geert, the driver have no reason to
>   be disabled by default. Remove the status property in patch #3.
> - Reparent on next-20261116.
> - Link to v7: https://patch.msgid.link/20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com

Added Tested-by for patch 2 ;)


--NCYSeN1R4nBIFoOa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr9fTAACgkQFA3kzBSg
Kbaz2A//ZFr9og+NfiSjf3BkKGwKvg29uJAcd5HTu1pehLA6BcyBojdxor7SjFRp
kXz4KHXpvxs770gBwMM6QGN2QiLofED8gMGIg/wY9tqMh8ibtBheacty9tBg5Kha
1/XIjuG6zn78jqEYWLAhNZbruRPVSdF3MUjQR8cgdmHKelLaOofyRXuWt9au6a3b
hS3MRaWpI+lymMZKJu2yckVt6r5OfpAknbKLusuCDTtLGfFV8iFUfHkREmeR5ANI
CxgbZxbAhes5cxdYlRDSssMG83Pr1Ppj1FR+xOd7Qy0gyW2p+OO5eoy2D+01eSam
V5GTy2g06V9shiroZijB6cfuIEbStIfWGEd+SXAOTENzQPCcyRGGaBNcwwzTG1Gn
HHZOfnjg7tBtNHVXeHgJZGmccYYmPHrMpQ30Uz8U0VcGUGssuqMWqJx4WKoe2ljp
IaaeX13IcuoK4tfA6SD5gjlK+Gx97Epq+RWscHZoDsnzLQGWyqqFk449MF7cnD8/
Z8dPq2JPnOO7tktGM5Y962ckmHjFERXRujNlq0HBAtshuwoUDW79my/9AUrlIHuq
iuKPT87Ztfqqcj7vrb+yReC0liWcfSP22dSGDs2C2NvuiStY77rbHQZUEUmGWEHh
ENJwlNKZfRTsnIkYIzmrNT44OoRmr7Ha25f3C6EQfkNmHhIgNoQ=
=vTIW
-----END PGP SIGNATURE-----

--NCYSeN1R4nBIFoOa--
