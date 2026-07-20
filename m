Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675E63CF680
	for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536015; cv=none; b=eB4Ihto9ReP72QtR4joDIHd42MYTiPbJurgtDFobE/FFZbwGKV29JNzm8mrKBdq1x+3jcdeW+Mjd4odRj9xzlHBpwGe+eww01G7oHSi0/cQGAL2MoviqHnSzktopHL6Gf6chYW2ZiHHtB3uX824AZc5etWGZNCzF8lrapYbcogw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536015; c=relaxed/simple;
	bh=8eypG5MHylE2ZO061/ncPJSrHHenF8L8urfnW57rV1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=haMtAFtS6IV83zPM6mI0lxa6NLkeGsCugZVs4ZxkkrtKLk7dhEr0khrkz0VG6kFlOwcdTQ7CkrGg1jYvRDJqVLlwEjlqXZt0KPRvG6GRPlzvbD+qxqqUC61Zmmro0lblnARduVVredyyBU/387UiPpUFbvLi28mJWNXUAEmwzfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAGBBbyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpm+CmdD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAGBBbyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpm+CmdD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K87Prl2000616
	for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 08:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvO1aPOrH9qcru1lsSePrBwTtIjIpNV09myyzyzygPE=; b=pAGBBbywxeysVlas
	GFmdusuG73KvhYxviYX8Z5wyW6s9hRSYaAmg9LiOf92Ov0OqqdsO02WGw3PchPpU
	TpY6T3XzFewSZlvxAq8PpKvp577u9Ncu6+b4d0zwE91w+3xgWe/hLeER0EOe9CnY
	OWQnaVVxKq+gKf+QFdHztSTmDZJ+P6ROMcWpMrc1KBTKB5Y5WO0WqhXn6pv997rb
	F1pZ07DCIV5Is/khy8VVDAtToYrdtD2/wZlH0CkrXBV96UeLhaoYGM8fyPBGIa7/
	gMj4/lKJYwsUXbtGRJvPmPhOVgTrDl8LTYCMqrntb4u3Mzhf4zygTVHdVuczbSAi
	dBbZfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxg2n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 08:26:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37f5ea6097cso1412126a91.3
        for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 01:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784536013; x=1785140813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvO1aPOrH9qcru1lsSePrBwTtIjIpNV09myyzyzygPE=;
        b=hpm+CmdDaPhMd2oR3TMaWj9pxn5bTarfxcQ2q1WPZSuBnRjxPQQA6WwYygPEVEn/mM
         khIwIQVJSggSwWy41sc558Hg06leovZIO7EkTJJ8X6JgSvYV0UhTxG8AdAGYMS19H3CE
         BGZ2k0HxeqYrJRO1AzgBW2K8/p37Jgzxres9h21vBWr0ylOIM/hcQO49jp4Jq0+15NUm
         iWrAflJSJWJKV/2qHlEC5OellSj2SNY6oj75dem27kq3A6Tqf8+z6zlEumnJaSVZBYbj
         gQtFEfi0Obmz/CN5XX11d+KS8YSIRRC28DSwpfHEOonQaZUUSsoPSNjuXerj2E+lrDjP
         +PlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536013; x=1785140813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvO1aPOrH9qcru1lsSePrBwTtIjIpNV09myyzyzygPE=;
        b=E2OsaTGb0frcuIvT1K7JB6N4WJO0H7/76B0xiu38fWN8bEIRI5YwXmCDhsjtG/8vW3
         hC6Ga0ZJ+QP7ol+e0hw5iDjZbFO3KrpnJ3yrN7qjoUsWaHBBfM0sNHJTNF+5PLzwLfYs
         ci7t4mBB/kbT7BhL4Rr/fT2F1pCrU6SQnfUG+lGpGjPMUTwmq4EfTogFgR/ArsJV8Xhb
         rGpvPMfu+/tvQKwxVfNtGwZ7FYy1R89mkasDAJFP8AfSpSBJ4JU5KdlXr2FxWSILLmf1
         4PM7IchzDmsPjq51uASiaZFC955OUj8E6I2H3uKU1nh3UsL+50hRqWQOdWqfrplbDn0t
         khNg==
X-Forwarded-Encrypted: i=1; AHgh+RpcqEXJ25abMENBoeNeJ/rmHmV0kUmUYEfW5ghpYWM5fnCIEPvi16deYlwoKwVUnR/uTTwXV9nYFnD6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2qhG9X8qBo1pkkr+N6+bbgj7d5t5zEg5FT92vL0DQpX+L6B5X
	08Il7Wmjr2OnCERrfqy7FOP03J4dVDuNR2BK0I3rEJD/dohDDH9da7olJB4967Idx+Ic2XVDVik
	2pNZQvQrEJNxzE4BpZGMHCJtKrPjFEcyZO6QHMWMzc5TzwkVu9MSF2Acpj8YSxxRw
X-Gm-Gg: AfdE7cmkG/ZCngxbLD7DXfyqjPIo3H3fOXVwHX9BiqCZ1S+scQwdlOOrJBV3aPZ9piz
	FEgi0VNIx9nxYbsIWoVbFUMJ0guSn9g4RV/1okYkQKeCWgCAWdI+PJbJbMhw8Zd0Ed/AjMXFSVP
	znkxeDDxs3rccfHwtRxpfF15G6iTcUxZaRiTwxT3Larnzp7SKwpSa0iOE+/UNgM7XUaDHqQYOpX
	FXNzLIRStno1ERrwvs7ow6VuWr0MBmyyTARlDt9huj+4A4qFlBLlJQhnH6pq6QYeoO139y1PtP1
	Wa1TZFWrbhIsf80/kulVgJNdbjs355aLEvZzzfpHBQ6qonhLKPRCuTClrFfmj7OuUHhquErYg0w
	TKltw5w/2gpKllM7iFeGbY49Ecxt64Q==
X-Received: by 2002:a17:90b:a48:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38e6a7cacfbmr3818792a91.3.1784536012797;
        Mon, 20 Jul 2026 01:26:52 -0700 (PDT)
X-Received: by 2002:a17:90b:a48:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38e6a7cacfbmr3818774a91.3.1784536012350;
        Mon, 20 Jul 2026 01:26:52 -0700 (PDT)
Received: from [10.92.208.175] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b0e9c5fsm5437015a91.10.2026.07.20.01.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:26:51 -0700 (PDT)
Message-ID: <89f07e36-ac7e-4895-8d2f-5c509c6eabdb@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 13:56:44 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/16] Support Armv8 RAS Extensions for Kernel-first
 error handling
To: Catalin Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>
Cc: Ruidong Tian <tianruidong@linux.alibaba.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org, zhuo.song@linux.alibaba.com,
        oliver.yang@linux.alibaba.com, James Morse <james.morse@arm.com>,
        Rob Herring <robh@kernel.org>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
 <20260708024131.GCak242z-9YE2xL6q0@fat_crate.local>
 <ak6HPmosSUleJFYU@arm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <ak6HPmosSUleJFYU@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5ddbcd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jnGYlY96OlQ6c1eOmxQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX1sZ2jG/ZbLsW
 GwkeI9ORGlSSazuJqDevPhBZYo1c5OzTa1F7Tps6SAtLuGMKpjGDodKM+2YMRi5tM2BuCjOxjXY
 lOGnXnRKQPTzS7p2PYYLOVP0qvZgEg0=
X-Proofpoint-GUID: JwjVS4LPYqbk1pb1TZh1X8vXxVBx9xb9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX5OsgqkdmSXaI
 8Udvh6ezxXBIHmjeX3ZgcuZjt0nJn11u8Svig2SAHm+Lkpccka0HDKdOXhKuMMsqeKbTxVocl/b
 8gcTPophgNlCHXCVAYPiEZ0I+wMrS7Q1geeeVD66H3kw9lN5xyVdBCUQqHkCziokWRKL/mMq8TO
 x9/jD6i88CrG8SWdubEajsUJF9cU8YqpsPLql917IL1K5lK8l2fz8u99eBUMIfESXTe3/S+os6J
 24VgKFoP+IYE03I08of2rCaZdZ1oRgL3iKF7tx3xEDANdGZiLtVyb/gSw4O4fgV/Xk7k4Wka3WU
 86ZQMkAj0tKEHszHfsjOM7qAnw/mp5Q1nSRm+mX4hg+XCAbx31wra776Xp5ICNB9tyzyQQbPoW5
 cuKl/7/LnNGJt3Ki7qumLOTaQ6IYE/ggTm44yCJkKB+Io3Vs5ZsvijCJI1QPdPX76iEayMLAEcV
 luna/V6fC+4TEPEfYDQ==
X-Proofpoint-ORIG-GUID: JwjVS4LPYqbk1pb1TZh1X8vXxVBx9xb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200093

Hello All/Catalin,

On 7/8/2026 10:52 PM, Catalin Marinas wrote:
> On Tue, Jul 07, 2026 at 07:41:31PM -0700, Borislav Petkov wrote:
>> On Tue, Jun 02, 2026 at 03:15:23PM +0800, Ruidong Tian wrote:
>>>  Documentation/ABI/testing/debugfs-arm64-ras |   87 ++
>>>  MAINTAINERS                                 |   11 +
>>>  arch/arm64/include/asm/ras.h                |   99 ++
>>>  drivers/acpi/arm64/Kconfig                  |   10 +
>>>  drivers/acpi/arm64/Makefile                 |    1 +
>>>  drivers/acpi/arm64/aest.c                   |  423 ++++++++
>>>  drivers/ras/Kconfig                         |    1 +
>>>  drivers/ras/Makefile                        |    1 +
>>>  drivers/ras/arm64/Kconfig                   |   16 +
>>>  drivers/ras/arm64/Makefile                  |    9 +
>>>  drivers/ras/arm64/ras-cmn.c                 |  479 +++++++++
>>>  drivers/ras/arm64/ras-core.c                | 1026 +++++++++++++++++++
>>>  drivers/ras/arm64/ras-inject.c              |  130 +++
>>>  drivers/ras/arm64/ras-storm.c               |  198 ++++
>>>  drivers/ras/arm64/ras-sysfs.c               |  319 ++++++
>>>  drivers/ras/arm64/ras.h                     |  374 +++++++
>>>  drivers/ras/debugfs.c                       |    3 +-
>>>  drivers/ras/ras.c                           |    3 +
>>>  include/linux/acpi_aest.h                   |   36 +
>>>  include/linux/cpuhotplug.h                  |    1 +
>>>  include/linux/ras.h                         |   10 +
>>>  include/ras/ras_event.h                     |   79 ++
>>>  22 files changed, 3315 insertions(+), 1 deletion(-)
>>>  create mode 100644 Documentation/ABI/testing/debugfs-arm64-ras
>>>  create mode 100644 arch/arm64/include/asm/ras.h
>>>  create mode 100644 drivers/acpi/arm64/aest.c
>>>  create mode 100644 drivers/ras/arm64/Kconfig
>>>  create mode 100644 drivers/ras/arm64/Makefile
>>>  create mode 100644 drivers/ras/arm64/ras-cmn.c
>>>  create mode 100644 drivers/ras/arm64/ras-core.c
>>>  create mode 100644 drivers/ras/arm64/ras-inject.c
>>>  create mode 100644 drivers/ras/arm64/ras-storm.c
>>>  create mode 100644 drivers/ras/arm64/ras-sysfs.c
> [...]
>> But that's still not that important - what is even more important is who from
>> ARM is going to review and maintain this? I can take a look at the generic
>> bits so that the RAS stuff coexists fine in drivers/ras/ but I'd need an ARM
>> person to take care of this.
>>
>> There are enough on Cc so let's see if anyone moves.
> 
> I will volunteer James Morse (he doesn't know yet) as the Arm RAS
> expert. He's away this week, hopefully can have a look when he gets
> back. For the ACPI bits, we have Lorenzo, Hanjun, Sudeep who should be
> able to review.
> 
> Adding Rob Herring as well who's been giving some feedback on the DT
> counterpart:
> 
> https://lore.kernel.org/all/20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com/
> 
> I have some vague recollection James wanting to start with something
> simpler like EDAC and do DT first but I may be wrong or things could
> have changed since. So, let's wait for James to comment.
> 

JYFI, I have v2 [1] of DT front-end support for ARM RAS.
https://lore.kernel.org/lkml/20260720081954.1858180-1-umang.chheda@oss.qualcomm.com/

Thanks,
Umang

