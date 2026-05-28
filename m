Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E286115746F;
	Thu, 28 May 2026 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980466; cv=none; b=WnqUiZO/LB0ukFe2y331D25/U0JylOnMyjs7RFvD5/2zL1dXxUA0ikUvPvyG3iMpH6Jc+gUhcuWiMjR5sA0T9hYJ8RxErunrLB4gnpLHg1jhgk2pTZZolxzOKntpvzzR3+wTIw0xO3okzdXEoURDqLHdIGlyDytgtBwQAM6kW2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980466; c=relaxed/simple;
	bh=SwAlW2Dteq8XwOr9U6B3ETQA1qVeX4+q3Epeop4NQ7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qt594GINiuwdeBW4l/d/4+RsYvcOu4q8TNcO79s3/ArkuvFcXXPk64hiqVjkYOIdO1zep3bib4gjO8MWwWw64H3BtZWN6oUaW7iZSzfI2FstkvMzQCUin0j/3NTI7RZWROvjZQAZRJYKL3TMG02mcqnNExzAJ4+TB/GAlftOq2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=c9uwDKO5 reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="c9uwDKO5"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8359140E0140;
	Thu, 28 May 2026 14:52:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yZCA4eTEYDpo; Thu, 28 May 2026 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779979953; bh=C6y+44vL9yOYzkDTB954CyJZdmPNta/furenESzChu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c9uwDKO5/2DpRjdvnc/8pOd4/3fNZzN33wVm0iuZ9i7hQP6wuNEdxZs/tcuCJy9Mw
	 dOVCgJ98/oP9r3uLNCIS0r2HnxOnIUacwd9UOLaG0fwrPbuS/Z7aROR2QRHZebSwQY
	 XOyCuvnoNsO2BZBJT20gBfJQos1T2ofTWqPHfYTEZxvzvL+w8lDdoTbPypgcUs8PS/
	 sjOREPMztMVGZVwmZHIukT9sYRPekGg6yrDcqRnCgOWt1Erpe+Aegw5c735l4lsPcu
	 myuUZHu+1gTED2QSMVUXBu/E/CV3nJvVOghYx8jEnQ8x5cjHjTMYo/6otIUswxS7v3
	 ZbxhR8AAsjFGiQKAJJHkGK0TTWlknLJER5zoQTiFynCeR7yoER1V89ScjIe7XE+PP9
	 9bD4QkqKJjra4CzRTeV+h1e2gr4MXVKrXpBBJNRJ5pQtNN6nYAw2YFey57xB6qZUdk
	 P+O0/ivoNKJ+ulpVObJj9ZLRIwsL9yvFBkNfe/0wTjT9EdQFIAWrs4uw54ZnYapzeA
	 5DAcjtw54fznEy//2ybhxa4EOLpuxWJCvEet4iwxDK1aF+lyU/Htt4gsxlnSdo6d8l
	 v/C1vJ7ZJEtDYzB4ccdKOdHDxTV0UNdNVi7FFu5miJJcS1+RnCSiDWDleFL8GpizFU
	 OJPQRJwxKkvsnHyOD59i576s=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AB69F40E00C0;
	Thu, 28 May 2026 14:52:23 +0000 (UTC)
Date: Thu, 28 May 2026 07:52:14 -0700
From: Borislav Petkov <bp@alien8.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Tony Luck <tony.luck@intel.com>, Mark Gross <markgross@kernel.org>,
	"Arvind R." <arvino55@gmail.com>, Jason Baron <jbaron@akamai.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v2] edac: Consistently define pci_device_ids using named
 initializers
Message-ID: <20260528145214.GAahhWnvPrA16LU8p-@fat_crate.local>
References: <20260527061057.3796383-2-u.kleine-koenig@baylibre.com>
 <20260528040038.GFahe95n8sFjjEsj1V@fat_crate.local>
 <ahf3QmE-oWP6CWrw@monoceros>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ahf3QmE-oWP6CWrw@monoceros>
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 10:18:33AM +0200, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> If this conflict is in drivers/edac/igen6_edac.c, a patch for only this
> driver would have aged in the same way and conflict, too?

It is easier to handle them separately, especially if we do different bra=
nches
in EDAC. But all good, I've stuck it ontop since it is a single patch.

> Looks right to me.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
