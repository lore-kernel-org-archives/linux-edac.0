Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CA329CB24
	for <linux-edac@vger.kernel.org>; Wed, 24 Jun 2026 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286232; cv=pass; b=UcBZC3qIuoEBbGE1eU3rt3SSRLBdrrU1pInIGwk106I99WE7DUnhO3FGyC5TnLilPY7ujAAlHBahSen3usbUz7jGG+UAe6Cjl4PyOxqVLFopnMqVIQvOJKnqNEOg5JmPnSMTygjtAOjaXg/SlyquWOuaeC6OvOxM7JU154FN190=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286232; c=relaxed/simple;
	bh=1UjF9iIP1f2uYZlH8UsMA8REHYjZUtgC/tbKP5+T2ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3NfkWMVB2u8QdmBXGD2A36QFbc6X2dPoL/FgqoM3JCMHrUoQqrjy29gDyOZh1e43KpVhVp+v8wWCo+BJFtDcNhzMvVdsQ7/k2DBSs/IOxEdVAPT4tP7BExGV1vF+ViueJRvy0aVSvLwimZ6Bct8PbjmMQ7viHQb+yRikmGrUTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzdVY5Qg; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzdVY5Qg"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66388bf3793so285505d50.2
        for <linux-edac@vger.kernel.org>; Wed, 24 Jun 2026 00:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782286229; cv=none;
        d=google.com; s=arc-20240605;
        b=JD0/AioPVfGaVhT6mlz0zxmKXpRAMTYsUHR2W2ru4nXfnMIXboGwwAruwSSOLWF0hf
         N6NnNHGY42cme6SIQsOKGCsQK4MwNEl17d6oWTNcBB5QSruH0vitd81rPZyGtNCH3bJl
         hdcLlReyh55tH48qcfmBa3KSpqlrM/9Vj7uu5ik9Rx3MTdR5UGgnazYTO85CDMC6evV1
         0qQwuHLs8aSQFR/IsDwMK/lmXimcVVleEhoT/gfqMMi/c7e8KfKxSd+8PsO7G1EjoEue
         Gy0tD5b1ell944dDQ/JZ053g4Ml7KnPX39IE/dRBCpsb26+JcmEB2lEU8JhRTQuIck7z
         gBhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAwbRWcpNiK2e9PMd0eBOF0LS4PRRVptX+igmm3L0I0=;
        fh=CwpT1uaGqjRz+9g/oCowFm+NVh75pZ0yPs2i5nNu3io=;
        b=delUy+7QAC+uOJoJDy3e6uu1nFfCU4PA1K0np1eePfEX0zX6VHTdx2TzE+5nl4azq5
         iK0hs9j8ZsEm9SQ0jb1ISljvZyKkC96lngv+J4tqxz/HpoOkBuZPIE6Kg26t75VBxyVA
         U4toBEPQVKg1BG+DBE7nlyasBh46/DEavKF0hYF7B/o9OXOnZJqDRBRSYY76oIe7ePNm
         oQ4qAkeisyD3ZKksgxDyYCmvy7nWCDHN+84ep7Z8cufXv7CEvjRdYeLJdRqMs9iJJFSX
         KKvP1CMA5pKRtlu3i3d53FhQ4Wtv+4nxM72LYAauqtVz7V68uWH7yIOci4pW9UKfedNl
         2zBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782286229; x=1782891029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAwbRWcpNiK2e9PMd0eBOF0LS4PRRVptX+igmm3L0I0=;
        b=ZzdVY5QgOKjS1vv/Do6SurHc2tBTjIkvv8XJqZbnfQLQoTcCnBD6oHMuRuijn85wRV
         mvjvuiTDruG/unO5V617hYXZzmplOPWx9PEe7xTZsi21wSU77CbacLay7BQ98YsKdUUc
         jh4uXLyjVVmAzQsX4qp1dtYycKHk2qEcqA1vZmaqxfjEbKsmGRoHjddsTKBzD45YIM0Q
         hNG5ylCLu05nQKWWaC998Xb9L+ujt9t0NqPBB1IMtX3GCN4mY9FKE/wibk6ZfOFV628k
         uJjR2l4dp+guiX/T2EWCbTPVhkcaoIAwTxivIVM2TZS0gOex69iJS6sNBMO+wWbSi+E6
         X+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782286229; x=1782891029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uAwbRWcpNiK2e9PMd0eBOF0LS4PRRVptX+igmm3L0I0=;
        b=iSzKLvz0mz54h08GWpFgmVmnxMz+lnAe0QBc76qh8bibdyGg4O4fc2bJosyYiblZUr
         0yNLkurk3a3K0OIQWepse2fvn5HwaF0jrRbBnF/WoHDBPNjpXUvzgNrRbDkqB1WQ1zv1
         YyfFFT+MBVrqR/XGu6hraxiJQ0gK2LuZzhFSeXqzVAYRYap7+3vScX597siB06P0HDq6
         ynbEnMs8BwfQp5pukTnRHAWu2zt80/4hVZMBKPRw46rbNmxY94jY1/IW9AFY1G0LuVIY
         9Lhw2iV2swdhT6LVEU5zmADf7KWSYdayrQAqZOjNEWutfWf+CwTY9ZTTN++eOGkymDzi
         7Zug==
X-Forwarded-Encrypted: i=1; AHgh+RqcGNWiePBR1+ZS2lCffgEKCfES/sE9PZxJ/93eiv6zD1+I7HDCf9e8hjKeJlgkXsMO+//d6jOQskUm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz79tWTKJQg1TavogubqYvcUo5XsmuRWmf7uM+B+CKN9/h4R1fJ
	HdIGYK+tEemN/aULqy2JNpMshENZgac8DA0f4hB+SsLSiiq+iLJaDk+rqr9nZkoWytGjFWj+KqM
	h5vdAmcn3vy9ae+gTmy1lZxU1NnWc5AI=
X-Gm-Gg: AfdE7clPHAdfzTzp0SjSmZr0wz+WgUzdbM9i3IbHLrY7wd0vQDwfyfWw+OzlVyhEsln
	7gq9TiaoY1i3q2kqZKRTXMtJcfTqwVTrPTm9IMLKCzh4Uqu1/dckR42dnVeXX76floC0Qs24OBi
	wmniCitca26N4rdKWvNdU21zbyQ07mOs50u87pptLV8kb47niZWxn6eOac5uwbnac99vESRLmzW
	GNcuh6MrX7dnx3KwAR/Rw1pPEHQtHwkXJ3Z1UoHdBKieCTkpn7UhnaqyMgcCDvek2YzBygSXQ==
X-Received: by 2002:a05:690e:408d:b0:662:b2e3:cd50 with SMTP id
 956f58d0204a3-66359f9c5e1mr5638572d50.28.1782286229478; Wed, 24 Jun 2026
 00:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SA1PR11MB71307704AC76D92F04FC634489C9A@SA1PR11MB7130.namprd11.prod.outlook.com>
 <20251117110219.35852-2-ayaanmirzabaig85@gmail.com> <CY8PR11MB7134D2BE6FD3B07447A8425B89D6A@CY8PR11MB7134.namprd11.prod.outlook.com>
 <aRy-_vTTBL3jXbOq@ideapad>
In-Reply-To: <aRy-_vTTBL3jXbOq@ideapad>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Wed, 24 Jun 2026 13:00:18 +0530
X-Gm-Features: AVVi8Cd1BvCVh9iuG5IzRgV-ZUrm-l_shj4HwC-4JQPQcrPSMWBJzguq2qV2O6s
Message-ID: <CAKfKVtFjLoue2tOs1Q268-kzptRiqYnw0zeRh4J2LHyK9=9zqQ@mail.gmail.com>
Subject: Re: [PATCH v3] edac: versalnet: Use kasprintf() to simplify string
 allocation and fix error paths.
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"shubhrajyoti.datta@amd.com" <shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 12:16=E2=80=AFAM Ayaan Mirza Baig
<ayaanmirzabaig85@gmail.com> wrote:
>
> On Tue, Nov 18, 2025 at 02:02:01PM +0000, Zhuo, Qiuxu wrote:
> > > From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
> > > Sent: Monday, November 17, 2025 7:02 PM
> > > To: Zhuo, Qiuxu <qiuxu.zhuo@intel.com>
> > > Cc: ayaanmirzabaig85@gmail.com; bp@alien8.de; linux-
> > > edac@vger.kernel.org; shubhrajyoti.datta@amd.com
> > > Subject: [PATCH v3] edac: versalnet: Use kasprintf() to simplify stri=
ng
> > > allocation and fix error paths.
> > >
> > > Replace the kmalloc() + sprintf() pattern with a single call to kaspr=
intf(). This is
> > > cleaner, simpler, and avoids potential buffer overflows from the fixe=
d-size 32-
> > > byte allocation.
> > > Handle possible NULL return from kasprintf() on allocation failure an=
d ensure
> > > proper cleanup on error paths.
> > >
> > > Also free dev->init_name in the device release function to avoid leak=
 on
> > > normal removal.
> > >
> > > Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
> > >
> > > v2:
> > >  - Add NULL check for kasprintf() as requested by reviewer.
> > >
> > > v3:
> > >  - Free dev->init_name in versal_edac_release() to fix the existing l=
eak.
> > > ---
> > >  drivers/edac/versalnet_edac.c | 15 ++++++++++++---
> > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_e=
dac.c
> > > index 1ded4c3f0213..360d4f83ed89 100644
> > > --- a/drivers/edac/versalnet_edac.c
> > > +++ b/drivers/edac/versalnet_edac.c
> > > @@ -15,6 +15,7 @@
> > >  #include <ras/ras_event.h>
> > >
> > >  #include "edac_module.h"
> > > +#include "../../include/linux/device.h"
> > >
> > >  /* Granularity of reported error in bytes */
> > >  #define MC5_ERR_GRAIN                      1
> > > @@ -755,6 +756,7 @@ static struct rpmsg_driver amd_rpmsg_driver =3D {
> > >
> > >  static void versal_edac_release(struct device *dev)  {
> > > +   kfree(dev->init_name);
> > >     kfree(dev);
> > >  }
> > >
> > > @@ -812,12 +814,19 @@ static int init_versalnet(struct mc_priv *priv,=
 struct
> > > platform_device *pdev)
> > >
> > >             dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
> > >             dev->release =3D versal_edac_release;
> > > -           name =3D kmalloc(32, GFP_KERNEL);
> > > -           sprintf(name, "versal-net-ddrmc5-edac-%d", i);
> > > +           name =3D kasprintf(GFP_KERNEL, "versal-net-ddrmc5-edac-%d=
",
> > > i);
> > > +           if (!name) {
> > > +                   kfree(dev);
> > > +                   return -ENOMEM;
> >
> > On this failure, I think it should "goto err_alloc;" to free the alloca=
ted mci instances
> > instead of directly returning -ENOMEM.
>
> Okay, thanks. I did overlook this, my bad. I apologize for these mistakes=
 I keep
> making again and again. I'll make sure there are no more errors in v4.

Did you get a chance of working on the v4 .
