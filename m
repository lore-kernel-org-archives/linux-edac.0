Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B39C4361B
	for <linux-edac@archiver.kernel.org>; Wed, 16 Dec 2020 13:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5093D2339F
	for <linux-edac@archiver.kernel.org>; Wed, 16 Dec 2020 13:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgLPNTK (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 16 Dec 2020 08:19:10 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9621 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgLPNTK (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Wed, 16 Dec 2020 08:19:10 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CwwfQ1rwYz15chq;
        Wed, 16 Dec 2020 21:17:50 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:18:17 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <james.morse@arm.com>, <rric@kernel.org>,
        <linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] edac: ppc4xx_edac: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:18:46 +0800
Message-ID: <20201216131846.14937-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/edac/ppc4xx_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/ppc4xx_edac.c b/drivers/edac/ppc4xx_edac.c
index 677095769182..6793f6d799e7 100644
--- a/drivers/edac/ppc4xx_edac.c
+++ b/drivers/edac/ppc4xx_edac.c
@@ -1058,7 +1058,7 @@ static int ppc4xx_edac_mc_init(struct mem_ctl_info *mci,
 	/* Initialize strings */
 
 	mci->mod_name		= PPC4XX_EDAC_MODULE_NAME;
-	mci->ctl_name		= ppc4xx_edac_match->compatible,
+	mci->ctl_name		= ppc4xx_edac_match->compatible;
 	mci->dev_name		= np->full_name;
 
 	/* Initialize callbacks */
-- 
2.22.0

