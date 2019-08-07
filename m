Return-Path: <SRS0=KYYr=WD=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6554EC19759
	for <linux-edac@archiver.kernel.org>; Wed,  7 Aug 2019 07:57:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4741D22BEB
	for <linux-edac@archiver.kernel.org>; Wed,  7 Aug 2019 07:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387552AbfHGH5E (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 7 Aug 2019 03:57:04 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4184 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727413AbfHGH5E (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 7 Aug 2019 03:57:04 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id AFBE0415FBD605883904;
        Wed,  7 Aug 2019 15:57:00 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Wed, 7 Aug 2019 15:56:52 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <mchehab@kernel.org>, <linux-edac@vger.kernel.org>
CC:     Xiaofei Tan <tanxiaofei@huawei.com>, <linuxarm@huawei.com>,
        <shiju.jose@huawei.com>
Subject: [PATCH 1/1] rasdaemon: fix the issue of sqlite3 integer bind parameter mismatch
Date:   Wed, 7 Aug 2019 15:54:59 +0800
Message-ID: <1565164499-149666-1-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Some interger fields of arm_event and mc_event are 8 bytes width,
and sqlite3_bind_int64() should be used when restore the event to
sqlite3. But we use sqlite3_bind_int() in current code. This will
lead to an wrong value in sqlite3 DB.

This patch is to fix the issue.

Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
---
 ras-record.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ras-record.c b/ras-record.c
index 4c8b55b..0bf0080 100644
--- a/ras-record.c
+++ b/ras-record.c
@@ -94,9 +94,9 @@ int ras_store_mc_event(struct ras_events *ras, struct ras_mc_event *ev)
 	sqlite3_bind_int (priv->stmt_mc_event,  7, ev->top_layer);
 	sqlite3_bind_int (priv->stmt_mc_event,  8, ev->middle_layer);
 	sqlite3_bind_int (priv->stmt_mc_event,  9, ev->lower_layer);
-	sqlite3_bind_int (priv->stmt_mc_event, 10, ev->address);
-	sqlite3_bind_int (priv->stmt_mc_event, 11, ev->grain);
-	sqlite3_bind_int (priv->stmt_mc_event, 12, ev->syndrome);
+	sqlite3_bind_int64 (priv->stmt_mc_event, 10, ev->address);
+	sqlite3_bind_int64 (priv->stmt_mc_event, 11, ev->grain);
+	sqlite3_bind_int64 (priv->stmt_mc_event, 12, ev->syndrome);
 	sqlite3_bind_text(priv->stmt_mc_event, 13, ev->driver_detail, -1, NULL);
 	rc = sqlite3_step(priv->stmt_mc_event);
 	if (rc != SQLITE_OK && rc != SQLITE_DONE)
@@ -242,7 +242,7 @@ int ras_store_arm_record(struct ras_events *ras, struct ras_arm_event *ev)
 	sqlite3_bind_text (priv->stmt_arm_record,  1,  ev->timestamp, -1, NULL);
 	sqlite3_bind_int  (priv->stmt_arm_record,  2,  ev->error_count);
 	sqlite3_bind_int  (priv->stmt_arm_record,  3,  ev->affinity);
-	sqlite3_bind_int  (priv->stmt_arm_record,  4,  ev->mpidr);
+	sqlite3_bind_int64  (priv->stmt_arm_record,  4,  ev->mpidr);
 	sqlite3_bind_int  (priv->stmt_arm_record,  5,  ev->running_state);
 	sqlite3_bind_int  (priv->stmt_arm_record,  6,  ev->psci_state);
 
-- 
2.8.1

