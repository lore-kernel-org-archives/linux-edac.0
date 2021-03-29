Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED46BC433DB
	for <linux-edac@archiver.kernel.org>; Mon, 29 Mar 2021 09:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC91F6195E
	for <linux-edac@archiver.kernel.org>; Mon, 29 Mar 2021 09:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbhC2Jt6 (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 29 Mar 2021 05:49:58 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:40070 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231594AbhC2Jtb (ORCPT
        <rfc822;linux-edac@vger.kernel.org>);
        Mon, 29 Mar 2021 05:49:31 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0UThbzQ9_1617011366;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UThbzQ9_1617011366)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 29 Mar 2021 17:49:26 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     tony.luck@intel.com
Cc:     bp@alien8.de, tglx@linutronix.de, mingo@redhat.com, x86@kernel.org,
        hpa@zytor.com, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] x86/mce/dev-mcelog: Fix potential memory access error
Date:   Mon, 29 Mar 2021 17:49:20 +0800
Message-Id: <1617011360-102531-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Using set_bit() to set a bit in an integer is not a good idea, since
the function expects an unsigned long as argument, which can be 64bit
wide.
Coverity reports this problem as

High:Out-of-bounds access(INCOMPATIBLE_CAST)
CWE119: Out-of-bounds access to a scalar
Pointer "&mcelog->flags" points to an object whose effective type is
"unsigned int" (32 bits, unsigned) but is dereferenced as a wider
"unsigned long" (64 bits, unsigned). This may lead to memory corruption.

/home/heyuan.shy/git-repo/linux/arch/x86/kernel/cpu/mce/dev-mcelog.c:
dev_mce_log

Just use BIT instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/x86/kernel/cpu/mce/dev-mcelog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/dev-mcelog.c b/arch/x86/kernel/cpu/mce/dev-mcelog.c
index 100fbee..fd7b1b4 100644
--- a/arch/x86/kernel/cpu/mce/dev-mcelog.c
+++ b/arch/x86/kernel/cpu/mce/dev-mcelog.c
@@ -51,7 +51,7 @@ static int dev_mce_log(struct notifier_block *nb, unsigned long val,
 	 * earlier errors are the more interesting ones:
 	 */
 	if (entry >= mcelog->len) {
-		set_bit(MCE_OVERFLOW, (unsigned long *)&mcelog->flags);
+		mcelog->flags |= BIT(MCE_OVERFLOW);
 		goto unlock;
 	}
 
-- 
1.8.3.1

