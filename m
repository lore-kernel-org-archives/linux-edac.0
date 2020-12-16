Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86405C2BBCA
	for <linux-edac@archiver.kernel.org>; Wed, 16 Dec 2020 17:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5561A233EA
	for <linux-edac@archiver.kernel.org>; Wed, 16 Dec 2020 17:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgLPRcy (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 16 Dec 2020 12:32:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgLPRcy (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Wed, 16 Dec 2020 12:32:54 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2589CC061794
        for <linux-edac@vger.kernel.org>; Wed, 16 Dec 2020 09:32:13 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id a9so50372101lfh.2
        for <linux-edac@vger.kernel.org>; Wed, 16 Dec 2020 09:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qqiXE5V/exnIVNEY8/PmSQ2eyNU63PpCSHkahVEwsdw=;
        b=lclVcOhv/sFJVkcFeKaRXPlcbp0hJrPzjxzPuPUE64uS6yFtslE/IvugbnUCAVCRlI
         RQT2edTj2IvlKgHwUpxCX/Y99/9tRLGPgOAO9449WtqFpp5Qos+6aSpbcIBsahadFiSb
         +s93uWpePv15eIaFt2MFabaY+jksudKkTHHoQrSa0PKJYGRWu17ghFwMxyixxpcztSac
         ERU5OHnDdWFIBOmljWT5mb2o4i9WdqhA/qqtlSrApSqGGWq0M5FLYssfe94tDhzhXYFA
         b9ckUGtY77t+z6IrSevXR5/WApuQq1xI2pRScdYxgiADF5NMq8VO1w6yey28a/Q4zEaQ
         neHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qqiXE5V/exnIVNEY8/PmSQ2eyNU63PpCSHkahVEwsdw=;
        b=tSFr/eJk9mA3JPF3EQB/ClCShaHIpgqBrQQeKTt/gMxwf5TRzqyR2YC1y+UBTD9UIQ
         RI2TY+nkimAy0xlAR1LiYLjRVjx7tUHArvJZY/jaUJoO7IFl181CAx0Ee8L2KqZCgcmS
         u7KzqSrjHV2unRzqo5zo/4HShYoIVZAqJFp/RzBAJDz9xbfkbAUB5IHuqBxrGCXaAdU6
         m2w8bPktdJJ1HMQTsK0LupjmcDhfhKVv44viwPSDgnrdTjaxoEcYWGJstwyiIez7hOIu
         2tFbwuJJiL9oX5eJFLqXWfzpE4uyE99PM4G6pfInKfy/ywHlprJXDoqNomeT/9nHX6zL
         Qgbg==
X-Gm-Message-State: AOAM532V2EQIEMB3YaZTFJ/YnaWvOcPkekD/OEMS6Wg5ROIyEZg5oNUc
        5x6PskG9YUqR1QFtb64UxK6+2P7iG4St1rnICErfXQb+GiA=
X-Google-Smtp-Source: ABdhPJyR6uQJ4r3Vwg7bs1B+kGzLiy+RmgVROEMuGab2Pux9wKQi+Ivkg2r+hFhki7DULI7efdUa6JZj8PmuRrREguw=
X-Received: by 2002:a05:651c:1192:: with SMTP id w18mr14168349ljo.40.1608139930633;
 Wed, 16 Dec 2020 09:32:10 -0800 (PST)
MIME-Version: 1.0
References: <CABOsP2O+42Kcf7F5mkzkSizTKGSG48giwkgiv3gN=KZZ+Ad+4g@mail.gmail.com>
 <20201216163427.GA6312@zn.tnic> <CABOsP2POd8UhS5Acfg9Ht8NSpULBFbDX+_iK6BGm3ZNGLdRsaw@mail.gmail.com>
 <20201216171545.GC6312@zn.tnic>
In-Reply-To: <20201216171545.GC6312@zn.tnic>
From:   Michael Di Domenico <mdidomenico4@gmail.com>
Date:   Wed, 16 Dec 2020 12:31:59 -0500
Message-ID: <CABOsP2Ohs-yka1R=d8KfnLJqcXEE34ALrZgyrPY7USjh_uy4ZA@mail.gmail.com>
Subject: Re: dimm mapping
To:     Borislav Petkov <bp@alien8.de>
Cc:     linux-edac@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

that's a bummer.. :(

i guess the best way to determine which dimm to replace still, is
based on the ipmi sel logs and whether or not one can actually decode
the error in the sel log correctly.  intel fortunately puts out a
decode manual that will tell you, but it's a pain to deal with since
it's all bit math.  other mb vendors can't be bothered.


On Wed, Dec 16, 2020 at 12:15 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Wed, Dec 16, 2020 at 12:05:25PM -0500, Michael Di Domenico wrote:
> > the problem i'm trying to solve is that when i run edac-util -v i
> > don't get the dimm labels.  so when MCE trips it's chore to figure out
> > which dimm it actually is when looking at the motherboard.  given that
> > dmidecode seems to report the dimm labels, it seems odd that edac
> > doesn't use them.  but then again i understand how all that's tied
> > together (if at all).
>
> Yeah, the short version is, there's no properly defined way for software
> to read out DIMM silkscreen labels on each platform. I highly doubt that
> is even possible. Perhaps some SMBUS interfaces or whatnot but firmware
> is notoriosly buggy so there's no reliability there.
>
> And, as said before, in some cases one cannot map back the physical
> address reported with a DIMM MCE to the actual DIMM.
>
> And, in recent times, OEM vendors do more and more RAS in the firmware
> so the kernel doesn't get to even see some errors.
>
> I'm always hoping that I'll be corrected some day but until then that's
> the current situation, roughly.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
