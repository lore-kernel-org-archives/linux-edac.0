Return-Path: <SRS0=trs8=SU=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88168C282DA
	for <linux-edac@archiver.kernel.org>; Thu, 18 Apr 2019 02:43:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4EB6F217F9
	for <linux-edac@archiver.kernel.org>; Thu, 18 Apr 2019 02:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LJi/FK0L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387534AbfDRCnA (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 17 Apr 2019 22:43:00 -0400
Received: from m50-133.163.com ([123.125.50.133]:45448 "EHLO m50-133.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732737AbfDRCm7 (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 17 Apr 2019 22:42:59 -0400
X-Greylist: delayed 914 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Apr 2019 22:42:58 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=zscNWNAMEkTr/yZYJU
        HcLfcz+HpT7tjzhOzHdHWJQs0=; b=LJi/FK0Li6pTVZPxeVBV0OLLjGmpoDbCW/
        x2kwECJQxpDQE5eIEUlXIEv42OhXDRYYp3O2OGDTxQjzXBeMmOBueR/v9Wrkaljb
        uX/FP/1ZYw9OOpr0ITh4AaZ1r11RdG47cYq7unCXezl24VFitRF1/IO3x4sxjGF7
        Vl4UreibI=
Received: from bp.localdomain (unknown [218.106.182.174])
        by smtp3 (Coremail) with SMTP id DdGowAAXuliH4LdcUVtOAA--.117S3;
        Thu, 18 Apr 2019 10:27:21 +0800 (CST)
From:   Pan Bian <bianpan2016@163.com>
To:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>
Cc:     linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pan Bian <bianpan2016@163.com>
Subject: EDAC: Fix memory leak in creating CSROW object
Date:   Thu, 18 Apr 2019 10:27:18 +0800
Message-Id: <1555554438-103953-1-git-send-email-bianpan2016@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DdGowAAXuliH4LdcUVtOAA--.117S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWUZFWxCrWxWw47XF15CFg_yoWktFX_Ga
        4UXF17Wrs7KFyxKw47Cw4fZryIqFs09rZ7JFZ2gFyfCan8Zw1DZ3yvgrsxAr48Wa17ur98
        Jr95JayUAF1UCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbj-e3UUUUU==
X-Originating-IP: [218.106.182.174]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/xtbBZwmaclett8XX4wAAs6
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190418022718.1g-rBQRBinrGXIeKkmthgFGNk5jlUr1JRyRnAYHIXbI@z>

In the function that creates a CSROW object, the object is not released
when failing to add the device to device hierarchy. This may result in a
memory leak bug.

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/edac/edac_mc_sysfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/edac_mc_sysfs.c b/drivers/edac/edac_mc_sysfs.c
index 4641746..2dafb08 100644
--- a/drivers/edac/edac_mc_sysfs.c
+++ b/drivers/edac/edac_mc_sysfs.c
@@ -404,6 +404,7 @@ static inline int nr_pages_per_csrow(struct csrow_info *csrow)
 static int edac_create_csrow_object(struct mem_ctl_info *mci,
 				    struct csrow_info *csrow, int index)
 {
+	int err;
 	csrow->dev.type = &csrow_attr_type;
 	csrow->dev.groups = csrow_dev_groups;
 	device_initialize(&csrow->dev);
@@ -415,7 +416,10 @@ static int edac_create_csrow_object(struct mem_ctl_info *mci,
 	edac_dbg(0, "creating (virtual) csrow node %s\n",
 		 dev_name(&csrow->dev));
 
-	return device_add(&csrow->dev);
+	err = device_add(&csrow->dev);
+	if (err)
+		put_device(&csrow->dev);
+	return err;
 }
 
 /* Create a CSROW object under specifed edac_mc_device */
-- 
2.7.4


