Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437886;
	b=B6CBMNZEEVXZ/Sh+/zEbDa0/XQ4qpZXHlVNm8GbKjZn5H5fPshMdMoS77sqzkwR79JZx
	 VzRExaZlmObSZQARhy5uVwZCWkd7vQgKG+FwU/8fcC+h+eVgKdJOJzWwyaaq/wbMnBIYO
	 QDmDyijvVlqMwqoOv11/545saJBAc7zOLow/bY7ThnrtgMv6be76bQ/5+KxXk4OFRK9aE
	 kaUTXi9EH3ZU6tdwSPcGgLQwbN++QyQTM9L4MBwPq+I6Dc2E/dDc0fu/AULsaVxDQGcnY
	 0e3MzNFbmx8NUEmTYKf0lZ28O0CnLNLzWymIY8WdwbR4XwBFHtj515e8txUoDUy4nDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BMUhm5+GJQEDK7W/pa/hsK7Ip8Ta9HhXsuNAgIn4IXI=;
	b=rPZbw6p2O6rA9a2JqQ9YiELZquAkw2we0Dsi2tOtRGz2DqXOKu4sZdPcpZwgIElI4RHf
	 p/Zeazs/WMpylla05QugLhaJ7seWe6y/Tembw6KhbRVJDoGstpe5UIx1tqUjXT34txCyB
	 aByBHc+5I+D1pegGXTF5DdNq5uAGNZ6zoRW3digC99aOu8+Zjkvsgmm64TmAN/ZQlbthA
	 8If3ipYNmmczJCe092Y1MRIQ51UkuCPm3/vryA+CtjDuMToHX5uWybAAheA2KXg+EgCRc
	 8qfOW0aAoandCmXIPrCnmV+N96RFA1kPLwilr5c0q6m6By3BR9M1VYSWv3i9owAAPAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRwJAm+R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HwYMibNg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4A6606A320
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 19:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE4A6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRwJAm+R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HwYMibNg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK5qP4189742
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 19:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMUhm5+GJQEDK7W/pa/hsK7Ip8Ta9HhXsuNAgIn4IXI=; b=CRwJAm+RXy3ZPfsk
	5y75LciccvrkroJApArGjvbL3WqdD5rIV/kvilAJo627eH2fu9ELzN90n+3tN3Ey
	OVo88iw9RoigRazM2oaGyz0oBqvnOYctvMHsYT5ECl3xWAX9z08SRLyWomJi3YkD
	MN0Z9pORPMppiZ7oqIQNUz+/YuQiyETnx5R+Kb68NqBNc6tABTfLKwkZ0Nh+eAlc
	tqDlldWEkZOln4AuvvnwKkAfoCi2Ijluszem9JSs+vPvqNoBInQ82Rx7Lp3kGCOV
	PcprY7NqODq584+bgpx5E8Oy4j1rgDS+P52Tqb78AdgH1UJozluk/nnG/QCaKe/R
	eVR16g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48jvju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 19:24:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-18b5ee75447so3295995c88.1
        for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 12:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792437884; x=1793042684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BMUhm5+GJQEDK7W/pa/hsK7Ip8Ta9HhXsuNAgIn4IXI=;
        b=HwYMibNgPmS0T0TZtOxNxsVoiIgehjEEU/TY5O05LL2dnOwIp+UTHW4PQ6ZevTjHKq
         sNC1vQuLh/atS0x/YFc8TCgD5CAa2w4QwjyOlnSjIIfaJ2ck6cwZhA5PLos+KegvVgOA
         aBy2zqkni6aNeLtIQNO+e0WryVMlz3xvQtNUeS/iUXrWEUMTGzu9bv7qUUex7E4XBwC8
         oxJ2MMdx24irMtSda5O5FiKRbckgDOoIj2WxFbUh3N7i45rW4AZEDBK7jQGeiSI3D05x
         CzC8irXB/2nJd3dsd9YvBx/fuEtU/fgU2t1r2BuRdVXU20JSic+8g8iA8JmdT/L/EOD2
         EUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437884; x=1793042684;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMUhm5+GJQEDK7W/pa/hsK7Ip8Ta9HhXsuNAgIn4IXI=;
        b=TjpeT9YuvjzCC/UlMdzu/yUX+oduiGcxrnp1cGhIBzGV6e6Tm0wwyfal6zofcg+tEn
         Cf5ignPpk/J8sx3SdFCVCnZAmi8nWxdjEIojevktXt4kx3qjK1/goto+d3YZbiNIwevM
         Cd1gjuvEHmZanjNDFnqKswrmxvCQxOeW6dAHsUrbm5kHqVUARUeckID45Y2YvJ6bfeqW
         99W9kVYpC0l1PTv+RCKqZUW28Jvi4oPvQ6+MUOG/dSa0vMWOsOOUuous0QQNhgw/7+wi
         23rZlsdgt9/a98QBTKOUdVCo64d4dh5ysU0g3GMR7sLtlVnOC1un6OVZ1Z+jk8PjYpjt
         Lb4A==
X-Forwarded-Encrypted: i=1; AKwUvByLnC52CWcuFWbnffAWJ3/IUYqOgy6edTJAzOQcVz6CucAcg1ALg+7vkwzmrlKsUk9FzrL8fzkYUbjH@vger.kernel.org
X-Gm-Message-State: AFq9FYI8PfZKNQiy2A6tz6OwjMalujtOxKLrJ+ArAxJlZ02CVw0iZ5zd
	xLzI59x7M+JUVE6PgS0DnOQPA7RRBbxLBXApFHp4Hj3/H7GPzqH5os4jsiaVMFAVf38hP9U3eT+
	ZIKLBvACey+u2Tb8HDyzwHfybfgm8NtgIz4f0Cp6wX+Wjmz55oH938MfImXJ06hC3
X-Gm-Gg: AYBFou3U96yDpU6ebctPWLgUa1fUitNKA6icK037AGM/L0DwTsl5Hi0cTUXsQfdsQRA
	ngxusiAdpURURRgnYZqEW45wyQloGRVJ7qZ+2aw8DAg0oFf1ZDQZT/6Zx3YkzbUlLDqdoChmbGm
	VuKB54Honw39iMkRe3pp4mN/41D4L6bio+lNG5EwAHobxf0eZWGRx68J39Ax1tjhxQGpkiTZMOh
	oM5D91ISys7E5AM8mIc3FJhEGLVwfnNzIeKLGrfuehxsjcl5SFJqJxqI6+pVberNrrlfBQJHOr6
	e7XZyu1aeMNchz9MxhUC4JaQfJuHRFb7gWv7DD9Mz6XDv5P4mxBZSbrhm0NKdp3oKYOU4454UAL
	NVzf+oKWpS7Y3yX/7xRcQvILzSXZx/1EaXmfJPIpAh43m5Swc/CoqMw==
X-Received: by 2002:a05:701b:4308:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-18511ad8bacmr13577087c88.13.1792437883533;
        Mon, 19 Oct 2026 12:24:43 -0700 (PDT)
X-Received: by 2002:a05:701b:4308:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-18511ad8bacmr13577069c88.13.1792437882911;
        Mon, 19 Oct 2026 12:24:42 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm27157689c88.14.2026.10.19.12.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:24:42 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:24:35 -0700
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
 <leitao@debian.org>, Terry Bowman <terry.bowman@amd.com>,
        Dan Williams
 <djbw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang
 <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH 5/6] ACPI: APEI: add separate Memory Error Section 2
 handlers
Message-ID: <20261019122435.000079c0@oss.qualcomm.com>
In-Reply-To: <20261019145643.1877246-6-pierre.gondois@arm.com>
References: <20261019145643.1877246-1-pierre.gondois@arm.com>
	<20261019145643.1877246-6-pierre.gondois@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA3NyBTYWx0ZWRfX2GvmY79l8eeK
 X65JL/YL/cRG77oLRW9CWwqgkWQTVZXl8rqXjJiLvdTyJ7lwUSsvMe9LmJkjTSAvqstbEhN2MDr
 pcX9mTiqwg59QYtBjJ/im9rhNa+ODXyHZsp5DyUJSWWqyQzjrSjGGTGJP/Te9eXU2PJ16uVb4Gu
 srKRaL84vKoNDX66K0v2fSdsPeI2T/o1wgJKhDP6MMn45LGM61gErrwHQ42di1KJ0CJSot6nj7B
 LLwoQ8k/UHHwoUB8DJYH23bxkQLQhkYarpFrrs+P292joW0eHOuZSHCXLKMpdSPB7C7+OCZ11b/
 om0EN0EpN+PAuULgGkH0eW8Kscuh4hhuBki5FEJblSrIb9eHODcU5BDXFwRoYeDGHKhMfVDb2lv
 GJQ5jV0HQiPaoLVdTQxEbiA/UOmPKao8vheM/5PsUa0jNbh30dKLgCJaPdle8j+WddAv6zfSn4A
 0POBbwdzpmcf1Z+q+wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA3NyBTYWx0ZWRfX5XwN1ZpA3lSz
 jIOtF1oQDkQ4SjiPW7oWd0mX5kN7cT7cTYOIl572ZF0ArMTrMV35klEscjovLXSeO+ChRMVnB0+
 XLKEzg9sOdajO7YEpgbk0aiCsMnkiTQ=
X-Proofpoint-ORIG-GUID: FIB4ucyPRrBW4yjsTEJ0mf71kfXwjA0L
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad66e7c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=rtJ9AlOumMsWe6EQo_MA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: FIB4ucyPRrBW4yjsTEJ0mf71kfXwjA0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190077

On Mon, 19 Oct 2026 16:56:12 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Add dedicated GHES and EDAC callbacks for Memory Error Section 2
> records. Use a separate GHES notifier chain so existing consumers
> continue to receive legacy memory error sections.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
A few trivial things inline. 

Otherwise I'm fine with this though as you noted before the duplicating
is a bit annoying.

> ---
>  drivers/acpi/apei/ghes.c |  49 ++++++++++++-
>  drivers/edac/ghes_edac.c | 150 +++++++++++++++++++++++++++++++++++++++
>  include/acpi/ghes.h      |   2 +
>  3 files changed, 200 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index fe10ab0e02f6..c7fb15543b56 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c


> diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
> index d80c88818691..b18460ba8f40 100644
> --- a/drivers/edac/ghes_edac.c
> +++ b/drivers/edac/ghes_edac.c

> +
> +static int ghes_edac_report_mem_error2(struct notifier_block *nb,
> +				       unsigned long val, void *data)
> +{
> +	struct cper_sec_mem_err2 *mem_err = data;
> +	struct edac_raw_error_desc *e;
> +	struct mem_ctl_info *mci;
> +	unsigned long sev = val;
> +	struct ghes_pvt *pvt;
> +	unsigned long flags;
> +	char *p;
> +
> +	/*
> +	 * We can do the locking below because GHES defers error processing
> +	 * from NMI to IRQ context. Whenever that changes, we'd at least
> +	 * know.
> +	 */
> +	if (WARN_ON_ONCE(in_nmi()))
> +		return NOTIFY_OK;
> +
> +	spin_lock_irqsave(&ghes_lock, flags);

Perhaps use a guard so you can simplify error paths a little.

> +
> +	pvt = ghes_pvt;
> +	if (!pvt)
> +		goto unlock;
> +
> +	mci = pvt->mci;
> +	e = &mci->error_desc;
> +
> +	/* Cleans the error report buffer */
> +	memset(e, 0, sizeof(*e));
> +	e->error_count = 1;
> +	e->grain = 1;
> +	e->msg = pvt->msg;
> +	e->other_detail = pvt->other_detail;
> +	e->top_layer = -1;
> +	e->mid_layer = -1;
> +	e->low_layer = -1;
> +	*pvt->other_detail = '\0';
> +	*pvt->msg = '\0';
> +
> +	switch (sev) {
> +	case GHES_SEV_CORRECTED:
> +		e->type = HW_EVENT_ERR_CORRECTED;
> +		break;
> +	case GHES_SEV_RECOVERABLE:
> +		e->type = HW_EVENT_ERR_UNCORRECTED;
> +		break;
> +	case GHES_SEV_PANIC:
> +		e->type = HW_EVENT_ERR_FATAL;
> +		break;
> +	default:
> +	case GHES_SEV_NO:
> +		e->type = HW_EVENT_ERR_INFO;
> +	}
> +

Almost everything down to here is not memerr2 specific maybe factor
out an initialization helper for the edac structure?

> +	edac_dbg(1, "error validation_bits: 0x%08llx\n",
> +		 (long long)mem_err->validation_bits);
> +
> +	/* Error type, mapped on e->msg */
> +	if (mem_err->validation_bits & CPER_MEM2_VALID_ERROR_TYPE) {
> +		u8 etype = mem_err->error_type;
> +
> +		p = pvt->msg;
> +		p += snprintf(p, sizeof(pvt->msg), "%s", cper_mem_err_type_str(etype));
> +	} else {
> +		strscpy(pvt->msg, "unknown error");
> +	}
> +
> +	/* Error address */
> +	if (mem_err->validation_bits & CPER_MEM2_VALID_PA) {
> +		e->page_frame_number = PHYS_PFN(mem_err->physical_addr);
> +		e->offset_in_page = offset_in_page(mem_err->physical_addr);
> +	}
> +
> +	/* Error grain */
> +	if (mem_err->validation_bits & CPER_MEM2_VALID_PA_MASK)
> +		e->grain = ~mem_err->physical_addr_mask + 1;
> +
> +	/* Memory error location, mapped on e->location */
> +	p = e->location;
> +	p += cper_mem_err2_location(mem_err, p);
> +
> +	if (mem_err->validation_bits & CPER_MEM2_VALID_MODULE_HANDLE) {
> +		struct dimm_info *dimm = NULL;
> +
> +		p += cper_dimm_err2_location(mem_err, p);
> +		if (mem_err->mem_dev_handle <= U16_MAX)
> +			dimm = find_dimm_by_handle(mci, mem_err->mem_dev_handle);
> +		else
> +			pr_warn(FW_WARN "Memory Error Section 2 module handle 0x%x exceeds SMBIOS range\n",
> +				mem_err->mem_dev_handle);
> +		if (dimm) {
> +			e->top_layer = dimm->idx;
> +			strscpy(e->label, dimm->label);
> +		}
> +	}
> +	if (p > e->location)
> +		*(p - 1) = '\0';
> +
> +	if (!*e->label)
> +		strscpy(e->label, "unknown memory");
> +
> +	/* All other fields are mapped on e->other_detail */
> +	p = pvt->other_detail;
> +	p += print_mem_error2_other_detail(mem_err, p, e->location, OTHER_DETAIL_LEN);
> +	if (p > pvt->other_detail)
> +		*(p - 1) = '\0';
> +
> +	edac_raw_mc_handle_error(e);
> +
> +unlock:
> +	spin_unlock_irqrestore(&ghes_lock, flags);
> +
> +	return NOTIFY_OK;
> +}


