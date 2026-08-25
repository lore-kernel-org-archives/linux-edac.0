Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7892F1FDE;
	Tue, 25 Aug 2026 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685387; cv=none; b=RiErSlWsXl0lQTUkkP4a8nPPqcZ+De24GbrwLDgwE5mnazQjbPLb++hcj97q3q/0YyI5jcaUtMkH6dlC44KUuW9Pn5hW2mqdZ+pWUqeIYJwUcwPiDuCJxBfvsAiDCzIFbEJHpSXVGnR3SHHzzUKLkF1pxCttSe6aLoj/b4HktGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685387; c=relaxed/simple;
	bh=QhrypvfOiQeUPbehzWu0QGWHjjYmn/ggnJGB3Bkp5VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaXAOJk5k57VDpAmk49IYjRxJj9RTT4axuxjCti4DOMrhvedHCB6aGlT9UfDyhRnRxsEDbuh1aPK5t8qiI6oyA7+XWzoTeWVaa27sESOrI0gGGEqt7O+GFAs/gg8kqvzxKovsoGQQnHa/kfilDYg9iHd5n8P9lhF2EP4KScIn8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Le/QrVY6; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Le/QrVY6"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4709940E016E;
	Tue, 25 Aug 2026 19:16:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qzjPgXhKK6MT; Tue, 25 Aug 2026 19:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1787685373; bh=nApaDbDgfWKqwDtUvPalt2g9kujtjNfIgtUySeiMDf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Le/QrVY6thkBYKbrCcNwzlo5S6Ru8uJGiU+JMdAAESUW16lyTeUojxDCiXL2/ppv7
	 HgPoqnfexjC+1yqsjsC1Rexn5JRzGQ9daajBwLw32/rceWCpvznAZHRf2y6vIcaW31
	 NXNhROgSUZ2m57ZqFmTXzcKSr0zJzeeyChyfFCT0bG8R0NzKviDfcVPcJPh2UxqaOY
	 6BKjDBW4HrdpjEzs9dJ4bWObFAKCVbl9G2Fu/Vn1bi7E/PCZlVch9UzHDWADjNkn9E
	 F3jB9sa3i07xT9RmI0AO2FdiQ5vRjPRFx9FEL/tUStti9uqYmS4i8Vn8X5NSU+1YXd
	 K3LX0B5ch6q85VvZRyTKZ51RWO5cCeBJ5CC4hGbFu/IIuyYgjPLYvKrGjjVt99gYyK
	 eJZ4DVelGkNCp4SqW80wSMzNFON7/lxbKiF5+T5p+nCbJtPlfVG/lY2kpRmONgYYVV
	 GJi2Gb726qtN/fTrjuxJDXFjUNQ6wfbWOu6dMrVakbFQljszC6km/vdjkr2fEffS93
	 IUhdbFJv9m+c2Dh/LgbqERwmEA4KLZjqNoVKdREIrsrsEGtAbsfMnmIb32yKUTmh9I
	 y1vqVsXSIbfWoI5ao5WL1ts/x8O0IN9iWIA7Cr+dC409qnDzHyonYvFoXM4eT7OOOS
	 Lf8EpKAouXXQL4O+y+LM6NQA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 76E7140E01DA;
	Tue, 25 Aug 2026 19:15:58 +0000 (UTC)
Date: Tue, 25 Aug 2026 12:15:55 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <20260825191555.GCao3p63v3fXzwa7E7@fat_crate.local>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
 <aoiBy3vg9eSvGhIu@agluck-desk3>
 <aowABmagul44ENde@gmail.com>
 <aoxxxmM-xIpyAE_Z@agluck-desk3>
 <aoynhOsTCcapwRbl@agluck-desk3>
 <ao2eT0TWS9EaA28N@gmail.com>
 <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
 <SJ1PR11MB60839657B965AC3FDA53C186FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB60839657B965AC3FDA53C186FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Tue, Aug 25, 2026 at 04:26:26PM +0000, Luck, Tony wrote:
> > Why isn't the strategy here page offlining and shutting up the source of the
> > error instead of doing silly counting and not doing anything to contain the
> > errors in the first place?
> 
> While Breno wasn't specific about the source of the errors in these messages, I'm
> guessing that they might be coming from cache errors rather than DDR memory.
> 
> There isn't a good way for software[1] to suppress these errors. Taking memory
> pages offline when the problem is the cache will just deplete available memory
> without solving the problem.

I have been thinking about this *years* ago. If it is cache errors, we should
simply offline the core or cores using that cache. We have a lot of cores
nowadays :)

In general, us being a lot more resilient and applying automatic containment
and recovery actions should be the goal IMO.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
