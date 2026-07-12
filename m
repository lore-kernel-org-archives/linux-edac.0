Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5C820D4FC;
	Sun, 12 Jul 2026 01:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783818099; cv=none; b=mYXj2xmFBipWrHWhlb7GtbHCilzIL9YTd5x7A3rVMDms69D8RV6UBGk0zaktSrpbSamZI638RMMHoeQN/nYEgNF1wNxHZMvgQnRmy4ZnyR8/j5JhObvyyBAXHdVeMOMZfpKLhq/e0F3pN915eE+rWV5pcUyrXmAH5BLIOv6bDww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783818099; c=relaxed/simple;
	bh=3yh7tdausv30jcSUnv7jbsVbkgM8/O8GmCVanU4cDkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLmkYlBRHOqKAD+UNmG2dqT9SrG6Xq1/LV5nO6DTWNQY4pUwLTc5KSQlVr3ozzcLn2kzdb+rE0oXt+2bvZqMy1zJ+GXlemKOf/AwWn0dz1R+VJPX/HPJr7RzlP3/2/ec50WAXjqnp6UwzEsM1OuUXyGyXXBSIiLdzbDemNzbSfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KEiX9MOZ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KEiX9MOZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2F08F40E00C3;
	Sun, 12 Jul 2026 01:01:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YhtysmnvEYe9; Sun, 12 Jul 2026 01:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783818084; bh=eKiwfvZsKq57UMdaJC9oz0bEjDpPu+KW97+IJhkVyTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KEiX9MOZWSa5cpxRFTCLEgFUTzngEFdp0R0vP1lomv/ID1k5cwqA0CjcyFAkjqzxr
	 VFDmELIfrpzrxcoRjD1pKGhTmcg9MA0Tk5mQLRmeWXqMpyIyl/H1cNTBv725L+OyK4
	 yYBLfYM6L4Hdny5a/maFUQy26qeIkWEisQKPWdcVjGFRbz+p4ogflz3X43ovEV6JER
	 Av0BXLy9IXHowGDOAWwOK1Kj4ROOW/ayfB5ov0tBKTV7PQkYVKPfr/2wFRBiRV0D98
	 5Z72KitfX5d1Mp55tYge4/Y9MNE7u7uIjUGklGNn+f+UliejWfRJLVsLpUw8oCakN9
	 QMUjrMvf0oxMjXQ/TGi3++uvLtubO9+NtGUioREP3u90TgLYZvq1Xbl3yR2KtpuVUu
	 LCTjebnzPhv6lO6iscRTJMWkHBqG4UpuSqswBVOGl37Bm/NAddL3tZsUboYpwUC4qi
	 Rn7MZ0Xhw3BdaMZpaAl7UQZeHreuJy5nQ4//+gQv8thDSYxyBV8jfou2CuwNOyml+d
	 SWUWs0Na3wVfPBGlFYNMrNfcjzkDlq98JRiyClnxh9FGEsac8GhGhE10x48UrCcuY5
	 zJrRyRfGHvm4p/zYOTTEg8KP4cPhxvww6YrIXnG6Wxcm+Rjv3f23f4Yq/J3IIlv/TG
	 dW5yLHTLb1tz9b5xciUF88kM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C677A40E00C0;
	Sun, 12 Jul 2026 01:01:16 +0000 (UTC)
Date: Sat, 11 Jul 2026 18:01:14 -0700
From: Borislav Petkov <bp@alien8.de>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: shubhrajyoti.datta@amd.com, sai.krishna.potthuri@amd.com,
	tony.luck@intel.com, michal.simek@amd.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Radhey Shyam Pandey as Xilinx EDAC
 reviewer
Message-ID: <20260712010114.GCalLnWrPVfKlyctLh@fat_crate.local>
References: <20260625103749.1416083-1-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625103749.1416083-1-radhey.shyam.pandey@amd.com>

On Thu, Jun 25, 2026 at 04:07:49PM +0530, Radhey Shyam Pandey wrote:
> I have volunteered to review Xilinx EDAC related changes. Add myself as a
> reviewer to stay aligned with ongoing patch activity and actively
> contribute to this subsystem.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
