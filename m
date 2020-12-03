Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A73C63777
	for <linux-edac@archiver.kernel.org>; Thu,  3 Dec 2020 07:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0B7A20BED
	for <linux-edac@archiver.kernel.org>; Thu,  3 Dec 2020 07:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgLCHVS (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Thu, 3 Dec 2020 02:21:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728294AbgLCHVS (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Thu, 3 Dec 2020 02:21:18 -0500
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF69FC061A4D;
        Wed,  2 Dec 2020 23:20:37 -0800 (PST)
Received: from zn.tnic (p200300ec2f0dc500db287c99eb312af4.dip0.t-ipconnect.de [IPv6:2003:ec:2f0d:c500:db28:7c99:eb31:2af4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8DC211EC04DD;
        Thu,  3 Dec 2020 08:20:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1606980035;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=I5tjK7vXmcH6KWOR2osK2BTeMN2+voSuUMYTgYKLvz0=;
        b=msXBd46puOaaytgd7Vpo+UMF4g38wyPtzFZ9umpdp8RwrpSg80sdCQz5CAXKGOw1n1kVik
        LG5rNZzvDonZnXLLw/sjDRO+LseOSwsI/ELsDEjxlPRJsHBVDdwEjSBwD821UhfhV1iHQd
        EdZI6USOuyOb7ZCuwemKgbVnmGPRTiY=
Date:   Thu, 3 Dec 2020 08:20:36 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Troy Lee <troy_lee@aspeedtech.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Tony Luck <tony.luck@intel.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        James Morse <james.morse@arm.com>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Robert Richter <rrichter@marvell.com>,
        "leetroy@gmail.com" <leetroy@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stefan M Schaeckeler <sschaeck@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:EDAC-CORE" <linux-edac@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] edac: Supporting AST2400 and AST2600 edac driver
Message-ID: <20201203072036.GB3059@zn.tnic>
References: <20201202063612.21241-1-troy_lee@aspeedtech.com>
 <20201202063612.21241-3-troy_lee@aspeedtech.com>
 <CACPK8XcBTm8-cAPmtswHbYAf2B+PdBiZ2s1XK1UqKA_NQX_-mw@mail.gmail.com>
 <PS1PR06MB26008E4BCB805553EDEC45038AF30@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <b6dd3a91-abe7-4e9d-b801-6e54e4c88827@www.fastmail.com>
 <20201202182349.GJ2951@zn.tnic>
 <PS1PR06MB2600D6A1E73D89EA0D0D59DC8AF20@PS1PR06MB2600.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PS1PR06MB2600D6A1E73D89EA0D0D59DC8AF20@PS1PR06MB2600.apcprd06.prod.outlook.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Thu, Dec 03, 2020 at 01:27:27AM +0000, Troy Lee wrote:
> Hi Broislav and Andrew,
> 
> I removed these exported function and submitted v3 PATCH.

I saw that. A couple of comments:

First of all, please do not top-post on a public mailing list.

Secondly, Joel gave you Reviewed-by: and Acked-by: for your patches 1
and 2 which are not in your new submission. But they should be, please
have a look at Documentation/process/ while you're waiting for his
review of your v3.

You don't have to resend now with those added and I can add them if Joel
is fine with patch 3 but pls remember to pick up tags reviewers have
given you, in the future.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
