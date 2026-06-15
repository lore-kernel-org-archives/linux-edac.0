Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82835262A6;
	Mon, 15 Jun 2026 04:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781496992; cv=none; b=sdnO2aEYUDltEcXq9k/VhCfhoGI4ZT+CMZzNASMRIePRMAfTd6NkTFpQf6EWvkcEXODc4owt2DP6Tc8ye/jNDD9nQiYvzbTLKsHyaMuPNr/mPw7YdwGHqtw5yei2SbVa2JWsuLU4c5SdOtfT9WVkkQkMpRi2YXM/f95ZTNeHjjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781496992; c=relaxed/simple;
	bh=A3BTv3UORtYzTW5XWjTbIT+pzYMnC3VMovEkAHSK6eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kfDP+lJUN4O67CtA31BEPHOPBbrRc6BpWPReOw1FDJq4ic6PlFpv4Cwh0vTC4k6wxcXlse5uctLDZWu57ywwg0G2zhMqwiblHdXHVasXIJZmluUmLbJvtIIsaMyVscvK+oAEGkijXX+87QZrtngLErTjBgRbFZftdW+EqLRR+X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZP3qfxg/ reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZP3qfxg/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 95CDE40E0201;
	Mon, 15 Jun 2026 04:16:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CZw6y2Ekr9-C; Mon, 15 Jun 2026 04:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781496978; bh=taKgo/DzLQlt6VQvHHoanBxMhFwzFVe9rrGJR+7R1CA=;
	h=Date:From:To:Cc:Subject:From;
	b=ZP3qfxg/ZyKDuMYQ/7c7c1HQpH8Elb+B098QMiqhXI/K5IkuqqLKm5NJYF5a3qMJP
	 A6qRtl6wB/zkO+m1bBpJOYUaRTUvgak/vP8amcBJTNzxiem6jI3I9nf+NF++1Od74q
	 3mJqH4kX2kIzFgqjZaHV7JP9ivjmbVH+utBj4jEBfNK6fGjcmeOHaaW7gRzo+aWXfU
	 0bnGjAaTRTgWdbJn0OMDAaVfq1fhOujzBk6xlewEdAoq0yUeUSsz8auD4sZ9WyjOGw
	 gFwSC6b/BxVPmmqoLUXXbyW9Z45g4LR0+2fVZpCElPPSqBPB2RqWA5/1mMYF3iGDFJ
	 uC2c0R8PfFM/jFeSI049piYF626OAA9P3C91Dv5jeR9mO71x39xHJM6BDWGAL7xxmP
	 BiNlLqs0a8FOWUlh1hm1mvWN9KvQ1L29k3yWMeVzbMp/tcdMqNL5+mreID1waBH4Bv
	 CIOr1vCaW3AW/qB1x5to6/UlboUIXc8/f4tSInYwNd/So1uCyeJFd+l3yAkTxaSD6+
	 FciopPpJ7m+fqEgiXrz4nX9GxImLMnLtmvMf2dParInS36DB6OB5wkgSvFydZFNTX4
	 2hMOq4h8W6zOUgibJTPdwT6YoBoCbiGk1hZkAkWYW+5PXV7OPuuzctTmAU9/dc6qUv
	 HjymnsHO809/7kh/XtgKIOzQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0C57140E0177;
	Mon, 15 Jun 2026 04:16:14 +0000 (UTC)
Date: Sun, 14 Jun 2026 21:16:11 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] EDAC updates for v7.2-rc1
Message-ID: <20260615041611.GAai98i1epKOg3M-uP@fat_crate.local>
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

please pull the edac/updates lineup for v7.2-rc1.

Thx.

---

The following changes since commit 5d6919055dec134de3c40167a490f33c74c125=
81:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_upd=
ates_for_v7.2_rc1

for you to fetch changes up to 2556746302b335b3a9b016e315c7a14f272eab12:

  Merge remote-tracking branches 'ras/edac-drivers' and 'ras/edac-misc' i=
nto edac-updates (2026-06-14 18:39:50 -0700)

----------------------------------------------------------------
- Fix a malformed Kconfig default for the AMD Address Translation Library

- Make sure i10nm loads successfully when the ADXL address decoder is abs=
ent
  because former has decoding capabilities too

- Ensure error reporting is cleanly disabled on driver teardown and on fa=
iled
  initialization for several legacy Intel EDAC drivers

- Fix a grammar issue in a diagnostic warning in the Sandy Bridge driver

- Fix a missing resource release callback and incorrect memory topology
  parsing in the igen6 driver, and add support for Intel Panther Lake-H a=
nd
  Nova Lake-H SoCs

- Fix an out-of-bounds shift causing undefined behaviour in the Skylake
  driver

- Consolidate memory controller register access helpers into shared commo=
n
  code across the Intel Skylake, Ice Lake, and Meteor Lake drivers

- Introduce sub-channel awareness and Rank Retry Logic improvements to
  the Intel Skylake and i10nm drivers in preparation for Diamond Rapids
  server support

- Add Rank Retry Logic support for Intel Diamond Rapids server to
  imh_edac

- Make In-Band ECC detection registers configurable per SoC in the igen6
  driver

- Standardize PCI device ID table definitions across all EDAC drivers to
  use named field initializers and standard PCI helper macros

----------------------------------------------------------------
Andy Shevchenko (1):
      RAS/AMD/ATL: Drop malformed default N from Kconfig

Borislav Petkov (AMD) (1):
      Merge remote-tracking branches 'ras/edac-drivers' and 'ras/edac-mis=
c' into edac-updates

Qiuxu Zhuo (13):
      EDAC/igen6: Fix call trace due to missing release()
      EDAC/igen6: Fix memory topology parsing for Panther Lake-H SoCs
      EDAC/igen6: Add one Intel Panther Lake-H SoC support
      EDAC/{skx_common,i10nm,imh}: Move MC register access helpers to skx=
_common
      EDAC/{skx_common,skx,i10nm}: Split skx_set_decode()
      EDAC/{skx_common,i10nm}: Rename rrl_mode to rrl_source_type
      EDAC/{skx_common,i10nm}: Introduce rrl_ctrl_mode
      EDAC/{skx_common,i10nm}: Move RRL handling to common code
      EDAC/skx_common: Add SubChannel support to ADXL decode
      EDAC/{skx_common,i10nm}: Prepare RRL for sub-channel granularity
      EDAC/imh: Add RRL support for Intel Diamond Rapids server
      EDAC/igen6: Make registers for detecting IBECC configurable
      EDAC/igen6: Add Intel Nova Lake-H SoC support

Thorsten Blum (1):
      EDAC/sb_edac: fix grammar in sb_decode_ddr3 warning

Tushar Tibude (4):
      EDAC/i7300: disable error reporting if init fails and refactor help=
er
      EDAC/i5000: disable error reporting at teardown and refactor helper
      EDAC/i5100: disable error reporting at teardown and create helper
      EDAC/i5400: disable error reporting at teardown and refactor helper

Uwe Kleine-K=C3=B6nig (The Capable Hub) (1):
      EDAC: Consistently define pci_device_ids using named initializers

Vasily Khoruzhick (1):
      EDAC/i10nm: Don't fail probing if ADXL is missing

zhoumin (1):
      EDAC/{skx_common,skx}: Fix UBSAN shift-out-of-bounds in skx_get_dim=
m_info

 drivers/edac/amd76x_edac.c  |  16 +-
 drivers/edac/e752x_edac.c   |  28 +--
 drivers/edac/e7xxx_edac.c   |  28 +--
 drivers/edac/edac_mc.h      |   4 +-
 drivers/edac/i10nm_base.c   | 269 +++-----------------
 drivers/edac/i3000_edac.c   |  10 +-
 drivers/edac/i3200_edac.c   |  10 +-
 drivers/edac/i5000_edac.c   |  33 ++-
 drivers/edac/i5100_edac.c   |  26 +-
 drivers/edac/i5400_edac.c   |  33 ++-
 drivers/edac/i7300_edac.c   |  33 ++-
 drivers/edac/i82860_edac.c  |  10 +-
 drivers/edac/i82875p_edac.c |  12 +-
 drivers/edac/i82975x_edac.c |  11 +-
 drivers/edac/ie31200_edac.c |  86 +++----
 drivers/edac/igen6_edac.c   | 586 +++++++++++++++++++++++++++++++++-----=
------
 drivers/edac/imh_base.c     |  81 ++++--
 drivers/edac/sb_edac.c      |   2 +-
 drivers/edac/skx_base.c     |   6 +-
 drivers/edac/skx_common.c   | 297 +++++++++++++++++++++-
 drivers/edac/skx_common.h   |  44 +++-
 drivers/edac/x38_edac.c     |  10 +-
 drivers/ras/amd/atl/Kconfig |   1 -
 include/linux/edac.h        |   3 +
 24 files changed, 1061 insertions(+), 578 deletions(-)


--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
