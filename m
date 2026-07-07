Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A76A202C48
	for <linux-edac@vger.kernel.org>; Tue,  7 Jul 2026 03:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783396040; cv=none; b=MKCSEREgK5229hZ5/7vjY8MCT0HoCGvXlG1Cpo7otJvrbe7F6+ptTeNBS0/ulJn9FVCHHmoikOTbX3ngZFb+2f6zaI2oO/6GAGG9vnIChNkoSmNRp8Ubio5KrKhh5AKIxLkiggpahFqH76ICkdPl/+pkqZzeLdyShAuD/GFEhMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783396040; c=relaxed/simple;
	bh=8FuvXj43qEW9pkubgws9NtoRYm37MvdVD99ryLk9c34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6yf+TiFHLEAuG/JRIFKWUISxOxSjb7zWZ+JOGFH02c5QwYl3Cp1zBEjKAPU3g2T9EL/HCsrw0lEP42AUvOsp66/RVq7watgCcjejO9wf7jE8tQJCx5cux5N8XsS0Gv9JfqptA2Z2fBDW9zkCKaL03HBgI2O3ZGHYk8QqfHKgfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCsuMmqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFk6N1c9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCsuMmqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFk6N1c9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDogE1649922
	for <linux-edac@vger.kernel.org>; Tue, 7 Jul 2026 03:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=10l19KTCxqSqYBdgxJawtbug
	fIDCCKBH6sLy1qfvrv8=; b=PCsuMmqq4w6H8IKL4WBNW/wOKcccb1RfrTXGgngs
	i5Y4KjftEt1aheYFGe6WM5ujcx2y7DfRXzChlPcTs/rMe+X41JrJJDSGaXnaGNax
	3u3W9HUrrCcLI7mAwkfsMu+clPpxiVxzWQA1VcpAvxuqOCFl00nz4qRvqHu9Klf2
	9genqowRTUZGoDrS3anzJJT0dxsryrsR9gjmaxjJkxWxTuwPFTj7N3WBBePYelWL
	94Fhk1NOQlkLLalHLZXlmeNpurVQ9oW8dv/ZIAXDTb4ckf0hysc8GuX47/qJvt+E
	eq6aWDlZRXzSaVyEyuR5hId7u36XyYQUZALUUckKBtNjtw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgv3vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 07 Jul 2026 03:47:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so4255247a12.3
        for <linux-edac@vger.kernel.org>; Mon, 06 Jul 2026 20:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783396038; x=1784000838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=10l19KTCxqSqYBdgxJawtbugfIDCCKBH6sLy1qfvrv8=;
        b=eFk6N1c9mnpEYKAkCZNDJL86dhhYaai/4z8DzqcluC3FYyfnRkSuHruXo3ypaSDGDL
         Y/FTPyYY4mKrzR5MAIvdwl5yPuzkO22ATTAuFyy1++/pncvCt0B1s7EO6q+t3Q8q7Yli
         xnvYv8MnNegnqFELRR3FUWG5eOKQ273Db2dj8ecirFGTxaA+dNuzKHRSweTD8jXdGjqN
         O3y6RP7MQJ5hBYdMbLoUoi8vgXkbHoGrdallxL5iL/iq0NCLbWPHm+ZfB4a3OpYnDigR
         V0IKbE40sRQesixOdusMwIXz7fYD8Dv0Bx17YsIaXd73Lm6onRA2ZU5dX761SALPwX/W
         Kb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783396038; x=1784000838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10l19KTCxqSqYBdgxJawtbugfIDCCKBH6sLy1qfvrv8=;
        b=G4AYMpQrf8M7CQxFVZ4MJkZKfUP3XH85XBNTzN6fwDWSm/h37MCx+3pjyBi3JpOm9P
         4x6qQOHmpN6C5paOQ5uGIC63DYyshZBm+LVwQ7sgaqv+WSWf0RCnOtgu8rAsyUAUjZiN
         2L5Y9/6Be0cLouublzRRgZr4RpAGh9eApHGBUblfGdSj8JL9e9PV9TcWN8VvfkMxxlPB
         VhL3qSASG2RpaysldYFCYzWfvptI+bVMcuFVT2+oaRqinGPVpmAeoZFb+tiBPlsGAyFE
         SL3HRZNSJBv7tnYzPv7CUILEP8mJU8Y6KyZrBUfTSBEkGF8ODLvzZBEeuClWgQrzoFve
         XIWw==
X-Forwarded-Encrypted: i=1; AHgh+RpEJFog8a839s++N9CrQXDdkt09pxgTO5bW/g4H9mOZNHCrJ64P0euCAroiIKiss1Oxj6EIH5beSjVr@vger.kernel.org
X-Gm-Message-State: AOJu0YyrmG4gk1LV2YumQ248B4CaNcdoaTwPDT980kOt5kTP1sUXJMv/
	KVGMN/Z/05RHEvMm84BgjfOi+jgxFhujhL/xqDvT2xMwjx2b0Xnqz1GvWKLY9DdG90vcwPDjEvp
	KnwIlhcxvKJIBaHBzHPENkFZqwXKK9XMwHztmejT+B1HQXwu6UXkJp4aostlPacJh
X-Gm-Gg: AfdE7cm2v0E1A5XaRdriVIZBwbnCEzS/ZhVhidtmo8A6QbKWw4p3uDwjE/+z+xQKeFh
	HdAZHoV6cT08tNTd8qottKcbUzR8OiPFKAoTOYHPMGkHuEH868nBN3i5cJmAtJ3icxzu7URFH/K
	cOLlf3qaC5dLTehCBJhllepSbPI4PLlTqj2xj+Yqy/5Z6rpSPPdHAOR1aZWzP0evCQ+vy0RYg5q
	BcR4Pghb3MhvjcW03kQKs63H+Np7U5Io0BGxQraDeL7y68EhrGEjy/6EDY0cc4i7OllsUQGxkVO
	65GwSRfqM61BXtvnglNGw7ivLqHEGP+qnMI6626FMfadqVE8MbrukKUAPjCosWaItcXcPcS8SYo
	PRGGX+xWyhC54V5GA/Ev6nm9zRjcYPso8dchs9Xs46q2z3euj7LC3IqFZN1it
X-Received: by 2002:a05:6a21:6497:b0:3bf:b9de:854d with SMTP id adf61e73a8af0-3c08edf0234mr4305536637.23.1783396037824;
        Mon, 06 Jul 2026 20:47:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:6497:b0:3bf:b9de:854d with SMTP id adf61e73a8af0-3c08edf0234mr4305480637.23.1783396037283;
        Mon, 06 Jul 2026 20:47:17 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c76dsm2875802c88.3.2026.07.06.20.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:47:16 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:47:14 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: shijujose2008@gmail.com
Cc: rafael@kernel.org, bp@alien8.de, akpm@linux-foundation.org,
        rppt@kernel.org, dferguson@amperecomputing.com,
        linux-edac@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org, tony.luck@intel.com,
        lenb@kernel.org, leo.duran@amd.com, Yazen.Ghannam@amd.com,
        mchehab@kernel.org, jic23@kernel.org, linuxarm@huawei.com,
        rientjes@google.com, jiaqiyan@google.com, Jon.Grimm@amd.com,
        dave.hansen@linux.intel.com, naoya.horiguchi@nec.com,
        james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com,
        erdemaktas@google.com, pgonda@google.com, duenwen@google.com,
        gthelen@google.com, wschwartz@amperecomputing.com,
        wbs@os.amperecomputing.com, nifan.cxl@gmail.com, tanxiaofei@huawei.com,
        prime.zeng@hisilicon.com, roberto.sassu@huawei.com,
        kangkang.shen@futurewei.com, wanghuiqiang@huawei.com,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH v21 1/2] ACPI:RAS2: Add driver for the ACPI RAS2 feature
 table
Message-ID: <akx2wqr3ULcmpCmc@hu-ashoraj-lv.qualcomm.com>
References: <20260706000338.362421-1-shijujose2008@gmail.com>
 <20260706000338.362421-2-shijujose2008@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706000338.362421-2-shijujose2008@gmail.com>
X-Proofpoint-GUID: NxvGHH9aDME-vGexSPhNqvRx_WH6rrhj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDAzMSBTYWx0ZWRfXxmEmwaxvlqVg
 C+BNHpu8gWgBP6wL0jjalLfRGLocvlBDuIS+934CeX20TmaW5kW/gXU9p/A+Qvln7oe8bmS11ql
 nduFj/eT86dDOuH8a7z9EGgnTeXjC/ozI6I7T0e81sHmqal1itU1b4ZLf4aAeoSDAdsbsiR0Qcn
 DRXp3r4Wr1elBNrma1Vxo0ie2zUQWo3BAIOg1ldpqpmjcMitaIpFszS+PR/K37A11ZandE7EYN0
 VXbQQbBRhczs6XXhokrtxnIPNob++BFMwAHKEXMluuLmEtOZrxWRfBHDYy9nj4x2ZaCutvkhtwH
 pHQcTZ2mpBaaT20R4OR2cZT02c3kl1kb7gDKZ/LbFcHQ3BFupx8/7s4MdP3fhjLOd0mvcOXqX0Y
 dkfCFozSaKZQiM8eT1dq7M9UwhUOTcLPjfigRxlu2hoOpy7RyWwbWgi1irPbqipm3FZBs954K3+
 fcbOEGQ3yyAEexvPbPA==
X-Proofpoint-ORIG-GUID: NxvGHH9aDME-vGexSPhNqvRx_WH6rrhj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDAzMSBTYWx0ZWRfXzoWhHlPYf9zU
 /AlhWmwX4ht8FNVNeZ58MeJ/gYzVaqarGo8FH0uWmuQSbOegVY2yMqtAS40vx1yBW02q4BovWbZ
 xv/xVlq412fBrX/S4W2kkI+VOecediI=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4c76c6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Go8T6LQju8gDQlRwKi4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070031

Hi Shiju

Thanks!

On Mon, Jul 06, 2026 at 01:03:37AM +0100, shijujose2008@gmail.com wrote:
> From: Shiju Jose <shijujose2008@gmail.com>
> 

[snip]

> +static int register_pcc_channel(struct ras2_mem_ctx *ras2_ctx, int pcc_id)
> +{
> +	struct pcc_mbox_chan *pcc_chan;
> +	struct ras2_sspcc *sspcc;
> +
> +	if (pcc_id < 0)
> +		return -EINVAL;
> +
> +	sspcc = ras2_sspcc_get(pcc_id);
> +	if (sspcc) {
> +		ras2_ctx->sspcc		= sspcc;
> +		ras2_ctx->comm_addr	= sspcc->comm_addr;
> +		ras2_ctx->dev		=
> +			sspcc->pcc_chan->mchan->mbox->dev;
> +		ras2_ctx->pcc_lock	= &sspcc->pcc_lock;
> +		return 0;
> +	}
> +
> +	sspcc = kzalloc(sizeof(*sspcc), GFP_KERNEL);
> +	if (!sspcc)
> +		return -ENOMEM;
> +
> +	pcc_chan = pcc_mbox_request_channel(&sspcc->mbox_client, pcc_id);
> +	if (IS_ERR(pcc_chan)) {
> +		kfree(sspcc);
> +		return PTR_ERR(pcc_chan);
> +	}
> +
> +	if (!pcc_chan->shmem) {
> +		pcc_mbox_free_channel(pcc_chan);
> +		kfree(sspcc);
> +		return -EINVAL;
> +	}
> +
> +	sspcc->pcc_id		= pcc_id;
> +	sspcc->pcc_chan		= pcc_chan;
> +	sspcc->comm_addr	= pcc_chan->shmem;
> +	if (pcc_chan->latency)
> +		sspcc->deadline_us = PCC_NUM_RETRIES * pcc_chan->latency;
> +	else
> +		sspcc->deadline_us = PCC_NUM_RETRIES * PCC_CHNL_DEFAULT_LATENCY;
> +	sspcc->pcc_mrtt		= pcc_chan->min_turnaround_time;
> +	sspcc->pcc_mpar		= pcc_chan->max_access_rate;
> +	sspcc->mbox_client.knows_txdone	= true;
> +

  Probably a minor nit .. 

  sspcc is published on the global ras2_sspcc list (with a live kref)
  via list_add() before sspcc->pcc_lock is initialized a few lines
  later via mutex_init().

  Once list_add() runs, ras2_sspcc_get() can find this sspcc and hand
  out a pointer to it (kref_get_unless_zero() succeeds since kref_init()
  already ran). A caller doing so before mutex_init() executes would
  end up with ras2_ctx->pcc_lock pointing at an uninitialized mutex.

  Currently harmless because the only caller, parse_ras2_table(), walks
  PCC descriptors strictly sequentially, so no second register_pcc_channel()
  call for the same pcc_id can land inside the window. But it's relying on
  that being true rather than the code enforcing it.

  Should we initialize the mutex before publishing the object, e.g.:

        mutex_init(&sspcc->pcc_lock);

> +	kref_init(&sspcc->kref);
> +
> +	mutex_lock(&ras2_pcc_list_lock);
> +	list_add(&sspcc->elem, &ras2_sspcc);
> +	mutex_unlock(&ras2_pcc_list_lock);
> +
> +	ras2_ctx->sspcc		= sspcc;
> +	ras2_ctx->comm_addr	= sspcc->comm_addr;
> +	ras2_ctx->dev		= pcc_chan->mchan->mbox->dev;
> +

> +	mutex_init(&sspcc->pcc_lock); <---------------------

> +	ras2_ctx->pcc_lock	= &sspcc->pcc_lock;
> +
> +	return 0;
> +}

Otherwise 

Reviewed-by: Ashok Raj <ashok.raj@oss.qualcomm.com>

Cheers,
Ashok
