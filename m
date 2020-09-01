Return-Path: <SRS0=ajLL=CK=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4901C433E6
	for <linux-edac@archiver.kernel.org>; Tue,  1 Sep 2020 06:34:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B65252098B
	for <linux-edac@archiver.kernel.org>; Tue,  1 Sep 2020 06:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598942070;
	bh=vDhHFE235Xp1Z9swBzG8CUZ/dlVqdTIOu59ZuhS0ryQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=Wram3CtISZTZmlF3KPPP00bf1JoIJ1usUry/K8TkwISF/e9iWOZY7c3poAwq7PTw9
	 y/0ZuLdSnwoGSuf1FxzDLE+Slx79XK/Tm7CfVLBxB60GCerUYCifJNORM02GfZwmLh
	 WNfNHfty1SjqGjW4q72/LJUF3NW/uT1gLrkMISnU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgIAGea (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Tue, 1 Sep 2020 02:34:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:49674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgIAGe3 (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Tue, 1 Sep 2020 02:34:29 -0400
Received: from coco.lan (ip5f5ad5cf.dynamic.kabel-deutschland.de [95.90.213.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 234EF2087D;
        Tue,  1 Sep 2020 06:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598942069;
        bh=vDhHFE235Xp1Z9swBzG8CUZ/dlVqdTIOu59ZuhS0ryQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nqpyITnh25+fNs0rXZjgtNCd2pi2GMTKUsoZON1ZB2Zbaf7iJQR+kk+LyQg3Djx0s
         1sN1D4jkAYR+zZHxYMWr5SyhJh+Lio+7lhMYDh/60euhLT7cYi0b3d9WVahhN7W/3N
         yslfnnZLuSMyv6Al3C5mTEc5ghV77twEBJ5CCPfQ=
Date:   Tue, 1 Sep 2020 08:34:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Shiju Jose <shiju.jose@huawei.com>
Cc:     <linux-edac@vger.kernel.org>, <linuxarm@huawei.com>,
        <tanxiaofei@huawei.com>, <jonathan.cameron@huawei.com>
Subject: Re: [PATCH 1/1] rasdaemon: ras-mc-ctl: Add ARM processor error
 information
Message-ID: <20200901083425.1d8dd88b@coco.lan>
In-Reply-To: <20200811123146.1409-1-shiju.jose@huawei.com>
References: <20200811123146.1409-1-shiju.jose@huawei.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Em Tue, 11 Aug 2020 13:31:46 +0100
Shiju Jose <shiju.jose@huawei.com> escreveu:

> Add supporting ARM processor error in the ras-mc-ctl tool.
> 
> Signed-off-by: Shiju Jose <shiju.jose@huawei.com>

Patch merged, thanks!

Thanks,
Mauro
