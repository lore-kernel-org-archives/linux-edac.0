Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015196;
	b=fxqtSHJ4yy09JheMi8fnV+wnWm5HmTPk2yriwjno8F6XPHmIVtGe30jKBneM1Fh+bu3a
	 JAv7OngA0BlqxyQDFpOArjQvGHiN3rsJchct1+sDqs7yiAuY8aeflZ795kHS2nBSn33DU
	 xqwMdxv9c+pQohpyHwm3TPwqKi7mxhoYJOvC0U9KdEHAdj5bYUDou0wobwPTxMmV8+uWR
	 urgk73HiAbqpQnkfB0VR9rSpZ9KUq1y2ia6M59dK5KG+oBgfblJhLJh5nWmyMq76zoeOR
	 ZsaLPQfDNx2V/DAxhvYrK94TxQMzy0etCtiM9KZ/5duSrFZ2CRmGpCuHacc3A73LfEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3q3WBayPBlbewt1E1eNRkQsJMusptNxG4L6m1LCm1Ic=;
	b=sajPYDN/PRwiIUn9b0SLwSFNl1SMQgfOfCZlzVkk6B8Kn61qTM0kROJykANOtQ2sw+/Q
	 QTk1ed4gqAOl2Wj0ClzIcEcCxXumt9HOXWSm8NT1QsAjaEqJIFaTfHovGWIqvkrz/msca
	 OUVtAj2tz52JLm8BvKG47hypqyQcsm5d8J4spchBRSwVcRPQFpbqMWPJyw1LqUF60j2In
	 ZbJg7FbobWtVcVd0bMB4dxn3Yt/J+QirVG00p9oNiKHJJ+8+FkvjbyJtpy3mnGzwRVyWs
	 Q523YWzVM4yv/uNld1HL9JJ0guWCAPGNiHvwvUtg/0Xe7qes/Tp6DsGdmSGYE37dB+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zs7LmXjb;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD80606A32C
	for <linux-edac@vger.kernel.org>; Wed, 18 Nov 2026 15:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD80606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zs7LmXjb
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb684859cbso754608a12.1
        for <linux-edac@vger.kernel.org>; Wed, 18 Nov 2026 07:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015195; x=1795619995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3q3WBayPBlbewt1E1eNRkQsJMusptNxG4L6m1LCm1Ic=;
        b=zs7LmXjbJJyrhsOYi1q0qRCWWCdJwIcDe+eiKHneA78MjWz0VV07ZhMOj9t7QNlM4X
         2QAufcprS1mvpQrZ/7E16kUFUO9P+fodQeCb3QukEpyIagjsQgcBxX2R4NqhKsvawslP
         iQ3qAdPlDmFd1abX7L8ICL25D1/T7LOgB8MM7ItYM9ciKr2b2x+mFITTSQmMFLB0mU2X
         gGhV1xd9VDUFf2MJzQWEFeyhktJPrq35+b3bSAg4UQ9ltXg72FxQu/Vm3412oHMm2Tx9
         Z6XiYfxc0uko53KcWTrAOPfsTKFwKnRSAL0o6pQYJ3HV72WN8CAAERULYXJ847Q1/maK
         HHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015195; x=1795619995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3q3WBayPBlbewt1E1eNRkQsJMusptNxG4L6m1LCm1Ic=;
        b=auki8k2wLihaR2vPFBT/99bA0guTAFwM96VIAHnFqB87foNwmcL2mOzII4om/S5l+2
         3eSdg/0FVdhSIvly/fWRD2HuFpSA0SxK3qm5Zew+MLRgfZcPKPXqpF30UoAb5jamQAjg
         7lfP0Y38G1Z/RGtL3fdgzsIF50FAJF3Ae68zMo7zv7yjtW3ecaLh8KYsRqdmtEZEH/Jh
         tmoL2yuF5w5JKwZDp1wCP6AQq4RaMB77mdEfzYoK1keByPMd/JTttu30YGyom8Pd35Lm
         hbesFMjBlaUqOCzhD/C9PDt7tXuPZksSNViyFppdGkYXsW1r6V4OBm7o+BgOi0URUrlQ
         ZAOA==
X-Forwarded-Encrypted: i=1; AL+hErFnmCrLMplYLAmSTlo4yrgjCLrSWAk1swOpXHuYvj7DOmCggw11lptYs+j04nBqw2MK4i+nzZ/SGBRn@vger.kernel.org
X-Gm-Message-State: APuU4Z8NW4EHqQ15O8ImEx8iJ/cGDtXg2kCS5waR8BkIajgeHliu5+db
	O03k3bDk3bQm+B0Pr0ADXenGKCCHzHGNoYV0hkC7KXJUWgvrPxX+peUo
X-Gm-Gg: AYBFou2InqQGdYY16dmhpQaelInhrrGvXoB+x+kqnAjGHbTo22TqgCX/u2p5mvHP1sf
	zZkvex5btHT95LxUAYugPOEdcH9mdMrYPwLr08JibO7FQUcS6kJNEGPy4Vo8+vOUPa5wO4mFSYs
	xTTuyXfqvB9kqM7c1aGaJ9JyPqzF3M0VkrLVdHsWxTtgBVIcUeoWxZNuexGLTLTcyOd3x/aWiNr
	ZEpbeZC0NOawhcNepXHfivzs14I4wNsMd/nDI+2P0O0nm1VhblpbRhEz277qPtat2Iyym54Ktn5
	G3RXJ8/iGZbkNvGee2csPnv8hZfd2cINB2UBb4BCAWp0cjS82ADoetU8JW7YIy3X3br+hqDTdOt
	X5B50lwjanEJPe/sEpKRWzVPTq1SzlOZq2wa07Kz/TJ9w5IIhbRBUFWFsFIbukEhQhEa1vcNWX+
	mEdwhoIRaHG/r7hbAXYwsdyeScThAIlqzWuoV1KMQz2Pw0QgufaT1g+upW41l3TSn0mCWnyBXkE
	fAVPJKjSl9i8T5YZHFGLPdKLLd4pBV/xijcUQfVyq73SXQsmBT726kVLEJhxA2m/ijofo28R/Ki
	XHQe+BYPXytD0l4VOGBRrCHrnwuiFGzjtYn61nzpkkOiq9JCeoCNSfguZV8C4SBSOk5/MA==
X-Received: by 2002:a05:6a21:32a2:b0:3eb:98d2:cd89 with SMTP id adf61e73a8af0-3fe892fd694mr3439498637.25.1795015194581;
        Wed, 18 Nov 2026 07:19:54 -0800 (PST)
Received: from eric-N-A (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa27dsm1408559b3a.19.2026.11.18.07.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:19:54 -0800 (PST)
From: Eric Yun Lin Chiang <ericyunlinchiang@gmail.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Eric Yun Lin Chiang <ericyunlinchiang@gmail.com>
Subject: [PATCH] EDAC/aspeed: do not fail probe when ECC is disabled
Date: Wed, 18 Nov 2026 23:19:07 +0800
Message-ID: <20261118151907.3949719-1-ericyunlinchiang@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AST2600 memory-controller EDAC node is enabled by default in
aspeed-g6.dtsi (it has no status property), so aspeed_edac binds on
every AST2600 board. aspeed_probe() reads the memory-controller
configuration and, when DRAM ECC was not turned on by firmware,
prints an error and returns -EPERM:

  aspeed-edac 1e6e0000.sdram: ECC mode is not configured in u-boot
  aspeed-edac 1e6e0000.sdram: probe with driver aspeed-edac failed with error -1

Running without DRAM ECC is a normal platform choice, not a failure.
-EPERM is both the wrong errno (this is not a permission problem) and
one the driver core reports as a probe error, so every non-ECC AST2600
board logs a spurious "failed with error -1" at boot.

Return -ENODEV instead, which the driver core treats as "no device to
bind" and does not log as an error, and lower the message to dev_info so
the reason EDAC did not register is still visible once without looking
like a fault. The AST2500 node is disabled by default, so only boards
that explicitly enable it are affected there. No other error path is
changed.

This change was prepared with the help of an AI coding assistant, which
analysed the probe path and drafted this changelog; the author has
reviewed it and stands behind the change.

Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
Signed-off-by: Eric Yun Lin Chiang <ericyunlinchiang@gmail.com>
---
Tested: the pre-fix "failed with error -1" was reproduced on an AST2600
(Facebook Bletchley) BMC by triggering the aspeed-edac probe over sysfs;
the fixed driver builds (W=1, no new warnings) and passes checkpatch,
and the resulting behaviour -- aspeed_probe() now returns -ENODEV, which
the driver core does not log as an error -- was confirmed by disassembly
of the built object. NOT boot-tested on hardware (the kernel was not
booted).

 drivers/edac/aspeed_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 6e069b255..e6f8cf78a 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -295,8 +295,8 @@ static int aspeed_probe(struct platform_device *pdev)
 	/* bail out if ECC mode is not configured */
 	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
 	if (!(reg04 & ASPEED_MCR_CONF_ECC)) {
-		dev_err(&pdev->dev, "ECC mode is not configured in u-boot\n");
-		return -EPERM;
+		dev_info(&pdev->dev, "ECC mode is not configured in u-boot\n");
+		return -ENODEV;
 	}
 
 	edac_op_state = EDAC_OPSTATE_INT;
-- 
2.53.0

