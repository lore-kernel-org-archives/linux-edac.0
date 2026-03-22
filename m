Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581F51DA628;
	Sun, 22 Mar 2026 16:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774197058; cv=none; b=ftdOpyJCc+OxxU61BnvhMeGYP+rXKzUpsz4RvpYVkj2ttvRqz762a2AuVkhnWiQX4PsgLrV5OFqzdfJUQBAV1PwXDAPdc3bt5YUF+kxa0oXteuG0RjpNEdXcpJQSq0g5M4W1TlWIt5lSOYy9QHz87hE4U6V305gCzCjhcpPl6m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774197058; c=relaxed/simple;
	bh=cABGpcmguk7TSNjHaxnvK99vdqWj5fY+V2a66mN2l3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Unvh5w4UdhFGxqlmE2e9/hkoZnZrjrlBVci74FcNbLPLBr04MK+gkEqI4w0ZHQxmqbBoyB1qht5KWPgTGsV3r7/2J4uEu48DjINibgk1lNdpDkLzAbvi2B1hEQdgC8e4o/MLg9tI6GfVgWg9dUYEUdqTM1kyi6IdEEr7cyeQqSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KdNoLJMk; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KdNoLJMk"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6971340E0163;
	Sun, 22 Mar 2026 16:30:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1v8WFtHxqre7; Sun, 22 Mar 2026 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774197052; bh=zPmNN6qQrOOjaVBq44+QWwWlQVoiwztqhMf7QcOCA8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdNoLJMk9jxwXqXcA5GnSqZ23NSMcQ/B9VWyYQ71AXyU/yMWydFOUnIijoJeqXnRC
	 zJWsXvu4/kCvQG50oWluWBKD4oFwdY8WqqC27m4AGYTiADAnWMDf7tEjnNuZTDwnTe
	 MarLcbjfKt/95d+T/KR0pVw8j60opHJcbGqb8pDd1xlX7v/K+huv4ggM+ongz1fftz
	 KWP7ZoA7MQD1N1Gky2AFQi1Sqy/1ZAabs451/iIs8I0bX0COPV9ZCq9DBX+k+52dyx
	 aWlQ6ueLbf6QnUbb7H2CdJAS0xVn352jwqi8+jbC+opn/zhrSyl4VmqWWWTaZ9XjZ2
	 WNVy13l8dWbAoV9jaZGk54Ry9ERPIjHIw7H5U3+niREV2uld/EaEYEudTeGZvfJ5tM
	 Ii4/0IVecyuYx32CBQoLgTrP5Vo8QIs+MhXxQngkEUF5PqL46B9FaIEdOYwAYAldSN
	 10E3PH5AFv3zQNKEAwtfNyGIUS8Vrm2Vm5Ld6qgB/dveq/KcedpQRlMtGzi9v1Zfjt
	 TB6f/9nSPkoocXpuHcuftnX8XMxacbcg9BZs8kJTLrMuFNSIhg02ioEF5gr8QL3VMl
	 tQ/M2wEhiFixwSFXAPeF95mwfSe9i/EdJifrQVOQpV/iJf9QqlFRavDttHaUidoY4D
	 R+caQs5PRSlk3dCOj0ngoYvY=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 3272A40E0031;
	Sun, 22 Mar 2026 16:30:47 +0000 (UTC)
Date: Sun, 22 Mar 2026 17:30:40 +0100
From: Borislav Petkov <bp@alien8.de>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] edac: versalnet: Fix device_node leak in mc_probe()
Message-ID: <20260322163040.GCacAZMAcIw81kqrNQ@fat_crate.local>
References: <20260323-versalnet-v1-1-4ab3012635ef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-versalnet-v1-1-4ab3012635ef@gmail.com>

On Mon, Mar 23, 2026 at 12:04:08AM +0800, Felix Gu wrote:
> of_parse_phandle() returns a device_node reference that must be released
> with of_node_put(). The original code never freed r5_core_node on any
> exit path, causing a memory leak.
> 
> Fix this by using the automatic cleanup attribute __free(device_node)
> which ensures of_node_put() is called when the variable goes out of
> scope.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/edac/versalnet_edac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 0b47ed7fed63..915bcd6166f7 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -888,12 +888,12 @@ static void remove_versalnet(struct mc_priv *priv)
>  
>  static int mc_probe(struct platform_device *pdev)
>  {
> -	struct device_node *r5_core_node;
>  	struct mc_priv *priv;
>  	struct rproc *rp;
>  	int rc;
>  
> -	r5_core_node = of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
> +	struct device_node *r5_core_node __free(device_node) =
> +		of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
>  	if (!r5_core_node) {
>  		dev_err(&pdev->dev, "amd,rproc: invalid phandle\n");
>  		return -EINVAL;
> 
> ---

Looks correct to me.

@Shubhrajyoti, can you pls test it?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
