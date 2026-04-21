Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84F7285CA4;
	Tue, 21 Apr 2026 17:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776791878; cv=none; b=a0zxFKObD7s84AnHqMmUa5c58objL16k94be4lqifm+gvUXNutCntlSskmwrCgdP70XwkmJTm8NkYnfpA9pWME7a6I+fQUXhjRKSVVFyCiPWbiv7iuvjwzu4dikalMFLR6nyLtVeHsqpZBQcjEBBLxL2jw+jqR7+R08/pv/lzgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776791878; c=relaxed/simple;
	bh=ZHXUvun2TlKFXNCDSGQdCTzBZQfFlVJtfqEGkFlFT20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2P3IXIwEtnDWuxax5S+BL9J0aZVc9sN5NpXRWyFBv1gC0gHkFPx5BfvbzHrKk7t5qkfErU1PbLBAHlP1fuNidEdbRRhQWWmZs2D/hym3kUs2N49oxl1dBOa9uogq4a7Hy1oEBsD8PU5aGbPe6VGVqEe58vK1a9fQPxeerV8iFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJmIYNUG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJmIYNUG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E1FC2BCB0;
	Tue, 21 Apr 2026 17:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776791878;
	bh=ZHXUvun2TlKFXNCDSGQdCTzBZQfFlVJtfqEGkFlFT20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJmIYNUGWE2v3JDEqFV3v8ed2ikp+LWBQZJi36TrGru35KaAVU3pn2FyE/vtqeLm8
	 +E16BGoVTPxvHJ+eFD+szgxRN2Hoo1mKFZKjEfIs+vt4SfE/7RV3OBETmFyob/q7/U
	 6zSF+V0JUAZ2+dXydHqUS+EjvqrjPgdFNMy2rLUmtQvSC7DjLbfKxvndaChmvh0bbK
	 tjgf8ks24gZAIiHsaax69GWY5LV/lCeRFc4eE6YMuVJ4nmN48uU1efR6rylW0SX29W
	 ztImcTaw2ZxMHhOkmeoVENDqD7WjxTS4nBM3iz9Xs9F5VUZHj8WGpQjxoOs+FZsInY
	 +YehVknVIJQYQ==
Date: Tue, 21 Apr 2026 18:17:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: dw: Add VersalNet compatible string
Message-ID: <20260421-exorcist-panther-d43470a97cec@spud>
References: <20260421103059.2484623-1-shubhrajyoti.datta@amd.com>
 <20260421103059.2484623-3-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dQx2Rh1ek9fvUPx8"
Content-Disposition: inline
In-Reply-To: <20260421103059.2484623-3-shubhrajyoti.datta@amd.com>


--dQx2Rh1ek9fvUPx8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 04:00:59PM +0530, Shubhrajyoti Datta wrote:
> Add amd,versalnet-dw-i3c-master to the of_match table with
> snps,dw-i3c-master-1.00a as the generic fallback.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>=20
>  drivers/i3c/master/dw-i3c-master.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index d6bdb32397fb..69fef7fdda37 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1845,6 +1845,7 @@ static const struct of_device_id dw_i3c_master_of_m=
atch[] =3D {
>  	{ .compatible =3D "altr,agilex5-dw-i3c-master",
>  	  .data =3D &altr_agilex5_drvdata,
>  	},
> +	{ .compatible =3D "amd,versalnet-dw-i3c-master", },

This shouldn't be needed, you use the snps compatible as a fallback and
have no driver data.

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
> --=20
> 2.34.1
>=20

--dQx2Rh1ek9fvUPx8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeexQgAKCRB4tDGHoIJi
0qvGAP9/+7DnoRT1GExnrC2mRyrY3z5Oqr4kZPP0XiqlO/y9ZQD/cPVmHrcfPShs
JyyvpbZ8/52F8OsKJ6oeweFr59IvKw4=
=utWa
-----END PGP SIGNATURE-----

--dQx2Rh1ek9fvUPx8--
