Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CF0C433E9
	for <linux-edac@archiver.kernel.org>; Tue,  9 Mar 2021 16:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF5876523F
	for <linux-edac@archiver.kernel.org>; Tue,  9 Mar 2021 16:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhCIQVP (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Tue, 9 Mar 2021 11:21:15 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2671 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbhCIQVC (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Tue, 9 Mar 2021 11:21:02 -0500
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Dw0fc3YpKz67wm7;
        Wed, 10 Mar 2021 00:15:04 +0800 (CST)
Received: from lhreml715-chm.china.huawei.com (10.201.108.66) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 9 Mar 2021 17:21:00 +0100
Received: from DESKTOP-6T4S3DQ.china.huawei.com (10.47.91.183) by
 lhreml715-chm.china.huawei.com (10.201.108.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 16:20:59 +0000
From:   Shiju Jose <shiju.jose@huawei.com>
To:     <linux-edac@vger.kernel.org>, <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <tanxiaofei@huawei.com>,
        <shiju.jose@huawei.com>
Subject: [PATCH 1/1] rasdaemon: fix build error in register_ns_ev_decoder if the sqlite3 is not enabled
Date:   Tue, 9 Mar 2021 16:18:56 +0000
Message-ID: <20210309161856.352-1-shiju.jose@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.47.91.183]
X-ClientProxiedBy: lhreml750-chm.china.huawei.com (10.201.108.200) To
 lhreml715-chm.china.huawei.com (10.201.108.66)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

ns_ev_decoder->stmt_dec_record = NULL; in the register_ns_ev_decoder()
should be under #ifdef HAVE_SQLITE3 to fix the compilation error
when build without the configure option --enable-sqlite3.

Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
---
 ras-non-standard-handler.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ras-non-standard-handler.c b/ras-non-standard-handler.c
index 1862335..8d9802d 100644
--- a/ras-non-standard-handler.c
+++ b/ras-non-standard-handler.c
@@ -74,7 +74,9 @@ int register_ns_ev_decoder(struct ras_ns_ev_decoder *ns_ev_decoder)
 		return -1;
 
 	ns_ev_decoder->next = NULL;
+#ifdef HAVE_SQLITE3
 	ns_ev_decoder->stmt_dec_record = NULL;
+#endif
 	if (!ras_ns_ev_dec_list) {
 		ras_ns_ev_dec_list = ns_ev_decoder;
 	} else {
-- 
2.17.1

