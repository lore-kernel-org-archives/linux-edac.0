Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAAA37AA77
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 20:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530541; cv=pass; b=VqnLbTEf/McX8laESsinv/q9/IDFS3RA3vkfNsSdyTVOAX0BY2WLAxntcCkipdPP6ufpHZsdnK+f1U9dGBo7uDZIWVYWYFm4OOfqDr/WLjKNh/BNoikL8R2mIjEv1zDGDziGkZTJvVoFbAIaam6ni351lOnOESrWImRavIMZ5Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530541; c=relaxed/simple;
	bh=7vtKbsGW/x+aEcUG/DByJMD5kHjm3wDzypG6yIAZ2mM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8C2pnFgwgk+8/6kOuydR+VdQcIzyRopIBRw0Pbs+rEhL7G45a5ejgPOU2ztfI6AJbllq9bHhwaH30/BT56wAGTsJ05orBsN7riCn1SGVNIcADStqFi87X+XjiknAWLNAri6+RFiEEP8mMsGqCjdA0rabU97nme0HW/KUvAyVpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uyvgz1W9; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uyvgz1W9"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a08a2b7e5bso1046351a12.1
        for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 13:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785530538; cv=none;
        d=google.com; s=arc-20260327;
        b=QrxvcTK2Sdyn1ULuHFTkk7qVpZCqzvDdtmoMPWm4ab1Lrr1bhDCTW4wLrjtUYvBQVm
         h6GxnmvTtA/XSPc38JfXozPlJ2Y/ycZaAjJzOVeYz3AnXAycJK7oihlc5ahZKkRGTEay
         mO73pzOGZLhgEqTUrJvC4nWYr7e5Wvhd6XZSpTeLVF7DZvqV4qVEWFYvl99tqWmXLDF+
         EWqpBGztDk/p8yTsI+nAH36ymCkz32lQEsXRTkHdt8c84ouFaQoWUBJ1cCIYzNhY5pke
         P1/2p+sl3UB6AwD8WoVk/0V24BwiqXE99gesoegouYjyVEtu9x0qzSSrwecurtzWSEQ2
         Q+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p9PW7ELIrPOBtuIev7qS9tSOJ+TEbZEaawZ9Z+OQlmY=;
        fh=bnSQaVeYIPQ6GeojfY6lMs886t5AUhOBiMVwOxrbQEE=;
        b=q9etxQ6M7w714Uo6IhY5lYALeQXPONszpQ8Iu+OcX+cSYtC7HhsD0ms8J+fMv7YJNt
         yiV07Q1BvlSnhxvEL2KrvD1iMKEj453H2cQwI9SNYQA6YSdfYJrh05z9KmXrpF0gjurU
         diT2i64nmdjPpt32V8hTX3SE9tFxcZhpBZUayzsks+YlsUTQW3yYz0vtIBGMqTXJlV5v
         qfjJFWR/BnQhlU3nP6sYhfYJppCo6NQnANXKETZziMkrgfPVNOBWOVetxDfl/PLUyMkc
         1nAdX6KXjE+N+mEfdYS01j5Lv2nnvKVmeRsAHN1aFkqMav2il5rzmb2SFlFOntBDGquN
         itaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785530538; x=1786135338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p9PW7ELIrPOBtuIev7qS9tSOJ+TEbZEaawZ9Z+OQlmY=;
        b=Uyvgz1W98HwR6uaMDTrbvU6nG6z4QSQQzkVri58SwOFoo1lAB1q7Ex9xcorOMctQFe
         dO0KUCRiMDqHBbaY330j8Sb7gNA0m6i6Blt5aaSnQLVMMrYMfWG2s+mR7YsEEDEi2gez
         mNGaaU8PD16u5XRxuEGMZIj5AvR6hpOFUxUQw6haw5JQA6O8jaM5BwENjCB0s3w7tgfl
         N4x8BJxxBNpn2VXdEWXH3/Ed51EqwqnTOX8Ts2zeP8Nsxqtqyl38XHtUMjZi6NhlwOOF
         Amxgu60NuEZ+zxX8DsuFsbCiVRom3SMeBaLGft7S/QGeP1ZUh9/oYygMUQRpD73GPnVx
         IASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785530538; x=1786135338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9PW7ELIrPOBtuIev7qS9tSOJ+TEbZEaawZ9Z+OQlmY=;
        b=YAjVqhIVSEPScqo8pULPnnVwXXt65EYkhDpq92FWul89X7qShcKC2YcY/s89fU8GOk
         JxGqIcNmeSrtpka8HQoOIkkLAOc/xJIhm/JkPuCS3Yz4DuMPpOI3gCRyfaORpop7Neam
         dLImCOiJun5WOk5dws5+jK+cSaj5aP3yYwNPXifydM7dLppeZw56p+L2mOmjdv6/y7ZO
         C6NdFQ623I+eh5k4QTvNWB4N9b+lb73668g6njJIAV1Y2iqYJINqf8KdTOuSdLfIGooK
         swEmIv4V+7Fq5CGrKut6kDuWZWJ5479eCYMdmgiHKeLM3KyQ0GRuTkEKgbh4wdLAXqAw
         gcDQ==
X-Gm-Message-State: AOJu0YyETEKsxMO/8V2JTeJmPZwFyzu/kiSTi3pZjHQs06u3BIcQuU90
	YxsUk1umVRmsE8jXI2VdvooPr8bQ3MGIjW6cdsJMDc9rbj96J9yH4dnKA7cReETOrf5FLoFPcMU
	blyzfCSA86vR04bwIoYGssLOHWwmfJ73qgw==
X-Gm-Gg: AR+sD13QsE/3hU7+MHZQON2PASFN8eKCZy0EvhIhpAMZTo6O8bKfpkfRFPlYqoApBLG
	DcQsri39umdzDq/IJPcDwDDja6DKYkQ/VcAPNgIlsF/HrhyfdiRyHEUIvGezH6XJUGGVsPToD6Q
	hNgIGEVCgoaUi+TYKbvbA9cICFX8Jmv03PmODbILvul97JOK1PrtA1XAgmILpSEq0s+AEqZAKX1
	G/Ps+KPBFJhhRB5+xRKVhjxK2906+p3K83Ozn4cW8PFgHsPVthBcq9FYVDNL7QQvkomxxywn6mg
	orz3e80AiVSVBevjLVKNQX1lCU68yfuZs5hVabKiCI8eaStw9XvuRHiRarwayLt9ov9LETtio04
	MKLZtfPRGR8Yc0LLKo0S/BN9armBlwxO1rGc79980VuE2tX/Cf5sDqH0jZ75EoznMFI3+bzXjRT
	EZROwF6YlOnEAvEdLw/jSUmhYCMr0DEMUNHMaYCH0kVH2X7Xe7CJGXl0g=
X-Received: by 2002:a05:6402:4581:b0:69e:3822:98ac with SMTP id
 4fb4d7f45d1cf-6a0a7bf5e8fmr524858a12.18.1785530538465; Fri, 31 Jul 2026
 13:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729012320.616174-1-rosenp@gmail.com> <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>
 <amy2z-H4Kc9LNPdP@SMW015318> <CAKxU2N-mnt1PRWXWbmQ58Z373CAMBU-0ixKAeEAuqiojq-2HxQ@mail.gmail.com>
 <amztmJ8Lj9aUoPhH@SMW015318>
In-Reply-To: <amztmJ8Lj9aUoPhH@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 31 Jul 2026 13:42:05 -0700
X-Gm-Features: AUfX_mwxn8MaxJaQCyq0XQH-eKalWFtXFmRuXfQuMVU3uIv9wUtkx5EJmL6Fr9Y
Message-ID: <CAKxU2N-8bB_BkKzYO0cGbWF1grmc4UW=V5F_kjFYGQruhxG_zQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 11:47=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Fri, Jul 31, 2026 at 10:38:53AM -0700, Rosen Penev wrote:
> > On Fri, Jul 31, 2026 at 7:53=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com>=
 wrote:
> > >
> > > On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> > > > On Thu, Jul 30, 2026 at 11:49=E2=80=AFAM Frank Li <Frank.li@oss.nxp=
.com> wrote:
> > > > >
> > > > > On Tue, Jul 28, 2026 at 06:23:20PM -0700, Rosen Penev wrote:
> > > > > > We need to tear down the irq before edac_mc_free() to avoid a u=
se after
> > > > > > free on teardown as request_irq uses mci as dev_id.
> > > > > >
> > > > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > > > ---
> > > > > >  drivers/edac/fsl_ddr_edac.c | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr=
_edac.c
> > > > > > index f4cc89b26954..f1ddd1f47f2a 100644
> > > > > > --- a/drivers/edac/fsl_ddr_edac.c
> > > > > > +++ b/drivers/edac/fsl_ddr_edac.c
> > > > > > @@ -601,7 +601,7 @@ int fsl_mc_err_probe(struct platform_device=
 *op)
> > > > > >
> > > > > >               /* register interrupts */
> > > > > >               pdata->irq =3D platform_get_irq(op, 0);
> > > > > > -             res =3D devm_request_irq(&op->dev, pdata->irq,
> > > > > > +             res =3D request_irq(pdata->irq,
> > > > > >                                      fsl_mc_isr,
> > > > > >                                      IRQF_SHARED,
> > > > > >                                      "[EDAC] MC err", mci);
> > > > > > @@ -639,6 +639,7 @@ void fsl_mc_err_remove(struct platform_devi=
ce *op)
> > > > > >
> > > > > >       if (edac_op_state =3D=3D EDAC_OPSTATE_INT) {
> > > > > >               ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> > > > > > +             free_irq(pdata->irq, mci);
> > > > >
> > > > > here already disable hardware irq. Just call
> > > > > synchronize_irq() to make sure pending irq handled.
> > > > AI disagrees with this suggestion:
> > > >
> > > > The reviewer's suggestion to just call synchronize_irq() instead of
> > > > free_irq() is problematic for two reasons:
> > > > 1. Shared IRQ: The handler is registered with IRQF_SHARED. Disablin=
g
> > > > the DDR controller's local IRQ output (ddr_out32(..., 0)) prevents
> > > > this device from asserting the IRQ line, but other devices sharing =
the
> > > > same IRQ line can still trigger it. Without free_irq, the handler
> > > > remains in the shared action list and can be called with a dangling
> > > > mci pointer after edac_mc_free() =E2=80=94 the very UAF this patch =
aims to
> > > > fix.
> > > > 2. free_irq already synchronizes: free_irq() internally calls
> > > > synchronize_irq() after removing the action from the descriptor. An
> > > > explicit synchronize_irq() before free_irq() would be redundant.
> > >
> > > You post too quick, I have not seen this mail yet.
> > >
> > > devm_free_irq() here. and add comment why need explicit call it.
> > Needing to explicitly call devm_free_irq kind of defeats the purpose of=
 devm.
> >
> > Explicit ordering in this case makes more sense to me, especially with
> > the ddr_out32 calls.
> >
> > There's actually a second benefit to the non devm version. The devm
> > version prints an error message on failure. The normal one does not.
> > The significance is that the driver prints its own message.
>
> It may need goto if add logic after request_irq(), I want to make probe
> code clean enough.
>
> Error message doesn't mattter, we can remove it.
>
> I suggest use other method, let use devm add action to make free irq befo=
re
> free mci.
ACK. A couple of other drivers suffer from the same issue.
>
> Frank
>
> > >
> > > Frank
> > >
> > > > >
> > > > > Frank
> > > > >
> > > > > >       }
> > > > > >
> > > > > >       ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> > > > > > --
> > > > > > 2.55.0
> > > > > >
> > > > > >
