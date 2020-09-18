Return-Path: <SRS0=f1F4=C3=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADE4C43465
	for <linux-edac@archiver.kernel.org>; Fri, 18 Sep 2020 13:31:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3626623600
	for <linux-edac@archiver.kernel.org>; Fri, 18 Sep 2020 13:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgIRNbJ (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 18 Sep 2020 09:31:09 -0400
Received: from smtprelay0050.hostedemail.com ([216.40.44.50]:40246 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726126AbgIRNbI (ORCPT
        <rfc822;linux-edac@vger.kernel.org>);
        Fri, 18 Sep 2020 09:31:08 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 822A5181D303C;
        Fri, 18 Sep 2020 13:31:07 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: rail18_290ab6c2712b
X-Filterd-Recvd-Size: 1742
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Fri, 18 Sep 2020 13:31:06 +0000 (UTC)
Message-ID: <6f6be4f64a016c5be82b1fd21ce2402653a8961b.camel@perches.com>
Subject: Re: [PATCH v2] EDAC/mc_sysfs: Add missing newlines when printing
 {max,dimm}_location
From:   Joe Perches <joe@perches.com>
To:     Borislav Petkov <bp@alien8.de>,
        Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc:     mchehab@kernel.org, tony.luck@intel.com,
        linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 18 Sep 2020 06:31:04 -0700
In-Reply-To: <20200918071227.GA6585@zn.tnic>
References: <1600051734-8993-1-git-send-email-wangxiongfeng2@huawei.com>
         <20200916170052.GO2643@zn.tnic>
         <591e613e-0b53-028f-08fd-3d62a35b8c4f@huawei.com>
         <20200917162537.GL31960@zn.tnic>
         <8ac6d481-e1c4-108e-dbec-b1e86b2d0e86@huawei.com>
         <20200918071227.GA6585@zn.tnic>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Fri, 2020-09-18 at 09:12 +0200, Borislav Petkov wrote:
> On Fri, Sep 18, 2020 at 10:37:28AM +0800, Xiongfeng Wang wrote:
> > Thansk a lot. I will send another version. Also I will change the
> > 'snprintf' in 'dimmdev_location_show()' to 'scnprintf'
> 
> No need to send another one - I have everything locally and just amended
> it.

A generic question about sysfs is whether or not the
PAGE_SIZE buf output should be newline terminated or
not if an the buffer is completely filled and the
desired output cannot be newline terminated.

Likely not.

NUL termination without newline should be enough to
indicate overrun.


