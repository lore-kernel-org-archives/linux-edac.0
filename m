Return-Path: <SRS0=AkGr=4E=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A5CC7619D
	for <linux-edac@archiver.kernel.org>; Sun, 16 Feb 2020 21:10:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A6E920857
	for <linux-edac@archiver.kernel.org>; Sun, 16 Feb 2020 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581887424;
	bh=IzHec9/fAz675oNPnbCIlsPSoNCDkFsKkAd9kLavRn4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=m5SW9oi0+ke9Ge7Q48G0I6Ter96bhYTqM/MTpAYIXcTgy+1YznNpSUxNSSB17rvWS
	 rVPvW4RFCsOggomUjvtMRn5Tq64QJ4GSnJs6DcySU1PcCK6eVpLo26/b0zAo1gGbj0
	 E74XKKJdehDMp0iAh7saHveuzvKNKtOdfWYan4iQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728168AbgBPVKU (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Sun, 16 Feb 2020 16:10:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:59338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727994AbgBPVKT (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Sun, 16 Feb 2020 16:10:19 -0500
Subject: Re: [GIT PULL] EDAC urgent for 5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581887419;
        bh=IzHec9/fAz675oNPnbCIlsPSoNCDkFsKkAd9kLavRn4=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=qe/22eUMTwd3VFTTUfffJgYFw1iNySWfo5dUAPsCeo+OFRlIzLITltZhGUhwWUe4q
         Ce+a3pAXjxqKyO+MSEDDu9s8Lej7jRiequ/7eZ+OR0dh8O1PhbG65AcWzTvXvdow0h
         iX2PkFi6vtz+aPf48GzuvRWnCX+AralsGBiMz1FM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200216081753.GA13765@zn.tnic>
References: <20200216081753.GA13765@zn.tnic>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200216081753.GA13765@zn.tnic>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git
 tags/edac_urgent_for_5.6
X-PR-Tracked-Commit-Id: 4d59588c09f2a2daedad2a544d4d1b602ab3a8af
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b982df72ef8404de99597f1d956b6137533b429a
Message-Id: <158188741948.12275.1333422723788418072.pr-tracker-bot@kernel.org>
Date:   Sun, 16 Feb 2020 21:10:19 +0000
To:     Borislav Petkov <bp@suse.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-edac <linux-edac@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

The pull request you sent on Sun, 16 Feb 2020 09:17:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_5.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b982df72ef8404de99597f1d956b6137533b429a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
