Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434123;
	b=RZW8a7A/5Jj9+yd4Y4fx0crvNwVNVpBp5q9+OAZ2Q2eQG4TcAyDDYNsZisQOlSQOH9LA
	 ysiMyeZQyIitE8kDdSqHl8rtmwUD9z3hfmUJTkJHpjGsrVTj6P5aHZAs4kRAMXfKj92K3
	 +buq7qPhHUPcMkTSkSF7cJSKgy4oQzNy4m1O7rcM13QVJuItCN57OdQjENNSiIYVWV1yl
	 waectAmOWOevkCnS3JFk66Ll0TOif/te7yl8sArWleiGOArL9LlIJVCq/NUo1LRVvNe5A
	 P15efBRlwNt7g6adbS2ABl0ccQn74Hk+FWUMkPvGi/Z9XBz8hYMxXXstZWf1jS7SDdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OzM/EG87vKHwQb3clxhLpAhZOOi6NHbejQuRTq00yik=;
	b=XrfvjK0jltUMMpDuWwaigsKiLR40O+wbeVmJxwugreGMMLReJdmiruENC5Pgk6SpYOY9
	 czPelcnVWxiuPCpJb1A+upAyXDeN95oCsm050+AP7GUfq1hcc6uT/Lxn0wtuEEltSW9hv
	 JULipYfg3kJZgF0uU51BmyflOoWt04x+ys+lBNljEqhA0zelVrPrhRHBPCoD3yzondJy8
	 t5wpyOdOlxCtqrIAW/M/+6FJFJ3Z3x+1anTHa7Y9PK2FXKFyMBumbpiHoAJ2nJ8x8qCjY
	 xznwZovl/BnodmqXjozuy8e5sMHFIoRvh77OuzCW1C/Xz5vDoqSGSGHTlr3jlPtaPGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FtpHEkUE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXPYoUh4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C41606A31F
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 18:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C41606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FtpHEkUE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXPYoUh4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFOvZO035943
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 18:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OzM/EG87vKHwQb3clxhLpAhZOOi6NHbejQuRTq00yik=; b=FtpHEkUEYbIV7Ov6
	yArCnhlsnLn8n/AoCj/bcuc+gbW9OavkkIylfb5r95I9LYzxoq3gpRM6XEVWW5Xw
	nAX2V9OxZ9GzlHN3vsfFop0nJwOe/jEXxVSYr9pYMVUa4tSDIUBW2chu2F/kt594
	xxYMnfntZ+bEwLFktpp7WIz79wPVjPh87tRpwzgwc4HHwgCxHuit3s5n8GzmExqC
	gg//XU8uE+hTDxC9tk/BoMZ7LugfOPSC86+vr8gg2cMmLaBUMlrfSYrB6qAEZrU5
	vhdE0IIGdd5pQ2lLkB5Cx2wig0X2k5wFsP0yO8moXWkAzLWXD880fvxzBsmbcyFs
	ZME7iA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47jqjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 18:22:01 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1380383c88.0
        for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 11:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792434121; x=1793038921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OzM/EG87vKHwQb3clxhLpAhZOOi6NHbejQuRTq00yik=;
        b=LXPYoUh4qnQAhZd7PvpJnmfoLnTWLaOSjsDKSI9IlTdq7UlhPCzC1TcXvqFQwA6epy
         lm+hWq3wL9dknAn0L/sFJf8nj1HkB3RUnNfqbMH0DI8wEjDDefnMLaxmIZIFzaN6x3wv
         y5CyHT+AusqJ7Kn668m6acdVYYeB0ZGTrUjQpC42L8+Pj62dBs8IzA56qO9l3UphEL4O
         FXjEoN2B6v44WR4pOHNw1ovjIxGuZtdj4aWPHFrL8UoQeh1/8ho4xEJcaHvzrA/T48H7
         ubmss3c26MSZ4OiKTNzqoDGsfPbx410LB9f1JhFp1J1Fd3A3t0doKV9ewSVKdA75wZkn
         kLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434121; x=1793038921;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzM/EG87vKHwQb3clxhLpAhZOOi6NHbejQuRTq00yik=;
        b=xvhTktJOjQmB4uolo7oiJA8pew6GQv90gxS82lNhn2VSfH520ZGDarLs09BL0Sqng8
         HUfAfnZHs+BpM4e8WmX5HOqMzNlWs0aCP33gqheoprMj3+2pEiZo/O8SOdNa8t3Vwjqq
         niRP2hkSnptiZ5uHYsAESXC+HFf4usorsYLQVQWihynGYxi9UgfZpuJVX6GcubHSM+y0
         aL9Q1jtS0P/9fD1G40cwfNef4PdoiAEzVP3hDClxWCXO/f8DhCgSFTgjXfZAeZwrb9Cc
         Nsmoq1U+PmFyMuKja8lPxi3QkmZ7vHTVhIH168eKDOyZq+2ZpFpByfJ49xzaRzI1y5ql
         7LgA==
X-Forwarded-Encrypted: i=1; AKwUvBzWKB1yJ5c0yNU6fAyEHEBU41G7M5vIbKlow76yYhHkoHZr6pBar7UP/5cS5bCcGIsx2LbNAQ7YOo9E@vger.kernel.org
X-Gm-Message-State: AFq9FYKyaeujIhXdhLLz5D3hQMoksXlsmG86LXcSBvsTYPZDDboPNGs9
	JdPqETVQpxKpHkej+48IYQPfKuCq7sR67bd7XS7oE1aIfRN1bGri9GW5E/80KxlzQPNzhWFdGfn
	fv1D2OybKrZRJl0wIVw3OURpywV3VFP1TdBE/nHORIyBD0L8erQA92w/fpSMWyprE
X-Gm-Gg: AYBFou3fyKcxs9aUjaRp0/j3B1kV6+pW8Ux+EVNJ0NciB0yGbJVDNOQ9HjpjQVejq6U
	xl6ISxr/kBSAfC6kXO9SFL7XaPzIuGX7uLGeS476QIhsgZ3jwcRxUny9TDr0NyR9DneacDQxjAm
	Lk11VCKPDt3mleYTJUeHTbHNie5s4azYiP4oRleaPIdwJ8LXr6LIsO9fFQPmGvyPuFoHi70ZOD/
	sTv4fjbKbB82djcDdsT3Ja7+xuwooORpesAqMGu28+XDgY97v6HIImSKN67W9clgxgY37OMaccS
	4KZBJDdV/C9Lw5TLvKMlMyxSbymkBgeSPCShnuief4UTw4r3bQMTl49KhJIMZHO9DInRlHvWljn
	fmLAGCOent1k/+scLJmB5vHv3esOCSxfLezDBP3UzQg==
X-Received: by 2002:a05:701a:c907:b0:169:3706:d61b with SMTP id a92af1059eb24-18511eb6a06mr12491479c88.16.1792434121247;
        Mon, 19 Oct 2026 11:22:01 -0700 (PDT)
X-Received: by 2002:a05:701a:c907:b0:169:3706:d61b with SMTP id a92af1059eb24-18511eb6a06mr12491430c88.16.1792434120643;
        Mon, 19 Oct 2026 11:22:00 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm31987710c88.1.2026.10.19.11.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:22:00 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:21:55 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Mark
 Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov
 <bp@alien8.de>,
        Hanjun Guo <guohanjun@huawei.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Shuai Xue <xueshuai@linux.alibaba.com>,
        Maciej
 Wieczor-Retman <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M.
 De Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Breno Leitao
 <leitao@debian.org>, Dan Williams <djbw@kernel.org>,
        Terry Bowman
 <terry.bowman@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang
 <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH 3/6] cper: use BIT_ULL() for processor and memory
 validation bits
Message-ID: <20261019112155.00006fb6@oss.qualcomm.com>
In-Reply-To: <20261019145643.1877246-4-pierre.gondois@arm.com>
References: <20261019145643.1877246-1-pierre.gondois@arm.com>
	<20261019145643.1877246-4-pierre.gondois@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3u25cbosiZ5o-4PNe23VdlGddzZgybld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA3MyBTYWx0ZWRfX9hFwQsxW7sjK
 0Akys77nh3MaJEj88edHqDskxO1wQPGCWUgYB4TEuz3wCC4reRAG1Iw5hzBTPriKZjdrDnq6fZK
 qDLkk52CLSdn5eSaDXV3mELMbqo2lUyaA6XGWUXAVHU1NIoNXOLDNARxk0XFyYj0vPeJhTnYilz
 hx4lDw3Cz1kS0t8zVhKWO9DM/YU7j6I9/2sNFET4EEppA1oiRvYDUjaoExhlmxkZ83mpzggph8r
 Fj78VZFnHz+aRjbEeP26hFGlm+RLlixljPXnqnZh0ShRGVlROjMZReoGb/cbcQ48T1oLQ+KWYnt
 Pk7yLOUZhAaZH2PPHwZA+go6+IyLOJ0fJ3YxZvcdrecAT3t2KOaxtECS3NykXa+AMeA8hZvlsaM
 bcWbQnHYml/tflspxiiKABwkvutfBqy+vxxsSmDf6jYpwBjYvKVAXJt2uQ/ijq6Rz+z2FwnnZhy
 3mW+oTo6LowmRTALX0A==
X-Proofpoint-GUID: 3u25cbosiZ5o-4PNe23VdlGddzZgybld
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA3MyBTYWx0ZWRfX5MVmf6xagZTj
 4AwabzwtN27jNc+l1YnPNhON7wlh8IM83fxO9Vyc+BMaH4PsaIxn6ysh1KY+Dmf+GaKsmPpFISF
 xbfarEpxFjIlJTC5cby4kBXHFj7pxKM=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad65fc9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=wDomEPKxsuTd5H5FNvYA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190073

On Mon, 19 Oct 2026 16:56:10 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Use the BIT_ULL() macro to describe flag bits instead of
> hexadecimal values which are harder to read.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
Nice.
I'd do this before the previous patch, but not particularly important.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
