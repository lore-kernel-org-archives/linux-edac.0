Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE98EC07E99
	for <linux-edac@archiver.kernel.org>; Fri,  9 Jul 2021 09:28:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9930961241
	for <linux-edac@archiver.kernel.org>; Fri,  9 Jul 2021 09:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhGIJbl (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 9 Jul 2021 05:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbhGIJbk (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Fri, 9 Jul 2021 05:31:40 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22A0C0613DD;
        Fri,  9 Jul 2021 02:28:57 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 21so8234592pfp.3;
        Fri, 09 Jul 2021 02:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UlbdXK6HKZk/09qQVt3Me9VTXCht6e6ZTtTisWVBdt8=;
        b=oumRki32Vm1coPwEZiIZqEH73Fqx5Co6+XkbmwKBRZ7x8kJjvB5pb18OxCM6L6WCY0
         xMGf0opMO39m5XQ5ysJ2Pv4p5XY2wgo99Iv6RTieJ7fozeTBYCa2zFFnqOHzWcLagFwP
         ymBWOCx94OknBMyHtBhconDRHBJyISX7vmeMqv2gcWhTGqLqwZgNDm60S08RMcdYk7cu
         7336WG/tET/flbAxa2/eHimSOVvor7aeLM+DqLJgFYzQ/QQWUusyyhtFcjGFGFKR4dG6
         VcEWZ/wOXAR4r+kO0iD6TSkmaFZ3H0W6yS3A7k19w1kOZPwoqf4iUrh5BH9NaAzktwa3
         hbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UlbdXK6HKZk/09qQVt3Me9VTXCht6e6ZTtTisWVBdt8=;
        b=tQCT7bbuDDeUlt3yU7oixd7aw4m4DSJvsg5YJwTQ0pL6OLvtGw2LunYcK7Q7cAIF5e
         3HvJas6PS29bIS+8OcPEa6gWI7npyJDIpUwwfM1xp8PPQfSR/uuCwmvtAukCXlM8dSvZ
         bs5zayieDVLUz46fZBy8H/9HTkZcX24iTbIDNRn9tP7fXA44Xhalg896OmMDi/+h38Md
         PTIyuASuyTLejBf7jkY+PauFeZjqTSQbcMsR+AaIH8AMdUi72+a1xTcFx3RXuKH4rY7H
         +n4D5GnPS9mve5raUTFAyNcviBLK0MnagRQJjDpaYXCgo33/pz7Ho09owc0zouImfJN2
         RutA==
X-Gm-Message-State: AOAM532SELOa6F0GZjv3rkJriRLyzN05oCcz3I9APumYhTjof6JHWv1W
        Hv/XbIp4yCEhnzsjOkvWDOQ=
X-Google-Smtp-Source: ABdhPJxYBtCrvXlWT9e1VmEhguWvddB53UrxgpnQucxrADcQ3eGLzkJh3Lpa2EQtQtGOK6tII6esbw==
X-Received: by 2002:a63:1c20:: with SMTP id c32mr36902480pgc.41.1625822931464;
        Fri, 09 Jul 2021 02:28:51 -0700 (PDT)
Received: from localhost.localdomain (f.a4.5177.ip4.static.sl-reverse.com. [119.81.164.15])
        by smtp.gmail.com with ESMTPSA id 92sm12860460pjv.29.2021.07.09.02.28.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jul 2021 02:28:51 -0700 (PDT)
From:   yaozhenguo <yaozhenguo1@gmail.com>
To:     tony.luck@intel.com, youquan.song@intel.com
Cc:     linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
        yaozhenguo@jd.com, yaozhenguo <yaozhenguo1@gmail.com>
Subject: [PATCH] mm,hwpoison: Don't call task_work_add when there is same work in the queue
Date:   Fri,  9 Jul 2021 17:28:18 +0800
Message-Id: <20210709092818.7795-1-yaozhenguo1@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

queue_task_work can be called more than once in one task before
this task work is running. it can lead to task->task_works becomes
an endless loop list and the task will never return to user mode.
Don't call task_work_add when there is same work in the queue.

Signed-off-by: yaozhenguo <yaozhenguo1@gmail.com>
---
 arch/x86/kernel/cpu/mce/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 22791aa..62c67ad 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1299,7 +1299,9 @@ static void queue_task_work(struct mce *m, int kill_current_task)
 	else
 		current->mce_kill_me.func = kill_me_maybe;
 
-	task_work_add(current, &current->mce_kill_me, TWA_RESUME);
+	/* Avoid endless loops in task_work_run */
+	if (READ_ONCE(current->task_works) != &current->mce_kill_me)
+		task_work_add(current, &current->mce_kill_me, TWA_RESUME);
 }
 
 /*
-- 
1.8.3.1

