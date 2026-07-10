Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56663672A0;
	Fri, 10 Jul 2026 03:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783653887; cv=none; b=ZAK43bGzgoYVAb7qn+rl/JvL3OuN7riIka/leerPN3mbGAPsvV1FzdRf/fzHMM5nzrXvjkLB1q6ZADp5qFQOHAKZTMdZgIKwQgBr824UvN7K0LiI+mg4nTsri4p0kiZQt3M4vBlVi3hd3bxFXKxI3/YveYX1elSMnFcY1neSD1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783653887; c=relaxed/simple;
	bh=qal7e28GjjL9cc0u8YkXO8jE/BDP1tUJHOVY8ySDWb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQQVi1pC7U62zgrMSpaa71hHfPOM22xBt+wQXZqWZpXlaX30f7KCwcItl/5U068rew6TMIEmQ2c9qC21dairxrUivC6Xv93wys3dU40+k7Nu4YaHm+LrFqRvVqb6fLzfWMtzTK4Gb568ittEd+X4Nh7MbvuF16xezKVmrl7HLmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=GFnIZXKA; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="GFnIZXKA"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 907B940E02B3;
	Fri, 10 Jul 2026 03:24:42 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 18JTFTi6GkP0; Fri, 10 Jul 2026 03:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783653872; bh=CegzjLuF3AnqXKt+gyJp6PLUB9sTzLPiD/1UntV7LCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GFnIZXKADSgwe1pphI7W3Hx+MZo/i1ogbtTALDazgNlG896ZooQyCatgkmxYYH3W6
	 FZHeZ5OxttKztr95AUCsd8sXOjWdlPyroLV5bx5/EJ+OhYOkMA6j7Q/ztGASB9lTXh
	 x5q+bCIhtrJoTzlkmvNdoorqyfvPNNxXM3YfHMPgPXkxA+bO16RMqHZeqJmDftXHPK
	 vNPYcCLANg/nsjuL5chsXqbCbLtcuDQGXuYJ/AaMF2MOFgIheFsXWKpLMbWEo9KPhf
	 TY1CQb5TiiRmfUnXiz1TU4oPrx7FKzHyWQ8FL+nphTBz5x68YhsuIzBYRRHsxfTgfs
	 kt9FSIRRdpaNnElmWXIIGThPmaDxbTpl4CGPuDjx8o3AL3dx7XZ5MNK+59SfLwdtjc
	 +3I4ybZPm78CDHuymjTh3sE7ceOmoPZlK9jTQX64Suf1BhIxXSAx6j2xwqcXMgk0oc
	 rIVDgcf/7ln2DNcT0t3BxtqKITvK45rRIZ+RnF9BtL5S+0IsvgDv6ekDmj/tqNfxxu
	 NAk4UIxwmJ2tOrsdim5XUdygubuJyO5+e5U6SZN6pOYgzxk/p7VUJT7UFg7bvvx0Pd
	 BK8loRPrTh7uqdL4bU3/FUV8KHH0g8qkAzCB6FAHNcHLNBUeTMShLU0sniArzrSEkc
	 nK2j7ToKTvyPvam1o/I9aeQQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 078F440E00C0;
	Fri, 10 Jul 2026 03:24:27 +0000 (UTC)
Date: Thu, 9 Jul 2026 20:24:24 -0700
From: Borislav Petkov <bp@alien8.de>
To: Jad Keskes <inasj268@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] edac: edac_device_sysfs: reject poll_msec value 0
Message-ID: <20260710032424.GIalBl6K0YJ2js1gHo@fat_crate.local>
References: <20260708141000.1764100-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708141000.1764100-1-inasj268@gmail.com>

On Wed, Jul 08, 2026 at 03:09:59PM +0100, Jad Keskes wrote:
> Subject: Re: [PATCH 1/2] edac: edac_device_sysfs: reject poll_msec value 0

Do

$ git log -p drivers/edac/

to get an idea about the commit title and formatting the EDAC tree does. In
this case:

EDAC/device_sysfs: Reject poll_msec value 0

> The comment says it must be at least 1ms but there was never a check.
> Writing 0 sets the workqueue delay to 0 jiffies, which makes it spin.

You might run this through AI to get better/more informative formulations.

Some hints about a good commit message:

https://docs.kernel.org/process/submitting-patches.html

> Signed-off-by: Jad Keskes <inasj268@gmail.com>
> ---
>  drivers/edac/edac_device_sysfs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
> index da804ebe3626..3137cf6cf36b 100644
> --- a/drivers/edac/edac_device_sysfs.c
> +++ b/drivers/edac/edac_device_sysfs.c
> @@ -117,6 +117,10 @@ static ssize_t edac_device_ctl_poll_msec_store(struct edac_device_ctl_info
>  	ret = kstrtoul(data, 0, &value);

If you do those patches ontop of your previous ones, it doesn't apply:

checking file drivers/edac/edac_device_sysfs.c
Hunk #1 FAILED at 117.
1 out of 1 hunk FAILED

But you need to do those fixes first and then the conversion to kstrtoul()
because the fixes will go to stable while the kstrtoul() conversion is not
stable material.

Which means, you'd need to add a Fixes: tag to those but that's fine if you
can't find which patch causes this - I believe this has always been this way.

So, how about a new patchset with all that review feedback addressed, the
fixes first, the conversion following, all nicely tested, if you don't know
how use this here in a VM:

https://lore.kernel.org/all/20260707215307.396571-1-bp@kernel.org

Thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
