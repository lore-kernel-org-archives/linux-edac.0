Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3302424641
	for <linux-edac@vger.kernel.org>; Tue, 13 Oct 2026 11:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891725; cv=none; b=P9pJK+/S87L6B42B38LZjkX65DE/P6JhyPz5jX+Il7YQtzva06YmdRmSMTGk7xEyfO9H3cjV4pD7RzOyjH2M5hv/31XkSrM88LT6SnVWqH0atDfJOOLT+KTgKiq+GO0iwdiZjPdnsADBoBmE6Bmcsw7B+oMVUVt1eSJPy5LF0Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891725; c=relaxed/simple;
	bh=k5veFeTTHtqbcVUOmk8kP3kRfVRBO7Pptciq5IbVpOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dM3oTDWWDv6a35/LW8Mtdpic6gE09DibfC64uanBcoWqvJNlbC5fE335GaVjDU8YByai6OzsWITTAvh28pAgjfHekbwvSuZ7UEbIY6nxhJOdmUSw2tVDESiVuUBLyjiznayK/c460DsrXy6PIQ2o2/BHeqv74JNSv0pgI3+P7dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so4106716a12.1
        for <linux-edac@vger.kernel.org>; Tue, 13 Oct 2026 04:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891722; x=1792496522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WEZ3XROOQ5wml3OCk98kzhYlw6diUWNF5eLEQIKJbBE=;
        b=y1DVl9EVqRh6POh///qV8qO++UloKYsSxyCW5nvN0L1+9IKSwq8TnTHRhn/hfChx5v
         ztb+jPPd+mpafMzZ5rm7Qb7k7rhnoHEjma4t2oP7nUfJ4sWNhssEPJ+N8vyFmOSzt1LA
         Z45YW8ne/7v55YHjqdVQ16jdYz0TO8yWyweUxGE9tKCn/qHSJjyftfY7Ygr5OiDfy3Tz
         CkNCCeTNX5hsO4J//xKUrwLoUVxFslQ/5284P5L8kyN0JCCv7Z7NJJ+cGVdeIgAJr3JV
         InIVItnYuPoFXuXG13PdLpAAoiy/0n3NHqDI5O8p57xwlM3CCnS9H+8DEODv/G5OTmLX
         w6Wg==
X-Forwarded-Encrypted: i=1; AKwUvBxIcm5CRLRxfHlSEhluQ6xYpWN0pUpg5LhLC7RlRKMSH9pl2vi1x/1bA2XjX+g1TPB+PFjnaDCQBBz1@vger.kernel.org
X-Gm-Message-State: AFq9FYK+ufNxy3r5c0MzJd4t/jPZHWJiw+KS2XTK8Eb5QKY4lt6wZORL
	2TbaLzMxvazQoKVxXAiq84MXC3NSynYXz3Rh/2kwlcRNoxv2TfYxnntr46bC+y9Ala8=
X-Gm-Gg: AYBFou2jL0eCVvZ2/VmK1TCAqgFym8UEO3sXXgCL8wxIa4l/UH3pSBASarqxC4W+B3L
	Op/BV1HQRLi5Ot8lEDhs8In81BvPMBaSccOC5w6KdfFORoCndUTGlOewn+SJiajf70mDOcXjJWC
	tKyCQK/1EdAkFgzYHZDQWKUwEgBAMyo6DSXsWTPGeoYfENxsgqna8mrk3WAxCOLtQnsf8fb+akZ
	vqEaHgSZrtUb5ILXzrpZ0dc+zXHNlls43RaUH81PmgLnsat+iJtc1DHw4TdSthFx362tDYJ9VP8
	dpsCjOdq4jXzlJakhTExfiQwRJlcbVh56fA9L0r8oiLiTm5CI/EaiIv8UkrkRBVjBRG3u5Eaw94
	EGrPcFv5VIVukKDfyufv8yAYNaSActgC75qYyp2THOMEIQT9vaRh7eX7sPX2nkFfKESAnG7p3Op
	HvhT5rYJOTtt9/p/dlKIa2VjfzRA8ahMRD+whN+NLe/XscfBjzBlvz1es53z5yJjzTaKSeD8CrO
	aoGL0VzFAsYwY9Cw3jfkwSUQ+iLh/CMUIbhA7PSI2619co=
X-Received: by 2002:a17:907:d03:b0:c29:4147:f4e2 with SMTP id a640c23a62f3a-c31a9fced7dmr1222107966b.15.1791891721856;
        Tue, 13 Oct 2026 04:42:01 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ab4esm574126566b.29.2026.10.13.04.41.56
        for <linux-edac@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:41:57 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so3063578a12.0
        for <linux-edac@vger.kernel.org>; Tue, 13 Oct 2026 04:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdIObJmja9oOb0fvpPra4LiULUu5FmzRgguRG3NNRWrxTSpo/OHrhivSxB76vSJNTbOCiZYJGOQiud@vger.kernel.org
X-Received: by 2002:a17:907:e158:b0:c34:e9fe:82ed with SMTP id
 a640c23a62f3a-c34e9fe8db4mr355591866b.28.1791891716374; Tue, 13 Oct 2026
 04:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com> <20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
In-Reply-To: <20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 13:41:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
X-Gm-Features: AclHuK9GyhuxP1j4sSDne1XJEsD6-l0raq_tLn-7rYWcCt7pn2fMfEYbVEbwDsM
Message-ID: <CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
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

On Tue, 13 Oct 2026 at 12:45, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add EDAC node to the SoC base device tree file.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -164,6 +164,15 @@ dmamux: dma-router@a0 {
>                         };
>                 };
>
> +               edac: memory-controller@4000d000 {
> +                       compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
> +                       reg = <0x4000d000 0x1000>;
> +                       interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
> +                       clock-names = "ddrc", "pclk";
> +                       status = "disabled";

Should this node be enabled by default, or am I too naive?

> +               };
> +
>                 udc: usb@4001e000 {
>                         compatible = "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
>                         reg = <0x4001e000 0x2000>;
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
