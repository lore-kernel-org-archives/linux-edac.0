Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2BBC4338F
	for <linux-edac@archiver.kernel.org>; Wed, 18 Aug 2021 17:57:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EE82610FE
	for <linux-edac@archiver.kernel.org>; Wed, 18 Aug 2021 17:57:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhHRR5p (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 18 Aug 2021 13:57:45 -0400
Received: from mga09.intel.com ([134.134.136.24]:55653 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhHRR5o (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 18 Aug 2021 13:57:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216386870"
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; 
   d="scan'208";a="216386870"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 10:57:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; 
   d="scan'208";a="521178089"
Received: from agluck-desk2.sc.intel.com ([10.3.52.146])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 10:57:08 -0700
From:   Tony Luck <tony.luck@intel.com>
To:     linux-edac@vger.kernel.org
Cc:     Tony Luck <tony.luck@intel.com>,
        Aristeu Rozanski <aris@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Qiuxu Zhuo <qiuxu.zhuo@intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] EDAC/i10nm fix and enhancement
Date:   Wed, 18 Aug 2021 10:56:59 -0700
Message-Id: <20210818175701.1611513-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Patch 1 fixes incorrect scope of a register the indicates which NVDIMMs
are present (register is per channel, not per DIMM)

Patch 2 adds code to conditionally report similar data from the platform
retry_rd_log registers on 10nm platforms as is already done for Skylake
generation.

Qiuxu Zhuo (1):
  EDAC/i10nm: Fix NVDIMM detection

Youquan Song (1):
  EDAC/i10nm: Retrieve and print retry_rd_err_log registers

 drivers/edac/i10nm_base.c | 152 +++++++++++++++++++++++++++++++++++++-
 drivers/edac/skx_base.c   |   3 +-
 drivers/edac/skx_common.c |   4 +-
 drivers/edac/skx_common.h |   7 +-
 4 files changed, 160 insertions(+), 6 deletions(-)

-- 
2.29.2

