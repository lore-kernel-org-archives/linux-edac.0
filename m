Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86D937E317;
	Sat, 22 Aug 2026 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787392166; cv=none; b=iv//5gubCwI8Fj+hP/gcVR5A0x34fJ8XsEZZ+XOZ9O9xwQsI7y1WY5q6MVvwStzmvJCARB1hnz1rRko5jT3OhSkVxPK+2rIBvYO+lkfK4hTM+LWJ3mtR5/PV8YrZMaQuSQH1IhQdhV4DENXUobPtCJtkUZCKhmFTT+hx0fnsXIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787392166; c=relaxed/simple;
	bh=b9bJ/EELcLvj8tBhocQPyPdPu2Dp9FBn/pdNhsLkhjY=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=nkSzm8IrIxPv7xi4qYcCnWuscG9qcLgW875z1kkhLTn8qgtAblKqPBCo8i2KylvUZSmPn0KfWzLWiiO0+ofaeWvNIkq+TyR/GxSHNo2ZbWjIgw+wx5mfqAoNS/uD0oxJ5GabOcMDAo+tApyiwrjQJcTzTGneiG0erioCUxzl2a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=R9RBNhFl; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="R9RBNhFl"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/JEV3LaVrAcf7LMV/isUWWWZzvWlQSb+qzfTWqe4dI8=;
	b=R9RBNhFllahY/WKEso8l7h9pEyAJELLDOIFPpn9oJRzpgpFxdIegXv0NfJGmPoxtBI9hxF0yI
	23Zzp7V137Mi6kQGoBHjONg7thW44uNGjbaHEY+cnZLBDLVqp/hsYXrX4WKaCE1uwBJrD5MAnnn
	t9h7s2qdiYvzHLIH2ssudG8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hRsYk6CxLz1K96b;
	Sat, 22 Aug 2026 17:38:34 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 318D34057A;
	Sat, 22 Aug 2026 17:49:18 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 22 Aug 2026 17:49:16 +0800
Subject: Re: [PATCH] RAS: Fix out-of-range section_length in ARM processor
 error handling
To: Abbott Liu <liuwenliang@huawei.com>, <tony.luck@intel.com>,
	<bp@alien8.de>, <rafael.j.wysocki@intel.com>, <mchehab+huawei@kernel.org>,
	<ardb@kernel.org>, <jic23@kernel.org>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <yangzhuohao1@huawei.com>, <douzhaolei@huawei.com>,
	<zouyipeng@huawei.com>, <wangbing6@huawei.com>, <nixiaoming@huawei.com>
References: <20260820131829.1006371-1-liuwenliang@huawei.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <de8df7aa-794d-6b7a-29bd-cc7680d47f1f@huawei.com>
Date: Sat, 22 Aug 2026 17:49:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260820131829.1006371-1-liuwenliang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500002.china.huawei.com (7.185.36.57)

Hi Abbott,

On 2026/8/20 21:18, Abbott Liu wrote:
> Commit 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past
> allocated memory") added bounds checks for malformed ARM processor
> error records but contained several bugs:
> 
> - In log_arm_hw_error(), the ctx_info bounds check is inverted. The
>    condition `sz + (long)ctx_info - (long)err >= err->section_length`
>    adds ctx_info->size when the context header is already past the end
>    of the section instead of when it is within bounds. So change the
>    comparison to <=.
> 
> - The vsei_len < 0 error path did not verify the pei_len and ctx_len.
>    When vsei_len is negative, section_length is too small to hold the
>    full record, yet pei_len and ctx_len were derived from
>    err_info_num/context_info_num and may describe regions beyond the
>    (long)err .. err + section_length buffer. To prevent trace_arm_event
>    from reading past the allocated record, sanitize the parameters:
>    move the cpu lookup above this path so it is available for tracing,
>    recalculate ctx_len and pei_len based on section_length, limit them,
>    set the corresponding pointers to NULL and lengths to 0  when there
>    is no remaining space.

Please do this in two patches, one for a single issue fix.

> 
> Fixes: 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past allocated memory")
> Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
> ---
>   drivers/ras/ras.c | 34 ++++++++++++++++++++++------------
>   1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
> index 03df3db62334..e37bf11d0926 100644
> --- a/drivers/ras/ras.c
> +++ b/drivers/ras/ras.c
> @@ -58,10 +58,10 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
>   	struct cper_arm_err_info *err_info;
>   	struct cper_arm_ctx_info *ctx_info;
>   	u8 *ven_err_data;
> -	u32 ctx_len = 0;
> +	s32 ctx_len = 0;
>   	int n, sz, cpu;
>   	s32 vsei_len;
> -	u32 pei_len;
> +	s32 pei_len;
>   	u8 *pei_err, *ctx_err;
>   
>   	pei_len = sizeof(struct cper_arm_err_info) * err->err_info_num;
> @@ -74,27 +74,37 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
>   	for (n = 0; n < err->context_info_num; n++) {
>   		sz = sizeof(struct cper_arm_ctx_info);
>   
> -		if (sz + (long)ctx_info - (long)err >= err->section_length)
> +		if (sz + (long)ctx_info - (long)err <= err->section_length)
>   			sz += ctx_info->size;
> -

Please leave a empty line here as it is.

Thanks
Hanjun
