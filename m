Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D7119DF6A
	for <linux-edac@vger.kernel.org>; Wed, 30 Sep 2026 04:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744195; cv=pass; b=dSM4AmAHvY7kAE50Eh0msw/lh3ETmWIR7AF35zMtAx/VvtOfMtgKSHyMv0kOUejbfK5Pkm2ZDFLdF525eRNSexKPIeJWXFk9P2o1Zo0RFc0YWtFT2oDKh+pMqvEZIjy+NXBE92LGZVd0pjtew42eirTGNqJ4flhqrQQPKZdia/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744195; c=relaxed/simple;
	bh=aijIq6MG49th3NxWEi1RYjXRzGo8e6tnPdyVZG7VoU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSuwvppCLlzGqwC4nZa5z6g6BX/GZMmyGUc1zPxgfZ4qzhPiJvJ6ysuh51ElNgMguWhUYaFq7lsoGCniuTYWB9rQD0CUFggwTs/EUb1pSHgZ4MOJV2xEfyn8BnLQWzQEmPmwWL5b4T+9+jBRAwQYRPJOoQ805FQS0nxs/dlnLL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsPfNluM; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsPfNluM"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4ab22370so4383969d50.3
        for <linux-edac@vger.kernel.org>; Tue, 29 Sep 2026 21:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790744193; cv=none;
        d=google.com; s=arc-20260327;
        b=NYBUCGuIKO9mDoDvcceUbuqCQdW2U05I+epSY8oDkc23tACvrbwbYF+r4yKE5/d4so
         w9+vSdRKv5purQNrdBC3fF756q7sQWkalYK4E3L9kfiXvJ3QgEMr95B1gyFuqY6moUPa
         dJMXqsotlpWYMHNUCHXUKf21YSbXuMtQKWBleh+Uji26l7teuCbHVzqdk6yeVupxJH8L
         huF/epHz5cY6RYxK6+GcvCBGSviOqinV5/XUMGpJV7TboYAJGvM98D1vadeucCMjI4xP
         P1ec+6mlmzui8xYEHe/SukeO2I4pUKGoSram8MeXmeS/cl92agUynjJA1EK09GmNCDyK
         Iu6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YazpLo8uOEsrRzgBDuZEHvPTChLlaZapwZA6DqRFIGE=;
        fh=wIOvMtAQR9Raqk/nnrt6jzHJQY35E5fGKkzYZDoba+M=;
        b=I+tp8XAOU1Ps7pNHpnDmoWaCFoM2Rtc8Q/kIPfnMJFXu+apSln3ERakPCUtguTFuxY
         wnE1LfPwF44croZmCoPWoWj8Ic4SIXCaC3m6NZ4hlgRN+sL2jBBqyLWC4qFxov+8phkf
         y43Zok/0MOeE5Yymx6FfZkLK+D9fmQK24aiqD2DMOKFeizKpdBhYjgekoXOzu4qYwCtD
         kzJ9Jw4TBJ7ANmiM/zrP9snVPPbSGASq3WiIHhx0ki7U+n8iyZ7sxl4OvfX00AMWenlY
         zm1fxFWMVHAf/7veskcUCvrl4mZ7ZkU5qYTF6cfqNJdgijlLxt9CwKirCoB7Ydq4KXTa
         0rbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744193; x=1791348993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YazpLo8uOEsrRzgBDuZEHvPTChLlaZapwZA6DqRFIGE=;
        b=BsPfNluMyV7VnbDx8bcRuJLa4SEFo0DgwXPjaEIuDdc0oWXf3kKnzF62jQE6biHBCH
         ATxkbkB8adjFF3aqLYM3jJd7zMMyOCn/2gbDlAw9qpHgcbPKC0yCOtT/xh0fyZpKCLyB
         hE7Jtmswmb0ySZxaORv2IoJb3Eax9+geI2nCpQrPxIzSdNLcdJFmRlgx2q+PtQxkDgbu
         RdqY8j7SKp4Bgnvf0I1rLEHWHb1rxZbTOF8+Vk1ynsN6OQVzQCiSrL5jIYF0F5Dbk+iR
         0cRkU66G08rWsPN5ECNwGrsR27YzbhwD+5HWxCOG7azhtfU15ApGqMOvTXE+cNPz/GIB
         JWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744193; x=1791348993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YazpLo8uOEsrRzgBDuZEHvPTChLlaZapwZA6DqRFIGE=;
        b=sBt+YUnMv+TrsgOkqxEqqEXCnyq1fiLTRHS4QP3SXFM5m28Mk4WKT3F28f3PuF2F+1
         h79ggKcEuz+J6lUcMYyuN9Etfkd660wzoDEsMpj1I531+s46y9p7tRcl6K81xqFFldgw
         YxNkhXYbG41EnN3f5rvDjWw4Z0Rf5/t+yquwhADg6mVIf2GU7CztAyAE4aAP0SHxUNJ7
         vm+QnmcCd0gfiExOPhDu262G+XOps0+h5lYiUZFfaOi8D9YsR9njYQo3/O5HJ19sqgA5
         gg/kC758dcPZNQnb6SfoJN/oxaHgXToduHrT8P/8x9BwkqY4O2YjLfEuEVf2KHbaaZmk
         smLg==
X-Forwarded-Encrypted: i=1; AKwUvByOzgHN8rkXp9UBQeJDAhfRN/8z3zrmHsvLmPe0mNqLX9dScUglZKJY6KZj9239vCqJUq15V2rIJ445@vger.kernel.org
X-Gm-Message-State: AFq9FYJg8fU3JCxHyNC+FQYTBWXPCeW1hsKR7ADqsKA9IzuzFwEAVsmL
	kPJIcNdTkod0E7mtgs0DH5KD1niobs5cxx1BLccYroi0idz4UUMTNmgSri3RQAOOmf1fbPEx7ry
	iHVpxP8wX8w5ya+s6JClsmR7w/A9Hebk=
X-Gm-Gg: AYBFou3AIVUQyRhrUHERA2vqxTujPAdH7RS9xzQB1rapPgwPsFwMe0HC3EKBFfL0H1m
	K9J9tR/RIRqyX9u24CI2vfeZgRPWOmp9F1cH7FpBBg+aAF1v+YZKSjEWuZH2Uuq1NXPnroSJkVT
	sF0194fnlXZqi1HCYsCsmWUrEYhIoU9/GqSRDcJbkEClFHhXQ1eKKGY2byd0K93EHsb6kTDD0Kv
	HMkLQp/1mYSuC4Y8mRz5bRc0Z4UoFRoytAOfQxQU9hFru89pctlzOpqtTGNBfzTle1fFYlFGWy0
	SASHfdzBxnH+2gY3wcPSL5OOYtVTy8K5sD6IQ68Fadd5fkIFFDyQAL4Ns0M0gqmSnrM=
X-Received: by 2002:a05:690e:4197:b0:675:39f6:9bca with SMTP id
 956f58d0204a3-676834a58f0mr102811d50.58.1790744193227; Tue, 29 Sep 2026
 21:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920055519.3778269-1-lgs201920130244@gmail.com>
 <CAKfKVtGZH8OaXp0WtJSD7AAQb8BSWg=xo+x9jj1sbjSxjEanGg@mail.gmail.com> <CANUHTR_yAgnZN05PBLae3DSk3xo0haLRRgHyKxswSYDE2tHgFQ@mail.gmail.com>
In-Reply-To: <CANUHTR_yAgnZN05PBLae3DSk3xo0haLRRgHyKxswSYDE2tHgFQ@mail.gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Wed, 30 Sep 2026 10:26:20 +0530
X-Gm-Features: AclHuK_5dLBTDCM2a4gpvqnnswpJIWECN6q0YsymVQT1CjxevikTIfBgbHvWtBg
Message-ID: <CAKfKVtFkZ-T==D2-3OJeWUsRAzCE7_YP9kW1dDA0d3kjVWfBFg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/versalnet: fix memory leak on device registration failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 7:45=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> Hi Shubhrajyoti,
>
> Thanks for pointing that out.
>
> On Wed, 23 Sept 2026 at 23:03, Shubhrajyoti Datta
> <shubhrajyoti.datta@gmail.com> wrote:
> >
> > On Sun, Sep 20, 2026 at 11:25=E2=80=AFAM Guangshuo Li <lgs201920130244@=
gmail.com> wrote:
> > >
> > > init_one_mc() allocates dev with kzalloc() and registers it with
> > > device_register(). If device_register() fails, the device has already
> > > been initialized and holds its initial device reference.
> > >
> > > The current error path eventually frees dev directly with kfree().
> > > This bypasses the device release path and can leak driver-core
> > > resources associated with the initialized device. The existing
> > > versal_edac_release() callback is responsible for freeing dev once th=
e
> > > device reference reaches zero.
> > >
> > > Call put_device() when device_register() fails so the initialized
> > > device reference is dropped and versal_edac_release() performs the
> > > proper cleanup. Return after freeing mci to avoid falling through to
> > > the direct kfree() path, which remains necessary for failures that
> > > occur before device_register() is called.
> > >
> > > The issue was identified by a static analysis tool I developed and
> > > confirmed by manual review.
> > >
> > > Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR c=
ontroller")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > > ---
> > >  drivers/edac/versalnet_edac.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_e=
dac.c
> > > index 3a06b41c1d84..db3bf5a1345b 100644
> > > --- a/drivers/edac/versalnet_edac.c
> > > +++ b/drivers/edac/versalnet_edac.c
> > > @@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, str=
uct platform_device *pdev, int i
> > >         dev->release =3D versal_edac_release;
> > >
> > >         rc =3D device_register(dev);
> > > -       if (rc)
> > > +       if (rc) {
> > > +               put_device(dev);
> > >                 goto err_mc_free;
> > > +       }
> >
> > There was a comment earlier from sashiko
> >  failure path calls put_device() with dev->init_name still pointing at =
a stack
> > buffer before device_add() copies it. That's unsafe in
> > principle (dev_name() would follow init_name)
> > >
> > >         mci->pdev =3D dev;
> > >         mc_init(mci, dev);
> > > @@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, stru=
ct platform_device *pdev, int i
> > >         device_unregister(mci->pdev);
> > >  err_mc_free:
> > >         edac_mc_free(mci);
> > > +       return rc;
> > >  err_dev_free:
> > >         kfree(dev);
> > > -
> > >         return rc;
> > >  }
> > >
> > > --
> > > 2.43.0
> > >
> > >
>
> Would splitting device_register() into device_initialize(), dev_set_name(=
),
> and device_add() be a reasonable way to handle this? For example:
>
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.=
c
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -64,7 +64,6 @@
>  #define XDDR5_BUS_WIDTH_64 0
>  #define XDDR5_BUS_WIDTH_32 1
>  #define XDDR5_BUS_WIDTH_16 2
> -#define MC_NAME_LEN 32
>
>  static int init_one_mc(struct mc_priv *priv, struct platform_device
> *pdev, int i)
>  {
> @@ -730,7 +729,6 @@ static int init_one_mc(struct mc_priv *priv,
> struct platform_device *pdev, int i)
>   u32 num_chans, rank, dwidth, config;
>   struct edac_mc_layer layers[2];
>   struct mem_ctl_info *mci;
> - char name[MC_NAME_LEN];
>   struct device *dev;
>   enum dev_type dt;
>   int rc;
> @@ -773,13 +771,17 @@ static int init_one_mc(struct mc_priv *priv,
> struct platform_device *pdev, int i)
>   goto err_dev_free;
>   }
>
> - sprintf(name, "versal-net-ddrmc5-edac-%d", i);
> -
> - dev->init_name =3D name;
> + device_initialize(dev);
>   dev->release =3D versal_edac_release;
>
> - rc =3D device_register(dev);
> + rc =3D dev_set_name(dev, "versal-net-ddrmc5-edac-%d", i);
> + if (rc)
> + goto err_mc_free;
> +
> + rc =3D device_add(dev);
>   if (rc)
>   goto err_mc_free;
>
> @@ -800,10 +802,13 @@ static int init_one_mc(struct mc_priv *priv,
> struct platform_device *pdev, int i)
>
>  err_unreg:
>   device_unregister(mci->pdev);
> + edac_mc_free(mci);
> + return rc;
>  err_mc_free:
>   edac_mc_free(mci);
> + put_device(dev);
> + return rc;
>  err_dev_free:
>   kfree(dev);
>
>   return rc;
>  }
>
> This avoids keeping dev->init_name pointing at stack storage and uses
> put_device() only after the device has been initialized. Would this look
> reasonable to you? If this looks good to you, I=E2=80=99ll send v2 with t=
his approach.

This is already addressed in the ongoing patch series:

https://lore.kernel.org/all/20260724171945.2812749-5-shubhrajyoti.datta@amd=
.com/

Please have a look and let me know if you have any concerns.
>
> Thanks,
> Guangshuo
