Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E29813C9C4
	for <linux-edac@vger.kernel.org>; Sat,  2 May 2026 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777709243; cv=none; b=LPCJIK4SaGAJOZRoAPDi9RDbh5jn6gsPvwIC7d4N3j4hSzl/qs/aLaXF2TgdVNrNl5XVL8172wpotZFzEHSyB2t2kUPQqOTf4EdgnRLejMNPh/WcKWQTT4BCkBTyXj8jgjDkSiP0ZGn9c5sh1OJLxIN/K+3GjcB4Dzv/3XaG50E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777709243; c=relaxed/simple;
	bh=Y0GsKMub/4OTR8Zx0YcZL3MjZWu2UMTbWQrzAySvMSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZUURA+p2OrayKFa5hF0fkZvf++ITrKyzEmPHgbbXpflGhtBmtWwuSKIbuQg19izKjFEx8RSEM6w4PwYufZjIgSK5T6+PY5MVQNOMOeM88oWoNa8CBP9D3A96A7wsuqywx7xvtCZVTuZ7D2h/HLRLJZuZ+jh+x+nIj8dce7u/w9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJcRV2T2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJcRV2T2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b9ec9443c2so3768555ad.1
        for <linux-edac@vger.kernel.org>; Sat, 02 May 2026 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777709241; x=1778314041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWxVmRja0x7kd8GXoEoQw2TSVqotoHY1pCEAPI69Us0=;
        b=mJcRV2T2iex71CjfSdmKKIaKaPQfqgOSuncHEykZPDHJRhoh9avC5pvTfN7fTXcH3H
         OQWYVwrGO3AYQ1/RD6uGQjlg4K2sHGk7694Knw1ndLBmX84mhGIDtfzAx6iWJ+7TqT9W
         Hlll/1129j0EYuBPUhc/dfq1U8FEKcA26/JHZOAkVJo+QL2qmfop59yb8bCaQ3wBD1Un
         2GpznAEP7TdrtQ2Q+aDJeKIxiwRHho89hLj6OKiLh25H+A0ZmS7C6NPeOMmwVhnNXTt+
         SLuuY9jpZtjwW7j1pUFuX7aQGUh4n6Z5nJGT84KKtcJFWtMnDyI8M4gTpw+mENtm72EH
         h8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777709241; x=1778314041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWxVmRja0x7kd8GXoEoQw2TSVqotoHY1pCEAPI69Us0=;
        b=ghFIZCT3XNhSMxsLY+MtWekq8F1+P+9Bo0dNpwftIxYTfQX5RIshxOGYJeTQH44Q0t
         7N8I3Kt0WN1josPd1pCFJAST9GNjkxtT0SZ9i+3plfb+xHMvjn3yQNmttSLMtTJUsk+Y
         Hz3WB439G1aMK3fxq7KWf5+Fip+Aw+3cOCb0TH/FSrYYDOymbLlkZNV8+5YMoCddw5Rd
         ricWPfAKIBV0zQzF4OAgku15uL0XfmkzdivQoTk9RrPGzGFikdrFmZpTvBoMDiA/gpE9
         PVvFaAu5KoES0u3VWm9+SAMcsBw8YSjiGNuU5NYoJZRFGjVGOu/jZJObbmVscqGr9R0F
         3Qog==
X-Forwarded-Encrypted: i=1; AFNElJ+EI1fMiaqQCt3Yre5T8OB9JmvtPVKW9XIBajivqiqF6EO/POh0VeMBBL9LyuV0RSRO1av/BO15ahs/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu13Q7KJCc6AmJVeD9jCua+ZZDcRx81zwKccA4aZLvE+Ny+Nux
	vxWEMynP8HeDBqV2ZHyaPpA0y9WOPYw/QtcX/YmikYCzmfoIQL8iT7dG
X-Gm-Gg: AeBDietmSiIbEOi1sDLXHkCX0rZ3S3l6fhDbsdtCC2APCAhugmKf5KMcZxdR9S3dzkn
	c+9uep7abXO3r+kDowm8cNyGc4rjUvHE/k7PdZrSpZ6KsKUnA0KoJ1CcWuqMnsHxtQxKjCP6tMJ
	yuEOtqSCnnru7nh0zkU5zJle+0pSnz91GZRLROpsiF4hQK+v5mWwsMURCu5ljxAiicJjqAQPbeN
	DYb0bEuDhw3jo7+wZOM2jfJncPwr/QmRC8gKVTUW86m7J104sJ+wMgjkprHqMijMubK8tRkAygG
	wbrnkojxlHzQwW6OokriQDCki+gFs4afJUzCB4VgY9hcJNxpmFW90q26VpoN8ufdrXdBgde9zfq
	1ol3lHsy209KZzGkTsm78jU7JOeHHATE4SDXfahT7O38NxxBme0aKcVpYNDFWBHL7Wn81mucJJk
	CGIRoI9ZosM4c2AcmG4NCTzZI=
X-Received: by 2002:a17:903:3c65:b0:2b0:4fb3:c771 with SMTP id d9443c01a7336-2b9a42ab0b9mr82316735ad.6.1777709240613;
        Sat, 02 May 2026 01:07:20 -0700 (PDT)
Received: from lgs.. ([118.193.39.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaaec82sm42845135ad.24.2026.05.02.01.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 01:07:20 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Qiushi Wu <wu000273@umn.edu>,
	Doug Thompson <dougthompson@xmission.com>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v3] EDAC/sysfs: Fix kobject cleanup after kobject_init_and_add() failure
Date: Sat,  2 May 2026 16:06:47 +0800
Message-ID: <20260502080647.522511-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If kobject_init_and_add() fails, the initialized kobject should be
released with kobject_put(). Otherwise the kobject may leak resources
associated with it.

Some EDAC sysfs error paths currently drop the parent kobject reference
directly after kobject_init_and_add() fails. However, the corresponding
release callbacks of the child kobjects already drop those parent
references. Call kobject_put() on the initialized child kobject instead,
so the release callbacks can unwind the references properly.

In edac_device_register_sysfs_main_kobj(), kobject_put() may call
edac_device_ctrl_master_release(), which drops the module reference and
frees the edac_device_ctl_info object. The error path then calls
module_put(edac_dev->owner). This dereferences edac_dev after it may have
been freed, causing a possible use-after-free, and also drops the module
reference twice.

Track whether kobject_init_and_add() has actually been called. If it has,
rely on the kobject release callback to drop the module reference;
otherwise, drop the module reference directly.

Also handle the EDAC PCI top-level kobject setup carefully: if
kobject_init_and_add() was called and failed, use kobject_put(); if it
was never called, free the allocated kobject directly.

These issues were found by a static analysis tool I am developing.

Fixes: 17ed808ad2431 ("EDAC: Fix reference count leaks")
Fixes: b2ed215a3338 ("Kobject: change drivers/edac to use kobject_init_and_add")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Move kobj_initialized assignment to the kobject_init_and_add() call
    site so it records whether the kobject has actually been initialized.
v3:
  - Fix similar kobject_init_and_add() error paths under drivers/edac/.
  - Fold in the previous edac_device_create_instance() cleanup fix.
  - Put the initialized child kobject instead of the parent kobject.
  - Avoid calling kobject_put() on edac_pci_top_main_kobj if
    kobject_init_and_add() was not called.

 drivers/edac/edac_device_sysfs.c | 12 ++++++++----
 drivers/edac/edac_pci_sysfs.c    | 11 +++++++++--
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index fcebc4ffea26..5e6141a94716 100644
--- a/drivers/edac/edac_device_sysfs.c
+++ b/drivers/edac/edac_device_sysfs.c
@@ -231,6 +231,7 @@ int edac_device_register_sysfs_main_kobj(struct edac_device_ctl_info *edac_dev)
 	struct device *dev_root;
 	const struct bus_type *edac_subsys;
 	int err = -ENODEV;
+	bool kobj_initialized = false;
 
 	edac_dbg(1, "\n");
 
@@ -256,6 +257,7 @@ int edac_device_register_sysfs_main_kobj(struct edac_device_ctl_info *edac_dev)
 	if (dev_root) {
 		err = kobject_init_and_add(&edac_dev->kobj, &ktype_device_ctrl,
 					   &dev_root->kobj, "%s", edac_dev->name);
+		kobj_initialized = true;
 		put_device(dev_root);
 	}
 	if (err) {
@@ -275,8 +277,10 @@ int edac_device_register_sysfs_main_kobj(struct edac_device_ctl_info *edac_dev)
 
 	/* Error exit stack */
 err_kobj_reg:
-	kobject_put(&edac_dev->kobj);
-	module_put(edac_dev->owner);
+	if (kobj_initialized)
+		kobject_put(&edac_dev->kobj);
+	else
+		module_put(edac_dev->owner);
 
 err_out:
 	return err;
@@ -523,7 +527,7 @@ static int edac_device_create_block(struct edac_device_ctl_info *edac_dev,
 				   "%s", block->name);
 	if (err) {
 		edac_dbg(1, "Failed to register instance '%s'\n", block->name);
-		kobject_put(main_kobj);
+		kobject_put(&block->kobj);
 		err = -ENODEV;
 		goto err_out;
 	}
@@ -622,7 +626,7 @@ static int edac_device_create_instance(struct edac_device_ctl_info *edac_dev,
 	if (err != 0) {
 		edac_dbg(2, "Failed to register instance '%s'\n",
 			 instance->name);
-		kobject_put(main_kobj);
+		kobject_put(&instance->kobj);
 		goto err_out;
 	}
 
diff --git a/drivers/edac/edac_pci_sysfs.c b/drivers/edac/edac_pci_sysfs.c
index 446fef0a9399..971ec14742b9 100644
--- a/drivers/edac/edac_pci_sysfs.c
+++ b/drivers/edac/edac_pci_sysfs.c
@@ -176,7 +176,7 @@ static int edac_pci_create_instance_kobj(struct edac_pci_ctl_info *pci, int idx)
 				   edac_pci_top_main_kobj, "pci%d", idx);
 	if (err != 0) {
 		edac_dbg(2, "failed to register instance pci%d\n", idx);
-		kobject_put(edac_pci_top_main_kobj);
+		kobject_put(&pci->kobj);
 		goto error_out;
 	}
 
@@ -340,6 +340,7 @@ static int edac_pci_main_kobj_setup(void)
 	int err = -ENODEV;
 	const struct bus_type *edac_subsys;
 	struct device *dev_root;
+	bool kobj_initialized = false;
 
 	edac_dbg(0, "\n");
 
@@ -374,6 +375,7 @@ static int edac_pci_main_kobj_setup(void)
 		err = kobject_init_and_add(edac_pci_top_main_kobj,
 					   &ktype_edac_pci_main_kobj,
 					   &dev_root->kobj, "pci");
+		kobj_initialized = true;
 		put_device(dev_root);
 	}
 	if (err) {
@@ -392,7 +394,12 @@ static int edac_pci_main_kobj_setup(void)
 
 	/* Error unwind statck */
 kobject_init_and_add_fail:
-	kobject_put(edac_pci_top_main_kobj);
+	if (kobj_initialized) {
+		kobject_put(edac_pci_top_main_kobj);
+		goto decrement_count_fail;
+	}
+
+	kfree(edac_pci_top_main_kobj);
 
 kzalloc_fail:
 	module_put(THIS_MODULE);
-- 
2.43.0

