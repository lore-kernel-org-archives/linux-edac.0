Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5313FC4361B
	for <linux-edac@archiver.kernel.org>; Wed, 23 Dec 2020 02:59:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CA2D206F6
	for <linux-edac@archiver.kernel.org>; Wed, 23 Dec 2020 02:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbgLWCUM (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Tue, 22 Dec 2020 21:20:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:46336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726969AbgLWCUK (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Tue, 22 Dec 2020 21:20:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBC8922A83;
        Wed, 23 Dec 2020 02:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608689995;
        bh=2Z3yb9p6tF4duZkuu2uM73Oj92pH5ojf+kvRAhwP5ZQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X0Ecei9hUPHas4B3v7H99doz9N22KOUjqVAuRyTpLVk/YpwyqIpsLZ2aKzIjkUTRr
         yhPf0whg/pSvScjnUSPRb8ENFkF4o7KkIzMjBTLCBBxicDKtGCZ4zwgBjVfHuowAfi
         fe6qVQK3jQ/GUXOY1SP7YpHHRGXGjRxil8lLmFHGhhm9mZQ0DXk9ytbsiu8iDT8mnl
         GwQnEpZddq1y4265Um7UuJ8PI212wQ6TpaUVKprTfqAhbvdoftkgRRhn0AgdbBCYxW
         IC3CtoavOxK/oq1DsUu8uyvM56NYMAbG/8PrthBCEPtgpt8BiNLHeIU8+riuYQetpt
         r5TU9ONsLEs4A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Borislav Petkov <bp@suse.de>, Tony Luck <tony.luck@intel.com>,
        Sasha Levin <sashal@kernel.org>, linux-edac@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 079/130] x86/mce: Panic for LMCE only if mca_cfg.tolerant < 3
Date:   Tue, 22 Dec 2020 21:17:22 -0500
Message-Id: <20201223021813.2791612-79-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

From: Gabriele Paoloni <gabriele.paoloni@intel.com>

[ Upstream commit 3a866b16fd2360a9c4ebf71cfbf7ebfe968c1409 ]

Right now for LMCE, if no_way_out is set, mce_panic() is called
regardless of mca_cfg.tolerant. This is not correct as, if
mca_cfg.tolerant = 3, the code should never panic.

Add that check.

 [ bp: use local ptr 'cfg'. ]

Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Link: https://lkml.kernel.org/r/20201127161819.3106432-4-gabriele.paoloni@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/kernel/cpu/mce/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 10f69e045d3ea..344fe08779824 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1344,7 +1344,7 @@ void do_machine_check(struct pt_regs *regs, long error_code)
 	 * to see it will clear it.
 	 */
 	if (lmce) {
-		if (no_way_out)
+		if (no_way_out && cfg->tolerant < 3)
 			mce_panic("Fatal local machine check", &m, msg);
 	} else {
 		order = mce_start(&no_way_out);
-- 
2.27.0

