Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30248C6379D
	for <linux-edac@archiver.kernel.org>; Mon, 23 Nov 2020 14:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9410E20773
	for <linux-edac@archiver.kernel.org>; Mon, 23 Nov 2020 14:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="mbhk9BJJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbgKWOfn (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 23 Nov 2020 09:35:43 -0500
Received: from mail.skyhub.de ([5.9.137.197]:49314 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727724AbgKWOfn (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 23 Nov 2020 09:35:43 -0500
Received: from zn.tnic (p200300ec2f0bbc0057986d054fc332b4.dip0.t-ipconnect.de [IPv6:2003:ec:2f0b:bc00:5798:6d05:4fc3:32b4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2A4C51EC0489;
        Mon, 23 Nov 2020 15:35:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1606142142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=huj5cfXXldhaF6LovP0ePoq8jOxCAPb1KbkjUzYGFN0=;
        b=mbhk9BJJH8XGtP6WwJstSkXfMKqhdksY5+41tvNYF121kjWmVWGpNrq2uWZupW2ptM53QY
        2csanNrnNGfJi+L3YVaKHSY9JzwbAyHIIbmEB1LKbzoMuL171LG4YgtZ1WMcQI/tDB4P6j
        A4UMxLcdrrGm5LInBFejH+8jVl51E0w=
Date:   Mon, 23 Nov 2020 15:35:42 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
Cc:     "Luck, Tony" <tony.luck@intel.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
Subject: Re: [PATCH 1/4] x86/mce: do not overwrite no_way_out if mce_end()
 fails
Message-ID: <20201123143542.GD15044@zn.tnic>
References: <20201118151552.1412-1-gabriele.paoloni@intel.com>
 <20201118151552.1412-2-gabriele.paoloni@intel.com>
 <20201120170737.GD712@zn.tnic>
 <MN2PR11MB4158BE8B738CF6F6BF9B850D88FF0@MN2PR11MB4158.namprd11.prod.outlook.com>
 <20201120173342.GF712@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201120173342.GF712@zn.tnic>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Fri, Nov 20, 2020 at 06:33:42PM +0100, Borislav Petkov wrote:
> Sure, lemme go through the rest first.

Done, thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
