Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD6745199A
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 17:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519551; cv=pass; b=SVnK0Up1bcSpeqSRdhqkHg/3goYE9cewSHysx+rFGPc9j+GiKcoc5dzyqFNXDa+L7VJYblLq2DUv+IH2Oq4EhNIlU5yUqVh5odWPkwTiit+/ikrwGD1L56/4kJR6TYWDS4jfbudSVtgVm6GN8acLuakOOcHuOndR1Yr2TFCoHO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519551; c=relaxed/simple;
	bh=cyC52QIvAc946stkwp2fCYtvs8A5LUa+yfzkSiYD+NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3Fgi2vAKtkLOKKTS+lz5Kv6mvkuEht6qfZ3yKfqbf+eRg3K5OvoW8HuwX+hgMKKoximwCbhCr1EpdIDc6zN36UjvAv6rVU6vPlW/z+ZVjblYpoWBIgzz/2CBCaftZ5gL49tcWqCs/pDTruFUVkZIvM3K04e59PqsZsIxO8qB1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHapGnpP; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHapGnpP"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a18180so768990a12.0
        for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 10:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785519546; cv=none;
        d=google.com; s=arc-20260327;
        b=qgqE36FY/s/UwWrmBjSeR7Z5H9bk5eQGRqGFY7VoNqkGrUZm8xeblc+GEFn2RVzU9c
         1QqButolQL4ceL97/ExVSnn7DA9/sFVVXtyXjoLyNM9rKafTTfuuEgo3+bboWYAuZ9hG
         SIt2HeeNXK32Kz9zDWIe6eGlwORiqs/2D2T1M1H7j6IUfuMQVE6+YUN4TpU4+9NEvQYK
         KfkUnEceNSBlPkOl+qmOAr2LSDdGuYM7hiCsvG78aMuyDp6n8XCU564xBnTV16+6SaP2
         wO2dz4XC0gHbYcWqKLrMlrgdLfxaJJKfCoHDkPZsHrep1YXnns4O5513Ze3ohsgoOrdP
         MPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZKPK3Lozq5k72vaIYhpUr0DfMfr4X72+opwX+zWoeuo=;
        fh=bnSQaVeYIPQ6GeojfY6lMs886t5AUhOBiMVwOxrbQEE=;
        b=aVlVJuJrn9yxSJGlkbBLDhtkxG3SZzjDr8XTI4V1EOWbc6geDvlj12xlFyWfqrLzjh
         EKabtQk5NLYB2kpam5VYM20oWkzrO1YgCAUHohIsvdvCYkvdNX2DL1Au6cDkbiYE17tC
         zvtxrxc0j3hc8xgmYEVFQCV8gH4Gn5tF5FbLDK/F1WNbpqO8eG62vUcGqYBizJlghIsm
         ElIyVcLO8+YRNA4heWuX93DZCMBvT2dNsv4VeWuWCNuPVrIl+PnMDdCiMZ22h4ioRAPE
         SYg3ya4o5Cv7aUqv3EcM7j+aJxauQfYBnoeNEWdJppKBKPwn9whfmLljoOuJh4FOf1mK
         CLRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785519546; x=1786124346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZKPK3Lozq5k72vaIYhpUr0DfMfr4X72+opwX+zWoeuo=;
        b=AHapGnpPxtwDO/fI5hhrl5+BHCd9irk/gUikSVgyZP+ph+RRjBsNX3HnnwmaWW+Qmg
         sWhMKUhIyBqBNv6SxNU/cEmt7+9ApA13BYRYE30d1ZET2MxiaofvvUkUJ9U3YzWcrNmN
         afjsJxBDmK+9S5pR8SZEuzqtceUXo/E2+3i7Jt6BZvTYOwe3ilOzSwIN4jMdPGquEk7A
         OrOdaKv4Slptukgkj2A6HkOj5Gvw7abTEKBc0oCo0JL+KBDiSvWYQPHuIc6N3MHFgVGd
         D3g5xY13+1knhErydKKpSXBRE39VYCRlN3TeRZzeZevwl3/7HRKyoWd7+N8SwcnPYwlG
         IIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785519546; x=1786124346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKPK3Lozq5k72vaIYhpUr0DfMfr4X72+opwX+zWoeuo=;
        b=sgRsC5uIOfUGXoQmxFobjVEbfXiVmWYqBNPfQBiCbvHAQtBLK/iNXf1VJE+brPfbb+
         DPESHrTvbS7R4hKtwVKmuhSY2akSOFU6k+1M/4U1Zrj1nHR4Amn9QFtTWvmv1YX+Q5uW
         5cJPBewM46PgpAeAOeoTW9TGZzyhgMAqb9R+8aWzLkszPLVZZ9ItPrcFR9SK47EzNbRi
         nx/cYki/7eXIOLloqsWYw1vWYraCiaXGtqJ4IqfNh5MN/vH+wAS3Q5W5+bkP8yrsSCbb
         BZXGYiGH/n4mMEjDplgfZbFSPf0/fi+Clm/dHJ8maklPkp0hmkpra4ljSgkpMZnMspFJ
         GJTg==
X-Gm-Message-State: AOJu0Yx57gF56a+9Bm32Lgb0BXfFZZ6SYCWXKlSI1UMOqy/p0R+6knFJ
	4aRkDqDSDrpMmY1DZyb9aI7q0mkyLJw/f0lzTyjPzVr3W36/BoumJyeDdOI65JcafrkjDjPRirA
	Dq1gu/UrTm873NKfvdzrwGcUDG1GijLrR898u
X-Gm-Gg: AR+sD10aKkMePB9bChLNS0d0T9QA9p3+ACnbapOAl+Ex/8iBPmQjynxbwEAxP30msfB
	3nNOJok9t3/HeTf74syEBpiPGhEAMGC+CqrIwsNwP0qg47a1VIyNPP/9vfimciRclfdb55j/x1B
	dbeWnzj9rhKvRsRApgl2t7gfrMZeNB4qhKon2uKygw36Kcct2jCjK2f74WCEFmfZvd8mBRo5COq
	8PjIAlWKBWCZjFZx9wyrrZl/eoerSoqgQO/HMDVrt5cGqvT/JeRQOQ3sk4+MX3OJo42j9JMq1Vc
	y32yEiRy6DvGRTNv3n9/eQE13ufsF4YWtBsb+piFLbsxBa72q3X2nIdtsjOEGY9J3tQO9ru8ayj
	kPmNwf1ERAaWJ0ry8OeYOAQu31lYtP1Z+bf0dD0w0FiMdCsZKAojMF7pA7bOJcyfzm0O+esXh/o
	xGKMsXsl7TyhtJ7meeA+R2OVgGO+c/LrqXPK7nmR4xwbmwAStwb/VbSOQ=
X-Received: by 2002:a05:6402:44d8:b0:6a0:669c:f817 with SMTP id
 4fb4d7f45d1cf-6a0a7d09ad1mr308929a12.24.1785519545533; Fri, 31 Jul 2026
 10:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729012320.616174-1-rosenp@gmail.com> <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com> <amy2z-H4Kc9LNPdP@SMW015318>
In-Reply-To: <amy2z-H4Kc9LNPdP@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 31 Jul 2026 10:38:53 -0700
X-Gm-Features: AUfX_myrzQUIm57x6XaoMMeRgWVR16mYNp4NjINehAI0dwJX54vSD1Y3o8VhEE0
Message-ID: <CAKxU2N-mnt1PRWXWbmQ58Z373CAMBU-0ixKAeEAuqiojq-2HxQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 7:53=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> > On Thu, Jul 30, 2026 at 11:49=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com=
> wrote:
> > >
> > > On Tue, Jul 28, 2026 at 06:23:20PM -0700, Rosen Penev wrote:
> > > > We need to tear down the irq before edac_mc_free() to avoid a use a=
fter
> > > > free on teardown as request_irq uses mci as dev_id.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/edac/fsl_ddr_edac.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_eda=
c.c
> > > > index f4cc89b26954..f1ddd1f47f2a 100644
> > > > --- a/drivers/edac/fsl_ddr_edac.c
> > > > +++ b/drivers/edac/fsl_ddr_edac.c
> > > > @@ -601,7 +601,7 @@ int fsl_mc_err_probe(struct platform_device *op=
)
> > > >
> > > >               /* register interrupts */
> > > >               pdata->irq =3D platform_get_irq(op, 0);
> > > > -             res =3D devm_request_irq(&op->dev, pdata->irq,
> > > > +             res =3D request_irq(pdata->irq,
> > > >                                      fsl_mc_isr,
> > > >                                      IRQF_SHARED,
> > > >                                      "[EDAC] MC err", mci);
> > > > @@ -639,6 +639,7 @@ void fsl_mc_err_remove(struct platform_device *=
op)
> > > >
> > > >       if (edac_op_state =3D=3D EDAC_OPSTATE_INT) {
> > > >               ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> > > > +             free_irq(pdata->irq, mci);
> > >
> > > here already disable hardware irq. Just call
> > > synchronize_irq() to make sure pending irq handled.
> > AI disagrees with this suggestion:
> >
> > The reviewer's suggestion to just call synchronize_irq() instead of
> > free_irq() is problematic for two reasons:
> > 1. Shared IRQ: The handler is registered with IRQF_SHARED. Disabling
> > the DDR controller's local IRQ output (ddr_out32(..., 0)) prevents
> > this device from asserting the IRQ line, but other devices sharing the
> > same IRQ line can still trigger it. Without free_irq, the handler
> > remains in the shared action list and can be called with a dangling
> > mci pointer after edac_mc_free() =E2=80=94 the very UAF this patch aims=
 to
> > fix.
> > 2. free_irq already synchronizes: free_irq() internally calls
> > synchronize_irq() after removing the action from the descriptor. An
> > explicit synchronize_irq() before free_irq() would be redundant.
>
> You post too quick, I have not seen this mail yet.
>
> devm_free_irq() here. and add comment why need explicit call it.
Needing to explicitly call devm_free_irq kind of defeats the purpose of dev=
m.

Explicit ordering in this case makes more sense to me, especially with
the ddr_out32 calls.

There's actually a second benefit to the non devm version. The devm
version prints an error message on failure. The normal one does not.
The significance is that the driver prints its own message.
>
> Frank
>
> > >
> > > Frank
> > >
> > > >       }
> > > >
> > > >       ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> > > > --
> > > > 2.55.0
> > > >
> > > >
