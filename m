Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2299244A3E7;
	Thu, 24 Sep 2026 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257297; cv=none; b=R+2UIDGySX5KBpyXhGlrDQ8goguZm0Opc32s9EAkxpUvv7vp+ywNb/VTC6+vDucLylSXn0CGMjCJg5NqM+KMwJGXVsgiGyGxHQNamA1M2a1dCKfsuRAqDZ9GnNlUjFwRZU4ow9AlZmgWCmsS4bJ8HzSFX4xj29c4spzHAeJl/1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257297; c=relaxed/simple;
	bh=8zh02XNQ4PUI6L+rLrZSvtxWO83ptM92jRD5eDbm664=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l8LVJIVga4l12uBFfcUpi63kaBOl5hzRpiDCeE+dTewhQNjnTF6JK9JWO3IHyGTUD9X/MCcII2yMyPhEuFMD5LW9SqFqZiCdSjtVFTDdAbiNCW+xGuAKNaALGx6giBWWhT9h7qJIEHNoSWMz8657XMM48EtaH8Bp/h8Jiu5iVTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j1i6eJeY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j1i6eJeY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1677B4E4105C;
	Thu, 24 Sep 2026 13:41:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC42460341;
	Thu, 24 Sep 2026 13:41:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFE7E10329463;
	Thu, 24 Sep 2026 15:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790257286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Ch92e3hEttXXooccR2hMmFOuo1Nmh6/hlPu3FMHi23c=;
	b=j1i6eJeYFUddqLiKRkSTodQICv0xe6Qxl53ysmTTHz6fjc1dtU1CiK/ylk6cTggzFzWaDE
	lEXjVrSIercwPlD0zocQysxi6usVGrsxWYL9g5VQlVNlM6DE2IZNtLO9Dywaz0HR2GvNB8
	9KD5D7UbvZWad5YCPeE7iul7I5vSH/kzYfX8C13YgbdBWVVa4fEhB5dsOLk6O6nT1J7pEA
	/GeQejQW+mhcQfK6DnTjpwg0188ajWUztJ/ZB9ldjhXbSKN8IqwPgwFQImn/O6BvhQFgNy
	2m+6y1UemqbhSKinCxVSimKzDMvg2mkkLGpkY7+wvLhEd/sE5vi6uGcRxhtEAQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v2 0/3] Add Renesas RZ/N1x EDAC driver
Date: Thu, 24 Sep 2026 15:41:11 +0200
Message-Id: <20260924-paul-v7-3-rc1-edac-v2-0-bc1406161ecc@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OQW7DIBAF0KtErEvFMLbBWfUeVRaAh4YqNRE4K
 FXkuxeSTaKmXX5p/vtzYZlSoMy2mwtLVEIOca5BvmyY25v5g3iYamZSyEGMMPCjOR14URx5csB
 pMo6D79Tox8G7XrFaPCby4XxF33e3nE/2k9zSpHaxD3mJ6fu6WqDd/TtQgAs+CRy0lhqlNW82x
 uUQ5lcXv5p3K8vuz7ISllC5Dgzoh3L7r8j7D9RTRFbE970GgTAJT78RvEMkPkWwIr1G0M5gZw0
 +Iuu6/gBqDZFLjwEAAA==
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
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790257282; l=2017;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=8zh02XNQ4PUI6L+rLrZSvtxWO83ptM92jRD5eDbm664=;
 b=vetIiZs/Yzpddi9T/P40k2juShavb3kDRiv0zf0ssyDRUzSPLabyzdH78PWCSJDFtmlkgxe4b
 nyolWzWDekiDyoGV9YitI8q5V7EG7colccH3K0wB4RnUAzDSJX8JzW8
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
      dt-bindings: edac: cdns,ddr-edac: add Cadence DDR EDAC binding
      EDAC/cadence: Add Cadence DDR EDAC driver
      ARM: dts: renesas: r9a06g032: add EDAC node

 .../devicetree/bindings/edac/cdns,ddr-edac.yaml    |  62 ++++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  10 +
 drivers/edac/Kconfig                               |  10 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/cadence_edac.c                        | 340 +++++++++++++++++++++
 6 files changed, 430 insertions(+)
---
base-commit: d9f39b2c0579f313d14954a9ec584511c543aab5
change-id: 20260916-paul-v7-3-rc1-edac-1f479f96fc57

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

