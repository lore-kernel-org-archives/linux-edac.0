Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD747A0B4
	for <linux-edac@vger.kernel.org>; Mon, 11 May 2026 19:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526964; cv=none; b=ajQ7N+twgd7KJxE48l+JO/8bEhVWwV5Yp9jiKsgV9sfhHsHgC84zL+hkZwE3BpSUJQEEu8tluosalKpZbz9ATbcYonG+CPngoOOjYQO4VUQ+6J19TXUc2pYhgskH8KhUxF75omBLxExAeVVIjZJyBevhXtSfRdNSOsxXp2pRySY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526964; c=relaxed/simple;
	bh=DqWKsXdNwI+6DvTJwGOHRu+xKSgk9VjMV1EF/5XovQc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OHn83Q1ddzInCvuK5qEPGKKcAVx4oHeDBFQtzOLrm77Dg8unnQYiSJTe4/e1dr4bO1JxpT6KUA2T5WaNCjeBCyr351k0QaLHUKTSN/kRRpcsFDRg1Fyn3UdcXEoCxtFaWjWMkn/FrK8XqcjwjG7EEGSOoWfzntx2WWB3NhYbm98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXiMprZd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXiMprZd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso42999835e9.3
        for <linux-edac@vger.kernel.org>; Mon, 11 May 2026 12:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778526962; x=1779131762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfMtmCT2x1dJSsSaie8YscBU2lbIVtCJp8bSnMzPXUM=;
        b=CXiMprZdzYDdk1O+IgGN67vhwp3rwCU5MpD/gB2SxJwJoK8yEtnGRCyIc9nJMQUzQO
         dWVv9xXHquF1YsVkM0kIi3vi5GdqMOTPf65BhxNjqWyVY77GuPSrUDetKIDfvtPHK6tS
         /RvyGR+gp2cvilDjGQKi/bCvjvkyv/MyV4tPmTWqrKW5YObvMnknpV3d5DS6+Accv63p
         9TYo8vG7RWdrxTPbOv2dqOG5F3gJtIMsuDw3/xIp1+N+0s3Lc2PBJnZEuFwqOhcu4mBx
         ZgjxTVmoUPB19OGsDRtiqR2cXF0GwRsa/94nOkvV2Q3C8hD818Hi1aaFC1KiSkZi0wLQ
         Sppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778526962; x=1779131762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hfMtmCT2x1dJSsSaie8YscBU2lbIVtCJp8bSnMzPXUM=;
        b=JOiIqoWy9o/1u1ZBqUGdt7eJXPhyxD4KVqv8X54aHB6nIgEc7mSx2uqIGmGHDUMvT4
         AKdNLuhUirUBqB+SSpZgCISeaXCXuQZP0m6LfOv787ly+4gfiM5OFJ35OXjScQPE+vCM
         GhElytmtpsPk1bfrzP0gs0cpBgS8Hi8Li4K3advbtATZKcHieNDPZn6vrThBHpn09HYp
         Fz7WbRtd5MKM4SYDVU33M5Q67ZNQVwmVXsLwOoTHTO7bmpz6GhSjFIcl0Ksn+213Wdls
         WZXpwoQNOfYU3PMN5X1Ff+NHqOV+tQA51vxQui4T0tn6mRMeXpmAf8zCpSP+owxMah4/
         0DKQ==
X-Forwarded-Encrypted: i=1; AFNElJ93fj5rUp4soBhJ+7XeUF+mcXxuvbji+ZfhG3CSiFLU0HGbZzkmb4D700oNRRZWQKns7fm1Z/yIc7sd@vger.kernel.org
X-Gm-Message-State: AOJu0YzxYRd1+5ZRugwkH5PNrt0bfLFJ3g/fc+AgbA7Z3dB5dfhHQCHv
	/wRWESpqS6J8PTvyM+bTn/0qOq0kUXaxPGJNAP8OaCUXUQp6b94MX49xHrqorUs/
X-Gm-Gg: Acq92OGKEavjzvxnXyIO75qo8BlMFMggQaOiQ/VJ07/4Fos13I4bnaA+PNs34F6T3SM
	YylZYb2JAsjOr4Wakk8czMywKtMBvAyMBOfJSOlQryE6D+qa7BW1T06weH3NI8Cd68o3n5F3azN
	MtOpOfkYBKyxR/GOE8e/7FROw3qLCFYjjmYF9PvpvW0jGGcMGYT4xLuP3mDZLaccNoGNnV0TTez
	GPzlJeUCZ2XOLlpVUI9UqKmf3dQG5kFXSzELqwlfv3VytTNEINovXq1sT6RfIzqMDEuHgRmVovw
	BO8jh+wKdYv1Oi9KSFgFKI0ud+BxNVZzPoHR57AVm3344HyY4kruH6QF8Xa1vpe40lYMBzbAAMe
	/EZ9XK4nf+618MZRqRjOqUpc2b33ffvuqLjRZbDGl5+vfutQz/cv+DrK/nymZX9ppsz0vF9h4bH
	XWdNlnZY+5YCJ/NS5/U07PEvnDodsKSJD5ZX0zLwYjbvhEdUdHgHW0U8SEjzX3
X-Received: by 2002:a05:600c:c094:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-48e51dd89ffmr294515085e9.0.1778526961570;
        Mon, 11 May 2026 12:16:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120ec0asm27086942f8f.17.2026.05.11.12.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:16:01 -0700 (PDT)
Date: Mon, 11 May 2026 20:15:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Andrei Purdea <andrei@purdea.ro>, Shubhrajyoti Datta
 <shubhrajyoti.datta@amd.com>, Geraldo Nascimento
 <geraldogabriel@gmail.com>, "Alexander A. Klimov"
 <grandmaster@al2klimov.de>, Tony Luck <tony.luck@intel.com>, Kees Cook
 <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nick Li <nick.li@foursemi.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-edac@vger.kernel.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
Message-ID: <20260511201559.2a9fc8e8@pumpkin>
In-Reply-To: <20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local>
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
	<20260510230853.154050a2@pumpkin>
	<agExLK2GR0w0Z_N2@geday>
	<CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
	<20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
	<CA+mMEgcng1bt=ZysgofrGAMA0oMO-9DxSALXdcT9tK4YgE_dhA@mail.gmail.com>
	<20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 14:51:37 +0200
Borislav Petkov <bp@alien8.de> wrote:

> On Mon, May 11, 2026 at 11:59:34AM +0000, Andrei Purdea wrote:
> > No, the current code copies "error_ip" with null termination, and it
> > drops the "c" suffix.  
> 
> Pfff, that wasn't really clear to me from the explanation of strscpy...
> 
> > And that seems buggy. And that's what I requested to explain the effects of.  

It is a new(ish) driver.
It looks like just a bug.
Although the name itself looks strange.

> 
> Shubhrajyoti, does that have any visible effects when using the driver?
> 
> > strscpy_pad(chinfo.name, amd_rpmsg_id_table[0].name);  
> 
> No, as said "[h]owever, just to make this safer, we should min the size".
> 
> IOW:
> 
>          strscpy_pad(chinfo.name,
>                      amd_rpmsg_id_table[0].name,
>                      min_t(size_t, strlen(amd_rpmsg_id_table[0].name) + 1, RPMSG_NAME_SIZE));

That is just pure crap.
	strscpy(chinfo.name, amd_rpmsg_id_table[0].name);
will DTRT pretty much regardless of any obscurities - including the case where the
source array isn't '\0' terminated (although you might get a nasty run-time
error message if it is shorter than the destination).

Note that the inlined 'mess' generated for strscpy() in fortify_string.h isn't
ideal for all sorts of reasons.
(Not least because the 'hard' cases should be out of line.)
But that is an unrelated issue.

It would be better if amd_rpmsg_id_table[] were 'const' - in that case the strscpy()
call should 'degenerate' into a memcpy().

-- David


> 
> In case someone goes and changes that amd_rpmsg_id_table[0].name in the
> future.
> 

