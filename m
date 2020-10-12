Return-Path: <SRS0=lgYc=DT=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB1EC433DF
	for <linux-edac@archiver.kernel.org>; Mon, 12 Oct 2020 09:20:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8ED0208D5
	for <linux-edac@archiver.kernel.org>; Mon, 12 Oct 2020 09:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgJLJUm (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 12 Oct 2020 05:20:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:52582 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727227AbgJLJUm (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Mon, 12 Oct 2020 05:20:42 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 05CBEAFCA;
        Mon, 12 Oct 2020 09:20:41 +0000 (UTC)
Date:   Mon, 12 Oct 2020 11:20:29 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-edac <linux-edac@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] EDAC queue for v5.10
Message-ID: <20201012092029.GA25311@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Hi Linus,

please pull the EDAC pile accumulated this time around.

Thx.

---

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v5.10

for you to fetch changes up to 1dc32628d65a670625afada00f50c91add1a19a2:

  Merge branch 'edac-drivers' into edac-updates-for-v5.10 (2020-10-12 11:05:42 +0200)

----------------------------------------------------------------
* Add Amazon's Annapurna Labs memory controller EDAC driver, by Talel
Shenhar.

* New AMD CPUs support, by Yazen Ghannam.

* The usual misc fixes and cleanups all over the subsystem.

----------------------------------------------------------------
Alexander A. Klimov (1):
      EDAC: Replace HTTP links with HTTPS ones

Borislav Petkov (1):
      Merge branch 'edac-drivers' into edac-updates-for-v5.10

Dinghao Liu (1):
      EDAC/i5100: Fix error handling order in i5100_init_one()

Dinh Nguyen (1):
      EDAC/socfpga: Transfer SoCFPGA EDAC maintainership

Krzysztof Kozlowski (2):
      EDAC/aspeed: Fix handling of platform_get_irq() error
      EDAC/ti: Fix handling of platform_get_irq() error

Liu Shixin (1):
      EDAC/aspeed: Use module_platform_driver() to simplify

Robert Richter (1):
      EDAC/highbank: Handover Calxeda Highbank maintenance to Andre Przywara

Talel Shenhar (2):
      dt-bindings: EDAC: Add Amazon's Annapurna Labs Memory Controller binding
      EDAC/al-mc-edac: Add Amazon's Annapurna Labs Memory Controller driver

Tom Rix (1):
      EDAC, sb_edac: Simplify switch statement

Wei Yongjun (1):
      EDAC/thunderx: Make symbol lmc_dfs_ents static

Xiongfeng Wang (1):
      EDAC/mc_sysfs: Add missing newlines when printing {max,dimm}_location

Yazen Ghannam (2):
      EDAC/mce_amd: Add new error descriptions for existing types
      EDAC/amd64: Set proper family type for Family 19h Models 20h-2Fh

 .../bindings/edac/amazon,al-mc-edac.yaml           |  67 ++++
 MAINTAINERS                                        |  11 +-
 drivers/edac/Kconfig                               |   7 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/al_mc_edac.c                          | 354 +++++++++++++++++++++
 drivers/edac/amd64_edac.c                          |   6 +
 drivers/edac/aspeed_edac.c                         |  22 +-
 drivers/edac/e752x_edac.c                          |   2 +-
 drivers/edac/edac_mc_sysfs.c                       |  22 +-
 drivers/edac/ghes_edac.c                           |   2 +-
 drivers/edac/i5100_edac.c                          |  11 +-
 drivers/edac/i5400_edac.c                          |   4 +-
 drivers/edac/i7300_edac.c                          |   4 +-
 drivers/edac/i7core_edac.c                         |   4 +-
 drivers/edac/ie31200_edac.c                        |   6 +-
 drivers/edac/mce_amd.c                             |  11 +-
 drivers/edac/sb_edac.c                             |   7 +-
 drivers/edac/thunderx_edac.c                       |   2 +-
 drivers/edac/ti_edac.c                             |   5 +-
 19 files changed, 496 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml
 create mode 100644 drivers/edac/al_mc_edac.c

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
