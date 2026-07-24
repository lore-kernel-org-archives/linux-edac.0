Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71D3145B3F;
	Fri, 24 Jul 2026 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784885992; cv=none; b=eL7t65SYDWl8e5LX7rTe7XtB/G8XhGu/l7BP7KLFk4jILAEWkLPzfA3jf3S3gxIP+vYF2xQM7rwS7WV/5NhyovNtH5M7KV2icoWFu9gCDUi+KDC4dqGk6h4dnlilflXJBzMhiGtX43WuwKVMpJp0wVjUgP3+6w7qN8h5PAZ/sGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784885992; c=relaxed/simple;
	bh=is8w3pEslPLy3wk+Y/KqUEPeEU5d724hDIpeh12cVI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hhwn0GEvSaIU7Ld8BWI0yTmQyX1KlJ0uKR4wR1j/2+rwGqRmh71lgaySfZOUucLSeezUqf3pM5XCoqaLpkA9ZrnLy9NBO3YrmEMdWKM5+My+7eAjROWKIxJefrNFION41xcfX659PJjGfDQkGrDwouEUASky4vH3YKhvVyOnd1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDHHEAs3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDHHEAs3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5446A1F000E9;
	Fri, 24 Jul 2026 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784885991;
	bh=3ZPbA8fD95rbCem5z8eB0Feqwxf+mFN1C7eFhv20hbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JDHHEAs3kZ7lJ0iQdAbBGKh9nqY3bRaTo7ryNZpVwZyzK7UzLNVMEfLjAUspxoqFR
	 f3UX9JB8FazQQAvbaRI4PeGwBoZyhiUmjNeDaCop6MqINq/7wpuPzA/8nW3OyKFosu
	 AaIcuT8BXmxjhppCmgKRTfd4NSdZ8ds119fwGUwTGSnzWsp+HSGXZv0SO748rqGrOc
	 tn8NI9T/2Eu7hki0Im+GkBWmb39KcqA5sEMVj5Nb+8DtKx8gaPljWA84UGjAX7zXew
	 Ts9BQtEmX3U9K8D3lFvuK7K2h4P5N1J3lzgyZueP71ItSRU2hS3PdogvAfLNWgH32M
	 NPMZ21vEX+hMQ==
Date: Fri, 24 Jul 2026 11:39:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com, 
	niravkumar.l.rabara@altera.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: edac: altera: agilex5: document new
 edac support
Message-ID: <20260724-sensible-flamingo-of-experiment-5a389f@quoll>
References: <20260720201425.1538771-1-dinguyen@kernel.org>
 <20260720201425.1538771-2-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720201425.1538771-2-dinguyen@kernel.org>

On Mon, Jul 20, 2026 at 03:14:22PM -0500, Dinh Nguyen wrote:
> The Agilex5 EDAC module supports ECC on a few additional peripherals. Along
> with support for ocram, ethernet and USB, the Agilex5 EDAC adds support for
> SDM QSPI, CRAM SEU and IO96B.
> 
> The Agilex5 EDAC also exposes up to 7 named interrupts on the manager
> node. global_sbe and global_dbe are aggregate single/double-bit error
> interrupts that fan-out through the manager's IRQ domain to the child
> peripheral ECCs. The remaining named interrupts are routed directly from
> dedicated controllers (IO96B memory controllers and Secure Device Manager)
> to the GIC.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  .../edac/altr,socfpga-ecc-manager.yaml        | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
> index 136e8fccd429a..2ccb0f2163185 100644
> --- a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
> +++ b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
> @@ -22,6 +22,9 @@ properties:
>        - items:
>            - const: altr,socfpga-s10-ecc-manager
>            - const: altr,socfpga-a10-ecc-manager
> +      - items:
> +          - const: altr,socfpga-agilex5-ecc-manager

Same fallback, so this should be part of previous entry with enum.



> +          - const: altr,socfpga-a10-ecc-manager
>        - const: altr,socfpga-a10-ecc-manager
>        - const: altr,socfpga-ecc-manager
>  
> @@ -33,7 +36,25 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 2
> +    items:
> +      - description: Global single-bit error
> +      - description: Global double-bit error
> +      - description: IO96B0 DRAM controller error
> +      - description: IO96B1 DRAM controller error
> +      - description: SDM QSPI single-bit error
> +      - description: SDM QSPI double-bit error
> +      - description: SDM single-event
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: global_sbe
> +      - const: global_dbe
> +      - const: io96b0
> +      - const: io96b1
> +      - const: sdm_qspi_sbe
> +      - const: sdm_qspi_dbe
> +      - const: sdm_seu

Why now all existing devices get these new interrupts? And why 3 and 4
interrupts are valid for Agilex7? This is just unconstrained. Please
follow writing bindings doc.

Best regards,
Krzysztof

