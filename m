Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6C340587A
	for <linux-edac@vger.kernel.org>; Tue, 11 Aug 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453919; cv=pass; b=PepUf7yZwIuMVVs3G88/sOia6vYQnzTgjQx4IynOzXxlJvEENFoKZXWNTUDwPZwN2shoLfsRns75JHhNoVsch3rWIHwsfN0RrKZxM6f7n+qkAlG60r6v05RBbVcATwJfg1EcXSnfW853Ebe0Akx+JYR0Hi4swjB9yTN71PvYH5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453919; c=relaxed/simple;
	bh=x78aBxn0tU7UjBwYktjVnqJmNWHRQ5krPggAll+w2bM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFDgcKe/boMDp10OjsAjtf+dSvufZSUESRAKL9kwuhw4GWr8wdLOvJ/wzRTUPmn+z6ucG+Lf5HwrHh+62Ln3VttDoqys1O1PfLBw7MaGHuec0e5yKrRBTgWtrYb2GcM+UaA46eoFA5kdsVmbEfaWEII6cGCppbadJcCukloq0EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzLSFgmD; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzLSFgmD"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66804667af2so2222160d50.0
        for <linux-edac@vger.kernel.org>; Tue, 11 Aug 2026 06:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786453916; cv=none;
        d=google.com; s=arc-20260327;
        b=QqiPXtj0y7f+wH5t0wyGWe80y5a+fZ1lv4DMIJJ6OUpuA8FQW6/C1IU4+PEQuuBjcC
         SJCgLv9LdLyfyeVn0qgsfA2qUjxjmU1O9cUYDcfBnQErh8HVPiWk5aKaQpDREG+qum7B
         WJxFTHqDtLjue9l5thvD7t/F7orfLv87IAtm7OZ1419E44QkrKmsEhxYQC1857bnxDU2
         EtgHyLPCpDV2lw6N8WEnI95Zd5g8KmhDTgzoadG3xeDMI0vjUqfmrcjCI5X60zS7lr/O
         qk55Z4ibuAEgQsYR2292mrFkNHhqlg0mDh5JuiuAMbZmuIBPX8PokefmVPdtBao51Rej
         yIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ObQHQDlNQrj3YXm8xo3N+NGPs6y4I1BDNFYIkTd3Ck=;
        fh=Wfkgox8xJFTFezwqzmGHa0K+4m2dQSRTyS7X4/3+Kzk=;
        b=msBPunQOPGdkntaownqOEqQaBTRBoKRKxgJuFH+X1y6s7j7ISUJvTzQdrFGkBVpX76
         OEB/yD7RzS3NMdzKtitinVYgxQL2Ej+X8Z3H4sUAGLhPxi0cDNAOAqNlRVQThktnLDF9
         kgOtYN8nbbW1Mhym35y0YvVviH0ZxcOAg4bn2MQu8nWutSztHNjjIeBLPt3VJZ9Vb0fX
         X1nolq/xO6ezcgguf2UskFs7QjN/+xhmKvdmm6ShO3vkwkSPt+0sTJo5QVhi5kUeYICM
         LPIga/Mx0neJ0H1pVmwpDsvrvkWGf1gHMiCdb2MMmzRtE8rlpzISP2c7YiOxCREzzG96
         1IwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786453916; x=1787058716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ObQHQDlNQrj3YXm8xo3N+NGPs6y4I1BDNFYIkTd3Ck=;
        b=EzLSFgmDOaUaECO3N9ckqDwVfFI4HqnR5DC6wd5VSd/F0VHnKUrwPEEVUBW9QS+Xt5
         8XuyVi2O73xA+vtapxpunOutXUvfF5rB8hZwCsifkMajR3aApT6cYef95HJphNyPFBXB
         xZmAUUykePZyo+DJrdQJMAJDy6lTEYnKUCWTwLc7Dnh27wyNP6VpefgI68T8pWS/guK0
         vOw87qxKlD8yZ6vB503H42rOlStKJJ9mP1bgZc4/xMxrYQ9MiHBWBbNwjqvWrSGwQFY4
         0UEvpiDO8Q1sE37s6a34lNa1qV2v7d0r+ybrKCuXm3nF9r1Sqp2CfynRCZgk0EyAmCVx
         1p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786453916; x=1787058716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ObQHQDlNQrj3YXm8xo3N+NGPs6y4I1BDNFYIkTd3Ck=;
        b=Mfza3iL0ZbiNVFFj4V4XmNEjT8HlzyBkLvc3AlrDqFPHHCzOSLNMi+ZQUbMY5LlBGX
         GbwFsH5VomQgXtK6AxmrcUAOfKwkRhR08Nv8J8o8lNFs8S4POitRZ0HirfqjhHltgDHK
         QdGCchWKjy2JBdDFkjLNv4oHrTMklUR95kmKI8cyseWk3ijvGzOrlCMCt3/NbhOhHmlu
         yDfUPxYpEwVGN22GJ5SmsizrS/Bkmb8oKkMozmTRIZSyDnLtk/i4Taak3/B6ZQSC/I6x
         EnoSWuvZP015oCVFJyxoKg66Jhn88IwcwTZ36MxE4hlQKF6kd99mrf+yjV1uieObmpaF
         zCWQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro30cECZLE8Rmmdjja2rn8O4AVth+7H85yvAnhw6oNgfsN3QtYQUFxkbk4uqaFRFDSaf1jzFaeUwXE5@vger.kernel.org
X-Gm-Message-State: AOJu0Yws4HzG9RvB3SD84GpjxC9FlCjQl16KZFUARNlIRCx3Am5V+1dp
	dVWGLBG5xmjU+4X4x8PNQjDYb2Sve7dGtp6bFqOHo4q2xB1bDz5oOCR4sGd6JcDJKY5YXd5FA84
	vLkw6UKP3B8gdYiwdb52G+sMEFyuHuP0=
X-Gm-Gg: AR+sD10HB/73VwlEurExr1lqfMybd61ZF1IYbxuWxEHlnnE5RAHhWLVk+oBStB2cO49
	cW7s2Peda3KW8XhBhb8Bw50WdqDngClZSc+8SOkN0qifuOtQdoEK8fwWyrGHXMKToxdEhk+z41f
	80uVpPJLsz/uZzoKr8e/MT6FuBR3sAEo/NcLdjhM+EtJvacNoGkl2xjK9r2itboVxUP2lDfL/sq
	M3/PjhvyplCIB2Y862lzZkW0DzYq45alDK2wPD5ei3qLrXbbd7e4QYpoDzc7X4+K8SqePukSl+s
	fcyeh0nX68mrmaWLnLQIkGeNrFda4/wi183PHqVLD7UiQA0=
X-Received: by 2002:a05:690e:80f:10b0:66b:1841:adeb with SMTP id
 956f58d0204a3-66b22da0440mr1628331d50.12.1786453916626; Tue, 11 Aug 2026
 06:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-3-shubhrajyoti.datta@amd.com> <20260802184623.GAam-Qf9-yes1DkNkl@fat_crate.local>
 <CAKfKVtFtFmUKwnWY4xGwcRQG+qJ2UdK6LK+3QX=Ukvr3v4Y7EQ@mail.gmail.com> <20260803162920.GAanDB4FyqT3mLMm-U@fat_crate.local>
In-Reply-To: <20260803162920.GAanDB4FyqT3mLMm-U@fat_crate.local>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Tue, 11 Aug 2026 18:41:45 +0530
X-Gm-Features: AUfX_myqgvK9mT5HKm343Z2X3CsN45z7Qlg9xVW-ca0p1q8ZAFcQ0n907qOIG3M
Message-ID: <CAKfKVtEOn-jSiqHs9zGc4qNahQUy3XbAuACgtE5joF_ctGxjMw@mail.gmail.com>
Subject: Re: [PATCH 2/9] EDAC/versalnet: Add NULL check for mci in remove_one_mc()
To: Borislav Petkov <bp@alien8.de>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-edac@vger.kernel.org, git@amd.com, 
	Michal Simek <michal.simek@amd.com>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:59=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrote=
:
>
> On Mon, Aug 03, 2026 at 08:14:17PM +0530, Shubhrajyoti Datta wrote:
> > The current driver assumes that all 8 DDRMC controllers are present and
> > indexed contiguously. If there are only 2 controllers then the bus
> > width will be
> > unrecognized.
>
> I just love it how you folks evade the question:

Apologies for the confusion and the back-and-forth.
I'll use inline replies going forward to make the discussion easier to foll=
ow.
>
> "When will that happen?"

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/edac/versalnet_edac.c?h=3Dv7.2-rc7#n64
The number of controllers is set to 8.

If the design enables only one controller, the crash will get
triggered in rmmod.
>
> How real is this issue?
Yes, this is a real issue. When fewer than 8 controllers are enabled in the
Vivado design, the remove path still attempts to clean up all 8 controllers=
.

>
> Give me a proper scenario when this is possible please.

The driver currently assumes that all 8 controllers are instantiated. Howev=
er,
Vivado allows users to enable only a subset of them. For example, if only 4
controllers are enabled, only indices 0-3 will be populated with valid data
structures. During rmmod, the driver attempts to remove all 8 controllers,
including uninitialized entries, which can lead to a crash due to invalid m=
emory
access.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
