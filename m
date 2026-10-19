Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427818;
	b=EJSimFGTrTRSe4tEHcG76DU/eU9ikb6tkdLB5kyO4uFHSNeazKPZokRsq6M8UfmPY5Qj
	 C1WdV7IzEOMxs2vTsuxc0cDEJjC4C1MQFJzkFYcEeKWPA75bcLr6zYhFE2D5Apf0P1wIs
	 p0880OZlAjylPEhtpM0RY/AsfVyAhS6byt5cc3/RwUy8vYScBm78Qup2xnFJrjt9hLcAd
	 kWMo39yxXSBTjsWE0X+rtsukv3CcrGSE1N0EjaeWrcsAPS4Aw3uyBAYGTpDJjGVSjDKrh
	 H1G72IUsZ/HsNjv7UaQ2VnoOwY+jl6dpdgwgkBnWK3kmjqeb0gw8Qof+C9ZITJXcnZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uTVSO8ab0jQ/KjHFQURA4S+jRgewRPU6KcTy4l+JKt4=;
	b=0CZNLOt7W2/K3jXO6Y2yAisDBqX2NytZqYsi1KtOnBF89VgEOny0FA1hISphEdiEc8ym
	 Qq6/nNuwpO08HzT0mYAIbxVhdwwAzOMGIYBN5EQZk8ihHwfSTSOgCLSah9uRVRbK7mtcj
	 hYQt1rmFZ9zEwGK0B4LQpUkruzvq/4KNkwunel+IBnnwQysnr0MI5r6vC1+k7+db4kDjo
	 /Jp2xsb2xwQy37UBMgS3/z+DVQsOrLBEDzJLfPlTnPT/aClnHSEV1Q/SuFkm2dJXUeO31
	 Ugqiy7MDwCd4VQgMp6x7iRZoS0WbWFKLrzVc5kfJnEEvvkJTOc6mpDdg165Qzh7UQ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=azHp1q7f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G2Z2JlTn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D45606A31D
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 16:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D45606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=azHp1q7f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G2Z2JlTn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFOwDU035975
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 16:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTVSO8ab0jQ/KjHFQURA4S+jRgewRPU6KcTy4l+JKt4=; b=azHp1q7fFlayj682
	T/VARjrDTiPkCoAzbrEhkv5N4zr9RyByqFCSUaojW32+2aUJK1SkDMuw39ScaRKc
	OnvAmeMXBTQdg/azB3dFJt2fog+F/NLMl9/aubFu74LcqLgotTAuJ+rKPqBvWIqN
	6NvzGdqW8yQ/ru2SjpIwNuGOPnJT+qOPA6NJCVLDqN/NHp3tyEZQlayHYaDfWx4S
	uy0S/gBW7qBIXOj3IBUTkQ5jFZhu8Zz1ngzQ/PnSDPjzx9eDTmFTQgkKkYBS6hzc
	me0gddDb9T/COwyB/Mn8kWfh156r5vLsUaygLKEOgNSYwhBqu65yYt3uvUWtSx4K
	aLcSXw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47j8cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 16:36:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3592749a017so2381290eec.1
        for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792427816; x=1793032616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uTVSO8ab0jQ/KjHFQURA4S+jRgewRPU6KcTy4l+JKt4=;
        b=G2Z2JlTnCQObFnglXbWhjlwKZbzzNZSy9LvfaWBKq+nU/9ftzJ8i3tNYCMiBENuf8N
         HG/0Be72qS8GdVSSg5Qr3uchXfRrNlRkVfj0chISzazgA1malT9mtZHNzfYUheJucrm2
         YngrLpm0GGW9wu97gpSBywoI5fIsGARfoPWHYZ6muMHoJ6dKJCWruZWyRL+eU9VGJgej
         6Ac6TdqK7AVwUnEU9zbabhfyGHqNOplEke98+U1L3BgaAl7B5kvVwbS0130xXnSoplmo
         8GfJsqXzQfrfT8EpyQ5992MBHVlbID18PiIfVoH5U774oj6N9r6kS3eeysBVRHNHEUeX
         IiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427816; x=1793032616;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTVSO8ab0jQ/KjHFQURA4S+jRgewRPU6KcTy4l+JKt4=;
        b=OE57AAo8ErMwgCflD5TdS3ctD+Dbb3yVQc0E2LSbLaYxdiwgOw6CCnmO9EGeHyP3Mj
         JbJlI2Ztw2HsXAkyxCa+LdygwhSCU5A2Jt9hRuqmp837LFKbdJeu2C7YOUW9n5YQGmjN
         Wa6iXIqEfBpdFLGr2Fqibj/pgwB//iDXMnvXL9oMQrgRaThnuGFNyURTKCzitoiHnL+f
         6+TekjMMJZz76vHRJsCqgs1qHZ1h1rRM2lGpQaHIqXxO0BjA8STGBjZIWJRBkXgM+tb0
         VsKLcdTt5pSIx8t44g3RNsJeAf76pk42MUNSaRwXLG1jC7GHsGSJiK8z5OAF/o9gqlTk
         yL0A==
X-Forwarded-Encrypted: i=1; AKwUvBzx9Rw+kZL49LdNRSS08KR91wYvbzs07vnlM7XlQ1yuBv+se9mlIB4lIr/wF+HNw7Itsis0jRzuSpcX@vger.kernel.org
X-Gm-Message-State: AFq9FYJqFCHLx/HDACH1c4zxh8oEUuL8DQk8xI5AB0OVpLKIt1rG2eIU
	cOm440U2cSThS581S/r4msCjwbIPOt3CbEOJC4eMAN2Hil5DSIvG/2mHz43vyyN9AvztrQNJ9ct
	rJuXQi5HPD1StKPL2bxk1jxDqHrOnU1l38N3uIwqE57iYushYAkYwyoCZIh7gAZmW
X-Gm-Gg: AYBFou3CkTD0QF636RVVS0qIEtSkTqY/K3imneOVkzn3OP/wqxpmte4+ARxagDiUUa0
	h1EC6nsQiICttr/l2NpzaJmlV1VRrANzk9tr5NJDyFTLcspyjkPA2kNEu/GkezRlOW1G+bKsDnW
	KzIWcyJqVWXrsEP2ocQoohBFWR53qvY6+4qpPPQMbl5ua0aCXVuk7JjSP9d7G5nNwuaKsDC8vIw
	WQqIfEdrvnyKBPSxWfagfJKfpJEACXyxP2aLexixsdFTZ9ISVnzZrFysFbtIQFtkvq4786GtVI4
	s6yE2lJl7sJlNuugqDkvyniWfvTubAM4rNgz5etsJuwv3TKU/tvxmcGzVoAqBsUV6CmRDrQdRzK
	h0yA+WHbBXfdWRzpiIAV7VdRWE7TIoibYnwWmd/wwlls=
X-Received: by 2002:a05:7300:f0c3:b0:35f:ab1:4792 with SMTP id 5a478bee46e88-3602d6e460dmr15502764eec.6.1792427815632;
        Mon, 19 Oct 2026 09:36:55 -0700 (PDT)
X-Received: by 2002:a05:7300:f0c3:b0:35f:ab1:4792 with SMTP id 5a478bee46e88-3602d6e460dmr15502724eec.6.1792427814904;
        Mon, 19 Oct 2026 09:36:54 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608219f838sm33529919eec.19.2026.10.19.09.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:36:54 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:36:48 -0700
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
Subject: Re: [PATCH 1/6] ACPI: extlog: fix extlog_mem_event build issue
Message-ID: <20261019093648.00002db2@oss.qualcomm.com>
In-Reply-To: <20261019145643.1877246-2-pierre.gondois@arm.com>
References: <20261019145643.1877246-1-pierre.gondois@arm.com>
	<20261019145643.1877246-2-pierre.gondois@arm.com>
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
X-Proofpoint-ORIG-GUID: lLtg4yJs-URV6MwtNQkkT5i9IPxdL8tX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX7Yw9MAE6nXyc
 53Gk0DOyv+1nn+sIVvUJeCmB2frF+e1n1tgp2AJf2fYm3RLe6M56hZ8SpqRTGDNfipaM/aMsCKN
 U3mwOcW93bRGhJjCJFaqbiIUf7MfMO631YvC8dMHnNRTYCsV6+9Uq/dtSM7Awj8wKTl4BjqzVA5
 CETaEoBvL9fd9MWw/AsiinjF/j+ksbdG80PkoS3YQFat/ouVpJzd07O+Up3el99g9P4i9UWQRU4
 qU4FCzfzt4mRkrvDV6D/ROjVwPBmKxXbGLjdRUDnyPWHcjrYqOmyzIobA2eXV5tShsSjYJmurte
 TKEYtEq6kTJJA4LBYv30JL1ENu3zJ33ME2z+pe3TMckOwtQzKF6tuOAnY7MCJ/e1XGE9s91/ksF
 ftAV29guzzbF2F7wW10sEKnREBnzQQaZ9R6HQMMkd7kurT0qdAUpn4zfa2qF0DMN9z8EII1STaL
 bGB+6e1tFbpW1y4Wxuw==
X-Proofpoint-GUID: lLtg4yJs-URV6MwtNQkkT5i9IPxdL8tX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX0JaqWriW1QPf
 xhgIjtoV8gtY++9wpo5mLmItgaNinnhaTrIP2Y1prMeostaNwTXLg4bBznN5BqXQoCz3HW9YVhP
 MFcccHp8w+7mYFqWPyJq5zD4Bcva/PE=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad64728 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=crxqeblGBJ-rV0e4J-MA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190066

On Mon, 19 Oct 2026 16:56:08 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> With CONFIG_ACPI_EXTLOG=n and with the following command:
> make -j4 drivers/acpi/acpi_extlog.o drivers/acpi/
> 
> trace_extlog_mem_event() is not defined. Add a extlog_mem_err_event()
> wrapper to fix the build issue.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>

I'm lost.  This file is normally only built if
CONFIG_ACPI_EXTLOG is not = "n" so how do you get to this code.
Ah you are forcing build of a file...

If you do need to do this sort of ifdefery it belongs in a header with
the function cleanly stubbed rather than in here.

Anyhow, far as I can tell this doesn't make any sense for
upstream.

J

> ---
>  drivers/acpi/acpi_extlog.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index 7ad3b36013cc..e764d61f71ca 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -180,6 +180,15 @@ extlog_cxl_cper_handle_prot_err(struct cxl_cper_sec_prot_err *prot_err,
>  #endif
>  }
>  
> +static void
> +extlog_mem_err_event(struct cper_sec_mem_err *mem, u32 err_seq,
> +		     const guid_t *fru_id, const char *fru_text, u8 sev)
> +{
> +#if defined(CONFIG_ACPI_EXTLOG) || defined(CONFIG_ACPI_EXTLOG_MODULE)
> +	trace_extlog_mem_event(mem, err_seq, fru_id, fru_text, sev);
> +#endif
> +}
> +
>  static int extlog_print(struct notifier_block *nb, unsigned long val,
>  			void *data)
>  {
> @@ -229,8 +238,9 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>  			struct cper_sec_mem_err *mem = acpi_hest_get_payload(gdata);
>  
>  			if (gdata->error_data_length >= sizeof(*mem))
> -				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
> -						       (u8)gdata->error_severity);
> +				extlog_mem_err_event(mem, err_seq, fru_id,
> +						     fru_text,
> +						     (u8)gdata->error_severity);
>  		} else if (guid_equal(sec_type, &CPER_SEC_CXL_PROT_ERR)) {
>  			struct cxl_cper_sec_prot_err *prot_err =
>  				acpi_hest_get_payload(gdata);

