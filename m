Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F2730DED0
	for <linux-edac@vger.kernel.org>; Tue, 28 Apr 2026 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412519; cv=none; b=g+ky0c/LcXTtk9W77BAuawXdt9XHodh+ObPYAPEBVwwORcAN6BPECYMLrf/xi4Sb8BtuC/j62qbhorXJyf32p4H10Yg+GMym1CspKo71bCDPiUHbYZ9DdxzscT5mwpSuIkzsQqeZJ75gkmIP3Z3XrNbd+DOlM280xHu8RzNyrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412519; c=relaxed/simple;
	bh=OUaExO99m67jwthWvfzdD3J9fDxAj3XMLv+OhaFhrsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W6hek1oaV06AUo8SmarvEz3oekIX7knzr9H4QsxAFDeJRJ+yk7F5IjtTl9t2S3WEWGtKk3RGPrWThtutPh75EfxZnJYguCqa+xtLxQL2cTKR041xkrLXpHJh9VxIPIc4JWoJA7tav9U8EYudhMv+veN/QeU/aW0eH6IatDVJ9Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEIwLWGp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEIwLWGp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ab39b111b9so49349165ad.1
        for <linux-edac@vger.kernel.org>; Tue, 28 Apr 2026 14:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777412517; x=1778017317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ivxoL7rxhcs0BB8mAqLqAJ5JywAgHHDv45sMwUwMt0=;
        b=IEIwLWGp4gs/tA1gIhypzuDfYUFmA38ajhlIIypiGO4YHdAe1k1vvihmOtGcdHLYXv
         S7inREGzQ8x88eHck7a7rwA4dSf5X+6yXcbwONhUX2IXqI2Ok03SxAzYuQ5wvAuiGH3h
         iTVaaivssLiWIrQsmbMOuzI/SThybYGaMf+lbvghIiG27rikeU0dp8pXBtsNDzArwQvq
         4ayZEcfNAgmyIKSIH1ZOhQu/kt2mnOmmEWkZ3zSAy/p++uaym1AJ7LFNb5tgh7esO/M+
         fRlLEiedxNv7XS4/zB226J7tadyBlTS1Q5M0NpJSzfeg9l90KnL4NELDOQKEkv2xNBRg
         kpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777412517; x=1778017317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ivxoL7rxhcs0BB8mAqLqAJ5JywAgHHDv45sMwUwMt0=;
        b=agNMASwLQfBiciBPWMz276vbXKjgFsNFPAa5p/mmk6KfbJsJJhggDDLFCxAUuRyj/F
         qxTja7Ivwn8NanQ2QWubECFAMz0Akm6btsjmi7rdt/iENfoUkf4n5QoU/rh8Q+0rbqsB
         yrSCSC9ObPCRaRlJUAfop33i7coBZCUhxhuqifBE2BVyf3sBeLTsJZNLieyo4vSGJ1Oo
         /HkIcnWGXy71pGABl5/ZJ0KYQQNOybqierRCGy14daankOkvKO9D9AgGh9kwCFm334s2
         i4CKhQ6z0Kk9knUacxbGXQ6AmNFhf50QKc7sY720+FdjhBPUHbxqU7pj+L4GAedxatQv
         Xxug==
X-Forwarded-Encrypted: i=1; AFNElJ88Cj/uGga/7KopqwCuxKwxtnOmRl8DFOfh5fPPNGfpDifLezKPY07MlucsVC55oMuvNwW8vzbNyOLA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy44smhOjxDVbNv4V5+00b42ewJkTc767o3pI07mAudwgel1dtK
	bPU1NmkIUXiuDdVRUt4C3VFA871F44cOFSH0sBM44TOfaY13at0Bq6R7
X-Gm-Gg: AeBDieuO0OTv3abK12jBWyVv2DuEyyusTTPpg7GKKMgzrAqE9kGm167MICdBeQ3SFgG
	8gJ0qBWmN3DnlqXtcEIsbDp4UJgrWDf8L7M4PWWoKYsd0ruetblt9n2fp/fqDtHW9I1vDvqG5UY
	yqm12wtkgpRJkYoc4Ytf35JAsErmfU/Rl5eSwASHnfKmWI0UBsW6X+TicPn8tQjfr3Jx2EE7QiT
	hXWrUlPxQpI2CAnJEq7OXNOWreQDaTMyzlASDZR7dZe3cywlUax1d7oitLtFC9kUWvD0V1uQ4VD
	bxyjqM2AmLV1a1WLl+t9U0uY82DmNw/eORhZlddNrzslORT4hMaeao+CzOAx1VrUn8UFWUAUMl6
	TLap+nG9pdhcGm2jwoC/iO23BtOOqWH5sFg16L1d6+pBXlVs/wLqK4shvRlw0tjayxXoPtfIHJG
	/iMF/0CnesIgvFyHY4Ey2Q8KuGRd6RYiuVm9T6OpV8fRJIMUpm3kHen3netGvD9aoRPVR63Nf7x
	bc=
X-Received: by 2002:a17:902:e746:b0:2b4:5fae:cbd8 with SMTP id d9443c01a7336-2b97c4e41a6mr54324675ad.37.1777412517332;
        Tue, 28 Apr 2026 14:41:57 -0700 (PDT)
Received: from pop-os.. ([2401:4900:647d:e40d:2ab9:6874:139a:41e5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm1877055ad.9.2026.04.28.14.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 14:41:56 -0700 (PDT)
From: Tushar Tibude <tushar.tibude1000@gmail.com>
To: mchehab@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: qiuxu.zhuo@intel.com,
	Tushar Tibude <tushar.tibude1000@gmail.com>
Subject: [PATCH v2] EDAC: i7300: disable error reporting if init fails and refactor helper
Date: Wed, 29 Apr 2026 03:11:16 +0530
Message-ID: <20260428214116.19230-1-tushar.tibude1000@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If error reporting is enabled during initialization but initialization
fails immediately after, or during normal driver exit, error reporting
is left enabled in the mask register even after exit.

Replace i7300_enable_error_reporting() with i7300_set_error_reporting()
to combine enabling/disabling. Disable reporting at initialization
failure and driver exit, before call to i7300_put_devices() for cleanup.

This ensures clean hardware handling by disabling any unused error
reporting bits before exiting.

Signed-off-by: Tushar Tibude <tushar.tibude1000@gmail.com>
---
v2:
 - Replace disable function with i7300_set_error_reporting
 - Disable reporting at normal driver exit
 - Move enabled_error_reporting flag initialization
 drivers/edac/i7300_edac.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/i7300_edac.c b/drivers/edac/i7300_edac.c
index 69068f8d0..f729bf0e2 100644
--- a/drivers/edac/i7300_edac.c
+++ b/drivers/edac/i7300_edac.c
@@ -550,11 +550,12 @@ static void i7300_clear_error(struct mem_ctl_info *mci)
 }
 
 /**
- * i7300_enable_error_reporting() - Enable the memory reporting logic at the
+ * i7300_set_error_reporting() - Enable or disable the memory reporting logic at the
  *				    hardware
  * @mci: struct mem_ctl_info pointer
+ * @enable: enables if 'true', disables if 'false'
  */
-static void i7300_enable_error_reporting(struct mem_ctl_info *mci)
+static void i7300_set_error_reporting(struct mem_ctl_info *mci, bool enable)
 {
 	struct i7300_pvt *pvt = mci->pvt_info;
 	u32 fbd_error_mask;
@@ -563,8 +564,11 @@ static void i7300_enable_error_reporting(struct mem_ctl_info *mci)
 	pci_read_config_dword(pvt->pci_dev_16_1_fsb_addr_map,
 			      EMASK_FBD, &fbd_error_mask);
 
-	/* Enable with a '0' */
-	fbd_error_mask &= ~(EMASK_FBD_ERR_MASK);
+	/* Enable with 0, disable with 1 */
+	if (enable)
+		fbd_error_mask &= ~(EMASK_FBD_ERR_MASK);
+	else
+		fbd_error_mask |= EMASK_FBD_ERR_MASK;
 
 	pci_write_config_dword(pvt->pci_dev_16_1_fsb_addr_map,
 			       EMASK_FBD, fbd_error_mask);
@@ -1025,6 +1029,7 @@ static int i7300_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct edac_mc_layer layers[3];
 	struct i7300_pvt *pvt;
 	int rc;
+	bool enabled_error_reporting;
 
 	/* wake up device */
 	rc = pci_enable_device(pdev);
@@ -1087,17 +1092,19 @@ static int i7300_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (i7300_get_mc_regs(mci)) {
 		edac_dbg(0, "MC: Setting mci->edac_cap to EDAC_FLAG_NONE because i7300_init_csrows() returned nonzero value\n");
 		mci->edac_cap = EDAC_FLAG_NONE;	/* no csrows found */
+		enabled_error_reporting = false;
 	} else {
 		edac_dbg(1, "MC: Enable error reporting now\n");
-		i7300_enable_error_reporting(mci);
+		i7300_set_error_reporting(mci, true);
+		enabled_error_reporting = true;
 	}
 
 	/* add this new MC control structure to EDAC's list of MCs */
 	if (edac_mc_add_mc(mci)) {
 		edac_dbg(0, "MC: failed edac_mc_add_mc()\n");
-		/* FIXME: perhaps some code should go here that disables error
-		 * reporting if we just enabled it
-		 */
+		/* Disable error reporting if we just enabled it */
+		if (enabled_error_reporting)
+			i7300_set_error_reporting(mci, false);
 		goto fail1;
 	}
 
@@ -1147,6 +1154,8 @@ static void i7300_remove_one(struct pci_dev *pdev)
 
 	tmp = ((struct i7300_pvt *)mci->pvt_info)->tmp_prt_buffer;
 
+	/* Disable error reporting before unregistering device */
+	i7300_set_error_reporting(mci, false);
 	/* retrieve references to resources, and free those resources */
 	i7300_put_devices(mci);
 
-- 
2.43.0

