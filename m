Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE970345CA3
	for <linux-edac@vger.kernel.org>; Mon,  8 Jun 2026 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917099; cv=pass; b=dpfPwgljJgbmjm2jUb/P25dzi3EzVfQmH5xAXdJYzphdFH7HVCMbkvmxeaTrCl/7ZaleuU5vA/ztcpKd5CBkoCnxE0BsfofDWoF/HPA+o2wTaPefLO+UgFtwvwVlbjFpbP3RWBQd2mEWc2ZgNplx+QMgs+lauzeNBYNE4xf/3Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917099; c=relaxed/simple;
	bh=daRdSYuqIrGx5lKqZ/UAeZUyOr9RyWkPLt3m2H1+JmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6Ig4ouoQAAOCifnyGRVfy3/yqdz+aZLqIFXf+0CeDtQVeH8IV/NOW6t45BIUnP7ztvuEtKaTNOFvafsd/xPRfikCQlzCR+SC1KHt+7wXNdVyr1bxdw9+nH4YCJdAzxTgn9S5ENBW0P+HkWUxJC1fGlPhS/RI9sPqEJbBO1huog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7At268z; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7At268z"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6603246b66dso4096688d50.1
        for <linux-edac@vger.kernel.org>; Mon, 08 Jun 2026 04:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780917097; cv=none;
        d=google.com; s=arc-20240605;
        b=a8JJKvEkHC2kyb6+cWvIcCg86qUJ1nZ8b3xfUTQcFgS6dt2tBtEbhfyFL+KYiphc9m
         XPi6CVJUxx0urWFQ+guvpJ5GE5OjN543ANyz6d9lkdNO7hX7R5CllxUvzWmUriIeD3Pv
         aU92Wbe/SlOK5tFMfbhUGU8ee48YkCwbfrQ1V0VpJM8Dby/dhGZ7TZacwh+N9SpJdPL/
         4JyacGATGV37OhNAr9pGjnlOM1e/erse0SL/OR0NAjMWgu2CVYCXRVbHCDOfEMWnq5J/
         dsg/kTvZ8eXOPxhZYhKPkMU8jQo8kT7SoBRMF2kS1qmJf9/DET474TdbqFLWdoOsnGvH
         dPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R1zMkbdx+V7uySzbdyjjNapQjVxnTv6oOK0uVUNs8pI=;
        fh=fAG4dfdj709lzYh63ysCEPxg1yA28ZcEJNbektwn/G4=;
        b=CbwkuW180Zvyqf0cKunnNttIjELMBkQwbcfDZw9IQcRsSGWN8033Mj8M+gfyZCMPEf
         An47WTO5aEqcyxsXhYgBPP6iyqdhQvQ1BuRevcH5AALb6lgBRPqDSq2pcIb1BTqpzYBr
         xQjieW9k6M1XkN+RBF+8F6xsomTJQs/Y8mb8iBDJ2JHhlskxWFjcgzR5yskAuQbnEJ1l
         69c9Ieby9Wf0brreOEkquE1jO4ZzGyd36lvsXrt95hDqlTvtgWBtiHT78igcv18GruwG
         8w+6cuY1Q4A674VzPAvJJi9TW2OWL2xZXrZeLrEir5a2EJYx6Q5/vndxbUBmiCtnlmY8
         emOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780917097; x=1781521897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1zMkbdx+V7uySzbdyjjNapQjVxnTv6oOK0uVUNs8pI=;
        b=R7At268zCOigeUq1hh4exxoNCIGtG5jcmcjbdGLzwNtqZiUZXAtXhM1AqX26/BaiiY
         rpDT5llnjyuaNjATQfCC4p1tTRgi3Axef7GYkouHdGv9mwz+wgo8QkmBzdlCONTgWFxD
         Iezl9FM0YcNysiW7St6HerSc7OtyF1A6wtcKzz7fS/bOOUr/BbEchsLeKNIkFQGZGgru
         Dp64qY4D3T6oinT2gpH/66uXo9esNi9nxbVPAD0l0OYvoEsAykDRyC1x767ERWRFq6b6
         FJx2AuzkQFpMUnC33+8rPL2EKMECtgN4DJoDuoWowGMiaGLEL+c8II5WEru4+PJtF38m
         2GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780917097; x=1781521897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R1zMkbdx+V7uySzbdyjjNapQjVxnTv6oOK0uVUNs8pI=;
        b=efNlUmEuPYKsgGU5CPLGGGEn6Qhazb/Lu4Saa6udWoKz6hi9H752huak2BswEdaYYR
         5EOQYRZXLcc9VNnBrLlagdffWRXwwHWZzoz6DKBs9CvfAB7yQZ6GINV9HZ65NptaiD5B
         +bSrWb5bltm2AZ5wci9/6iA3mTyKFWrZjB1KY093BTXK15dwoGbPews9BJLrathGvJHA
         F58jB/7GSDsEnRuTf4Ty5ycpcmyDK/CoDvngchMKqIxwTe1oR/UV/PS/kKMBg2TK9xWm
         p4LgexwOhlAwA4iufFht7WApMsGUd5D87+zIyQXZVIHPZklUgpFGZTlmH4ZoPTo69fJF
         Jagw==
X-Forwarded-Encrypted: i=1; AFNElJ/AktVSjiZhwG2ITW3UJd/CoPsYJKhgG5da7LxxHflkz97IW3SJ32i36frsJxlCACQX0kDx7NYGc3XQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwEG6KiVrHI47kzlNVjK8rIDxADWx2z/58/UoNaFl2WhaPkICrM
	cep5BT7ZDeTr4iHTTfIXYGQbkDjKrE5+v1PhwUWUprTRtQPDhJ4lqJSjN9UrOp2saWvJDPmo1OT
	oWs3RpYuM/kLSysLT3Aq30B20lV3u/u8=
X-Gm-Gg: Acq92OE4Bv4UpYt3RuEE/DPQl5VCtgsTdILBVp58Kgl65hBhWGGFLQcdptT6U9QBMq4
	lwT2i1FYgNSEzZDi+W60g8Jdju5dySOhNe0HsAFPqRhiesXaXBD0jNOsTzvRTtHBbpAjZxzjK7D
	4KA/OTgHsmlaS3elvq+Xj4TZYki5SPWdqmJab+n8o74ufmRPfvQ59gpX4FHZ2FvejxXq9sdR5Ss
	3vlykxwkkLLsW2ZDPjG0B6VHsBZ/Za8BmFPbPP6gftlxpB32V1eVYGusq7Ue102Gp5sZmTGAkuI
	SxUw5sW5ZC+C1V7bqQ==
X-Received: by 2002:a05:690e:bcb:b0:651:8ba3:8785 with SMTP id
 956f58d0204a3-66106fd30f2mr12588218d50.60.1780917097093; Mon, 08 Jun 2026
 04:11:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
In-Reply-To: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 8 Jun 2026 16:41:26 +0530
X-Gm-Features: AVVi8CekqIcz_5r9gyG4t4Bhku7arypD-NG17f-7mgKBfZElDG_fELrE1nxqxpE
Message-ID: <CAKfKVtHUqcvv97E2CoETtU2tN5+9SYAgDde=bYQw16hirPM4yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] EDAC/versalnet: Fix teardown ordering in mc_remove()
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: ssengar@linux.microsoft.com, shubhrajyoti.datta@amd.com, bp@alien8.de, 
	tony.luck@intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 4:56=E2=80=AFPM Prasanna Kumar T S M
<ptsm@linux.microsoft.com> wrote:
>
> The teardown sequence in mc_remove() does not mirror the reverse of the
> initialization order in mc_probe(). In particular,
> unregister_rpmsg_driver() is called before remove_versalnet(), and
> cdx_mcdi_finish() is called after rproc_shutdown().
>
> Reorder mc_remove() to reverse the probe initialization sequence,
> consistent with the probe error-unwind paths.

I think that the remote proc should be quiescence first so that no
more messages will be
queued. and then the edac should be removed. See below.

>
> The rproc reference acquired via rproc_get_by_phandle() during probe
> is not released in mc_remove(), causing a reference count leak. Add
> the missing rproc_put() call.
>
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR contr=
oller")
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  drivers/edac/versalnet_edac.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.=
c
> index b87fe57aa842..acd51b492772 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -955,10 +955,11 @@ static void mc_remove(struct platform_device *pdev)
>  {
>         struct mc_priv *priv =3D platform_get_drvdata(pdev);
>
> -       unregister_rpmsg_driver(&amd_rpmsg_driver);
>         remove_versalnet(priv);

Here we are removing the edac but the remoteproc  can be triggered.
calling the remote callback.

> -       rproc_shutdown(priv->mcdi->r5_rproc);
>         cdx_mcdi_finish(priv->mcdi);
> +       unregister_rpmsg_driver(&amd_rpmsg_driver);
> +       rproc_shutdown(priv->mcdi->r5_rproc);
> +       rproc_put(priv->mcdi->r5_rproc);
The put is a valid fix.

>         kfree(priv->mcdi);
>  }
>
> --
> 2.49.0
>
>
