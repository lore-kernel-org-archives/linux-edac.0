Return-Path: <SRS0=vSTz=XN=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA86C4CEC4
	for <linux-edac@archiver.kernel.org>; Wed, 18 Sep 2019 10:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72BEF21907
	for <linux-edac@archiver.kernel.org>; Wed, 18 Sep 2019 10:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568803247;
	bh=wj+scjosHFlqzeygd+MV7sEZgCwl0VdQ0TeyELiQjIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=u22+gUqwqgRRP0tAi5KPv1YqBr1kR6iScnuBrPECkCvtoK3Bx8hIXWRtb/Kpj8E4p
	 1DES0amkQhR87xMYCR42Kr8iv3r16b1LPGFFwu410E4qG4pkgV35/SY+cxx/Jh4x9a
	 fUmZQ71PR7Cy1Obaa4uMmnXcQH7deXjWvfhLAFAk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbfIRKkr (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 18 Sep 2019 06:40:47 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43952 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728633AbfIRKkq (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Wed, 18 Sep 2019 06:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Na0qbQhGCUkyCQJ2s6k53y9zgJoX2S+i0AbAu5cDD5M=; b=HVyGxGcsGkESYy51Vdzt9EQBL
        VzjzER71u1h5uxPhSkDP7cLa7cvf/BUhmqnum0jgURet7gimLT9+a1Vi/kC2BmbA9E9Olm1Dpdf8e
        dcv3zD47IFs1Nsip93IFCGUTx/4ONbQnY8upfQK5yNkRdeX2v2uB5UdnockwgTmLbM50amNwWbDmT
        ZZZTlBLzvkgllEZRePcdJ9gS8KhaPkbeLcARoe+/lz+0SDRs4ZG00vTgwcKrc+cGDe5azZ8Fuku+N
        Ki9b1sC0LfEU/qF+j6u0ziXvT2eH308RfcBpSZGFBLmAZpLI/TpYiI6/x2I4ZQODfd8oYOhJoLx89
        ARyogNQbw==;
Received: from 177.96.192.152.dynamic.adsl.gvt.net.br ([177.96.192.152] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iAXO8-0007Cr-B6; Wed, 18 Sep 2019 10:40:44 +0000
Date:   Wed, 18 Sep 2019 07:40:40 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tony Luck <tony.luck@intel.com>
Cc:     Borislav Petkov <bp@alien8.de>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
        Aristeu Rozanski <aris@redhat.com>, linux-edac@vger.kernel.org
Subject: Re: [PATCH 1/2] EDAC, skx_common: Refactor so that we initialize
 "dev" in result of adxl decode.
Message-ID: <20190918074040.3e76a2ac@coco.lan>
In-Reply-To: <20190913221344.13055-2-tony.luck@intel.com>
References: <20190913221344.13055-1-tony.luck@intel.com>
        <20190913221344.13055-2-tony.luck@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Em Fri, 13 Sep 2019 15:13:43 -0700
Tony Luck <tony.luck@intel.com> escreveu:

> Simplifies the code a little.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>

Patch itself looks good...

> ---
>  drivers/edac/skx_common.c | 48 +++++++++++++++++++--------------------
>  1 file changed, 23 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/edac/skx_common.c b/drivers/edac/skx_common.c
> index d8ff63d91b86..58b8348d0f71 100644
> --- a/drivers/edac/skx_common.c
> +++ b/drivers/edac/skx_common.c
> @@ -100,6 +100,7 @@ void __exit skx_adxl_put(void)
>  
>  static bool skx_adxl_decode(struct decoded_addr *res)
>  {
> +	struct skx_dev *d;
>  	int i, len = 0;
>  
>  	if (res->addr >= skx_tohm || (res->addr >= skx_tolm &&
> @@ -118,6 +119,24 @@ static bool skx_adxl_decode(struct decoded_addr *res)
>  	res->channel = (int)adxl_values[component_indices[INDEX_CHANNEL]];
>  	res->dimm    = (int)adxl_values[component_indices[INDEX_DIMM]];
>  
> +	if (res->imc > NUM_IMC - 1) {
> +		skx_printk(KERN_ERR, "Bad imc %d\n", res->imc);

I would report this via EDAC as well.

> +		return false;
> +	}
> +
> +	list_for_each_entry(d, &dev_edac_list, list) {
> +		if (d->imc[0].src_id == res->socket) {
> +			res->dev = d;
> +			break;
> +		}
> +	}
> +
> +	if (!res->dev) {
> +		skx_printk(KERN_ERR, "No device for src_id %d imc %d\n",
> +			   res->socket, res->imc);

I would report this via EDAC as well.

> +		return false;
> +	}
> +
>  	for (i = 0; i < adxl_component_count; i++) {
>  		if (adxl_values[i] == ~0x0ull)
>  			continue;
> @@ -452,24 +471,6 @@ static void skx_unregister_mci(struct skx_imc *imc)
>  	edac_mc_free(mci);
>  }
>  
> -static struct mem_ctl_info *get_mci(int src_id, int lmc)
> -{
> -	struct skx_dev *d;
> -
> -	if (lmc > NUM_IMC - 1) {
> -		skx_printk(KERN_ERR, "Bad lmc %d\n", lmc);
> -		return NULL;
> -	}
> -
> -	list_for_each_entry(d, &dev_edac_list, list) {
> -		if (d->imc[0].src_id == src_id)
> -			return d->imc[lmc].mci;
> -	}
> -
> -	skx_printk(KERN_ERR, "No mci for src_id %d lmc %d\n", src_id, lmc);
> -	return NULL;
> -}
> -
>  static void skx_mce_output_error(struct mem_ctl_info *mci,
>  				 const struct mce *m,
>  				 struct decoded_addr *res)
> @@ -583,15 +584,12 @@ int skx_mce_check_error(struct notifier_block *nb, unsigned long val,
>  	if (adxl_component_count) {
>  		if (!skx_adxl_decode(&res))
>  			return NOTIFY_DONE;
> -
> -		mci = get_mci(res.socket, res.imc);
> -	} else {
> -		if (!skx_decode || !skx_decode(&res))
> -			return NOTIFY_DONE;
> -
> -		mci = res.dev->imc[res.imc].mci;
> +	} else if (!skx_decode || !skx_decode(&res)) {
> +		return NOTIFY_DONE;
>  	}
>  
> +	mci = res.dev->imc[res.imc].mci;
> +
>  	if (!mci)
>  		return NOTIFY_DONE;
>  

Thanks,
Mauro
