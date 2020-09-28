Return-Path: <SRS0=me7h=DF=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12435C2D0A8
	for <linux-edac@archiver.kernel.org>; Mon, 28 Sep 2020 09:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94CB6221E8
	for <linux-edac@archiver.kernel.org>; Mon, 28 Sep 2020 09:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="mtFzp7e0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgI1JsK (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 28 Sep 2020 05:48:10 -0400
Received: from mail.skyhub.de ([5.9.137.197]:36302 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726604AbgI1JsK (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 28 Sep 2020 05:48:10 -0400
Received: from zn.tnic (p200300ec2f0722001ca24be791720ae0.dip0.t-ipconnect.de [IPv6:2003:ec:2f07:2200:1ca2:4be7:9172:ae0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AC6A01EC00F4;
        Mon, 28 Sep 2020 11:48:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1601286488;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=aIj++6onj3JPqaqb7ILPTcpMolE4o1ap/7eIb8ljJkA=;
        b=mtFzp7e0peHZ1GMwZBzS2dQV4oa8OtMSIanDhkyjjES29cDSkkg56J0dbBU/kHdrIFj25t
        Kl93WLByEelprigN59gb3yF6hJ1l5nygunTRMWHJKg5eQcPoqgoUlksCzmjfbLEZqgKCC7
        0dsXBbxE9sQT87DRf9+kDgAPLojBvh0=
Date:   Mon, 28 Sep 2020 11:47:59 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Yazen Ghannam <yazen.ghannam@amd.com>
Cc:     linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
        tony.luck@intel.com, x86@kernel.org,
        Smita.KoralahalliChannabasappa@amd.com
Subject: Re: [PATCH v2 8/8] x86/MCE/AMD Support new memory interleaving modes
 during address translation
Message-ID: <20200928094759.GF1685@zn.tnic>
References: <20200903200144.310991-1-Yazen.Ghannam@amd.com>
 <20200903200144.310991-9-Yazen.Ghannam@amd.com>
 <20200923082039.GB28545@zn.tnic>
 <20200923162510.GB1684790@yaz-nikka.amd.com>
 <20200925072231.GC16872@zn.tnic>
 <20200925195127.GA323455@yaz-nikka.amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200925195127.GA323455@yaz-nikka.amd.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Fri, Sep 25, 2020 at 02:51:27PM -0500, Yazen Ghannam wrote:
> We can add support to get the physical address from firmware in some
> cases. But it looks to me that we'll still need to keep updating the
> translation code in the kernel to cover some platform/user
> configurations.

Unfortunately, that is correct. :-\

> The address translation needs to be done before the notfiers that need
> it, and EDAC comes after all of them. There's also the case where the
> EDAC interface isn't wanted, so amd64_edac will be unloaded.

I'd be interested as to why. Because decoding addresses is amd64_edac
*core* functionality. We can stick it in drivers/edac/mce_amd.c but I'd
like to hear what those valid reasons are, not to use the driver which
is supposed to do that anyway.

Thanks for explaining - it is all clear now.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
