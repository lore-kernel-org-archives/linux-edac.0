Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8215C3B8BA5
	for <linux-edac@vger.kernel.org>; Mon, 27 Apr 2026 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292886; cv=none; b=DINoRy9wyO/VyV09BR91ncDa8GUrSHybawcY4tffHaiuDzyY1dtz+7yiIOJZhEn1YDqTaFSpvGWsnbgMs+7SYwTfQ/Vehb+2PSmR7EEZg0n30TB9CwqCpKF6to/rnYk1J7O+WHnA9teC77zpURYqSdwPUKKrp+jPDj6rsujqffI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292886; c=relaxed/simple;
	bh=59g5x8oL3dXNXG/7rmBXwTNF2wUxcnqtxkhXo0sMD1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bDs2SWkV8J6tlIyN/uGE+WtwGnUQ//2h6ziGKuO9XpjuKUU8oD+ORODypI5XE786lzc1nSFkhDvXtmiv2aqCWq2nj29k8v/7ekWDkTRTcGYzewis0JhnUbozj0jJjiq07cV20KvmRAM3bX35lMTtM9IBf2Gpn+u4omFJx64z6H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9Qe1b6s; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9Qe1b6s"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c7980c060cfso3481637a12.2
        for <linux-edac@vger.kernel.org>; Mon, 27 Apr 2026 05:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777292885; x=1777897685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4BYgcnNixN0+Cg5L/UGozhkIh+4ogRN8jodsk41BYk=;
        b=b9Qe1b6sOxmyumJA4r704zVIeCuXs3TkFCez5gi8r5zSqhImqWqu7S4xVRNU1IoDAL
         xJoyNKX9zh40/rGNyphbnf6AAPERNMee+uq+f/amgxBTK1pJaCPsTVlN2LRwxDU++jUe
         /L46m1i8bxUjfCqNapquIHwtUIo5WEOLVy45vQknXz9Rh25wt31O0Ka5+jq/UJfFi0tO
         WCoD3zaXNZTN+uQmPo6Gsdz1JBCybhmXuMuWuEO1GLkkFPFJJhaB6fzayg3YDnzkQ7im
         zPmH7+3trKlWb80YJ7Lhcqbcf1vkxRD3LkIf/ftpzlS4nFAuLsgpvsxoSVotflkV3VKH
         OFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777292885; x=1777897685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4BYgcnNixN0+Cg5L/UGozhkIh+4ogRN8jodsk41BYk=;
        b=gNjtHkINPkWTsC138nsZns830OMO//x1+Umaq5I9eUTrLKBqq73NT3/lAlHCI0ydjv
         vnXgoXlzsRd4PV1BIdX4K+3D+RusDndayL5GbgfvFvSyktc7qwjvE2s7YGrNEuQQ8b0n
         25RtweoPWQD49iVpfj5s0zub05iiRTPY6yGLJn3GcZaWgKbDq0G0HkOUAfg6NvB18ujQ
         r31vBQRWefQXBEGHsKbljuVfxuZb9ph8iBnGhP+iFIKicvAcPqKOtceBdawFc2WmTD8p
         H5i1YhsRk5BQIE3UpMaUukPsLJSj1OT6Bix2rhHdKGvrkczKK39FoQztoexijOEv7aNG
         yJaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XwITGwIme1C18fSP+8dT0h4rNLgakbR92VPMH/+xoQKRerlNzGTt3QS2hB7sSu0iS97ONDORCsLpU@vger.kernel.org
X-Gm-Message-State: AOJu0YwN76VGeGp6L7HevviWYWwWTG4R+OXHbsNI1ipYzsvDM92JONVw
	XqLoSVJaVUaMlFhWRPcL9JTi1djIpXBPQTha/8j5JViym9pNBhS1ifj3
X-Gm-Gg: AeBDietobRz0asR7oB/MbjzgT8HPPtS9f8UiXQdeLhpimYD/OgB/viIJbSFucLY9QlK
	efAT4gBHgLf6JXu+1iOVkjr4GBzlHb0HRNntdmG5pZ/8VyQzcHsjRKjf7Qs+Ez63pwIz+YBcijF
	ZFGIzTBIDzDYCSzy250ejk3TxAemujFad6yme6WLu3aY2VaqbKO55GtKR7O6pwJ5GIhWCBMm06e
	3XSVPur+k0eYCN73RchTMbDho1Y2H7s7deT3ZzfX0cg9E/Jk3JE6pQTMQBOY1J7FpXaQTWJn8oE
	hujZJ/DtvCqnIwRL/3xwXjCEEqNYVJkXkyeckCfillp3/tAn4bq8G/7RgL1HDIxsmMFQYh196f3
	0yDNd3M1qUedZuJQ9HJOxRhbe6b6E93EGnXy1AUCCD1rKuuFiVB5Dv0CwBuSbJAwaINf3/wgnjc
	hJgDAwOhgUiFUAKlCyDDnB1PcOTTIDHSKqKS7jsklPi/1qY/1svw==
X-Received: by 2002:a05:6a21:e081:b0:3a2:ebfc:6bf3 with SMTP id adf61e73a8af0-3a2ebfc6ea2mr31621648637.29.1777292884695;
        Mon, 27 Apr 2026 05:28:04 -0700 (PDT)
Received: from pop-os.. ([103.100.151.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703ddf8sm24817029a12.28.2026.04.27.05.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:28:04 -0700 (PDT)
From: Tushar Tibude <tushar.tibude1000@gmail.com>
To: mchehab@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tushar Tibude <tushar.tibude1000@gmail.com>
Subject: [PATCH] EDAC: i7300: disable error reporting if init fails
Date: Mon, 27 Apr 2026 17:56:22 +0530
Message-ID: <20260427122622.14981-1-tushar.tibude1000@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If error reporting is enabled during initialization but initialization
fails immediately after, error reporting is left enabled in the mask
register even after exit.

Create the i7300_disable_error_reporting() function to disable error
reporting bits in the mask register EMASK_FBD. Call it at initialization
failure, before call to i7300_put_devices() for cleanup.

This ensures clean hardware handling by disabling any unused error
reporting bits before exiting.

Signed-off-by: Tushar Tibude <tushar.tibude1000@gmail.com>
---
 drivers/edac/i7300_edac.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/i7300_edac.c b/drivers/edac/i7300_edac.c
index 69068f8d0..989cf53e9 100644
--- a/drivers/edac/i7300_edac.c
+++ b/drivers/edac/i7300_edac.c
@@ -570,6 +570,27 @@ static void i7300_enable_error_reporting(struct mem_ctl_info *mci)
 			       EMASK_FBD, fbd_error_mask);
 }
 
+/**
+ * i7300_disable_error_reporting() - Disable the memory reporting logic at the
+ *				     hardware
+ * @mci: struct mem_ctl_info pointer
+ */
+static void i7300_disable_error_reporting(struct mem_ctl_info *mci)
+{
+	struct i7300_pvt *pvt = mci->pvt_info;
+	u32 fbd_error_mask;
+
+	/* Read the FBD Error Mask Register */
+	pci_read_config_dword(pvt->pci_dev_16_1_fsb_addr_map,
+			      EMASK_FBD, &fbd_error_mask);
+
+	/* Disable by writing '1' */
+	fbd_error_mask |= EMASK_FBD_ERR_MASK;
+
+	pci_write_config_dword(pvt->pci_dev_16_1_fsb_addr_map,
+			       EMASK_FBD, fbd_error_mask);
+}
+
 /************************************************
  * i7300 Functions related to memory enumberation
  ************************************************/
@@ -1025,6 +1046,7 @@ static int i7300_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct edac_mc_layer layers[3];
 	struct i7300_pvt *pvt;
 	int rc;
+	bool enabled_error_reporting;
 
 	/* wake up device */
 	rc = pci_enable_device(pdev);
@@ -1084,20 +1106,22 @@ static int i7300_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* initialize the MC control structure 'csrows' table
 	 * with the mapping and control information */
+	enabled_error_reporting = false;
 	if (i7300_get_mc_regs(mci)) {
 		edac_dbg(0, "MC: Setting mci->edac_cap to EDAC_FLAG_NONE because i7300_init_csrows() returned nonzero value\n");
 		mci->edac_cap = EDAC_FLAG_NONE;	/* no csrows found */
 	} else {
 		edac_dbg(1, "MC: Enable error reporting now\n");
 		i7300_enable_error_reporting(mci);
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
+			i7300_disable_error_reporting(mci);
 		goto fail1;
 	}
 
-- 
2.43.0

