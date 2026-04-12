Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF4362142;
	Sun, 12 Apr 2026 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776020362; cv=none; b=tOP0UeO4RgxNgV83qkEvV6fHzWLNmphCfmH7MmgRC72JZtVw7e/R6O5fQ3WK8dLl5xV34489tB4LWqelYW64PLFRQ3I7nzeuGxa/7TGlBBL780VkXyaSMsFTjq5e6X7wYLK+OuhXrOu6HuLz55jJWN947T2of1B4hzBedlZh+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776020362; c=relaxed/simple;
	bh=Kd7XHIYoCsu/zlCp16ZQLLJV30IISXPs1m1gFfl74Q4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VCu5/foJe50Xj9DK1eVTa7zxK6LNkG8FYFDqCoOzfOXhLVuZsu6bhrv1hWfJFL9dtip5+AQmzeYNfHm6uvUW3ihmDoAYuYphijJKLQBI7+HwdBeI3K8J5zocZDOqwk9m9+IPsa45PtTMHqXtdiEyUKpjlAzv3fknpVHC+aUJQDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRgjAXtI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRgjAXtI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98978C19424;
	Sun, 12 Apr 2026 18:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776020361;
	bh=Kd7XHIYoCsu/zlCp16ZQLLJV30IISXPs1m1gFfl74Q4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sRgjAXtI/8dA3xNIYgbcm52bzVGAxo/YY9YGY2KRxg53SN26PEuw0uDl4dhTa2pvg
	 zxNzTYeVvCE+Ybu6+HBTmPmHzyeJmZqKn5i/Ok5LldL2uQQADOEFYbhza3LmOAZ7T6
	 oTny8eTpIPFT8uAR+UEAj75d2J05WG2wLv8HRvfZJb67wkuhWNMNFXhfSVEbYVk9Ls
	 i7WjhV0GfJ0tUnHuC6ZjfMLmFiuZ2EQsD7fnH9syvK/+EJrAPkayUGTFIJmn6wJVLA
	 8jvw7DsYjRmHQpfH5TT3pVRKD42YMigOHLKc55IgTHyIBYye7+h4F+XT3WhX57+6K1
	 iv7OhSNTQ9nhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 42EB23809A8C;
	Sun, 12 Apr 2026 18:58:55 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC urgent fix for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260412183540.GAadvl_C1Y6YaQlxwp@fat_crate.local>
References: <20260412183540.GAadvl_C1Y6YaQlxwp@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260412183540.GAadvl_C1Y6YaQlxwp@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_7.0
X-PR-Tracked-Commit-Id: 51520e03e70d6c73e33ee7cbe0319767d05764fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 10d97b74e2eef787d823f9bc05cb044b47d25c41
Message-Id: <177602033407.3376276.1122583072271547187.pr-tracker-bot@kernel.org>
Date: Sun, 12 Apr 2026 18:58:54 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 12 Apr 2026 20:35:40 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/10d97b74e2eef787d823f9bc05cb044b47d25c41

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
