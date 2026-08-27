Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579E22DB7B8
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820154; cv=none; b=FDdVGjHt8RbvGRNDoT8Jgw9q5lxFmuvS1iCYZoTFAUYPuOXgXc9K3BsR4utF6uBd/mLa7NgI2cW4i9mkde6pHvhfocN5DiJy/TvvsfL3/wlM9n2N8mGJojxQycCaFbZ4qwg/CqSpAwAbVFC6ai/KIP1kr1XPNralgDTES51FqG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820154; c=relaxed/simple;
	bh=mksnwuft8hGjdZENCJxZySBx10tPalbzM8mi3uDVw5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdHviFRFhyE0ISxOIpd2fLjyVAJGu/JmntH5QFkFcwBMxTxh06oFzUXCSdb8zPHnjNUlxksWO4mbEt+enrJZCF5vy+0fVrkKrUOpswzfUj5Wx2j4sM3oJKOJHMy1ceqW8qxR1aULPII7v4RTLYErscSLMbj+TrVsAWxqXyEnZhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCqXnufV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUUiX8YZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCqXnufV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUUiX8YZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6R6s62074671
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTOp0U6hBPBLp7IWusXAj3yNaChjytvOMMoMQ0I0hhg=; b=kCqXnufVK1shlEJ4
	5UPS+/H239/KEj1HJfFerfxh0oBobJkWDz0FkVGdfTr6VrF/whboY68byyJbZeV0
	cdQD7aoPm8TbkMKrxiFfIj6mRqkT0GraTI/go4xoahp1kW23UVXvEcXN0vGXPXnJ
	NFQ8IqksMC+uXLNbcky9WgpR4IuGk087/1gKCK4U66G8/J4g6msD00gOcEiI+U77
	vvgcShJ9xcm1bCKyYU2hRNxxu1xIQgRNgRxfwhFzruqvTrmgJHxczKd/SukPSnan
	yaGewgvhkRaHLvOI3F8m+tonZjRaVX7dV6kgXBikDSfJQBGKv1FGcshvSh5clLMj
	CoAYHg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaa3bhnx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:42:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52f64c48bf2so18148761cf.0
        for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 01:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787820151; x=1788424951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eTOp0U6hBPBLp7IWusXAj3yNaChjytvOMMoMQ0I0hhg=;
        b=XUUiX8YZiXpM5aZfAfoVGkCr7gc76m9K28g0MOjZsIxuVr+hMjECLpcrMPdURgbvp5
         ukFiJ4hCYGWstJf+O2gHMBnQmnARqbMH1tsOV5X0UZYFO00cYGNkY9pmwHxHphcUxM/x
         JLhDNUnuHepRYDctUNa4zwW02+6OhTedkC45hilhKaPhahIkohqnR037RiqNs9dbNIIC
         Qs7fcxuuuTMcvrIKsexYieigoXXsaeh1XOzofaNgy3bOqvjkUZSVDVlO8kJ2tjNJSSk9
         xlS5NBxHp0NwU+inlZF8Zm6iAJeDkcrOvbgwuGblUIrumFEBstQ/zTW+IHPZmB25Xwds
         ZVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820151; x=1788424951;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTOp0U6hBPBLp7IWusXAj3yNaChjytvOMMoMQ0I0hhg=;
        b=EYoQExs8/2EsLeJlyScwVQuyaz8hk0UaI9eNe+msbBPxZg3vmYMKj9fnkGSwnyckpU
         uCq7cNqKZWrIMhvVQXJ3x588wProUcX/Oxd5QmK/lVuMkOjq0ftqAZACnJPvMEyUWuOm
         dq43vl8CUyPYYm0JfuV7u84nD8tVZFMtx89zQ11QqvW5uEl+NbjSg8qHxSuI6R1pHB6A
         xvVXADExUr+YfsLyxEVzZQBe4Zc2XGogEQLTyoMy8zm8gqcrdvZ9v8TeFVvV87f6fuJJ
         STBDnjdg84VXcSdeIyv+S6IJB+TtQKNRM67xxUHbVixxqQD+6/L90gazsja+W4OH3TGO
         LoWQ==
X-Forwarded-Encrypted: i=1; AHgh+RovysqBlXI1c3oCVEz20+iRGNOVJ/X+kYrrtjWtsIk0eg5oMeElprtq6lgtsTkLychueuw8+/7LJquu@vger.kernel.org
X-Gm-Message-State: AFuF++kN+fRFDw9pu2ve4mNfrsmDrVKo+KrRao6CqTYA1U88QwLnpPSE
	bzmw2AOroKLiqoe9qYc11bCOBl8TqfC9IdOWMU261ykmEjLh87SmaN7OP2j8MXtuG6xRMI+ImYN
	0L8qpjlMGDq1bah6duKRckVeqRBfiJOSMWJ58Vcpi/W+MlNZSHTuZa4npatLccaz9
X-Gm-Gg: AR+sD117WQ/W4mXUT7ECMDB01WDH83CCFTpW000+BA61DYyI5pNeyul8O+nfyh4m0pX
	QG7JGqVXHim50IOAm3Gg51dDuQD3tqgfNodrLWO+y+RLJgcnno8IwWBg/4BGmmr9SlS5Im0YoEy
	ydzbJ9k71L1cAf0v5kT0zXaWh9eMflacxYz+fjCS1NsMSpTvckCW0HewXWsWE3PKNCDRB4GSIGC
	0jAl1ti8kEMRhLMDoOVYAH6Ppj1NxzYJ6IGtuhbSJtzgVeey1fap0mUy35VhCRX1MG9V5N57Aub
	byaYYgeZzChPoXUzgjzxb/GLk0i2IE9or0iXidjir9HAqiachotxKxs0XxpLh3f4nOw7Wg/YSDi
	2AbOmMzcwjxZug1e0qAPgOGesOLN+nZEUs2MMbV42Uy6wCiNL
X-Received: by 2002:ac8:6107:0:b0:52e:2906:9124 with SMTP id d75a77b69052e-52e420a0859mr147672141cf.0.1787820151499;
        Thu, 27 Aug 2026 01:42:31 -0700 (PDT)
X-Received: by 2002:ac8:6107:0:b0:52e:2906:9124 with SMTP id d75a77b69052e-52e420a0859mr147671551cf.0.1787820151047;
        Thu, 27 Aug 2026 01:42:31 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4942366asm32395695e9.3.2026.08.27.01.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:42:30 -0700 (PDT)
Message-ID: <3e222ce2-9e3e-4dfd-918a-37a03aced152@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:42:22 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 39/43] qapi: convert trivial intro sections for
 qom.json
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
 <20260826193840.2152000-40-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826193840.2152000-40-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfX2c5rP/MO2UkI
 un5kwLOzrUuEowz93aNQ0jZuNLt+RolNpbfE2IyDnCARe3pU8sNVfygyXKovj18lIoE/2OJeTZF
 88FfkDCc8KIdgJ2k+NkHOkKoCEeqgaUwKghkEjJ3QI21EJaypEHad8EfMp0NvbHEpik+GG2BgF3
 IcWFGdIzGoChR1jEfxhut+8UyyLEz34Znaba7rkoPercwJgXqAy6ELGUoN9MhMHzQWVe4AYhxf5
 A51uTG1sdLMoY5+AhVPKzoLaX3Pm3lD30swXZ9bN3dnsGlJFRRAmqvRq1RqbxoT5+cw2H7VQPji
 gRuGFHwDFr21kwev2v6zN7ycaNKY0x8VYzypUjgWwqe3qMVSBCgqVnqqHZTgf/0nHZGFjfE/5LU
 LHn5IGV+zN1v181Jhqd7MY5TL/MERF6CIrpmUw4r+Nqg+FyU5vaez/9HjJV/ENCRTi7oVmLf5uZ
 Gi+klKWe8nvkgCXCn6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfX+6so64TIOv//
 AYOfNxvmRhF6/3NDs8kpee4jqUi00THVO90pSX36Vik/FCFi5R39y3BzQJXeHWDbVkIXxdNQAok
 mxVdPhiR7j0qLqymbLq9gYDsc0G+etg=
X-Proofpoint-ORIG-GUID: OiZ61Rn6PwMVWsncClwQhcapCDz7iHkU
X-Proofpoint-GUID: OiZ61Rn6PwMVWsncClwQhcapCDz7iHkU
X-Authority-Analysis: v=2.4 cv=KbfidwYD c=1 sm=1 tr=0 ts=6a8ff878 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UFf3ptpOQOAA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270071

On 26/8/26 21:38, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   qapi/qom.json | 150 +++++++++++++++++---------------------------------
>   1 file changed, 51 insertions(+), 99 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
