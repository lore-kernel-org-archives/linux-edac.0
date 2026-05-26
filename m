Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F03D1CB5;
	Tue, 26 May 2026 15:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779808049; cv=none; b=bd4BwILfIZl0V+BP0nY2xjhjBWjlJth80+saCTApXxYvObKYEZCB3EL4F7FOGfO4Bf71cd61dHEerZIMyNHvtyCrBc80XG96+npTrgBULK5JjagEJ+yOTn6Nt9sLIc3D9M98wyprQxfEm16r7ZM5Hu5Jcaqa2solAiczhG03J88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779808049; c=relaxed/simple;
	bh=GaxjcNpLvkEPDd5zDj7CG0CZ5IYboVk+H4liWTFbfz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCT/kHh+Xsr2nT5Ebc91m1xhn51DKTz1dnwIUVXR47cQMVsB3H8GMIq90ulGk2Q5KsEDQjemxyAHlV/6aBIhPn9nUP/Tg7UJsxGlox/XuaG/vAHjfHSsvzP7rDuCOrB9jzIRmnj5aKroG/oh7tDv48ViexZlwe0izzhZoQVB1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UWZMHpTZ reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UWZMHpTZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0C5BB40E01B3;
	Tue, 26 May 2026 15:07:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pjNg2WUrU0fd; Tue, 26 May 2026 15:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779808024; bh=3aagkIOgy4cf2b33VhmRVzETsciCsAafKBYLyv7rOf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UWZMHpTZ3wCV+L/4v67J80XwxGGXMKIeuspRTJIyboExO4yzGO+GrbBq6fCIRGy3r
	 El5KnscP8IusCSdYf6XiZGeKEkt3WJpK530G9YnryBg2Lq1SHXOZux37Y5JGbUuGNL
	 jiF4jNuhz12vmxzvUASRD6EHucZvA2SiuEYUmuLbL3EG35RHBvc5H0SaZXYvvZHf4m
	 ZcsghmrP9W7BewwJIMD1t+rXJOJLkArsVrOTQyAVGpo4YHrGqS5rbbfTGcHeq+slIU
	 UWkWYUU6tLz3BOQQh3EP/2d90g4gsaEM0rYfkwOoIUrATIvJFUuOYS6YUkgLrC65az
	 xBkMDDi6xjJX7kYOwncMRITYKOe/JxMY05J5Ce3xvQoZBlKOf+1wJ5gsJlfWG8DQMg
	 DliGfnHt8/lA1cXizLoXDCv274Md0mU7Z1OSva6carMy6dODtYvXeMwZBCu1mIDCPB
	 Q0P1lFWZko5d2Cjdv6NqpldyATM87ZGJD3OotOoD3pN6rlrAqgEmvF2zR7OQX2s0B8
	 rBQsodlLqCM+PBLXXuR51SyrnnVB7RnvwGCqlccFYQwcMRCSjbZfJaB/g5m6pbXU+n
	 th4MvSxmmsCLcM5maeHWxlPD4LIEwh+li+XQz6WNOhSiiWqXwOy6QHxTTvyleY/vSQ
	 DVgPb4hy414E5anHPEjNK4b8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4E3A740E016D;
	Tue, 26 May 2026 15:06:55 +0000 (UTC)
Date: Tue, 26 May 2026 08:06:44 -0700
From: Borislav Petkov <bp@alien8.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Tony Luck <tony.luck@intel.com>, Mark Gross <markgross@kernel.org>,
	"Arvind R." <arvino55@gmail.com>, Jason Baron <jbaron@akamai.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] edac: Consistently define pci_device_ids using named
 initializers
Message-ID: <20260526150644.GAahW3BAMTLnbhM7MI@fat_crate.local>
References: <20260429152513.3755034-2-u.kleine-koenig@baylibre.com>
 <20260524211305.GBahNp4fVVbGeibGXj@fat_crate.local>
 <ahVgsnn--IRyQDRv@monoceros>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ahVgsnn--IRyQDRv@monoceros>
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 11:05:24AM +0200, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> Thanks. I don't see the commit in next but notice that it would conflic=
t
> with commit e80baec7a692 ("EDAC/igen6: Add one Intel Panther Lake-H SoC
> support") and 1c564ef55f0a ("EDAC/igen6: Fix memory topology parsing fo=
r
> Panther Lake-H SoCs") from the tree at
> https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git
> edac-for-next.

Bah, thanks for letting me know. I would've noticed when I'd tried to mer=
ge
it.

Can you please do a separate patch for drivers/edac/igen6_edac.c ontop of
linux-next?

Then we won't have to do ugly merges in-tree and send Linus a pull reques=
t
with a merge commit in it. I'll apply your patch modulo igen6_edac.c chan=
ges
separately too.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
