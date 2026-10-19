Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA5B56B175
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419702; cv=none; b=t7DynZX3/v9PHHIbFWnowXz9ogqY1+czNLNENxAhtkehmeUacxvh21GpuAnjRnBdTRyx0EttGWpOnqSRw8QgKKyYK3X3J9Dy+jozV6kMkrLC1WoNe5Tpn11EjiheS0Hy9IX+VAmTB1EwBzAx41nSVvpuP1AIae5G0uid5sLgEqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419702; c=relaxed/simple;
	bh=SNGLc1dRo+r2RFwuwPeYSacsXpa5s/1i0LqchSr1mA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2x49flIrWVhc2uOCIn1byC6Y9022H2rwXpdrMURkU8WSflHaPifTZzWuh4rbt470yiGsMoUPnLjkalyZCzENsD4yRn7V1hE9crHG9YEZb6K3L7wJ5EaFAV6qrVARpSXg7ntjUzCVyZhsVvY8S6Oo24TaiGDAM+DRfjxaZWm+KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso2072126a12.0
        for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 07:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419699; x=1793024499;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r5Un3tcFd0CWzR3WfawxmOsdbODnCsUjJ4VgKeoks+s=;
        b=YjEeRUbXRBue+i8g3oaoemeBNVSAgWRFnjFNQVOiiCKjKsFtYQuXdDXjqfacMU/LJm
         phAHV57+VKchsDb6+KgM8cKTLHabHlVEfteo9jUgrHxUtb/a116rlw8G7xjR+/C1MOue
         U7E11HX9G2gmCTUvQRnAdlbCzi3PL02OWJiWgC5qX+JKRQQCCUoSY3r1xPVEdrtmQ4sE
         xW3beAQpxyWg5ZBMy9yXmzRTTZfX0/YTyeyPjyrhu5F0ebD8aV8mf+zQtrZfkfAX2WDb
         ud6AdE/jPIpGj/dwPPXlkvnvS/lPNJySWl5HPjKbGmxTcUGzlAdsbdh1UxejlYSWmk+l
         7HAA==
X-Forwarded-Encrypted: i=1; AKwUvBz783XN412d+ECputVCAPDWHo/N6i3oi/ZkjcB/kTZB97VyfS4u6YpLl49j3s+hDGJFnh9+v8U5r/6z@vger.kernel.org
X-Gm-Message-State: AFq9FYIGOgPuTGVIuLgvYY6+XuK9FhH69YeuuVOe2vRPoIpjx9+m5782
	ow0AwnK74iUvlj2zTp5Lo9td2WXcWIWaRmqzXcctAaTOl/GbApYGx+yvpBbEt/K1os4=
X-Gm-Gg: AYBFou31EbfAJCWXsDCk4bA7euAGpeWSzCMOnWsrv7zwqjJag7t2c20kBLwxcDnLLSw
	nEbfjXlzgJjMyd1mxOgHd9jJV26lwtbx8N4wTsKA6cDpx6bGkCuGIxreIUWXJh1nrrjP1zMw/1D
	lsdAmLquR1Mj8wJ/pOG0vnCpaMHepgAQ30wYDf3uVRh7FmCk4/XHQJ6qma/lXsIPdQYvmZTgWwr
	Kw333e0LTlGTJrxxa1wfXnYiQ7il1W3yFwNZlGS19vfJQrwP+JY+i+u4No+EhrE0uGkTYuXLrWR
	i2rsxOHTICGIIuc6IbowIHT3aqUFvtv9oA8HoKz9tm3iDTXvSn8prUCNBOb1ae/mxwBk3/z7a91
	fj6NYK/dZHx/bUeEiQTTT24hCWt+cLy77Qb9u3kr4KhiEGcSBG8WvKAveCcjcsWT0PA+Lb95p/r
	RU6uGrgGOcUk3HBEfla3eE22pWG3PRkpf+TVHqB+fO8sY3jmrJcTziF9dZCYEusJ5I34Se37G0H
	236ferp89PpDfnEszHgr/Idgi/1fLP5auov
X-Received: by 2002:a05:6402:5c6:b0:6a5:f4eb:df3 with SMTP id 4fb4d7f45d1cf-6b3a8100dc4mr2985615a12.2.1792419698815;
        Mon, 19 Oct 2026 07:21:38 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d5262sm4085854a12.22.2026.10.19.07.21.35
        for <linux-edac@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:21:35 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c263415982eso253694366b.0
        for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 07:21:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxWo/H7mS8N67HNnqcM2gY37iMLuxNyILwb7SJ/13QHgL+YAk7lucIISql2JmrGpjZUSr+RpONkXd+/@vger.kernel.org
X-Received: by 2002:a17:907:720b:b0:c3f:153a:8663 with SMTP id
 a640c23a62f3a-c419e63930cmr576763166b.23.1792419694998; Mon, 19 Oct 2026
 07:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com> <20261013-paul-v7-3-rc1-edac-v6-2-2f1d6f2f74db@bootlin.com>
In-Reply-To: <20261013-paul-v7-3-rc1-edac-v6-2-2f1d6f2f74db@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:21:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkhM3OtWnckc-ou69ZYFMfRT+DmU5AgUctJ0uY9w_GDw@mail.gmail.com>
X-Gm-Features: AclHuK-siV4JYKFbtDQyYh3ROQEzSATnv4TCER_6U2XNGxIXypq0WsoD3L-uWls
Message-ID: <CAMuHMdUkhM3OtWnckc-ou69ZYFMfRT+DmU5AgUctJ0uY9w_GDw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Tue, 13 Oct 2026 at 12:45, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
> The memory controller supports ECC, software scrubbing, and SECDED.
>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for the update!

> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c

> +static const struct of_device_id cdns_ddr_ctrl_of_match[] = { { .compatible = "cdns,ddr-edac" },
> +                                                             {} };

Why this weird formatting?

> +MODULE_DEVICE_TABLE(of, cdns_ddr_ctrl_of_match);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
