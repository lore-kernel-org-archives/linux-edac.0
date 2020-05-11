Return-Path: <SRS0=7EKQ=6Z=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0627C47255
	for <linux-edac@archiver.kernel.org>; Mon, 11 May 2020 14:21:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4BEC20736
	for <linux-edac@archiver.kernel.org>; Mon, 11 May 2020 14:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="upyve4Or"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgEKOVg (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 11 May 2020 10:21:36 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:14985 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728638AbgEKOVd (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Mon, 11 May 2020 10:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1589206893; x=1620742893;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=U6kGODr7SvjecGrPckaSC8vwh7VLw6xTiedeeYVRtsM=;
  b=upyve4OrQYHSO4357UoKDtjXCvc5oZS3aHgoP6ry9b2YJIxRxgm/8KzH
   MOEOjQoZgDzb/FzRyizlSMTQgPsxszEbiW2p71xK15ky1nTNkujoX84fO
   mkZhfyt/dWHg8zsUXExnOeq3RyPzhPTN2LX/g0/LKpOziYLyugNAGW6JL
   k=;
IronPort-SDR: c+9Zxky6mS97LD8eMGZNVmahIfEGNsDLMzO5/U4H2YhQRrkK/BRXsTC1POjKkjXahuHzdcaJvi
 pEVHnLDuklRQ==
X-IronPort-AV: E=Sophos;i="5.73,380,1583193600"; 
   d="scan'208";a="29697038"
Subject: Re: [RFC] Support different block names with same EDAC device
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 11 May 2020 14:21:19 +0000
Received: from EX13MTAUEE002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS id 5C0E3A223D;
        Mon, 11 May 2020 14:21:18 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 11 May 2020 14:21:17 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 11 May 2020 14:21:17 +0000
Received: from [192.168.12.223] (10.1.213.8) by mail-relay.amazon.com
 (10.43.62.224) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Mon, 11 May 2020 14:21:15 +0000
To:     Borislav Petkov <bp@alien8.de>
CC:     "james.morse@arm.com" <james.morse@arm.com>,
        Robert Richter <rrichter@marvell.com>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "Woodhouse, David" <dwmw@amazon.co.uk>,
        "Krupnik, Ronen" <ronenk@amazon.com>, <talel@amazon.com>,
        <jonnyc@amazon.com>, "Hanoch, Uri" <hanochu@amazon.com>
References: <0ae313a4-97c3-5681-f22c-23decb261b74@amazon.com>
 <20200511135507.GC25861@zn.tnic>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
Message-ID: <2fc308f9-47d6-7c75-775b-3f6579dfe571@amazon.com>
Date:   Mon, 11 May 2020 17:21:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511135507.GC25861@zn.tnic>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org



On 5/11/2020 4:55 PM, Borislav Petkov wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On Mon, May 11, 2020 at 03:59:38PM +0300, Hawa, Hanna wrote:
>> Can the edac device infrastructure support different block names? Shall we
>> add support for such feature?
> 
> Does the "EDAC Blocks" section here:
> 
> Documentation/driver-api/edac.rst
> 
> answer your question?

Hi Boris,

Thanks for your quick answer, according to the section you point to, the 
block names shall be different e.g. L1-cache/L2-cache. But when 
initializing the sysfs block names, the block index appends the 
block-name [1].

I'm trying to create different block names e.g. hw_block_a, hw_block_b.

[1]: 
https://elixir.bootlin.com/linux/v5.7-rc5/source/drivers/edac/edac_device.c#L161

> 
> --
> Regards/Gruss,
>      Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
> 
