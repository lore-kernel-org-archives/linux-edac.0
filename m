Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8753375C5;
	Sun,  7 Jun 2026 22:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780870845; cv=none; b=QyCddazGUUu0eLKjhbHP9wFBlFJyJ1ocQNkMYIcaK0OQmqW5fdi6vYwnGeyFOkRJlenQUJAP5ZwU+VlFdwY6bGyt9wTC+xwVy37+HdtX41JTzpWwqDPmOjIdHloNpOBJryj/ic5oukbp8bMEFSUsi4Mlvck19ztfyvkTjyu9VIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780870845; c=relaxed/simple;
	bh=KiLiZNb633aQTMQJ+aKgu2qF3XvHj4+MBszj9EdHKrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2AtTdqkZPtzHvl/ym74YEDrY0TxhDrPJSfmfNhXVrsTSL8kMbAkbKnihHP4iLNT7A7VTM9mwHnLbT238Uto14YIbTf9+P8uft3qt2UCl8AEIeD3akenW0q/EstHVVX1eJyQcUV2mLhBqi9maUQRZgSEuO6w0nx1kif6M/rrjJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=d0MX9hNc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="d0MX9hNc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 83BFB40E0203;
	Sun,  7 Jun 2026 22:20:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KToVjFt4LcT2; Sun,  7 Jun 2026 22:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780870829; bh=PfCgMVXOileTTECOiYEUP9ha2/hzOimXyZg3pb5+0io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0MX9hNcSXjPFHFijH+VfFYYY/+KjiYgSv/FA9ifEh7RUENI4tzOOmJn8nbLLK2Pp
	 J+/bHjp8NkxcM5sI248ya42v/zInG422ahG3A9X1GmmFzw2GotnocAVpkIAVLhOH/b
	 8rogtVYnqN6bA53d+3qxlLQX4HMe7k5r6LwCRHWwJ/U9GozJiOJwX7/+/yo9awJXbH
	 /i2NVA8gAN7ckp70ptubCqfA4UgikSXaFpLRNtHIq6rX9H3U12Xppb6ZCb0fcUVaeo
	 FgCN6mrmJNvANk2pMarqJPP42PajCTAtMguxj7dXD9OIYYTf2VA2es6klIM56gOAKz
	 4RmKNtCbIbd7HMPGh/wEu4OZyrM67yn8cE+/QlD/0Wd9AZR4V9tBFRqhjvcRDOaeNX
	 IS7efkUW98sD9cjpNjrHk0qmnOFB9fRYT3rhS9zxLEx0YfnCFNJSpSUdXZeUTHR8oE
	 Y6PHBMdeVTHm4/e//iMGLmIrj2qNW9Xzs1qvOfDnGa9piywmd81jQ/SF87WT+wkPLM
	 TnGv01RTtFiTk/5gW3REYqn7S6dGRjQoTb26kejeECPEkHM6KfAxKiN6bWqUGsL9Tp
	 tjw/55nRHuT6aLkKzfyXy61zRl4MKd8GDHS1HC5STDi3344/6I4zAoky79X+PwNDxb
	 QNKfq4E2ksVH1NU3yxYDg6Y8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0460740E0031;
	Sun,  7 Jun 2026 22:20:23 +0000 (UTC)
Date: Sun, 7 Jun 2026 15:20:20 -0700
From: Borislav Petkov <bp@alien8.de>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/versalnet: release remoteproc reference in remove
Message-ID: <20260607222020.GBaiXupFdAIH8uX28K@fat_crate.local>
References: <20260603133506.1396535-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603133506.1396535-1-lgs201920130244@gmail.com>

On Wed, Jun 03, 2026 at 09:35:06PM +0800, Guangshuo Li wrote:
> mc_probe() gets a remoteproc reference with rproc_get_by_phandle() and
> stores it in priv->mcdi->r5_rproc after the remote processor has been
> booted.
> 
> The probe error paths release that reference with rproc_put(), but the
> remove path only shuts the remote processor down. This leaks the
> remoteproc device and module references on every successful probe/remove
> cycle.
> 
> Call rproc_put() in mc_remove() after rproc_shutdown().
> 
> Fixes: d5fe2fec6c40d ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/edac/versalnet_edac.c | 1 +
>  1 file changed, 1 insertion(+)

https://lore.kernel.org/r/20260401111836.2342918-1-ptsm@linux.microsoft.com

We're sorting it out currently.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
