Return-Path: <SRS0=vHQJ=UH=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2715CC28CC5
	for <linux-edac@archiver.kernel.org>; Sat,  8 Jun 2019 21:27:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F351120684
	for <linux-edac@archiver.kernel.org>; Sat,  8 Jun 2019 21:27:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="FFR9dnjP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbfFHV1j (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Sat, 8 Jun 2019 17:27:39 -0400
Received: from terminus.zytor.com ([198.137.202.136]:43449 "EHLO
        terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727588AbfFHV1j (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Sat, 8 Jun 2019 17:27:39 -0400
Received: from terminus.zytor.com (localhost [127.0.0.1])
        by terminus.zytor.com (8.15.2/8.15.2) with ESMTPS id x58LRVXO3145700
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 8 Jun 2019 14:27:31 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 terminus.zytor.com x58LRVXO3145700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2019051801; t=1560029252;
        bh=NFzuBwTDRGe4YyWmom5QRb9DTpqofUFsUJTSlurXxKY=;
        h=Date:From:Cc:Reply-To:To:Subject:From;
        b=FFR9dnjPXFOUzy4WBQslH43uC+gIlQRYzylZL/8/Qx+5AiQ74KbTyd4/WivT+ghf5
         Q4VVrA0dvQi7T6tLQyYiW3leyuHnmspU1beshplWqK2yImaZyzGrZbjaVHpoz8VuSh
         rzVYukzhxc/OImi/WEjRNYj3fL6H8rjt10o1+wEpUXBxMUVOjkU3UrpebvxDywMzIA
         +0gIsTNHPd7/94EtJLzqbtuVnxLkrstNfG4/OBVg7t2p+SrdVOWr2C689BckjdA1od
         2FHLwUgUjke8Eg0/fWEj+4rjQtBgVQQ1eRwlYYu5hKbzfhe3nfVKael8hPtTxI/LXn
         Tlazqu/fCnDxw==
Received: (from tipbot@localhost)
        by terminus.zytor.com (8.15.2/8.15.2/Submit) id x58LRVbI3145697;
        Sat, 8 Jun 2019 14:27:31 -0700
Date:   Sat, 8 Jun 2019 14:27:31 -0700
X-Authentication-Warning: terminus.zytor.com: tipbot set sender to tipbot@zytor.com using -f
From:   tip-bot for Borislav Petkov <tipbot@zytor.com>
Message-ID: <tip-d0e375e8f26edd2e577e3afa9d952f91037cbd87@git.kernel.org>
Cc:     bp@suse.de, mingo@kernel.org, tony.luck@intel.com, hpa@zytor.com,
        tglx@linutronix.de, linux-edac@vger.kernel.org
Reply-To: linux-kernel@vger.kernel.org, tony.luck@intel.com,
          tglx@linutronix.de, hpa@zytor.com, linux-edac@vger.kernel.org,
          bp@suse.de, mingo@kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip:ras/core] RAS/CEC: Fix potential memory leak
Git-Commit-ID: d0e375e8f26edd2e577e3afa9d952f91037cbd87
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot.git.kernel.org>
Robot-Unsubscribe: Contact <mailto:hpa@kernel.org> to get blacklisted from
 these emails
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Commit-ID:  d0e375e8f26edd2e577e3afa9d952f91037cbd87
Gitweb:     https://git.kernel.org/tip/d0e375e8f26edd2e577e3afa9d952f91037cbd87
Author:     Borislav Petkov <bp@suse.de>
AuthorDate: Sat, 20 Apr 2019 21:39:24 +0200
Committer:  Borislav Petkov <bp@suse.de>
CommitDate: Sat, 8 Jun 2019 17:35:04 +0200

RAS/CEC: Fix potential memory leak

Free the array page if a failure is encountered while creating the
debugfs nodes.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Tony Luck <tony.luck@intel.com>
Cc: linux-edac <linux-edac@vger.kernel.org>
---
 drivers/ras/cec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 31868bd99e8d..f57e869dfea2 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -504,8 +504,10 @@ void __init cec_init(void)
 		return;
 	}
 
-	if (create_debugfs_nodes())
+	if (create_debugfs_nodes()) {
+		free_page((unsigned long)ce_arr.array);
 		return;
+	}
 
 	INIT_DELAYED_WORK(&cec_work, cec_work_fn);
 	schedule_delayed_work(&cec_work, CEC_DECAY_DEFAULT_INTERVAL);
