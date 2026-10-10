Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE463644A0
	for <linux-edac@vger.kernel.org>; Sat, 10 Oct 2026 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620559; cv=pass; b=VyFlrcTgXtjB4lfj2mYXpnHb96zmg8qRE0/oFJCoe3AvN0vpA88P8djksSHFLdJIEovMzu3XeHlEzkR+AN/jaTPIKCKCSzl8ipOGdgD9AABvj2EJMPsbnfKlG6sGmUdbTK2878pziMpycOGucnVbUesQk+qtO+cae+bwa05W9GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620559; c=relaxed/simple;
	bh=/AZhLQWNekNsyuDn2Vp+BO8azj8kTqIsQL6L/v3rjmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKVgDoQSVX0BQwTr7tf/5jgykHzOqjJhD5ZH4qUC05sMXWkHH6Mgf+feNk1I59364yh//tX5WVfllphqxjRkMxF+cgVzLAhbe+UvrA+T40Qws8XOldTehaFkLT2tzugRvZgbN1LtrR4Y+1SrNaR5oVH3NFQ4RKQxjGPDfS6+cgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/ecHM+n; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/ecHM+n"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8258ac98bc2so448665a34.3
        for <linux-edac@vger.kernel.org>; Sat, 10 Oct 2026 01:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791620557; cv=none;
        d=google.com; s=arc-20260327;
        b=G2A9aZLVfF+AiUbG/JvzRj9WAgWtpOx7SM/yKUF+d7pSX4nCjliARlnj4Yt+igpH+G
         IHyOeLZVyyo3I8N0oo+0uOSJVxxMHGI1qsg0isv9w6cSh+60oih0vt2DCH+pvMbhRnoJ
         QNhTYF2g3Ia5A/H+nbQZO4ZkcUxdndgIlyc5Nz5IKJPESh7LaFcLcJSKcHNFEmwVSr8R
         NWj10orihTtl7CdpGR6RdY3O86Ot8O3QZKksgMfiX7G9oxISJBzBzDWul7E/c27eyW2f
         giWUWNMq+GqVj8IFRHVMXRpcW1LYpYs3Mw5bVwr/rJw8zVjuH+FVGKTqi4+m2HzUCHfi
         Jc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=leU69vU0901atm4DuawOU09rDiJ7Q9eEEaM1dv12Nfc=;
        fh=fXfJ4b8pb1CY4I5l/VgLQfVYYuVJNKwBtMx6tGD1IzQ=;
        b=oofEBqYsyQgDyP/xp58c9xXmsiHwrG4rW1otKFm36r8N1cQkSNz+QW6E6tQP2zHwdh
         yjxegVs6fU52CC8mJX4+bF+MbMz9ihdoJyL/vz1aqxACFtSKUQ3et+f2MvWeVms//mA7
         2LMoASnowRhMpsHvoz7geUoLyzAnQkvpgxJyKeDEhViSnsaEXtY1oyS0iTrGBBtaJElX
         wk51Iy1DUnsHyL2sMuO39lTgp/rkAhwmTmZnb1+ybHDm9MZX4oC6iJKAeigem3xaLdvK
         rNAZLs8AXcrwrtYOaESZSjdzBEcnPZvVSh7rG+LdUuoBdcIW42ynBv9V7pP3hbzEb3xm
         u9cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791620557; x=1792225357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=leU69vU0901atm4DuawOU09rDiJ7Q9eEEaM1dv12Nfc=;
        b=M/ecHM+nvqe1LDXdhhhhfW9nQce75UF/xpovTeAWLRwYqbDsEhFdQaZ0n6/A6p6Olg
         2S4ZWeeZTU8yrpP+l8SruGWcTJyFLh2NLUhTlb7MtZ8O1tQIO92N/Kw3lI/eA0ZXBMYu
         0E/kj5kB9E3B1dqrNru8BffH9EGt59XoyOa2WXvp7tuCdUksx8zpYnsUF1ttTZh+Nx3u
         DrJZpOMQXbMY6gZLsCl/6nrpp1WK/s53RWKlZ0Y13bWpiGPSVjc9Cl9vGMjVT4rqWRZg
         7I4Vyfr0Z8u4wkNX4XmQz1eQ5LGfq8rLK94yaXObf+OrTIt/P/8/iiz/XlKz7YX3KLTu
         2DiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791620557; x=1792225357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leU69vU0901atm4DuawOU09rDiJ7Q9eEEaM1dv12Nfc=;
        b=JtWAodD0kdIcmK3OyF/6WDrMC8facs+5sZedoyCciGEI87+RgOlY/LvXA9hogqjbhN
         RPN2jRX2+SzxSR7QAsADVYNvdj6zCqP/xLXh7FyAsYPa1b85k328vaFfRD+UDrmq6yOi
         m/r79OfNdLdSU5E93p40Xe5Qzg7zHALKZCMyPQablfve5ogzHhu/bpO+Cj7sjizDKJ3s
         X5JwvxScjQODmzkqrLbgIdT3fWw2NREQhn9/Hi556ulVBv4DrO9H9sc/Sc5xkdHgFeuE
         VWRD5D6MepHEYGHhCS1hwwd78iwGGGGiU+siNl6DzFr03WYsuOqDMBNT7za3OHk1yXof
         gwSw==
X-Forwarded-Encrypted: i=1; AKwUvBwuKimMQtUsLBnxypha0JdXqc6Vk9dl0o7pK05iYbLsozi+/ciyOlDw+/EpMp+HVqY+gWlpGC9ibrJ9@vger.kernel.org
X-Gm-Message-State: AFq9FYIsXSnSW2aFls0KQTGnu+uqgNcf27x92CRF67LaQqTK9tCf65hE
	y46hIzRdhpU1TFltXmE6ohZcWnvnssvZVxgueBq0CqNHOFWO79nS3lsr8AJbfBf0vx9uK35x3oy
	WchO1fG5AE2/tr44yEyZI5WrWRhtTerk=
X-Gm-Gg: AYBFou2P9a16UbTRQGF/LuPnInE9bxrqofS3CA8FQSizBD1ME+x4pzLhLBRJSrn8q/E
	TY5/ZQdBpvDIvlVE4RnY0RpWyCqgty9qVsv31ztjZfiKbm2fNr9U2rQ/j5+7+SBaghxF3qto2mo
	hB2ttcxyKyopu8T+2/TYo2fUAkhOlzWk64Vo9haafPrpRujtNoZ77BczP76Y7BEZPDUG+o3GDjy
	M84SDjhzsadWLN4vJGa1bi3dWmLLIjWAqwTF4RjexuegZfoDtUGAGsmKBM+Y95cfuSn87rI52tQ
	2ayTEfk6LChXGfgkpFcGcy9DdKSze7lVuV1k0qw4+t+F+c81OHd9GP0=
X-Received: by 2002:a05:6820:1f12:b0:6cd:3fbd:1d6d with SMTP id
 006d021491bc7-6ef137a1e02mr2955151eaf.87.1791620557289; Sat, 10 Oct 2026
 01:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-2-shijujose2008@gmail.com> <20261005235021.GBasQ3vXTivT3NLbBq@fat_crate.local>
 <asU7svV8g2Hb5DZl@hu-ashoraj-lv.qualcomm.com> <20261008030603.GAascImzt4cv8Gz49p@fat_crate.local>
 <CAG4KcRLhN9=6xeT4qfqKLFdukiZLUc7akGcWwXJUU1-qrfxTUQ@mail.gmail.com>
 <20261008174114.GAasfVutvsmAk8JGsD@fat_crate.local> <CAG4KcRLx69BK+aw+exUzPe+BW8exFM2LLvN9pEr-+1BoGVhFXg@mail.gmail.com>
 <20261010002159.GCasmFJy2F_2S22d4Y@fat_crate.local>
In-Reply-To: <20261010002159.GCasmFJy2F_2S22d4Y@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Sat, 10 Oct 2026 09:22:26 +0100
X-Gm-Features: AclHuK9LcUUipyZ8Cr0mybpgES3o6Alw16f-sgFH5JuXkDfTNuU5e-v-mN4o-0Q
Message-ID: <CAG4KcR+xR8twgQdNABptYZDXXC3BUMNN=-7twEzRTOiz=VngUQ@mail.gmail.com>
Subject: Re: [PATCH v23 1/2] ACPI:RAS2: Add driver for the ACPI RAS2 feature table
To: Borislav Petkov <bp@alien8.de>
Cc: Ashok Raj <ashok.raj@oss.qualcomm.com>, rafael@kernel.org, 
	akpm@linux-foundation.org, rppt@kernel.org, dferguson@amperecomputing.com, 
	linux-edac@vger.kernel.org, linux-acpi@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, tony.luck@intel.com, lenb@kernel.org, 
	Yazen.Ghannam@amd.com, mchehab@kernel.org, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com, ashoraj@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 1:22=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Thu, Oct 08, 2026 at 07:50:07PM +0100, Shiju Jose wrote:
> > Sorry. I meant the issue occurred when setting the PCC signalling mode
> > as polling for the RAS2 PCC
> > (In include/acpi/actbl2.h struct acpi_table_pcct: flags).
>
> Ok, did this:
>
> diff --git a/drivers/acpi/ras2.c b/drivers/acpi/ras2.c
> index 24514e2b99e9..c214e40355f4 100644
> --- a/drivers/acpi/ras2.c
> +++ b/drivers/acpi/ras2.c
> @@ -304,6 +304,13 @@ static int register_pcc_channel(struct ras2_mem_ctx =
*ras2_ctx, int pcc_id)
>         if (!sspcc)
>                 return -ENOMEM;
>
> +       /*
> +        * Make sure the binding to the mailbox channel switches to expli=
cit
> +        * ACKs so that ras2_send_pcc_cmd() can issue the ACK packet with
> +        * mbox_client_txdone().
> +        */
> +       sspcc->mbox_client.knows_txdone =3D true;
> +
>         pcc_chan =3D pcc_mbox_request_channel(&sspcc->mbox_client, pcc_id=
);
>         if (IS_ERR(pcc_chan)) {
>                 ret =3D PTR_ERR(pcc_chan);
> @@ -327,8 +334,6 @@ static int register_pcc_channel(struct ras2_mem_ctx *=
ras2_ctx, int pcc_id)
>         sspcc->pcc_mrtt         =3D pcc_chan->min_turnaround_time;
>         sspcc->pcc_mpar         =3D pcc_chan->max_access_rate;
>
> -       sspcc->mbox_client.knows_txdone =3D true;
> -
>         mutex_init(&sspcc->pcc_lock);
>         kref_init(&sspcc->kref);
>
> ---
>
> Here's the new version, pls run it:

Thanks Boris.

The new version tested fine in my test setup as well.

Thanks,
Shiju

>
> From fb7d2f51280072c266441b645c81258553f1c968 Mon Sep 17 00:00:00 2001
> From: Shiju Jose <shijujose2008@gmail.com>
> Date: Sun, 26 Jul 2026 22:28:11 +0100
> Subject: [PATCH] ACPI:RAS2: Add a driver for the ACPI RAS2 feature table
>
> The ACPI 6.5 Specification, section 5.2.21, defines a RAS2 feature table
> (RAS2). Add a driver supporting that RAS2 feature table and which provide=
s
> interfaces for platform RAS features, e.g., for HW-based memory scrubbing=
, and
> logical to PA translation service. RAS2 uses PCC channel subspace for
> communicating with the ACPI compliant HW platform.
>
[...]
> +#endif /* _ACPI_RAS2_H */
> --
> 2.53.0
>
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
