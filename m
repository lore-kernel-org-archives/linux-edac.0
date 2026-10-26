Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024001;
	b=P/kjGfKec90f5l+bBzctnYYE4q56pXf+eqmP02GJ3RVXRR3imG8X41TcxIg04y9yCaZz
	 EaftSNBdcBkP0OOGGKn/9OD7XrA4M9F+jjVQ500vTe0wqQbyD1eCJ0Wo5vsQQZTcr+UU3
	 8y94dA4O8YVDk5uRx3p3vV7YgWqRGosGiRa8+x7c1q1qRmmoQmt8rM0CAnJWmpBRqjNPQ
	 8lHBL5ymjY7ZTGiR54eYrwsoIW1e1o7Qp0rHwIYAiILksa7Mg5EM4CDhyL6I9PApSi0nC
	 nhsksfDFiIdQJTK9bNtRpMKHU10cgJzTIW5Wp07pSDIBxtMkhGdjbnUc7Idyn4LPNCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024001;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yx6JOOAwjfJvEl+q2w/2z9+UJVKvZxSYxlAqCZCN51I=;
	b=J97X8FAmjhRfqYHhRIpfQZIpQ0V3fma4ml8gfK//Ug+zPNZTJUHqqLjLTeLM1pJfCvu/
	 O9xTcJaeXjbRAqBdd6bWHXPebVhvWbA0z45tVD05eLVQu6wt2uKCATb43PS/V/ByHW4bV
	 Pm3aBOVgVUgzyJhTFTw0bzBxnv8FKlDf2CtJ3+WRYWUIu5f0vLLJAm2cusFQjtxwotetF
	 ecxvmy79xFGzi/dK30TGqg+b2bMomsNx6EcCk12nrATWeOEhGyB2KWYq8T+7DulfEuwaC
	 o+LcX1HfuaI+sqzMIK2m82WUWbReb7NVWWJvlI1GmK67kextTANCUy5ihIyMNCdTBeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1wte44Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5A0606A31A
	for <linux-edac@vger.kernel.org>; Mon, 26 Oct 2026 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1wte44Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC8E1F01829
	for <linux-edac@vger.kernel.org>; Mon, 26 Oct 2026 14:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793024000;
	bh=yx6JOOAwjfJvEl+q2w/2z9+UJVKvZxSYxlAqCZCN51I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H1wte44YpT5aIST/Um51VTsXlpWMPHKaLp6M5oMLQsLxwaJZ4E6mlSH111JBkzYLH
	 Bd/lr48tmGAjkGk4UcDV5XeiUfis5AlZ+cKbQLFHj9IOSPjqDkQ685RMNmmvUpFm1B
	 XZogLuGqhS262AaBFG2C0CAO2Ji/1StINXiEQ4boG1fSXqrrfmS4JAH7PrOBIqGf12
	 c2oe54BcwfJIUmnzvgetx+2JgRx+amL1lL1CpzEGeiiIrFMaXpTzBe0J4DLBJBUZ+9
	 E7cFr9B523TajyOQ+UyzGKFsl7vixI+vshtJa06d3bMIFcP98g0i/n3opgpwaDJ8Tw
	 J48hWBOJ6dGoA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so3540869a12.2
        for <linux-edac@vger.kernel.org>; Mon, 26 Oct 2026 07:13:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUetyr6SxSqeOqxoODu56k6zWcTi1SYfHHMRE13mGqXz1teGddiMpb9Uk3lFFS6oSp4Tt/OhDRiqEk@vger.kernel.org
X-Gm-Message-State: AFq9FYKWYS92IDy2Rzf4mG1L5OWuKVUdf0e4EYIESCOIo/yLNR/8OuED
	GGc7i1g8r4ETG+NnP2IIOPBAw1dZvrlgc1XW8ytJdDwYnV3BOka+NMjHAvHLYS23k0WN9fS2ymt
	oRImEdYrcGpgKxUd/6MBFgGWjMk4kC/Y=
X-Received: by 2002:a05:6402:4405:b0:6b4:1629:b1aa with SMTP id
 4fb4d7f45d1cf-6b442a87d34mr8879902a12.2.1793023999024; Mon, 26 Oct 2026
 07:13:19 -0700 (PDT)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026091332.30226-1-zhaoqunqin@163.com> <20261026091332.30226-2-zhaoqunqin@163.com>
In-Reply-To: <20261026091332.30226-2-zhaoqunqin@163.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 26 Oct 2026 22:13:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6dRGvL3wL=i66NUOmou89AEZTQoF8XV0DJY9KihkcatA@mail.gmail.com>
X-Gm-Features: AclHuK-ldtfwiCR5le0JdWKUWCsTMKB0NsMqWvVq9nRMk0olgQISDUVOAOerzII
Message-ID: <CAAhV-H6dRGvL3wL=i66NUOmou89AEZTQoF8XV0DJY9KihkcatA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] EDAC/loongson: Rename driver-local symbols
To: Qunqin Zhao <zhaoqunqin@163.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	zhaoqunqin@loongson.cn, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qunqin,

On Mon, Oct 26, 2026 at 5:14=E2=80=AFPM Qunqin Zhao <zhaoqunqin@163.com> wr=
ote:
>
> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
>
> Remove the "edac_" prefix from driver-local definitions to keep the
> edac_ namespace reserved for EDAC core functions.
>
> Rename edac_check(), edac_probe() and edac_remove() to check(), probe()
> and remove(), respectively, and rename struct loongson_edac_pvt,
If we follow other drivers' patterns, we should use loongson_check(),
loongson_probe() and loongson_remove().

Huacai

> loongson_edac_driver and loongson_edac_acpi_match to loongson_pvt,
> loongson_driver and loongson_acpi_match, respectively. The shorter
> names are unambiguous since they are all file-local.
>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> ---
>  drivers/edac/loongson_edac.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index 3ed4d34a336..d9bc33dda7e 100644
> --- a/drivers/edac/loongson_edac.c
> +++ b/drivers/edac/loongson_edac.c
> @@ -13,7 +13,7 @@
>
>  #define ECC_CS_COUNT_REG       0x18
>
> -struct loongson_edac_pvt {
> +struct loongson_pvt {
>         void __iomem *ecc_base;
>
>         /*
> @@ -27,7 +27,7 @@ struct loongson_edac_pvt {
>
>  static int read_ecc(struct mem_ctl_info *mci)
>  {
> -       struct loongson_edac_pvt *pvt =3D mci->pvt_info;
> +       struct loongson_pvt *pvt =3D mci->pvt_info;
>         u64 ecc;
>         int cs;
>
> @@ -41,9 +41,9 @@ static int read_ecc(struct mem_ctl_info *mci)
>         return cs;
>  }
>
> -static void edac_check(struct mem_ctl_info *mci)
> +static void check(struct mem_ctl_info *mci)
>  {
> -       struct loongson_edac_pvt *pvt =3D mci->pvt_info;
> +       struct loongson_pvt *pvt =3D mci->pvt_info;
>         int new, add;
>
>         new =3D read_ecc(mci);
> @@ -74,13 +74,13 @@ static void dimm_config_init(struct mem_ctl_info *mci=
)
>
>  static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
>  {
> -       struct loongson_edac_pvt *pvt =3D mci->pvt_info;
> +       struct loongson_pvt *pvt =3D mci->pvt_info;
>
>         pvt->ecc_base =3D vbase;
>         pvt->last_ce_count =3D read_ecc(mci);
>  }
>
> -static int edac_probe(struct platform_device *pdev)
> +static int probe(struct platform_device *pdev)
>  {
>         struct edac_mc_layer layers[2];
>         struct mem_ctl_info *mci;
> @@ -98,7 +98,7 @@ static int edac_probe(struct platform_device *pdev)
>         layers[1].size =3D 1;
>         layers[1].is_virt_csrow =3D true;
>         mci =3D edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
> -                           sizeof(struct loongson_edac_pvt));
> +                           sizeof(struct loongson_pvt));
>         if (mci =3D=3D NULL)
>                 return -ENOMEM;
>
> @@ -112,7 +112,7 @@ static int edac_probe(struct platform_device *pdev)
>         mci->ctl_page_to_phys =3D NULL;
>         mci->pdev =3D &pdev->dev;
>         mci->error_desc.grain =3D 8;
> -       mci->edac_check =3D edac_check;
> +       mci->edac_check =3D check;
>
>         pvt_init(mci, vbase);
>         dimm_config_init(mci);
> @@ -128,7 +128,7 @@ static int edac_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> -static void edac_remove(struct platform_device *pdev)
> +static void remove(struct platform_device *pdev)
>  {
>         struct mem_ctl_info *mci =3D edac_mc_del_mc(&pdev->dev);
>
> @@ -136,21 +136,21 @@ static void edac_remove(struct platform_device *pde=
v)
>                 edac_mc_free(mci);
>  }
>
> -static const struct acpi_device_id loongson_edac_acpi_match[] =3D {
> +static const struct acpi_device_id loongson_acpi_match[] =3D {
>         { .id =3D "LOON0010" },
>         { }
>  };
> -MODULE_DEVICE_TABLE(acpi, loongson_edac_acpi_match);
> +MODULE_DEVICE_TABLE(acpi, loongson_acpi_match);
>
> -static struct platform_driver loongson_edac_driver =3D {
> -       .probe          =3D edac_probe,
> -       .remove         =3D edac_remove,
> +static struct platform_driver loongson_driver =3D {
> +       .probe          =3D probe,
> +       .remove         =3D remove,
>         .driver         =3D {
>                 .name   =3D "loongson-mc-edac",
> -               .acpi_match_table =3D loongson_edac_acpi_match,
> +               .acpi_match_table =3D loongson_acpi_match,
>         },
>  };
> -module_platform_driver(loongson_edac_driver);
> +module_platform_driver(loongson_driver);
>
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Zhao Qunqin <zhaoqunqin@loongson.cn>");
> --
> 2.47.2
>
