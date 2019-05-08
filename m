Return-Path: <SRS0=Tb9F=TI=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE00DC04A6B
	for <linux-edac@archiver.kernel.org>; Wed,  8 May 2019 12:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C0E6B216C8
	for <linux-edac@archiver.kernel.org>; Wed,  8 May 2019 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557319677;
	bh=j/GBFlF9tEolvugpluZDjtfFdcU/0slDfFMrraf2dGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Cs72yOPa+oygIUoce8JgY4QB14sqwXxABf+utkdraySogG+lUaBrP/iYC8Kj8HmII
	 ILf7pei/x09DsusDc1w/tST5zau1UqgF6CrST3yTCQN/k5t4CkV+RkbcrMYWqzn26S
	 upZvM4bUUQfWyVxlBImyNxIwOun7ZqvGkA7TSJCM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfEHMr5 (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 8 May 2019 08:47:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:34382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbfEHMr5 (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 8 May 2019 08:47:57 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25DF121019;
        Wed,  8 May 2019 12:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557319676;
        bh=j/GBFlF9tEolvugpluZDjtfFdcU/0slDfFMrraf2dGI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ik4f/pacqg3sX0XCNJ4o+HUl2WlDqUB8ArTBYqTPPDF+mdb1upNuhodur2FxuX5Fp
         Fc9eDMD+Juw4JF6C3bmbmFOMD5pV0CoLq4xsMKf0M1uqtXze6Y67SdWsLWpWNdNxvg
         +U7fEAE068WPY4DlXAuoq5qeZCdhr5pGKw1510Kc=
Date:   Wed, 8 May 2019 14:47:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     PanBian <bianpan2016@163.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: EDAC: Fix memory leak in creating CSROW object
Message-ID: <20190508124754.GD8646@kroah.com>
References: <1555554438-103953-1-git-send-email-bianpan2016@163.com>
 <20190418172548.GL27160@zn.tnic>
 <20190419003536.GA57795@bianpan2016@163.com>
 <20190419004516.GC559@zn.tnic>
 <20190427214925.GE16338@kroah.com>
 <20190508105743.GC19015@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508105743.GC19015@zn.tnic>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Wed, May 08, 2019 at 12:57:43PM +0200, Borislav Petkov wrote:
> On Sat, Apr 27, 2019 at 11:49:25PM +0200, Greg KH wrote:
> > How about this patch, I think it fixes up everything you need to do
> > here, right?
> 
> Almost, see the two patches as a reply to this message. I've taken
> Pan's original patch because it is correct and I doubt you're dying for
> attribution :-)

Nope, no need for that :)

> Then, I productized yours, with some additions. :)

Looks good to me, ship it!
