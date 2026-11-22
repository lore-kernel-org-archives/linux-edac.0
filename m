Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386011;
	b=F595K5G31Fk8+hkUGTueDTVsSjilqkHvOiipP0ejxNEQCk04lyjx4p/65h0JvuNrS9I9
	 gpbUwIi4aFDMvB2u/zsvAS1wOwcjsJXTuYyeh/pjSeWAVasnrryHmOq2EnbAZtng1VUix
	 IVdfJmqc3hW3Lv28ec/Y6bTdPyU+Iz1zztiODa1mKKoPYO2s7xx30mej/qgn7vIGhB9uC
	 LxMOtW8vKU0CpHMGSwdu7KsBtkMtuKpJKLZB13zyaChKAC/EeAja6wwl/oVgSSxQhR0u0
	 aykjiLuwb1tjaJ3gk3zAa7EEVNGS1d07HZ4G4nGPzkn354Dq4UCyPFIKCB7RL2TWZAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386011;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Qjo+VDjo4Dhr/K7Om6BbuzJRcfNQ7OFdcHJpBvwWQyU=;
	b=3+6hZzcW2a9obWiZqL7U6XIu3KC8bTVQvYR1vPCDaVU0PVnVp1oxSDdmUDnPpqkixxoA
	 7huqa2aScubL3kWAN58mH3BSncQsrY+UWxnkdH3aONktyp1YCOh8ZrnaGVCViZodODZCo
	 3OZF/eY6SlXgFnx4heUg/RO7YlAwMtwAntVeEygf/G7O0vNK3RyOYoC5SZrASA2AvN/lO
	 RzargFvmVZ6fuJj4H4dp429nWDAuEKxzIyvNWa18Yv3gJY0hAmqSpYzUZyRolOc3cLU+n
	 E1K2/2CuNI1Uy01kUU1XfGoBsuDTX2FF4ZAYdXXsWxsEroDCr0WJvN9FLkXJAbILNEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j90LX4QT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41051606A33A;
	Sun, 22 Nov 2026 22:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j90LX4QT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD181F000E6;
	Sun, 22 Nov 2026 22:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386010;
	bh=Qjo+VDjo4Dhr/K7Om6BbuzJRcfNQ7OFdcHJpBvwWQyU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=j90LX4QTwfRuyzh62pMlTsMndQT7xw/12IF0UJ9iuFwJ/pwQ6BAiUQeTHI8DEcaMQ
	 BfDkWyPZo2c7p1nQZmkpWXHEwq5YxIcjDvTC8o+g+5bHcdm0zdHEm9bfQNcgb1XCQt
	 OSMqAoV5YZpVAV5RzmIExG74wB/ZC91En7Y263OhXfU2/jJcaSSuDfsGkIQKcG7Npv
	 uqC6PJh+D8NFEAX+3ATu0vhH+3G+LSvF7F1kRE1A/Eb80OOccXhoKrH8gz/N/ubWac
	 BBgQk4A0NrC24d1ljeDet7nxz6ImhmMWhr69auC4j7+RabwYTKBqsuhLdnFGYf03GK
	 x5sY1zsNg5mgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44BE392ED41;
	Sun, 22 Nov 2026 22:20:10 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC fix for v7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261122192701.GAawNCBYMV2pirBGs4@fat_crate.local>
References: <20261122192701.GAawNCBYMV2pirBGs4@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261122192701.GAawNCBYMV2pirBGs4@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.4_rc4
X-PR-Tracked-Commit-Id: a088b092a8962db62327690ae2d0d68827e81229
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1fadec005439186c67ca7be35c4e90727bc38fae
Message-Id: <179538600938.1569645.8728385065038816537.pr-tracker-bot@kernel.org>
Date: Sun, 22 Nov 2026 22:20:09 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 22 Nov 2026 11:27:01 -0800:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.4_rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1fadec005439186c67ca7be35c4e90727bc38fae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
