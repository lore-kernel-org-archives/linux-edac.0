Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6686E314D34
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820102; cv=none; b=aLh6RiOhydioVOLPDSRJc+QBecUhnw92ue4M5XRxQOXy1m4SR16WZgXQhvdYAwXqVZ84NeBbE3YG3ao9er1VN+IMF1rpfT7uQ4uIYRbWtp8UPjzKXAOWqMao/pco80forjIJvEUncAky1tRVp3m/s4SSxpB8XHacxGI80EALHxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820102; c=relaxed/simple;
	bh=PLoXoimKGN3Mf1qZO17rEUOfZ/uvFPem6U7WY3xXkSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imNKc35yGtN+x2E1oq0//gnN5vwDSL+kCKDPg2li1UX6mQgB3qSKTNS+/Cf9y5DnvBRNDYS/eCDTgRqd1nLBU56Z+HIpLXinMt5ty8oCHs0mKp6m8zG56m6ShQmWXg3qAUgw2vUf1oxkWgPM3fT+JVZwfoUCP+w5gW4OwSdk9so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J55oBVw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBDC5Q7i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J55oBVw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBDC5Q7i"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R76fIj3226513
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmOBVBiGsHolNU8PiQp4XF/NOueJObjNbn6UN13+F2g=; b=J55oBVw/f35P30EL
	IC+gIz26L1ZloGtBz+LikeppJmtlnBeFHIVmTX7OqeX7oVs7+EavvEhRD+7EoiKB
	YxYBxrgxeF5bcAET5foJEf6+9z2+u0oRTUkjWVf2nm0Cjfz7daYiEgjoME5VoCzA
	riNRXYxQ/RW5lLj1iY57mfJWbF6Jsivz2NA9BI0AYu0Yaygn2mUsP2Gxd+ZtJ/K+
	JGo2nFl/SRmp4P7fMSKDcB+G1ehtaKU0ndRoAjo0T0ch71GajPNlCOqnPfJ6rNfu
	XA/hRGdPW9UkhctDS7OTrKcmS/V49GzAbws4bdBTDczcrYiFbvgPZi9l6EGa6o43
	Vz92kg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjfrc8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:41:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so24359771cf.3
        for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 01:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787820099; x=1788424899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmOBVBiGsHolNU8PiQp4XF/NOueJObjNbn6UN13+F2g=;
        b=NBDC5Q7iUwPilEaFAugb1oN3S7IhJy6WKzqP+ONWVAx9sB6FghelM8hgSs8xlzaejW
         HPRuOXhLDOGj9nV2D6LoU2vgFkIz7VHfYeqOCPl6ky39hI/bwUsIR5UU6YDIsi4e5lVk
         zHdZ2WGmt4qN4vGMz7IUJj5Y7gyVekkmW+lml/wxi7yQFciF4CBdNZ+TbTvIFc4qnA4O
         13EDcypyYPyuMjDdBrNjllWMttETFDvprGF3pK37nI6UPv188VekgXMUgXRZIH7NTlLq
         Tmi8rJTHjwfp364UWym+m1ukgUMO92oS7umc9+1acGRs2qnWgCTyUvI6O71q3HH0Lvd0
         YPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820099; x=1788424899;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmOBVBiGsHolNU8PiQp4XF/NOueJObjNbn6UN13+F2g=;
        b=I0ImEq4jrwMznVu9KtUlNe9+pu7StoECzDqjWEeyc3vGh0HwnANBJH8iELPpENKj2q
         qjfDsnScGlq1KWLYCUeauRWEEpCWTh0C4Pyolqw28Bngt2JGM60s98s1dnCjdAPRBFai
         oF2DfvLLEoPhhhidJFBmhr+5XgIzCqya7iMSOgGwfpXLx7qZEx+Bm+cgBkbYgD4EZr3x
         qU1Iis0vbH+lpzDpitkJtom1HsgeaValhOsySFpFjDjYkLWOugpmOjtLV+aMgC2yAD34
         GRvnbS+EIwLmGF/L5FqtaBANaGxihYifAxjxCWeQl7bgDNTNXodN6IYfoFJXGO0PYHV1
         4/cw==
X-Forwarded-Encrypted: i=1; AHgh+RqC42HmTjdln7fctwSRgji/k1Nd3uFuaZVxtBn13Bj7gccyOsDIwkaMT+WeAW9k8b+Sbafpcxc0V4oO@vger.kernel.org
X-Gm-Message-State: AFuF++nLjLVatQroWRsBJJ7INrQTWl0NsNn1/odi/ZsS/hyd8sFGdEWM
	nXDr2Dd9ZJoOOPBjppv5d/jbKuWmJN+o8hyUWdlT2Aa3AnR0ajtDkLrw1NOYYiiMz7chwaOWJwh
	p0UO2M0Y8U2qmgCwE4H7DmHH2Ppmi1JMnblylX5WiDqJNHUtj0G6Rj/rDp8mYSEtn
X-Gm-Gg: AR+sD12ykh2Lqj8naEOtNO4SvgG1kDArbOp6JyKuUy0K7isiTirDuZP36x9LJxzlENy
	BgD1fAJSeGlTz5Ud23riNeRd3KfAZc84bHwLOvbcclPPjE/Eh9ztX1uA6zCq3sXy/oUc2IBMy4P
	4NLjkF1wHtsPPu7vKZ+Oy6jDY+lWOJpPx4WcflEEPzxXuvCGd1KnfaUvRQKX+wyEE2Cz4IMTta9
	kxZmtK6rk0qHMrvzU7zIjzS4HFffWAMBaF8TnEiGoAHp71v7i1vKbJdUGIiY5GFX5+tpNMTdz8R
	ADmTxoSsJdKWHw4NYSQZ391osUw5nLDbylZRb+8h60i9Cq58WvpE02n9Eib3qDpN98wBdn1d92q
	wgvkdN6ZMs9gsFA3+HBTb1kBP7t6Z+bv8PA7BlbbPFM8M4K2c
X-Received: by 2002:a05:622a:1914:b0:51c:22c5:daee with SMTP id d75a77b69052e-52e4234e4c1mr140036771cf.29.1787820099516;
        Thu, 27 Aug 2026 01:41:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1914:b0:51c:22c5:daee with SMTP id d75a77b69052e-52e4234e4c1mr140036341cf.29.1787820099116;
        Thu, 27 Aug 2026 01:41:39 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49610170sm83255455e9.6.2026.08.27.01.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:41:38 -0700 (PDT)
Message-ID: <693accd8-abe2-4cde-ba61-0a33adb4c7ff@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:41:29 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 35/43] qapi: convert trivial intro sections for
 run-state.json
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex@shazbot.org>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        linux-cxl@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
        Michael Tokarev <mjt@tls.msk.ru>,
        Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
        Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
        =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        zhenwei pi <zhenwei.pi@linux.dev>, qemu-trivial@nongnu.org,
        Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
        Laurent Vivier <laurent@vivier.eu>, Jiri Pirko <jiri@resnulli.us>,
        qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>, linux-edac@vger.kernel.org,
        "Gonglei (Arei)" <arei.gonglei@huawei.com>,
        Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
        Jonathan Cameron <jic23@kernel.org>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Zhao Liu <zhao1.liu@intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
        Lukas Straub <lukasstraub2@web.de>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>
References: <20260826193840.2152000-1-jsnow@redhat.com>
 <20260826193840.2152000-36-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826193840.2152000-36-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: l8NngYy701-zvuGCh1boA6ArwtiWp-OU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfX1QwmiFv0UUFE
 +Xuwi60F2dBbV2LrcHJiM7Vonq6CCkK6sZ9/ivJ0crSHWgRiow0Bz5JjmuJNPqlWn/mOUcGO8hG
 v8lVh8FqU7/s/nD4nvd/9/FZdWbSpUlF1pJTEMxpeBzVAUnUBuuOAKXIzwqLZRgSYm8bqpTwXiX
 ZzsRKKlk+FOxLgnmPDyban2+I+8FAgCfmc+0TbhyWS2SbDDEjPKN49/8kOBQejsI5Fns4d+CKRC
 uO1dNasGsJNg/PEYp+aC4FAxq64Cv3gUYGL86/kksEaAZnBNTTDm26D5l7DegN2D86jYynJmXpF
 L6UdvBWszTLCVuvSljWlyUbPpDj28QZPOdqNchXcM6+Obsr7aocNlYw41z+snWxEO/zvGJ/km7a
 Luax+KyFzVV37e4Y7srFRpBc73NTf6b9ySBAp1NQJE30fjMkRNxpjG5vcdEbkJZxIcFE7hsxy+8
 fx8FsJwyKSmSLS5Y8tQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfX1Hof4YAcFkvJ
 g18FtQcdo/SiPDF6UsdWBpAVCRInJmC53DEWdEPxxNp3WDPVNi88RkhzDLsXkopnVKH2+Bq/hQd
 blfWGuO7SZlZoLr2LT7nhEvUpk1amRg=
X-Proofpoint-GUID: l8NngYy701-zvuGCh1boA6ArwtiWp-OU
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a8ff844 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UFf3ptpOQOAA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270070

On 26/8/26 21:38, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   qapi/run-state.json | 113 ++++++++++++++++----------------------------
>   1 file changed, 42 insertions(+), 71 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
