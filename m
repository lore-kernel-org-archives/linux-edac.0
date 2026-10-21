Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583274;
	b=jvJYpgHMejwgmluRz7rWaNX/4xFWSkxsxONxj+Nf7V95Sb6ncXnWIxOLueRUkwwqUvRI
	 vzp78C6dkGzPXC2jAvyLX+f6Fv3dvwb46hu9VqKGJPaPp1YVwbFBGDsGffMJA/CvufmM0
	 qClU/H3pCjTL1mQA6ZBQBCtdt5q1FStx4RQq904dBsf6HZ+5pA2rVHi/TR8NwIF6BEx9F
	 dH5WJSoiQGfURNCmZw1LJH+ztBSmRCaj/nmvsRL9M3jslEIvxTLNpM0tCaUoIi9KQBARG
	 Yay5HjrhNr9p9b8aNNU9NISxDitwjAr0mhKQQmnOMugupo8kxMREQYcBSAt2kcJADKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=;
	b=ay5tbKceoOegZjzi+79xSMZ2u391VVE8Qm+KKv0NQhw+jCfqtlwUK41nSo7rTuqV5Bkm
	 sNHzjwdCHlUN26rDdWrQLdT4wkFLuNtf/1itOIROZQNnkn3vttvbWjh77UvpXT8tKkN88
	 ONgf25dRU216PLJIUeq4A2oIkOY6BWw8dGhfJxIPlekolnBPFptmNWZj/Yi94/2c/FMXq
	 S8i10hrQHMIsVATUHreStBJSO3hmSRECemDzBh/No1UI2fXRLT/VJOkVb76NlbNN2oTmI
	 ixhxlRtR4aNP+RfltgTqmSBr1BRlg9sBBbXmsUiIJ6cFJQT2oJHPMkb0g3JFFDwmExg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpBblJDH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyZZd7Ka;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE0560A4AC2
	for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 11:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCE0560A4AC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpBblJDH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyZZd7Ka
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg0If3224769
	for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 11:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=; b=dpBblJDHv2bW3nLQ
	Zu/Sjh2kCnB22dralm5jpvyh8VkOvoxtAi6eHhdS/MF7Kl5ZalmHQX5eG2PAsxuz
	E/2lYLUasH26gDSn8ezyy8Tc+bQAVlQOfURbguepNhe+xZEKcS3dteS3pVilOj4t
	pDC2jWq7pkY5rmH4qGXyP2hinv3VXFXINGiTIAjNaQzIhq+dn1nj3RYV6TgYvCC4
	LQyLO30wYeCTXsyrWO67PIlJggjoeBQZwSW+kp5y3OxauqCN/Kt5xz/VgB79iQ8o
	US7/I+AHwstF7FS87xYn9NnzV6fQ8EoeKHQColiMafVsrkkqZf4XgvdDm4CaNLG7
	MiYTQQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78uwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 11:47:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1203257eec.1
        for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 04:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583272; x=1793188072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=;
        b=UyZZd7KalNZdjkocZdXb3PkRCzwUlrJqRrUGVAu0q7jX4lfAbMgHcFzkORP1zHiMud
         DC3fozXs+eIs0mG8l9AtfJSy3OGnUpH+eVfwsJXnbIsr1MXvKJD89gQwmf6XGucjY/+n
         eGZTHzmZiXYGeqkW5h9oEvybU70WRq7jSNbX/HBa1QYuyh3akyoFFys7OHJsSHVdFuSv
         mnsAe6/nFcHwi1X9cXXJKbwUSPdG3H0vSdG4cLwZeB9W+UkYvVSaZnnuCPyEqPL/7Fee
         8Ol0CPqo9cBgzdkbpf4xb23pFrbYN8ecKfC93aNdtZVxOcjGFF8h9vHw296ecnVNzAyX
         G0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583272; x=1793188072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=;
        b=Qp6FJS9ebtDLhMxy7krRaupr2NkrTm/A3TQMQ+y9EcMNcjCQusaALN3A5lizflEIsg
         C+Jvi0NtI7N46UdFMftM/zOjcxpvixBpRgC4a76r6JzN6Jw6cLsHHJ/m1aH+zYTKxDGX
         MzMwMzP4FvHcFyRysD++M9vavYi4UqOYHtm9RQNTqrXpYod8MgFSdAdCqoIhBDox6E6M
         SeKrXJBJzDZPxd7S5qvzXax1QN/pCKkRbgNiktznRxVTvIlie88/Z66j8jpsXTz3cAKy
         ak3CVPLiNfTjZ+XZGOgfP6oz/lqiWjT+gMuBEdz9fXHapUZSBhoNdPO0rEbUqSmqDZ57
         RFtg==
X-Forwarded-Encrypted: i=1; AKwUvBzLu9hKfMnRwpmeboPtSwXlfMznowvs7mwJJUKY7QPcMvB3D/Kqxd+CalLCMTbG6N/3juWFsWruvP/I@vger.kernel.org
X-Gm-Message-State: AFq9FYIWaHu1IWQP3nO9WXVgaPOWz4SbmkW5zUm8ikxl0bGYigEFZYeQ
	74A3esfTp+ocs78oiZf4oxc6r3CYzlVstlcJOw9TdxEdGK0NJfTmX1nncQioCUiUz0zv6F1nJ/2
	zkYPtrsrVJiC/giiloVpacNT33mSWVRHRwcHH51BHfDrWBJ77e1D228Ngbl1a7XVKPgOS00WK
X-Gm-Gg: AYBFou2RbsC0CgS5hrckBvAlnoxOvDp88UdPmlWUwp8N7r4cNStNscrROLvTtcrbLaT
	xdtIuoG+X25pmzdaQAZxFjnPA3ziSb8MBIsC7AQ4HD2AI1sudy9t/51gxabzYpgucekENFjtHQe
	ySuDZz5kRqZCsndupnWaePUN5Hq6Q/nKLs79iMhClN/s96DuVisc2lPU1pDc5MMKphht9SnrxVF
	zKIPc/VL+KImHrRdN+Cqsxk1mN1crY/jZjWLh8YxYgDaUX+64gWPR2sA0MBNWDJuq6MlmotpYGE
	4kHpkK087fS3luFwHSeYg1gGAArBjKEH9OKwesOCAfAf9eKrUEx+g3nBGoChaN01ctaLk0o8GIp
	09t2LmKJddqSsS/kORGQIxSye8++j3kytbQ==
X-Received: by 2002:a05:693c:41ca:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-3674eb34d50mr2703868eec.35.1792583272157;
        Wed, 21 Oct 2026 04:47:52 -0700 (PDT)
X-Received: by 2002:a05:693c:41ca:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-3674eb34d50mr2703832eec.35.1792583271578;
        Wed, 21 Oct 2026 04:47:51 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673b1d0ab7sm7077539eec.0.2026.10.21.04.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:47:51 -0700 (PDT)
Message-ID: <162c8c6d-800b-46f5-92e4-3a5501ff9d12@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:17:44 +0530
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: cache: qcom,llcc: allow optional second
 interrupt for LCP/SRP ECC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>
 <20261017-shaggy-funny-pogona-69fe36@quoll>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20261017-shaggy-funny-pogona-69fe36@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dp7cA47grNa497DaQd9Wz2RcqhnDe3EH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX1YCeTwS9VxNa
 jEupCJAQJ3hXAeuz0tDJ/xo7Mucd5HiVpBXwa0cbUXqDzxBtRKfZ0WQOjH73Yz9ItyWe9/vMHDB
 Jr6mNkcay977Kez9rP05nC3xFVFjoV4s09qQjxzg0yxrvw61HJaSygp/4WjHinukxQRyrNTXo4c
 R0RkcUmF4X0oQHg+rhL1KdjlrsU2PlUbWer51OaHqNEn1dfp6TZs1XxngOmBajXfMaPTmyWIAjQ
 GMG1YT/rioGIHZlNS0e43GeQLiPxXUl+MkIwkNaSLGnAPxG48rVHqVrSj+PNWJJq1C0vDWaQBoQ
 MI/hRp0mwmxTvtXnXgY5m0p30GosBVb+4dIUCRNwNAd/32+/3EOhJRtpwEE6RaZkpr51tJaMvQm
 ziOnWRMCgOSlII43q4Cx0x9nczKwB+hxjMihJilBYewWltxg52qfZx+gAOqLFpMRl6dGUvvSdp+
 mlr0loP6RVDUGQvYDtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfXwMH3otHL0UdT
 2oM7uVgnlRAMNJR9GBCSJ1BFKxBqzCJOOa7ycWneolGaXadUSXf84tgb9j09iqp3b8Axj8V9Hjb
 D8cknouWAMXoO8yDIWoa0AgPvm8pDtk=
X-Proofpoint-ORIG-GUID: dp7cA47grNa497DaQd9Wz2RcqhnDe3EH
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8a669 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=79Y9q3_J_5CQFoj6QLUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046



On 17-10-2026 22:04, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 09:26:16PM +0530, Faiyaz Mohammed wrote:
>> QCM2390 (Shikra) has an LCP/SRP block that signals DDR DRAM ECC errors
>> on a dedicated interrupt line separate from the existing TRP/DRP cache
>> ECC interrupt.
>>
>> Allow an optional second interrupt in the LLCC binding, add
>> interrupt-names with "llcc-ecc" and "llcc-lcp-ecc", and enforce both
>> are present when compatible is qcom,shikra-llcc.
>>
>> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 26 +++++++++++++++++++++-
>>  1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> index 2141e5d4de63..3546cf7c2519 100644
>> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> @@ -64,7 +64,17 @@ properties:
>>      maxItems: 18
>>  
>>    interrupts:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: TRP/DRP LLCC cache ECC (ddrss_apps_interrupt[2])
>> +      - description: LCP/SRP DDR DRAM ECC (ddrss_apps_interrupt[1]), present
>> +          on platforms with an LCP/SRP block such as QCM2390
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    items:
>> +      - const: llcc-ecc
> 
> ecc
> 
>> +      - const: llcc-lcp-ecc
> 
> lcp
> 

Done — renamed to "ecc" and "lcp" in both the binding and the Shikra
DTS node. Also addressing the Sashiko finding in the same patch: added
an else clause restoring maxItems: 1 for all non-Shikra platforms.
>>  
>>    memory-region:
>>      maxItems: 1
>> @@ -234,6 +244,20 @@ allOf:
>>              - const: llcc1_base
>>              - const: llcc_broadcast_base
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,shikra-llcc
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          minItems: 2
>> +        interrupt-names:
>> +          minItems: 2
>> +      required:
>> +        - interrupt-names
> 
> Please address other comments/emails.
> 
Done.

> Best regards,
> Krzysztof

Thanks & regards,
Mohammed Faiyaz
