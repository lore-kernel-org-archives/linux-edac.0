Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF7937AA63
	for <linux-edac@vger.kernel.org>; Wed, 29 Apr 2026 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476330; cv=none; b=pRHirOPRYKl5fm+FZEil5q1/dfzoldUSmhKUWSv5/FtOIP+IwP/9EAVcepdj69pV2+wWIehaHZv2vtYQaa9eVYf5CL7sprSiRt/2r2ErznaMUCafBvDp8uKFd03TvS+NTqYPdT/OJOYiQyrZBFqtIsXvXmz24nma66+7So+c+DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476330; c=relaxed/simple;
	bh=mUWx8EUlo88UgoPta+1SFiCcY5tHt9JYkXgqovqw0aU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sYlmatWMSkMftxXjVOdeF8iZLl580LZoW0diTpdpTauCqvFdNpFeX+8UTluAvDIC4Z2sAGjSIn86fnpDOzrh/5rJ0jZVZvJqMUQtnCSRrI3xK1KHDvtMZVjWjnEbStyUBTNaWg/wz1EMAEmjLDLl1As3Kg5VLWy5Np7yq9Mn29A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=qm2SPTtl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="qm2SPTtl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfd832155so9317225f8f.1
        for <linux-edac@vger.kernel.org>; Wed, 29 Apr 2026 08:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777476324; x=1778081124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqL77kj2/3RErlxNBb5OeXQUBUyxkGq3IFBKWgdskpQ=;
        b=qm2SPTtltHjOnDwXCVIHbQriJJF9xI8BgM7q/66NmDH3YCAc+S/NQeahPmNWE+ybBR
         ucdqgulsfzOrEUN2GsmmlJ5kWe9S2wL37ESa0v5oxi1QfwbtNkV9JKZVInU0eyIlVdKw
         VeW8kBhVa3qSSldL+7XJzQp5lyj9N49QHHGydrYHy+wW6nmEYmxjXNIH+Dqy0928r6A/
         XCulQzInQQsMPbs+fxitvjpdlHHCJWd+M81vHNWDa2vMhZLtxo54xli4GDED5Z7RUIk3
         mpdQl9lFw8UGiLdcOXOleaxE4Jmpj8bnWVLRbLvlmqnGme67+3XDoKN/0Oo0ZEkge47v
         ZciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476324; x=1778081124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqL77kj2/3RErlxNBb5OeXQUBUyxkGq3IFBKWgdskpQ=;
        b=hFVoecWLhbW3OaYC/qrYO6G5IB1HCz06szq1J5X2VkeYZK8P7qiQLVGt4k+Mcp5A+u
         Hi66wfV0HTdec2ZH2i/M0AG+GypbI2EUpFhwF2lDLCVT5lmgi/spPpGRLHlgeOY+BnTQ
         XSjyh3WW51LPQs2fOGn3LoEscbSB5sJWxvqsHPSqeJsugDTMrQValT/PL8lkhRWTAIji
         JUSWCdFMSEY+x90hsM/y1/ONQyKe/+FTudGC9FdJw7+x2Enz/50Ty7H+X7tY095swJPE
         fJ8h9hCZXPGEWbiw5xvu43UIKbPiqJ/fDh+qSwkgQ8IGeMtdmgMyYAYWeNBmxSYZSyTx
         Yu7A==
X-Forwarded-Encrypted: i=1; AFNElJ9zl/wtZkCiW9gY26WtBIn89AsmpB62PuLwIFsEVwABIBSDx7hvTGKSTb+8NhYSp3yHnGqTVlLy+flr@vger.kernel.org
X-Gm-Message-State: AOJu0YxDdrs9bRCANFEySuFJDbPEmqszj/JLH5Sq4fnlG8nrITw0t1Vw
	DnKkNUWxULj4LKLQKIvQP20xrpPMR2wWBAREIEGgyqjndzN7f/StdrlaecUfzlArkx4=
X-Gm-Gg: AeBDietPD5A0RNmnxK9ZL2rNPOMnVSMkoS6Q55cExKN/ew/zNBmMZWfk2T9lTgQ+qU+
	ydCq3G2YC+7tlkBxLdydcw2vMKedIcnYLL5qmQCDSGVsNcxQcOAQUBLI3LLIcO7l7bnCaZXXmc4
	13QzsI6mLtoi9nbUQv2L3z69yJqBqMNJ+1V3rFGzodr+Crg/0pWS3lEQgu5p66/qoIOmJGR3bsp
	Kbdnwh6cAv6+Pp5665i+RKaeoZv4Bdw/aZVgd0JFUC9BJ2SvnNtG9xM6kwOM7OFIvTFeQCT0eTy
	O151Kh+jfLEvYWund9WA0xU3fPYgRlCiiO8GoeKDe4J0fa3CUX/t4Ncs6JpVxwkwFT+b3EavFGK
	fS8jv5Bc7v+mkk7hV0VqYzzwgAjjtca7MVml/uPT1CE1gV62IwGgLJ9pXvpaDZZXr4S2RfxvsqA
	L/0sUSi0Ul4hWY7IrWKdNfzwRAlWWSdMhtQMcGZ21o0HGBoBKrL2LvdB9ga3ITi/tmD6+oEJvz7
	ycLGLdnAB3zMQhl6t7Ajw21dg==
X-Received: by 2002:a05:6000:240e:b0:43b:4136:1e6f with SMTP id ffacd0b85a97d-44649c9973emr14552182f8f.38.1777476323493;
        Wed, 29 Apr 2026 08:25:23 -0700 (PDT)
Received: from localhost (p200300f65f114e0863aeabccc171bdd2.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:63ae:abcc:c171:bdd2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-447b4216604sm7529865f8f.10.2026.04.29.08.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:25:22 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Mark Gross <markgross@kernel.org>,
	"Arvind R." <arvino55@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] edac: Consistently define pci_device_ids using named initializers
Date: Wed, 29 Apr 2026 17:25:13 +0200
Message-ID: <20260429152513.3755034-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=28363; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=mUWx8EUlo88UgoPta+1SFiCcY5tHt9JYkXgqovqw0aU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp8iLZJq0LLu4wh+WJZb9rXN984wDIcokxHTKMF nbao4c2Wm6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCafIi2QAKCRCPgPtYfRL+ TqrzB/45mr5fRF8ZEdfJT0QJDcj1YFJmKCaOyVB6af1BTFJ5RYyDcr5tvUY8iTHy6hPus0xXSMD pT02EKq/3JWAypnRLHiGOanoTmgiztgOz/5mu73LfJYO+ClmrKyUGudDap4WbfvodjgCvfA9IUT 1FzXs3KRWOW/FH322YYFfyvgPSlO9c37Kcu8rx89cUisPxa2AEAvkCfGn++p1l6fwMizCxj0+Ki iBZJKMBN+7So2QpHZiGuntgb4y+us8l29qw7C9xGs4qxa6jfzuPrVZLCey8IhO98vih6chsERtV //xEbg2MLNaxbPy8EpnuVvLlY3qGg3X5gktl5hO6RLuhXT41
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

... and PCI device helpers.

The various struct pci_device_id arrays were initialized mostly by one
of the PCI_DEVICE macros and then list expressions. The latter isn't
easily readable if you're not into PCI. Using named initializers is more
explicit and thus easier to parse.

Also use PCI_DEVICE* helper macros to assign .vendor, .device,
.subvendor and .subdevice where appropriate and skip explicit
assignments of 0 (which the compiler takes care of).

The secret plan is to make struct pci_device_id::driver_data an
anonymous union (similar to
https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre.com/)
and that requires named initializers. But it's also a nice cleanup on
its own.

This change doesn't introduce changes to the compiled pci_device_id
arrays. Tested on x86 and arm64.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

the mentioned follow-up quest allows to do

	-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_1), .driver_data = (kernel_ulong_t)&snb_cfg },
	+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_1), .driver_data_ptr = &snb_cfg },

which gets rid of a bunch of casts and so brings a little bit more type
safety. This patch is a preparation for that.

I assume a single patch for all of drivers/edac is fine. If not I can
split per driver.

Best regards
Uwe

 drivers/edac/amd76x_edac.c  |  16 ++---
 drivers/edac/e752x_edac.c   |  28 ++++----
 drivers/edac/e7xxx_edac.c   |  28 ++++----
 drivers/edac/edac_mc.h      |   4 +-
 drivers/edac/i3000_edac.c   |  10 +--
 drivers/edac/i3200_edac.c   |  10 +--
 drivers/edac/i82860_edac.c  |  10 +--
 drivers/edac/i82875p_edac.c |  12 ++--
 drivers/edac/i82975x_edac.c |  11 ++-
 drivers/edac/ie31200_edac.c |  86 ++++++++++++------------
 drivers/edac/igen6_edac.c   | 130 ++++++++++++++++++------------------
 drivers/edac/x38_edac.c     |  10 +--
 12 files changed, 177 insertions(+), 178 deletions(-)

diff --git a/drivers/edac/amd76x_edac.c b/drivers/edac/amd76x_edac.c
index 2a49f68a7cf9..7bb11ffdb0c9 100644
--- a/drivers/edac/amd76x_edac.c
+++ b/drivers/edac/amd76x_edac.c
@@ -332,14 +332,14 @@ static void amd76x_remove_one(struct pci_dev *pdev)
 
 static const struct pci_device_id amd76x_pci_tbl[] = {
 	{
-	 PCI_VEND_DEV(AMD, FE_GATE_700C), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 AMD762},
-	{
-	 PCI_VEND_DEV(AMD, FE_GATE_700E), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 AMD761},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(AMD, FE_GATE_700C),
+		.driver_data = AMD762
+	}, {
+		PCI_VEND_DEV(AMD, FE_GATE_700E),
+		.driver_data = AMD761,
+	}, {
+		/* 0 terminated list. */
+	}
 };
 
 MODULE_DEVICE_TABLE(pci, amd76x_pci_tbl);
diff --git a/drivers/edac/e752x_edac.c b/drivers/edac/e752x_edac.c
index 7221b4bb6df2..77c1fe75451e 100644
--- a/drivers/edac/e752x_edac.c
+++ b/drivers/edac/e752x_edac.c
@@ -1414,20 +1414,20 @@ static void e752x_remove_one(struct pci_dev *pdev)
 
 static const struct pci_device_id e752x_pci_tbl[] = {
 	{
-	 PCI_VEND_DEV(INTEL, 7520_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7520},
-	{
-	 PCI_VEND_DEV(INTEL, 7525_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7525},
-	{
-	 PCI_VEND_DEV(INTEL, 7320_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7320},
-	{
-	 PCI_VEND_DEV(INTEL, 3100_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 I3100},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 7520_0),
+		.driver_data = E7520,
+	}, {
+		PCI_VEND_DEV(INTEL, 7525_0),
+		.driver_data = E7525,
+	}, {
+		PCI_VEND_DEV(INTEL, 7320_0),
+		.driver_data = E7320,
+	}, {
+		PCI_VEND_DEV(INTEL, 3100_0),
+		.driver_data = I3100,
+	}, {
+		/* 0 terminated list. */
+	}
 };
 
 MODULE_DEVICE_TABLE(pci, e752x_pci_tbl);
diff --git a/drivers/edac/e7xxx_edac.c b/drivers/edac/e7xxx_edac.c
index 5852b95fa470..02071180b638 100644
--- a/drivers/edac/e7xxx_edac.c
+++ b/drivers/edac/e7xxx_edac.c
@@ -554,20 +554,20 @@ static void e7xxx_remove_one(struct pci_dev *pdev)
 
 static const struct pci_device_id e7xxx_pci_tbl[] = {
 	{
-	 PCI_VEND_DEV(INTEL, 7205_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7205},
-	{
-	 PCI_VEND_DEV(INTEL, 7500_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7500},
-	{
-	 PCI_VEND_DEV(INTEL, 7501_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7501},
-	{
-	 PCI_VEND_DEV(INTEL, 7505_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7505},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 7205_0),
+		.driver_data = E7205,
+	}, {
+		PCI_VEND_DEV(INTEL, 7500_0),
+		.driver_data = E7500,
+	}, {
+		PCI_VEND_DEV(INTEL, 7501_0),
+		.driver_data = E7501,
+	}, {
+		PCI_VEND_DEV(INTEL, 7505_0),
+		.driver_data = E7505
+	}, {
+		/* 0 terminated list. */
+	}
 };
 
 MODULE_DEVICE_TABLE(pci, e7xxx_pci_tbl);
diff --git a/drivers/edac/edac_mc.h b/drivers/edac/edac_mc.h
index 881b00eadf7a..9505bbd41784 100644
--- a/drivers/edac/edac_mc.h
+++ b/drivers/edac/edac_mc.h
@@ -88,8 +88,8 @@ do {									\
 
 #endif				/* !CONFIG_EDAC_DEBUG */
 
-#define PCI_VEND_DEV(vend, dev) PCI_VENDOR_ID_ ## vend, \
-	PCI_DEVICE_ID_ ## vend ## _ ## dev
+#define PCI_VEND_DEV(vend, dev) \
+	PCI_DEVICE(PCI_VENDOR_ID_ ## vend, PCI_DEVICE_ID_ ## vend ## _ ## dev)
 
 #define edac_dev_name(dev) (dev)->dev_name
 
diff --git a/drivers/edac/i3000_edac.c b/drivers/edac/i3000_edac.c
index 9065bc4386ff..04a231660b88 100644
--- a/drivers/edac/i3000_edac.c
+++ b/drivers/edac/i3000_edac.c
@@ -485,11 +485,11 @@ static void i3000_remove_one(struct pci_dev *pdev)
 
 static const struct pci_device_id i3000_pci_tbl[] = {
 	{
-	 PCI_VEND_DEV(INTEL, 3000_HB), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 I3000},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 3000_HB),
+		.driver_data = I3000,
+	}, {
+		/* 0 terminated list. */
+	}
 };
 
 MODULE_DEVICE_TABLE(pci, i3000_pci_tbl);
diff --git a/drivers/edac/i3200_edac.c b/drivers/edac/i3200_edac.c
index 6cade6d7ceff..d600b6c05217 100644
--- a/drivers/edac/i3200_edac.c
+++ b/drivers/edac/i3200_edac.c
@@ -466,11 +466,11 @@ static void i3200_remove_one(struct pci_dev *pdev)
 
 static const struct pci_device_id i3200_pci_tbl[] = {
 	{
-		PCI_VEND_DEV(INTEL, 3200_HB), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-		I3200},
-	{
-		0,
-	}            /* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 3200_HB),
+		.driver_data = I3200,
+	}, {
+		/* 0 terminated list. */
+	}
 };
 
 MODULE_DEVICE_TABLE(pci, i3200_pci_tbl);
diff --git a/drivers/edac/i82860_edac.c b/drivers/edac/i82860_edac.c
index b8a497f0de28..e8c1ee80bba8 100644
--- a/drivers/edac/i82860_edac.c
+++ b/drivers/edac/i82860_edac.c
@@ -287,11 +287,11 @@ static void i82860_remove_one(struct pci_dev *pdev)
 
 static const struct pci_device_id i82860_pci_tbl[] = {
 	{
-	 PCI_VEND_DEV(INTEL, 82860_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 I82860},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 82860_0),
+		.driver_data = I82860,
+	}, {
+		/* 0 terminated list. */
+	}
 };
 
 MODULE_DEVICE_TABLE(pci, i82860_pci_tbl);
diff --git a/drivers/edac/i82875p_edac.c b/drivers/edac/i82875p_edac.c
index 553880b9fc12..869de8e372b3 100644
--- a/drivers/edac/i82875p_edac.c
+++ b/drivers/edac/i82875p_edac.c
@@ -276,7 +276,7 @@ static int i82875p_setup_overfl_dev(struct pci_dev *pdev,
 
 	*ovrfl_pdev = NULL;
 	*ovrfl_window = NULL;
-	dev = pci_get_device(PCI_VEND_DEV(INTEL, 82875_6), NULL);
+	dev = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82875_6, NULL);
 
 	if (dev == NULL) {
 		/* Intel tells BIOS developers to hide device 6 which
@@ -518,11 +518,11 @@ static void i82875p_remove_one(struct pci_dev *pdev)
 
 static const struct pci_device_id i82875p_pci_tbl[] = {
 	{
-	 PCI_VEND_DEV(INTEL, 82875_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 I82875P},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 82875_0),
+		.driver_data = I82875P,
+	}, {
+		/* 0 terminated list. */
+	}
 };
 
 MODULE_DEVICE_TABLE(pci, i82875p_pci_tbl);
diff --git a/drivers/edac/i82975x_edac.c b/drivers/edac/i82975x_edac.c
index d99f005832cf..09a79eaaa486 100644
--- a/drivers/edac/i82975x_edac.c
+++ b/drivers/edac/i82975x_edac.c
@@ -624,12 +624,11 @@ static void i82975x_remove_one(struct pci_dev *pdev)
 
 static const struct pci_device_id i82975x_pci_tbl[] = {
 	{
-		PCI_VEND_DEV(INTEL, 82975_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-		I82975X
-	},
-	{
-		0,
-	}	/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 82975_0),
+		.driver_data = I82975X
+	}, {
+		/* 0 terminated list. */
+	}
 };
 
 MODULE_DEVICE_TABLE(pci, i82975x_pci_tbl);
diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c
index a5dc4b88097f..e3bd6436669b 100644
--- a/drivers/edac/ie31200_edac.c
+++ b/drivers/edac/ie31200_edac.c
@@ -733,49 +733,49 @@ static struct res_config rpl_s_cfg = {
 };
 
 static const struct pci_device_id ie31200_pci_tbl[] = {
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_1), (kernel_ulong_t)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_2), (kernel_ulong_t)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_3), (kernel_ulong_t)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_4), (kernel_ulong_t)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_5), (kernel_ulong_t)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_6), (kernel_ulong_t)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_7), (kernel_ulong_t)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_8), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_9), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_10), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_11), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_12), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_1), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_2), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_3), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_4), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_5), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_6), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_7), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_8), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_9), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_10), (kernel_ulong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_1), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_2), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_3), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_4), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_5), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_6), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_HX_1), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_1), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_2), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_3), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_1), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_2), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_3), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_4), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_5), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_6), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_7), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_8), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_9), (kernel_ulong_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_10), (kernel_ulong_t)&rpl_s_cfg},
-	{ 0, } /* 0 terminated list. */
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_1), .driver_data = (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_2), .driver_data = (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_3), .driver_data = (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_4), .driver_data = (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_5), .driver_data = (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_6), .driver_data = (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_7), .driver_data = (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_8), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_9), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_10), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_11), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_12), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_1), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_2), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_3), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_4), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_5), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_6), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_7), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_8), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_9), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_10), .driver_data = (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_1), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_2), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_3), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_4), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_5), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_6), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_HX_1), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_1), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_2), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_3), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_1), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_2), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_3), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_4), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_5), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_6), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_7), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_8), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_9), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_10), .driver_data = (kernel_ulong_t)&rpl_s_cfg },
+	{ } /* 0 terminated list. */
 };
 MODULE_DEVICE_TABLE(pci, ie31200_pci_tbl);
 
diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index fcb8ab44cba5..3ae0a1ec2d54 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -638,71 +638,71 @@ static struct res_config wcl_cfg = {
 };
 
 static struct pci_device_id igen6_pci_tbl[] = {
-	{ PCI_VDEVICE(INTEL, DID_EHL_SKU5), (kernel_ulong_t)&ehl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_EHL_SKU6), (kernel_ulong_t)&ehl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_EHL_SKU7), (kernel_ulong_t)&ehl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_EHL_SKU8), (kernel_ulong_t)&ehl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_EHL_SKU9), (kernel_ulong_t)&ehl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_EHL_SKU10), (kernel_ulong_t)&ehl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_EHL_SKU11), (kernel_ulong_t)&ehl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_EHL_SKU12), (kernel_ulong_t)&ehl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_EHL_SKU13), (kernel_ulong_t)&ehl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_EHL_SKU14), (kernel_ulong_t)&ehl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_EHL_SKU15), (kernel_ulong_t)&ehl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ICL_SKU8), (kernel_ulong_t)&icl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ICL_SKU10), (kernel_ulong_t)&icl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ICL_SKU11), (kernel_ulong_t)&icl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ICL_SKU12), (kernel_ulong_t)&icl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_TGL_SKU), (kernel_ulong_t)&tgl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_SKU1), (kernel_ulong_t)&adl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_SKU2), (kernel_ulong_t)&adl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_SKU3), (kernel_ulong_t)&adl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_SKU4), (kernel_ulong_t)&adl_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU1), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU2), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU3), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU4), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU5), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU6), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU7), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU8), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU9), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU10), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU11), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU12), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_AZB_SKU1), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ASL_SKU1), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ASL_SKU2), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ASL_SKU3), (kernel_ulong_t)&adl_n_cfg },
-	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU1), (kernel_ulong_t)&rpl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU2), (kernel_ulong_t)&rpl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU3), (kernel_ulong_t)&rpl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU4), (kernel_ulong_t)&rpl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU5), (kernel_ulong_t)&rpl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU1), (kernel_ulong_t)&mtl_ps_cfg },
-	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU2), (kernel_ulong_t)&mtl_ps_cfg },
-	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU3), (kernel_ulong_t)&mtl_ps_cfg },
-	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU4), (kernel_ulong_t)&mtl_ps_cfg },
-	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU1), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU2), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU3), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU1), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU2), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU3), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU1), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU2), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU3), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU4), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU5), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU6), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU7), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU8), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU9), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU10), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU11), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), (kernel_ulong_t)&mtl_p_cfg },
-	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), (kernel_ulong_t)&wcl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU5), .driver_data = (kernel_ulong_t)&ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU6), .driver_data = (kernel_ulong_t)&ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU7), .driver_data = (kernel_ulong_t)&ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU8), .driver_data = (kernel_ulong_t)&ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU9), .driver_data = (kernel_ulong_t)&ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU10), .driver_data = (kernel_ulong_t)&ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU11), .driver_data = (kernel_ulong_t)&ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU12), .driver_data = (kernel_ulong_t)&ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU13), .driver_data = (kernel_ulong_t)&ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU14), .driver_data = (kernel_ulong_t)&ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU15), .driver_data = (kernel_ulong_t)&ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ICL_SKU8), .driver_data = (kernel_ulong_t)&icl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ICL_SKU10), .driver_data = (kernel_ulong_t)&icl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ICL_SKU11), .driver_data = (kernel_ulong_t)&icl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ICL_SKU12), .driver_data = (kernel_ulong_t)&icl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_TGL_SKU), .driver_data = (kernel_ulong_t)&tgl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_SKU1), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_SKU2), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_SKU3), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_SKU4), .driver_data = (kernel_ulong_t)&adl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU1), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU2), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU3), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU4), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU5), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU6), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU7), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU8), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU9), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU10), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU11), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU12), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_AZB_SKU1), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ASL_SKU1), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ASL_SKU2), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ASL_SKU3), .driver_data = (kernel_ulong_t)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU1), .driver_data = (kernel_ulong_t)&rpl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU2), .driver_data = (kernel_ulong_t)&rpl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU3), .driver_data = (kernel_ulong_t)&rpl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU4), .driver_data = (kernel_ulong_t)&rpl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU5), .driver_data = (kernel_ulong_t)&rpl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU1), .driver_data = (kernel_ulong_t)&mtl_ps_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU2), .driver_data = (kernel_ulong_t)&mtl_ps_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU3), .driver_data = (kernel_ulong_t)&mtl_ps_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU4), .driver_data = (kernel_ulong_t)&mtl_ps_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU1), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU2), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU3), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU1), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU2), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU3), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU1), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU2), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU3), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU4), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU5), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU6), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU7), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU8), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU9), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU10), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU11), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), .driver_data = (kernel_ulong_t)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), .driver_data = (kernel_ulong_t)&wcl_cfg },
 	{ },
 };
 MODULE_DEVICE_TABLE(pci, igen6_pci_tbl);
diff --git a/drivers/edac/x38_edac.c b/drivers/edac/x38_edac.c
index 292dda754c23..2b55daca33b0 100644
--- a/drivers/edac/x38_edac.c
+++ b/drivers/edac/x38_edac.c
@@ -446,11 +446,11 @@ static void x38_remove_one(struct pci_dev *pdev)
 
 static const struct pci_device_id x38_pci_tbl[] = {
 	{
-	 PCI_VEND_DEV(INTEL, X38_HB), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 X38},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, X38_HB),
+		.driver_data = X38,
+	}, {
+		/* 0 terminated list. */
+	}
 };
 
 MODULE_DEVICE_TABLE(pci, x38_pci_tbl);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

