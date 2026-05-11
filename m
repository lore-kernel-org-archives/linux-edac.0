Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42717304BCB
	for <linux-edac@vger.kernel.org>; Mon, 11 May 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511982; cv=pass; b=LZmI4yZ8z6i+xsW/3D8TV/GiI7XpdhDK7c0fFWAjpauOZFkB2dH1Z//M4NtifPHRuq6BlyWv8iTRLgchQcoOnyHYsOm+QlyEZaAUoihhpSd3ANUa4ZIRAT4SdsEShKQHH4/wTTVvwGqS0u3Him1PPclwTg7atjVUssn0Nvtay/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511982; c=relaxed/simple;
	bh=RaGaAymRyU/t9TmJsO45ZGr/kZlXSwPSz5XWnP+718A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0n/Gp27vuIFvyYefACyrToHW8CoPalp6h4FHtpdZOPk/84x7tCrn4VZfkln6j7sA/ugmymEB24uBEV6Wxr5xN5F0DpzjOTRck1dBAQ5WSex7ePBQq1RmRg1tFOJeyRzmXhhetuU/XNTx0qwewopuwm2bmxg/7DuCEPs4KiiITI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro; spf=pass smtp.mailfrom=purdea.ro; dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b=SQi66xO2; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purdea.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b="SQi66xO2"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso3283411e87.3
        for <linux-edac@vger.kernel.org>; Mon, 11 May 2026 08:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778511978; cv=none;
        d=google.com; s=arc-20240605;
        b=fyqnFtU6pS3i/wwev9mlL8lPmly/QyeO1tZ5l0WYKDEVZeCeERu4q3M4/5gkPqHfkr
         qvyYfP8S83LkWNNnQY4wTYpGHi4X7SFVugiyCgKHgD76yd7AYCqe574bKQz/4I3oVCYT
         mmuBJGUAHS1EuBjUZYuQ1/ZUlJfxoCmgrYdt0pZk3PTcrImVTaxuX4QzwcDCAbQrU1sy
         88r1pyQsqb2Z7w2Ppj6ZFSBn/Xxz6jWTg7yjoh2H/uqNSl0GUhoVD2j0IWHDBMIQUo2S
         NJX7ZX1Tffl4A5Us4Red0mYi3rHyu4h5j77xHrVR2gjAF93bNWE4ns4TSJqv5L6eTbO+
         hyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXxnCXndDingcNWqvMokM0B1++Jk8Ke7ANISsDo1ZKQ=;
        fh=1eIQQLK7QZQU8o8ZRsQoHPH5KAqjmdP725890nm6qhY=;
        b=F8lxp0LbvjjUptEEfV2oRr4ydDAxV+AHvAnzchoh/YFBn6sX8w+UOjVtY9Tg1IC40m
         2QSdlyuMuAldfniaB+CaTYKeZbtbHQFq7QsMWzhCTmg6c3ANFGSwA8rpjzljt306prNm
         qFLkUnFhkqx0Lsw9luSU2QzOEHQE+wVZc7CXtlcM1uoossP6bKyjjggOvbcWBhrxbnd9
         /ICp1iSQL/Ha/EMo6gbRE6wwy1tWPEloRGpjBhgwGO3T/DYZ/v5ijSVUzT7+o1UOd8rA
         wn0DkEYnEn3SCdvpuNuwSjurDI38BAVlddGthMCzhfACZyvLoFOWbdh4IvF+6GVBLNij
         rLPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purdea.ro; s=google; t=1778511978; x=1779116778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXxnCXndDingcNWqvMokM0B1++Jk8Ke7ANISsDo1ZKQ=;
        b=SQi66xO2E2WfwEE+/ohSCNOwk00DojqtqMHtokCr8kNbI62Hkonv8VhdilZKOcjsQG
         /8+kTsr5smiClncvmCqEv6PChfs5e9P3Z99csdRyen9ebyu37PWdg0/ES831J4im8oNI
         sy52Hj7I04VDAR09V8o95eM3KQ/7vDAHNVsTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511978; x=1779116778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXxnCXndDingcNWqvMokM0B1++Jk8Ke7ANISsDo1ZKQ=;
        b=WAFuBvenWcIva94fuf8Q8v+cFUUS2EegugIaw/hVRTMO7I8E2d3vTG9TzpHo3pQZ7h
         iiMMiPQzu5J5C02wwlKyq3QOHm8zJv1xl99sMgHXpM2CocveuRNk9NuDFB26chmeWA55
         Ar5Sn8gyx/4kA9tllD8zuzfngsCqvpqz7QULbiejbtxVchBjGHWgKmT1HIo71b3d1fCs
         61R5SP+DgCA2JGkmsQJuZp4sxQJO5C/yv+cab1ADN+d0TQhvWjAXpQBcQouIAfXj1NvX
         t1kx8GGUEpQO8ATWAZX/GGQhRJbt9sluhZgTpdvFY1mY2xav+MK/nZS1iScxiFiEub4X
         mPbw==
X-Forwarded-Encrypted: i=1; AFNElJ+8+z4VcDaduJby5WcYr+TCda0Tts7EVqlF/fuzesUccT3tVNmyD20J4ErjNeNrYG1UB22MtRSdOXGi@vger.kernel.org
X-Gm-Message-State: AOJu0YwbkOqKfNJvsWi35pOqq/oh7dwQYBnsJtioiO8kn6D6l/Uz8f9N
	IGIPI2lKEdSAnuL8E328ZVbn6D6p+UjaHxBZ9rZlF/C8FcxVsDu57GKfEwNcAckbDQXa1m7MiCb
	Igl6GWsjIHjlZafxO+lpU5iy97AOd4GwnR7L0YRE/
X-Gm-Gg: Acq92OEyAcL0Q14QEPLzxp84DTadPXFH07N8A+7tYEN3m90enu8XiBfpJbbg/3QIMY4
	Pfis6X9iq919RswDCWbJCEHwEixsXIUH8mhDlMiqBM9saVWl+91VjN5FSOJCgZbKP4Sd2VmbjTy
	a/h69Nrp89k4WLvN6z9jICylDC/NwK4gs3ZY2zpryLHuhokaaGjihU71H4P1gDMtcvYZ7XqlEey
	3FUREeh48JXbABE1XlMs4746nLUDeq71bimU/Uv6Voxgojhx9X3Q2auxdxmwRoi7w7RGUsyjiwc
	QuABsPyCXTdFvf5YFrXIdH/mHe3jabAutTS8/W542SIRNtQrbQ==
X-Received: by 2002:a05:6512:ace:b0:5a8:8f72:de76 with SMTP id
 2adb3069b0e04-5a88f72e0d5mr6980547e87.19.1778511977921; Mon, 11 May 2026
 08:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin> <agExLK2GR0w0Z_N2@geday>
 <CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
 <20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local> <CA+mMEgcng1bt=ZysgofrGAMA0oMO-9DxSALXdcT9tK4YgE_dhA@mail.gmail.com>
 <20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local> <CA+mMEgepR=5P0TxfW8wQ5rtr4u+1uAO6F-1dvxktTaRFDjUVPQ@mail.gmail.com>
 <20260511133923.GFagHcC_nLmT8k2iD2@fat_crate.local>
In-Reply-To: <20260511133923.GFagHcC_nLmT8k2iD2@fat_crate.local>
From: Andrei Purdea <andrei@purdea.ro>
Date: Mon, 11 May 2026 15:06:06 +0000
X-Gm-Features: AVHnY4IReNoiPR_OkEBRvPeipGhbF2iT93iUNAzdOYHLBTJ7R65SZq_P-NC0M-I
Message-ID: <CA+mMEgfgFvT0ccv6QFyH6wXQ-DfKCfDzo_gPfS8YYMhTyZTQOA@mail.gmail.com>
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
To: Borislav Petkov <bp@alien8.de>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Geraldo Nascimento <geraldogabriel@gmail.com>, david.laight.linux@gmail.com, 
	"Alexander A. Klimov" <grandmaster@al2klimov.de>, Tony Luck <tony.luck@intel.com>, 
	Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Li <nick.li@foursemi.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-edac@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 1:39=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Mon, May 11, 2026 at 01:13:05PM +0000, Andrei Purdea wrote:
> > But this wasn't spelled out explicitly in the doc, because you're not
> > really supposed to use strlen() to specify the destination buffer
> > size.
>
> Why am I not supposed to? Says who?

Maybe I was a little too vague in my statement, obviously there are
situations in which strlen() could be useful, for example:
If you want to append something to an existing string you could do
something like x =3D strlen(dst); strscpy(dst + x, src, sizeof(dst) -
x); (untested code)
Or if you want to explicitly truncate strings, say you want to copy
everything except the last 3 letters from the end of a string, you
could do something like strscpy(dst, src, min_t(size_t, sizeof(dst),
max_t(size_t, strlen(src) + 1 - 3, 1))); (untested code)

But in this case using plain strlen(src)+1 in strscpy() is redundant.
And using it in strscpy_pad() will make the padding functionality of
strscpy_pad() not function. Since you're the one who bought up padding
the rest of the buffer, I assumed you'd care that the buffer actually
gets padded.

> > Why would that be safer? There's already a strlen() call inside
> > strscpy.
>
> Do you mean this thing:
>
>         sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) +    \
>                                 ^^^^^^^^^^
>                                 __must_be_cstr(dst) + __must_be_cstr(src)=
)
>
> ?

No, I meant inside sized_strscpy (which is called by both strscpy and
strscpy_pad):
ssize_t sized_strscpy(char *dst, const char *src, size_t count)
{
    size_t len;

    if (count =3D=3D 0)
        return -E2BIG;
    len =3D strnlen(src, count - 1);
            ^^^^^^^^^

In fact this is somewhat safer then plain strlen(), because it will be
somewhat bounded even if the source doesn't have a null terminator.
(although with the 2-argument strscpy() call the bound would be set by
the destination only)

If the source can be missing a null terminator, and you want to be
robust against a missing null-terminator, then you might want to do
something like strscpy(dst, src, min_t(size_t, sizeof(dst),
sizeof(src) + 1)), which would actually make things safer, and no need
to use strlen() explicitly in the call, because strscpy already takes
care of it.

> In this particular case, it would be better to avoid this silly string co=
py
> altogether.

Perhaps yes, IF the "error_ipc" string can not change at runtime, then
one could initialize it directly on the stack like:

struct rpmsg_channel_info chinfo =3D { .name =3D "error_ipc" };

And avoid all explicit calls to string copy functions. (Which I'm not
sure, but could compile to the same machine code as David Laight's
strcpy() suggestion, I would expect gcc to be smart enough to optimize
that)
But there's always gonna be some form of implicit string copy behind
the scenes, as long as the structure you're building has a string
array and lives on the stack.

Andrei
