Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D188C433F5
	for <linux-edac@archiver.kernel.org>; Mon, 20 Sep 2021 09:14:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7158F60F26
	for <linux-edac@archiver.kernel.org>; Mon, 20 Sep 2021 09:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236638AbhITJPt (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 20 Sep 2021 05:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237849AbhITJO6 (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Mon, 20 Sep 2021 05:14:58 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFB7C061762;
        Mon, 20 Sep 2021 02:13:30 -0700 (PDT)
Received: from zn.tnic (p200300ec2f0a2a0063d0dab944a9c04a.dip0.t-ipconnect.de [IPv6:2003:ec:2f0a:2a00:63d0:dab9:44a9:c04a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8B5851EC0287;
        Mon, 20 Sep 2021 11:13:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1632129204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=EGdAYo6PmGzOG3S3VHYHdaTr9P0x/MCHzdVr11T6X1E=;
        b=RIliok1kz46bLFP/2eNOghmQy3uaHh3RvxcMW9D3jx1bBCRGqH2iLJzmkcTAnFPSUy+pNa
        qnlSHxpbggTa29pj8iTMS5dQ4iknhL57wFaiyDnsmDehzX04m3szuWewpUfkeEcRa5yhBP
        kayhbK9GYLmadfWWhuGmPLRyn3lrqzg=
Date:   Mon, 20 Sep 2021 11:13:20 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Tony Luck <tony.luck@intel.com>
Cc:     Jue Wang <juew@google.com>, Ding Hui <dinghui@sangfor.com.cn>,
        naoya.horiguchi@nec.com, osalvador@suse.de,
        Youquan Song <youquan.song@intel.com>, huangcun@sangfor.com.cn,
        x86@kernel.org, linux-edac@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] x86/mce: Drop copyin special case for #MC
Message-ID: <YUhQsOKLeY/QV6ag@zn.tnic>
References: <20210706190620.1290391-1-tony.luck@intel.com>
 <20210818002942.1607544-1-tony.luck@intel.com>
 <20210818002942.1607544-4-tony.luck@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210818002942.1607544-4-tony.luck@intel.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Tue, Aug 17, 2021 at 05:29:42PM -0700, Tony Luck wrote:
> Fixes to the iterator code to handle faults

Can we name some of those fixes here pls?

We will forget which those were in the future so it would be good to
leave some breadcrumbs at least...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
