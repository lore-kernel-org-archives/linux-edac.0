Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B95A2D7398;
	Sun, 12 Apr 2026 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776018968; cv=none; b=bNAmzTKSRqbgwxW0bzHSI5fbjUZIE6syhKoRzYzrfKADmLoxemD4fhQQL8YbxVpK6SB2K1uqypjAADbxAwbRxEuHJPR0AIbOagcFOfFlLEPp8fbdkyJmus2/CQKTGhYk6rjAFRI4jiuutg00Lz1rxLU4DOMrA4PTKiGcDmotg3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776018968; c=relaxed/simple;
	bh=Lj+dTWlVw7XWYS5WsNAJX9OfVERnfFTOPtUzS5auPtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQadUH3AU3EaTpbLHNw0rwAToKgFJF9UGdBzhkLm5lWIro/QwPQlYEP68HZ/YvwQEOtc8ZGMyPxL5lxerZCKYS3HmzvqMg6B9decIAMdEI4gMKvQXX5ikZzooZfcnipvMS7RpFmyLLtoF2dznLtv6TrKm3d1aPi3VvxUz9Zad8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gHrByKRc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gHrByKRc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9A00240E0173;
	Sun, 12 Apr 2026 18:35:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nnHL9pzbSs1p; Sun, 12 Apr 2026 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1776018950; bh=wbOo9lhYA3OA4U4MqTOHSQk+srCJ+FfJYZSUulaZgy0=;
	h=Date:From:To:Cc:Subject:From;
	b=gHrByKRcN7ev0e+T4IixdjOuCskSljb7XegFZos7jDVzwu27tnPCYRa0wir5VeLus
	 12rmQWOyMMzNc8fUUPTHexlnjywmrQ9A94OxSYmr/HGK2O7L0hU0wRqT/kdWz84l9e
	 oZ1CJgWsH+LXLx0ey12CElXvYq5ki5ypBxNo11xQ5LwbfiRdJkSGknRWfupEldtqxM
	 8nnrNgoJnezueh5jrSlgySbeP0/SUhdFmMo9d9cakd6DbahtCwghbJoBtzk9OnIlrL
	 01ZbeNMt6yEGylM4XTl/r82v1KYnHLKdsmp78txzAvGZFMLBvVsvWt2Yh/fNfeg7gd
	 1K7768i+M5MCdI8/QvdBypi283EWUyqzCrYJ/6hcaRpLmMxiKf/EyWs2mcl2AMdCEw
	 jZU0aHCznrJc3crTfvBi7yUyDBqMoiyiMIbfy12hQAWp/WRPvFJuj/0NJl8dqrQj3K
	 LCTMr/2KgFQdcuz6uOyGr15qqWz2aaIuF7N9RL9JLeESM0jUpMxDVEjq6oCZOpVwI6
	 O+P9TkkybpL5MSkFvKEvZ3OSlXQGz9B7JOw1LJhlCCTZP2n+nRncMdQLz+mAK0QY1N
	 u1WG7lXq366edT9ipvJtDtzyPWfE/Svyw1Tjr+v2AVNCjXsV0SMfc1SsNb0uxz8Ie1
	 6peEzozL+wVcutoQxio3Cj0c=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 758EE40E0031;
	Sun, 12 Apr 2026 18:35:47 +0000 (UTC)
Date: Sun, 12 Apr 2026 20:35:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] EDAC urgent fix for 7.0
Message-ID: <20260412183540.GAadvl_C1Y6YaQlxwp@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull an EDAC urgent fix for 7.0.

Thx.

---

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_7.0

for you to fetch changes up to 51520e03e70d6c73e33ee7cbe0319767d05764fe:

  EDAC/mc: Fix error path ordering in edac_mc_alloc() (2026-04-05 17:49:19 +0200)

----------------------------------------------------------------
- Fix the error path ordering when the driver-private descriptor
  allocation fails

----------------------------------------------------------------
Borislav Petkov (AMD) (1):
      EDAC/mc: Fix error path ordering in edac_mc_alloc()

 drivers/edac/edac_mc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
