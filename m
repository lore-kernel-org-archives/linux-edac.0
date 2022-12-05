Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D71C47089
	for <linux-edac@archiver.kernel.org>; Mon,  5 Dec 2022 15:20:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbiLEPT6 (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 5 Dec 2022 10:19:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231880AbiLEPTO (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Mon, 5 Dec 2022 10:19:14 -0500
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E9B11478;
        Mon,  5 Dec 2022 07:19:12 -0800 (PST)
Received: from zn.tnic (p200300ea9733e72f329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e72f:329c:23ff:fea6:a903])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E7D2A1EC06C0;
        Mon,  5 Dec 2022 16:19:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1670253551;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=95iNo7XBx2EAevSVm0yU9Tlm8vGSIeCCvja2S35CbLg=;
        b=bJSC/MbUhkSfB9Og+S6sT+bDA6QHOtBaOVX3qw8u4DVMC5N4/TD2KakiVsmY6Yd7G7AO5Q
        mmy7pxdJyjAOmie44EfjediHSIGRB16aKLHjIaoRENQfxTLLzktW5bZFw6kIwhTwMx52GM
        qYpU77dZ203z5d/2EQN2wZLSaNWXsCs=
Date:   Mon, 5 Dec 2022 16:19:06 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Michal Simek <michal.simek@amd.com>
Cc:     "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>,
        "git (AMD-Xilinx)" <git@amd.com>,
        "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 2/2] EDAC/zynqmp: Add EDAC support for Xilinx ZynqMP
 OCM
Message-ID: <Y44L6lOptqDIwvxe@zn.tnic>
References: <20221102070655.247511-1-sai.krishna.potthuri@amd.com>
 <20221102070655.247511-3-sai.krishna.potthuri@amd.com>
 <Y4DbXaan258cZK+q@zn.tnic>
 <BY5PR12MB42582EA4A4ACEA56367544E6DB189@BY5PR12MB4258.namprd12.prod.outlook.com>
 <Y43vJECWJI99tc1x@zn.tnic>
 <330f1b49-eb59-c55e-3f7d-dfbf4886f247@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <330f1b49-eb59-c55e-3f7d-dfbf4886f247@amd.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Mon, Dec 05, 2022 at 03:49:33PM +0100, Michal Simek wrote:
> Some history around this. Based on
> https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf
> Chapter 2.2.2 Generic Names Recommendation
> memory-controller name is recommended.

Sure, fair enough. Except that this is debugfs so not really user ABI
like sysfs.

Rather, I'd aim here for simplicity. But your call in the end.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
