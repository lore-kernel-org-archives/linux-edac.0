Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B552B33CE80
	for <linux-edac@vger.kernel.org>; Wed, 20 May 2026 05:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779253473; cv=none; b=Ehj8TUTwOcNUY2+vI5HSb5a0Ok/ppMQ462dw91H3aY29MKyrCv31+6hBWp0G3Z1Vx9gOhsOP09ldBD+RrsUf+OGMHKWKDNYIiUvCVRqV8XRIwiWY+bF8Qd2RExgL23U5fZtz6du73QiL/qPW5VWLyz7TG58ajFr81V5WrLK5JOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779253473; c=relaxed/simple;
	bh=GBw4sTQ51qv3RHbSz6bJbjqhdBcQ63A9uBz66nhSXZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTbMyHPLhLxhR3d5ElN0t4SJDzQkxIl80NpCGRoZRBK9SvkizLJm8F1WwfCI779gWStv6oCgCZGdcjv84Y3+8C1YAXPyeDuFUwoLnaCgIUfHJF3y1lXLJhOCTY1LP7ow22PMEwnfpaKzVVUeQgnSNf9MSKuOeJjsaWDXFSF4s5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGxCSdId; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBT6J5w8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGxCSdId";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBT6J5w8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JMDbVp629788
	for <linux-edac@vger.kernel.org>; Wed, 20 May 2026 05:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=; b=AGxCSdIdhznPmytD
	r5V/e9lDrCuH3/0gRJtb8HQ1SX6d/D4TTxqd452zKW/4bVNVhKdIOtWoTy7rkUtz
	oaHp51iBf5NigPanwjK9HgCS1hdYtLEI9UqckFlx/NNqSrCGnFInTO6ibecveqO8
	by2G3adovXR4GpPtgBxlOAlBCIQNRTTOrWK0Kr1FrGr4Hr+cmXpnt1mDNd8jfAm5
	qThdm3DxJPNVxI8uZV/X+ZlYS64CfDduc/Cps0PSv3bvVO6u9PrbDFSLQbHgcsvV
	ei7VuDKkJjQP7E0DGy/2l/GoktWqN2/s+cHPdy68a/MxslOAhMj3ikC6biXtdyQQ
	sv3Q7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nu1nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Wed, 20 May 2026 05:04:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4606f6f44so9961665ad.1
        for <linux-edac@vger.kernel.org>; Tue, 19 May 2026 22:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779253470; x=1779858270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=;
        b=fBT6J5w8af8boljQ5ifhwwhAbnTAWqATRGdNUqLM8Y9FhLKSdleIFHBnFIB/FWD/Vo
         +go76bZLayzU4nR3N0md5WCf08Wdm0dYRISSGbcwkj52Kr/2yDvLoyNUdOcMdnepgMnk
         HLzNC+MGVRRnTt3DV2dJPYhYNFH8aZOjdGUsTEUMfporaS6LuCUGeCWi285UaeI5EpSk
         5ZRiD+bDmdwjFa+Ftmxt8H3t1glbX7geBQiQG60rpcughej9yjyHgKSyBwR9AV7vrnB9
         i5qqQkgCHt9KOlH6ooADj46+haK3OvYiKtQPiRiMrr+tIYjugBd33+mogn65miNAKipr
         REEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779253470; x=1779858270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=;
        b=BZD9pcOGbyQ1hoUE+Hl0W7613d7Uzxll9uizpWOVsVF52DtEkjJ88jLoDzZ9rB7m+8
         dOrBdPrHO6CNJLIp4joYlMZh1ChLvHncQLKUbPXSNnj0dFkcb9CazK7aV/dkMuKZSqj4
         rXVOqIcQviAAI433t0lvBp24A2NxxJA3wH5PbRfW+Qo5FL5Z0zUmqNO/IaDa4K1cqPZ9
         nEUdWrsB2mYCP9OCICBQM8Q9515rd2YbbCmeuPY1le/GiJIyf7/33fmpskbcJr5s3Pwt
         +uU4uh607kezbSLY1vpp2AM4sPJPtKjZ6mteUqenqK/cP8gtRT/YvBA6glOeHsMLCdPl
         pKHw==
X-Forwarded-Encrypted: i=1; AFNElJ+WOrj/wcOtFKSNBjxCrDzS/mzu3WPfVdGjlCiVyJ7WHLtMxpJVMQpSotH9vshBgRA9qeOirMbLIQHl@vger.kernel.org
X-Gm-Message-State: AOJu0YxOc6N/n3uCcWYyQsp5pvwZOOx2zyehFLvc/uUayztbl7b0DuKj
	EoZ841U+315zX39UF9pVycnYbKxufzKXX75PXe9epAlmrOQNwqLev+tWg3KZ2ZdgSoZcjaTiV7/
	IJGu7au/jACp5yZjHYl0PnKEEgG6Slz/Mwz3+YUxfbyuIJTIlPYcz1tgKJ7hbcvDW
X-Gm-Gg: Acq92OFhC3Rg0677xtRlxk/Wd+K2HBZ8h26U5PmEBWTW/1w5ufXUKelLfYTdsiGvfU0
	ApW+oVjxlbZqnghAjmR5MK7ca8poPdbEA5y6+8qUkQGLkeJZNgO0fU4ohSQ2kBcZA7yWXO2Jocg
	mNBCQ4F1TtW4LEvVmxKSbCUSf/el+iW5WDT9KwNFNFNnrFfOq2yXn/n31HMteip0D2ZyH/CY8Ee
	dTZ+tlR+ovxt4JtyJnp6ziPVoBGYKl+ZihltRLiPagb4fZROXeWLnmOSGOeh36EommcuOLAgl+h
	PzNfScE56/MdKAIF8mYVtPtnakfqqWluGWjVR4MMDfY1W+J8jD1jmUqgxMuC3vfG4hKPsTAt7CE
	PN2eP387kmZNITCxcKHGEzHZn1scjBipBQaFUebHxRP1XuewIGD1S0orKGjjRX8bZnzOF6W9NRX
	ybK8B0lw==
X-Received: by 2002:a17:903:3c6e:b0:2bc:cb8f:c286 with SMTP id d9443c01a7336-2bd7e8cfe0cmr139206285ad.7.1779253470279;
        Tue, 19 May 2026 22:04:30 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2bc:cb8f:c286 with SMTP id d9443c01a7336-2bd7e8cfe0cmr139206045ad.7.1779253469796;
        Tue, 19 May 2026 22:04:29 -0700 (PDT)
Received: from ?IPV6:2406:b400:b5:60e5:312a:8741:b738:744? ([2406:b400:b5:60e5:312a:8741:b738:744])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f287sm270216785ad.24.2026.05.19.22.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 22:04:29 -0700 (PDT)
Message-ID: <55470717-3e9e-4548-b12a-8e2a2e1f6c63@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:34:19 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: monaco: add AEST error nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA0NiBTYWx0ZWRfX1ve3wXlILjJF
 ziqQvaXJr9+HqvTa7/ELzEhABko0Hkw0knvZtp56IVeKDxedXV//n/ObGDunkx4uMCXQqKS60xP
 6Q5kbcG/G07FgHp9ay8/QqQ2IlN7lvRriSBeTTsXZPDjmnaxT4LEsJ9mcjclN7SlYgZ5fKMYujk
 VZ7hnUvsZ6LS8ay/wLWQX8k5Dbce7M6huTvP5qGw0bsub1486osBnpj27/tnZsfdXaYfjxSz0Ye
 omt9q/h/uMSOwBpyHDS4oYVWLIHLV+OySvRRJJSN4jUh4X//kD9n/NPk0PmaxKHZyj1FduyJjbs
 h1eZWSRtlHLmCd/9GCJWdwDh9CRsokMYUkW5+Tp2CXfgHoVgpCNsU+tDkLoHjC5p0O4e59QJthD
 tpchrUq9E714YoZ8f/89mr2VXseWhnA+D5dMfn4paLJpeoRlEX0hLKtj1oUxx3GeRzzpDuoWc/F
 jtWQunB/+3qhh031nzQ==
X-Proofpoint-GUID: 21bgRZT_9mDk7Qfl-XSx1DXvE7NWNfo0
X-Proofpoint-ORIG-GUID: 21bgRZT_9mDk7Qfl-XSx1DXvE7NWNfo0
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0d40df cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8C-fUGBXRnHmYMWNGq8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200046



On 5/12/2026 4:58 PM, Konrad Dybcio wrote:
> On 5/5/26 2:23 PM, Umang Chheda wrote:
>> Add AEST RAS error source nodes for the Monaco SoC.
>>
>> The DT describes a processor error source covering all CPU cores and a
>> shared L3 cache error source for the cluster. These nodes model the
>> hardware error reporting blocks and associated interrupts as required
>> by the Arm AEST specification.
>>
>> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 7b1d57460f1e..8e43ceed7d84 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -3,6 +3,7 @@
>>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>> +#include <dt-bindings/arm/aest.h>
>>  #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>> @@ -29,6 +30,46 @@ / {
>>  	#address-cells = <2>;
>>  	#size-cells = <2>;
>>  
>> +	aest {
>> +		compatible = "arm,aest";
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
> 
> These 3 properties aren't necessary if none of the subnodes have a
> 'reg' property
Ack

> 
> Konrad

Thanks,
Umang
