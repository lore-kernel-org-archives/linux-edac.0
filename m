Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375640;
	b=EfmSa8+nvvMs+4XbZuEcnIjaJB0iILpef+4EJxTFvNWtfjqeWtVZPyVMaA8SwzulWq94
	 AIswNkLGOUH5JvXNMGjtOt9B7JzEeLW7CrwcEU5B3MZmHdur0XagAAHzi2c4+nu8vuLaN
	 nE50G81lRCgV2ZNl7NkTa58gMsz1R8041orWx1woAqH3vS5UawKIQqWsnyg1gB0I/wFDG
	 vQxS+Ds+ciQ1ELmimxCadbkA21MWx5bDOk+IQ1V+T9g2YpMRspL8eU9SaSB7OqJh/RlYj
	 kUIyQr7MF6aXcJoWUJy7Mg75BG/5KRI5Q8GXZxhaHlKXzkSzU6IflR8X57dCA3jVxfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375640;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=4iW5bc3Zo7mEUydqkdNeOPFRcmHj3rsr8mVXqL31LZE=;
	b=1q/JMTKqmgll+YrNApUEasZRuxs7GsoVWlYDFPIel/yjMKJvBHGV0wOF8vKcY5cxnhhZ
	 sYNgHRaWI9LOS+l+k9rOl3TxG1BEMLgl4Fn2HNbBA6ztBvKVTQY8zzKNys6O5FRj/8FJ3
	 hAtKUrVghEBgyNZ2uMMRfuqwd9/NoQ4xUGRUOHc0EjbCtaPFN8lAAyQK7bZ4k+c8KKdpp
	 +w6mCNL7aDG3FR6xAf6ylvBn34qEsRsSNJvxtDC+zhRRI6w53N3Twv4bhJY/z8k2HYZof
	 U8QUCfKnXqlcI5yHW+RQAQfGVVkMERBbLzNShvFZU4q/W+fG+bAGGZ6XvPzOPcqpgag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hUIpuzfQ;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995C7606A31E;
	Sun, 22 Nov 2026 19:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hUIpuzfQ
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5EB9440E01E1;
	Sun, 22 Nov 2026 19:27:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jHTgcmG_SV_s; Sun, 22 Nov 2026 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795375628; bh=4iW5bc3Zo7mEUydqkdNeOPFRcmHj3rsr8mVXqL31LZE=;
	h=Date:From:To:Cc:Subject:From;
	b=hUIpuzfQh69uXhAre7v6tvFR8ZU7S2FaZ5zZf/BmdNwQ9fjg14jlI8Qh12sijXXBD
	 QoD1Vzf6fcGFJxtW11gAUyruVsWJ7WLXbrlKogG17x0vFA80wwYPfxCr1YeenLbxsk
	 i148j1MyuwlbMeOm4hQcbs/cU6Zf5B57Uwj3Hfri7E4dZGwXQKpZAqxulKruNQhWBr
	 px3pT/o3TtLdQAAVcaxTyLtOmQWWgDTUGbGZOztyGjZV6Av4kbw8X70wgp+c5kFYH/
	 V0xy81PqAK4Hmott1YrwpRDpArexWy2a3Vev4XuLPwuV4ugpDtZwXHxaAowSX24NWg
	 xe3791DCgIpHWTcMt1i9D62k21G8VDs/l2SkW8lOoX7UO0HbDqkZtVPs8e7xVYOfi1
	 4jtIodwoS178Cu0KKtHVMA96d/L3kRgjewincJE22RQUoEl24lyybkIaykqgN7ECbO
	 KTr643Qvw2cbHAuK3x1kkf51UvUXVEmVIMMPrrgJJrDzSfyDcvSsGc9Mb4DYi+Gdul
	 Np4jysAZcdp/3GtyE53FLfmpi2/SfjbCVDDC73ylu1PxgElLBX2UvK/QPnXJCk/yQU
	 SMBvrxnoyRn/d9BFla9XA6Bk4gEvRYVuPdChIK1rnul2BMF+2E1vpfkWWL70B7sG+n
	 1jPV64Msxr9OPQQvje704NoE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EB7D940E015B;
	Sun, 22 Nov 2026 19:27:04 +0000 (UTC)
Date: Sun, 22 Nov 2026 11:27:01 -0800
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] EDAC fix for v7.4-rc4
Message-ID: <20261122192701.GAawNCBYMV2pirBGs4@fat_crate.local>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull an EDAC fix for v7.4-rc4.

Thx.

---

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.4_rc4

for you to fetch changes up to a088b092a8962db62327690ae2d0d68827e81229:

  EDAC/i5000: Fix slot number passed to determine_mtr() (2026-11-12 15:16:31 -0800)

----------------------------------------------------------------
- Fix an array out-of-bounds access in i5000_edac

----------------------------------------------------------------
Aristeu Rozanski (1):
      EDAC/i5000: Fix slot number passed to determine_mtr()

 drivers/edac/i5000_edac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
