Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296309443
	for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538760; cv=none; b=YEnCiy9/dgwnTb1t617do+dGYTdZAY77WPIv89//DJpreh1kjmcYO3YFnl42VrAWh6HrJIioXgYosJ25azeZcVmlgFXlBuSRdbiHyRObokYoNsiAiFkphKLnzWDUDpWLjAZovEyi3vg5Rv3dWsgqwUXA92DPYkB47XunRDBhDHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538760; c=relaxed/simple;
	bh=Ooim/KmN2nIFhfxh8aMEiGhHhv+ALWQIlikK5bIHVnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7gc9Eox2BJ6wySlikftHF6XA666LTJlW+VU4d7l0a3hUUw+QDcbeVzK/6SXxM0acsV3Z3pskFlGIlV49Y+9LuZpW6c8xgXrfCkZFJJYinkkvTiZKjUl04lhK4SI6Vbko+nKoIoUu4M4hf/gxKiCXTi1/ls0xbU37oyDiw4wZ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmsLhSg9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmsLhSg9"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f943870baso331076b3a.1
        for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 01:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777538758; x=1778143558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mutyOT3fXaewYxCKG2QeOjrqfAyJlSp13BZm4O0zTHE=;
        b=XmsLhSg9nllSgZRvz4lzKX/yI4H6nsMuiZoF/fGK94IgZ8G7Qs5lvXv3QoLAaS6Sts
         VpZYJ7Aa/fzS7q4F090JdDtWsJOaSdKBME7kTvr4zS/GQvH01V6eVGoNF7JjERfkdH7W
         +FXuXssAfXOxC6HWIVDhby6SSaVYMhAkZspCrI4i2A75qRSWEGnLtORR21ZKl6jY5JqA
         mvhQn9poNdzapIX3lPZceE7gS3F694LyTa6RczzJ3BYlzAH2XlWetFC6bMtPH3K5MZSX
         CO84LNDx51NELpX1te+2CfoGb8BkfZmyWG5rkRxtt6W2E6VHpT30hbTo3Ms+2LcEwEMn
         cvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538758; x=1778143558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mutyOT3fXaewYxCKG2QeOjrqfAyJlSp13BZm4O0zTHE=;
        b=VRQGd/LWYFvDdC7GGur0Hqab+P9W7sMWd5hNoCBABteSPLCDAv3RGSIwjxE9GgQBKW
         +IbdCIG9OIWX1x0LcUz9iHFHZMqFA9YJIbVf817HnplUFBK1d1hLBz/w+jyASVlJHyH3
         kRn6MJUGDb88ZR77ex9sd5sVeJXAOUxUVr0v+eZToxnS3hLACDs2eKrTjIxbXXmDsHxx
         Vced/EBv0R2aOTyvMPimlTrSPTMlrfXL1MxinwzYMOGJV7VH4ngCVL3GJV9a1wB7VBrn
         ZCAFLtSzvnEOfNKMzlYB8JPj+VZWjucXkou1r5W2vvrsdsHZhzj9y/lkGGEOe3lY/vcz
         UIUA==
X-Forwarded-Encrypted: i=1; AFNElJ//zmCPfJbRpT/EWVwHFlLidQmEiSrX3GHpzI8mvAP7EBaoZRj/2+5Nr5uQTmeCo2YZfzjls0Zfx3Ce@vger.kernel.org
X-Gm-Message-State: AOJu0YwnwSIqTf/VrAVy0pxtTB1PcHgwWH2JARa6YtyDbTKYh4UoW+UM
	a0gQdnuDsYhJNkXJTb++QlC/RQHMF5gescoUFrtc2y5cOU7B8OwJASHl
X-Gm-Gg: AeBDievxEDjmLX1PS0dr2AEgGDstTKIBG2QKp1mjTAtrKhMSXeB8WhqYhMzbOdR2/kL
	1rtXDcRy4u8RkdtbEM6A7tF40IJQiWH43cN8HFzeEhbxoUGq38FAepWGEUaloFrnpIPN00RV5Z9
	pV0BI5WSAm2k2oeKoDVtHjKHQCMj8LF22QiAEv8kTO+iGwtmzlyi008wvLWJRvA072oVIoaSMyq
	wCMOhuE0txGZPxFYAGDMtsHItR6yG8U5hKAlFI/24oq07O6lXa/ExK0xdpJSbuHSBWhH1W7t3lM
	jbkWW3U9SltHo69/+ERfEHi1AtxpfWwNcV4WfscBFRcfKR/o97VDkuXgELPOCs1FPeinQCk++Zi
	WkmFvrcLEfiNkeL2sqXXlY98Dv2othuLP8Z/pnF8eoZezEreKKLBVAYz4Q6aVZaDtBpZgFuzoKb
	ZQ5ECb34Ei5QwtUdaU6PR9xzvytKFB56rtmIBL9ANVDvOl+h80dGjWMUxP5YlSHGvZflTQN5R4i
	t9t7UzItA==
X-Received: by 2002:a05:6a20:1592:b0:398:79a8:5bf4 with SMTP id adf61e73a8af0-3a3cf7d6566mr2347823637.37.1777538758481;
        Thu, 30 Apr 2026 01:45:58 -0700 (PDT)
Received: from pop-os.. ([103.100.151.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd606a079sm4133130a12.12.2026.04.30.01.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:45:58 -0700 (PDT)
From: Tushar Tibude <tushar.tibude1000@gmail.com>
To: mchehab@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: qiuxu.zhuo@intel.com,
	Tushar Tibude <tushar.tibude1000@gmail.com>
Subject: [PATCH 2/3] EDAC: i5100: disable error reporting at teardown and create helper
Date: Thu, 30 Apr 2026 14:12:22 +0530
Message-ID: <20260430084223.9298-3-tushar.tibude1000@gmail.com>
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

Error reporting is enabled during init but not reverted when init fails.
It is also not disabled at normal driver teardown.

Create i5100_set_error_reporting() to enable/disable reporting. Move
enable reporting write to after initialization success. Disable reporting
at driver teardown.

Signed-off-by: Tushar Tibude <tushar.tibude1000@gmail.com>
---
 drivers/edac/i5100_edac.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/i5100_edac.c b/drivers/edac/i5100_edac.c
index d470afe65..d30919ceb 100644
--- a/drivers/edac/i5100_edac.c
+++ b/drivers/edac/i5100_edac.c
@@ -859,6 +859,21 @@ static void i5100_init_csrows(struct mem_ctl_info *mci)
 	}
 }
 
+static void i5100_set_error_reporting(struct pci_dev *pdev, bool enable)
+{
+	u32 dw;
+
+	pci_read_config_dword(pdev, I5100_EMASK_MEM, &dw);
+
+	/* Enable with 0, disable with 1 */
+	if (enable)
+		dw &= ~I5100_FERR_NF_MEM_ANY_MASK;
+	else
+		dw |= I5100_FERR_NF_MEM_ANY_MASK;
+
+	pci_write_config_dword(pdev, I5100_EMASK_MEM, dw);
+}
+
 /****************************************************************************
  *                       Error injection routines
  ****************************************************************************/
@@ -1004,11 +1019,6 @@ static int i5100_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_read_config_dword(pdev, I5100_MS, &dw);
 	ranksperch = !!(dw & (1 << 8)) * 2 + 4;
 
-	/* enable error reporting... */
-	pci_read_config_dword(pdev, I5100_EMASK_MEM, &dw);
-	dw &= ~I5100_FERR_NF_MEM_ANY_MASK;
-	pci_write_config_dword(pdev, I5100_EMASK_MEM, dw);
-
 	/* device 21, func 0, Channel 0 Memory Map, Error Flag/Mask, etc... */
 	ch0mm = pci_get_device_func(PCI_VENDOR_ID_INTEL,
 				    PCI_DEVICE_ID_INTEL_5100_21, 0);
@@ -1125,6 +1135,9 @@ static int i5100_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	i5100_setup_debugfs(mci);
 
+	/* Enable error reporting on success */
+	i5100_set_error_reporting(pdev, true);
+
 	return ret;
 
 bail_scrub:
@@ -1169,6 +1182,9 @@ static void i5100_remove_one(struct pci_dev *pdev)
 
 	priv = mci->pvt_info;
 
+	/* Disable error reporting at teardown */
+	i5100_set_error_reporting(pdev, false);
+
 	edac_debugfs_remove_recursive(priv->debugfs);
 
 	priv->scrub_enable = 0;
-- 
2.43.0

