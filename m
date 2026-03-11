Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25293128D7;
	Wed, 11 Mar 2026 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235197; cv=none; b=aNvRH2LpbykMxp9P33kMOrEB9gUhbGPNJ0qHRxnNEVDFNmV90iKNS0fCMzvrsF8s3xO1JOB5C1pBPc/ysZIae9yG281tdW1PsEGdHwcGI5XHC9dDYX7ASS0EiBacbZUmonF4GCCmBA7xU9Gpwt7B+5dLAc5DoU/GdSsbRyoNli8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235197; c=relaxed/simple;
	bh=8a95sarzzAPeAHpp7ZVuo9GoF3q4eNUlmCXyWIThWj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXfPtN/3UokFW3eKYnXkmIE7qhMqNfTv7Y1QAfLeu0YeQxuh+6WyRKhoCiuZ0bdHYnTWwS0cpeX8DDq5PKxga9Cl+J6G9le0pSBa9eNgpzOEJR/8vARHjzGNuQqAKqTwUjS7ZQgyEUrU5Z8AWB/rkVr4t3IfX+EZrAGDbK9PpAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=lAkEC+e7; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="lAkEC+e7"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E6E5240E01D6;
	Wed, 11 Mar 2026 13:19:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Wd4H53i06jx3; Wed, 11 Mar 2026 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773235189; bh=sZACLaCbE5qv39eTjjDr9GnzPi9p5E3UCed6RtAGJ00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lAkEC+e7FSWwYjOoY+5ZjCy96hxy1p0B4/cbvAoGShqfpzje53YWOcFkPIbrljSgz
	 qTDpCq684eQdTXHSwURAx+qdbdJbL36CSsnJMiR3hLOXyJOxcT1R/GyhkGJpu2WuID
	 WclM6htkc4iHWeb+X3hDYV0A69f4lYdPbwCuBhB7gGTtWLOisG17SzCOyK+UqisJ/u
	 ihg0Mr5Y7Jkb4rxYcH8Cx+QMCERZN0krhCro+gl7OrXza8FoWpneIkt3I+Tu/O6n/5
	 wKbNfOmQCue2Rt1aaKKmviNRGW1ex2KrzcSKcEQRHuRUSTGcWoS7ieNiPhKir8WzvD
	 NrESU5XASaOnWDOkchFaAyPcIuO8t45VZG+FWKlZ5tN3NsDB5W+/pLjmSp7pBpxy88
	 4zlbfjVJAmLrfmiy4LFKyrm+/U7kKCOedhMx2XaQTyZcbyR3D8YBRuStWJ4RPUxCsR
	 LpphAXl2NDPgfXptifaDw9VrfGl012aU+6LMk4wPhStGlWQuMsO2A/ts2xaeOk2NLR
	 g0GzXV1LQFXBMFZSqOFdZh17aWRHakubOGYVdjt1Tv2yMxLxE/YFlC/UMTI1lF7VD0
	 ravHQ71AtbPhLhLTXvAUA+Wwd3j66JX/3OQsenNOYRvUOPPhXIt8g5Y7/ddNfZrI7v
	 As+V3yD53LMUgKCcCrCh+9n4=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 3A01C40E00DE;
	Wed, 11 Mar 2026 13:19:44 +0000 (UTC)
Date: Wed, 11 Mar 2026 14:19:38 +0100
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH v2 0/3]  New SMCA bank types
Message-ID: <20260311131938.GRabFr6kIjckASLap4@fat_crate.local>
References: <20260307163316.345923-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307163316.345923-1-yazen.ghannam@amd.com>

On Sat, Mar 07, 2026 at 11:33:13AM -0500, Yazen Ghannam wrote:
> Hi all,
> 
> This set does some minor refactoring before adding new SMCA bank types.
> 
> Thanks,
> Yazen
> 
> Link:
> https://lore.kernel.org/20260202172158.2455749-1-yazen.ghannam@amd.com
> 
> v1->v2:
> * Rebase on v7.0-rc2.
> * Add pre-patch to reorder the bank type enums.
> * Add pre-patch to update "CS" bank type name.
> 
> Yazen Ghannam (3):
>   x86/mce, EDAC/mce_amd: Reorder SMCA bank type enums
>   x86/mce, EDAC/mce_amd: Update CS bank type naming
>   x86/mce, EDAC/mce_amd: Add new SMCA bank types
> 
>  arch/x86/include/asm/mce.h    |  59 +++++++++------
>  arch/x86/kernel/cpu/mce/amd.c | 134 ++++++++++++++++++++--------------
>  drivers/edac/mce_amd.c        |  48 +++++++-----
>  3 files changed, 147 insertions(+), 94 deletions(-)

Ok,

check here pls whether I've botched anything:

https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/log/?h=tip-ras-core

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
