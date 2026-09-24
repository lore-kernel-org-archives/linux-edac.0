Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF0B33E360
	for <linux-edac@vger.kernel.org>; Thu, 24 Sep 2026 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259337; cv=pass; b=rCWtdUrSKjxIedV28RTsPSsDIl/LcNArlvFni1K7UA3YV8O/0A2LHuu8de0qXJyvujFvaKV8lrtVLaluvcUKdthp9eUsFqckVdP5vGR1XX2H9T/+9u1ExGZuwMU+LXPCcvErL7K3bg759zmddeJaSR6/8qZkKk+7LSDWrnKIOhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259337; c=relaxed/simple;
	bh=fwqbiIvV2P3fJebB0UiNrrEc0OEvVKiw/rH/H2+mMoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WehXGEkcgs6HeWPEvc3QMyG7KcKPo25UUKflFWDQ8IoLh0Hvnx5jNPgE3jXjL2NHJrn3gz1Oo0mle7Lc+YKQWxYMHz2ve/tNT7PexgEnp+/AU7EkgnGvugi6kTl3D0uISqD9rYjSBzN8imJoAg5u9awP1A1SSy2WpiIfTzabmMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3K3d5kP; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3K3d5kP"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4ab201ecso1970508d50.2
        for <linux-edac@vger.kernel.org>; Thu, 24 Sep 2026 07:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790259334; cv=none;
        d=google.com; s=arc-20260327;
        b=d4sKHiCQYz2b/20g9rDwth09WZhWSIFxkPZF5aQzY/Ic9fcQBKEO1EHdUXxSoOwAER
         4cqOZn8FwT/vYia7DS9sB7Z/Jl3LxFaJK1NIxar7HnQRFdsI+GIfplsxdUEJHMoDmUIs
         d1fmpgoIclFeDH1fVk1X95DhGE3vZ5oc9xCjTRCYNJdVhSKxG2FWikGLzMDJhpX8QTXe
         /X+D6e+5C5UtsWPq5rJfZE3cvP//j48dnUpFprZTXI62vjqvzqB4JGm3CXA0PyRw3r5K
         tPhb8Yj6TkB7gOnSoLhGhRfxK6Mumq68uLLz0czsHLcp95ShkEK/lmIcmZq/0VJQWfxx
         Jb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VqwT+zeVYyyeJDz/W7VPDo/dJJgtgXoVFAXAXD+e99Q=;
        fh=o7VDSJJMp2P4CBTJPWIx6i7F5pV5uRvehuQwQ9LSjBQ=;
        b=nOWGspjmmMZH/pSNuF7Axahtm2klDS22tim7Ikd7VdtnTyllk8ib5PfG8pX9W0OcVA
         gXQhjJHVO6wzZSO1Iz6OocgaNRfWla/ja8QfLrbJ1Wa+FNphkeqKB2WPkH1WesytZIM4
         PCk86Ui0wxPQdILJt1i/isI3NlKtsxQYgkYM3jM+0r8sFBpCJ7D7gXxJJjUa6pw1kTZm
         KrjzeTFnJNijxs3Bg7pBhn5YdMXPhLxfzqWvHY/hUjOh/9PsvZ2tavjkEeEMrLhC2puF
         Q2G717FgixBNRzxnb1DWW2MqXfvOu/pUjyrAzOTyj1gqSC1NUyh8S5TH6xnQ6xIm1Qa9
         kzJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790259334; x=1790864134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VqwT+zeVYyyeJDz/W7VPDo/dJJgtgXoVFAXAXD+e99Q=;
        b=F3K3d5kPbEPHFwpEn6i8mTBzmoXMyGURRHUcDU8wjEdayPe7V1Utuisa3T8ae7Nv8N
         SZYxwe3zrR1iZmh71CUYjjbU8+HwmygCoeTjiqSidlwnWCZLb4h5bQv5mL9rv2dJ6+7S
         vnLtJwuBD2wQoH8LjlRo9+Wle8OMwnBkh/p1xfjAa2vLwA5ep8mShx4r62ByqsDyFStl
         ZZ735AynwZyVglkXjr55LyEJrd0Mg0AGReTg9AxlEQRk1EfPv6n7WbscetSgNx61jIHo
         CaitIcmt7eOqvAhhtsy3kBe+JIQCEYbQg/yJJ89aJkKfgbNp/glXOV4FyozaaLXJSl4u
         I+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259334; x=1790864134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqwT+zeVYyyeJDz/W7VPDo/dJJgtgXoVFAXAXD+e99Q=;
        b=D5Ny1HusZ3QjdF2Bl+B3fVlRf7sd4TclJUy7mLwaNPhNCjhQiO05dAJ8wTlgJnVXUM
         VuSrsusGm4NBQGPGoQrDVKyEw0V1ZLA6tg9FUAPXYoRUGrs6Kbgh/FHHQbxw6HIsTwUM
         5l22kZ8q4CleZZxCzMJ31iGjWy5LI7aBv4FXXYm0fRg+nZlaLF8rsyhOErz+GXxoWIoh
         1laK76gXqujtWDMuRaM+DJ2F/fksyKNf4EqLigC1N0Ni4lrs/YU5Q2s4cWK+hixLp2JK
         OcCJ5Lww3L1Ah0a/O9ph/dtLW/NPqV8Od+Q9akfVJGfw/QnuhcOYMaNLpiIxPaRE2rc3
         JROQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+hYtrB+Qfa+G5Km74lDIriKMxB34GaIvqGYdgVtSlSu2LHR+EbhUO8y/+uvxrL4d8mlTahkV4bB5D@vger.kernel.org
X-Gm-Message-State: AFq9FYJPLjZjLZ4smDoUL30TTFaw+HKfyNJdcJ3w9orc377SY2+l/JZT
	xorPXz3P+yFW7YWGMHGJiLkNJp1txagInJ5ljTam1N9rPsPPC4hm6uM8HNrkxbVjY48Vh0D+0mN
	qmNvY1LClnYsC9o+CtBXjRQMUH/EaFQA=
X-Gm-Gg: AYBFou3wYS6NVik8MX6gOlc7cF5RlhCdv7/WvVN/xEQU1hn81FZUF0mac1cR57/r9pK
	3S6TtN+cH0Mwg9HfIICzgVp4z1uGy/7OPggz3vTGwHVnlCy6VsHh70+viNIU8QOXYFLJBigsO6o
	Uq836SSL/S6RgC33eOrmFuOenWnGOBpaeY70tSVPMXwe90/+RyIKYGqXbST0hi8dHw18swZhlMX
	kCD8iBWeG6zVV6bgABs5xNlLK+V15P9WgUxLU+WBweIDa+Lba9+24vkWB6HcthPQgCpBRwhMweG
	7vCpY/oCwMufu2WpFf5qmshaG9+ljhZV4Ssx4rqNdnE4nf5inJFvRno+FQ==
X-Received: by 2002:a05:690e:bc9:b0:671:3e72:de4 with SMTP id
 956f58d0204a3-672ed2a5798mr1189306d50.50.1790259334119; Thu, 24 Sep 2026
 07:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920055519.3778269-1-lgs201920130244@gmail.com> <CAKfKVtGZH8OaXp0WtJSD7AAQb8BSWg=xo+x9jj1sbjSxjEanGg@mail.gmail.com>
In-Reply-To: <CAKfKVtGZH8OaXp0WtJSD7AAQb8BSWg=xo+x9jj1sbjSxjEanGg@mail.gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 22:15:23 +0800
X-Gm-Features: AclHuK-fZqbWgXfBotsQgsWCdm5fHoCRS2vmaG_pyD4sYaLoKbt6W1Kj9w7yy-s
Message-ID: <CANUHTR_yAgnZN05PBLae3DSk3xo0haLRRgHyKxswSYDE2tHgFQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC/versalnet: fix memory leak on device registration failure
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shubhrajyoti,

Thanks for pointing that out.

On Wed, 23 Sept 2026 at 23:03, Shubhrajyoti Datta
<shubhrajyoti.datta@gmail.com> wrote:
>
> On Sun, Sep 20, 2026 at 11:25=E2=80=AFAM Guangshuo Li <lgs201920130244@gm=
ail.com> wrote:
> >
> > init_one_mc() allocates dev with kzalloc() and registers it with
> > device_register(). If device_register() fails, the device has already
> > been initialized and holds its initial device reference.
> >
> > The current error path eventually frees dev directly with kfree().
> > This bypasses the device release path and can leak driver-core
> > resources associated with the initialized device. The existing
> > versal_edac_release() callback is responsible for freeing dev once the
> > device reference reaches zero.
> >
> > Call put_device() when device_register() fails so the initialized
> > device reference is dropped and versal_edac_release() performs the
> > proper cleanup. Return after freeing mci to avoid falling through to
> > the direct kfree() path, which remains necessary for failures that
> > occur before device_register() is called.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR con=
troller")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/edac/versalnet_edac.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_eda=
c.c
> > index 3a06b41c1d84..db3bf5a1345b 100644
> > --- a/drivers/edac/versalnet_edac.c
> > +++ b/drivers/edac/versalnet_edac.c
> > @@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, struc=
t platform_device *pdev, int i
> >         dev->release =3D versal_edac_release;
> >
> >         rc =3D device_register(dev);
> > -       if (rc)
> > +       if (rc) {
> > +               put_device(dev);
> >                 goto err_mc_free;
> > +       }
>
> There was a comment earlier from sashiko
>  failure path calls put_device() with dev->init_name still pointing at a =
stack
> buffer before device_add() copies it. That's unsafe in
> principle (dev_name() would follow init_name)
> >
> >         mci->pdev =3D dev;
> >         mc_init(mci, dev);
> > @@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, struct=
 platform_device *pdev, int i
> >         device_unregister(mci->pdev);
> >  err_mc_free:
> >         edac_mc_free(mci);
> > +       return rc;
> >  err_dev_free:
> >         kfree(dev);
> > -
> >         return rc;
> >  }
> >
> > --
> > 2.43.0
> >
> >

Would splitting device_register() into device_initialize(), dev_set_name(),
and device_add() be a reasonable way to handle this? For example:

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -64,7 +64,6 @@
 #define XDDR5_BUS_WIDTH_64 0
 #define XDDR5_BUS_WIDTH_32 1
 #define XDDR5_BUS_WIDTH_16 2
-#define MC_NAME_LEN 32

 static int init_one_mc(struct mc_priv *priv, struct platform_device
*pdev, int i)
 {
@@ -730,7 +729,6 @@ static int init_one_mc(struct mc_priv *priv,
struct platform_device *pdev, int i)
  u32 num_chans, rank, dwidth, config;
  struct edac_mc_layer layers[2];
  struct mem_ctl_info *mci;
- char name[MC_NAME_LEN];
  struct device *dev;
  enum dev_type dt;
  int rc;
@@ -773,13 +771,17 @@ static int init_one_mc(struct mc_priv *priv,
struct platform_device *pdev, int i)
  goto err_dev_free;
  }

- sprintf(name, "versal-net-ddrmc5-edac-%d", i);
-
- dev->init_name =3D name;
+ device_initialize(dev);
  dev->release =3D versal_edac_release;

- rc =3D device_register(dev);
+ rc =3D dev_set_name(dev, "versal-net-ddrmc5-edac-%d", i);
+ if (rc)
+ goto err_mc_free;
+
+ rc =3D device_add(dev);
  if (rc)
  goto err_mc_free;

@@ -800,10 +802,13 @@ static int init_one_mc(struct mc_priv *priv,
struct platform_device *pdev, int i)

 err_unreg:
  device_unregister(mci->pdev);
+ edac_mc_free(mci);
+ return rc;
 err_mc_free:
  edac_mc_free(mci);
+ put_device(dev);
+ return rc;
 err_dev_free:
  kfree(dev);

  return rc;
 }

This avoids keeping dev->init_name pointing at stack storage and uses
put_device() only after the device has been initialized. Would this look
reasonable to you? If this looks good to you, I=E2=80=99ll send v2 with thi=
s approach.

Thanks,
Guangshuo
