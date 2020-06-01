Return-Path: <SRS0=zrFY=7O=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3352C433DF
	for <linux-edac@archiver.kernel.org>; Mon,  1 Jun 2020 19:35:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7475B20842
	for <linux-edac@archiver.kernel.org>; Mon,  1 Jun 2020 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591040113;
	bh=TKnLF50B+lrLerj74xVFVrjdxPs8SeorPl1Zc3zRuFY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=SmpwvtH5ORQ0Jd5XzbwOefQsSo4bLErEe0JHy7QRzJksyArUm9oghiqlCbvr3FLiL
	 IEcq8DyTOA1cFRM2XjtJf/UYqjwtLFYLrElH2x9Kf+T60a3LqNMz3NQQiG1ujNx/1E
	 fYNlXjSCfsatDHEyzQJktTadC3wVpAn8kFsRHaoo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728450AbgFATfN (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 1 Jun 2020 15:35:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:57918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729087AbgFATfK (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 1 Jun 2020 15:35:10 -0400
Subject: Re: [GIT PULL] EDAC for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591040109;
        bh=TKnLF50B+lrLerj74xVFVrjdxPs8SeorPl1Zc3zRuFY=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=cOOtJgWZaHoMc41VxkoB4sFtSqUyjPB+LRThTRGXZUob5ab7rD/MSwG+W/pSJKKpr
         JW0/pZGkMApSpEUcxAM1fP8p7Rk9GYhs6ShJDpSnBPAIh6HXtYIbV30KoaNd2M1Oaw
         eUi/jHzZRIb3IFD5L3Gl2O54JzdeNTYIQuuVJ8Do=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200601095317.GB30795@zn.tnic>
References: <20200601095317.GB30795@zn.tnic>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200601095317.GB30795@zn.tnic>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git
 tags/edac_updates_for_5.8
X-PR-Tracked-Commit-Id: 2a02ca0428cfe68cce600111acb4c6f7d85cf71f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8b11dd54add63aa398c4b239d31b7f4477a4b859
Message-Id: <159104010983.18844.14542765433119826738.pr-tracker-bot@kernel.org>
Date:   Mon, 01 Jun 2020 19:35:09 +0000
To:     Borislav Petkov <bp@suse.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-edac <linux-edac@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

The pull request you sent on Mon, 1 Jun 2020 11:53:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8b11dd54add63aa398c4b239d31b7f4477a4b859

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
