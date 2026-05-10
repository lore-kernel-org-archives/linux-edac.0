Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186F6214A9B
	for <linux-edac@vger.kernel.org>; Sun, 10 May 2026 03:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778385170; cv=pass; b=O6oYMaW5zM8BwpzckgZlftOdebxrGtx+witt7G7dcvmYlqeTmgHpxVI0S5PwBVPwOTpd2X3O4fBK88CebaW2WWwBHqF3B7MX180BUZmjBcO+D8NXbKB1R4+O5Q8TFvGyECg7aSn9qexqB3Nxm8Rp+q1++x2jo/PUVx4yIuUhN3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778385170; c=relaxed/simple;
	bh=7ejUJh+dDnefV/llP/4Chc70m4jI6IGD4nSZCG6Blm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2SO8Q4tQbioD+TuvhZMcyRId4OwtE/Y1z5oatclfVn8GPmGPkMczx+JRNq0+S/Ewrjx9b15sFJVm6z+SqE+P+VObNfQ+3ozFXnyhbwaadJ2g/at+7XgO8aOofy/lyLxZI0UoJxiRttLLKm1r7YxyoCV1ivZrEIb1dYiQmI5HVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtjLZazW; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtjLZazW"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-65d071aac6eso2853164d50.0
        for <linux-edac@vger.kernel.org>; Sat, 09 May 2026 20:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778385168; cv=none;
        d=google.com; s=arc-20240605;
        b=NdC4NlzavtOfcXk14WpNQSL8dbgP8imwytRwuqHo0IZjgylOKCQMLlPvxqxlMHgoEX
         FbgB3i66uDVREKlqDwBWvtLcRNGhrLWcnmvs/Cl6SZ+Jxr+cGpEV57m6Iu333e234o8d
         TJalkcOfT04lzzV1HpZavQasPVNEHunGvvoo0d8q+cvjfZS3Y5VNvWvraZOXmc3kgNF0
         c+PrBstH7ofy4m0AGm1iYYV3d4MJA3DabQ5eTNvDjv8Q41PzxKrG3amsXZPd/sreM0hg
         m6RGP+PE4h7FBHIisOMtZoxP7ANSTTba+7TIt0ATpa/eVh0iwbi3nHppcO154OoKvZHa
         RPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/wMngwV7QY01GHYHuPZuFbno+ZhzC065JLDv4yLPHE4=;
        fh=mJJM579zsBYpW2YBWn4mPHCXTWeuDhMCkSYbV8+XwEY=;
        b=PqWcOCwyRi49Vb9XvuB20tBYTMTNv+nU6ozvN9j2aQzyaCaz8P3dRzmhWsG2u4KXue
         +vb3Up/tYJeZVPnwt2Qu7aFSs0EY06Ay351SaBrs6kjnqGO2sXWXeZEy6UnMQe5rzkzw
         8wxthaI/pAWSTQyWWN13/Le+5NuW5UtJu03PUXIwDcQjeAnCraB7SaicwBa1wXvEqmfA
         3Frsj6o1SKTobEzekC5gHKm9aHxgNO2tO7BrcwulkHj7Rx6aQfUbi2Y+F2CnsAbmKrtW
         u1nnHrjopnFHGcnnudlKqIBG+8/MwlPCku5jStoQEu2d1Bh1JYFjSikgb+8dQXNQs4Id
         xtCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778385168; x=1778989968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wMngwV7QY01GHYHuPZuFbno+ZhzC065JLDv4yLPHE4=;
        b=HtjLZazWEhPfACqTZVr8y2TbXQJTOm+xjdgKtccBAV9OVYAfEzxtt1YEof5Vhvhq4/
         cjgtWcaVU7m7Ph1WL1MsNzuwnm91jIW1YoKpq3V/6VvpGoO3oeTbXWY7OtLeJLabzlyY
         KSbX6seStuDCgBDDwDiexGG/WPfGRYVCiA9PO8Kjs2aM3VZCZEiPXkV9ktlmXHy5qgZM
         LjLQS8Ie7b+PUtrSfHzPm3KcmcUqTK/VbQp9FSMAfYhINIKlvrY+gVAT1HDd2vSuz7xO
         1/dY+iV4OrHLyioQwBwfjqhJeS/0++lX5hOegl4YqYogPzAib23UBm+J/JqPiZErYq0P
         jZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778385168; x=1778989968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/wMngwV7QY01GHYHuPZuFbno+ZhzC065JLDv4yLPHE4=;
        b=SmwcfkADC+SRwxzlPFfPLfD96Hg+w27pqvE5cgBfQzPWgbv7HSfFhiiQRucL/XmlUc
         Mb55aBp4850y7wpm4nvRSIdhx03YlY1pf6Cs3KBau8ujgvBkXjzPGeCBrFR25lmWj1zG
         BuOcaAMvMx0ESCvZ3Iwz32Na25Y+O8CXwHN/F2H68A7AOl1jPSK4OQWKzJypUWP3Fd0K
         jtPPcY21qa97g2UkeJXMki/5YGVydnRMUrQyJ1EKtpPdL+gqUjWnXe4GvEwZS4RDGIkr
         I2SrcA7RtQqhTO9tBOoffxGH1stfNGe7gJCRYX1+fZMsa5S8oDjSqPl1LNKkGep0Axfe
         NFPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cn/7/S8xt8Efhw0VhTqDTJKphIDMbYBwdoMslVeppRwekTySy9ampeoaBPzWq0vk8YKuOPJcXCVdr@vger.kernel.org
X-Gm-Message-State: AOJu0YzWglNO/XAHctZtcRrOT/cH+IP4LZoPlNZircyhEqHrtKGWo1yc
	k8toQdi+LE4DRrRlTqPQXKSGwbq70yVjMhOc6ijXKW0R2HXeBtbSyWDfXP8Xe5ejiEdLISPYAiG
	sJ1Zj4mTQlJ19QXb/RX2bwpyxk6ATJSY=
X-Gm-Gg: Acq92OEsQNDHEzg8s4HIiAmCQ7S8JeYH2ebe3DG0jbtW/t0iKLNhbF/V/eCyWGTNiLQ
	eTQQUNUwaZiNEaletPwMG5Zd+gJcztpNUiRekbBJwqLeT9rMQRWGpG1AZ0mNT5tKmSHr3wSlmwG
	cxFcDfy09hPa18NiVxFw2NGZFH5dPJ5JAzPBJC7EHbE1t2Jhyn2/oqgRbcPZ9tvvetv6PKpzYiK
	UJ8LOQ7W45VY/XjidgnZCmfECOkDgWvLvvcu+Y1LYXyT5BaXtFmH/cbAkiRAF0AnXceThAqoEMZ
	H1U2w72X
X-Received: by 2002:a05:690c:c50c:b0:7bd:5cc4:1962 with SMTP id
 00721157ae682-7bdf5f2777cmr204300407b3.48.1778385167636; Sat, 09 May 2026
 20:52:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508104248.1073957-1-shubhrajyoti.datta@amd.com> <CY8PR11MB7134C4903409BFF214412BCE893D2@CY8PR11MB7134.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB7134C4903409BFF214412BCE893D2@CY8PR11MB7134.namprd11.prod.outlook.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Sun, 10 May 2026 09:22:36 +0530
X-Gm-Features: AVHnY4Lp5277YRsKGZ0wy_XUT8qPvfC4q6VaXDeqqsBPMSxhleHyEoTyGN5GrLM
Message-ID: <CAKfKVtHZPq4JaqyJS04LbqVqhz8AKsG0V9esCQ4DQ4N1jX8FJg@mail.gmail.com>
Subject: Re: [PATCH v2] EDAC/versalnet: Report PFN and page offset for DDR errors
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "git@amd.com" <git@amd.com>, Borislav Petkov <bp@alien8.de>, 
	"Luck, Tony" <tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 7:00=E2=80=AFPM Zhuo, Qiuxu <qiuxu.zhuo@intel.com> w=
rote:
>
> Hi Shubhrajyoti,
>
> > From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> > Sent: Friday, May 8, 2026 6:42 PM
> > To: linux-kernel@vger.kernel.org; linux-edac@vger.kernel.org
> > Cc: git@amd.com; shubhrajyoti.datta@gmail.com; Borislav Petkov
> > <bp@alien8.de>; Luck, Tony <tony.luck@intel.com>; Sai Krishna Potthuri
> > <sai.krishna.potthuri@amd.com>; Shubhrajyoti Datta
> > <shubhrajyoti.datta@amd.com>
> > Subject: [PATCH v2] EDAC/versalnet: Report PFN and page offset for DDR
> > errors
> >
> > Populate the EDAC location fields when reporting DDRMC CE/UE events.
> >
> > Compute the physical address from the decoded error info and pass the P=
FN
> > along with the offset-within-page to edac_mc_handle_error(). This allow=
s
> > user space (mc_event consumers) to correlate memory errors with a real
> > address.
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> > ---
> >
> > Changes in v2:
> > Refactor the common code
> >
> >  drivers/edac/versalnet_edac.c | 34 ++++++++++++++++------------------
> >  1 file changed, 16 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_eda=
c.c
> > index ec1315582414..85d1a829a8aa 100644
> > --- a/drivers/edac/versalnet_edac.c
> > +++ b/drivers/edac/versalnet_edac.c
> > @@ -429,6 +429,7 @@ static unsigned long convert_to_physical(struct
> > mc_priv *priv,  static void handle_error(struct mc_priv  *priv, struct =
ecc_status
> > *stat,
> >                        int ctl_num, int *error_data)
> >  {
> > +     enum hw_event_mc_err_type type;
> >       union ecc_error_info pinf;
> >       struct mem_ctl_info *mci;
> >       unsigned long pa;
> > @@ -440,29 +441,26 @@ static void handle_error(struct mc_priv  *priv, s=
truct
> > ecc_status *stat,
> >
> >       mci =3D priv->mci[ctl_num];
> >
> > -     if (stat->error_type =3D=3D MC5_ERR_TYPE_CE) {
> > +     if (stat->error_type =3D=3D MC5_ERR_TYPE_UE) {
> > +             pinf =3D stat->ueinfo[stat->channel];
> > +             type =3D HW_EVENT_ERR_UNCORRECTED;
> > +     } else {
> >               pinf =3D stat->ceinfo[stat->channel];
> > -             snprintf(priv->message, sizeof(priv->message),
> > -                      "Error type:%s Controller %d Addr at %lx\n",
> > -                      "CE", ctl_num, convert_to_physical(priv, pinf,
> > ctl_num, error_data));
> > -
> > -             edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
> > -                                  1, 0, 0, 0, 0, 0, -1,
> > -                                  priv->message, "");
> > +             type =3D HW_EVENT_ERR_CORRECTED;
> >       }
> >
> > -     if (stat->error_type =3D=3D MC5_ERR_TYPE_UE) {
> > -             pinf =3D stat->ueinfo[stat->channel];
> > -             snprintf(priv->message, sizeof(priv->message),
> > -                      "Error type:%s controller %d Addr at %lx\n",
> > -                      "UE", ctl_num, convert_to_physical(priv, pinf,
> > ctl_num, error_data));
> > +     pa =3D convert_to_physical(priv, pinf, ctl_num, error_data);
>
> I noticed that the return comment of convert_to_physical() says "physical=
 address of the
> DDR memory" [1]. I'm just curious if this refers to:
>
>   - the DDR address space (DRAM-only, without MMIO holes), or
>   - the system physical address space (including MMIO holes)

It is the second one that it returns.
Let me know if the below comment should be updated

- * Returns physical address of the DDR memory
+ * Returns the system physical address corresponding to the reported DDR e=
rror.

>
> If it's the former, it may need to convert it to the latter one by proper=
ly adding
> back the MMIO hole(s), since the OS uses system physical addresses.
>
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/drivers/edac/versal_edac.c#n363
>
> > +     pfn =3D PHYS_PFN(pa);
>
> [...]
