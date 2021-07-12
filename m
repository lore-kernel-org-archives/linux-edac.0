Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7471C07E99
	for <linux-edac@archiver.kernel.org>; Mon, 12 Jul 2021 16:30:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86BFD611CC
	for <linux-edac@archiver.kernel.org>; Mon, 12 Jul 2021 16:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhGLQdC (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 12 Jul 2021 12:33:02 -0400
Received: from smtprelay0073.hostedemail.com ([216.40.44.73]:43644 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229848AbhGLQdA (ORCPT
        <rfc822;linux-edac@vger.kernel.org>);
        Mon, 12 Jul 2021 12:33:00 -0400
Received: from omf13.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 60D3322AC5;
        Mon, 12 Jul 2021 16:30:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf13.hostedemail.com (Postfix) with ESMTPA id EA34B1124FC;
        Mon, 12 Jul 2021 16:30:08 +0000 (UTC)
Message-ID: <e66313dfc4ff30b745a29c76d9f04049f3aeb6ce.camel@perches.com>
Subject: Re: [RESEND] edac: replace sprintf() by scnprintf()
From:   Joe Perches <joe@perches.com>
To:     Salah Triki <salah.triki@gmail.com>
Cc:     bp@alien8.de, mchehab@kernel.org, tony.luck@intel.com,
        james.morse@arm.com, rric@kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 12 Jul 2021 09:30:07 -0700
In-Reply-To: <20210712120945.GA777994@pc>
References: <20210710163505.GA689509@pc>
         <d95595021eb8da542960fff9b40dc7c308661c9e.camel@perches.com>
         <20210712120945.GA777994@pc>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: EA34B1124FC
X-Stat-Signature: wjtbxdjhp6ep6wtwepef198ee96pcjqk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX182w6M9EvDj0DusiyTsO0pSTMh9wkPUFdk=
X-HE-Tag: 1626107408-422958
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Mon, 2021-07-12 at 13:09 +0100, Salah Triki wrote:
> On Sat, Jul 10, 2021 at 09:58:46AM -0700, Joe Perches wrote:
> > On Sat, 2021-07-10 at 17:35 +0100, Salah Triki wrote:
> > > Replace sprintf() by scnprintf() in order to avoid buffer overflows.
> > Maybe name should be moved into the loop too.
> In addition, for moving the
> declaration of name inside the loop we need to compile the source in 
> C99 mode.

You need to read the c90 spec.


