Return-Path: <SRS0=Gzgk=EP=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9FDC388F7
	for <linux-edac@archiver.kernel.org>; Mon,  9 Nov 2020 12:51:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBCFE20657
	for <linux-edac@archiver.kernel.org>; Mon,  9 Nov 2020 12:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgKIMvc (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 9 Nov 2020 07:51:32 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7160 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729797AbgKIMvN (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Mon, 9 Nov 2020 07:51:13 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CV9pC45Tpz15MFT;
        Mon,  9 Nov 2020 20:50:43 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 20:50:40 +0800
From:   lvying6 <lvying6@huawei.com>
To:     <mchehab+huawei@kernel.org>, <linux-edac@vger.kernel.org>
CC:     <fanwentao@huawei.com>
Subject: [PATCH] ras-record: fix memory leak when sqlite3_open_v2 fails
Date:   Mon, 9 Nov 2020 20:49:23 +0800
Message-ID: <1604926163-27370-1-git-send-email-lvying6@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

According to SQLite documentation, a database connection handle
is usually returned, even if an error occurs. This behavior has
caused rasdaemon to leak memory when opening a database is failed. Now,
even if sqlite3_open_v2() does not return SQLITE_OK, rasdaemon tries to
release SQLite database handle by calling sqlite3_close_v2().

Signed-off-by: lvying6 <lvying6@huawei.com>
---
 ras-record.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ras-record.c b/ras-record.c
index 549c494..dc89f01 100644
--- a/ras-record.c
+++ b/ras-record.c
@@ -726,6 +726,8 @@ int ras_mc_event_opendb(unsigned cpu, struct ras_events *ras)
 	} while (rc == SQLITE_BUSY);
 
 	if (rc != SQLITE_OK) {
+		sqlite3_close_v2(db);
+		db = NULL;
 		log(TERM, LOG_ERR,
 		    "cpu %u: Failed to connect to %s: error = %d\n",
 		    cpu, SQLITE_RAS_DB, rc);
-- 
1.8.3.1

