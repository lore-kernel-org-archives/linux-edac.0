Return-Path: <SRS0=fojs=C5=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE152C43465
	for <linux-edac@archiver.kernel.org>; Sun, 20 Sep 2020 18:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 890CE20829
	for <linux-edac@archiver.kernel.org>; Sun, 20 Sep 2020 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600624839;
	bh=Fc4O2ntJhipGapfvG9AtWFGzKLNS/ZPkvWDMfBudwkw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=AJvlAH4VEN/dl4GTYigB+BHsQrtuehpnKJl1O1sHnC9c78wMU7ENq4KpwAsAuRUR5
	 wM+10bh9gIXt9LW79UXTrZS4OZbAoHr+uhjItHjo+mDgMy+KICc5rU6Lyyot+3RlOa
	 8w2/wEVHJs+Q2Hzj81+fWENQX0DCFg6BbKCSLxME=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgITSAZ (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Sun, 20 Sep 2020 14:00:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:38576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgITSAX (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Sun, 20 Sep 2020 14:00:23 -0400
Subject: Re: [GIT PULL] EDAC urgent for v5.9-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600624823;
        bh=Fc4O2ntJhipGapfvG9AtWFGzKLNS/ZPkvWDMfBudwkw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Psigey2j90OAiFKCa7pH1iFoIlNfBtNRVs7nIwDJWDLS1R2Hu3IdSwPGFcg7AQJ89
         KdYXB80E/lvt/blcSToywaIRmJLTihcPpzfbhwcndzhD/r2IXezJd00p3Vtkq/JVBo
         RcJh36hE0JnUShLmY6h+9wxh+PtTD9pZmmdRJCk8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200920092456.GA13044@zn.tnic>
References: <20200920092456.GA13044@zn.tnic>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200920092456.GA13044@zn.tnic>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v5.9_rc6
X-PR-Tracked-Commit-Id: 251c54ea26fa6029b01a76161a37a12fde5124e4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aac5925b49956f7bf0f5d0ef3477e419f3ee2f78
Message-Id: <160062482341.2021.12014127101188593873.pr-tracker-bot@kernel.org>
Date:   Sun, 20 Sep 2020 18:00:23 +0000
To:     Borislav Petkov <bp@suse.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-edac <linux-edac@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

The pull request you sent on Sun, 20 Sep 2020 11:24:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v5.9_rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aac5925b49956f7bf0f5d0ef3477e419f3ee2f78

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
