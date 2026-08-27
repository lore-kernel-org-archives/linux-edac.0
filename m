Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909113EDAAE
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820044; cv=none; b=Unm5zQYj7tca7HXMR9LT4lSX0GaKrByOjky4024//AAKcez10+lN0YHdjsBc4N7Z+Xw3XmPTdrFl4487M88YL2nBFAzLOmNFDrBQC1YOabnHLY1xbjYbiJr2Kn/u1b6TljPJjbVK2KS81D6fY9V2S60HAcRX4g6T+LGQFy9P1N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820044; c=relaxed/simple;
	bh=IWQCMpgH0UqwOxmmLqdCAD8aNqh44/YZVGmCR+0vHOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chJi8dHjxFXNyA7IxJKOl9oxquitrpuZ/V27wJayRgU6i+u8lAquIXezbG1GoBuJbAbbuz0ZDeglxQb3UiztY0Lfmk3L68PIBPLYhLrQJwNYumLf29zzpii7h07Wi9yrBfg6TjW7qFt1ZY7IQSG/Ecefjok5G2pK+zzZKDE3oyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUs4rwdi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjjBYA6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUs4rwdi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QjjBYA6/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6R5ll2143796
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQ50trFlPo5d532JdYVenY8HaFTmYzIbecwPOKivr/U=; b=IUs4rwdim/Mea8RA
	SzmrAM2qg09ynuk0KJGhht84Qgasz1eMrZkTPTIhpc6GuIToUs1k1WqPVHTxbkpC
	dngq8rn4zGlFI194CaK/rjItk/wN0JrqY8XrkNtb0ySr4yIxGdt8HCXf7gP7XSMB
	c7VqOrPISlcHMM5W0LUNvw2Zn0TsEfQlU0qallQTlktxdh4z4GxJdifkub/HgMl7
	ekeUCEu6qblZEVHvzmN0VQ30cuIiZFR+W9pDlvTAbzw0guSwn8FMbTE9fFa1fLbZ
	hZDYsX5t+/9Z0nQlSttF/gss8gmjdJ/metK32FMJm8e+64Lz9ykaTdXC4rHRJl0N
	2f1NCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t1geb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 08:40:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52827090cc5so8494321cf.0
        for <linux-edac@vger.kernel.org>; Thu, 27 Aug 2026 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787820039; x=1788424839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQ50trFlPo5d532JdYVenY8HaFTmYzIbecwPOKivr/U=;
        b=QjjBYA6/XEh2eO4njhzWImvvhb3XshBeF5B9Ker9hyj3rFUkMM2qnXemMbB9W5pra1
         GY4syaYzEkPKeZz75t3qIuWfa0g4336t5v4NNYPjzkSXAHrfCBsq/SNwsBqmZZ3Ffsdj
         2ClNp/np6Ed/oe0M6BiwGvuvYinLTKhuNEG42WiN0twwNQ5IIw4bJkuxwphDN3pZq+rC
         CHh6q96qYJV03lILQs8EkM4TrCyg0SBZ3pvlfGTpIEhKtdCDL5zxFXFmqMZ5AUbWtqTn
         z4mjY71ywp1CFmWcgnVDjzMV7mebnMcj2zPvcIMGgaGHmZ5wOCIR3PafT6+odYxr7+Cg
         pJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820039; x=1788424839;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQ50trFlPo5d532JdYVenY8HaFTmYzIbecwPOKivr/U=;
        b=QlQaNuFM98yaDY42GXDOtlQOMSc5DwwE8OpBGNM7Iz7snkbGpW+N4RpOHZbg6uwMl2
         3TBDicxSa4xU1Hk5PjuB9vU9vaUdiEazvCXpLv2LCwHgiyHLenU5+WhwqQo7In7VuR8K
         aY8gFy3rmYUBp2YBAK5RWvunW2bm7Km+EY1SJGMlDFL5BSFMwxx1RDmbscTbRZwuTUqL
         0si0t4Jt4L9XJ71ObbUYFtScZtob1eQLEsex6WdDyXuhP4O4o01G8JNVRCId6Cb5k6Oq
         9Ow+Ee+LXK2TJMX6UEOb9MMrPPsDDB+yK3Sk/y7iPggZnszHKfXp0x0N9zvqV5agHEyw
         XG3A==
X-Forwarded-Encrypted: i=1; AHgh+RpFoCY9SGO5HLzIJ+shYtY9DdubUW1hz95ahMeE7EHJyM2qfjyAlsyfE1W2lX9L+YKJpUNKo/3hVmIe@vger.kernel.org
X-Gm-Message-State: AFuF++lSK/OcMOb/piM3y4owYTh8eUksNI/BS7VvVos5jwFDxHNcwLlF
	Hjnd8MSHzanQ+EhD6hDOk7cSsw4NRHC/6fgHHAL2PHnKB1Sx+FeU4m2UWII7NtXFO5kyGNIq9hr
	U2OnKqxlpkHWq52yvnvzGAm2JDjmYJc5SCoJmWdyPYqSl4gfmjz8b28XzQP2Z9v/j
X-Gm-Gg: AR+sD12BgTVd9dWXDfCJkKsZTGGhxLYRhYsq8BQ6Ki+/Q3hQMEjO2PKA99RdW958Cti
	a0vW9AfqU86P1Sl8Ih4JdH9aZ9rKy4xqlT+EAaNcAH15kROaTJZuIAihUbwdGMKCVzoWUFDY+yB
	QP1jHxvCKpA4Se8YGtmaK1FlOIaqVFJ8ucXj82vnMXmJ9oFrZwwlHDpiTRhVN+GLczgHYLddpM8
	DSWGPANlRnYQcsUnJT+ZAUkoGKO84QUp/4k4lkocSdneA8ANlPfnr+MQ6CL/FfUzcRyoDJVY59r
	Nxk5gxlf7vSUuKzL5C+XcHZliJE2IUstyjVBXfxBeQyX3cCdd7qTuiDOXDdukZe+9PUbKyf3sCy
	i9NsLzAlR1Xnn7xz7yDqHL9ip1IfKRyJ238CIq93JLOrlUOCh
X-Received: by 2002:ac8:5950:0:b0:51b:fcc1:a0b7 with SMTP id d75a77b69052e-52fa1a99ecfmr41469191cf.8.1787820038718;
        Thu, 27 Aug 2026 01:40:38 -0700 (PDT)
X-Received: by 2002:ac8:5950:0:b0:51b:fcc1:a0b7 with SMTP id d75a77b69052e-52fa1a99ecfmr41468881cf.8.1787820038289;
        Thu, 27 Aug 2026 01:40:38 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dc0d6sm7964052f8f.18.2026.08.27.01.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:40:37 -0700 (PDT)
Message-ID: <b62f7ab6-80d5-4e2d-b253-db6c1b5758b4@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:40:30 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/43] qapi: convert trivial intro sections for
 pci.json
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
 <20260826193840.2152000-26-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826193840.2152000-26-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a8ff807 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UFf3ptpOQOAA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ahW2n7ZRPIRnSrou2zmy7jAAmc0w10QI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfX+cxjTwMfzfEj
 yXX0q+jYdk+ps+gkyV33dNr8sJslrFJdBHNb+fjoY5BBFm2dOx9Hpfv4F9gKA8Rt8sRzJ4pOVAm
 6qfOmiYSO8ebivyWk0hMb90aQIon7cA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfX+hmMweoR3e0i
 12FanPSqKSCW9Ea0IvHtdft1EeERvSDoLVbOLERJytu7r9GS/XiuuPcVDcjUrrOwOcY/N/uhZk4
 LdLybugPZbpJTjoHjSBowEDXUsTum9u2VkbRkYZQjJ3Vxs3xUjYh+G/vrh1cQRz05V/WFYgUMKD
 mkZxuvHsteZEfGiOPdqPLGos2wcNpbXctDnnwDJS5OVvkKm2UtQEmfsAOJw4Ve6y7gBDexszvx5
 65UCK+FXkoOc5iDllVkBr4ulRkSuwYRGdORyPAunJOvEVI0xXxkSY0y5vmKzFSNOsdGC3dS+aYq
 A3QNP7+Nwf2hNrzEAVOAP+p810X/afBZ3qKhBwKsO74V1cEtJ3gZTyAHo5D+Sha4vAtW5pUOt/x
 SoqCCHO8QVXYeGVw+Cblw6Xs3KUM8NsnUiBTqrQR+ll6/g6yETRTR78f7oZ8ZcMfHJnMG8bct6W
 voaXK5NKhgttB0S7MZw==
X-Proofpoint-GUID: ahW2n7ZRPIRnSrou2zmy7jAAmc0w10QI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270070

On 26/8/26 21:38, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   qapi/pci.json | 27 +++++++++------------------
>   1 file changed, 9 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
