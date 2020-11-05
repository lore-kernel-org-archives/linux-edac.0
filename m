Return-Path: <SRS0=1WEp=EL=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2369C55178
	for <linux-edac@archiver.kernel.org>; Thu,  5 Nov 2020 19:05:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 571A32083B
	for <linux-edac@archiver.kernel.org>; Thu,  5 Nov 2020 19:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732083AbgKETFp (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Thu, 5 Nov 2020 14:05:45 -0500
Received: from mga09.intel.com ([134.134.136.24]:24077 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732033AbgKETFp (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Thu, 5 Nov 2020 14:05:45 -0500
IronPort-SDR: 2gZogRgwxGYVjzP52fWD44LAmeUKHM2dfZfRH6ij9uVPpUdYbtclTIln2dKP3jH9UlFZrZpYci
 ikcxIZLkyEOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="169584670"
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; 
   d="scan'208";a="169584670"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 11:05:22 -0800
IronPort-SDR: xVknNJQdNtLszzX+XD2mlPV1pT9cJbL4PrVo7bo2tPn5k4cVy7D3kjSbn1DgTwoK+SdkdeuFix
 cN3LBH5Jymfg==
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; 
   d="scan'208";a="539529286"
Received: from agluck-desk2.sc.intel.com ([10.3.52.68])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 11:05:20 -0800
From:   Tony Luck <tony.luck@intel.com>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
        Aristeu Rozanski <aris@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Update MAINTAINERS for EDAC
Date:   Thu,  5 Nov 2020 11:05:07 -0800
Message-Id: <20201105190509.19719-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20201105074807.3697-1-qiuxu.zhuo@intel.com>
References: <20201105074807.3697-1-qiuxu.zhuo@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

A new driver for Intel client system on chip.

Clean up a couple of F: entries for other EDAC drivers.

Tony Luck (2):
  MAINTAINERS: Add entry for Intel IGEN6 EDAC driver
  MAINTAINERS: Clean up the F: entries for some EDAC drivers

 MAINTAINERS | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

[Boris: If there are no objections I'll apply part 1 on top
of Qiuxu's series for the edac_igen6 driver (new topic branch
in RAS tree). Part 2 can go into the edac-misc branch]

-- 
2.21.1

