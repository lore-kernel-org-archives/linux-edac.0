Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795798305;
	b=EVKLyW4Q76lW75ukiIhTxt2vPucgjAwbDfgR1l+U6OMapynBMrlYwbuyoka8JpZkMdUv
	 BJMznuGcqhm+nlRl4unCiCTYwRPxM7sn9mpfnaxozHqOACBnR0YlpSdbrxuQeyqZU9ZJH
	 QxmvGXeEM4tZC5BX8VNDMIeBRJnyzdcIxwqp/8nW3lAEG7Sj32DVPFMyvtvKzb88+PQJL
	 ecEUV5GFRs6FoRAwpHgKbHwd7mYwFAjJ70NRHLGe2d1TX2KUfOZbwA3uP8Rsy/zNcw0QD
	 sdMHper0JoIsiaVajYyyA+aGRce2dHNWISLAfy13Mx3fNG/aZrsTMbXRQG5OxoKuKiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Aa0L0rzRv3zdVjeEdi/EEptjLDB8GkAymEtLW7aVtuI=;
	b=0guWDmi+h41A4OB8M8LefSqokwRypSmN3A7x8lZPu4dOwyFK4EcE72JPONzjYp8JT1wJ
	 hSQCFWoldpsfFiEkz1ziauah1CZ6tkE9AeTpfcF2QHQxgii72pzekXFwTiTWEXD9+kKAG
	 zYzU3nT2QCXaeMsHryZxbupo61nRgsXim46MDooTLr3KE6/UtbodRH5vn8RMpwp0Ekv3T
	 NWKMBZ7j8QP2G2qLqCGYkxga9pI7h6dfMZUliK24JOLo+zSv1BdFymivnSa1qXCos0rAO
	 RH7eoQWuN5AxDinQc1E5yxkksK6AnnjkUG39EkAcqkZCEEaV4qVAhEF4yLIKAkZVEJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1FyZ2Dn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C76606A31F
	for <linux-edac@vger.kernel.org>; Fri, 27 Nov 2026 16:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C76606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1FyZ2Dn
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so9688237d50.2
        for <linux-edac@vger.kernel.org>; Fri, 27 Nov 2026 08:51:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795798304; cv=none;
        d=google.com; s=arc-20260327;
        b=nwe4w0fAI8Rx9djrm3E6trAbsil81wwbn+az4js/G7OtyMQNyXDbaL56/QZDk78JFs
         HpIqepXFmh+mx3Ech91jkxxlndFQWxTYQ8Nw8l+nYccF1IWsdtEnHSV2srUVKFJ41ysO
         i5boiThjk6Q4+i0O4EmkvjB7xzBc3+8qGEA7RUpiiw7xRjwyuPktgP5uMn0zcFC1nML9
         ZVuW8mj9ejrgOqxo7aEFSV1cFWa+O3117EZ/2TUsLthncgfWZ3551xs2Tr9MaijergA3
         afx7iWfOnH/YqlmhKx/8+XhC7Oeqw7JCKdU3TorlfTn39lZmK141RiSYAhsEO0MTQQS9
         FKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aa0L0rzRv3zdVjeEdi/EEptjLDB8GkAymEtLW7aVtuI=;
        fh=n8rABvOildSZDMCihHmT0J3+e4Ipfv5TohgbKC+Zs00=;
        b=B4zMVnClMtnwMqf8jOaXXhRV7SN5Sr/6g3HVfgDkOG/SmS2gzQqV0gGLVGA7pohzdd
         cKX8eT0shrk5M2ja0yil8YCPwRvDL7dD5TLJE8XbGLanbBCiokNQzFGhpgyFrI0MufIz
         gsSquuZEYDaBs/sAvcbL16H5d/A4pAaXR7AvjKH5Xf+wk5dK5UB9PzQOM6qltQB78138
         vwO8jjA1AP9rUScwYSEsf3xnl2ib5SrHPhzncGE6c01etgyC+EzWayPS7SWSO+9mLqew
         urJ/K5JmfiaO5XNWTxA3IxuIjTqVx9I+YOA5FStQeY0uDbUsoGrItVd/kVm/JX5+WSmM
         gqQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798304; x=1796403104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aa0L0rzRv3zdVjeEdi/EEptjLDB8GkAymEtLW7aVtuI=;
        b=H1FyZ2DnT4rI9RnGBJ4bYsczYh+E+vD//kv40+F2rtA5KBw6EqAYa2/dFAzZ8+Z95A
         Saagl5XiGr1RLwF7085f5l4cKimCsk1fTpEULFkls+uYPI1dkWpuiQySbDFS97d4R6+7
         sKB3PpBYdUkkxnGa4vVXOkX4e7ON5bG3aiQmu5qk/1tqoO0Kc08OG/sD8Y3Xpg+z6dnT
         /g7qMhe08Mp2XhlyKSVPjKsWEpNIbIPL5Umugm6SUXyUsIUEDbp14KHrbAr/ScuCpxqO
         osyMESK8BxYqX1DGVZIpQOF+X5jwYG6nCZgIDMNYimTPrC+uWsrWGpX2ccnDZfUZkPCQ
         K9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798304; x=1796403104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aa0L0rzRv3zdVjeEdi/EEptjLDB8GkAymEtLW7aVtuI=;
        b=NVXPYV8JyOmH0hn4iI1J28QJ63w6LrFhMOVKp0c4EqhhqLoLRIFWHrY7fiF/Oe8g7W
         5fts75aYoQO9aR8VscuekD50XM5kNGJ77pXAjJsqyeWRk+NvWFBPXwQ7tSv/fr9fqkJz
         ds8FMd/v5NdAK/29vG0SN/InUpTlYNuq56C41KgTAcVA/UnAORwb43nmdSoubVil+pCu
         ClFJXrR+VpZiXj9i8I6g5xNKGRInSt1Hd+4bGdPhcK6kibNg8f6APDiAqS/lNciv9MPW
         2Gph5VT5PX9SwfeyGCd05CVN+DDvRl2ZSMR/o/luMvn7LmjSr3Rhk3LMu3mhk1dFyBuA
         U8BQ==
X-Forwarded-Encrypted: i=1; AL+hErFke289UktLFdIX/DKc2YjR1MbLTZfwnHTacUoHS9uTs4B3O4oZElqo6t5S13K5EwSSiR7kElLyhPSY@vger.kernel.org
X-Gm-Message-State: APuU4Z/VUaDOOxUBdWzJTpumbPNgRRdNpxZW99hEiHaRDCdEXMLsU9qe
	5OITExirUFmdUGXuyFTlFbVAXrawgP87A06aAfE/+tYHovhGpIgVylj9Mg+DA9Tc7HPJ2D1v2D3
	a6wAV0uglmioISHayI0rA7lcBuH1zFPU=
X-Gm-Gg: AZFdTZcRPjy0cN1xiOZ3ejHI/L/tjbVq1v5Xvx1Kph4xrUNnv4aRdJo3xvlZ2tGfWFQ
	JaOtYhcKDj/expm2uRydNzZeuoXeK0StVdECjSH1awXac+d4uZiQjhmi22q9a8LsMqitJQ07l13
	Bi5JHbzmHfKOY9WZ9jEkkkmaADDAQf/T3YidrZ2aIwXC4bmZPBJ6kOP2ngrAWJc3wZ9v8QGJ0QV
	X+ynhneLjFWrwSOCv7RJahI2Kj2cbkQTmXwg6rH0xBYuqbm7sOKurMucJ1/U+mDKZHyVrLOrY3b
	+xe8pQ6m6WQ9YKwyAwMXtQtsYyMUTEVvNbKP6OSA4jcv4FkqoskFoY2cI6V5usuS9vEHPOZpjpH
	MsFQnmNHvSUOaoPxA152H5S99pD8cEO85hwJh+w==
X-Received: by 2002:a05:690e:1918:b0:67d:e4c3:d838 with SMTP id
 956f58d0204a3-67df440a008mr10149037d50.29.1795798303541; Fri, 27 Nov 2026
 08:51:43 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127163853.3563991-1-shubhrajyoti.datta@amd.com> <20261127163853.3563991-4-shubhrajyoti.datta@amd.com>
In-Reply-To: <20261127163853.3563991-4-shubhrajyoti.datta@amd.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Fri, 27 Nov 2026 22:21:30 +0530
X-Gm-Features: Aa3M54rdrqykXyYWgPPBnRRzHkK4a1Qikw9EvamXyi-05F4NfD3OsaKavo6O_cE
Message-ID: <CAKfKVtEZ0Qm-cyGHX_yQHebgrF0BMt_c-C8mj=c7eiUcurTOwA@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] EDAC/versalnet: Wait for RPMsg endpoint initialization
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, git@amd.com, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
	haydenrinn@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 10:09=E2=80=AFPM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:
>
> From: Hayden Rinn <haydenrinn@microsoft.com>
>
> The rpmsg endpoint can be used before rpmsg_probe() completes, and
> can race with asynchronous rpmsg_remove() teardown (e.g. R5 crash
> or shutdown), both leading to use of an uninitialized or freed
> endpoint.
>
> Add a completion so mc_probe() waits for the endpoint, and a
> "ready" flag so rpmsg_cb() drops events until mci/adec are
> set up. Add ept_lock to serialize priv->ept and priv->mcdi->ept
> across mcdi_request(), rpmsg_probe(), and rpmsg_remove(), clearing
> them on removal if the channel is down.
>
> Split setup_mcdi() so that only MCDI allocation and initialization are
> performed before RPMsg registration. Update the error paths to match
> the new initialization order, ensuring resources are released in
> reverse order of acquisition.
>
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR contr=
oller")
> Signed-off-by: Hayden Rinn <haydenrinn@microsoft.com>
> Co-developed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>
> Changes in v3:
> Update the kfree sequence
> Squash the "EDAC/versalnet: Wait for RPMsg endpoint initialization"
>
> Changes in v2:
> Patch addition for the rpmsg endpoint race
>
>  drivers/edac/versalnet_edac.c | 140 ++++++++++++++++++++++++++++------
>  1 file changed, 115 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.=
c
> index 8decaba19048..c43104a5d9f0 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -5,8 +5,10 @@
>   */
>
>  #include <linux/cdx/edac_cdx_pcol.h>
> +#include <linux/completion.h>
>  #include <linux/edac.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/of_device.h>
>  #include <linux/ras.h>
>  #include <linux/remoteproc.h>
> @@ -146,7 +148,15 @@ struct ecc_status {
>   * @adec:              Address decode registers.
>   * @mci:               Memory controller interface.
>   * @ept:               rpmsg endpoint.
> + * @ept_lock:          Protects @ept and @mcdi->ept against concurrent t=
eardown
> + *                     by rpmsg_remove() (e.g. remote processor crash/sh=
utdown)
> + *                     while mcdi_request() is sending on them.
> + * @rpmsg_ready:       Completion signaled once rpmsg_probe() has run to
> + *                     completion success. @ept is only valid to check
> + *                     once this is signaled.
>   * @mcdi:              The mcdi handle.
> + * @dev:               Platform device backing this driver instance.
> + * @ready:             Flag set once VersalNet edac is initialised.
>   */
>  struct mc_priv {
>         char message[256];
> @@ -159,7 +169,11 @@ struct mc_priv {
>         u32 adec[ADEC_MAX];
>         struct mem_ctl_info *mci[NUM_CONTROLLERS];
>         struct rpmsg_endpoint *ept;
> +       struct mutex ept_lock; /* Protects endpoint */
> +       struct completion rpmsg_ready;
>         struct cdx_mcdi *mcdi;
> +       struct device *dev;
> +       bool ready;
>  };
>
>  /*
> @@ -508,6 +522,12 @@ static void mc_init(struct mem_ctl_info *mci, struct=
 device *dev,
>
>  #define to_mci(k) container_of(k, struct mem_ctl_info, dev)
>
> +static struct rpmsg_device_id amd_rpmsg_id_table[] =3D {
> +       { .name =3D RPMSG_CHAN_NAME },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
> +
>  static unsigned int mcdi_rpc_timeout(struct cdx_mcdi *cdx, unsigned int =
cmd)
>  {
>         return MCDI_RPC_TIMEOUT;
> @@ -517,9 +537,27 @@ static void mcdi_request(struct cdx_mcdi *cdx,
>                          const struct cdx_dword *hdr, size_t hdr_len,
>                          const struct cdx_dword *sdu, size_t sdu_len)
>  {
> +       struct mc_priv *mc_priv =3D (struct mc_priv *)amd_rpmsg_id_table[=
0].driver_data;
>         void *send_buf;
>         int ret;
>
> +       guard(mutex)(&mc_priv->ept_lock);
> +
> +       /*
> +        * The rpmsg channel can be torn down asynchronously (e.g. the R5
> +        * remote processor crashing or being shut down) by rpmsg_remove(=
),
> +        * which clears both @cdx->ept and @mc_priv->ept under this same
> +        * lock. Bail out instead of sending on a destroyed endpoint.
> +        *
> +        * @cdx->rpdev is cleared by rpmsg_remove() together with @cdx->e=
pt,
> +        * so it cannot be used for logging here; use the stable platform
> +        * device instead.
> +        */
> +       if (!cdx->ept) {
> +               dev_err(mc_priv->dev, "Dropping rpmsg send, channel is do=
wn\n");
> +               return;
> +       }
> +
>         send_buf =3D kzalloc(hdr_len + sdu_len, GFP_KERNEL);
>         if (!send_buf)
>                 return;
> @@ -559,7 +597,7 @@ static void get_ddr_config(u32 index, u32 *buffer, st=
ruct cdx_mcdi *amd_mcdi)
>  static int setup_mcdi(struct mc_priv *mc_priv)
>  {
>         struct cdx_mcdi *amd_mcdi;
> -       int ret, i;
> +       int ret;
>
>         amd_mcdi =3D kzalloc(sizeof(*amd_mcdi), GFP_KERNEL);
>         if (!amd_mcdi)
> @@ -572,12 +610,8 @@ static int setup_mcdi(struct mc_priv *mc_priv)
>                 return ret;
>         }
>
> -       amd_mcdi->ept =3D mc_priv->ept;
>         mc_priv->mcdi =3D amd_mcdi;
>
> -       for (i =3D 0; i < NUM_CONTROLLERS; i++)
> -               get_ddr_config(i, &mc_priv->adec[ADEC_NUM * i], amd_mcdi)=
;
> -
>         return 0;
>  }
>
> @@ -601,6 +635,18 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void=
 *data,
>                 cdx_mcdi_process_cmd(mc_priv->mcdi, (struct cdx_dword *)d=
ata, len);
>                 return 0;
>         }
> +       /*
> +        * The rpmsg channel (and thus this callback) can become live
> +        * before init_versalnet() has allocated priv->mci[] and
> +        * populated priv->adec[]. Drop reports that race ahead
> +        * of it instead of calling handle_error() against incomplete
> +        * state.
> +        */
> +       if (!smp_load_acquire(&mc_priv->ready)) {
> +               dev_warn_ratelimited(&rpdev->dev,
> +                                    "Dropping event, driver not ready ye=
t\n");
> +               return 0;
> +       }
>
>         sec_sev =3D result[ERROR_LEVEL];
>         error_id =3D result[ERROR_ID];
> @@ -730,12 +776,6 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void=
 *data,
>         return 0;
>  }
>
> -static struct rpmsg_device_id amd_rpmsg_id_table[] =3D {
> -       { .name =3D RPMSG_CHAN_NAME },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
> -
>  static int rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>         struct rpmsg_channel_info chinfo =3D {
> @@ -743,25 +783,56 @@ static int rpmsg_probe(struct rpmsg_device *rpdev)
>                 .dst    =3D rpdev->dst,
>                 .name   =3D RPMSG_CHAN_NAME,
>         };
> +       struct rpmsg_endpoint *ept;
>         struct mc_priv *pg;
>
>         pg =3D (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
>
> -       pg->ept =3D rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
> -       if (!pg->ept)
> -               return dev_err_probe(&rpdev->dev, -ENXIO, "Failed to crea=
te ept for channel %s\n",
> -                                    chinfo.name);
> -
>         dev_set_drvdata(&rpdev->dev, pg);
>
> +       ept =3D rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
> +       if (!ept) {
> +               return dev_err_probe(&rpdev->dev, -ENXIO,
> +                                     "Failed to create ept for channel %=
s\n",
> +                                     chinfo.name);
> +       }
> +
> +       /*
> +        * Link the new endpoint in under the lock. This also re-syncs
> +        * mcdi->ept on reconnection after the remote processor recovers
> +        * from a crash/shutdown, which previously only happened once,
> +        * during the initial mc_probe().
> +        */
> +       scoped_guard(mutex, &pg->ept_lock) {
> +               pg->ept =3D ept;
> +               pg->mcdi->ept =3D ept;
> +               pg->mcdi->rpdev =3D rpdev;
> +       }
> +
> +       complete_all(&pg->rpmsg_ready);
> +
>         return 0;
>  }
>
>  static void rpmsg_remove(struct rpmsg_device *rpdev)
>  {
>         struct mc_priv *mc_priv =3D dev_get_drvdata(&rpdev->dev);
> +       struct rpmsg_endpoint *ept;
>
> -       rpmsg_destroy_ept(mc_priv->ept);
> +       /*
> +        * Clear the shared endpoint pointers before destroying the
> +        * endpoint, so that mcdi_request() (serialised on the same lock)
> +        * cannot observe or send on a stale/freed endpoint if the remote
> +        * processor goes down concurrently.
> +        */
> +       scoped_guard(mutex, &mc_priv->ept_lock) {
> +               ept =3D mc_priv->ept;
> +               mc_priv->ept =3D NULL;
> +               mc_priv->mcdi->ept =3D NULL;
> +               mc_priv->mcdi->rpdev =3D NULL;
> +       }
> +
> +       rpmsg_destroy_ept(ept);
>         dev_set_drvdata(&rpdev->dev, NULL);
>  }
>
> @@ -906,7 +977,7 @@ static int mc_probe(struct platform_device *pdev)
>         struct device_node *r5_core_node;
>         struct mc_priv *priv;
>         struct rproc *rp;
> -       int rc;
> +       int rc, i;
>
>         r5_core_node =3D of_parse_phandle(pdev->dev.of_node, "amd,rproc",=
 0);
>         if (!r5_core_node) {
> @@ -930,33 +1001,52 @@ static int mc_probe(struct platform_device *pdev)
>                 goto err_alloc;
>         }
>
> +       priv->dev =3D &pdev->dev;
> +       mutex_init(&priv->ept_lock);
> +       init_completion(&priv->rpmsg_ready);
>         amd_rpmsg_id_table[0].driver_data =3D (kernel_ulong_t)priv;
>
> +       rc =3D setup_mcdi(priv);
> +       if (rc)
> +               goto err_alloc;
> +
>         rc =3D register_rpmsg_driver(&amd_rpmsg_driver);
>         if (rc) {
>                 edac_printk(KERN_ERR, EDAC_MC, "Failed to register RPMsg =
driver: %d\n", rc);
> -               goto err_alloc;
> +               goto err_reg;
>         }
>
> -       rc =3D setup_mcdi(priv);
> -       if (rc)
> -               goto err_unreg;
> +       if (!wait_for_completion_timeout(&priv->rpmsg_ready, MCDI_RPC_TIM=
EOUT)) {
> +               dev_err(&pdev->dev, "Timed out waiting for RPMsg endpoint=
\n");
> +               rc =3D -ENODEV;
> +               goto err_init;
> +       }
>
>         priv->mcdi->r5_rproc =3D rp;
>
> +       for (i =3D 0; i < NUM_CONTROLLERS; i++)
> +               get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
> +
>         rc =3D init_versalnet(priv, pdev);
>         if (rc)
>                 goto err_init;
>
> +       /*
> +        * edac is initialised. Publish this with a release store so rpms=
g_cb
> +        * running concurrently on the rpmsg worker thread, only calls
> +        * handle_error() once it observes @ready via a matching acquire =
load.
> +        */
> +       smp_store_release(&priv->ready, true);
> +
>         return 0;
>
>  err_init:
> +       unregister_rpmsg_driver(&amd_rpmsg_driver);
> +
> +err_reg:
>         cdx_mcdi_finish(priv->mcdi);
>         kfree(priv->mcdi);
>
> -err_unreg:
> -       unregister_rpmsg_driver(&amd_rpmsg_driver);
> -
>  err_alloc:
>         rproc_shutdown(rp);
>
> --
> 2.34.1
>
+ Hayden
