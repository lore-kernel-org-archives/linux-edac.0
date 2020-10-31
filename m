Return-Path: <SRS0=MUfx=EG=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F755C388F9
	for <linux-edac@archiver.kernel.org>; Sat, 31 Oct 2020 09:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24433208A9
	for <linux-edac@archiver.kernel.org>; Sat, 31 Oct 2020 09:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgJaJ61 (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Sat, 31 Oct 2020 05:58:27 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7124 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgJaJ61 (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Sat, 31 Oct 2020 05:58:27 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CNZPX6PXSzLrCb;
        Sat, 31 Oct 2020 17:58:24 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Sat, 31 Oct 2020
 17:58:17 +0800
From:   lvying6 <lvying6@huawei.com>
To:     <mchehab+huawei@kernel.org>, <linux-edac@vger.kernel.org>
CC:     <fanwentao@huawei.com>
Subject: [PATCH rasdaemon 0/2] ras-page-isolation bugfix
Date:   Sat, 31 Oct 2020 17:57:13 +0800
Message-ID: <1604138235-7142-1-git-send-email-lvying6@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

This patchset fix two problems in ras-page-isolation.c:
1. fix do_page_offline always considers kernel page offline is
successful
2. fix page which is PAGE_OFFLINE_FAILED can not be offlined again

lvying (1):
  ras-page-isolation: fix do_page_offline always considers page offline
    is successful

lvying6 (1):
  ras-page-isolation: page which is PAGE_OFFLINE_FAILED can be offlined
    again

 ras-page-isolation.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

-- 
1.8.3.1

