Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F3837D11A
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482443; cv=none; b=mY664Kdynj4LoRqVT+KK4WqoC1F9dxN7LNVeSBxz+XZ41tN7E2V2/4x1itUUPlM3iv5O0ua43q+mkQMdZbTUsziIePdYjmyeG0Tr8nbyK5IcaKPGx6MjVZQlvoOTMQhVvFi/XGeY31BID+1UZqfnzbLJnCbCCKYAOxGjnTBWPWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482443; c=relaxed/simple;
	bh=WaJnq4vJPJN0OK3iw6juyyLuxpGKER8KzYNWQqTNCUQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UgNWKseLuWbu+JodqXkz2Il8q1ssqDWcuyVWFH70PPeR1X6J1IJaWSGFYQVO5StYnSx8lnk34DwQjR1hxaTAZ2FN+H/971djKnQy8Al1560KUN54C8SfNDQmpIo8wH2kKnZVFIQhxRrXgLOGQfIfI2QDvxEsbtYO2LQ7al1cqSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AS0wMddM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxU9W/Qr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AS0wMddM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxU9W/Qr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RJXS3077826
	for <linux-edac@vger.kernel.org>; Wed, 3 Jun 2026 10:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ke6hFaye3GUWTYMdDv1mH0rJhnS2IhQe2jTb8z6TWDU=; b=AS0wMddMbp1fh/so
	LCIczNK/D0EgtaowsN9foXMEEKOaP+ydRDWE+hyr9/xJGowRNASIbON7wol+YolX
	w+ZV0MlQQdZcmb+g0chRUlOTwsdR/uQ3Q5w86GrjOHw7VoHBxAi8NOhioaWAp517
	VN+pq5VzwCIdTVtNvziq4m4HIBxXoF5zO/Ii2Z7/z9Df+hU6L425FABWtyQLG5lM
	THtDxm9XMG6QumSe8rWzPVjfxiCCie7lflQPtTBAE27WA4kAOKlj2sa4qAomd+qB
	CMTmXw1csnyc4Cu+mHgQIg2LkvxSLVpittDnhXAnX+JnVeM6pJ/yC1C1Dpq4tAJI
	ZWFgfQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbt0wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Wed, 03 Jun 2026 10:27:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f407223so872169b3a.3
        for <linux-edac@vger.kernel.org>; Wed, 03 Jun 2026 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780482440; x=1781087240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ke6hFaye3GUWTYMdDv1mH0rJhnS2IhQe2jTb8z6TWDU=;
        b=cxU9W/QrOGq0x74ri8BqVkKorIs6Ql2vOcuSNdtbtU7dWjRA+CueJ2ivm2CHJnHD5H
         O6DlQMapio8hS0S9fVvpPYQgk8pJKSIJbaxamkhJLscrHx7FM62On1TE2P3jbpZS7s3X
         pxh0wv3vBEhUMrVPszzRlwRUsh8vYCXvu7XxfaP7X3/k7PFqd3HTLvJTX1rcTaD+SIz1
         BwV0OKJMvHCEH+95+V+UKfQ/aQk/rC7hcsjBxsJ+KjDXdd82mQ4Gz2tdKY6uTC2Tv+wh
         iDr6BO+PCmcwxvRm3W5ntrMjDjpq5AorPPhhtXI4ThFxcT3obkGOwXNjkX88wbeJWxHf
         5VKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780482440; x=1781087240;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ke6hFaye3GUWTYMdDv1mH0rJhnS2IhQe2jTb8z6TWDU=;
        b=JC1K8BBXWUrO0XUW2dx8DIbRnxSvEl1IS5+w0P/T2RSPlylsPiYD+ZbwCCPgSW1IsC
         hs24WtJupZVzc2nKOwqXtBZPx864HV98nix4T8ivzmZiiHr7HT7Dcozl6HrY+RiHw2wB
         8QqX6zW7eIUKiPyx1NM/tU8F3xnSS9WVSUxkK9tuxf29DrMXvFIuPq9SqPVZlEZJPeL7
         9pjG2Wbycf2464JnYud5n8t0RWGIBNlnmCdgJhEnF+OWPj8Zw3SKzGwgOVFAcA0QLwlY
         eZP8776zRoolpx0TwnLjAk6C+Sp4vTfNMXu/sbLLkApHlCmrbIlgBa/WNn4PUCf1Ff1Z
         j8Zw==
X-Forwarded-Encrypted: i=1; AFNElJ+lbnT80JzjqoUq9Vfco+3kxkEk6gmAhBlY+BYcilTD+erZ/u8QTGWt1RDC6do6jCvWSx6MiRqkie7v@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7fQmHJhOozvrCjeP2fDX7dYqdSYm2OjGdBpG8UtHPAaVuALtD
	TdQXiU9ZqZ89vkgXf3Xg6KN6tTrCqW9AkXF/H6zWR9SoHQWv4hHNgWCfazzLMtuVBNsIH8C+et7
	xtRG3b05UShWRsot1bMlePxuiY82yTRUx5s7AqrPZC/s7h/W4xReOq03s/CF1GMSB
X-Gm-Gg: Acq92OFMv14yRLYDjfeW2wCXJseUdJnBqpf2WprsoxnsrEwxhpIDgQPOBT1Z1STgHeY
	mKSYyLSYN8Sjrgxq3ZSgQBRXWnTzt7kKgGCd4U8TRi/EeFDkhMCChwVWMLOIVo3S/97d7VUy6xk
	UVmD3MkbHkPER7S6UHkQET7ESmetvEfI69pMmVAW+Rkup/hPWl1/uShl9j8Eq6jwB/7UrQiYZBJ
	3uMnq087ukTHL8oh29jQ//cj0sxebjYd3a0Ox+7VIXmmKqU7p7fzCkNRlzcxSW5W1H2oyOjfiHF
	bD2kC5YBCgqj2Jh1IoifHwdp84sqTeLYT9+8MWnSp4Zn92a2W4qEd7pEJGCJzURFwPci+akatL9
	8xlG6HXhPZEMTvF0iyev8gqM7IDu7EpocO6N7uAz4Hzpyyzz1Pnk9G1/0c0NU
X-Received: by 2002:a05:6a00:3a27:b0:842:2d2c:2b58 with SMTP id d2e1a72fcca58-842838e011amr1625211b3a.5.1780482439588;
        Wed, 03 Jun 2026 03:27:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a27:b0:842:2d2c:2b58 with SMTP id d2e1a72fcca58-842838e011amr1625198b3a.5.1780482439078;
        Wed, 03 Jun 2026 03:27:19 -0700 (PDT)
Received: from [10.92.217.24] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428237430esm2428145b3a.21.2026.06.03.03.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 03:27:18 -0700 (PDT)
Message-ID: <fd5c9415-5275-4c0b-90ee-d81a5d5b660f@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 15:57:10 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: arm: ras: Introduce bindings for ARM
 AEST
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-5-d5d6ffacf0a5@oss.qualcomm.com>
 <20260513175823.GA1471517-robh@kernel.org>
 <48e298d0-f4cb-4afb-8ba1-a6b39f3285cb@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <48e298d0-f4cb-4afb-8ba1-a6b39f3285cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwMCBTYWx0ZWRfX6uA2OiH1bwU/
 uvgillmjq16vtvakIcT52M1ck0naTYqyUBbYm1gjjg95gCWdqjjCw/PIIUkjD4bRY6cON8EjF/y
 o6/20J2liMyOKMDfLS3n3l1vFFZh/0+I5761qzOKAgYIC7HcKwoH9/s0LoLEU36ovgVYbFgSC4x
 qZH6uDVDXJEQ/WrhFQTqWj5ix8QZ+yTZq3foEdMCMoG/E5W2TySByzgCHacHjrlLlrCF4C4dsxm
 OQ6PwC64i/LP0tljyocYkirVi57UT/vLiYRY3FqvrsHJs/PJVAYck4SqXXVcDXagpkqPw80uMs+
 oq1NHPlNRVwsUH7s/lCDQo9ogQI1xL8xq8+mGhzqzgJOi6RPywB5t+hfumg2cYp8jIGrSpF0zS8
 0DUL1ZxQx9MTC8r40OdI2uObi+bXzjKEI1ijhFc+irQQjNNB185oCLO/BxPwSJvAU9N7lc2m+1q
 ozISTD+7U9vsYW01QEA==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a200188 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=AMbOtgs2x-SaA9YGKiUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: bFWk2oI3E3zcwwC4PTIXsOwdNHNuCr9n
X-Proofpoint-GUID: bFWk2oI3E3zcwwC4PTIXsOwdNHNuCr9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030100

Hello Rob,

On 5/20/2026 11:43 PM, Umang Chheda wrote:
> Hello Rob,
> 
> Thanks for helping reviewing the code!
> 
> On 5/13/2026 11:28 PM, Rob Herring wrote:
>> On Tue, May 05, 2026 at 05:53:49PM +0530, Umang Chheda wrote:
>>> The Arm Error Source Table (AEST) specification describes how firmware
>>> exposes RAS error source topology to the operating system. On ACPI
>>> systems this information is provided via the AEST ACPI table.
>>>
>>> Introduce Device Tree bindings that provide an equivalent description
>>> of AEST error sources for DT-based platforms.
>>>
>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>> ---
>>>  .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++++++++++
>>>  include/dt-bindings/arm/aest.h                     |  43 +++
>>>  2 files changed, 449 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,aest.yaml b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>>> new file mode 100644
>>> index 000000000000..7809a0d38270
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>>> @@ -0,0 +1,406 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/arm,aest.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Arm Error Source Table (AEST)
>>> +
>>> +maintainers:
>>> +  - Umang Chheda <umang.chheda@oss.qualcomm.com>
>>> +
>>> +description:
>>> +  The Arm Error Source Table (AEST) describes RAS error sources and their
>>> +  register interfaces. Each error source exposes one or more error records
>>> +  through either system registers or a memory-mapped register window, and
>>> +  may signal errors via interrupts. The top-level node acts as a container
>>> +  for one or more child nodes, each describing a single AEST error source.
>>> +  Refer to the Arm AEST specification (DEN0085 / DDI 0587B) for details.
>>> +  Flag bit constants for use in DT source files are defined in
>>> +  <dt-bindings/arm/aest.h>.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: arm,aest
>>> +
>>> +  "#address-cells":
>>> +    const: 2
>>> +
>>> +  "#size-cells":
>>> +    const: 2
>>> +
>>> +  ranges: true
>>> +
>>> +required:
>>> +  - compatible
>>> +
>>> +additionalProperties: false
>>> +
>>> +patternProperties:
>>> +  "^aest-[a-z0-9-]+(@[0-9a-f]+)?$":
>>> +    type: object
>>> +    description:
>>> +      An AEST error source node describing one error source defined by
>>> +      the Arm AEST specification.
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        description:
>>> +          Identifies the type of AEST error source. Each value corresponds to
>>> +          a distinct error source class defined by the Arm AEST specification.
>>> +          arm,aest-proxy represents a proxy error source that forwards errors
>>> +          from another error source.
>>> +        enum:
>>> +          - arm,aest-processor
>>> +          - arm,aest-memory
>>> +          - arm,aest-smmu
>>> +          - arm,aest-gic
>>> +          - arm,aest-pcie
>>> +          - arm,aest-vendor
>>> +          - arm,aest-proxy
>>
>> This is a fundamental difference how DT and ACPI get structured. ACPI 
>> defines new table for some feature and puts everything in that table. 
>> For DT, these all belong in the node for the corresponding h/w. For 
>> example, if the GIC supports AEST, then that belongs in the GIC node.
> 
> Thanks for the feedback. To clarify your suggestion — should the AEST
> RAS properties be added directly as properties of the hardware node
> (e.g. arm,ras-num-records inside the cpu@0 node itself), or as a child
> node under the hardware node (e.g. a ras-error-source {} child under cpu@0)?

Can you please help with this query ?

> 
> 
>>
>>> +
>>> +      reg:
>>> +        description:
>>> +          Register ranges for the error source. Absence of reg implies
>>> +          system-register access (interface type 0). A single range implies
>>> +          memory-mapped access (interface type 1). Two ranges imply
>>> +          single-record memory-mapped access (interface type 2).
>>> +        minItems: 1
>>> +        maxItems: 4
>>> +
>>> +      reg-names:
>>> +        description:
>>> +          Names for the register ranges. The base error-record window is
>>> +          unnamed (or first entry). Optional named ranges provide access to
>>> +          the fault-injection, error-group, and interrupt-config register
>>> +          windows defined by the AEST specification.
>>> +        minItems: 1
>>> +        maxItems: 4
>>> +        items:
>>> +          enum:
>>> +            - fault-inject
>>> +            - err-group
>>> +            - irq-config
>>> +
>>> +      interrupts:
>>> +        description: Interrupts associated with the error source.
>>> +        minItems: 1
>>> +        maxItems: 2
>>> +
>>> +      interrupt-names:
>>> +        description: Names of the interrupts associated with the error source.
>>> +        minItems: 1
>>> +        maxItems: 2
>>> +        items:
>>> +          enum:
>>> +            - fhi
>>> +            - eri
>>> +
>>> +      arm,fhi-flags:
>>> +        description:
>>> +          Bitmask of flags for the fault-handling interrupt (FHI), as defined
>>> +          in the AEST node interrupt structure flags field. Constants are
>>> +          defined in <dt-bindings/arm/aest.h> - AEST_IRQ_MODE_LEVEL (0),
>>> +          AEST_IRQ_MODE_EDGE (1).
>>
>> DT already has a way to define interrupt flags. Why invent something 
>> new?
> 
> Ack, this flag is not needed for DT based systems, will remove this.
> 
>>
>> Rob
> 
> Thanks,
> Umang
> 
> 

Thanks,
Umang


