Return-Path: <SRS0=w05P=VJ=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2776BC742C7
	for <linux-edac@archiver.kernel.org>; Fri, 12 Jul 2019 15:24:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0860D208E4
	for <linux-edac@archiver.kernel.org>; Fri, 12 Jul 2019 15:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfGLPYc (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 12 Jul 2019 11:24:32 -0400
Received: from mga11.intel.com ([192.55.52.93]:22268 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727079AbfGLPYc (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Fri, 12 Jul 2019 11:24:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jul 2019 08:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,483,1557212400"; 
   d="scan'208";a="365639340"
Received: from tthayer-hp-z620.an.intel.com (HELO [10.122.105.146]) ([10.122.105.146])
  by fmsmga006.fm.intel.com with ESMTP; 12 Jul 2019 08:24:26 -0700
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH 0/3] Stratix10 SDRAM Common EDAC Framework
To:     bp@alien8.de, mchehab@kernel.org, james.morse@arm.com,
        robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org
Cc:     devicetree@vger.kernel.org, linux-edac@vger.kernel.org
References: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
From:   Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <08ec9a1b-bc01-bc0a-b35d-4997d27bfdf8@linux.intel.com>
Date:   Fri, 12 Jul 2019 10:26:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On 7/9/19 5:24 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Use the common Altera EDAC Device Framework for the SDRAM so that
> Double Bit Error Addresses can be tracked for SDRAM.
> This also simplifies the device tree.
> 
> Thor Thayer (3):
>    Documentation: dt: edac: Add reg to S10 SDRAM node
>    arm64: dts: Stratix10: Include regs in SDRAM ECC node
>    EDAC, altera: Use common framework for Stratix10 SDRAM ECC
> 
>   .../devicetree/bindings/edac/socfpga-eccmgr.txt    |  4 ++-
>   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  9 ++----
>   drivers/edac/altera_edac.c                         | 32 ++++++++++++++++++++--
>   drivers/edac/altera_edac.h                         | 25 ++++++++++++++++-
>   4 files changed, 58 insertions(+), 12 deletions(-)
> 
Please disregard this patchset, there is a simpler solution.
