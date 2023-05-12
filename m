Return-Path: <linux-edac-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A2BC77B7C
	for <linux-edac@archiver.kernel.org>; Fri, 12 May 2023 09:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240196AbjELJn0 (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 12 May 2023 05:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240638AbjELJmr (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Fri, 12 May 2023 05:42:47 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2F510E49
        for <linux-edac@vger.kernel.org>; Fri, 12 May 2023 02:42:03 -0700 (PDT)
Received: from lhrpeml500006.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QHkJS6lF2z67Xx5;
        Fri, 12 May 2023 17:40:08 +0800 (CST)
Received: from SecurePC30232.china.huawei.com (10.122.247.234) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 10:41:50 +0100
From:   <shiju.jose@huawei.com>
To:     <mchehab@kernel.org>, <linux-edac@vger.kernel.org>
CC:     <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
        <tanxiaofei@huawei.com>, <fenglei47@h-partners.com>,
        <shiju.jose@huawei.com>
Subject: [PATCH 0/4] rasdaemon: Fix return value type issue, some clean-up and add handling of run-time errors in ras-mc-ctl.in
Date:   Fri, 12 May 2023 17:41:25 +0800
Message-ID: <20230512094129.1468-1-shiju.jose@huawei.com>
X-Mailer: git-send-email 2.35.1.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.122.247.234]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500006.china.huawei.com (7.191.161.198)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

From: Shiju Jose <shiju.jose@huawei.com>

1. rasdaemon: Fix return value type issue and some clean-up.
2. rasdaemon: ras-mc-ctl: Add handling of run-time errors reported when
   querying HiSilicon KunPeng9xx OEM errors. 

Shiju Jose (1):
  rasdaemon: ras-mc-ctl: Add handling of run-time errors reported when
    querying HiSilicon KunPeng9xx OEM errors

Xiaofei Tan (3):
  rasdaemon: fix return value type issue of read/write function from
    unistd.h
  rasdaemon: fix issue of signed and unsigned integer comparison
  rasdaemon: remove redundant header file and do some cleaup

 non-standard-hisi_hip08.c    |   2 +-
 non-standard-hisilicon.c     |   8 +-
 ras-diskerror-handler.c      |   2 +-
 ras-events.c                 |  45 ++--
 ras-memory-failure-handler.c |   7 +-
 util/ras-mc-ctl.in           | 421 ++++++++++++++++++++---------------
 6 files changed, 284 insertions(+), 201 deletions(-)

-- 
2.25.1

