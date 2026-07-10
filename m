Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7202438026;
	Fri, 10 Jul 2026 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698961; cv=none; b=JpPgqtI/U4T2mlDXDC11oWPT+SkYeKP7n2JQgq5+gqU0Q6EpOoZuIKt6XG6Jk0RBv8k1dUX7dKtPcfhMdmC64WeNrNbJmZqSSUJfDhyGUNWPQTRVbUCTJEL07ZU7PBx0D7wHuIjOCC6yGWY/DJdKxZ6oArfrWe3zwEo+/RheLOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698961; c=relaxed/simple;
	bh=8y0DSWHv/lPELuKx94SKntTfkgvu9JxZtNbFrRvjrTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oliv39B5EWsgvOoLhD91BcRA3Hcl+RgggMHyvnXKpHG/JPi8Mj2xIccblN74nQBC6h0VZAztTOk9gcPCEDCIaGcGpi09M6T7arfNNqqkNXmimthVPl7S1cPmDV//I5xhpAFmBeArnKFUQPuEiJoADehM8dYR/gz9d64dpLfkzPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cD65OVxd; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cD65OVxd"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 75CD940E0031;
	Fri, 10 Jul 2026 15:55:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zLMNf1zZ3HUS; Fri, 10 Jul 2026 15:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783698944; bh=Ljq/Zt1Y7Hdm0EHF796Zy1rzDwCgGUHAdxbBMv5QYo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cD65OVxdHklivnwOXpgDfv8RaXZi6c0KMvEz+4iReqs7+lqjib36EzeHJY/sFyAGh
	 CDKOhz4QOSKwtgdJweoE58T0URd445AKj/58i7mIV2tBOqAT2vrhHAsD+r/1YR0ODK
	 WgOjS3kX7PZm6o9qK/bCwZX0VuYm+LG1kJvnyDn39efhYb/UDVdpTyIDsQWxaminsk
	 40fNRaWpVCHEqAqt0dWTz+ccRgdDyLfR2MEqY5see66C1zGV6/P6QbKmNwbcjr/2N6
	 /Wofto7dsD30lMgAp94myOG7ZRHE5SfPdO8PqfLsYK6nz0a91Y8PmDc1LAHU5o0qOM
	 /f5XHbaZ1kvGOHSWYaqilSYBBxw/frDyBQWMHUzhWAEfv5bvRpENADt39Cdwn7xRfI
	 4QUraNvec0IIE6Pec9SeFT1KCaEG4iM8EsAYy3BbTGb7SlDA/YfqpXOP6P1BChY+o5
	 nYMthcHfm2eIZUwfBCxqYgV64jrGjRlOM0CNk6fzuH6nFuaUOvguiO9i0djhKl21Z7
	 T3mTWho4k3N5YOjqxBfm4pDuunTVn6++YXAoBHfh9gTP9yH8OGlT8FfYrr2P9T3wCN
	 YFQabU4Zb5Wv89YHpZ/estS282uXcAvMolHb4/GI/xjIN6Pwd6lXHphUYy3oGzpbef
	 oMUfqaWiOwNrt+QezOLbW6MI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F320340E00C0;
	Fri, 10 Jul 2026 15:55:38 +0000 (UTC)
Date: Fri, 10 Jul 2026 08:55:36 -0700
From: Borislav Petkov <bp@alien8.de>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Rounak Das <rounakdas2025@gmail.com>, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] EDAC/altera: select A10/S10 behaviour by ECC
 manager compatible
Message-ID: <20260710155536.GAalEV-B7t8p5VwdWU@fat_crate.local>
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com>
 <20260710030717.GHalBh5aBQdoub2_pB@fat_crate.local>
 <970708b7-555d-4fc1-a424-57f794b957e9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <970708b7-555d-4fc1-a424-57f794b957e9@kernel.org>

On Fri, Jul 10, 2026 at 08:33:03AM -0500, Dinh Nguyen wrote:
> I think this is a good cleanup patch and is not a new feature. I was
> planning start addressing these sashiko reviews after this patch.

Ok, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
