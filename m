Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16BA554089
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993394; cv=none; b=UDUO7yjgmLYSLscD/DbtncacLyKVwfA395l1ttZowdiAhEJ/my8yBjlwiy6Iaj6e/p+p/xrs0RYloSdqNoAao/63+KnIVXh1X1GdCjutjlJn404qU8s9cyembhBMQ7xpBwokT2ymEMVD2qFnbF1KzqPW8K9uzy1fYzOKGbuht48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993394; c=relaxed/simple;
	bh=QcP01yeYANmnSOpCckxi4SHgUGs/ns1aGF7CqSeJ3UI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TJabuvwrV4KW+myRVRIM1wN2WoK6iz9fZS3tACgC9h4GU7jcFZFBw5A/MyHV9X7VAGcOj6s6nR5t5F1hda2nRwAzin8mxcLyZi3Yy+ApZUruim41FrV23i1LGSeaKWA2ehyHjjJpYzbZbB0q8MJ8tmZcKjD0blHhN46RsIR/7zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvjzfRk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jp672+6Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvjzfRk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jp672+6Z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEabGQ500266
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nRN5mwPXK5jua7t9LUgDQO
	MkK+R4yZYyk715f9CNhO0=; b=VvjzfRk5J6Z9CkwIJwodw+ihTsee+ukv63IqOX
	Q6WCjbh4ntyQsNl40UV0YtscS8XbHAdRr1bSL5Lwkxd3jYJQPOdWAsMF+a+byAjn
	35O78uSyLMmGd+S3EukL4LU1QVoUfA12dDj4tlsGrsIO+mHvy2h/ZVFhFiSukeTS
	/5Acr0uNCgHGOGLKOD4cwQwAiEsEXn1PgSImFhcWwDYowpNtjbqbzh7eX6aqwZqw
	8vgCAyuoLnXxJdI04NgbxrW+XRC6Gke2cjuUNaC8UNVrSr9A3/BXMS+HiAmXJ7uz
	XqJT2pK4mL6e28eD/AIb7o8SWS8IbWXweKZyKtMVnlRUP8gQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf0mra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f266d20so10970105ad.3
        for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 08:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993392; x=1792598192; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nRN5mwPXK5jua7t9LUgDQOMkK+R4yZYyk715f9CNhO0=;
        b=jp672+6Zkhosq/ND2YWmwYTaPbVF5cFpfUs3m1bOs3AM2qfb+yh2728EYr2j9SkINn
         Pum+GRsdrWNpdxhRJ9cz2xy5kJkAyh568n9EhUccdr9EdBfMv+tBHIicelNT4F54MIYJ
         ArFLuKZk/Nl3HnrBlC2yAaNEnLmPr2XxTsCejevvJiIp9NftC5Fo/BUuQx0BOKeGyP9+
         Cv+hAIzJG0GJnxPh9XPfKiCRNox2wcp9lYOH1H+LJ37ZWmwOZxChSSuEuCcFKj85BvcH
         QO47lcFrKmcgEr0h478K+WhGBklhudr6nk1WSTkvLBC34x9OHl4RrumcvSAcBRhX+4oc
         L7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993392; x=1792598192;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nRN5mwPXK5jua7t9LUgDQOMkK+R4yZYyk715f9CNhO0=;
        b=ElwQZreQd5h4ey9/OwvLVCPQsIOA++oKRlJaSWzOdehZA2jB1aOfKZPQIiHchYY8fb
         C77D/yHQMCYIfDzJeKulmYzW3QHk9rxPS6z3HvgoUlzhZIqY2x7JftWRduYYzJoLYUFp
         ktEZxNRFA9phvLVVos5ELJT55ThvTsExdY7CPOazGELsyaxP7GFShN+wgKlrLiLfuuiK
         T0zxjFZwYfi4J/kgyElbu/qYNxev+pDGFMB3MAIyGGp6ONFQSrcBiMKgHcMEV8jM13ns
         /Jl85hzrw1GRMqFI9dclEC+Br5YeWhNTGbnfmSenWL2BoyieoI7YJsL1kWrXa/U47EBl
         9IsQ==
X-Forwarded-Encrypted: i=1; AKwUvByVTV6xqfKtGvXhGIUL1W6RM+fdLb5vxprLd4aw6ark0vEAMiGIcGLiQRXXsDYuB1uAM2bIWHOpxqIz@vger.kernel.org
X-Gm-Message-State: AFq9FYIDrRkiD5zvMqu4p9vXtz2rqH/shK577rlsToVuNheELkMPL/xO
	mcJ1a74cmpAupoJUo257tov4YX+WJfSxdMbpD+T6YSw9LAtMsBT7jVwTNfxJ0IKDSwhF0igFxSr
	OQh3fIKI0kI+aV/iqZYqVeG6kCkAGBEH0gcUxliShkw5R90ntYuuqqdfH/31tNecn
X-Gm-Gg: AYBFou1IeJpHYauol5H+nY06I8EV5bl+fHvXXBes7g/0RFI43VXRqsuOMWXXrTuOCDp
	DqW7lyN6CVEz5k5T2y+hO0j5R7Yr2VLD0FWqxMkGqeZ9AyFYhKV13Phnfhhua1blTdTT+sEHlTC
	Nfnk2voX63SSzRJMcPNHwrfmXx4bFnRDE65BSnwZJTfR+xCO7nqLt/P8+acDpuUXO3+2liBJ1wp
	MqPJR9I6D9QGGI0OAq1+qgv6Yt0b0dzdDlcknb0qFvw9QtPkvCwzGL7kSA0vOhBnmVRfI+POi1X
	shBpbnNVyvJydj22akhIeJX4DykpHEC68L/v16GaQJj8Fg9Ayou3MXfq+u8sdzF9AJt/AOvXIsb
	1hROFshKWHWuoLphVHqZs47FCUMMwr1/Y/g==
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr158861415ad.37.1791993392135;
        Wed, 14 Oct 2026 08:56:32 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr158857925ad.37.1791993382906;
        Wed, 14 Oct 2026 08:56:22 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:22 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Subject: [PATCH 0/4] edac: qcom: add DDR DRAM ECC reporting for Shikra
 (QCM2390)
Date: Wed, 14 Oct 2026 21:26:15 +0530
Message-Id: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+mz2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMT3dzE4pLUIt1EM2MLwyTzNFPjtDQloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AIWU//WoAAAA=
X-Change-ID: 20260824-master-a6381b7f53ff
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX4ytZYo1+D23P
 sYAx4k+DwFnuWhMKaZ1V8Xw9GSo4ral/uIxBamJFTkgK6awUrfjQ0PWkhb3Q2Shs5jfjUrt3Z1N
 T+ACYXW7GmGk79ydmB35BGzLI2QXUF4QdgiTF667c3NoNOb0DT9XOcMKZJp0nKcEa8/e+IiD73Q
 WEFz4jq8hDUK7dajZlG1sr276M/YaoH+HF68S6ow8uTjNNvPRrM5XCvRUa0FCY5wehd5s7QpRwJ
 z4c0H8raB/Onz4GdIe+Q1qPWlInzlLWN6efM9AnHugKM56R9+eBFe+Izn5fRCIK+6vkY82ntRNp
 Q05I0z1HV6seJ0/86EmHaVSGwP39RvF2tGH1MADKw4YQnIEensh1hNt+cPdYtPtlRo0oMKwM+qf
 3tagTxg6izLZNdDeEPROEuYLzaUDVTkIpVmTG2ldurPDhfYNKHXNZpS3IrJ/uZoJXk6btW+yIV6
 qhaNLNqhD6YcLRcpThA==
X-Proofpoint-GUID: 45Zs8cCsAYPg6g-_UacOjZO9zxOqSszn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfXyfZpkAH6XtI1
 ms/+1Q6UdwhAjQ2UucqBjYeJq0jB2bBi28v+bbLaOFobAtcedfGRZEjWvunOh/NZ2jqFvN8FBa4
 dDgBkYbf8YXXf4g9f6vMyGjDu9gpxjY=
X-Proofpoint-ORIG-GUID: 45Zs8cCsAYPg6g-_UacOjZO9zxOqSszn
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acfa630 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=28_99TRhucPTTWWXKPwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140063

Add DDR DRAM ECC reporting for QCM2390 (Shikra) via the LLCC EDAC
driver. The LCP/SRP block between the LLCC and DDR PHY signals CE/UE
errors on a dedicated interrupt separate from the TRP/DRP cache ECC
path.

Patch 1 updates the DT binding to allow an optional second interrupt,
adds interrupt-names ("llcc-ecc", "llcc-lcp-ecc"), and enforces both
are present for qcom,shikra-llcc.

Patch 2 adds LCP/SRP register offsets to struct llcc_edac_reg_offset,
populates them for QCM2390, and adds lcp_irq to struct llcc_drv_data.

Patch 3 adds qcom_llcc_lcp_setup() to initialise the LCP block and
llcc_lcp_ecc_irq_handler() to report per-bank CE/UE errors via EDAC.

Patch 4 adds the second interrupt entry and interrupt-names to the
Shikra LLCC DT node.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
Faiyaz Mohammed (4):
      dt-bindings: cache: qcom,llcc: allow optional second interrupt for LCP/SRP ECC
      soc: qcom: llcc: add LCP/SRP DDR DRAM ECC register offsets
      edac: qcom: add LCP/SRP DDR DRAM ECC support for Shikra
      arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt to LLCC node

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  26 +++-
 arch/arm64/boot/dts/qcom/shikra.dtsi               |   4 +-
 drivers/edac/qcom_edac.c                           | 147 +++++++++++++++++++++
 drivers/soc/qcom/llcc-qcom.c                       |  45 ++++++-
 include/linux/soc/qcom/llcc-qcom.h                 |  13 ++
 5 files changed, 231 insertions(+), 4 deletions(-)
---
base-commit: cbf6c6b201561342d673223d1e59ef771c7a9dbf
change-id: 20260824-master-a6381b7f53ff

Best regards,
--  
Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>

