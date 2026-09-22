Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63548364EBF
	for <linux-edac@vger.kernel.org>; Tue, 22 Sep 2026 02:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045837; cv=pass; b=VnYagh/TWviKvhrQ/Sq9/kCIjpmPdlCTyDZfP2+Kj5KCpKv2bC/XTf90FIG7cnP9AguSFOgpq0x7t/SZ0k5+RtryRAtSQhgccHxzoRkPJd/hvcm3pzTi00O3By0ZXSEv8qe232ZVR9asG4uDEmkt5I5fJ3OMF6nJlBXr3MB6Qf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045837; c=relaxed/simple;
	bh=rSSvhgyRa46p7j/SsA/mJy0NbA+KId9sWY2tpVWSynA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEyP9T741avBXYE8VBvJEbg0Ya6f2FxtMPVyh4ubM/Q5qJdZ2eyXYDGIDI4CE7hlmzD2tl4miK7ZcaW0KkpUHsEditmRVY6Glg+ijVjLr4CXWqbkIV8kbx8yt4k91qLYdYOyL+CGy63B642QwNBq6f5Nyzn6hPjC9/08DBnXEZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpAjbrQL; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpAjbrQL"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-864cd11a932so2790037b3.0
        for <linux-edac@vger.kernel.org>; Mon, 21 Sep 2026 19:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790045834; cv=none;
        d=google.com; s=arc-20260327;
        b=suwJd+eIwRnH+LuTmdVJnS0RFyk0sc3GFFX1to+yo7B/8m9qw+zMtl4zkelED0egMZ
         sVGJur2eZj917nlXcFR4JzxIAA4KkS+3N5iwfx3DZuO5EbhsLXPgKjjNVM84/+D3ZtRM
         tXiw2+ULEGtqCxsk+pgNUanxeJceLCGrgddjAa0pZOzNMP/qHvgLP9r009zYnaYkiomU
         cCU9NFBQPMxXCAeZ6ukZ3XZU1qDiZfNG6Uw9rjQyZ4o57jJ0y0bux+iD76otHiJzvi70
         pZvBQEfhydqKf1knw5dInoXnpEfAdJBjwm2HyXRdmspBImW39oMYjId/MD1IDtlFlTvh
         6L7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X2tpzVt+gcVZYhPBgxtL8VLYLcTyyDtnxIRx52+6gIs=;
        fh=aC0KkQmqiM3q1SDqfA6tIq8t6UPaA1Wa9IsL2KXm0Ow=;
        b=ltS/Hs9Cc+MkYV+UnhkgnhY6QIuMB7hRz1AV0IXi6mgZtXqLDYLaXbalirFEUEIseF
         zkmYXvDcWMDKcLN6woRMTqMc4kCtkst3Mxy9+7gC0HYSCgR3Tr/euyEdBZrWcrQYALpp
         jytgYT6sc3KywGunlfclPRn0WIQabxJCiWqi+9HGWpe9DcGbsEvlMA7nPpZSuf+MrV7l
         8eEVGElg0JdT+X7UH1z4lyh0VfEY7V0x7Y15BWBxgqfwrX6o/cNWnIKdiBwChjmM32zM
         xQ/mRo3LPw5duUGM1BJTWED4pRkyV9S2VbMNC8FsgkYZ/K33ppvjRBmLOHaYckZB6GM5
         1mvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045834; x=1790650634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2tpzVt+gcVZYhPBgxtL8VLYLcTyyDtnxIRx52+6gIs=;
        b=GpAjbrQLYsRDi9CMshdY8i5LW0w7hYHUuKyEPaP20EppSr9LTcktfvZoQTPcCfY7Ei
         HZyH36RGX3VQS44/ejZd6/yJaWwJj0j4OcaPwc2zMlHJxZl8O8UVwLwLDhTIU6ycMtuH
         EQtYhl/WqjbRnH5wA+EwRfX6j/YmGrHPRb5SyXWPO2JeaAHk1iCHwamhQb4YE9L5XUI9
         iXpFC5jQrbpoR4zXktyv2REmco9XrhmkHRCqNbIOQcCLRc3PLBglojl0BSkK1Oygmr2Y
         Nb6G2WDrfINysnINCDChp0so5s9WskdrJkhysZ5vRQfCX9eUN+OW1N1vSCH0tRfXd8Lr
         iblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045834; x=1790650634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X2tpzVt+gcVZYhPBgxtL8VLYLcTyyDtnxIRx52+6gIs=;
        b=SqIS0r2o8N6996QglfA5aFmJba4qzchs3qiQ/4DTgg74fSrXGk/+1QLRY94UQ20OzQ
         VfW+EBkF0yhT8dD+xWsGD75r6osXGwM05kq+dFZ0yZgA23KNe42PmLmY1BMme10QaNuJ
         r6rdWWtfpqjb4OW7vSHOoAYmHSlxxKiNDDefHm16VwnWQrEVhC3XAtL/oh3kR6edZp8v
         T5NZSj198qXWOCjQYRvBBFTqBuZLaSWBx1/F8rgaDoFZyrnp1S68pvG4JXMjhpSZi2kx
         7Nb0EeBXpgka/jJdBdkyUZEGmZgTKVS9xTj+iQCyRDaPojj1G4d+6NlgdAcYfB4OPm5O
         PNwg==
X-Forwarded-Encrypted: i=1; AKwUvBwPOXbycIcR/trHKkKEmRziHufYpjUj04YXELojnTb6rmouceanD/sk/d9Zgfa6GX3p3RM1MQdaFOG9@vger.kernel.org
X-Gm-Message-State: AFuF++mk7FVDomeX2GxNb9g81siMaC7DgTp0S4CnC/qwbdDz4iz6+8A9
	W1vux3CccRO/Eko/3yOfBjDE8Gzjzhw+Uh60jK3CAGVZWIXequ7ME5BlGJvb6gd33AtmKSmmlGA
	IitPt9a3/oWxNYZNTBgXV6/iq416kFkY=
X-Gm-Gg: AYBFou0htAW68ZH9VFnuPxedOzxXsboFUjWStQ02UcIV8Qz0W/VxlafGg7zokeTNxZF
	9ayFXua5Mlxfw0DXCIg8J/cWZvB+zoU08etLjocuaBgDBXG7ELIpdqfGpEWz8/AzEQQYZolb4e+
	uA4qED8o9Br3Fqf6oMrrPBKHUJjvTLZJgGDLpXWOI0n1gZQcwEboYbGDxWljAeoZZBwqK5T+QKU
	yYI5F3cBTYAbEFT42W95z49SLEfqAVoDj4HglQNopN6lT1rYVsm8m5tYTfN1GEH+XOOPx3ZfFlh
	Palk7+ueieaVK6krzedc55jQmOcmhDvVdSlex7ADLHIEXVbwpNq5gjM5cUMYpsHtpndI
X-Received: by 2002:a53:ac86:0:b0:66f:c1bc:4068 with SMTP id
 956f58d0204a3-672c2be0931mr690482d50.48.1790045834182; Mon, 21 Sep 2026
 19:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920055519.3778269-1-lgs201920130244@gmail.com> <arFJIWgBN0HXl7WQ@quoll>
In-Reply-To: <arFJIWgBN0HXl7WQ@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:57:00 +0800
X-Gm-Features: AcwNN1UbNyIyaIfw0nu4iX2Mqyv044MNcCqL0yukCBjNBRqHXUMBStARMmaPZTw
Message-ID: <CANUHTR8btEz8LVtyepZQscY6JMuMP=TqXsm62UWErTPGrdNOCg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/versalnet: fix memory leak on device registration failure
To: krzk@kernel.org
Cc: Tony Luck <tony.luck@intel.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:11, <krzk@kernel.org> wrote:
>
>
> On Sun, 20 Sep 2026 13:55:19 +0800, Guangshuo Li wrote:
> > init_one_mc() allocates dev with kzalloc() and registers it with
> > device_register(). If device_register() fails, the device has already
> > been initialized and holds its initial device reference.
> >
> > The current error path eventually frees dev directly with kfree().
> > This bypasses the device release path and can leak driver-core
> > resources associated with the initialized device. The existing
> > versal_edac_release() callback is responsible for freeing dev once the
> > device reference reaches zero.
> >
> > Call put_device() when device_register() fails so the initialized
> > device reference is dropped and versal_edac_release() performs the
> > proper cleanup. Return after freeing mci to avoid falling through to
> > the direct kfree() path, which remains necessary for failures that
> > occur before device_register() is called.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/edac/versalnet_edac.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
