Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7A8381AFB;
	Mon, 10 Aug 2026 14:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370602; cv=none; b=HnY/TF5v6QrJFTJOpVv1Ui0RbjK450yncvMLDcLEX/gqxXxlaGl26NWpSK0WHaIa8FLElHmAAcPj4OAQvNPZQQgTf6z83OgvfhBbko3CRgcEMwqmj+4uA8MtBOgEHpTHOZSTF6IG+XqH4wcVxibU7LKTObBpt0eRs+6tfcI0oN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370602; c=relaxed/simple;
	bh=PLTFNlxmfZnluw3lrmK2dvWW7y/hPCNzql0E1f/F1NE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=tvup/wfgrFUdjcKf9UPvmlCQZqDRLQaODp1vTO0fOrJ5B9Sv2aGDIF7z0QIz8reLPB3GiTZ4dPjvKIe8Vzl2v08wZmJlOaGEmFg3gGl+ime3AFWDbj55c+pIDx6jWQy6zgMAbe04oimmm8qQCFrc9gK5iKhBNJWBPLoAEeoeh9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9+I7wnn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9+I7wnn"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D52AB1F000E9;
	Mon, 10 Aug 2026 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786370601;
	bh=PLTFNlxmfZnluw3lrmK2dvWW7y/hPCNzql0E1f/F1NE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=M9+I7wnnd4k8hb2GZAJuUbY7tptqoXDHY35E1ZgHFN4SkhLunaUg4OsVfH3O6xMfH
	 Do8YoR78L3XvXFAzgUINNKE1+dVJsSBb37wskK7jAI+wC0FjI3RIUnVIHx2Sq33CiR
	 eG2PztbDcVoVZOFOEPgt97zBNDWVM44SdOdMPqFXOppNvErRLTKgY6tABMlRQyCass
	 KlaVBZi+nRCVKlUiE/HqEeM+JP7Jn/uHktzG2OD8q3AB9TXNmEc6lYqXQfnFybctz9
	 JjjYTjBwm2sdmHdxC1n4NUCVp8KgaWUAgimbDeicCtM5HglesO0aXPQ8iWxqL9CXe1
	 erkliNcthRl0A==
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=286f580f11416b2d2a5c68b49ff507d9abfc06251ea1c6c09a03767a470c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 10 Aug 2026 16:03:17 +0200
Message-Id: <DKLBIZ7ZBP1K.20VHSP02I6BW2@kernel.org>
Subject: Re: [PATCH RESEND] powerpc/configs: enable CONFIG_RAS to fix EDAC
 support
Cc: "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Christophe
 Leroy" <chleroy@kernel.org>, "Tony Luck" <tony.luck@intel.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Janusz
 Krzysztofik" <jmkrzyszt@gmail.com>, "Takashi Iwai" <tiwai@suse.de>, "David
 Heidelberg" <david@ixit.cz>, <linux-edac@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Borislav Petkov" <bp@alien8.de>
X-Mailer: aerc 0.20.0
References: <20260730105546.3658570-1-mwalle@kernel.org>
 <20260730185620.GDamueVIGV-8iIzozX@fat_crate.local>
 <DKC6Z5YGBF2O.TAJAN566BN0L@kernel.org>
 <20260731022855.GNamwIZw7Fz4Yhk__S@fat_crate.local>
 <DKL4118H7S5U.1FN3E4DBY4GHF@kernel.org>
 <20260810135020.GBannXHLXtUlqJjzqS@fat_crate.local>
In-Reply-To: <20260810135020.GBannXHLXtUlqJjzqS@fat_crate.local>

--286f580f11416b2d2a5c68b49ff507d9abfc06251ea1c6c09a03767a470c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Aug 10, 2026 at 3:50 PM CEST, Borislav Petkov wrote:
>> And while doing that it will break (at least) the corenet32_smp_defconfi=
g,
>> because it removes the "select RAS" (which was on the EDAC_MM_EDAC symbo=
l).
>
> And things like that are fixed by adjusting the config. Basically your pa=
tch.
>
> So whoever picks it up, can add:
>
> Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

Thanks! Christophe already pointed out [1] that it should go via the
same tree as the commit it fixed, i.e. the EDAC tree.

-michael

[1] https://lore.kernel.org/all/1500e19d-9bd3-4050-8568-31b546f0b22e@kernel=
.org/

--286f580f11416b2d2a5c68b49ff507d9abfc06251ea1c6c09a03767a470c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCannaJRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gNlwGAhtavgVGyN1VN9r110B1+4Uyn1aZkJ4AF
EdDhMHp6PzUVyOqLmecwEN47l1jbetgHAYDHONeXALMdJkWx0TV7ubizRmS/jmmA
aK/pJO6JnC5xYRuR4BOHVyilzBNBx+CKuQ0=
=G7pb
-----END PGP SIGNATURE-----

--286f580f11416b2d2a5c68b49ff507d9abfc06251ea1c6c09a03767a470c--
