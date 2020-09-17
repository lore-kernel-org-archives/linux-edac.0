Return-Path: <SRS0=dVFg=C2=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC51C433E2
	for <linux-edac@archiver.kernel.org>; Thu, 17 Sep 2020 10:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1957208DB
	for <linux-edac@archiver.kernel.org>; Thu, 17 Sep 2020 10:37:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="Rnwi1r+w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgIQKht (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:37:49 -0400
Received: from mail.skyhub.de ([5.9.137.197]:35386 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgIQKhp (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Thu, 17 Sep 2020 06:37:45 -0400
X-Greylist: delayed 7002 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 06:37:35 EDT
Received: from zn.tnic (p200300ec2f1053000730ae91ea344e59.dip0.t-ipconnect.de [IPv6:2003:ec:2f10:5300:730:ae91:ea34:4e59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5D0651EC027B;
        Thu, 17 Sep 2020 12:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1600339047;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=giB45ale7a27o6cvoqhhZzCNQwbxgQJ9++MCfiKpbI0=;
        b=Rnwi1r+wrSTxVoowS9WlyaAiUz+Zz7Ljp/osqVnyPqZZaSzYclgG+PyJmk7UVKLtWBG18n
        KuREpCutJG8S1B44iUCQLkxuO88K9/zqqFUBBq8EnyDBV0eC7b04Bf24iwTGxQveejTWjk
        mn2e6suBhLasfO3QM2w3ZYCv13X38Qc=
Date:   Thu, 17 Sep 2020 12:37:20 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Yazen Ghannam <yazen.ghannam@amd.com>
Cc:     linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
        tony.luck@intel.com, x86@kernel.org,
        Smita.KoralahalliChannabasappa@amd.com
Subject: Re: [PATCH v2 1/8] x86/CPU/AMD: Save NodeId on AMD-based systems
Message-ID: <20200917103720.GG31960@zn.tnic>
References: <20200903200144.310991-1-Yazen.Ghannam@amd.com>
 <20200903200144.310991-2-Yazen.Ghannam@amd.com>
 <20200909180647.GF12237@zn.tnic>
 <20200909201755.GB3014671@yaz-nikka.amd.com>
 <20200910101443.GC8357@zn.tnic>
 <20200914192039.GA39519@yaz-nikka.amd.com>
 <20200915083259.GC14436@zn.tnic>
 <20200916195152.GA3042858@yaz-nikka.amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200916195152.GA3042858@yaz-nikka.amd.com>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Wed, Sep 16, 2020 at 02:51:52PM -0500, Yazen Ghannam wrote:
> What do you think?

Yeah, forget logical_proc_id - the galactic senate of x86 maintainers
said that we're keeping that for when BIOS vendors f*ck up with the
phys_proc_id enumeration on AMD. Then we'll need that as a workaround.

Look instead at:

struct cpuinfo_x86 {

	...

        u16                     cpu_die_id;
        u16                     logical_die_id;

and

7745f03eb395 ("x86/topology: Add CPUID.1F multi-die/package support")

"Some new systems have multiple software-visible die within each
package."

and you could map the AMD packages to those dies. And if you guys
implement CPUID.1F to enumerate those packages the same way, then all
should just work (famous last words).

Because Intel dies is basically AMD packages consisting of a CCX, caches
and DF.

We would have to update the documentation in the end to denote that but
let's see if this should work for you too first. Because the concepts
sound very similar, if not identical...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
