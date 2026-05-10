Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05DF1DE2AD;
	Sun, 10 May 2026 20:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778443460; cv=none; b=kjsAERW6aStUmsAif941rRG8BzekJyLpc3MmWZfd5by/WfuEb/3tdOKX5QH+6poqGNUdVml8dobTyLwooR2YlmHTDQXqVQhH9mYWFoE8Ne6rhx5DHrswu/KEaCuz1CBt4rIxGKbsAUHwLntFe3yfUCxswRStub9qlzvp9fxRRA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778443460; c=relaxed/simple;
	bh=oR2+r58Q6XQF9numOP5DYZpZ4aTe20X47mPmdIUV1zc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DgRwiayUdKQW7GUoe4V83Jw+aiOMjD2dukkCZHmkQshLD+AkRnnuChJPwu/nYlPGlHGgPRuOgzWSqMz6hVgMzDQJtGoCrCqAOhV4LgAZIKwWQqgsMkFUAhgGDL++n84GJpJ2g/ywlTQsUI/QXm9d7G19RpTDWOcjMUbfZMPZLG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkUsghKQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkUsghKQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50219C2BCB8;
	Sun, 10 May 2026 20:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778443460;
	bh=oR2+r58Q6XQF9numOP5DYZpZ4aTe20X47mPmdIUV1zc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bkUsghKQYD/gdo06iOoCz0shZaSISRxHEC/+Hx1fWliULEcrkaxIY5gCPRBg6S4zk
	 58hEVx6VMRF+z6GQp2h5Lcd3sno4NOGXr0IZk9lxVpJG1zyNYjow9dwH57jfUJSRbH
	 PAnV77VrMJvAndZmmby7yV1V+kwW/R2+YFNlf+8gF48LM3vrevQ4f+2O0DggrDdHr2
	 6KRDYW8y0tImMI9MXNJpzozR7sIjJqwqAKHGuJfyvmLyLbJBNpAp0jqJ4EdXmXt+/G
	 RzajqUdIIj5pKWRfL6o37HI8Rf624PZz8u9nnQLRqNdZeJyzTQduyqGYS9pU+nlz7D
	 /BVX9eJ/tGOWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FE1380A97D;
	Sun, 10 May 2026 20:03:28 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC urgent for v7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260510190505.GAagDW4XaK0a9H2Iur@fat_crate.local>
References: <20260510190505.GAagDW4XaK0a9H2Iur@fat_crate.local>
X-PR-Tracked-List-Id: <linux-edac.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260510190505.GAagDW4XaK0a9H2Iur@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.1_rc3
X-PR-Tracked-Commit-Id: 8cf5dd235eff6008cb04c3d8064d2acfa90616f1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: afaa0a477099cb7256e26fe11289c753a225ac97
Message-Id: <177844340719.1479180.921965607005175233.pr-tracker-bot@kernel.org>
Date: Sun, 10 May 2026 20:03:27 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 10 May 2026 21:05:05 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.1_rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/afaa0a477099cb7256e26fe11289c753a225ac97

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
