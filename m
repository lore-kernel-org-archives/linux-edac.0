Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40213DF59;
	Tue, 16 Jun 2026 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781570012; cv=none; b=nMunhsM65av8AJq1RSsg2oDd7S/dFG04cLoKOQCoYgsWjxlOMfDl4OzYk6YJ7Cx2HfAlT+RSv+9e5qoSaPt8asSKFzdZagzalTma9RDoAtP/NsoaXHHQVeQZXmjBvTiUNaFZVZIJBB1LvGyAGkfZUu/Y/XPs2MkUbXHyc1ZP5yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781570012; c=relaxed/simple;
	bh=aY2JIah1RxH7TFreWnWpN6kGLiZ37YVD232NWQDfqHU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Bpr0XFKPu5IZTTEL4m3WOvlvEgZ4myNn8N1GBPUUK3vbla31VQIUxzUKGrYBSSZdMYnjIf1RuSVjkcVBAoydCLeddCRc/E6jMC9+QY3YhzSQ+s4I74Q29Tn9VTceKkPvryCnvI7RnZwtIGc1UOEo0StcHf852DkxVu6ewH2W47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fguO6QBq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fguO6QBq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A5C1F000E9;
	Tue, 16 Jun 2026 00:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781570011;
	bh=S1EiVKzL7xELSVc5XUasfJCmQeMVUr6oxrpjDwWbOA0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fguO6QBqa4/iAuFf1RrpHJoyWhe03C+vdrgLebnBYL5ZTUlHgyCjMNzzHQ4XIQEZu
	 I6nHgenknzXANA87NY8nWvaDeeQpxTxpvbNprWzw2NYW435AsHMWaRw2hfWlt1SL8o
	 FdXqcK2J9HXsC1yKFKFR7jt5Z+gOJG3uRKKS01cO4Bgveb7azTYHkgwaMf0jNd77Gd
	 RrH5RuTwQbnHweiZkNV25htfoyttckoiUXvjrvbwHzWKFgMVt330xSnQtD+RSk+Bzj
	 r5ZKTwp7lAF/FWHTBNjg6UIj8jy3ohAh6mKJOHMs5PYcKH8eN+LXbwuodNmvCUlW1U
	 Ukl/8BbFdM6rQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B093839A26;
	Tue, 16 Jun 2026 00:33:27 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC updates for v7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260615041611.GAai98i1epKOg3M-uP@fat_crate.local>
References: <20260615041611.GAai98i1epKOg3M-uP@fat_crate.local>
X-PR-Tracked-List-Id: <linux-edac.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260615041611.GAai98i1epKOg3M-uP@fat_crate.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v7.2_rc1
X-PR-Tracked-Commit-Id: 2556746302b335b3a9b016e315c7a14f272eab12
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b5713ef2f929dd8720fcdb66c063643ef9e3bcb
Message-Id: <178157000592.358810.5844826364416702313.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 00:33:25 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 14 Jun 2026 21:16:11 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v7.2_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b5713ef2f929dd8720fcdb66c063643ef9e3bcb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
