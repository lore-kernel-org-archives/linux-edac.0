Return-Path: <SRS0=OK8f=B7=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6196EC433E3
	for <linux-edac@archiver.kernel.org>; Fri, 21 Aug 2020 17:28:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BC612075E
	for <linux-edac@archiver.kernel.org>; Fri, 21 Aug 2020 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598030938;
	bh=HoRWHVr2nxkcyHpWx7uSIErrJ+zEm+ycisSWs6Uvf6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=qltW6uKo3DK+6tuuRpEE0AW/Yq9pgbtaGwcx7heq1O0G+zwflCBxjDQY3OYPlqNHc
	 1oBEqUPvnb0WB9PMEbZyE5aEGZhQj0xQ3N2Qqe23sZo4hcjcGBSYaqRLQAK7vhnCWr
	 z3iHik7C+IV7PPgveFpd9FjfhGyztc0Dql5KHymU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbgHUR24 (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 21 Aug 2020 13:28:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:46398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726862AbgHUQOi (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Fri, 21 Aug 2020 12:14:38 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B71722B43;
        Fri, 21 Aug 2020 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598026472;
        bh=HoRWHVr2nxkcyHpWx7uSIErrJ+zEm+ycisSWs6Uvf6c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JUqpTZKWQa0R90nJzo/xZhfmR/BYnbjmwGPYmRkiFpBADDwWxnd/yhyT89JvZdEXn
         LN0O2WjWmZR6KEkqfjqOQ7TKDN8hqtgpqglKeQttt6esD5J/EeSZGqMgJAD/2ioOFp
         81p0rzvt56vo4w2TfB7L9WN7xA3uajHt1k7P14uM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Zhenzhong Duan <zhenzhong.duan@gmail.com>,
        Tony Luck <tony.luck@intel.com>,
        Sasha Levin <sashal@kernel.org>, linux-edac@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 06/62] EDAC/mc: Call edac_inc_ue_error() before panic
Date:   Fri, 21 Aug 2020 12:13:27 -0400
Message-Id: <20200821161423.347071-6-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161423.347071-1-sashal@kernel.org>
References: <20200821161423.347071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

From: Zhenzhong Duan <zhenzhong.duan@gmail.com>

[ Upstream commit e9ff6636d3f97a764487999754c0bfee9d2c231e ]

By calling edac_inc_ue_error() before panic, we get a correct UE error
count for core dump analysis.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
Link: https://lore.kernel.org/r/20200610065846.3626-2-zhenzhong.duan@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/edac/edac_mc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
index 5813e931f2f00..01ff71f7b6456 100644
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@ -950,6 +950,8 @@ static void edac_ue_error(struct edac_raw_error_desc *e)
 			e->other_detail);
 	}
 
+	edac_inc_ue_error(e);
+
 	if (edac_mc_get_panic_on_ue()) {
 		panic("UE %s%son %s (%s page:0x%lx offset:0x%lx grain:%ld%s%s)\n",
 			e->msg,
@@ -959,8 +961,6 @@ static void edac_ue_error(struct edac_raw_error_desc *e)
 			*e->other_detail ? " - " : "",
 			e->other_detail);
 	}
-
-	edac_inc_ue_error(e);
 }
 
 static void edac_inc_csrow(struct edac_raw_error_desc *e, int row, int chan)
-- 
2.25.1

