Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CCE3793AB;
	Tue, 14 Apr 2026 22:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776206929; cv=none; b=cVIDtM42ZopAzuzZKZNAcyEh6dVv7FUyAUxFmGMNatGgCQcWuUS1b3TkGk5JcxkStRm/cunfqtTTr6zt4NIE5aZhH3CfD8+mfAMpNLOmuKB1jlSXgfe/qaW2x9j6+MKY03DNtYIwlAxHVHEgbxHfqlgqql0OjcZHDwzijCNSLZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776206929; c=relaxed/simple;
	bh=gp/ySdFhVNZQFEEyWmuArRu0tWWO7Edc9oNbbCajtSs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jIC8XNqu3JQ03hYyOpkcuo6k4m7YKwgEkWrpjL4fea0D2C+kLG85itlL9iqDPjQOcvOymlmwPDgQGeyKq8cwBVDGl24g6TlUDwK70xT8UGn/T94xS9MowscHCgCMECs8mPf/zayv3cKv+U4BN/eEpYFD4xiZhg3pPhVNNPaNCeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMvnjbGt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMvnjbGt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F77C19425;
	Tue, 14 Apr 2026 22:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776206929;
	bh=gp/ySdFhVNZQFEEyWmuArRu0tWWO7Edc9oNbbCajtSs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FMvnjbGtEVa6AE8BomOZn01r0o1CF+9me6MhRJsTxlDHzCyVy9PGguHkV+Vn/3BZY
	 6GBZVDUtY3XxqM1l19CLVLAZbYND7vJ4jOLQ7/BX4BOKtq+0CsrlUs2u/HKbyZ4LyX
	 RgvC/tk5npwVsCYKBTr12vSnoiRM+4ivgfePfVkPcZt/C14BoopodAk4BQFsuBRz+l
	 l8g5/WUqx5zhVvd2n5kk+LDgJt7wzisBp9kWbFx5+ZbNbG9a2t30vAPeiM7ya2Z8qB
	 at7yOsci/7Ie6nfy39j8waRQmUyAKEFLRzmMge5N4HsPrQskQNv1NnRkxkppbmAjG8
	 7QUgVBBaiv8QA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1793809A29;
	Tue, 14 Apr 2026 22:48:20 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC updates for v7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260413101846.GAadzDBgcGq09VOfpH@fat_crate.local>
References: <20260413101846.GAadzDBgcGq09VOfpH@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260413101846.GAadzDBgcGq09VOfpH@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v7.1_rc1
X-PR-Tracked-Commit-Id: 4db9a9841dc1060e8805a4c40bdd7e6058d45100
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1834703b8426c92211fd92a0e552fd4ae84dcb71
Message-Id: <177620689926.1500937.13955231553736310905.pr-tracker-bot@kernel.org>
Date: Tue, 14 Apr 2026 22:48:19 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 13 Apr 2026 12:18:46 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v7.1_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1834703b8426c92211fd92a0e552fd4ae84dcb71

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
