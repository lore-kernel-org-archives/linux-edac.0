Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C4841DE12;
	Fri, 24 Jul 2026 09:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886077; cv=none; b=hyZ2us2x4EhoCv0FuTSBH3Q/KogA6E9zNBCW0cV0Znl71EJ0twHDbqrrvYQGyu9q7l15JvN4l+75ckoCazRV6tmWbRbET8WX72eXJ6+NMmwlF65ck5EtRBU/KF692tfCctxBx9VZvCLS/3n7B1j/whx15V2KdBn0IixHF85H2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886077; c=relaxed/simple;
	bh=087fwSVPHA/UzNGjeob4LDm69kccmmnlSEkJ9YKv9iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Njg94y48ltbF3PIL4YVJLAaSxpuPRhNmY89NcxOxvFuVieW+9lk8Xk3yG5cT2E1YnF6fih+VVWz7wHWuJf8pe0B2n56bUHK122PXPvxdxnOUpwpNi1aVRxmnUsKck5Mx0ecXTNyDslakA2FoVJezX51YwAbdVaXZ53jNAHKu72k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Se4mdKs2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Se4mdKs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACB71F000E9;
	Fri, 24 Jul 2026 09:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886074;
	bh=b8AQbCuk8gCdpkngulPPIAgrua91JxJ3xjFZcYWRdYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Se4mdKs2rJl5W0oZX+nbXCu0ZzB7+FLCnvTLODQhBhdc6t/CcuWYRDx1TbpJjH3Ah
	 xFk1XN6I/aKWedkPDTgH26z5zIM3yrAFkj7iTc3x7RVGciFcuxPzEDTNbvPSC2docZ
	 mtexJt4XCk8QOwTccASyC6M1HLKywo9nbwNI1nRrDInzyPpRrql2Etid5/zUUi1Ac+
	 lm6rA/hQAGcUeZ+ZZ/uEiob14A5u4Cw0n603kQvhZ4kQLpMT5UlVBCVKagXc7W7Xge
	 lviPo29f8dLfr47FndM1apUfx95ew95QVBAASJIn8Jy+emfl1MjjzLtVzDkdjrWKUc
	 IQVAdHs5Fq+LQ==
Date: Fri, 24 Jul 2026 11:41:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com, 
	niravkumar.l.rabara@altera.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] EDAC/altera: use flag to differentiate 64-bit
 platforms
Message-ID: <20260724-spotted-resilient-badger-495b71@quoll>
References: <20260720201425.1538771-1-dinguyen@kernel.org>
 <20260720201425.1538771-3-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720201425.1538771-3-dinguyen@kernel.org>

On Mon, Jul 20, 2026 at 03:14:23PM -0500, Dinh Nguyen wrote:
>  MODULE_DEVICE_TABLE(of, altr_edac_a10_of_match);
> diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
> index 9387056fd65e3..74ab7bfc3e748 100644
> --- a/drivers/edac/altera_edac.h
> +++ b/drivers/edac/altera_edac.h
> @@ -351,6 +351,9 @@ struct altr_sdram_mc_data {
>  #define ECC_READ_EOVR                     0x2
>  #define ECC_READ_EDOVR                    0x3
>  
> +#define SOCFPGA_S10                       0x1
> +#define SOCFPGA_AGILEX5                   0x2

You want an enum, not defines.

Best regards,
Krzysztof

