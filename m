Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AE828850D;
	Mon,  6 Apr 2026 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775463865; cv=none; b=pX1JqHWlO7dt3ScZdY7HefbWZZRwNx2hekQVrZ3NUDl5W7kKB1mxJ9YBGU5TCE6E0LRj8Pzr2yTu+pHpuQGICni7UENu3Ycwg3hGf6TFEcWc3ovPjv+I3lXKPqz2OmLT0LEpw2KupKsrbCHpYJcduaqKyAlfj+a1hszKAxYndb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775463865; c=relaxed/simple;
	bh=lmLDhrULB/M+iLUn4iKascX8e4ZoaR7aKd6x67cvjZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcWn4GpKbLiRxrfyaOQaNz7j2tbEVMWmB5o9q6+O2c25S6XTLuEU2iT+clhJAIE5LVSl/jhK9NQUAFYRobvh/fpQUJOabjCjRT+m0iU1GW9xGYshTQnFZJIGPdXT7rVwnODrnceyYn2/87xvwS+NLjgWuWj45h3p1gApjv2TlCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=hsyfN1zP; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="hsyfN1zP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 65C7B40E0176;
	Mon,  6 Apr 2026 08:24:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UGHgPE85Of2R; Mon,  6 Apr 2026 08:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1775463846; bh=PUr7WQu4/NHuP6VknlN2bZS6lmKxdANpCVqQ9LK9Cis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hsyfN1zPMZECmllXrHYqbGX4AuWZZuLsFFJUl5/H9e2mwht+GOrHGKeO2CW5aHbUN
	 1fnd0S+46lQu1aj7WGxG3MHzajDN453ggaPZU29Lb0Ze8ppTazHuwLz3FQPJ16/6Si
	 1hZYXDsLJAYStAUDQ6tg1W5RA5T4aWBOVRSt7MmgDuuvxoczUrf0deoPNeRbdnxvjz
	 MdZbmaA/K5sY6sKUW4cm6//j/NCx3/UJRwc+WK3pFZlQBlkmgAZMwibfO9Sdu7/hGb
	 wKlxJdwi4GYiDWa+H9J4TWUqBwoJTC8gDh898rQ0HysyIDNFfY/t7A8etimM5qU5wR
	 Rr/3PxcGNpB3LRiktL5vZHiBdmPBQqkQt/sVJz9jx5Cy8i11DCc+sLWclNAHpNTfdu
	 QmpEh1CPt2kLPFxfaBDsfAhzFTRXK+5CS2hlHfqs54jXCnkn5gMV1UCmwXOl6qaUPH
	 /pmxVN4dpZ8r9nZkKGocdwLlvCpfQi6zE2PL4Q9OstejZlI1hlOBhf8I4ceLUgEXRi
	 lJ1qeJ0Fbl0e58NJa5i06/ExEZ3fcUeNuWrMqgpdFSfKZgfgJ2+AgqAhmHkStm0Nc1
	 MhsM1XW42GeAk5AipIDwMmkM5RHP58WkcUgTX3piqE2MbtwfYu0s3g3L7qZwG7EiJa
	 57cvJQqEvNE9u/8EtcnrvaNs=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 6DB3440E00DC;
	Mon,  6 Apr 2026 08:24:00 +0000 (UTC)
Date: Mon, 6 Apr 2026 10:23:53 +0200
From: Borislav Petkov <bp@alien8.de>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: ssengar@linux.microsoft.com, shubhrajyoti.datta@amd.com,
	tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] EDAC/versalnet: Fix teardown ordering in
 mc_remove()
Message-ID: <20260406082353.GAadNtmUQqtwhw4yZS@fat_crate.local>
References: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
 <20260403103457.GAac-X0SzsO9MtwAVE@fat_crate.local>
 <b6af31b0-0429-4092-8ec0-e0ab84a16f39@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b6af31b0-0429-4092-8ec0-e0ab84a16f39@linux.microsoft.com>

On Mon, Apr 06, 2026 at 10:56:17AM +0530, Prasanna Kumar T S M wrote:
> > Sashiko has found things, pls addres them:
> > 
> > https://sashiko.dev/#/patchset/20260401111836.2342918-1-ptsm%40linux.microsoft.com
> > 
> 
> I asked AI to validate Sashiko's comment.

So I asked *you* to address the Sashiko review. You go and ask another AI to
validate the review.

Now, if I go and paste the whole conversation to a third AI, the f*ckup is
complete.

Tell me: is that the goal of this exercise? Let AIs do the thinking
for us and we can all go shopping?

Or maybe *you* should go review Sashiko's review and say, I agree because
<proper, comprehensible explanation> or I don't agree because <also proper,
comprehensible explanation>.

Then *I* go and verify that.

Hmm...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
