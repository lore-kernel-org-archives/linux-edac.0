Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B236402D
	for <linux-edac@vger.kernel.org>; Mon, 11 May 2026 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500789; cv=pass; b=Hlm/piwy20DbiNY2xJk2mj0EhavPS7mbt1QEU/0i+JfbT4WggqxTJmCCTVC1IFDJHkvRWShoMzYeQBRKQb2I5VDaprHjNN8BQH01ESlb3UfOcXCgOzJLEU0chLzlaniqQpeujUqJht9/Yd+CrXkoZ0Ok359cp6Zj0XBVxjY6upI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500789; c=relaxed/simple;
	bh=motJPQJjajYs4k8zeRAcM6U2uTWGfwD9/Up4NzWT+3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmmTzhRGCHgdLHBITbvlyhjZzcIMwWezKlaiiXh3ANVWQCg4oWEylMxNlVtPc5Yb+xFes3T++f0ZX4bq+60C22HzJnjezLrSNdoa9OiDJmHAgi/KGk61DxlxyCwkaKsHs9md6WEzhkG+Xp4cXe+MNT1Rf8Rko8F/KKR1TrkJu+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro; spf=pass smtp.mailfrom=purdea.ro; dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b=nSPJjTQy; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purdea.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b="nSPJjTQy"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so4194003e87.3
        for <linux-edac@vger.kernel.org>; Mon, 11 May 2026 04:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778500786; cv=none;
        d=google.com; s=arc-20240605;
        b=gWri83RegNWRL8UhbnlvCM/VCmxCqLUIri1HA09Wb7fGTM+TJiApmtYez1hKyBgqsj
         EDDA7SSqoKVd2hRTjahNvAk7UxZ1oXS8HxGcNTDTGFJibnPdn6A8tCg+atakg1gT0xul
         WooV+HkPTsEsnPOByODQjVb7XA6VLTRXQMuL2jcgHpPzkzBrEMm/zD1wyBIOuwrpdaaq
         6MEzgH5KmKSu0ekWFlMWrJUli14urea1W6Ns1O7h3L6FIxnilP3GpK5esztoJgaCtNrY
         JtskORD/yyDjT9090/BiYZiHlOVM7Z/guPb8POd/YptLH+ysSjgY46JLmFmx3C5l6hJ9
         77kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TkKBQeZzSD6WWDsJfhDk9dVyIkNWlj1ZmLypeBPIG9Y=;
        fh=dHglKenNWJiVkweipXuRRSvQKq344bWS08BmPvH7PNM=;
        b=VxzCj8pr4PsvfWEU0CI/c1v6aM/AAazjDbVi79tExU039LFZslvdyc5XplpGvrfzr5
         EqWM3fAZkBeGMrBlGW5YpaJzGeOPn41TM/oP7LUz9kJ5M66VAvUr3H1uPLA1erADyDY7
         VtBLUq1SgobucAngh0XzzywPq2AFyvlxbYwc3S0hFOFZMrhqhd2fgBLTRFq0fm8nFdH2
         bvyHwH102vGwQ/M1Ar890UXUbN0wXnvoATrg38rBrk991Dhy6e3U9iEQE69iqq9Sn5xl
         qy0PsSBnDpdUcXcUxeX4E7rHhIWGfUxSYvuwcg0V2G1ISJDR2HREV4HSXW8RAUeeAiiR
         NI5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purdea.ro; s=google; t=1778500786; x=1779105586; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TkKBQeZzSD6WWDsJfhDk9dVyIkNWlj1ZmLypeBPIG9Y=;
        b=nSPJjTQyiJQCdnNyFfnAEIcw4hqfqUXGasD5+CpQFXJ4ZNG8xqo3zNRky1R5QM6euV
         jipwWk3yxD6TWiTevUIX9mOTWliZmuoDcp02La8gYQcQODKeZh0ahfZTQo8U6quZtQZ5
         2i1aSJpeDaolA15lxnaLt4U4YmNA3Yzf4puNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778500786; x=1779105586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkKBQeZzSD6WWDsJfhDk9dVyIkNWlj1ZmLypeBPIG9Y=;
        b=NELfIgL1pRsriwdDEkVxLKm1N9YXvd4IZLlBxXtkzSqYe8S+U3rCVmMStsLKpBm9Wt
         AAqsBPvzgehzGZ5Si5p2OeS7Ln32MBs7Hk5WlNn9Yo0amWxpOEOK0ZMoG7s32nsAw654
         W/C/w9KCEetplUQ9Psghk4aUHx8qsHButZXUqtjs5cmrgXJKHp8IBRlPvzE6D9X4U0eI
         w4VAnv7b1IYGD7vQfC43cd0dJSGZUrD71FFAzIGMT534hwMt3fcVioswhSkL3rOOXxHe
         DTmW3BHndDUy+gLx4XJ/LZBTW12VdKCWKKnlB1a6NnK5kAoSu8y1FkYKoSB3nAOFi8Jf
         UQMw==
X-Forwarded-Encrypted: i=1; AFNElJ+o0xEg/oLRmD0uRnrA5yJjXPQ8W9zpHyS5eWlvTHV+oLK4yA3+HRRIlPE4r7e+48Qa99SjjOG3xnNL@vger.kernel.org
X-Gm-Message-State: AOJu0YyibelryK8a61hPZ+w1GzLX+WIb3PseBCOfSmsjPsTDwEHXrLOr
	DUkperq+MqTRAWSlTgowrXi571f4k98z4CsU1oapDcjSQjNUJ3YgKkgGYbw0EcgHDlOXuiUl/8G
	TPw29WbWr20VJEm+Qj/6bhXsgrhbvGOwj+CQg7iq7
X-Gm-Gg: Acq92OEPcvvMyGrNWOlzPQ2sCQpsZrUe+xOKPd8PQ0QlqbqJ5N2x1EQlsnX+6hqguX/
	ZFRlzmITRfFFvE39L021I0+T3sxUJwkQnPZDN0AsPmE292sUFlBaFw5Z3iYz50TgKOnx9LYCnNO
	/PnwxxHB9VK0Z9LOqeCWtIplu542Np3ZfYP2wSkP68GT0qDR+tV61ESv58hqxLs2KzI3Ihb5QAe
	Qnw0Jl6rrC5Oqzo2s6oGfsPDfg6iLjUuxH2JgCJ5HbZF8iDR/c+Eui5YePh7gGB+FsvCL7QAUG3
	uBe7tcjlyXuNa2ekEJh4HkG4QSgA/JyVICjZI+hGk3sd1PVCaQ==
X-Received: by 2002:a05:6512:2352:b0:5a8:b963:cef6 with SMTP id
 2adb3069b0e04-5a8b963cf41mr3355976e87.38.1778500785651; Mon, 11 May 2026
 04:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin> <agExLK2GR0w0Z_N2@geday>
 <CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com> <20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
In-Reply-To: <20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
From: Andrei Purdea <andrei@purdea.ro>
Date: Mon, 11 May 2026 11:59:34 +0000
X-Gm-Features: AVHnY4JGi-STlD9mzsGX0cSnGYpRU-grKSKEonvNwqBKtIss1qO7PDZXk5w8_E4
Message-ID: <CA+mMEgcng1bt=ZysgofrGAMA0oMO-9DxSALXdcT9tK4YgE_dhA@mail.gmail.com>
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

> first of all, please do not top-post when replying to a public mailing list.

Acknowledged, apologies

> > Furthermore the one in versalnet_edac.c looks like beyond fixing a
> > buffer overflow risk and code smell, it also introduces a behavior
> > change (bugfix?), because the old code I believe cuts off the last
> > character from the copied string. (Because it was using just strlen()
> > and not using strlen() + 1)
>
> The versalnet_edac is innocuous because, AFAICT, that silly code is copying
> "error_ipc" into

No, the current code copies "error_ip" with null termination, and it
drops the "c" suffix.
And that seems buggy. And that's what I requested to explain the effects of.

>
> struct rpmsg_channel_info {
>         char name[RPMSG_NAME_SIZE];
>
> with that buffer size being 32.
>
> So no overflow here.

Agreed. Also, even IF the source buffer gets overwritten with a different string
(not saying it necessarily does get overritten, but it's not const),
as long as it would
contain a null-terminated string there still wouldn't be an overflow,
cause the source
buffer is the same size. So the only way I see this being exploited
would be if it was
possible to get the source buffer to contain no null-terminators, but
that would imply
fault in other code too, so there's likely no security issue here,
(unless the dropped
"c" causes some problems).

>
> However, just to make this safer, we should min the size.
>
> Also, Shubhrajyoti, why aren't you padding the rest of the name string with \0
> *especially* since you're allocating it on the stack?!
>
> IOW, this (totally untested ofc):
>
>         strscpy_pad(chinfo.name,
>                     amd_rpmsg_id_table[0].name,
>                     min_t(size_t, strlen(amd_rpmsg_id_table[0].name), RPMSG_NAME_SIZE));

I have two issues with the min_t() call here:
1) it still only copies "error_ip", with null termination, without the "c"
2) it negates the purpose of using strscpy_pad. If you use strlen(),
then the padding will
not happen, and it will behave exactly like strscpy.
3) it is unnecessary. Both strscpy and strscpy_pad stop reading from the source
buffer once they encounter a null terminator.

So if you want to pad the string, to avoid leaking old stack data,
it should just be:

strscpy_pad(chinfo.name, amd_rpmsg_id_table[0].name);

Andrei
