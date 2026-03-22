Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6DF13B7A3;
	Sun, 22 Mar 2026 19:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774206962; cv=none; b=EXw9/rFgWYOv68oBe54J5wEedUw8MLScOv+OVy1jgKiEYAO4M+PHIFGwgf7TZnessrUjBiuuluXE5IOTj/qd1sbvzbBpBJmwJk3+PIqvu6lHgK0bbUkEXw5N34q2O6JyRA1bRJT0mUyv+Mf8yMoejrFRM23sqqEosGc5TrVpJ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774206962; c=relaxed/simple;
	bh=zNPLqiXxhVKdNAUaMWTGGgtQBj2CU19ItjbK2o3KWGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDYFPEivPl6rfYzjQxZiqSxvqTag5zt88FRbxTBIknKUAStoN/weeE+YQ093H+jGSQVlOd2cM2wtZXvSypccEJoJ401o2vhcFU9SvRjvIezElXEW2k8GRNO6Vk3ZERM79tVcztn00iifH7iP6rR3FGsYOaZPkbRPOVoYzgJsL6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cNptiEzJ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cNptiEzJ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id ACFED40E0163;
	Sun, 22 Mar 2026 19:15:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lKGcwnqbCalT; Sun, 22 Mar 2026 19:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774206954; bh=a1z4AYb28keHnvNJY04uO0aUOdav31v/0VGhVxqqSNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNptiEzJaN7Tmc9Jfzav4QIM3/Yg+Yce8S5Y59ExyzCxCrfIZjlN8Mzaw0t0GHVfx
	 btaLS4MlsxALbdOlimO2a4f4+DoJVUyltU6NUMxl01gxfdtFkaTD9A3qeuHAXt0O5u
	 rAew48w+XJ5eu2y6GlhYF9JVNGW5o8r8gbqMMUO+1q+a8+ocD96mX5dnR7wxy2N4Wq
	 t50CFxpCpInVhB1lojJHSkdIRU/vWLukHxT83dVJ5XxYFazB0lY9RTXnfU5EIL/mZq
	 Q8eVTTYbFPRmy2u6T88KuiN0seBYgIZCSo0k7VjFWTHhnZD13E9vZqsDglHhbrP2rk
	 mJFoHFc1KS5eMUIx352UiD6Z44Ovku/YRIUtACZkmtsLFAKYiwiu0nSoXJUuA24AG6
	 On68buQOuDaArlT3zcFmVIgTZl09Vsfu31n4xIagLyrRXBprftziIxCG5eCL0oQD/g
	 8aIg+F7BXW8mkF3wMkKmCe+9Ey467MsnAgQq/zahqr2P2F/FDOIlRkrJf70huXPk2G
	 V0zuyalv27Mj76OFCt5T/vV9Z0HIJUBzqZq0H6kCXW2gktu7uS2Ye99JwaDhGfP/Bf
	 +0VDnRnOBgao3capPGsczGuCl3FcqS3c6LLAXkUbevZcnwRvZTqArCJmNATfF1vji2
	 ceg+aBiXBqQNNYUyJSyuXyWk=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 33BBE40E0140;
	Sun, 22 Mar 2026 19:15:48 +0000 (UTC)
Date: Sun, 22 Mar 2026 20:15:41 +0100
From: Borislav Petkov <bp@alien8.de>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: shubhrajyoti.datta@amd.com, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/5] EDAC/versalnet: Fix memory leak in remove and probe
 error paths
Message-ID: <20260322191541.GBacA_3QA1ZL4Yw-3m@fat_crate.local>
References: <20260322131107.1684647-1-ptsm@linux.microsoft.com>
 <20260322131139.1684716-1-ptsm@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260322131139.1684716-1-ptsm@linux.microsoft.com>

On Sun, Mar 22, 2026 at 06:11:39AM -0700, Prasanna Kumar T S M wrote:
> The mcdi object allocated using kzalloc() in the setup_mcdi() is not
> freed in the remove path or in probe's error handling path leading to
> memory leak. Fix the memory leak by freeing the allocated memory.
> 
> Fixes: d5fe2fec6c40d ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  drivers/edac/versalnet_edac.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 28f5036f381c..acd51b492772 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -937,6 +937,7 @@ static int mc_probe(struct platform_device *pdev)
>  
>  err_init:
>  	cdx_mcdi_finish(priv->mcdi);
> +	kfree(priv->mcdi);
>  
>  err_unreg:
>  	unregister_rpmsg_driver(&amd_rpmsg_driver);
> @@ -959,6 +960,7 @@ static void mc_remove(struct platform_device *pdev)
>  	unregister_rpmsg_driver(&amd_rpmsg_driver);
>  	rproc_shutdown(priv->mcdi->r5_rproc);
>  	rproc_put(priv->mcdi->r5_rproc);
> +	kfree(priv->mcdi);
>  }
>  
>  static const struct of_device_id amd_edac_match[] = {
> -- 

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
