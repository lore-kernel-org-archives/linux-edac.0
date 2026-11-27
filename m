Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821961;
	b=tTLpmpxkmstye6Vhx77ho4AiZ7DpLfS4KSJhwcQ7v5qObrYDP8GmgbC+cZL4yusJ9251
	 YAPrQCAi6Wt9SkBjYWbzxsOY9vbiumpbpJ1v+2mMc1HZw96SeCicptfj5xZUMYuspLrlL
	 G0rNDTMedGIxxyOn/4FtYPt2s6UHs6nvrrHpAiSUX7ydo7Y434ooPHLFoXaMdKlns/vR/
	 TvV3rGCWbqA+uPIEJ+Rc+ngb7KFKyaDfa7B8y1uEGBbk24wnzByxVrleaZ86hZ7eY5kjP
	 xm/fZtAKQbVtbF0J+T/d/5mpgrsusFPRVuk+/cEV3DnSRFqjVbvWfeZdIMn7Trj1fGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821961;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SIEHDDRiOfmHmLYUFgg3a5pTE5LNe6iQBJ7Who+mCnA=;
	b=e4g0Z7IJsTfML6j9Vu7mlWw+8v3mSxBZUq6lakWYkk822sJ6H0AD6/0ppMqdFtXqDKgM
	 7fAlJhlEJi9+yqzPvhoOcI3OyRlNXHGvdk18j+irwWE5aRk6ICNP4nFm5S6zRnxRraDpW
	 3fXBwvWsFrnF5ZrbOCEt395W69eMgTxg0MlwnG5x29jm70a1lMo2oRpm4YLD4qiEYf7av
	 GmvwEoggrUHvsasnzEyoOECnYODOXq/jjgpQaShVFRmOZLklAA4est/tcdarfGeZ8pJlq
	 DjRmIj6KdmmnibgZqX2UZutc8w5tf++rLFWllamOt/ammnEHo8uIXoRy3QatM7R4ojQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Mu+wf+bJ;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794D5606A31C;
	Fri, 27 Nov 2026 23:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 794D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Mu+wf+bJ
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8B06240E01E1;
	Fri, 27 Nov 2026 23:25:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bB1WiqX38b8T; Fri, 27 Nov 2026 23:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795821954; bh=SIEHDDRiOfmHmLYUFgg3a5pTE5LNe6iQBJ7Who+mCnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mu+wf+bJE8+0I0HtzBgCpirPXE/nyKarR33BiohU5JKMtkmMANtlkoEXUABPDeSxM
	 ck8bHwTse6dp4lokyg7y2/AOmFcE7QY3+0O8gQsYVh/vr7fA7VF2g2fdqyuLduHUWW
	 /C3wsIohsyoWbytqXv3mnj+qHFJ/wVHjKWuLfcA4IeaLZEVry3fhy/g8ipf0dooMjK
	 ZwBBNdzhlTaQZ+WjXZrlmht8YxB2MidkVpyrdlKiAcSyo70uXe8wsztBIxK1f0Izaq
	 ISvUrxHaHZUENB7nZi/pNAPalgGWcxPYkBaDM5PAqXEx7ZhvNDP4Fa03PhqD6QyaZu
	 3FVLvzv4/qN3Ua+BVWcRCYURZXN7Xl3jm9nT6pI7DEjIugm+8yzLXp3foIHK3vB/Da
	 SFMakihUDsNLC2kgstWU3RAr1HltGLeHtaR73L1jlnrfx0cHWlZ48z49xldrjAJpPt
	 AiGUoJBb49Rvxn3jjDMy5z96l0Y9pcfj+BTDPgcqh0s0pRViyVuhHORKeWfbNUQX4Z
	 YVedRml93xfTsJfKAFkJScgHjMdx37VyB7U9vAdso2VI17ZeYXYwa0KxY1DJtXCKBJ
	 iVbtxXWeklpvi/wgrBRTeS5UPFFzuWgVzghheeZ1dXeIV/R59mS62MNj3tXYl3SLkv
	 WjSNFY1kZ3vRHV3MsQvExjF0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BB46840E00C2;
	Fri, 27 Nov 2026 23:25:45 +0000 (UTC)
Date: Fri, 27 Nov 2026 15:25:42 -0800
From: Borislav Petkov <bp@alien8.de>
To: Qunqin Zhao <zhaoqunqin@163.com>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org, chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn, linux-kernel@vger.kernel.org,
	Wu sheng <wusheng@loongson.cn>,
	Wang Jinwei <wangjinwei@loongson.cn>
Subject: Re: [PATCH v8 4/4] EDAC/loongson: Add CS4-7 timeout filter for
 cross-node access
Message-ID: <20261127232542.GRawoRdgSyv0fBqyXb@fat_crate.local>
References: <20261118030330.25779-1-zhaoqunqin@163.com>
 <20261118030330.25779-5-zhaoqunqin@163.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118030330.25779-5-zhaoqunqin@163.com>

On Wed, Nov 18, 2026 at 11:03:30AM +0800, Qunqin Zhao wrote:
> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
> 
> On Loongson 3C6000 multi-node systems, when the EDAC driver running
> on one node accesses the memory controller registers of another node,
> the read operation may timeout and return random values. This causes
> false CE error reports because the random values in CS0-3 (low 32 bits)
> are misinterpreted as valid ECC error counts.
> 
> For cross-node accesses, check CS4-7 (high 32 bits) of the ECC
> count register. If the valid-cs-bits firmware property is set and
> the high bits are non-zero, it indicates a timeout or random value,
> so skip the report and return the previous count.
> 
> To avoid undefined behavior on 8-CS systems where valid_cs_bits=64,
> guard the shift with a bounds check (valid_cs_bits < 64).

Do NOT explain the diff in the commit message!

> 
> Signed-off-by: Wu sheng <wusheng@loongson.cn>
> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>

Do you know how SOB chains work?

Please refresh on the documentation:

https://docs.kernel.org/process/development-process.html
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
