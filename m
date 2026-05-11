Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A45A37B02E;
	Mon, 11 May 2026 11:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500457; cv=none; b=f+oItKZldLxdCpt2jeeTXP97oZEMDTxOVlk+kabqNP8A2iHIInfN7mZfxHhsBij10ytKyoXWoLrap4Zn9CWPCDpy23mGBjQWYASxZ0SPMCLSidF4DbnHsvWFdEo1Cq16PCRDPGGXmuTt45qIv4S5zri7C7T7KZ0/DObl3x/7+DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500457; c=relaxed/simple;
	bh=V70DY2MwjH9LqVCKwaELL1VguR4Hzd5EyVNfOgXJMYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZ4N7Kx4hWua6Q3MaUjLOu0J0NkhotVdWVir4H7gPb9aUEaXtt/jal1gUqk0xm403C8Eed6n9xIu0uT4DiSZGDan+WvkYBVzW4BKlXb4xj5CrACIuCXwf8iQEY4jtaLHeB9Pbq2gnsyB27snvExfQQk/B57jBCNhD6w8gdYQVjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAN2BNIO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAN2BNIO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923C8C4AF11;
	Mon, 11 May 2026 11:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500457;
	bh=V70DY2MwjH9LqVCKwaELL1VguR4Hzd5EyVNfOgXJMYg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NAN2BNIOdx09DOxNjKkym6xDjwQHkncU62HUnVB1+ovCxbkLPCE74Vts42sATGFi/
	 00vV1iS+ojXdaoXT5XAVmiNYc2UmAIVojyZv7nhM4TSeVTePanX6FkgnuclErJjjjT
	 GkO4SfyhOslrYXj/EtsiskQ+RLd7TSfzMS8JyBIqE6id83e0vGmGhw16908GMxJwoU
	 8RVjuwAIwlxKrsu1yhxJX6OV1OgJJfRdv4Ow3+OZNrfI/E4PpmY20u4TJgv9PxFCe9
	 UpYaFOUru82gjdkelgjeOPFuT0OSuVLVzdMf+A4CjwlwdiE6laolQdjO+0RDyAHvyz
	 ZzG76yVzr1MvA==
Message-ID: <cc767b60-3b91-40d5-aa70-c5f252d1d39b@kernel.org>
Date: Mon, 11 May 2026 06:54:15 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com, bp@alien8.de,
 tony.luck@intel.com
Cc: linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260508075240.23638-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260508075240.23638-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/8/26 02:52, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Guard the irq2 retrieval with an of_machine_is_compatible() check so
> that platform_get_irq(pdev, 1) is only called on Arria10 platforms.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
> ---
>   drivers/edac/altera_edac.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 4edd2088c2db..b30302198cd4 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -348,7 +348,8 @@ static int altr_sdram_probe(struct platform_device *pdev)
>   	}
>   
>   	/* Arria10 has a 2nd IRQ */
> -	irq2 = platform_get_irq(pdev, 1);
> +	if (of_machine_is_compatible("altr,socfpga-arria10"))
> +		irq2 = platform_get_irq(pdev, 1);
>   
>   	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
>   	layers[0].size = 1;

Why? We already switch on arria10 later in the same function.

Sorry, but NAK.

Dinh
