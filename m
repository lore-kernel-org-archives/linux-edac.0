Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9759C433EF
	for <linux-edac@archiver.kernel.org>; Mon, 27 Jun 2022 21:05:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239752AbiF0VFo (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 27 Jun 2022 17:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236108AbiF0VFn (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Mon, 27 Jun 2022 17:05:43 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8DA95A4
        for <linux-edac@vger.kernel.org>; Mon, 27 Jun 2022 14:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656363942; x=1687899942;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uEEvdAzl6LQlAje4goE+0aBteyIvswsxqpTvMqyDcww=;
  b=FSmjLRrQYjuDXHtisMSNlGeDXOyTVBKrfPuRl/ZuwtOrjQ3isnMAKMsd
   o/mG/TP7Vn9tc+CHjeuBR5NioZExBDyE8EVbSsWNmiUUsvI3yhX8jt+9t
   BqFAADtG9yaknk6afZM7Z3b2nkJKs3xYBQmbNBsImsdM8hjB4ESZicCVq
   eCiaeJTBfoKZkFfDtKjvi+qfLAOD9NjTGEEipzlPyFiG51B8uLtHxYdrv
   natF8OHSQYeKMtP4EG2apw3vo3yRwMCMLJP8OFD8lSKKu9pN3EkvqEjQX
   BE9R0vUNF1f0kY3uJmZup0XxF4PBJNZ4ilLX4tcVtmicGB8XGU3q+IwTf
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="282297232"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="282297232"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 14:05:32 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="646601197"
Received: from agluck-desk3.sc.intel.com ([172.25.222.78])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 14:05:31 -0700
From:   Tony Luck <tony.luck@intel.com>
To:     linux-edac@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>
Subject: [PATCH] rasdaemon: Change default corrected error threshold from 50/day to 2/day
Date:   Mon, 27 Jun 2022 14:05:25 -0700
Message-Id: <20220627210525.515705-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

A large scale study of memory errors in data centers showed that it is
best to aggressively take pages with corrected errors offline. This is
the best strategy of using corrected errors as a predictor of future
uncorrected errors.

Signed-off-by: Tony Luck <tony.luck@intel.com>

---
Here's the link to the study. I thought of putting into the commit
comment. But these links are sometimes changed as website is re-organised,
making the link stale.

https://www.intel.com/content/dam/www/public/us/en/documents/intel-and-samsung-mrt-improving-memory-reliability-at-data-centers.pdf

Note that Boris has questions against my kernel patch that does the same
on whether an unconditional change to "2" is the right value for other
CPU & memory vendors.
	https://lore.kernel.org/all/YrnBWjkX82OhXAtL@zn.tnic/

---
 misc/rasdaemon.env | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/misc/rasdaemon.env b/misc/rasdaemon.env
index 12fd76658430..5feab290cf01 100644
--- a/misc/rasdaemon.env
+++ b/misc/rasdaemon.env
@@ -14,7 +14,7 @@
 #
 # The two configs will only take no effect when PAGE_CE_ACTION is "off".
 PAGE_CE_REFRESH_CYCLE="24h"
-PAGE_CE_THRESHOLD="50"
+PAGE_CE_THRESHOLD="2"
 
 # Specify the internal action in rasdaemon to exceeding a page error threshold.
 #
-- 
2.35.3

