Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386012;
	b=tQ0EVqqtSp+MLcsZ6ksd7Ic0UEmGEUVG0noGbWUPrpr+rbrQzaYuu/LLUJAk+M/Xiicq
	 /yEy7mzVy7e+zd8f9rXMqxbDc6bnx8q3UTbZ/XxAS3pbCjT+m8QnnpZvVQNOnsk1NHFNQ
	 lax1XSLyYbcR4dMiRTmsWBlTbBzl5Mw4RLoQOxjI85qY2Bvut51T7CVqKlHdKxEwDN28I
	 00rxtYLDhDjt2EEY2v7eQl+eC1FHO2nXhTjwXl7LPsSCgXiYIjVNzdinu4WblRghlrUYV
	 Fs3dT33uf+jbuxHNjOPFwJza3+Av1Drl/pgBW16M1WPwRljvHSEvT3d1xT3uRY9q0tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386012;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Qjo+VDjo4Dhr/K7Om6BbuzJRcfNQ7OFdcHJpBvwWQyU=;
	b=N9HqBa0r/jKq3T63pN2/lnRjpcKdNMgHL6Ml0W1GbjAKQkmVI0h3PZvebEZdTuCRpXhp
	 Gsxzq6egL+fA2VVqnLgV8NWtq5r3rlLwlCxyNJIUv4p576Cmc4yu3BZQ/tGjXCDlFg879
	 Ys1nWSgo1e/ja//66re2vKuHw5gg05rkJ5TxpzyW6PLprmyP6d+KEBWD5FyaLAmyJ1W2/
	 B6TRKPwW4eg0NmQsMuuDHET5a7VOGdY4qpjL9V4ZhJrscXpduXBIv9GZN9UYCi7PsTEjW
	 7lgTG1gzD9F+QqnM/iPCVfh8ccapqnFI22vDscdtcRP1gHWqP7bKu7mxiFHH+nqW/YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z9E2ioXo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608F606A33C;
	Sun, 22 Nov 2026 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z9E2ioXo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457091F000D4;
	Sun, 22 Nov 2026 22:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386012;
	bh=Qjo+VDjo4Dhr/K7Om6BbuzJRcfNQ7OFdcHJpBvwWQyU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Z9E2ioXo7aLfO8f7bDF3vuobdOiSXN0geT2SnMwIHmnA6VQl0Z7SD49XWyrokgBZU
	 JZrotCluKwRYGCuVhXRRGgK3GtdVpu8M+G43MbTLlB8tU5a6+IW6O8Yug70SjombR/
	 3GIYe/epjBhLB2FSfcBfGDHztZEMKS0M28j2dHWdqC1ubRhImYdOSVaj7sSJbS9xvA
	 cZUwrM77nmonJA1e76WEf8/C5ANeQ+9xgnr3Ly23ZfzL51rf72GkEjGtrAnUjAzboJ
	 U480O/u7LYhivrQLdF30QNfaxm3jb4yCZfVpRVcIE7XXDTTs56A3lAzEn2k+v2s79e
	 /3I6cJ1VuliKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A357392ED43;
	Sun, 22 Nov 2026 22:20:12 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC fix for v7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261122192701.GAawNCBYMV2pirBGs4@fat_crate.local>
References: <20261122192701.GAawNCBYMV2pirBGs4@fat_crate.local>
X-PR-Tracked-List-Id: <linux-edac.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261122192701.GAawNCBYMV2pirBGs4@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.4_rc4
X-PR-Tracked-Commit-Id: a088b092a8962db62327690ae2d0d68827e81229
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1fadec005439186c67ca7be35c4e90727bc38fae
Message-Id: <179538601081.1569696.2850245931010467613.pr-tracker-bot@kernel.org>
Date: Sun, 22 Nov 2026 22:20:10 +0000
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
