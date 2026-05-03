Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2A43A5E64
	for <linux-edac@vger.kernel.org>; Sun,  3 May 2026 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843567; cv=none; b=XHzSijIC4UcrogsM+iCQra49Y3NzBVktG1g4CRFnP+bsA/MBtIOyY+VvZ6/s8G183X39dSo7lWZmheyI3d8Ny3LHoCIoF9KAGAcEdW03bYY/S/lGd1OTlTV2wxNLRY8KpyQGQ4OjcJjtZh+MmrNhE+vDt95Rbl8U8ueOYeSV800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843567; c=relaxed/simple;
	bh=sOT0U3Jr3NVXuqY9Wh2yfJA9ZyQakgYnhkg0dlBZBZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bq/op0x/WRGKEG8kc3QizOM1j5tBVtGnEg9C64q3bKzM0VlDq3FfaVQ6H6c8S4xkRVWoO71AfMXbFgrGsUTilPihoZ74xK/+yUh1Gq/7I1T4wuA4hXdMBtRu/kSwoNPQ3KbKV1VqMuGZSO5wl6zMYGqfdDrT4InfQ9n9n0PooL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zj425PrW; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zj425PrW"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8acb09ddbf6so64044346d6.2
        for <linux-edac@vger.kernel.org>; Sun, 03 May 2026 14:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777843564; x=1778448364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iWPnmaRjwthBH35p5wi/v2yBfUH+F59G77Czz7mgGmQ=;
        b=Zj425PrW0SliUwhWWQqrmIkAwPxfeFW3mR6O6PyphoDif8tCdhgmL5f745lg+cra+k
         P9tXFPZxs6tUlMuOitp8fmgWqkQI0KrFlb1o/rTfMCrUks9qzW8c0MqfuhEvo6zkuhQZ
         0vB5UBJCyUMCQlGCr+ZoX+f2ZTimRhYQUUxz/8WJmcfpJV29p/mHRdzKuNifLkPTmt0+
         KBg6QzXrYHeVvTnnT7guaJgiWdbPDrfjZnLdoRj8dHAfkXvLCbdFM0SYiwt3PM7DI08U
         6PY+FOt4SaYqv3EC9a2b9xiCzoQ0ar95WwwTvGrX5ixctCkWS62aL8NW15OIWjUXMI87
         5lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843564; x=1778448364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWPnmaRjwthBH35p5wi/v2yBfUH+F59G77Czz7mgGmQ=;
        b=ei2lpV9EpzzlTK5dyFz2GpGWb2RdVlG3NtDEGIHLXMXCo4/G08dahtDJlIH/Hsc5fm
         RsXE7Vc55fn1FmRKHrj2WnU4/KalXluxy0WYWqgNAaKmO0BF+vvKZyJ5Fi3IS/JU1Ioa
         icTmPHJEbzKv7i9PrlyBvFzBYVRqAZ09OTlIW7CjRUi+DgV/kDMp0knpkyk+3wsHiqCZ
         KAh5/+doyQNpbrpwAPnKcTjcdCAJuMXCqT2ns3kEcdkc5zhA5DxWGCoMmkd+Ql8e7JbH
         1jrUgI1VFsrmc8fqxAcX/l1YGpGj+C+wJ4I4OpE4Gs3RoY8oR3L74MSJWHBM0Y6ILqLM
         sAnQ==
X-Gm-Message-State: AOJu0YzCx61kGNWYN1JtPmjrEHw8x0eUVPzmcvBYxRbbNQyH5HXFrF95
	4qh3jcLrsstWZZPLkwHHifISYUZvmmi28aWQO0d872rtQVzDZkgEMSNi2k9bAMrYeGU=
X-Gm-Gg: AeBDieu98QYbqv45iGdUnajJCrdGJYS0BeRxqse4p6hWlvlBo1AO4N5WHsCkqwsriTg
	Ohb84fS7UCQMTvMAeZpg/I5zHp4B+hP8HBSvB5lFupWhuG60NreuST3LWzS1o3UIz7IXxeHgBMg
	SnqErAV28z4ooQBU6RHnbgDewWDORtZmXtb5DvuDwkUhUyqChPM4L2KSi213Od54OrinfQUUKfI
	KVK1PWEDa7s81Y2jWkKQmDTVbjNfuNWrb2LQFk/eaJrSpa0aZ8CEu8BNyPZEUNctfGXH0+3ITR6
	NdXE2/Ldmk9gEvM1waxK9gNTtqRWycNFkHgsQpX77WneW9LXW/TTXWdiA15oihSYE4/x6ROdxye
	EemL8n8qrCaOu1xM1T26/Otl8LAjptAzMSgRg3fjxWid24jNfxDSKEXgUhXNaE3IhEAuOgLu0at
	d/w19UL3ZIC/2V+hx0uedaUmXZsT3fWGEIlhk0bLVeDEt5f7baKQQ=
X-Received: by 2002:a05:620a:284d:b0:8cd:9231:8b54 with SMTP id af79cd13be357-8fd18c2d83fmr1209987085a.62.1777843564505;
        Sun, 03 May 2026 14:26:04 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c24ff43sm864107885a.29.2026.05.03.14.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:26:03 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v2] EDAC/altera: Fix SDMMC PortB OF node reference leak
Date: Sun,  3 May 2026 17:25:58 -0400
Message-ID: <20260503212558.2811480-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_compatible_node() returns a device node with its refcount
incremented. altr_portb_setup() looks up the SDMMC ECC node but does
not drop that reference on error paths or after successful setup.

Route those exits through an of_node_put() cleanup path. Also free the
EDAC control info if devres_open_group() fails after dci has been
allocated, and release the devres group before freeing dci because
altdev is stored in dci->pvt_info.

Fixes: 911049845d70 ("EDAC, altera: Add Arria10 SD-MMC EDAC support")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
Changes since v1:
- Free the EDAC control info when devres_open_group() fails after dci
  has been allocated.
- Release the PortB devres group before freeing dci so altdev->ddev
  remains valid during devres cleanup.
- Keep the !dci failure path limited to dropping the OF node reference.

 drivers/edac/altera_edac.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 4edd2088c2db..1b050e35ec4b 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1526,15 +1526,18 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		edac_printk(KERN_ERR, EDAC_DEVICE,
 			    "%s: Unable to allocate PortB EDAC device\n",
 			    ecc_name);
-		return -ENOMEM;
+		rc = -ENOMEM;
+		goto out_put_node;
 	}
 
 	/* Initialize the PortB EDAC device structure from PortA structure */
 	altdev = dci->pvt_info;
 	*altdev = *device;
 
-	if (!devres_open_group(&altdev->ddev, altr_portb_setup, GFP_KERNEL))
-		return -ENOMEM;
+	if (!devres_open_group(&altdev->ddev, altr_portb_setup, GFP_KERNEL)) {
+		rc = -ENOMEM;
+		goto err_free_ctl;
+	}
 
 	/* Update PortB specific values */
 	altdev->edac_dev_name = ecc_name;
@@ -1607,13 +1610,17 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 
 	devres_remove_group(&altdev->ddev, altr_portb_setup);
 
-	return 0;
+	rc = 0;
+	goto out_put_node;
 
 err_release_group_1:
-	edac_device_free_ctl_info(dci);
 	devres_release_group(&altdev->ddev, altr_portb_setup);
+err_free_ctl:
+	edac_device_free_ctl_info(dci);
 	edac_printk(KERN_ERR, EDAC_DEVICE,
 		    "%s:Error setting up EDAC device: %d\n", ecc_name, rc);
+out_put_node:
+	of_node_put(np);
 	return rc;
 }
 
-- 
2.43.0

