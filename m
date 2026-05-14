Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F403BB69F;
	Thu, 14 May 2026 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758053; cv=none; b=sOoSFe1+WOCJ4sb0xbRIfRaFbolimeNzfwl8KieLbNb5WsS0uOJ/ttR9AhtvfQcA6eTFGFdjJv2ZfHd2jTnzQj4Za+atiSyOIeGEV4j6pMfBm0nnpRzu+y9rQFQObRz7lLccqyMWTE+oWdA1TPoJ0Z343yf4UVzm7gY0ZdW/Fqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758053; c=relaxed/simple;
	bh=b2Ysk0rZahzQciD6CbXDdcNFtEBdEgEZUs+9KTameYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhAhd1rl8AcBbBr3UtztK/f1OLm25dw77WF06ghyF1GtzFNjPTQQ9WeqRzMba+V6NIHMSz91u9J17iQrhCBV4c+0OvD5wj8KG+nFNWBIN9ISEI4DHZWel+6V9xlCkNEWOJvevrPH1PBxDDsw/ZgUDKSuO5atWCVkn1M3TCmSHN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FTN2BoK/; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FTN2BoK/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D8E0B40E00C2;
	Thu, 14 May 2026 11:27:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8ZFT4agbYL07; Thu, 14 May 2026 11:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778758039; bh=cMWoNvhYjLBk8GKYpr5fNxKmmT+7YW45GLpOCuHOejM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTN2BoK/TYXGa7QEb08V7/6aJoN/26SiFVQFaFKH0+NEP+nUFBcEnM0ZuNCv2ba7q
	 dUpJU5WMyncfJme6Ja96TsGstmpm9D33hNGmZIduSZEZ+jP14SLHea/2W5SJpK/XVj
	 psBQ9SiO7W3W1T07CNdfDQmOqPF71VAOvCk4LgptXxxL9L1u7Iv2FPaWQfgKucpT4u
	 YEDTIWmNPQI/uNuxV9Y1wWJ8oFAXBgAQ9mYPGGA87avTLLuQp/Qv9QsRgFwQf3g31v
	 hCFV5ihSo983EQ9mGc6DIpaxsnSHluakyii3dEzIpUHXV7XUunvd2hB9Bnr/PeS20l
	 tIN0X6ASj7LHkHmtIJ/W8BUC0nYYxC8//djJFd6LnMA+L+UfKITmfGxY5X2PpNydfe
	 n5h5QLQ1hePEWsu9llc/q/YP5V6h8cPmKib5NknMN6CKqlmYxdM/TlnhNRL3qsKuRU
	 7UQ2oWMK8wH4KQfJP6YFM99dkMIoeRVyV6gVUsueHF9Jz/36sG4NHfbmpx/KOHS2r+
	 rd5NuqoBUue0JlWl+K5A6qcgnE6FqVHwiCdPbOSPDc9DBvMw50Mn3GSonwH3ySAdjK
	 ptf8HP+pzUiHtDWY7mCY1iox4q+yItqxnlX1x5NsU7ns463Q7vqxYf4uYe1EkkPpFU
	 Gr/KvSQsjA4yyCZDVoQpDsAU=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id DB10F40E00BA;
	Thu, 14 May 2026 11:27:13 +0000 (UTC)
Date: Thu, 14 May 2026 13:27:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v2 1/1] RAS/AMD/ATL: Drop malformed default N from Kconfig
Message-ID: <20260514112708.GBagWxjLhou5sacIv_@fat_crate.local>
References: <20260513205021.368190-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513205021.368190-1-andriy.shevchenko@linux.intel.com>

On Wed, May 13, 2026 at 10:48:55PM +0200, Andy Shevchenko wrote:
> The capital letters are for symbols and N in 'default N' will be evaluated
> as another, nonexistent, Kconfig symbol, and not as the 'no' it should be.
> The most important is that the 'n' *is* default 'default' already. Hence
> just drop the malformed line.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: rephrased the commit message to mention 'N' vs. 'n' (Boris)
>  drivers/ras/amd/atl/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/ras/amd/atl/Kconfig b/drivers/ras/amd/atl/Kconfig
> index 6e03942cd7da..44c2fd7febc5 100644
> --- a/drivers/ras/amd/atl/Kconfig
> +++ b/drivers/ras/amd/atl/Kconfig
> @@ -12,7 +12,6 @@ config AMD_ATL
>  	depends on AMD_NB && X86_64 && RAS
>  	depends on AMD_NODE
>  	depends on MEMORY_FAILURE
> -	default N
>  	help
>  	  This library includes support for implementation-specific
>  	  address translation procedures needed for various error
> -- 

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
