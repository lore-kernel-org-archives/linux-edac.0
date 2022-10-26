Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889A3C433FE
	for <linux-edac@archiver.kernel.org>; Wed, 26 Oct 2022 12:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbiJZMiY (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 26 Oct 2022 08:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbiJZMiY (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Wed, 26 Oct 2022 08:38:24 -0400
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874C9E77BA;
        Wed, 26 Oct 2022 05:38:23 -0700 (PDT)
Received: from zn.tnic (p200300ea9733e7b8329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e7b8:329c:23ff:fea6:a903])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2F30D1EC032C;
        Wed, 26 Oct 2022 14:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1666787902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=BtYmqcK/SwOYOEYDhCGjtxRMVVKq17QV489dr1/AD1M=;
        b=lEwKBM09qULzmxQO2ikbgRg6mJ3EW+0X+KTzylFl9gQtwqNOnN/yMGy78QI1TRyP00RAel
        BMKbfOYAfuT86yO+qyTY3oDq+cuXF69gqIg2B04owPENSD6n1jPXTsd1lcQgIbrPLdhmPN
        NX67SR7dha7rQ/vroVkuI1ADWpUcUfg=
Date:   Wed, 26 Oct 2022 14:38:18 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     bjorn.andersson@linaro.org, mchehab@kernel.org,
        james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tsoni@quicinc.com
Subject: Re: [PATCH v2 3/3] MAINTAINERS: Add myself as the maintainer for
 qcom_edac driver
Message-ID: <Y1kqOqhQeGkfoQnp@zn.tnic>
References: <20220812060602.7672-1-manivannan.sadhasivam@linaro.org>
 <20220812060602.7672-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220812060602.7672-4-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Fri, Aug 12, 2022 at 11:36:02AM +0530, Manivannan Sadhasivam wrote:
> The current maintainers have left Qualcomm and their email addresses were
> bouncing. Since I couldn't get hold of them now, I'm volunteering myself
> to maintain this driver.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
