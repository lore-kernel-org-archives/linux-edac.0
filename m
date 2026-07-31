Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A28544C4FF
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518083; cv=pass; b=iU2Al/89ObQPXYKquymzfyl/nu1ZlDrSrHtCXL8xRJUL6EpS/aDeaei2xGgYec3p2h1cUYBNM+J3ionIm5FhHB8kCuRW0bGcPFAAVdtI1ZPS62aemufNebr2RLA0Up19rVx1otECb+02/azZrVxRt/nhIhfR//j4BLkgs3jwDH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518083; c=relaxed/simple;
	bh=QesLJjfO+CQSI1uPEdZ3w/rry6iX1InymxI+UL8wQKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQ8joaWg26LVl2x9gR38Qu9/BKkw1x0u2TFdjJCp0TV133H2Ty5KBXJ6o3mnR2QaPHFUtfxc1wWVbcr2bwOGDn8rurhOxMtfByW4pxgvZgeDIyd9FxG5VFOfhAOBJOalpI2uOlhe5jnLmdOb4uZ/OSQNv/R8jPejFiPXNAelo7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLay89PQ; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLay89PQ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a08a2b7e5bso680141a12.1
        for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 10:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785518080; cv=none;
        d=google.com; s=arc-20260327;
        b=YKxYkdU3F4AEwI14mv1eRkkuN6jaNYts6MKWhrcGka9WFzsFR26EPBOa+6Hy9aqXfD
         oXi4RVKJcmyY5IP3CxT5bQT5MIf2s6Z4T6ZoXxBwj0vGJ3ZhfNwZeRvdn8/0bjRT6oeZ
         kbZoBxA2LJqbARlVxI5j9yzP5Szy9LmwYIDfOnhsPni88ujzzhkzroK+xc8XrOpTCGd+
         4fY/xNziMd6IyAkVwgYDkwJEaL9fhSIqWo7wVJqTAT239xLholMsRTK7v88NXEPNJMRt
         HualVXKZqJ+c+kqI5I/CE3wVtBpn6/94FvqVPQbBNSwsZsBsa8IbDPm5m7mHlQbPIk0q
         YPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHfwJhTJcZEKfM/V12t6FGxcs59B4/LW6Z/5dwS+YL8=;
        fh=TcIsI/cozRGbBRUQl5jQmu2WhwKs96U2DtE7A8RT8Pk=;
        b=g5u1n4TbkmGA7QZHxxTbKdZuUl5gqP/7erOcsKdUGJjCaWPm0NBtOVIlZ+7M+Z5YI5
         vD5wLKlyCGNSL/tmb4vZd0v9PRVePJuYKDr3w8YI5G0dRpYvsXvmgNZ36InsVFrsr5u5
         Iw5Wef6PIGmHsFF824RxcKDjFPWcMm/gIUAbcYKw3TwfWqr+VeOahHqLk6vG/7sABRxg
         wRYbFVjTbQQNqH4iJJ7N/iqmjc6o5LE8GWm4l9tL9kC4dsNbYQW8RJJsZE2nJXott3rm
         0my8AaF7YjbSL3tyLbLjEZ9ysVHTw+0ZSZp4ftnMpgDpQuA78Mw8q/COgCPyGD4O9Hqj
         PazA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785518080; x=1786122880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SHfwJhTJcZEKfM/V12t6FGxcs59B4/LW6Z/5dwS+YL8=;
        b=aLay89PQk1Xo7AOdGxqcMsr6fY7bC8ptn6t0PRW3kbPdbxmy/TbdiqWiK1WYBVQ0M/
         cS9CPX77Zdn9V72Ioocjj4bchZ06ED/G0qcSjbDEP4B/Ag3V8t7fTRavaubUZXeZlqUp
         wvwUhIT2Fq6dX8j1oZpLquGfU6P+8jXbAaWXC+tYIkO7oSEuWeZqeF8y5+FJlCEAzXO6
         DM237kqy8ht9DpoyjVKLPJfbpVscl0WXwq2KD2K9+7gO1LTQX/Wb4margXYQ1kS3qNYA
         MdbFbHCPoahp6b44LVnwrxsRIN3RNuUenfkCsT2NAmTRe28JOjoyjyn3hINBCnyB3NbB
         HyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518080; x=1786122880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHfwJhTJcZEKfM/V12t6FGxcs59B4/LW6Z/5dwS+YL8=;
        b=gN/F6kWO2TfIKlH1SphLrjO6EMkMuxcvhK4ZSI485NohU+VWNkYcVv5GdYTJxV3OmM
         Pk/oqYonzvdUAqOs/UDgUfh1gz5uN5WhyXxSzZ2N168s4B29nLny8v7hbCftDTfEr+p8
         txDvV0FMRQ6tGitMql+BQLksmybDCdwPAS3oPmh9By+AqZb/ZaesCOYYbnX8w+FFXaSE
         R14POuC5YbzCGS6md38D/gkRfz376XczpTANydhpuIjBSHZHELHdI89wqBDGhXGiYCeg
         zVaqM54k/ovlGzjyuKFJcEyXXx+4tQ162bsKQoVzicP+rC77Y/vBaL9r3PzR5e1ywY3W
         BS7g==
X-Gm-Message-State: AOJu0YzeLxN8LDtu4l8ICKauOfIKZ0wF8AsjaFZYgH+t+V/xuVLCsXoO
	PTZV9GeZc4alGHXT9QBknqT60dnkPs/VKnjLLDOtRLU/FVuELML5LnOyV0P4GTZ7voxlqD6mjWD
	hlc7jczwSYdie1j/97CXUQRqdM4JViqU=
X-Gm-Gg: AR+sD13PT9NfHoUNWZmot9rlD9HqSXdGqlRj4gQblUg2Dq3I0JRvnEpoqThlG+zSieY
	On4ByoU4CC3wqW444XWqErvf2aW8mXv4aLl3Vjs+leqLNEKl5CELX8IWcvPVBrpy7POkBOw0ABq
	+Xt93acAgFjco0MYFp5fW9fG817hq3GumbuA+W0bmXHXronkIA8NcSHDkYxk6tVk+XhHe80C3Vw
	rkfV1/MbFwKj0HtMiWpqFR08/ZDwWoD3jc44tNdEdf76yvT8g7uCOlzCBOzUS1O6k5mN+QYetzx
	wkK0fT+KXyFtGn9WYoLGRy2ssFz/v0HyiRD+DNiwfMz9BxIbMWFp/LDOROfylsy8iPSESYR/nxJ
	lSuTxt7s08Us9sSnguPNtXmws6HW/CaZgt+RqjKyEM/N9MbKDhCn+BAaQFIqoi5T7gy4yW4WgYq
	2fmPFrvnilpU3zOrdfKrgitlNsBecFRzJR18uzPE1pZ1uZIm0/pwOLsbQgZcytSnwvOGKLtebMP
	RSLzg==
X-Received: by 2002:a05:6402:20c7:20b0:698:8857:9ff0 with SMTP id
 4fb4d7f45d1cf-6a09b1428f3mr1180287a12.16.1785518079567; Fri, 31 Jul 2026
 10:14:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731012130.1212640-1-rosenp@gmail.com> <20260731012130.1212640-2-rosenp@gmail.com>
 <amy5lCeSFyvmGixj@SMW015318>
In-Reply-To: <amy5lCeSFyvmGixj@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 31 Jul 2026 10:14:26 -0700
X-Gm-Features: AUfX_mzFrlXDrgTTIRJCLGV2of7qZMoZSDe2mpZqZ_ZmRsSrWJc1TipvLntE12k
Message-ID: <CAKxU2N-dbMD-F8A16+KEkf8Hvq4=m2YO7X4jx7Q9zEfqGmbzkA@mail.gmail.com>
Subject: Re: [PATCHv2 1/3] EDAC/fsl_ddr: use devm_platform_ioremap_resource()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, York Sun <york.sun@nxp.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 8:05=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Jul 30, 2026 at 06:21:28PM -0700, Rosen Penev wrote:
> > Replace the open-coded of_address_to_resource() plus devm_request_mem_r=
egion()
> > and devm_ioremap() sequence with devm_platform_ioremap_resource(), whic=
h folds
> > the resource lookup, region reservation and mapping into one step and r=
eturns
> > an ERR_PTR checked with IS_ERR()/PTR_ERR().
> >
> > Behaviorally equivalent with respect to region reservation: the driver
> > already reserved the region, so the non-overlapping reg requirement was
> > already satisfied. Drop the now-unused linux/of_address.h include.
> >
> > Remove devres stuff. Not needed. devm is already used.
> >
> > Fix a mistaken return code of -ENOMEM when PTR_ERR should be used.
> >
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
>
> Need change log here.
>
> You missed my review-by and tested-by tags. If you delete it by some reas=
on
> like big changes, you should said here explicit.
I changed some stuff yeah. I had them added but removed just in case.
>
> Frank
>
> >  drivers/edac/fsl_ddr_edac.c | 39 +++++++------------------------------
> >  1 file changed, 7 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> > index 2a545e5812e7..3745eec67335 100644
> > --- a/drivers/edac/fsl_ddr_edac.c
> > +++ b/drivers/edac/fsl_ddr_edac.c
> > @@ -22,7 +22,6 @@
> >  #include <linux/gfp.h>
> >
> >  #include <linux/of.h>
> > -#include <linux/of_address.h>
> >  #include "edac_module.h"
> >  #include "fsl_ddr_edac.h"
> >
> > @@ -495,13 +494,14 @@ int fsl_mc_err_probe(struct platform_device *op)
> >       struct mem_ctl_info *mci;
> >       struct edac_mc_layer layers[2];
> >       struct fsl_mc_pdata *pdata;
> > -     struct resource r;
> > +     void __iomem *mc_vbase;
> >       u32 ecc_en_mask;
> >       u32 sdram_ctl;
> >       int res;
> >
> > -     if (!devres_open_group(&op->dev, fsl_mc_err_probe, GFP_KERNEL))
> > -             return -ENOMEM;
> > +     mc_vbase =3D devm_platform_ioremap_resource(op, 0);
> > +     if (IS_ERR(mc_vbase))
> > +             return PTR_ERR(mc_vbase);
> >
> >       layers[0].type =3D EDAC_MC_LAYER_CHIP_SELECT;
> >       layers[0].size =3D 4;
> > @@ -511,10 +511,8 @@ int fsl_mc_err_probe(struct platform_device *op)
> >       layers[1].is_virt_csrow =3D false;
> >       mci =3D edac_mc_alloc(edac_mc_idx, ARRAY_SIZE(layers), layers,
> >                           sizeof(*pdata));
> > -     if (!mci) {
> > -             devres_release_group(&op->dev, fsl_mc_err_probe);
> > +     if (!mci)
> >               return -ENOMEM;
> > -     }
> >
> >       pdata =3D mci->pvt_info;
> >       pdata->name =3D "fsl_mc_err";
> > @@ -531,33 +529,12 @@ int fsl_mc_err_probe(struct platform_device *op)
> >        * Default is big endian.
> >        */
> >       pdata->little_endian =3D of_property_read_bool(op->dev.of_node, "=
little-endian");
> > -
> > -     res =3D of_address_to_resource(op->dev.of_node, 0, &r);
> > -     if (res) {
> > -             pr_err("%s: Unable to get resource for MC err regs\n",
> > -                    __func__);
> > -             goto err;
> > -     }
> > -
> > -     if (!devm_request_mem_region(&op->dev, r.start, resource_size(&r)=
,
> > -                                  pdata->name)) {
> > -             pr_err("%s: Error while requesting mem region\n",
> > -                    __func__);
> > -             res =3D -EBUSY;
> > -             goto err;
> > -     }
> > -
> > -     pdata->mc_vbase =3D devm_ioremap(&op->dev, r.start, resource_size=
(&r));
> > -     if (!pdata->mc_vbase) {
> > -             pr_err("%s: Unable to setup MC err regs\n", __func__);
> > -             res =3D -ENOMEM;
> > -             goto err;
> > -     }
> > +     pdata->mc_vbase =3D mc_vbase;
> >
> >       if (pdata->flag =3D=3D TYPE_IMX9) {
> >               pdata->inject_vbase =3D devm_platform_ioremap_resource_by=
name(op, "inject");
> >               if (IS_ERR(pdata->inject_vbase)) {
> > -                     res =3D -ENOMEM;
> > +                     res =3D PTR_ERR(pdata->inject_vbase);
> >                       goto err;
> >               }
> >       }
> > @@ -637,7 +614,6 @@ int fsl_mc_err_probe(struct platform_device *op)
> >                      pdata->irq);
> >       }
> >
> > -     devres_remove_group(&op->dev, fsl_mc_err_probe);
> >       edac_dbg(3, "success\n");
> >       pr_info(EDAC_MOD_STR " MC err registered\n");
> >
> > @@ -646,7 +622,6 @@ int fsl_mc_err_probe(struct platform_device *op)
> >  err2:
> >       edac_mc_del_mc(&op->dev);
> >  err:
> > -     devres_release_group(&op->dev, fsl_mc_err_probe);
> >       edac_mc_free(mci);
> >       return res;
> >  }
> > --
> > 2.55.0
> >
> >
