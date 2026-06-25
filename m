Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A617E3D891A;
	Thu, 25 Jun 2026 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389350; cv=none; b=NcbkviRI7CZ333+L6QeQjqpT3fk0w+YngF3n1KTOJcmRQT2AhytaqZxmOnFLyyUpVUJkCNe2elHhRYAp0kXDBzD3HlJu4T081m+UOObUktJoyIz9qp+D5dD6nYoIzcuI7ZlDlX+9xYCDXsd9Y+j/qdRKbcWxuRNoBCRZtUKssec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389350; c=relaxed/simple;
	bh=mrVw/fj3uOUblFIFDn788Fx9kjLQmbjVYFxsV4BchKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P93rMy80zl3n5mQ09mlEMaDVnEMDFG+ZXKR9U51YruLgz4NviwpNVAdtSFDBbrHYEcE3JwXPZzfZHh2Ofbyy43QJoaURBToS9kmj6w3HF/RmDF6IaDQfuGlsWr1oJG2ptsqVkImcQlvcz961nELFeFgDqurwZeYmvvh6RNpT0F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckpyaXjR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckpyaXjR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE231F00A3A;
	Thu, 25 Jun 2026 12:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782389349;
	bh=5YVd5XuHouNytSp6w/+Zh27osfE/jaHLIvTAtw0c+/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ckpyaXjRYbdMzwnFzDMLpGhZluq/LiuC1Jj3PD21/uBl8e+salzQwTGi7ZeGE+htD
	 JJNAWH/dcXiy1sAeg0KnJB2ycrceCeDoqZzvYkvmWqZrCn0suXR62T+f2Z6BgRVYVC
	 AEvPZ++973ZTctUIwIfoVqM7POx8Zmbu3badv2NX1QLdidgMl528Eio6v1QuS5+Kqu
	 5WMtDsB5gYwp0Sg4H7ZT3Autb62A2HJ8NokTYrJ4qRsa0y0rn3YVL5d79Hm70c/+Oj
	 11GfrEdOFgZFpbBlPyTpbABptchnG0Fq0/TG/4t5GQV8ZCj2S3GZiQwPK3/zPKZdeE
	 siAHfeT7fxxHg==
Message-ID: <72efba41-f8b2-4cd2-9ce6-824cfc1a9d2c@kernel.org>
Date: Thu, 25 Jun 2026 07:09:07 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] EDAC/altera: use ECC manager compatible to select
 A10/S10 IRQ layout
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
 tony.luck@intel.com
References: <470f54e9-9e92-40c1-9383-6be055170d69@kernel.org>
 <20260617000711.60804-1-rounakdas2025@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260617000711.60804-1-rounakdas2025@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/16/26 19:07, Rounak Das wrote:
> The SDMMC ECC IRQ layout selection uses CONFIG_64BIT to distinguish
> between Arria10 and Stratix10 paths. This is architecture-based,
> while the interrupt layout is a hardware property described by DT
> compatible strings.
> 
> Detect the SoC once at probe via the altr,socfpga-s10-ecc-manager
> compatible on the ECC manager node, store it under the struct
> altr_arria10_edac, and use it in altr_portb_setup() and
> altr_edac_a10_device_add() in place of CONFIG_64BIT.
> 
> Selecting on the manager compatible keeps the decision SoC-wide and
> correct for every ECC child device (OCRAM, USB, EMAC, SD/MMC),
> and avoids repeated compatible lookups. Stratix10 and
> Agilex both declare altr,socfpga-s10-ecc-manager and Arria10 does not,
> so behaviour is unchanged on all three SoCs.
> 
> Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
> ---
> v3:
>   - Use compatible string altr,socfpga-s10-ecc-manager instead of
>     sdmmc-ecc (Dinh).
>   - Set it once into struct altr_arria10_edac::is_s10 to
>     avoid repeated of_device_is_compatible() calls (Dinh).
>   - Fix the checkpatch open-parenthesis alignment.
> 
> v2: https://lore.kernel.org/linux-edac/20260616081709.48774-1-rounakdas2025@gmail.com/
>   - Use legal name in Signed-off-by (Borislav).
> 
>   drivers/edac/altera_edac.c | 106 +++++++++++++++++++------------------
>   drivers/edac/altera_edac.h |   1 +
>   2 files changed, 55 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 4edd2088c2db6..c728cd474abdf 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1507,6 +1507,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
>   	int edac_idx, rc;
>   	struct device_node *np;
>   	const struct edac_device_prv_data *prv = &a10_sdmmceccb_data;
> +	bool is_s10 = device->edac->is_s10;
>   
>   	rc = altr_check_ecc_deps(device);
>   	if (rc)
> @@ -1548,15 +1549,14 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
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
> +	if (is_s10)
> +		altdev->sb_irq = irq_of_parse_and_map(np, 1);
> +	else
> +		altdev->sb_irq = irq_of_parse_and_map(np, 2);
> +
>   	if (!altdev->sb_irq) {
>   		edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB SBIRQ alloc\n");
>   		rc = -ENODEV;
> @@ -1570,29 +1570,28 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
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
> +	if (is_s10) {
> +		/* Use IRQ to determine SError origin instead of assigning IRQ */
> +		rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
> +		if (rc) {
> +			edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB DBIRQ alloc\n");
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
> +				      prv->ecc_irq_handler, IRQF_TRIGGER_HIGH,
> +				      ecc_name, altdev);
> +		if (rc) {
> +			edac_printk(KERN_ERR, EDAC_DEVICE, "PortB DBERR IRQ error\n");
> +			goto err_release_group_1;
> +		}
>   	}
> -#endif
>   
>   	rc = edac_device_add_device(dci);
>   	if (rc) {
> @@ -1974,29 +1973,29 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
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
> +	if (edac->is_s10) {
> +		/* Use IRQ to determine SError origin instead of assigning IRQ */
> +		rc = of_property_read_u32_index(np, "interrupts", 0, &altdev->db_irq);
> +		if (rc) {
> +			edac_printk(KERN_ERR, EDAC_DEVICE,
> +				    "Unable to parse DB IRQ index\n");
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
> +				      IRQF_TRIGGER_HIGH,
> +				      ecc_name, altdev);
> +		if (rc) {
> +			edac_printk(KERN_ERR, EDAC_DEVICE, "No DBERR IRQ resource\n");
> +			goto err_release_group1;
> +		}
>   	}
> -#endif
>   
>   	rc = edac_device_add_device(dci);
>   	if (rc) {
> @@ -2122,6 +2121,9 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, edac);
>   	INIT_LIST_HEAD(&edac->a10_ecc_devices);
>   
> +	edac->is_s10 = of_device_is_compatible(pdev->dev.of_node,
> +					       "altr,socfpga-s10-ecc-manager");
> +


I tested this version on both 32-bit and 64-bit platforms and there were 
no regression. But I'd like to see if we can avoid using 
of_device_is_compatible in runtime code and see if we can just bind to 
the "altr,socfpga-s10-ecc-manager" if possible?

Thanks,
Dinh

