Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6488517557E;
	Sun,  2 Aug 2026 18:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785696410; cv=none; b=j6mr29KIah4JEoWdKFcIAKr+5IzhJWALublH1E1egw/G93q50J562kaABJ/L+6uMSKnHJ2r4gMZKRVoZ4faMgdTMDz0fzgneGp8fmxZt20v2/KYFKKSAaCmxLBIi1sjx0Rcz7QWEnJz+hlJZx4kuoF1EFlBAvjRdNFaRo3yh4oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785696410; c=relaxed/simple;
	bh=Hy+3wCnvrp9Vx/6KWoo2BUm6C7+RF6BaAhw0Cd6bWGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMeamQaUYEpFrxUN6YFvfe4o6riWWHWz7YXfOx8AkkoSGiKpVZQBNTDYD5lCBgFA9ONUf0UXjlVZNFVfgobOZqm0veCbHt+tYJCmIgoDSuxUShZi9w0WS/yK1YWkz4PHP3yvuof3ymRx94c0woB09QgFznzB2Vls06Hc8Ql7lss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=NXCv4ylX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="NXCv4ylX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CAC8C40E014A;
	Sun,  2 Aug 2026 18:46:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id D2Y1oaGvsliQ; Sun,  2 Aug 2026 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785696394; bh=kTTll9rVme166jKnZqpyzuxQcNLDrb3C8OCp9l6pr6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NXCv4ylXSM3M9xFZ18+nUKrqGhWdcuzRs5cg0PfZPTRUtWz+igRNf7KdAk74Kl629
	 /inOFy1lMKh8Hc20ObBd8OOyJT1Jfd5O5fsB+JxJ+7xxkwFuOX0BFch62wCpfWP7kM
	 0bmXqUkO9VV2X7q0o8gg6b/wM4/ayM6By8AgxrMjrEQN1fUGhCgfhUa4DuUIUQdj65
	 1AJQw2sL/aCg7LfwKN2dBHzEgBNJcZI22lrUMlyfgE5TtszR96pMv57GeP6tBMsioZ
	 VV5gtj5wTj13/mKNNf96jsWAw5UNaCHRjooZBxG379XVp2AkWLpL8UBXaeoldiw2O+
	 V6Ca4CuMG4cLPXNOlMVFNS2wPDC9M33yXxDjMjqIv8pR26A7d0Iadmf2Wxwj+CWlr1
	 9qt7ctBH+2jtsQQY2krfjr1ZHOOftaKf1ZgTOB2NH86j8BY6cQRoaX7qY6zhLU6UhQ
	 LKYbJuVmgjIAM6mhoVBBYm1KItw5HMEEFUN78ALZLzey7HxQRaUmprEuK+KzkIlb8Y
	 9zNXJcfatisyYq1GHvE4GlxfgSvXgaguUDvtLjoYYajySn5azj47U6DxxsRFuE7yHf
	 5Su0iciqwUvUA3cjgoyrWQgjXSC7GEyAoOIbKalkipvA46GFN5EsbKWqbyaFSgCO1A
	 wB/vPbS1fbWsd3FFTzKkGrMI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 54AA840E00E6;
	Sun,  2 Aug 2026 18:46:27 +0000 (UTC)
Date: Sun, 2 Aug 2026 11:46:23 -0700
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] EDAC/versalnet: Add NULL check for mci in
 remove_one_mc()
Message-ID: <20260802184623.GAam-Qf9-yes1DkNkl@fat_crate.local>
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-3-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724171945.2812749-3-shubhrajyoti.datta@amd.com>

On Fri, Jul 24, 2026 at 10:49:38PM +0530, Shubhrajyoti Datta wrote:
> If a controller's configuration specifies an unrecognized bus width,

When can that happen?

We did figure out that controllers cannot be non-contiguous.

> init_one_mc() returns 0 but skips allocating priv->mci[ctl_num], leaving
> it NULL. On module unload or probe failure, remove_one_mc() is called for
> all controllers and unconditionally dereferences priv->mci[i], causing a
> kernel panic.
> 
> Add a NULL pointer check for mci before dereferencing it.
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000390
>  Internal error: Oops: 0000000096000004 [#1] SMP
>  Hardware name: Xilinx Versal NET VNX (DT)
>  pc : mc_remove+0x34/0x88
>  lr : mc_remove+0x4c/0x88
>  Call trace:
>   mc_remove+0x34/0x88
>   platform_remove+0x2c/0x70
>   device_remove+0x48/0x7c
>   device_release_driver_internal+0x1c8/0x224
>   device_driver_detach+0x18/0x28
>   unbind_store+0xb4/0xb8

How did you trigger this?

The commit message needs to explain the scenario this can happen in.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
