Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB303783C7
	for <linux-edac@vger.kernel.org>; Thu, 28 May 2026 08:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956320; cv=none; b=bAxHiRY+dMQUGJ1NCeL/ucpnUIu4ezKCrBwol5z1hif/wiig55ejqrF808Ved5pTRzcLFTIqda04NGpeeWNpkCXesmYtzbY2n0lzdrnDIrDt2Ox79sQmh8BZoIO9tdNOKhRSzRUuzMkszopZp/LPHkg2Bf02thpQUzy69+oNRLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956320; c=relaxed/simple;
	bh=djUAKRZ8RwK3Gc5+WZJeb8HU5Z8+eImE8hWvqOG3oH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfAHp6uaym2dfr1MYFNcYrTyk3ELQs0QFFsk0Sn8QPPDSE0YT2IVVrZyCsALiQbcV6qBdp1Th9xdsOOLAh6iP1L8dSqI8RYQS7p4+WqjPR/JT2YT1AStUnqRPTbSH6rdc9B6i6YUyt/IY5Q1DJQuVak7cdjeC5GQLpzJXDKKCb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kTb2/y+O; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kTb2/y+O"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49068493267so29331645e9.1
        for <linux-edac@vger.kernel.org>; Thu, 28 May 2026 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779956315; x=1780561115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=djUAKRZ8RwK3Gc5+WZJeb8HU5Z8+eImE8hWvqOG3oH0=;
        b=kTb2/y+O5vrNO1fNotHfY12FA3KYQ00cai91FgcIuKz7BPks6KJOy8z5hZPY1QDM5V
         6CwO5FBNWLORe6shXlJXvz2IXABr5mb0YCB5xag/XgLvl55f86R9k73T0pNnMY4tYd6R
         V5uEShEmTFwPNQeV0hyT3Ij2bNGX2lqZAeTtN3sD9QXTePxGpbqBCyPMOJqbjnVQh5B8
         If/lJB3I0QKGeihq79gOEIVuYkXXT/R3ssAkVoBmotUR7GmoVdnVG0DW4zxWuzyonni3
         V3yUxy49fw+Unuv/bt1HDaqnpZcPAJ5kBZ8NJLxVLpdO1wKaz2r4KysvGg3v3Dq6Vki2
         8KAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779956315; x=1780561115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djUAKRZ8RwK3Gc5+WZJeb8HU5Z8+eImE8hWvqOG3oH0=;
        b=JCrTcYLjQ2L92VojkJtjYHAayFdfbqnfoEhqmgPIg8LOfSeGU/2kl2PEpA1P0DXnNx
         FEFrQDLRHIlCpUrQb5BJumbR2DFZdDLN1eauch+f3QkSHA067sxl5hrDlfh7LlHcrbZf
         Sg0JgN0hIixJLfddzE7CIbzgSjEcAffbPS+lBxPpchhVfOWIBi6ggJkKTKhVCM3sKdoY
         CJk07TNcE84gmSfBB1qAJCzh8hJ2+VWumk0KmcEPs/WaMg31U6ltPX+/br/ZNtn4KSbv
         f/sn7/CBNSVecQal4tsjgQb3TxWgSory3GX+Ha0OmPy7B7tMfgWfkPNR+UI4Sd6kPLOS
         xwsg==
X-Forwarded-Encrypted: i=1; AFNElJ/EFHBpRSHpBsOZlSRMiaybayUG9Wi0Lq4ebqA4BxU9FHzEerb7ygaOPr3xfgriGX7DFZ3PwzSK2Blo@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ7vAwXd1s152aFWZKRYUleJZ/B7kz7POd5+2Gn5YkeoC35gT3
	VmdJXiW//im/ioCrvCcNjp5BCov6uiQOAmrJSPyqjVN1K0AHkVooJ3dt61N2fXIawgM=
X-Gm-Gg: Acq92OGveFoBR92SuVWJDaNuxkJep0uc+6R+Aks0GPwTU389bn9zjhhm8ppCDJwvgzn
	NPo66+XP74Y7H9TAWZ4XW2KkXJF/s5jvTVjEUArV3L4rJNmVHYQWxO0NhBa8zhOzIPWUW/0Nhlm
	J0dOGl0gWNugIwOt/z+3dthzrHmrgW5FS2oRgRrbQZ1l/i8OR7fQf//2JbaIq4rjGTOL7diMTYJ
	g0ydrNj/ZvyIp6RqO1HdtSRoYs+KmNgG2HRUJovQkCtO9om4Y+zVHy18pz3Fjeb7F4+jOj1smgZ
	PLme3snscjUFs30RyMS0Mm5V8wrq3bIsdvudItV9bi8lhKMfT+0jQDALgbPgTSUA5OMLl6ddF9f
	A4LiSaKhXDQgmItEsqVsn6N0HsjtMl0Rq+AcsVBxBcJT8Ao1bA5/B0j+y+Nsh0LlEJAyXoA6PPR
	d9DgQxd98WF/5KNkcxEWldhURs2q3EuefCxAp+zpwuFxMG/UVKbVkM+yzXw8FjQ7fD9L+iU30qE
	aqRUd5t6Z5cydVC5enZf8labg==
X-Received: by 2002:a05:600c:35c8:b0:48f:f7cc:f703 with SMTP id 5b1f17b1804b1-490428e2d58mr486323395e9.30.1779956315494;
        Thu, 28 May 2026 01:18:35 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4908eab0167sm10985625e9.16.2026.05.28.01.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 01:18:34 -0700 (PDT)
Date: Thu, 28 May 2026 10:18:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, Mark Gross <markgross@kernel.org>, 
	"Arvind R." <arvino55@gmail.com>, Jason Baron <jbaron@akamai.com>, 
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v2] edac: Consistently define pci_device_ids using named
 initializers
Message-ID: <ahf3QmE-oWP6CWrw@monoceros>
References: <20260527061057.3796383-2-u.kleine-koenig@baylibre.com>
 <20260528040038.GFahe95n8sFjjEsj1V@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5qszvd3njwo65liu"
Content-Disposition: inline
In-Reply-To: <20260528040038.GFahe95n8sFjjEsj1V@fat_crate.local>


--5qszvd3njwo65liu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] edac: Consistently define pci_device_ids using named
 initializers
MIME-Version: 1.0

Hello Boris,

On Wed, May 27, 2026 at 09:00:38PM -0700, Borislav Petkov wrote:
> On Wed, May 27, 2026 at 08:10:56AM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > Borislav Petkov asked me to do a patch for drivers/edac/igen6_edac.c
> > only on top of next, but I hope this way it's still easier.
>=20
> There was a reason why I wanted you to separate the igen6 changes - that
> driver is getting regular updates seemingly daily currently and that patc=
h of
> yours doesn't apply again.

If this conflict is in drivers/edac/igen6_edac.c, a patch for only this
driver would have aged in the same way and conflict, too? My thought was
that it's easy to split out just the changes for
drivers/edac/igen6_edac.c from a complete v2 patch if you only want
these changes, and that a complete v2 allows to create a git history
that is a tad prettier.

Sorry if that created more efforts for you.

> Anyway, I fixed up the conflicts. See below.

Looks right to me.

Best regards
Uwe

--5qszvd3njwo65liu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoX+lYACgkQj4D7WH0S
/k4pdQgAgtK3IvXe8CyA+Cjv0WjONWZBpyis1DufAHmZMLrqeYzVOsr90wC+8EpZ
Mk0LfMPRStuD4v8MRLWBc56klXVKVihjhwNgAJHLcU4wlEvtRUu5Ccr2l266TjNm
PU96EX4SXsQwG2HTEh69fbC2DIcFlK0BnJUTkpAuSI8f2nlWK9amuKtqThAoTAJd
CcKUuNpsYiBiLw+qMrPYo2ptubGMI9ZAkukKEj7T71qRXJoe/gHoXY62d2iQkHRT
ORZIAjid1EK/iTjjEmki3mlRk0tXkFYJ0y0IT9lfOeyfpjjY38bZVBIzx3SW+fmF
BMNMwUGLhIUuQQSMCQtU46efsY8XMQ==
=1wbq
-----END PGP SIGNATURE-----

--5qszvd3njwo65liu--
