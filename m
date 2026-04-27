Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270F0227BB5
	for <linux-edac@vger.kernel.org>; Mon, 27 Apr 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777286873; cv=pass; b=mj6+x/69p4CrZpF+hvN8K3E/OqAXZDuymmR9VST9gSKZEnkxOgx8qgcml+5mT8ko9VszpqUAG8NqKYS6cZ3MW3sMmV2oHVp8v1QTfiE0GoOE6vvSPPeJ/u/d7tmbUBPomfYf+UnKTz15BPpI+XcT5/5pJjjo6pQ9vFYjhziR+Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777286873; c=relaxed/simple;
	bh=CERzPnJVQzgGtwyyEy9zOdHNpqInhIU/ITtHNHx8N7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eb0GDJeh7Y0n95FzKoi7q+Cad8m6dDs2CSOLvpL7VQnB8Y5H+TsEljVCxMUJrjp2Vk+Vp8EYjKC7A5X7qdlax4woA7vfZNWas+jaaYSXtd/uB8bysamFeJilV9OrIT7SmO0X9iMxdQ2Av6HjQ0+Q8z96ljmkzHnScsc/6hUbTIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SS2YwWJY; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SS2YwWJY"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64d5a7926cfso9838883d50.2
        for <linux-edac@vger.kernel.org>; Mon, 27 Apr 2026 03:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777286871; cv=none;
        d=google.com; s=arc-20240605;
        b=FC26uAqx+vc2kgpaXixNdNJWZ8fliw7Gbsf196F6f6SRnULpV1tcQJY1J+Gany4Xg/
         4a9I9OtyCgjm/lCkf3Vk701kjcIs+NECvWtOZNN9R7z5ic1D8u5KPwaiW17euiSijjbl
         /rY7HDa8BkFZSrGDRgEHkelE7gTDCo3JuqqXNfSksPPxxpoDoqE/uyPsEAm9get7selU
         ltAM1j+6gY25qomM6mfMsBuO/rVCmGR9xWxKu86IvG1vAd5b5VvBaaKD4/3WQ+xsPEk1
         YiPgsJQwceiv1L/mnDY/TipK7t18OsQUiNLv8zAaP9kjD2Ky18aR/Zj+f6qKaV/J7+B6
         hrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tnJ40hQugusFPopXi/ypmJs3DmHbjJZP+ZZdGtfQ8oQ=;
        fh=aTOldl+mhjHj4C5XeTf/qDeQUrxkFFg2Gwl/TjiE+cw=;
        b=bc6HwxcGVUnuyJ23XkXQVKtUAydcb7aHArE0/h6F6s41EzJO9BaiPur0Z7IwRud9wH
         En9Jnm4V11g2L9zaPxEkT2DNN516lIN7W9i78gFW7Bhy4lUQV9GifXJgzBEnIdcR5fL2
         v8HDiW7+EYS4K14Pm6X7M3IjPqtXizK7P18UmO5cPJOrVA2DUZbnWmfASIe3SUvXhlW6
         td/CFFLc98MVKJ3GWAnzHTDLgJRCn4Kqnqb+wjpaE4skfoxUk8C6ixmh4Tm8UEu9HTOl
         9XRER+VRkzzlymmqkF3Yf60JDIKMvpZ38OpzJnle6AU6AoWyV/kqaeYBHNL44V4oBmpm
         fiqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777286871; x=1777891671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnJ40hQugusFPopXi/ypmJs3DmHbjJZP+ZZdGtfQ8oQ=;
        b=SS2YwWJYRNJR0B7dvht4d5NakXs77W3ZhLEWcmnOIxO3Puv9tVwke9vbYyy4AActzi
         W+6MbxFxwrI39sF8CxCumtuCYqM74kjWitXzLGE4Pn3HJ25g0N+wpRE+qYe1pFzjaFgV
         i2NV2a1Ko7AOce9zFktu4s0guBxrhE34d+DMCN/pK4K5fh1cMr8Nt5NxVMXcuop+0Kqp
         7/vrkD676o6pDtWt1YP6mSHVqGJBOVDb0ZTTDnod6EgISef1oOQhw5aqSsS/H2SECTA0
         3uWAoxBQNzfUYjQhBd9Hu3xZqgP0uqygsL6pgLndjqeXdg2wObHI2udLRJvAE9koAb98
         aC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286871; x=1777891671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tnJ40hQugusFPopXi/ypmJs3DmHbjJZP+ZZdGtfQ8oQ=;
        b=JsjheBpjYr8PEk5Nv0Nw/HvRnTpu5fyw9W+36woi1XVMDcBPsUbmcQDuSBBC7+wpCa
         P1TyXDQQjGAR6U2GqNYGy6hrLKAs3p4Pk12syYyaG6y7jy3rBTbLWY4p5HNB49fkZMIv
         vMIgH+8ThPSWPPsBb50lwyTEExvpO7BmGY/FAvtU+z/WQYonJPo6WzapmmGOrW9EbCQe
         SaKZuGsao6lctGLblA36CKCQAcP/0tOMS+vbOFQtxKXmQI8uAfgMOhwOFf4W+SIlkjrh
         TNDGr4R/e8GLtWv7XZuRJ/MQOcBOdQspMpP05XfFqG9nPa0b+BlqCyF5g9AcBAj192Lb
         Rh4w==
X-Forwarded-Encrypted: i=1; AFNElJ9ZYV6o+Hrtb73nD9bVlsAf0JtgAoEeZMwn576XnuqtDI+5WKMMu2C37zu0/zCmI05lxHYh7//bqbba@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmtXIKiwwgUibh3HpGWhBlDVB+y5yAeZsFNl8LDZdLmweFUHs
	X6y9hg5PZ1vcr8HVo9zfwGZXfRQwtkh3rGmdJ7/JMInZsjXgiQ6vBjZW9XQmsQaVUWO9kIs1mF+
	TsjAI/H55h8iKQ21I9lO8B71WazbsSIU=
X-Gm-Gg: AeBDiesWdbPnauGG4dDKvQuO8JROf4IduaeuhedkL+AiR5yzzdsh32TKAygCym07Ann
	Mbl++DJjyTbKAvREz6trlj1yIBBgRSrgjMYJSt2joCv5+IYWj3UtKfqT5oDcgavRMWuC33ChL2l
	M62RQ1FeJMYPBIBVH7+/tgLM4ppr7eoKRXZNh0dhE5+yxJQ7+J30p/AITGAdWh8e+KuI5Yk8t19
	TsKFsfcrxbVYgY6eh4owfuL6vqcq9KesoTmMFbjB9utn7yAfUb5Di8xU2YVRoUrlNFhBbwwyArH
	4JdkwAhd8ijPjbfdVXA=
X-Received: by 2002:a05:690e:12c6:b0:650:314f:1105 with SMTP id
 956f58d0204a3-65410b79eddmr36102859d50.55.1777286871055; Mon, 27 Apr 2026
 03:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329124400.4064739-1-shubhrajyoti.datta@amd.com>
 <c4a7a3ec-cb87-4edc-ad6a-32dbed15197a@linux.microsoft.com> <aehHkO9fhiyoxf-e@csail.mit.edu>
In-Reply-To: <aehHkO9fhiyoxf-e@csail.mit.edu>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 27 Apr 2026 16:17:39 +0530
X-Gm-Features: AVHnY4LL5fZx7fYF9vH53Clb0PfHSdjRKbgnIpiv8EtolhQFGQIti7ZpE938uBY
Message-ID: <CAKfKVtHX0boG4tHf8aVw0mwUWqunmMQ_PnpG4xXmDwmOY+uP5Q@mail.gmail.com>
Subject: Re: [PATCH] EDAC/versalnet: Report PFN and page offset for DDR errors
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-edac@vger.kernel.org, git@amd.com, 
	Michal Simek <michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 9:29=E2=80=AFAM Srivatsa S. Bhat <srivatsa@csail.mi=
t.edu> wrote:
>
> On Wed, Apr 01, 2026 at 11:28:10AM +0530, Prasanna Kumar T S M wrote:
> >
> >
> > On 29-03-2026 18:14, Shubhrajyoti Datta wrote:
> > > Currently, DDRMC correctable and uncorrectable error events are repor=
ted
> > > to EDAC with page frame number (pfn) and offset set to zero.
> > > This information is not useful to locate the address for memory error=
s.
> > >
> > > Compute the physical address from the error information and extract
> > > the page frame number and offset before calling edac_mc_handle_error(=
).
> > > This provides the actual memory location information to the userspace=
.
> > >
> > > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> > > ---
> > >
>
> [...]
>
> > >     if (stat->error_type =3D=3D MC5_ERR_TYPE_UE) {
> > >             pinf =3D stat->ueinfo[stat->channel];
> > > +           pa =3D convert_to_physical(priv, pinf, ctl_num, error_dat=
a);
> > > +           pfn =3D PHYS_PFN(pa);
> > >             snprintf(priv->message, sizeof(priv->message),
> > >                      "Error type:%s controller %d Addr at %lx\n",
> > > -                    "UE", ctl_num, convert_to_physical(priv, pinf, c=
tl_num, error_data));
> > > +                    "UE", ctl_num, pa);
> > >             edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
> > > -                                1, 0, 0, 0, 0, 0, -1,
> > > +                                1, pfn, offset_in_page(pa), 0, 0, 0,=
 -1,
> > >                                  priv->message, "");
> > > -           pa =3D convert_to_physical(priv, pinf, ctl_num, error_dat=
a);
> > > -           pfn =3D PHYS_PFN(pa);
> > > -
> > >             if (IS_ENABLED(CONFIG_MEMORY_FAILURE)) {
> > >                     err =3D memory_failure(pfn, MF_ACTION_REQUIRED);
> > >                     if (err)
> >
> > Nit: pa and pfn calculation can be moved out of the if() condition.
> >
>
> Hi Shubrajyoti,
>
> Could you revise this patch with a similar cleanup for the versalnet
> driver as you did for the versal driver to avoid code duplication,
> please?
> https://lore.kernel.org/all/20260415060239.733200-1-shubhrajyoti.datta@am=
d.com/#t

Let me now if the below looks fine


        if (stat->error_type =3D=3D MC5_ERR_TYPE_CE) {
                pinf =3D stat->ceinfo[stat->channel];
                type =3D HW_EVENT_ERR_CORRECTED;
        }

        if (stat->error_type =3D=3D MC5_ERR_TYPE_UE) {
                pinf =3D stat->ueinfo[stat->channel];
                type =3D HW_EVENT_ERR_UNCORRECTED;
        }

        pa =3D convert_to_physical(priv, pinf, ctl_num, error_data);
        pfn =3D PHYS_PFN(pa);
        snprintf(priv->message, sizeof(priv->message),
                         "Error type:%s Controller %d Addr at %lx\n",
                         type =3D=3D HW_EVENT_ERR_UNCORRECTED ? "UE" : "CE"=
,
                         ctl_num, pa);

        edac_mc_handle_error(type, mci,
                                     1, pfn, pa & ~PAGE_MASK, 0, 0, 0, -1,
                                     priv->message, "");

        if (stat->error_type =3D=3D MC5_ERR_TYPE_UE) {
                if (IS_ENABLED(CONFIG_MEMORY_FAILURE)) {
                        err =3D memory_failure(pfn, MF_ACTION_REQUIRED);
                        if (err)
                                edac_dbg(2, "memory_failure() error: %d", e=
rr);
                        else
                                edac_dbg(2, "Poison page at PA 0x%lx\n", pa=
);
                }
        }

>
> Thank you!
>
> Regards,
> Srivatsa
> Microsoft Linux Systems Group
