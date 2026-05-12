Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FAD3B8BCC
	for <linux-edac@vger.kernel.org>; Tue, 12 May 2026 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585332; cv=none; b=GetXDTQGMM9STzNGrY+go3g+hWHhro5uD3qH0lziEZG83/SDmHyF0g7lTUyc4z2XPx7uR73dUg+XJSqPkzEntBkcqO1XxPIL/0UC94+sAW3m7Ey4DYNanORiVEM3DeUDXYjTwKf8FA6EgjEy9mxpLBzPI7awGz8zA4bbFfcA2a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585332; c=relaxed/simple;
	bh=L+4cMMv5ZsgrYT9SZWw9YF1uSZAITcwm777swf+z40c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RMluMnxjoBySz7hYK+g6Gw/STDzU58NIic8ZMs0b3qIfd+w474XhKtDYurUnU3qPeGMhpQxIXZghorUDRvk9wETlepyZYfy7dIFXcJPm1+TLICpqDnyfVeBjVgSlIdLkQEhtnjp8HprOp9dUY8qrahRQ/SQihNJTyQ4B8eGSV+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZtFxzDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UL9RH9XW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZtFxzDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UL9RH9XW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB6JmQ2202230
	for <linux-edac@vger.kernel.org>; Tue, 12 May 2026 11:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=; b=BZtFxzDjHiMJjqEf
	avHqHCdu26W+iIarGuad11yGm4CzCkY8xAGZU3LZCnm/Qpvck7sjEbXsC+QXmdW9
	De43p5fr3LghZIbY0+6NdERvy0FOq7fk9bHUTu/eLm1aFkPkXxfv6JlM8aSOGXFb
	xcaW1gUPdnqDq9nWaKG6xnsP16gBu3Ns55eDpL6KAlqlPOjLDUsXUI7TD02t2hCK
	VCqazRR/MuJvH6+o7DG38ishsOG2flCqjZdUzHrRh5yjDMfgvTfKOWkthgpyGRkC
	mvcC35YSIFcj8qPgFXkWHgx/t6R8srmQMRU8SXeSsoYygQu2bVBUyTcHcj8Tjo6U
	LIV+0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyjy8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 12 May 2026 11:28:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d076d88so11142171cf.1
        for <linux-edac@vger.kernel.org>; Tue, 12 May 2026 04:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778585329; x=1779190129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=;
        b=UL9RH9XW/SeLG12+CjbWOr6ekUKWRCvfuwtl2UjMo2k51s8rvAW8/4/SpTN5X+vcPr
         v/fnv+xQ0IVGWmjUVYr41qwvYfnWiXfU5bJ0ZXLpJVEZLusoNbmO9VXrmk3nLFIqTsqw
         hYuQfPrCNr3pxjgxAxOn+kD5gaCGp/rETYWzemqlXPTBV9LN9IfkEoogVhfNPSFcoabg
         cv+olbgTQDttPbQNixhE70juRdBtFTEEm+bcw7+aJmyDFSAzsXbPlqX25fCZWTIl6dUe
         nvWS9Atjqlr5dr/L9Gh938oOKmwvR000CXZgCf/PK9Mal2ylY83DIJ6AB8jgOqk6/Rcc
         xPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778585329; x=1779190129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=;
        b=B6vdKEXRZlATBp3binvVxOUBKxjEwMZf8Ke+zyPMhJnAm2lmTMktMm2RMFAFcMhj2s
         NRExAc+0KPue9GQ3VOw+Z8rInl1twWXAHxEcNkKNJ4itkG16bm7UDPsvqnR/JM4LJycq
         /E+ow/rYWmtYsa9Xu9paoLaCbwH45GBX0MIi6pqxrKML3TakLzaQatrv02YHp2rEdgm+
         XbZp+qHqrRNU7cGUDpvkxPAmHRSR98N/agqwRe0E6mP9cySU8RF+hGVIvyRcivfYt+sT
         yJCOsxsr0XhnsdQ2tGqtxwY4m23Y4Ghv57CzfI+vK2+vB/6tcqZdsyOD2UnzQsyHVanh
         MIVA==
X-Forwarded-Encrypted: i=1; AFNElJ9O4D6Wo19j6JgyLNVTCmWZyqi7S6xGBcX4ue15TYprgf7wbprAYbGi/KhqCwS1sUSButCF7fzkNl2A@vger.kernel.org
X-Gm-Message-State: AOJu0YzZIv6c7kRviMsURY0e76xZBlcPAwDiDCO4YNBqHFUtvcAUD0Ri
	5yVi3F/NacWsC6ED4L+wXunXaQoHUw+4/hAKiGCc+6BHL2I6JWKcOWEytYV1xhtdvnyu1Zoge04
	5X9DJE63S3YNTVyfO4A3Huf8QMbR+CA18MNY6Pe1ycq8kuQrHcTmnY4i9zDWefyuz
X-Gm-Gg: Acq92OHe645g3qT5OEIeiDrrL6ClnUcvxA6FrtZFhQ8KcuUA0JfTr+NVyhhyxfyNFem
	5XdT6jpyPZ+0yNYbxCbPhDRv9SA31NwzhuHP1N1ZN+8+hzLcufQtxmTUYuzDTtbZ5Lm3TaIe2ux
	BVEDqhXxh9V2ORDiPjc/1uCEytxl5dRg77uWcAf68OydoES5ER46abUzZ0+MuSLJ2vX6O8hwv8E
	kOg29arhIfkptZvV+DgB8rcIc1BftKgT+5QKZcWXH9PpfZXshlNNC3quemrXMujgPV3yx6qj467
	/3h0TQ3XvxuEgY9Z237OA0wgWF/0t5hG7rdbAWpedM0x+wIrKECqPlT3PGuq50P59KQZUwlqWjo
	SDrG83kAC7SODH6FttnWNqJRxWpiTmeVPxtI/6eFsUmv/yZ8xGD6fWpGTQLg5Za6ZlZh7GJEphI
	LLIs4=
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr274543521cf.0.1778585329572;
        Tue, 12 May 2026 04:28:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr274543201cf.0.1778585329135;
        Tue, 12 May 2026 04:28:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3bb2asm4776531a12.6.2026.05.12.04.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:28:47 -0700 (PDT)
Message-ID: <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:28:44 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: monaco: add AEST error nodes
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDExOCBTYWx0ZWRfXzi5ZsVSIp1ea
 aSrGMZimcs+k5KPghuYJH3bjIyv5x36zouYFCA7V/pQthtTcd9m0P7YbamamYJH8BVzhXBGnoCf
 /M4zwEMEkH3VVmoPNNN8ZBY3Ktg++7TjERM57nFpQe4ijdXQpdyc0GfnlaEWoqh8Ws6DYsZAKQe
 6cW3ApHCMQ42Xj2/JvbfjnFYD3gQaAtcRKfxtxmsTowMFL1thykB8uUbpNz3jsSoGHccQp1Rf82
 9fvP5490EzFcTW9p9VOnulmFTQ9lj/BjxlQdMRnT73r+BJWf3eNxikMOj+9dkmPsWQVFPlaLxaX
 wXbuX5cR6YArKIFsQ9AeHkRHjZmd96ucV9D+ZgLk9RDZ1KyAL4fTTVrQBoMOlrZAOC4duYRpxQS
 Ds4yy4APerb6P+8cEYteI0gQX7sB8WVw6s9pL3c618/L+e+7MWmt9nZvZ0ahpiSZl7ZyUvpr8cr
 LRGLXPTdiikeBplapFQ==
X-Proofpoint-GUID: ygDOCmBJDGIimFOI1t3iYnbVBblyF-fT
X-Proofpoint-ORIG-GUID: ygDOCmBJDGIimFOI1t3iYnbVBblyF-fT
X-Authority-Analysis: v=2.4 cv=Y5XIdBeN c=1 sm=1 tr=0 ts=6a030ef2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LELUAEsiHl5uogXv60kA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120118

On 5/5/26 2:23 PM, Umang Chheda wrote:
> Add AEST RAS error source nodes for the Monaco SoC.
> 
> The DT describes a processor error source covering all CPU cores and a
> shared L3 cache error source for the cluster. These nodes model the
> hardware error reporting blocks and associated interrupts as required
> by the Arm AEST specification.
> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 7b1d57460f1e..8e43ceed7d84 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/arm/aest.h>
>  #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> @@ -29,6 +30,46 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aest {
> +		compatible = "arm,aest";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;

These 3 properties aren't necessary if none of the subnodes have a
'reg' property

Konrad
