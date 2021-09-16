Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E4AC433EF
	for <linux-edac@archiver.kernel.org>; Thu, 16 Sep 2021 08:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3374D60F93
	for <linux-edac@archiver.kernel.org>; Thu, 16 Sep 2021 08:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235242AbhIPIyW (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Thu, 16 Sep 2021 04:54:22 -0400
Received: from mail.skyhub.de ([5.9.137.197]:43476 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233839AbhIPIyW (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Thu, 16 Sep 2021 04:54:22 -0400
Received: from zn.tnic (p200300ec2f11c60068b45be7854516a5.dip0.t-ipconnect.de [IPv6:2003:ec:2f11:c600:68b4:5be7:8545:16a5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 131741EC02DD;
        Thu, 16 Sep 2021 10:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1631782381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=y4CFivauLhLprWhzlOQkVX5V7jYc9fv4+zTQv3l3Mxw=;
        b=HksJcYcWOhE3/CkhYF8Ysmcof0JvZLKqjAYCWwR3iM7jH18xXloJOqcpiFr5xwlwF30siZ
        QmWBKeLibb6Ewnqlm+C6ZZuNzCRxWNBpkXRJ673qC3YxQC7bc3vYfKuJxbelENOedZN5kK
        a1Z48tIBRHrlkpg9RsQ9L/Jq7TsnG14=
From:   Borislav Petkov <bp@alien8.de>
To:     Lei Wang <lewan@microsoft.com>
Cc:     linux-edac <linux-edac@vger.kernel.org>
Subject: [PATCH] EDAC/dmc520: Assign the proper type to dimm->edac_mode
Date:   Thu, 16 Sep 2021 10:52:58 +0200
Message-Id: <20210916085258.7544-1-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

dimm->edac_mode contains values of type enum edac_type - not the
corresponding capability flags. Fix that.

Fixes: 1088750d7839 ("EDAC: Add EDAC driver for DMC520")
Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: <stable@vger.kernel.org>
---
 drivers/edac/dmc520_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/dmc520_edac.c b/drivers/edac/dmc520_edac.c
index fc1153ab1ebb..b8a7d9594afd 100644
--- a/drivers/edac/dmc520_edac.c
+++ b/drivers/edac/dmc520_edac.c
@@ -464,7 +464,7 @@ static void dmc520_init_csrow(struct mem_ctl_info *mci)
 			dimm->grain	= pvt->mem_width_in_bytes;
 			dimm->dtype	= dt;
 			dimm->mtype	= mt;
-			dimm->edac_mode	= EDAC_FLAG_SECDED;
+			dimm->edac_mode	= EDAC_SECDED;
 			dimm->nr_pages	= pages_per_rank / csi->nr_channels;
 		}
 	}
-- 
2.29.2

