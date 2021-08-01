Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB186C4338F
	for <linux-edac@archiver.kernel.org>; Sun,  1 Aug 2021 08:19:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91EF361054
	for <linux-edac@archiver.kernel.org>; Sun,  1 Aug 2021 08:19:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhHAIUF (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Sun, 1 Aug 2021 04:20:05 -0400
Received: from mail.skyhub.de ([5.9.137.197]:59602 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229885AbhHAIUF (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Sun, 1 Aug 2021 04:20:05 -0400
Received: from nazgul.tnic (unknown [109.121.183.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9368E1EC0298;
        Sun,  1 Aug 2021 10:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1627805992;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=d0OLSPqVKgQFg7jRtyWZRmLKN9g40crpfr956IdpeB4=;
        b=YCAxe0mHHlS1aW03BT+GaJUrX15VVPAn9khHDqAfR3TbUBwviRfDf5LNqmbskWSwdt6b1I
        cnhwPdjJa06tQEg1fsdevDJ70tLz0edpjeNU0be3gORuCwfvsZ8cniFoWqj+XjuinS/0V/
        SA/Pdeyk7XFVCYCae6SXIHGDqmXb5bM=
Date:   Sun, 1 Aug 2021 10:20:07 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     nil Yi <teroincn@gmail.com>
Cc:     mchehab@kernel.org, tony.luck@intel.com, james.morse@arm.com,
        rric@kernel.org, linux-edac@vger.kernel.org
Subject: Re: [BUG] drivers: edac: edac_pci_sysfs.c: memory leak in
 edac_pci_create_instance_kobj
Message-ID: <YQZZN/7ak0e/fdFx@nazgul.tnic>
References: <CANTwqXCcxMyJq8e4FM5ERJVNbPA01wCve769s6LcdYnSOnsXMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANTwqXCcxMyJq8e4FM5ERJVNbPA01wCve769s6LcdYnSOnsXMA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Sun, Aug 01, 2021 at 02:27:08PM +0800, nil Yi wrote:
> Any feedback would be appreciated, thanks :)

Yes, I guess the couple of kobject_init_and_add() calls in EDAC-land
should be fixed similar to what

17ed808ad243 ("EDAC: Fix reference count leaks")

did.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
