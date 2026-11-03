Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739655;
	b=bqnBz+X1baM5JQj5PlGDctGFT5EjuaGs/KZNnEhZyFGPTYkTukPIsFU59WEqqFIuyXi4
	 uFf/EtuGv21RICn2oLR+VSb/+vsn6UgeZ9fxqlUZGZ1wheRGUMXtHS3JtSiBaCmi61x+n
	 XrU/5qS+Hlv0AVLRgK3sHyZhGoK9t+MSRUj93vjKWHB0/qbU6ZMLZrSujGOUgamsKOj9a
	 tkKEdnxWAZsur/7Cvut5rPRMumeUwRKSHljgfKU9ZavXcT+bjpqmCuNREPb8k3kTuEQg8
	 PHyyXfIxGbz0LDboW6Z/JHNzKrYgVKMipKIq7FJNW26Cra8AAs2ZCp2fe49IZPfwQTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8+TGSDQ9SyPrcH/PQA7dWzaDsqGof4ZchVSIqxBGMHE=;
	b=Xakfav1qdB2foZm4WmLAX/ggzcuwWyfsrRVTjNHmU4AyNwD8as1kvC7xZ16N5l2BvyMU
	 TzzXeUc2bof5cbMBfkact78FbpAArNA55rR7zxAvxEBFt3u1Lem7i6j8KPeQSEYVNFnX7
	 QIFFzFkDeOQh7WKXTWPcY6MHXqiVFhY3NxYCQ3wEITibVBe37pueHMyrD3TbZfekG+79A
	 RFEdKbuO38HDZqMNvGjEOi6/tFw95Qo7hKCvUXkp6Oo3ife8MPgOww1KrYpmvAD76eHGP
	 JEvXx8wzv2wBi0H6GmftMFOZk/5hGa/Dd6vyYn2X4+ZzL2cVUXej7YdSZTwestmSnmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQDZ6Ikd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9E+gh9W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF79C606A337
	for <linux-edac@vger.kernel.org>; Tue,  3 Nov 2026 21:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF79C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQDZ6Ikd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9E+gh9W
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZCo0057202
	for <linux-edac@vger.kernel.org>; Tue, 3 Nov 2026 21:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+TGSDQ9SyPrcH/PQA7dWzaDsqGof4ZchVSIqxBGMHE=; b=DQDZ6IkdTD4TfR4h
	QABB8e7VWCWMVOZKatz5cG2ZupT8OhMFcFFMfNvjLbnU2huxsEnt9PzMbYcmwcKM
	rcXOmWW9SJO1ALJ4CZePlEKys80gzfsq2L2grwlmh8AUlKdVFXWJir5s4L6f0XDE
	EUukTfuK7BC61i0YYggix5dQibhKnM6eZNfv4Vu/fgiZ+J2DUHawdtOILn+DByLj
	UzT2IVNmZdakkqpm6UABaWZwMTxa+cmy0E4TEJNLcGvFrCN1x/YAsGJSh/3sOklz
	6liZgZJpwvdrivGuzDimPxa0mduchuvgSs0uBLsNzGIkFNKmnm4941/e76DqSYCO
	k87QCg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp92j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 03 Nov 2026 21:00:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3692c5b061bso12316471eec.1
        for <linux-edac@vger.kernel.org>; Tue, 03 Nov 2026 13:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793739646; x=1794344446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8+TGSDQ9SyPrcH/PQA7dWzaDsqGof4ZchVSIqxBGMHE=;
        b=g9E+gh9WOr1y+hZ6ZkhOEwDoltB1mXoy48+bWDVg4Kp+hdmwP7XL3bxvAhNQIyDtkc
         sP0CnnJ9P5krTnb3PWknKl7VpjEn1Ts5jY+iuT0MuMDnqubIeQmeVhReXetxOB/PDXHg
         KN2V+uQq3RWujTy3qfpM2brSEzC9mWGp2nBkHchaXgSlZrwq16RDpACMGdBNo7DjyXtf
         dP9FVy0hi2rahnzDy9VoopWqMvVchUK7N106prWd/tQmusB/Zhugomy98bZMNhKQqp46
         NeXMNiW8zr3hXSAgjTpBbwlKuef4L/DemYPHk454Szw4DJXBlvjEVyfp7Z2wwhlGJePp
         8WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739646; x=1794344446;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+TGSDQ9SyPrcH/PQA7dWzaDsqGof4ZchVSIqxBGMHE=;
        b=pXkV0kyTvGBA3yTSatTwktfRr55WwHm2HIhweCEjXfkeA6j30vN16bluSRG/9q9nJs
         k87GXF3kiJ2sURHCeX12r8E65hfKDaAupt0vfZ0xuu8AKMEimAuLp6vAdbMkt8RnVJuh
         UXwiWDpjrlYZa8vFZncsQBZO077c6dJsBi+aAFN9s54B0MeZa6uRN0DlNi74bDMp0uLr
         PHeam/MrH0cQQU7yV3HI1mxQW77neKHEucvA6TPvmFfVBfcnTlg1oFpiC/GU3USR88q8
         1CzrgNSp1gipMY1dQ20KEY2VQl5NuTkFg2BVE1T9y8yih084IrfWZCKCjkw5TmgQIL4D
         Oo6A==
X-Forwarded-Encrypted: i=1; AKwUvBzHbfWv3YoKvVtSEB17OwEs4dGozaOSQcg+H/gd6iy+skoUcmgiKheRcYmORxIa94rFX09eugBM3Kaf@vger.kernel.org
X-Gm-Message-State: APuU4Z+3cef8/WQs05VrlIE57YXWoB1cWbYzAtLdD95poYc97AMXv2i8
	XlY1+6mWJ1TAJGKr16XC1Pc/PNc2V+Zvs94NQHCTDxm+JL503jTEZ0juPS/GmCMtWhj/pvWvdlT
	HsGrrh/Tq3UKEHo8b1Ky1/9Uu4VuOuxDei3fg0Ua6gPZGumfmM9lIiohuXNs2bTVf
X-Gm-Gg: AYBFou3Dh605+j7WZwYW8iwldN3o9j5CLAEYXFM4i6s1yw9iXpw19xeoLScQ1S+GLsF
	excXyWYSxrElDEkv1vb26I3blJiK6b4pQ14yIVaHnagmigR1PppOiAj0eOPF5xUtY1gbRyZtFkP
	wfz0C4/GAYE/wkW5myHBgTwSYTKN7fK7xvdZgEK3XhWen/cW6c2wMFzgTZchoWhR4Unm0fCD26n
	vPrmqI2ZqDmecJP1Y8un7f1OrFt1bqXSc2dsCmKldNHW8FmI7awWgQdPrxctXzOFo9xoHIN2ccC
	24EPJ6d8di+3VYmHpq0HGVTUu0YPuqzcKg0HbO8ziwwREyK1g+DMJe4SYW9wwowIbucP10Z/NHW
	GLz54ZMLJcYquV9UKo0HmItnNDxA1zhW+S1kSAu6/ZSGj2nxZSxYFx2CizR3LXjUVvQeFOB/Gct
	Y0wHwn93v8SLevgAvdqXZinkAuhg==
X-Received: by 2002:a05:693c:83cf:10b0:36a:1427:3933 with SMTP id 5a478bee46e88-36a4236e7bemr23432957eec.16.1793739645637;
        Tue, 03 Nov 2026 13:00:45 -0800 (PST)
X-Received: by 2002:a05:693c:83cf:10b0:36a:1427:3933 with SMTP id 5a478bee46e88-36a4236e7bemr23432898eec.16.1793739644957;
        Tue, 03 Nov 2026 13:00:44 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm706469eec.24.2026.11.03.13.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:00:44 -0800 (PST)
Date: Tue, 3 Nov 2026 13:00:38 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
        James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>,
        "Rafael
 J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuai
 Xue <xueshuai@linux.alibaba.com>,
        Maciej Wieczor-Retman
 <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M.
 De Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Dan Williams
 <djbw@kernel.org>, Terry Bowman <terry.bowman@amd.com>,
        Ard Biesheuvel
 <ardb@kernel.org>,
        Morduan Zang <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v2 2/6] cper: add Memory Error Section 2 structures
Message-ID: <20261103130038.00000f77@oss.qualcomm.com>
In-Reply-To: <aunhE1aeSfk6YDgj@gmail.com>
References: <20261019203915.2019037-1-pierre.gondois@arm.com>
	<20261019203915.2019037-3-pierre.gondois@arm.com>
	<aunhE1aeSfk6YDgj@gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MyBTYWx0ZWRfX46y+S5kz1fO1
 MWjlM1IAgRXL9VrWBZDlbIdKtWrD9tWKBLwVMtGfuravcJN/zBvijTBJpJAfws3tStVapRa06qA
 ehYWXXP6f8neWzXXBNt/wXz+5cdkiDQwSPQ1LtO0Px51qpNsPe4SlEd2vohk9TJEVJ1gXR2KoZl
 WZolXcptArXGtg53ARmteIXVgwxsHB7De3im4RBHSXrEwJr3YE1su/iXaP9/KRvJeqyWL6808oS
 8+z3dRY+/smobqJzFecDiLZmyeM+0vfAM36Et3pOf1+YxgyvxjATKQILqqqA01mQ4jyKR7zNTjv
 h+pYckZVb+C0BHOJztXhge67SxiZcnl/enlREkiDM2qlhdLMIzNaw3oBuPxw/WLdIXvGJCzXb5G
 a5EJzT37LoL5rWs1JB0fGMfIBcHoxjdQI15cLb/sNJNMqUewuza8KOvPnJwWfI3BqedpW3G45lm
 eq0fyAssPyIr8XPvDwg==
X-Proofpoint-GUID: HlWywmRHV5XdTC2cHtTVlowwk3sncsZO
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea4b7e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=bZ_CbDB1LfDrNmofISYA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MyBTYWx0ZWRfX3bX4xkTS1ZdW
 WlIPIirnngnHdwpPieaQv/0Fa/Ps+U3UHt3FMJJXk/oU3p7/0aVP0XH2/irpp9k4uGOqRT73cFD
 G+Z3Z3vsKT1rOPXRs91Wb4RKBSpXA/E=
X-Proofpoint-ORIG-GUID: HlWywmRHV5XdTC2cHtTVlowwk3sncsZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030083

On Tue, 3 Nov 2026 05:27:02 -0800
Breno Leitao <leitao@debian.org> wrote:

> On Mon, Oct 19, 2026 at 10:38:41PM +0200, Pierre Gondois wrote:
> > Add CPER Memory Error Section 2 definitions to the CPER headers.
> > 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>  
> 
> Reviewd-by: Breno Leitao <leitao@debian.org>
Typo.  Just in case Pierre is using b4 or other automation!


