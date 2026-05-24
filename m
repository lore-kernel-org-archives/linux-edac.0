Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF9B3438B5;
	Sun, 24 May 2026 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779657221; cv=none; b=ugdKwSAfhKVMjhxuupLfg9CHYl8MUNbkQN81LsrANRuD2RSpsiiXskZAXsYjfsa3fxveUmE0jcEIOrdUJzLx7+Q5tnLoZn5uBudYD3LeMAiqnsV/2hJi7ZRdTSGstwmGqiWiBOf8c/4Sz5pFWuwpDZnUk91NnRwbVfVe3TQqHno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779657221; c=relaxed/simple;
	bh=aQ7gWQCutGNFCqqbeQNP6LcA+psRTiMyVM6ge222JTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fh1wrDXqzafy4WqudXvPHkKbaY1Pg7cPxY9epvQaB2BNefnU0ebKyRMrgLmxIBH66KwultFGQkm3Kslpe+mD24dMWHSxvx3Xn2YztxgipaP0KfUr52sEVyp/g8cKlrzaG6Pg0tN/pgUA7tdBn2NseGQ7IwVfHz3AAmecA8duipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=BFV47Zdg reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="BFV47Zdg"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B20F340E01B5;
	Sun, 24 May 2026 21:13:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id I1YrGl8KF5DP; Sun, 24 May 2026 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779657205; bh=H0uYSPxB5pYJQM/EMMb0d+nqSJm1DSMSjC50bEf6lB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFV47ZdghBTlPL5hIv1ShDX6rClSth2X86c2Bg8pQ9XmWI/G9CwZ2lVWx7fViggjs
	 C6DV1TDvdssQmo/+zBOkGmmUSTi+RvSuAGLgwyqv0Hv9b90EheyJsYCszlEWwDR8tv
	 BsrIbZr3zO1fiFhj4mfykRRxJrtvw14EZyyzrgS2GvdYb+Zq12/B6EZ45tdWehgmVC
	 A59uknrJPOEgQy1xayepdcvCLePjHVfTA39buoSPb7C3XXOBMkfQ5L4aFlzaoQfxUZ
	 xG/LSkEanXiVkHI+dmx+cCNUaUQu9zemFZUx3Q4gM4/R9v7kEATnDX0lB9L/58hZ8v
	 0+lz31Ca/BR6DiyXDVAc9VZitw4D74140pllr5GR9nMhcfQ615g3Rz+nArRj/wJZdj
	 7hnTX13pJybW38rcwaI3+GHffDW1u9uFLuLu1MAjDvc9nvpryYsX6wJKdoTkexNDBX
	 XRqQuGiSiso589bl5ha70pNsgi2SlWguQ0Gxkge7f7musx+i9u7SAf4eFYsGDF3WUk
	 0y9RZ6X5Chs1qwaeLx0YGhPyPpKcbP48x1gDZAAD3K8aDvZ5ZtQ8Xkwrp3AR51VA9b
	 ZUx9tpHSMUoZQ/LzUOzkX95WV6JQHJC0DMU1tDvQGkERfkhHHlN3kvjlmspoCluP/x
	 apsqEKOrPw6wQR4coABJ2v/Q=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 388B240E00C0;
	Sun, 24 May 2026 21:13:16 +0000 (UTC)
Date: Sun, 24 May 2026 14:13:05 -0700
From: Borislav Petkov <bp@alien8.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Tony Luck <tony.luck@intel.com>, Mark Gross <markgross@kernel.org>,
	"Arvind R." <arvino55@gmail.com>, Jason Baron <jbaron@akamai.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] edac: Consistently define pci_device_ids using named
 initializers
Message-ID: <20260524211305.GBahNp4fVVbGeibGXj@fat_crate.local>
References: <20260429152513.3755034-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429152513.3755034-2-u.kleine-koenig@baylibre.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 05:25:13PM +0200, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> ... and PCI device helpers.
>=20
> The various struct pci_device_id arrays were initialized mostly by one
> of the PCI_DEVICE macros and then list expressions. The latter isn't
> easily readable if you're not into PCI. Using named initializers is mor=
e
> explicit and thus easier to parse.
>=20
> Also use PCI_DEVICE* helper macros to assign .vendor, .device,
> .subvendor and .subdevice where appropriate and skip explicit
> assignments of 0 (which the compiler takes care of).
>=20
> The secret plan is to make struct pci_device_id::driver_data an
> anonymous union (similar to
> https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylib=
re.com/)
> and that requires named initializers. But it's also a nice cleanup on
> its own.
>=20
> This change doesn't introduce changes to the compiled pci_device_id
> arrays. Tested on x86 and arm64.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
> ---
> Hello,
>=20
> the mentioned follow-up quest allows to do
>=20
> 	-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_1), .driver_data=
 =3D (kernel_ulong_t)&snb_cfg },
> 	+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_1), .driver_data=
_ptr =3D &snb_cfg },
>=20
> which gets rid of a bunch of casts and so brings a little bit more type
> safety. This patch is a preparation for that.
>=20
> I assume a single patch for all of drivers/edac is fine. If not I can
> split per driver.
>=20
> Best regards
> Uwe
>=20
>  drivers/edac/amd76x_edac.c  |  16 ++---
>  drivers/edac/e752x_edac.c   |  28 ++++----
>  drivers/edac/e7xxx_edac.c   |  28 ++++----
>  drivers/edac/edac_mc.h      |   4 +-
>  drivers/edac/i3000_edac.c   |  10 +--
>  drivers/edac/i3200_edac.c   |  10 +--
>  drivers/edac/i82860_edac.c  |  10 +--
>  drivers/edac/i82875p_edac.c |  12 ++--
>  drivers/edac/i82975x_edac.c |  11 ++-
>  drivers/edac/ie31200_edac.c |  86 ++++++++++++------------
>  drivers/edac/igen6_edac.c   | 130 ++++++++++++++++++------------------
>  drivers/edac/x38_edac.c     |  10 +--
>  12 files changed, 177 insertions(+), 178 deletions(-)

Applied, thanks.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
