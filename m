Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C5F3469F6
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 03:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785470232; cv=pass; b=hzbUevT6Gy+5sug7U4xohHkUfKyMwVM19x8yZisYMrS5koOHu2QT4OQR+VstjeMMbqJPkvhOP03OVjg7Z2nKAv0w/5Xtk5ylEavEAiKJJ/xl54esDjmzplPH5T5nEZDR5ESfxZvuU/VLRGiQWmGU+pKo+0S8GJ+xp8Y+W27ePTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785470232; c=relaxed/simple;
	bh=yb9GMYwITEiCqVMUqg8EkSOuBigeNkdmL9FD9e6cgzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Se1d4ALXn6kGk3ae/tcAnnCupzdGogh056x3Td7LXbHFEj38y2qVxE5OeROOYSYvj0VeMPfsQOXgFGYBpGXnQ4OE27OYcSVM5IAn8X2BOJ2qYUh9AOSZqzpMGzlZ9TI0YYXmuHtNtU/H3f9DDbmoE/Y26MDUVnmZr4Stbx2UOoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlE1Yh0v; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlE1Yh0v"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so822744a12.2
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 20:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785470228; cv=none;
        d=google.com; s=arc-20260327;
        b=qrCy7A1eiWzt/DrTDDbxtFAsuVovt31ydq1Fw73HfesBvAZ7hgtmotHeo626+ro6uG
         7mEPHao/Y38/0tvMf5q29p9PGXMisQkxCwcH+hCsw4EWDMEpFrNCPR/RWM3qbmuwMoxU
         Gr3Z/K00xYTve+GScZTv2pQj5xkCl4wZYuZKSz7/HE29WnUHYU4eGOIupjhgk53kmzyq
         QQBu0PVCik0G+ohmOfeuVc7G7yV18k6tI60ZmFAETwPJPVfz2IWSGhb76XRA28TghugN
         xiMXQsly7cqttOkmiQGA1aYke7LE7eBrQWhtDx4DQdT1L4hp6VqAij4EO++8PBnABM6u
         l1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0o5hhJj+BhgfVpwu9dHJvYHes4Zfz14WFA0Dqxe/epg=;
        fh=6cKstzyRBvYZ0EPdieIKcN+9w1HVA2a8kNaL6BrX3c8=;
        b=qR45T3jk43AmJi9N0uchpoiZ2RgkMTFXY4fpn8hpoBfRARVsaG52cOya4jePmQXVHI
         EhYqqixjXsggvEwr8U8fusTL/TxJDdtm6bH3antxS5aaBKd9odrOw1lZSfVMrR2azjLj
         /ZhrRYTmtEeqKjWIADo3HGkI8JIwrzI+Gasn43mIQ+EaEGld9jqWoVCo9wTA9+bbicTN
         E0j+comxW27bvnhxspjzkHYch+Y3ioDrfYS+K5TdbFxvjAntKDx/wjLk7kk/gI5ll4vv
         NOiPZdXzku9FTLH7D8KHObCKVOwj4T2QfPPRdOLYPSYcYKKJwc3+KwN+JJhBzT4I2/Tf
         VQxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785470228; x=1786075028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0o5hhJj+BhgfVpwu9dHJvYHes4Zfz14WFA0Dqxe/epg=;
        b=OlE1Yh0vZeublZw5XHw7TDcJ05SEEE4pnxd752ApbQjwVggub+S8GKZpdvVaJoubEf
         AktnjGJ44UIPz6vU1gVkVCSKT5YtRJf5p+ePBerNG7xZQv/z/aBxMoFWAYxoLt7k1WXo
         04crDzH8VZPtLNhtvaO1RFYS/Biunevr37+GSKVG0hX1le0J5rOJvX1DPyxL5ORuy8VW
         l82z159wJ4vi4M+50YhJhSV+nS12mNbRlAud77xFOfhI104uCNMzMRaDY4ecuUO5N9ZZ
         aZzajZfLsPWT6BdcajftM+iqjGqGomaJ0ctVlMpj6UfAMnrSugsuhQ8qde3exaI7BeGe
         ql0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785470228; x=1786075028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0o5hhJj+BhgfVpwu9dHJvYHes4Zfz14WFA0Dqxe/epg=;
        b=aAmJuJlgO3wN0VGzr/wQs/0PA59uwtnYLZ4+DgCHbIZMSOIuZyUmpKi5bwAZw4nCf9
         JvBAx93Ga60YCSWSoOPu19mAWP+JCWuL78J2bbjo0H5PFmFHbNg+f8dJ1JdlXCRXqyvl
         qQnOTKEG88pB7ceyB2EhTByM183DPsmB2h77UAyYjG9+yb8yFTkX1RzNlVRjSneNBxXn
         taDnp4AzToLcDGt0ZobcS3KzZfR/la1rGXtxGFSXFZFkT33EJEP31KVuZWKMo5E9mxeX
         52Q2aerFq9yUiX5aAXQ5pEopVZgiP/91C2bvszO0hhKb9M9T+vLn76sKKu3EIfGsv1KI
         rJTg==
X-Gm-Message-State: AOJu0YyPhslLeh30amc86EYKi9yAJNE0weHR/PuYag88kVO3seno9/Qw
	ZoSTVo4VEfMb9iXNGo5r8mZ9nENAKkpMS7BSQSSNUZ/xNHmmbBzhGv9SZjF4nAjvZRreVLJ2bZV
	qkSUZQKJaVFd0WMWgOSfPPuH1imb1qEg=
X-Gm-Gg: AR+sD11pj9GLGcnQyzoErERT8c2N3+2EtEeSjBfZy7jASnOjH0Rl/z5qp+ku3w0mfPH
	43iJRIF0W5dUTvhfIoAEtwzf0pItXyj+Sz+fuY9ohhmTDEw4bkNoQX45okloPaGbVKTJisKXCqe
	wS7lDwK6zG4bWH6eSQGhN0u5Y3/3fcTSPvas5NEZti3FC6ypOGiL8XIp9LgKuuWOUBdDMQ9iRmI
	lwaKqPWQLGBB957UGAPzpbwGci5zYApiY9q6gCzWQCreUbqyqNjjkDpD+xpn6s2+mFyiAG4Kzdz
	N7vzMAOUpaPs6R0Nr13BNkA0l/dDWJO5PN6xBwm2pA9qLBsPp8YECkAO99HxQMy72GkyWOfuFIT
	loWZ7p7fSX1/hHXNphsaJz1UZpdgNXkIZg30zR+4DFpdSeZI2KIlg05bLbIzVueUHV4OETKdyFo
	A95llbzrkaf0z4y10mIfSMmkH7mND1PE2ILPfP2AiAWXz82NCJ8vjZwQHHKBfCgbRt6g==
X-Received: by 2002:a05:6402:e94:b0:6a0:7e5c:bbd0 with SMTP id
 4fb4d7f45d1cf-6a098d0a7d6mr185051a12.39.1785470228382; Thu, 30 Jul 2026
 20:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731011213.1211378-1-rosenp@gmail.com> <20260731021528.GMamwFQMXHuufR64w7@fat_crate.local>
In-Reply-To: <20260731021528.GMamwFQMXHuufR64w7@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 30 Jul 2026 20:56:56 -0700
X-Gm-Features: AUfX_mzJN8p0LPE3S-Wu27dKaSxS1KTRPK1cR6bYeXUhHjnN1B7cE6Orhz-PcNQ
Message-ID: <CAKxU2N-_RnBtiEhFaKL1Yzv6HSv+m0H16-cTFaLrgL_u8kcbaw@mail.gmail.com>
Subject: Re: [PATCH] EDAC/mpc85xx: don't use devm for request_irq()
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 7:15=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Thu, Jul 30, 2026 at 06:12:13PM -0700, Rosen Penev wrote:
> > Use modern irq acquisition APIs to avoid having to call
> > irq_dispose_mapping() since there's no real need to copy the mapping.
> >
> > Use non devm version of request_irq() as IRQ need to be freed before
> > edac_device_del_device() to avoid a use after free issue.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/edac/mpc85xx_edac.c | 25 ++++++++++++++++++-------
> >  1 file changed, 18 insertions(+), 7 deletions(-)
>
> You were on the thread where we orphaned that driver because we have no h=
w to
> test it on, right?
yes.

For whatever reason, sashiko flagged this in a different driver

https://sashiko.dev/#/patchset/20260719194009.117532-1-rosenp%40gmail.com
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
