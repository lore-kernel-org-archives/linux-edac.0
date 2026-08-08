Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FAB2EB5A6;
	Sat,  8 Aug 2026 18:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786212676; cv=none; b=QtKqV/u3Dua4pv4L0gYBXBJBR1qklxNNddbsuc6Erl+80TCCYTwKCSFlr0nr/HDfu/JjIEv/K7DWNpz3Oqz6bau2uB/djY3QodL5fl6hevKI+L5AK+hjmQUGsX2ip6CpJblOLj/Jj2cjExMLaDIejYkqWucRb1O3D54P9GTElZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786212676; c=relaxed/simple;
	bh=wdI8qK3ceA6e6S+i1+VYfkko3XNQaiMdxPfnT7yUofo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFaen+vdxGfc+JtiRLAypvzOtxjo7xgAarxg7QkqgqlRAo0hifSS+W9KoPeB4FDStMVhncn+3//4jSUxQgRV4rEvpzMV9/fN07MKBFRlmmXJYcdvt+zKbw8tm4OSYNbSGyXxcpPq4+VHvx0tCyxRrdF2vsaUDQII9ip3eiIxFu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QvoDUJvS; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QvoDUJvS"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7F3F440E00C3;
	Sat,  8 Aug 2026 18:11:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id t9cksOqNcw8v; Sat,  8 Aug 2026 18:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1786212659; bh=mUrfwPXUEGfix+t1Ger0JCjhKw92cQpxKZFTHrtZrfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvoDUJvSnrqyz9TdI03e40trSp9Ix6lDFOn3qUhcmzUqIw25cQgQ9CobNxSbXEuhP
	 5tOpgIkhq/VoekzJGRymPuXit2AbfV17uNpgxzr4e7/iSjmoVZIPwev+8wwuPpXyqn
	 /si42UBN4cF2B8paH6Ef2cgQ73GMOYwXvJ072lmDb7hJRHaYsmx0TZQzc6IYjcu+Q8
	 HGGdOo0S0A8ry62+E5TAF0ycPl4BUWREj0EOk4D/gD+y+b775zNmnLgl4hrXlgEupe
	 hEcliieIeKaqK8N1P4fejyIcXiI+1JUj4BWupfpJhI+JCyOuBEuXCvKT27SoGM7mqP
	 fyvgWfgbR4/4bk0Pkde1+dd4d3hApdh/ENlyingm1dbLrevxw88l65KKWU8fC4ADoA
	 4KOmwlgkL9TO1TAWEff0q5pOLAvcnHewliDL2kQxBcaEz9geulwcYMg+4b2B0te1lh
	 1GJ13jANWfhJrdjAnl7yPHILE2G2hHKSsUCtlwzflqYNQWE6KjDNnc9sX1HVVRsBo7
	 SAfSQxSVBUWEiwflG4KVCRhftG8MA2gi2KCo56mvIFVPuC4rlDvWnSf2PPVq7hRJcz
	 MRE4ielKqvjkisBHx2cYM7+WAh6NPsyj2PYl86+71MyjmedTrMoM5c9Jo9rtKKeNE3
	 xoNYPQVKxLgPWBjAkk4/xxW4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0B51540E00C4;
	Sat,  8 Aug 2026 18:10:51 +0000 (UTC)
Date: Sat, 8 Aug 2026 11:10:48 -0700
From: Borislav Petkov <bp@alien8.de>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH 2/2] EDAC/device: Serialize poll_msec store against
 device teardown
Message-ID: <20260808181048.GAandxKJemjc5eAiFs@fat_crate.local>
References: <20260730145549.148229-1-inasj268@gmail.com>
 <20260730145549.148229-2-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730145549.148229-2-inasj268@gmail.com>

On Thu, Jul 30, 2026 at 03:55:49PM +0100, Jad Keskes wrote:
> edac_device_reset_delay_period() unconditionally calls edac_mod_work()
> to re-arm the workqueue timer when the poll_msec sysfs attribute is
> written. This has two issues:
> 
>  1) Interrupt-driven devices (op_state = OP_RUNNING_INTERRUPT) have
>     no initialized workqueue, so calling edac_mod_work() would operate
>     on uninitialized timer state.

Yeah, that's a good catch.

>  2) A concurrent write to poll_msec during device removal can race
>     with edac_device_del_device(). Even with an OP_OFFLINE state check,
>     the check and edac_mod_work() are not atomic, allowing the workqueue
>     to be re-armed after teardown.
> 
> Fix both by holding device_ctls_mutex around the state check and
> edac_mod_work() call in reset_delay_period(), and moving the workqueue
> teardown inside the same mutex in del_device(). With the mutex held in
> both paths:

Why?

Why don't you simply check for OP_RUNNING_POLL in
edac_device_ctl_poll_msec_store() and _show() and return an error if op_state
is not OP_RUNNING_POLL?

>   - reset_delay_period() atomically verifies op_state == OP_RUNNING_POLL
>     before re-arming; any other state skips the call entirely.
>   - del_device() sets OP_OFFLINE and tears down the workqueue while
>     holding the mutex, so any racing reset_delay_period() completes
>     before teardown or sees OP_OFFLINE and bails.
> 
> Also fix the parameter type from unsigned long to unsigned int to match
> the poll_msec field, and fix a latent bug where round_jiffies_relative()
> received a millisecond value instead of jiffies.

Ah, I already did that in my patch and just saw you're doing it too.

I can remove mine again if you insist but the change to "unsigned int" needs
to be a separate patch and not part of this one.

Thx.


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
