Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B9F2882C5
	for <linux-edac@vger.kernel.org>; Wed, 27 May 2026 06:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779862272; cv=none; b=u2kZKwpjSiWOHwiy5KZKMYLX+wK0Ci7AQ8R29ggZruTxSPSZEHANiOKKSLN+CKfUU6orh18+ns3i8gfqRjr9E+Yu8zfmsg23cg6QqYQSFI2U0tZBxjjvvpBzf+lRAXsrReIg95ZmAfntErpKYLaJ5EeuRDn70O4bfuZXCw1c4fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779862272; c=relaxed/simple;
	bh=H+Z49XHlhgJMu5qdUtBcvH+YbikV7pEhMUS19onRf74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ph8SmsTTIEjX5nN5iDFuQdQFxr5CaE1p89Gf8Y/5yTlutCFHFTbwoOzx56fWovJ2AboewRwOBIpQjtTYpl+14ThBtodzVrsQE9bNfgmWVBzJFmTz2XE1xfvvKR1ZPS0XmZTENlAzI83zqiNL1hGuVfD4WQ0TlF9OWtbye5d9PX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eqxtC2QI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eqxtC2QI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49050bfe053so16838895e9.3
        for <linux-edac@vger.kernel.org>; Tue, 26 May 2026 23:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779862266; x=1780467066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9n+ZjVf+La28uhzir6thN841xweYn2TgabJvNejqlo=;
        b=eqxtC2QIwE7frUXk5sPpucp4KETdrvI/K5OEhXGMcrcD+Ym1toEDWsTqoHte3fHuW0
         xsw0LkbgxKE8q7zzaXyHy9/wE1ZRFmimfZz8KztxdF/8Q6UU/V4EW/DqbrrEN3nNeJ6o
         ST/3iXDq5XQLo0Mlfb/fGVcLDuRwWnhZlNLN2DOKBUiayPVvEx/Cp9zY5SQGqYvOq+JT
         3Ibnew43BkRZ3BtxE8k0GDuMsdXMwF1rNFG6DSfPSg4E3yyPnP2SbojKIvdrFwhGVYdF
         DS4AUwfIj3gnhJvlsuf6Jida4TIC6XpUqEYKuOQTu6Eh3Z4KYFenNxOBW4X+5/eOLMxo
         s0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779862266; x=1780467066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9n+ZjVf+La28uhzir6thN841xweYn2TgabJvNejqlo=;
        b=fb9DhTnbO91OJJwVUJ1Y2mWbo0efOtkv+mlYdKUpRni2d68Bkn20s9MbXbfjq/sEjL
         ZL4TWoXwuZDfJ+yRiO5h9kUZ8cw0TikOyya0ZS3CqaGGzsQpf/zY+1dE2vclYpsDob/8
         HpCCYma1M8baKq5/fghL5ShfBYsG4YGmL1nXkjCkV/UnjjlU5CQPiGwGiqXcsnduCU+8
         sNFBbv8B+PHiq21dhD0ZwdHTifPuqIgVF1p8KG7H2poda6g5KN8G6+zxG5TJx+nuOQDm
         az72ovh3NcKR/MRMCNNPCS74v4nleFo1kuAsemuBnvn5jvEXmSSIrZViIcaapcg7mllx
         FdPA==
X-Forwarded-Encrypted: i=1; AFNElJ/7I3Xa/YgytUsyLXstsai/eM+fcklyHY8A6L9xZidhAAz+19yk3mQ+3DY6r79CA3+kwAW1obDFgkT4@vger.kernel.org
X-Gm-Message-State: AOJu0YyYTxPoEuwxR+EOvsmjpeFjeVd6i71WHo/awbr0iccgRULXdHwq
	wBQLaqUs7B/ZJpRZ3hiqUPCEy1gHGoivH2t1m8HN0g7kWjnMDpH7MzaegaHcHEVBY3I=
X-Gm-Gg: Acq92OGIy/oQbskoaA0Y/vbdOl+G3myJ0dUtC7zA6muTqlUt4VcuXRYMvlbcs2kYMSL
	meofOmdG9YeA/YKiQ/AbPp6TGgpA/IZ4u1erYtkQe1EBrT5pI7FPHvD4nX/dHzn6TP68EY+w9Gh
	628dz5H00FAlgDZv+QftH2TIxrrbPG0goyw4lVOkW4Ohj5GU6j6YdhbSqXjOGxFj9WMXGufc1e+
	D6rtLGHcZTRyDQVsfe0YoCaxwUzrXmLQnDQx30YebmHsE78wvbf+bDOt45kl6NQTxGpMGIenl0Q
	OqCvXrFn7MkAOlCb2tJKkRow8N3UNVU40sMSZs0V/qKmEDf/RzBq9bZkUCwCrTr5l0QQGCpvqba
	CWbTScdFmdKGZmwMLrz51AcRRFt/oS4jWeQxygxvqtG2A2q4c9846C2tpHjgMn57t9GQWKvghOu
	t69A9gYH+u8OYfnKLz4KauqZ2bVj/NyQifzdSMgeBLpcGL94ly6ohyI2Th7x1kueZ4wpF5BlIiE
	C0h3jNs4GLukpfeRGn0mXDntQ==
X-Received: by 2002:a05:600c:1c0d:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-490424b3927mr398077735e9.9.1779862266092;
        Tue, 26 May 2026 23:11:06 -0700 (PDT)
Received: from localhost (p200300f65f47db041edccd9970843bb8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1edc:cd99:7084:3bb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490454dedd9sm345187205e9.6.2026.05.26.23.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 23:11:03 -0700 (PDT)
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
Subject: [PATCH v2] edac: Consistently define pci_device_ids using named initializers
Date: Wed, 27 May 2026 08:10:56 +0200
Message-ID: <20260527061057.3796383-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=28400; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=H+Z49XHlhgJMu5qdUtBcvH+YbikV7pEhMUS19onRf74=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqForxzSWBuvZMK9bOrVDmVx5XZgTXK8gUkmPWT D50TnjvokeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahaK8QAKCRCPgPtYfRL+ TmaoB/9ZTarlqvj92fPLOdFuPi8JFGU0WSfn/Rs9Ilpl0l8pJPOcwZ6mNTVf/C3DAMDKmxEnnRY KVsPtxppRHhCPEobJ5JG5T+366jIaotzW/1jXENNtvA8AM02AVO6MmIUp8l3OZcYA8VZAvi3d0B 32Sxbjbd6Bxc6YFXo5av3Dxa9jw8V5DWtz1tWVNWUxlUHnM8wAbMnxTItieHqs+lLzFBQ3rVyfh u/u44Xl3cAVaENEzoX3iNF/EmYzbcRe73D4Q/2jAUnzbix3z7TAeUIHRKKMD0kXADZi6j9A0OmJ bS2C5jama6+6t+AOuRZ4bmr4e9srgkrSiJcSlHZYc98hm2cg
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

changes since implicit v1
(https://lore.kernel.org/all/20260429152513.3755034-2-u.kleine-koenig@baylibre.com):

 - Rebase to next-20260526 to fix a conflict in drivers/edac/igen6_edac.c

Borislav Petkov asked me to do a patch for drivers/edac/igen6_edac.c
only on top of next, but I hope this way it's still easier.

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
 drivers/edac/ie31200_edac.c |  86 +++++++++++------------
 drivers/edac/igen6_edac.c   | 134 ++++++++++++++++++------------------
 drivers/edac/x38_edac.c     |  10 +--
 12 files changed, 179 insertions(+), 180 deletions(-)

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
index f3e53d63eb54..034c9f06198b 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -800,73 +800,73 @@ static struct res_config wcl_cfg = {
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
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU1), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU2), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU3), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU4), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU5), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU6), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU7), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU8), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU9), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU10), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU11), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU14), (kernel_ulong_t)&ptl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), (kernel_ulong_t)&wcl_cfg },
-	{ },
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
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU1), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU2), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU3), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU4), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU5), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU6), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU7), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU8), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU9), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU10), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU11), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU14), .driver_data = (kernel_ulong_t)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), .driver_data = (kernel_ulong_t)&wcl_cfg },
+	{ }
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

base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
-- 
2.47.3

