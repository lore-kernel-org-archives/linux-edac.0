Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C628A36DA15
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 20:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519675; cv=none; b=iyM+dfOA8SX0gqvcF/7x7zXBUsEBXvW0x4j7TMwkqO+p8rTVf4Wueg9KudjBbz11Uwej24ysEOjRfJHDNkMxheS9Jm5Dq+fOlJH3cBRHT+YzdhvdWqnXLSN9D8wsx6FDp2C5mRpQBfbEll3LynNAlfwQ4g8pudR6uCRjx1WYU8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519675; c=relaxed/simple;
	bh=LIxqRATNJ72fBQFHYzJm/EY0QiCHge/aJw9vbZXNsjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hvQczLGlQ0BethfSs4SbV+oz+9wFk39P/589RFauwfAXnuXiFBY81MWutBI5KZ8WjhYHR259bRyu/ihkttItktpS3uK9qTAjZe0kkswSSDB2oZQdPg8tSKc7nLk9CovJQEYDQWhPQfa+atwe+4lYxQcpnR12OwUEMY2sq1Y8GrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpaSoJot; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpaSoJot"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9159477c893so5323585a.0
        for <linux-edac@vger.kernel.org>; Wed, 03 Jun 2026 13:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519674; x=1781124474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uN5cSlSsFmu1fB4MX4N7BjMN4TwFpgg10y85Ysy+5Xo=;
        b=RpaSoJotIFinVFJ2pRBCniT7zr573voT4Lx3rIFvvkKn4e4VIZInkb9QQB8MXp3G6v
         hdjTLeqIevtOooDY4Pfv0/DGBVRJrdlIu4xMRArcYHbfLSD1wvcKB8lMCekgNOzsUYZl
         SqLomHiRY5n4z9g7GLu49vdWU2fAEpnltcbUeuUddB3Sjr5Jj0BL5rSTCkTGKbIX5ixv
         Y0AnPAMv+PvDqsn0YO2t4IOpcz3uLL1iVlx4nJmTHzuDJIx2Udfh5wIiwbw5XHNBlCD7
         FGATaZ33bSaE2nJk98huOOElzXN3b593SwlYR/yuv48c9q9clab1jz769laViqnnqIxH
         SDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519674; x=1781124474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uN5cSlSsFmu1fB4MX4N7BjMN4TwFpgg10y85Ysy+5Xo=;
        b=qZ7tQaczcUAyxYaOyZkhYE0gR5rSy6imALC9pE7k5nmcoqzu4fGEtOE03EEyKfwZWf
         MfSZe5mfGKwqKBUq1rvHmv+WKXLBv/4s+GHN+TxJdifKFuA+Qtqt/z3a5XZX3/s9r7kH
         aJzmgSUoCNJVvoJ4RbPu34HAT+ud+66kB5Q4Fa6XXu++6awVfmCwPHP4tB72DVW95NKP
         KW0+l/02kNYalGEHMJOKV+kGCTh5CwuySUDC3SXNrQvz1tvNDcmsGFtfquZQOL1tdfpe
         kle8aYckOchvkQJJGMclU+wmMqzWGIMWo3DnMX2+xZUfPLB0CGhG3cXkUWjgA8tVTvcI
         V+Yg==
X-Gm-Message-State: AOJu0YxyHIIANOEpe4fRuYuW8ki2fD1zExPpTjmRgzYN8T36zP6k8YUN
	JmdId8bGvxl7KUOC9LXY86c8PeYmSqHEWF/pMwwZXm2gd/4cirDjOvQt
X-Gm-Gg: Acq92OGyyYjTojTp8co+rjPV8PvXmoDKdjCyTp5cXYjMk44rvW6BBgutzpevV/3G69q
	wLPCasRS4HyOBTeasnw5CtxwcvIt7UV02DqEJ3TImDiAmERkWgURFq7xph/QKYMPuFYL+dO+ig1
	uh35XMkNM3WrZVAc4SbRKUljObyfzAtMeSArkdmQ/MwUGLFkgIJD5M0LhrpFiSk8nurycD52tRK
	M9NYLwhVyRbtmcgyQSmaXW/CjupdICj8de1lMFVW0lDuicfSLszoF2u1OcZbtCkGx4AqHaWOf18
	wAOo2M1v3PxbFwvJXIti77L/oQHK/QfyVkzvxPu8otkHBTIa6YYtb7hfcdI+qkYDXilIzR5DWEw
	3f4LUKrIb7OIecXO9j3/KM6n1yLTqCy1ereuuY+tum8pqbc0iqww9C0h+FLHAbC6j4kP1WdRXAw
	7zg7Tq0DHF0+oQ4p2tupFylOLx/Ut58SFwMNYosI7cQARBQb5th2I=
X-Received: by 2002:a05:620a:2989:b0:915:7f42:d91 with SMTP id af79cd13be357-9158a642e0amr795141385a.8.1780519673783;
        Wed, 03 Jun 2026 13:47:53 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37bcd6sm359860185a.25.2026.06.03.13.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:47:53 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] EDAC/synopsys: Fix cleanup on injection sysfs failure
Date: Wed,  3 Jun 2026 16:47:21 -0400
Message-ID: <20260603204721.2200819-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_create_sysfs_attributes() creates inject_data_error before
inject_data_poison. If the second file creation fails, the first file is
left behind.

The same failure path runs after edac_mc_add_mc() has registered the
memory controller with the EDAC core. Jumping directly to edac_mc_free()
skips edac_mc_del_mc() and leaves the registered controller state
unwound incorrectly.

Remove inject_data_error when inject_data_poison creation fails, and
route the probe failure through edac_mc_del_mc() before freeing mci.

Fixes: 1a81361f75d8 ("EDAC, synopsys: Add Error Injection support for ZynqMP DDR controller")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/edac/synopsys_edac.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
index 51143b3257de..c395a1e97a36 100644
--- a/drivers/edac/synopsys_edac.c
+++ b/drivers/edac/synopsys_edac.c
@@ -1120,8 +1120,10 @@ static int edac_create_sysfs_attributes(struct mem_ctl_info *mci)
 	if (rc < 0)
 		return rc;
 	rc = device_create_file(&mci->dev, &dev_attr_inject_data_poison);
-	if (rc < 0)
+	if (rc < 0) {
+		device_remove_file(&mci->dev, &dev_attr_inject_data_error);
 		return rc;
+	}
 	return 0;
 }
 
@@ -1431,7 +1433,7 @@ static int mc_probe(struct platform_device *pdev)
 		if (rc) {
 			edac_printk(KERN_ERR, EDAC_MC,
 					"Failed to create sysfs entries\n");
-			goto free_edac_mc;
+			goto del_mc;
 		}
 	}
 
@@ -1448,6 +1450,10 @@ static int mc_probe(struct platform_device *pdev)
 
 	return rc;
 
+#ifdef CONFIG_EDAC_DEBUG
+del_mc:
+	edac_mc_del_mc(&pdev->dev);
+#endif
 free_edac_mc:
 	edac_mc_free(mci);
 
-- 
2.43.0

