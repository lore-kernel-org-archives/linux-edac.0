Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF2E13777E;
	Sun, 10 May 2026 20:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778445118; cv=none; b=ak+fOaGjTiXtq/4kg3WFU+GA8w7bUSfuipIMczrRx8nO1MRMGWUEZ6MYLIhgNNCbxjBUBF+H9waU7Vgo93f1qrJRutJYMj7sWCsvCnLncCW0+ZzTBm0w9NQFGhpUSSKYpMlGVkIMzGUdPfb0qEAk68KTTwyIi1oSJwYESeDxjLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778445118; c=relaxed/simple;
	bh=5+omLs6aw5YAFKvXf4wxEHdVkViLr1pexGF10vcNR6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4d1KZgXtrAIyqKMxAdyvMBZdGrYUzOg188D2mIvADisZmDhiWOG2QDKqVjDhoBXUdeiax5eo8eh83LnhJI81An3hRNG5zD4mRIGfEWIZ1ZdrvWflE1cKKqJBBowUXwZyJ+QxAiiD0Q94+toYf0wvWT3evuntaZR9KGPEvvfwjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NT4ZQTd0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NT4ZQTd0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238C6C2BCB8;
	Sun, 10 May 2026 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778445117;
	bh=5+omLs6aw5YAFKvXf4wxEHdVkViLr1pexGF10vcNR6I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NT4ZQTd0bA4lGgJmRczinaL05ertC9FB/x6ABepIKLRyWfmA4AUE6sT2zIdKZXMFg
	 pE9UE6V5ktsoFmlFge10/xyy1Hy977VTGITHjqA1uE8xgzy9Hl1EbMrTxL6D6nH/aD
	 07KU493LlBm4UimKfmTkIX39IwR0qmKWP8zxJ+diUgCajhf9CGQqURlY3ygKDlIBEt
	 LXQVwRV0boBNnhaTRdUyyku55wexo1R0BDDH/CQrVnYksyBHV8GeEpFGaK5dBljZy+
	 MGvoHDJ/weJa8uB8hOLLCEK7VWoEUVoA89esthp+Kkn0uFzafJya6hrJ+Ao1W6j7L9
	 WRo7hMAUAilmA==
Message-ID: <59ce1037-b6fb-4af7-a213-d605ba5c9a3d@kernel.org>
Date: Sun, 10 May 2026 15:31:56 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: altera_edac: Fix OCRAM ECC init for warm reset
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com, bp@alien8.de,
 tony.luck@intel.com
Cc: linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260509143803.7500-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260509143803.7500-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/9/26 09:38, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The OCRAM ECC is always enabled either by the BootROM or by the
> Secure Device Manager (SDM) during a power-on reset on SoCFPGA.
> 
> However, during a warm reset, the OCRAM content is retained to
> preserve data, while the control and status registers are reset to
> their default values. As a result, ECC must be explicitly re-enabled
> after a warm reset.
> 
> Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>   drivers/edac/altera_edac.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 103b2c2eba2a..9e6a9786a881 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1186,8 +1186,14 @@ altr_check_ocram_deps_init(struct altr_edac_device_dev *device)
>   
>   	/* Verify OCRAM has been initialized */
>   	if (!ecc_test_bits(ALTR_A10_ECC_INITCOMPLETEA,
> -			   (base + ALTR_A10_ECC_INITSTAT_OFST)))
> -		return -ENODEV;
> +			   (base + ALTR_A10_ECC_INITSTAT_OFST))) {
> +		if (!ecc_test_bits(ALTR_A10_ECC_EN,
> +				   (base + ALTR_A10_ECC_CTRL_OFST)))
> +			ecc_set_bits(ALTR_A10_ECC_EN,
> +				     (base + ALTR_A10_ECC_CTRL_OFST));
> +		else
> +			return -ENODEV;
> +	}
>   
>   	/* Enable IRQ on Single Bit Error */
>   	writel(ALTR_A10_ECC_SERRINTEN, (base + ALTR_A10_ECC_ERRINTENS_OFST));

This patch fails to apply to both v7.1-rc1 and linux-next. Please base 
your patch to the latest and resend.

Thanks,
Dinh

