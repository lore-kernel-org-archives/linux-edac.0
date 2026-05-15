Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432CB3921E4;
	Fri, 15 May 2026 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845267; cv=none; b=sJkaECfFO+m7GhGN7B+oEMng+iCzgAC5exNEEjnEzh32S982XQgkfy+xhgdDi8bzVlqFkNvJ5WlkjNwOgdUiS3WbXBTZm9tSkYNpjkXVRmsvkQ7lhe3O5/q3e5f3n6HxV+YWQQJ6a9zXBMfN4xYBoWCVnzUBUpF0PFJAQiAawvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845267; c=relaxed/simple;
	bh=ojliKxLIPyVmRn0hRYANGJp+DlbHEI4KeA3aCrfNQQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=haA1juYkxXFFtFynJDJTjCWruMXJmqcw6y7dBuIopNnwEtwMDLXuHGz1XbH0vhSASRjshM/myxVKR+HPg7sprUIcZqi+uASwg9lfeOVU/RbzMykmjGRXGQV3fxJ4zIt/N3bTmHBhlCcqiK6TC2e0TxiMDpvtPrAraMltXfABvko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uc3uJqkK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uc3uJqkK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69617C2BCB0;
	Fri, 15 May 2026 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778845266;
	bh=ojliKxLIPyVmRn0hRYANGJp+DlbHEI4KeA3aCrfNQQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uc3uJqkKVO7ex+RfZyjahBG30iwryxXAvCYbs2oAFy8UGftPt0m3rHQ0A0gcWw20P
	 TEAZKaZ6zYJlx5vNaeTDyRuYTr73Q56xqa+s4zxBH0aylRiwEjj93jbry/C5WOtl8U
	 GYHCET2xyoTPhh2TkbcuAMOMbRarao+jsXDWyH0P/+JAQ5eu9Lvi3XW6zUyoKoAlnY
	 wKzAD+PC4h0MEfaX+pJl75ZZi6Qrir0bWQvFfaJXPwxmPTB4PwOJvqrIzfTARGmveu
	 pZe2rHSGnHjsGk/MJPdtBJ+EgYBgtTClMagqNHdIGSDhUOOTi2+0oT4yxIP7ZbcwBn
	 pgUXMK3Z4vr0A==
Message-ID: <c3af86b8-7187-4299-973a-d89ca0d52e9a@kernel.org>
Date: Fri, 15 May 2026 06:41:05 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] EDAC/altera: Guard SDRAM irq2 retrieval for Arria10
 only
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com, bp@alien8.de,
 tony.luck@intel.com
Cc: linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260515050444.10380-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260515050444.10380-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/26 00:04, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Guard the irq2 retrieval with an of_machine_is_compatible() check so
> that platform_get_irq(pdev, 1) is only called on Arria10 platforms.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
> v3: Fix commit header formatting to follow EDAC/altera: prefix
>      convention as per maintainer feedback.
> v2: Move irq2 = platform_get_irq(pdev, 1) inside the existing
>      of_machine_is_compatible("altr,socfpga-arria10") block instead of
>      adding a separate duplicate guard around it.
> ---
>   drivers/edac/altera_edac.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 4edd2088c2db..ee6ced033f2c 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -347,9 +347,6 @@ static int altr_sdram_probe(struct platform_device *pdev)
>   		return irq;
>   	}
>   
> -	/* Arria10 has a 2nd IRQ */
> -	irq2 = platform_get_irq(pdev, 1);
> -
>   	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
>   	layers[0].size = 1;
>   	layers[0].is_virt_csrow = true;
> @@ -395,6 +392,9 @@ static int altr_sdram_probe(struct platform_device *pdev)
>   
>   	/* Only the Arria10 has separate IRQs */
>   	if (of_machine_is_compatible("altr,socfpga-arria10")) {
> +		/* Arria10 has a 2nd IRQ */
> +		irq2 = platform_get_irq(pdev, 1);
> +
>   		/* Arria10 specific initialization */
>   		res = a10_init(mc_vbase);
>   		if (res < 0)

Acked-by: Dinh Nguyen <dinguyen@kernel.org>


