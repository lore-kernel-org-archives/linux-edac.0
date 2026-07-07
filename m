Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C0919AD90;
	Tue,  7 Jul 2026 00:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783384677; cv=none; b=anFxnO1KQH9FX3pjbJd05klJ7ioUNTIWYH+GWmgbbvm9Zz3ZsDnTw9zNsY/4jKid+pV7ZS8tC8OYAiKEGlyjtXxdTyBjEqk6UJU2zMLG3imm1BLswm+2MzDbrD359TBdF8LTU+MZkjyzPzKqQJ+YDbkBJOel24Al1M5taCxTzb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783384677; c=relaxed/simple;
	bh=9mlYhBP/d+8rErj3TC4cxJLgQaB3gi1BlbsQEFvKXkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNxVfKmdFNXViVLRtlnwxlPyeumazqdamYjNaDpXm/zHH0gTC0RBEeHhNSliOJ9jF0Uw3RR6UBiKwgOPeyrMBb/T4N0iKgW4BShaTManHy0SK4hKx/JoEDpkTglEUntsPFvN8J6LD4Jl3JVB9cHBcpgyLyYCv8BUEXmK7PTWsuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JJvgj19e; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JJvgj19e"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B79B040E016E;
	Tue,  7 Jul 2026 00:37:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1gb0_FgS4EXR; Tue,  7 Jul 2026 00:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783384663; bh=Eh7AWMG7RSooqqy9wKw7nK7jF4m3XQONhex1XKtAjxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJvgj19e8OETx+EZGX2Aqs8JL9LBuGVV7scmZ4Dub/Lc2AFiVB6+BwsuT4bSWv1Ax
	 OTp+IkP3++LcL/ySl3pLX+fCO3hZyeD3dz5U01MFnmZLcsr40/iVAtePhYpB8aFTG1
	 Y29hElkQdgaW6dt0FyNSSojyC/0uRvdczCSjxsE9kJph1XC8ZKR35/hnsWTlKsyrUs
	 fOU87zIvsJg4NJgpDYLT54+my3AhGPTwiEBDTgti10VJ3cBssycE/bnAoXT22c8A9a
	 hgx7tT9We8lGDZD4jXPnr8aFpCHxBax7fg3z1TmXLZSJqlG1o9Qz1tJRKjR6Vo9N56
	 O4Qc4SFHML6J7rhXOeawLoOK15cvMpLFRcYEqlbUvOS5ymJPCmogEq4m5dnfr5VRXP
	 8hZ7po6b8OXgCa4U7H9cTQulCMyWNAjeRVVuNfYJXfBRH4sqIkXOQO0jK2tFvzzT+4
	 Kdckz+1kpaeIelpQLbANWconETrtR74VWrcBEQgyzvWI0cdPqnvp1Ufbj/gczKYxIk
	 R4cTmR5zPsQvFYEGZyCx/nf0wA5x71818H/ynKuRiIR7tMkM/6AIHCZIqQI4RcQigL
	 5ek8fvpY4uo0bZOQBhi9XT0uVYJGJX9pT7pu8H4REPbc/S2XoD0iRMTflsfFyi0ibe
	 Ut7edf/lq7F4VuW5RDbHXThc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7ED9F40E00DC;
	Tue,  7 Jul 2026 00:37:38 +0000 (UTC)
Date: Mon, 6 Jul 2026 17:37:35 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v7 3/3] EDAC/amd64: Include DRAM address in output
Message-ID: <20260707003735.GBakxKT4r7efMzoszz@fat_crate.local>
References: <20260630210640.680758-1-yazen.ghannam@amd.com>
 <20260630210640.680758-4-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630210640.680758-4-yazen.ghannam@amd.com>

On Tue, Jun 30, 2026 at 05:06:40PM -0400, Yazen Ghannam wrote:
> From: Avadhut Naik <avadhut.naik@amd.com>
> 
> The DRAM address of an error is used by tooling to find failure
> patterns. This information can be used for general analysis off system.
> And it can be used on system to take action like offline a page affected
> by a bad row.
> 
> Other EDAC modules (GHES and SKX) provide this information in their
> output. The AMD64 EDAC module was not able to provide this information,
> because system-specific translation is needed.
> 
> Recent AMD systems provide a PRM handler for DRAM address translation.
> 
> Use this PRM handler to get the DRAM address of an error. Include this
> in the EDAC "other_detail" field.
> 
> Also include the Socket and IPID in the EDAC "other_detail" field. These
> are needed by tooling to translate a DRAM address to a System Physical
> Address.

    "Use the DRAM address translated by the PRM handler on AMD systems when
    reporting an error and add it to the error information that is being
    logged by EDAC. Also include the Socket and IPID which tooling needs to
    translate the DRAM address into a SPA (System Physical Address)."

Plain and simple.

> 
> [Yazen: Reformat other_detail string]
> 
> Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
> Co-developed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>  drivers/edac/amd64_edac.c | 32 +++++++++++++++++++++++++++++++-
>  drivers/edac/amd64_edac.h |  3 +++
>  2 files changed, 34 insertions(+), 1 deletion(-)

...

> @@ -2853,6 +2880,9 @@ static void decode_umc_error(int node_id, struct mce *m)
>  		goto log_error;
>  	}
>  
> +	if (!amd_convert_umc_addr_to_dram_addr(&a_err, &dram_addr))
> +		err.dram_addr = &dram_addr;

I really hate the fact that we have to call PRM twice per error. Is there
a PRM that can give us both addresses in one go?

>  	error_address_to_page_and_offset(sys_addr, &err);
>  
>  log_error:
> diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
> index 1757c1b99fc8..39c1b6471909 100644
> --- a/drivers/edac/amd64_edac.h
> +++ b/drivers/edac/amd64_edac.h
> @@ -400,6 +400,9 @@ struct err_info {
>  	u16 syndrome;
>  	u32 page;
>  	u32 offset;
> +	struct atl_dram_addr *dram_addr;

If you embed it into the enclosing struct:

	struct atl_dram_addr dram_addr;

you'll save yourself a bunch of lines in this patch of noodling through the
error struct.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
