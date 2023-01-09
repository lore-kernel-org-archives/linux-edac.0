Return-Path: <linux-edac-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD93CC54EBD
	for <linux-edac@archiver.kernel.org>; Mon,  9 Jan 2023 10:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236467AbjAIKNU (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 9 Jan 2023 05:13:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236514AbjAIKMt (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Mon, 9 Jan 2023 05:12:49 -0500
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B6D13D4D;
        Mon,  9 Jan 2023 02:11:08 -0800 (PST)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7B54A1EC0532;
        Mon,  9 Jan 2023 11:11:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1673259067;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=s3E9dpbJtVH4yEt7zzsizo9ZhgWRrl0Z4FFOZogFsGQ=;
        b=jCSwIarRYH0YWxO8139x/U/oNZxdg0R7f3zhQcU7d4Q7VoxAuTSz88tJZZeKWa93qp9LAe
        +/XNcLKvOLLjXemde+ebcLKd9+9nzaLc8zN5y4RxQjidPHMtLJB/1Avp0SgEvEcaQjDPBg
        ZGYstu9CV8LZoV+HOfBBK+LgTxa5pFM=
Date:   Mon, 9 Jan 2023 11:11:03 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
Subject: Re: [PATCH v7 2/2] EDAC/zynqmp: Add EDAC support for Xilinx ZynqMP
 OCM
Message-ID: <Y7voN1i0nwVPAiC2@zn.tnic>
References: <20230104084512.1855243-1-sai.krishna.potthuri@amd.com>
 <20230104084512.1855243-3-sai.krishna.potthuri@amd.com>
 <Y7r2I5Ij3x8/rMjS@zn.tnic>
 <BY5PR12MB42589C326796149216AA84D6DBFE9@BY5PR12MB4258.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BY5PR12MB42589C326796149216AA84D6DBFE9@BY5PR12MB4258.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Mon, Jan 09, 2023 at 06:09:02AM +0000, Potthuri, Sai Krishna wrote:
> As we are raising a warning message in intr_handler() if the flagged interrupt
> is not UE or CE and we return from there, so do we really need else if{} and
> WARN_ON_ONCE() in else{} here?

Yeah, ok, lemme remove it and queue the thing.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
