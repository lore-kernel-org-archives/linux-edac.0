Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987975;
	b=wcU/b39IBBng4R+yEp6WbYsjIqQghxdvIsWaMbh/6aKNqc4uvft4gIDTxJD0IfizEBB3
	 npohc7LTHupm0Plm672U7aI6DmP+gSMJtzA8XgQlT1D+qehjh/gu+TbdoPiSU1y5cyu5k
	 6z4MfDYCigotHouXmEGtMlht78PmLrUmGGRQMP1Srpu96cQHo1TG328C2WtqMaPXYme9D
	 ylIwdoY7itm/cR9iWs9YTpziDWzvLxhxM5Q+leccsMlgQb+2fGeAPQwCtOdXWUj4/P5Zt
	 w3eBuDYucGnPbTDOO9LeZ/KFjOjoPB4217s/CB/L5s+ufOLv97ADqGsUQUDwVcup/QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987975;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=30sH07Udk5EZJ9hXcfWlOr389v19dRie2ogtyIdAj/c=;
	b=xClm5UEOlygnLesLz6cuItlszIoca+g0BgvHuC0lrOJnf9ijfX3kQWY7gU9uDnSdppQn
	 G1S5MTxMm+8nx24cZGyw9Y1KDjXGE6v2JoF9Ox6z37URWR0Mjo97sClz5LFlZAelDe60z
	 YVWgFcj6XDT+/HoZPgjGKq6eMZSSCI3BqzZ+Id20WQ9AehFmlmbNqII+55nEtQdiK5W/w
	 XZUpsJ63Bqk4NRDprp09vrN6kg/64OZ908sjkjU3PsPx6cZQExao96bevfWudD650v8KM
	 LOCeesLBBtN24cFMryT2csw+zith5s0swprk83yXfCZXuiQicsb6EgSccygLNP4BQ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CowQn9z5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E200606A32A
	for <linux-edac@vger.kernel.org>; Wed, 18 Nov 2026 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CowQn9z5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182231F000C8
	for <linux-edac@vger.kernel.org>; Wed, 18 Nov 2026 07:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987975;
	bh=30sH07Udk5EZJ9hXcfWlOr389v19dRie2ogtyIdAj/c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CowQn9z5U2VuS+38wVuiFFuCOmI46LRig8OnX6It11VoXzByPvOIWMVHobCNynv/N
	 891PKduOU4q1PglPdsScD9JCFYYCPdyevc8wP5y4pU9Qe19DVy2EdbziVxt6QmM4CC
	 ImE75DSvtsCTM2PFYL/lB8Osbtsv2hFzflnsM9gep6iF4ioHWvN/c1hK28RZKdjgth
	 kMioiiHZiMDenYKhx6Hnj8fDyIc7k3bTCXyCKZpuS4NgjHFhWMB7/OzkXGlVcOLHFL
	 Pd5FN0TxzowsPXdNztQzSxhgV6/rOGHO6IBKY5O7dzGCGS/MklKGXe8sg391jEL3Ux
	 pfAMYhEnIwjvw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso1659814a12.0
        for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 23:46:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEI1kzg5uVF+/4VezL6Y19+ow2kAaIfZ9y4U2M3J5tQq+WEP/A/qoOR5ibGeSiNj14OA8Cp0glanYpX@vger.kernel.org
X-Gm-Message-State: APuU4Z/cFYjrrHgoSPstHyd+jh4IE9vG26Q+kLlPfmrtTdI9vj+D1cWO
	h9gjuPL7Q0zBswWgOdDvRSEHijJmQQTCM94OxYC+z8VUWsNJu9e7KJPJUcOexP2hREAdCjs79m0
	2n6X5qh6qCSfdklijgKFkFFAAAnD1VCU=
X-Received: by 2002:a05:6402:2812:b0:6b8:8167:733e with SMTP id
 4fb4d7f45d1cf-6b887e516a6mr1400705a12.11.1794987973730; Tue, 17 Nov 2026
 23:46:13 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118030330.25779-1-zhaoqunqin@163.com> <20261118030330.25779-5-zhaoqunqin@163.com>
In-Reply-To: <20261118030330.25779-5-zhaoqunqin@163.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Nov 2026 15:46:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5n414H4gFbuMO9nnSF7+-OiazuBJb1RS+-Ff+3sUEUrQ@mail.gmail.com>
X-Gm-Features: AclHuK_iKbz1BrQHxAlrw7Ez_NrAmabN1s_TcdSGYEjiKF1LdVWWawNaVzb94Ow
Message-ID: <CAAhV-H5n414H4gFbuMO9nnSF7+-OiazuBJb1RS+-Ff+3sUEUrQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] EDAC/loongson: Add CS4-7 timeout filter for
 cross-node access
To: Qunqin Zhao <zhaoqunqin@163.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	zhaoqunqin@loongson.cn, linux-kernel@vger.kernel.org, 
	Wu sheng <wusheng@loongson.cn>, Wang Jinwei <wangjinwei@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Nov 18, 2026 at 11:04=E2=80=AFAM Qunqin Zhao <zhaoqunqin@163.com> w=
rote:
>
> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
>
> On Loongson 3C6000 multi-node systems, when the EDAC driver running
> on one node accesses the memory controller registers of another node,
> the read operation may timeout and return random values. This causes
> false CE error reports because the random values in CS0-3 (low 32 bits)
> are misinterpreted as valid ECC error counts.
>
> For cross-node accesses, check CS4-7 (high 32 bits) of the ECC
> count register. If the valid-cs-bits firmware property is set and
> the high bits are non-zero, it indicates a timeout or random value,
> so skip the report and return the previous count.
>
> To avoid undefined behavior on 8-CS systems where valid_cs_bits=3D64,
> guard the shift with a bounds check (valid_cs_bits < 64).
>
> Signed-off-by: Wu sheng <wusheng@loongson.cn>
> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> ---
>  drivers/edac/loongson_edac.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index 413ca654b4..50959d4429 100644
> --- a/drivers/edac/loongson_edac.c
> +++ b/drivers/edac/loongson_edac.c
> @@ -30,6 +30,7 @@ struct loongson_pvt {
>          */
>         int last_ce_count;
>         u32 mcs_per_node;
> +       u32 valid_cs_bits;
>  };
>
>  static int read_ecc(struct mem_ctl_info *mci)
> @@ -39,11 +40,21 @@ static int read_ecc(struct mem_ctl_info *mci)
>         int cs;
>
>         ecc =3D readq(pvt->ecc_base + ECC_CS_COUNT_REG);
> -       /* cs0 -- cs3 */
> +       /* Discard the read value if any invalid bit is set to 1 */
> +       if (pvt->valid_cs_bits < 64 && (ecc >> pvt->valid_cs_bits)) {
> +               edac_dbg(2, "ECC read invalid, skip: 0x%llx\n", ecc);
> +               return pvt->last_ce_count;
> +       }
> +
> +       /* cs0 -- cs7 */
>         cs =3D ecc & 0xff;
>         cs +=3D (ecc >> 8) & 0xff;
>         cs +=3D (ecc >> 16) & 0xff;
>         cs +=3D (ecc >> 24) & 0xff;
> +       cs +=3D (ecc >> 32) & 0xff;
> +       cs +=3D (ecc >> 40) & 0xff;
> +       cs +=3D (ecc >> 48) & 0xff;
> +       cs +=3D (ecc >> 56) & 0xff;
>
>         return cs;
>  }
> @@ -112,13 +123,15 @@ static void dimm_config_init(struct mem_ctl_info *m=
ci)
>         dimm->grain =3D 8;
>  }
>
> -static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase, u32 =
mcs_per_node)
> +static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
> +                    u32 mcs_per_node, u32 valid_cs_bits)
>  {
>         struct loongson_pvt *pvt =3D mci->pvt_info;
>
>         pvt->ecc_base =3D vbase;
> -       pvt->last_ce_count =3D read_ecc(mci);
>         pvt->mcs_per_node =3D mcs_per_node;
> +       pvt->valid_cs_bits =3D valid_cs_bits;
> +       pvt->last_ce_count =3D read_ecc(mci);
>  }
>
>  static int loongson_probe(struct platform_device *pdev)
> @@ -127,7 +140,7 @@ static int loongson_probe(struct platform_device *pde=
v)
>         struct mem_ctl_info *mci;
>         struct device *dev =3D &pdev->dev;
>         void __iomem *vbase;
> -       u32 mcs_per_node;
> +       u32 mcs_per_node, valid_cs_bits;
>         int ret;
>
>         vbase =3D devm_platform_ioremap_resource(pdev, 0);
> @@ -162,7 +175,10 @@ static int loongson_probe(struct platform_device *pd=
ev)
>         if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) =
|| mcs_per_node =3D=3D 0)
>                 mcs_per_node =3D 4;
>
> -       pvt_init(mci, vbase, mcs_per_node);
> +       if (device_property_read_u32(dev, "valid-cs-bits", &valid_cs_bits=
))
> +               valid_cs_bits =3D 32;
> +
> +       pvt_init(mci, vbase, mcs_per_node, valid_cs_bits);
>         dimm_config_init(mci);
>
>         ret =3D edac_mc_add_mc(mci);
> --
> 2.47.2
>
