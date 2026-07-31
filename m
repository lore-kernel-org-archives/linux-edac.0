Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336051FF1DA
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 00:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785456987; cv=pass; b=lkdTYZgCmLNJD8Va2ZGXxwmfaoMoyJW9FaxOtsmz+ZtexRHqlTmDBHBkHshhQEbiGIIQbuPblrmh30kZvx4JX0dkhuI3pQcZAm5y/28acsWJiXI7+cqrvCl3FuP54ALcuDIPqxh2uEqg8wN4kOApuWg7EEawPrTDcf/eRnYvZQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785456987; c=relaxed/simple;
	bh=m+RIhUcUiECWtowX4NFUhGF+iwm2nJjbh5MJg56QYC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVHJW6uWGDRl0FMiW/NlDRXdShp58vraVq7sJvULhSzHweDnL39nBGn7HwDwwL7mKgdTPlRkzWE2oEFm0rFSb41GiDmoXueBLL904MF7I+jZ6YAed+JAYBS2TgdSyggl1IuonEi88v72h9nN+0D+OqFH79uw+2aW3jMrdC17wFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=co+rjH5K; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="co+rjH5K"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so656967a12.2
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 17:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785456984; cv=none;
        d=google.com; s=arc-20260327;
        b=mGjSNh2pYI1uV7LAW5Pf+YTOwLvMnpybwS2A+nvng/WMHVWkiJhGqhqUkXXqW7b3Mr
         Tf2lepNgjLPlKF5OcpGaMEonIje1ddQrNrlRphgioVu1m671cg9F98+g3ajbUmbhhkWk
         5EBi41tCCNFAmyNPZPSVsQdgQJutkKCSfCrTO3dWaX1d1/sll0IIBZcRleHdkUClSgd+
         WDy0wFP4o3wa9Lv2ENuJlOr5Kx3V0ZmY3PkD/qVWAEoEigPw2K+XLWTVTQ57OMV2vOie
         ScgFKD/flofr+dmyCsKRtH1tUYCisaLErQNNZetWMHUyrYxV0dOwdLDB0d653lNtMfMF
         e5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pSNaYSg9MrVtvi1xOd7cDCxl8yZ1wT4RNsxmp0nYhxA=;
        fh=bnSQaVeYIPQ6GeojfY6lMs886t5AUhOBiMVwOxrbQEE=;
        b=tDSKYxpsRHAxmF4xoVd8jFH5ZMy6a77whMfRGRkd3BSpNGkH7FnlTDiuTMIhxR2WFF
         /6lnQAZYD8FArEcykkXDfyDGuJWjS1v5uY2t8tlNX2DLl6nXuitxy6KWnu7MSuNqmXu8
         5S2zqpioiquBSW7Find5bVk084e0XNPv7cdRC4rMVlxwRQEkReArqwt8satHZKqS+7e1
         kJibx8hIunN+eUOQ8u9kImRxRD2gWXx5b5vnK4hwQZFw85HTU7gBCWdcXPaZP5sbd/VS
         BSOzRjRJ3kfaJeDrVl12a2o2oI+aFWevfYD4yC15ZBio9xxYbZkkAhAmwYHSsUPi+/QJ
         FzZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785456984; x=1786061784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pSNaYSg9MrVtvi1xOd7cDCxl8yZ1wT4RNsxmp0nYhxA=;
        b=co+rjH5K9uOoZkZf3SyJVVuVXmrSH6Xjo8l0TF0pmlio7mAmdIUoYXcukZLwTx1T+n
         g7G71aYEryYtWhFxmTmQpcXNYv5emo+LgUzsuo7NjjxnXcs/o9tnb6vMVUAWKimQ95LN
         FD0OyXgXfxukOpqnaeW4L4iRfe+NLMNBc0ME3Jpdu6Gdw5oKyoXXsdwm03WhmIwQhdvm
         BuTTeiLHotlqoUyUbPuBNNHAX+miuHJHDHhmGB4D3n9b1f4lB4/U0WHB1+aG9caePnWe
         UwrhmNBGRVCnJOse7xJLSlNFFkAN8dJcM7kI7WlerFzQF6gKF9VzdFmKanoKLWNBw8Nu
         AheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785456984; x=1786061784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSNaYSg9MrVtvi1xOd7cDCxl8yZ1wT4RNsxmp0nYhxA=;
        b=mYAWN5SKR1X7CyncPAmMNi62o+6POsHFD7wq+QKqS9avsaXirfD9boOml7xtWQgGjc
         A/Bz7qhkEQqEbnCavm0mqlFXr3IL2+9awSRH50Fuvf9G2rscgEnvSgahJxpx0zFXl4Vu
         enAmbG/yj2Vk80VQQG75f+wbj8e593T+r0iK2UUuDmNJz+CARqOUUOzB/aFnYOvIqaJZ
         FIIHZBF+muvKXE2Bg66f1xrEuWplb61SVUFYmxB9VWUe8CAtxfKJgHsOjImAJuMbe9Gu
         Qt9idRa45yEYpzqRRAoVX4XQUXvQAM/Jvo61kEfyTwb/olaTYc6J9oG5z03vMFXTmlRn
         jhIQ==
X-Gm-Message-State: AOJu0YzZsR+4dNlsinCII6J7wLdWQL17ldUj8VH5HTiezJyk4P2xdWFX
	L+IrG9AKOeseHU1MHCCkW0DQE5+GsNyURm3y/zXfybjQr2x96z3Baqh60iG2O/ItRidcOog4seB
	++gFq2OZnm+tnC32HIK6gXRR9yigbUsw=
X-Gm-Gg: AR+sD11c/3ce0BlODBuGQr6/FcBsFm/X7FSQ0KIhUGcTjYn84EDrwl6GaHKBiC79lbE
	2ZB4hLwNpYu+G8ec3mDZv35qHhibGH0cr+zOl+r20T3scLq7AwmBas79CgFahV4YpsqKlXuIW87
	2dsCr4YCMarzVKsAc7X7yRVHPHnTlFcyVrr7cQUjhc6Lgfu18yIxSEqVD7fkF9f0i68G+CZ38w8
	3v44B1Z/WyIVedKycs/S8GdzvB9pKY2OwMG8jGvOEbulbySqbUeGVHAYSNbMDXHTEah4OGEByWy
	8hmFg58IX0VN+Ik9hMyF0COmZ14elrHqpITB+LrbUIyTh9zqdNYFmd9m1E+tU2AVg7I1R88culA
	bwp5GORs18UJy0x80SpVOJcw9IF2adQ33oMfniE+C9Gj861ZFtRV0S9j+zcT7+Iya4RYHA83lZQ
	zCbKISczCiEJvYJYPC3mXnbkiirwpQlZWi+S5KqR2poYysZFCYIKBB2ys=
X-Received: by 2002:a05:6402:5006:b0:6a0:6a8c:b2d9 with SMTP id
 4fb4d7f45d1cf-6a07b839c2bmr2250071a12.41.1785456984117; Thu, 30 Jul 2026
 17:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729012320.616174-1-rosenp@gmail.com> <amucohB5GoaocIC4@SMW015318>
In-Reply-To: <amucohB5GoaocIC4@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 30 Jul 2026 17:16:11 -0700
X-Gm-Features: AUfX_mweI0EuKIZYjIYzXFTotTDrv9cdQVunI3TADKyMhjIisH5R3DLrFlpQURw
Message-ID: <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 11:49=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Tue, Jul 28, 2026 at 06:23:20PM -0700, Rosen Penev wrote:
> > We need to tear down the irq before edac_mc_free() to avoid a use after
> > free on teardown as request_irq uses mci as dev_id.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/edac/fsl_ddr_edac.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> > index f4cc89b26954..f1ddd1f47f2a 100644
> > --- a/drivers/edac/fsl_ddr_edac.c
> > +++ b/drivers/edac/fsl_ddr_edac.c
> > @@ -601,7 +601,7 @@ int fsl_mc_err_probe(struct platform_device *op)
> >
> >               /* register interrupts */
> >               pdata->irq =3D platform_get_irq(op, 0);
> > -             res =3D devm_request_irq(&op->dev, pdata->irq,
> > +             res =3D request_irq(pdata->irq,
> >                                      fsl_mc_isr,
> >                                      IRQF_SHARED,
> >                                      "[EDAC] MC err", mci);
> > @@ -639,6 +639,7 @@ void fsl_mc_err_remove(struct platform_device *op)
> >
> >       if (edac_op_state =3D=3D EDAC_OPSTATE_INT) {
> >               ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> > +             free_irq(pdata->irq, mci);
>
> here already disable hardware irq. Just call
> synchronize_irq() to make sure pending irq handled.
AI disagrees with this suggestion:

The reviewer's suggestion to just call synchronize_irq() instead of
free_irq() is problematic for two reasons:
1. Shared IRQ: The handler is registered with IRQF_SHARED. Disabling
the DDR controller's local IRQ output (ddr_out32(..., 0)) prevents
this device from asserting the IRQ line, but other devices sharing the
same IRQ line can still trigger it. Without free_irq, the handler
remains in the shared action list and can be called with a dangling
mci pointer after edac_mc_free() =E2=80=94 the very UAF this patch aims to
fix.
2. free_irq already synchronizes: free_irq() internally calls
synchronize_irq() after removing the action from the descriptor. An
explicit synchronize_irq() before free_irq() would be redundant.
>
> Frank
>
> >       }
> >
> >       ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> > --
> > 2.55.0
> >
> >
