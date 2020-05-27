Return-Path: <SRS0=1uOC=7J=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FADAC433E0
	for <linux-edac@archiver.kernel.org>; Wed, 27 May 2020 08:03:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51D9120DD4
	for <linux-edac@archiver.kernel.org>; Wed, 27 May 2020 08:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbgE0IDI (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 27 May 2020 04:03:08 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5287 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729052AbgE0IDH (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 27 May 2020 04:03:07 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 6E33050B0DD037A4751F;
        Wed, 27 May 2020 16:03:01 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 27 May 2020 16:02:51 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <mchehab+huawei@kernel.org>, <linux-edac@vger.kernel.org>
CC:     Xiaofei Tan <tanxiaofei@huawei.com>, <linuxarm@huawei.com>,
        <shiju.jose@huawei.com>, <jonathan.cameron@huawei.com>
Subject: [PATCH RESEND 0/2] support l3tag&l3data decoding and one fix
Date:   Wed, 27 May 2020 16:02:31 +0800
Message-ID: <1590566553-51565-1-git-send-email-tanxiaofei@huawei.com>
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

Xiaofei Tan (2):
  rasdaemon: add support of l3tag and l3data in hip08 OEM format2
  rasdaemon: fix the issue that non standard decoder can't work in
    pthread way

 non-standard-hisi_hip08.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 ras-events.c              |  8 ++------
 2 files changed, 46 insertions(+), 6 deletions(-)

-- 
2.8.1

