Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834BB39A077
	for <linux-edac@vger.kernel.org>; Thu, 12 Mar 2026 04:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290663; cv=pass; b=WrPvm62Zl/lb+peJl5/hBRaeDtTv/krZwB4ssbXA1gKbTetaCX+2ffempdFskzktbcb4BFhg+CdTAcF0ogCsKKk1G21tdN4XPyY3x/udx/LNOoVFQls6Vbq0vF3twt52kEnNS9aN4xxaSZHIeSzao4O/CXh3R28KR1YzIOIZlus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290663; c=relaxed/simple;
	bh=ohdNMiGDsJ9qXT/qMT6p3+umPlNFYkYUeMT/HuXPekU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRfxte7nZ7o4AwWw4PQZCMlvlxgRfuoThCPfoKJ9mP1bJFC0wKSb1ZBm7zj0WLT2UX5K07xueXhE/Y3TpkTvMeVCSOibbidZvORLMUnlypnf9P7urqdKJhvfH3qjVN3zF/j0588CG1h0tm/4j4gnPJq3IFnyZ9eFjB+cAW0Sg7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaDywv26; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaDywv26"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8f9568e074so74469966b.0
        for <linux-edac@vger.kernel.org>; Wed, 11 Mar 2026 21:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773290660; cv=none;
        d=google.com; s=arc-20240605;
        b=Lm9ihGjR0YBYxabe5CuCdFRxOvIEaM0bJcpeBi8Vp6WMjUP9cbhNFLoRmm8ZLPMJBs
         qjJq9SMiiOWVm4Swp+k7Gra9aGKfaleqisSVClVw9ZCLLKGuknfYa7M5+VXGB1SrHqFE
         wb3+DiQXMlH5DmKZCcchRwd8FQNbiA7HKNZpRNCPvmmEAnXlVss5uzMf/oE5mD8zdcFp
         lyqj5hGGsW4nK6JV8ZglJDVhLTiatguBmNz+R4ih95Aln4NV1KCTjLo9Xsy50D/NZLsP
         GB8RAmZq1HC9HrNi8eYGgUyz5y6AYYq2faxtexrvahXTnZzZsnQoKiWgSZwVy8OOl+Ss
         bXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DmbSeeL5YKTmZzl5uFsKI4sYasWlIRX3peN9L+EGfFg=;
        fh=G/ZnNsBQh8byFs3SUOrolu6/kSdr9jhRCeq92tEy8I0=;
        b=BVJRlgUmPxHH5waMasIJhuHtWXdmPOXBnfI3Q346c6FPYQQOM1noRgJqB0fa2tb08r
         qNVufDpVoqiVYe6a24R60MlVpiUyMV5SPTr7r42QzSpYLbjOXA1S8sxER1mhnVL4/opY
         kF66UH3Y5vfAHl9DdIMbjzMn/MOqGHVxuCg7IR5HfhsOvXmm7GxGA92h6C6Z08dcgdkR
         0bDkh0qBFkyxhS2jV+kQeB6s6xC0PvirXmn5FjTpTAvbXLLqxc0YSmd8VpC7sG6FeumE
         xRZRqFcoeNrxfQei22wZy7RrVveQ24lALhYVObbtKZqcpCrfKW0uR2gn+TVCp3RpzrCD
         oTfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773290660; x=1773895460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmbSeeL5YKTmZzl5uFsKI4sYasWlIRX3peN9L+EGfFg=;
        b=eaDywv26Tdq1Zhyr06t8b+6hazRT6EAAlq4OGV6yfPj4Cd1+dO8HrKkAdkOH3TpH6H
         QZ+SgbZrp//KEQNCZDABJp2whcW6CghqDqMNqkp/NLRziiV39VkwAp5q+/tFP5mpqQrb
         wN9+6xCt5FL0mpC/+Onwy2Q0lM078tyrwDr1EUxSPW9I++NEuRekXpt7KwsJENhlrAf7
         9GX1f6fGC85VsshF+ZmuaKZAebF/wVBAOgRmVqORPstjHGiieoYsH0bSbd/SXX/KqVL3
         JB+y79M+8IH6W7KtA4zpL6Z/qnzRDkcNk4wkZmXvmHCfpa5kI8W/n72VVmu6wPw8DO3u
         wCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773290660; x=1773895460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmbSeeL5YKTmZzl5uFsKI4sYasWlIRX3peN9L+EGfFg=;
        b=LruqebbBgvWs9BOYTG28HJmIU8UE3Mmwr5PlZF9LZ50lPA1g7KXjqdqDipItoStgRI
         sj2s1umSLvVHEm2mr8x5T57V/cgUTwcOpL6/FDE8Tzed6Cv1E7eUVD76dT/FnwWoXnd1
         aYGRYEpXsQP3d5d5YUYH6sMqxfj1Gl/zAQC0tlSEPoPbAemRPo1peftmKGfU85XSIqNc
         z6m0smDmxUDVPAj83qBuywjmjP7Y1wx3f6KEqY2gDveNEeytQiIpBd1fghJLvAnIKGod
         edwaP0OePBm+7zami3oSULLoxqqPShFfGcDzBE62k1G28DmHDfudkbfA4YDv8rnuW4wE
         3aZw==
X-Gm-Message-State: AOJu0YwLnFHVVkoJHSGIiWN/GIdJaIKfOg6vTTAn5klgx8/zXRghFtBS
	TG3hbONM54L1H/EyBZ1M6XXtSjtb632M4+u+fzeqvDRNoXpPvzYVMJnVc3sq5WQ3KU1L4U1yGsJ
	82GpX8U12Kf0Kzcj6afAW467YVT+6n1w=
X-Gm-Gg: ATEYQzyIJsnQ2krhoL9tcHYwQHTScX+lRqrDI9k6XZfj/q88VwTFi6vnIQlwpaM4GBB
	cXz/omNIIs9FcOWrJuMTkL0+efm4WgW12whJTUgzZVGRAonJsnzw7kV/3DJ2Hq42xc4CqoWAuic
	B1zoJuU59aYdvPmdi9QuAmhgIotNxURTO+TW1B+mxQHCCWF5thvLpOtZyAlpTbEvcuzl777nY5J
	sIO5LVqHGRUJNhUbwOr/wfoq0fo6/6dBBUhZki5eG1HvkgcXtqgxqHUo0dL3Ip8j4qAxWaKL9Gu
	/NX4vgXNaONWGkKznQN3T1wOPL/HqLlVqCBZQTFvw0lBLL2exo0ytuk/gfrjKy1CEKe1/Jq4f81
	qOHk0uw==
X-Received: by 2002:a17:907:c05:b0:b88:5158:d10e with SMTP id
 a640c23a62f3a-b972e1b75dfmr285621866b.21.1773290659499; Wed, 11 Mar 2026
 21:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311232545.18492-1-rosenp@gmail.com> <CY8PR11MB7134FC62AB39DEC3AA26DE2A8944A@CY8PR11MB7134.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB7134FC62AB39DEC3AA26DE2A8944A@CY8PR11MB7134.namprd11.prod.outlook.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 11 Mar 2026 21:44:08 -0700
X-Gm-Features: AaiRm50L8GrqFvM-8cKp3CbVyfWXKBxxI39QTyqzMo4HLW_-AN-ijV3wIqXam3Y
Message-ID: <CAKxU2N_2w=3Sh=1Ymkc48psUa7pNkFM5Ci4sR5qdXiPec6bQ-Q@mail.gmail.com>
Subject: Re: [PATCH] EDAC: sb_edac: use kzalloc_flex
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:\\b__counted_by(_le|_be)?\\b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 7:28=E2=80=AFPM Zhuo, Qiuxu <qiuxu.zhuo@intel.com> =
wrote:
>
>
> > From: Rosen Penev <rosenp@gmail.com>
> > [...]
> > Subject: [PATCH] EDAC: sb_edac: use kzalloc_flex
>
> Could you use this style of subject:
>
>   EDAC/sb: Use kzalloc_flex()
Will do.
>
> >
> > Simplifies allocations by using a flexible array member in this struct.
> >
> > Add __counted_by to get extra runtime analysis.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/edac/sb_edac.c | 14 +++-----------
> >  1 file changed, 3 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c index
> > 09d4e816404b..7b282dfd093f 100644
> > --- a/drivers/edac/sb_edac.c
> > +++ b/drivers/edac/sb_edac.c
> > @@ -364,11 +364,11 @@ struct sbridge_dev {
> >       int                     seg;
> >       u8                      bus, mc;
> >       u8                      node_id, source_id;
> > -     struct pci_dev          **pdev;
> >       enum domain             dom;
> >       int                     n_devs;
> >       int                     i_devs;
> >       struct mem_ctl_info     *mci;
> > +     struct pci_dev          *pdev[] __counted_by(n_devs);
> >  };
> >
> >  struct knl_pvt {
> > @@ -771,21 +771,14 @@ static struct sbridge_dev *alloc_sbridge_dev(int
> > seg, u8 bus, enum domain dom,  {
> >       struct sbridge_dev *sbridge_dev;
> >
> > -     sbridge_dev =3D kzalloc_obj(*sbridge_dev);
> > +     sbridge_dev =3D kzalloc_flex(*sbridge_dev, pdev, table-
> > >n_devs_per_imc);
> >       if (!sbridge_dev)
> >               return NULL;
> >
> > -     sbridge_dev->pdev =3D kzalloc_objs(*sbridge_dev->pdev,
> > -                                      table->n_devs_per_imc);
> > -     if (!sbridge_dev->pdev) {
> > -             kfree(sbridge_dev);
> > -             return NULL;
> > -     }
> > -
> > +     sbridge_dev->n_devs =3D table->n_devs_per_imc;
>
> What's the reason for moving this line of code up here?
__counted_by requires setting the counting variable first.
>
> >       sbridge_dev->seg =3D seg;
> >       sbridge_dev->bus =3D bus;
> >       sbridge_dev->dom =3D dom;
> > -     sbridge_dev->n_devs =3D table->n_devs_per_imc;
> >       list_add_tail(&sbridge_dev->list, &sbridge_edac_list);
> > [...]
>
> Other than the comments above:
>
>    Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
