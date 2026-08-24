Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877843EEAE1
	for <linux-edac@vger.kernel.org>; Mon, 24 Aug 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562683; cv=none; b=MvDunA4lagT9kXtYCityRYCjrj++y/z+8+Rc+ke0r5P756amyJoHpy8JDOF8OH6mGEVPxJuCSljoFrVNlh1pIgmEm89+/4YvUMIoTdkfpccSUSAXUFwfFA4GOXKcjt2xHbnO3XgN+XnQQIWi830PNTX4+H0ya78Uhnx21zZn1Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562683; c=relaxed/simple;
	bh=wiw7AGVlqu9Lcrp2CYxUG/Pe6/zjpMXeDjzPzSeUgQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9xzcvx9JGvS9XnMH4CGGkXgWT5DfxAhH0OYnS0gJT8cpete2fjyO/p2mRvlwnyaYEGs3BNfXzjigNWhQyLIplxRJmfc5asCcClre6QfQj8WhpHDfjxIKg7IzFzmFAn4KoRAYr51XIRFTwamjeUitWhLstSF4BSxJ+r4UNCELJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWBP/0UF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBruojDF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWBP/0UF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBruojDF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99M882083195
	for <linux-edac@vger.kernel.org>; Mon, 24 Aug 2026 09:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=; b=KWBP/0UFcRqBdNHL
	nSewzdviaQAaBr5RFnDQ2PcmlR4ok5ZoGj9eZQpYGTadeG060xdXtmn9U2v47sp+
	HE/AtOAFd/X7u3Xm7K9BZ/+aOIbMk/MaHtHv4rmNayPosdvKH8cDsvuSGY8jlyLf
	alfPcKeyIi+w1Iav2tZS7lEkgPW6wFH4guieqWGGSirsPH7hZOxdeJgu0r6sUK0/
	yJblmZWKscYwMtgcxxqgu7aiaSrEh43Yebf7pMqOX2VtBSUB3jZ3Ikr+h7b4yRmq
	4Ght9f9YNgE+VsVjv4xs3IA0h4V/bf6jt5LLqHIBYfw4HPlcdlNeZW0NtNBxYQdu
	5fbNPQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtgg3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Mon, 24 Aug 2026 09:11:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-382befb9555so793020a91.1
        for <linux-edac@vger.kernel.org>; Mon, 24 Aug 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562679; x=1788167479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=;
        b=cBruojDFm7X5FwVxFsGr7ml1zAtD5UKlFIfCmy+2r8P93C+w57dh20B2q94f0rB1dq
         8PX10O1/bdFkRh3btwrXgWYouhKmHEXGlsjI7W7+zcyBYMCQLGyw1OiamfkEFSEoaGMu
         KBSRqBt87N6kgEGOi9UaubZHwbhUqhQrrZoeTKlVXaFvk39vTL9/xLYRnl98BFWLXKbl
         BQfHjvvSkh1X8fF9BpHai29Kpc7UPr87YIxDOzEz98Br6+JXyNclF9r1EvKzGjAYsOvE
         uf210MGs78HbxjHe5ZypazhV4dbbMvrBYoYBLelrMq9UdloZU+k41BKi2Xd/Bx56RCrr
         bsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562679; x=1788167479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=;
        b=nTTaKHanB1jO7pIEtLQDOMkuNbKQN3FhutWGcPFptbVbLBW2aeH6LMzabcQdA1WCzw
         MoxADN1cCEPoTEoSUsZRHP4Mhfdu/ACfy+vGtnh7bxbkMX+7kjgXCKM/Ln3PpeCFIOaH
         zxAWbDai+40iqcABQF5jhcYxlaDEIth4YTSxiyMYEY2to/PkEvuqolPnN02k0Gew5QCt
         HP8tcN+fHbRptvUsnKoLbau4MDJCcbVGqacXinIxSpAnDFfbXivKZcHntWKJ9MHTkKU6
         JRvuvINMYafq/F9bKpPTwz2J5b/FpGTDTzs7hGo/AVCuwfC1KcbNaG3F7V0XcLaZhaGb
         txQA==
X-Forwarded-Encrypted: i=1; AHgh+RotWQ2HhC1G5ypujIZLhZnAG7W+W7VpJ4iNKF95EjadjMfgViMZODaaHEAuqvRrxfz7PW1qLWQ/TomJ@vger.kernel.org
X-Gm-Message-State: AFuF++mm71h6AMzxdlOJpPkPK4qXMBeHHT9hHQ1+MtajrwcKivJYQAVo
	PXAwyUMNGox/T4dyN/LMY+xnE3t1SICP2cRzUgfEDyDPUoLsWb12QlHASDkqLEbUGqHIC9zGg+R
	jEOCI8qgVGG81YPCFoWGkNz6FYo3g7x9Ld3sQgfLkIi80Bnbv9ib4ne2VgNkNqIr+
X-Gm-Gg: AR+sD12V/UDihBuFlU0C0GxJ9TIrN+3HdtpYeVVi0o7sDzJS6aDmOkqnE092iprLWwh
	WZnd/+sS6gk6O3Cyplt9qRELGNQo1CnMhL8GtZbftBdzChw9R0NOO7wRPD03TssRyL8gs8bigO/
	tcbtKKDyjb8mzVAmTkwUMudDXU1UOMMf+YZ4p87L54vhsFnsizR4ngBYsDr9ZC68jtX2lHI0tAK
	HqAaKD67LTt6IAG7A4kYHj2hkNBKZ38TtQTDTQ9FDUJ4DBwWuo3NB9z2xF4V/8S6Ngx8B2tskZb
	6y7WfRb94IWAvGpAgNxCpvyYR3x9KtDPDBJJuuThbLA1vEHGBDRQgUSL+MKDrEPXgX/FsiCDt+8
	FcopnKGdR8Q4CHufQZMk35f8q+Z9ooQ==
X-Received: by 2002:a17:90b:3b84:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-395c358b9bfmr18634965a91.2.1787562679006;
        Mon, 24 Aug 2026 02:11:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3b84:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-395c358b9bfmr18634920a91.2.1787562678524;
        Mon, 24 Aug 2026 02:11:18 -0700 (PDT)
Received: from [10.92.202.220] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4968618sm10951827a91.3.2026.08.24.02.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:11:18 -0700 (PDT)
Message-ID: <20e19a52-81d8-4751-99ae-c1297c2ca026@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:41:12 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: monaco: add RAS error source
 nodes
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-4-umang.chheda@oss.qualcomm.com>
 <am69fjQNTv2xJonT@baldur>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <am69fjQNTv2xJonT@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXyGm++P+k+pEj
 TJTXPN0z8+1neWNudFKr51/CsyvQgCyBvogaoP9WM5S+8tXuzekn1VkQKVtp8RVcx6BOz7iMpIz
 APe/EoMs7YReEyHsAiFcNsBKmr/CTMCVf3VFFKGoRlDDZ1aYLWXnj1lPv5TTeMN6HyCzE8lA3ou
 6nbt0bDWhVzPY94WC6BiBuXxYHlITcuv9Y8x/Zk+m0EuBUQ8/d4eLxvvLmKRoLiEU6NezzhD6eU
 N0Jv/F4zb8JD1OesZYbZp0qJp/LKM5vv9qAT9pfTUwpDsm7XUdMqgdshGbx9kuz+rMezWLo4CZH
 UhfIbtqFiVStx2+3mxyVWND3vFAILJUfAOkIblLBcs1mO+vDkD1pGxIozFnxVntcJx5Uuwwea0Y
 gXIVwAEjNx/nmPT4+qNxangvO+yGxNXnIeQ+aEhUtN4lgJX2pt1v6fUY56eBnZt3QPNK/mPvzwi
 xJ+JwosEzNEoMNO2eiw==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c0ab7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pc6iunps6SSU6zhADHUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX5TExDduKoUeY
 K3yucG4r0wYcHv9bP03V7RMfHdZEuaSWACS5sKgcmh+ZQHqJPIwa75Vo5Vr2w9g73m0n3g9XWAN
 J+aG9t1iLiGkH3f3TUoWmslOh54U5Qo=
X-Proofpoint-GUID: zQRkatBku2udhjHSD2YO4V2JqQZWRmyR
X-Proofpoint-ORIG-GUID: zQRkatBku2udhjHSD2YO4V2JqQZWRmyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

Hello Bjorn,

On 8/2/2026 9:19 AM, Bjorn Andersson wrote:
> On Mon, Jul 20, 2026 at 01:49:53PM +0530, Umang Chheda wrote:
>> Add RAS error source nodes for the Monaco SoC.
> 
> Why is the subject "repeated" here?

Ack, will fix this in v3.

> 
>>
>> Two processor error sources are described: a per-PE node covering the
>> L1/L2 cache hierarchy using a PPI, and two shared L3 cache nodes for
>> the two CPU clusters using SPIs.
> 
> Please read
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> and don't assume the reader know what this is and why it might be
> useful.

Ack, got it- will update the commit text to reflect what it is and why
it is required.

> 
>>
>> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 30 ++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 64fc0d592282..4fbd1dc9a147 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -724,6 +724,36 @@ system_pd: power-domain-system {
>>  		};
>>  	};
>>
>> +	ras-l1l2-0 {
> 
> Why is there a -0 suffix on this node?

Ack, -0 is not needed here - will fix this in v3 to use generic node name.

> 
> Regards,
> Bjorn
> 
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <1>;
>> +		arm,record-impl = /bits/ 64 <0x1>;
>> +		arm,status-reporting = /bits/ 64 <0x1>;
>> +		cache = <&l2_0>;
>> +		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>> +	ras-l3-cluster0 {
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <2>;
>> +		arm,record-impl = /bits/ 64 <0x2>;
>> +		arm,status-reporting = /bits/ 64 <0x2>;
>> +		cache = <&l3_0>;
>> +		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>> +	ras-l3-cluster1 {
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <2>;
>> +		arm,record-impl = /bits/ 64 <0x2>;
>> +		arm,status-reporting = /bits/ 64 <0x2>;
>> +		cache = <&l3_1>;
>> +		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>>  	reserved-memory {
>>  		#address-cells = <2>;
>>  		#size-cells = <2>;
>> --
>> 2.34.1
>>

Thanks,
Umang

