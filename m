Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BAF47F2F0;
	Tue,  7 Jul 2026 21:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460918; cv=none; b=pYOn3qjuSJHgNBRERNRBYs/3Zf32illkwtYSfdAmgIv+/Gy/2ny3jJZN8oS5kraj23LL8Uzcx4HtahyWeaS07CuIairvziX+4JliX0nynq1Im3CGK+z2drixxiwvEdmpOM6rmWu/ysLfhbdhM61SSPSDJcSXhEW1AhOdKp//nes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460918; c=relaxed/simple;
	bh=HWJHcXkmYHskREDKB1F2AkM8AagT8f3+fH9AxbcfHYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8OjwYFASJw+f0RTux6iztVkl+PEuWPfRrsMpMMTDtWqY/WfnC4ZcrD2+60D80ZUQqzi1p+stRBiTz2lT9twKDFmA+mNvYJhEPO45suqlfM6CsCdyVztKiBeU+HN7HdGnG8NJvuNmPidoo0W8PYJCRb9fKCf/o8etKUx39tnq/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VCHNsUMx; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VCHNsUMx"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E071D40E00DC;
	Tue,  7 Jul 2026 21:48:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bmHWipJabydO; Tue,  7 Jul 2026 21:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783460903; bh=JUohfl2p1vaQO8DUZZSQriiF/0Im/Ye6FGI4zl08loU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VCHNsUMxih5jD3ilc2H4jIpnPlGXScOd68mnwQGd60/Lld/jq5wDtZY+C9x4F/uJA
	 JnICv7f9Slik6pHrsOPOJ5A4oVXLVZwNcBzq7ZA4rmzZFbc+ksw2xlmjp7P/yaXa5V
	 AUDTTEhI0w7+q+xsD2V6TlG8XTYzmK8c+VgvUTRwx8MMM14x50juB6utBqkW6+025b
	 Z5rfl9mMw89fT/JKC5Bdo/SUA55joM1QrTs2j9ue3Ev85TvQAmLl6mVoVs+ZwwOOYU
	 Ab7gEX9Jzjm/ayqoRsdqGew+rgp/OTiLFMSN0QA3CGTpzmEFFoRktsBQJV/kvjNPWe
	 RhblE6fj7XqZDywbTr+JYkaCP9k+m4oCHdiztgctQ1flQ8oZSn1RWUjNa+6GozYAJh
	 YZui+x8aI4KL6R8DcZryyTUgHyAJ9tAjpM9BHp6/GbSdqglklOXBOq9aH+NmCQx8O7
	 6xTsbfS1n00UZmszQsjUjgiLwMh91PTkeQDGG+fE5eWeb6WMcM3ZP8WKut8U+Yz30B
	 lUeoivDozKx4fEa20xEJzpoVSNvjT1vn3KjBV3XfJlgYrIAAo6uQtuEKb3xNRJ6Zo/
	 BUYtJRG5Ws8ljC545fCakIyDuTrJjAyBu50NZjD1za3+oGKJ+persVU3CwE08CB4mS
	 dHu5m5nBKCHQlgG4IpryVVls=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C6C8940E0163;
	Tue,  7 Jul 2026 21:48:18 +0000 (UTC)
Date: Tue, 7 Jul 2026 14:48:15 -0700
From: Borislav Petkov <bp@alien8.de>
To: Jad Keskes <inasj268@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] edac: edac_device_sysfs: replace simple_strtoul with
 kstrtoul
Message-ID: <20260707214815.GEak10Hzqvwce_kpYv@fat_crate.local>
References: <20260623115323.519298-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623115323.519298-1-inasj268@gmail.com>

On Tue, Jun 23, 2026 at 12:53:23PM +0100, Jad Keskes wrote:
> simple_strtoul is deprecated.  These calls also didn't validate input -
> echoing 'garbage' would just set the value to 0 with no error.
> 
> Use kstrtoul instead so bogus data gets -EINVAL back.
> 
> Signed-off-by: Jad Keskes <inasj268@gmail.com>
> ---
>  drivers/edac/edac_device_sysfs.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)

Sashiko is reporting two pre-existing issues here:

https://sashiko.dev/#/patchset/20260623115323.519298-1-inasj268%40gmail.com

Would you like to take care of them too, in separate patches?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
