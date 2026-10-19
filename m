Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433819;
	b=nxznwo8EVBazevD+KNJSmK/NKtNsz2kcby8fjwtgJPXP+3zgnyoBnfmzfzoYIo6SG+oB
	 x0Uo6XBic9+Jq98FBvfmSYIShbUW7MQgPGoM8A9vYhsFCxXvfwHkeoCrwkkKoWovq49q4
	 WWgP3rhQIP0TtIW+zn8Lf1gLqNRomsNvarGNaVoqEgHKOTRHaq0ul+4+RkplOlP9T9SyF
	 EbWRrP8cFM9zX4PZT6pgLIfd4YYiqPD/upLcCTLildA3nEzDJ3bI1JHs+M7F86puwRZ/U
	 79mie9RL8JiiLjfoKV4REgSjqajEVfKk9QvVEcG0BdhMj1/MysGBWuBAIMcF/c5VdlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ME3cN6VotEvPOysbvIMmDJdPx2UppASZcvsxt09CPAs=;
	b=gFkxbmieqDc+QBs9ykjAqEYdzCZfPbP0oH8bp9r5I1chdzp+iMWwUhAmgDv/MlbGG9JU
	 Z++SxRyKb7ciRvnkB+NvLEWiy3CJg1/Jofro/jEqHaXTzFKQ/3lO1/fr4N+zTvPQ8cwga
	 02p5rJ9GteDKYpNuCM7M6ffYh400IHKtMtvtze8onhZ8BYcpq8CEvpX3C/ek6JuxNsfLe
	 NA/aoGwhTMFt1jvKy8cN0LuwtFDbpDHVNoxRzmGTT8gTrZ5FMveOf2otWc/ZNrKKF91+p
	 r9RYiEonrWxJzQRq/hYNCEsCePc8hh0tfBTtg8ZIutbtzx2qba6aIzJyJ77C8n2LL/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=axJNuqcB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKA4jN6E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463B6606A31D
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 18:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 463B6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=axJNuqcB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKA4jN6E
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JI0jBD3459105
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 18:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ME3cN6VotEvPOysbvIMmDJdPx2UppASZcvsxt09CPAs=; b=axJNuqcBJaHuVjYQ
	E2h2efGauM/+beb5rqtHhYdH2yfr4LDBETXMtNNTpsMcVxu/zV05WGsZErrGlF2K
	NBqWn4pGclrsQMKQT01KPyg2s68U4YtSd1vuXPf+6DGhimC9elShCu9c9uVj9229
	EqdIyf7P0mrR/shsMGcnyBRoWwOigvjtNRtqzesSIyu8b5KIQQ3qkVI83ScRwGg4
	MPQQ3D5/PraMeXaZxgKr8btYTr59ASH+gNhYPOZIAKqiHsj0TUvs7DAoFTrl+aWh
	NfLf97PMAoG84chGn+yYASVlJ/nMX+WXb+8FbDTtE+cRVje7e8ByDlHd/ssalKut
	LKhjwg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr42g2e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 18:16:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso6232687eec.0
        for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 11:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792433817; x=1793038617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ME3cN6VotEvPOysbvIMmDJdPx2UppASZcvsxt09CPAs=;
        b=gKA4jN6EJNVtIogRpKum9XVekD/YYQ49C56OGNYX38VEbAWu2ennj+hRumPbXwC18a
         DPxwNMxRFHH0z2rcmY/51rIHYb8XxsnSQSPaMpMzJ6/jkvO9jlV3T/nCiJ2kF35gDJ8y
         LdmUyIpvD87FV7gYmdTghWaXVxZKjugURJ0OUUFueIndKwjCyomXISOGX/b9qbadnEyV
         XBl/uhnttKv+jD4DYAFwOnKIgdsIlIuNGSrY9rOLTyexwqOCEj7+wY4BMBHKxdwMqdoZ
         vitJlTzyBnO49RriKP+HGMxLkjsgUAWQYtI6sfug+U3UlyBLaGbmGDnP7RN7sy98lECv
         nMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433817; x=1793038617;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ME3cN6VotEvPOysbvIMmDJdPx2UppASZcvsxt09CPAs=;
        b=TLn+Af5k4jrxF70T7P4A9wBMBUBB9dPThe2FOMr5JMlZQ8tSSlMsEQ512WHuFrYgqV
         D8ZHRaAoQH7Y9kLdHPY0uMD4+AquIo9BXLvqIaWdBN5yZX7OS17sHRcXBcwrUA+648fv
         eekmq6oo07xUQFk1euhDdiOBX5Wcdl6+ItqIuzmxoPqdkVTDAwWBLyYEDRKxSkqW09VT
         EUM/+h2xt6QDdLarwtsUhphLU6t/Cj+Qs01tjfAsf8+ctyBxrdYtqutxo3v69/8Pp6hp
         zmN/hX6BgfOr0b1aJFSYXJjn9v/0K7cEGLhl15CyYzN8B1A/mM8KHaWTYhgCSkSyNz2n
         TLCA==
X-Forwarded-Encrypted: i=1; AKwUvBxNx0IcW+ou2gkvYhj4RfeJeJfYSdb67ogXveYz4OWbGszN6JP2UOtHgMUmVpc7rtUfOj64E5GRo+rq@vger.kernel.org
X-Gm-Message-State: AFq9FYLWqx1xWzwVFRcQDHunM2IKinY9DJgLMPesDxb5c/MlcpW18BWj
	Km/q3bCNf1nkCY+jDryKuak+fE0vgayl7Q2D6aEzCq9lz1KhdQbwnDfDPxttaiL6CUtE0EMt7yl
	afTfexrnncr/CJkr9I4KYTYZrvlU54gO0Vuf20xkOhU2MBU9K1Kc24Q+TiYqWVHWAmcTAOMC0
X-Gm-Gg: AYBFou2AUpXHDP52dPajMytpOLwVv3fFXfzhyLVnH0xIs8WYy0JuztPQH4EsGEu1phG
	3rFqzosfwkAxwW/15Jkz0IhFO9KoT7dSnfrU15vEX6UAfYOhODvSlWelBALL0amimdT/SYbuo/m
	xBS1f/4zjq9UsTFEd3h1SXokhqaBqENb5iDg4rVSgICr6yBI9ijLRPP8c2PGGxylqGYQh3K3yNY
	U1YDaQJnojUivr6Jib2GCXbK27feR2Nr8qvPO8qw/orsmMVTVpb5t/NVpWwRnCOYKWU2TUIHk2v
	8BALzvwGOCkoP3pA0U6wZDQGL1SqNjGa3BXILG+r1E8wYoSmzadDKHj5LJLTnnGBk7l46vxCAof
	QnYwZwLHObmcHkNcLCnlY7NVGJRJJ9SP2RdmmJxo+LA==
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id 5a478bee46e88-361a2e3d3abmr11081710eec.39.1792433816850;
        Mon, 19 Oct 2026 11:16:56 -0700 (PDT)
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id 5a478bee46e88-361a2e3d3abmr11081665eec.39.1792433816173;
        Mon, 19 Oct 2026 11:16:56 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm32477142eec.29.2026.10.19.11.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:16:55 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:16:48 -0700
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
Subject: Re: [PATCH 2/6] cper: add Memory Error Section 2 structures
Message-ID: <20261019111648.00006fe3@oss.qualcomm.com>
In-Reply-To: <20261019145643.1877246-3-pierre.gondois@arm.com>
References: <20261019145643.1877246-1-pierre.gondois@arm.com>
	<20261019145643.1877246-3-pierre.gondois@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA3MiBTYWx0ZWRfXyXWjVbnccK3x
 gZ6TuhhMMhrG++6n6LJqxqvooz9ofFr0NXytGtAoKK5bcuEb4LK1VCWXCDkDVagZ3klVeLUfSDo
 SHuanVLmCXaIiAUpETdN3ns5D648E4W0nWF9kMSGLrzMuedbtJeVVajzUtis8WAYWqWbFkT0WWV
 /fYD27waE7R6t16tqWD1W/c+J+AvmB4Of1zalZLuAWsHNkNn45uYEuJiQP+oUcFw6EZKgf2N9HQ
 RA2humL6Z1vsNjg1NXNnzxy356/PQOo7Opdw8mN91c8z51D/YOM07NsVw+Bpct5CpNYFJrtroDw
 OrqF+9rO6cJLPvG7ZZfyduniK3A/3LVaR15J0FWXVqo/1Eejf6ya01E/0ITR9+7998wDjIfSibm
 U0Da4yVLoNPTY5OBjdTUcAju680MpdF8424/vyOZ3rbov/Fl36eVPEum10meJPQEPceeynGJ3IO
 XUkM46KZbtM43XMauNQ==
X-Authority-Analysis: v=2.4 cv=Ve9ir1p9 c=1 sm=1 tr=0 ts=6ad65e9a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=D-Xi6Kjd_1bfK2TynAAA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA3MiBTYWx0ZWRfXzvF+92CZRQSk
 qhjCmqy/9X6LUq+GJd/2HUDIJrXXeTOP3EV3D89jXXTegESY0PhHsx71NSil+YhwXlj/DVvLKmu
 OQDvZc9vr0W4TI84LqcQAdIMPRJinxs=
X-Proofpoint-ORIG-GUID: dPtKc8woUI10pyNkejoObCUBtLkWkwBI
X-Proofpoint-GUID: dPtKc8woUI10pyNkejoObCUBtLkWkwBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190072

On Mon, 19 Oct 2026 16:56:09 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Add CPER Memory Error Section 2 definitions to the CPER headers.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
Checked against spec and the couple of commented names
that differ make sense to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
