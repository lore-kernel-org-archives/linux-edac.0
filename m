Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389642D12ED;
	Tue, 21 Apr 2026 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776791836; cv=none; b=PmUgku/veVqSbwS/AapMPO1rLnwqkSe1jCd5TArUW5sAqBTVfx0PjA4FqQ31pInQfmcCpZLktj0PyOUYRylKDGHwjLRSmKImB7iyj3v5+zRGrGFTckSpeIN9vIcOfnVf/fgtomdwhfVib2Gd4sqV70mI6fkUUdhg7E0R+XE7jOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776791836; c=relaxed/simple;
	bh=qz+UTYnQ/3atOxznUSJQeJ0xPXa7iKA7CMp5q359fEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izf4bX+0huirNzyO4Vb7GNTkc09pYekJmbkD5o/GOdgYbogJsu6vyw/M6arOhyvjw8qsqtK/0iJbfGWb/kEjip/LDo/DINmvR+9JZiGoaiOUhpP+ZaLUkuj79h09e2U+gsChdgZFvCfdqgjvpNrmQUNwZTNYUUAcX3Bh2NKMubk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBbDXwix; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBbDXwix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB95C2BCB0;
	Tue, 21 Apr 2026 17:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776791835;
	bh=qz+UTYnQ/3atOxznUSJQeJ0xPXa7iKA7CMp5q359fEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBbDXwixTZZiXhJr5NbyCGPcqYmn4rAG6fS81WLVX9BCBZ6yyad5eT2IEsO6VrujO
	 0TTtQWc3+/WEerkk6UfzK2QYZYzHIaHPH7HjDQrtEWonkGkX/aVgpnDdS0vUJ7cygu
	 8PgBzCrFUWGDiYYxSXisODx78YcBvjcLs0ArN/9qvqrc+tan7Cora3gbD+53RMixEq
	 +39wnN59/y9KI4xW6Iu5ALpyI/3kIcfcc16CktJTGYQp4drzMZwmG3zWPNYBHx9a20
	 jaRohjWhxDt2dytVRUSUshtlLUbEqzScTyPIpHM0BqmbgXR9cf3wTW5khHuD3pJEVS
	 2q2fdUK2esxAw==
Date: Tue, 21 Apr 2026 18:17:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add VersalNet compatible string
Message-ID: <20260421-voting-proofs-3a4b86df5383@spud>
References: <20260421103059.2484623-1-shubhrajyoti.datta@amd.com>
 <20260421103059.2484623-2-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bpRFO5pIWMcCxPid"
Content-Disposition: inline
In-Reply-To: <20260421103059.2484623-2-shubhrajyoti.datta@amd.com>


--bpRFO5pIWMcCxPid
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 04:00:58PM +0530, Shubhrajyoti Datta wrote:
> Add amd,versalnet-dw-i3c-master as a vendor-specific compatible
> for the i3c ip available on Versal NET SOC.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>=20
>  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index e803457d3f55..98dafec0ace5 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -18,6 +18,7 @@ properties:
>        - const: snps,dw-i3c-master-1.00a
>        - items:
>            - const: altr,agilex5-dw-i3c-master
> +          - const: amd,versalnet-dw-i3c-master
>            - const: snps,dw-i3c-master-1.00a

Yeah, no... This will just introduce warnings for the existing platform
and is incorrect on your platform because the altera compatible will
match before yours, dragging in the quirk that platform has.

You need to make this into and enum with your new compatible and the
altera one, with a fallback to the snps one.

pw-bot: changes-requested

> =20
>    reg:
> --=20
> 2.34.1
>=20

--bpRFO5pIWMcCxPid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeexFwAKCRB4tDGHoIJi
0smmAP9xAHCFNlFYQbAU2Kk3Ai7/0TbhcEH/CPDO0GF21BegpAEA/PXycRys1LQG
K/mWElDS/CbUjBfHgI8siu6raNZvcQo=
=zI7w
-----END PGP SIGNATURE-----

--bpRFO5pIWMcCxPid--
