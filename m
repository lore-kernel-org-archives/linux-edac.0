Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438147;
	b=dxdzqeUFzNJL8Xs5gd++uhsodVH2Pksd/oENRVlIs6cNXnUNn/1hrrd3KYBnzjUUOwFu
	 x/tQJCFbo0bl6c0vkjM0VwLgCke6BrKX+KZFY8KjkqJkDrFG/XWE7SnldJLtKo8HvH3D8
	 qI3iTIB1zidL5O7dRY3MWZ38Bm70CPLTxPksKyIDvyigf2P+L8KAVLeKS7fNb9tNhxZug
	 r/R6zjx5aEz70mu+hGYm8YkA4wIDfL6HUXyrnCF/4Eh7yJRKFZ/A/BNUcl0FHnJi6ABvE
	 dLc7DeLLqCs3TzBICv9wEMQ4qb3T6SMvwaLmqvBClj6KNnJEH/vlFFIzDiW3vkfo6jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438147;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HTr+bxbq66BXfG6Xfngcx7CALmbZE47aY8OHfPSSUbQ=;
	b=hhKItJriauhqBgmAp8H84nAKo8xMZU8vxK+tePGX2G8xw8sg03iM5nq9FT/tUKXAcOpN
	 Sh46oPVjHowbCLrjbvHxAeeQA/PeJNJtvViE6cuCbgONN85uASDbgNsv0WWP6gZwBgEGi
	 4tMsFNxcnPfiOtASu3nexneTTd8vaEyqegsKQ9q6kLLAK6/neQfOmUns8PfvEwuFELYZi
	 VYRbwNWd+QC2EThjztMtTamZXRV2zFP66Dky3u1ixwE1mmdbbwWS2CwY+VsdbPY7ONWGZ
	 8+L9RSAP1BUGYQTjyEnH67Tg+wrvyG/Yinhv2EyFdDI4bxuQRobanyNphYvFPOL9vMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SS/rmX7J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bE+cRMUE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A6A606A321
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 19:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A6A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SS/rmX7J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bE+cRMUE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJJuf73672228
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 19:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HTr+bxbq66BXfG6Xfngcx7CALmbZE47aY8OHfPSSUbQ=; b=SS/rmX7J69jv854K
	k6MYKuuktMkMKa56Fl1yxD1LV2ygTDQvqgdK8dPvPdZlOpL8zrxqpx9kHI28gBnq
	c9G9slGZ8HAfXo5PP8qKCplKLa9k9oLmOFprlF3rOM4v5uFC2qEiHdO421kY/Y6U
	ACeRgV8WsFawbBLYvcR3IB1kn2sB/Z+ZDd6ZbKmyb+TDsIVSPTBI8qbGn+pv0WhV
	2Bd7KQJBN4rdXRYuUXvCMKXL08zzg+DYIs+0ER9g8OToavQC4Mxwa4LI4DsX3QaX
	rYV39n4h+5KDRa3Xsa7vNr5j4zUO9UN6kWMt9xhxNDaDDZPKss3g89ej2nvlxN/r
	402beQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3xaxuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 19:29:05 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso3948011c88.0
        for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 12:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792438145; x=1793042945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HTr+bxbq66BXfG6Xfngcx7CALmbZE47aY8OHfPSSUbQ=;
        b=bE+cRMUENEFeexrIriRYxlUsLgaOedTQu2s40z9yiO0XevEOmjk2mvpT13SP1uIit2
         wbc03fP74En+wuJ2aniAnsak376TGWRQb2sLwX/FqOiN/GeD/wa41JHz8syJLIEACC9e
         Ehmk95zwCPoqqNrlQxOuylFOKemUwLOiQ2FBrd8eL8E4jIf53t3FzKv5Qtjck+TZ7tB8
         DGyfFJ3RRRvryWXThtcWTD4UqjJjA8wHLzyT66qIC5beD8d5pDWEE71ey9i+LA1fVol2
         N6SR+RIve1CNTtWnvroqQYeR16wAkei348ILSykZQITMcsG278QZj/GaLzM/UP/S5Jna
         H7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792438145; x=1793042945;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTr+bxbq66BXfG6Xfngcx7CALmbZE47aY8OHfPSSUbQ=;
        b=RjNwOX2rc4hAYj+N7EAldSJB6Hg/IwGfkAlYzOsSw7mcp3jZ26L8eTLSJcxuzdl6wp
         8imftyJJF3NwgbJIwTrN7eZTkgIMU3RLt1jZvWuyXydPEx3u9dBTdxjJdHLDW61iLhWN
         FCmAS/4DsNEhZopkbTMvuFSgUZoar5w43EzP54Ga2yK6pzuoQ4+cAAssum3capZgEzHd
         udyU2VFDFKEJU6mGX1sOBoYePsPRQmjabVGfy1thgswxlp0xD/bWTPgloKtw6ZjUGP1J
         CTDQ+BBIkn+aq65wWa8wpf0WcGy/3j8HucMvtO331/Xk1/c8I0b5XprgDAVEC0xqdzMZ
         YJhg==
X-Forwarded-Encrypted: i=1; AKwUvBzteB11nOU8h/bRFdUCx04NvnlsaIOKmxaD5CGk6BZUDNZREWnGK9NDUqnAOYHl5xoZAkCLzTvpxSsm@vger.kernel.org
X-Gm-Message-State: AFq9FYICtv/O62Zx8hYY6/IeqUTGl/wg24OTYX/5yZ4cM79pSeaS4Xqe
	Uavf0QeaMzU4HrlNo5eQFuP6ZbDmCfI3ohzKonkqunYXCiAf1YQ/zbP5TymYKzF/uOuuX1f3INg
	mBV0Ip0vlJ2n8z+DRTQswGDoegVGfmehnvZViofuuGBfmVP8NwGntEGyjJWd5eAq9
X-Gm-Gg: AYBFou0Lkhzzrx11aMV3ttdFzVoSJ85wDONB8R+HLZSsd69HogJc/RasX1Mrdgc3PiG
	fJkDTPtCmdP8kULfZtU/77/0OcKRBhSjWw2JGpjAyDDrMbmUty+dwEISRXJswvoodNgFd9rIOTB
	RdKy3hUaskDM8b4LMtv9tiSAYlJgKnYN3RbPdCEnWeOFQBlBmUxWr41sQTMvp7C0dZC8cjQlEIC
	NIKMHp/Y9k5WlBOnM+4wa8EDWScJ1G+pjdRKR51AX7tALeA2A97eqoUPTFn1FjaQyvvpmmLDJPM
	oHLunoCwpamvkE/8kQ6hCC1TfniIpNOayqMzMD2VhkG6pYUMnZCsMBujrIHXflQulvAEQF09SvR
	jk2eRvKj+mO4/VdtTZzotFvK5LzU7VXsUuHX37/8K1g==
X-Received: by 2002:a05:701b:2902:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-18512c381bdmr9816956c88.12.1792438144537;
        Mon, 19 Oct 2026 12:29:04 -0700 (PDT)
X-Received: by 2002:a05:701b:2902:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-18512c381bdmr9816894c88.12.1792438143497;
        Mon, 19 Oct 2026 12:29:03 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm30689377c88.17.2026.10.19.12.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:29:03 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:28:58 -0700
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
Subject: Re: [RFC PATCH 6/6] ACPI: extlog: add Memory Error Section 2 trace
 event
Message-ID: <20261019122858.00006cce@oss.qualcomm.com>
In-Reply-To: <20261019145643.1877246-7-pierre.gondois@arm.com>
References: <20261019145643.1877246-1-pierre.gondois@arm.com>
	<20261019145643.1877246-7-pierre.gondois@arm.com>
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
X-Proofpoint-ORIG-GUID: uZAoGVx6wm23JNQ9rUE623tlySiQL7f0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA3NyBTYWx0ZWRfX8vAppjzlMFWC
 PqMaWtvG8Y/lFOLicUZB1gV1UySQyz7OMP0C+Hqa4v3wK+f6bX133G6IJOHIxbVkxT5W+BAVOB8
 B1ibK5bDWH50ZMsK0kEtDdATdWZ+8tA=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad66f81 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=U8d67ivYhA4UYEs2wG4A:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: uZAoGVx6wm23JNQ9rUE623tlySiQL7f0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA3NyBTYWx0ZWRfX2KfUCT+vzDIt
 JL4fEaMkB22XCRcDvrVX+MJf9wlHnN+NiWrPqmfohd/sRyEV2H2P4APi7sUkJu7vE1s96vld8KB
 1Yeqoe6piURqGQG13MhgfBLbcSjZvloItdDSFd5VL/ECtUeJiygKDezSyDWVJ5y4kAdI3UYARjw
 5GhhlgnrBu3lxQ9+03qgg+jJdCWqNzeTP5lu+L/Gwq/bZJClBbH/YTGj/P+cpgERhHRYEakjcW/
 3CpJpqKY2nzfSo828Lad5F2w5z0v738On8fKOklKTwowL6KGus17wujDi+gHnMkCTRLcNKyjqZi
 ZRUWQWNZNHstdXeE3Yg75ZETdb0TALR+lo5VIE3eL1ohUGom2+iAezMPvUfwF+vV5k4n+5q6NsQ
 w1DP/L3iPHGmVB7xhSM0/vgllUWkbfmqES3iXyGGtmNf9n1RSVbP9/b0F6iJz/DCgu3gOYuJ/ps
 Xom52IOMjHxeWdVL29A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190077

On Mon, 19 Oct 2026 16:56:13 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Add a separte handling for Memory Error Section 2 trace events with:
> - extlog_mem2_event()
> - extlog_mem2 trace event
> The fields of the record are individually printed so userspace
> can discover the layout more dynamically if a new field is added.

How useful are the pair of handles?

Otherwise I'm fine with this - subject to same comment as on patch 1.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> ---
>  drivers/acpi/acpi_extlog.c |  16 ++++++
>  drivers/ras/ras.c          |   1 +
>  include/ras/ras_event.h    | 102 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 119 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index e764d61f71ca..9c0b932e22bc 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -189,6 +189,15 @@ extlog_mem_err_event(struct cper_sec_mem_err *mem, u32 err_seq,
>  #endif
>  }
> 
> +static void
> +extlog_mem_err2_event(struct cper_sec_mem_err2 *mem, u32 err_seq,
> +		      const guid_t *fru_id, const char *fru_text, u8 sev)
> +{
> +#if defined(CONFIG_ACPI_EXTLOG) || defined(CONFIG_ACPI_EXTLOG_MODULE)

Same comment as earlier patch about oddity of protecting stuff in a file
that is normally only built if they are set.


> +	trace_extlog_mem2_event(mem, err_seq, fru_id, fru_text, sev);
> +#endif
> +}
> +
>  static int extlog_print(struct notifier_block *nb, unsigned long val,
>  			void *data)
>  {
> @@ -241,6 +250,13 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>  				extlog_mem_err_event(mem, err_seq, fru_id,
>  						     fru_text,
>  						     (u8)gdata->error_severity);
> +		} else if (guid_equal(sec_type, &CPER_SEC_PLATFORM_MEM2)) {
> +			struct cper_sec_mem_err2 *mem = acpi_hest_get_payload(gdata);
> +
> +			if (gdata->error_data_length >= sizeof(*mem))
> +				extlog_mem_err2_event(mem, err_seq, fru_id,
> +						      fru_text,
> +						      (u8)gdata->error_severity);
>  		} else if (guid_equal(sec_type, &CPER_SEC_CXL_PROT_ERR)) {
>  			struct cxl_cper_sec_prot_err *prot_err =
>  				acpi_hest_get_payload(gdata);
> diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
> index 03df3db62334..c6b14202a5e9 100644
> --- a/drivers/ras/ras.c
> +++ b/drivers/ras/ras.c
> @@ -111,6 +111,7 @@ subsys_initcall(ras_init);
> 
>  #if defined(CONFIG_ACPI_EXTLOG) || defined(CONFIG_ACPI_EXTLOG_MODULE)
>  EXPORT_TRACEPOINT_SYMBOL_GPL(extlog_mem_event);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(extlog_mem2_event);
>  #endif
>  EXPORT_TRACEPOINT_SYMBOL_GPL(mc_event);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(non_standard_event);
> diff --git a/include/ras/ras_event.h b/include/ras/ras_event.h
> index fdb785fa4613..0c0dbe068dc8 100644
> --- a/include/ras/ras_event.h
> +++ b/include/ras/ras_event.h
> @@ -74,6 +74,108 @@ TRACE_EVENT(extlog_mem_event,
>  		  &__entry->fru_id,
>  		  __get_str(fru_text))
>  );
> +
> +/*
> + * Memory Error Section 2 exposes each field separately so userspace can
> + * discover its layout. Validation bits use the UEFI Section 2 assignments.
> + */
> +TRACE_EVENT(extlog_mem2_event,
> +	TP_PROTO(const struct cper_sec_mem_err2 *mem,
> +		 u32 err_seq,
> +		 const guid_t *fru_id,
> +		 const char *fru_text,
> +		 u8 sev),
> +
> +	TP_ARGS(mem, err_seq, fru_id, fru_text, sev),
> +
> +	TP_STRUCT__entry(
> +		__field(u32, err_seq)
> +		__field(u8, sev)
> +		__field_struct(guid_t, fru_id)
> +		__string(fru_text, fru_text)
> +		__field(u64, validation_bits)
> +		__field(u64, error_status)
> +		__field(u64, physical_addr)
> +		__field(u64, physical_addr_mask)
> +		__field(u16, node)
> +		__field(u16, card)
> +		__field(u16, module)
> +		__field(u16, bank)
> +		__field(u32, device)
> +		__field(u32, row)
> +		__field(u32, column)
> +		__field(u32, rank)
> +		__field(u32, bit_pos)
> +		__field(u8, chip_id)
> +		__field(u8, error_type)
> +		__field(u8, status)
> +		__field(u64, requestor_id)
> +		__field(u64, responder_id)
> +		__field(u64, target_id)
> +		__field(u32, mem_array_handle)
> +		__field(u32, mem_dev_handle)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->err_seq = err_seq;
> +		__entry->sev = sev;
> +		__entry->fru_id = *fru_id;
> +		__assign_str(fru_text);
> +		__entry->validation_bits = mem->validation_bits;
> +		__entry->error_status = mem->error_status;
> +		__entry->physical_addr = mem->physical_addr;
> +		__entry->physical_addr_mask = mem->physical_addr_mask;
> +		__entry->node = mem->node;
> +		__entry->card = mem->card;
> +		__entry->module = mem->module;
> +		__entry->bank = mem->bank;
> +		__entry->device = mem->device;
> +		__entry->row = mem->row;
> +		__entry->column = mem->column;
> +		__entry->rank = mem->rank;
> +		__entry->bit_pos = mem->bit_pos;
> +		__entry->chip_id = mem->chip_id;
> +		__entry->error_type = mem->error_type;
> +		__entry->status = mem->status;
> +		__entry->requestor_id = mem->requestor_id;
> +		__entry->responder_id = mem->responder_id;
> +		__entry->target_id = mem->target_id;
> +		__entry->mem_array_handle = mem->mem_array_handle;
> +		__entry->mem_dev_handle = mem->mem_dev_handle;
> +	),
> +
> +	TP_printk("{%u} %s error: validation_bits: 0x%llx "
> +		  "error_status: 0x%llx physical_addr: 0x%llx "
> +		  "physical_addr_mask: 0x%llx node: %u card: %u "
> +		  "module: %u bank: %u device: %u row: %u column: %u "
> +		  "rank: %u bit_pos: %u chip_id: %u error_type: %u "
> +		  "status: 0x%x requestor_id: 0x%llx responder_id: 0x%llx "
> +		  "target_id: 0x%llx mem_array_handle: 0x%x "
> +		  "mem_dev_handle: 0x%x FRU: %pUl %.20s",
> +		  __entry->err_seq, cper_severity_str(__entry->sev),
> +		  __entry->validation_bits,
> +		  __entry->error_status,
> +		  __entry->physical_addr,
> +		  __entry->physical_addr_mask,
> +		  __entry->node,
> +		  __entry->card,
> +		  __entry->module,
> +		  __entry->bank,
> +		  __entry->device,
> +		  __entry->row,
> +		  __entry->column,
> +		  __entry->rank,
> +		  __entry->bit_pos,
> +		  __entry->chip_id,
> +		  __entry->error_type,
> +		  __entry->status,
> +		  __entry->requestor_id,
> +		  __entry->responder_id,
> +		  __entry->target_id,
> +		  __entry->mem_array_handle,
> +		  __entry->mem_dev_handle,
> +		  &__entry->fru_id, __get_str(fru_text))
> +);
>  #endif
> 
>  /*
> --
> 2.43.0

