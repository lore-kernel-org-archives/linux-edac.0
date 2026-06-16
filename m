Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9C7361651;
	Tue, 16 Jun 2026 14:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781621102; cv=none; b=G+SWJ2EY48AvbjRW8ii6VfYmYwV7M7k6v6jdIqknkqEnjybwskfSwdBRmocKo5E1Ibb0xblVGAuDpUrqRKhO8wpSyvQ24YV5QCwvTVB5FJcHKEHYXsEPGl9BPx4ysmKPyRenTI8xp/L/00Fb3hbhdpOpBXmWo5ax7dVKbUb93z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781621102; c=relaxed/simple;
	bh=E5f8eF86lfwzBUvUJU6m2HjC2w4SRdT1ErZa/j2p938=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHCi7GFm+VrgRBSpmu3UGIG0ax01W1+O6oHGAo60sLtQ1ZeYkILGPdfCN7+uJy8IvoqWiRlND3zATLTRtngOZCJZWzRo46aXmVbxs8g+eV7mC6QIhkFThmohaxfceNBi1VBA6EjYjzZYYUyi75kNpNeWn3VN9reBszfrGMyXX+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScpHlgP8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScpHlgP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C261F000E9;
	Tue, 16 Jun 2026 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781621100;
	bh=8oEr/+bcd+Nun0a0d0smaEpI6J/U+YDmt4PJcrYVxAU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ScpHlgP8wGROizczQVKwtfeagiTpGOLCdO+u+I3S1vvHrGGwRVfbRU3hfl1kp+uJi
	 FEbP1oT5TPJcffehbZCydotKOOXtTDSGkTz2u+fJLioFFjXeqZX2z1P4AWvu3lmKnp
	 ebX3fbuOcLt8r5uGwjyQOE3LZPxVkms4rDnqDwniB+0mFrnEsNYzyZPXoWWEZS7ms1
	 YBPRjgSC153tpj5gOBcwNCKb16yPXQDbNBVEnFR5168HJos7eRSm/8eub+oTE6Ej0h
	 S2o/2+7YrSp2G9uebcgmFOTiQov4/IG4tQGcfgUbs9LpuZKW3DkU4cHnSy+umzPJCo
	 Mwv473eVxMCvA==
Message-ID: <470f54e9-9e92-40c1-9383-6be055170d69@kernel.org>
Date: Tue, 16 Jun 2026 09:44:58 -0500
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

Hi Rounak,

Thanks you for this patch and attempting to clean this up.

On 6/16/26 17:17, Rounak Das wrote:
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

How come you've decided to look at the sdmmc-ecc compatible instead of
"altr,socfpga-s10-ecc-manager"?

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

I'd like to avoid adding more calls to get compatible in the code if 
possible.

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

Got a few checkpatch warnings:

CHECK: Alignment should match open parenthesis
#84: FILE: drivers/edac/altera_edac.c:1579:
+			edac_printk(KERN_ERR, EDAC_DEVICE,
+					"Error PortB DBIRQ alloc\n");

CHECK: Alignment should match open parenthesis
#95: FILE: drivers/edac/altera_edac.c:1590:
+		rc = devm_request_irq(&altdev->ddev, altdev->db_irq,
+					prv->ecc_irq_handler, IRQF_TRIGGER_HIGH,

CHECK: Alignment should match open parenthesis
#136: FILE: drivers/edac/altera_edac.c:1983:
+			edac_printk(KERN_ERR, EDAC_DEVICE,
+					"Unable to parse DB IRQ index\n");

CHECK: Alignment should match open parenthesis
#147: FILE: drivers/edac/altera_edac.c:1994:
+		rc = devm_request_irq(edac->dev, altdev->db_irq, prv->ecc_irq_handler,
+					IRQF_TRIGGER_HIGH,


Thanks,
Dinh

