Return-Path: <SRS0=/y6Q=VG=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A7BC73C53
	for <linux-edac@archiver.kernel.org>; Tue,  9 Jul 2019 22:22:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD73820656
	for <linux-edac@archiver.kernel.org>; Tue,  9 Jul 2019 22:22:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbfGIWWu (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Tue, 9 Jul 2019 18:22:50 -0400
Received: from mga06.intel.com ([134.134.136.31]:10288 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726324AbfGIWWt (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Tue, 9 Jul 2019 18:22:49 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jul 2019 15:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,472,1557212400"; 
   d="scan'208";a="364289191"
Received: from tthayer-hp-z620.an.intel.com ([10.122.105.146])
  by fmsmga005.fm.intel.com with ESMTP; 09 Jul 2019 15:22:47 -0700
From:   thor.thayer@linux.intel.com
To:     bp@alien8.de, mchehab@kernel.org, james.morse@arm.com,
        robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org
Cc:     devicetree@vger.kernel.org, linux-edac@vger.kernel.org,
        Thor Thayer <thor.thayer@linux.intel.com>
Subject: [PATCH 1/3] Documentation: dt: edac: Add reg to S10 SDRAM node
Date:   Tue,  9 Jul 2019 17:24:48 -0500
Message-Id: <1562711090-900-2-git-send-email-thor.thayer@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
References: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Include the register offset and size in the Stratix10 SDRAM node
to be consistent with other ECC modules.
Previously had to follow the phandle to get the register size/offset.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
index 8f52206cfd2a..dd6ba6c020a7 100644
--- a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
+++ b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
@@ -256,6 +256,7 @@ Subcomponents:
 SDRAM ECC
 Required Properties:
 - compatible : Should be "altr,sdram-edac-s10"
+- reg        : Address and size for ECC block registers.
 - interrupts : Should be single bit error interrupt.
 
 On-Chip RAM ECC
@@ -313,8 +314,9 @@ Example:
 		#interrupt-cells = <2>;
 		ranges;
 
-		sdramedac {
+		sdramedac@0xf8011100 {
 			compatible = "altr,sdram-edac-s10";
+			reg = <0xf8011100 0xc0>;
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.7.4

