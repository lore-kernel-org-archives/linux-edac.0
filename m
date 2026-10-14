Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9415625FF
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996472; cv=none; b=aajrXBAA8UWo8AUsdoYu+PdY+4XdMuP/xUtV2t9qax4IW8di7ziHTr+aPVU1NAQF39NGhqUavaM7IjkiBQPLZxtzX6BABbw4p2bTEPhgUUQn/pzrK3JkCcM63vWVe+30rGcGJLqxhq3stgnknJS9W0g9e5DMK7kqDEbexJrf77Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996472; c=relaxed/simple;
	bh=ep11eUjGaRYZD5Y5tVL923e3l8aN0sPspZm3DI41NHU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmD9UcHAXQD3K14EWE3EFmXJLT076IbTgcat2K7Zyk5h66PV7Ai2oLuGg6MTs7nJmG7Q3r0TlREbq3F1lcj7yxLU7Y34Cc03w5TM8f1E2FaWVahekwtTzCrTa0CBwnOE4Pw6FWm+b5agV953o4YmYAqX9YW12mFfe2mgqXniT5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8V7I8E5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NGTKlkuq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8V7I8E5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGTKlkuq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEabOB500266
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 16:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6/IglL+b+wtFPZ5EstJiD1NM9orXL5+hMxkr3Qx2XI=; b=M8V7I8E5HgeGS4S8
	a9c5Tr8E9X2SaAREIjIFFWKD+uGumnMXVPRMJjQX6xNxdOG2L2o045+kC3PcP+Pc
	hTB9oPiggtORrRdRrYfijzEF8xXuPlMhf/wI9tAHvVJ2IJGG3dvn8bCnw1RjLbYn
	a19PMwwfJY8UWdJlrlmi8K8Iv2kfvMhFwnEjZWgNN6m+XC3bzHD0PxB/oLC8wjI4
	pwz9a2eN89NO674EKMw8xZcegr9YTDUfiajgesUe6MY7fVp144aI/xTF1FtvrbgU
	q15dhY2slV31YQ9KJssvJwBLhjoKx2rV1TUNmRr8qQvqBvBh9riQDAo8zU6hj8oG
	D7jWmQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf0ukx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 16:47:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so12046268eec.1
        for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791996470; x=1792601270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B6/IglL+b+wtFPZ5EstJiD1NM9orXL5+hMxkr3Qx2XI=;
        b=NGTKlkuqFd4i0R8+AFOKpZJa4h9QvWUaWkPxpis94KiNQtJ8CJrEhBYHEjfdYNh9ob
         JMiOBc2tlMWk2u4LAPGoLneBD7cYRpG28hS4sdLrVSHBAmgU/ZX7Hq19xgO24kU4dvNu
         crIujZtbWv3jDNYH9xN8k1tXLL8WMapBlRrz69caosnuiEF+QUZHgjp+EbgbShAgNazz
         qAlPZauHXOhllAUct61lvcH6mTdzVxHj4mxCjYdKUZEB+P1dOerZmuFfBagm/tknipcz
         hMAT21hChGDLaEW3pppyW8RvgJVHZWaIiaulag9gGDcG//gmCXDpuuChUnvSnRAewq1N
         ijoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996470; x=1792601270;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6/IglL+b+wtFPZ5EstJiD1NM9orXL5+hMxkr3Qx2XI=;
        b=JF465NjzcQb63HUgjMoR/xLVZFXK9Vw2t7nEN0AtilOK7Sh7Fir6teXGfWW5Ug+kYJ
         b4JwuOv5cRBOBjeWR9EIguVgdr5cwecr+RM5Yj256en32DE8u7zn67LrFHO+c4jKzcnJ
         ZlvNk4U2XUIyrdATteQFpkJFvJTbU0I5qvfYfZvCuKfeEGByyFp2fLC7c2Lp6MOa9gWW
         JqfYZhwA6zfVcEZP18hHXwSj7oyzMod++0eJmzPIAbsJPX9jbw7racIgpQnDmJkVAjIo
         XvX11vPTzdDa7wQmCZqIyNrsvQntV7thBPHHaUhUe2Apu5sd/gIO+SlJxrwNIbdns9EW
         AOUA==
X-Forwarded-Encrypted: i=1; AKwUvBxpEQeGFTR1uMnGRxs5SAijtxBPWn//KJgfGUv074cFfJGfJXZGotZfSFbHZuLIJIVLmBZptegO3eW5@vger.kernel.org
X-Gm-Message-State: AFq9FYJksPyv1yrb1D2zjUrpRQ9BgyJ0DALlnjLglYYYKzzmGajZIYKC
	f2p0g9dIwZscPR4bJhH12ZV1evkeynLB+lGtPAYmcTtw1ASdY/iBP079QGZgTPgyJWCaxrORbVF
	MnW7lFQ3sAtheCjXkJ9sqo7vpCI3bfgq73fUoRHww13rvhix4e4mOyxYN2OjnDGIm
X-Gm-Gg: AYBFou2ItFUA+oMv5Kj25wHMKY4aJPPZfnZocM9ElBCXfwq/gSrKuxBo3uKm8L90S5a
	v+1Jr+nKifb3bIBK0SIzAYEMRwvgnyMjRXanxmPE2qNCIDHilXFcMfyPb1paUtq5mdRuorqy7EX
	wI13MaXnFGH7ExSjeHkkHVKQ0sBGaGINgdW6TgTVpPf1Cb7tdZd3b7CSS23CiORmY5oqb3KCR7q
	JP+lCwU7cPcjgmnw9AL6+/+kK2GQjhyto59MGym4pdu4X4MVXRsPDOKmrAWy/1XoRQacbhdgTPP
	Ge4onYiPoCkSI7v2xyyURyFlxqHUAQHZX9pZgrvFvz3W+7RaGm+B7XNHd/1NzcyZHfWfDA5FG5E
	7BN/8aQgaWQeG1oPRIApv2HPEuod4IHXrRKJ5BpTzy+KF+s0CmWB1qfM=
X-Received: by 2002:a05:693c:87c7:20b0:33b:fc17:e786 with SMTP id 5a478bee46e88-3537e020a08mr23634052eec.16.1791996469860;
        Wed, 14 Oct 2026 09:47:49 -0700 (PDT)
X-Received: by 2002:a05:693c:87c7:20b0:33b:fc17:e786 with SMTP id 5a478bee46e88-3537e020a08mr23634013eec.16.1791996469242;
        Wed, 14 Oct 2026 09:47:49 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm39681092eec.8.2026.10.14.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:47:48 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:47:44 -0700
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
Message-ID: <20261014094744.00007c0c@oss.qualcomm.com>
In-Reply-To: <94bf3539-6a94-4efb-a57e-c0e1ecf243fd@arm.com>
References: <20260929074659.2587216-1-pierre.gondois@arm.com>
	<20260929093516.00003781@oss.qualcomm.com>
	<94bf3539-6a94-4efb-a57e-c0e1ecf243fd@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfXwvU0dt6M86Dv
 I4ydy+gW9GNLSNfQD5cHERkl6mgJ/rrBDFVZu3DR609uyjjnro/Ns49nqcA5DEgJrEGU1gUlEWI
 17EDvw9dNmiJGitQJV7vV9Kk/3h6A0TPnAe/3iqIimJz/1ciVVRzCZ2bTjdL3caW7FQNgAHXtyD
 z/knpRhcqc2/LW73VC74DEN/RxYsDE1nrUEtDToomjifJcUAW4i3oEnqeVczHHk+lzbD4zN30ZA
 1J0prvAm6GR/W+IxV+w8ZMPMsxBpa2Ow+mJAHJUtJcn+iEnSaZPtqNH464estO4w3a2ycZpR8Fe
 43Hx/LHiSnao9HaDogSYCgv1AWNuBgSzLUdj7pEZ/gcvm6p5N2WLzVnZVJTtF4BEOAP5wOXQqFo
 rs/6UNxbw2H1P5m8gIwyl27ZEMqUBqb/C1KDGFcG99GACVIhv7S2S6ocNgUiIMseXWJ6wSmjJLK
 W88x33dWYvevVbbRnSQ==
X-Proofpoint-GUID: K4XbojcLMW8cHy31DQAlk4nkhOxuxU1_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX59oLCLTzKapz
 /XAijPBjxA6pui0OkrPS4xD+/h/kdTQcI6UlBVwSDnBpuxrjQZhneGrgzqSzXLl+3dtsgzH9xDP
 Nu8KmTSm1ehxTDI/CQREZHUHpNEYNmY=
X-Proofpoint-ORIG-GUID: K4XbojcLMW8cHy31DQAlk4nkhOxuxU1_
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acfb236 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=oD4Dqva4uQW2vlo4LloA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140066

On Wed, 7 Oct 2026 15:35:08 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> On 9/29/26 18:35, Jonathan Cameron wrote:
> > On Tue, 29 Sep 2026 09:45:59 +0200
> > Pierre Gondois <pierre.gondois@arm.com> wrote:
> >  
> >> Add support for Memory Error Section 2 records.
> >>
> >> Extend cper_mem_err_compact to hold both legacy and section-2 records.
> >> Add a common parser and convert the CPER, GHES, EDAC, extlog and x86 APEI
> >> paths to use it.
> >>
> >> The extlog_mem_event payload layout changes with this series.
> >> Compatibility with existing userspace decoders still needs to be
> >> addressed. More specifically, the rasdaemon relies on the current
> >> struct cper_mem_err_compact definition.
> >> Either:
> >> A-
> >> this patchset should not modify struct cper_mem_err_compact and
> >> create a new structure to handle Memory Error Section 2 events,
> >> but this would ignore the similarities of Memory Error Section (1)/2
> >> B-
> >> userspace should not rely on the struct cper_mem_err_compact
> >> layout. extlog_mem_event trace events should instead emit data
> >> that relies on the actual layout of the CPER records, as defined
> >> in the ACPI spec.
> >>
> >> I am looking for guidance on how to handle the above question.
> >> Current implementation lean toward B, but emits data in the trace
> >> event that maps the new/updated struct cper_mem_err_compact.  
> > My initial thought is a no to modifying the usespace ABI.
> >
> > It isn't particularly painful to just have separate handling code
> > for the new record.  Unfortunately the ext_log tracepoints don't
> > split out the fields in a fashion that would let you change
> > the structure.  Other RAS tracepoints do it field by field which
> > would have been possible to augment - even then it would have
> > required care to deal with field size changes.
> >
> > It may be worth considering a much more 'expanded' tracepoint for
> > memory error section 2 to reduce similar future extension problems.
> > That is express ever field and don't use a compact structure at all.
> >
> > Mauro, perhaps you can give input on what works better over the
> > long term?
> >  
> Just to be sure I understand correclty, this means that you would prefer
> to add a 'struct cper_mem_err2_compact'. All the functions currently using
> 'struct cper_mem_err_compact' or 'struct cper_sec_mem_err' as input/output
> parameter would have to be duplicated right ?
> E.g. arch_apei_report_mem_error(), cper_dimm_err_location(), ...

Yes - if that's the cleanest path to not modify existing userspace ABI
(and ras tracepoints definitely count as that).


Jonathan
> 
> Regards,
> 
> Pierre
> 

