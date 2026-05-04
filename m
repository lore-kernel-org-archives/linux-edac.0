Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357BD3E4C85;
	Mon,  4 May 2026 17:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777917382; cv=none; b=JUrm1zP53wk88ll9EeSFMMGUegoFeViljZ9DdXveMNqSxH5gNqRwck6kE50HySK7novO16jFT6HUL8DeuTmDRAiIPNbwhKwWdxsXwbtNvryYF3yhpaTImBs7cqG1pEqz4ro7DE9nYZEYirIg+/Pgu1dwR5KgjMa7+BhNCSjxpPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777917382; c=relaxed/simple;
	bh=6OVjWxvQfghEOS/HO1NNdzqb6uu+R95YAhBiz2WKWuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TG/xQ8+W0r8Z6yMU5BiamTKoS9wkuvBnp4aTii3aiv7JN/PkNV4IUh0D8NzMmpJQz7RBzYTCl6qNI+2eXFBTD5XdP2ONhVjg9OUMxQKND0Iqs7Ax2KeV13VU0JWZCPgvu0Hxja4570KRsHgtg87yOKJpXWr4fG+SY0Y/u3B+fXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jYl6zDbT; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jYl6zDbT"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B211F40E0140;
	Mon,  4 May 2026 17:56:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BKbT7L9gRUn2; Mon,  4 May 2026 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1777917366; bh=YaDCqIZhN8EVy4lIgF/G1Lk1/Xjj/QfJfSTcH0ACdFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jYl6zDbToMe6fwrry1NdhAZ8Tk63p9ykTS0XV9PKd7wQVnB6z8rgtmJ/Kpl2PNOQU
	 7a/2NxNkIFxcx+CBrNlUqoTteKantnoNjdB8THYuU3YEQv2Vfeh/Ur2I/OfAfQ5i1U
	 mFL9uLmgxMF1jOG6sPgUhqpE8beVkQ24FfJccIGlwRODltLO7YBkZ4ngNLjsZIpl5+
	 hv3y8cRm3/zJI+cixqgkija1ZFLfs7ZukY6zHDIZR/xcv+FcDlK+sjkKG97rTjhqxQ
	 eKNNu/JBioS8q9LOwUNAIvHELAZmrf/NjTbl4Uzynbm/NCZ2KBbv65hD+tFiAd5EAU
	 Lr+8Iq5G58DQ7vyLyLwQw8XZrZ1JQ3Pr7n4fDdukmlZGoCkwfIIzRsT74e6YJvTgby
	 A92MJ+OQylW7wrDt+/rePajl49yq67E86tzZUJsCQlwMnQpIlRTigyMQ0FmBC+8vxj
	 rqcEkAmafktF06A8Bn6UJQqwKHrN0gHo0ESVN6fhA01K4ND8hBbfYBkvvmWbdO+IgD
	 JEGQmcVLuwvjcKtJTYxmqtmgQQR2LlfzONXsxWSg2Thv8npTzg6KNrB6A3d4LTtocF
	 KV1/1scm0qps9rQlTK3sDa89D4WvpLCt52yTFniVjz2DaMr3VQwyMFASlTj+nW/r5d
	 HYOdwNcdTsBKzUES5WJuseso=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id AB7F640E0032;
	Mon,  4 May 2026 17:56:01 +0000 (UTC)
Date: Mon, 4 May 2026 19:55:54 +0200
From: Borislav Petkov <bp@alien8.de>
To: Aichun Shi <shiaichun@open-hieco.net>
Cc: yazen.ghannam@amd.com, tglx@linutronix.de, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/mce_amd: Fix Hygon UMC ECC error decoding with
 logical_die_id
Message-ID: <20260504175554.GCafjdqoMgM7k87tjU@fat_crate.local>
References: <20260216203211.GB420258@yaz-khff2.amd.com>
 <20260301142609.242124-1-shiaichun@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260301142609.242124-1-shiaichun@open-hieco.net>

On Sun, Mar 01, 2026 at 10:26:09PM +0800, Aichun Shi wrote:
> You are right, the family check (0x18) is over restrictive and can be removed.

How much of sprinking of "if Hygon" is this file going to get? If you start
sprinkling it left and right I'd prefer if you did drivers/edac/mce_hygon.c
and add the functionality you need, without impairing AMD code and us not
being able to change it due to Hygon-specific changes which we cannot test
anyway...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
