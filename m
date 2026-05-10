Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B052857FA
	for <linux-edac@vger.kernel.org>; Sun, 10 May 2026 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778450940; cv=none; b=NGqsSZsfncooxGPcBH8bDp+4weKVO0L2rX5EMbBZIlx94OcesgLVcUp/rwW08EoCZcBfmiUvr7q9fYKKUN8RaHyMVAu47QFBrriWZxHV08py1NxVLXitIulfukpLl1d32EgoWBjHvGbZQ4St6xE7i4/Q6R2q4M624aqzxd53DYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778450940; c=relaxed/simple;
	bh=S0fBVOIRGgL2UwTdfget9IwI+UC9G84Hp0ApLSLI1Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V40VAYP3T5WFsFn4/iGO8TxxSCLslpUMon+D94ZQ2bS6VPP3pRLMVy8tFx8WI2t0TQzswhNSuHwXsznFg8OL8zkRp8mj0LWBB2Ni/sXcQn+C7v+Qc0Kao24KY4aop7XDpHhV/YBLoCy2VthlEobjCH3+nEhQOh1wqkVPI1xNeaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDJMv0HD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDJMv0HD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d7e23defbso2037520f8f.0
        for <linux-edac@vger.kernel.org>; Sun, 10 May 2026 15:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778450936; x=1779055736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfH7VWnYyQuxcDxu34msfwSVF+In7u16HxC4K0jD2RU=;
        b=SDJMv0HD1m79t7uLDCuiQEHeG66QjqUpZrlLayuQlXAzfZRZb8ExqXGW7g+GRlU7/L
         p6j5x6jy06AMSbzi7nFCOIdr0CWMGONZDVCVvc+G9BtfTiNgFcIyRyAHh7UO/aKc1n/x
         wammJQD2l4gbTCWpeKHvYvsGK1eLC9pcZ/a8ggZZSFp+bJxG3vLTQBxa8vGqcrpkerB3
         8Sd0/GVrT+68q8AZlinzwEtaIlFkdEka4sbvfkh2hBlL+m5s3RUgYCCUdUdVb2i6ecI3
         EATVLQQKE4vT+HHQ+z5pvMWlL/wTV6l4fo/4mtJBwyWeAgpwZ2h3Bix1fsK1e3qMdWKJ
         v6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778450936; x=1779055736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sfH7VWnYyQuxcDxu34msfwSVF+In7u16HxC4K0jD2RU=;
        b=LN3eIqs2U6hdkGUuD7YXLoqFFU4rEOaFOXypvCdLUoAVEEMKK3zcn7YZl+F/yOXe00
         9X7CZzkVvBcV838ZjkxYZVHeJQCOI8mFtX86X9ZlVhb2433ewpm/ON0dYeMwqLCQQ37M
         ytikJewyW2uwhCISEVoq2+L3KPGSAtr+X3163Uj8TIYHquUYYBi0RCYfdeY6s6yfKRgg
         USRTXpKgFwf/v6xIRazHy7WKJLp6PLJ9Eol6MvJZQpBxzGN5mxL4PSyl+e84I4b4H8oa
         n2ys4sec7nA2s/7eAzR9Tfjfpugz8V7OMQeX7t9ftvE1Rbr7FJwbdhwwLfUDdmYYS1/i
         Ou9A==
X-Forwarded-Encrypted: i=1; AFNElJ/X1Ojp2SThg/oFTlA/sc0Opyx+srDeCaqe+4kuTeHZi9EGoFCWKy6ponsK1wrfpZywo+I3VThs1CHt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ND2IWhNZlnv/QHfYDaJswLbIycQ2qWYgfijgk6i9RdQ/45R1
	t+3oHXSV9F9/PoNabapMtHB3yebCyus8rcEFKSH2t2TS09FhmiIdEUw+
X-Gm-Gg: Acq92OHLCqW5cZ3uqWIxvsMmhgz+2t1+zU30wcAyYcyboaNGWyUz/vT01Z2IEMnYmi+
	qQNL2A82IBjyqHcwoEnR3DumcK7HxG1b+OKaMTU9IIvpmi3alzxW+U5D3bcSWV0kwLkkN9u1IJY
	JgcRFcxkBBEwFeOqjgw8UTTyzaYanmBLvM6WbQWA6RTDTepW/e+oNrEq8LR4iiydrdH6JFgWhl1
	DCM1eylyiC6gDFneK8Xk0lh0K0axJR2fLriFbgutv2QBYfFQReqNHxVBzPwX1yJukfmX/1uSA9v
	aXsBFYqvOqMVWnWdzudEI3nE+1mnKEUU9hx2XPJEP9RwzwA4jOVLa0FjBcpPtThJ/IToN/Ct2j1
	JFUwYVDNO8yGjhp9q0VCSYWgl9nZrfasnFBPx4BWaUMctA/o5NSt6+pLnUXU/tP01AjeHhJ+/8o
	SHvD2vmAOLVEa+nf7JBLTau1XdWdzpPVJHZRYbYdUN7wecRJAeR5nP63vvUPXbki+eMWC0DuE=
X-Received: by 2002:a05:6000:4201:b0:43d:7a97:78c0 with SMTP id ffacd0b85a97d-4568e51ca7fmr9950836f8f.36.1778450935641;
        Sun, 10 May 2026 15:08:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6cd75sm19908276f8f.16.2026.05.10.15.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 15:08:55 -0700 (PDT)
Date: Sun, 10 May 2026 23:08:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Borislav Petkov
 <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Kees Cook
 <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nick Li <nick.li@foursemi.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-edac@vger.kernel.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
Message-ID: <20260510230853.154050a2@pumpkin>
In-Reply-To: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 10 May 2026 20:24:41 +0200
"Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:

> In the changed files, strings were copied like this:
> 
>      strscpy(DST, SRC, strlen(SRC));
> 
> A buffer overflow would happen if strlen(SRC) > sizeof(DST).
> Actually, strscpy() must be used this way:
> 
>      strscpy(DST, SRC, sizeof(DST));
>      strscpy(DST, SRC); // defaults to sizeof(DST)

Nak.

This is test code and deliberately doing things 'wrong'.

-- David

> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>   drivers/edac/versalnet_edac.c | 3 +--
>   drivers/misc/lkdtm/fortify.c  | 6 +-----
>   sound/soc/codecs/fs210x.c     | 2 +-
>   3 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index ec13155824..daa140f4db 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -728,8 +728,7 @@ static int rpmsg_probe(struct rpmsg_device *rpdev)
>   	pg = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
>   	chinfo.src = RPMSG_ADDR_ANY;
>   	chinfo.dst = rpdev->dst;
> -	strscpy(chinfo.name, amd_rpmsg_id_table[0].name,
> -		strlen(amd_rpmsg_id_table[0].name));
> +	strscpy(chinfo.name, amd_rpmsg_id_table[0].name);
> 
>   	pg->ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
>   	if (!pg->ept)
> diff --git a/drivers/misc/lkdtm/fortify.c b/drivers/misc/lkdtm/fortify.c
> index 7615a02dfc..9a9159a120 100644
> --- a/drivers/misc/lkdtm/fortify.c
> +++ b/drivers/misc/lkdtm/fortify.c
> @@ -174,11 +174,7 @@ static void lkdtm_FORTIFY_STRSCPY(void)
>   	/* Restore src to its initial value. */
>   	src[3] = 'b';
> 
> -	/*
> -	 * Use strlen here so size cannot be known at compile time and there is
> -	 * a runtime write overflow.
> -	 */
> -	strscpy(dst, src, strlen(src));
> +	strscpy(dst, src);
> 
>   	pr_err("FAIL: strscpy() overflow not detected!\n");
>   	pr_expected_config(CONFIG_FORTIFY_SOURCE);
> diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
> index e6195b71ad..eda716f817 100644
> --- a/sound/soc/codecs/fs210x.c
> +++ b/sound/soc/codecs/fs210x.c
> @@ -968,7 +968,7 @@ static int fs210x_effect_scene_info(struct snd_kcontrol *kcontrol,
>   	if (scene->name)
>   		name = scene->name;
> 
> -	strscpy(uinfo->value.enumerated.name, name, strlen(name) + 1);
> +	strscpy(uinfo->value.enumerated.name, name);
> 
>   	return 0;
>   }

