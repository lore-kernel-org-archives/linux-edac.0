Return-Path: <SRS0=1wId=EB=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47500C4363A
	for <linux-edac@archiver.kernel.org>; Mon, 26 Oct 2020 18:10:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B28F720829
	for <linux-edac@archiver.kernel.org>; Mon, 26 Oct 2020 18:10:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="gnPPcJoH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783391AbgJZSKz (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:10:55 -0400
Received: from mail.skyhub.de ([5.9.137.197]:46982 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1783079AbgJZSKz (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 26 Oct 2020 14:10:55 -0400
Received: from zn.tnic (p200300ec2f07cc0024b0561f65548092.dip0.t-ipconnect.de [IPv6:2003:ec:2f07:cc00:24b0:561f:6554:8092])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F2D841EC0269;
        Mon, 26 Oct 2020 19:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1603735854;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=MrpTYkhMFnyRsetekU5rFpB3Oi6D2d6P62h7TZCpwKI=;
        b=gnPPcJoHSx4f+rKRsAl2pWOc722qGTspiblobyCpc8y7tVXrwtafVpVGCUMhQBlt2pNo2Q
        0f6/0be3rTu++NoIjASTYxr3Jn858t09UQj7P8g2m7hV9YB8vqR1LExeEgtrcVYMP2eNeN
        ez9P3fJ76FYAOFXqHOXfArviJKXha7M=
Date:   Mon, 26 Oct 2020 19:10:43 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Jason Baron <jbaron@akamai.com>
Cc:     Raymond Bennett <raymond.bennett@gmail.com>,
        linux-edac@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: Re: Constant output in syslog of EDAC message
Message-ID: <20201026181043.GF22116@zn.tnic>
References: <CAKpodDyWSY+Wt5Q04o5EyjZZU4PFST8U9UNcjwrJZ6C=Tc744g@mail.gmail.com>
 <20201019205658.GI24325@zn.tnic>
 <e0fda286-d8e3-dabb-6cf5-fcd974e048b5@akamai.com>
 <20201020091940.GA11583@zn.tnic>
 <3d0f6dfa-850c-a4e1-c9fa-4b4ca1983650@akamai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3d0f6dfa-850c-a4e1-c9fa-4b4ca1983650@akamai.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Hi,

On Mon, Oct 26, 2020 at 01:47:05PM -0400, Jason Baron wrote:
> So, we would still continue to support edac_debug_level=N but the
> user would have additional control.

Do you have any actual users needing this? If yes, what are their use
cases?

Because I have this aversion towards adding functionality just because
and that it potentially might be useful and "users may want". Either
they do and they want to use it for X or we don't do anything... yet.

In this particular example, those debug printks are just useless noise
so off they go.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
