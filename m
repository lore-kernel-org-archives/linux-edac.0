Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781440;
	b=cuLi3OM9PY5KT1zfCdurEzndX5QNR9NY6hlV6++zbKoTvQtSePzZ7c79QaHuOVzOVRgT
	 mT7huQqJrPs7EVRTOS/O0EAE+cdii13B32U4EEshasfD7x4ce6HcLGepQbqlDqiIF3bjH
	 UUUBBXOLRuyL9WrZP7tTKNDpscf7SSzifYjc7x+T7AiVNII/0HqZysneuWoKMbqKkrn13
	 v3PaITUIpcLduYHBA3Svx7b2yC7ryO6EeC2UXy0e1EZ7Q7/ZgsBXhCq1neEgA/DW+hhZz
	 L1C21gf25wO33vRvb3rp/x518pU3GOUBF23JNnFbMGppYuQuJ+x6lncpJn7ArLjSHwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781440;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Edlnli8/pVvjmsK/V5fSAop1oIXHSuOLdm8aMgYJNLU=;
	b=rpFBjeCqoFDbNvupg3WFb4zt039MjCeOqnAfhRSrqie3GIKNEVouc5/FxMZ4vOZN9psg
	 cyzW4wCdMWGKrP1+9oH781FgTeh1GU1yJWXGdyp3lCZj4UsDkxdsopWe5SNClY2PdQAbU
	 pNgePrKAucnsuD46LjEDIZbpfvGqbYOxQOntw/5qAMIshlWVjiWN3tFFx7APoQbzgluCO
	 BEYu9zQ9V39fugsbu87QG7RjH1NAt6WkYAD+k9rf5CQtrCtdorzOU/LUNMqHb5XNSaYAi
	 tt4di0zAJGJjT67KSzxhunLfbNhe4sZEByLsXpsXmer6qqlhguAxgM8QttYTEfYh70A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NME0/zL3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C9ssFRfx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2785B606A31E
	for <linux-edac@vger.kernel.org>; Fri, 27 Nov 2026 12:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2785B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NME0/zL3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C9ssFRfx
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAsH8p3609896
	for <linux-edac@vger.kernel.org>; Fri, 27 Nov 2026 12:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Edlnli8/pVvjmsK/V5fSAop1oIXHSuOLdm8aMgYJNLU=; b=NME0/zL3lOee5+hA
	/Mj60l7TselHqAE2SvbCoAJihq0N6SaOIl9sRs65slPfhPSyAyBKIY2Vlo4MkRbW
	+PfwaFn5WjxTgoE4kcKnUv8stNlGPARGhfcGAklz1ZgcG4JBOKs5192vM/lyDZal
	5ZDPAXlYhpRLeMf8J7V9mv8IQKjMV0/DDHCeQjK0pBOMtyjK5u7fSdOMFX8c6LxZ
	nd7wiCoICVjweMbV9tqb3HU4HRDm0SVyPp0bnXBgLZ1Ff9L3MouI8equqEWkHMpt
	32kbbOWVOhSihkxsYHOiEs4blKFK0xs0W0Aqy3wH3d6So3o7vGti7Q4x7P911Dmo
	CVUH8Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh9hyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Fri, 27 Nov 2026 12:10:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc50d537cd7so284991a12.1
        for <linux-edac@vger.kernel.org>; Fri, 27 Nov 2026 04:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781437; x=1796386237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Edlnli8/pVvjmsK/V5fSAop1oIXHSuOLdm8aMgYJNLU=;
        b=C9ssFRfxwZa5kc2BV8cV0s7EZM4CtUyhCyfxO76uNWU6Tg3aMnGw5OcPF5dxsZ8QBO
         7w5iYSruqnl6jYsgDFlwsug0ml05Szcf4qAqDP04FSKtyhhtgnDB2DbCAjq5b4BdxqYM
         Djmw7sk7s+Lc8t1U0NG6OgCXAZXLv17gr3jkN23DQFKXJT+1wdJvONGiUVLVG/wYlKoI
         8oOew/3upnw81FOj0T9dQgRpbaAgEE+GOl/WGcVggb4rE+BlcV7FqxpHzNAx4k4PUV0s
         GXWHXHCoeBs2IngqUaW26lELE10ygXkKFVtQwpw+//ZBmbU9bgRnKLEP5hgA0jf8bup4
         zqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781437; x=1796386237;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Edlnli8/pVvjmsK/V5fSAop1oIXHSuOLdm8aMgYJNLU=;
        b=xPIC0xTMTihUA52nn78EFxXRnfeAIshi3zTQXQjDFvkGGhYYIOfJssAK2hcibP3if0
         lfCdPUJYg4iHu1nWH7IpksARTXvD4XUGLlJHhroLyrWyhWGq+YgnkmxZHVjERhzWGU6f
         ZTCCBdbehu9tG7o7fQiXoQR20Fx43qQWZXQP8dQCxaaYRhQrCBwkCmH7n4A7I0QArD6B
         gZQztb+1lk/zJzJR4oV2vU6GKww3IVI59Q5Qu6xDqz+5+FbSg3mmzLSwq2hU5BdoWB8A
         05SUeOEzvJAdJnuS5VRA9sWgxm4bjselFfVAugEZGap0NxOSAcgIpH1kePeV6Q6zPgPm
         iDRA==
X-Forwarded-Encrypted: i=1; AL+hErET4NTOtq6J8XTbWsIFqVbVbD/izEnekcKEnqYfKHtv6vd8TK6CjrGKwsRjUAjOkCmhxopsFaiMUK/u@vger.kernel.org
X-Gm-Message-State: APuU4Z8TIAiWLmxxFsjKm8Y8fVguNEz/ywarCv5ybI+H2Hr740olyAPC
	aOJHPvpQUS93O6JRw08FCQNSW0rgmunQZn2VQt35F8JWC/ygQdATxzsKiXiKnBw2tnwsrpvKGHo
	xJ+MFloCi7aIzsEneOhKJCGYirrgVrcJ6iXG8nEI7uq2v2rd/hm+uJzMznnihXoEM
X-Gm-Gg: AZFdTZd5Un3kvjLnwYsIgg5zhAaXoevvJ7XCtA/kuQplWrel8R+6d9FLOx9QoaPTPj1
	M6iGQtuumBUT0iWpr279jRhjW50kiFbFZpNPtfrwvZ6fJvwDmbco6j1J3LqTuiEFfvYUXf0ah6h
	nuNEEOJj1eCRYYGPS+7a64sLVBKM658usFNlxEThM+9FR8ascXcE3+TyAGFrrnkkmE+qT7CD5dg
	FZyHzl1YHzXnMWr3MwXLgXt0eWBPTE0lTdu6Flc5Vigpm4F66oJeE/Hvj2h3D+KlYavLPvv7Kbo
	K1GRhfaVtMku7fdv/8huXilYPwSx7Sdmr7sFagNi8y4BVXYiWW8d2811rvTzUxZGVweQUliwfYV
	juefgkUK364QWePFDTXWE7XyiyFNoUh2eDtZ+QmbkbglvfmUcLACNmUy+SIMVEGDXjokM7mHTmr
	VCOPMrTcEO03zQ0Izv0iZBGMK++OdDtGO0/ozWXSSHsW7Ip29CZmxHsrAbzp33fxB5DoHz+dT+9
	ro=
X-Received: by 2002:a17:902:e847:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2f03f117acfmr387785165ad.2.1795781436636;
        Fri, 27 Nov 2026 04:10:36 -0800 (PST)
X-Received: by 2002:a17:902:e847:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2f03f117acfmr387784315ad.2.1795781436128;
        Fri, 27 Nov 2026 04:10:36 -0800 (PST)
Received: from [10.149.104.122] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm119339635ad.58.2026.11.27.04.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:10:35 -0800 (PST)
Message-ID: <079e0de1-f07d-429d-bb50-c0f6b8600c70@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:40:21 +0530
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 2/2] ras: mem: Add ACPI RAS2 memory driver
To: Borislav Petkov <bp@alien8.de>, Shiju Jose <shijujose2008@gmail.com>
Cc: rafael@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
        dferguson@amperecomputing.com, linux-edac@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, tony.luck@intel.com, lenb@kernel.org,
        Yazen.Ghannam@amd.com, mchehab@kernel.org, ashok.raj@oss.qualcomm.com,
        jic23@kernel.org, linuxarm@huawei.com, rientjes@google.com,
        jiaqiyan@google.com, Jon.Grimm@amd.com, dave.hansen@linux.intel.com,
        naoya.horiguchi@nec.com, james.morse@arm.com, jthoughton@google.com,
        somasundaram.a@hpe.com, erdemaktas@google.com, pgonda@google.com,
        duenwen@google.com, gthelen@google.com, wschwartz@amperecomputing.com,
        wbs@os.amperecomputing.com, nifan.cxl@gmail.com, tanxiaofei@huawei.com,
        prime.zeng@hisilicon.com, roberto.sassu@huawei.com,
        kangkang.shen@futurewei.com, wanghuiqiang@huawei.com,
        sathvika.vasireddy@oss.qualcomm.com
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-3-shijujose2008@gmail.com>
 <20261017055852.GBatMOnEl66YObvU5k@fat_crate.local>
 <CAG4KcR+NOKHNzg6FN-oLLHgUxeitZHKXg9cN7dz24+Ap=RrwSA@mail.gmail.com>
 <20261110071729.GIavLFCfLKzPx8R0i0@fat_crate.local>
 <CAG4KcR+ikfQEBjCZiNJ1CUz=u3Gtbk_XDroA_GQqYpgO4Lo5Qw@mail.gmail.com>
 <20261121194030.GBawHzrrCNCMpfr7Gx@fat_crate.local>
 <CAG4KcRKhE1UXwrhscUdSpDJS8R0t7kWp8RXZm8j_9yXYJSQ2KQ@mail.gmail.com>
 <20261121210749.GCawIIJcidCeWs3ij9@fat_crate.local>
Content-Language: en-US
From: Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>
In-Reply-To: <20261121210749.GCawIIJcidCeWs3ij9@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX/kDvPQC+C+CY
 ZbKEO/qEUMxYTlA2Yx3f+2oY7+EdI0rJuuVGOoU3svnai3io+qq9EaXjP5bTYW+BehZiAifmQ/V
 ByckgVwUO5kQPMPqZ/CcphC2BVBiLuRNN3B4Dj4p+QRt5yeXl2RUu/jF+waQFefpZJ2jQ94PfPV
 Q5fuDZgsbZ2fOUooK6Z5QG2JqRdgLBhw1cUdHid6tsyo8tBL+19AVpTAMieo1Ka2vRWEGLLkerT
 alsjM/CgYdrbmgotSIy0w3CITGhuig4bZrX4ZUjxd/OWZJwITSI0yCoa7AMAdWgqnVmXTS/Fp4/
 9shgGAzB8F+/o/MH/OuvYhzN0af+qnP4nWnf8oJK0c859oJLAT0KPDHk4Ogcpw/32ywSDOKjRT2
 sEZHqd1hluk086AJidRhekULsgz3N6ah8QQTb35RaNhfvODa7nIbcEYDKz5qqlqk25po0QIVZER
 1legeLnrObol/eQS+ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX5qee+Jdf0TT+
 zub2UTl+XJIjH8FVOL2ugDEB94+xDH1hFuTDk0APiOUDiGHstkb3TI3LcfpQKIznCBjny1M12oD
 Y8uFBaBZR5RBGqrrhOLfWOzJfelMh+8=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09733d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PZ-A5icK-3gcoNPXnSMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 0c2rtP9SsIQOinpKcyYmL1FKp8nRgCFO
X-Proofpoint-ORIG-GUID: 0c2rtP9SsIQOinpKcyYmL1FKp8nRgCFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270048

Hi Boris, Shiju

On 22-11-2026 02:37, Borislav Petkov wrote:
> On Sat, Nov 21, 2026 at 07:53:54PM +0000, Shiju Jose wrote:
>> Please find the attached patch with the changes.
> 
> Thanks, you missed a spot. I fixed it up:
> 
> diff --git a/drivers/ras/ras2_mem.c b/drivers/ras/ras2_mem.c
> index 70f7f0b497ed..de5555d2e1b8 100644
> --- a/drivers/ras/ras2_mem.c
> +++ b/drivers/ras/ras2_mem.c
> @@ -117,10 +117,10 @@ static int ras2_get_demand_scrub_running(struct ras2_mem_ctx *ras2_ctx, bool *ru
>   		return 0;
>   	}
>   
> -	iowrite8(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
> -	iowrite16(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
> -	iowrite64(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
> -	iowrite64(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);
> +	writeb(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
> +	writew(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
> +	writeq(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
> +	writeq(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);
>   
>   	ret = ras2_send_pcc_cmd(ras2_ctx, PCC_CMD_EXEC_RAS2);
>   	if (ret) {
> 

I tested the updated RAS2 series with the readb/w/l/q and writeb/w/l/q 
changes. Below is the git log --oneline output for reference:

f2508c0f7672 ras: mem: Replace ioread8/16/32/64 with readb/w/l/q & 
iowrite8/16/32/64 with writeb/w/l/q
21c2b3102060 ras: mem: Add ACPI RAS2 memory driver
cefb17f4cc2b ACPI:RAS2: Add a driver for the ACPI RAS2 feature table
4dce97c6c265 Merge tag 'ext4_for_linus-7.4-rc5' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4


Since my tree is not based on linux.git v7.2-rc2, the diff suggested 
here did not apply cleanly. I manually applied the equivalent iowrite* 
to write* changes in drivers/ras/acpi_ras2.c:

└─$ git diff
diff --git a/drivers/ras/acpi_ras2.c b/drivers/ras/acpi_ras2.c
index 0849dd247cac..cb80fb193347 100644
--- a/drivers/ras/acpi_ras2.c
+++ b/drivers/ras/acpi_ras2.c
@@ -117,10 +117,10 @@ static int ras2_get_demand_scrub_running(struct 
ras2_mem_ctx *ras2_ctx, bool *ru
                 return 0;
         }

-       iowrite8(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
-       iowrite16(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
-       iowrite64(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
-       iowrite64(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);
+       writeb(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
+       writew(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
+       writeq(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
+       writeq(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);

         ret = ras2_send_pcc_cmd(ras2_ctx, PCC_CMD_EXEC_RAS2);
         if (ret) {


With the above commits and this additional change, RAS2 functionality 
works as expected. I also verified that the series builds successfully 
for x86_64.

For the series with the above change, feel free to add:
Tested-by: Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>

