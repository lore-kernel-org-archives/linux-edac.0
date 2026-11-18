Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987965;
	b=kNRYeT4Z7S7zllVDMjLtNZ+rpWMhI4fRfmAEk5T2xTR4MUT9dksRa1T5u5kzD9spkva4
	 rAW0gh2mIRCz+6p51q6L0LkoLbAeqb9vicqM1tf9qwiTt9IrJfyCsZ6v2zYuJF4+nmyQj
	 2HUiBupwbNIXBynC3ZQMTmtZSlasnRzO0xyNAHZQFg9DyH3gLV/PNF0MzFR/cHzuqUVxj
	 xvPiNZoQiUCHUymYy/8TFVTRjYs825TQRsFJknYFT/C9Ov9vcLKE1PIKtgLQkwDcgv9U/
	 D7SWn8F1VMhDreNQmyA0rFIPD5eT0TtP0rDHP72xIm/27/gPtjt9k3EVKiHsI46mkUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987965;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+uuOiZnlyHUArWLCT9ZvqAUynSEjzvlk/CcyW2HZNtQ=;
	b=p6S8zx7atmXuU9rbxpy+9tjI+YS/UO4XDPuz2F4lkBbkkKv2KXS9YVujxKe2WBycSBvn
	 KPyz498haxhkwohRepb3Eq2vaeu5cGGOhieiSSJvQ6Adi3Vpbu6CWBs3sO291LI55gOX+
	 5H41IjQmDsQVemvPbE3w4kAGgrRSYFQD3k60cLuSCqKYf/wjXz+COuwAwi8YVPigY5G3J
	 p09JL8HtjDYN5J3Dif8UvBpEFsazKsz74n/hVI6QQ0mU56GrKPktBrDEDGkhISECpMRW/
	 1lM/7uDys7YmOehcpcFRLQWWswbZ5m6uETGUyiQIsg7b5sgXgxuNaQLlOeXbSbGn/oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JU5/Pxj9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C5606A332
	for <linux-edac@vger.kernel.org>; Wed, 18 Nov 2026 07:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JU5/Pxj9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B7C1F000C4
	for <linux-edac@vger.kernel.org>; Wed, 18 Nov 2026 07:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987965;
	bh=+uuOiZnlyHUArWLCT9ZvqAUynSEjzvlk/CcyW2HZNtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JU5/Pxj9A4lgTk3i4cM3xwbwVE4DKVsdKXRY2/DCDMR4iSRcHJrbN+cB1Wvuw+/d9
	 vvdMyQtgYJiwfD8ckDEXhDctnzhji4l19c6/gijRh2cV6CAn+JjyQKNRn4QWlj5j6D
	 dhVZ5zMJu+TJ9Herc8cUwFa3wF6DiJsnUw5XzNEJU+roMPM2YqwT3FQhUxAW0D6+AK
	 2e3RLq/hgWl5suAxgS+OKdRkBvAc5biIa5DQJCMnJixrTn430azRMAmU5N0DTPr0y1
	 5ccYM8DNc7N7q/JjqLNW8mg4daQdKPc6X5ALMPK7u92K99WEvEiW6isdEohgmyDZSv
	 NSiG4Qb7xZv5g==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b876afbb86so861860a12.3
        for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 23:46:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEIQReXOuo3+ZZ07/+VZsjP7MyglIaXSDv6/KPqFk2QqgLxYrcVRlFd4RHV5XQ5109R68xgiYqbfYjh@vger.kernel.org
X-Gm-Message-State: APuU4Z+rLTWuwrTHOh75ND6qgzY5PTxTtN7TV9KQWgJnVcydO/fcmQh7
	iPLLJh0RJ7aVSRLAAv+mYaniCPeOvm0pbXbg6GaDEXxn39Tkerby6na/28XUjoYnHj30xOVksso
	E/ap/5hBg/9dl/tM87/AcS8y8pOnTzMs=
X-Received: by 2002:aa7:c513:0:b0:6b7:d1a4:fe38 with SMTP id
 4fb4d7f45d1cf-6b887f161e6mr914951a12.40.1794987964096; Tue, 17 Nov 2026
 23:46:04 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118030330.25779-1-zhaoqunqin@163.com> <20261118030330.25779-3-zhaoqunqin@163.com>
In-Reply-To: <20261118030330.25779-3-zhaoqunqin@163.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Nov 2026 15:45:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4NPJXqciuph96e2LmadNbo49ENB-c84k7rQgsRffNdhQ@mail.gmail.com>
X-Gm-Features: AclHuK8UjdPhT-4UtZuI-F1TxAlbz1uoBdYFExh2mDu1lsBwd1HreL0o0d1hWzY
Message-ID: <CAAhV-H4NPJXqciuph96e2LmadNbo49ENB-c84k7rQgsRffNdhQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] EDAC/loongson: Encode node and MC info into mc_idx
To: Qunqin Zhao <zhaoqunqin@163.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	zhaoqunqin@loongson.cn, linux-kernel@vger.kernel.org, 
	Wang Jinwei <wangjinwei@loongson.cn>, Yulong Wang <wangyulong@loongson.cn>, 
	Dongyan Qian <qiandongyan@loongson.cn>, Chao Li <lichao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Nov 18, 2026 at 11:04=E2=80=AFAM Qunqin Zhao <zhaoqunqin@163.com> w=
rote:
>
> From: Wang Jinwei <wangjinwei@loongson.cn>
>
> On Loongson multi-node systems, memory controllers are distributed across
> multiple nodes. Encode node and MC information into mc_idx so that sysfs
> entries uniquely identify each controller.
>
> The driver gets mc-idx from ACPI _DSD property if firmware provides it.
> If not, it falls back to edac_device_alloc_index() for legacy firmware
> compatibility.
>
> The number of memory controllers per node (mcs-per-node) is obtained
> from firmware via ACPI _DSD property, with a default of 4 for backward
> compatibility. Validate that the firmware-provided value is non-zero to
> prevent division by zero. The node and MC IDs are decoded from mc_idx:
>     node =3D mc_idx / mcs_per_node
>     mc =3D mc_idx % mcs_per_node
>
> Cc: Yulong Wang <wangyulong@loongson.cn>
> Cc: Dongyan Qian <qiandongyan@loongson.cn>
> Cc: Chao Li <lichao@loongson.cn>
> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> ---
>  drivers/edac/loongson_edac.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index 5dfa41e877..4ee9dcb3d5 100644
> --- a/drivers/edac/loongson_edac.c
> +++ b/drivers/edac/loongson_edac.c
> @@ -9,10 +9,14 @@
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include "edac_module.h"
>
>  #define ECC_CS_COUNT_REG       0x18
>
> +/* Memory controller index invalid due to inability to read it from ACPI=
, etc */
> +#define MC_IDX_INVALID         BIT(16)
> +
>  struct loongson_pvt {
>         void __iomem *ecc_base;
>
> @@ -23,6 +27,7 @@ struct loongson_pvt {
>          * register state.
>          */
>         int last_ce_count;
> +       u32 mcs_per_node;
>  };
>
>  static int read_ecc(struct mem_ctl_info *mci)
> @@ -44,7 +49,8 @@ static int read_ecc(struct mem_ctl_info *mci)
>  static void loongson_check(struct mem_ctl_info *mci)
>  {
>         struct loongson_pvt *pvt =3D mci->pvt_info;
> -       int new, add;
> +       char other_detail[64] =3D {0};
> +       int new, add, node, mc;
>
>         new =3D read_ecc(mci);
>         add =3D new - pvt->last_ce_count;
> @@ -52,8 +58,14 @@ static void loongson_check(struct mem_ctl_info *mci)
>         if (add <=3D 0)
>                 return;
>
> +       if (mci->mc_idx < MC_IDX_INVALID) {
> +               node =3D mci->mc_idx / pvt->mcs_per_node;
> +               mc =3D mci->mc_idx % pvt->mcs_per_node;
> +               snprintf(other_detail, sizeof(other_detail), "node:%d mc:=
%d", node, mc);
> +       }
> +
>         edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, add,
> -                            0, 0, 0, 0, 0, -1, "error", "");
> +                            0, 0, 0, 0, 0, -1, "error", other_detail);
>  }
>
>  static void dimm_config_init(struct mem_ctl_info *mci)
> @@ -72,19 +84,22 @@ static void dimm_config_init(struct mem_ctl_info *mci=
)
>         dimm->grain =3D 8;
>  }
>
> -static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
> +static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase, u32 =
mcs_per_node)
>  {
>         struct loongson_pvt *pvt =3D mci->pvt_info;
>
>         pvt->ecc_base =3D vbase;
>         pvt->last_ce_count =3D read_ecc(mci);
> +       pvt->mcs_per_node =3D mcs_per_node;
>  }
>
>  static int loongson_probe(struct platform_device *pdev)
>  {
>         struct edac_mc_layer layers[2];
>         struct mem_ctl_info *mci;
> +       struct device *dev =3D &pdev->dev;
>         void __iomem *vbase;
> +       u32 mcs_per_node;
>         int ret;
>
>         vbase =3D devm_platform_ioremap_resource(pdev, 0);
> @@ -102,7 +117,6 @@ static int loongson_probe(struct platform_device *pde=
v)
>         if (mci =3D=3D NULL)
>                 return -ENOMEM;
>
> -       mci->mc_idx =3D edac_device_alloc_index();
>         mci->mtype_cap =3D MEM_FLAG_RDDR4;
>         mci->edac_ctl_cap =3D EDAC_FLAG_NONE;
>         mci->edac_cap =3D EDAC_FLAG_NONE;
> @@ -114,7 +128,13 @@ static int loongson_probe(struct platform_device *pd=
ev)
>         mci->error_desc.grain =3D 8;
>         mci->edac_check =3D loongson_check;
>
> -       pvt_init(mci, vbase);
> +       if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx))
> +               mci->mc_idx =3D edac_device_alloc_index() | MC_IDX_INVALI=
D;
> +
> +       if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) =
|| mcs_per_node =3D=3D 0)
> +               mcs_per_node =3D 4;
> +
> +       pvt_init(mci, vbase, mcs_per_node);
>         dimm_config_init(mci);
>
>         ret =3D edac_mc_add_mc(mci);
> --
> 2.47.2
>
