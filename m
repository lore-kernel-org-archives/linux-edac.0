Return-Path: <SRS0=QPPE=YJ=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84158FA372B
	for <linux-edac@archiver.kernel.org>; Wed, 16 Oct 2019 16:34:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68FD021D80
	for <linux-edac@archiver.kernel.org>; Wed, 16 Oct 2019 16:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730251AbfJPQee (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 16 Oct 2019 12:34:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4192 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405428AbfJPQee (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 16 Oct 2019 12:34:34 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id D6682295809DADCB1C00;
        Thu, 17 Oct 2019 00:34:26 +0800 (CST)
Received: from DESKTOP-6T4S3DQ.china.huawei.com (10.202.226.55) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Thu, 17 Oct 2019 00:34:15 +0800
From:   Shiju Jose <shiju.jose@huawei.com>
To:     <mchehab@kernel.org>, <linux-edac@vger.kernel.org>
CC:     <linuxarm@huawei.com>, Shiju Jose <shiju.jose@huawei.com>
Subject: [PATCH 0/7] rasdaemon: add fixes, database closure and signal handling
Date:   Wed, 16 Oct 2019 17:33:54 +0100
Message-ID: <20191016163401.16980-1-shiju.jose@huawei.com>
X-Mailer: git-send-email 2.19.2.windows.1
In-Reply-To: <Shiju Jose>
References: <Shiju Jose>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.202.226.55]
X-CFilter-Loop: Reflected
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

This patch set add
1. fixes for some memory leaks and file closure.
2. closure for the sqlite3 database.
3. signal handling for the cleanup.

Shiju Jose (7):
  rasdaemon: fix cleanup issues in
    ras-events.c:read_ras_event_all_cpus()
  rasdaemon: fix memory leak in ras-events.c:handle_ras_events()
  rasdaemon: fix missing fclose in
    ras-events.c:select_tracing_timestamp()
  rasdaemon: fix memory leak in ras-events.c:add_event_handler()
  rasdaemon: delete multiple definitions of ARRAY_SIZE
  rasdaemon: add closure and cleanups for the database
  rasdaemon: add signal handling for the cleanup

 ras-diskerror-handler.c    |   2 -
 ras-events.c               |  88 +++++++++++++++++++++++++++-----
 ras-mce-handler.h          |   3 --
 ras-non-standard-handler.c |  16 ++++++
 ras-non-standard-handler.h |   6 ++-
 ras-record.c               | 123 +++++++++++++++++++++++++++++++++++++++++++--
 ras-record.h               |   5 ++
 7 files changed, 222 insertions(+), 21 deletions(-)

-- 
2.1.4


