Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739462D781B;
	Wed, 10 Jun 2026 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781112860; cv=none; b=e22886vIZSGsxhzlJWPQC4fC35RiSkWnuw0td7A2WmbS53yC/3y/J0NS6PO2HEXGUHV6wN2g2kJbD9b6UntqNC69+1zNsskex0MHgiOr16P8ehgk+ct5z1ufHyBr8tfgiLKfUmQ4kPiGcHZdWPzGgXYWBUKgDF6qOZgjMGYHsjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781112860; c=relaxed/simple;
	bh=nohTmmIcW43jGz3TsW/E992FkXYo1LWcszUz50fgdDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6hYLcUtVNMqn4e74kO6xD6yyblhlJHcWK/PaPdzp2sdf7vR/RShP7dtK4TYUw54d+Bz/ohVrU1t8uoes9KEJO9vTZlcLEB/OXkyMT6oI3A86AlFuAj2IVZGvg7WFGMDpDPZBD2EKAOG4+QSilr6SiGmn8J2oX9NbhjBbleSg2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XGEeikem; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XGEeikem"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 890ED40E0218;
	Wed, 10 Jun 2026 17:34:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PPxUVehsm96o; Wed, 10 Jun 2026 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781112842; bh=Zd80Es8avDA13jyvZD8x2vSiK9L7y/T3faNdiZGyZ7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGEeikemaov3p+xpKJUHiOuKF1RZZHO7ICojxkE/kctoqoLS8ZMHIi+onrqJ1pbxQ
	 yePZKrEf3gWOiODT4Gr3R3LkdHn7p/hHRvcI10ONE+DbOaE3ZxDJkmK8TUpWxqqso2
	 UyB3TJb9N+ukSB0h6ON3qyIZHFjn6Y6WsnRsEBW3EiWvQGULXaBLd6U4UrHWqkK2s/
	 NRrTIFH9I5BiCXerT42cZQ3vfBxCcvnE9VOwOpqarjDYs69/uaknk8ZfwZlszIx6kO
	 dD1DNdh8fyzKW3//vWA0m3Dz3/XNpaC5yOj485GwkKG+358OhWM2TTsbvq2OMmwhJD
	 U3VFYpJ+CR7E1slAt12YTD0bEXgg0rcQQw2s+l453xbqmVKGNwcIUUz91AcKseqa/y
	 BINYoDvJXPhcujJGxuUsXmIpYpfx97NxXy+WQ9z+Auz+bq2o3czTf1HcVTXSc3hWah
	 fUraKhtQ6aN3lE0kfYZ2CInVB5jUomb8MESNjS7ADiceIDBsENcXH43IhzSFqxxCCY
	 m8eBkxTzF34WSrEDAFedtY+zZ5R1jZrrelK2MkAs/FyV9GIKlrXOtRbpEb7r58R+7T
	 LhslsEkSELcEXaMWJBwut+30XBLnqPnBOQpjdNbiJsQGJAgBvWY7lBROUGVj/hHvmi
	 +P7ktctuX5YHM/BlbvRomua0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EC7C440E0177;
	Wed, 10 Jun 2026 17:33:56 +0000 (UTC)
Date: Wed, 10 Jun 2026 10:33:52 -0700
From: Borislav Petkov <bp@alien8.de>
To: Johannes Thumshirn <morbidrsa@gmail.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org,
	Tony Luck <tony.luck@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mpc85xx: Use platform_get_irq() to get interrupt
Message-ID: <20260610173352.GBaimgACY4q6PkkkUk@fat_crate.local>
References: <20260603191908.5618-1-rosenp@gmail.com>
 <16fb1ca6-447c-42b6-b4f3-aade5ce7f90c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16fb1ca6-447c-42b6-b4f3-aade5ce7f90c@gmail.com>

On Tue, Jun 09, 2026 at 07:59:41AM +0200, Johannes Thumshirn wrote:
> Sorry for the late response, been on PTO for some weeks.
> 
> From what I can see this looks good, but as Boris already said, I don't have
> access to HW anymore so I can't test.
> 
> Anyways,
> 
> Acked-by: Johannes Thumshirn <jth@kernel.org>

... and Sashiko has found a couple of issues too:

https://sashiko.dev/#/patchset/20260603191908.5618-1-rosenp%40gmail.com

So, how about we orphan this driver, considering that we don't have hw to test
it on? 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
