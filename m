Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3828635D;
	Thu, 25 Jun 2026 06:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782369463; cv=none; b=aLOnJ5ShN81o+w8z1xHIe5YppGRoH8hCw/EFRy7sFNsSdEovDhMXLa+kRgf90wsuZPOEMjUL0y2xPtq4FD2Ue/lI31yCjLba7bpiFHUVIeIyQ75545OfWEO/iwXiwZEz6YwPZV/pKho4sOtthsVMqRJ00EaBPn1EM8ARcYAP/eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782369463; c=relaxed/simple;
	bh=Q69aQUjurf95msSh/gz0eljQ8ctq/oBU1pEkhI3c3vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVihN88o10fIDbbU9veA2jySRagAhpLVy7o6Yc4ceTzsXox0RRysDdwPMMmOeZxZvPsOldfruqqAzxDpnRNZ2tbBgwIHvO4sI4T/lWOsQvoV29AailK6vw+jRxlDHRK++ms+iNYeIwnhu0OL4EOUEh5ho7u45yugMPgAH1LU1Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9bUiMlr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9bUiMlr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27CA1F000E9;
	Thu, 25 Jun 2026 06:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782369462;
	bh=wAjdu/Ir+YJ54zNPtu+Y+10EBEHcNBV/CHgGXi+bqWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H9bUiMlruoLg1afA9DqMwng1n9Dm5VKPenYV4cKPRscWQaoi4tcjcgscYaYtSQA5f
	 lfLEbKazDrdkfHcESThEPKcHUVHy2HQWfa+1jycYpZBslv0OyrbTgtNvh5Y0edLtqs
	 cwapOG4Vuk0ywGGBSYSErjDOD7xUDXAgtHit8PyqSRnJyIOyQL3aOr91I9l8FNAGj9
	 RMpRByNkImZQR7calv0Zz+ySvUGI9/Z52vJUPFO9NdzLZy5TIt+sHJp1VTxSD4gOyq
	 4M1iRsibRis/EwxPYSJQx+KbvmgPiLhJ30Zza1+0gwtesg5kx8Ujvy8izxJQ94HxGy
	 KKTnL40ITrYkQ==
Date: Thu, 25 Jun 2026 08:37:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rama devi Veggalam <rama.devi.veggalam@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, michal.simek@amd.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	james.morse@arm.com, mchehab@kernel.org, rric@kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/4] dt-bindings: edac: Add bindings for Xilinx Versal
 XilSEM
Message-ID: <20260625-nippy-leech-of-reading-92e2ba@quoll>
References: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
 <20260624212545.2850787-2-rama.devi.veggalam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624212545.2850787-2-rama.devi.veggalam@amd.com>

On Thu, Jun 25, 2026 at 02:55:42AM +0530, Rama devi Veggalam wrote:
> Update versal edac device tree bindings for

Everything is update. Pretty useless commit msg.

> Versal Soft Error Mitigation (XilSEM).

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> 
> Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
> ---
> Changes in v3:
> - Merged XilSEM edac with Versal Edac
> 
> Changes in v2:
> - Changed "xlnx,versal-xilsem-edac" to constant
> - Removed "compatible: in required section
> - Removed "|" in description
> - Removed "items" in compatible
> - Fixed indentation in examples
> - Updated title and description
> ---
>  .../xlnx,versal-ddrmc-edac.yaml               | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
> index 12f8e9f350bc..568d2af7de81 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
> @@ -4,17 +4,31 @@
>  $id: http://devicetree.org/schemas/memory-controllers/xlnx,versal-ddrmc-edac.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Xilinx Versal DDRMC (Integrated DDR Memory Controller)
> +title: Xilinx Versal DDRMC (Integrated DDR Memory Controller) and Soft Error Mitigation (XilSEM)
>  
>  maintainers:
>    - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>    - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> +  - Rama Devi Veggalam <rama.devi.veggalam@amd.com>
>  
>  description:
>    The integrated DDR Memory Controllers (DDRMCs) support both DDR4 and LPDDR4/
>    4X memory interfaces. Versal DDR memory controller has an optional ECC support
>    which correct single bit ECC errors and detect double bit ECC errors.
>  
> +  Xilinx Versal Soft Error Mitigation (XilSEM) is part of the
> +  Platform Loader and Manager (PLM) which runs on the
> +  Platform Management Controller (PMC). XilSEM is responsible for reporting
> +  and optionally correcting soft errors in Configuration Memory of Versal.
> +  The Configuration Memory includes Configuration RAM and
> +  Network on Chip (NoC) peripheral interconnect (NPI) Registers.
> +
> +  The memory is scanned by a hardware controller in the Versal Programmable
> +  Logic (PL). During the scan, if the controller detects any error, be it
> +  correctable or uncorrectable, it reports the error to PLM.
> +  The XilSEM on PLM performs the error validation and notifies the errors to user application.
> +
> +
>  properties:
>    compatible:
>      const: xlnx,versal-ddrmc
> @@ -23,11 +37,13 @@ properties:
>      items:
>        - description: DDR Memory Controller registers
>        - description: NOC registers corresponding to DDR Memory Controller
> +      - description: SEM RTCA Controller registers
>  
>    reg-names:
>      items:
>        - const: base
>        - const: noc
> +      - const: semrtca

You break ABI without any explanation.

NAK, I think I made this point many times already... Please read
writing-bindings doc.

Best regards,
Krzysztof

