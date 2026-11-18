Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996399;
	b=JsRxz5mxP9IK+6obYUrmedrZ0uuLDEL+kANFJHHk2UlJGjJcF5NdT/XFN/WZL5CQaI8q
	 pukt/9uJE/4fJ3h+nb0UYDf1YqdlZfeWD91usUs0iJKJcI5qXZ6z9hNTNlelWstNhoZMD
	 cbpiYIZKEpFKqZGHgNTxlPDBrS1xYYin/+FY/Yy4t88tHsY3HatG1g2V5CQXO4BhMno6D
	 M3Sz79yEofDE1Fo/S4gC5Hq5ytAn2k3WhQhgKqTn9Z5+g8B13kn7PDAO+72leo1jCGtnF
	 0pJntu2rvjJ3StiTMpgab6HpqI2ejGVzcxoOsdaOMaHGf6sFCJetSuieZaBMU3iAf5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996399;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=qCmOmJpcC2FGP3cCy+7KhCGTxbbsxggJFbMLpjMC52c=;
	b=tqCS67LhKTRkS4kljmGFFTL0HMn6R1OEJnbrQtrmTNzTe/U078nG3Trsi1lgvJrV8n/H
	 gEpN03cqf4MJjbugnjeFVwmlB2n5sM42I39kofs6cmkT5tdBrGb834r0i6ckJ2Jo4YfZM
	 r4PEOTqNZjIIRTI2c+GNmDG1+fKLAbCM1MJzvVmGqf+atKygmF6P1NXIJPDDW3uvWV7Vw
	 DKKCISxkIdIgupp/ySm3bAtpuqU23wqeByLjZEw2urcxOBe8+DAZ3VDebLIbryMeNjwBU
	 QpIvTVZWIu/GHgGT89my+QFNPsglEhWNnfDQbJDP+uRN6/SidgtoFpLdwgadslEPJ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RARPlkwl;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE6E606A320;
	Wed, 18 Nov 2026 10:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE6E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RARPlkwl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A2364C4CBD9;
	Wed, 18 Nov 2026 10:06:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D98125FE9B;
	Wed, 18 Nov 2026 10:06:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DED9E11BC0D79;
	Wed, 18 Nov 2026 11:06:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794996395; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qCmOmJpcC2FGP3cCy+7KhCGTxbbsxggJFbMLpjMC52c=;
	b=RARPlkwlHYcyuTl1CrJ/7/xqQQvmKVGcXSnJ2p7sgnEV3yFjfs2/YEZSKBkbt3X6eJsN4+
	Y4wtG8SCnCJ6vjdmdcs9J4Sq5D8gicVIh7W77KSsTp4qe6mdQVux52vLtjOHieqPbv/Y5N
	MWc1f3ADc2CmBCs/Rilutm04MGWpiiwuLOcFCy16/f8KkJWJnkAXI2cWj1bJ8zAPp08hXq
	NAmmQ312jnq3J8PhTMzcr1ENQ3SykZfSVsgWH5bpPcf0XVR9gUO8iowKEy5N3lTxxzGkZh
	sy5n8sSHztOZ8dqAPRBaH0qm6nJIfJM26yVgm9LAINUGsD8fWEFtKL4799ofpQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v8 0/3] Add Renesas RZ/N1x EDAC driver
Date: Wed, 18 Nov 2026 11:05:56 +0100
Message-Id: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQ3UoDMRAF4Fcpe21kJv/rle8hXiSTxEa0W3bbR
 Sl9d5MWZMtGoZcDc745zKmb4pjj1D1tTt0Y5zzlYVcG+7DpaOt2b5HlUOaOA9fQo2Z7d/xgs2G
 CjYQsBkcMkzR96nUiZboS3I8x5a8L+vJ6naejf490qFLd2ObpMIzfl6sz1r1/D8zIgAUQ2lpuB
 ffu2Q/D4SPvHmn4rN41zOWfYQM+CkMSHdqbcO0382UD00R4QZJSFkFggBTvalDDnlCCRo2RaN1
 ALBpw0UREQZQVaMkJ6Z24q0EN+2BBSac8Wlg3kMsGtonIgkgtdSEMOerXiPpFEEA1EVWQ8gkHC
 bn01GiiFwi2f6ELwhMGnXgyMvg1YpZI30RMQawko0kHo3p1i5zP5x8yOxFJHQMAAA==
X-Change-ID: 20260916-paul-v7-3-rc1-edac-1f479f96fc57
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794996390; l=5317;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=GIpYZo0Crxj1Ka1uH8kyoppsBd0qzhQ1vSLadZTSV8U=;
 b=G8gT64nEIQ9OEyliec5pq6cbKRwkBmtavblq9NAqmP9Nqv02d1OS4zC+GFtgNldCmeNghM//l
 g4kHYw0ZoNjAjX1aaXC9tXR1NjFzHy4v7gJfJgE8gYGHZ4z/4gMLkwP
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The Cadence memory controller found on Renesas RZ/N1x SoCs supports ECC
with SECDED.

The memory controller found on the r9a06g032 supports at most a single
DIMM of DDR2/3, up to 2GB.

Add the EDAC driver for this memory controller, and the relevant
device-tree binding. Also add the EDAC node to the existing r9a06g032
SoC base device-tree.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
Changes in v8:
- After discussion with Wolfram and Geert, the driver have no reason to
  be disabled by default. Remove the status property in patch #3.
- Reparent on next-20261116.
- Link to v7: https://patch.msgid.link/20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com

Changes in v7:
- Patch 2: fixed weird formatting of cdns_ddr_ctrl_of_match.
- Patch 3: did not sync trailers added in v5. Added Reviewed-By of Rob Herring.
- Link to v6: https://patch.msgid.link/20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com

Changes in v6:

- Patch 2:

  - Sorted the includes alphabetically. I have also ran a check with
    IWYU and, after careful checking, there is no superfluous header.

  - cdns_get_mem_sz() helper inlined into cnds_setup_mc().

  - Debugfs helpers built unconditionally with no-op stubs if debugfs is
    not selected.

  - Port command channel error reporting removed since it does not
    belong to an EDAC driver.

  - Removed useless comments.

  - Renamed macro prefix to CDNS_* instead of CDNS_DDR_*. Also indented
    all the macros definition at the same level.

  - Dropped cnds_ prefix to the private structure.

  - Shortened interrupt unmasking into a single macro to shorten line
    column length.

  - OR'ing flags to detect type of errors in irq handler.

- Link to v5: https://patch.msgid.link/20261005-paul-v7-3-rc1-edac-v5-0-140a0f124bc0@bootlin.com

Changes in v5:

- Patch 1:

    - Reworded commit title.

    - Dropped unused label.

    - Switch to plain flow scalar for description.

    Note: keeping cdns,ddr-edac compatible after Krzysztof's comment.

- Patch 2:

    - Setup IRQ after allocating and registering the device to EDAC
      core.

    - Explicitly free the interrupt line with devm_free_irq() to avoid
      any UAF before releasing MC.

- Link to v4: https://patch.msgid.link/20260928-paul-v7-3-rc1-edac-v4-0-4646a5b7cac9@bootlin.com

Changes in v4:
- Patch 1 and 3: drop the RZN1 family compatible, as requested by Geert.
- Patch 2:

    - Instead of using FIELD_MODIFY macro that expect a compile-time
      constant mask, use binary operators instead. Note that the new
      code is doing exactly what FIELD_MODIFY do, minus the error if
      cdns_rmw() is not inlined.

    - Use a spinlock instead of mutex since the locked region will be
      really fast to execute. Only lock it once for two register rmw.

    - Use edac_debugfs_* facility instead of sysfs attributes. Use a
      separate "bits" and "inject" file instead of just a single file.
      This is better since clients can read the previously set syndrome.

    - Cleaned up the probe function in separate functions. Use a remove
      function instead of registering custom devm action. Use a goto for
      resources cleaning.

    - Mask all interrupts before un-registering the memory controller.

- Link to v3: https://patch.msgid.link/20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com

Changes in v3:
- Patch 2:

    - Added trailing newline to end message.

    - Forgot mutex_init() in probe...

    - Registering the MC at the end of the probe.

- Link to v2: https://patch.msgid.link/20260924-paul-v7-3-rc1-edac-v2-0-bc1406161ecc@bootlin.com

Changes in v2:
- Patch 2:

    - FIELD_MODIFY() is always called with a compile-time constant mask
      in this driver. I see no problem here.

    - Use devm_clk_get_enabled() so the driver does not need to store
      struct clk_bulk_data outside the stack space.
      Clocks are not manipulated outside of probe.

    - Introduced a mutex for rmw operations in inject_ctrl_store() sysfs
      callback. Rename drv to priv in cdns_rmw().

    - Return IRQ_NONE if the stat int register is empty.

    - I see no reason to follow Sashiko last remark on this patch.
      Is an unhandled interrupt a big deal in this case ?

- Link to v1: https://patch.msgid.link/20260924-paul-v7-3-rc1-edac-v1-0-70be37c41a18@bootlin.com

---
Paul Louvel (3):
      dt-bindings: edac: cdns,ddr-edac: add Cadence DDR EDAC
      EDAC/cadence: Add Cadence DDR EDAC driver
      ARM: dts: renesas: r9a06g032: add EDAC node

 .../devicetree/bindings/edac/cdns,ddr-edac.yaml    |  61 ++++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   8 +
 drivers/edac/Kconfig                               |  10 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/cadence_edac.c                        | 379 +++++++++++++++++++++
 6 files changed, 466 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20260916-paul-v7-3-rc1-edac-1f479f96fc57

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

