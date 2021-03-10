Return-Path: <linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5879CC433E0
	for <linux-edac@archiver.kernel.org>; Wed, 10 Mar 2021 14:46:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 261A064EF9
	for <linux-edac@archiver.kernel.org>; Wed, 10 Mar 2021 14:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232841AbhCJOqR (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 10 Mar 2021 09:46:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38638 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232659AbhCJOp7 (ORCPT
        <rfc822;linux-edac@vger.kernel.org>);
        Wed, 10 Mar 2021 09:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615387558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qe7vnreao5ThhJBhWOb2yAQo6akg/BiUCkUWjObNy9A=;
        b=UJio361ycv3FfHgO/mmDPV8NnheNq+6b7BM4cir6sh7v9lyIgnHZV5dXntjgjS58IgBwVx
        skhW+DM+vFerBkOgHL1x1qzXHM5KcDTkxN2ItkAfmsnEMRqu+vlKEdHtS3/tybYh8tsXTR
        S7dOLRZtgGrsvvX1ItBX4ajqwvTIN8A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-XyDnMlklNOuqC7vhvK8tWQ-1; Wed, 10 Mar 2021 09:45:55 -0500
X-MC-Unique: XyDnMlklNOuqC7vhvK8tWQ-1
Received: by mail-qk1-f197.google.com with SMTP id a1so12848684qkn.11
        for <linux-edac@vger.kernel.org>; Wed, 10 Mar 2021 06:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Qe7vnreao5ThhJBhWOb2yAQo6akg/BiUCkUWjObNy9A=;
        b=q5BAZrzwo0OWz/Kh16tJgFSol0+eGDklWJPvm7wCtSGDfflWuy6enmhzaii+i5/lu/
         Cm9FThCdnycq1Lywj25DJwVGHdcYMfrGcQ2moxPQtMCpYW2Te8yypMBkRO2MajmRhOUf
         o0EoJ+3NzxtEUtMcbOR6r0d6nXYBZzP6m+D/JtEP51snPHQBKO79zxWLGL4PmZa/+VlL
         rQ3XfloIexutWBP62JItUxeTJvP2KfeL4VaWGNxRsrqzbF6N/lYO7b0t9+Wci80m/CJI
         jE7cIQ3v/g6qGMPwGjJAXBEkuN9Xdqkz2bFUkmdP5BJCeFPv5asjMsq/PPvdeft8I8Tv
         Gg/g==
X-Gm-Message-State: AOAM531iYu4GtrQdBd+n4O/M3S01MJHqy/lDpX3bWH21yj4CoJgo5WGE
        GZVYXYlkOA5GIaZXRLYONeB7zo20bW1v0pvH9W2Jc9edxMHTNdxGIQlYueHRC1geo2YmdnyBawa
        2DPB6HQdVzxWACpP1/E+4Xw==
X-Received: by 2002:a0c:8ec7:: with SMTP id y7mr3256313qvb.9.1615387555276;
        Wed, 10 Mar 2021 06:45:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlNoVM9BzWQNjpadCXVlfERPTQuROOGObYqvdAhHPCzlyHzhNVdnm6DSobOhCibwSlI7/4+g==
X-Received: by 2002:a0c:8ec7:: with SMTP id y7mr3256274qvb.9.1615387555052;
        Wed, 10 Mar 2021 06:45:55 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id d2sm12859520qkk.42.2021.03.10.06.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 06:45:54 -0800 (PST)
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to
 ARCH_SOCFPGA64
To:     Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Moritz Fischer <mdf@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-fpga@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
From:   Tom Rix <trix@redhat.com>
Message-ID: <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
Date:   Wed, 10 Mar 2021 06:45:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310094527.GA701493@dell>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org


On 3/10/21 1:45 AM, Lee Jones wrote:
> On Wed, 10 Mar 2021, Krzysztof Kozlowski wrote:
>
>> Prepare for merging Stratix 10, Agilex and N5X into one arm64
>> architecture by first renaming the ARCH_STRATIX10 into ARCH_SOCFPGA64.
>>
>> The existing ARCH_SOCFPGA (in ARMv7) Kconfig symbol cannot be used
>> because altera_edac driver builds differently between them (with
>> ifdefs).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  arch/arm64/Kconfig.platforms                |  7 ++++---
>>  arch/arm64/boot/dts/altera/Makefile         |  2 +-
>>  arch/arm64/configs/defconfig                |  2 +-
>>  drivers/clk/Makefile                        |  2 +-
>>  drivers/clk/socfpga/Kconfig                 |  4 ++--
>>  drivers/edac/Kconfig                        |  2 +-
>>  drivers/edac/altera_edac.c                  | 10 +++++-----
>>  drivers/firmware/Kconfig                    |  2 +-
>>  drivers/fpga/Kconfig                        |  2 +-
>>  drivers/mfd/Kconfig                         |  2 +-
> If it's okay with everyone else, it'll be okay with me:
>
> Acked-by: Lee Jones <lee.jones@linaro.org>

I think the name is too broad, from the description in the config

+	bool "Intel's SoCFPGA ARMv8 Families"

A better name would be ARCH_INTEL_SOCFPGA64

So other vendors like Xilinx could do their own thing.

Tom

>
>>  drivers/net/ethernet/stmicro/stmmac/Kconfig |  4 ++--
>>  drivers/reset/Kconfig                       |  2 +-
>>  12 files changed, 21 insertions(+), 20 deletions(-)

