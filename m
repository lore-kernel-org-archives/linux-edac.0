Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA6A347FE1
	for <linux-edac@vger.kernel.org>; Wed, 29 Apr 2026 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456242; cv=none; b=HR49VZQdt3Q8mu39N7SjRF1j/FKLbCWl0IcLTz/rv0Elh4kZ0blSFwNMMTAibO9fRwL9d03ilERTItXKx/JaqF4ID9A3nxEECb2YbtQSeBDeBXxWgieyuB2fpxdM/IMbWP2cxC5GzJztiJXajkQxqMZn1ffreuwQRfKwLNQF2J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456242; c=relaxed/simple;
	bh=Xhf/E0dxLek4yeW5CvMEoss1W02Z/T1jPt0aJBE2XZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sXEi3MErro1ZqWGWISDElJILluyDLYJCA8omyd/PZZxDZQ4lRjfnfMto9Wj/tGe7Q2bzadynkP/uLUOPErFn3kqZPsEzRHVnWaqw8V5h6I+n8XsO58j6Pw00v44jqMUL4zgm1UxO0bljoRJSHUyEk0t9DO3jcaDmg5wIpR2lUcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fV52e1Ds; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fV52e1Ds"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c79467f128cso4671942a12.3
        for <linux-edac@vger.kernel.org>; Wed, 29 Apr 2026 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777456241; x=1778061041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIidhZXldSX5FAAxW3beAM77uagDnufRMwCN2vwXbC4=;
        b=fV52e1DsoTZ8Nvni6zS0C2yizP+E2lka5hqfOCv3W3mXp3w/DWKyHqfit6RLRZVc4u
         Lwb3Irc9fLIVasi97o2BsxEneyK/EMkJot7mhf5bGnZJveLkk+B2sGDdiBFuK7Rw0uPU
         Zx0bcDk7vzzRtDf2LVFMFhfDT309gImdk+WyRdKPergSzKqPbED25QxLCV3QxhWTma3B
         p+Uo+hfqK9jdCpSLXDRzdYfsT0WkjIBarv3xYdBMATq2SGNvoKy/lMVHfDpcnMZ0nGW5
         xtaXmQYOYnK3h3Ci8kyhEEWVNdhn3ngHLLZuIB3Gkp5bSxq5lThbQXUx4XLwkm0xR91h
         xbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777456241; x=1778061041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIidhZXldSX5FAAxW3beAM77uagDnufRMwCN2vwXbC4=;
        b=i5IDHZJhIOcNOzGW3QIi+A9J52Ha9x1GRbV72DhCN5fF8HmmeU831qXM+8wpu/aAQ4
         JnyQmkAUxzVA5rts1s6EIkZiWEx9xsm1JtHhEimVwRI5UaV7Ca9run0cSlByyz8Qcrr2
         zMu5GGh0H+aIyiZIIz9S+cv7/gFUTicubBMUZb8WLTTIqyXIJiqn363mg9Ajm+cIk4My
         14GK6El4StUx+zDj85EMeil7ASCfcV0momMNGvZf/YEhbPavE9S3lt8q+4kaHZKoLjks
         L3Mh2wkZLU8sSZnt/qT12yLeuLhQRZ0neNHcuOjdJ6OqbK/LuSeA13t5Q54FdfPffitT
         PpaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JVH2+AxZYFJQZ1yuT5Xq+5dFlCbYRgU+pTtqfg2Zh5HpC934YFeMlldrhB5vaRfdaXjTRGFZSmfTs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5ykVhFNlguZwz8DJN2ojWiSqy5KM8cbLA5ssyYHBMVMap3/X
	tMDeEGSH99o0EfHlpnUCcPLYgn64f5GTDRzdK0gqlqSUFUHhcLKayGPa
X-Gm-Gg: AeBDievITAfGSN+jlO7mK6KrAUO/omFOjSAdf1c0eRmsOjEyIITu22rbh5502ZJRJAS
	YjYuo0ZXVXKqTFhMFa0nuwKNFWX9hXm6wTEurn45baplMccAomKFoGVbYoIMvUISlIUVHexrB3d
	vlVOkD3I7XlB66wyCp4bWTi9w5PpqYqucnMl5HRwX2SA7EpR/dpz5+IODYBzb8faBjVWFKtJ+YE
	stSirWPvTZBTwGBeKcBpJxhds6SsZw2r9aez2qh8HM8Gi7rLPH3WU6xsDYbUq4Yp9vqGfq715sO
	0v4zQBYA3v6rPukiVrZ2/DetmcovKyrKqUVQAOLipfrZJQg0xFXS0Id5chvQSGMPHM+KiADZiqd
	vVQfbWB67Z8B2O3VXQ9QI36a40eAonRfaXeWrP1ih3aoubnY1ZsoPyDuXFZoghyvIIXC8UP/Q7Y
	BXeY1mqxXjHU0y/Jq5hQyU+4z1r4x1U3GqDK+1H5yQ/u/nVlZlyvO4pt20wpW9qtAH+T9Pshc=
X-Received: by 2002:a17:903:38cd:b0:2ad:d0ff:2ed4 with SMTP id d9443c01a7336-2b98730ca9emr30202235ad.6.1777456240930;
        Wed, 29 Apr 2026 02:50:40 -0700 (PDT)
Received: from pop-os.. ([103.100.151.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893fbbbsm16906765ad.41.2026.04.29.02.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:50:40 -0700 (PDT)
From: Tushar Tibude <tushar.tibude1000@gmail.com>
To: mchehab@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: qiuxu.zhuo@intel.com,
	Tushar Tibude <tushar.tibude1000@gmail.com>
Subject: [PATCH v3] EDAC: i7300: disable error reporting if init fails and refactor helper
Date: Wed, 29 Apr 2026 15:18:06 +0530
Message-ID: <20260429094806.25097-1-tushar.tibude1000@gmail.com>
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
Add enabled reporting flag to i7300_pvt.

This ensures clean hardware handling by disabling any unused error
reporting bits before exiting.

Signed-off-by: Tushar Tibude <tushar.tibude1000@gmail.com>
---
v2:
 - Replace disable function with i7300_set_error_reporting
 - Disable reporting at normal driver exit
 - Move enabled_error_reporting flag initialization
v3:
 - Move enabled_error_reporting flag to i7300_pvt struct
 - Conditionally disable error reporting at normal driver exit
 drivers/edac/i7300_edac.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/edac/i7300_edac.c b/drivers/edac/i7300_edac.c
index 69068f8d0..64bc2d805 100644
--- a/drivers/edac/i7300_edac.c
+++ b/drivers/edac/i7300_edac.c
@@ -111,6 +111,9 @@ struct i7300_pvt {
 
 	/* Temporary buffer for use when preparing error messages */
 	char *tmp_prt_buffer;
+
+	/* Hardware error reporting status */
+	bool enabled_error_reporting;
 };
 
 /* FIXME: Why do we need to have this static? */
@@ -550,11 +553,12 @@ static void i7300_clear_error(struct mem_ctl_info *mci)
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
@@ -563,8 +567,11 @@ static void i7300_enable_error_reporting(struct mem_ctl_info *mci)
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
@@ -1087,17 +1094,19 @@ static int i7300_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (i7300_get_mc_regs(mci)) {
 		edac_dbg(0, "MC: Setting mci->edac_cap to EDAC_FLAG_NONE because i7300_init_csrows() returned nonzero value\n");
 		mci->edac_cap = EDAC_FLAG_NONE;	/* no csrows found */
+		pvt->enabled_error_reporting = false;
 	} else {
 		edac_dbg(1, "MC: Enable error reporting now\n");
-		i7300_enable_error_reporting(mci);
+		i7300_set_error_reporting(mci, true);
+		pvt->enabled_error_reporting = true;
 	}
 
 	/* add this new MC control structure to EDAC's list of MCs */
 	if (edac_mc_add_mc(mci)) {
 		edac_dbg(0, "MC: failed edac_mc_add_mc()\n");
-		/* FIXME: perhaps some code should go here that disables error
-		 * reporting if we just enabled it
-		 */
+		/* Disable error reporting if we just enabled it */
+		if (pvt->enabled_error_reporting)
+			i7300_set_error_reporting(mci, false);
 		goto fail1;
 	}
 
@@ -1134,6 +1143,7 @@ static int i7300_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 static void i7300_remove_one(struct pci_dev *pdev)
 {
 	struct mem_ctl_info *mci;
+	struct i7300_pvt *pvt;
 	char *tmp;
 
 	edac_dbg(0, "\n");
@@ -1145,7 +1155,12 @@ static void i7300_remove_one(struct pci_dev *pdev)
 	if (!mci)
 		return;
 
-	tmp = ((struct i7300_pvt *)mci->pvt_info)->tmp_prt_buffer;
+	pvt = (struct i7300_pvt *)mci->pvt_info;
+	tmp = pvt->tmp_prt_buffer;
+
+	/* Disable error reporting before unregistering device */
+	if (pvt->enabled_error_reporting)
+		i7300_set_error_reporting(mci, false);
 
 	/* retrieve references to resources, and free those resources */
 	i7300_put_devices(mci);
-- 
2.43.0

