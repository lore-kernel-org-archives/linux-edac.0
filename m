Return-Path: <SRS0=Q6bR=ZS=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12060C432C3
	for <linux-edac@archiver.kernel.org>; Tue, 26 Nov 2019 02:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE94320835
	for <linux-edac@archiver.kernel.org>; Tue, 26 Nov 2019 02:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574734530;
	bh=34VHQHP+vU66S+8K6yTWvzDWd1M+clvu3NJZbMliFrM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=vAQW0pqqpOwUnIit+Cd8vX0vJ45XRfGcHOtn/HqESH1Xnhq1h9Eqyuuqz4yxCttDi
	 cvKcvLcbfmSVcq+LwEgcAnc1221Ct3ocu6fkshnxiW2TfcOxtN0CM53hG6y3/IE6yB
	 m9wwjM0MJG0lj9BTdB88s8amSfx2yrz64jZiYsFI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbfKZCPJ (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 25 Nov 2019 21:15:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:53080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727913AbfKZCPJ (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 25 Nov 2019 21:15:09 -0500
Subject: Re: [GIT PULL] EDAC queue for 5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574734508;
        bh=34VHQHP+vU66S+8K6yTWvzDWd1M+clvu3NJZbMliFrM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=QOiBB9wHhUMcUEMWkwFxHlOwJTowWDoS8jHUqywNrCW1FggbW6q+KlDUAYE6fkdvm
         KFRDPpYfngja4ZJtMEdhqTeqiym8jAHK/FaKxT60e1MOsFV1EZfHyS2inArpWjlep0
         DTNoEbSw0CtZXBT1904y4xSwjFQQNDzRz2l3eM6Y=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191125074118.GA12432@zn.tnic>
References: <20191125074118.GA12432@zn.tnic>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191125074118.GA12432@zn.tnic>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_for_5.5
X-PR-Tracked-Commit-Id: 5781823fd0d39082bfe2bbc20408aaa85a6e06ad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9c91e6a5befb89d1494dd156dd4563f9e948a74f
Message-Id: <157473450889.11733.8772709704356001167.pr-tracker-bot@kernel.org>
Date:   Tue, 26 Nov 2019 02:15:08 +0000
To:     Borislav Petkov <bp@suse.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-edac <linux-edac@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

The pull request you sent on Mon, 25 Nov 2019 08:41:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_for_5.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9c91e6a5befb89d1494dd156dd4563f9e948a74f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
