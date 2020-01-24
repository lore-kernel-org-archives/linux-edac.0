Return-Path: <SRS0=zAmC=3N=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792AFC2D0DB
	for <linux-edac@archiver.kernel.org>; Fri, 24 Jan 2020 09:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50BC22467B
	for <linux-edac@archiver.kernel.org>; Fri, 24 Jan 2020 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579859858;
	bh=UcGNx/ribASwYB5bYwww9OPS0GEK816IiSrkyUveH4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=zv3doRA4gsbyJ6K82S/SqIXYP/6Qz2UpUvSOlMN61tPS+FYSGW0pV/2QOZLXc9UC0
	 X1YHEfPfe59qWaPGCXDI65z5vzGTc6aTkFanSkXL0W1X99lEq6FLMlY2i42heTna+j
	 VsVv+iYZ0bKd17poHazCkt9q4VeF7+sGNsQW8aJk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbgAXJ5h (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 24 Jan 2020 04:57:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:33186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729990AbgAXJ5h (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Fri, 24 Jan 2020 04:57:37 -0500
Received: from localhost (unknown [145.15.244.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06E4720709;
        Fri, 24 Jan 2020 09:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579859856;
        bh=UcGNx/ribASwYB5bYwww9OPS0GEK816IiSrkyUveH4I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=btjF0CPnrPlQ7/NwsAiphbo1YABFsYjAJLI6AVEKVTSS+YjqImOD7eOwXU1n8Cduy
         nMAejxnXFnBvsS0m7WuR05FkLMDzDIPF8aK8qW7hvS3xWGqGw707tz+lUBWLPFt+d3
         sLc5HEcbkG6PVNDYq8gOIqhwCxLJOY3U+wdxMy0Y=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Robert Richter <rrichter@marvell.com>,
        Borislav Petkov <bp@suse.de>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        James Morse <james.morse@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.14 210/343] EDAC/mc: Fix edac_mc_find() in case no device is found
Date:   Fri, 24 Jan 2020 10:30:28 +0100
Message-Id: <20200124092947.711378247@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124092919.490687572@linuxfoundation.org>
References: <20200124092919.490687572@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

From: Robert Richter <rrichter@marvell.com>

[ Upstream commit 29a0c843973bc385918158c6976e4dbe891df969 ]

The function should return NULL in case no device is found, but it
always returns the last checked mc device from the list even if the
index did not match. Fix that.

I did some analysis why this did not raise any issues for about 3 years
and the reason is that edac_mc_find() is mostly used to search for
existing devices. Thus, the bug is not triggered.

 [ bp: Drop the if (mci->mc_idx > idx) test in favor of readability. ]

Fixes: c73e8833bec5 ("EDAC, mc: Fix locking around mc_devices list")
Signed-off-by: Robert Richter <rrichter@marvell.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Cc: James Morse <james.morse@arm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Link: https://lkml.kernel.org/r/20190514104838.15065-1-rrichter@marvell.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/edac/edac_mc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
index f7fa05fee45a1..329021189c38b 100644
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@ -680,22 +680,18 @@ static int del_mc_from_global_list(struct mem_ctl_info *mci)
 
 struct mem_ctl_info *edac_mc_find(int idx)
 {
-	struct mem_ctl_info *mci = NULL;
+	struct mem_ctl_info *mci;
 	struct list_head *item;
 
 	mutex_lock(&mem_ctls_mutex);
 
 	list_for_each(item, &mc_devices) {
 		mci = list_entry(item, struct mem_ctl_info, link);
-
-		if (mci->mc_idx >= idx) {
-			if (mci->mc_idx == idx) {
-				goto unlock;
-			}
-			break;
-		}
+		if (mci->mc_idx == idx)
+			goto unlock;
 	}
 
+	mci = NULL;
 unlock:
 	mutex_unlock(&mem_ctls_mutex);
 	return mci;
-- 
2.20.1



