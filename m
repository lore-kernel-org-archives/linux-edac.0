Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613FD2F0C45;
	Mon, 11 May 2026 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506801; cv=none; b=lLkAuAq72OaOJTOXgZcWpD2klIVZgKPL275Ea42q80Y52DQ6ez/gUJ+k7lWUF9aFviENZg7HC5qycthIHGKDkuW+ZQ5s1r4qeLg1cpZTTq1Cb/nX71XLPtmhLZrHc78Ol8A5cduJTiD5halPYS9i762NSv3EDRSEINNILWIEnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506801; c=relaxed/simple;
	bh=GVRUMg3jw1QziKSzqZ2sG7+pzfX0y4bvDY9KGkZKyi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaDN3mYwiF0nU1HSa0lCK439IF+5ZkAAYWH8R5UB5eqg9x1UqNLSEm2qfKL7jMQKWaa+2SIjFFiTsCE0DzeI+JMeMeH2QbCYnb2lLxhqmS6rWX7dMbLyhivjtG57OMyyx/llAV1zVuxvQilJXSzIMlHOueIW7PCnqEmZKfsnyPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XeOcOByb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XeOcOByb"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 044AD40E00BF;
	Mon, 11 May 2026 13:39:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3yYAxj7QtU4X; Mon, 11 May 2026 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778506787; bh=yoEx+nlem/QO83lxK6y/odelXQ6fzgNIW+bhVDEFXdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XeOcOByb3szYStRQ6PXEaJmM0dRJDjixGKRn8AAqdllijcH68XMi5sNSCmpHxSKn3
	 9EFC2tB8laN1hF4JyWBrP+XP3vZOPKdCzHnqe0aUgJcH6cwibnvX4whtMzVyXhu6cq
	 3IZcU8JN7OTYda7WVAOxhTjy9QtXZqVkiTW3KI3Sf1vBteAJMtHNQZpIw4hQiLwnhD
	 YbrB/UPn6Owh0zbJm/0cEPUAz10+JK5smh9D3ehyyTDUla8MAHTBtRRSc2GfA4PHCr
	 TF+ycYT0g+pfBY7vsiozpF1TYrwJsF5mwKq7CTyNYcIX8Ksc7yxrZWN3JkXWiOKBBl
	 FLJMHwDEMuz0544Kng//h/m2VrSlWlb9RP6TJsYtcfDYn7rHd/95rvdIMI1YIHVpH+
	 JrhdJMo9EO7jum7luQUitq40JKTJOhoFSVH2Wd9X6SOGZN1GTDoPhcjJZkdWooUy2q
	 0n+U9M53aAqKFJ10aWZTU0j4Mk0Wy4JFKdnP8+x15qTV+NN/6QuLmihkkYd+Z0frLx
	 rBVJFy069zlZlEkG20u7NObQc3VP3XZOG7rC3j3ZmSKxcklb/K4xS5PDUnFquoF4F+
	 jslIq/vi0b4jPhuSFlRJzb14rHfrB6eZ6EOktEGp3zqGj2invdzHIMyyv1CTfcD/3K
	 hpXhzJWkKoMfbH/cSTgIo/GI=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id D00D540E0032;
	Mon, 11 May 2026 13:39:29 +0000 (UTC)
Date: Mon, 11 May 2026 15:39:23 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andrei Purdea <andrei@purdea.ro>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	david.laight.linux@gmail.com,
	"Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Tony Luck <tony.luck@intel.com>, Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-edac@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
Message-ID: <20260511133923.GFagHcC_nLmT8k2iD2@fat_crate.local>
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin>
 <agExLK2GR0w0Z_N2@geday>
 <CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
 <20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
 <CA+mMEgcng1bt=ZysgofrGAMA0oMO-9DxSALXdcT9tK4YgE_dhA@mail.gmail.com>
 <20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local>
 <CA+mMEgepR=5P0TxfW8wQ5rtr4u+1uAO6F-1dvxktTaRFDjUVPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+mMEgepR=5P0TxfW8wQ5rtr4u+1uAO6F-1dvxktTaRFDjUVPQ@mail.gmail.com>

On Mon, May 11, 2026 at 01:13:05PM +0000, Andrei Purdea wrote:
> But this wasn't spelled out explicitly in the doc, because you're not
> really supposed to use strlen() to specify the destination buffer
> size.

Why am I not supposed to? Says who?

> Why would that be safer? There's already a strlen() call inside
> strscpy.

Do you mean this thing:

        sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) +    \
				^^^^^^^^^^
                                __must_be_cstr(dst) + __must_be_cstr(src))

?

> (and even if you don't want to read the implementation, the
> documentation implies this, by saying "Copy the string", because bytes

How about documents it properly?

Obviously this new interface can confuse people...

> Plus strscpy_pad() needs to know the actual destination buffer size to

Oh boy.

IOW, before you use this function, ignore all the comments and read the source
completely and fully. Why am I even hoping for something better...

> know how many bytes to pad if you want to pad.  If you give it a 3rd
> argument, then most of the time it's gonna be less then the size of the
> buffer, so it's not gonna do any padding at all, so it's just gonna be
> equivalent to strscpy() without _pad()


Lemme explain:

It should be written there explicitly so that whoever touches this code, can
go and *think* hard first what the source and destination are. Do they make
sense, what happens if she or he writes a string in there which is bigger than
RPMSG_NAME_SIZE - 1 and then wonders why this fancy strscpy truncates it?

In this particular case, it would be better to avoid this silly string copy
altogether.

Because obviously using that interface is not trivial.

So let's see what Shubhrajyoti finds out.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
