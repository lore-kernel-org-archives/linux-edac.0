Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7003A4F20
	for <linux-edac@vger.kernel.org>; Sat,  7 Mar 2026 15:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772896379; cv=none; b=nMdVzk5c8yYj6IrKdKswsG6FVK3k4f6f3HtioV35b8VBv6zql6TVjkLbVXQ97Iu8P9fE9RPLebQo3ivRTa45oHgd/c6EFxytlUxeE3DqGEdrs/sk9tIannl98e9msjjti9HV7W42ynOIlJvqXApagCE+9p/zj4EeloeEKEcjIYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772896379; c=relaxed/simple;
	bh=L+M2DrLWiUKAzVfJ2FsekqBecLZABr8BW/qc5cIFXc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQf4BkQp9kgONm5vYKHtfvHvuLY2MH2qzLwEFub+faoJOKIFje6UhlSRlVyksKYRdAJplW9AA29gDUEmT1mLx+ZJoTlw5RFI/QuR8snOw02fi+aRLvcED5gyeUbMXpfw5eWeacwJAaIBmMfhs6SivCnm1sO+Jmk48J3V0nB8Mpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=dxeHK9AZ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="dxeHK9AZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 97F3440E015D;
	Sat,  7 Mar 2026 15:12:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LfpE6HiXQ-8c; Sat,  7 Mar 2026 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1772896363; bh=j1NZo7c2zHuP9GzgL/H34G5qRmdhOJHmKcobtqSn0Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxeHK9AZpx4b8DfTdracO9Vjd2ujQ4+DuAWQn3Zb0FleyocUkn5ESH3w1fuOJCqUL
	 1zz6MjDL+XuxE7cXKSYEj+wz/9emyAc3asn5sRzGRS+cggkgTu7MM5PUaeqni7F2lC
	 k0iFGctFvIwzsXZnPHjrbHR522fkKwhzMCGl/WnW+soDoY7h8A7N0yZhAGtrmHvnGh
	 K+kZKhgyVF79mJWmTmZEFV5qbH/y4siQGivz8rcJqcL5ui2KwqPqPA/9uMV/v9O0fC
	 TxxwfCMu29SrdC6cGuKXWaY+3K0IDggEjsB0KbfQ2EHnUB9loImr4fzDVK3OzpijNw
	 fCbFOS3BPfz4L9p5tSxaMgO2IAaToXLn+83Ty1ZIQYgMgzJKIwE+pKkf9ol5lCJumA
	 43NQ+MLkF8C3IbPBVqZElW/wpwXW4RkGRBDyyroTIw/w9UezpweEngNTh6PBnCdr3r
	 JrFQTMgYkQKeWdyvDYeXrUnj11zAdWFRHQwx/OrE3iWzDCgRBDOTy0WxD9+25NaULz
	 pjbTrTGEyeGroqmqs5ZSbVKTgpDAxtuD+197orVumJOKA69kX47WPHIUyDpfxyuAQF
	 qF1FMDweIyUfngS/NGzlOYRK2D46yiF6IOOw/Yxvx203/vhzMr+ZjE+rUAzQesY85i
	 qSqB7GNgs1eWghiepfCgBbf0=
Received: from zn.tnic (pd9530d5e.dip0.t-ipconnect.de [217.83.13.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id D401D40E0031;
	Sat,  7 Mar 2026 15:12:37 +0000 (UTC)
Date: Sat, 7 Mar 2026 16:12:31 +0100
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Tony Luck <tony.luck@intel.com>, superm1@kernel.org,
	linux-edac@vger.kernel.org
Subject: Re: [PATCH] RAS/AMD/ATL: Decrease message about unknown DF revision
 to debug
Message-ID: <20260307151231.GAaaxAX3gT1AKv04I4@fat_crate.local>
References: <20260305154528.1171999-1-mario.limonciello@amd.com>
 <20260306145003.GDaarpm6p8A-pFBCCf@fat_crate.local>
 <a9a4aeb8-a044-476d-845d-0368f90624f2@amd.com>
 <20260306153223.GFaarzhwApsh3Jdqdy@fat_crate.local>
 <47075497-6bb8-4da3-b8b3-63901d9f3b05@amd.com>
 <20260306154947.GGaar3mxJ1JkcC0OgV@fat_crate.local>
 <20260307144910.GA113343@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307144910.GA113343@yaz-khff2.amd.com>

On Sat, Mar 07, 2026 at 09:49:10AM -0500, Yazen Ghannam wrote:
> On Fri, Mar 06, 2026 at 04:49:47PM +0100, Borislav Petkov wrote:
> > On Fri, Mar 06, 2026 at 09:40:06AM -0600, Mario Limonciello wrote:
> > > But don't you need to use UMC to discover that?  Chicken and egg type of
> > > issue.
> > 
> > Probably...
> > 
> > And we already do that in amd64_edac. So perhaps we could export an API or so.
> > Yazen might have an idea...
> > 
> 
> How about having EDAC load ATL when ready?

The thing is, AMD_ATL can also be built-in so then request_module doesn't make
sense.

Which means, if we have to "tie" it to amd64_edac detection, we'd have to make
it synchronize its Kconfig setting to the CONFIG_EDAC_AMD64 setting.

Or we could simply say that AMD_ATL is a module only because if anything needs
it, then anything should request it. And that makes sense because the address
translation should be present only when something else loads which is at all
capable of presenting addresses which can be translated.

IOW, AMD_ATL should not be builtin at all because, well, it doesn't make any
sense for it to be. IOW, its existence alone on the system makes a little
sense if there's no address producer like amd64_edac or whatever else calls
amd_convert_umc_mca_addr_to_sys_addr()...

Hmmm.

It sure sounds weird...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
