Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B634DB46;
	Fri, 27 Mar 2026 21:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646519; cv=none; b=bdFWujITH5j5q5ghRASsEjWqcYvEZ/Ct0ZA6iUFP3L5Ehd1Q4R62XsI5ZUO0LonAKJoUtcTdC0/TKiAWi7381A8WD1jR2VL39Quylh932Ks+d5WUUOt7ypJsiLybSYOzdWtjs0qOX2iNnNbPpmWfBK7+UMzOROXu1SfeJfspWSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646519; c=relaxed/simple;
	bh=WtcUyDKyGZfz2gY+54no4aqP70qxya/957pAW5/BjXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VX338FROglf2VDbl6Yt+WiHm7Adf2RHYAvZm6BXMCF2RT7mXpaX94LyaLf8e0RSpj5o3lx6H7CGeDZt2rKBSnxQauKbH5m8tXj63fpHYqqYmbWQtg29uB9M1Vi8BfnUyegc4qpqJs5yNLQYZAD0n2R92teejkfCjMPhE+wGa+eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RQa+Vd6H; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RQa+Vd6H"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2848C40E0163;
	Fri, 27 Mar 2026 21:21:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 39-WFBRXaPAz; Fri, 27 Mar 2026 21:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774646510; bh=S1sOJbYJJsj0EUbJLIb7ytfuEq+oKhzovnbeX7rC0R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQa+Vd6HQl5vVmGFnHHRORyQQ2YXPL1uwiXP4eos/YP/KmuQsiJBK73134MDGRXnq
	 XTJY5Xe1mhdqrEyJ6g+wE9X35n/+A05v2BP6wf+NEaCeun/4FU1FlDTXGP4XBUbTzl
	 fvb7utUipuPSaR6mv+WLb1uMTn/cOHPHM5x/lrp94DJe9F8+OTn2Qh+IeYXwrBH3Of
	 CW1u0w7J1cYWrvJlXt9RJ9X7MQqM9t2AztaAsGuWggeyF/CRgzQkodoxWXJW7i7cTw
	 7/LIKCuE4xFbN7OR/1lDrDvryC+/tEWgo0aZUuFULp3T8D6PJoLhiN6+KMZsFzs/LM
	 4j3KmOa0XNdW6MIrMpewEwUfTouH7xMif5voUg6cWUz0+ccidnPBBbtl77X5sWZlUj
	 EnefpZl1abAAX5MhCS95Ac9ZWjl6GUJ60l31l0IDwzXCWsK+GFbrA4zQv73cY/HzX3
	 SxahksoA0Z7g7gTZTKa96QTji8DOq2xFH7L7mkfs3soJrnXvMw9SF9sJC0yNAAcbaa
	 4QzQ7pLWfD//cVu/qSTEgcdDETDSJ6N2hMsXC2HNb36nPnHrCtW6mT8CgmEHYKNW5y
	 7e8VtYbDTpvNbAE7oi9zmJltHrtOb6yNNZei4O0lSvibGX3f/rw/fmUYTlqe0p/4K6
	 +3qa6B1snGyP9VV7cDLrDRQc=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id B87C040E015C;
	Fri, 27 Mar 2026 21:21:41 +0000 (UTC)
Date: Fri, 27 Mar 2026 22:21:29 +0100
From: Borislav Petkov <bp@alien8.de>
To: Marilene Andrade Garcia <marilene.agarcia@gmail.com>
Cc: Jason Baron <jbaron@akamai.com>, Tony Luck <tony.luck@intel.com>,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com,
	m-chawdhry@ti.com
Subject: Re: [PATCH] EDAC/ie31200: Make rpl_s_cfg static
Message-ID: <20260327212129.GCacb02RSM9xkOzOzD@fat_crate.local>
References: <f353c3aff47abd88bafc46a1c0c5eb9917e11b28.1774619301.git.marilene.agarcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f353c3aff47abd88bafc46a1c0c5eb9917e11b28.1774619301.git.marilene.agarcia@gmail.com>

On Fri, Mar 27, 2026 at 11:55:57AM -0300, Marilene Andrade Garcia wrote:
> Sparse reports:
> drivers/edac/ie31200_edac.c:709:19: warning: symbol 'rpl_s_cfg' was not
> declared. Should it be static?
> 
> rpl_s_cfg is only used within this file, so mark it static to fix the
> warning
> 
> Signed-off-by: Marilene Andrade Garcia <marilene.agarcia@gmail.com>
> ---
> 
> Hello maintainers,
> 
> After running Sparse in the linux-next branch, I noticed the above warning.
> I would was wondering if you agree with this proposed fix.
> 
> Thank you for your time.
> 
> Best regards,
> Marilene Andrade Garcia
> 
>  drivers/edac/ie31200_edac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c
> index eaab6af143e1..a5dc4b88097f 100644
> --- a/drivers/edac/ie31200_edac.c
> +++ b/drivers/edac/ie31200_edac.c
> @@ -706,7 +706,7 @@ static struct res_config skl_cfg = {
>  	.reg_mad_dimm_width_mask[1]	= GENMASK(25, 24),
>  };
>  
> -struct res_config rpl_s_cfg = {
> +static struct res_config rpl_s_cfg = {
>  	.mtype				= MEM_DDR5,
>  	.cmci				= true,
>  	.imc_num			= 2,
> 
> base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
> -- 

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
