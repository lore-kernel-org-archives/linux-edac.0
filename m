Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495F395272
	for <linux-edac@vger.kernel.org>; Mon, 30 Mar 2026 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905985; cv=pass; b=eKpTnD2Z3auHD+vExxNNBQKBDRnA0GUJupeolp/TdVuS13IkJepF9MEcLaWjUmkUoig624utBPLezoLyVwaAWS6xqup5KfUq+1PCaMy6G9fo3EYhdaRfPMOUD33Pp5qZrCNo8QwieQCq/tsf1kFsbtc/cDVOZV4D7M5Wp1nafW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905985; c=relaxed/simple;
	bh=ALadY8NiPeRg67/Y2RfeQ+XYm9LcWvRmYMe+mGpRcx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOJUZym+yHKZHL5rtd5jYSCEei4on0i92aFfbUITYbRgpYYwGy9+6hHZovUgjWesdYw+RYHmEbezxb40z5T8c1j/FjsZgtNN6lHF1qIMxXsF25aBlNlMnQbT9CTeoBh61H8wgLkwDX4nvHOO0LSzFQAsbdAVvz0/XyqQtt3XUOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sfzRETAx; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sfzRETAx"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so3613532e87.3
        for <linux-edac@vger.kernel.org>; Mon, 30 Mar 2026 14:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774905982; cv=none;
        d=google.com; s=arc-20240605;
        b=c62ffr1FIGkvlF3UWMgdVHBcQFRa8yD9ly898lO0/aCygqb/MXf40CL8+aeMcqubHt
         Gig+UWHKteE0QCx3w4A95YmATn7LTSRGUmBBTgNgN86MJv4L5y735NQHzmKYmvOQHTlF
         xYePkGvtabb4uglzIgnFPIWjasxm8VzZDnoq75OoA2kzjyXSavMYGr+LZJ/XK803+749
         +V/ZoxtY3e1VVND569O+/N7liGYqAgY5lhVanoh6ee5YV1zdV/629MyW2x1uqUE23tBN
         l0XBgGa75jINv6sFqKkA3nQUpqOwfWzmEPTDhKdl4AGCRhUUHeZKMu2l3NUTcOCs72RY
         2hPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jPAzBhOfN4niGeqVshjASv9GN/8OjdJexvuZ25AJ9og=;
        fh=OZJYlWP332XLIN1hW/C0I8u4/33uE2yuhONOv0Hr+gY=;
        b=evJ5I+e+BFieozG40FcrnXN6jxYZ6l27SPWC6OMHS6FFaseqbDmylRx/pxYcFiSMVq
         mTxoY0eSCMTkjOdjHDpy8czA2tvXRgL2YRRkp7EWxsNDJvMrmtuHXNDAJwxBoSDZwzWY
         R04UeHUcUxtyksC+p1SZdvEj+n0E1eorSpzw4BNynZoM3Red+/af2lbDr7DFTMUDdgkG
         Ymt7mkVqm6eTQ0WK5IA7SJT4hJcIV+kJEKXh0nT8vwdQepLdql5xZCUEuJI6/3toK4rW
         GqJsujZs0V7El0GT4w/5t8Ri5YvNHv38vgm5FJDIaI8xRInxCGaAfbL9RqbLNir+P619
         7zvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774905982; x=1775510782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPAzBhOfN4niGeqVshjASv9GN/8OjdJexvuZ25AJ9og=;
        b=sfzRETAxmRNB6RIrWtR3AaCudc41FD4SjiudPZBXc5r9tt+Cyof56KeqZR5+fs1AwR
         bNoNFcdJQCARo6r3Ao835ntg7kUkHt8CnseC/POBJmoeG5ZJVI98fjqx6Rukai93eLB7
         wSDvaHchivcx0HDwus/a5RYqcWVAfRfyrTedD85HHiWuL0b9e16OVPYulGtGjQhE4K/N
         2b3nbOxYoLpPt9bRgbxYJvN1E//D4MSnf+LWasYoaIjxzQ31Z0IGPaeTILNZyL7kiHlO
         vKh9DAfEf21LJCdBFDOhzBpn1i+qZG7ZIgf78voHt13DZRj3NTi9R8VibaCO0QMIqGus
         EywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905982; x=1775510782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jPAzBhOfN4niGeqVshjASv9GN/8OjdJexvuZ25AJ9og=;
        b=puJvuMogZ0cIEypiWvzuELy2r7/grByn1GZilPcC5ahSlOC5tizc2c9lPWEWrGebKV
         RiTybSmLxM2CoFL+RJd4TjGNXaP+Mu44DDpzaRWcGjCEKA8xZUCNmEtqORm9UyuFI3j9
         kl5sxbvUuQUzu7JzSWsaUhlC0VwMGsUjhzUp7K+TxsUfU0uq6WxPdrxqHbAR5DTtyyhT
         Og/pNrWbqwAowo1yXvZqjF7OVXELhYbpoE+D5Hl7Lg1ZzsFPTphP7YVqajbjUNsNN/fX
         yKnWNhqWjYCkROjVzJfd4Vt6D6nvzlytS9zx1sSnWZpwJL/nATHnGCDipQIgiRreM2yf
         WxWw==
X-Gm-Message-State: AOJu0Yw1+cD6cwKSS5keaF3XolB6drNORJtcgiPNgQXtKj61slxBpCVW
	Sm2UGwmLrwdy8mYuWlh3nzGCSVb26tfRB0MwTsHa6WnLhUk+iZ+6byqtKhy3aMqP8TeLl2yHTXZ
	FgXAT5cfaKBZA9ah/To/ixMHK46SzEHE=
X-Gm-Gg: ATEYQzxfgJSShFqOXtK+clBkKls8tsu2lt6nu+I/Ontx3NBze84u76RSXHLaFPbVe3A
	Ch06aT5zYsGT+wTVkaw8w07TDEDrzADQ9BVp2Y4i2tGZgzSxFOQvm/PbLSKsodtg562/irAAytR
	SbhsMf/A/fMbN8dW/Lm1ag0AJaKnOtjIZo099IG2yg1xO/QN+kYTySAb5738dBvNx4wr0m6zUc3
	L0ZLyP6GRIki6w34n5Dvz519ahVS5gT8KU2Ts0vh8upNWffRaqn5cAOgANZMFGvjQ8zvOUQZJnu
	9iI11Add8qustfuIEpaE/sOD8BDQnjvJSqFZ6ESWXrOjJYXmCYGaAoWG1td422mqY+LpdHcOriG
	1XgKupw==
X-Received: by 2002:a05:6512:a88:b0:5a2:a1d7:9ceb with SMTP id
 2adb3069b0e04-5a2ab933c87mr4481664e87.39.1774905981726; Mon, 30 Mar 2026
 14:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327024828.7377-1-rosenp@gmail.com> <20260330151536.GDacqTmBlWRznyeoMG@fat_crate.local>
 <CAKxU2N8HqFRT+qb5ctCVckC6c=viR7u+xyUaHgm-87C5=yo1ig@mail.gmail.com> <20260330211123.GHacrm-03xUU_3yX66@fat_crate.local>
In-Reply-To: <20260330211123.GHacrm-03xUU_3yX66@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 30 Mar 2026 14:26:10 -0700
X-Gm-Features: AQROBzACCiKm4LcM8ph4sJDY8VwHMc_K0lfkvl9eMNSaPH5UkBduvBF9-tz9z-M
Message-ID: <CAKxU2N__gE-bWBU6EkJmEK2gR7VE=Va+oN6EB2hpJoHbUiYVxg@mail.gmail.com>
Subject: Re: [PATCHv3] EDAC/mc: Use kzalloc_flex()
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 2:11=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Mon, Mar 30, 2026 at 01:49:36PM -0700, Rosen Penev wrote:
> > call if such a thing were to eventually be introduced.
>
> Oh, hypothetical what-if. Yeah, pls drop all that gunk from commit messag=
es
> pls and simply concentrate on why the patch exists.
Not sure what you mean.
>
> But you don't have to for this one - I'll massage it.
Feel free.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
