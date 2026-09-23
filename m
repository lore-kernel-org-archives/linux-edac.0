Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E007F4BF94C
	for <linux-edac@vger.kernel.org>; Wed, 23 Sep 2026 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175792; cv=pass; b=Gx2zYPtfUsjQ0/pDiMiYxlKVDfDrgcdxRaDVh1PLHtup+Cjtxt88Vh/HxU+gwJRss3Q0aJjtU8HPeynUaTYoNtHyBqPesGk9nPpH6DvlQHjuIUFZ/a5YnRXUo8OMA0b1R+3LsUSFZkvdMEBkdkZCl9kpUacNWK8wQptothuyZZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175792; c=relaxed/simple;
	bh=VFFiy6i7m4Wf/VzuM6iynbm/hGQ5/lbbEMnpZ0Pnm8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+mETwYOlOcVVE1WxBXD34C0iw7GRMCy+UfLGlmgFkvOm6YJ/fgNtCdlyoop4Bw8vwo8BFgTupGIKRKtobRGvo9oJJeOnJzAZIGaXzd7/bGDNnZsSQpcRH5Jkjdo1b+q/NdRwbRDRBspaSzCg3pUIcBbhTYduj5MPLL7wRlGba0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxAAcclj; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxAAcclj"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d4ddd1d91so11966767b3.1
        for <linux-edac@vger.kernel.org>; Wed, 23 Sep 2026 08:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175788; cv=none;
        d=google.com; s=arc-20260327;
        b=qcRFK4u3+yWiG7UB+ZJGqSc6pR0Zwcs3GBEoNMBiV55Hko09ILy7vrS8XrFBHbfvVV
         1qyalde1HfO54YoQUdGa8PARBXO3jv3YFL5QX5SWd289Ytwo8IjM8ofR0dNep30uxal3
         Gi6oEj0uzyWWE2GLmWjBYDLRQYlbJfF4nRTreEQAdagLca/dVZZOR/1+274adFvHzSu/
         BTsHrDqvRSpmtEftfccpKwxMuVQOa9hNkBTmOvdQHqsT4hDJ44PQeiOXvcLpFQEne63J
         nJr8JCHbkm+D4SqRMvpTSKlPfQrUjJxWdZbNOWXrEhlZg1Xzx4Y2YAV/3mqqW2J+I8//
         GtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CqJL8NRcEhCu62ajFpIWbPm1dT9gXwOhcdUPy9nZD7Q=;
        fh=zLOhNMCdPrPmVjxaXZUKNTPmPgylnXAjLnG9CaaUrVc=;
        b=oYHS1evK2AbBSd5oxcwep2L3HJSTv1FWxoJhQp5ORl2SecccGk/pVxzs3PDqZZsnq0
         5wpuwfs77gDh5+Sr0qBwOX88aNCce3/+iS0w2xSb38uO5pgjILPP98W0/HBXGDudbdL7
         zmwV8l593yP9IHJ0xJnluX3mjxF6gp0QVgiBOz4lOhptVdZQM2UEWegShmV9nN1lJxC9
         Ln7pcxP/HgDwkWOl4WT5j+C34etk9H0U5u4uArqbysQHUBskM+xIua6psDfLlcPQ6j3M
         UMQv7Y0bt0q3MZuStIJ7gF7IiqlVPzH6Q7zleI9PvtRP3ACfhEX7gRUVZch9EBpuMVBU
         27vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175788; x=1790780588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CqJL8NRcEhCu62ajFpIWbPm1dT9gXwOhcdUPy9nZD7Q=;
        b=gxAAccljm/dzygN8M5Tz2lkdDl8h0J+Rwx5bOM6KXAUbSmFEsgpuoyz0QXiGAyih97
         OtDaxqDm5Rxc9/PULh/3CXQ+fTe+ONV80wpj3x01Zt+jQu4U3yMNEVKh/5oJS9bdLWxN
         LkZSknXdGVbpQ4ht0zjxlH/+ZNIIdUBJNs89j5QCroXr/EkY4305FCcVK4/OCwg/QxpF
         qlTqGQjSn31vjG37ncbwQec0nFCqSYOGItBreutZiiOXss99WyymvDxlevgsui+/7ko2
         tkhKSSJfd63INMVZAYRO9Sv0MRCTqOMjyyiI4oXkaEL7hsyh7sAXlfe2diOk9pLBNk9G
         9MKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175788; x=1790780588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqJL8NRcEhCu62ajFpIWbPm1dT9gXwOhcdUPy9nZD7Q=;
        b=QFl//gMhr5oOrDuARAPK7bvLQeFeeY25ZuBMBrTGpF6OC11+rl1K1dZmY8ctICN7ug
         HwRHLnL1JUrYLOeAEisMfjJSm/lN8N8YNEBuyawBx8kCfS8W1L+Ye9mCHq9z63eOQQVm
         8KiEQ0TDKcuufOrZGpK90a9yPvVSv9zAFZBMA9xvC+Xn7k35D+Ki48Vx5GzmoKIXTFFA
         3P3G2F6BbxsiPv0oz3DdW4RGGpRVhBUh2JoaY0F5N6WVSbmJO4J52adIXsqrs0yOpQT+
         065VTT9G+MYedVkGMIGQhj4efedzdrpLezLyZCVzPJfZ6mWDsFxkM6bG/RqyIOAdd2Dp
         gu/g==
X-Forwarded-Encrypted: i=1; AKwUvBxJDs5uSc9cAMfIX1x6PMd0c89XiGIF7dioRvi0/0iPo+ihDCHU/VHRcFehcnWWp/7kn9AGnbMPObIk@vger.kernel.org
X-Gm-Message-State: AFuF++k7V5z+54s42ITYXkWnqbSUSRX6FZlxR2q+OEXMig+B9mnbDmyt
	/NkUIOY2id932H0SM5u1Ha0HQvo3c34e28xha0b9sutX/UyscSU3xYirdplEpwDEduVCiQyPpmT
	0/cNGpvUCHbV8axkGgE0ccP3etDt68l6fW+kI
X-Gm-Gg: AYBFou0DHe0/456ezZllMxNj2qutuuSbQPDYHqz4FK2sYPP+4CpthURnTxXEpxrZAUb
	v5lHXvjEnZmEnpUB5VsYMcphKfFJdLGjhOXg8o5zh6d+4Tg4sC+Dia+Pjbf6SuxIDdKEyWSYftc
	hsGqvUI2SCKKYZN6e05WRoZrbN4P3sWY0JQ4m8BcACEbFHe/taGu1oWl0JnuAqvZULNgxMDdzrs
	ZVJ8yN55gWUOXSuMu1RJPWc0pL90r3nk/vGIVgwGfqh4c8oQgyLG+vog6rjvqt+x/HKRJWY8RVU
	5J3leCi990htObCw8DSzI4KFKAPNQOmwHTQ/8/mk19wzZCjEjgmR6aHh
X-Received: by 2002:a05:690c:6d81:b0:89a:63da:cbe6 with SMTP id
 00721157ae682-8a45bc845c2mr20714107b3.44.1790175787877; Wed, 23 Sep 2026
 08:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920055519.3778269-1-lgs201920130244@gmail.com>
In-Reply-To: <20260920055519.3778269-1-lgs201920130244@gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Wed, 23 Sep 2026 20:32:56 +0530
X-Gm-Features: AcwNN1XS281TkGjU9vWolr0hcpYOQfQwJrTGBAS6vDHuzDaOItqT-Qc8-tIEa4I
Message-ID: <CAKfKVtGZH8OaXp0WtJSD7AAQb8BSWg=xo+x9jj1sbjSxjEanGg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/versalnet: fix memory leak on device registration failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 11:25=E2=80=AFAM Guangshuo Li <lgs201920130244@gmai=
l.com> wrote:
>
> init_one_mc() allocates dev with kzalloc() and registers it with
> device_register(). If device_register() fails, the device has already
> been initialized and holds its initial device reference.
>
> The current error path eventually frees dev directly with kfree().
> This bypasses the device release path and can leak driver-core
> resources associated with the initialized device. The existing
> versal_edac_release() callback is responsible for freeing dev once the
> device reference reaches zero.
>
> Call put_device() when device_register() fails so the initialized
> device reference is dropped and versal_edac_release() performs the
> proper cleanup. Return after freeing mci to avoid falling through to
> the direct kfree() path, which remains necessary for failures that
> occur before device_register() is called.
>
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
>
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR contr=
oller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/edac/versalnet_edac.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.=
c
> index 3a06b41c1d84..db3bf5a1345b 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, struct =
platform_device *pdev, int i
>         dev->release =3D versal_edac_release;
>
>         rc =3D device_register(dev);
> -       if (rc)
> +       if (rc) {
> +               put_device(dev);
>                 goto err_mc_free;
> +       }

There was a comment earlier from sashiko
 failure path calls put_device() with dev->init_name still pointing at a st=
ack
buffer before device_add() copies it. That's unsafe in
principle (dev_name() would follow init_name)
>
>         mci->pdev =3D dev;
>         mc_init(mci, dev);
> @@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, struct p=
latform_device *pdev, int i
>         device_unregister(mci->pdev);
>  err_mc_free:
>         edac_mc_free(mci);
> +       return rc;
>  err_dev_free:
>         kfree(dev);
> -
>         return rc;
>  }
>
> --
> 2.43.0
>
>
