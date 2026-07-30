Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007C036D50D
	for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423801; cv=pass; b=fRhAHWOGEA9kPZVJeukg7UcVTSEa0GGskgV9noKQu3dgoUzJBTmcNflvbxs0VahuRrUcGzld1QjRJKQr3ZWaVJVcm9nBXkFpWPkBScB41nIvhqGh7txTwVmJx6JeAQmGweDQ5ackF76U40+R0DYezpq5atm6a5y8N64LRN1VoCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423801; c=relaxed/simple;
	bh=HPRe+sEF/j6sltiirPnDAtD5HFdntY47DgnxhMiQK7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTqsvfOhlebeQ2ZixwmrFZW8r9ShXiiRZj96DiKkQEVQHrKX4/oUpg39XVwGOpblT6ZQht8dZ0ngb+GYY9FPt+aTnf2/oO1wLwRlnkaCyZDuoG7U6mWLKkQZzPjTbx2t6RGqOrxs/MnaiYqtDWrfUmAlj5cOsyLnkj06arKxAl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ld+Yc0KW; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld+Yc0KW"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664c6304683so2116465d50.2
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 08:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785423799; cv=none;
        d=google.com; s=arc-20260327;
        b=rdTekdj5wyK4ef7ME8S7GPZ8Vh6JZo/s59DPEPxE2S8t5TCcUTgWIy4V5oinpuFp8m
         eUpw5uW3Y1UTkQnSOcFSXbcaBOGZVJX0tCOGZbni5H6T72cG9TmvtYJ0wAYIzorqOAnX
         QofhX2lFxzws4e4RiOJ7B8wkM1ToYNMCG4CKu6DqptB7GnCBqGFkPYFAte/lw4b9of6u
         6EFG8W+vNdS9XFFttMvFMpg/btAoNPWLQwZJCTouYTE7rXAj/URkRCgoXWneHyLu+rMV
         l2HS4WYA4ocDEt777+8pF++jbFzeHnqB5/7Rh4kBg/B474B+1Np0/Z1tZ8OlrGg7xBN+
         OgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HPRe+sEF/j6sltiirPnDAtD5HFdntY47DgnxhMiQK7M=;
        fh=T7BT2OYM6IH6eJG1tKOfEjb2op0j1yPtTooeTJ/SGag=;
        b=BN4N9DZM/el9ywjA8gfAX5f4MvL914TW4nfB7uwDMA8db40lU8o49ptNp0g1Kf7zUk
         jz0/2xXRvIVw5QQNDDx/WmuqljUI4RXt7U2gSugSIX8mEqsOicDiH5EkpCajYptCad7r
         YhyM3ID2WBHvrEJbcDwOtXjeQlppq+nR+4HMvhn8hffxtUERe/cqvKVI1AIuLEc65UOI
         d3fNS4brvCpJib2m1gApT5YAU2G37FPXEnAFAMtHZ2PkPXJOUKm5ZhX4moTCvsRFS9C5
         0N9RIqaW3y7MkXmqossWs1wzifVNMg+aqXTtHcs/lzlTrCm5tnTYEzDimVTfCShSGKKb
         FpMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785423799; x=1786028599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HPRe+sEF/j6sltiirPnDAtD5HFdntY47DgnxhMiQK7M=;
        b=ld+Yc0KWzUbFhV+9KHXEKyvU+nxaZffjZ2iAE/Ls7kRQ4W7vkuLAk47JvVgoIbJUrk
         gCFx4RC2ENEQKaO6iMwm2mMEfusmY3XE0cGD2yT0REXlvQSJdBPgThEcKcov0/TiS4hn
         27CuMVWRIL/RVub7+s1+y5zeEnXxai+Y9bMbXcbcQYtFDV6retrGuYcY78WQD3gKXVcb
         nG8R6daqWuhRg7dqXhkdC4RrwTlvAXmzIXzflq5s5HTYYB4u8JS9CxBM77jRlkNwAmwk
         DF4UjtelCQ3a/MbR0cTA1JSuBT6u2tLGn2TnfYb46CL/z1pnWYlASiiwXShQ7q/fhqz4
         hn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423799; x=1786028599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HPRe+sEF/j6sltiirPnDAtD5HFdntY47DgnxhMiQK7M=;
        b=YpdDItLSBdlhX6JWbYcrGmNr4BJq0erdlnNUZfuhlsuxEpG8lKBMgMprE0flNypxbw
         E44FRrFuH1qfh/x0f5ZiuXez1B1dwDbkbKvdMI30Td4UtzxH2ERvSRfl3URO/GvUoFZE
         Jf3LeFD/6YTnUPTiIkFQuSHRMq5jC340Kq3BjnNJAeSU/Jlsuv8cGuNQtv+0M76WXm3L
         LjzW+dY4CSyVka9P79MMJKzJZt/OA1irr+x8o2OoQntgJAWU2Gq9OFtC8/yoVfnkxP+Z
         MgCmrj9mXTlPakd89SFMAWrIO7FJpho/00861bTBUu6H4OkJE4oIOOZ/1Hz8rKlqQtlX
         a1Rw==
X-Forwarded-Encrypted: i=1; AHgh+Rrge7zxbLRciHD8Rj/G7T9+6Qhq/88xrf41KTcfy2/WPJXGV67KUEpXsLIgsh1LAhCdVZ/3PSAzT7aA@vger.kernel.org
X-Gm-Message-State: AOJu0YzOzj+9Y4zMorEFix4S2BnNai7Ep+54XF04KdbNqvj6uVVyJWM3
	spElrufOnctrFILSAqxdP8dpryXFdRe2B9g5oGLme4dDC7X8I2pt+J++cc3yTcwBRNGL3iVIQQY
	17IJGqtMCO2D5n2US8fMm4QHFxHmoUzg=
X-Gm-Gg: AR+sD10kDcEOYeOFLhiv5EeibZkoxLaeZg9OWVFi0FqD+fwYZ7oVM6ERHEWP293Znmb
	6RF5yPjgV2DFqpfqmo8IOoDVY8CInrq89uWRfqiKU3Ld2euf4YgEDzFCIzw6mivvZ0/DluV3JrE
	MHiRgUp7NPsPRmuj6PTVbaC/g2m4vDGbILMItSfVoA28nleRZxn7jBj3j0Qjq7LOEdCKJv4QH/V
	hZQwa3wBqnCsAHimZc8N5qjbPoO40keZLZD+kaLJYQrCjh/FyfGIv3/gaOPaXv+bDCWWEvubpdO
	zmJhzvEjhp+Oec9sF9mb8pH6nDnsuF6VaevQ4xeGUIHz8w==
X-Received: by 2002:a05:690e:4403:b0:664:ae69:230b with SMTP id
 956f58d0204a3-6692f740a41mr1312642d50.72.1785423798654; Thu, 30 Jul 2026
 08:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-2-shubhrajyoti.datta@amd.com> <20260726235228.GAamadvFK6GYNRx_dh@fat_crate.local>
 <511e62ae-79e6-4931-a7b0-4f0c3830cdcf@amd.com> <20260728013725.GBamgH1WcvOaEtAw4n@fat_crate.local>
 <5554052f-398b-4507-b2af-152a7695abea@amd.com> <20260728213300.GDamkgDK_DeaaHFHff@fat_crate.local>
 <34ffba5a-8e9a-49b9-9e36-c31d0e4369f8@amd.com>
In-Reply-To: <34ffba5a-8e9a-49b9-9e36-c31d0e4369f8@amd.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Thu, 30 Jul 2026 20:33:08 +0530
X-Gm-Features: AUfX_mynbPWn6YyuDtTEeAJhW3aPSKlsPnDmwo7vpgVB5smEqYRiICc-XKnRd88
Message-ID: <CAKfKVtEiU0jOtAgXkabAEZ6YyE-TTFf-z-JWYAeQQxf-EP77sg@mail.gmail.com>
Subject: Re: [PATCH 1/9] EDAC/versalnet: Add NULL check for mci in handle_error()
To: "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-edac@vger.kernel.org, 
	git@amd.com, Michal Simek <michal.simek@amd.com>, Tony Luck <tony.luck@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 10:10=E2=80=AFPM Pandey, Radhey Shyam <radheys@amd.=
com> wrote:
>
> On 7/29/2026 3:03 AM, Borislav Petkov wrote:
> > On Tue, Jul 28, 2026 at 11:57:28PM +0530, Pandey, Radhey Shyam wrote:
> >> One clarification on DEV_UNKNOWN: on Versal NET, the driver exposes 8
> >> MC5 controller slots, but a given platform may not have all of them
> >> configured.
> >
> > Are you basically saying that you can have non-contiguous controller sl=
ots
> > present on a system?
> >
>
> In the Versal NET designs I've examined so far, configuration with fewer
> than eight MC5 controllers uses a contiguous set starting at slot 0
> (for example, slots 0-3 populated and slots 4-7 absent).
>
> I will let Shubhrajyoti comment if non-contiguous controller slots
> are possible on any supported platform?

The controllers cannot be non-contiguous.
>
> Agreed for real init failures if initialization of a controller that
> should be present fails, probe should fail and unwind all instances
> registered so far, same as amd64_edac.
>
> For v2, my proposal is (only if contiguous slot are supported):
> -Take the supported controller count from the design/DT rather than
> always iterating hardcoded NUM_CONTROLLERS(8). Though it has dependency
> on XSA support(hardware description metadata archive exported from
> Vivado) and DT binding getting accepted.
> -Run init/remove only for that range.
> -Treat DEV_UNKNOWN as a probe error with full unwind, not as a silent
> skip. Indices beyond the supported count are not probed at all.
> -Document this model in the driver.
> -The existing WARN_ON_ONCE() check in handle_error() should be
> sufficient so the current patch can be dropped.
>
> Shubhrajyoti: please chime in if I've missed anything or if you
> have a different view on this approach.
I agree we can have the controllers in the device-tree and this patch can b=
e
dropped.

>
> Thanks,
> Radhey
