Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D6F44DB85
	for <linux-edac@vger.kernel.org>; Tue, 28 Apr 2026 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392523; cv=none; b=JWxEGTD9JUUpCkr7VSwEFKmryyzTTzNmydlzs9neIO59lY5rAejWTw0SSwyio1mT0JSlCOcXN1zjLuuWrnvXXHyXzBEMvLAvN2SRwvkSDrImGTxsABh5NNYOemaAnYq3P2NGNvxDaJsfATeoPYhTXnUSHt9gyp0s2W0UeDNjs3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392523; c=relaxed/simple;
	bh=V1pGAOnjlC+TOwNhol7IbkGiJw+8SmDe9aTyVJEfC2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QhOVW4lG24czYgjjkzcAFUVlrENcE7Uj0bZMNu02BqeekkvgRBKgyTlGXMYs+DZ0OVqG1/IfrmqBMH30tDJ6tNrk5LSLoqzDhPaHSs/8znPLmA5CuNB0RiQwbCRg+i90v4BKkyrB9kAnq7mjl3kuEoEF4+cSbmNr315g321PDFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYD+VUBM; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYD+VUBM"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c76c60c7502so4598741a12.0
        for <linux-edac@vger.kernel.org>; Tue, 28 Apr 2026 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777392522; x=1777997322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/HW/8Jj6I5ZLjOIJ6JOHc8L+USqcEpOBHmjRUGy0yb8=;
        b=HYD+VUBM2uTTIVnZkEi19P5j8ba676OWjY6R9VrKsIfio4MWjeUJBl8NEIO+JjQ03D
         eNKj7Eh2FXQK0QGYHSuS4mZEcmg79v4+X60AqZP5it97pvQmcJMZnBJNJmQiGpj/SXEw
         lxOWDwdcYw2lp/BE54KCmLR+LnBGojEu0xSNQnBHeUbbBavbuDGD+/qrNkDhBljY6BgY
         54fAMSlFy9NPjE/LJg4ZcHRjG8vcS7FH7OFHh9rkPc26RxvjCUA7ad6S2tJ0jlsemiML
         VzI+uWct6bxc+7wBTK9leLAh3HN2Q6EFejYl64Kmi0I5hVNPFmYIYoLiFt5nJ9UaWfvj
         Za8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777392522; x=1777997322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HW/8Jj6I5ZLjOIJ6JOHc8L+USqcEpOBHmjRUGy0yb8=;
        b=L0VLxSmrlGhX8b117MzCLha43PiSz/qnFnW02Sun7OA3fKobA8ffaGBtCJWuoEQZ0D
         kk4jGTXf7LOxJY6foF8k0U4hO7yaaLPQxStukcsvlMOBDcj3/GQtxlwVA+Nwr3Lfz/L2
         6wYJvz3edxkzvnAG8wtcIp0j69TY1aec3ME7JyIDrgqhch0ShxGIP0kNSi+mvPeD7dOJ
         NHJEdiDIAJtQRhw3V3rkRP15qgnFNLuvwpkCvDFyXPMbiofeB6M+Zs1vYPDsWResRHxC
         gMCDBSFKI0Z/DDwkdHIyI+0RlIbDiPUktLAkG5B6UIU9+F1HoFJKcJwPArV79jqeonpv
         uFZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jPVLKjtVGNJ+Fmnr4i7EJMREPhB0g7f9j2c+4FlhD1qEAyZiV5Uv1A051a5jBZPz6fFJtHPqgfcgH@vger.kernel.org
X-Gm-Message-State: AOJu0YzjrPS0L5szvYhZC7hIQ/ipFNfmVV8Uc3tWmS0tDh1RmBUTg126
	Kn1P9rsv9Wli/Dw9Gx/KlxjGaVjGJbpuY7zwPG0+/IsVVEMtYjBSp2sY
X-Gm-Gg: AeBDietQy4qEKLpfv2JgFPCokXO9Q7JLW8LuHrdb7eIU2H7rsHYr5805VnsJsvhtrgi
	GwfXnAV9Cw27a7lLfOoQXUBkVz2axRzDVGUvhfEXhudZ05EyTxNdU6r2VKlJPbE7IcdHArTThcC
	oLNeUqrKarcIvAyEyJrDDycZXv/I+S15OYCny1ao4DHUaeVT3FwEx9Uay+DtlcQPuon2LN+SQy9
	8wVHYbTjBkFy3hdEEWXspHesW0cYeTFCJMnTa0b3Xh0O+DjLLNneiyZN+gLYn0vGIR/akznQp1e
	xrylHk69K6biVkfOMR6PToEPnRr9DHFlm3evatLDDe10h+s1gbaY/uY4JfBtyHfzLTj2J9G+yn9
	WPVaY6Vf1TKfwlS1HXjcPjnpq5DEebkXoEzJA722zar7iddeSc9dmWGUq1yRNc3wl7q9TCvGJWD
	CE2FMPBKcsIhcMcOi/0PAq/ew=
X-Received: by 2002:a05:6a20:734b:b0:3a3:1f78:2025 with SMTP id adf61e73a8af0-3a39c14962fmr3553432637.27.1777392521387;
        Tue, 28 Apr 2026 09:08:41 -0700 (PDT)
Received: from lgs.. ([101.36.106.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc299f556sm3637526a12.6.2026.04.28.09.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:08:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Qiushi Wu <wu000273@umn.edu>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v2] EDAC/sysfs: Fix UAF in edac_device_register_sysfs_main_kobj()
Date: Wed, 29 Apr 2026 00:08:28 +0800
Message-ID: <20260428160828.377129-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If kobject_init_and_add() fails, the error path drops the kobject
reference with kobject_put(). This may call
edac_device_ctrl_master_release(), which drops the module reference and
frees the edac_device_ctl_info object.

However, the same error path then calls module_put(edac_dev->owner),
which dereferences edac_dev after it may have been freed. This can cause
a use-after-free and also drops the module reference twice.

Track whether kobject_init_and_add() has been called. If it has, rely on
the kobject release callback to drop the module reference. Otherwise,
drop the module reference directly.

This issue was found by a static analysis tool I am developing.

Fixes: 17ed808ad2431 ("EDAC: Fix reference count leaks")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Move kobj_initialized assignment to the kobject_init_and_add() call
    site so it records whether the kobject has actually been initialized.

 drivers/edac/edac_device_sysfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index fcebc4ffea26..042a30ed55c6 100644
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
-- 
2.43.0

