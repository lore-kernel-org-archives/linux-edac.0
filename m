Return-Path: <SRS0=1uOC=7J=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D15AC433E1
	for <linux-edac@archiver.kernel.org>; Wed, 27 May 2020 08:03:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BA1D20723
	for <linux-edac@archiver.kernel.org>; Wed, 27 May 2020 08:03:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729341AbgE0IDK (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 27 May 2020 04:03:10 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5289 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729318AbgE0IDJ (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 27 May 2020 04:03:09 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 931286F59412700B71B0;
        Wed, 27 May 2020 16:03:06 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 27 May 2020 16:02:56 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <mchehab+huawei@kernel.org>, <linux-edac@vger.kernel.org>
CC:     Xiaofei Tan <tanxiaofei@huawei.com>, <linuxarm@huawei.com>,
        <shiju.jose@huawei.com>, <jonathan.cameron@huawei.com>
Subject: [PATCH RESEND 2/2] rasdaemon: fix the issue that non standard decoder can't work in pthread way
Date:   Wed, 27 May 2020 16:02:33 +0800
Message-ID: <1590566553-51565-3-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1590566553-51565-1-git-send-email-tanxiaofei@huawei.com>
References: <1590566553-51565-1-git-send-email-tanxiaofei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

The non standard decoding functions are registered in app init process
through __attribute__((constructor)), and unregistered in app exit process
through __attribute__((destructor)). We don't need to unregister them
in any other steps. This patch removes these unnecessary unregister calls.

Fixes: 78a21c1e9770 ("rasdaemon: add closure and cleanups for the database")
Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
---
 ras-events.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/ras-events.c b/ras-events.c
index 5635278..e6c89dd 100644
--- a/ras-events.c
+++ b/ras-events.c
@@ -496,10 +496,8 @@ static int read_ras_event_all_cpus(struct pthread_data *pdata,
 	    "Old kernel detected. Stop listening and fall back to pthread way.\n");
 
 cleanup:
-	if (pdata[0].ras->record_events) {
-		unregister_ns_dec_tab();
+	if (pdata[0].ras->record_events)
 		ras_mc_event_closedb(pdata[0].cpu, pdata[0].ras);
-	}
 
 error:
 	kbuffer_free(kbuf);
@@ -598,10 +596,8 @@ static void *handle_ras_events_cpu(void *priv)
 
 	read_ras_event(fd, pdata, kbuf, page);
 
-	if (pdata->ras->record_events) {
-		unregister_ns_dec_tab();
+	if (pdata->ras->record_events)
 		ras_mc_event_closedb(pdata->cpu, pdata->ras);
-	}
 
 	close(fd);
 	kbuffer_free(kbuf);
-- 
2.8.1

