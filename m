Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626235;
	b=QmTBMzOL24sT+gkG0vffDQlOdeFGElXCqDF+khJ1NY6yu4sOxWLAMTAm9NlAVnvMJDOV
	 gZ/w/5Jf8kIDbsAY45k/wF+QTMkc+JHZazCaVSyWTfFcSNBAjQeQZnEQjGlvTYb+5MGvx
	 jKd4WlDLSYGfsWdJmO1V0QAQLkhzgiDd9YpzQ1mGa709x7/KBEPjd/EeiXt4vcOQIkJPS
	 nsFRO15iYsxoVyaZUmaLyoUC1nL+nCY/I77hvjLgozzPa3qPs4Y7/ZhpC7zCrLwrnu6n/
	 QoehhnyQKd7uPFk6ey7OEwaRl2yBJPHNvg+KEg+U74VD6aOUYlKueuj2aBRSxTXY2Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626235;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/KcILltQBoAou7W2+XQ9IkERjy/Lp2MpSgOSIAqYW+I=;
	b=Pa2pAbs29Y3Z0ugVVwWtX2PgXHs8DfXdARs7CtZawXadxWht1+cu2d4maWziJGjvP4zN
	 rt81cMcUaZcPKfG4gm0zqv0UJx82kP8xRMQhdLIX0p2GhDzmsYjlJF73w7WJjAUVOV96W
	 FgvY69kRSH1D27lXfSejz5csqlk0crmHUp8MfKAwOsO0S6kbRo7Ehn/lv/teL/XknTuMM
	 mS4/UgGz27MhQu42+Hd8vvN4gBONr6j2lNgx8CT/t0w2fmx8j+b6oEeh8NZtYqHe5/FXL
	 7IeQUzN1rD1HvbGu0K6fs2+ha7IC7k25UcOZh3s73UC6GBaauJ8L5IuhMv2IN7QKndQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D403D606A336
	for <linux-edac@vger.kernel.org>; Wed, 25 Nov 2026 17:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D403D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-92110499585so55752506d6.0
        for <linux-edac@vger.kernel.org>; Wed, 25 Nov 2026 09:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626234; x=1796231034;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/KcILltQBoAou7W2+XQ9IkERjy/Lp2MpSgOSIAqYW+I=;
        b=WXj9WmK27ZUv+4xP1EDudIBN7D54O5dMVzNldHvyA/WfG9hoXE1y1GX0fonJXmCn3Z
         kJZT0J+US1BFQPuZr4GG2KwdewLbV2nxcXXDRxSVqMbq4snXR5uRpyVgRNQWDmzgChK/
         gS5jO45rgSHXNIf5LFpVWHuIe34iSF8DO3DVCwYaJP1qcwIqHQic1GSvntl95HPOqET1
         CNTiDj/M4xANTRXftXD1cEOljk+C4wdkYGEXNDrz65JEmDqLW8Rdtr3vBCp6sydQpJun
         oSCwAysqYv4kEaGx41IleTxmbvK09jdd7bGn9u+eDzBMJ2IfZytu5ezvuRMzlkGG0rqV
         D5rw==
X-Forwarded-Encrypted: i=1; AL+hErHwA8BoBAKNz30A5+E75pYVjRdCD2bjKn9jcBHPUdh6ZIk5LxOJsX1k13g8RDlX4LAu/Chmb1tQGW5p@vger.kernel.org
X-Gm-Message-State: APuU4Z95r54o4XbQOZjDak9MBbxrAp9XEE5QuT+QZkWzIoB19Lo8zEVB
	1cQEDwqwhI9xudKG/O7wxSL4UpB6qa2T5PXVT/T62SSy6d4H/kQIhbwAK7wOzQbd
X-Gm-Gg: AZFdTZdRcYXzJH6aQ5whX3Tqd9SmNP6eWubXS8G6+vHF6BmaSL5aSk5Jznz6iLJIr8f
	MpF68B3z+k9VGahFXzr+V9rdURptDqJ0q0nQxVGaD9CRGR1kmQsmnBGuXKf5MetVldGED/k0gF4
	YOTj9dZ172dIKac1RO+DR6TFCjRiViCh85T91wRpXnIveo60lIE8xB3rR8JFTsAyWWTcAlDH6Wm
	+3lPhiEDP71P/gylloNbFnWqry3RgO6THtNqT3GRhH9RFSzBGxyx/GpLqSEC+nhlZQl//p8BBvi
	E+2nZzkLpcdiY6yl2oUiJcPfA1wVlqf6FweYdU8+t7LcTeFQhBfChmJ+MgP7KzsDmtQAt3ALThz
	Nvm4W273vYASYi91MRxgBYSOpPUrbUOqHu7ognazqLXM3C93ccCSAtaNDw1+j6XxV0mMq+Y+jov
	uq+aEKOzlBd9YrDbmHwkfCJYkYTiHLf3O/QdGlXVHJPckqEqQM51R6fUZiEq3QnNga9UMOyhbjU
	FEiC90I3IkN79x8jbEmvVmy2syAqheRBd/uLbedY/5BGIHLZCyRgb506svGGdI0GSFiRAhZaZZr
	T4bPNrOnpe7szA2zjCf8ON9ueOaHh2eYLeukeJcvBMndhLTXrKM/M8QeaNIuaTlQNMs=
X-Received: by 2002:a05:6214:460b:b0:921:3585:de48 with SMTP id 6a1803df08f44-9213585e1c5mr330409746d6.40.1795626233580;
        Wed, 25 Nov 2026 09:03:53 -0800 (PST)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349eae11sm167739146d6.25.2026.11.25.09.03.53
        for <linux-edac@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:03:53 -0800 (PST)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9217fbf97fbso4392926d6.2
        for <linux-edac@vger.kernel.org>; Wed, 25 Nov 2026 09:03:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG9BmVFXXErxFeh16k91INTPShhksT3VSEXu5CKMoC7Ey3nhyKVTuTHnScvz+am8qPrh4ggSjFmtkTi@vger.kernel.org
X-Received: by 2002:a05:6102:578a:b0:7cc:2f04:a078 with SMTP id
 ada2fe7eead31-7d7396c2b24mr10563851137.37.1795625787958; Wed, 25 Nov 2026
 08:56:27 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-paul-v7-3-rc1-edac-v9-0-470f2e6928cd@bootlin.com> <20261120-paul-v7-3-rc1-edac-v9-2-470f2e6928cd@bootlin.com>
In-Reply-To: <20261120-paul-v7-3-rc1-edac-v9-2-470f2e6928cd@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 17:56:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwTWXN4XepPPrKUTJXRk4pQ+MzGbDADe1Z7FSB7q11pQ@mail.gmail.com>
X-Gm-Features: Aa3M54ojpcJtUnDseL85QBstdnKjfhN6BZ1wTiGKwa4bXu6gXK1ydb3RLzGiqBk
Message-ID: <CAMuHMdXwTWXN4XepPPrKUTJXRk4pQ+MzGbDADe1Z7FSB7q11pQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Fri, 20 Nov 2026 at 17:09, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
> The memory controller supports ECC, software scrubbing, and SECDED.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c

> +static int cdns_setup_mc(struct platform_device *pdev, void __iomem *io_base)
> +{

> +       edac_mc_chipset_printk(mci, KERN_DEBUG, DRV_NAME, "ECC %s\n",
> +                              (!priv->ecc_enabled) ? "disabled" : "enabled");

Inverse logic is harder to read.  And we have a helper for that:

    str_enabled_disabled(priv->ecc_enabled)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
