Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC2FC43381
	for <linux-edac@archiver.kernel.org>; Wed, 20 Jan 2021 15:39:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0A862336D
	for <linux-edac@archiver.kernel.org>; Wed, 20 Jan 2021 15:39:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731745AbhATPjT (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 20 Jan 2021 10:39:19 -0500
Received: from mail.skyhub.de ([5.9.137.197]:48036 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733099AbhATOvs (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 20 Jan 2021 09:51:48 -0500
Received: from zn.tnic (p200300ec2f0bb000326c050203dd63ff.dip0.t-ipconnect.de [IPv6:2003:ec:2f0b:b000:326c:502:3dd:63ff])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 18FB81EC0323;
        Wed, 20 Jan 2021 15:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1611154255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=njHdq4CWw79bFcLPgeuBg2fsC5f81lGof9afu6Csga8=;
        b=KL/r3nWbgivOTEP73Se90KlxqJFiaD2q7UVHIxVEc7rj/xK1eMJA8I+6geealH6SlS45Cs
        m/CLTc16mBOwRqZCuK2A+b52PmSqZe6puJC20sCsAX5ql8HY/YlpAQTInuxjhlr8oikvkK
        Gy8Zrjn9yGztBn3ZptpmRiAOGSuI1+Y=
Date:   Wed, 20 Jan 2021 15:50:48 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Yazen Ghannam <yazen.ghannam@amd.com>
Cc:     linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
        Smita.KoralahalliChannabasappa@amd.com, wgh@torlan.ru
Subject: Re: [PATCH] EDAC/AMD64: Update scrub register addresses for newer
 models
Message-ID: <20210120145048.GG825@zn.tnic>
References: <20210116143353.7576-1-Yazen.Ghannam@amd.com>
 <20210118193112.GF30090@zn.tnic>
 <20210120144111.GB1385775@yaz-nikka.amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210120144111.GB1385775@yaz-nikka.amd.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Wed, Jan 20, 2021 at 08:41:11AM -0600, Yazen Ghannam wrote:
> We have a struct amd64_umc per channel, so putting these fixed values
> there seemed redundant. Would you mind if we put this in struct
> amd64_family_type? We can then set the values per family/model group
> like we do with the max_mcs.

Sure, that's better.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
