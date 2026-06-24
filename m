Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED29263C8C;
	Wed, 24 Jun 2026 05:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782278301; cv=none; b=OOyR4yqpeuiQ+xCM/TJSw9lK2GX1CwEYDmA6Y1PCieNxi6vN+zfKpKNRD5d+ZFGc2cRPHjKbx1otRBOmzaNVtQ4o4rEA9uyqOpo/MjnOiTCE11J8IVwCwVTm74HBN5fRn/a2ak3yRZK6Qr2/H4WCiVG5sfGnrmKtEKX08UEohyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782278301; c=relaxed/simple;
	bh=3s68KXy1G803nCVGGxqyl0Gfp5+OBIFOzFznnv4cWWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+VMP2hCxZZOcOwI857mTtClx7v1FgN5IGEuJfu/DuPllzb0W09j0cFj4youa+cl6t1WD8MBOy/G/oXwkjwlQOUmOGdf4fXtxrl+R3yOqbnvQtZhD5hVALLeaiEW0s0h6SSHCGVmxNiQsQCE+mi2Rqx65bfkVkTM0IELMgmXL1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kqc49I16; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kqc49I16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFF41F000E9;
	Wed, 24 Jun 2026 05:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782278300;
	bh=kyS3S+in2Zx1XS2ymJUzVwT3rFZt6Qn2AxRHCjRVfxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Kqc49I16p91jYAmy1XwJpfzKZIIB/bbzZNouztxAljdFkaLjzu5gBkrM4B3kPRvPF
	 Lv2ZGUaR/BwCmzm5sog4Nsy+vQoqB+edUKEO8827UIEgfCm4+VyUJrgbh1bAYIy/bo
	 yv5tRQVM42IhsasJZjHbmK2PTCqe1A33sS5BQofYUvHvPEoMuDL5AHYH/r4fI1PvMe
	 n4dDJRW6KTY5d9FfIAJ4/8WIENXVOdk44mszkX7WEhNlM/DlPaN1LTTZPeiaM/PnWR
	 PJ6w37W0yGFBREWTaJN2TKelsTH8cjs2QYDN0WhoyrvqmngtU/25aJoHsPTgBkK7IS
	 G0CC76GBRK+1g==
Message-ID: <4a6cf8c0-e425-4381-adf3-daaa1b20ba96@kernel.org>
Date: Wed, 24 Jun 2026 00:18:18 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] EDAC/altera: use SDMMC compatibles to select A10/S10
 IRQ layout
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260615191508.46335-1-rounakdas2025@gmail.com>
 <20260616081709.48774-1-rounakdas2025@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260616081709.48774-1-rounakdas2025@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/16/26 03:17, Rounak Das wrote:
> The SDMMC ECC IRQ layout selection uses CONFIG_64BIT to distinguish
> between Arria10 and Stratix10 paths. This is architecture-based,
> while the interrupt layout is a hardware property described by DT
> compatible strings.
> 
> Select the SDMMC IRQ layout via of_device_is_compatible() checks
> for altr,socfpga-s10-sdmmc-ecc in both altr_portb_setup() and
> altr_edac_a10_device_add().
> 
> This keeps the existing behavior for both SoCs while making the
> selection mechanism hardware-descriptive.
> 
> Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
> ---
>   drivers/edac/altera_edac.c | 105 +++++++++++++++++++------------------
>   1 file changed, 53 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 4edd2088c2db6..161331ef57c01 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1548,15 +1548,16 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
>   
>   	/*
>   	 * Update the PortB IRQs - A10 has 4, S10 has 2, Index accordingly
> -	 *
> -	 * FIXME: Instead of ifdefs with different architectures the driver
> -	 *        should properly use compatibles.
>   	 */
> -#ifdef CONFIG_64BIT
> -	altdev->sb_irq = irq_of_parse_and_map(np, 1);
> -#else
> -	altdev->sb_irq = irq_of_parse_and_map(np, 2);
> -#endif
> +
> +	/* Using compatibles to determine the IRQ Index */
> +	bool is_s10_sdmmc = of_device_is_compatible(np, "altr,socfpga-s10-sdmmc-ecc");
> +
> +	if (is_s10_sdmmc)
> +		altdev->sb_irq = irq_of_parse_and_map(np, 1);
> +	else
> +		altdev->sb_irq = irq_of_parse_and_map(np, 2);
> +
>   	if (!altdev->sb_irq) {
>   		edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB SBIRQ alloc\n");
>   		rc = -ENODEV;
> @@ -1570,29 +1571,29 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
>   		goto err_release_group_1;
>   	}
>   
> -#ifdef CONFIG_64BIT
> -	/* Use IRQ to determine SError origin instead of assigning IRQ */
> -	rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
> -	if (rc) {
> -		edac_printk(KERN_ERR, EDAC_DEVICE,
> -			    "Error PortB DBIRQ alloc\n");
> -		goto err_release_group_1;
> -	}
> -#else
> -	altdev->db_irq = irq_of_parse_and_map(np, 3);
> -	if (!altdev->db_irq) {
> -		edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB DBIRQ alloc\n");
> -		rc = -ENODEV;
> -		goto err_release_group_1;
> -	}
> -	rc = devm_request_irq(&altdev->ddev, altdev->db_irq,
> -			      prv->ecc_irq_handler, IRQF_TRIGGER_HIGH,
> -			      ecc_name, altdev);
> -	if (rc) {
> -		edac_printk(KERN_ERR, EDAC_DEVICE, "PortB DBERR IRQ error\n");
> -		goto err_release_group_1;
> +	if (is_s10_sdmmc) {
> +		/* Use IRQ to determine SError origin instead of assigning IRQ */
> +		rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
> +		if (rc) {
> +			edac_printk(KERN_ERR, EDAC_DEVICE,
> +					"Error PortB DBIRQ alloc\n");
> +			goto err_release_group_1;
> +		}
> +	} else {
> +		altdev->db_irq = irq_of_parse_and_map(np, 3);
> +		if (!altdev->db_irq) {
> +			edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB DBIRQ alloc\n");
> +			rc = -ENODEV;
> +			goto err_release_group_1;
> +		}
> +		rc = devm_request_irq(&altdev->ddev, altdev->db_irq,
> +					prv->ecc_irq_handler, IRQF_TRIGGER_HIGH,
> +					ecc_name, altdev);
> +		if (rc) {
> +			edac_printk(KERN_ERR, EDAC_DEVICE, "PortB DBERR IRQ error\n");
> +			goto err_release_group_1;
> +		}
>   	}
> -#endif
>   
>   	rc = edac_device_add_device(dci);
>   	if (rc) {
> @@ -1974,29 +1975,29 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
>   		goto err_release_group1;
>   	}
>   
> -#ifdef CONFIG_64BIT
> -	/* Use IRQ to determine SError origin instead of assigning IRQ */
> -	rc = of_property_read_u32_index(np, "interrupts", 0, &altdev->db_irq);
> -	if (rc) {
> -		edac_printk(KERN_ERR, EDAC_DEVICE,
> -			    "Unable to parse DB IRQ index\n");
> -		goto err_release_group1;
> -	}
> -#else
> -	altdev->db_irq = irq_of_parse_and_map(np, 1);
> -	if (!altdev->db_irq) {
> -		edac_printk(KERN_ERR, EDAC_DEVICE, "Error allocating DBIRQ\n");
> -		rc = -ENODEV;
> -		goto err_release_group1;
> -	}
> -	rc = devm_request_irq(edac->dev, altdev->db_irq, prv->ecc_irq_handler,
> -			      IRQF_TRIGGER_HIGH,
> -			      ecc_name, altdev);
> -	if (rc) {
> -		edac_printk(KERN_ERR, EDAC_DEVICE, "No DBERR IRQ resource\n");
> -		goto err_release_group1;
> +	if (of_device_is_compatible(np, "altr,socfpga-s10-sdmmc-ecc")) {
> +		/* Use IRQ to determine SError origin instead of assigning IRQ */
> +		rc = of_property_read_u32_index(np, "interrupts", 0, &altdev->db_irq);
> +		if (rc) {
> +			edac_printk(KERN_ERR, EDAC_DEVICE,
> +					"Unable to parse DB IRQ index\n");
> +			goto err_release_group1;
> +		}
> +	} else {
> +		altdev->db_irq = irq_of_parse_and_map(np, 1);
> +		if (!altdev->db_irq) {
> +			edac_printk(KERN_ERR, EDAC_DEVICE, "Error allocating DBIRQ\n");
> +			rc = -ENODEV;
> +			goto err_release_group1;
> +		}
> +		rc = devm_request_irq(edac->dev, altdev->db_irq, prv->ecc_irq_handler,
> +					IRQF_TRIGGER_HIGH,
> +					ecc_name, altdev);
> +		if (rc) {
> +			edac_printk(KERN_ERR, EDAC_DEVICE, "No DBERR IRQ resource\n");
> +			goto err_release_group1;
> +		}
>   	}
> -#endif
>   
>   	rc = edac_device_add_device(dci);
>   	if (rc) {

With this patch, I'm getting this error on a Stratix10 devkit:

[    1.385621] EDAC Altera: Error allocating DBIRQ
[    1.390195] EDAC Altera: sdramedac:Error setting up EDAC device: -19
[    1.396645] EDAC Altera: Error allocating DBIRQ
[    1.401191] EDAC Altera: ocram-ecc:Error setting up EDAC device: -19


Dinh
