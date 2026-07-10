Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7477A42885E
	for <linux-edac@vger.kernel.org>; Fri, 10 Jul 2026 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687552; cv=pass; b=LrW7Y390uS4Yslu+SUCM15cV0jXev/UZ9Y6IB6qUc/6FHo/2sMMZYVVqIWa6S0RPLtxphmJdxXwmwuSBeOYPVrpKaqXy8iUbjvuObBQIRFlo8dW8bcAoTA9UEr/52+U/ZZOTcyftug0nDqQp40z71yqFmxUA7xozpPIda4XOU2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687552; c=relaxed/simple;
	bh=xKDLAnb8KrJ9nMYug6ap6/xy3aiKNYG/+9DdLiF8uJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xu+zac/pLpKq7puf5JgQM0hzW7DpEw8D6IXTVN+e1Qy9YlGE2IXqBAd7yFNU2xJrz/q+RI0Qo3r6t9oKuNSdBEVMs525yKZFqwHqGTTcb3pRYbISS9T2o2Z1KA02fynavJk05Bzih1jqm93NrjMrVi3zAmq5TEJtHmFWj59SKfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4ZqtlFl; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4ZqtlFl"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66493875766so1495047d50.0
        for <linux-edac@vger.kernel.org>; Fri, 10 Jul 2026 05:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783687547; cv=none;
        d=google.com; s=arc-20260327;
        b=ax6ajBJxbCKiROTSYV8Ot36y/JR2feDtRubNoL96q34bTAf8NpQgN09otX4S0pv8ev
         WL8xXvwCmfmSPmpys68WWrv6tJveu+M/+olfFWd6fx43J0qjRY0gQ7OrTKwoypa2ZXxA
         CWj4Tx3E5dAduTUnZD+D6R8RZJyQ50gV0Vbt7o79ZWRIFF8Hn4ZFCxgdhnArOk6wfsXR
         Af0P74QUo+Di9K8Nmmtq5+QSlN7ej5PFdPfC9zKkbTleA6VOoGM8CYG+TE2TyuU5aUzf
         mWMxh9eXXDE3Xx2xUNOPfcUQy7kZCofb8gMRheLCfxLP1647MOuIswMTFc27zv7sDTZn
         WhhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Zh3EDdqYsDbtTP0VyaiAreODu1O8gcvlTGIo+rsZFg=;
        fh=VfC84NELAfsBQCALXSr4e9eHoevQlTa4KuxOhhriwWM=;
        b=U8qleEQQGwLUQrwyIuy624+7C/MNjCqZZmksfTqiO8TLSWgbSRMWho2fN0+YVGEPix
         FKeGq2KyPnbv3Z9+yAeNBjKsnlUpdlieyCym91wN5cNXyPs0COqHCtE++ewdyxF0W05h
         UrLhuwxw9n1Zga6t+VKM7/bjeS8f5xOS3UPGdeqAWvzjwtZmuo2pYeQz0g25KpmQEVWE
         HF5i39bl6cB+guYl+1kaQhFe8nUPMEQYjPYp74EpdNWlYrtIZsH6jY9qpuDW0ZO+7rOU
         gh4vn09RAa7+ZSv3hh1/nf6hBBV4CY4p5jcbOp+JTKl0Nzr/wXNps4Noa9wovGxOPJ3M
         MRrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783687547; x=1784292347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Zh3EDdqYsDbtTP0VyaiAreODu1O8gcvlTGIo+rsZFg=;
        b=a4ZqtlFlpfIN9/p6dTCbsu1fnwyC9KOgxKbDZN3Un5nLaBDoNEeslOLcq8p5mgJsSq
         jWbGQIdHy5+/WPyLFjyEuTTkrqLL/4yVa0tTz+M43vsCJZX6cFF5YkdKd8HrxxtWjVe2
         4qjSvLgdhe7a2V3RZmHpwgiA8ZPWaAg2RKQL+NvQHf0jGIex9VJwzrHtVDirXA0DVF9h
         BPS9YGvPHpmF0bCaqtYmSZAl9gSsPIWexs25Kf+gtxNdaji3r1Ydxny62SNun9/0XaWW
         y/aFhXnLOnqDBzWgSYGpxr/1cBUEqZF+QexssYtqmmWl6k45wMH4WUJB8JEHvUGCIEXf
         q5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687547; x=1784292347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Zh3EDdqYsDbtTP0VyaiAreODu1O8gcvlTGIo+rsZFg=;
        b=EzFaL5YRXpGSkgG++ZOqoT4oaaIrm5fYHXihHNdEkem9ZNsklQOkGv/G+O9VMja/w1
         kOwMN/3yjlsYFGx2XQrYcxvttxWExLZdGEX3RF3pxZVRawS7jIuJcGbk/mUZ34jDPJQX
         5jrOeVbmZUUwDhaSyho22j85xTUtIFR8GOI2ZZpnPY5GV3y5mg0J9a3hOSxKugT4NOZM
         6TlU8+S6c0fxewNESMAm49sBmheBuJOPPEVvVaeqoydCy0Bi/6fzGfZbbcRnWp7oo7hw
         4XZjhfM+FhEDaEZHYVyam7XDxE56wGvAOnr6Sfc5A38bP+O+dFyTb0opb4r5+/9Iyl2D
         1cRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq255vQLLrD4zwFDUypuWmqwLQCQa+ifgPh7qtlSpdIgKDomhFYCl0q7xIJERHcwXgsMOuhwJjPKNgK@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZI8OZk+WGVyb9U0D5OXx5fbH1Az6QIxS5nJaFAxYTJMaEd4K
	mYm0YZEfOaihLrRXAyWaTvJBKgXs2lKgdJNgcE9yWQDhAuiSV2s7dja9ro0IvmrKBfzFyDZyLnf
	GmzyEqm5WnqgiT5Iq3nLPdjRgMTP1pts=
X-Gm-Gg: AfdE7ck+U6rDdKWIXSnP5bBQFUq5eTZL0tQy8jftLjgpGh+dhMxHqDDVoKt6QxtsFdc
	bM5gTO7V8nx0KGzKkx0Uy47H8JPIM2TCwkbzW5yoFqV1kmRzqJMfD9huDrCrcjLaHjvBcmKpY9G
	aaORh8Vool+4Vh2mv5bjMiw3a0YC3F85fB/D1gk1dsX6BKkrIIjDlr0Dk7h4rJhM4UQiPiNzZ5O
	HIjRvBz3KZypobqzBeY30ycRg2T5xApn8KjeV/Ll5QNYdnH8aZpc/0xZZEqc9/bJddyxXhF
X-Received: by 2002:a05:690c:c50d:b0:80c:85c6:898a with SMTP id
 00721157ae682-81dbeb625aamr84145257b3.57.1783687547182; Fri, 10 Jul 2026
 05:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701095040.4139675-1-shubhrajyoti.datta@amd.com> <20260701214001.GFakWJMcM3nZgQ1ddK@fat_crate.local>
In-Reply-To: <20260701214001.GFakWJMcM3nZgQ1ddK@fat_crate.local>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Fri, 10 Jul 2026 18:15:36 +0530
X-Gm-Features: AUfX_mxSOObWvHxlBb7KbFaPM_WxvMUUinKvmq9rUWe9upc5jLriY90FIXCvfBI
Message-ID: <CAKfKVtH9f8bXoFQS_71xuQC52qPy+PjHNYFa_U3OB-Z+1g=3zQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC/versalnet: Pass flags=0 to memory_failure() for UE errors
To: Borislav Petkov <bp@alien8.de>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-edac@vger.kernel.org, git@amd.com, 
	Michal Simek <michal.simek@amd.com>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 3:10=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrote=
:
>
> On Wed, Jul 01, 2026 at 03:20:31PM +0530, Shubhrajyoti Datta wrote:
> > The MF_ACTION_REQUIRED flag is intended for synchronous exceptions
> > where the consuming process must be killed. For EDAC-reported errors
> > discovered asynchronously via polling/interrupt, flags=3D0 is the
> > correct choice, matching how other EDAC drivers invoke
> > memory_failure().
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> > ---
> >
> >  drivers/edac/versalnet_edac.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_eda=
c.c
> > index 97ec05d68bbb..d1af5e175f7e 100644
> > --- a/drivers/edac/versalnet_edac.c
> > +++ b/drivers/edac/versalnet_edac.c
> > @@ -464,7 +464,7 @@ static void handle_error(struct mc_priv  *priv, str=
uct ecc_status *stat,
> >               pfn =3D PHYS_PFN(pa);
> >
> >               if (IS_ENABLED(CONFIG_MEMORY_FAILURE)) {
> > -                     err =3D memory_failure(pfn, MF_ACTION_REQUIRED);
> > +                     err =3D memory_failure(pfn, 0);
> >                       if (err)
> >                               edac_dbg(2, "memory_failure() error: %d",=
 err);
> >                       else
> > --
>
> A bunch of preexisting issues:
>
> https://sashiko.dev/#/patchset/20260701095040.4139675-1-shubhrajyoti.datt=
a%40amd.com
>
> They need to be addressed first along with everything that is waiting on =
the
> ML. Then new patches ontop.
Hi Boris,
I have reviewed all the Sashiko comments and identified the valid ones
(details below).
I will be sending out patches to address those comments shortly.

Issue 1::
;
This is a pre-existing issue, but can this lead to a NULL pointer
dereference?

The comment is accepted and will send a patch.

Issue 2:

This is a pre-existing issue, but does remove_one_mc() also unconditionally
dereference the potentially uninitialized mci pointer?

The comment is accepted and will send a patch.

Issue 3:

This is a pre-existing issue, but is there a race condition during probe
that can crash the kernel?

In mc_probe(), register_rpmsg_driver() is called before setup_mcdi():

This comment is not valid.
The order cannot be reversed as setup_mcdi() queries the DDR configuration
  over RPMsg, so the RPMsg driver must be registered first. Also, the firmw=
are
  does not send any  events until the DDR configuration has been
  queried, so the race window does not exist in practice.
