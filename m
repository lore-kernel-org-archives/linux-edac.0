Return-Path: <SRS0=6D6O=BO=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACF2C433E0
	for <linux-edac@archiver.kernel.org>; Tue,  4 Aug 2020 03:20:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E47F20A8B
	for <linux-edac@archiver.kernel.org>; Tue,  4 Aug 2020 03:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596511209;
	bh=C7XRvcVi/EXa3HdrL0AcESOiKfNxkuXLNeF+jbusr6o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=i2j1uC5i878ljSI/SwpqD8/0YXwjjNOz/N/HUhLdbaEtqZzIr+E7B6WSRruzQg3fw
	 tjf+9mgA4vXyRmXijHkRkqbftPddA/jgWqB6T11vyNDBP3AXw0bWcd4qjP85OLd7gg
	 nQu6YAkXI3cQwyZch2L+VelLzJwDsMw9fyKVcvgw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbgHDDUI (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 3 Aug 2020 23:20:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:39908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728287AbgHDDUI (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 3 Aug 2020 23:20:08 -0400
Subject: Re: [GIT PULL] EDAC for 5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596511208;
        bh=C7XRvcVi/EXa3HdrL0AcESOiKfNxkuXLNeF+jbusr6o=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=lildCk2lIlj5YLfcNiZt2GG7Thjp1X/hcmc9k21EuoZKtw5MVtmbDfiO0/PxOob71
         b4L4MoKO10/aapLmh64YlQmg8Pq1uKcvEDZ8eZNRuC/sDJqIeBN1cISNtmqS3xDh6M
         +scewvhSTRbBbn4oXRrSbyJjE0hzgWCxj7B8QuY0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200802220330.GA24423@agluck-desk2.amr.corp.intel.com>
References: <20200802220330.GA24423@agluck-desk2.amr.corp.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200802220330.GA24423@agluck-desk2.amr.corp.intel.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git
 tags/edac_updates_for_5.9
X-PR-Tracked-Commit-Id: 0f959e19fadf00638b686fdeb70e24dfcc7bbcac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f8851cb2d0cc2b4f8ac5dadb03148d6b58609b1c
Message-Id: <159651120801.27006.4312245578400302587.pr-tracker-bot@kernel.org>
Date:   Tue, 04 Aug 2020 03:20:08 +0000
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

The pull request you sent on Sun, 2 Aug 2020 15:03:30 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_5.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f8851cb2d0cc2b4f8ac5dadb03148d6b58609b1c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
