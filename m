Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F076C4320A
	for <linux-edac@archiver.kernel.org>; Wed, 18 Aug 2021 00:29:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73D9561051
	for <linux-edac@archiver.kernel.org>; Wed, 18 Aug 2021 00:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235847AbhHRAa1 (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Tue, 17 Aug 2021 20:30:27 -0400
Received: from mga12.intel.com ([192.55.52.136]:60945 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234818AbhHRAa0 (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Tue, 17 Aug 2021 20:30:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="195807460"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="195807460"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2021 17:29:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="520687348"
Received: from agluck-desk2.sc.intel.com ([10.3.52.146])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2021 17:29:52 -0700
From:   Tony Luck <tony.luck@intel.com>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Jue Wang <juew@google.com>, Ding Hui <dinghui@sangfor.com.cn>,
        naoya.horiguchi@nec.com, osalvador@suse.de,
        Youquan Song <youquan.song@intel.com>, huangcun@sangfor.com.cn,
        x86@kernel.org, linux-edac@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Tony Luck <tony.luck@intel.com>
Subject: [PATCH v2 3/3] x86/mce: Drop copyin special case for #MC
Date:   Tue, 17 Aug 2021 17:29:42 -0700
Message-Id: <20210818002942.1607544-4-tony.luck@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210818002942.1607544-1-tony.luck@intel.com>
References: <20210706190620.1290391-1-tony.luck@intel.com>
 <20210818002942.1607544-1-tony.luck@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Fixes to the iterator code to handle faults that are not on
page boundaries mean that the special case for machine check
during copy from user is no longer needed.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/lib/copy_user_64.S | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/x86/lib/copy_user_64.S b/arch/x86/lib/copy_user_64.S
index 57b79c577496..2797e630b9b1 100644
--- a/arch/x86/lib/copy_user_64.S
+++ b/arch/x86/lib/copy_user_64.S
@@ -234,24 +234,11 @@ EXPORT_SYMBOL(copy_user_enhanced_fast_string)
  */
 SYM_CODE_START_LOCAL(.Lcopy_user_handle_tail)
 	movl %edx,%ecx
-	cmp $X86_TRAP_MC,%eax		/* check if X86_TRAP_MC */
-	je 3f
 1:	rep movsb
 2:	mov %ecx,%eax
 	ASM_CLAC
 	ret
 
-	/*
-	 * Return zero to pretend that this copy succeeded. This
-	 * is counter-intuitive, but needed to prevent the code
-	 * in lib/iov_iter.c from retrying and running back into
-	 * the poison cache line again. The machine check handler
-	 * will ensure that a SIGBUS is sent to the task.
-	 */
-3:	xorl %eax,%eax
-	ASM_CLAC
-	ret
-
 	_ASM_EXTABLE_CPY(1b, 2b)
 SYM_CODE_END(.Lcopy_user_handle_tail)
 
-- 
2.29.2

