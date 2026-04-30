Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B253FD15C
	for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538748; cv=none; b=jfJmQBqtIm2C2MqOLs8Q2QJ+jA0FqjMJNrvwpc3weJ9TDEZxrBAM3SKcTlq5h/8lSWlZow/8sKV+NdNXkLUewX9qvNmhBSGaUgr3ByLUE/9Wz2TLVSVfCQqpgb+9j+p5uNu/m9GDyqWbIOApk6z/+5kIvylTowBC7yP13dEPTCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538748; c=relaxed/simple;
	bh=zNaOZflB6e7Ft0qawBELaCQa5FF6U9GlVXigu47nyZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CsQtWGJdZl78VHb0U/QKFffOHpZx/qZZYW8AHHWB/uUzOysZ8eFdxpSD6hWGquaPi4s/choB1OeJ6eW5aDgvD1tNiI+edV+VOe8N2u8I7Xk0sOglrQlkkITTVAyww07YdZVmXf++7m6WWlfAYQ5uzdIWyeX3+ABa1TEIZ4vVvRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbldwNAh; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbldwNAh"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c6e2355739dso239006a12.2
        for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 01:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777538746; x=1778143546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oAnsdCQW1OoUyOR2rZp3Ze+AtzgHFux/tBtnjVyiIM=;
        b=VbldwNAh9eie+oYXd7bchSx2udfaUM5gNxVPLrW90ZjN+RNY1SoskRjcZJmY+ORZUh
         byQBsltZe9zCF4PUA9hasbtbOBUDxS04P/dPLTN7uPAnXEH1KBtoP9q9Ea7H5R1shXWK
         2H1hDx5fhYXRek9rcSHh80zKNjp0IhVIB+ypY5KR8/zFnxUUIz2ohN6GV/ff2pIJHa+0
         TepWg2vekKpnjs92+emuSabSpPsPAaiyCGvYVSd0+q/yo47BADrnEU1dkEvyPGKF/DLC
         i59bknEW76DWP734/BcLVQyC7dNsFIFpdsoBp74Tt4uSYTgO3NJyoSMAOY9toyNcwkNE
         7U5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538746; x=1778143546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oAnsdCQW1OoUyOR2rZp3Ze+AtzgHFux/tBtnjVyiIM=;
        b=fRt03NCYGaFyrCf1qV2rB4ZEWa1KAFxbneufeYTz5IRHaF+o9st3y+/po879yNXofF
         ZRozQGj+5Bbl2x1r5BeSxaII1qF3QckDAX62Ao8/MckRgsCBQ2Lz4buhzE/hYVItn5Nk
         fNuVz2et82pwxrzoxqp+ZOulq0PDyBwl03nXqO39JdNotIoOqZS34Hq5BuLS/FPzg3il
         aA8gHFMa7mRjuhz8wzi7Ox+MXDvr62yuAQG/L7/Gsk+LrxvoFULYQ7luox1vanjp6vAI
         jpN7CFHmXsV53qhYSFfXenYMjcYUOhkhN1gk5a5Cl/mmJmz3QQLMznc8qWFv2u4TKrP3
         U2xw==
X-Forwarded-Encrypted: i=1; AFNElJ8FMYR7HY1WMtQKFeRXH6RJG+t2N+CPdurpatwN+X3ltJFm64Csbk4QfG5NOz5eK3b03ikR1WPSnxet@vger.kernel.org
X-Gm-Message-State: AOJu0YwOgzI5nhiTyJyiNoeXTk0NhIePDGD5lkKd9q7FW/Rypl/Ze6bZ
	GqfEGm1oFmsOuZMklbvGwXr6aBr4Hv6HwP2mYoNAeFW1Psj5VIU6gTy0
X-Gm-Gg: AeBDiev4g+xvSPHlX2QWBZwbUhC8taMAVeo+eAIWpD7U238SiB4zhooNiX7uOSPd223
	SgnEtg6KB01dm129snr3oGixb4q8+Tao6PVh3X80N2I8OBR8QHaC9+kzXRU7XeQq/TczIanL8ay
	XrF0D5plpdszCIpwpvxZxdTTZ12sFlJLliDFLiwxIbXmUpmCHl0z2962gcjRtXwqlL8Up3xTMZX
	6hnC32EWpq/BMjet4qIlJJbzsfWay1XWk84vI3lsBMNuoRpfZR8MntUGvEkFx4DFXl2eGD07lec
	0ORQQ7UhvDAOu7qli5ElM70jfxN2fnwKLljnpfV9wbPe5vkGkSIbLvCh9FYXHpLpG6Pitk4SGiv
	7u2PL26jX0Bq/YAtf0NadrWVIw77BVbNjs0y9FmTMHdvnj0qXCiQXBayda/f4/dytRez2LY2n8/
	DNeXBt6r4FvDk/PlyroOnle2G3Ruw6WYQvTJ3miKnXEn6eno2NjD7AAWLww0ieTX/Xdi6+bF0=
X-Received: by 2002:a05:6a21:99a3:b0:3a0:129a:9748 with SMTP id adf61e73a8af0-3a3cf64411amr2293644637.25.1777538746470;
        Thu, 30 Apr 2026 01:45:46 -0700 (PDT)
Received: from pop-os.. ([103.100.151.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd606a079sm4133130a12.12.2026.04.30.01.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:45:46 -0700 (PDT)
From: Tushar Tibude <tushar.tibude1000@gmail.com>
To: mchehab@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: qiuxu.zhuo@intel.com,
	Tushar Tibude <tushar.tibude1000@gmail.com>
Subject: [PATCH 1/3] EDAC: i5000: disable error reporting at teardown and refactor helper
Date: Thu, 30 Apr 2026 14:12:21 +0530
Message-ID: <20260430084223.9298-2-tushar.tibude1000@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430084223.9298-1-tushar.tibude1000@gmail.com>
References: <20260430084223.9298-1-tushar.tibude1000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If error reporting is enabled during initialization but initialization
fails immediately after, or during normal driver teardown, error reporting
is left enabled in the mask register even after exit.

Replace i5000_enable_error_reporting() with i5000_set_error_reporting()
to combine enabling/disabling. Disable reporting at initialization
failure and driver exit, before call to i5000_put_devices() for cleanup.

This ensures clean hardware handling by disabling any unused error
reporting bits before exiting.

Signed-off-by: Tushar Tibude <tushar.tibude1000@gmail.com>
---
 drivers/edac/i5000_edac.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
index 471b8540d..c0faf55f7 100644
--- a/drivers/edac/i5000_edac.c
+++ b/drivers/edac/i5000_edac.c
@@ -352,6 +352,9 @@ struct i5000_pvt {
 	/* Actual values for this controller */
 	int maxch;		/* Max channels */
 	int maxdimmperch;	/* Max DIMMs per channel */
+
+	/* Hardware error reporting status */
+	bool enabled_error_reporting;
 };
 
 /* I5000 MCH error information retrieved from Hardware */
@@ -1302,10 +1305,10 @@ static int i5000_init_csrows(struct mem_ctl_info *mci)
 }
 
 /*
- *	i5000_enable_error_reporting
- *			Turn on the memory reporting features of the hardware
+ *	i5000_set_error_reporting
+ *			Turn on/off the memory reporting features of the hardware
  */
-static void i5000_enable_error_reporting(struct mem_ctl_info *mci)
+static void i5000_set_error_reporting(struct mem_ctl_info *mci, bool enable)
 {
 	struct i5000_pvt *pvt;
 	u32 fbd_error_mask;
@@ -1316,8 +1319,11 @@ static void i5000_enable_error_reporting(struct mem_ctl_info *mci)
 	pci_read_config_dword(pvt->branchmap_werrors, EMASK_FBD,
 			&fbd_error_mask);
 
-	/* Enable with a '0' */
-	fbd_error_mask &= ~(ENABLE_EMASK_ALL);
+	/* Enable with 0, disable with 1 */
+	if (enable)
+		fbd_error_mask &= ~(ENABLE_EMASK_ALL);
+	else
+		fbd_error_mask |= ENABLE_EMASK_ALL;
 
 	pci_write_config_dword(pvt->branchmap_werrors, EMASK_FBD,
 			fbd_error_mask);
@@ -1435,17 +1441,19 @@ static int i5000_probe1(struct pci_dev *pdev, int dev_idx)
 	if (i5000_init_csrows(mci)) {
 		edac_dbg(0, "MC: Setting mci->edac_cap to EDAC_FLAG_NONE because i5000_init_csrows() returned nonzero value\n");
 		mci->edac_cap = EDAC_FLAG_NONE;	/* no csrows found */
+		pvt->enabled_error_reporting = false;
 	} else {
 		edac_dbg(1, "MC: Enable error reporting now\n");
-		i5000_enable_error_reporting(mci);
+		i5000_set_error_reporting(mci, true);
+		pvt->enabled_error_reporting = true;
 	}
 
 	/* add this new MC control structure to EDAC's list of MCs */
 	if (edac_mc_add_mc(mci)) {
 		edac_dbg(0, "MC: failed edac_mc_add_mc()\n");
-		/* FIXME: perhaps some code should go here that disables error
-		 * reporting if we just enabled it
-		 */
+		/* Disable error reporting if we previously enabled it */
+		if (pvt->enabled_error_reporting)
+			i5000_set_error_reporting(mci, false);
 		goto fail1;
 	}
 
@@ -1503,6 +1511,7 @@ static int i5000_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 static void i5000_remove_one(struct pci_dev *pdev)
 {
 	struct mem_ctl_info *mci;
+	struct i5000_pvt *pvt;
 
 	edac_dbg(0, "\n");
 
@@ -1512,6 +1521,12 @@ static void i5000_remove_one(struct pci_dev *pdev)
 	if ((mci = edac_mc_del_mc(&pdev->dev)) == NULL)
 		return;
 
+	pvt = mci->pvt_info;
+
+	/* Disable error reporting on teardown */
+	if (pvt->enabled_error_reporting)
+		i5000_set_error_reporting(mci, false);
+
 	/* retrieve references to resources, and free those resources */
 	i5000_put_devices(mci);
 	edac_mc_free(mci);
-- 
2.43.0

