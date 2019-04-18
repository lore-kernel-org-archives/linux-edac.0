Return-Path: <SRS0=trs8=SU=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27335C10F0E
	for <linux-edac@archiver.kernel.org>; Thu, 18 Apr 2019 03:41:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 046182083D
	for <linux-edac@archiver.kernel.org>; Thu, 18 Apr 2019 03:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732325AbfDRDlX (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 17 Apr 2019 23:41:23 -0400
Received: from m97179.mail.qiye.163.com ([220.181.97.179]:23286 "EHLO
        m97179.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387949AbfDRDlU (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Wed, 17 Apr 2019 23:41:20 -0400
Received: from localhost (unknown [117.48.120.186])
        by m97179.mail.qiye.163.com (Hmail) with ESMTPA id AA732E0193A;
        Thu, 18 Apr 2019 11:41:17 +0800 (CST)
From:   WANG Chao <chao.wang@ucloud.cn>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org
Subject: [PATCH 2/3] RAS/CEC: make ces_entered smp safe
Date:   Thu, 18 Apr 2019 11:41:14 +0800
Message-Id: <20190418034115.75954-2-chao.wang@ucloud.cn>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190418034115.75954-1-chao.wang@ucloud.cn>
References: <20190418034115.75954-1-chao.wang@ucloud.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kIGBQJHllBS1VLV1koWUFJQjdXWS1ZQUlXWQkOFx4IWUFZMjUtOjcyP0
        FLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K0k6URw6Izg8NjBRDykQCTNC
        P0NPCxJVSlVKTk5OTk5DQ0xMTENDVTMWGhIXVRgTGhRVDBoVHDsOGBcUDh9VGBVFWVdZEgtZQVlK
        SkxVT0NVSklLVUpDTVlXWQgBWUFKTk5LNwY+
X-HM-Tid: 0a6a2e88ca2120bdkuqyaa732e0193a
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190418034114.0noe3v9snz7boT48VtB9RRcs7Pvjx5Z2VVKy83-U3fY@z>

ces_entered should be put in a critical section to avoid race condition.

Signed-off-by: WANG Chao <chao.wang@ucloud.cn>
---
 drivers/ras/cec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 2e0bf1269c31..702e4c02c713 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -286,10 +286,10 @@ int cec_add_elem(u64 pfn)
 	if (!ce_arr.array || ce_arr.disabled)
 		return -ENODEV;
 
-	ca->ces_entered++;
-
 	mutex_lock(&ce_mutex);
 
+	ca->ces_entered++;
+
 	if (ca->n == MAX_ELEMS)
 		WARN_ON(!del_lru_elem_unlocked(ca));
 
-- 
2.21.0

