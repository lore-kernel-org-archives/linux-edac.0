Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A44A3EF658;
	Wed,  1 Jul 2026 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782943648; cv=none; b=U+lO82e/ivOPKRWSKoKANY4KO1T4AEQHoRuFekLLA8VpQVGoS0Ppcg/351orJCT+hvVGTWj59lCNzmy57ClmoL9JsBMLoP/YcMG00IL0bXK74jZi/d8b5vVEK7BVI8126r7jJPQ6EegKfKvAbXQ0geZFU7m78T6zQvG8RdzIDaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782943648; c=relaxed/simple;
	bh=vl4K1GcVOWUC493xAIScMk9vP0+4/gVw4CUtS2qJ2dU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4cLKeUOx2ev6XJBqxbQQtj2XATsMs7tCdQvTTjG49JjcSv10Ryt9iGMLZq+g/cRqecncb+5f9mXbngkibGMmTqJALHGl57KLmDT/QD+6wNIm1OBCSl1iUC9/vZdHtg6GUDSvTfPjH89IlVIbetHPMJQys0Hjww8AREQ/TNBLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRPUB6K3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRPUB6K3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B621F000E9;
	Wed,  1 Jul 2026 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782943642;
	bh=UubkpsvdI4dianD1k62rQDDaakMvtOTEAoZULt4KPdU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XRPUB6K3H7j1HukPTCgAEbvW7LJDSQhLH4HfssjLXB0zmpvfTvEcFQSzKihtj2B2S
	 AC5kXZMFmQaDB76Vo5/p/N8D+OqfFEirLONlNe3OPvCE0d6P6Uq17uBM6KHoexzIDK
	 Mz1pcWkFuO0Nwx9LwlpiIlZ+SkCDsjMQXgDgbDG56EMkcbLfJ9fcxi/AXd/rcvSK0I
	 pJOkgbFOcT5TwTdOurak17ht+R7sv972+Br4GvmpCBfFDAC76ZXFbye0Hg3cyhR5UH
	 xPoXPFOR6+22Suw0xXG3dC5smWUPEGg141l2k6hUFl+/AsNA5cO49R0yXF0Ap9G+vy
	 xypeZhvTXzXaA==
Message-ID: <1acf2543-6773-4dad-a94c-76fe3c11ca8a@kernel.org>
Date: Wed, 1 Jul 2026 17:07:21 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] EDAC/altera: use ECC manager compatible to select
 A10/S10 IRQ layout
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260627061723.43014-1-rounakdas2025@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260627061723.43014-1-rounakdas2025@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rounak,

On 6/27/26 01:17, Rounak Das wrote:
> The SDMMC ECC IRQ layout selection uses CONFIG_64BIT to distinguish
> between Arria10 and Stratix10 paths.
> 
> Detect the SoC once at probe via the device match table (.data),
> store it in struct altr_arria10_edac, and use it instead of CONFIG_64BIT.
> 
> This keeps the decision correct for every ECC child device
> (OCRAM, SD/MMC, etc.) and avoids any runtime compatible lookup.
> 
> Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
> ---
> v4:
>   - Carry the A10/S10 distinction in the device match table .data and read
>     it with device_get_match_data(), instead of of_device_is_compatible()
>     at runtime (Dinh).
> 

I tested on both 32-bit and 64-bit platforms and it looks good. However, 
did you want to go ahead and removed the 2 remaining CONFIG_64BIT ifdefs?

DInh
