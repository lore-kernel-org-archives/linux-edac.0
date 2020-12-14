Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57505C4361B
	for <linux-edac@archiver.kernel.org>; Mon, 14 Dec 2020 22:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03B7522507
	for <linux-edac@archiver.kernel.org>; Mon, 14 Dec 2020 22:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390134AbgLNWSp (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 14 Dec 2020 17:18:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:53030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727624AbgLNWDW (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 14 Dec 2020 17:03:22 -0500
Subject: Re: [GIT PULL] EDAC updates for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607983360;
        bh=Q1M/R4wnq0RTG56mQzavEZ/JxFGSm3a/iav2csKtuZ0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Bm9m+drjeSpiOu+iZ2MFm0BrCX2FIzgeaZaNgPntNXNBCMovUE3Eq3RihyMvF1kP+
         BhBoplEJO279tqqUpzoOITlRgyRzC3ggkA7mMA+KFNfXmPGI7D7XDcRqox12/pDRME
         ZCorB/6WpR+ZVdnj1LpPBEOO5qgsQXjua6+Pg70+CTMeVmfR38WH88IU7unVD+nlrN
         hQUy+obqUZbK2u1NHL5iFrotqwcbpGLzJ5GFRtrivbJY5WQOsPzyGi6RnkjXPyVVjM
         78i10BPKhpxjeJXKeY6XXJ1RI93BpiVgH++7aCwyMy8hjcObM5wRbPmvkYuBkXjFdU
         JlHtWzrCfi+WA==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201214110422.GA26358@zn.tnic>
References: <20201214110422.GA26358@zn.tnic>
X-PR-Tracked-List-Id: <linux-edac.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201214110422.GA26358@zn.tnic>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v5.11
X-PR-Tracked-Commit-Id: f84b799996e29ad3b37e83f7871e79023f29979d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9e7f25886bdf16679d3d72624003bef5ef7dc785
Message-Id: <160798336069.30284.10383850113368020190.pr-tracker-bot@kernel.org>
Date:   Mon, 14 Dec 2020 22:02:40 +0000
To:     Borislav Petkov <bp@suse.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-edac <linux-edac@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

The pull request you sent on Mon, 14 Dec 2020 12:04:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9e7f25886bdf16679d3d72624003bef5ef7dc785

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
