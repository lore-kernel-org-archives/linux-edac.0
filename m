Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82419202F71
	for <linux-edac@vger.kernel.org>; Tue, 30 Jun 2026 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847355; cv=none; b=i7aMCGCyrS/w4f5lRSKAZexGqFcT0cSjqeykdgKpexwKsOQ9Ef/hPyPu6l9gcJi6wIhkYD+QGrdNBVE1wu5UdacB3nfOT4SF6x6Jog87pAaS4XxY66G5tSa2XF+fLvbok+m0zrJ7KuUEyLFCRMYOjZDqx8x4wwy+4lQhM065QAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847355; c=relaxed/simple;
	bh=k6I828H7Bm0TvEPtLeBbFs5uMzwW8coGwi2ouPZQI6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJKCC1d2R5YJQLbEJtidVSj8uln1hdr2JVFQU313Qry9Ob3pbudBGmRffyJFHx8FZ7V0YQsFFP3K/MECRq8BOR8kiQFwLRPE1YCkVbC/ef7wQdjPQZCXZR0Qu2wjRcmxq4hHMqFDISySNMoKM5l0cXj+O8rmZIrjvvTdYfuAsMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=f65DD/DN reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="f65DD/DN"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3B2A140E00BA;
	Tue, 30 Jun 2026 19:22:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YVo1ovhGLYJA; Tue, 30 Jun 2026 19:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782847336; bh=1JZ76zwI+8HXTbK3tedNL3TuIa9C1gm4JFVx2mqP8bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f65DD/DNFHO/ifVhACLAc44kmeocymkXrSWiiGD5e/0aeHlvwGobQUqiLM9LMk1HW
	 5fCO8triQc/vJhcgTxAthj252hmEeriPnUf9ccTKjnUMGofLZc4DfNa9qXKs0bCOYH
	 aJSmuLEiq7oWU0lR3d8NaqyaWM44h3lNNv18ic9UqKEyq2F1pnPW27c4vs++je27p6
	 3a399jPAjNXZdXj6HLha6yxD+h1Z/GFzHtUun2KvtcRvmajWeLckH5wLbLzx16htZj
	 2wY0zxEUrXDXZTq0VkhX0wvZZBbPWVB64/Dq3mdkx+VE8n3VX1/RyIHt44S1CRpt0w
	 RTbz7BinvhJjRMHH8MC1/8rQftsNB+SIi8j51q0K96cQhK/ltoaEDew5qHxCsDww8D
	 WfGc+w7UChUpqhfMQpVLoDT7i/SMnOX9yrB7dup0ucu5aX6RpFEX4Nki5rxguTPDfu
	 Lo6NZMqH40Wemrl2lcFWMcNVc169e1KhWI4NVVnjnnqVuBeAdYalXd8fS1432xXE3W
	 xJs3uAJhVeUBaNgTZmBqQmOKJJbC/cMeT4dPVAHkbPB7h7ADqFzPQXiNKFD+lf26g5
	 MmaOLcUE6rUc6x/AHYD/y0IhG+Hm/mfheP7b49jmSAYOW/Jwlxmf2LsUHWi42JMWNM
	 RUTXxouiXKyk7sqzt2A7Qmgs=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1DCA040E00BF;
	Tue, 30 Jun 2026 19:21:58 +0000 (UTC)
Date: Tue, 30 Jun 2026 12:21:54 -0700
From: Borislav Petkov <bp@alien8.de>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	linux-edac@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
	Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	zhenwei pi <zhenwei.pi@linux.dev>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Eric Blake <eblake@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>, Lukas Straub <lukasstraub2@web.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 00/14] qapi: convert to explicit intro section syntax
Message-ID: <20260630192154.GBakQXUjMfaPrpc6-u@fat_crate.local>
References: <20260629213624.936258-1-jsnow@redhat.com>
 <20260629230756.GCakL6zDDd_g8DIeGD@fat_crate.local>
 <akN99Ov2ngf2BwbG@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <akN99Ov2ngf2BwbG@redhat.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 09:27:32AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > Why is this thread CCing linux-edac?
> >=20
> > I don't see any relation here...
>=20
> The linux-edac list was recently added to the QEMU MAINTAINERS
> file:
>=20
>   https://gitlab.com/qemu-project/qemu/-/commit/4c5e70b9a42744401fc10b1=
7cc61820586ba4a13
>=20
> and the entry matches the qapi/acpi-hest.json file that John has
> modified, so gets auto-CC'd.
>=20
> Admittedly the content in this series is not especially relevant
> to the liunux-edac list in this case, but the patch submission
> tools are just following the declared MAINTAINERS file entry.

Thanks for letting me know.

@Mauro, please remove a linux-kernel mailing list from being CCed with qe=
mu
patches. This is only going to cause a huuuge confusion as it is already
showing.

Please do a separate list only for qemu RAS stuff.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
