Return-Path: <SRS0=5vZG=EM=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCCEC2D0A3
	for <linux-edac@archiver.kernel.org>; Fri,  6 Nov 2020 08:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 383FC208B3
	for <linux-edac@archiver.kernel.org>; Fri,  6 Nov 2020 08:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgKFIoG (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 6 Nov 2020 03:44:06 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7061 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgKFIoF (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Fri, 6 Nov 2020 03:44:05 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CSDSs325fzhhPm;
        Fri,  6 Nov 2020 16:43:57 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.178.230) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Fri, 6 Nov 2020 16:43:51 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, x86 <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        linux-edac <linux-edac@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] x86/mce: remove unused WARN_ON() in mce_register_decode_chain()
Date:   Fri, 6 Nov 2020 16:43:40 +0800
Message-ID: <20201106084340.2009-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.178.230]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

enum mce_notifier_prios {
        MCE_PRIO_LOWEST,
        MCE_PRIO_MCELOG,
        MCE_PRIO_EDAC,

After commit c9c6d216ed28 ("x86/mce: Rename "first" function as "early""),
there is no other integer between MCE_PRIO_MCELOG and MCE_PRIO_EDAC.
Therefore, the WARN_ON() will never be triggered, just delete it.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 arch/x86/kernel/cpu/mce/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 4102b866e7c0..914f9f102995 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -162,9 +162,6 @@ EXPORT_SYMBOL_GPL(mce_log);
 
 void mce_register_decode_chain(struct notifier_block *nb)
 {
-	if (WARN_ON(nb->priority > MCE_PRIO_MCELOG && nb->priority < MCE_PRIO_EDAC))
-		return;
-
 	blocking_notifier_chain_register(&x86_mce_decoder_chain, nb);
 }
 EXPORT_SYMBOL_GPL(mce_register_decode_chain);
-- 
2.26.0.106.g9fadedd


