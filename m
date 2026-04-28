Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD94B217F27
	for <linux-edac@vger.kernel.org>; Tue, 28 Apr 2026 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381717; cv=none; b=sXig6/HpoVXsqdmAsMH8FE6dvqID8m0UEk2zwKbRD1k+14BXNKFSlZfI4AIEMJMAkCthnGJW4Br0V/l/hvMpjCKU842rInhmPuKwAVEeY2SKRan1Kmq4uJg3O3vvalNpVIWRbSMjMcrYaQDz/lF7H4L33fmSjy9Pd1jxuR6SHMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381717; c=relaxed/simple;
	bh=YdXrtZwKYvjpk2mhair6rMBKIDkt4nCJFEM/iu8SLYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FsEBPeHrUgmGHb/gMhToIunRke8BWf6nusB+VdyXybkUdgqeVkAz7vsfmtnKJfAS4OwJhGtGlmfcD1P4wUSctVt94x8NcBpqgZz0JLSTs+tTChbU+hdLEInLzd+JoJvuKvMh1Iytgy1nVwbdK3UTiO1Po/MPGPOGXWw0KL3r3zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8uEURU1; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8uEURU1"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-60579e72ff9so7719786137.1
        for <linux-edac@vger.kernel.org>; Tue, 28 Apr 2026 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777381715; x=1777986515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1C9bdjarJ68xik6wQFz6rZrA9qRQsuuRujyzlx0N/rA=;
        b=s8uEURU1JidqZIjRHiNAIRjWDMc47T4DLnBrUk6gIUL1rRZjxIsBJ6oBB80eXvqvFp
         x0iNJAJGvHp/M3MwUN4nJyUTQlv/Hi/1jMkWUSGppr4puHoMj6wYCFxSNUaDtMM7nJyP
         xbtxLAtBmbDF7c6+C8n1yl5Mqz0otsauqZK6gt3d/F5sxyDfLFFzRtiAaZvEwHC/s1Rd
         Y2Ij8n978jUYeQLXnX3aZL4wQSZkizneZYTQuohj1pcxsnZsCLOcxVkceYEHCpu3n84Y
         XSW0b3QZnHbeBw11cledvuV4qe+KNv3NL6s/2p0BQh4uhbwiPI7qB00ho2kMwHUwxLyA
         JO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381715; x=1777986515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C9bdjarJ68xik6wQFz6rZrA9qRQsuuRujyzlx0N/rA=;
        b=I5LT5x+LvEB/X3tTDyvuQSXO2NQFlfoeFUM8WucGxQ1GKgkvuDws+rvfwmxY6BTBqL
         T8V/bFxWtS8GiDrkAg1iQzkEAb3J79oXZiV0Eexr+wpUPYfu8gojg3rxjxaQgd9SPl9X
         iV8DDSELiOz//el66TuKpYyFg/u1I1ynYGu5OzA/0CYStjLuSAoMlg3qT5Wr0RGIqMaM
         UeIpKflUQTfUuolgrhuWRhC67KKT8rfKFhhbYWj6FEVFc/BAlxFtZSE2ItNTPmLn56Om
         5ZugAcyVnrKLnIB36ixWH8fhF0c84DLn4yDB3oSlGsdz6hEyU4Ae36g9S+06NPu4HSpX
         tfKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lck7sc+tfUDyMX6ndzIgBEmJAfSybuwmQsZyQcwqCnxHLEcgMN2jd7CqVbM/7ZMiHVWb3iSf/ZE8O@vger.kernel.org
X-Gm-Message-State: AOJu0YytajM2clNcwREkE9LIwdul79RwqYuK3jR5HaoRKmp1PhL7rBzz
	0Qa3Q75aJfNik6YG/e8JCKOdG1OzgSZTmHDNFHrDLm1rFL38cVSHJ+dw
X-Gm-Gg: AeBDietMQBowDCxh5dbwFroTc8CQXVgoTxJO0SykN+IXFuzYflTh0R8woHfC4YGfDlS
	qiIhY6yQkEvjz1r1g0JEKO7oSW0LJ7aaomWeyLppd4DE6HD1b6pT42M0tDcazxVDHnZhTszwr/l
	dtuJ0lplPTtTmwXoFoMBhXGwlWWajGoYutkva599AJrzLB8UhC5J2FgNTaal0QRStlFoWHwoiHx
	8/E7tBZx9gbcIWeYH+Cxspz5blNWecVez4JycLtNmM2v/8BMwLWAzB6bsN7kMsZsSalLpVuO1Yj
	jXju6R/HEp6Rp/EpImUa7W87Wxy5gGSaGAB0G+X4wC2+nYXChGpbXgMelxLff5AeLUaE5xVjo2O
	7mK80c7Z+IvraPEhIKMwfumDPH6ONX2hJp3xTw/3yttyGNGVo3sbnxW0PhB9YicCGeI/hWeJLki
	9S+olPfZmFRhv/2XCI
X-Received: by 2002:a05:6102:5613:b0:608:276d:d65b with SMTP id ada2fe7eead31-628068f2c43mr835972137.8.1777381714614;
        Tue, 28 Apr 2026 06:08:34 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::5a26])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-627f5668c8csm1189378137.4.2026.04.28.06.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:08:34 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Qiushi Wu <wu000273@umn.edu>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] EDAC/sysfs: Fix UAF in edac_device_register_sysfs_main_kobj()
Date: Tue, 28 Apr 2026 21:06:08 +0800
Message-ID: <20260428130608.368025-1-lgs201920130244@gmail.com>
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
 drivers/edac/edac_device_sysfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index fcebc4ffea26..32460c6dfb7c 100644
--- a/drivers/edac/edac_device_sysfs.c
+++ b/drivers/edac/edac_device_sysfs.c
@@ -231,6 +231,7 @@ int edac_device_register_sysfs_main_kobj(struct edac_device_ctl_info *edac_dev)
 	struct device *dev_root;
 	const struct bus_type *edac_subsys;
 	int err = -ENODEV;
+	bool kobj_initialized = false;
 
 	edac_dbg(1, "\n");
 
@@ -261,6 +262,7 @@ int edac_device_register_sysfs_main_kobj(struct edac_device_ctl_info *edac_dev)
 	if (err) {
 		edac_dbg(1, "Failed to register '.../edac/%s'\n",
 			 edac_dev->name);
+		kobj_initialized = true;
 		goto err_kobj_reg;
 	}
 	kobject_uevent(&edac_dev->kobj, KOBJ_ADD);
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

