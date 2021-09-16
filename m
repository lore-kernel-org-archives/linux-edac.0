Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F16C433F5
	for <linux-edac@archiver.kernel.org>; Thu, 16 Sep 2021 08:43:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D76136120E
	for <linux-edac@archiver.kernel.org>; Thu, 16 Sep 2021 08:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhIPIo5 (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Thu, 16 Sep 2021 04:44:57 -0400
Received: from mail.skyhub.de ([5.9.137.197]:41852 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233815AbhIPIo5 (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Thu, 16 Sep 2021 04:44:57 -0400
Received: from zn.tnic (p200300ec2f11c60068b45be7854516a5.dip0.t-ipconnect.de [IPv6:2003:ec:2f11:c600:68b4:5be7:8545:16a5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CF6481EC0324;
        Thu, 16 Sep 2021 10:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1631781812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=pbJrNn3G8T37WbYYzIQhtTxWzZYK3irQAo2I6Eu07Rw=;
        b=Rdb9RCSymNlJMgQSJcajaheHh75nMmGQQTSz3d/JDvRC3xtKN6Yr8UBy0Z+mqMgp3MM/mN
        OG6DwT0rOvLlODc3MPbGI8prP6MS77adxa3oOKtYq1tOW3HLtSg4/PC+oL78ls66AbOvg5
        uuK8T5ZiDLgWlogShXiOLm3nx7ZsqZk=
Date:   Thu, 16 Sep 2021 10:43:24 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-edac@vger.kernel.org, mchehab@kernel.org,
        michal.simek@xilinx.com, git@xilinx.com,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Subject: Re: [PATCH 1/2] edac: synopsys: Fix the wrong value assignment for
 edac_mode
Message-ID: <YUMDrBHGpqOkWMh/@zn.tnic>
References: <20210818072315.15149-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210818072315.15149-1-shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Wed, Aug 18, 2021 at 12:53:14PM +0530, Shubhrajyoti Datta wrote:
> From: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> 
> This patch corrected the edac_mode value by using enum instead of bitmask.

I've fixed it up now but for the future, please avoid having "This
patch" or "This commit" in the commit message. It is tautologically
useless.

Also, do

$ git grep 'This patch' Documentation/process

for more details.

> Addresses-coverity: enumerated type mixed with another type.
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  drivers/edac/synopsys_edac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
> index 7e7146b22c16..7d08627e738b 100644
> --- a/drivers/edac/synopsys_edac.c
> +++ b/drivers/edac/synopsys_edac.c
> @@ -782,7 +782,7 @@ static void init_csrows(struct mem_ctl_info *mci)
>  
>  		for (j = 0; j < csi->nr_channels; j++) {
>  			dimm		= csi->channels[j]->dimm;
> -			dimm->edac_mode	= EDAC_FLAG_SECDED;
> +			dimm->edac_mode	= EDAC_SECDED;
>  			dimm->mtype	= p_data->get_mtype(priv->baseaddr);
>  			dimm->nr_pages	= (size >> PAGE_SHIFT) / csi->nr_channels;
>  			dimm->grain	= SYNPS_EDAC_ERR_GRAIN;
> -- 

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
