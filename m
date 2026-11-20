Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190977;
	b=HUH8D8iqSIV4XS4eJyTr+qiqpqs+ZQsoChK6ZHG1PX7o9tEOBsDFXIlIEElrWZ6XM620
	 wOm9Z0PjTTT6D6B7O4SWOMEeEGR2roo8Wto0I2HoWJ/v4id5BBVVKyVPGFRKtdEGfV7Xv
	 MnhSDvDEcpTOxvZPdICuRotq66AeF3CsAS3w7bHl9RhQlr30T95TdMoODMexHeExKyTAx
	 oMKbEmuCWr9njxo7ZNnNP4JD7o42TOb9+oqCvZ9C9je6ccggfEoPa6MQkcHaO+eXYNPLY
	 VIVSTSu5l1ZuHLd20kUJs2NWwBo/7b5HDE+zD3RmXWXOCgCJ9ZIJyLUEUcBWI/DXv9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190977;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=Xmipbk9WhItkGxFmzEm9CsocJ9ro6pGU2fPE0kUBKa0=;
	b=pBXQeFP4L7DESgCVBPzeW0rrNc14jHmxORGWAWQdus8KYASlWT7nZZVNaJnOLlQNwCb4
	 x/D57bEgDuQkYipk1BN9cz2hh7JUeRerje2l9x6u6nBIB9IRb7i75fwYfkOQeByvAGGXN
	 Nd8UiBqiLh4LDss4Jg0NzFe+6En0SwzlXukoRMEKdSZmUm7ZMDQ4+10+wng76eq5zwYvA
	 cLMvF7WuWB0cv2kfP3i+8ykauzHhX+3nQLFxzIcshSUjGPYWhUO1fIgCt+oBVZ8Spk4og
	 IJhNoLFLPN4KtNiCcXVA5X+ox138hR9oFoXTPDi/LSVJlwYnjitJMzVBXIZIlw5IelQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0qO5DRWN;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F7B606A330
	for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 16:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F7B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0qO5DRWN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 661694E4168A;
	Fri, 20 Nov 2026 16:09:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 327A5601B9;
	Fri, 20 Nov 2026 16:09:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF57D11BC0427;
	Fri, 20 Nov 2026 17:09:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795190973; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Xmipbk9WhItkGxFmzEm9CsocJ9ro6pGU2fPE0kUBKa0=;
	b=0qO5DRWNv+I7+9PRk5NFdkoPKU7SRxTy5k+PmULzH/HAMG87qqD2qznOddNWhW/DRNc1ZD
	J6oNlb85aOamCNmygft9T152zw63uH5iTq/ZnxcvRQR9DEbVq2Yq0AbWlwysNiiXzxXvcv
	H306YIfdvo4GZDB/u/T/a5WQxROq7PovQZZsXiiXaSfyjKtvr00YX5GygvUy8PF5zySabs
	ofa2egRsTjiIIJH2MzzR6kC1gcQ0OHGK1zGBEGUUTtipnWfOrGTF7zdGJyu082n3/UF5+B
	prfjpX1XJtWv5wvu6BDqTxi9QT8P0NFUFHribyypz4e1qqrehMNzHpBYpIAceg==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v9 0/3] Add Renesas RZ/N1x EDAC driver
Date: Fri, 20 Nov 2026 17:08:33 +0100
Message-Id: <20261120-paul-v7-3-rc1-edac-v9-0-470f2e6928cd@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQTU7DMBAF4KtUWWPk8b9ZcQ/Ewh7b1KgkVdJGo
 Kp3x24lCMQgdTnSvG+e5tRNccxx6h42p26Mc57y0JfB3m063Lr+JZIcytwxyhS1oMjeHXdk1oS
 TEYHE4JBAEtomqxJK3ZXgfowpv1/Qp+frPB39a8RDlerGNk+HYfy4XJ2h7v17YAZCSaBcGcMMZ
 949+mE47HJ/j8Nb9a5hJv4Ma+oj1yjAgfkRrv1mtmygmwgrSJLSAOUQaIo3NahhjyCoAgURcd2
 ALxow3kR4QaThYNBx4R2/qUEN+2CoFE56MHTdQCwbmCYiCiKUUIXQ6NCuEfmFAKWyiciClE84m
 oAJj40maoFA+xeqICxBUIklLYJfI3qJ2CaiC2IEaoUqaGnlGjHfCED7J6YgMWgLtFAIv35yPp8
 /AR28KfFiAwAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795190968; l=5858;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=lXShCtRrRQORgaC8Ec28afXh7zpzUXfdlez4O8xlzho=;
 b=5K34wTAR9hCYhk78qSlmlQhRz7GN0Y2EsJhZ3AWac/al4qZnmZ1C9Ctb7O3VuVT1KDUtFgGtN
 N8QHqt+m5wpBCp301ZmC1nt+79QqYkI8S0HeBZssXKIZocnyowgyaUg
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
Changes in v9:
- Software scrubbing was failing because the pfn returned by the driver
  was wrong. Instead, use the pfn of the start memory address where DRAM
  is mapped as a base, and add the pfn of the address that the DDR
  controller is reporting.
- Do not report EDAC_SECDEC capability on the DIMM if ECC is disabled,
  also do not expose debugfs attributes.
- Remove 'edac' label on RZN1D DTSI.
- Link to v8: https://patch.msgid.link/20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com

Changes in v8:
- After discussion with Wolfram and Geert, the driver have no reason to
  be disabled by default. Remove the status property in patch #3.
- Added Reviewed-By trailer.
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
 drivers/edac/cadence_edac.c                        | 388 +++++++++++++++++++++
 6 files changed, 475 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20260916-paul-v7-3-rc1-edac-1f479f96fc57

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

