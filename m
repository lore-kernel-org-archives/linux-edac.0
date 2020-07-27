Return-Path: <SRS0=K9xp=BG=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1654EC433EB
	for <linux-edac@archiver.kernel.org>; Mon, 27 Jul 2020 07:39:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA47E2072E
	for <linux-edac@archiver.kernel.org>; Mon, 27 Jul 2020 07:39:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgG0Hjp (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 27 Jul 2020 03:39:45 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:40328 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726268AbgG0Hjo (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 27 Jul 2020 03:39:44 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 54E1FEE540A321FC3528;
        Mon, 27 Jul 2020 15:39:40 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 27 Jul 2020 15:39:32 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <mchehab+huawei@kernel.org>, <linux-edac@vger.kernel.org>
CC:     <linuxarm@huawei.com>, <shiju.jose@huawei.com>,
        <jonathan.cameron@huawei.com>, Xiaofei Tan <tanxiaofei@huawei.com>
Subject: [PATCH rasdaemon 1/3] rasdaemon: delete the duplicate code about the definition of hip08 DB fields
Date:   Mon, 27 Jul 2020 15:38:37 +0800
Message-ID: <1595835519-32039-2-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1595835519-32039-1-git-send-email-tanxiaofei@huawei.com>
References: <1595835519-32039-1-git-send-email-tanxiaofei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Delete the duplicate code about the definition of DB fields for hip08 OEM
event format1 and format2. Because the two OEM event format is the same.

Signed-off-By: Xiaofei Tan <tanxiaofei@huawei.com>
---
 non-standard-hisi_hip08.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/non-standard-hisi_hip08.c b/non-standard-hisi_hip08.c
index 8bf10c1..7fc6939 100644
--- a/non-standard-hisi_hip08.c
+++ b/non-standard-hisi_hip08.c
@@ -504,7 +504,7 @@ static char *pcie_local_sub_module_name(uint8_t id)
 }
 
 #ifdef HAVE_SQLITE3
-static const struct db_fields hip08_oem_type1_event_fields[] = {
+static const struct db_fields hip08_oem_event_fields[] = {
 	{ .name = "id",			.type = "INTEGER PRIMARY KEY" },
 	{ .name = "timestamp",          .type = "TEXT" },
 	{ .name = "version",		.type = "INTEGER" },
@@ -519,27 +519,14 @@ static const struct db_fields hip08_oem_type1_event_fields[] = {
 
 static const struct db_table_descriptor hip08_oem_type1_event_tab = {
 	.name = "hip08_oem_type1_event_v2",
-	.fields = hip08_oem_type1_event_fields,
-	.num_fields = ARRAY_SIZE(hip08_oem_type1_event_fields),
-};
-
-static const struct db_fields hip08_oem_type2_event_fields[] = {
-	{ .name = "id",                 .type = "INTEGER PRIMARY KEY" },
-	{ .name = "timestamp",          .type = "TEXT" },
-	{ .name = "version",            .type = "INTEGER" },
-	{ .name = "soc_id",             .type = "INTEGER" },
-	{ .name = "socket_id",          .type = "INTEGER" },
-	{ .name = "nimbus_id",          .type = "INTEGER" },
-	{ .name = "module_id",          .type = "TEXT" },
-	{ .name = "sub_module_id",      .type = "TEXT" },
-	{ .name = "err_severity",       .type = "TEXT" },
-	{ .name = "regs_dump",		.type = "TEXT" },
+	.fields = hip08_oem_event_fields,
+	.num_fields = ARRAY_SIZE(hip08_oem_event_fields),
 };
 
 static const struct db_table_descriptor hip08_oem_type2_event_tab = {
 	.name = "hip08_oem_type2_event_v2",
-	.fields = hip08_oem_type2_event_fields,
-	.num_fields = ARRAY_SIZE(hip08_oem_type2_event_fields),
+	.fields = hip08_oem_event_fields,
+	.num_fields = ARRAY_SIZE(hip08_oem_event_fields),
 };
 
 static const struct db_fields hip08_pcie_local_event_fields[] = {
-- 
2.8.1

