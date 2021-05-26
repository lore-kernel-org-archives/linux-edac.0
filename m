Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9A0C47082
	for <linux-edac@archiver.kernel.org>; Wed, 26 May 2021 07:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B6A061408
	for <linux-edac@archiver.kernel.org>; Wed, 26 May 2021 07:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbhEZHZA (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 26 May 2021 03:25:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:36892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233006AbhEZHZA (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 26 May 2021 03:25:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 721B961028;
        Wed, 26 May 2021 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622013809;
        bh=hAke5aX2Bv0ytdef8igg4wq+olIwPhWX010oAv0Ue/M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NIyuS4a71tuytD8bAo89h3xgiUn8QqWSGBK8X93gXZj5B9Q5Q12YPANuYgbAGYJ5P
         xlfHO/QBKIZ66vipo+5u4mJWsoNhQ1gaqyYjtU3SzpIFOg6NWW7CRAfoJcM3o2zxk2
         DwLpsgu76mhKD1r4PZrWWTxQvagqDBYoCVE8lfA2uNihfGn0dkMuVrafkppuEWaTzF
         N5O3l7R6rnRDgISt8uj6NrRQHt87f/ZCGyteyl+NoEW2ZYR9af+z++sJycNQUGUnTt
         vOas1V2nOw0blsnh/qHsynDEz/Pzv5mA/Zb9I1ju6+xowxNKGiSLafrd1trABpCTOO
         WppJ81Z2VTBMQ==
Date:   Wed, 26 May 2021 09:23:22 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Shiju Jose <shiju.jose@huawei.com>
Cc:     <linux-edac@vger.kernel.org>, <linuxarm@huawei.com>,
        <tanxiaofei@huawei.com>
Subject: Re: [PATCH 1/1] rasdaemon: fix build error in
 register_ns_ev_decoder if the sqlite3 is not enabled
Message-ID: <20210526092322.5d588d57@coco.lan>
In-Reply-To: <20210309161856.352-1-shiju.jose@huawei.com>
References: <20210309161856.352-1-shiju.jose@huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Em Tue, 9 Mar 2021 16:18:56 +0000
Shiju Jose <shiju.jose@huawei.com> escreveu:

> ns_ev_decoder->stmt_dec_record = NULL; in the register_ns_ev_decoder()
> should be under #ifdef HAVE_SQLITE3 to fix the compilation error
> when build without the configure option --enable-sqlite3.
> 
> Signed-off-by: Shiju Jose <shiju.jose@huawei.com>

Applied, thanks!

> ---
>  ras-non-standard-handler.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/ras-non-standard-handler.c b/ras-non-standard-handler.c
> index 1862335..8d9802d 100644
> --- a/ras-non-standard-handler.c
> +++ b/ras-non-standard-handler.c
> @@ -74,7 +74,9 @@ int register_ns_ev_decoder(struct ras_ns_ev_decoder *ns_ev_decoder)
>  		return -1;
>  
>  	ns_ev_decoder->next = NULL;
> +#ifdef HAVE_SQLITE3
>  	ns_ev_decoder->stmt_dec_record = NULL;
> +#endif
>  	if (!ras_ns_ev_dec_list) {
>  		ras_ns_ev_dec_list = ns_ev_decoder;
>  	} else {



Thanks,
Mauro
