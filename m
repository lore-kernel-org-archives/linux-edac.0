Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3498F4035AF;
	Tue, 24 Mar 2026 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364875; cv=none; b=H0cK8scTxqgK0vFZh449GYRL2iKpCXGf20rlnv00Gv0NGcC/atK+t5ftFSObajTYRERl6VWSQCkFOB5L87eGd7wspBu4COKnsyF8sm4a9KYF0X5G9j6Q0sGEdwhsE+b88dpwmIjIv+gYjeOtLW2OO8iqkG03uUBrVAu5TGkCZik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364875; c=relaxed/simple;
	bh=h+7cuxdFK7m/VWvpdiWw13Oty3Zqs6OiJnuLMLaarEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gix5BBDgMyXVKCZa1mQZL7WDWAJEmPT0tX+TQusGeY89ou/WmKg6bQzBQn+eW/4sLnnQtpajVSn55zy0UxVoyMqo0rPU/GETT6VvgCspZy7oqlyCif6VMSbRQXT/QZOgjQyuz/NZf0HV9+KvO9a26V/WYGwWYTEybbIQwdU2uLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ffnXA3yQ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ffnXA3yQ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C409040E0293;
	Tue, 24 Mar 2026 15:07:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2Bv7vPO_dE0H; Tue, 24 Mar 2026 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774364866; bh=QU3EnipwzT/kbBsg0ISPAnaPh0YphNCY8SaGpif+HVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffnXA3yQG8kG2N17gDCdzmMDoe3kFnCPgHctzudhZxU5XqVVAkVkbGnj3M4FcJbVC
	 ZP6vrGXrUlJ6CAenDxSCyFhtxhXEsuLGw38+d9Os8HjvNvPhR3Fq3RYK2UC31w7Vrb
	 jLkDYNU1tfRw6VvZYWewPnqyaZXChmzdgItZFmNZqa4ViPFeGFh9hdRMtm6Q+8/Y7I
	 W/n4yk4XwxyuH0/Am/TP7zad52ZWsYrcd5Oo5lPaWQMnnvJxMDQucrdQX0yAR0evrk
	 pU5p/1j1wFKqjHgrJPWoWZqAYuID6BpGCcpJne0RRre8hjGNqxF/UDaXFtN1/N8CCO
	 KnyVf8xRcY3oYfkuQFDrOD+dcsE5SRPloZvaqCHhZyktw+Q3dVM+2PqrO7PJE9T/kX
	 QUtyqDIA8rYehhmAJ5KhQPhrJvnJKZd8J8sW4gmF6svTo5XlsZuwVDLjJmDs3aqK52
	 YjUDQvWcPl8yqJY6fZIkcY7rzcjqLubYZIsO7auZo4RVocmu5l09D3Nf1+hekbc1m3
	 ZcrzAGf2d6zemTyDNbhtIyXaVk43XJZ6/BHUZqx6W8otIxSBeM2vwS1+k0ajrZXSu4
	 bZkGfnwQ8BaJXgbAJsISjuusRU7I9rYR3CL+wQ0AvYU/AxguXRW61LjOswc8YU2HLw
	 BchNskuXCx6q1Z/U2Pwpfunk=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 9C02E40E0194;
	Tue, 24 Mar 2026 15:07:41 +0000 (UTC)
Date: Tue, 24 Mar 2026 16:07:35 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
	Felix Gu <ustc.gu@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] edac: versalnet: Fix device_node leak in mc_probe()
Message-ID: <20260324150735.GBacKot4KRNh7a9Jov@fat_crate.local>
References: <20260323-versalnet-v1-1-4ab3012635ef@gmail.com>
 <20260322163040.GCacAZMAcIw81kqrNQ@fat_crate.local>
 <LV5PR12MB9828291FB475B938BF90C7528148A@LV5PR12MB9828.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV5PR12MB9828291FB475B938BF90C7528148A@LV5PR12MB9828.namprd12.prod.outlook.com>

On Tue, Mar 24, 2026 at 12:19:25PM +0000, Datta, Shubhrajyoti wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> > -----Original Message-----
> > From: Borislav Petkov <bp@alien8.de>
> > Sent: Sunday, March 22, 2026 10:01 PM
> > To: Felix Gu <ustc.gu@gmail.com>
> > Cc: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>; Tony Luck
> > <tony.luck@intel.com>; linux-edac@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH] edac: versalnet: Fix device_node leak in mc_probe()
> >
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > On Mon, Mar 23, 2026 at 12:04:08AM +0800, Felix Gu wrote:
> > > of_parse_phandle() returns a device_node reference that must be
> > > released with of_node_put(). The original code never freed
> > > r5_core_node on any exit path, causing a memory leak.
> > >
> > > Fix this by using the automatic cleanup attribute __free(device_node)
> > > which ensures of_node_put() is called when the variable goes out of
> > > scope.
> > >
> > > Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR
> > > controller")
> > > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > > ---
> > >  drivers/edac/versalnet_edac.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/edac/versalnet_edac.c
> > > b/drivers/edac/versalnet_edac.c index 0b47ed7fed63..915bcd6166f7
> > > 100644
> > > --- a/drivers/edac/versalnet_edac.c
> > > +++ b/drivers/edac/versalnet_edac.c
> > > @@ -888,12 +888,12 @@ static void remove_versalnet(struct mc_priv
> > > *priv)
> > >
> > >  static int mc_probe(struct platform_device *pdev)  {
> > > -     struct device_node *r5_core_node;
> > >       struct mc_priv *priv;
> > >       struct rproc *rp;
> > >       int rc;
> > >
> > > -     r5_core_node = of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
> > > +     struct device_node *r5_core_node __free(device_node) =
> > > +             of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
> > >       if (!r5_core_node) {
> > >               dev_err(&pdev->dev, "amd,rproc: invalid phandle\n");
> > >               return -EINVAL;
> > >
> > > ---
> >
> > Looks correct to me.
> >
> > @Shubhrajyoti, can you pls test it?
> >
> > Thx.
> 
> I tested this change on hardware and it works as expected.
> Please feel free to add:
> Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Applied, thanks to both.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
