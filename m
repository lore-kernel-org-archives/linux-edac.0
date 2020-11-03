Return-Path: <SRS0=d6CN=EJ=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBAAC388F7
	for <linux-edac@archiver.kernel.org>; Tue,  3 Nov 2020 14:26:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9717223AB
	for <linux-edac@archiver.kernel.org>; Tue,  3 Nov 2020 14:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbgKCO0M (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Tue, 3 Nov 2020 09:26:12 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:3028 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729455AbgKCOYv (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Tue, 3 Nov 2020 09:24:51 -0500
Received: from lhreml715-chm.china.huawei.com (unknown [172.18.7.106])
        by Forcepoint Email with ESMTP id E5EC3DD415483CB88657;
        Tue,  3 Nov 2020 14:24:48 +0000 (GMT)
Received: from DESKTOP-6T4S3DQ.china.huawei.com (10.47.85.30) by
 lhreml715-chm.china.huawei.com (10.201.108.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1913.5; Tue, 3 Nov 2020 14:24:48 +0000
From:   Shiju Jose <shiju.jose@huawei.com>
To:     <linux-edac@vger.kernel.org>, <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <tanxiaofei@huawei.com>,
        <shiju.jose@huawei.com>
Subject: [PATCH 0/3] rasdaemon: ras-mc-ctl: Add exception handling and support memory_failure_event
Date:   Tue, 3 Nov 2020 14:22:55 +0000
Message-ID: <20201103142258.1253-1-shiju.jose@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.47.85.30]
X-ClientProxiedBy: lhreml709-chm.china.huawei.com (10.201.108.58) To
 lhreml715-chm.china.huawei.com (10.201.108.66)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Add exception handling and support memory_failure_event.

Shiju Jose (3):
  rasdaemon: ras-mc-ctl: Modify ARM processor error summary log
  rasdaemon: ras-mc-ctl: Add memory failure events
  rasdaemon: ras-mc-ctl: Add exception handling

 util/ras-mc-ctl.in | 612 ++++++++++++++++++++++++++-------------------
 1 file changed, 359 insertions(+), 253 deletions(-)

-- 
2.17.1

