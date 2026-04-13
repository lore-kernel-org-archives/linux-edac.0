Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03943806B0;
	Mon, 13 Apr 2026 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075547; cv=none; b=OaDUdcC+xAAY4ReLSuZI/Dm8OlQlKP6tAxd0xA11u21Zp89l1QAfrtR7jf5I4xZIKCNfiv2TQ1aZRyhEbz4T7urZ1cRx2ZT9z97MO45wuxI35yO4X/P8RLb7YMBK8Q17GM4Xw8jfn0BsRbNGL+qZKy4L/Ucas50cuMbetJ3jryc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075547; c=relaxed/simple;
	bh=pm969MwtUKOM46CRDfSyqLwWYzrqLEIiOTO28E1a0NM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o0TP6zoMnvYeFr7tYXo4xJfXA4isPMgYs4fbyUDZFdGPawAcri2EBVSYhLTgoW1vz+M/6PmKZ8yj/huxLyTx8/fOtrHgISWtwncqgkQb4ix6WYPR10k5kPa03LNl+3D/a3tA1bPKuRL9jSvRFZpZaqZJclxypqP+NMlVcnQTUFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=aWNxXK6T reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="aWNxXK6T"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5763640E015C;
	Mon, 13 Apr 2026 10:19:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nkZtC9OVUx6S; Mon, 13 Apr 2026 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1776075537; bh=wKfITSF6AR9zy+yXLKfacrgVN/u+AcXQ00/j/EAgEpI=;
	h=Date:From:To:Cc:Subject:From;
	b=aWNxXK6TWVxBvmHVlrJD4KJNREdej/DgNc1Lkez868vb54Nm/ySerB1Dgph1FKoQF
	 64ivsTq86qwajnMy1w+d4j9hBo1d8Vb66Iq5eVg0P/imTt90TCHnKc+wZxBNVrhAst
	 DoRtq+GjVZL6YdNT7wVBCP1KKC1ynJoz23kPWSfm9GaLGc381WXx+Un0DidJqJGpvt
	 4RYszMgjTUR++woSoYD6XmdvdBdepSrSeGE1KQSEsK+nIJA0yxUhtdbyYvWz5IaTqm
	 /3qeBkfGlBXx9rrTwKD/uz9FMzR2tWn06kd4l8v81Ts+V0mkEHkftKeK2HsVSM5qgB
	 xaluZXAWswkJmaiomIu9xI8UP9NNDjUUzvsPOyr9nQW61CsyE0yguBKljIviq7oUaS
	 gnax6hfLpkVTNQ0d+b9JKfpv83wicvIlUlQNlnQT8Kf2Ly+C98SjFs3g/xdzVsN5YW
	 ta4eJc9yBSB/1d0lmolvMTAHsFOjUPGxvDF4ZvFeJxYc4M3xfxLiJ6DC0bFjvmEHHv
	 HYZWMwmSE6XwgIOl3ONwfBIbt1v7nGkTpy4h+EhbBJKg+8ffFF/ltTjGcO9pScRKoV
	 ASd/n9YJ9Z9ALcmO9z4BS5P+TqvNoVikfU8aCrTTujVRRVUjndfL5PJr1SaMRMmWst
	 KNrMpAFbcQFDwVkOA7GFKvaE=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id CB5FB40E014C;
	Mon, 13 Apr 2026 10:18:54 +0000 (UTC)
Date: Mon, 13 Apr 2026 12:18:46 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] EDAC updates for v7.1-rc1
Message-ID: <20260413101846.GAadzDBgcGq09VOfpH@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

please pull the EDAC lineup for v7.1-rc1.

Thx.

---

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags=
/edac_updates_for_v7.1_rc1

for you to fetch changes up to 4db9a9841dc1060e8805a4c40bdd7e6058d45100:

  Merge remote-tracking branches 'ras/edac-misc' and 'ras/edac-drivers' i=
nto edac-updates (2026-04-13 11:43:52 +0200)

----------------------------------------------------------------
- amd64_edac: Add support for AMD Zen 3 (family 19h, models 40h=E2=80=934=
fh)

- i10nm: Add GNR error information decoder support as an alternative to t=
he
  firmware decoder

=E2=80=94 versalnet: Restructure the init/teardown logic for correct and =
more readable
  error handling. Also, fix two memory leaks and a resource leak

=E2=80=94 Convert several internal structs to use bounded flex arrays, en=
abling the
  kernel's runtime checker to catch out-of-bounds memory accesses

- Mark various sysfs attribute tables read-only, preventing accidental
  modification at runtime

- The usual fixes and cleanups across the subsystem

----------------------------------------------------------------
Borislav Petkov (AMD) (1):
      Merge remote-tracking branches 'ras/edac-misc' and 'ras/edac-driver=
s' into edac-updates

Colin Ian King (1):
      EDAC/i10nm: Fix spelling mistake "readd" -> "read"

Devang Vyas (1):
      EDAC/amd64: Add support for family 19h, models 40h-4fh

Felix Gu (1):
      EDAC/versalnet: Fix device_node leak in mc_probe()

Marilene Andrade Garcia (1):
      EDAC/ie31200: Make rpl_s_cfg static

Prasanna Kumar T S M (1):
      EDAC/versalnet: Fix memory leak in remove and probe error paths

Qiuxu Zhuo (1):
      EDAC/i10nm: Add driver decoder for Granite Rapids server

Rosen Penev (3):
      EDAC/i7core: Use kzalloc_flex()
      EDAC/sb: Use kzalloc_flex()
      EDAC/mc: Use kzalloc_flex()

Shubhrajyoti Datta (1):
      EDAC/versalnet: Refactor memory controller initialization and clean=
up

Thomas Wei=C3=9Fschuh (7):
      EDAC/altera: Drop unused field eccmgr_sysfs_attr
      EDAC/device: Drop unused macro to_edacdev_attr()
      EDAC/device: Drop unnecessary and dangerous casts of attributes
      EDAC/device: Constify info sysfs attributes
      EDAC/pci_sysfs: Constify instance sysfs attributes
      EDAC/device: Allow addition of const sysfs attributes
      EDAC/mpc85xx: Constify device sysfs attributes

 drivers/edac/altera_edac.h       |   1 -
 drivers/edac/amd64_edac.c        |   3 +
 drivers/edac/edac_device.h       |   2 +-
 drivers/edac/edac_device_sysfs.c |  24 +++---
 drivers/edac/edac_mc.c           |  10 +--
 drivers/edac/edac_pci_sysfs.c    |  10 +--
 drivers/edac/i10nm_base.c        |  16 +++-
 drivers/edac/i7core_edac.c       |  15 +---
 drivers/edac/ie31200_edac.c      |   2 +-
 drivers/edac/mpc85xx_edac.c      |   2 +-
 drivers/edac/sb_edac.c           |  14 +--
 drivers/edac/versalnet_edac.c    | 180 ++++++++++++++++++++++-----------=
------
 include/linux/edac.h             |  23 ++---
 13 files changed, 159 insertions(+), 143 deletions(-)


--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
