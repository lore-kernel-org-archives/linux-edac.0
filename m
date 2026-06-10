Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BEB369D65
	for <linux-edac@vger.kernel.org>; Wed, 10 Jun 2026 19:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781120246; cv=pass; b=rHjTG5YhQ/juY3728oT4mWGkIly4W6weAH+W7KhyYPkdxltsGE1gIswUxP3q0KjFBu08X1elnl8KuiJ3uJtOS8oC3HwSDtr22NJMg1nIr7SbyQ0tCqKO0iWNLBVVmzD5ZuqoKyOXhfYGD+uCfFwmSGsDwPdusEJ+KC+wIBVKzR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781120246; c=relaxed/simple;
	bh=Ixac7VxRo3d0wU6X9sB+J1uXlGFvPt/2mRqyiRD81qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TR8yMT2oWj77qt1JOhG1QYCttrGUKnqZvOQt1npGG3oI33XuzxNNTHj8AV5NdzAraY59IPlqs17tc9/VHpVVNoMkC3dFNgF7uNhkxusqwJAr+6oPMGH+zkkI53Vqnff1YFmmNoWaQ48bUpkAhZZmX+v8UU8A+tIPDLDY6slZN7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmqIL4ia; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmqIL4ia"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68d23430690so14277419a12.3
        for <linux-edac@vger.kernel.org>; Wed, 10 Jun 2026 12:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781120243; cv=none;
        d=google.com; s=arc-20240605;
        b=Nw032AFQTI6F5q9CMWsqAKCSfHu60zm9DXkwbdNsmLi8CvwRioZwgcsFPsVbpWN9fu
         e6VaEm8cEaiHj8+Cw9MIf9jwhmAixnUe2E3h0CE3CWjS3+B41+jpe7y+tpoGjVY4u1to
         YO37o0CEsjvhuEe6cWP1Mr5QFHG114bM91Q2zSqXhT2ZcAnm3g6bthPliZQZLgY7C0PV
         E6/48bmbuPFEHumVbxpFupLqeC4NojZ9yR4H417lDI6FxJO8ozGeAnAMnyLcqYDWz4/S
         rwIhBUYvWxYzUen7QJw3MS/Z7jQ/5Ry40qZo3hTuSqbpUdE1l8WzPEN+qvBT5wI4Vt/1
         k1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zbB2gm1/ey0ku+lSZBCpApp5Y8jU05ibyR1g+DHlyPA=;
        fh=9DGCuTQU3ReE1WILWtHbpe6bTb8jAom/vAJAOu46a1I=;
        b=BNBLmKsUM+lNkjlkY6EbbrGLGyXxQ6RP8KanctwJ4qrarQI60VtyYJW6mYFR/6y0wY
         TJfGoZRtOjtG5V4IgmdcjVcT7BuPr5Tnv6s88wUl5JYIYTFYavg6VBwA3Sj1w/kcL4+y
         JROC3SA01uXjH/AikFGtooFuutwvcUoczc0DTxU9RIYtZZkYpbuabJBt7nCFPe0Sr4zG
         eVwygu5gW4f+FJ0LJE/bZYdvpG+GIs/PHvY+YoIHWa0KBWC3+Tmb+Mkixwbpizdjgwhp
         6+TtQX9AByUKCy4H9e5e0jMmdtFkXMiGttaJgIlUkvuNb1UYXKI9DofXNeqoDl0EPnYn
         l4rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781120243; x=1781725043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbB2gm1/ey0ku+lSZBCpApp5Y8jU05ibyR1g+DHlyPA=;
        b=lmqIL4iaGsu02AfUy3dEma0eGQOmdqe4AlybgL2qTm1PcVs5/+PMkucvmNmqxaiWqi
         CTEUVsXzkUbudCKz7jShR7FWGJBb8HRK0zt5X/RcnKaZmBPOGKmoU0Jt9kxBZQoLd6De
         Ki7Vu31K1PDkO2WNWyF4dYqB7lMVTk+eC33aMqqdbSaXHE7g7qkkDUAbXQWTy12nBDa5
         w+iVNbEXTkRlDrE8QzZSP0jaaUP4T/4np8FD40y5S4OghvGPPLXgNrlNAtUf8NpIFyT6
         BDtxsxhXe9gmMbzk6icK+jnA31kzQiSMI1+LPNtMX8BpVB5XLH8hAgVWxxFpVjITToag
         VZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781120243; x=1781725043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zbB2gm1/ey0ku+lSZBCpApp5Y8jU05ibyR1g+DHlyPA=;
        b=SY3cho4Zk4wKqADXPDvBzkyOGBFLBEtJRo3yC00JnqoU5f83tXdtw7sQG3yfJt5nam
         Fq9+Hm6xhJALEVW3X/vRBtNID5HMafJQO8947TPSasCABKBMq+2X8J1wUgzcfns4psz7
         pJKENvaBLIbUr6y0kS2xK3RGtnvDRFF/A9WPCZgQTHadbAdKMAqI03IdwdrIXzW3+nIq
         03Z9nryonjD990AaS4Yf7SJFaAoQPaGJNmkiRLimfnZtPr4iPsItpEN8pCLEgny1sBqv
         1vs4A9EBAk1l/CWDjpgZgoReclEVskwA37qYXFwDidddAosCsB/9xGCL0LDvEW/xm0GX
         Px8A==
X-Forwarded-Encrypted: i=1; AFNElJ8mUOFwoVPE+oKjMG+CqkOY7SbRTWcEN+JmtIQaphg4rLDA/Bk4qc/7CAJfl+0xs58KxSrSjx8xo/Uu@vger.kernel.org
X-Gm-Message-State: AOJu0YxOdGzmDJpPw1ZmNOcBB7C6YFcU7vCiEl7AZfNbhs9Toafalmsp
	9idGBvGix6iUVkO8hiphCAukxsuCB5kkttlLQQFOnskYs2p2OVqakevnH5mvyt0wrwYb3NEFhmw
	adv51e075/2lM1AAYAthSEUsZ5YT8Dp0=
X-Gm-Gg: Acq92OFsdy9K47s5iECyueHQ1xTdc8kg0v3t2gtRPZ09ko7As14sUW7/nirxwxz0ZNR
	bUmRLO77aFgR3rjT3xYdkMapDbvPlXKK76PAlL5Yu6l49QYHm07M+6igyygbNZz/0PV4sd431AO
	dh/cYEZ+yUkBiiNyL8qBVmJDUnO0Y3Xe3qe4ZZoNxSdBgpRkmIlY5UiMb/Qxhlj0tm47iwqCl4S
	ONkHjz2S5xJot4Outf6Bk3l2/uZPenrg+JM18aSysQh7ZssQmWQ9+r+Vu39zjb9elZnIEnY1G74
	YriyWVhY6s4V+Ylb4gZQIHpUYgViF3bknTODKgR2tqqchWMR/xDNBqMd3Uu6I9f58wXBP0kS6MZ
	tvR9XFaijUYzeuccdT4zMH+uUvwUSIjg5rC+GDRQIvBK5Q7edjk4aNSC9jjtN523BIIyA+Psfr3
	bK3MI=
X-Received: by 2002:a05:6402:1ed2:b0:691:a8bd:981f with SMTP id
 4fb4d7f45d1cf-691a8bd99e7mr9710984a12.19.1781120242952; Wed, 10 Jun 2026
 12:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603191908.5618-1-rosenp@gmail.com> <16fb1ca6-447c-42b6-b4f3-aade5ce7f90c@gmail.com>
 <20260610173352.GBaimgACY4q6PkkkUk@fat_crate.local>
In-Reply-To: <20260610173352.GBaimgACY4q6PkkkUk@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 10 Jun 2026 12:37:11 -0700
X-Gm-Features: AVVi8CdUiNJeiuw8rzqGFvYIVQTtyezSmgkUGFVQTPChjnJjOZH152zXTWQ_cBA
Message-ID: <CAKxU2N89fR+Es3gkr442Qcwq8A6KkXxrSa-6ZKVoNdEnus3jrA@mail.gmail.com>
Subject: Re: [PATCH] EDAC/mpc85xx: Use platform_get_irq() to get interrupt
To: Borislav Petkov <bp@alien8.de>
Cc: Johannes Thumshirn <morbidrsa@gmail.com>, linux-edac@vger.kernel.org, 
	Tony Luck <tony.luck@intel.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 10:34=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Tue, Jun 09, 2026 at 07:59:41AM +0200, Johannes Thumshirn wrote:
> > Sorry for the late response, been on PTO for some weeks.
> >
> > From what I can see this looks good, but as Boris already said, I don't=
 have
> > access to HW anymore so I can't test.
> >
> > Anyways,
> >
> > Acked-by: Johannes Thumshirn <jth@kernel.org>
>
> ... and Sashiko has found a couple of issues too:
>
> https://sashiko.dev/#/patchset/20260603191908.5618-1-rosenp%40gmail.com
>
> So, how about we orphan this driver, considering that we don't have hw to=
 test
> it on?
sure.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
