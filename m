Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C67939D6E9
	for <linux-edac@vger.kernel.org>; Thu, 12 Mar 2026 19:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773342802; cv=pass; b=dt4klBRfkMPLVsCbeIP/Oxw8u0/B7BMtiwfq7jTiIBeTIixq2IUZJamzeluidu6uc2qkxEL+bqtjtSxRd6m5SmOz/Jb9SfNfprwQh2dQMxAXPM9DOis0Vxfyy40EVDMK4WJQvWORHwbijGl6Wz6lAMMPQMF4X7EhNel5D0rxdWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773342802; c=relaxed/simple;
	bh=lyP69GJRrwv0QQAsgL3D9V6L4yQtdwZuuIRAYsKpWOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2O1xr4xNfLs0UEp3DS3Vgy+xVuntoyP/+5IkVBBocMzNaajvV6F+cFAxzwrSvZwpp2ys1slVUp7EY20EoIr0nU4jtfwQ+XFFbDSEnheBsT1kDf8dwse6/Dg+kr2lW9dttYteoXtbiBgo9RgtxxmXSWz8Vige4QiHrMOUQuhicc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6bYkSXH; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6bYkSXH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b942a41c5fcso182258266b.0
        for <linux-edac@vger.kernel.org>; Thu, 12 Mar 2026 12:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773342799; cv=none;
        d=google.com; s=arc-20240605;
        b=d2OuJ1q2Ht0XdhZY9a39t6h99UalAJrkLFMw7MJKmRrddhrKXuNQGvFqylK5sVVBJ9
         ol4wfkxmQ7YcdP7W3eP2nfxfpeoRpR+ORityJKCIc5KkK/2kebE04xy9sUik8IW8LWfj
         1DNZL4Fp9HFS+1X1UR9LXNWoHCIRuHaEP3S86MOtE4ibxMwDMNMynTy+NrH6CSW9FJQ9
         j+8TJZjfnYgOPa23eo97ttOAEHDG+0EgSxjO8sW38DSSFuij6YR4nRtoT2bWsyFINWwe
         JMP3y45MfJaO50w4mDiXomAbjcER9npgo9GT2B45arhkM8j8Ez9b5LsTKgKtIqi03ywK
         /xng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/H7v3o957EUpQyPVZbAPuTTS6j4qz4Nq2G75uGjkcAE=;
        fh=3tM3iuF8DmQ9N/Nf64as7a3qiB4ucDC0+86SotLxjvE=;
        b=HpcjRYWQTtlmdf1/I7OTVKwyMObGNFxdOSr84Ki0nEv0GWKvCfnXhAqxNJBLvL25el
         5wf5q3G9NksGtifzmXOKz1WZG441ddwY2wxfgSo7osDnQ/lXUg8U6KnlHlUNEl+lRuD9
         Qc4UoTIl9/kfRpok4er9FMIwfyRQvZymOeKTT7VFWxLP/ZaHbbKcJM1v86jcDlpfml79
         aUm03y0+ZQlgihRdDOhSQ53riTVi/6qo9MEqXMwnc1uLVqIxEmOTpfi9eynCkIOxVDO2
         T2o5OYAbYQN8VtIJA4PnKHklAYV0NqcDrId/Qzp+jGE3OG2vXreKBfXoU96ETr/ERUCe
         PYZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773342799; x=1773947599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/H7v3o957EUpQyPVZbAPuTTS6j4qz4Nq2G75uGjkcAE=;
        b=d6bYkSXHq8M3X52oNh1lqwpom0c1KEaGfwJIm3bfz1GJlOCAY531/uqr6rvle/1+mx
         Y5Ua2BGmwMYjLyUB5/1nJj3rLRiG1Q+Wn28M4bel62ksUw+lSZQSyhu+AwkMZvQhoxFO
         98t72tq4R2/jJLJlDoeRKg0TseYF+AqG+1DSugnx7COVNizGWUu0YvwJ4lRfTiUo4sA+
         2gy/vilAdlTETBy4prHVwWDY4OV/8KDHd+Z8Ka6LfTAfvouladMLP3LvBx+iThz8Jst/
         WKnBZrXW/KgsRI6LAE23tpwZEv1IDFtqZwa3iV68ZYhhCejCcLSZbwQRogcomPUxWfWP
         Kc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342799; x=1773947599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/H7v3o957EUpQyPVZbAPuTTS6j4qz4Nq2G75uGjkcAE=;
        b=Sm8utA7cO8vZO+vQAhIwpZpPFZ4P7LbVrDtzxwu6DXyzLfBKuupbidqEvqeJqe1bo7
         regIGdIaJxaNzEVVvegC5tDz+K6mh86pTHsBchSd9RVQ36b3AWb70IaUtLIDgquPX8Dq
         +Bu/vQwzPQbIsVnWKxMlXpsaHfo10LbPUaZ9jmYhKeXSJRsMllLeyjgQZEZ2DAXDBcnv
         HCacZw/BZx2OOLM8TUAVV/imC6C+PgAH9jSuNx5Oy+dpez1O3xSWmgg8bdfCRLNoguox
         IlNcRCl1gfUCMuhAuJrEzYGB6/gMl2Slg1ERJvQkN86yl81o0lYQ5KPiJxs6LZET9Oef
         yxAA==
X-Gm-Message-State: AOJu0YxLmAGJNOAskqmNKo2iZOElkiIayxsGixdzNY4lwwdw2tRIfwg5
	uZdmBNFYmnR2fIMl0VCC1rXjTRUVw7E1caQtVwsIaVSY1T7nZVNx8qaG94YknPrp+Z2w6IT1hjE
	/rAwjkn/aQPevLddNYVPvMzLk8LKAfqU=
X-Gm-Gg: ATEYQzzIRqMdOCsNLGwEgitKPkbPAGa3+cCef84t7EfVcRjKzHr3tP2KU7v0U4bqCBc
	CiB+2SJ5kMAfiinc8HXRhIls375vswrrj5QCd/oKoPhmbVGY50CWdi01Oe6oAtnYpG+vDJQSHhJ
	A4Xv6EBNmRC5NLBXM8MJ6hbV6kIlSE1Yz6qf1W//EHZaCvsLqjZ+kroJkS0QW3K6febOM5RjXur
	9PDUQwN8T7a1WQoE0stiq0o2AxMSsa91DlqJECKjOrZkXNCyaDWU1bBIe2jNxQq3fSJFZQsIPPn
	5OBbIFvZV3wskNZXJgYL4v0OqJnT2LI5nwB3VdBUJ+cgzJ06kkhb3txe49oYgG86HqTYrWwTddL
	oganudg==
X-Received: by 2002:a17:906:99c5:b0:b93:59db:ac6b with SMTP id
 a640c23a62f3a-b976507b071mr30331966b.5.1773342799180; Thu, 12 Mar 2026
 12:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311232545.18492-1-rosenp@gmail.com> <SJ1PR11MB6083C3A677F5C906222794A6FC47A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAKxU2N8zSkzJMp85hgRN453x8bcPDvN_3tXmp-sNfueZOAuHfw@mail.gmail.com> <SJ1PR11MB6083385736D708F551CEC85DFC44A@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083385736D708F551CEC85DFC44A@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 12 Mar 2026 12:13:08 -0700
X-Gm-Features: AaiRm52jVl2YcO6DIkn2mjvZFsDX5fGOT6th8Eqq-_k1mgUQhSIQevWqa0VCUVI
Message-ID: <CAKxU2N9X18LOw77eM8fqryqrc8yERSbnUNZVzDtY+RoZv6Snfw@mail.gmail.com>
Subject: Re: [PATCH] EDAC: sb_edac: use kzalloc_flex
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:\\b__counted_by(_le|_be)?\\b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 10:09=E2=80=AFAM Luck, Tony <tony.luck@intel.com> w=
rote:
>
> > > +       sbridge_dev->n_devs =3D table->n_devs_per_imc;
> > >
> > > Do you need this? I thought that kzalloc_flex() filled in the __count=
ed_by field of the structure for you.
> > kzalloc_flex is just a macro over kzalloc(struct_size()). It does not
> > do automatic __counted_by, which makes no sense.
>
> It is a fancy macro. But may be complier version dependent whether the co=
unt is filled in.
>
> See include/linux/slab.h where kzalloc_flex() uses __alloc_flex() which l=
ooks like this:
>
>
> #define __alloc_flex(KMALLOC, GFP, TYPE, FAM, COUNT)                    \
> ({                                                                      \
>         const size_t __count =3D (COUNT);                                =
 \
>         const size_t __obj_size =3D struct_size_t(TYPE, FAM, __count);   =
 \
>         TYPE *__obj_ptr =3D KMALLOC(__obj_size, GFP);                    =
 \
>         if (__obj_ptr)                                                  \
>                 __set_flex_counter(__obj_ptr->FAM, __count);            \
>         __obj_ptr;                                                      \
> })
>
>
> See the __set_flex_counter() ... looks like it is trying to set the count=
ed_by field.
/**
 * __set_flex_counter() - Set the counter associated with the given flexibl=
e
 *                        array member that has been annoated by __counted_=
by().
 * @FAM: Instance of flexible array member within a given struct.
 * @COUNT: Value to store to the __counted_by annotated @FAM_PTR's counter.
 *
 * This is a no-op if no annotation exists. Count needs to be checked with
 * overflows_flex_counter_type() before using this function.
 */
>
> -Tony
>
>
