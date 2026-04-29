Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE939B962
	for <linux-edac@vger.kernel.org>; Wed, 29 Apr 2026 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456694; cv=pass; b=nuytUwVYgHn8xcCGioEgLLI46SNBG3r2Ku1XNggIz933IazhNbbqhxr19VZvdSDZryz9FHG4s7pQVg84T2AFft+UZc8rqX4ojkt/T/ctObMGzYkijnBwldvJVvc8GvUMBnsQmv0ngaZtGewJbi72k/TsdJkWNWrW0Ui9Sc7wYZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456694; c=relaxed/simple;
	bh=IUGO9ITeYzk8iVYlT2BE436qIRUtS+3Qg9uJHPFd3BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIm3nBFMIYZF36FxwCACd0T88t4vHwWknF41ELTlX+gdRWJz86JNIgZO+rFSvb89Af0+fLoh4+RIErdbkV1bMd/qENGaMQrk86cfin9O558UhDbJlnRASK6UhTYA20QbpEVcoG+rRMvM8j7I58xEDOuLSUoCOZHO+opIBHChUoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARZTXkY+; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARZTXkY+"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64e87a81639so11384415d50.0
        for <linux-edac@vger.kernel.org>; Wed, 29 Apr 2026 02:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777456692; cv=none;
        d=google.com; s=arc-20240605;
        b=Y78cs/4J7Bkib0yKlAG0fkKZhrw/PslQagtzmFUHCXrlfd+IBsEujBhmea8UCBEAPK
         +XD1gvZ9mTrlrVIdYuIA1KRBVo94d+jOxbc/DqmxlO3b3/WDXmKoD2GCzMeaozKZIBib
         Ot/+57AsaHWULyhp2jfWip3Q9rE3Yj7OtYxk+8EX5Qn08uy9BIRmpSdlBpWCeE3cEcj/
         hLtTFGeObg0UZyZ95TglIdUW2yWUSDTSCkADVL6dn1Fqq8x8cKg/WGqmh68rU0rFB8s3
         K5lqUrV9en/OfR6CWRauU3sTeDz9H+pfcpNLhAV1d6HkKlgY1pmsQfyTrYGLiQBHnZPZ
         tztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z8cBHmTltW74q0+RMO1NgXZiTgt7AZI8JpHmFAHSl6w=;
        fh=k+8Ebh4Z0dj7rDp9mfy5Uua4Dnc6saok7aMeFidYvWU=;
        b=beqC8Htn/9O6gjUx9moC+UEBHPEjkXp0jM7mbqpRnNZK4POxJ1mmoru9Eq0eoZHHLn
         7NMnad48au++ay2+fgrSVGfGPn3je7f2EPDroWAIqd9IFXoLiuGwtWOtKNWAnNbMQh4v
         hfG+Ofp2qs1n6njoEIobYxpajiQ4vxcOkdc7aN11XhMhJEc+QlGG6X8YLQ1ovLTFD53B
         R/FC/b/M3ajVgKFgs/NnrsxeWITaAZDfyxdaWpPXaMijf2tSSmhhKCkNWIG0gx8E9Z1a
         NtNE7mNCX9lvU0Wzx1VziIIhQq6SwjlzfqK1rsK3dP6tW4gO80E7sx50nOtbtIFuIrY/
         t0Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777456692; x=1778061492; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z8cBHmTltW74q0+RMO1NgXZiTgt7AZI8JpHmFAHSl6w=;
        b=ARZTXkY+V0dYfhpjYovVlEADos6nmlL7tmQjR7IIMDWwo0UjLJEvoty9UQqqI64hJf
         1fp5ifMju19rK59jckeu6QxuN+DtofROFMv+fGAPkjZFPEaXFQLmXkwyj/HIOjc7x1BR
         kvNO3plkp515swXZwQVozl5DbaYlA6gdzybDDzkEtFyKljgV07yAW/w/LD/luXR2ve01
         XRvZI/10s/Be3+9nz2Rg3OlFhUb34EpW6+ZjT2vj2oOmLCjjczDjmRCnlcmSGDK6k+OM
         z//OiXW4fxPjD+CVFY5IyxwvAQDNzMGByHJmb6BtFv15lx8WP9WrktssxyWN8S8/JUYA
         7BcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777456692; x=1778061492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8cBHmTltW74q0+RMO1NgXZiTgt7AZI8JpHmFAHSl6w=;
        b=JgBnLFD7Sb0fcvKCPZsYg91E1Gmqx4uFMUUds1h2OW1qD/3uLrsLLiZ2FNRABwoXp9
         46/lzPshkiaX4ym+gaPx1BJo1aUZfGbt3uZPGfsm3aUrmuApb0IKy3C1bEWatLvx6ytW
         oX6vyr13fR3VH3iOwSLJEE+1w9fAgegecwiH+PXofnDfP2yO+toa1duriOFu5Tb6eKzz
         PZJvn+YegzadmHurQokahtqKZKaShqYRdGkoy2cCdDMDEKvEAGJQhkMPPpzlWQBxZ1Zv
         L6vfK/oa9lr9sHLY7jjpbgtRRB+GEBmTyGvmJSi5I9JlE65pT9tx0oBIUhSs6osdPIr8
         TbDg==
X-Forwarded-Encrypted: i=1; AFNElJ+zcTGRrJAJHe3bswS+I+iLe7exWdFPQ21iiVIQ6ljxpFnMRk2mqUQUHNki61oj0b7vQej5qE/n9Mty@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpTAuYF/lMJgVX4VyPyaFoj29An972TOzs84Y3U21EpMqLYHI
	sZPzMe3hBqqnoNu6VOOJ0+A2vTNlxRL8qpsYDrfYR25O74vHB5//y9EUIBPMxdAEREGyTjciSNr
	ajDqet8B27xwb8zgVEh1Db0VEl6jCyU8=
X-Gm-Gg: AeBDiev905+cdRjQBGqOesiXGMDlrC+0tMydVJFU0cWqMoepeyIApPVoNTdr9Z+JnaO
	q+CrIYlFsbv4lsTiC4QjChBhYC9MlQ3+oFzVN5YRMT8AP30RKYQb9PTIxkMxnLBPOZVuKGvjl3e
	aV/tn6Ls+D8pdBNFeiYweElKognr1EMLY9PHYeIasNv85ZwdRe6onu7fUWBPQjab3zCh/3r6kJ/
	JqaZzA4h/sMcZR2Wp225oqW08+tu2LATJAlbV10umPREbzlstk9dg7s/9VS/uxDB/byOqxsNWuq
	lpAujfcET/MWpFvzAQhB32CmiFZJoaLs0n1OHhbQQPUh8gFWknO1Y+gsl/3I
X-Received: by 2002:a05:690e:4290:10b0:651:cf43:b28f with SMTP id
 956f58d0204a3-65bfb86121emr2639633d50.60.1777456692191; Wed, 29 Apr 2026
 02:58:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428214116.19230-1-tushar.tibude1000@gmail.com> <CY8PR11MB713407D5E4CB378072E5F2B489342@CY8PR11MB7134.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB713407D5E4CB378072E5F2B489342@CY8PR11MB7134.namprd11.prod.outlook.com>
From: Tushar Tibude <tushar.tibude1000@gmail.com>
Date: Wed, 29 Apr 2026 15:28:00 +0530
X-Gm-Features: AVHnY4Ip7ERstMfldi_qGuilqpyxLHGT-H4P-OcnYl53P7-B3_aeuD1e24ZWNQM
Message-ID: <CALf6a_-i+q-D=3v=P6WrmxYeipECvVW5aSQh1tXMC0ChfMTihQ@mail.gmail.com>
Subject: Re: [PATCH v2] EDAC: i7300: disable error reporting if init fails and
 refactor helper
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "Luck, Tony" <tony.luck@intel.com>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> > From: Tushar Tibude <tushar.tibude1000@gmail.com>
> > [...]
> > @@ -1147,6 +1154,8 @@ static void i7300_remove_one(struct pci_dev
> > *pdev)
> >
> >       tmp = ((struct i7300_pvt *)mci->pvt_info)->tmp_prt_buffer;
> >
> > +     /* Disable error reporting before unregistering device */
> > +     i7300_set_error_reporting(mci, false);
>
> Do we need to disable error reporting conditionally when unloading the driver?
>
>         if (enabled_error_reporting)
>                 i7300_set_error_reporting(mci, false);
>
> >       /* retrieve references to resources, and free those resources */
> >       i7300_put_devices(mci);
> >
> > --
> > 2.43.0
>

Thank you for pointing that out, I've sent v3 keeping this in mind.
