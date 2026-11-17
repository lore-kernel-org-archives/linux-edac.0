Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949755;
	b=05/+lmVrrkRhLZNwtwWfoA3spVmEaGudEPIkDzYc6b/DuYuMcisu+isUai6K3aGxUTMM
	 FV8ds5fDdEFUa0Fh9SBQOTvGB9WuURNZ0hHdoO3OHUqcvMOBwXumQH3BMmmK+Iw60FRSS
	 j7pg1tRCCwyGlczMovX1EHfGQKB3+jlgmw+tOJLEgzar4cvikn2fO4u8wMb4IPVPPNGAW
	 AL8ldzJkG6al4ffQwF7ZCY5jDoFyFQy9AGcQaDfheQi1+FqaBiS+3Ejnw64ehtPWf6K42
	 JZxArRLHbC33HhTz++gWgk7uqTVuCl+t0ixorqecdK7T6DiPV8wFHIwBvDiBHJmMS3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949755;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2oPgIN/mPZ3AOqDwxPALpj+QOaOVLwizFzm9YmrV9tI=;
	b=dweXoobc7d9sjC59GdpfHofUtjRyC5xmNELRoyMcPHzoxrUiRc//58KW7n3itcWTNO71
	 T/0BEPvSaG7LggtQx0WWxwXJAkzIWf6PMPdw4bH/iQzV3eVTCm1T28azrLRTj+aji4+2W
	 QLuV/+z0UiI5WSNhGFxwFkmyFUWU0WNIjgUqaoC7H+A1irPa1eOEJMnFZc4+OnOc0LUEt
	 UDnawTCne6IJPPx7FttyVFgn24Mm0Ue/98ceLpmlTZNF0DS077lWjIhJ0WjP1zahHyAa9
	 6G0mlUl66mGMT1FKVVztHHaUuazKOHs0udwpOsF2Xw770YqgDTxS1MiHNidknAXA14g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="ky5F/SLz";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C133606A31C
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 21:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C133606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ky5F/SLz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2oPg
	IN/mPZ3AOqDwxPALpj+QOaOVLwizFzm9YmrV9tI=; b=ky5F/SLzK3uOmY5b6Reb
	fcyhNxspRrRc2N+jn6HG7ljeKluaGCWCm7D7CFUalh1ziL22uZLxuRuvtmFwApPB
	xoSnEFeW3RsbHiNyueOTOQiwlURG4r81jEIWS9AAcQ4+Au5xbGtRGKmfeZiyCHVy
	hP5fwBzaQYA9XiNH9xwKqb6gkqUzA2uTpluH0FUq13nO89uLd5HIB9A39GPHpVLM
	PlGI+SCW7ekZ5+seUSKNrDq35Htu9ZURJzFPhmy8fE8av2xeWKUWznZBD16g43Vt
	9E9126jHsQW/am1pDFhu7AbKUsOc+JDfwBk8q5OZWmCu8I6I7IxMjykB+eUDstO0
	3Q==
Received: (qmail 394249 invoked from network); 17 Nov 2026 22:09:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Nov 2026 22:09:09 +0100
X-UD-Smtp-Session: l3s3148p1@Js4tTn9ghNEujntI
Date: Tue, 17 Nov 2026 22:09:06 +0100
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
Subject: Re: [PATCH v7 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Message-ID: <avzCbuXANntvBPDz@shikoro>
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
 <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>
 <avxR5VZESPLklIuG@ninjato>
 <DMXJ5VMIPGL9.1917ON486UJRD@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="RObSsmBJ3diXCTFe"
Content-Disposition: inline
In-Reply-To: <DMXJ5VMIPGL9.1917ON486UJRD@bootlin.com>

--RObSsmBJ3diXCTFe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

> > On second thought, any reason we don't want this enabled by default?
>=20
> Please see my answer to Geert [1].
> After reconsideration, maybe it is advisable to enable it by default. Ena=
bling
> ECC is done by the bootloader, and it might be better if no further actio=
ns are
> required to enable it kernel side.
> If ECC is disabled, no errors will be generated, and the capabilties will=
 just be
> set to EDAC_CAP_NONE.

I agree that enabling ECC belongs to the bootloader. With the current DT
bindings, the Linux driver continues to work on whatever it has been set
up before (which may be nothing), or? From that point of view, I think
it makes sense to enable it by default. But again, my knowledge is
limited here...

Thanks and happy hacking,

   Wolfram


--RObSsmBJ3diXCTFe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr8wm8ACgkQFA3kzBSg
KbbyQxAAhqTncheIIBloVN0i8DH6skkYHWpdayV73dhPDxuKNsqVWO1CV+uIlVoN
m5YUEEmhr/xzi1Sk27Xh7q4wo+2rC9cPI6i3nhVoLzxRlkyPyW07AFcGGM85zq7G
D0Ixct84lWt/OIC5mLh6qiHhIssOE48csR9xSfYVscjh96PEaoIGz6Lom/KQsr/6
rmHCJAd9ElfGlzMaMYDczeSH4SY1N/AM3yin/zhtNQeJc2ZdzAmcR9uP7YvGbTVm
jHISuu1oucYnQ+yN6Fs5fazEcvnV216SkxmwnDYV/L3K4QM09UwJt9WpIOIm2cVm
TYF9hpwYEssFoH8RTbH2yPfI9D+sgrpg/kHbKbz9cV/PPrzszZHMhkpO4M5MyeJY
DvWn4d+2voIrtodvTaFuTmi3O7GBC83YSItkRKGMJEcktqg7FRcs1/wBwnjyjl5B
8yRkfHtOfiFnc+FRUaSpBZF8Oj6FPKLaJjyDbgbdDk8ZgyFOFxfzyidRZE0ncTjX
UZDk6NmW28nSrMvA2GKrk5vN6ZFj0RyEAcxPlzNmEthkM/8b6AM78pqp/1N/6dH2
jXTAg8M08plsKkGAoJ4UFDGD0izzbUjVSxpA8B9uGKS5wijQFH9mUJt/hKtHSbvp
c53WDnzX0g1zwqu6qMnhWYC5pqNAEKIo/fOssMSW6CK41bf5E/8=
=yE3h
-----END PGP SIGNATURE-----

--RObSsmBJ3diXCTFe--
