Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC606C433FE
	for <linux-edac@archiver.kernel.org>; Thu, 10 Nov 2022 10:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbiKJKzl (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Thu, 10 Nov 2022 05:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbiKJKzk (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Thu, 10 Nov 2022 05:55:40 -0500
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD076A69F;
        Thu, 10 Nov 2022 02:55:39 -0800 (PST)
Received: from zn.tnic (p200300ea9733e7bc329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e7bc:329c:23ff:fea6:a903])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C17A51EC071E;
        Thu, 10 Nov 2022 11:55:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1668077737;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=lo/knD/NryTKKgBVaHAosVdrDkprBTdeYqpy5wL/8HI=;
        b=nis3F0Czgrh1Hr8HYwsMXKsfZwulIuKODDGalE3WVipf+4Y+EvuRfyd6zyK7ZgxIn8Tmce
        XTEhPV3bpWLS8X3TFw/H1NY4012czxyQxRdT14ZgLym1CyvuLxg4dHvQyCjjH02+lpXRFM
        FWzrxaSi2F/XkpezBk0U2YzKCpLkBc0=
Date:   Thu, 10 Nov 2022 11:55:37 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-edac@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org, tony.luck@intel.com,
        mchehab@kernel.org, michal.simek@xilinx.com, git@amd.com,
        robh+dt@kernel.org, james.morse@arm.com, rric@kernel.org
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: edac: Add bindings for
 Xilinx Versal EDAC for DDRMC
Message-ID: <Y2zYqetP6IhG01Bg@zn.tnic>
References: <20221107062413.9642-1-shubhrajyoti.datta@amd.com>
 <20221107062413.9642-2-shubhrajyoti.datta@amd.com>
 <166807145377.16822.15787804198836912482.b4-ty@linaro.org>
 <Y2zL3OXBNfR/VNPK@zn.tnic>
 <207ae5bd-dbc2-9c4b-2acc-bda480da711e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <207ae5bd-dbc2-9c4b-2acc-bda480da711e@linaro.org>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Thu, Nov 10, 2022 at 11:03:43AM +0100, Krzysztof Kozlowski wrote:
> Unless you mean some EDAC-tree Patchwork tests, what's in the next
> matters. Both patches will be in next, so no warnings.

Yeah, that is correct.

> If you take it, then all other patches touching these files in this
> cycle must go via your tree.

Do you expect that happening this cycle?

If so, then we can do them this way and I'll ignore those warnings.

> Sure, I'll provide feedback and drop the patches.

Right, in the past devicetree and driver patches for EDAC drivers have
gone together through my tree but if you anticipate conflicts then sure,
let's split them.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
