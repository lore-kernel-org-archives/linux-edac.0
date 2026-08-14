Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0542882CD;
	Fri, 14 Aug 2026 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786673737; cv=none; b=Nm8WJK0051w0s7I/HkefP1H0ZU6JNRY0olr8Y1T1AnoNfTCBjTrXv8XMUaTJVFN5p5ETMN4P1OtFZ1xZKVdm+B+JUKcqol+Gz3tBlqqwpqmtpPiMtnSS3LGawoOmBksogE9FZj80+vHMiDfsmwI6JyYJfycMatTwB5ld2lGDQT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786673737; c=relaxed/simple;
	bh=CwhETf6zODOA/fylS259BkUX23OD2U4wgHQdLKOCR3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiJPHH/hnmYZeshJidTswuea6SbkmQocqGM0fPYOYyIfRqTHZM0GHd4/Etxxu7+QyiuHMw2SAqdP/5OReoVGxy5U8RYjFUDscXWdKIWeaZVJIETujhssIzY6/j0b9F9va2+GoNndJqXu8Zc93kZzfSLXagpf/kp/L0oVoMcmrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Q21Btc6z; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Q21Btc6z"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0CA5740E014A;
	Fri, 14 Aug 2026 02:15:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eDR5hX1pNrqs; Fri, 14 Aug 2026 02:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1786673722; bh=Eae1USIGEOezhPbFvUOsiKn5+741YI0pYyhyzHf5kf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q21Btc6zL+cMM17vGX4KKwkcEL/WHm6GlbrZG/A7A/Ld1JGG3LS38zdOnjlFDo7KZ
	 9Yj8On7EuGTRRB8jGzTfADJxtCJpkToCG4QLHoW1fZ3sNbvXYxjlgdTc2T60dZpM7J
	 Kiw2pQ2E6OHCSAisdDb7F7IlS9GMPB29rHJi7MdZudkBkcSP/7VHcKNi1aiW6CuR6e
	 oiwQDzw5xHSEW5FQyCV3crpEn64WRiq+94VuCR+w3K9yLI2u3TURSG6jlCRccOapEG
	 fliPCkExZ1QOjjwr4/9ohQ63AK48N0SJGuzhINOqjTmBnulMsCcf2/UYYpPQy9cFVB
	 FD4NwecvoovhOHmknKeKQgKBZBGc0s5Ai0QGgnH8XdUvOiOfvQA7t3LpgBfAxKFlpa
	 HJ1yT9nOrrT0Y2V98gGYXepnbJ73oEtCiQuPg/x+LmveP45VZQiddb2vQYGtNFHjAb
	 expLtNxBTnKHpUY9RpYhp4GSzy9oSsnVqY/3iACH18pls0evGDsiQG1jSrBYGN3cKs
	 SsRQ9PsoNa0mQ8hN0H9cl4FpiN/TIpVVLLvKAxvAODrvdEcNb66iKhwobHlLLyYNcu
	 HmOi0cuxsEcP9meWaGxcJEqYcr3Wpet/FZU4kPCrDr13dSCNsVoUxW2b0JrjEV+b6X
	 UeVR2bAJSqwKIeOzXdIDtVZA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8AD2840E0031;
	Fri, 14 Aug 2026 02:15:15 +0000 (UTC)
Date: Thu, 13 Aug 2026 19:15:11 -0700
From: Borislav Petkov <bp@alien8.de>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: tony.luck@intel.com, rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 0/4] EDAC/altera: Address sashiko reviews part 1(v2)
Message-ID: <20260814021511.GBan56L1fI-AhQ1g39@fat_crate.local>
References: <20260806155412.1518582-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260806155412.1518582-1-dinguyen@kernel.org>

On Thu, Aug 06, 2026 at 10:54:08AM -0500, Dinh Nguyen wrote:
> Hi EDAC maintainers,
> 
> This is version 2 of the patch series that addresses some of the sashiko
> reviews for the Altera EDAC driver.
> 
> I apologize for the lateness of this series, but I do believe these 4
> patches are important enough to be included in v7.2 because they are
> confirmed bug hits.

Sorry, it is too late for 7.2. But you've CCed stable so once I queue them,
they'll find their way to the longterm kernels.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
