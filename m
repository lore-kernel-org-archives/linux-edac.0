Return-Path: <SRS0=3M1Q=7L=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89E7C433E1
	for <linux-edac@archiver.kernel.org>; Fri, 29 May 2020 08:27:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C896020810
	for <linux-edac@archiver.kernel.org>; Fri, 29 May 2020 08:27:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgE2I1G (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 29 May 2020 04:27:06 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5309 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725355AbgE2I1F (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Fri, 29 May 2020 04:27:05 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 053022B7CA2CAFBE5D26;
        Fri, 29 May 2020 16:27:03 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Fri, 29 May 2020
 16:26:54 +0800
From:   lvying6 <lvying6@huawei.com>
To:     <mchehab@kernel.org>, <linux-edac@vger.kernel.org>
CC:     <guanyalong@huawei.com>, <wuyun.wu@huawei.com>,
        <tanxiaofei@huawei.com>
Subject: [PATCH 0/2] rasdaemon: add support for memory Corrected Error predictive failure analysis
Date:   Fri, 29 May 2020 16:24:21 +0800
Message-ID: <1590740663-6664-1-git-send-email-lvying6@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

rasdaemon: add support for memory Corrected Error predictive failure analysis

wuyun (2):
  rasdaemon: add rbtree support for page record
  rasdaemon: add support for memory Corrected Error predictive failure
    analysis

 Makefile.am               |   4 +-
 misc/rasdaemon.env        |  29 ++++
 misc/rasdaemon.service.in |   1 +
 ras-events.c              |   3 +
 ras-mc-handler.c          |   5 +
 ras-page-isolation.c      | 308 +++++++++++++++++++++++++++++++++++++
 ras-page-isolation.h      |  68 ++++++++
 rbtree.c                  | 384 ++++++++++++++++++++++++++++++++++++++++++++++
 rbtree.h                  | 165 ++++++++++++++++++++
 9 files changed, 965 insertions(+), 2 deletions(-)
 create mode 100644 misc/rasdaemon.env
 create mode 100644 ras-page-isolation.c
 create mode 100644 ras-page-isolation.h
 create mode 100644 rbtree.c
 create mode 100644 rbtree.h

-- 
1.8.3.1

