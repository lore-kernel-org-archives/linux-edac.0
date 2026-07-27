Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE974248AC
	for <linux-edac@vger.kernel.org>; Mon, 27 Jul 2026 20:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185474; cv=none; b=QxNQsytDOLvKbIoE30hz5rTqm7Niu36CKlm8PZrzgmpn9otfBOB9CkECAvu1W+uUt6XgFa3XDJ6ZdOFKGUlSCkSurF0eE65oPeBsbqDqvGzy/jghilx6oLIjUhxvrnpzfUy6aGbHJkhKeM4GcDEKhKGdMlL5Tei2PO4C1uSGE0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185474; c=relaxed/simple;
	bh=5T40wmWDtqiWw9nchZXY9adF6khd5Rjbq9/1nH+g5s8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUKF7AJT/3+fZMGKDwde7Giiy/BWHA1+O8Ncfy2kfZNG5LgBQ710TxJUwXuNsHwjZ+NcsK8b9hRIVCDvYoOzHjjsfAbO1F4PYmcDcEkS3BaKdKt61RZC+dhMhi9xWUm+LZeqbl8dfan0cxO9u4W4x39JeA7b2iews+PL4k9w0bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfcEVxYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fE38TUMW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfcEVxYH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fE38TUMW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC593321750
	for <linux-edac@vger.kernel.org>; Mon, 27 Jul 2026 20:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ml3ta5SN1xbqlfIsvlPisKm1wFDAiGC6EKlzVfQ7Seo=; b=TfcEVxYHH7awtRre
	u3qOjQ/eJ6aHTo+6+m7rfqbloAlVE8jjyrLS0594MLb0Rc6vhfr41+bnY/NgcvZs
	N9SOJB6QO6ENi3avgPBGoJ1uHk15Wz8PRzLaEo4gefSMOm2mKKhBdKOdEg6BkPdb
	nTN+10Jkt8f5wVUMC4n9rD1p/uC4cRSx601en/2yIA9HR4m9EZkH1qfgVAN0o/cA
	6fbcaj8zBSCcCRkGT1tqYGGs0Idoj7KAvl6AI1LtERHcA8umtcRpgGOWQ98znmJM
	UcY5SIdgc561hG0WMEzgK4g+5DOH+cDFjD2zT2zotSVSZ1NQOQaYieacapuF1uLJ
	uXIhow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uktubu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Mon, 27 Jul 2026 20:51:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce8a76df2dso54568915ad.2
        for <linux-edac@vger.kernel.org>; Mon, 27 Jul 2026 13:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785185471; x=1785790271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ml3ta5SN1xbqlfIsvlPisKm1wFDAiGC6EKlzVfQ7Seo=;
        b=fE38TUMW8FT85/jBngucxH6zypRf7FVYwmRsdlK/9evbpCWAwPv2rXtwda7Wk6p0x6
         adFZ9gFxLXFT6pvIhoglig0aRqJqw2BUt1SOU5g/P9SCNWT2clPav8s5jZJBcOW9QBXW
         h4SqMj2fOW/235HmQwyderD2VoHLk9gd/5pU4bIAoOhXMXD59sMt+SkK1IIOy16zWGrb
         JaTN04+/gkyzBkddCzZUsBaCfB/GNEd8SfquufiVVCB/TBxPfJWcVfA3n1OgcK0+KUUM
         NBU4jCdTi3ugwBymdCOwSnoLlhtNUZEmUYOsVE9OrFwBRgNL1Yk+OZHht0qCH/IHEBKm
         wqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785185471; x=1785790271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ml3ta5SN1xbqlfIsvlPisKm1wFDAiGC6EKlzVfQ7Seo=;
        b=kWp1ZUNrYBByWy/yzbEbMsHXkJnXJUSwLjblHY0iig/l2h6o3RAYwJKBuSf586LzS3
         aHqt0ceWM6NhqkSJtp8FbQLbuy/FoBRG9zsgqMxmdK69Na4Lcc9O/Yrua4jbIxjo2Zpm
         iAQBcarZvUw1YLgM7RSvLlqQNifVqX74rSjhq1GL2QhOIVLz11n3UEmOenxkjFpaoGIG
         BqLT07GUPrbSzL4dj8lFKPlIo8DBZ8X8LI5o2vOar3OcVvQ+4SOVN65jpUCLPqFigqYo
         TTnhppggk/LriX09wvFWWLmIRA1YitZZDIUAtvMYa/lNkm+FyqehPH7h+BNDwwUd+IqC
         +zSg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+jbDTQmA6ZGnBrczXvqnEqP5WHeB04yD4rOdn4BISjmhc+lvQfTFLfe6qohon0y9kUV5a4QOEgGNw@vger.kernel.org
X-Gm-Message-State: AOJu0YwnSWlMneygCmTn48lK4mJNY0nxRFRbuVoDk278walGZqYasyga
	B7PIt8udTT+ZYhkVilwX5+ukvAaEY7HFYYzLZ+tl2KB4CeJe8ChdAjYq4Z9LJ7MUcphHGd38T9T
	/gbeeT0axMvfXAqcYksoK2NB6AElBAYNaces61dImJ+Z1ynl/WO8e/86ypbqt5d4K
X-Gm-Gg: AR+sD11KvfybzPkXY8UJ3cisNfxYWdxdhH4NEyIqVNRsiKOsf0ltBSW9FV3BPDGmDOU
	bQ6ljtpWTM69jg0Fe9MtelkuaBoIPAaKK5GLWrl4OjC7qAofSmWe5wFKx176/U6CShV+jcxu9pW
	8qZ5SjcdNUMMguLFZZiGb8+jnEQsQjz78TK02DwnkGOh3rx4Gh5Kk+sIhmHiL4GI7hOVxiealeC
	0BKIThGqDvZhgSPKxpDcrRVuVPDuS5eZO8zJ49dXm8GuKSfaeidIis7SE6kUz/Q1c60gTLD7Of6
	p/blZaBSTX2/p9XYhh92ES2IWg7ctBYCKdTx1VZVmPKzKso+/vI3tY8YpTXgynBHgZq133AF0p+
	BFhzSCbSq86yzoEvAovl/wpb4I1Y3Zv76NkDvHyS4wya282tG64xucg==
X-Received: by 2002:a05:6a20:4305:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3c6c7d90345mr1054514637.37.1785185471243;
        Mon, 27 Jul 2026 13:51:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:4305:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3c6c7d90345mr1054480637.37.1785185470747;
        Mon, 27 Jul 2026 13:51:10 -0700 (PDT)
Received: from [10.73.232.208] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm35047910eec.10.2026.07.27.13.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 13:51:10 -0700 (PDT)
Message-ID: <f6443353-b3c5-4922-a98a-1292db381ca7@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:51:08 -0700
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ras: Introduce bindings for ARM
 RAS error sources
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AE0Qhqh-YSeiuf_VkrL41BB6RWsIrOLD
X-Proofpoint-ORIG-GUID: AE0Qhqh-YSeiuf_VkrL41BB6RWsIrOLD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE4NiBTYWx0ZWRfX5B/i4UuFXEmZ
 eQxixcXIaItgJwnexSua2p1m5A++Si9znC2wzEqtO0zmi/Rlaz6pmZUSz9EnajHlWQweLqdxqrt
 TC2T67bHPfkqH7KgrVCtYaKVmJ5L7rs=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a67c4c0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZKp2R2PTrS9d3pXqUQEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE4NiBTYWx0ZWRfXxCB3i6Ex4Scv
 ryFiO7YOfKlgNQUTQAHmRkWWpid4aBGqxZoXsaE8q17tEiKnyNpGSIUzVxqyJOBD3YdZUa1uV1h
 q57AvONJBbzED67MAcMpif42N20hrDjg6Dmt5CqnVxEpiDQOb6+BAk2WMRZhYm5HLk/cBxRwZCC
 BFEZ/US70pNDkr7TKDa5mDSphsl9kCFTl7SHa4hDp2GsJA+JlLpjDOw1DsgTNiKloGMOD+K7txu
 eVM+4k9M94XGKbtvx/VRoakPhbCPMFTGribp/rNuDnq2FI8/mPxnQIme/DlAWjcoXaVrGe7ICKT
 wmdfK80JmoDPuHiT0aTjWr35EnUri6k/pPvsj+7am8AVDzxBsehRoooeeAaa/ebIX3tj3PXyrIc
 ioUCMvdcaYcpCHqEbcxzh25xYDC+MfpbPa32laVeoLvqgfNWSArUscNDM9uDyikagZkd8FYDvc3
 0b7swyxD3IruQWzXFUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270186

On 7/20/2026 1:19 AM, Umang Chheda wrote:
> ARMv8 and later processors implement the RAS (Reliability,
> Availability and Serviceability) extensions, exposing hardware
> error records through a standardised register interface.
> 
> Add Device Tree bindings to describe RAS error sources.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>

...

\> diff --git a/include/dt-bindings/arm/arm-ras.h b/include/dt-bindings/arm/arm-ras.h
> new file mode 100644
> index 000000000000..c2f4e1f8243e
> --- /dev/null
> +++ b/include/dt-bindings/arm/arm-ras.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_ARM_RAS_H
> +#define _DT_BINDINGS_ARM_RAS_H
> +
> +/* arm,group-format - error record group register window page size */
> +#define ARM_RAS_GROUP_4K		0	/* 4 KiB,  1 ERRGSR  */
> +#define ARM_RAS_GROUP_16K		1	/* 16 KiB, 4 ERRGSRs */
> +#define ARM_RAS_GROUP_64K		2	/* 64 KiB, 14 ERRGSRs */

Do you want me to have different DT for 4k and 16k and 64k? This is not a right approach. 


> +
> +#endif /* _DT_BINDINGS_ARM_RAS_H */
> --
> 2.34.1
> 
> 

