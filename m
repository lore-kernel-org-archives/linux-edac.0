Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45973FC5B2;
	Tue,  9 Jun 2026 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002789; cv=none; b=RPvePC6K09uTqFveacLLLq1lBTmdisgIYYdtPJYZLYVNz7bu476tKWndWliZnhf71qRftN6wTXfBjbNpdVb3K8mD2LjjD9VhYL7i7lX2HE0k6oVttCmNUrYrCoyPUQ8CuV0LATByw9aLI5iZTR5OJPktAuVqxdLF88a9pxu4qcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002789; c=relaxed/simple;
	bh=RRMKz61eU/qazirPmxhX71QM3GYhCSbCBP1IKdOJPo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4IIkIE4pkG5AI9NRsjtcdg7+GMxhXyaK007ur3+VSJCqwN5+uXmq8y5dZz4+PIcP7DGm2es8jSW9XINU7xFLu/EFUQBmVKyEaovVAV/YNFbAN1wzAkJO3cOlv9D9p4xgZE9uKTOn4wlZxQk06tKDv/vJP7cmg6vBh8BfJN7bN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYOZ5iDY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYOZ5iDY"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9EC8F1F00893;
	Tue,  9 Jun 2026 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002788;
	bh=Rn+Dr9BD3C7wnM3j3bbxNoKy5N15VK6KnDJlWNanx/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZYOZ5iDYOxtU0C78QxnXi/a0YImlSXF/N0QrBwuuEpHos/SZGhyYFwCOOukIyFe9o
	 zQ2m6BZwgFvu+W5Nf4bkzAgPhrndcUrqQ0F7LyhmOnjt/+UoWlvL35jwD/8j1yRFI6
	 M3f3GJksMX3unyLcIQbuOTQ1a3M7EdpP3oTdPM1t7+vlQOIJ/RLXm+eoCP8B1fqDDS
	 IgFCUwGpF7DC528LzRU89NDctv16B63j8nnA8OK+TLb1zub5iDQ2vXk+VgvBWRywzy
	 mjkQC8vv24+TSVaXVgHfnVcUufD0Z8K1nCZhlUQrsfT6NPrPoaF8uzmgovJiU8pRqU
	 GHbl/OwGx8chg==
Date: Tue, 9 Jun 2026 12:59:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mark Gross <markgross@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Prabhjot Khurana <prabhjot.khurana@intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Tony Luck <tony.luck@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update Mark Gross's email contact
Message-ID: <aifwwRbyH-lCxACQ@monoceros>
References: <20260526-arrogant-lime-ibis-3cf01c@meerkat>
 <20260526193238.3622176-2-ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="plxqbwsx35ethxj4"
Content-Disposition: inline
In-Reply-To: <20260526193238.3622176-2-ukleinek@kernel.org>


--plxqbwsx35ethxj4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] MAINTAINERS: Update Mark Gross's email contact
MIME-Version: 1.0

Hello,

On Tue, May 26, 2026 at 09:32:38PM +0200, Uwe Kleine-K=F6nig wrote:
> Mark's intel address doesn't exist any more, update the maintainer entry
> that is still using it to his kernel.org address that is already used in
> other entries.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4087b67bbc69..021a45e7cc1a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13206,7 +13206,7 @@ F:	drivers/crypto/intel/keembay/ocs-aes.h
> =20
>  INTEL KEEM BAY OCS ECC CRYPTO DRIVER
>  M:	Prabhjot Khurana <prabhjot.khurana@intel.com>
> -M:	Mark Gross <mgross@linux.intel.com>
> +M:	Mark Gross <markgross@kernel.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/crypto/intel,keembay-ocs-ecc.yaml
>  F:	drivers/crypto/intel/keembay/Kconfig
>=20
> base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246

It would be great to get this patch in to reduce annoyance for patch
senders.

@akpm: Can you maybe pick up this patch?

I didn't hear anything from Mark himself about this discussion, so an
alternative is to go back to my v1[1] that removed Mark from
MAINTAINERS?!

Best regards
Uwe

[1] https://lore.kernel.org/all/20260526173806.3227828-2-ukleinek@kernel.or=
g/

--plxqbwsx35ethxj4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmon8h8ACgkQj4D7WH0S
/k78bgf/Tr0Jdpg4/F4jkySPs6ooXUr4jjG4fz40WWmeHoF1Lr5T20iXQyoPcEYx
t1VshXt1rsYmMdi4hI+Sr7UoAFjNDPrNHtc/35Iv2FFULw0YE1HYZck01+Q++0nn
nxKYO5XyL6qvNj+4zJyB4NbkVsP9jwERHEmc0Izr8ksVwYsABbK4edZON1F1ONJy
RrNtitBndgsJx/BPzLPIsTj/WZ1Gvs9vsZplnKb256EQUAmZuomGEV2lByzy3qPG
DzKzjXDvXc9qWESLaZF9s/ooxQGe1+8y/uoewLl5N3VCGOJT5cXMLvP+uOtA8Bek
JKtzqD/K033Ftk3WN8lB1xRMpFCO3A==
=0lel
-----END PGP SIGNATURE-----

--plxqbwsx35ethxj4--
