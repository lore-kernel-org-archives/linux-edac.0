Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7985C453498
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519235; cv=pass; b=ZEAoJrd3YdbuzRdS1V/Ptfm13ihx336KAM59xMDALWqWpGgQ848fZ5JxA+qEKwbtyPEKN0Wi7XInj+6/b/BVce70ON+mlYZ643sf4eWzomR2uWjPzUXfG4fhmixRh9NGDzIXOq3AsKcHKxRVfo88tfN6DFhunzGoJW5LG0JMe5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519235; c=relaxed/simple;
	bh=2GrMnRyqgn8yviiospUwkG7JcWQ9bwrkHGCB1AIyY1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4VKX5qzOcgcqrq+rRLVY2indfq0ZevZhC6ErnHjMZ7hY0zIEORLsHUEon0+9Ra3iIgX84tS46/VU+oI0qTJ8CAgCArLM1CUlx/ZzVUTXrNbKnyuLyOh8Vw0fbGSn98ITnGtjKHDgwsnYxgaiGpq38z4KUam4b/1YL7fakNDZxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcRaxjod; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcRaxjod"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a8d251so729537a12.1
        for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 10:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785519229; cv=none;
        d=google.com; s=arc-20260327;
        b=AYwSZJqMuYwxGLrwXUPNC9wdkI8DG+HIiEe+wrYXy4P+xZw8gL/uddIQY7Pdk6tPt/
         /Fd7/a9fzSKlCkIEI/K5IIoVrBloIKLeb2CIrdlTMtUaoo9jYv1m0XGZdawMn/HfndO5
         nmvU+WeGzqlPU3lt4n9OPs2XbYTE/SP6DzEEnnDOWtMVbHL9S0w+eLoC4qpw8iIQ32qh
         f/5LLb1GcMHfNsTgb/6m172Sp4BpmpwR+Y4jGfqIOeDorVobaixdLJXsvCHOLkEdGjEg
         Xog/KeMD/LWjIyAA9vZJ3otL6/ncDf1SS6ZkenOuGIZAz94D5O+pncBVr489qXLmXnls
         cIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PcmIIvcbB0qGHPWiDBHv4eEQq5GVkHmXinev6TD5uXU=;
        fh=oWf3/52cPmwj0enMc13UUbaaO0IkCmbcaxVYNqQAfg8=;
        b=OZzRiC/cejjz9v/h4j1p/fb669dxKWkBQIn2O/M7FSbWcUSEjLogZnLMzFnkXCQk9R
         5Lbh3C37etMUx5qdQRo5KwiFviShBIGyTWQY4XRWeROVA3qGSQpnX7yhv85uh8Oz/Fc7
         rBAzMPsAq6BP9xCyDGLw0UBiIAdBe4wCzxeLasSnYAND3QfWGplUNVcZJE86msXmwaDe
         UC0uOfjc98mEa+nuctr4BPA53FZgwj02pj/sx3gyHvv0DxndBJ07dl2v0P5fZcUuIZIO
         Bo0TbUFGiPKmDWRw9L3zvq30LlDUIhrSmJFeotRmyCSRknpMF6valyr8Wnik3MYMavx7
         2l+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785519229; x=1786124029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PcmIIvcbB0qGHPWiDBHv4eEQq5GVkHmXinev6TD5uXU=;
        b=TcRaxjod+VtcPmCswE7hLbRs2cWvi/6QvTID0bX9/xvJDRJeAv7sYDhqB2uEOieFDz
         p19n6CFMrTugg7kCQ1AbD9XG6pm5d1I9jDDy3aI94TTTCvIGXyASrrVFYqX7uA30NVVi
         YRHv24j0apj/xHmOSwfssqkXRFO27imJYI+0bslx6zB+iuBRrqpnaWFuIN6wvZNkWk56
         XJFAZCyfbGy7JnHuV9rX4IOz86xYxyEp25vs82QlVCvxoT3n2AOEai9LktZylXkAauYt
         /LU5ml0z243LiMvERX59FLu5SX6D4Whna9aWrznyHQu5RZWy4JJ2KQRYg/1O4Dha3aer
         ynSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785519229; x=1786124029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcmIIvcbB0qGHPWiDBHv4eEQq5GVkHmXinev6TD5uXU=;
        b=qntSoNh/Qav268RBqsgvk4aJjrcMaNrSY8D7qVZvf7meer8TQQriJ4ndq66mCsYpS+
         9pIeVPO0BPTYJ2JtnejR38eNn/KRee6x97c9VrNvPYoKe7xsNJN40pdnUc/bXBCGUvap
         T6cc2eSbbL2wCZ8SFvJUUpE93H2U12qXojWADL3Ir5OOMLRu7UM+5HTbU6FtuD9+xg3x
         tEs7Lm7uvmFeofU7hsYMwOcgFJJW1NXU6+g3xm+eKmsE3GWMAKY772BsaH6OtXbL1EI0
         73ByMH5AkeUrbJGKiu2jC3sLAROgIADkYp9Q9/AOz0ACCaGPwELizzUKW1BB2+MD9qS4
         ZkPw==
X-Forwarded-Encrypted: i=1; AHgh+RqsoIue4pYJInjB+e+4hhqUSskgYRx8PDJrlxxnGnmOkROyjsNNygWAGs/4fEFKtFW3QlYm7K9/lOzy@vger.kernel.org
X-Gm-Message-State: AOJu0YxjTMY1rryjJsDdjzWpYAQyoiulNr9Ipae+nlDHB2GZRkLnwftO
	mc2BN1XV1pfTM9qlug/WYRwrhe+4qbiHN+b3w6KL9nOqQhKxhZU7pwfYV2ESKek/5K5jfQShR0o
	0GtSvblRqd1IaCcj9TAANGZuSTyev15g=
X-Gm-Gg: AR+sD132Mj15sHRsvEV+fXPFzcZJAPadohZhJPjkjeYeB4twhfHuDZbg8jSND3FyP1T
	a1h7PJYRyoNhyzQnLbN8dBW+0h7nRY6MPcetvhxpdYMxFSdL/oYcCb9U1aI6qOTrr34LrkPHRPD
	/e5LHjatK7aElpZHqsAJG0HY+AdqRuku1UcPd11MiDJr0wWAfJFFfjMyUqn1HiST3B/YbYqVvT1
	ebJjTb/rGg4N9W/BzQBE75UaPchkXhzxNweXHXo4qy87UFZgHwN3WI7sClwgZNJwc9SWSSRFlG1
	1bouSdugAslegF7AGe0ubH+LYaBFQMXAhVNL1BYCRaJ8ffVGTZ/uHecPh7cHV/YVQuvGa5DHN27
	wQdNBs9oG0M3QKvDa8TlvcvyDabC942Yur5jbbvM5o4b3OE9Ww+nc9TT7xbZa7Zl1XH/xSk/OKQ
	0V/YILORJ10eBZFn5nrx7r8KRY+NSuvHSILDUW5uRLWhvhDuTo68vbOVvkQV/16ZlSfw==
X-Received: by 2002:a05:6402:3882:b0:69e:2585:7e6 with SMTP id
 4fb4d7f45d1cf-6a0a7d0274emr358248a12.30.1785519228943; Fri, 31 Jul 2026
 10:33:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729012320.616174-1-rosenp@gmail.com> <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>
 <20260731003650.GLamvuIgDKrojvA7Yr@fat_crate.local> <CAKxU2N-GnnSqTPPSYwpXiNRNdP+qdJWf+ueaNQQWNKvXWag3wQ@mail.gmail.com>
 <amy7R6W5aJ58t6fy@SMW015318>
In-Reply-To: <amy7R6W5aJ58t6fy@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 31 Jul 2026 10:33:37 -0700
X-Gm-Features: AUfX_myS_XgghhnEdjsO8mX4UIlPQBCy3ps5SVm87UE3VfhsoJ1tEnuNxGsp_tA
Message-ID: <CAKxU2N-KCz2UAKY77fUb9G_ReV-yRJhZogcZkvL4N_N6nrGWnw@mail.gmail.com>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Tony Luck <tony.luck@intel.com>, "open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 8:12=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Jul 30, 2026 at 05:44:34PM -0700, Rosen Penev wrote:
> > On Thu, Jul 30, 2026 at 5:37=E2=80=AFPM Borislav Petkov <bp@alien8.de> =
wrote:
> > >
> > > On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> > > > > here already disable hardware irq. Just call
> > > > > synchronize_irq() to make sure pending irq handled.
> > > > AI disagrees with this suggestion:
> > >
> > > How about you try to parse what AI says and verify it yourself?
> > Makes sense to me.
> >
> > The alternative is to use devm_add_action_or_reset for edac_mc_free.
> > I'd rather not do that.
>
> This one should work, of add devm_edac_add*() version to simplufy probe a=
nd
> beanfit other EDAC driver.
That's probably appropriate.
>
> Frank
>
> > >
> > > --
> > > Regards/Gruss,
> > >     Boris.
> > >
> > > https://people.kernel.org/tglx/notes-about-netiquette
