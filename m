Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7643C1FF5E3
	for <linux-edac@vger.kernel.org>; Mon, 30 Mar 2026 23:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774913140; cv=pass; b=jgu/OkkWQXP4SCFkkCTKh183UbT4JYx//EW62daDecZ9oOqeFrMwysyDDYu8BEtzmGpSu92ikCwBbrycgXZOOioAptm7bEXeVbGS3nEttDXfkN1SOYV71+kNqBFQZvKWpDH1vcg3GR7b2PxrLRKSOjK4VUmf3FklTMU/hH/YeEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774913140; c=relaxed/simple;
	bh=U9Se4A611CkzIt14YY+anOFpHZCnBl92CIDU623h4BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpRmP0XdMr/Pq3ZqAYb263hmMoW0t6D+XQgYRmkeF54CNU5nPqvknjCEVWT072gFbHx7/YbLXnK51v0eAz34objuLNFZqncoeGI7aExKwSs3S5ZEF/4GC35YQlOuH0iWvEUP9mYjiLsVC9YGbHDPsVIAQP0cq+s2tMAysbVpecs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D69RRSJe; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D69RRSJe"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66c24b42efbso1140540a12.2
        for <linux-edac@vger.kernel.org>; Mon, 30 Mar 2026 16:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774913138; cv=none;
        d=google.com; s=arc-20240605;
        b=i6ed35Sff8u4HO7YZ7tETafjCLMfMiwcDEQ1uRr3iohC9J5EDJ58OOgSzH+f5cFBKX
         fnXJvXkk1YdfgsAEJTl+50RABnWCqJPircX51ka6wOGh79/2ILhcawur12SuNJqF5FAr
         RAn4y4qr4qWsn0CIioTk4dzgR4VAUn8m+d2PxXHY7ZbWprMca+4CdyOczPcw06wCfL1x
         pLnTGXad4oZ44AnbnoCMvmY5UXCtuqfybqqmsxiuDGEpbWj63h6NpHWnqqJJJ2WA1K9q
         gb+M9Y3iTwj6n0gfUehZ1uscQb4LqTzGgbaozHuHYwxuItcIw0JTX/GHl7WQJPEXRiLd
         gjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KQe7LIgffnJGhGXKGbh3dxofyfAx7h3GfdUWmKIcyI4=;
        fh=OZJYlWP332XLIN1hW/C0I8u4/33uE2yuhONOv0Hr+gY=;
        b=UbAAm7dkqr4iwj5Xu8kDjI4U/qKP+QTsJ5F8Hwp96tY0tLJenXvWz+Ndtee66OI3/1
         raR/eDys6SMqG2KEBPGlgg8y7iwnt8a/jm7yWVkrvFmpO1+mAd/YwMak0oslMqkeu6II
         kkml+pmtDpqL85rlO/SMP3dNISHQkmZHztgM9ejMFN4vl5YjXdd3Nwwa81lJ4lOx6Yd2
         Eg7PDabnwsm6Vy6v78t+h6mJiU5V9myKk3GA4VyAvXs5y39tj5U+Ud2EHp8+3t9PfUOz
         PW/zuKLvTrMPvDJ4VICkx7AAvyCJldwtNimE3uoyvp6+EKcbG/TTgVLkUxzZ9QPyWak0
         /Aqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774913138; x=1775517938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQe7LIgffnJGhGXKGbh3dxofyfAx7h3GfdUWmKIcyI4=;
        b=D69RRSJeMiuWuJLgct6spfSnGTFcLbwvkSJ1GnIKn1lUhNGnUU1qCexNDxBFLIypVN
         OpSuVc1cSdF4B5UOVc/35F792ucXl51KMGoFpqq7TonE8HybaiEXqnVRc9KS/0jOb06g
         3PbcUNWsSjNLfc+Sahaww7f6LE/prdh4sLFsKiR7YKoEkjI/9zzGIA5FzdPrkPMUTyFR
         6Az7e7wbosmlee1fTIXtQaPmZ+D6sGXnOOSy19OFLbGjLDDztcTwbr0YbYcDZzK9COOb
         uozo5ckHW+IOewLBJVI3mLri+/WPBnT1H8JiMbd1axiAYKqvnxbvqK9nsCSQD0Qi3cuS
         z1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774913138; x=1775517938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KQe7LIgffnJGhGXKGbh3dxofyfAx7h3GfdUWmKIcyI4=;
        b=jFUtypvV2x0Lv+XI9J0jjctjA6D4pVNoC9ra07TMhyD85s4i8GxXNVmVvjxXdzFGqY
         yByuDL5lSGb+LgJI0an80N/jUS6xwepS2MFTH2r+LcOVU+klB8/67z3r3ImnsZk2aB3E
         VhJc+zlPspENtrzRVF8VRNUIGnsSCfjBN0UE24SydERa5ORE5yI4MPSPMv+R3lQx/5FN
         Q5PuzuLDrihfaknT7R506TQtYwqXBcuA2THNI5JtBtLv7/k+H+T/5OK25MXA2Pp/Hk89
         v54U01LErEG6Z/E8PAsI1dNr+DfQA3lbFG/F1J8CUkQM3qwQhp3B/9RHJXCiblicqyqY
         iL9Q==
X-Gm-Message-State: AOJu0Yy1TuHbOonzDGQJIicprZtuLIuvfxKgz8ni9TqoOOLp9XUSmMhA
	2PTkyTo/uLuxvFHC21678Pc896338sL7kVPSCXco8MahYU0ZBBVyffTQjD0yPMwYoQVuf4obDgr
	eayvberIkqeTXWH30VxY11lRvEFGjYNg=
X-Gm-Gg: ATEYQzxWqXSPNLB8L5RmAJN8TW4Apb9HpS2lRGRC91duUpZr11JRKQuadtjZyPplrD5
	dqCA5+BtW+tJuVaY8POt3i6Os1cjH0RGgxVPxqkckavfgIej4wDgFOnmXoFcjlg6GNdgm3ExMwU
	RXgHYQfzRBcQ0v6DkLTa+4ZIPR+VR97E38YYDQmi4CxzKRL0PVbkUXUGQ3xgERB5wscwM/glYar
	tDqFjVj1G0oO4OxaK0FsAF1N/BgEaWSE6GYmLx4DXeyQ5X7KIFBKgsLBFWnHkfhll2D2eDRki1l
	M0I/FKOErN1bh13I/wfp0mTPAoMVr3U1mCb4wFRP/QL5r742kt7Ml50gxOFUT7oxJVJlvVrBGzj
	YbVje4w==
X-Received: by 2002:a17:906:598e:b0:b97:98b3:67ce with SMTP id
 a640c23a62f3a-b9b5090a95cmr623997966b.32.1774913137814; Mon, 30 Mar 2026
 16:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327024828.7377-1-rosenp@gmail.com> <20260330151536.GDacqTmBlWRznyeoMG@fat_crate.local>
 <CAKxU2N8HqFRT+qb5ctCVckC6c=viR7u+xyUaHgm-87C5=yo1ig@mail.gmail.com>
 <20260330211123.GHacrm-03xUU_3yX66@fat_crate.local> <CAKxU2N__gE-bWBU6EkJmEK2gR7VE=Va+oN6EB2hpJoHbUiYVxg@mail.gmail.com>
 <20260330223222.GJacr59uiTZzPRYbWX@fat_crate.local>
In-Reply-To: <20260330223222.GJacr59uiTZzPRYbWX@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 30 Mar 2026 16:25:26 -0700
X-Gm-Features: AQROBzC_9X2S7WNOT7VfmLfjhKrAg914YdR58KojhKXZN9vQKNugt-S6dgcpwGw
Message-ID: <CAKxU2N_H4mvrJh+zgoikY8J9-u3nnWK-1dQwZanDNksoE75hvg@mail.gmail.com>
Subject: Re: [PATCHv3] EDAC/mc: Use kzalloc_flex()
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 3:32=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Mon, Mar 30, 2026 at 02:26:10PM -0700, Rosen Penev wrote:
> > > Oh, hypothetical what-if. Yeah, pls drop all that gunk from commit me=
ssages
> > > pls and simply concentrate on why the patch exists.
> > Not sure what you mean.
>
> I mean this: a commit message should simply state why a patch exists. Her=
e's
> what I did with yours:
>
>     Convert struct mem_ctl_info to use flex array and use the new flex ar=
ray
>     helpers to enable runtime bounds checking, including annotating the a=
rray
>     length member with __counted_by() for extra runtime analysis when req=
uested.
>
>     Move counter assignment immediately after allocation as required by
>     __counted_by().
>
>     Move memcpy() after the counter assignment so that it is initialized =
before
>     the first reference to the flex array, as the new attribute requires.
Looks great.
>
> The idea is that when one reads the commit message months, or even years =
from
> now - something we all have to do on a daily basis - it should have all t=
he
> necessary information why the change was done.
>
> And nothing else. The emphasis being on the latter part. In this case, wh=
at
> this should have been and what some tools can do when lines are magically
> ordered doesn't really matter. The change must be worth to exist for itse=
lf.
> In this case, runtime bounds checking, which is something we all want.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
