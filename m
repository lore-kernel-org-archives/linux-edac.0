Return-Path: <SRS0=bMgi=C4=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AB8C43464
	for <linux-edac@archiver.kernel.org>; Sat, 19 Sep 2020 01:22:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80A2C21741
	for <linux-edac@archiver.kernel.org>; Sat, 19 Sep 2020 01:22:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgISBWc (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 18 Sep 2020 21:22:32 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:50744 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbgISBWb (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Fri, 18 Sep 2020 21:22:31 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 646C5DEA6396A4285BA7;
        Sat, 19 Sep 2020 09:22:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Sat, 19 Sep 2020 09:22:21 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
CC:     <linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH -next v2] RAS/CEC: Convert to DEFINE_SHOW_ATTRIBUTE
Date:   Sat, 19 Sep 2020 09:22:52 +0800
Message-ID: <20200919012252.171437-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
v2: based on linux-next(20200917), and can be applied to
    mainline cleanly now.

 drivers/ras/cec.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 6939aa5b3..ddecf25b5 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -435,7 +435,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(action_threshold_ops, u64_get, action_threshold_set, "%
 
 static const char * const bins[] = { "00", "01", "10", "11" };
 
-static int array_dump(struct seq_file *m, void *v)
+static int array_show(struct seq_file *m, void *v)
 {
 	struct ce_array *ca = &ce_arr;
 	int i;
@@ -467,18 +467,7 @@ static int array_dump(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int array_open(struct inode *inode, struct file *filp)
-{
-	return single_open(filp, array_dump, NULL);
-}
-
-static const struct file_operations array_ops = {
-	.owner	 = THIS_MODULE,
-	.open	 = array_open,
-	.read	 = seq_read,
-	.llseek	 = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(array);
 
 static int __init create_debugfs_nodes(void)
 {
@@ -513,7 +502,7 @@ static int __init create_debugfs_nodes(void)
 		goto err;
 	}
 
-	array = debugfs_create_file("array", S_IRUSR, d, NULL, &array_ops);
+	array = debugfs_create_file("array", S_IRUSR, d, NULL, &array_fops);
 	if (!array) {
 		pr_warn("Error creating array debugfs node!\n");
 		goto err;
-- 
2.23.0

