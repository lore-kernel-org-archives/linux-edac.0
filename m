Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8923FD14F;
	Wed, 13 May 2026 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691782; cv=none; b=cqI2WlnRvz52UyDAp1RDo7ZqqcQszUCrgZftjwDjqL9sFZybeFsVdZF5Rr/mE7Aw/+rEVt1VZ2oZElTR+fm8KpTxfrZXdmEIFCcVRvFNLvw3PVFgpm/mtbG7uFdMwkMUKIs+yZ4lbMxYzpB7NWNO53kVfQtjvtqWlvxPXv3FydU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691782; c=relaxed/simple;
	bh=8LbElrfD3LKNTKk69GsgKtI09GA9sV9PqdTcoIVEQ48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkjSt8U56UlRwO5XvT3hyYNdZEUxvODUx2YP164qQqOJ0sR/u9xLu/443QoOyE6+itHchNi6MfmgS9+jpHbkhOMpw6/LS5VAbGv5+f0qifLyGkNA4tjHxuUkvNMudNvjsfNvqHvLMv9gYLNlpEG2P3MWOIQxb9w2urFztQCJITA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=O03smeGr; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="O03smeGr"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C96F140E01A1;
	Wed, 13 May 2026 17:02:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PcsYaNNfn7qa; Wed, 13 May 2026 17:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778691766; bh=cVYDmiFnbfLNl7oOE/VCkSayuZLj7Rz8C4nijNRe2Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O03smeGrr/pIYsHXWHLZEm+B7a1ViKog9cW8BeAWJ7TYbC0mZE1pgBo+PBLbC+jlE
	 9/Bw7qJ9ceikjtKlmyGIa8CfQKNfgKFJx8+JncgLbQOdxCZHXV28w/u6kIb1nv1h16
	 xGbQGc4T4ze1V+RJsbe7u27zneVKH0gHhPXarE1WX1AkOJccnWjHUpaF50IuOU+qDZ
	 KkVbbUBJynHg6X0jxyGgPPUmQR86OAabs5khlO/NTNAfKv3jwyyVQJ1/wK9pDSXOiE
	 FwceEW+4QH3AvIjvDFow7ZU2/TEX5EqA/PkG11nnfiwcfOpMoErF8iugbvkP1ew6ed
	 HI7mY0gHYqQXsokUDf6cnzOunKtuPSOL9VoVqDEnXjY/bNXd603rfU2weBeEdfKGxU
	 +m0DL/TRbdppvdlihkNkH/k+NIUy9J8cn2ZfBJicqTUDzFZ1+9BOxn/hVD99ar/u4c
	 0ERx4jT3GTwgOHljDgG7sCrEdfi+K65frMB04pgPLEVj8J6QHu6OGVDVjFQPPY7XAp
	 Gt4w637qaMYfDUnmFRSi7C++WpRgV0TZpo+75tX4+HVRvd+Pok4uLi1kF0bwuqS57Y
	 C2QjjPpUcOv+moa93X7iM2EN6oPYtA55Gz4jzgSrqmw7L1gduvsm5plDDTEh6OPq8/
	 LQAap6HDNGpOMLFuU59FyQMM=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id C37F140E00C2;
	Wed, 13 May 2026 17:02:41 +0000 (UTC)
Date: Wed, 13 May 2026 19:02:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v1 1/1] RAS/AMD/ATL: Drop malformed default N from Kconfig
Message-ID: <20260513170240.GHagSusHdkGcYLS8v1@fat_crate.local>
References: <20260513162253.365343-1-andriy.shevchenko@linux.intel.com>
 <20260513162744.GEagSmgKV9ceTtO162@fat_crate.local>
 <agSnXBBS_ur1YEYQ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <agSnXBBS_ur1YEYQ@ashevche-desk.local>

On Wed, May 13, 2026 at 07:31:24PM +0300, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 06:27:44PM +0200, Borislav Petkov wrote:
> > On Wed, May 13, 2026 at 06:22:53PM +0200, Andy Shevchenko wrote:
> > > First of all, it has to be 'default n' (small letter n), otherwise
> > > it looks for CONFIG_N which is absent and in case of appearance
> 
> > Who does look for CONFIG_N?
> 
> Hmm... I need to rephrase that. Any suggestion how to refer to the Kconfig
> symbol in a clearer way?

So I tried searching for CONFIG_N in "make menuconfig" and it gave me many
results, but with or without your patch I didn't see a difference.

Just point to the "default" grammar definition - I see

    config NEW_NAME
        bool "New option name"
        default OLD_NAME

in Documentation/kbuild/kconfig-language.rst which says that default <symbols
in caps> refers to a symbol but the grammar should be properly documented
somewhere too (can't find it now...).

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
