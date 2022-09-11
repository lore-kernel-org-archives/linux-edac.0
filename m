Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8FCC6FA83
	for <linux-edac@archiver.kernel.org>; Sun, 11 Sep 2022 09:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiIKJkn (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Sun, 11 Sep 2022 05:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiIKJkm (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Sun, 11 Sep 2022 05:40:42 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1702AE10
        for <linux-edac@vger.kernel.org>; Sun, 11 Sep 2022 02:40:41 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MQPky5Y4vzmVBc;
        Sun, 11 Sep 2022 17:36:58 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 11 Sep 2022 17:40:39 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <bp@alien8.de>, <mchehab@kernel.org>, <tony.luck@intel.com>,
        <james.morse@arm.com>, <rric@kernel.org>,
        <cuigaosheng1@huawei.com>, <djiang@mvista.com>,
        <dougthompson@xmissin.com>, <akpm@linux-foundation.org>
CC:     <linux-edac@vger.kernel.org>
Subject: [PATCH] EDAC: remove unused declarations in edac_module.h
Date:   Sun, 11 Sep 2022 17:40:38 +0800
Message-ID: <20220911094038.3224365-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

edac_get_log_ce(), edac_get_log_ue(), edac_get_poll_msec() and
edac_get_panic_on_ue() have been removed since
commit 4de78c6877ec ("drivers/edac: mod PCI poll names"),
so remove them.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/edac/edac_module.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/edac/edac_module.h b/drivers/edac/edac_module.h
index 96f6de0c8ff6..50ed9f2425bb 100644
--- a/drivers/edac/edac_module.h
+++ b/drivers/edac/edac_module.h
@@ -28,13 +28,9 @@ void edac_mc_sysfs_exit(void);
 extern int edac_create_sysfs_mci_device(struct mem_ctl_info *mci,
 					const struct attribute_group **groups);
 extern void edac_remove_sysfs_mci_device(struct mem_ctl_info *mci);
-extern int edac_get_log_ue(void);
-extern int edac_get_log_ce(void);
-extern int edac_get_panic_on_ue(void);
 extern int edac_mc_get_log_ue(void);
 extern int edac_mc_get_log_ce(void);
 extern int edac_mc_get_panic_on_ue(void);
-extern int edac_get_poll_msec(void);
 extern unsigned int edac_mc_get_poll_msec(void);
 
 unsigned edac_dimm_info_location(struct dimm_info *dimm, char *buf,
-- 
2.25.1

