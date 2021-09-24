Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E24C433EF
	for <linux-edac@archiver.kernel.org>; Fri, 24 Sep 2021 08:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 412D7610F7
	for <linux-edac@archiver.kernel.org>; Fri, 24 Sep 2021 08:26:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244714AbhIXI1t (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 24 Sep 2021 04:27:49 -0400
Received: from mail.skyhub.de ([5.9.137.197]:52462 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244708AbhIXI1s (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Fri, 24 Sep 2021 04:27:48 -0400
Received: from zn.tnic (p200300ec2f0dd600c2485b7778a62ff5.dip0.t-ipconnect.de [IPv6:2003:ec:2f0d:d600:c248:5b77:78a6:2ff5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CAE201EC0419;
        Fri, 24 Sep 2021 10:26:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1632471970;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=g/1DsUfNrsaU19xQFtLQJwlQ4Uaxt39oFO0ESRLhfiU=;
        b=hmRf+Exp2Zacicxpd2yCqIJGcjPE7uKThAFdVvRM151B/U9vehxWmX/Rp0Z7ZHiO4iTaai
        9Njn4QufrRtSjXqAKSDHC1aVBA+JGxEzY/jNnpygLITJCn7j75K/QokKRU8v9SMyJ+ISou
        zOxi0bAwCgIw4C00b0LJje5AFd7EY3Q=
Date:   Fri, 24 Sep 2021 10:26:03 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
Cc:     x86@kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
        "H . Peter Anvin" <hpa@zytor.com>, yazen.ghannam@amd.com
Subject: Re: [PATCH 1/5] x86/mce/inject: Check if a bank is unpopulated
 before error simulation
Message-ID: <YU2Lm+11Pqg/RBK3@zn.tnic>
References: <20210915232739.6367-1-Smita.KoralahalliChannabasappa@amd.com>
 <20210915232739.6367-2-Smita.KoralahalliChannabasappa@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915232739.6367-2-Smita.KoralahalliChannabasappa@amd.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Wed, Sep 15, 2021 at 06:27:35PM -0500, Smita Koralahalli wrote:
> The MCA_IPID register uniquely identifies a bank's type on Scalable MCA
> (SMCA) systems. When an MCA bank is not populated, the MCA_IPID register
> will read as zero and writes to it will be ignored. Check the value of
> this register before trying to simulate the error.
> 
> Signed-off-by: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
> ---
>  arch/x86/kernel/cpu/mce/inject.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
> index 0bfc14041bbb..51ac575c4605 100644
> --- a/arch/x86/kernel/cpu/mce/inject.c
> +++ b/arch/x86/kernel/cpu/mce/inject.c
> @@ -577,6 +577,24 @@ static int inj_bank_set(void *data, u64 val)
>  	}
>  
>  	m->bank = val;
> +
> +	/* Read IPID value to determine if a bank is unpopulated on the target
> +	 * CPU.
> +	 */

Kernel comments style format is:

	/*
	 * A sentence ending with a full-stop.
	 * Another sentence. ...
	 * More sentences. ...
	 */

> +	if (boot_cpu_has(X86_FEATURE_SMCA)) {

This whole thing belongs into inj_ipid_set() where you should verify
whether the bank is set when you try to set the IPID for that bank.

> +
> +		/* Check for user provided IPID value. */
> +		if (!m->ipid) {
> +			rdmsrl_on_cpu(m->extcpu, MSR_AMD64_SMCA_MCx_IPID(val),
> +				      &m->ipid);

Oh well, one IPI per ipid write. We're doing injection so we can't be on
a production machine so who cares about IPIs there.

> +			if (!m->ipid) {
> +				pr_err("Error simulation not possible: Bank %llu unpopulated\n",


"Cannot set IPID for bank... - bank %d unpopulated\n"

Also, in all your text, use "injection" instead of "simulation" so that
there's no confusion.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
