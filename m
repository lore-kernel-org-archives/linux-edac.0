Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA803BBA1E
	for <linux-edac@vger.kernel.org>; Tue, 14 Jul 2026 12:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031312; cv=none; b=Sp3+kJ5PuPO5Nnnjdw00FtBI39WnJMD7K9e5usxyjmI3tLsjWA2Htu9PrbzHIg2ZX6T2pNzAYB2XAoXTjB6/VpP7uBTwcmP2Pv/3ESM1MRY380D4KTYnboRSzyuHp5XinRm9w5A3r3dDeRgcIVd4jyjOHFiOIeK7a4Qu3XhyEIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031312; c=relaxed/simple;
	bh=F+mHpWa8IcPY+FvXNY7OKES91E6+JJEyZxNUfYTkodw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SYpE6DAWQtUBz7f5Uos8Y2IXccLJW17lfPlk9iRMnT1bgT72ubGfxpXv8vwZIimAZuajr89nvaIlGVBkX/pckVVLRw6Rh+daCVUvpo9pOiYM/EKy0XqDQ0dBOk/GOeNXJiLEk8wwv0AspzBPweVhRbbN9EaNEMjFnXPa2H0OdXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fc7obx5N; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fc7obx5N"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1588246a91.0
        for <linux-edac@vger.kernel.org>; Tue, 14 Jul 2026 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784031307; x=1784636107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=27cyps45zbsmskkypwM01rgCccgqyiOxEmhzhyJ9k74=;
        b=Fc7obx5NbZtHtrPHkboDlVZmMIN1cL9KBmQp4QaocVMquStZMVMZnNtodboHUu4jjd
         W6fM+rxtOWHysoFb4N8VY/j9+IAePRPPUdsIxbjPSCnWixVJseJxtTZygKwuuusgCniI
         DJt+ZLWoASW9OKm7PxQGVqHI9amp7Ej8urf7o7uXKzVv1hciQR5+w2o0m8+rXIWjBgvw
         a+9mYMnOT/dOhqH9C6/whRUzz91ubgTnAEgKxK7jqlDXY5dMQSCBsLnihD+34eaViYbe
         PKJdSCEb/uJVV8Kc6q25rMkQEyP4JWjfEPrT+eV0IXczvYXLkzeuzEBQuIccd2KaGsmk
         b3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031307; x=1784636107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27cyps45zbsmskkypwM01rgCccgqyiOxEmhzhyJ9k74=;
        b=sIJOBCmiWiA0i+AIlOKIfy/Z8hNEfhdPYS6XCKIB3VyO0a3mgb2FsDoelrQvCHUqYZ
         dJokAd7stq+AZOCSsZ/sARuKT4RQln7mC1AjTZ1AYfEj0GzUrl9/la356Tn4KOE9Lu9c
         EJ77xrCmbZ0h8At9QeZqUa/WaygsBC4SJ29trjMi7cm0TUMhNYwE72nHBAEv6hpLQk+o
         TCF2jIQ6RyaO1hwmWlebXkyiWgjtOtSE3GtmPooKkLIYLBvao42PYD8I1gbEvzoFB/iu
         UOYhvH7ttGzU1pYlkxWp/BHoP7mrOyCQUXiXblkuZiC7uhQnIeK2s75dQmYyVz4LfJWj
         JiQw==
X-Forwarded-Encrypted: i=1; AHgh+Roe/sMFlH0LiWJB4geyn71Y/pHXm9ClGLR6CcO2eFLzZixuH0UsDSJjcqsI0pu8AQy7la82fe3dCFve@vger.kernel.org
X-Gm-Message-State: AOJu0YxD+9WRb4Hg/9p8ZF1IsZS6lVaW9dD8PDuTP9Ujifhgn66jeGYx
	gK457SiVr11884gXCT7SrGT5LaUrP9v/IwvxzWIPcKr+SdN425YnNHXi
X-Gm-Gg: AfdE7cmsWH4BHgO23q4bjRZyZR6ffd+vJAxDcfp+MjSIx03UXKME0ZBbfQhIryYE2Zz
	+PXsmUebi6wk45EriHb8Mw8n2O3BUqT3aQ10S5CWd1XW1iu+X01pqQRMAS3O9PdWSMSrdtm0A20
	UekAtPldoA/JAvEraXtl8twCm3qPh6RGaLkVQ+G6VLBQ3mn8ScD6bMTipNlWh64EoV1tqfmWlV2
	sxis5SfhnD9eF7ETzCvynXYJEEqrwbTYGXrB9srn8AuCJdd5AKkrtbIULALbg8/e+/fh8jzWkg6
	i4gSQ7sAmowEG8rHe3SGkrVUUdne96NpfYUjDXyJRymiAVC2bDlKYBB1MICtoeqLiix9IdSS6Zc
	6OKgVF+mbNdmWO2bg88m+D+HUmnrSOyfe6iAsE89V50zQcY5j4op418DX7MvDaVy60o2k0WALSW
	ygmsBn/A==
X-Received: by 2002:a17:90b:1c0d:b0:387:e0bb:57f9 with SMTP id 98e67ed59e1d1-38e1af82809mr2449294a91.42.1784031307300;
        Tue, 14 Jul 2026 05:15:07 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e17443f4fsm1399012a91.11.2026.07.14.05.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:15:06 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Qiushi Wu <wu000273@umn.edu>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] EDAC/device: Fix double free on sysfs registration failure
Date: Tue, 14 Jul 2026 20:11:13 +0800
Message-ID: <20260714121113.1488956-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_device_alloc_ctl_info() allocates dev_ctl and passes it to
edac_device_register_sysfs_main_kobj() to initialize its embedded
kobject.

If kobject_init_and_add() fails, the helper calls kobject_put(). The
final reference invokes edac_device_ctrl_master_release(), which calls
__edac_device_free_ctl_info() and frees dev_ctl for the first time.

After the helper returns an error, edac_device_alloc_ctl_info() jumps
to its free label and calls __edac_device_free_ctl_info() on the same
object again, resulting in a double free. The helper also accesses
edac_dev after kobject_put() may already have freed it.

Make the registration helper release edac_dev on every failure path
and return directly from the allocator when registration fails. Avoid
accessing the object after kobject_put() transfers cleanup to the
release callback.

This issue was found by a static analysis tool I am developing.

Fixes: 17ed808ad243 ("EDAC: Fix reference count leaks")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/edac/edac_device.c       |  2 +-
 drivers/edac/edac_device_sysfs.c | 20 +++++++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/edac_device.c b/drivers/edac/edac_device.c
index cf0d3c2dfc04..ce986dc341cb 100644
--- a/drivers/edac/edac_device.c
+++ b/drivers/edac/edac_device.c
@@ -133,7 +133,7 @@ edac_device_alloc_ctl_info(unsigned pvt_sz, char *dev_name, unsigned nr_instance
 	 */
 	err = edac_device_register_sysfs_main_kobj(dev_ctl);
 	if (err)
-		goto free;
+		return NULL;
 
 	/* at this point, the root kobj is valid, and in order to
 	 * 'free' the object, then the function:
diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index b1c2717cd023..acab6c07f304 100644
--- a/drivers/edac/edac_device_sysfs.c
+++ b/drivers/edac/edac_device_sysfs.c
@@ -247,15 +247,17 @@ int edac_device_register_sysfs_main_kobj(struct edac_device_ctl_info *edac_dev)
 	edac_dev->owner = THIS_MODULE;
 
 	if (!try_module_get(edac_dev->owner))
-		goto err_out;
+		goto free_ctl_info;
 
 	/* register */
 	dev_root = bus_get_dev_root(edac_subsys);
-	if (dev_root) {
-		err = kobject_init_and_add(&edac_dev->kobj, &ktype_device_ctrl,
-					   &dev_root->kobj, "%s", edac_dev->name);
-		put_device(dev_root);
-	}
+	if (!dev_root)
+		goto module_put;
+
+	err = kobject_init_and_add(&edac_dev->kobj, &ktype_device_ctrl,
+				   &dev_root->kobj, "%s", edac_dev->name);
+	put_device(dev_root);
+
 	if (err) {
 		edac_dbg(1, "Failed to register '.../edac/%s'\n",
 			 edac_dev->name);
@@ -274,9 +276,13 @@ int edac_device_register_sysfs_main_kobj(struct edac_device_ctl_info *edac_dev)
 	/* Error exit stack */
 err_kobj_reg:
 	kobject_put(&edac_dev->kobj);
+	return err;
+
+module_put:
 	module_put(edac_dev->owner);
 
-err_out:
+free_ctl_info:
+	__edac_device_free_ctl_info(edac_dev);
 	return err;
 }
 
-- 
2.43.0

