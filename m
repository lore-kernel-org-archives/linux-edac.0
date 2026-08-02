Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A58B32B11C;
	Sun,  2 Aug 2026 18:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785696759; cv=none; b=E86xd1PfDzDCUuIiLfQnCZQOFZI8P8mrU2Nz/F1w8EdGm/ltDrUQaL6FpNjn8f1Q4JUJsRMWCxSkW/g+TSStbKHe/oV+hMAfyr4iRXBbL8qsY+VWYBd45SwbpHB/wyPKwyjKWWraDrVlTudvZBzMylTf3jV3DEURumwm1S2XPjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785696759; c=relaxed/simple;
	bh=f1kacSJLCNkIkwKIeG5fv3ZvSwpUSUj5A1sAPah71pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulgIV77vx/MSI9QwfyZG682YIzD4oq8PSY0mLUnDSw4Ae9Wkm4jLOq/gVZegggOldR7anh+Di2KmvlmLkqffLHdb+sCPiEepNn6bFY3LcHdvhCexVl85vjQNHLkWwR+oJecb4pl10LHLEJNKhNBBWXoy3QdR9k5FTo4tehVgDhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IkVw6ikI; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IkVw6ikI"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A55A140E00E6;
	Sun,  2 Aug 2026 18:52:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Qwf9MP8sUihv; Sun,  2 Aug 2026 18:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785696742; bh=I4sNSPtdW3RC56MU/21uboM1Gcdr7bhfyFtuegZ/DWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IkVw6ikI7jzv3YeNzHXs2idWfcQ3RHvoyvkPcLj9++crkd1xVvWipnFL58TcWzJTx
	 AJPcNT5TztSSXw8prnSwVukboDNsWC9m69BRh5Hfc5hP8AcHTka9ey9q20NeP1bNgP
	 O32i0WRzu5XheIQU4g1EaSGaLKg+U21Vxu7K+nt3P4BNGR7axoJG77ZhRxIfeDwadO
	 wbal1c2U8LEVywIvv2vcGr3ILxV25TrmElwcnF5ODECo3w7r9L7YZ/VGwWOvnDHnSn
	 YDc1EYEx3+r77/kJpiFFJxEqx7MVmllwdt8snUBK1+9/YNxLCBaoHa8H1j7DypKRO0
	 2WmFzjbtxp7plp8PnB5oKtHs2mp9HlM6GD0ngCos/T3CQLfUWPKaKoaZoiT5z6uYUU
	 rKe1kUznAAP/d0omPSFz0doHKNkqluRtR51gBb7bmq77mlsJujuz/4svdPBmQofx7N
	 b+HldAwM7rBM6SUWWLFJ94lUuNBOkcSmX4L9bxzhLsehaFh97VxWXXKG/acraYQxoa
	 wL3UDLfVkpGrsEB/TNa3O7zHxb4sdjHmiB56ayczKwvuPbV8xB8DQNat/45Jf5gwu2
	 LXT3LUVQ6ihr/sszyd3P9Ug+qFPsncPz0kprwh/owbkIxyARrfZdHXPItPSOIV2/Mp
	 pEcdq/z1hqE7C0mE69yCsLXQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2513A40E00C3;
	Sun,  2 Aug 2026 18:52:14 +0000 (UTC)
Date: Sun, 2 Aug 2026 11:52:11 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-edac@vger.kernel.org, git@amd.com,
	shubhrajyoti.datta@gmail.com, Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] EDAC/versalnet: Add NULL check for mci in
 remove_one_mc()
Message-ID: <20260802185211.GBam-R2waQcPgti5EO@fat_crate.local>
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-3-shubhrajyoti.datta@amd.com>
 <4b6253ae-dad7-4591-ad11-8cebb31caa86@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4b6253ae-dad7-4591-ad11-8cebb31caa86@amd.com>

On Mon, Jul 27, 2026 at 01:41:52PM +0530, Pandey, Radhey Shyam wrote:
> Confirm on fixes tag. The bug likely goes back to the original driver.
> > Cc: stable@vger.kernel.org
> 
> There is no CC to stable kernel in email.

Ok, before you state something like that about kernel process rules, just go
to the source and confirm it:

Documentation/process/stable-kernel-rules.rst:

"Option 1
********

To have a patch you submit for mainline inclusion later automatically picked up
for stable trees, add this tag in the sign-off area::

  Cc: stable@vger.kernel.org"

So yes, you should very much cc stable. The additional reason being that the
stable team will pick up the patch faster instead of them running it through
AI, it finding the Fixes tag and determining whether it is backportable
material or not.

Oh, and if you want that to happen, you better write a good commit message
explaining what is happening and under which circumstances and why it needs to
be fixed.

:-)

HTH.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
