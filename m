Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD38439EF01;
	Thu, 30 Jul 2026 05:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785388391; cv=none; b=q++z9j0eg/8EQaV02PLYuO9n0em9MqV9ChSl9q5CBW9WCz9DhPhJtu3fx+BvrMZfprUzUG3ANovgF2pEt5hL86tluuz+V5YzuTgingz4I37HPBHfsPq1tCQIFJbXfoOajYMFBJuyWklQu1w7s+AUfgRN/Nd4QZ+tqcLmw0u3m+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785388391; c=relaxed/simple;
	bh=3rl7CE/nKAqvOj4xKWZeH4qgZxIwb8Z9iItbvsWyUSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ix5R/6ruLjWfxDxRiXItpiFfY6nOi0+MRGFRSOKNnM2uXnGJBdRMWzfb4ETp6OeeBuVz9jVhq07obWFlJ4gvHUsIxgetBH1tg6uKAcC7NwditDDf/MRDmIamijMpdwEdG5jjEgpaAR436lHwXN/dalqsZG86DTU3m43VAyh222Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=a3xQW2lZ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="a3xQW2lZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E376840E0140;
	Thu, 30 Jul 2026 05:13:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NB_ruLlOMyW2; Thu, 30 Jul 2026 05:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785388376; bh=pCdb0wM0Cfv3Hqjurh5C5e614DdjkEKcOSkO/9kTcTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3xQW2lZp/vmlVnZFGg0nMoo9aHz6ustsItLQU6hGkoYJeXvZaMvzqDsshpTGPMCX
	 yNHuoySSLVGp38R5BR4qW+n/EoUqeHOfJQGxU/iEH5qz2iB9hoaaykC60DJ2QzSJY3
	 OhrVGNBoHRJ7pWRt42vr01xd/jtDzPSHlGukZzJDXZH8gNp48AvihF1iC95FgIkEr5
	 Mh3B56k3RwwyJedNkzycLUFqxrrDBzM/ShbAblHqFv4lHkM68x28TyswbJ2Vco3Ayf
	 HXI3k++mgA1sbZOZCTTjYrGGml4tIFmyCIK/U0x9maPXUEA2jSt+YcH8p0tZ3x/r7I
	 CwSxSDtfQRhiuH01ecU0n3JdUcrTdOcvA1pzWAbr6cD8Jq5pMXTYyA+OcO07ZvAjop
	 G6Qc5P8yJ15brIfqqrp0lStgmLlAsO81O4f50WcoZAvcRJjSXnXLLD+Ue2hlXjdgvr
	 TrEHURNNUSOQPxBWrDyiyX/YYUN8Ayqb3cUH/YvTVasCE9dcf31JsbsnMEHmdo2QSF
	 oR4K9/QnebfcLDkxNNAIQ3Z/BrWn0EJCf3g+6N86c/ZX3GZuoBtDHVCwP2taXiNSU3
	 unI8/btD1oHPpKiBG/KI4EA2/4galfp7z7wwUu2hLVx4LeKSk72q+W6JBRegzDk4Gc
	 LFkRMYaVZUCl7TgM9ibwTf7w=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 75C5040E00C4;
	Thu, 30 Jul 2026 05:12:51 +0000 (UTC)
Date: Wed, 29 Jul 2026 22:12:48 -0700
From: Borislav Petkov <bp@alien8.de>
To: Jad Keskes <inasj268@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] EDAC/device_sysfs: Reject poll_msec value 0
Message-ID: <20260730051248.GHamrdUMIjEgUV0m7i@fat_crate.local>
References: <20260710113548.46266-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710113548.46266-1-inasj268@gmail.com>

On Fri, Jul 10, 2026 at 12:35:47PM +0100, Jad Keskes wrote:
> The poll_msec store allows writing 0, which sets the workqueue delay
> to 0 jiffies. This causes the poll work to spin without any delay,
> consuming 100% CPU on the polling kworker.
> 
> The comment has said "must be at least one millisecond" since the file
> was first added, but no validation was ever enforced. Add a check for
> value < 1 and return -EINVAL.
> 
> Fixes: e27e3dac6517 ("drivers/edac: add edac_device class")
> Signed-off-by: Jad Keskes <inasj268@gmail.com>
> ---
>  drivers/edac/edac_device_sysfs.c | 3 +++
>  1 file changed, 3 insertions(+)

Thanks for those, definitely better.

However, Sashiko found more crud:

https://sashiko.dev/#/patchset/20260710113548.46266-1-inasj268%40gmail.com

That thing in edac_device_ctl_poll_msec_store() should not do unsigned longs
and then stuff them into a uint. I guess we didn't have the kstrtox-etc
helpers back then...

I think you should convert it to kstrtouint() directly and then deal with
the value in the proper range.

And then the other reported issues would be good to address too.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
