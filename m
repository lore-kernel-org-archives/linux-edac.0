Return-Path: <SRS0=lgYc=DT=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8A6C433E7
	for <linux-edac@archiver.kernel.org>; Mon, 12 Oct 2020 18:21:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CA562087D
	for <linux-edac@archiver.kernel.org>; Mon, 12 Oct 2020 18:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602526863;
	bh=22XGfSewhYj0UUi/pwq1jJzvdCqo8cXGLo+vm/QUmys=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=OzSnxifMM6jNfmVLqkhRZZ5fL8N/vxAlY6oh8DMymH4Y70grFDaYIyNf3Zz5/lh6K
	 YVT3sQe2CuY1vaViRxZTcDRHdJ0Fdr/C8gC6DQObiA6HC6lzXt3bnSEfVwKvfbQHVy
	 6UMG8BPMH/fi9AhsqFsJJYWT0HMb/tleX/n+bK4Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390849AbgJLSVC (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 12 Oct 2020 14:21:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:39082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387669AbgJLSVC (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 12 Oct 2020 14:21:02 -0400
Subject: Re: [GIT PULL] EDAC queue for v5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602526862;
        bh=22XGfSewhYj0UUi/pwq1jJzvdCqo8cXGLo+vm/QUmys=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=S6E3dZ5/4oKdAA/quNs6PREt9MQtoqbvvLjzKP7NXeobK67LAcrx9u1fwz9BypUVE
         uyDIbYQp9/2DnOIlpi78HmUT0qgjsCvEX836iBOrufuUjuGTWO2JJR1H6nhTLPCqZ7
         tzOmvkcgUYj5NETgoyaOB8KLda4FnJe6tcstEnIM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201012092029.GA25311@zn.tnic>
References: <20201012092029.GA25311@zn.tnic>
X-PR-Tracked-List-Id: <linux-edac.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201012092029.GA25311@zn.tnic>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v5.10
X-PR-Tracked-Commit-Id: 1dc32628d65a670625afada00f50c91add1a19a2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a9a4b7d9a6380ae4e1df2c9b90fef6c427229aab
Message-Id: <160252686240.3643.17498350851659457514.pr-tracker-bot@kernel.org>
Date:   Mon, 12 Oct 2020 18:21:02 +0000
To:     Borislav Petkov <bp@suse.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-edac <linux-edac@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

The pull request you sent on Mon, 12 Oct 2020 11:20:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a9a4b7d9a6380ae4e1df2c9b90fef6c427229aab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
