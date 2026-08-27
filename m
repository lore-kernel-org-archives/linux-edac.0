Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7125C361978
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819997; cv=none; b=NvH6OMkEKl+MACTzdg++oGWMKKl5EmpA4I9lCIOfpxy/LUhC1K5xXjwAERCvLTP/wkWsThIdCNXV2RUZzSkV9+8+Y683EXlQMX1ESRpFZiaEO/TUzab6JlRZha82NM1YyF0SA3di6zfTxqsWa2TwJT6aIGHKKWX7B9Gp/Vym/VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819997; c=relaxed/simple;
	bh=yKufXW8Y2WKIhyUCaguLHlxvC9xcvQmdQUNu8RVmeFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqKhPxYCCzU8IumiJt6zohFyAUvs4mYZi4vZOa5e1qxUUzUQyEkGbfEsW51+geVSXB/76MRwn6VNodaQGLoMzI4vCz3MtQFc6EG+Qm7UWijUAxCnuhMFHXuhwmRjrI+xOOLuvl6fNIuigPUbwU6krTYQ0J8wf1gAJXkrT202kP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofVBmW/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y83fUDnE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofVBmW/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y83fUDnE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6RG9s088070
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PAuNdE0+RvBG45FZpe+6E4vVKW9lRTIG1OGafBpzdQA=; b=ofVBmW/867PwielI
	nbOAZqjD4ymUJPkTuWNRiPIpJuLCeOGVsxeqyk/Xsu3xPvLd54HU61R3NWZRqRSI
	P5gUCEUwAT2eZie+nZ8bfADEWMJ26DD7P5GxNAZeCGMA9fNoTrmunTcRYZ82QURo
	Xu8uuFBl4vINGokZcCtkukOGRQychUsla+UTzJNK5AbU0f9fPMNg+RxnoWn1JZ68
	qROB2rJ8Gk2s5R56uvH9K3GmnafBf7pbDut8fcjvl2JiQwRtIya5+C4pLJTuqRkw
	PGb/0V8IWcMWeaJMbbQ/qIX96aii4B/DnF6y3hBEGf3eN5K+o1IxKSbe5XBaKI0C
	41fNBA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5hv3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:39:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52f64c48bf2so18126531cf.0
        for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 01:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787819995; x=1788424795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PAuNdE0+RvBG45FZpe+6E4vVKW9lRTIG1OGafBpzdQA=;
        b=Y83fUDnEFGORHAP6DU0/I4El1L1xgC3OQneRwR9X36KHBoXjfQdN1GNhE/eEBkG0XH
         F+NbPBD8mnfFsSizs2MB9XdIWBZxUf8bWsEwr4XvN887zbf6lEAH5qXnzJIlQGfkWqgi
         6FxIRCy+0aUWsd4CwAolkE7vu8ORrtm+x56GDcReZOY59+HwC7yW2DYe4f4KX/uWykUM
         L0bTh8b0FqoeCnivRe8gswGaJWICWNgID5AsrIgiMgKJumHz5xkVc2sb/i91ZtjntN2e
         qozxPv3La//jvA0snGcZMw7kcXEzq2529uS+WP09xUV61qkEVFwVeWWW7xyK6BYkfYn3
         k5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819995; x=1788424795;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PAuNdE0+RvBG45FZpe+6E4vVKW9lRTIG1OGafBpzdQA=;
        b=IAQng2t+QXTQvt/g8OliJVjU/1cCRM4IPaf7L4GpXwlZU1q/zUmSy9nGdLUo7r7ejG
         cKNAFw3enELSi42hoLWoVez85qp4xe0267gTkjhsWe1brG8Ti71MTkBalh0PKGIKIzf4
         1q/9ZjNRfwig/DBfaqgb4afsxCY5sFigiE2FFpOqkED/o9IzYddf4vFWY64bDxLZPvsq
         ADN1J4Urqhpmcv4lDq2SntYSIHWCml0uiyWLsFi43BA1B1YyH3mMt3fYcvo1V4jJYhwf
         jDpXE0QL9OJOM44mxIKXmIvv4yH4NiooaKjn93ugxxIOodRF5Dmid60WbnJedJG3D71Q
         AvfQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro23jTH45Ro6vDgLVOGcSNutDnl/5sAmfqUkpA5kpSov40+j9fkTpeatWa7PJXiCZ6P4z2lIl6pbfJY@vger.kernel.org
X-Gm-Message-State: AFuF++lMBFctvZwS6KgbOU4LOg1QdawHo0K7KplLG4IogNFgFS003Q0c
	nQ+huSebcpkY7D9gYq5pCbMuo3k0xoRwo/xmYmZEgpu2wSV96I90AyroRsJ91QK2P/ph4NNY1M/
	GbRmOILPTZ4a7M949C6WMKG25X45DS+tq20QKMtHsdRGBW9tjcWAuFMNya35+3rP0
X-Gm-Gg: AR+sD13JmlULkUHxjrRyw7yk6md0gL+n7pUsmq3K/7wmkoNX64hfgH8rirzYIhX9MKp
	6/QD2QigEXW1fQxUgCUuaWYKinTuxJDFr18dZQO4XRRyYqKl/GMYxhg+kfSeyypgE5HTjC6e6Kh
	PHGQlNKCyg8AuQTbE70Zw1DQfOdf/0oW8ioGR96Ob4qQAjo7/mW11ALtr3tDYzMLh4gg7PVCOl2
	Mf7qaO4g4EfgX72RXrK2It+CocuqEUTchUAcZoLdRNl/ORD9UYybB/yRKBqLOxDphf8+5ss+LWH
	bynij2oWhTrIWbtqTL3dd40aip59ajy3L6O7o1UYB7kD9ob+pIOFpZkIPSv6Kk/4InvtMuQ1pMe
	aImpasx9GuP1u785uVYMge67RdibpuaMnzzdkBJz6gBsVG4To
X-Received: by 2002:a05:622a:1b86:b0:51c:fc4:a144 with SMTP id d75a77b69052e-52e4228ddf0mr128989681cf.4.1787819994651;
        Thu, 27 Aug 2026 01:39:54 -0700 (PDT)
X-Received: by 2002:a05:622a:1b86:b0:51c:fc4:a144 with SMTP id d75a77b69052e-52e4228ddf0mr128989271cf.4.1787819994192;
        Thu, 27 Aug 2026 01:39:54 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279e391sm7271138f8f.2.2026.08.27.01.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:39:53 -0700 (PDT)
Message-ID: <83b91fb7-8ca9-455a-8969-4693a4fe273b@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:39:44 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/43] qapi: convert trivial intro sections for
 qdev.json
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
 <20260826193840.2152000-18-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826193840.2152000-18-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VgT4o1w1cPS5dJVdL9Dd-h7BEEVNe__E
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfXxnB428kvyQLd
 1khFyfyhJcyWLIzkR6JTAuGS7nmjElBGKgqKB1U/yFtjfJEHDnExf4j1pzHNiDUBLUlP7Kcj2C9
 7UqdXv/5AJeBu7SOJUdGXYsq6XpQ430=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfX/NT0kslIMUYD
 Eh6I4IILuByRCP0G1lzi8TqZmmtsKsVB8oETDMkeWWBf/t8a8VGcX4S/XR0gqJF4l+/qP/Cw8zG
 6bH0Dm2fiSL88hKePTyR3OKrOjIQDIVk4IssuTy4dK8jSx8xmxfPRporuCZEh2kiRV9OFqMeBGh
 nuZuBfPumfN9GwdJnJw8S4vX8VFs+wakAcAdGKiBMO0LDwdA59AuAKULegQIPsMRtGOs4GJoOSw
 kW387z1EN4d20/mxm2L9aKLjDV1NTSh/zhZrrvQWEhR+VKtlqkZBTg9aT9tc4eR05mWkX/qR1te
 /vJ969w3sgAB9DkytmQuxAf3a8alpppo/NljW+IqQqslnfPMPfdpVnh1hM0+dpn2LbobY9gSkXP
 Sk26dDQJ0f15tJB27JqOilfd4W8IzwMNWD271xACgEZXJgZJ8q+YoXFyCAtUCbRqJjsovGhFM67
 QyImRe5WkO1lnmaZDgQ==
X-Proofpoint-GUID: VgT4o1w1cPS5dJVdL9Dd-h7BEEVNe__E
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a8ff7db cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UFf3ptpOQOAA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270070

On 26/8/26 21:38, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   qapi/qdev.json | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
