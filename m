Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E2645C6F7
	for <linux-edac@vger.kernel.org>; Fri, 14 Aug 2026 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786705567; cv=none; b=Qh7QlGcNS6DAdjoL/rj8iAJPM2rByyavuaodrokI7HS5L/mmfLv7ABnHhJyobiCY/39N35rzB9piT/hFLnEZ+N5dh5TZUPErlNfSEWg2Yp0sWyY9jri2uvyy3frgctxj1mK12/msmAfTxPVr9ZEZOqDXfTtSPA5lmieNWYEFWFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786705567; c=relaxed/simple;
	bh=lQiwtEw+WmNvc0x52h0zqnqLcKUxwahwqFQPQSJ3WaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6GRyzYJ+FzkfMtQr7YprxnE46eOsLrCrNP3ZHIbuU4i9NSEDhIggQybMuryFqZjDWpTAjfYgPdsaEMRiyaspN8v0EiOKejaU/A8ShfDVUtLO8fAxSkE+qciBRe+SOoYcO0Y4IONzBjqRETv9G0ervK2ZEBIO3VZYqCKsOfZ0JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILqFP6yl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQ1kZRRO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILqFP6yl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQ1kZRRO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAb83M2555632
	for <linux-edac@vger.kernel.org>; Fri, 14 Aug 2026 11:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ia1fHRv7KxysZi8styKWTgvHgU/DCGpe4M+1Zoj2WWY=; b=ILqFP6ylJr7VzIbT
	tSkA0buIgwtlKF/80Goe/TbopBfSp7EOXM0DN8fyuE6oc6h0CwK2LXW3yU6u/zAZ
	AKm6YTQfVvqJbENLGKQa7Acay2XZUPKi2/Qs4fUPAzIIMCYRzdE49iM58MU1Yg6Q
	XsdXoBImxWT+K4Dy9aJA4Ca4BCqsfAfhkSgQVb0UIEPKBF+F+mrKg7q1+mgXQSGe
	4Gq9O9zQem4A61tneWNlHEl3m/HaoclHBqrF8iq+E95EeKMryv1Fc08LPUqqHIS5
	r4oDRTbJbhJHn5pj2HQpNX1K/s6yp1SfrJGzOb8XTK5Do5H5Gp8NVn+cuYVnGr9o
	9exrng==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20sj08s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Fri, 14 Aug 2026 11:05:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbeaf07a7f1so118550a12.3
        for <linux-edac@vger.kernel.org>; Fri, 14 Aug 2026 04:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786705552; x=1787310352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia1fHRv7KxysZi8styKWTgvHgU/DCGpe4M+1Zoj2WWY=;
        b=kQ1kZRRO2WidMMglEp4Z3WB4EID6XcUlsk8AG7ib1N5akZlgx7qE+XA23s3USvwOmd
         PvXDqAjZaZe6a4ACKvOCyo+7u+fXibDKTWCwIl6NoSVvSclo7XEwoxWmRIloqU9ZCiD8
         Ofl0bz88RKYRc0AxzHLx+3/zDAwxs74eS28YJy358K2kdBvum3gDUyYEdd6RK5Gr9hx8
         JocbNhaP+Bo8TxHFx/GVGv+DaTWzoGh/qtt/07spGA3XCfST8w39ejJOSCfSO4cSS1N2
         x0owCuao8fAh6IQrn/f4Zjur6igxfvAAvAXwwJ3o8ZGw5ZNUqnFBRFxBXYIJsToBIqQ5
         BzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786705552; x=1787310352;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ia1fHRv7KxysZi8styKWTgvHgU/DCGpe4M+1Zoj2WWY=;
        b=mYjQK7n9TyedRADSXQUpicvUEMCJ9RGZMc8WYgQC0/k1/IFqeJEizg5md74rPzn4RB
         bQNxZGjVl9tXs8wsM275Y4y1u1pSKAT/1T255UewH785vuoRtDqxyT84zXDE2d4kHMjP
         KnHPXT48Maz8sUkiEDSQySdjuDwebNj6VCG3w5f66K2FifO6IL4RBrhxs+53+uoiq0FT
         NhAEKDZQw9GWEbxLLpA6bgqSNEeGWwCGG8WfjUE9SymK+hR0g5hEaU1g0O6JU8osH2xZ
         XbELtfjVoDodJPSKHLkVUN9BwaQSIo5rdxYiiRKbamwNhI0vw2Y4YvmnRY2n86RJqxOn
         tbyA==
X-Forwarded-Encrypted: i=1; AHgh+RqfIxyZZmwFYA+tVwgZL5+OGknFUVlGYDs8KKvsV0WZtKn5+k1qjEj4B5tLvj2GUjtRkTJkmHxWQbyr@vger.kernel.org
X-Gm-Message-State: AOJu0YxBT08qDrNeGrcPbF470yr147PiBDz/4d8Drx6pvoFdh90P9Yjf
	dd29Nqj9TGEC7tWE05gm9pXdOueHXN1gS03YIexjYkUEzHR6NfyuSFYmH+YrVCPKnhLYEyBfM+f
	c7BhyzL9dqmSvHUdmVyx0xorG1CceM712sqbi5PTs8Yx3NYwmntRYHHK1FYcdG62X
X-Gm-Gg: AR+sD10jKFjfzKcu83ABOhNlu8Ynfv3yhlnsHtWp/47dc077+V6hGn0YXwvMuX5Otux
	gf6HMHsoD6+sGnCJefvcpSXMjS9TEL5mGaOB9idOu+rIaVXAo70juqKnIo18jJ+3EhAt6GLMif5
	nFO5FV8YIyM6FaeJQdhR+Vct8YjTKrnY9p87U2M9uo/L4AYBE6YFDPdzleCyVlNr92jkrsgIMpv
	qHxWSFj1YtyKE37htaG/x7C9y3Vf4eshdR82fNBMqi8/4HzomJVjkHinM4PHerVhwINRp2sv8KQ
	RKe/TLbhY0QOkXJ0bS3v3Lc9NLohnWfEaLPSe0/12SqfP9tNg/ZU8S3jdUE9HPPbzWI7gu6pTOA
	s42x9q3V5JUWbvr4k5X3nODwpF/5zVg==
X-Received: by 2002:aa7:8681:0:b0:850:a86b:6ce1 with SMTP id d2e1a72fcca58-850a86b8ac4mr1694174b3a.0.1786705551317;
        Fri, 14 Aug 2026 04:05:51 -0700 (PDT)
X-Received: by 2002:aa7:8681:0:b0:850:a86b:6ce1 with SMTP id d2e1a72fcca58-850a86b8ac4mr1694141b3a.0.1786705550748;
        Fri, 14 Aug 2026 04:05:50 -0700 (PDT)
Received: from [10.92.210.190] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d01f300sm312585b3a.18.2026.08.14.04.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 04:05:50 -0700 (PDT)
Message-ID: <3d8101b2-558b-48e0-badd-a8e439c74dd0@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 16:35:43 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ras: Introduce bindings for ARM
 RAS error sources
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
 <f6443353-b3c5-4922-a98a-1292db381ca7@oss.qualcomm.com>
 <20260728-determined-lorikeet-from-tartarus-cf124e@quoll>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260728-determined-lorikeet-from-tartarus-cf124e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA4MyBTYWx0ZWRfX5jAceo+2sapA
 sxq1EZ/vYuR18DVtqhlbCOpN7sKvX0pnDIfZZG9Euf9W4rqVfy/rXIbzJLm3PgyAUp/rPw8qE1s
 JG6BYfgCE1qjMzA1A8/y9+hymuGQmjhJdm7SCDM1FCZGQEC8rRDe3wwaXICbqYVKyULCCbQ59ww
 CeMH/zvh6iBC/3TTLdyDsv9x3cL79f6iIqklX12+I8yzLDjEsH4CJh3MlDkWFs4zbVGZ+sCMzrS
 FrEs0UksF2BgDJaN70p+LX3M3/GcHt+J0bIOzKzly6s3VL6UWb1YoeE8HiEDxEwcuA/hNthMpse
 L1nVXMiO12dYll7fiVNX+lMxB2HrUnVJax/XS6eHQx1p+bImRYSxle5K6oaLSPDwm7X/cUpeBqs
 VZ5kdEQA2AYMsUwzIt4CF3mwRZJUg4j04yUYXo84naT2UneVHJiACs5sPsOQf6IqX6WxoC9jtm4
 5588jHMjcs201OwUBPw==
X-Proofpoint-GUID: KsvjWAOwCR7vpRqIYRKeCOxf4cOXQ0vz
X-Proofpoint-ORIG-GUID: KsvjWAOwCR7vpRqIYRKeCOxf4cOXQ0vz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA4MyBTYWx0ZWRfX72ALAh/hg61q
 Yu+EmUVHyhvQzLV+qLsLXaLNULGJHwvuY6L3a1fESsY0ByxLkgslGhpwIVAQZ4YAi5pHnAChEnV
 a4Nu72NeyeU6kE2uGfAHkN4FoEo3/BU=
X-Authority-Analysis: v=2.4 cv=cMTQdFeN c=1 sm=1 tr=0 ts=6a7ef690 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3LPT6PZN0yckniG3iNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140083

Hello Krzysztof, Trilok,

On 7/28/2026 2:17 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 01:51:08PM -0700, Trilok Soni wrote:
>> On 7/20/2026 1:19 AM, Umang Chheda wrote:
>>> new file mode 100644
>>> index 000000000000..c2f4e1f8243e
>>> --- /dev/null
>>> +++ b/include/dt-bindings/arm/arm-ras.h
>>> @@ -0,0 +1,11 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +
>>> +#ifndef _DT_BINDINGS_ARM_RAS_H
>>> +#define _DT_BINDINGS_ARM_RAS_H
>>> +
>>> +/* arm,group-format - error record group register window page size */
>>> +#define ARM_RAS_GROUP_4K		0	/* 4 KiB,  1 ERRGSR  */
>>> +#define ARM_RAS_GROUP_16K		1	/* 16 KiB, 4 ERRGSRs */
>>> +#define ARM_RAS_GROUP_64K		2	/* 64 KiB, 14 ERRGSRs */
>>
>> Do you want me to have different DT for 4k and 16k and 64k? This is not a right approach. 
>>
> 
> Is this page size or register window page size? If the latter, why would
> device registers be a binding?

Thanks for the review. To clarify both points:

On "page size" vs "register window page size":
The comment in arm-ras.h is misleading — I will fix it. It is neither a
memory page size nor a kernel page granularity. The 4K/16K/64K values
refer to the three fixed error record group register window layouts
defined by the ARM RAS architecture specification. The naming comes from
the ARM spec itself which uses these sizes to describe the three
possible layouts of the MMIO window. I will update the comment to make
this clear.

On "why would device registers be a binding":
This is a static hardware property — it describes which of the three
fixed register layouts the hardware block implements, and it is not
self-discoverable at runtime. There is no register within the window
that encodes the layout. The driver needs it upfront to:

- Determine the correct ioremap size
- Know how many ERRGSR registers to scan
- Know the array length for arm,record-impl and arm,status-reporting

I will also fix the misleading comment in arm-ras.h from "register
window page size" to "error record group register window layout" in v3.


> 
> Best regards,
> Krzysztof
> 

Thanks,
Umang
