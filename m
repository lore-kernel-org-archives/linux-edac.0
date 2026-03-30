Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A87397686
	for <linux-edac@vger.kernel.org>; Mon, 30 Mar 2026 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905402; cv=pass; b=WLJGRxlEW5tnA4bhogVH8NYn3wNpGRpG0x92uGS6TpIWmKCjlYM97UK4Qdl1LwcdZTgjLdm877fO2AOLRUlTMpmKtaVLz7RqnIgl/7UmCPZAKYw+2oldmvyyTnEnAwlFm2TWYzHppV2THOqeQSxgv8Q+TU/tf+XC+fk0twg1tY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905402; c=relaxed/simple;
	bh=7Uvyxu6dO2WjAV8JM3coYG64kde0G9aWlWGcKq+w6GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKhMahUfjDm5E3KQCl1O6ZTJ7KJx35eEBX76jgSqRzGxYcdda75c36IusUgEDo5M71Be8QzoKsyQnTSjKET+V2NRpTxOmx9eyXMI0PqKr1cfHlbgGx6JjwAcUbmKL9cVvC0aIjffau5kJjcLRyz8iUkr3oRPTvLrovQdNiC0RkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTckQj5U; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTckQj5U"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a2e62b893so42126621fa.1
        for <linux-edac@vger.kernel.org>; Mon, 30 Mar 2026 14:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774905399; cv=none;
        d=google.com; s=arc-20240605;
        b=ATl74vLnN66qXz1HbaqhZo5VzP74GHZjDbn/VFAsICnTtdQhdiAo/CW2eKHZSZ84TJ
         ZHEvvugOOBt9T+zvR9Va1uOmmkdQy1kPQQXf3H4O11sgscS83q0zshuwbdNqWwMP1WTw
         /cc2C1s9IMpHbuR+OBOP0y6iv9GtW3or5zdXxUo17e5lRf2rHgDVeG5Y+6t0UfR+yZeZ
         FxmcHYtLLnQClRrZ198DUO2DTf3mHwyi+Dvc0rt/JgYbIULgsU62Nh+34QYqUQbIKM/f
         Ogd+dBv2d6f7CQAOwWkjaz3CDnDRbL5/5X0DrEP45Gvh/zL3qUyrN/J/W7f6YNQeXAf2
         2NsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nBsfzZvqDoaxsyYBwg93l2/XbXx8XSN89/j4CI7HfEk=;
        fh=OZJYlWP332XLIN1hW/C0I8u4/33uE2yuhONOv0Hr+gY=;
        b=EXu75cXFiTb3VUgSlN2RfTurXN17hQVS0P1G/QfAYsHuV6MXQoBVK15l0KPRlnOKsB
         AO/67sLw15pxXkB8WOmYLmdcFD1dSZOt6KbuoiODlExjwbYIII56pE7kb3Xw+FYae0p5
         72eghLkU4K9n0EBQbTRIVigvMpCiIxh+GeLKku5o86kyVbfXcL5Ns3OuL425fl64DOtC
         Nua/Bhud19iYfvjfyv2rnrmaz6+7ZO9cBh2WtlB+rW0hfT6LNissgPKvw1VuRlEhzIFi
         /dLS9a2l5yffbnHtCWY8ZSYetPQ39x+gsXTS/k7gu1cqxZnB/391iv+1YFyFjt498wPz
         cPxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774905399; x=1775510199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBsfzZvqDoaxsyYBwg93l2/XbXx8XSN89/j4CI7HfEk=;
        b=CTckQj5UwCrl0L+738kZBtQbo9oJ0uvu3swwk7gi7Fa5fCfp0eSjQSQTjxZ5QLbV35
         WRjgTtuPp77s1VAyreiH9XVOFelNaNwJ/KYi5cYWy/aAhRIWWU9Pd85L4b5UkBr1k3k7
         KLpIm4YWNm6xVVfXQMntNTMuNR+ouN7EXhDRfUPgTbclO7NK3OnHiN/eCmsjnPFofUDs
         ymggPs7oz1EiNrYECn7Z1fQf9aXvUSznkxTljjMUHNEsCkjcuTB4F3W5iS4Y4ti8ALqC
         inrok3U4I8pDsw8yrNTar+s1yfXB05bYJFmsWokf8hmeO6AWkFQsloX2NcJ7jVMNOp+3
         Z2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905399; x=1775510199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nBsfzZvqDoaxsyYBwg93l2/XbXx8XSN89/j4CI7HfEk=;
        b=SWFDfn5dH6jw/iZnHZvoUizp4nSDZqdo3HFfExWDniBT9BtZ4c85JUlEmQkhG4czhL
         UnuQZsxFMp56d4jRfBEP61AGXaG/qQu0IPP2EyWGsPP6jwwUHo3+5MuOiDbgycujiIJf
         4yKg6M+TiByNf+DSlaA2HWJValKLLK98DCv+QwVH1raHSXcDus1U+SiaD0CBMPpTW7Mj
         BbRPeW6HmUylRQzEPu3Bu0qsJF/suABB9EsxQR4RqtbUYc/jih3sHtuZV/+LXNDSCdSH
         xCBiJFGNQGs7COLHC3tSavT97MOml6wrIevSJLKL/MPuw/iprETuT5S3JjAcTJ41vGMt
         +8pA==
X-Gm-Message-State: AOJu0YzRnCrBHpzzzd8SX3a7R/mrQLo9XQ8YDrRTzs1WdqrS8b1u7/u+
	GiEnUNm1RLXA6rMZh3lgDN8F+oU7UW2CT2VOnzFDsBVwL7yR4h5tiAVVU5ZRzm27fhMGVw/NLbu
	Bdj6i1jC9CW7Ri037CW140OktKfUmviJskw==
X-Gm-Gg: ATEYQzxP2pWuarEpxyTGNwIS+vbNLD2WKIETAZNTkvP0wZb3pAdtcvpo05VSnysM6V2
	5am6mbE/0bGlkCKlhbf3PKq0CkdGGRLedJm+LiqX1c8LW5Qm9mKhxmlpDjBTYZXzuaWeIGYjMpx
	Nyj1Yx1PdvqHlq4JxOtZ1+icjinzWST9DkPLThO5kfGfGEXDETucdryz1y4i8OG7idnx7fe9lm1
	NPouy+L/ykTV802pPNuI9JbZ3SVB/qAu7PZ5V8Tt6Dx7CAKXw2nOQbIucDigST9PK5U9BTkvgsU
	98busmWbWru0nxLiG4K4lW3YdwhX5OLFQQ8HecWQgsr/Bo4z+zFYOlpHNJ9SEjppvd9dM/2z5hb
	shNm9Fg==
X-Received: by 2002:aa7:d9d4:0:b0:66b:3dec:e8d5 with SMTP id
 4fb4d7f45d1cf-66b3decf4dcmr5222339a12.2.1774903787350; Mon, 30 Mar 2026
 13:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327024828.7377-1-rosenp@gmail.com> <20260330151536.GDacqTmBlWRznyeoMG@fat_crate.local>
In-Reply-To: <20260330151536.GDacqTmBlWRznyeoMG@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 30 Mar 2026 13:49:36 -0700
X-Gm-Features: AQROBzAQRLuVcHgB3Qxt8IE08Jitj0rOszTyGILx96JimU4Uuu7Tkat2ssdZToU
Message-ID: <CAKxU2N8HqFRT+qb5ctCVckC6c=viR7u+xyUaHgm-87C5=yo1ig@mail.gmail.com>
Subject: Re: [PATCHv3] EDAC/mc: Use kzalloc_flex()
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 8:15=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Thu, Mar 26, 2026 at 07:48:28PM -0700, Rosen Penev wrote:
> > Convert struct mem_ctl_info to use flex array and use the new flex
> > array helpers to simplify initialization.
>
> Meh, simplify... rather to teach an old dog like me new tricks... :)
>
> > Add __counted_by for extra runtime analysis when requested.
> >
> > Move counting assignment immediately after allocation as required by
> > __counted_by.
>
> So far so good.
>
> > Move memcpy to make it clear that this should have been kmemdup_array.
>
> But you lost me here. What do you mean with the "should have been
> kmemdup_array"?
kzalloc_flex =3D=3D kzalloc + kcalloc.
kmemdup =3D=3D kzalloc + memcpy.
kmemdup_array =3D=3D kcalloc + memcpy.

So all together,
kzalloc + kcalloc + memcpy.

Or

kzalloc_flex + memcpy.

Placing the memcpy right after counting variable assignment enables
coccinelle to transform this whole thing into a single

kmemdup_flex

call if such a thing were to eventually be introduced.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
