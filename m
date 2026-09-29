Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E123CB2C7
	for <linux-edac@vger.kernel.org>; Tue, 29 Sep 2026 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699726; cv=none; b=qup5OaJ+nrwgFc4Ekddze19cV18dKu3GcR1/Z2lF4dRXFPPJYGeI9Gl/xkApJ/sCN15nMgvsgNDzyN/74s0jSE3p5p1beXFSfiA8aJIx+ATbwugn5XjwhvO0QuP0ZT1kV6DyOGtlsjtcUx+77Ag+5j58s8w9c1Aatd0YfoCcF3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699726; c=relaxed/simple;
	bh=47rwlglKSQxfxEDXXmuEm44Dq/NXlBUlHanQleCqj5o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SEPdATAFCCpELBlPpHxgWdfX8gh+/jHnvP+Xt5HzVfZx8GSyR/rZrnE2kUqwcuUGnkVhg9EgX5VQCMtD5fVHuq24svLrfOxo83qwJrqrzUKaD6mhN6ctqdvO/mB5USvMn+W7NpOYWqmMfuWSaFv3azhRZC+eTJtyYMjldzQvBNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThElj4IK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVOxXvYG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThElj4IK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVOxXvYG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqlF03936936
	for <linux-edac@vger.kernel.org>; Tue, 29 Sep 2026 16:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFiMMBdl/YpceHjKDolf2xod3hSnCtpF9Xk21w7Nw2A=; b=ThElj4IKoevghTAa
	4XiJQlDhMIyY1XUHykZQSTSS+vlsvajzHyW34tKwk4T9H9WSo+o2LtEABTw84mK9
	i3/s+pnm1hl7EYJzsVlfJHpyDFqlhsgxn8Iq81MzIoMOhD3BQvtzw7ofgQCzv8aj
	N6sVj1wB9vLTCew2UKGNpE7GAVjXCK30YIF4ywcxdOBLiqny2OwUEPx2jtBYS46K
	loqvi279e8mMjRHAZU6kLRlBRtxFEvekfAzbxfRCf/elUqmSUMMyBCmG0/bkW24b
	PB/w7WQJbrbQV4V7i+FWCl8GJ5xPHiQVikoRdv5mCEkV45TUc1wZSQnFjh8k7ws5
	1LVvQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1hktg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 29 Sep 2026 16:35:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so34508405ad.1
        for <linux-edac@vger.kernel.org>; Tue, 29 Sep 2026 09:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790699723; x=1791304523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QFiMMBdl/YpceHjKDolf2xod3hSnCtpF9Xk21w7Nw2A=;
        b=ZVOxXvYGI8R+LkJHOsuZsOq5oihaPepdALpGlygGb/FgALKuAjSlwxmZ9U6E9RVKMc
         v+clKeGCQ7YkyoFSA6sGYyqjthuMnLLD2mWPoFkeCBENBbcMzWV+eLK5ijXM0GJOopUN
         Xlth8kS7WHsgen8WJQQeAl4qREqZ9XQptUhIXSQodd7AvvfFidsSFve4O46/y6Ma1Wln
         BKP+lVBsWHhHwcaXVFIwah3xxdVQ3ZPoSIWVo7MRhH/ORj04pv03r3C4MzVLO3b7Hh1r
         Dqu3dy6oikL0EPJ87VsLx7kdpShmIsUxnNGG5a9wfQF3XRFM/ZCmd+L7KWzS0OPgbecO
         dRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699723; x=1791304523;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFiMMBdl/YpceHjKDolf2xod3hSnCtpF9Xk21w7Nw2A=;
        b=rxeN+gHcKXgNc6N7fbnTtF1kagoNBugBeWtokeQuC6iqgcjIc07XOlyS9ouqBwk66w
         qvbWLrCUxAZVAswHMfEB/+p44dfJYUvECzpCMJDeM0mYOtABguQ8Tkk/Mja9UfpByk1o
         UR+9ZcbP/tsEcCzc/tQ03S4c8wlKJMnMTvgHg9BplL6a0ou7p3Ucwq40Hrb14BHPraY0
         3fBn2t40quxCuBagSkLyLJuetd4mHysYbTagT24lllaQ4/nwzJ6JP4Z4QMiuTTlnKkhb
         XA4/jxQjoOL4XLj206+oQDk0ZH0XHwJ6dLelLsnoiFvJxRXesZAYKvhkr9O+hd2EA7Jo
         kGGw==
X-Forwarded-Encrypted: i=1; AKwUvBxHFTgzdQRl5C66esAz6DEJFBjdNALE/y7oaA+IOkwSXAjKK4Nk+9U8gWYJxaoV/WsSPINxSlP4srkY@vger.kernel.org
X-Gm-Message-State: AFq9FYI+OgAeo6IEKuKQU1xgqc0D7fVe8cIBz5u7KPuMD8CUWQTUaZuW
	xqCM/fS3v8Kdku25hIV3iXGjxMgsvzKjRAZWvlD/bSwzfHr9jwlnM1G65wBOFR6PX/ptxpKGvV9
	d+wGARs8HoQWMZWeV8D8e5fAWdjn9hfhhRZnTWEsuQH/2FzvtjFWNuHu5kUGKZKcb
X-Gm-Gg: AYBFou1sid6bYK33dBYnZYBzOJOmJ0bGKnTWfHpdu3SiGYLAnH9Tk1Q3+O5UFkUUAFI
	PqnrZNpZxfVvXX6kBEPHPBs99hz6detTc5SBsRZPlN3CJs9hMdNydWRgevEueXBCd2ozVMxFQ2q
	nlmyFJFG4FnAXVT3h3uLj2JCRGhSz1sO7C8BlF+XmBX7z69UdXtk9kAWr/BK+HIBrcK6sKzBOaE
	ktlgmEFLiU3h1PbncKQW8Q+ow5k6A1CYd3P9QBSJHQE+2VOu9yKc/RL6ugjnCmUxnaP9KK/kBuY
	KlhUIvxwqEP5ctM5rausg0ysD/nQINg9Usj+jfPoEQfirlSRuDqwATZq2xfVLzZ0ppI1+oeXhG1
	KljtmJ+nA7WKijJ926cgwpEt+zrSo93IkebRv5wlkKDE599ldgG9THg8=
X-Received: by 2002:a17:903:26c5:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2df7dfd63f0mr145703215ad.57.1790699722858;
        Tue, 29 Sep 2026 09:35:22 -0700 (PDT)
X-Received: by 2002:a17:903:26c5:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2df7dfd63f0mr145703055ad.57.1790699722348;
        Tue, 29 Sep 2026 09:35:22 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbb201sm60790195ad.9.2026.09.29.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:35:21 -0700 (PDT)
Date: Tue, 29 Sep 2026 09:35:16 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Mark
 Brown <broonie@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin"
 <hpa@zytor.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
 <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Hanjun Guo
 <guohanjun@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuai
 Xue <xueshuai@linux.alibaba.com>,
        Maciej Wieczor-Retman
 <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Yazen Ghannam <yazen.ghannam@amd.com>, Radu
 Rendec <radu@rendec.net>,
        Avadhut Naik <avadhut.naik@amd.com>, Kees Cook
 <kees@kernel.org>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M. De
 Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Breno Leitao
 <leitao@debian.org>, Terry Bowman <terry.bowman@amd.com>,
        Dan Williams
 <djbw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang
 <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [RFC PATCH 0/6] CPER: Add Memory Error Section 2 support
Message-ID: <20260929093516.00003781@oss.qualcomm.com>
In-Reply-To: <20260929074659.2587216-1-pierre.gondois@arm.com>
References: <20260929074659.2587216-1-pierre.gondois@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX88/8HIw8bvaa
 HZs1XMdk9hINtA7hLd4il/M53RMZMsFMNZvr9uwavWzmunY8CxFIrn0zuZf1js/jHwFs+1QB2jZ
 soeCcduC2hXPMpQgZurnVkHDErm1cLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX/v43boEqogEk
 Xmf6dv4bUDw31UB4BfQzW/Pt7elfdoXxCsPWljK8qYpK9XdEwnGVVG4fAcW/G0Dvu/i6rHv2TfF
 6DDQhYulEzKjb3I9mUbuG8ANR9t2JBCoG1U6oFJ8Eb/IEpQvXUmx5FY6rQNuYtNBlL98mFGMVR9
 6qnP8TMt0HCYf0lV/ggmkeL073HkzCCR61bz8/lETa23Axhm2N+teiO3AckERid/j3qYpOp8wtB
 rWVb32TP/e303Hdo1cDhj6M5MgVUibS6KbtxpO2HXJW+8pYngPrGIyPQDjdZ62Zpsetxfv1LNkp
 Ts/VDXSRPdDpDWdDRaVyzIL99pti+Ar2VeNKg72u1hj+kLeakUpKoITWQeoCIeLKBtq1K82PkqA
 FlW89kMIIVDc2uOxyh78hS5njLTWQXGJiefAoNZik7nE34MXVsEwtwQmFJ2x3cXVDGf2fijLrML
 p4piTBI9rB99oDbQK1g==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbe8cb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=XM342pYOwZ3m7ahhEzQA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: q6wIuVAoCrHwKZvnw1IZUSWooPwhwTeW
X-Proofpoint-GUID: q6wIuVAoCrHwKZvnw1IZUSWooPwhwTeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290066

On Tue, 29 Sep 2026 09:45:59 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Add support for Memory Error Section 2 records.
> 
> Extend cper_mem_err_compact to hold both legacy and section-2 records.
> Add a common parser and convert the CPER, GHES, EDAC, extlog and x86 APEI
> paths to use it.
> 
> The extlog_mem_event payload layout changes with this series.
> Compatibility with existing userspace decoders still needs to be
> addressed. More specifically, the rasdaemon relies on the current
> struct cper_mem_err_compact definition.
> Either:
> A-
> this patchset should not modify struct cper_mem_err_compact and
> create a new structure to handle Memory Error Section 2 events,
> but this would ignore the similarities of Memory Error Section (1)/2
> B-
> userspace should not rely on the struct cper_mem_err_compact
> layout. extlog_mem_event trace events should instead emit data
> that relies on the actual layout of the CPER records, as defined
> in the ACPI spec.
> 
> I am looking for guidance on how to handle the above question.
> Current implementation lean toward B, but emits data in the trace
> event that maps the new/updated struct cper_mem_err_compact.

My initial thought is a no to modifying the usespace ABI.

It isn't particularly painful to just have separate handling code
for the new record.  Unfortunately the ext_log tracepoints don't
split out the fields in a fashion that would let you change
the structure.  Other RAS tracepoints do it field by field which
would have been possible to augment - even then it would have
required care to deal with field size changes.

It may be worth considering a much more 'expanded' tracepoint for
memory error section 2 to reduce similar future extension problems.
That is express ever field and don't use a compact structure at all.

Mauro, perhaps you can give input on what works better over the
long term?


Jonathan

> 
> Pierre Gondois (6):
>   ACPI: extlog: fix extlog_mem_event build issue
>   cper: add Memory Error Section 2 structures
>   cper: extend cper_mem_err_compact struct
>   cper: add helpers to handle Memory Error Section 2
>   x86/mce/apei: switch cper_sec_mem_err struct users to compact CPER
>     records
>   cper: make cper_mem_err_pack() static
> 
>  arch/x86/include/asm/mce.h     |   4 +-
>  arch/x86/kernel/acpi/apei.c    |   2 +-
>  arch/x86/kernel/cpu/mce/apei.c |   2 +-
>  drivers/acpi/acpi_extlog.c     |  23 +++-
>  drivers/acpi/apei/apei-base.c  |   2 +-
>  drivers/acpi/apei/ghes.c       |  20 +--
>  drivers/edac/ghes_edac.c       |  26 ++--
>  drivers/firmware/efi/cper.c    | 219 +++++++++++++++++++++++++++------
>  include/acpi/apei.h            |   2 +-
>  include/linux/cper.h           |  58 +++++++--
>  include/ras/ras_event.h        |   4 +-
>  11 files changed, 283 insertions(+), 79 deletions(-)
> 
> --
> 2.43.0

