Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7D1374E66;
	Fri, 12 Jun 2026 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278743; cv=none; b=A166ClWFHyilnYVSOe9qQlVbvyZZ7weiUyfzH49rAWD9VWf12aVaHK3knV4HXR359YgHQL9cnwJAxCktikkxB+lZIH96M0+YwFDchDUNapdh9+ourAgRwBPYl3lVkH09aUgXwwFeWHcFvbWJ8NsNlrP9M5mbosNuCKqXg3Zz+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278743; c=relaxed/simple;
	bh=IZs/6T4sKfwP+pfSmlDDwiPfIMr6PTg1CefyUJIzOlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7YECx/4gcn/c+9c8vldXvassUsbLP8k+ML5lhJdYwiWjO2QTSZtLTa6BdNG0UGP2GEFjlaKhNnNR1UuA0EppwIddpoByeDaBcuoIHLeHjLt36tGIProjZsrXoTXbpZ7qJcz4xPO9ODCbMObcudfkWX5TZN6VlU7c5XOjqT86y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LGWWf6jJ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LGWWf6jJ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 496FC40E0176;
	Fri, 12 Jun 2026 15:38:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9M3JgCvAKdpg; Fri, 12 Jun 2026 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781278728; bh=i0qxaImPG3lz9reInxGHg9h5BKCrKAebh7tbYFWXt3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGWWf6jJDYLqipzzaOB1hHb9obU+FsaONLStmRLHqQUAYrtJGkY6Wu+mEEmlgI6mK
	 sEmgc3O4YFdjbESFF88VfYg1qB2Ene7Fy0nZBu0OSX+I2AD8z/10bQ6BLTm8B8r0Cm
	 tWeO2zRtkhkdflDSbKKqhnsWa8m0TxHXNuSvfV1sMNS+q/bULJq0NYmpTG7F+2ifpp
	 4YwRAGRrWa61ba73mSnckp+sHjl9TTi1SrXuKi/0nJdqwyXgv19TSCgK6spwpy4bo7
	 zDqwF5+5dZX08AuoFSvFEXjwIiBun5apgNM2KK6lThUQ4qwAJvkie4YPGhqPEnk88R
	 jYeAdCqcm8OksHmRLPLenY+0RWcD/f5DnQJHn++20q+qCwJYxCtklOQMqvdgBbqu3G
	 0/+ijvN2AojtZnLs7AqEIn0vUHDVWH8KzKmIGV89KGPlf48sDf4d7sv4DUnlAgKrwC
	 2P6pdaAa64/DwccTh5QXpuGbQKzPrNTXgQn4PO7h15AQ6Bex9bT1x9Csa+AIzgGZX3
	 qiWHWLyEZ8pE1+g5z22kINvB2UNywIVPoDcpehweFbM1lIchCLO1mP/d4Y4N624D51
	 nEF0jIcPqbO7oXDT19o1jBIQr8fktBzun/0QVoWsZfujhMx26dlgh+WEGlv5Y3mnxW
	 rXutxJ9NQcITSajXO+2pC2bc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AE06E40E015B;
	Fri, 12 Jun 2026 15:38:42 +0000 (UTC)
Date: Fri, 12 Jun 2026 08:38:39 -0700
From: Borislav Petkov <bp@alien8.de>
To: Johannes Thumshirn <morbidrsa@gmail.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org,
	Tony Luck <tony.luck@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mpc85xx: Use platform_get_irq() to get interrupt
Message-ID: <20260612153839.GCaiwn_7qOic4KLF8P@fat_crate.local>
References: <20260603191908.5618-1-rosenp@gmail.com>
 <16fb1ca6-447c-42b6-b4f3-aade5ce7f90c@gmail.com>
 <20260610173352.GBaimgACY4q6PkkkUk@fat_crate.local>
 <ef8107c1-92e9-4540-b88f-0191d1b7a4e6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef8107c1-92e9-4540-b88f-0191d1b7a4e6@gmail.com>

On Thu, Jun 11, 2026 at 07:55:35AM +0200, Johannes Thumshirn wrote:
> Yep fine from my side

From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Fri, 12 Jun 2026 08:35:50 -0700
Subject: [PATCH] EDAC/mpc85xx: Orphan it

Johannes doesn't have the hardware to test patches on it anymore and
TTBOMK, no one else has shown interest so orphan the driver, for now at
least.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dcdc7bda7ace..4f0788c8d212 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9298,9 +9298,8 @@ S:	Maintained
 F:	drivers/edac/igen6_edac.c
 
 EDAC-MPC85XX
-M:	Johannes Thumshirn <morbidrsa@gmail.com>
 L:	linux-edac@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/edac/mpc85xx_edac.[ch]
 
 EDAC-NPCM
-- 
2.53.0


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
