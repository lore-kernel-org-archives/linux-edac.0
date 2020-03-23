Return-Path: <SRS0=Gk52=5I=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AACC4332B
	for <linux-edac@archiver.kernel.org>; Mon, 23 Mar 2020 09:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6BE120784
	for <linux-edac@archiver.kernel.org>; Mon, 23 Mar 2020 09:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbgCWJSE (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 23 Mar 2020 05:18:04 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:46134 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727671AbgCWJSE (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 23 Mar 2020 05:18:04 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 08872966C67CBD467CAE;
        Mon, 23 Mar 2020 17:17:58 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 23 Mar 2020 17:17:49 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <mchehab@kernel.org>, <linux-edac@vger.kernel.org>
CC:     <linuxarm@huawei.com>, <shiju.jose@huawei.com>,
        <jonathan.cameron@huawei.com>, Xiaofei Tan <tanxiaofei@huawei.com>
Subject: [PATCH rasdaemon 0/2] support l3tag&l3data decoding and one fix
Date:   Mon, 23 Mar 2020 17:14:03 +0800
Message-ID: <1584954845-21094-1-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

This patch set does two things:
1.add decoding for two modules, l3tag and l3data.
2.fix the issue that non standard decoder can't work in pthread way.

t00396350 (2):
  rasdaemon: add support of l3tag and l3data in hip08 OEM format2
  rasdaemon: fix the issue that non standard decoder can't work in
    pthread way

 non-standard-hisi_hip08.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 ras-events.c              |  8 ++------
 2 files changed, 46 insertions(+), 6 deletions(-)

-- 
2.8.1

