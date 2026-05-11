Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD93421CFE0
	for <linux-edac@vger.kernel.org>; Mon, 11 May 2026 06:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482030; cv=pass; b=DtkjMcy4tEi3ificzzpIukdFLGr5p80Zt9SR5OQ6/Xe4JFhqSNrbON9Ce6I8x6p/RStKFt96gNJ252R3+xd7XvD/nDdDYKfyoX7DzX/iPO8EjN/gjk/NPAMMMRBKc9AbGXOFrdcHgnJBJnNllh85xuAzb4evKhLyEiKzPOB+hjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482030; c=relaxed/simple;
	bh=KApMdkmNrz+muMUCWMkMoZkgrXloXX4+14GYMZwV35E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgKtV36Iu5VGMFgJ2kgrKvnR3xvBiCDRQBNowKcQ9ckCpZfldsxa/tGgbj/PxNnV8KBJAARdQub9iIBLLhcvfY42XAe5/MdlcX/8uOzETdpfDvLu37ovNtSvBIZXIS57Uqu3F+RnqYPIpkSEgooJnpyNbon7HKuGSmLipXNJIyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro; spf=pass smtp.mailfrom=purdea.ro; dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b=Oze5VPN2; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purdea.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b="Oze5VPN2"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so3750223e87.2
        for <linux-edac@vger.kernel.org>; Sun, 10 May 2026 23:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778482027; cv=none;
        d=google.com; s=arc-20240605;
        b=AkO28uu8J9dwdEh3kl05A49cYL7UOFy1kv+SfzzkZWteboo+k+cBb91EsiIyNBRmw6
         pe/tq9YQKJJ5I3cfOSt/vRdvISWMARq+t8E6eim4ABs1nmvCK0cOjek2yfYrHb6HA8Ad
         Xt66AONlnkAklpgvCpYYoECYCB9/y981lJs7hOkDyoKirTj+1mrtTCllnUyPs4DEFtdo
         pK4mj1bvzuEszbCUwWofSamEmSrhyli7DZF8N6tl/6Z13u21pETaCPKTQ64qg+1d5PWg
         CQHpNW3LlTxjSe8g3H4zwafBjp07bLsvuQW9hZhAtXDzzx2kRTa9g1hB1oooC71z4OMk
         yaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DT9NqVOrfLa6VbVk/3z+RVBjrJ+tKBjBV48nqurYZl0=;
        fh=mhpCst0jftfXp/JmNZbLotFm88tOC3jPI9VxHiP77Kk=;
        b=JZMb49EEf0zfV0RGsRBcAXJjjxVfEqyKp2f93w7dcBL0+r0e6HVdiPeBm6mWuAVptD
         YuhlJEgdDFOn9nIJAhKaGET1PC/B62u1knQ7QJ62LJzcAntbWNmloCycM9paIg6k6mfO
         bX4To/3ezcuuQkKGNSzadBWBJ948sNIPJPePVzSZ8okkS2KZRROXXTT7+Ee+q1r5aGWv
         oi2qAoncTROTBAs3g/wN0FfXT5EtxmZSB6s1UHHLhrAJ3i7aNnQkdnV71fiKF8W3ITbr
         lX9nFkwz7p42ePZypP4WtBXnLQxfNAYXs3C12wA5D1OGwsWOITi7kk/n1yuqoPsfN6/S
         JVRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purdea.ro; s=google; t=1778482027; x=1779086827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DT9NqVOrfLa6VbVk/3z+RVBjrJ+tKBjBV48nqurYZl0=;
        b=Oze5VPN2W9W573yaa+9R2AGpgeRRKb6uBN+e0onXzNpXYMHOMBloeH2LbWru5ypZyx
         /BOMW8mvQ78l9ZeWxzEBWRAcdx+hLhXVryD+ux40BHtzg+RqSg5P2fXI7GmZXx+86Z+s
         WUvCSd6iHK3HMykCHbjH4170Q7Yd7+V6UfhRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778482027; x=1779086827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DT9NqVOrfLa6VbVk/3z+RVBjrJ+tKBjBV48nqurYZl0=;
        b=BxY21FbOpGoW/qPc7SO9sV+fD6IBaibff3ChXWT3ab6W8x+VCyO9dJ8VZ9fn1pUcus
         X4IlYBougGdpGkGJ7WQsEcLJ7Gvjg+wjVUrCc4bRztbDRvfnYgYFaFX9nrhcxLlQdw7L
         91J6rYAYfjfKN7oxI8Jgn4rBfbgy7gEuD8fU4yxrLZazzoDv88hDfey6+ALaGyrNnwIx
         OZKND3/pG+zzua3eqPIBvOWk9wPGxZlbHeoJ7IJL9aUtftKKimSUt/d2iaauFzmdfyJ5
         KiaqwJhWiMHERWi9xnfnk61vp13blMx1tG1MH43UKRUgxya0Dg0eQKfzbnc/vw6QHVby
         12Cw==
X-Forwarded-Encrypted: i=1; AFNElJ+jogt9V2sATnP5W3tFnI4VWM0EcAofA8rvUMFKm+/1c54gf6zqrLKHE4ylexRIWeKLWddvpmSV8+HM@vger.kernel.org
X-Gm-Message-State: AOJu0YzPj/W/+RQ4G97TBpWx0ic0iZb2uhafnfOLKn9JAjWicdjUstMT
	DZ4UgQql/ndazgbD+foQen4jXA6wio4OPUHaxbrhfqpFqFHIRNq80HV7NzmFGUBzghI2XE1P02/
	cJSQvoq1E86et8cmXPoFYM4waKqMPWy2eE5ICR7j1
X-Gm-Gg: Acq92OH9G092C9qp5N/t+0FSWAZdNBKwULeG/pA5+h3oJWNx2klnlZxr7CiBnyha0xr
	Uhf7MRanp350C5fAo6bDlSwqxbMFDl2QvvORFj+Y9Kk3HlcSPk/UqwWgVvYMKjVcl2hH1/66tvk
	NiN5nxSyOxJM79CpSy/MjifXpyWWQY29xgta5VoJMqVll/1LvIv8Xldd5oRpCkhrLPrqhuCcWpL
	4P5gMri/oIsm5DifL5y4SgPbpT9063TOlgahei+c/9nwDg2FDoF+/5jo5SF78fcuP8KGQFbgv1C
	BoYfyIy7DD3GsVjKg/wmw2WYky5nCmJzXPDEpiFlass5O7U9ng==
X-Received: by 2002:a05:6512:3f29:b0:5a8:80c0:8e0e with SMTP id
 2adb3069b0e04-5a887cde872mr7723832e87.20.1778482026866; Sun, 10 May 2026
 23:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin> <agExLK2GR0w0Z_N2@geday>
In-Reply-To: <agExLK2GR0w0Z_N2@geday>
From: Andrei Purdea <andrei@purdea.ro>
Date: Mon, 11 May 2026 09:46:53 +0300
X-Gm-Features: AVHnY4J53lmTtBaTv0FQGgtHKCM9AIui4wGYptEFMYJ-hrRFcL7X3qOVd2fPOUg
Message-ID: <CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: david.laight.linux@gmail.com, 
	"Alexander A. Klimov" <grandmaster@al2klimov.de>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Kees Cook <kees@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-edac@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Furthermore the one in versalnet_edac.c looks like beyond fixing a
buffer overflow risk and code smell, it also introduces a behavior
change (bugfix?), because the old code I believe cuts off the last
character from the copied string. (Because it was using just strlen()
and not using strlen() + 1)

So I think the effects of this behavioral change should be documented
in the commit message. (I.e. where did the incorrect string end up
being visible, and could there be side effects from fixing this? e.g.
Could some userspace scripts/applications start breaking that were
expecting the incorrect shorter string? Etc...)

Andrei.


On Mon, May 11, 2026 at 4:30=E2=80=AFAM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> Hi David,
>
> On Sun, May 10, 2026 at 11:08:53PM +0100, David Laight wrote:
> > On Sun, 10 May 2026 20:24:41 +0200
> > "Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:
> >
> > > In the changed files, strings were copied like this:
> > >
> > >      strscpy(DST, SRC, strlen(SRC));
> > >
> > > A buffer overflow would happen if strlen(SRC) > sizeof(DST).
> > > Actually, strscpy() must be used this way:
> > >
> > >      strscpy(DST, SRC, sizeof(DST));
> > >      strscpy(DST, SRC); // defaults to sizeof(DST)
> >
> > Nak.
> >
> > This is test code and deliberately doing things 'wrong'.
> >
> > -- David
>
> while the change to fortify.c is what you described, the other two look
> like good catches to me.
>
> Thanks,
> Geraldo Nascimento
> >
> > >
> > > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > > ---
> > >   drivers/edac/versalnet_edac.c | 3 +--
> > >   drivers/misc/lkdtm/fortify.c  | 6 +-----
> > >   sound/soc/codecs/fs210x.c     | 2 +-
> > >   3 files changed, 3 insertions(+), 8 deletions(-)
>
