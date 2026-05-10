Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE933322A2E;
	Sun, 10 May 2026 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778439941; cv=none; b=DYpInOK6KuzBt0qXJIiU6+zpQgh0UmCN0qYWGc+CtUm9c40FGkM2KY4P0fDRJMbA6N0/xbzWXBXjGlOCQtSlhGwLyeYXLSjm4uR1zeHhZDypGYs6zU5rPw2wI7Qatqz+ED8V8EVthP5RLYl+SwoVYnUqi9SPc7mxvHjMQbIy00c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778439941; c=relaxed/simple;
	bh=8orUSA8LG3c6NbQ9jPukDGjbuNMRXyRxfK0TpSojKJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BvfK1Bs//K6KdzrvertBX9kTN7kt6KYIeD8VTCe3PR4i1fBJYjGmUaGmh/Ga1HkPpTjuijktK/T5LVdRNkIxuaPYhRl/wnFCEARtFMOPrdhYpL4AS220x6EhR5a2FYts+kuseVFauSQeAzKoARYc60tJRn76Yzbob/QRBNbOOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Aap/6xdE; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Aap/6xdE"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6FFB940E019B;
	Sun, 10 May 2026 19:05:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 61HG4v60EWVj; Sun, 10 May 2026 19:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778439918; bh=Dz4AZoqHEASPluPeGND+MmEv7feHGB928U7R5TH3bhY=;
	h=Date:From:To:Cc:Subject:From;
	b=Aap/6xdEMVCn9Mn6xoPHDC4g21Rt4HnkSBCT0WjAdj+6BefzHZyCBVQqQReatCpQj
	 +TD3rPnn811w6gltMwo1MUpDHb2OF2rZ2vf3dvF+b2mDqoWg8I/QjCnxzYOgkwWbl9
	 gbW0KLOePf4RoGlWxieYAaZnzps5dfbFktpKM1wQb/gdnKKeDhmYONdVlo9j55UdEa
	 G9WX5BleYpqxA7eNJXBPcdmoG5fmfmuANYe/JFPoSKOI45Dc1RQfmPSoi/jwVb3fBL
	 tGZbhrDPAZ83nRhg+hfdCKuUBOhhpZ9wmt/7Lg+s1UJio9NlTzrjlwgmTugm0eybCh
	 QvXOu1zqCDkwUgQuKdjL6V7EGHTddPznShSLPFZjcwOe5jiAQpqghlZBP1HvYeiWWO
	 gxiMNv8aeG3fowaVR12pTZjBd5qHBK5mxh8GyqgDpV/xIw12UpfnV6FBRa9gIli5M+
	 raaiCZIEH0Y1amOSqaGMIuLnXwZWNRTW+uU0Fk7aSO98KEgbDQRR1WfYJbQs9xr0SC
	 jnDKLLZs9nUqag0YiUKhoU4dqUVeQ7AGUtDH7+luxSU37xUQs8Y5nmGlcUNiRWkC8/
	 KJaPTVol9JVAqOqs1w8F7tKXcsbnknwt29xl2dJITOHrWYU7P/eKmCb6nXK2L05b3y
	 B/T5M8bZTu8bCrl+A+fiC1Bs=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 6B05A40E0032;
	Sun, 10 May 2026 19:05:15 +0000 (UTC)
Date: Sun, 10 May 2026 21:05:05 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] EDAC urgent for v7.1-rc3
Message-ID: <20260510190505.GAagDW4XaK0a9H2Iur@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull an urgent EDAC fix for v7.1-rc3.

Thx.

---

The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:

  Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.1_rc3

for you to fetch changes up to 8cf5dd235eff6008cb04c3d8064d2acfa90616f1:

  EDAC/versalnet: Fix device name memory leak (2026-05-05 14:49:48 +0200)

----------------------------------------------------------------
- Fix a string leak in the versalnet driver

----------------------------------------------------------------
Prasanna Kumar T S M (1):
      EDAC/versalnet: Fix device name memory leak

 drivers/edac/versalnet_edac.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
