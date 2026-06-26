Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C213E5A11
	for <linux-edac@vger.kernel.org>; Fri, 26 Jun 2026 08:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462187; cv=pass; b=qHFUeIXSnByhHvYXnHSdU/fD/a35y+hGhZCyJKeBd/5tVK5OVXTKR7PrdWW4ceUFdJA/7T53j/01e6Z0d7ZoGvp2c9HbDCVu9ZmxSVUGT6WNdnj/YKYgYZgnihcmgOR1RF1v8nKlI2AC/FQq14OXVgP0p373u//YZ6Fu2hGxBvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462187; c=relaxed/simple;
	bh=VOJnObyKRFPrvFhz8NtAL4dmJqfZxi0MnOjNYQ8I6Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMaGCBoRr+jB1iUIXM19EN965o6vIgYqJ6oVJjOStsiYvATA2fWHB1dPxnUHckGDeHIJfFBT6o3ZqH3WrMOQWbINGUevO3mGj2aB7L3ERAeOOT8x5+AnXTjabg56EMq8OO3h3T/9e+X9pjsnMIQgRrI7AO4M/p6ctuAOFDUTyxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8bYMHzb; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8bYMHzb"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30b6dad2382so1560233eec.0
        for <linux-edac@vger.kernel.org>; Fri, 26 Jun 2026 01:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782462185; cv=none;
        d=google.com; s=arc-20260327;
        b=eSqKxXKdDQaKSmlenunleGWmzSMglhypZqepiu37bfyKrx/sYcy6r5VSgTKs9KI4T9
         qTB/nw21voLdwVP+Cl1f7mcGQoSzozJP4Mqqpxd9fwf1YoGiYRELSwRp2H2Og0S5eVIc
         0iaJRMB2ahSat4jIgbuRODIfoFFQmitHYQj9DZv4pq4WuJ7jx+sq3kslE8TZYJLSmaRq
         LPd34YanK1xrvNdSdRiQgdVazSmuOl1q6Qa8u3YutlzO369tMA+lSbTvgI3/bFyqVwpT
         BqW2QF2Xv0PTwPNU5s9VjRtpHVIvpuzugEaT9HfaWGS4mvNhf3EwDM+bT1RB7txTpLP+
         TYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejpy5KyxmyyyA7qwkwxOXIFxOH8LcGl+2AbU2zYkeV8=;
        fh=cAhlDJajgHCubJpZVdnWU+2rABZtcVJ3huutgP4CoVw=;
        b=FVEYaFIcaYg5kFAnvhFTRv6gk8WYxLiUeHsjgPOUnX4buEexWVtXXGDiHC3rqiCO/W
         G7Q7WEuFg5FtmnD42zyUwjeo1+nYjbAuCJChjdKChRmPedGWC+l7t8XPwc/m6SVgw5kR
         Wi3c9Nx+UR1MDxgQpNU37wuX0bUA2FgAGQ8wseidO1kDa7ghh2D1JGlhAgIGe0wjXFQb
         UaUKK1bDeq6SW7jlZIqDzyA789wT6hXrWX2NZTn8wdWqlQHj55S/fgwVGF4meYkXcYeb
         bufPKU7ANUXeCGUxLcKm7pac6wPWrFQSbIG6oQtv2tiZtucUq5p33sDmmSUzRzrKL41T
         iasw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782462185; x=1783066985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejpy5KyxmyyyA7qwkwxOXIFxOH8LcGl+2AbU2zYkeV8=;
        b=A8bYMHzbsqSCax12kyGNH1dgXNm9cfKZEpt/CUnd1b1w1eIryPmehtrcCWkW8YqA21
         EB9L+Pjta8XfcYjEJFv7luL26d6w9RBlvtQ949OpqVXT3Phi9tPOeH7oodxxv/VJH57D
         EqHJHOsnzyD3286szjk0VAV2b5FKjp+lJPCnfSeiIQLPmWu6uOPo/nrgWrUDLOlaxH6L
         Df3kn9EPDUMAy1dm8BFgebJDqrC3IVyfyARMYfXqCalLAnAte95/ncHrjx5HDX8LTxkk
         6J/6sHo2ETaoq5XBRLLNl/pluqWmbAHn7GeCC5s6bpNGpPcSLNxeVRmL6BkBrfVnxY3+
         E4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462185; x=1783066985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejpy5KyxmyyyA7qwkwxOXIFxOH8LcGl+2AbU2zYkeV8=;
        b=k1avpVZdln8DEER1lJFM2N4JPzOyyFXaf6Gg7GS2hsCpfZ6NRNDqQ5EHz2FkyLLxuw
         brwQrvBl60+eXNIBU1/fTJlk9kDlC4zcO0fGJSl+gosk5C3eRMOvFofTY/eShRsZdPg7
         4k76yYBqSunFgRXTLXbdUBeEC5U5ZV5cKiOlF7EVkd3ItHpiMcdBnSGWpHIv7X6yhqok
         APSrGkC4f9iPqq6az68uqtc4dFFHGAJ2N7F1betnqThUylD2D3RvA6BXlqWHEoL8ZqiF
         6F3SlHl0Z89LxHsvftm1WW8c7QN8723Fn1lk3qaHOhY0zx3ZZeMZ4iPX/kiMgkEi1Eru
         yzKg==
X-Forwarded-Encrypted: i=1; AFNElJ/4guBrqnx+cffKFADQJ/tUYu2x/LDSs1pRXoiC6716KDj4dUI2z97t5OyGtkGe/oBDy6k14p82+it2@vger.kernel.org
X-Gm-Message-State: AOJu0YxflNp9WLuVxqcFTfujNhB/xViqBAx2VrFMdqO9eW6fCEdc8Zd7
	Ev9EC5qke8xrko/Qr+CONaG7zocsaDdR+0mCC1AP+cD44OGNSXaouS5R2y7RRzlEu8LCUDC7AEl
	q+oVSzGE5/D8kGuc3Y+CwKk9iNIrJnrY=
X-Gm-Gg: AfdE7cnxmow6ffcAsH3d/FSYiNkHRfY2wSqVU+WGG3v0IGa6+2f1pYieUzaIY4NF3dJ
	l9czeHbAT9A4KYT4ZMxG/2WfY5iHYQDCW0oBS8wrW7OVcgvtamF3aXT4ZvHgqcXn4D7U3N7We55
	JdopaVqdL9nLnCpw4KSy5rv82xjcDFTEQ7w0jFjfXt7T3vc7GKi/uKzzkMdP2mxWcYqrWr+h30C
	Zdyf8TB+zMMLGctmcx2z2O8m/YiIPcBMx+zF8ifsPBBXq2malLippe5QbKdL8GC3QmcHrWO7d+G
	OCmdAUcSdgzVncHvtbL+4uuHW0SA
X-Received: by 2002:a05:7022:ec0e:b0:130:7246:10aa with SMTP id
 a92af1059eb24-139dba502f9mr4821646c88.12.1782462185022; Fri, 26 Jun 2026
 01:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <470f54e9-9e92-40c1-9383-6be055170d69@kernel.org>
 <20260617000711.60804-1-rounakdas2025@gmail.com> <72efba41-f8b2-4cd2-9ce6-824cfc1a9d2c@kernel.org>
In-Reply-To: <72efba41-f8b2-4cd2-9ce6-824cfc1a9d2c@kernel.org>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Fri, 26 Jun 2026 12:22:53 +0400
X-Gm-Features: AVVi8CfKSoykNXt4KzSxBXhEZhzJW32sFYztn0nikVHUGBZ0wyu4Smw7Qcna6cg
Message-ID: <CAPYTKoM7PudjgHkgyGgLAoz9gcXyPQhe_VojLxNYPkEwQNRQjQ@mail.gmail.com>
Subject: Re: [PATCH v3] EDAC/altera: use ECC manager compatible to select
 A10/S10 IRQ layout
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dinh,
I'm glad to know that it tested clean on both platforms.

To make sure that I understand the approach correctly, do you mean to
carry the A10/S10 distinction in the `altr_edac_a10_of_match[]` table
via the `.data` field?
And then reading it back in probe through `device_get_match_data()`?

If I got it right, I'll send it as v4.

Thanks,
Rounak

On Thu, Jun 25, 2026 at 4:09=E2=80=AFPM Dinh Nguyen <dinguyen@kernel.org> w=
rote:
>
>
>
> On 6/16/26 19:07, Rounak Das wrote:
> > The SDMMC ECC IRQ layout selection uses CONFIG_64BIT to distinguish
> > between Arria10 and Stratix10 paths. This is architecture-based,
> > while the interrupt layout is a hardware property described by DT
> > compatible strings.
> >
> > Detect the SoC once at probe via the altr,socfpga-s10-ecc-manager
> > compatible on the ECC manager node, store it under the struct
> > altr_arria10_edac, and use it in altr_portb_setup() and
> > altr_edac_a10_device_add() in place of CONFIG_64BIT.
> >
> > Selecting on the manager compatible keeps the decision SoC-wide and
> > correct for every ECC child device (OCRAM, USB, EMAC, SD/MMC),
> > and avoids repeated compatible lookups. Stratix10 and
> > Agilex both declare altr,socfpga-s10-ecc-manager and Arria10 does not,
> > so behaviour is unchanged on all three SoCs.
> >
> > Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
> > ---
> > v3:
> >   - Use compatible string altr,socfpga-s10-ecc-manager instead of
> >     sdmmc-ecc (Dinh).
> >   - Set it once into struct altr_arria10_edac::is_s10 to
> >     avoid repeated of_device_is_compatible() calls (Dinh).
> >   - Fix the checkpatch open-parenthesis alignment.
> >
> > v2: https://lore.kernel.org/linux-edac/20260616081709.48774-1-rounakdas=
2025@gmail.com/
> >   - Use legal name in Signed-off-by (Borislav).
> >
> >   drivers/edac/altera_edac.c | 106 +++++++++++++++++++-----------------=
-
> >   drivers/edac/altera_edac.h |   1 +
> >   2 files changed, 55 insertions(+), 52 deletions(-)
> >
> > diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> > index 4edd2088c2db6..c728cd474abdf 100644
> > --- a/drivers/edac/altera_edac.c
> > +++ b/drivers/edac/altera_edac.c
> > @@ -1507,6 +1507,7 @@ static int altr_portb_setup(struct altr_edac_devi=
ce_dev *device)
> >       int edac_idx, rc;
> >       struct device_node *np;
> >       const struct edac_device_prv_data *prv =3D &a10_sdmmceccb_data;
> > +     bool is_s10 =3D device->edac->is_s10;
> >
> >       rc =3D altr_check_ecc_deps(device);
> >       if (rc)
> > @@ -1548,15 +1549,14 @@ static int altr_portb_setup(struct altr_edac_de=
vice_dev *device)
> >
> >       /*
> >        * Update the PortB IRQs - A10 has 4, S10 has 2, Index accordingl=
y
> > -      *
> > -      * FIXME: Instead of ifdefs with different architectures the driv=
er
> > -      *        should properly use compatibles.
> >        */
> > -#ifdef CONFIG_64BIT
> > -     altdev->sb_irq =3D irq_of_parse_and_map(np, 1);
> > -#else
> > -     altdev->sb_irq =3D irq_of_parse_and_map(np, 2);
> > -#endif
> > +
> > +     /* Using compatibles to determine the IRQ Index */
> > +     if (is_s10)
> > +             altdev->sb_irq =3D irq_of_parse_and_map(np, 1);
> > +     else
> > +             altdev->sb_irq =3D irq_of_parse_and_map(np, 2);
> > +
> >       if (!altdev->sb_irq) {
> >               edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB SBIRQ all=
oc\n");
> >               rc =3D -ENODEV;
> > @@ -1570,29 +1570,28 @@ static int altr_portb_setup(struct altr_edac_de=
vice_dev *device)
> >               goto err_release_group_1;
> >       }
> >
> > -#ifdef CONFIG_64BIT
> > -     /* Use IRQ to determine SError origin instead of assigning IRQ */
> > -     rc =3D of_property_read_u32_index(np, "interrupts", 1, &altdev->d=
b_irq);
> > -     if (rc) {
> > -             edac_printk(KERN_ERR, EDAC_DEVICE,
> > -                         "Error PortB DBIRQ alloc\n");
> > -             goto err_release_group_1;
> > -     }
> > -#else
> > -     altdev->db_irq =3D irq_of_parse_and_map(np, 3);
> > -     if (!altdev->db_irq) {
> > -             edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB DBIRQ all=
oc\n");
> > -             rc =3D -ENODEV;
> > -             goto err_release_group_1;
> > -     }
> > -     rc =3D devm_request_irq(&altdev->ddev, altdev->db_irq,
> > -                           prv->ecc_irq_handler, IRQF_TRIGGER_HIGH,
> > -                           ecc_name, altdev);
> > -     if (rc) {
> > -             edac_printk(KERN_ERR, EDAC_DEVICE, "PortB DBERR IRQ error=
\n");
> > -             goto err_release_group_1;
> > +     if (is_s10) {
> > +             /* Use IRQ to determine SError origin instead of assignin=
g IRQ */
> > +             rc =3D of_property_read_u32_index(np, "interrupts", 1, &a=
ltdev->db_irq);
> > +             if (rc) {
> > +                     edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB D=
BIRQ alloc\n");
> > +                     goto err_release_group_1;
> > +             }
> > +     } else {
> > +             altdev->db_irq =3D irq_of_parse_and_map(np, 3);
> > +             if (!altdev->db_irq) {
> > +                     edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB D=
BIRQ alloc\n");
> > +                     rc =3D -ENODEV;
> > +                     goto err_release_group_1;
> > +             }
> > +             rc =3D devm_request_irq(&altdev->ddev, altdev->db_irq,
> > +                                   prv->ecc_irq_handler, IRQF_TRIGGER_=
HIGH,
> > +                                   ecc_name, altdev);
> > +             if (rc) {
> > +                     edac_printk(KERN_ERR, EDAC_DEVICE, "PortB DBERR I=
RQ error\n");
> > +                     goto err_release_group_1;
> > +             }
> >       }
> > -#endif
> >
> >       rc =3D edac_device_add_device(dci);
> >       if (rc) {
> > @@ -1974,29 +1973,29 @@ static int altr_edac_a10_device_add(struct altr=
_arria10_edac *edac,
> >               goto err_release_group1;
> >       }
> >
> > -#ifdef CONFIG_64BIT
> > -     /* Use IRQ to determine SError origin instead of assigning IRQ */
> > -     rc =3D of_property_read_u32_index(np, "interrupts", 0, &altdev->d=
b_irq);
> > -     if (rc) {
> > -             edac_printk(KERN_ERR, EDAC_DEVICE,
> > -                         "Unable to parse DB IRQ index\n");
> > -             goto err_release_group1;
> > -     }
> > -#else
> > -     altdev->db_irq =3D irq_of_parse_and_map(np, 1);
> > -     if (!altdev->db_irq) {
> > -             edac_printk(KERN_ERR, EDAC_DEVICE, "Error allocating DBIR=
Q\n");
> > -             rc =3D -ENODEV;
> > -             goto err_release_group1;
> > -     }
> > -     rc =3D devm_request_irq(edac->dev, altdev->db_irq, prv->ecc_irq_h=
andler,
> > -                           IRQF_TRIGGER_HIGH,
> > -                           ecc_name, altdev);
> > -     if (rc) {
> > -             edac_printk(KERN_ERR, EDAC_DEVICE, "No DBERR IRQ resource=
\n");
> > -             goto err_release_group1;
> > +     if (edac->is_s10) {
> > +             /* Use IRQ to determine SError origin instead of assignin=
g IRQ */
> > +             rc =3D of_property_read_u32_index(np, "interrupts", 0, &a=
ltdev->db_irq);
> > +             if (rc) {
> > +                     edac_printk(KERN_ERR, EDAC_DEVICE,
> > +                                 "Unable to parse DB IRQ index\n");
> > +                     goto err_release_group1;
> > +             }
> > +     } else {
> > +             altdev->db_irq =3D irq_of_parse_and_map(np, 1);
> > +             if (!altdev->db_irq) {
> > +                     edac_printk(KERN_ERR, EDAC_DEVICE, "Error allocat=
ing DBIRQ\n");
> > +                     rc =3D -ENODEV;
> > +                     goto err_release_group1;
> > +             }
> > +             rc =3D devm_request_irq(edac->dev, altdev->db_irq, prv->e=
cc_irq_handler,
> > +                                   IRQF_TRIGGER_HIGH,
> > +                                   ecc_name, altdev);
> > +             if (rc) {
> > +                     edac_printk(KERN_ERR, EDAC_DEVICE, "No DBERR IRQ =
resource\n");
> > +                     goto err_release_group1;
> > +             }
> >       }
> > -#endif
> >
> >       rc =3D edac_device_add_device(dci);
> >       if (rc) {
> > @@ -2122,6 +2121,9 @@ static int altr_edac_a10_probe(struct platform_de=
vice *pdev)
> >       platform_set_drvdata(pdev, edac);
> >       INIT_LIST_HEAD(&edac->a10_ecc_devices);
> >
> > +     edac->is_s10 =3D of_device_is_compatible(pdev->dev.of_node,
> > +                                            "altr,socfpga-s10-ecc-mana=
ger");
> > +
>
>
> I tested this version on both 32-bit and 64-bit platforms and there were
> no regression. But I'd like to see if we can avoid using
> of_device_is_compatible in runtime code and see if we can just bind to
> the "altr,socfpga-s10-ecc-manager" if possible?
>
> Thanks,
> Dinh
>
