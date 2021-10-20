Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F93DC433F5
	for <linux-edac@archiver.kernel.org>; Wed, 20 Oct 2021 15:18:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 797C96135F
	for <linux-edac@archiver.kernel.org>; Wed, 20 Oct 2021 15:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhJTPUx convert rfc822-to-8bit (ORCPT
        <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 20 Oct 2021 11:20:53 -0400
Received: from mga14.intel.com ([192.55.52.115]:7664 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229702AbhJTPUw (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Wed, 20 Oct 2021 11:20:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="229075460"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; 
   d="scan'208";a="229075460"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 08:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; 
   d="scan'208";a="463229200"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP; 20 Oct 2021 08:18:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 20 Oct 2021 08:18:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 20 Oct 2021 08:18:35 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2242.012;
 Wed, 20 Oct 2021 08:18:35 -0700
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "H . Peter Anvin" <hpa@zytor.com>,
        "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Subject: RE: [PATCH v2 5/5] x86/mce/mce-inject: Return error code to userspace
 from mce-inject module
Thread-Topic: [PATCH v2 5/5] x86/mce/mce-inject: Return error code to
 userspace from mce-inject module
Thread-Index: AQHXxUI/YyOuX4p20E+A/RVSGS1pGqvcAE6A
Date:   Wed, 20 Oct 2021 15:18:35 +0000
Message-ID: <5c6d28154036475882466a4420c0d499@intel.com>
References: <20211019233641.140275-1-Smita.KoralahalliChannabasappa@amd.com>
 <20211019233641.140275-6-Smita.KoralahalliChannabasappa@amd.com>
In-Reply-To: <20211019233641.140275-6-Smita.KoralahalliChannabasappa@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

+	if (!cpu_online(cpu)) {
+		pr_err("No online CPUs available for error injection\n");
+		mce_err.err = -ENODEV;

Maybe "Chosen CPU is not online\n"?

-Tony
