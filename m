Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584125;
	b=wvwOfex5ctASJJ+WVgTbxlqfg+jB/8ywpI7DT7eONBGAh+5NiFX8xj+CH0z7JlMgTQBj
	 /8j0y+KUfjjq2zpm+HqfXdq1CDu3fjH61DBscWr+rc5tjpE3ebb3vJM93UN5C1ANrNEgU
	 0L34WrB9U/zcrzW6QMUUYibY0IYp9RQLHn6FWXN6/+ZAhjnUtNH/SEHtzYzyW3gf+Xo1/
	 P49ruX5cXtZa6IiKeQusnM0QXAm2I/G6nDWn6FuiCLlTJos1TLBvlypf0xdH7WPUKljEK
	 C7+rcUp/uj0xdqIuOX+XyFwrKb/Ua10eHAdXu2R3FzBhSyDtw693K/yLv6b2PTPthsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=;
	b=gxuy/BbQ7Dv/he1tNItDi+y+qmaUExjRA0QekwSC1GiZCbQ7CWTFTEifd8+vdIaPFC3z
	 /jR0B+eMcOZ+HCdTXlhRQvkTe8TbiHp//MyUctxE4RZBv2YGsE3dhof3j7gamD4wFcJZq
	 l2ZAlvxZd9bOYxXOilR5WzCx/KlNDrf6L52dkB66IqetEfTOMZuw7WXKS0NeR6fnZ1OT0
	 Fgo3fP0fpSUghXSi79kav6NzPnHat7u+PNhAEL/4TjDykRMufXo/7QEGSS6DOUdcgRXiu
	 b0kLfndDECBLU8BuwQIlj0ielGTQdJlPqKswo/ZzPkJ7OvbhlNVV56NqGE2m+SkSJsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDmcwGFM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a73dsg16;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CA9606A31B
	for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 12:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9CA9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDmcwGFM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a73dsg16
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg2Ib489906
	for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 12:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=; b=BDmcwGFMMdrh1UPm
	HJxhGbjkjI5fXRmTJxaC7CP0Rn7Z+ropIamYnHW8bzwNXwH5sbdOgPBu8gqycnDb
	Lef3X/1wYhbswAOFYi1KWr5yV7uaOXCGzjV7bQSnPf+ch6PKWj0APqKPXYrapx+X
	4DKWROB51R3m4Lq99LK2ZT1rd9XPEkdlSvRrl+ftlc6RdzrqHCR0w8ZHHSu938C2
	et5fNLdv5QSHJFMrnA24FbDNSmxCnvy28qNSQCWj5/3NR535FfNgzWRgm+n0bpBu
	i8P9l9dKr60eTpHgDaYtDuzsRR13kTpv++0op8AwYeK4dVrnkG9Z1D5Ki9ERVXqX
	4CX3pQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2v96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 12:02:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso275438a91.1
        for <linux-edac@vger.kernel.org>; Wed, 21 Oct 2026 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584120; x=1793188920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=;
        b=a73dsg16FchPeICaCb458DDfGMIwv4XWhn5emHDqjqlgIEq5MnXFljn3BP2cIeGIqW
         Z5uqrbHPxjw71Nd4U64kR9HgV+pn+GWvKA02VHDUoHgZ1MM8B7Wfj4b+0DnpFmZBBGzI
         YIAEseEf0HvcK716/JfBykknYoJyIgswYrYViQX0OcbF9C1sUvL5KDzBLjupmLpTtgtV
         HShfAEgx7JrAixRuJzZRiCH/mW8nhqvojgAT6eTvMMERjxmgPIjaspj5/rDqPIRjZsuP
         AUSRBWfxx5lxiDe8RQ3IeBGjgHePVUzaaF1daHxZEJT0y9DEVdvgtVwb9q23hClc47Fm
         WS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584120; x=1793188920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=;
        b=r/LF1ZHtq1DPrQ0/DIKGaVh7AZ5VsQB+Y7La6YgoAcuFNi3PUZRZ7xctLMVbTy21Wm
         GHZKOMb6PUgAN9AEHq6dyOsbtpNnWLNjwX8rjPp1xaDYY93aL3SvNdmfQxaVXsdyrvDR
         2LDXKUSFr8bttqEs5ywpFP4XGbt2GCZdp9uOMgiWVdxF0CBSrfDD6snclRAglfU8naBA
         V0wLz6lmw/dNniiIkHjIB1n4uWizwhqBW7dwcVvtC2UddWWqJSq4HAjfqPSoO08jYkXV
         ATfGGD3uU3jcy4Bdvw9lGoD6X99TwAjso0i4hgZZtk518ZmyTYLHny6kmVrQViaTrOgc
         UjPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC42WKTjrQTBtD+tr0mA1bD9KcCjp5LqecvxmbyRY8VkIqpJl10+8Rij0QAlQL3aEXxBBb45axjq/k@vger.kernel.org
X-Gm-Message-State: AFq9FYIjAt09BSClom6ZTDPj9p0NM8+N5HvaA4DnVjzWYEjCJSdNlMVz
	WoCSyQUkBFWgPO9iioMwqZsmXQYl/qCWl6c2jbdnJpDTXRFzwiIP3KKfE2aZuimKzSTyzhuOUVQ
	Nzz5CIAx7CMOTQ6rqE/lGY+P//lXfowc0SAZ+jtYm5ftMeXJohugGRmhZ1+QMASIg
X-Gm-Gg: AYBFou1sNnx3SUFoIYYAyzBhyPI9i+A/zqdugPySc1tQOOjCk1rgwD+a5it/cF0fGNo
	QtI7O0N8VWyUjB1jAHrit2CAJN7Z8Z1w1445a/c12xu9dcZWNWMHDMMfIoPb1ow5m2OatDKzdJB
	FFCFrR86A51ecO8+PsvBsBb4uXB52OaQbLt2nG7VuP7CB3WmearoiYGoXWSdjlBtMB3ZfF17xrt
	MOzQsQsmsDJcTt5lK5mhHElK+zzrM9qz96Hno5P5186yVx4GD5O856+HxawTK/5JNQXBkE221a7
	5yOBJ9WH7faD1RgM3nHpWaTYs0thxRYaCcH+l70olY3f37smIsmPCqpQ5TObsMVzSHXZq9bzEd3
	B1nXmwzrWKj2QeUVjSxFt+SU8IKAQVDKEGw==
X-Received: by 2002:a17:90b:510a:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3ad86d500ebmr1395080a91.41.1792584120215;
        Wed, 21 Oct 2026 05:02:00 -0700 (PDT)
X-Received: by 2002:a17:90b:510a:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3ad86d500ebmr1395045a91.41.1792584119294;
        Wed, 21 Oct 2026 05:01:59 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80303567sm4221616a91.14.2026.10.21.05.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:01:58 -0700 (PDT)
Message-ID: <984bc755-07f1-4c7e-9efe-ecc6b2ee5d5f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:31:51 +0530
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
Subject: Re: [PATCH 3/4] edac: qcom: add LCP/SRP DDR DRAM ECC support for
 Shikra
To: Jonathan Cameron <jic23@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-3-aba3cfcfbac9@oss.qualcomm.com>
 <20261016182608.65bae12d@jic23-hlaptop>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20261016182608.65bae12d@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8a9bb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7hEWZ4R0ReQgp7LtlT8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 70nx1ow3V6dzZgScd3J0ZDNwp3zfQ7jn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX0ClCWP2EpToU
 IFymuvuOl+cyYaPng4GSn4JShfMlB4VmRDpzDc3b5wV5e4Nx2nJ90i+9U21kKDhf4cGzyFI8D9n
 KEFQC9wQqD6ULrMBLabNBMiss8HPKQaJVg1v/lDc6Lp4SGsWfkorRET98nTi5AVwNqMYRQc8vUY
 qSypcoGXEU1nVVoOPx0Dl2T/mckOYJtzui7o0MAgS0Esq9RGnfnyBSzaZ355o62UlUQruU17nZ+
 dlStp/fmIXIRWLPJQuNikCn2zPGKkYL2ngqXD2bXV4MarPx9x8qWFt6JNNrsS37L9PVH775BlWc
 jxoc3VHT3/R9FbrNCQreIwgysvFHO9lP5IcTv4XaWRZ3qfGnZaxJxL8RgFeBAUfvZV2fF4bmjau
 onI1SZivlZmXWsO8jq3MJWZo+cTxNpHcjye6hCX+1gtcyF9MHDHvnCWyEUEM9oinEEcJtXsVNBF
 u9Y5/M94m4oXoxU68YA==
X-Proofpoint-GUID: 70nx1ow3V6dzZgScd3J0ZDNwp3zfQ7jn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX9DGxdkwKnJ8m
 6PsSLiAYj7lAW2OVUzt3WtpJBE/usYFKUWOkjGCcDqN+G2PBLvMJvPq8coNkxBdupg7gL/Q1X9b
 0LhIvbRrufOSAadt/L30AlCVw+3e+DM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047



On 16-10-2026 22:56, Jonathan Cameron wrote:
> On Wed, 14 Oct 2026 21:26:18 +0530
> Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com> wrote:
> 
>> Add qcom_llcc_lcp_setup() to enable LCP/SRP interrupt routing when
>> firmware has not pre-configured it, and llcc_lcp_ecc_irq_handler() to
>> report per-bank correctable and uncorrectable DDR DRAM ECC errors.
>>
>> LCP/SRP setup is skipped when ecc_irq_configured is set (e.g. Shikra,
>> where DSF firmware handles IRQ routing). A missing lcp_irq is
>> non-fatal; TRP/DRP ECC reporting continues unaffected.
>>
>> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
> Trivial stuff only inline.
> 
>> ---
>>  drivers/edac/qcom_edac.c | 147 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 147 insertions(+)
>>
>> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
>> index f3da9385ca0d..b4f7b2493650 100644
>> --- a/drivers/edac/qcom_edac.c
>> +++ b/drivers/edac/qcom_edac.c
> 
>>  /* Clear the error interrupt and counter registers */
>>  static int
>>  qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
>> @@ -334,6 +366,92 @@ static void llcc_ecc_check(struct edac_device_ctl_info *edev_ctl)
>>  	llcc_ecc_irq_handler(0, edev_ctl);
>>  }
>>  
>> +/*
>> + * Handler for the optional LCP/SRP DDR DRAM ECC interrupt
>> + * (ddrss_apps_interrupt[1]).  The LCP/SRP registers live in each LLCC
>> + * instance's address space, so iterate over all banks and read status
>> + * per-instance.  Broadcast-write the clear after the full loop, mirroring
>> + * the TRP/DRP handler pattern.
>> + */
>> +static irqreturn_t llcc_lcp_ecc_irq_handler(int irq, void *edev_ctl)
>> +{
>> +	struct edac_device_ctl_info *edac_dev_ctl = edev_ctl;
>> +	struct llcc_drv_data *drv = edac_dev_ctl->dev->platform_data;
>> +	const struct llcc_edac_reg_offset *reg = drv->edac_reg_offset;
>> +	irqreturn_t irq_rc = IRQ_NONE;
>> +	u32 intr_status, err_status, clr_reg;
>> +	int i, ret;
>> +
>> +	/* Iterate over banks: LCP/SRP status registers are per-LLCC instance */
>> +	for (i = 0; i < drv->num_banks; i++) {
> 	for (int i = 0;
> 
> Fine in modern kernel code and makes scope more explicit.
> 
Done.

>> +		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_interrupt_status,
> 
> I'd use a local variable to hold the regmap pointer.
> 
Done — added struct regmap *regmap = drv->regmaps[i] at the top of
the loop body.

>> +				  &intr_status);
>> +		if (ret)
> 
> A read fail, without any logging seems unwise as you may have just jumped the
> error.
> 
Good point — added edac_printk(KERN_ERR) for the interrupt status read
failure, consistent with the error status read path below it.

>> +			continue;
>> +
>> +		intr_status &= LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR;
>> +		if (!intr_status)
>> +			continue;
>> +
>> +		irq_rc = IRQ_HANDLED;
>> +
>> +		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_ecc_error_status1,
>> +				  &err_status);
>> +		if (ret) {
>> +			edac_printk(KERN_ERR, EDAC_LLCC,
>> +				    "LCP/SRP error status read failed for bank%u: %d\n",
>> +				    i, ret);
>> +			continue;
>> +		}
>> +
>> +		if (intr_status & LCP_DB_ECC_ERROR) {
>> +			u32 db_cnt = FIELD_GET(LCP_DB_ERR_COUNT_MASK, err_status);
>> +
>> +			edac_printk(KERN_CRIT, EDAC_LLCC,
>> +				    "LCP/SRP DDR DRAM Double-bit ECC error in bank%u: count=%u status=0x%08x\n",
>> +				    i, db_cnt, err_status);
>> +			edac_device_handle_ue(edac_dev_ctl, 0, i,
>> +					      "LCP/SRP DDR DRAM uncorrectable error");
>> +		}
>> +
>> +		if (intr_status & LCP_SB_ECC_ERROR) {
>> +			u32 sb_cnt = FIELD_GET(LCP_SB_ERR_COUNT_MASK, err_status);
>> +
>> +			edac_printk(KERN_WARNING, EDAC_LLCC,
>> +				    "LCP/SRP DDR DRAM Single-bit ECC error in bank%u: count=%u status=0x%08x\n",
>> +				    i, sb_cnt, err_status);
>> +			edac_device_handle_ce(edac_dev_ctl, 0, i,
>> +					      "LCP/SRP DDR DRAM correctable error");
>> +		}
>> +	}
>> +
>> +	if (irq_rc != IRQ_HANDLED)
>> +		return irq_rc;
>> +
>> +	clr_reg = reg->lcp_srp_interrupt_clear ?
>> +			reg->lcp_srp_interrupt_clear :
>> +			reg->lcp_srp_interrupt_status;
>> +
>> +	if (clr_reg) {
>> +		ret = regmap_write(drv->bcast_regmap, clr_reg,
>> +				   LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR);
>> +		if (ret)
>> +			edac_printk(KERN_ERR, EDAC_LLCC,
>> +				    "LCP/SRP interrupt clear failed: %d\n", ret);
>> +	}
>> +
>> +	if (reg->lcp_srp_ecc_error_cntr_clear) {
>> +		ret = regmap_write(drv->bcast_regmap,
>> +				   reg->lcp_srp_ecc_error_cntr_clear,
>> +				   DRP_TRP_CNT_CLEAR);
>> +		if (ret)
>> +			edac_printk(KERN_ERR, EDAC_LLCC,
>> +				    "LCP/SRP counter clear failed: %d\n", ret);
>> +	}
>> +
>> +	return irq_rc;
>> +}
>> +
>>  static int qcom_llcc_edac_probe(struct platform_device *pdev)
>>  {
>>  	struct llcc_drv_data *llcc_driv_data = pdev->dev.platform_data;
>> @@ -372,6 +490,8 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
>>  			edac_op_state = EDAC_OPSTATE_INT;
>>  			goto irq_done;
>>  		}
>> +		dev_warn(dev, "failed to request LLCC ECC irq %d: %d, falling back to polling\n",
>> +			 ecc_irq, rc);
>>  	}
>>  
>>  	/* Fall back to polling mode otherwise */
>> @@ -386,6 +506,33 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
>>  		return rc;
>>  	}
>>  
>> +	/*
>> +	 * Set up LCP/SRP DDR DRAM ECC after the EDAC device is published.
>> +	 * Skip hardware routing setup if firmware already configured IRQ
>> +	 * propagation (irq_configured); only request the IRQ handler.
>> +	 * Guard on a non-zero lcp_srp_interrupt_enable offset to confirm
>> +	 * this LLCC variant actually has an LCP/SRP block.
>> +	 */
>> +	if (llcc_driv_data->lcp_irq > 0 &&
>> +	    llcc_driv_data->edac_reg_offset->lcp_srp_interrupt_enable) {
>> +		if (!llcc_driv_data->ecc_irq_configured) {
>> +			rc = qcom_llcc_lcp_setup(llcc_driv_data,
>> +						 llcc_driv_data->bcast_regmap);
>> +			if (rc) {
>> +				dev_warn(dev, "LCP/SRP interrupt setup failed: %d\n", rc);
> 
>> +				goto lcp_done;
>> +			}
>> +		}
>> +		rc = devm_request_irq(dev, llcc_driv_data->lcp_irq,
>> +				      llcc_lcp_ecc_irq_handler,
>> +				      0, "llcc_lcp_ecc", edev_ctl);
>> +		if (rc)
>> +			dev_warn(dev,
>> +				 "failed to request LCP ECC irq %d: %d, DDR DRAM ECC reporting disabled\n",
>> +				 llcc_driv_data->lcp_irq, rc);
>> +	}
>> +lcp_done:
>> +	rc = 0;
>>  	platform_set_drvdata(pdev, edev_ctl);
>>  
>>  	return rc;
>>
> 
Thanks & regards,
Mohammed Faiyaz

