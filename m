Return-Path: <SRS0=Vzoh=BA=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B29DC433E4
	for <linux-edac@archiver.kernel.org>; Tue, 21 Jul 2020 12:26:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4735F2080D
	for <linux-edac@archiver.kernel.org>; Tue, 21 Jul 2020 12:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595334397;
	bh=uMCtDAib8cv4Ng4iyzfsQvzAGwKwOxFEohCoUouC8o4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=T/pps4+Xa8SAsiGXr9ODeMNWRFBgcLX9brFKQNSuGuesfrx0mbh0rQ/zYvfHNoM1g
	 Pk48L6dK7/w40lqLbdDetBhwcTtwRaD/m0LPDZpiVtiOXXRWhCQMMZH/oSfelNvR38
	 sXp4C3La5FiJacpaEV49OS1BX9GlJAUpAbe84HpE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgGUM0h (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Tue, 21 Jul 2020 08:26:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:51128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbgGUM0g (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Tue, 21 Jul 2020 08:26:36 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5841F22BEF;
        Tue, 21 Jul 2020 12:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595334396;
        bh=uMCtDAib8cv4Ng4iyzfsQvzAGwKwOxFEohCoUouC8o4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GwF0BNltA1zHHLC1KciHSInOx/ptqblbEUe3aKwKjzIX8zaPuRTX1+ZM37YSE6hMt
         u6eixd5GPSOLhp2fwncqlh4Nan3Nkh+lfigi6+p0lztgh7Vk9KywW9NAzQWkmZotvl
         wn/is3rCwrBXrCxut7q0h8cq+2woml9mZXBuGOuk=
Date:   Tue, 21 Jul 2020 14:26:32 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     lvying6 <lvying6@huawei.com>
Cc:     <linux-edac@vger.kernel.org>, <guanyalong@huawei.com>,
        <wuyun.wu@huawei.com>, <tanxiaofei@huawei.com>
Subject: Re: [PATCH 0/2] rasdaemon: add support for memory Corrected Error
 predictive failure analysis
Message-ID: <20200721142632.6683caaf@coco.lan>
In-Reply-To: <1590740663-6664-1-git-send-email-lvying6@huawei.com>
References: <1590740663-6664-1-git-send-email-lvying6@huawei.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Em Fri, 29 May 2020 16:24:21 +0800
lvying6 <lvying6@huawei.com> escreveu:

> rasdaemon: add support for memory Corrected Error predictive failure analysis
> 
> wuyun (2):
>   rasdaemon: add rbtree support for page record
>   rasdaemon: add support for memory Corrected Error predictive failure
>     analysis

Patches merged, thanks.

Thanks,
Mauro
