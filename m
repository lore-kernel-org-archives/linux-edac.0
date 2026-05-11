Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09273D47A8
	for <linux-edac@vger.kernel.org>; Mon, 11 May 2026 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505200; cv=pass; b=rz0pURQZKPQB9oi39exoqaoLVorM0JUDgdas7gGMNBZhEMutLug1y0fR8ORPZsZrUXI9gJm35J0sauEY568amW7ANoS1s/slPV8YuvpUhgJ8GdZbbmwp17G+w3W5hkske3UfdehPV4tOpTQk5hXjD10N7SsKEt7kbLgCUnDkjVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505200; c=relaxed/simple;
	bh=/JhRm525cR3bPvca552Xx/Z1BTer6+bShyTO2rRXwXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRta6WpRirA4f7KWxfGanDD8C/6c1NbmOz3j/D354R8XVEnaiB0OEerYi4uCpsLiAf5FB8Qi8nBclsPX7ptPDqdbGS5r4q+JN/xjdeCQXAx0Ria4hiePi7Jb6B37d7a4OPMW8bSVs4whF6VbweTs+vvXPRJD+WtgrTHGWNHyXqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro; spf=pass smtp.mailfrom=purdea.ro; dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b=ZF2oMzn2; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purdea.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b="ZF2oMzn2"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a88de2b52eso5581177e87.2
        for <linux-edac@vger.kernel.org>; Mon, 11 May 2026 06:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778505197; cv=none;
        d=google.com; s=arc-20240605;
        b=D5QiO//Zk6iX7TaSyA9s7StfEVctE2Go0gCR2tEJlziIm4yRhi/Z70kMV/FlRewsrb
         mH2oIycKW0bbAwRjyojYBfqfRmURWmcRvIRowkWD66iREbRUQtCTMgtG1vTNSwz2LDbF
         LRzheu53wyeHXYrJCH4EZQ+hBO6qzXIPsA/BnhKIyHhdbz2HTKUSwkJuABIiDT9HYhRP
         LzupqA/W/squl87C79vtnNH4gH++jrSK26WUbkKSF+F4stcBAyLzL4IxrorIGpYwAGbj
         XNWBICevthyViYHGnFFl04cXNv1kMsswxDE2XGl6KlTLtyh//BHp2w+HQrPwBA+3x8RQ
         m62A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4TsvCyfn4Vons4rSkCHBRhV0pe1329O/JdQeh1GHje8=;
        fh=fnfCmSExz+PR5g7bZbjKsrtrKf8jsLhtaJcq5Zh7T+w=;
        b=hha2Iw3lcMryPnqmHAEGotohLl8RdoZ7fYGCYPx+O0z+tyyBUPck1hVJZNZ8SZBye7
         GwQ0J61CX/P+JXLvAWwnhQ3bSeQhDlfn1MyvYSpZyx6N1F5bVqUzA/Ld9PMiVov4cZrQ
         bdxbvBhjy7DDwIyJw5DjiV5r5/6db22NEbzvCTz8FjtZYzBHRQ6X86lAq2bhVXG1UTcT
         EukPMThgHJGq7Jq9+BEsSin5+SSEewuwKPL812R+6D5BOhTX6Zrcu+uVVP6rKFoW4Pkm
         l0Novz4xv+y0V7eBYm2XnJ3hgOHOFedmP72a5nlO9kzpUWPqZZ0zB5erxpetsPgFaOAA
         pEEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purdea.ro; s=google; t=1778505197; x=1779109997; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4TsvCyfn4Vons4rSkCHBRhV0pe1329O/JdQeh1GHje8=;
        b=ZF2oMzn2G/kuH4waLom9YPqx+Z5bTXBdrwa2Psj2wnoC7DlnX4w6KMNEvaic0vi6fg
         LhKN3LJsWWt3TP7lAc2Optka1S+ey045/iR3CllZPMEQVDRSBCOOMwh1YsxvqqJM7HYC
         1QBpM1s2SvkRYXWN8hFBSvaLbvGMmYdoE/kkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505197; x=1779109997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TsvCyfn4Vons4rSkCHBRhV0pe1329O/JdQeh1GHje8=;
        b=jmMGEZ88NpzBWKXvMLM3qN8iuOjjypBgRWLxgG3x1McAmSF94kGUsRYj5LF6sa2BEb
         9EVgH206+LgHb350iIY3pTGbw2BwKUcY2w/P/sg6XhFNF5pEHtccX7bNJsoPAheqafMZ
         AFk8ZACZQoIF1/myYTix5K9CzxaIRuOakZKBoT/weNYFYE3BdyVxHb5zC4YIX+SMiW50
         lnHOgkZqnVIM2eVoYt6mxoJ6+gaZQKYbpIpC2AakTZIpmnkSmlhP0fL/nhDNhAOE6LpW
         mgikQFwCc16hvbhxX1J3ZjB4I9GZ7TE1OhLioaLmiELjsuP7pYTS8WBROnhC81DstLbh
         NmeA==
X-Forwarded-Encrypted: i=1; AFNElJ8ObcJEoL6wkVuCc5zMTwMFYKAfbpRcTdrAIr1i2WsQq6VOixBIL+LlJOaK5EE8by2gJUJiCLY6seBq@vger.kernel.org
X-Gm-Message-State: AOJu0YzbxiP5AnSAt59PG3xdUQCTjByEhZEOvlZb2fWIMKwyuxAN0KIH
	6lm9OZb8m1yIuhs+bC1jI0C6U1Oj2IAixj00KKypnXG3yVwLyQguHRe3KuwTMrTLsFNu4S8RmaM
	+/fNbDCDFwbiTvz769qsER989UAfCeXNVDwlFoLy/
X-Gm-Gg: Acq92OGg0M2oqlAAbe4tdhOUx4Q0OoBqOj1yxI3HLao8qGnaPit0Bb1aZSb4dw7VTol
	iDuvZFIXrHRsurU2cmjGlM1iEHNjgrTUJSN+CN1E+m/gvkUFcNA7oc1A7sTr0hzegtZccQm3v6B
	03yl5w/v2QFjPdpqJDV+KKoQh6eZDCFULJ/AOoHSuAfwknKoP8EZVxziP50WMKmSsu0aML1dW+5
	v7iB0ww8ItEzNlAqPirgtKDijHlKghJmYPSqh/LMOjLCnTcmVorr6eAC4CqQQe2HSeVIbzucfFv
	g8H3FdyI75tC3Crin96q1Bw8kNnD1RiI6z4a4/8=
X-Received: by 2002:a05:6512:3e25:b0:5a4:74e:5f75 with SMTP id
 2adb3069b0e04-5a887add952mr9396583e87.1.1778505196891; Mon, 11 May 2026
 06:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin> <agExLK2GR0w0Z_N2@geday>
 <CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
 <20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local> <CA+mMEgcng1bt=ZysgofrGAMA0oMO-9DxSALXdcT9tK4YgE_dhA@mail.gmail.com>
 <20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local>
In-Reply-To: <20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local>
From: Andrei Purdea <andrei@purdea.ro>
Date: Mon, 11 May 2026 13:13:05 +0000
X-Gm-Features: AVHnY4Lz6FCklWCE5fuSqs-XJBmGPPcjsNOrgia6Bch05QJIRN7pCIeHg_JGq3U
Message-ID: <CA+mMEgepR=5P0TxfW8wQ5rtr4u+1uAO6F-1dvxktTaRFDjUVPQ@mail.gmail.com>
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
To: Borislav Petkov <bp@alien8.de>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Geraldo Nascimento <geraldogabriel@gmail.com>, david.laight.linux@gmail.com, 
	"Alexander A. Klimov" <grandmaster@al2klimov.de>, Tony Luck <tony.luck@intel.com>, 
	Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Li <nick.li@foursemi.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-edac@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Pfff, that wasn't really clear to me from the explanation of strscpy...

The third (optional) argument is count, which is specified as "Size of
destination buffer".
strscpy() does "Copy the string, or as much of it as fits".
The doc also says "The destination buffer is always NUL terminated,
unless it's zero-sized."
strlen() return value doesn't include the nul-terminator, but the
destination buffer must have space for it.

So all of these together imply that if you give strlen() of the source
as the third argument, the last character is gonna be cut off.

But this wasn't spelled out explicitly in the doc, because you're not
really supposed to use strlen() to specify the destination buffer
size.
The destination buffer size is how much space is allocated in memory,
and that's it. If you don't specify the third argument, it
automatically takes a sizeof() of the destination buffer, which only
works if it's an array, and not if it's a pointer.
The size of the source string is handled internally, (i.e. there is a
call to strlen() of the source buffer internally in strscpy)

> > strscpy_pad(chinfo.name, amd_rpmsg_id_table[0].name);
>
> No, as said "[h]owever, just to make this safer, we should min the size".
>
> IOW:
>
>          strscpy_pad(chinfo.name,
>                      amd_rpmsg_id_table[0].name,
>                      min_t(size_t, strlen(amd_rpmsg_id_table[0].name) + 1, RPMSG_NAME_SIZE));

Why would that be safer? There's already a strlen() call inside
strscpy. (and even if you don't want to read the implementation, the
documentation implies this, by saying "Copy the string", because bytes
past the nul-terminator are not considered part of the string. It's
how all string copy functions always work, it's what defines C-style
string copying, otherwise it would be called memory copy.)
Plus strscpy_pad() needs to know the actual destination buffer size to
know how many bytes to pad if you want to pad.
If you give it a 3rd argument, then most of the time it's gonna be
less then the size of the buffer, so it's not gonna do any padding at
all, so it's just gonna be equivalent to strscpy() without _pad()

Andrei
