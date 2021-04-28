Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A68DC433ED
	for <linux-edac@archiver.kernel.org>; Wed, 28 Apr 2021 09:06:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29C1B613F3
	for <linux-edac@archiver.kernel.org>; Wed, 28 Apr 2021 09:06:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhD1JHB (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 28 Apr 2021 05:07:01 -0400
Received: from mail.skyhub.de ([5.9.137.197]:37910 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238129AbhD1JHB (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 28 Apr 2021 05:07:01 -0400
Received: from zn.tnic (p200300ec2f0c170087eb1a813f7fbf87.dip0.t-ipconnect.de [IPv6:2003:ec:2f0c:1700:87eb:1a81:3f7f:bf87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3DFC51EC0103;
        Wed, 28 Apr 2021 11:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1619600776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=nuT9JSrbTUPPPUlukc7T0LTdBOwVpQ/9QwlzCBGfWdY=;
        b=S69L72GOzWqEQwhDpepoQX+dd1yee1S0EowbchMBcAbKrHmxxS3xgnkN7HN0Dzg7Sn6WWH
        4/eUMzXtBcMGwX6Ij1V7v8oDpIdFWuBKz+x/2q0xaLCM5B2fOkXzem1lProPO2mso6ttqm
        tA6b21VtPwPXKdEtESuJvzsrefHM7mA=
Date:   Wed, 28 Apr 2021 11:06:13 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Kaige Fu <kaige.fu@linux.alibaba.com>
Cc:     linux-edac@vger.kernel.org,
        Shannon Zhao <shannon.zhao@linux.alibaba.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rrichter@marvell.com>
Subject: Re: [PATCH] EDAC/mce_amd: Print !SMCA processor warning for 0x19
 family
Message-ID: <YIklhWYQL9Cc+8wE@zn.tnic>
References: <93c212e8b182843d0a113cb05571416ba19bc355.1619576976.git.kaige.fu@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93c212e8b182843d0a113cb05571416ba19bc355.1619576976.git.kaige.fu@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Wed, Apr 28, 2021 at 11:15:06AM +0800, Kaige Fu wrote:
> KVM doesn't enable SMCA for 0x19 family AMD processors.
> Consequently, a warning as following will be print when load
> edac_mce_amd.ko in a virtual machine.
> 
> "Huh? What family is it: 0x19?!"
> 
> To make the log more clear, this patch prints !SMCA processor
> warning for 0x19 family.

This doesn't make it more clear - it replaces one incorrect statement
with another.

You can simply ignore it or not load that module in a guest at all.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
