Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ADF25D530;
	Fri, 24 Jul 2026 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886198; cv=none; b=dPZP9xGzizkmPp8+f8dPrQ97Oyk5n6HJBpBvcKO6JCSfWE6EZNrftmQhx/UM6ndNpl+A2i3FgvmAX0XkoxYMv+6lgufrB2ycuwMiNxQJ/YzIz99UPIceNKudVMVTUlqWz95kVt/CPwFo9/YngK2KfOFEimil4oxH8NsehQeZ8A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886198; c=relaxed/simple;
	bh=ybXiLZIJVh5bcYoViP+wmFn2sdBBOf2x7eSNWclYvcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZBuYauev81j61ythkbyUpI8sNE5Uzalx+PkRIVIe4iOn2nknpVK3WouFAlDZJTEcvE3i0dcO7vQuHizJLZST4GGctHegBcSLTdojErnhWEMUPLONwsDRM1f72pClj1Mc/O/5F4IcXXAXOXed05+HpGiknLLxjaGg1C8sQrCFps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgxkuNbd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgxkuNbd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5EB1F000E9;
	Fri, 24 Jul 2026 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886194;
	bh=EjabcPayLsbkovphaQIu7ajCph2QP8hlPLl8z4cnPlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KgxkuNbd9+bvGgL2DF8JJNjWAKjtwYyJIUN6DhgfdzpDSMvNkCqCEESb71zcABIgD
	 bbcOHiLPKMtP6+KL70MHguLA0ofrfB682KZt3au5MGWCwjxh13YIyxAQq5W34WbfBL
	 8l5k/4BqFijWjh0BTL1kALl4Zkvd62SUhAbg9HW4yw3YxlluoArS/DqcLg3DAUU+IU
	 THENRu8Fq+9sYOUUP7+nCDVVr7C4PAbmxbVIHyCcKLrxXvtbOGoLyePYE8A81mTusY
	 g+hxIoNiinu6ituNTlKZdMhrVv9EdRUm6IrMaAf1X0dHVZXwYO7pMV4upYtZuGfsTd
	 n95OADS86mG5Q==
Date: Fri, 24 Jul 2026 11:43:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com, 
	niravkumar.l.rabara@altera.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: socfpga: agilex5: add support for the
 ECC manager
Message-ID: <20260724-fragrant-baboon-of-temperance-c5cdc0@quoll>
References: <20260720201425.1538771-1-dinguyen@kernel.org>
 <20260720201425.1538771-5-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720201425.1538771-5-dinguyen@kernel.org>

On Mon, Jul 20, 2026 at 03:14:25PM -0500, Dinh Nguyen wrote:
> Add the EDAC device to the base Agilex5 platform. Add OCRAM and Ethernet ECC
> device support to the Agilex5 platform.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index b06c6d5d60eed..f30d476683b4a 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -370,6 +370,74 @@ dmac1: dma-controller@10000 {
>  			};
>  		};
>  
> +		eccmgr {

Nope, this is just mis-represented. Non MMIO nodes DO NOT go to soc.

> +			compatible = "altr,socfpga-agilex5-ecc-manager",
> +				     "altr,socfpga-a10-ecc-manager";
> +			altr,sysmgr-syscon = <&sysmgr>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 95 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global_sbe", "global_dbe", "io96b0" , "io96b1",
> +					  "sdm_qspi_sbe", "sdm_qspi_dbe", "sdm_seu";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			ranges;
> +
> +			ocram-ecc@108cc000 {

But this is MMIO node? This is just mess and wrong. If ecc mgr DOES NOT
have addressable range, then neither its children have.

Also for all nodes here:
Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Best regards,
Krzysztof

