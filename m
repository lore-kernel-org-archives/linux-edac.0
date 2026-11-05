Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901597;
	b=MWz2U56aOahmQOzFK6sGMK6TzR1yjiUt6IWGYlyf7XTcVG4VSQoJ59r+A06eYlExcfXs
	 PzmZ8qCJbXMpjSJiumCKncAp/zAIlM/73jOxCd5SRDXiu0idgvyx+mwbz3CoserUcN0Y4
	 mr8y0FO1NfJBFUlmalznK++SlJkn/E3zMxYrgy9Rv+00vvIkH/UnSMe2tSHsADdJs4UZt
	 ResLnkn8ObGMCwTUvA5z/GoZ1UCtkxaul7A4GTADx6xcj5p/0vojo7AAzX7+jaKZXtwl3
	 HydLACbCfpKt92sDQ0AdKKovOpAxZId/le3jGq/Shta/KXR9xJkPmJmjxFuBRJxXQ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=;
	b=cxEsbYY2zeCuAbPMm7vAb5Sjya3BujP5Ov575K0bgv0lBCVukQsB5vYt4u73k58Pd+LY
	 iSign0oWcAygL69yLBUitQXZfLpCsz3zxGzUkZFgUAu0fd7g4mPARkQj+rg3tobtgAXrM
	 licLn9z/Jn65iR52KQx76MtnCN07tPav9GZ10dajRef2UaUW9NWRTyD9dd8oAjZOGKXSK
	 EEjSBFr+kNCNwt96rjE1jkOMAz2IQlayh5bcAbPAmaeYQytJa/Au4ESFE8A1NnScVUftB
	 4azpSKy6rHw0GF1yjRgqYuBbSOp+n8f32/hEdUDQswQjAxWCg/63hzyyhmsDorqurYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l14XjqE4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ay1ovo8x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF48606D81E
	for <linux-edac@vger.kernel.org>; Thu,  5 Nov 2026 17:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF48606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l14XjqE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ay1ovo8x
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeQr54075336
	for <linux-edac@vger.kernel.org>; Thu, 5 Nov 2026 17:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=; b=l14XjqE4iAeaylTw
	udgrt5Fz/NBNSZujhmgBHfQbVeUdVAnfcdzy+5JxCYMrm8RwQiUY4dvtYrvyPFNE
	O+7HSqjZCGjLWJz0keLVrobm+Pig1cRLkWSZ494lXWuJ26XaPzR12dIdmaI3P3Qz
	/Sfuqnc2UoIs8f0s8NRrDvr7t6BEWqaLstla7bVvVVohMCxMa9bmEDKZbqSQTO6u
	Rk67HNB+/VS7G7eobiJHoZAEg32daNlxHV2zNnBOZRXrspsOLFr9ooaBn1snM9DV
	Lw/gFGIkrAB91na7p6PrgBoyMjY3yXD5RzOgm+aSxmZscf1phwp8jjMG6Yd1O9uc
	IEnxxg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdsunf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Thu, 05 Nov 2026 17:59:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so928087eec.1
        for <linux-edac@vger.kernel.org>; Thu, 05 Nov 2026 09:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793901595; x=1794506395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=;
        b=Ay1ovo8xKUgAm19fvObEyGvk615xuQ9WBwizOd6Bv+ikTDEEbI8AaTVsIlH59W8/Gw
         DiI5opGZCBqcuDh+VTKUrbAgbB4EXpTJiK/YCa+t61rLvDxLVb63JlnNUz3lr/3z0gVv
         oMYiLJvxRHiosyPJPdgaSl2GhTiHwHHPSvnx/olKCspBwL5vrXV/UKlST0ydHIkBXYEp
         c8PX22SFPDhNGNMTQZGrIeaTGW7KrGmoueDUCIsEtSM05gEEbUHYPGWcSaPKieHJsgIt
         5epzut1SbizLJPdAffJHXu7g7eWFrtCdb7geBHuvffimvfQLDy3CV3oife+S3s1b2LYh
         2gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901595; x=1794506395;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=;
        b=2uPM2v2CFU2oNcE7mUH07s9hr04Ws99wT/Z/8OcotySfhvin4gTMs30r1wmCvqzJt8
         O7z/G8dx3WPsUKBro4+gqiYuMKtW8aLspnVW3s2MDGestOyJU0pUUxizGKpJEVAKqpKs
         rm1RFvimPUFshw1JFz4LsopDae+Mm66sFv4T7YVuU9gg05y25KJxc+o1n7Gats6zPbc+
         j48waa2+neDH48bVglviqX3/hQNaXA0ZWSd/wf8aS8orMA7zNhPigZ6AqoP3DpgLeKdR
         n14QMVf9mQ08QN55ZKEpwo9Nku8e9Gzj+t/AAsmQPxllQNbF4x67RnRIcfJ9+++Tsy6R
         +ADA==
X-Forwarded-Encrypted: i=1; AKwUvBwfyuia/4KowirWXXsyOlrWcdb+XEg1c2zoBiV4OtWDooAJLTlxkTw4j+duqU9N/3cZUbfDSREAvWF6@vger.kernel.org
X-Gm-Message-State: APuU4Z9uOG72mgZnrcIIDvATTn16KdJgk/V2BVhJOK/OnHiDwdk/j8hV
	fraQ+SzR6vMLLZTjDjO/yenQ/qE7OtylorNvNZw7qWPsuF3ZpnqQjPjfSRlsBz1fc60Zwr7TrsX
	5NWV+n42eARg5qOn4b/yXEWR+d9dVVUT+V1NX5rMr6RAePB2jPAby6Q9LIa4fShXjVI9PKnPK
X-Gm-Gg: AYBFou38/IIg0PYwAXSwV0pwgE2Mrenxawav4U9o39WI47B2aoeaw2nqjXnpEnU0YTJ
	B9lQajfvP2yQZWgLJZqGAEkbMTDZxs+hwUWe2RRYs1y3XTAP1/iA0Mg2UsfY2LT51MgOqJiz0Xc
	MyGUFwd4IMSo7Y+mZm0yYZ+4SnAxuEMGHJbjt5fsN3K3EImMR3jXgUsCSEBC6wq2BHkBSMIfrkN
	GUeAa0XYZZxmMtREe3T8K3yTLT5Ljzj+Q9Q44fnKlgzZD7niO4zKtHAjXBIY/PcIi3bCKBZk0wP
	Qx7z9HITd+8zPkBrKfatoO070SqAT+A2GyfpqTwiRobu228+L4Ij4g0d88KsspIZ/zq6Tetzsm4
	+lSe9vDRHPgLF6pwKL4L3ASG8EeZuBgWKaXWBdyjqBqWseiU4HLNr1MUwnvmAzIgW6IorODRFDu
	emXIinXJJUITFrZXbTAIXArwZkew==
X-Received: by 2002:a05:7301:619b:10b0:36a:1d6f:917c with SMTP id 5a478bee46e88-36a423c3380mr31476043eec.22.1793901595328;
        Thu, 05 Nov 2026 09:59:55 -0800 (PST)
X-Received: by 2002:a05:7301:619b:10b0:36a:1d6f:917c with SMTP id 5a478bee46e88-36a423c3380mr31476004eec.22.1793901594753;
        Thu, 05 Nov 2026 09:59:54 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm21151517eec.16.2026.11.05.09.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:59:54 -0800 (PST)
Date: Thu, 5 Nov 2026 09:59:48 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "Santino Wang (=?utf-8?Q?=E7=8E=8B=E4=BF=8A=E5=82=91?=)"
 <Santino.Wang@mediatek.com>,
        "linux-edac@vger.kernel.org"
 <linux-edac@vger.kernel.org>,
        "Sidney Chang (=?utf-8?Q?=E5=BC=B5=E5=B1=A5?=
 =?utf-8?Q?=E5=B9=B3?=)" <Sidney.Chang@mediatek.com>,
        AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>,
        "Fred-WY Chen (
 =?utf-8?Q?=E9=99=B3=E5=A8=81=E5=AE=87?=)" <Fred-WY.Chen@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Light Chen
 (=?utf-8?Q?=E9=99=B3=E6=98=B1=E5=85=89?=)" <Light.Chen@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "tony.luck@intel.com"
 <tony.luck@intel.com>,
        "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
        "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Arnab
 Layek <Arnab.Layek@mediatek.com>
Subject: Re: [RFC PATCH 00/11] soc: mediatek: add a DRAM ECC error handling
 driver
Message-ID: <20261105095948.000013c0@oss.qualcomm.com>
In-Reply-To: <20261105045321.GAauwLwdk2PSruRAcw@fat_crate.local>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102123642.000044cf@oss.qualcomm.com>
	<20261102124434.00007741@oss.qualcomm.com>
	<78ce4a6ef441cb9836466e9ae5e72ffe21a88242.camel@mediatek.com>
	<20261105045321.GAauwLwdk2PSruRAcw@fat_crate.local>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aecc41c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=xlvtQj9HLH9P9y80AtsA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: wTjUBJF0Un3TK4fGPSqi0Ty92pAhFqjH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MSBTYWx0ZWRfXwnvleAHs2Znb
 +CnDjvpP0ajZ40EMRmht4hMgb5cQpt0DDoMpEF32vSpXAausENo0+3XHxzgR7+vrwf1Jz2G/l2b
 fRbmOYV6vjIt1KaSMDgpqa8riYIWoBk=
X-Proofpoint-GUID: wTjUBJF0Un3TK4fGPSqi0Ty92pAhFqjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MSBTYWx0ZWRfXzyCZYceP/O4+
 ahIIzlBkvMfm9aogmZeanKTo1p633udJNnh3J6mKoataQDXQA5+O3YleVbYB8ldaKCYiY6QHe94
 OI0TPmZg57oX0Is6Fk7fWlsYzZ7sDGzS4KdbYJaSTzmtvHJPJsX8upNKxLCrjwMnenuqtn1+IXl
 K3+5Q0qYWiDXU9F+qC3MH6TU0vRHGR8mONRQc80cOWO0fimIGcLvMqzIqmKtTJhHhz701xX3yB+
 D8j+0Mzn8mtYmEbDJEV7V1ximomJDSWZ0KmQgd6YumXbia4fcDS44XXa7smFzWDb3/0RF16XrlR
 mmrUEOtcEeW2Q69/uTkJ8Q/iZtASL8pHL4BUd7rXbARN+r4Pc4TcufkTQ+FL8CMgz86eH2exivD
 vgRIMuz1TmgrUsLXH+HqLqPMU1wPjFGcYncIy/ch/4jVdYBCPoLR1fBxpU4gqxzN9S+O8Chyw5k
 MXOqK1zBaQY2prAX+wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050071

On Wed, 4 Nov 2026 20:53:21 -0800
Borislav Petkov <bp@alien8.de> wrote:

> On Thu, Nov 05, 2026 at 04:19:27AM +0000, Santino Wang (=E7=8E=8B=E4=BF=
=8A=E5=82=91) wrote:
> > Which existing interfaces would you recommend for obtaining retirement
> > status from each memory owner? With that information available, can ite=
ms
> > 5=E2=80=937 be maintained in userspace, or would they require support f=
rom an MTK
> > driver? =20
>=20
> mm/memory-failure.c
>=20
> Look how the others use it.
>=20
> What you write above sounds like you need an EDAC driver which collects a=
nd
> reports errors. Look at examples in drivers/edac/ and there's some
> documentation in Documentation/edac/. Perhaps ask AI too.
>=20
> If the stuff you need is not there, you can extend the existing interface=
s by
> justifying the extensions properly.
>=20
> But what you have - a completely separate RAS implementation, homegrown
> somewhere else in the kernel doesn't fly. I'm actually wondering how you =
even
> managed to do this driver without *finding* all the RAS/EDAC glue we have=
 in
> the kernel. Googling for it would've told you that there's something...
>=20

I would add to this that if the standards don't work for you, consider chan=
ging
them.  These days it isn't that hard to get ACPI changed and they have a ni=
ce
code first path so discussion can take place on kernel mailing lists to ref=
ine
the idea before going to the standards org.

There is some overlap with things we will probably be proposing for ACPI in
the next few weeks. I'll make sure to +CC everyone in this thread on that
discussion.  Inputs form Mediatek (and ideally Borislav, Tony etc!)
should help refine that and avoid pitfalls that have made previous RAS ACPI
stuff less than ideal.

Jonathan

> HTH.
>=20

