Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4750C4361B
	for <linux-edac@archiver.kernel.org>; Wed, 16 Dec 2020 17:16:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94752230FA
	for <linux-edac@archiver.kernel.org>; Wed, 16 Dec 2020 17:16:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgLPRQ2 (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 16 Dec 2020 12:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbgLPRQ1 (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Wed, 16 Dec 2020 12:16:27 -0500
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B9CC061794
        for <linux-edac@vger.kernel.org>; Wed, 16 Dec 2020 09:15:47 -0800 (PST)
Received: from zn.tnic (p200300ec2f10c100782932abc779af15.dip0.t-ipconnect.de [IPv6:2003:ec:2f10:c100:7829:32ab:c779:af15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 84E011EC055A;
        Wed, 16 Dec 2020 18:15:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1608138944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=TG0t+UI6SQqZSYeyB44s3FWTvQkEt0JDCiwBMMLrMpU=;
        b=STzPd0970GGtQoSJ7P76jQ3poGcEeGFWa3h5blYaTEENNAK1nh/wSLgwfT4vYtQkO90F9S
        3RfZDQ+VVarq2nEv60tProHfMX8uNEDgTzNLB1Djz4Btz5MFLla1rscPIkAXW17/cXBSCd
        4kRxszqdGh0jLTfJ5EupLVx7/36GrOU=
Date:   Wed, 16 Dec 2020 18:15:45 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Michael Di Domenico <mdidomenico4@gmail.com>
Cc:     linux-edac@vger.kernel.org
Subject: Re: dimm mapping
Message-ID: <20201216171545.GC6312@zn.tnic>
References: <CABOsP2O+42Kcf7F5mkzkSizTKGSG48giwkgiv3gN=KZZ+Ad+4g@mail.gmail.com>
 <20201216163427.GA6312@zn.tnic>
 <CABOsP2POd8UhS5Acfg9Ht8NSpULBFbDX+_iK6BGm3ZNGLdRsaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABOsP2POd8UhS5Acfg9Ht8NSpULBFbDX+_iK6BGm3ZNGLdRsaw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Wed, Dec 16, 2020 at 12:05:25PM -0500, Michael Di Domenico wrote:
> the problem i'm trying to solve is that when i run edac-util -v i
> don't get the dimm labels.  so when MCE trips it's chore to figure out
> which dimm it actually is when looking at the motherboard.  given that
> dmidecode seems to report the dimm labels, it seems odd that edac
> doesn't use them.  but then again i understand how all that's tied
> together (if at all).

Yeah, the short version is, there's no properly defined way for software
to read out DIMM silkscreen labels on each platform. I highly doubt that
is even possible. Perhaps some SMBUS interfaces or whatnot but firmware
is notoriosly buggy so there's no reliability there.

And, as said before, in some cases one cannot map back the physical
address reported with a DIMM MCE to the actual DIMM.

And, in recent times, OEM vendors do more and more RAS in the firmware
so the kernel doesn't get to even see some errors.

I'm always hoping that I'll be corrected some day but until then that's
the current situation, roughly.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
