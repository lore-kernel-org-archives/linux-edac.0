Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87012C433ED
	for <linux-edac@archiver.kernel.org>; Wed,  5 May 2021 22:16:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68FC5613D6
	for <linux-edac@archiver.kernel.org>; Wed,  5 May 2021 22:16:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhEEWRJ (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 5 May 2021 18:17:09 -0400
Received: from linux.microsoft.com ([13.77.154.182]:47770 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233801AbhEEWRI (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Wed, 5 May 2021 18:17:08 -0400
Received: from sequoia (162-237-133-238.lightspeed.rcsntx.sbcglobal.net [162.237.133.238])
        by linux.microsoft.com (Postfix) with ESMTPSA id 635C820B7178;
        Wed,  5 May 2021 15:16:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 635C820B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1620252971;
        bh=Tjnwu6YSgal39bBH9tx2ZrM65+fvut/cJh8GgA4d4mE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C0bTeDXLds3BjjPh+Fv1G+xJofNC+SBACWS3v9tYYDtEEFWJv1e896xgrJRufBitE
         AOyFqz8gFeuMRNdp3gUwOOKwFopDg/A8Ab1hMoAO6J3rz0Fru39Y82P0v6VTHqexti
         Zjy9JyDw3OE89wU6WCCTkkQaFufgaoS/etx8fN4A=
Date:   Wed, 5 May 2021 17:16:05 -0500
From:   Tyler Hicks <tyhicks@linux.microsoft.com>
To:     Borislav Petkov <bp@alien8.de>
Cc:     wangglei <wangglei@gmail.com>,
        "Lei Wang (DPLAT)" <Wang.Lei@microsoft.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "tony.luck@intel.com" <tony.luck@intel.com>,
        "james.morse@arm.com" <james.morse@arm.com>,
        "rric@kernel.org" <rric@kernel.org>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hang Li <hangl@microsoft.com>,
        Brandon Waller <bwaller@microsoft.com>
Subject: Re: [EXTERNAL] Re: [PATCH] EDAC: update edac printk wrappers to use
 printk_ratelimited.
Message-ID: <20210505221605.GF4967@sequoia>
References: <20210505173027.78428-1-wangglei@gmail.com>
 <YJLdZCcsgWG6TrKz@zn.tnic>
 <SJ0PR21MB199984A8B47FBEECEC5D11CE90599@SJ0PR21MB1999.namprd21.prod.outlook.com>
 <YJL1vU6HNBWPKy8g@zn.tnic>
 <20210505202357.GC4967@sequoia>
 <YJMIbB31oEDaXm0C@zn.tnic>
 <20210505214846.GE4967@sequoia>
 <YJMWBBBlQ6TwFad9@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJMWBBBlQ6TwFad9@zn.tnic>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On 2021-05-06 00:02:44, Borislav Petkov wrote:
> On Wed, May 05, 2021 at 04:48:46PM -0500, Tyler Hicks wrote:
> > The thought was that the full stream of log messages isn't necessary to
> > notice that there's a problem when they are being emitted at such a high
> > rate (500 per second). They're just filling up disk space and/or wasting
> > networking bandwidth at that point.
> 
> I already asked about this but lemme point it out again: have you guys
> looked at drivers/ras/cec.c ?

We'll have a closer look. Thanks for the pointer!

Tyler

> 
> With that there won't be *any* error reports in dmesg and it will even
> poison and offline pages which generate excessive errors so that ...
> 
> > Of course, the best course of action here is to service the machine
> > but there's still a period of time between the CE errors popping up
> > and the machine being serviced.
> 
> ... you'll have ample time to service the machine.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
> 
