Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583694;
	b=NVJgDdAb6kReNdbrBvnUP6rAI+9psHn9YAq6y4krhXHkXiNg24Mq9rpowQzrGbxJRz3C
	 ouG7irXIfD6QTDuXDZHaAqgPM7KYzLdZsBOwWeuyfnJi68sP/BkMdQ/ddL/ETh0NTCQ4d
	 LR9Ps2g8RBevLYDa1A2YNd07obm9mmqsUE2wNHScld+JnpAn48kawj5YwwD/FbV/1N/au
	 B7ZZf747S5gldOMX9Zrh9ZlsTn6oEAFwQpPeXPIE2ft4NkC16OAKpxYoO/Lgrl0+oRUG6
	 +FIBDu9g9XSTL3NjT2In8PgFoawjTJtKuCHOH48l+ouReXkKx9PysXTSmEq3/iTvYvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=;
	b=1pGz/aBMwFHsmPeLfHnWyl2bAG9q+TtVx8ttdiMg81K3Xg31bJym4kAeO651Iy7jXExF
	 3c/nwDVh+MSiefWi+MSmJR4IYQCROa1dxTkx3/kuzLXOKm84e3TSviRs8+EPC4P0c1ff5
	 MrLbWBVBBYbTlaYVifovEjEq6u8xpexMlZuVNB0ys6rzQ+0rPutxZaNgYXXJHEIbiW0py
	 7gIhYg8jcqqsUrLLVfnGpHTIX19oPoeYfI4erZRBucNdsLjQwKNbER80II5wnhZvEkKm3
	 ZBM7rrd0P+U4gdUvJv5V6SYFMOItwJDPvlgQukQ9Vki0WjmlzRhLppXFH1rvrs9u+rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ua51GJmd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPCh+CmZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88779606A32A
	for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 11:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88779606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ua51GJmd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPCh+CmZ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg2431599901
	for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 11:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=; b=Ua51GJmdnkG2tfL/
	tArK9LKhlgyybEuUKrA4cNSRpoo0HcKSNumOWjbKehdQHe7lmVPEN2BTLeXFkiT9
	hV28mELMWmFAbHY3h2f6yudeYG72/frzng1rKdnB+8uanyISpG2YgZJpgyRWUmf6
	VCiZhynaK1MfEjZ1wLnMspQnHPiEDP/y0CQl0YQw7aKfBVSHewWb8n3zc3I7NCif
	5X1JGUkaTBwZ7CPf8NOJ1Lcm1nvWXFScJx8QwsNEriQp1cjxk9kG9Mi/FFGZBRSH
	92EDI52tiM7MyzB4zCcyZRphrYk6NARv83dea0YROAomnSzB7QiLYJJZd8BLQv8w
	k9wBRA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug9qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 11:54:52 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso1068101c88.0
        for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 04:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583692; x=1793188492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=;
        b=JPCh+CmZ5Nraua0GgenannhrnbtnA9a/6qDfeCEUzMCE+jIIcGwF3HXrl9SbD3R3IA
         5vqdM/2i/S7G/eVvziB1UxEH4C2fMxC8Apw7V+HTBjL0+V4lSewPl143/tvagHou6DYa
         hwhVztQLo1m4Q1qA+HyYQgV1Ls8vZ0oBAUL62bPTR3h8U4gb+0Gwo+pQUewUvGUX+8UW
         JcvUdrtBktv+8pUWdNNJHm2F4RZM8KNReESp3+rLlY9Bx6PDlxDgU3sypS/LdvGYE6s5
         ULCFguooVI0iH0COewnjABluWyLn2Q2CYsvtvR5dX14cfcgi06Mlp4o8qE4Tqc891uTX
         4Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583692; x=1793188492;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=;
        b=o+cT1OSJbCXEE7f9FA6CHyCMr22tcj37viw89MdO4Z5bdMrVoNaAp+T9zDCGB7TT3E
         ca+xM3ZLqsHz7neUAk0jPD0Haqb27JIcyIoexxZJs5s5ZtGCauo+mZOLnQb58twSNKXr
         Wd743ZYfsX+l4GMCZL4rUTDd+XPjX3m/SMzErRABBRgUSH1FLd4vRoqPdC5Npnp37Yk3
         SDppftSsNMGdhCt157STrhTQKdZsdJkHM1RTbSEyOkI29WYtYMf1JwOvH6MwcHg2jFwf
         jTKOFdWLKLz9T81Fdbkvs1iZi6/1pM/4JaPg1/tB9BgE/KfoGtzFBIExdsGmxNYm0/fT
         C3gw==
X-Forwarded-Encrypted: i=1; AKwUvByZm3eJRBj2Pwyjj6tvwUMz5I2oSjcaPsL2LSJtSUGi2U8tyjWwiUJk3bY7hi8YSLkBX8+auWbjWEvq@vger.kernel.org
X-Gm-Message-State: AFq9FYITgpdUbs66OlRzzJwzmkq5oeuAaAAnGLU9bEb/IbX+FrVyJrQe
	C3wzYfYLAk3P8hc6kj2EKLp17ANazTAiPgpz9Nl2sFbx6fZKJOixKMuj8ji809nNuNBIVzS1o2P
	Xxbjg8RCQpdG6C4Mpz3mTonNOLZ55Nfvimg055jgZ5SgI7jIZyE+xH4b0RzHEy2Se
X-Gm-Gg: AYBFou2/S1O8Mldw5BzOfVnELb/ofWLDU8ShU89YNX2co6IreW/YXdG7y8zzzHSLZi7
	ruASrvfg+LppCzMSdepA64uEGH1G+HPzqUiPGJEeY+vZ5zwuE+bv/iFqicS1XlcRXLatabi0qvk
	XmSc+9979RszqOIbcAOGjqBm73nNGnJiKwm8aWHeBwH1HtCG2aIWWVbAGTLcSPPe9xd36Td8Ss1
	NpiX2FTs/Z+RHXOsjUCmzJgDsECioMN9HpEbArpVZ9t8BeU8paKNSmZdFGM+fEUR1yCrr+Z/Uyi
	F/u1ggJWsX+ny4E6HY2v3xUQ7nuMuU2SfWN6I17bA9Qrl8tJevkASdofrtj2Sq+ozOamDdhPrSS
	0mcA1QqbwcDSgefxGu2chm92JjeXYPWGrig==
X-Received: by 2002:a05:701b:2202:b0:164:3237:4485 with SMTP id a92af1059eb24-1909a332a70mr2205187c88.0.1792583691828;
        Wed, 21 Oct 2026 04:54:51 -0700 (PDT)
X-Received: by 2002:a05:701b:2202:b0:164:3237:4485 with SMTP id a92af1059eb24-1909a332a70mr2205157c88.0.1792583691125;
        Wed, 21 Oct 2026 04:54:51 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d87ab1bsm6181635c88.21.2026.10.21.04.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:54:50 -0700 (PDT)
Message-ID: <67404f33-9452-4a53-8ed6-8fee4eea2611@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:24:44 +0530
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
Subject: Re: [PATCH 2/4] soc: qcom: llcc: add LCP/SRP DDR DRAM ECC register
 offsets
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
 <20261014-master-v1-2-aba3cfcfbac9@oss.qualcomm.com>
 <20261017-spiffy-shapeless-caiman-d658a6@quoll>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20261017-spiffy-shapeless-caiman-d658a6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8a80c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VlAtpL-8CsKfw-zIKP4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX1AANcx6K13E1
 4U53T7H/CAvalbKqJvukjNpK3/J4YzijtbpIGZnZnvWu0rt4r2GCe86ngGD8BXOD4grJqmpQCSC
 GdK0n5efhtcNK5PActNIkBGcKiT+mpw=
X-Proofpoint-GUID: w81-ASknPisJ9wq7OGj5P4ISQCgGs9Qk
X-Proofpoint-ORIG-GUID: w81-ASknPisJ9wq7OGj5P4ISQCgGs9Qk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfXytYd+B6WnxFp
 exlcEJiAfsF7fV03eBiojWfDVEc0a+ax99awzoDAnreFe/CIfCgL7T/xKqDmkZTZ+1yMPUmO+VI
 /AQnHytEX52l88jVHUWL7wPnCFVGXQd+QBcs5aAcAnisMhdO5MVtwABN9IIJ9eAOpeRkPGShFis
 2oeXLQgmgdS4p8I+oh2wveXWpM7E1sfIejl9E+1gWH0etuS8ZKT1x+UV/GEe3Jhtugn5pyhXNp/
 KCTUx72Nr/RsxRsWK3uOJrrZSRns1CzBlJCegPVJcsugKxUeBIWwJst80X8C7JPHgOVBI0RbdyM
 xYTx/z/CLszF9Bfe8tEStsEoMjGV1yVGi+bW3aRX31JgUa18x7b07RDmEgmGJ0ehMQLvDiXvYVa
 2AgO7SjAPVWBVXjenWzH2emGaVpKDZDnqiVfWELIlBz7+i2P1X667OyzvSo24Uw5ZoyHxFJus/j
 VpotxQ9X/J9SwHYUvxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047



On 17-10-2026 22:04, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 09:26:17PM +0530, Faiyaz Mohammed wrote:
>> Add LCP/SRP ECC register offsets to struct llcc_edac_reg_offset and
>> create llcc_lcp_srp_edac_reg_offset for QCM2390, leaving the shared
>> llcc_v2_1_edac_reg_offset table unchanged. Switch shikra_cfg to the
>> new table so other platforms with the same block can reuse it.
>>
>> Add lcp_irq to struct llcc_drv_data and retrieve the optional second
>> interrupt in qcom_llcc_probe(), propagating non-absence errors so the
>> driver defers correctly.
>>
>> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/llcc-qcom.c       | 45 ++++++++++++++++++++++++++++++++++++--
>>  include/linux/soc/qcom/llcc-qcom.h | 13 +++++++++++
>>  2 files changed, 56 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index d7a42a8040a1..39e0da14b36d 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -4509,6 +4509,41 @@ static const struct llcc_edac_reg_offset llcc_v2_1_edac_reg_offset = {
>>  	.drp_ecc_db_err_syn0 = 0x52120,
>>  };
>>  
>> +static const struct llcc_edac_reg_offset llcc_lcp_srp_edac_reg_offset = {
>> +	.trp_ecc_error_status0 = 0x20344,
>> +	.trp_ecc_error_status1 = 0x20348,
>> +	.trp_ecc_sb_err_syn0 = 0x2034c,
>> +	.trp_ecc_db_err_syn0 = 0x20370,
>> +	.trp_ecc_error_cntr_clear = 0x20440,
>> +	.trp_interrupt_0_status = 0x20480,
>> +	.trp_interrupt_0_clear = 0x20484,
>> +	.trp_interrupt_0_enable = 0x20488,
>> +
>> +	/* LLCC Common registers */
>> +	.cmn_status0 = 0x3400c,
>> +	.cmn_interrupt_0_enable = 0x3401c,
>> +	.cmn_interrupt_1_enable = 0x3402c,
>> +	.cmn_interrupt_2_enable = 0x3403c,
>> +
>> +	/* LLCC DRP registers */
>> +	.drp_ecc_error_cfg = 0x50000,
>> +	.drp_ecc_error_cntr_clear = 0x50004,
>> +	.drp_interrupt_status = 0x50020,
>> +	.drp_interrupt_clear = 0x50028,
>> +	.drp_interrupt_enable = 0x5002c,
>> +	.drp_ecc_error_status0 = 0x520f4,
>> +	.drp_ecc_error_status1 = 0x520f8,
>> +	.drp_ecc_sb_err_syn0 = 0x520fc,
>> +	.drp_ecc_db_err_syn0 = 0x52120,
>> +
>> +	/* LCP/SRP DDR DRAM ECC registers */
>> +	.lcp_srp_ecc_error_cntr_clear = 0x59004,
>> +	.lcp_srp_ecc_error_status1 = 0x59010,
>> +	.lcp_srp_interrupt_status = 0x59070,
>> +	.lcp_srp_interrupt_clear = 0x59074,
>> +	.lcp_srp_interrupt_enable = 0x59078,
>> +};
>> +
>>  static const struct llcc_edac_reg_offset llcc_v6_edac_reg_offset = {
>>  	.trp_ecc_error_status0 = 0x47448,
>>  	.trp_ecc_error_status1 = 0x47450,
>> @@ -4767,7 +4802,7 @@ static const struct qcom_llcc_config shikra_cfg[] = {
>>  		.sct_data	= shikra_data,
>>  		.size		= ARRAY_SIZE(shikra_data),
>>  		.reg_offset	= llcc_v2_1_reg_offset,
>> -		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
>> +		.edac_reg_offset = &llcc_lcp_srp_edac_reg_offset,
>>  		.irq_configured = true,
>>  	},
>>  };
>> @@ -5798,7 +5833,13 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>  	if (drv_data->ecc_irq < 0 && drv_data->ecc_irq != -ENXIO)
>>  		return dev_err_probe(&pdev->dev, drv_data->ecc_irq,
>>  				     "failed to get IRQ resource\n");
>> -
>> +	if (cfg->edac_reg_offset && cfg->edac_reg_offset->lcp_srp_interrupt_enable) {
>> +		drv_data->lcp_irq = platform_get_irq_optional(pdev, 1);
> 
> Why do you exactly require interrupt-names?
> 
Good question. The driver was using platform_get_irq_optional(pdev, 1)
by index, which made interrupt-names a documentation-only annotation
with no driver enforcement — not a good reason to require it.

Switched lcp_irq retrieval to platform_get_irq_byname_optional(pdev,
"lcp"). Platforms without interrupt-names naturally return -ENODATA,
which the driver treats as absent — no explicit register-offset guard
needed. The ecc_irq stays index-based (platform_get_irq_optional(pdev,
0)) for backward compatibility with all legacy platforms that have no
interrupt-names property.

Will repost as v2.

> Best regards,
> Krzysztof

Thanks & regards,
Mohammed Faiyaz
