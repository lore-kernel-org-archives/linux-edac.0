Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862670;
	b=YtEehgBFIfPJ9szVMMSKa903LOQCh1ZkE5Nqq+SmD6XogiH3YKMLUNPUPFBLrbtUMFQt
	 gnD+oTVHgp6GiNEeffDcTQq6S9CYUXcx+tVxow64u8GO9pbn7qBTc+hFQrYNq9/MQ9pJR
	 p4FAMk/awwHt+klO4eU0rkEvnur2M933Y9lLspR0503LTpud9A6YrKEDv52SgujfX6wrg
	 cky+7Mbh4OXMijAN+Nzi2pe+tbN0LcH39LOjAaLvNgo4h0A6hYaQQTd7iQ/UlN0Y5mTQI
	 LdGTZ+suwddfxuaTuyS957O53wFE5wGJEzuH0L9skpGE45cXYCWzGOVQb42OQ+kSmWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862670;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3eCiUVEIn5Dtr6Rp4L6xryJLM3aqYcQ7JcHCgMFb16E=;
	b=imiG1xsPKP8nPosod2mTFpyXXAzych5hqe6cldzWJ94QUKGySS1v5o54OHFSnymkQWMF
	 XNF4nYDWsb6YZCzd6+WytuHEtfCVTJqIjMOUrQeSB6OcfGXhAkgxZEpPFEBe0qte6uggh
	 8xYuG6czDSOlWIHGoakv6VG1ugZW3P9dkZt69EdZaI45OPXl32P7e/oxXaYs2EL3UxZ/r
	 3/QqQrpMEgTUXnzTRthMotLQPo1WhO6e+axSKM8rEUR57veZGHFYTpxHB9ZSwRWuT58hn
	 Ksm3tC6fpEhR0NW5vXA5SKCr6KvylhwJyj24HByr/Os2sM5y5PAqDbpQfKz5xQcllEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UCgRYLD3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED759606A328
	for <linux-edac@vger.kernel.org>; Thu,  5 Nov 2026 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UCgRYLD3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FF61F00A02
	for <linux-edac@vger.kernel.org>; Thu,  5 Nov 2026 07:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793862669;
	bh=3eCiUVEIn5Dtr6Rp4L6xryJLM3aqYcQ7JcHCgMFb16E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UCgRYLD3HfQA9V+CuIdExN7Z0kYYF87hU4x0q029MdZm90HzklRXoBR9BncHSpeY2
	 MeEEUzFxtJFupj/ZhGxroh+noVynHF8JSi2Z/mta91JEZnbO2B0Rh73QStJJHf5eQE
	 wX9g+MTouimCMmE7JM3LrAhX5HhBL1umh6D3N1O8/Wtei+TIR+PF7xoKLxYLe7Zxbk
	 gB4d/wvN6200b+YBPFdWeZMKPgzVsgh/k7uYwFBE3F0uvPm2s3RzGo1B5RFDeW44c/
	 JpjDEG8xYWgGqImbApkrsByKcNw4B9nHkWAxp7dk7GTg8Z8zFN4+tVdVIguISG2yGa
	 d5ky32pJuVkYg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso1669039a12.1
        for <linux-edac@vger.kernel.org>; Wed, 04 Nov 2026 23:11:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzZ3xWjYjHzA5rEB/RfAIl6Y0QIKIukwZ6V6PkufGgnNgjv5WlJ0Cz/K2y0V+lbkqhq2xWyXe1N1EKi@vger.kernel.org
X-Gm-Message-State: APuU4Z9KNW1dqjVjnEQdrgscxTu0qHidcjAGJGNhuLo1EiLgxZ9vgdZG
	9xOEVJ2GSkRQXG2wu5Kr459vueUUAA175k48avAX1DhZ+jt9z7G9UcmOvYJ6hkynujcLcGiaheF
	Ibg49WXtbjds/qUaiiAJPhoOr33v/JW4=
X-Received: by 2002:a05:6402:280f:b0:6b4:e433:ee16 with SMTP id
 4fb4d7f45d1cf-6b4e433eed1mr14476573a12.43.1793862668184; Wed, 04 Nov 2026
 23:11:08 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105025532.2055-1-zhaoqunqin@163.com> <20261105025532.2055-2-zhaoqunqin@163.com>
In-Reply-To: <20261105025532.2055-2-zhaoqunqin@163.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 5 Nov 2026 15:10:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6oNoo5UDoYGbumPx8b=eWuH15m520y_zA8O+qf7Kg9Ow@mail.gmail.com>
X-Gm-Features: AclHuK96l4YPX7dHi09PdavtUMdEWQoDoUgL0cMZJqxsooqttImuU3yY0lMw0_w
Message-ID: <CAAhV-H6oNoo5UDoYGbumPx8b=eWuH15m520y_zA8O+qf7Kg9Ow@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] EDAC/loongson: Rename driver-local symbols
To: Qunqin Zhao <zhaoqunqin@163.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	zhaoqunqin@loongson.cn, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 10:56=E2=80=AFAM Qunqin Zhao <zhaoqunqin@163.com> wr=
ote:
>
> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
>
> Remove the "edac_" prefix from driver-local definitions to keep the
> edac_ namespace reserved for EDAC core functions.
>
> Rename edac_check(), edac_probe() and edac_remove() to
> loongson_check(), loongson_probe() and loongson_remove(), respectively,
> and rename struct loongson_edac_pvt, loongson_edac_driver and
> loongson_edac_acpi_match to loongson_pvt, loongson_driver and
> loongson_acpi_match, respectively. The shorter names are unambiguous
> since they are all file-local.
>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
>  drivers/edac/loongson_edac.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index 3ed4d34a33..5dfa41e877 100644
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
> +static void loongson_check(struct mem_ctl_info *mci)
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
> +static int loongson_probe(struct platform_device *pdev)
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
> +       mci->edac_check =3D loongson_check;
>
>         pvt_init(mci, vbase);
>         dimm_config_init(mci);
> @@ -128,7 +128,7 @@ static int edac_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> -static void edac_remove(struct platform_device *pdev)
> +static void loongson_remove(struct platform_device *pdev)
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
> +       .probe          =3D loongson_probe,
> +       .remove         =3D loongson_remove,
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
