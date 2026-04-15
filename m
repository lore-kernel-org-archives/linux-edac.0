Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915E86341;
	Wed, 15 Apr 2026 19:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776281758; cv=none; b=UBBH6okpVe/Hj7LAbyAeyIC2pCKk2T9YBPLKjF6YK/kwInat9Ao92MZcrtcJkMYIlP4+rWU+/Cyc4oGtUdoxqEHfnFHbapQ5XCwexe3OK9ZBWrDomWScae+cSGnGej1k+ja1jyQbtfBeDT6/e9hWBIGvYVrSfqe/H0pYVkmnwYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776281758; c=relaxed/simple;
	bh=L9q3g66KFUMbU+CH+r1COgnaoVG8ElEpu+XbjXC16LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lha6nBb4+55huwhzqZRcBYEE5l/ROEH+xtk5F9OOU94BgWoMUX5MRI22XgmEnxJkvWWdbSmiWRTBzM6gBgqC+UL9cXzGaPFaZqYF2UpqDW/CJggJlfULJhhpegO7WnujaUz2zJzYePyKMbOLLhH0jJRBgFTlbZTZbuQIkCdWRKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=HwMLDshz reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="HwMLDshz"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4C48140E00BA;
	Wed, 15 Apr 2026 19:35:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LJ3MyM5pbA6s; Wed, 15 Apr 2026 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1776281749; bh=uas7BhmJFfT/s4w09hf4yEO5FV0OiNhKczcDi3Sr5bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwMLDshzf2KL7/3zK5y3F6RsEWwtAhAL9c92v8xkHVCnsl6khcS17F/m8LGcYsJe4
	 L4p1tCfYW+KAmOMlBLuwNllar9LycncI8XceImWcC3cwTduAC5CJiGvVZn6rVHT7A+
	 HItIwidQL11V5aZK2zOA/nxl2Q22J+IwU25EXQ7Ffee8O1EOFn5qdlhohugAPRxHEm
	 /breCRFV9irKoB3qhzHnppGjThFu78NWZtqObwQ5C95rbl9AS+jn6ZJXu4vXQKr54A
	 E9dUeAexL9p4NFdtk1On+4Hu1AIMClPUKfdiuy68RBDkrhYLvbaOhszLCck9cK6Rt1
	 qPRZm/pOrEQH9mRT1Rr7S4Mg8PKoQwlniW361VoqzMVH1beqxxqQ/94xKl23YCzGqe
	 TzCjp++B2MTlIzSKhPS2SD81kw9h9aKv95qwmTPVENcN7luNvxCQz8TyMu64dAzVpi
	 t0Cq9oY87cC30Fevc4n0m8sZM6mkknm6RaC7UWb2ZDt0JvwY+DRJX9/ntXQ2n8XXXb
	 y6QJCgfAHtATav6qKHMbv4JSs1DdcEbk3mdB71KKV8Lt4wJQDG3kEiyDy26Deou7ml
	 mVPFmGL5NkqzB3HJ5cHbUFv32MiDsiSNUkWERZu45cEV2F3/ZNPXgte3I/b9ka/Lo8
	 ONWXrBSJX9qTUc+A04URn8Cs=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 30E4740E00B8;
	Wed, 15 Apr 2026 19:35:36 +0000 (UTC)
Date: Wed, 15 Apr 2026 21:35:35 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	"Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: Re: [PATCH] x86/mce: Restore MCA polling interval halving
Message-ID: <20260415193535.GBad_oh7C449s-d_ip@fat_crate.local>
References: <3748e8c7057a4182bc2a361b44dda51b@baidu.com>
 <E4BFF14D-85CC-44FA-A217-603C102B1D66@alien8.de>
 <3431b52760444d209f8460059264cc13@baidu.com>
 <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
 <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
 <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
 <CY8PR11MB7134A78D08BA698A9EA857F189222@CY8PR11MB7134.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CY8PR11MB7134A78D08BA698A9EA857F189222@CY8PR11MB7134.namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 01:39:06PM +0000, Zhuo, Qiuxu wrote:
> I'm not sure whether any distros still use this user-mode helper to sta=
rt mcelog or=20
> mcelog-like tools. @Luck, Tony, could you comment? =F0=9F=98=8A

Old distros probably but they don't update to the newest kernel...

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
