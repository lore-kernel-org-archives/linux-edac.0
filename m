Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B27D39B484
	for <linux-edac@vger.kernel.org>; Sun,  3 May 2026 21:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777842221; cv=pass; b=hmrwGZBu0sRHTcqITQeqsE2YEtVCi9zEGihG2ycNAp1yJ0MdnUsdbDtEnIIotg2U0PiVf+WLHGbSy1kvrwChDW9u3+6NWvlGvTWj/MfTCvuhXdmmaKu4PLQSrLmIZBvpLBlMzzrv6cmXqrtQyCGKZJa3eVwiwCdUP9Itqosd++o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777842221; c=relaxed/simple;
	bh=m/ET3aJI0H3eTaF5nxuPbBEUgmMEpHRjkL5z7+/iqIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=az3ZhQX4e9pNzhEYIIWUzep9ZarWb4iDNjeCYPxdc6oz5M1+DPog8i3pQyMn9V7j5hs+xmLgcji0gCL+Aa1PxUVQK3cD2OxdErA4Xd1yas3JGSDydCdEB2GEReGUB7zn6vTnsfkEGmdG6BKYrg81RMOLT0HwhDp5T8tkVeejws0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yw4GStG0; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw4GStG0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so2758795a12.0
        for <linux-edac@vger.kernel.org>; Sun, 03 May 2026 14:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777842217; cv=none;
        d=google.com; s=arc-20240605;
        b=LIaLVtDYXnyvLTn36wq2fRi+lxMic0N3HBH60wA2F/907azTlr3pWCqy+4T36+XGMN
         5vAt8gkMpGi8QZbZp4E89HfyaYKK4VNAmgPj7lFNO/DbY3fy7l+gm9rvmH/Jx0jaFI2C
         zM4Vbir7MIk5qbYv1xmM5CBSnJz8jAjcq8NbvKJNvqtw1xHh8GIicXsaQfsQWsSNNGPT
         pFT7EBzAghTRnIynkowKcGxYRMPcr1yczHhJjQ8I9dIBrILBdUzVY5WuJA5GxY5Zhyhe
         bmPLJSX2PdZAxU1mtUavhL568U2bI//dymKLCGR6w3h3k1X+xh9wlE4PlCyfj1x6fqbn
         eeYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sJMBZjhqpypOwBzXyJ4gqWnUgiZ5f8zEv3s6DSH28s0=;
        fh=eFIjUCQ5oNa3W3+2ApYAiq8phGD6036fnPLGIdvsPz0=;
        b=hSErb5hf2asFVdHtRNEO2S5uUVWFR1JAcUxj9aaEuCfSKwMDOHpfetMlkNz0Rag8z3
         efbLZSP+Dwi/olQ7cZSvyYbUH905M6O1TBbPEAhK8vHvDOyHPJPkbxW9zAnoam6agY8q
         93e2xOfzBlMtteTZ2x5M3gZavT25sotuxhbPm6Z+4jDcv1z1/u8UsQIw3+3UIlFTyggf
         VpxlbvT/iOaUNNItIih7CYd3NJoy/AQf/JQO7eKwW6zAN0JXMLQrT1BXe8p37L6k4yB7
         KExuWRnIe0KEalzF9aW3GZSF3jZrMOr/8eCbq+GMz2sF3Pnw/9nwgFhmHCMWFseFXyBg
         5MnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777842217; x=1778447017; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sJMBZjhqpypOwBzXyJ4gqWnUgiZ5f8zEv3s6DSH28s0=;
        b=Yw4GStG0ywYnMbaJviepAG56xSQuvbG/TosOoWwY9gg3U+tRYkoXvCd/z2VWBQdhSu
         W1TJtukFSBoBHlfWN5YDK00kALkmc9KCBgMjBnD/FM25AgSbPnqrq4ZrvESLuxVJ5+Xs
         tr138d8R9GLneyPpZU992lDdPXWcVrxJFiX8shxFAAVTwiDnZeQ5EXzQaS5IxLXPVsmb
         5RvHqtKOlGXbahcR4meN0KKKMN5B1hCdYvzZ4FFPpik1qcCgKiz2t/8ZXzHFssSHNsCG
         XfHfyoYR3zCOXE2dtIImghaYytitJB2+Td1xFwiLMO99Fun1z/SboqUoA/uUEcWPgXk/
         l8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777842217; x=1778447017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJMBZjhqpypOwBzXyJ4gqWnUgiZ5f8zEv3s6DSH28s0=;
        b=W6S28PrjvvXr7HHSX19HnCtcFqWd27Pd0AQgVKDvTri8qhWZhzGKbIlJ4ScCQczQfQ
         Kn1hcGnJCBRG5s5hO5QwEPLClgGXtskZLEbPgLAyjMio1zauwUktCxPmmGEQ1G6Q3IsK
         Fr1c5g+o6WfXz0Xv8hNPA8Xp99j+q0QhuMiyxtT+SeKgoE/OzwRqkwkXwIQS82uUUcaA
         FLPR+jZY/IyrFCCBz5fegYXycfg7/ivZ+6VPZaL3gu+KynZYLSXQBDlgzgGQnIF47Ont
         ysaVzG59S3KE7ojihGxsI6BPppDlr7CgPw7v0Tqm9tk20Vj9Xn+fQmaPdoLrO/ZR/DS3
         SNQg==
X-Forwarded-Encrypted: i=1; AFNElJ/xjnaYQ4OjMGsjaE4wc/7hMcqFJW9s0NBrZTV2FYXnSrUm5vrbOzvslq6NT9JaelgeOnEPvOz7uJzX@vger.kernel.org
X-Gm-Message-State: AOJu0YzxbQveWwbrPxNCux9XwjiTgNmOBEwvcLye01qQKwk0Mj9YQsKr
	pbBjTlZewxdYkfB1AH4L3wUijosxUip8e2ZgRvI22q7GPDG0yxbwQhnKtTZhwdM+HA4KP2/PDU1
	Q/+UowMs3jKpDJzMi2Vj5VcBzC8r5vy70ckgNEfI=
X-Gm-Gg: AeBDiesCCxOeC8qtiLkdpcpvEoEe/gwpDD3v45IeVCMjY9BVfmCWcGfb0JYObl0PvcN
	kyimOX2XrQ2i/P9VfEWOsF8hbetQvnGoO0jDhscqvvqD7or3w8FyTfDUlaZLQxH2Y2uQfl8+f76
	yal9Vz1F7UZpQR9+n3zZMNZru7HizRJ9o4NUGsJdZfaN+CQc7NqpP5OdGM/d4Hu2VxWTTYbYEjE
	mZefz52Eoh1HRNPm0EvmusEZH84XcE4xf3jROps0IsjXkpe0+HBGz6/1PgLlSruGVnWeXeFvWZs
	qxjZ3vjmuIRz6kp5
X-Received: by 2002:a05:6402:88c:b0:671:dffb:f450 with SMTP id
 4fb4d7f45d1cf-67c1a6bdf07mr2361290a12.11.1777842216741; Sun, 03 May 2026
 14:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501194838.2682274-1-dbgh9129@gmail.com> <4ea824df-3ef2-4756-ae87-02c31f20c191@kernel.org>
In-Reply-To: <4ea824df-3ef2-4756-ae87-02c31f20c191@kernel.org>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Sun, 3 May 2026 17:03:25 -0400
X-Gm-Features: AVHnY4Ims6usp4oN5Q8JbttN_jB7NjwWBXg5Q9_n9YoXxULouzCidSQQPMv9wfM
Message-ID: <CACrCO_XWaVci8xPcmVQ1BKdZ6bGzr_dq=C52SrTQftD_R_KWCQ@mail.gmail.com>
Subject: Re: [PATCH v1] EDAC/altera: Fix SDMMC PortB OF node reference leak
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Dinh,

Thanks for catching that dci leak. I will update the goto path in v2.

Yuho

On Fri, 1 May 2026 at 18:26, Dinh Nguyen <dinguyen@kernel.org> wrote:
>
> Hi Yuho,
>
> On 5/1/26 14:48, Yuho Choi wrote:
> > of_find_compatible_node() returns a device node with its refcount
> > incremented. altr_portb_setup() looks up the SDMMC ECC node but does
> > not drop that reference on error paths or after successful setup.
> >
> > Route the exits after the lookup through a cleanup path that calls
> > of_node_put() before returning.
> >
> > Fixes: 911049845d70 ("EDAC, altera: Add Arria10 SD-MMC EDAC support")
> > Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> > ---
> >   drivers/edac/altera_edac.c | 14 ++++++++++----
> >   1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> > index 4edd2088c2db..a2fb30a9b914 100644
> > --- a/drivers/edac/altera_edac.c
> > +++ b/drivers/edac/altera_edac.c
> > @@ -1526,15 +1526,18 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
> >               edac_printk(KERN_ERR, EDAC_DEVICE,
> >                           "%s: Unable to allocate PortB EDAC device\n",
> >                           ecc_name);
> > -             return -ENOMEM;
> > +             rc = -ENOMEM;
> > +             goto out_put_node;
> >       }
> >
> >       /* Initialize the PortB EDAC device structure from PortA structure */
> >       altdev = dci->pvt_info;
> >       *altdev = *device;
> >
> > -     if (!devres_open_group(&altdev->ddev, altr_portb_setup, GFP_KERNEL))
> > -             return -ENOMEM;
> > +     if (!devres_open_group(&altdev->ddev, altr_portb_setup, GFP_KERNEL)) {
> > +             rc = -ENOMEM;
> > +             goto out_put_node;
>
> I think this should goto err_release_group_1, otherwise the dci pointer
> is leaked.
>
> Dinh
>
>
