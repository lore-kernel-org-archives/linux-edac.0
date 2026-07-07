Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403B32EC09B
	for <linux-edac@vger.kernel.org>; Tue,  7 Jul 2026 07:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410688; cv=none; b=ZL7XseZB24mUtgQgXtq1+NcyZfRfW5iQHA33KlFZ1Gr7jeL29jTp96BT+pKz/6ZMYJmsXTPV+4U+N1fOPb1C+ONcoWL73QdhdAyC5PKeqzT3gqqczGB7OcbhW7dCO+f9VEOfYVc6BGAEe/F5iRWidxj7EWwpTTDS/JFsGxBVGRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410688; c=relaxed/simple;
	bh=c2S0T0GUrx/y2ahRiZS6MvNyHzlAyMREkytaOj5XJZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jr9gGy2cPS4qkk3BwTpzRwCxI8z5baz9Fcv1I+Q1N1ox3ZePja0dFVzzkC59Sm+9iL1yrBdVFqppk+hA1dV16mY+TyP7D2K4CUJ2XtzQfo++jdky23GfOjGGVeFchCKDNFM8F9Cw6ZAPCzZYPgbqwFE6MqdWK3aLWd5VgxvUPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwYM/HfG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwYM/HfG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E2A1F000E9;
	Tue,  7 Jul 2026 07:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783410686;
	bh=SUkqFQHAChEnyb0j7i20Q/Ia/HvMxsq9XrMf3R1nvN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fwYM/HfGGFIih7tJF7UcjNWX43LPfCn/iPDWojcN8HBlaTRKGE2C1aljSwCkGF704
	 mXCD3hPfg9y5n+vCOkbNZNqfpEJWoplVATVf0H1B8lKRU5aSnUN1e1ju9pcR7NEOLe
	 LHjwt1/XFarRiBwKhKPNA3GYRzKhuYUybqKwdpmAhLAQ1s4cn0JGpVe6eq+pT8Pbfm
	 n706p9QLwrblWCcZvYWtOhe6wN1t2GyGhZNF4+YnSV0y6n7Hv2+AKbTA7CGaa5QsAG
	 oYvkgFSxLzWYFVlpQBe5QncLFq5O3Avu8i1i3vgRksVnegfSe9kos6tHy7GJRc6YiL
	 0FbEO607AecWQ==
Date: Tue, 7 Jul 2026 09:51:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-edac@vger.kernel.org, Alex Williamson <alex@shazbot.org>, Paolo
 Bonzini <pbonzini@redhat.com>, zhenwei pi <zhenwei.pi@linux.dev>, "Gonglei
 (Arei)" <arei.gonglei@huawei.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Alex =?UTF-8?B?QmVu?=
 =?UTF-8?B?bsOpZQ==?= <alex.bennee@linaro.org>, Zhao Liu
 <zhao1.liu@intel.com>, Lukas Straub <lukasstraub2@web.de>, Stefan Hajnoczi
 <stefanha@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Remove linux-edac
Message-ID: <20260707095119.4d1107af@foz.lan>
In-Reply-To: <20260703152529.GBakfUaQdmKSLZfqrt@fat_crate.local>
References: <20260629213624.936258-1-jsnow@redhat.com>
	<20260629230756.GCakL6zDDd_g8DIeGD@fat_crate.local>
	<akN99Ov2ngf2BwbG@redhat.com>
	<20260630192154.GBakQXUjMfaPrpc6-u@fat_crate.local>
	<20260703152529.GBakfUaQdmKSLZfqrt@fat_crate.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Fri, 3 Jul 2026 08:25:29 -0700
Borislav Petkov <bp@alien8.de> wrote:

> On Tue, Jun 30, 2026 at 12:21:54PM -0700, Borislav Petkov wrote:
> > On Tue, Jun 30, 2026 at 09:27:32AM +0100, Daniel P. Berrang=C3=A9 wrote=
: =20
> > > > Why is this thread CCing linux-edac?
> > > >=20
> > > > I don't see any relation here... =20
> > >=20
> > > The linux-edac list was recently added to the QEMU MAINTAINERS
> > > file:
> > >=20
> > >   https://gitlab.com/qemu-project/qemu/-/commit/4c5e70b9a42744401fc10=
b17cc61820586ba4a13
> > >=20
> > > and the entry matches the qapi/acpi-hest.json file that John has
> > > modified, so gets auto-CC'd.
> > >=20
> > > Admittedly the content in this series is not especially relevant
> > > to the liunux-edac list in this case, but the patch submission
> > > tools are just following the declared MAINTAINERS file entry. =20
> >=20
> > Thanks for letting me know.
> >=20
> > @Mauro, please remove a linux-kernel mailing list from being CCed with =
qemu
> > patches. This is only going to cause a huuuge confusion as it is already
> > showing.

I was in vacations, so I only noticed this patch today.

We use linux-edac for userspace at least since Rasdaemon beginning,
so it was never a kernel-only ML. What happened in practice on the
recent times is that rasdaemon patches are usually pushed as PR
requests at github. Yet, still today, it is recommended to also
submit them to linux-edac ML:

	https://github.com/mchehab/rasdaemon#submitting-patches

Yet, I agree that having a separate ML for userspace RAS tools
makes sense. I'll check on a separate thread if we can create
one such list at vger.

> >=20
> > Please do a separate list only for qemu RAS stuff.=20

Instead of adding a patch removing it, better to wait for the ML=20
creation and then apply a QEMU patch changing it, and another one
to rasdaemon.

Regards,
Mauro

>=20
> ---
>=20
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> Date: Fri, 3 Jul 2026 08:19:53 -0700
> Subject: [PATCH] MAINTAINERS: Remove linux-edac
>=20
> The commit
>=20
>   4c5e70b9a427 ("MAINTAINERS: update HEST maintainership entries")
>=20
> added a linux kernel mailing list (linux-edac) which gets CCed
> automatically with qemu patches. This is absolutely confusing and it
> should not happen. Qemu should have its own ras mailing list where stuff
> like that goes.
>=20
> Drop that list.
>=20
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 97dcc78ded61..3664c0d67677 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2274,7 +2274,6 @@ F: docs/devel/testing/acpi-bits.rst
> =20
>  ACPI/HEST/GHES
>  M: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> -L: linux-edac@vger.kernel.org
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/acpi/ghes.c



Thanks,
Mauro
