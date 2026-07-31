Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE0437AA87
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 20:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530384; cv=pass; b=DEw0cSP1Klh3GWWaSVxIdwm0WOSOa4B3QEsbFyeO5O0FDoQnj/eRiy0gjGRVCnYJ7qRen/Onqx0A9Iy9gb7WCCA4TUnZIGO0Kax7OxRzO7rZwe98j82aNsYDCto+vNjcALThc49Nu/zaOmooawqybfvPsGJZK2b2PwgsqGsA2zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530384; c=relaxed/simple;
	bh=H8MZFv0NlxX8AAFiW92wo8pS7F9Nxis4TWuHY0ym0Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FTxm/C0f25EWC+Byqd71YKRILV4YCAoKvHy2b9pjIr++6UN+dNfikkRlY4bOgCAO1xGlbJ4Qxr5pTgr7wTYmwcY0iaSNHmKe9w1o4TIHLWnbiojsPQRGCTMzGiHmXIDDoxuJqsf9Ksf6oRIRDy+a8J4VgDJJT0ltxI5ZqOfZvaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgVTRSk8; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgVTRSk8"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so2201449a12.2
        for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 13:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785530380; cv=none;
        d=google.com; s=arc-20260327;
        b=e5muNyQuQFMScTqpaEQ17C27JYY5xAK16r2jMPrxO8HI6PSjBef3W8DiNnXz4Fq7v9
         sqcycTGwENIbqde2voezckNSTJqxcuHpapT+WgY8TlisS0KhFTf8FTIdtdD9yDrcsW4X
         d8c4MwjH7whQgaWpWi4QzJ2vWTHdTkjXrj6G0aissY6N2OwxHQ3O4cC34K+WEEhuVxfJ
         yzZfIAGhFTNpiJkYGTFsgwRACc97M8hMMPf5pfxizJUerrTfa0CnUkK5XPp14ilRiNFR
         KcsLbghZ5rUiqLoVSlDhQK3srDe1tvItT6Kdhkp2Ck6nsNY2BMLL/bN7NI5qURE3Q7YE
         Tfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNr3QEOyUa22hJiDCuM7GWGwzbMpwlCTnE3ShI9qpY8=;
        fh=TcIsI/cozRGbBRUQl5jQmu2WhwKs96U2DtE7A8RT8Pk=;
        b=p43dwtN3gov6Ge4gXn8UQ2hyAIvQMT05v7wDtQJtuSUU0ioRgMPdHIIfNSCpNvcNTZ
         tpZgymzZ4/gFfnj1T0B4zNq/DbfeE8KsHJsgZeaxXswHWHrGbo+kx0vJf7nGAWW/6E84
         ixkUi3CASBYtQZSgEMB3yke78oHk+Be1KKRjAjdRYk5iArldFt3ggVDqAAOx89LBomEL
         RDX0d9X92d3TZAf08mG92/GzNDR9+cSIOva50p6OCow+9+nxmDcskPM96FcR9+bfP3+h
         cOx7F18oNwaMSrdvOmvZ9p5m9xGErIGKQPVIHZdqJwP/2bex4LVk/3DbZ/lIsnQNeMlK
         2uwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785530380; x=1786135180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNr3QEOyUa22hJiDCuM7GWGwzbMpwlCTnE3ShI9qpY8=;
        b=WgVTRSk86XWjaVRVKuBPfB+LxShFdh/CxBt7dZzS0a4dotLfSKld5gwEPGtkN5Og4c
         DaREaGo43BqoD8CJ/xE0AihYleeP5qP/Ul6fKuqesXLtSc5z1IOLJDbEEXrkWI91WQhS
         HlaOsV3CRvr7oCsvY512CDgTCa+3Prg/BmLOVBbUoDLVSQe4Dt0HanprB2qz+azXEycO
         Z4JvNPxTAzfvMACVrXSmQtL4HH4E+I02Tm6ItFUGccpydhllRs/DT+CMsmfme53oFSZR
         V6415VZYebBtMaCLXE9qKhzj/KcQUEWbMAX2DER+q74KQQg0bcQG4Cn49uDNVwB0SKJC
         BJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785530380; x=1786135180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNr3QEOyUa22hJiDCuM7GWGwzbMpwlCTnE3ShI9qpY8=;
        b=Wp40tR2BNxTX7HRXz2yd34RMspfrAOLUOl5A3AD4YodUnV2n8KlIm1hzBwFunbMLun
         BjUHivAaLF+HDyByB0r/wN+69G9i0mc6iemteWWwMp0mU2Pq8GgiJNhN5JoccCHetmUO
         o12/u3LD+P9oLx++AbJdnLnNeMKphv5uIu4+k7YfIYDplImWDqNzaX4XesjiQjSEoQop
         KgkEOapSYovtdlw2aVueKJWK7iFhXrmsKMMyQ6+zFN86XtVJalgNr4JZYe2nZ0faPWbV
         z73fLzSYLZZbcoYZUwXC7P9AUTyXZvi7XXccCxarpAu/hg2SJnQoeipiGyGsZLkQmN2m
         omcw==
X-Gm-Message-State: AOJu0Yw34fkRpGTJQCJJSEFk+Q3pPsvq1/FvSmERfodIUkZtUlW7UaRn
	kWkBSNn1Z0AmHhsZRAIUuEedZ8rqA401zWcKnY57YNUY6pjIovrSr7smm+GaCnpwihZo6x2bRTo
	1YZibesGLgGeVsLdBxzrE6kmscxWLAh0=
X-Gm-Gg: AR+sD13UTHHaY/qptgAIfWtmkyTIzbCHfYcCyWWqJUipAcvk8lk0Hw6JKO1cTfo0ndm
	/3Z5/wBmLxbf0hSHi7/7ydcCcl58PZ22sEHa8CptyxvLyyTnvdHk5YKTug3AdEcCSgg5ibS1fVL
	wTTISCI3Y6ncVmaPgkpF5teXjYBvNqas9JBtI2x54xs+Bj0VqPTqAPTlszNILG2usUnzvBPmKkF
	MCm8x/dOgUQnrVvHRCHSmxwMZ5MmZ4eatbof8tJ7ZcHGnSLHYoKQpid/zmcPIF4e7UupZ4oYY+i
	jHfLJMnsMbVcZVDNRxWVh1TdEUiBVtdK37BX9kb1IaypsG9+7ywMejybvNF/r3OmMxd3oKCayCG
	fTT+7cnkrmFeDJLLX0zL5vw6gb6y5OBbgUHDSyMxyysFQTwVk6ErUz9EVMEFwcCHeOQnqlIcVx6
	5A+yO9FtuCzK3Izxai5fzwQWsZKb1YkDfWy0GqhVs9Fyn25OUca4V9Ofw=
X-Received: by 2002:a05:6402:40c9:b0:698:56e7:8eb3 with SMTP id
 4fb4d7f45d1cf-6a0a7c72578mr560606a12.14.1785530380407; Fri, 31 Jul 2026
 13:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731012130.1212640-1-rosenp@gmail.com> <20260731012130.1212640-4-rosenp@gmail.com>
 <amy3yueMqBFVCz3T@SMW015318>
In-Reply-To: <amy3yueMqBFVCz3T@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 31 Jul 2026 13:39:28 -0700
X-Gm-Features: AUfX_mytarzAXc_eavVZLWZPAYjlwauapJxxWfxCCdbUg0_v8GNzgaIDe_yz5Tw
Message-ID: <CAKxU2N_+tBqqngTepnTQy7his_2UTAAc36cMjgfZsOG94ryt+A@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] EDAC/fsl_ddr: restore MC error registers on probe failure
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, York Sun <york.sun@nxp.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 7:57=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Jul 30, 2026 at 06:21:30PM -0700, Rosen Penev wrote:
> > fsl_mc_err_probe() clears FSL_MC_ERR_DISABLE and, in EDAC_OPSTATE_INT
> > mode, sets FSL_MC_ERR_INT_EN to enable error reporting. If a later
> > initialization step fails and jumps to the err/err2 labels, the cleanup
> > only frees driver memory and does not restore these hardware registers.
> >
> > This leaves the memory controller configured to generate interrupts whi=
le
> > no handler is successfully registered, which can cause an unhandled
> > interrupt storm on the shared IRQ line. Restore FSL_MC_ERR_DISABLE,
> > FSL_MC_ERR_INT_EN and the SBE threshold in both error paths.
> >
> > Do not pre-initialize orig_ddr_err_disable/orig_ddr_err_sbe to 0; the
> > err path must only restore registers that were actually modified.
> > Split the error labels so early failures (before the first hardware
> > write at line ~~580) jump to err_free, which does cleanup without
> > touching hardware registers. Save orig_ddr_err_sbe alongside
> > orig_ddr_err_disable so the err label correctly restores both
> > registers, avoiding stale bootloader state clobbers.
> >
> > Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=3D1;
> > drivers/edac/fsl_ddr_edac.o compiles cleanly.
>
> You can put this after ---, this is redunctant, every patch must pass
> build.
Will remove.
>
> Frank
> >
> > Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85=
xx")
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/edac/fsl_ddr_edac.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> > index c505fb268474..139277c4e2f0 100644
> > --- a/drivers/edac/fsl_ddr_edac.c
> > +++ b/drivers/edac/fsl_ddr_edac.c
> > @@ -577,23 +577,22 @@ int fsl_mc_err_probe(struct platform_device *op)
> >       pdata->orig_ddr_err_disable =3D ddr_in32(pdata, FSL_MC_ERR_DISABL=
E);
> >       ddr_out32(pdata, FSL_MC_ERR_DISABLE, 0);
> >
> > +     /* store the original SBE threshold */
> > +     pdata->orig_ddr_err_sbe =3D ddr_in32(pdata, FSL_MC_ERR_SBE) & 0xf=
f0000;
> > +
> >       /* clear all error bits */
> >       ddr_out32(pdata, FSL_MC_ERR_DETECT, ~0);
> >
> >       res =3D edac_mc_add_mc_with_groups(mci, fsl_ddr_dev_groups);
> >       if (res) {
> >               edac_dbg(3, "failed edac_mc_add_mc()\n");
> > -             goto err;
> > +             goto err1;
> >       }
> >
> >       if (edac_op_state =3D=3D EDAC_OPSTATE_INT) {
> >               ddr_out32(pdata, FSL_MC_ERR_INT_EN,
> >                         DDR_EIE_MBEE | DDR_EIE_SBEE);
> >
> > -             /* store the original error management threshold */
> > -             pdata->orig_ddr_err_sbe =3D ddr_in32(pdata,
> > -                                                FSL_MC_ERR_SBE) & 0xff=
0000;
> > -
> >               /* set threshold to 1 error per interrupt */
> >               ddr_out32(pdata, FSL_MC_ERR_SBE, 0x10000);
> >
> > @@ -621,6 +620,11 @@ int fsl_mc_err_probe(struct platform_device *op)
> >
> >  err2:
> >       edac_mc_del_mc(&op->dev);
> > +     ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> > +err1:
> > +     ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> > +               pdata->orig_ddr_err_disable);
> > +     ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
> >  err:
> >       edac_mc_free(mci);
> >       return res;
> > --
> > 2.55.0
> >
> >
