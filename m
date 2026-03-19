Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629D1230BE9;
	Thu, 19 Mar 2026 18:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773944135; cv=none; b=SnY9aRz3yii1lrsBXYcCjh+Cz15Y5AqocUh7CZrkvYms8wXT2B/yIxadMfYzXllYJCO37T6q7UeKvAkwEgz0i7KtDI+VnKCBnNHEqQvAAwunfnlcxesII07x2R4jyQ+5psL54hGzngIssjRS1T5pW1zuENJJJsbkXPW6ATg086Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773944135; c=relaxed/simple;
	bh=lKe7q8TO2g8cdMKX+lyZkBvfa/FPJ5MVUfierdm60bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hfcq7KTDggg+x6LlLnREyE9jKqQ57kZg17upNFt1IIQ9EdHg5H7QBlgQzfxUkuoyQ/GAqyfkKaQLM2HHJKQqPMRHuJb6jfoY+fEyzLMHnJ7oldudmkdtikD5yT4paJM0bvHPDsmgAeTvqUqXesB6x1q09dLTw26kCPuSByWM8p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Dtr9Lk71; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Dtr9Lk71"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5C01640E0250;
	Thu, 19 Mar 2026 18:15:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jv8_Ncata-fM; Thu, 19 Mar 2026 18:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773944120; bh=jZ7GO2LVNpNesCgHmbu7WrmNE4ND2OPon5742j6MPpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dtr9Lk71s4qIRRTjvvfctOBjNVznV2ufNcPZuESPA1Qn0hp5sx0T38tjqopHIoXrJ
	 nzg+vYSWqQwDTRbD2TPXhm5jrCkl7KqCEhkbQRB/ZCDTFlbImXugmEKsUOWGiGpAxQ
	 Ee3xbA/bsIWJUZWDrCVfhtZzd+kr6PySHIybFmrjLs7hDRo0fJaY69r0guaTJwZUIG
	 qi2MzBWBWGmXFHfqLf9CipiWk/cQKaGZKqJyguyUnblSmTRSpmMYbxYMaEpq7S4a7Q
	 kgNNMtg4pgVfSG4zhqAB6oBOhkhFipbj3zvQtVnR0rVqL6ge9KVg7q+WZyLKU0Nefj
	 8q7me4qmBN8f1Y9W76y0y66HO2P0AKplYsAQMm+L2NXN6cDp9rd5uPGlmx3f9zcjLI
	 9zxn52Mm0TQrAtbv0pmh8N0wqYKMK/i/tLP73Q0u5mbMLYvOWYupEuw5gw2LtJx6wO
	 s8NxCErEWx8chQjiZonxW2pSvd/1v7Wme9mnVVU3Lp4bwOZ2BQEH/bKkugKHMb2uhE
	 I3QcwX207A3GS6BXIdDv1D+V/9aP4LUmUVGVaeVeQiUcvx0iUbttx8Ce0GgsuE/LIA
	 HwoduMLqplKpDt9/BWCDYiEaJrRO21UkzxGzNLu20PeQu2gQqIQyQe4Za/6LPm3EMR
	 ifCZr1nZGEF1bKi42zwojb/g=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 2551F40E015C;
	Thu, 19 Mar 2026 18:15:14 +0000 (UTC)
Date: Thu, 19 Mar 2026 19:15:05 +0100
From: Borislav Petkov <bp@alien8.de>
To: Devang Vyas <devangnayanbhai.vyas@amd.com>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ramesh Garidapuri <ramesh.garidapuri@amd.com>
Subject: Re: [PATCH v4] EDAC/amd64: Add support for family 19h, models 40h-4fh
Message-ID: <20260319181505.GAabw9KWLSrGM575XU@fat_crate.local>
References: <20260317183453.3556588-1-devangnayanbhai.vyas@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317183453.3556588-1-devangnayanbhai.vyas@amd.com>

On Wed, Mar 18, 2026 at 12:04:53AM +0530, Devang Vyas wrote:
> Add support for Ryzen 6000 Zen3-based CPUs in the V3000
> AMD Embedded SoC platform which uses ECC memory and would
> need RAS handling of hardware errors.
> 
> Co-developed-by: Ramesh Garidapuri <ramesh.garidapuri@amd.com>
> Signed-off-by: Ramesh Garidapuri <ramesh.garidapuri@amd.com>
> Signed-off-by: Devang Vyas <devangnayanbhai.vyas@amd.com>
> ---
>  drivers/edac/amd64_edac.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index 2391f3469961..6cf0b6d7b5ec 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -3863,6 +3863,9 @@ static int per_family_init(struct amd64_pvt *pvt)
>  				pvt->max_mcs		= 8;
>  			}
>  			break;
> +		case 0x40 ... 0x4f:
> +			pvt->max_mcs			= 4;
> +			break;
>  		case 0x60 ... 0x6f:
>  			pvt->flags.zn_regs_v2		= 1;
>  			break;
> -- 

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
