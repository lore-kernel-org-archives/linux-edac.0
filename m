Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E58C433DB
	for <linux-edac@archiver.kernel.org>; Sun, 21 Feb 2021 05:07:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD9CA64ED6
	for <linux-edac@archiver.kernel.org>; Sun, 21 Feb 2021 05:07:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbhBUFHO (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Sun, 21 Feb 2021 00:07:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:43618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229479AbhBUFHO (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Sun, 21 Feb 2021 00:07:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D7A2264DB1;
        Sun, 21 Feb 2021 05:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613883993;
        bh=wl3mF73qKpglmOxmQ70ek3ANfDI/GTN1qClk6EZzo1E=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=JYSmuNPSV8W3EKW9kr6vpHIa8LCnodtSl83K4ydEjNdr8ogJGHwZoobBUDTxh3waq
         Tx8XkGonvgHlIKZ+ZKL2mxcwy2lsA7tTK4e17twKIrTAJQRzk8fKeahe3l9FfstZnh
         kqTbv1J5mVI41XVdE7yu348hk3a/2bRZt60hFkJkvF05OyZTgX3pgSsFEfStDN9XNc
         aVOHdI/aF2KVTlJJA02gENv2scP0v5wLRnrD3SI13uM4J4o6dBsunBj593VL7E2Ix6
         OfyB7p5wNygm93/t0biXbmddKYkBOg2ubFe0puhthHEnc2vF9aZ/p/aiQsX6jqpbQ7
         01KgNklvluMbQ==
Subject: Re: [GIT PULL] EDAC updates for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210215091653.GA23409@zn.tnic>
References: <20210215091653.GA23409@zn.tnic>
X-PR-Tracked-List-Id: <linux-edac.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210215091653.GA23409@zn.tnic>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v5.12
X-PR-Tracked-Commit-Id: 6118b488933b0311e28420d4cd1ee06caf59682b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8518496639123ebcceb1be173c4f00edf178bfbd
Message-Id: <161388399372.9594.10154170557194809469.pr-tracker-bot@kernel.org>
Date:   Sun, 21 Feb 2021 05:06:33 +0000
To:     Borislav Petkov <bp@suse.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-edac <linux-edac@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

The pull request you sent on Mon, 15 Feb 2021 10:16:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8518496639123ebcceb1be173c4f00edf178bfbd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
