Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0824A254AFF;
	Fri, 31 Jul 2026 00:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785458234; cv=none; b=ArwynmnDvLxBHZJrnKxX/f1YE6HAF/WsJqgaHIe3KE1q4oIOurIJ7G55DxqfNLiDsD6HQSHLuLj6vKzSR8aH3RFMYc+TUKMirZVWAcDgYv5h2VspvlU1z6BhDoObfmCseetFO8z4zOgb4XUqWlBIL2b/VBac/mNgCGBEr8bE0uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785458234; c=relaxed/simple;
	bh=L3i6TIbmIEhYOrO4t/c6/T8Ei0k3CUdmaeL1yYYVJIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G45A9rIjFEFXFWw9qmbsilbDPsqQMZyh96HKIvlORRtIVrSkG7bhIxSXAztrKtZ95AtpggoLCMOVL5OzzA4KHieUrOR0FF5WpIRaqNcJeGE++blJ3bosuLFfCe7dMlPlbTUV0WeczKUFikMVDBPreiIDWIXYpKXPHS9ErtWqzfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FcM6un7H; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FcM6un7H"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DF20940E01CE;
	Fri, 31 Jul 2026 00:37:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eSjb5jcFHSAZ; Fri, 31 Jul 2026 00:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785458221; bh=lyzxgSHJn/YjIIyx/TFamUzv5COErIt7I/VD4MCYOXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FcM6un7HDcaJkgxX0D4b/hFrLF81QcUcwpNUNmipJmgD4Y/IXgxRa93/zVDtIj8QD
	 GKDMSbpidkm7/wfnRflgDctpQ58ZYqv7yxUHkPfFTQG7SOWGvuD7HR6GIZOE0p10mi
	 bORX0wlhRP9cYOePtG1fSKTwCuauMhH9zw2ZF3gNp6i9iX1BYUZCNTfFNZyglxL88s
	 GM6bPxX5NZWqrSJRfgdTkRYdyqgxt+0aTJ8o/4M8YLhMPOy7nSTKZ5iVl8zEV4VdEL
	 k5nL0YwABkne3W4fAaO2aEwSg3/+uZ8pax7nHtBhOxmXZLHrmvHxrWueqZxUH5NMGI
	 0bgK3HyD0U2pSUKQNpiO2XPXXF7Fdzcj+kDHPyuAXNtmL6DpAvOG6GJo5UkkJ6NRYj
	 DaN0uhIoiMPOHXtc12qCam/3DxCR3Q4LHTVjeoQZecyKQ3DSlNPzJdzD7lX4aQkpCk
	 IqCRiRIgdvoLccfVTHmRXc9+ursxVyGLQJGjFTtgA8G2VcXV0LQddSTTxM1MMtjuKB
	 +cnuKQwVzaITCLhhK4ZJcuDd6PXHQTaGOhTHfOF9l3XqRd5yb3b2wCom+HOULyiTKE
	 jYctOGpX5NBr5zU8xeRIaTv6Lfkb5gIEaTsPeouxOs6lv71Bg65rNZeymQ7vyJm3Ht
	 1xykKBZDdUA+ez05zQSn8Y2c=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6C3E840E014C;
	Fri, 31 Jul 2026 00:36:53 +0000 (UTC)
Date: Thu, 30 Jul 2026 17:36:50 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-edac@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Tony Luck <tony.luck@intel.com>,
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
Message-ID: <20260731003650.GLamvuIgDKrojvA7Yr@fat_crate.local>
References: <20260729012320.616174-1-rosenp@gmail.com>
 <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>

On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> > here already disable hardware irq. Just call
> > synchronize_irq() to make sure pending irq handled.
> AI disagrees with this suggestion:

How about you try to parse what AI says and verify it yourself?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
