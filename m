Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F1F384CE6
	for <linux-edac@vger.kernel.org>; Tue, 12 May 2026 06:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568703; cv=none; b=pHofdcW3lLxNGtttLSI200nUXXcOwcxXBklbqrxUjkHMMtgqQ4nYeeh/PruJNvZ8e/SGius9+LDhar8cpK8n1/9IWicVhYc9NS1JfGD/BCN5hOEeTkBp2kQhpi2wv60vGL3G3IJ6casgIxl7CDgxFz9cW8DVMMztzO6ZuJD+WN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568703; c=relaxed/simple;
	bh=l2q/o3YLzqVvVBD9xt5YoGvrCny7mNfjFIlkwFKF4pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qj3Ms9nsWfOmn2N6Wdqi8/KHb20QH2PpnrCc7PizUy+3K04kWq/4qJ/hqXSAwg1Xspo7jwtZi+t81vRyieoe33vv2lVPU5Ns6vBh2Q2CxcBLqjNWsEfoFDqDnEubJ2Ayukft3uLXAq3W3ijFsJFK/CdEsCINB7OppHaruE6zVPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jalJ0c4C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9K/xqrT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jalJ0c4C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9K/xqrT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5CMXe3444270
	for <linux-edac@vger.kernel.org>; Tue, 12 May 2026 06:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=; b=jalJ0c4CDRMSfezs
	Dl1dgmNW9TD7oJ3eDj4RI0y0TKbotUzWHDqQAkQt/ETWFTT9E8HcQA7QBsein95h
	q8zAb3Dnyk0bYKEoq4LPZ1rQg1dqmQrlZbEfIwFJA2ZK8gf9p1stuiErrKt+VHkr
	LK6W0ELpbqUMMlTBPivsWakT7E6bOnhNVkgkEqsT0ITJTyo2lKgHFZ+x0gbiz/dc
	Q1IqiwG2vWxE7pULWT7QiEjCG32ULR/pRiYQ0k807dfoXn0rR2D+/MIJYorZ/CPJ
	dvZJSKY6X94gN7hJhNteIdfG7dIzE577ZGtN85AK1GytKWAV3+cnJs+kjH8Huro0
	Cymw0A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0hw2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 12 May 2026 06:51:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c822bc6ff86so684884a12.0
        for <linux-edac@vger.kernel.org>; Mon, 11 May 2026 23:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778568691; x=1779173491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=;
        b=R9K/xqrTMUvi6syJAJF/ggyYfhvHflW+xPissLiPF/1mRRrTv+53I50YO/CHu/MrH0
         uAkwYRZCUQkaLAg0X8XgxRJmqMApFwy+sDYexu9dAs+NCH5kSgL5mwJz1v9D8LMab7zr
         jAiNSOa5Rt37uqqnR8wj0fVc8eh91C1q5MtjY1Qm69r9OxdVb/Z1IXrm8247G1FTCqbl
         sxrN/6xYKj5Jd3odQ4xzwUFBN9+RQiHM0R58IQOL6AUsEgL614lM1giaKOcDRqdxcwWy
         h0RZeqLsQeBRgRcWELndox30sYPZshhNtFeySp6BmJiD/95hLOa+2ehvsANldXdITDta
         CEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568691; x=1779173491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=;
        b=IldAyT7hYw2eNkWUuXSQoa7Wg6019QWMopaVQkRw6bitlIm7FVce8khOBuRuXIFcE/
         FyrHUwIgjTDWnRZDdoPQGzf1NNkwePd6ib0tiJgQz2JDEXUnKdv5kJefayTtR/AZQZb1
         W9lCzPzudT6X8lbQbUb5jqXysBz4Tkfh204tkm7lxFRa6yehOkpQx0hJvcsunNfm1YRt
         Yw4FG2N0FKxIMwPu0NANn+lxpZHQvBvfSa5R0Awb/BPyt8vtXrpkahHZaKcDQpcjYCVG
         DB/vK20j3fnZcZCDpCyYOY4KTyCxs0Ubs2Fx6Sw4Dbg8aAJalh3sFNNmS9oQiErQy0cX
         6bZw==
X-Forwarded-Encrypted: i=1; AFNElJ9sUigUw1z5+RtfrzjW2E6KebmVexLqCJKusc7a575skGnlwMFUnRVrO9dAaJP3oumGaRXJbhWkA8tN@vger.kernel.org
X-Gm-Message-State: AOJu0YxMvdFgnIHqbok6kJ8A3ppDCPSg448oKezzRq+kK2alvM5tUypH
	0tupN2hOui5Srd+/6lzZFmMjSJffdotsLyPCgtEL/daTy3rE93cKf/R2NRKoiLcQOKKBBJkcGBm
	TvJ39A1XDpwYHQ9Pi5FzHIX6zEY6JAyKvxiS4QSRJ/P/PaOsy2m0RlO1nUba6aV3s
X-Gm-Gg: Acq92OH6HF4wvoKdWciukvnQO4aXmAfNni5yw/QN1HS7m/awMx2QhGCXo3+bTvW1XhM
	MtkoHiiewBQSrLlUv6ygVwalPahSQc5UGKn6vnWwelxUWehvB9jGmfK69NzJEcS4GiG5DKRx3d/
	MOCTrGBEKFYndsKlezKaLxi9F7Q2oWzp1T8FIMFKFKR8ucailjQY0ymg3U38SQYlVXw/9/a+IZP
	s0y+VQxV/kG6Nm03QrYJjTEHT+LdEYb7DoeKe2A5EBASXYIcHSq9PAf56GCEdC0zZzoGE/cINGV
	+Ekz6XvlBHxxkHTzejxQK08ja+sA4hNSI1ZKLG4ts3wrNo2McdjIsNN+ZKF6eHYbZ7dt3DmWJet
	o/OPyJSTFqhifdC5hzPXXdzHEKfnjRdkNOWe6679sw27KmJprgjk=
X-Received: by 2002:a05:6a00:a804:b0:82f:21ee:270d with SMTP id d2e1a72fcca58-83a5aaf7794mr13651038b3a.1.1778568691151;
        Mon, 11 May 2026 23:51:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:a804:b0:82f:21ee:270d with SMTP id d2e1a72fcca58-83a5aaf7794mr13651009b3a.1.1778568690660;
        Mon, 11 May 2026 23:51:30 -0700 (PDT)
Received: from [10.92.198.185] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a6252sm22579715b3a.59.2026.05.11.23.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 23:51:29 -0700 (PDT)
Message-ID: <fcd68c71-2581-47dc-9e9d-2ef558b7a6d3@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:21:22 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] ras: aest: Add panic_on_ue module parameter
To: Ruidong Tian <tianruidong@linux.alibaba.com>,
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-4-d5d6ffacf0a5@oss.qualcomm.com>
 <24e7a997-9479-447e-a1e2-cfab9a904668@linux.alibaba.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <24e7a997-9479-447e-a1e2-cfab9a904668@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a02cdf3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XXTmVIMiA0tzt-EScKkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: w4ZD7pHAPDib18719vHhapiSDWe9q5zb
X-Proofpoint-ORIG-GUID: w4ZD7pHAPDib18719vHhapiSDWe9q5zb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NSBTYWx0ZWRfX+RYk6Zg77Wa8
 2fxlosPqLiZaoZcRxL+/WvLMmU3Oq1n7QIbk/H8imtPKQ9+0ZIodkfXkXSFMHrwNY/tznz/Qwz8
 zbv4Va2vZh50DhSXiWVQzjpZKBBwc7kI/IRZpk0k4d/gNTsm0oAkQ++xw2ewaLKgNpZCibtrOth
 qAXe1/X45hKkTc8gvlb8nxFsk7nhPPejY6eeb8okM0zV3gBLKM2us58vRI50i9ARUIQVFNNU2VK
 7jPyO1uFS7eUIfyGlKLpQ07gezoOGSrqG8nppU/u/336ioVBjRiG3AeGHyvg+L0R3od8U8k3t0A
 vpCG+gRt6CG66ksxu+o1RrOoht8gqjLVvpjrYitdJ+xPE8fhL/n4lrqw7qSS7qn4kEwqmOeuMHL
 aS0U8i1cxcnU7h5r0tn61lCEFta/pPtPjfpfWyEiDFV+ssLU9cw3/g+EzmZ6N8QVox6dzAfL6DL
 n8wfqDkmkSsNAMJrHaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120065

Hi Ruidong,


On 5/6/2026 1:36 PM, Ruidong Tian wrote:
> 
> 
> 在 2026/5/5 20:23, Umang Chheda 写道:
>> The driver unconditionally calls panic() whenever an unrecoverable,
>> uncontainable UE (UET_UC or UET_UEU) is detected. There is no way
>> for the user to suppress this behaviour, which makes it difficult to
>> test UE injection or to run in environments where a kernel panic on
>> every UE is undesirable.
>>
>> Add a module parameter `aest_panic_on_ue` When set to 0 the driver
>> logs the UE and continues instead of panicking.
>>
>> Usage:
>>    # Boot time (kernel cmdline)
>>    aest.aest_panic_on_ue=0
>>
>>    # Runtime
>>    echo 0 > /sys/module/aest/parameters/aest_panic_on_ue
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> 
> Hi Umang,
> 
> Thanks for the patch.
> 
> I understand that this parameter is intended to facilitate UE injection
> testing and to avoid kernel panics in certain environments. However, we
> need to carefully consider the potential risks.
> 
> When a UC (Uncontainable Error) or UEU (Unrecoverable Error) occurs, the
> hardware state may be unpredictable, and data integrity cannot be
> guaranteed. Allowing the system to continue running instead of panicking
> in these scenarios could lead to silent data corruption or other
> unforeseen side effects, which poses a significant risk to system
> stability.
> 
> For the sake of robustness and data safety, I do not believe we should
> expose an interface that allows users to suppress panic on such critical
> errors.
> 
> If the goal is primarily to ease testing, I suggest handling this via
> local driver modifications in your test environment rather than
> upstreaming it as a configurable runtime option.


IMO, it would be useful to have a module parameter for this. In some
cases—outside of test scenarios—it’s necessary to avoid triggering a
kernel panic on UE errors.
Would it make sense to keep the default behavior as panic on UE, while
also providing a module parameter to disable it when needed? This way,
we can preserve the default safety behavior while avoiding the need for
local rebuilds just to change this setting.


Thanks,
Umang


> 
> Best regards,
> Ruidong
> 
>> ---
>>   drivers/ras/aest/aest-core.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
>> index b4f4c975da1d..9ce782a66edf 100644
>> --- a/drivers/ras/aest/aest-core.c
>> +++ b/drivers/ras/aest/aest-core.c
>> @@ -22,6 +22,11 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "AEST: " fmt
>>   +static bool aest_panic_on_ue;
>> +module_param(aest_panic_on_ue, bool, 0644);
>> +MODULE_PARM_DESC(aest_panic_on_ue,
>> +         "Panic on unrecoverable error: 0=off 1=on (default: 1)");
>> +
>>   #ifdef CONFIG_DEBUG_FS
>>   struct dentry *aest_debugfs;
>>   #endif
>> @@ -342,9 +347,11 @@ void aest_proc_record(struct aest_record *record,
>> void *data, bool fake)
>>               aest_record_info(
>>                   record,
>>                   "Simulated error! Skip panic due to fault
>> injection\n");
>> -        else
>> +        else if (aest_panic_on_ue)
>>               aest_panic(record, &regs,
>>                      "AEST: unrecoverable error encountered");
>> +        else
>> +            aest_record_err(record, "UE detected, panic suppressed\n");
>>       }
>>         aest_log(record, &regs);
>>
> 

