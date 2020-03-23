Return-Path: <SRS0=Gk52=5I=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0791AC4332E
	for <linux-edac@archiver.kernel.org>; Mon, 23 Mar 2020 09:18:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD4B720784
	for <linux-edac@archiver.kernel.org>; Mon, 23 Mar 2020 09:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbgCWJSE (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 23 Mar 2020 05:18:04 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:46132 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726037AbgCWJSE (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 23 Mar 2020 05:18:04 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 04AA28C970BAAE97B2D8;
        Mon, 23 Mar 2020 17:17:58 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 23 Mar 2020 17:17:51 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <mchehab@kernel.org>, <linux-edac@vger.kernel.org>
CC:     <linuxarm@huawei.com>, <shiju.jose@huawei.com>,
        <jonathan.cameron@huawei.com>, Xiaofei Tan <tanxiaofei@huawei.com>
Subject: [PATCH rasdaemon 1/2] rasdaemon: add support of l3tag and l3data in hip08 OEM format2
Date:   Mon, 23 Mar 2020 17:14:04 +0800
Message-ID: <1584954845-21094-2-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1584954845-21094-1-git-send-email-tanxiaofei@huawei.com>
References: <1584954845-21094-1-git-send-email-tanxiaofei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

The two modules, l3tag and l3data were originally reported through "ARM
processor error section". But it is not suitable. Because l3tag or l3data
doesn't belong to any single CPU core. So we change it to use OEM format2.

Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
---
 non-standard-hisi_hip08.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/non-standard-hisi_hip08.c b/non-standard-hisi_hip08.c
index 4cfa107..8bf10c1 100644
--- a/non-standard-hisi_hip08.c
+++ b/non-standard-hisi_hip08.c
@@ -52,6 +52,8 @@
 #define HISI_OEM_MODULE_ID_PA	2
 #define HISI_OEM_MODULE_ID_HLLC	3
 #define HISI_OEM_MODULE_ID_DDRC	4
+#define HISI_OEM_MODULE_ID_L3T	5
+#define HISI_OEM_MODULE_ID_L3D	6
 
 #define HISI_OEM_TYPE2_VALID_ERR_FR	BIT(6)
 #define HISI_OEM_TYPE2_VALID_ERR_CTRL	BIT(7)
@@ -374,6 +376,36 @@ static const char *ddrc_submodule_name[] = {
 	"TA_DDRC3",
 };
 
+static const char *l3tag_submodule_name[] = {
+	"TB_PARTITION0",
+	"TB_PARTITION1",
+	"TB_PARTITION2",
+	"TB_PARTITION3",
+	"TB_PARTITION4",
+	"TB_PARTITION5",
+	"TB_PARTITION6",
+	"TB_PARTITION7",
+	"TA_PARTITION0",
+	"TA_PARTITION1",
+	"TA_PARTITION2",
+	"TA_PARTITION3",
+	"TA_PARTITION4",
+	"TA_PARTITION5",
+	"TA_PARTITION6",
+	"TA_PARTITION7",
+};
+
+static const char *l3data_submodule_name[] = {
+	"TB_BANK0",
+	"TB_BANK1",
+	"TB_BANK2",
+	"TB_BANK3",
+	"TA_BANK0",
+	"TA_BANK1",
+	"TA_BANK2",
+	"TA_BANK3",
+};
+
 static const struct hisi_module_info hisi_oem_type2_module[] = {
 	{
 		.id = HISI_OEM_MODULE_ID_SMMU,
@@ -404,6 +436,18 @@ static const struct hisi_module_info hisi_oem_type2_module[] = {
 		.sub_num = ARRAY_SIZE(ddrc_submodule_name),
 	},
 	{
+		.id = HISI_OEM_MODULE_ID_L3T,
+		.name = "L3TAG",
+		.sub = l3tag_submodule_name,
+		.sub_num = ARRAY_SIZE(l3tag_submodule_name),
+	},
+	{
+		.id = HISI_OEM_MODULE_ID_L3D,
+		.name = "L3DATA",
+		.sub = l3data_submodule_name,
+		.sub_num = ARRAY_SIZE(l3data_submodule_name),
+	},
+	{
 	}
 };
 
-- 
2.8.1

