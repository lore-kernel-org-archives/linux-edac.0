Return-Path: <SRS0=51Np=7Q=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1843AC433E0
	for <linux-edac@archiver.kernel.org>; Wed,  3 Jun 2020 17:36:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE0282053B
	for <linux-edac@archiver.kernel.org>; Wed,  3 Jun 2020 17:36:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="LmOt+qJ3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgFCRge (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 3 Jun 2020 13:36:34 -0400
Received: from mail.skyhub.de ([5.9.137.197]:43952 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgFCRge (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 3 Jun 2020 13:36:34 -0400
Received: from zn.tnic (p200300ec2f0b2300329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ec:2f0b:2300:329c:23ff:fea6:a903])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 16E061EC0391;
        Wed,  3 Jun 2020 19:36:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1591205793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=tKviuceYgB5i7KdqZJKv0H6EA3BOolgwHgL3oaSqHqE=;
        b=LmOt+qJ3jf5Q7/cHpaP/Hxdf5odpwi/P1Hi185I4SMt/hmnkoiDdrJaV69DLLmcVGCK+uu
        JlB0f8mOFUFfO3gofmzP9GmCPzVYf8i6He3kl0VscC/7YRAhRr3M7bcH4qk30xetFWWUlZ
        AFo/jPigG6xkpStmJH+GxuQONuHQXbE=
Date:   Wed, 3 Jun 2020 19:36:28 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Naoto YAMAGUCHI <wata2ki@gmail.com>
Cc:     linux-edac@vger.kernel.org,
        Naoto Yamaguchi <i33399_YAMAGUCHI@aisin-aw.co.jp>
Subject: Re: [PATCH] EDAC/mc: Fix memory alignment calculation formula
Message-ID: <20200603173628.GE19711@zn.tnic>
References: <20200516162115.16545-1-wata2ki@gmail.com>
 <20200603112816.GC19711@zn.tnic>
 <CABBJnRYZTsnOjNdd9x5ZS_Vb56yvEJWsLxEERYPj-m3HfAqx1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABBJnRYZTsnOjNdd9x5ZS_Vb56yvEJWsLxEERYPj-m3HfAqx1Q@mail.gmail.com>
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Wed, Jun 03, 2020 at 10:00:01PM +0900, Naoto YAMAGUCHI wrote:
> Out of tree driver (edac_injection) is under developing now by Gabriele
> Paoloni.  This driver will upstream future.

Ah ok. I thought someone is running an out-of-tree EDAC driver for no
good reason.

> When I was porting this driver to aarch64 environment, I found this bug.

I'll have a look after the merge window, thanks.

Btw, please do not top-post.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
