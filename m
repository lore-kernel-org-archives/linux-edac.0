Return-Path: <SRS0=R4IU=XI=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9040CC4CEC5
	for <linux-edac@archiver.kernel.org>; Fri, 13 Sep 2019 14:51:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69C1721479
	for <linux-edac@archiver.kernel.org>; Fri, 13 Sep 2019 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568386264;
	bh=/n1tuPq5+qiX4XGR3Ma55WzDCXnACRKI5h7vdQmfpgE=;
	h=From:Cc:Subject:Date:To:List-ID:From;
	b=bfNHeAOTwfme9fgww1OVqhJUVreVeI8+XzAgqo9dZp1Cu/AZzBmnrfSt6NreYZgAp
	 wMHtoMrcPBKIVTFLlwd1CIUdQYPFt4zVizmHkGnRos0uwwXe5+D82aIEE7kz8kd1XW
	 C6tEULAMdooRB9r6g9B1Hg0v1EvM38DZo48eE9Qc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389153AbfIMOui (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 13 Sep 2019 10:50:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40784 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388953AbfIMOuh (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Fri, 13 Sep 2019 10:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=q3Ga10yfzeYwpxzznlPXk6UJIJ2TiV9coxLDW5IjRtQ=; b=C6+DA8OLlRAbM+V6wKgn6PB17
        KQ72yJDKteynS6SYGdsx4L+4q0GSUma2xxWwnd2xkMmUs6eyGO8MxP5ynQowZRnVfHbKbQhvzowe5
        +uHl3oFrIa/d3SJ+DBeJn7ZMEHiv8uSNem5hqiYAOYuBKn9Y11oF0cXStGRcWPNMQvMmJl05A5Yn5
        QJVhzqoKz/PMQrziYhddGHQHIaE+6P/fAPbqhoF9M1dAS/AcgIPpnH26rDJJdjNU/xVHUI1NQ2QT/
        ElMQUfEXk/pZOjaRK1f1YU2xNJLxNlBceej6u+MsdWy0WjnnLNJdCtIePIXQ4PQ3p2MxPQSfq01CR
        yTwS2WLjA==;
Received: from 177.96.232.144.dynamic.adsl.gvt.net.br ([177.96.232.144] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1i8muC-0002Mq-2T; Fri, 13 Sep 2019 14:50:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.2)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i8mu9-00042n-Db; Fri, 13 Sep 2019 11:50:33 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Edac Mailing List <linux-edac@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
        Robert Richter <rrichter@marvell.com>,
        James Morse <james.morse@arm.com>
Subject: [PATCH 0/7] Address most issues when building with W=1
Date:   Fri, 13 Sep 2019 11:50:25 -0300
Message-Id: <cover.1568385816.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

There is a recent discussion at KS ML with regards to use W=1 as default.

No idea if this will happen or not, but it doesn't hurt cleaning up W=1
warnings from the EDAC subsystem, specially since it helps to cleanup
a few things.

This patch series addresses most of such warnings.  After this series,
there will be just two W=1 warnings:

1) i5100 EDAC driver:

	drivers/edac/i5100_edac.c: In function ‘i5100_read_log’:
	drivers/edac/i5100_edac.c:487:11: warning: variable ‘ecc_loc’ set but not used [-Wunused-but-set-variable]
	  487 |  unsigned ecc_loc = 0;
	      |           ^~~~~~~


   The ecc_loc contents is filled from MC data, but it is not used anywere.
   The i5100 MC is very old: the affected code was added in 2008. It should
   probably be safe to just drop the corresponding data, but, as it may
   contain some relevant info, I was a little reticent of doing that.

2) Xgene EDAC driver:

	drivers/edac/xgene_edac.c: In function ‘xgene_edac_rb_report’:
	drivers/edac/xgene_edac.c:1486:7: warning: variable ‘address’ set but not used [-Wunused-but-set-variable]
	 1486 |   u32 address;
	      |       ^~~~~~~

   I suspect that the content of the address field should actually be used on
   at least some of the logs.

I may eventually submit patches later to address the above cases, but let's
solve first the other cases, as they all sound trivial enough.

Mauro Carvalho Chehab (7):
  EDAC: i5100_edac: get rid of an unused var
  EDAC: i7300_edac: rename a kernel-doc var description
  EDAC: i7300_edac: fix a kernel-doc syntax
  EDAC: i5400_edac: print type at debug message
  EDAC: i5400_edac: get rid of some unused vars
  EDAC: sb_edac: get rid of unused vars
  EDAC: skx_common: get rid of unused type var

 drivers/edac/i5100_edac.c |  2 --
 drivers/edac/i5400_edac.c | 15 +++------------
 drivers/edac/i7300_edac.c |  4 ++--
 drivers/edac/sb_edac.c    | 21 ++++++++-------------
 drivers/edac/skx_common.c |  5 +----
 5 files changed, 14 insertions(+), 33 deletions(-)

-- 
2.21.0

