Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3467EC433F5
	for <linux-edac@archiver.kernel.org>; Mon,  1 Nov 2021 23:10:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB875610D2
	for <linux-edac@archiver.kernel.org>; Mon,  1 Nov 2021 23:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbhKAXNa (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 1 Nov 2021 19:13:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:60252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229486AbhKAXNa (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 1 Nov 2021 19:13:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6DD2360D42;
        Mon,  1 Nov 2021 23:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635808256;
        bh=IuNjSfBHLBRiEnvV6hM+0i0KGwwSiyFdGyvtw31/bC0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=F040cU3NSaMIRXX7hdDH9G8NJuLniLvS1owngBj3vabRo+wLU8+3kRTyo2uRkig3k
         AR/CWSduueU0JUtGq04rxP5zmUSAMwfswSNobycSi3Drr5/AxogFw8w4Wzu4Ll1MKG
         jgiJAbqynzdYCl9sCAHz0TYvOQidENZN+13JQQSdv4kkaBCdo+3+17C3vZt4jrPLyi
         KXG4xyAp4GT5u+QB6ovI+2z/RoWOD5ukGXzRVJYJPLZ6UfUZALVGJDb+ydKnNHmEKJ
         WH+NovUMNZIS+Ee4XX9fzGYy8c4Xt/IKiPTq7auOP6O1OzwPAzA1oGhwqV1DS1kLo9
         /h6RlBTnHSUCQ==
Subject: Re: [GIT PULL] EDAC updates for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YX+uqd7WuvpfyfmD@zn.tnic>
References: <YX+uqd7WuvpfyfmD@zn.tnic>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YX+uqd7WuvpfyfmD@zn.tnic>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v5.16
X-PR-Tracked-Commit-Id: 537bddd069c743759addf422d0b8f028ff0f8dbc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fe354159ca534071840a7d9bb1779d557e28f344
Message-Id: <163580825630.31036.12834422137880968433.pr-tracker-bot@kernel.org>
Date:   Mon, 01 Nov 2021 23:10:56 +0000
To:     Borislav Petkov <bp@suse.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-edac <linux-edac@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

The pull request you sent on Mon, 1 Nov 2021 10:08:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fe354159ca534071840a7d9bb1779d557e28f344

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
