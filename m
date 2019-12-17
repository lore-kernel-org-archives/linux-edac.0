Return-Path: <SRS0=+j4o=2H=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD80C43603
	for <linux-edac@archiver.kernel.org>; Tue, 17 Dec 2019 07:34:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6036A2067C
	for <linux-edac@archiver.kernel.org>; Tue, 17 Dec 2019 07:34:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="USnZHVn5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfLQHek (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Tue, 17 Dec 2019 02:34:40 -0500
Received: from mail.skyhub.de ([5.9.137.197]:36192 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbfLQHek (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Tue, 17 Dec 2019 02:34:40 -0500
Received: from zn.tnic (p200300EC2F0BBF00D423EC4793E13B2B.dip0.t-ipconnect.de [IPv6:2003:ec:2f0b:bf00:d423:ec47:93e1:3b2b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7D28A1EC0C98;
        Tue, 17 Dec 2019 08:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1576568075;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=v4+boH768tQDXQSpjXCLcpjlqE135rEJHRTt6Kz0RtU=;
        b=USnZHVn5RAOwp4UmPkh+Ehy103AK/n/kLo4+h2K/VTJJgMFAgXePZNcqs0IQ3UyoTpPqfm
        qm0prdrhxqBeFDd8ykyjVEa9oqm3yFUsmx9FAKA3XtPbvT8pOeT5XeM8CROIcc4GL7zmM6
        HQLCYT5mBey0bfv16jwKFDfAM6SkjqY=
Date:   Tue, 17 Dec 2019 08:34:29 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Cc:     "Luck, Tony" <tony.luck@intel.com>,
        Jan =?utf-8?Q?H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH 0/6] x86/mce: Various fixes and cleanups for MCE handling
Message-ID: <20191217073414.GB28788@zn.tnic>
References: <20191210000733.17979-1-jschoenh@amazon.de>
 <20191211002519.GA30513@agluck-desk2.amr.corp.intel.com>
 <d8e11387-c84a-f333-7ea5-f9043af6375e@amazon.de>
 <20191216165207.GC17380@zn.tnic>
 <20191216215924.GA27474@agluck-desk2.amr.corp.intel.com>
 <SN6PR12MB26391C83526286B4127E40E8F8500@SN6PR12MB2639.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SN6PR12MB26391C83526286B4127E40E8F8500@SN6PR12MB2639.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Tue, Dec 17, 2019 at 01:19:30AM +0000, Ghannam, Yazen wrote:
> > Using Intel naming, I'd like the SRAO and UCNA severity uncorrected
> > errors to take the soft offline path to stop using pages.

Ok.

> For AMD, I'd like that no errors are handled in the SRAO notifier for now.
> 
> The DEFERRED severity could be used, but I'd like to do more testing beforehand.

If that notifier should be disabled on AMD, we should make it explicit
and not rely on a severify define. But sure, do some testing first
before you know what exactly needs to happen.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
