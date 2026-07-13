Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457E2773E5;
	Mon, 13 Jul 2026 23:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783984966; cv=none; b=MRRlVmvUECgSwXkq0ZiFmismImlGv+8Rcqun/JPjzGBhVh4TMapm9CYDp5VxXEeUq4wcWmtb3GfISBmqBys2Yk909zgLaaPKwAxu4Q4nbD2G/JXgp1Abp20myQ1e9vioRwdYbb1nl6M+mb4h6HaZ3vV6wi0ONlhhtiH3US5pUlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783984966; c=relaxed/simple;
	bh=OZoRLVmfM1qvLvB7guAyc3Fz2WzaG3JvzyX0ubDdhxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElymdGwLKP9YrMo4b8OzqB51I70s8rYtGJT1xPy7q77gCU0PcpOhqT8F7bV3G9BLwSEydUhVnBu5BnaUFPY+u3GH0PQZ0sD+9KqcLZIhEXn9NRh+HenwNR1+yVTiXhnuKNLX1v8MVB8IuP8YEEWRV0LRFM7yrFEPcCsZIWWnuvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FY5mf2AZ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FY5mf2AZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D9E9740E00DC;
	Mon, 13 Jul 2026 23:22:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UK-CMuxmw0O0; Mon, 13 Jul 2026 23:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783984949; bh=ZwqUPV5ftG2g8WQCLaS/hsNdsTE4gbvCEE2MM9o5XmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FY5mf2AZ3YDwg5DeqwiGxjnnZYOoxmU59ERlxtmZvlPoDyEyarmzBLLKM8YC8gFTg
	 taoJgIPAf0rxviZpMuqOkQxtiUUrRxx0qP+msQ4h78blplNGhPsXX+/GLKIklTCKWV
	 quA4c+SiBFouAJoebli58emC88K9qbMPA1xiCEVnxU33vJ07HZBJ4wkfQgZoEif+2T
	 S8zAMREivGVQ7+bWDcxshThZxB9ZCz+MU+HDRx2in8TkPqi8TNzz3uspEy5mfwYgbi
	 PzpKy/7G6UCEs9VybTRGs7yuCS60LjFTpAx5N+gl8dgZxj1Hc11dsm06OXj1+v628c
	 TSUIYnJOI5XWgrqK377zUSeU1yqCueJVGfDnrC7QVWbrPgSjLMk4qZR97qPK553hkJ
	 u9dY7Wh9UngEgVn58cJRcZQ9vsXdeqYbm92ihn5cysX7nianXqrd2ULYvXHBBu0Nr2
	 krb4FdRmCthhNrnfD17oPCofubVdhAN7zPX65RpvW9OriaCOgyTcYJ7CvTHCm2IF0m
	 /nx33hTzGyk6cWdHj/J1RbQxjiyz+7yBHVhzHNh+cvndRP7UUHdnDrIgR8tBTd1UsL
	 OyQJF70/1/cgpPYJbU54uxEiqVqlU48Hn/sYBBiO+uFpHkPCMIB6b37y1OT/Do9qfT
	 AxCdZsBRjaFw2ZfpQlhq+lLE=
Received: from stx.tnic (unknown [12.110.208.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9114C40E014C;
	Mon, 13 Jul 2026 23:22:24 +0000 (UTC)
Date: Mon, 13 Jul 2026 16:22:19 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@kernel.org>,
	linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mce_amd: Do not print a stray newline
Message-ID: <20260713232219.GAalVzK0UQ9rxlIWmT@fat_crate.local>
References: <20260712031648.486110-1-bp@kernel.org>
 <20260713184402.GA364094@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713184402.GA364094@yaz-khff2.amd.com>

On Mon, Jul 13, 2026 at 02:44:02PM -0400, Yazen Ghannam wrote:
> On Sat, Jul 11, 2026 at 08:16:48PM -0700, Borislav Petkov wrote:
> > From: "Borislav Petkov (AMD)" <bp@alien8.de>
> > 
> > With error records which don't have FRU text, an empty newline is
> > printed like this:
> > 
> >   [28014.094610] mce: [Hardware Error]: Machine check events logged
> >   [28014.094674] [Hardware Error]: Corrected error, no action required.
> >   [28014.094687] [Hardware Error]: CPU:11 (19:44:1) MC0_STATUS[-|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0x9c20400001010135
> >   [28014.094724] [Hardware Error]: Error Addr: 0x000000019ba9a974
> >   [28014.094732] [Hardware Error]: IPID: 0x001000b000000000, Syndrome: 0x000000081a1f2505
> > 
> >   [28014.094744] [Hardware Error]: Load Store Unit Ext. Error Code: 1
> >   [28014.094748] [Hardware Error]: cache level: L1, tx: DATA, mem-tx: DRD
> > 
> > Move the \n into the last printk() call where it belongs.
> > 
> > Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> 
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Yeah, Sashiko has a point:

https://sashiko.dev/#/patchset/20260712031648.486110-1-bp%40kernel.org

So we want the error records to be compact and fit in a block so that you can
recognize them easier and thus not print each thing with a newline.

But those things are not unconditional so you cannot always know.

I need to think of a slick scheme what to do here.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
