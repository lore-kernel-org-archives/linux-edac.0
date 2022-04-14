Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F6EC433EF
	for <linux-edac@archiver.kernel.org>; Thu, 14 Apr 2022 08:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240446AbiDNITh (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Thu, 14 Apr 2022 04:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233330AbiDNITf (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Thu, 14 Apr 2022 04:19:35 -0400
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2E05D5DC
        for <linux-edac@vger.kernel.org>; Thu, 14 Apr 2022 01:17:11 -0700 (PDT)
Received: from zn.tnic (p2e55d808.dip0.t-ipconnect.de [46.85.216.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5BF591EC051E;
        Thu, 14 Apr 2022 10:17:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1649924226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=8rj6f9QRVv1AbraNCkkkY68TgOkAPomOg9cgBi38Zs4=;
        b=hGAIdbZ3yse8f+KTGwWft+WNksC41KX8objcRQ9lTVUtUy1RO61gQm/c6otwbir8YbdBGh
        YaC5hD1hcSKC2TrjP4dyhSxQF+yj6SWL5KwxQXLCd3McjFJfdaKeyNx2u1hfdRTouMUVMZ
        wDFJW3JHHSU3yQO7m/gyc5aj+REDKdg=
Date:   Thu, 14 Apr 2022 10:17:05 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        michal.simek@xilinx.com
Cc:     linux-edac@vger.kernel.org, rric@kernel.org, mchehab@kernel.org,
        tony.luck@intel.com, git@xilinx.com
Subject: Re: [PATCH v2] edac: synopsys: Fix the issue in reporting of the
 error count
Message-ID: <YlfYgc5xRV7Pc8Uu@zn.tnic>
References: <20220318101900.28872-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220318101900.28872-1-shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Fri, Mar 18, 2022 at 03:49:00PM +0530, Shubhrajyoti Datta wrote:
> Currently the error count from status register is being read which
> is not correct. Fix the issue by reading the count from the
> error count register(ERRCNT).
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

I'm guessing

Fixes: b500b4a029d5 ("EDAC, synopsys: Add ECC support for ZynqMP DDR controller")

and also

Cc: <stable@vger.kernel.org>

?

Also, that driver has a maintainer:

$ ./scripts/get_maintainer.pl -f drivers/edac/synopsys_edac.c
Michal Simek <michal.simek@xilinx.com> (supporter:ARM/ZYNQ ARCHITECTURE)

Is he going to ACK this or so?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
