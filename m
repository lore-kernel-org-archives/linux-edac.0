Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516257;
	b=LMHflYGTb5z7yHiValcLZpScG7PYXpvd5M61gJLQ4QWt5CLgmPI7+v3f6zr3nH58kiwp
	 +sq5GDB6RA69Lbjq8qTfrRF7z9TbM3kCEOrehvxjJrdJKPHSNr8BA6BXlX5pZtC6u+Pkp
	 Fg8cilBjiUzwE9tH+mratRaPZIv5ao8ljDca82pLzHXhdOaCUwqHR3QnpO+xiQnf0ZtcB
	 KUZL/VscCgY+ZKCxQtaZvKsTJzDiTi0Qa6qcIWZSYn+p2AaN4F+eQLiBe4obfo9IGKzKb
	 VJUweEN0yq8dSU3U+Eolayx+hYDCpUuzBJMfL3VM2T0REhMzb2d6UW9tlySAcEXelnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XuGp63Zu8Xhb/maxQXifefMXC5yHBwIeZ7UZd8sAo6g=;
	b=fYxhp/Lt9an0DHzZpFDIEdK0AJzjf7y/G82P7I4ihfQRJwI96Hbe2ImgdV6UF3q8L/pj
	 ipe91V5bgtLcUrcOm5DjNYx3AGgBfhzzIdL62xh3MHM13fKH1muDdqc1MuCaA4RILt6gp
	 2mPlERIw4pKt8bX6CAg4nc8iw04wcmjLlIHahussjVsedChVJQcjXgvxd4ZIaxbFDd2Ru
	 m1AVoJSrRI/vW3QmeKo+1wJYTiTWXsZbg30k/NO/s2cJDpA7xo4EWeLAhDB+vWAUQpZXi
	 Y6NoUgMFt0LEkunYqyeKYaw/U6s/HXmo8leYkP+DVzKpDwSbIpxwcmvrNgzAlhZtveA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cr8UEhZt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dxWCPcTQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1D60A2607
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 17:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A1D60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cr8UEhZt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dxWCPcTQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtlCP2278770
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 17:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XuGp63Zu8Xhb/maxQXifefMXC5yHBwIeZ7UZd8sAo6g=; b=cr8UEhZtHzcb3IqX
	cktx1/Tjz8ZOrSW7yg+EZjyDKalpeLFfVXvVcxfZ4GpdXdFGuKFaPVtumG8TBpri
	Xs+CjKAOSb+4yXKrNTEvUFfYF9t5qD5MbmfqqNGbF7psV0brw9s0rYH66Tr2Ii+I
	oAzpuwaR2C9LAdKXF4WIU8Xj45vbbt4KJOw0YjDlnlyKCU+hEHkOS05mR8edq5LH
	1T4Uqdy/B2K+cc3aeodyeQl+RvcjSR6jknYOZp+7eUQ0ijDlFgZ5CAj7yzfnZf4n
	I9vkWmzYQ2gVYynfg6gUE3FuU1mfMOkP9J62yHxw9T8pfBJTDHF5e+jrzE/VHrkV
	meRLog==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h29aev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 17:10:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so7540995eec.1
        for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 10:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792516256; x=1793121056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XuGp63Zu8Xhb/maxQXifefMXC5yHBwIeZ7UZd8sAo6g=;
        b=dxWCPcTQhE1GIzkY9NluCy557sf/aV9Hlv7TV4U8xCxCvvee7Dgv0f/qzFmfYZzhB7
         MO4tNmYrrFl6RL9RYA5d+t7rw+bus4Bz1dn5lpoM6P/iyIHsqdFOtyUABUv3//rMRYwh
         /NIglJMJluBtYL1Sjc7mKhVYj4+Y6M+dnn7JqdvkUXTO3oprBizyukSxRZShasQZBrEX
         2B2RxyxxN35bCtDMsgy39qs1KXq+WPyVs8kFm30gCpJ33HcC9UdoPADadBZi1wKujvPC
         xnijG7Hk+f/xc5351VO7EPp2Ir/nJPM8Sz+tVjCSJHbbmfAnMpIFBY4ngo3q8nwZgM5W
         aSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516256; x=1793121056;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuGp63Zu8Xhb/maxQXifefMXC5yHBwIeZ7UZd8sAo6g=;
        b=T9lgQJnEJG3rCK3VHI19kxnLJIRZ718YQhq92Sejub2vq8DZZ0Ug/A2sXrDsnGCC4T
         /Yo8DTZyOeNwwEKcB8/pvysY3AWl/pHaTBdBYdmbkMk2RcV+twsax5JVAzBExJM6CE1H
         QsLP7z0feXdWpMVyT6vcCjCneQg09KKK3cxxov3v11EToeuAHZm/uOhgwJg70FueQE24
         ugOUDgeyvj2NcYBDSqUV76bNkK1CemszlQgXvLDCxt595POf19YbSGuO3wH15nPTuxgE
         hUW8Qxlgax95vc1GNZQ5S3y3mg4peIJHw7ApR0rCi9DLdu2u/M1Cc/+Nry4n8QfDRmmL
         dDBA==
X-Forwarded-Encrypted: i=1; AKwUvBySlz3OlrSZeEfpyXC89Yf1ppuI+LOu0iHunqtwgaIQmf5cvH63pFJNLvLNV9fJAMHu7KX+vGxxtXcW@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2+q3B3XVvfQAvxxWCRE2Vo7B+9b2fo6blozQ5kD2WlELa4aBp
	asOkBkQLc5IAd/BLe+OsD9bky1WHQgtMQpIIu0N7DL4HyaqQLy6Xm6LzMLewL2EUY5TG6CS7Zch
	qrZ02ijil4Ns4Ukze8eg+y/KuDFqpt+uwYss/3niVTEAeQjKfq7VybegKOcBaDV2W
X-Gm-Gg: AYBFou1j0t/GCzpc6aIdislo72xKEVDXFgNhAaAe7S7O9ktdLiWdnw6UYA/9/9E/GO6
	gexTtu7ixSfUws/wdrlsJkk4t2UULrZja+fjNtuX3RXDc3u6vL0EXOdVv8FZKwqhuJ0gxLCoefM
	vm0cB5gd6+Nn4JhaMmk7q9Vow3LJEFMWunDSoYbCvgNgVLhV3dHP3Z5RS+JOvpnC9+V0s9IMtMn
	IudPZmg4aRL99J1Se79iJvC5shk1XOPd2JBLAvXlN1iRDcE8uO+FJcL4Vzcm75J0lt1iFkXGnrO
	gfJS6VCUkzDK1uAms/fgXeKawJmQO7b3BwDvEbt5Njo6P91HB9XtSYV9mBk969C4Aj8ML1Q3x7g
	VpMOKaeaUPlCMzsT0+M5K3WAaGp48IJdn502JDnsBfyc=
X-Received: by 2002:a05:701b:4587:b0:17d:961d:7db0 with SMTP id a92af1059eb24-18512e254fbmr15146325c88.28.1792516255371;
        Tue, 20 Oct 2026 10:10:55 -0700 (PDT)
X-Received: by 2002:a05:701b:4587:b0:17d:961d:7db0 with SMTP id a92af1059eb24-18512e254fbmr15146268c88.28.1792516254593;
        Tue, 20 Oct 2026 10:10:54 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm44388c88.3.2026.10.20.10.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:10:53 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:10:48 -0700
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
Subject: Re: [PATCH v2 0/6] CPER: Add Memory Error Section 2 support
Message-ID: <20261020101048.00000186@oss.qualcomm.com>
In-Reply-To: <20261019203915.2019037-1-pierre.gondois@arm.com>
References: <20261019203915.2019037-1-pierre.gondois@arm.com>
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
X-Proofpoint-GUID: uw3v-Zv0coz1NIcVNtdfyYh31GXP9Ciw
X-Proofpoint-ORIG-GUID: uw3v-Zv0coz1NIcVNtdfyYh31GXP9Ciw
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7a0a0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=5VxSIjaA6f0WmzOPONwA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2OCBTYWx0ZWRfX/Tc48GQ6xgCK
 iymFkEcz7wUwkmiDvxVc/6J8/Xxf1kRXCNiK+kWH29SaKpAuN7XnEL4iFNisndZz/DRLltgtJRy
 wDsfA3owmW6HAZPlznt9EZkbCdFFlaY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2OCBTYWx0ZWRfX8MhLwqhNfa+g
 lzhDwJCvpd/5FwzigCDc/P1qa4UBkcLVmZZCebx34M93T/zKEXYxFCmxsMMYwQvlXjjc+A2wiJ7
 LmAQaN9CDW7RbpdF1IoEJoRXtyTFVrTkjewcnCJSct2HEpBlfpKzchncC8n7mcamW1YJgbHgUrn
 NJ3ZNWGNOBKDmTCnzAOrkU3lNr56DEoXf6RYtO1CWsqTnRF6P6MCenyE4GD1w1soWrolgz6KeY0
 stQgncQQm135G4uYAF/bE6Qgv7SoJayLw8yX7V3r/RgFfEP2J+gXnc9h9zSfarhYFAffKytIFmz
 oFv7a+AxzIOI4Uao1c3zuhXmbwq6B6b0q9OFYJCnr6YMK9ifqe6wIeAOOmWmKVlrceU2yVEoq72
 8qcRls7lbULawYXF/O3fY+HtPXFvbbyC86TXVACC8N+AegAfcdnhbupKtRmKjKDJmkdTU0raatp
 nXzJ+H+UQRveiNDVcjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200068

On Mon, 19 Oct 2026 22:38:39 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> The support is mostly duplicated from Memory Error Section handling.
> Other than differences coming from the content of  Memory Error
> Section 1 and 2, differences in the support are:
> 
> - v2 do not rely on a compact "struct cper_mem_err_compact" struct.
> This structure was used to support older versions of the Memory
> Error Section (1). This is not needed for the new structure.
> 
> - The compact version is also used by the tracing framework.
> To avoid relying and propagating a non-standard record format,
> through trace event (cf. extlog_mem event) the new trace event
> prints each field individually.
> 
> The last patch of the serie was only build-tested due to the
> absence of relevant hardware. apei_mce_report_mem_error() and
> arch_apei_report_mem_error() implementations were also removed since
> last version.
> 
> It will also require a proper handling from the rasdaemon. Applying
> this last patch without rasdaemon support will silent the reports of
> Memory Error Section 2 error, cf. ras_userspace_consumers() check.

Hi Pierre,

I'd slow down a bit.  We are mid merge window and convention is normally
one version a week or so anyway.  Better to gather up feedback from
a number of folk and spin only one revision to cover it all.

Jonathan
