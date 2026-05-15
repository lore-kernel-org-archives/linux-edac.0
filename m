Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B2E3F0754;
	Fri, 15 May 2026 08:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833066; cv=none; b=mm1MsUxQCCqjbUjKfEfxRptG8sAS0Nc/EXk7DEN8QukjiSaqz81G1r4qcnCEfeVW5rDYc3iJPF2J5i1lzX+6rlGpibitZUyw8d5gLCK35oPLwvu0pWI2Cm1HdmsEB4LZ+vH61EMk0tJ6Y4P6bZAmJY8nDf30Zwn8S8VY8+Uezdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833066; c=relaxed/simple;
	bh=deIKE2fFCccpnR9JBEyz57WmsXlRkQ5mewT724BPktc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrt/mfi4eLmsCIr7c3/opiRmsFQeDH9kfZ+RthJlgBhswuLll48f14K7AAh+N41zMu0P2iIFMQDUo60BqMoDf8NA4Cr2gA2rv+f6+wuvl2XMJhnB7Te7K/cimgH78EJnU7feo+KECoVg+oFQqvh0DWUj5voo7PsAvuqf1z47t58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QDzI9vrP; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QDzI9vrP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3411240E00BF;
	Fri, 15 May 2026 08:17:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ngmsLHE7-Cdh; Fri, 15 May 2026 08:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778833053; bh=9xQQ87o9caMOHKWPbr9crevd7LTT9ISliweuEiZVYEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDzI9vrPwpKnawf/nA9sV/HIQ3xgQwr1NZ+p7CqJAM1vzv6bIzLyp420qWTCqAWz6
	 12kJ0WP0He7cdBVWyH5QKXOuV5gMaw1fzbKI7UV3zphVQTy8oSEcp6Z1/ZO1K69BSF
	 0Zl4EJO8ObXB/ZyxDojhTzCHY4kloHRsYOGSnf09YEXZBqx4aiSWl3pERN9HIlMPSY
	 WLmshZ9/URCAF5KW/61Vwl1m0kn22beTiAJxOBIUMeoJn0f68UTC7HKY45BuUBsL86
	 o5ILv4dRqZfteI7qnSQkDKUkDF8ahjDi3HMuRwpz4N67xzSK5cL7Z4Jj9wlicaPuCC
	 b3p/1SOYoWDfi8d2WTyBZHL9oei3bwXm3qELLb3+j3MfHlQaqaPL6Ce8aTYI5VgBFG
	 PsGVv+Kd/+G/S0eTFmi/8EEJPm+Fv1vzPjtabxDcYZs7IL8Rh4yP07AVBLSCKEWYqH
	 rZ68eJmPHe/pku6NHaTHBU2pR+/FPjf27sCSlQazGWKStT1KgpVvpq26aZP2IfPznU
	 sh7yTBObDhc4PcYqDlmDgS16ODCl1AcesI2NIkpt1Sy3nk1/QelJsr2zjmWdFZpDNL
	 kqb4K5+bqgli1C8S1zPqmCwaI/O2S+WDaeldvht19W3PLQLd3f6xuqFfG3lJJsdJv4
	 DedTuqCkZ8STqstrRwwH0/Jo=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id D31A340E01A9;
	Fri, 15 May 2026 08:17:28 +0000 (UTC)
Date: Fri, 15 May 2026 10:17:22 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ingyu Jang <ingyujang25@korea.ac.kr>
Cc: Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RAS/CEC: Use IS_ERR() checks in create_debugfs_nodes()
Message-ID: <20260515081722.GAagbWkvT7N09DBX05@fat_crate.local>
References: <20260514193202.2397348-1-ingyujang25@korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514193202.2397348-1-ingyujang25@korea.ac.kr>

On Fri, May 15, 2026 at 04:32:02AM +0900, Ingyu Jang wrote:
> debugfs_create_dir() and debugfs_create_file() return an error pointer
> on failure, never NULL, so the NULL checks in create_debugfs_nodes()
> are unreachable and the dedicated error paths cannot run.
> 
> Replace each NULL check with an IS_ERR() check.
> 
> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
> ---
>  drivers/ras/cec.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

https://sashiko.dev/#/patchset/20260514193202.2397348-1-ingyujang25%40korea.ac.kr

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
