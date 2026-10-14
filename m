Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5F6545D84
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993417; cv=none; b=Z/jqfRLXH8VlF9IDISaJnTe3rTgVuYaxe8GF9mCPtmhI998/nRtCezeNgrb++Mf8MqTeWwawtGGFlFl+YQvcZhk2rWa4f+Dkq3R7Ag1ahtgAeqz/P33UMGJSyPpxnkMxO1JJnLWvS07xqiM82QLxdhhYeeOXuwXMN8oveH3/ssM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993417; c=relaxed/simple;
	bh=tj/l1Z8D3QeZ5hX3y3HdO8/L7MlfV3oYPsAcQ/h95ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdLjH6vQzfIEiTKFvs1Kt4q0uxp+Rl2ydgezS28aa8IrD9doNuDe/wL0qAcS0Ivhu2ZDOF+mcotwBjx+2JAnoqKJ3LT8Lmhtkv+gytATpuIkuIKoDRT1m+t5YQd2X9aMRev124T+3GkX8eOdVR02otdZsJtADRusddDaUs4p4Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahNsOuAr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNY5hqrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahNsOuAr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNY5hqrh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EF4EFN4167050
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=; b=ahNsOuArNck9oUBA
	k7y6+41pWv7mHKW2P/C7Hp0xeEwaI9BzpicwJ3cIVmn4KLhfdI1S06Xj0puJc43r
	8c71y3nc6x6UCulfFoXoZIb+BhzfXhmk0sfNGYOjDNhfRsxS9SX8Bdtl2+2PC5wG
	c65T8yt3cjjPiucegDM2b8HEKzCgo9AgnxphaiGxHY03uJF+zlNGLcG0TbJVeO3+
	RYajGVYxyk4rchiAVRaiJt98ECrjEGJpY+V4klmfQqGQgjggkMiWtMO1Gh4LOWEv
	RVrWVvBaWeqgKSrP2tZ+IuUSoQ445yMqbec/B8LYCXflAA0KNR/7HqWsaaMA3xkb
	JBuY7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hac2306mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e869e00005so13558325ad.2
        for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993415; x=1792598215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=;
        b=VNY5hqrhW0+/O0ZZybkuqVB0HzP8WQN1/2KMEHaqqiP1qZ0VoPhMrCLHFN8fX+uwIO
         aNWDwzu+5WOlKhIIFH9Trh51KzK9gi4IfFkjnxrPtknhwf9EfszG8RMoD5ulTph52R52
         baR6/r/owvCjWuTpGXoLqZwJo7Xq3JPxZCLBLalnlTwHym3vMIGmM04RngstS5bramQ6
         SYCUQN2NzoMw9bAMFkYUbtWIvlb13KITFv9HmZK8Kp6PrCsD+wYoZQ56FOVzV+YGWKh8
         nSftO2t9QcclTtGzTecuQ5ROZyBSXoA2Z8qUHRttitU88w9FYcLA2p9JAP5BZ3ThJGYa
         lQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993415; x=1792598215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=;
        b=TrF0WKbtLMTmYUP29xm5dY/9ftCMRQ2mHpaE58l2Bd8Rs8BCZUVMbI1OLk8yRI0k66
         RzimHs/k9KZFAIB88P8AbL4Y0iDjUVxPC1dGL+bDGRFvxaVRrmjzDwcrLJr/M5GyZm9X
         Yr5Cp/3ERNJKYU1BCVqaNctVYZt38C+fUcl0r9Rvrg6apAmsBw1yqRad5ysm1D4li3eH
         9AkUjFCRv5GhTbn0VQS0qakRD9/FaZuUK3qZ1JA/hhKQWTZlHt0xSOPA07QIzPzfW84t
         aNpjwz3nT+fx6oDgrNzhZ4J9keolfsonurzZQAZnu9ziusFy69a1WsyrsVMUlqxcovKJ
         IeuA==
X-Forwarded-Encrypted: i=1; AKwUvBzZdzpqIZf/oioXNe2Dvr/VEZ2Lpw1bxp2FogKtjzNaAxFXW/F5aFCrlpIoDDssMuBdDk28SGw5soRY@vger.kernel.org
X-Gm-Message-State: AFq9FYLCXPs73IzdTcERdLNxuLiTP0VuWGmh09d36bDY3nbHaDYluZYv
	EM9/9Oi2gaRrTcg4Iywjc8sYMpX1/KZqWiG9WrrW1QKBvYzDOaCEB0o6MC0nzgb7nr1mBhUB+5p
	o9fWe9oTXUKj6F7BzzbsFv96I8m/kNCIivDEyA+3wsrVt1lgIHFFiVkcuhg7pMCJ7
X-Gm-Gg: AYBFou23/jO3zdAuYqfvOnQaHcH3xbFlTt6rtdE8KzLXY/qgMBDNGlCs5pzRCpVZMIM
	7IMXEgsuwIV0xTVhM3oooal0Kc9Rv9XM+mFUCISRBAhdaL4qlUSExL03kQ2p4shmpftFbiO2KC3
	sKUjJgQ3u2/6PnXfvSJA/hTEOhi23AaNHPj96VHkmLq/FLh1MQA71tt5VoCL7VF15NLvqWvrNNQ
	8f5ughSCr/W6EA0RaabYT6JRq7SAJsn7nDSVrrpNC6CAXY4vjEqVjSblMbgSoOW67VYPVCUjUpc
	UdLLU3T5aIZ+RN0ViDIpUZm/6/R+7aX6Uf52efiMJJwB5dPs1HLvhW3+HpmEhJk3DyKcuoOjnuR
	DUK019029w0/2v83rU9k8I59xkt5n8r+yrg==
X-Received: by 2002:a17:902:e88a:b0:2e2:d02d:a173 with SMTP id d9443c01a7336-2e842d030acmr162945265ad.49.1791993414850;
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
X-Received: by 2002:a17:902:e88a:b0:2e2:d02d:a173 with SMTP id d9443c01a7336-2e842d030acmr162945045ad.49.1791993414343;
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:26:19 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt to
 LLCC node
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-master-v1-4-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
In-Reply-To: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6acfa647 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=E534aFlItmYAAoDkEE4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfXxeKbn6J+uVB2
 Zd76v6pujt6dLcfCcVut5qPDPVvyaAbGeaaetHsJd/JNOaJIZmEy2TxcEjmVzE/k7uZQ1v+2SPs
 h1Au3vud/Uzq6rkzX0Xit99+9gtOoXw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX3dV+KF6NdQra
 AVQ7G8KoLVe29mf+vQ0y3yfwuWu4JNT5KmDLepetOMTpjH2VL2VC5IZxWUkzt0ZAN/Lk12Gnvu2
 5tXFhBkXgMo9tUBa6AYvB61El4bafMdQXKbp0A2X17vy9H4yma6on2YYwQvrEQ384mrtmm3QCTZ
 LSk6REwMD0xRgmIIigguBZ9TzVEErBODQgMYDQzpEKAJOtrCJ42+fmKRlqlmBbgsjMc4xJPuXIN
 Z3o0FnfhOgqKMYL16fabuTqNelqHFFu14nZLzAg2t7eiXbti5OMpXHzBjhNA/K0+CfWrGWQl7gQ
 6/fsFzHxfWS30dXNhUUTwuSUR7Ocj2uV0nVNSCEK3379O0cW8LQPC3qWWW9EuGzsDUApAizyeOq
 mzlXZWwgu6fLtQXZMyMgwA52S7g8QoNjqu9Dha0tnlxAa+2sKeec9X3SWzON2ZSS8vH08iY+F1K
 loVGMHrqvAMfmyiWy1w==
X-Proofpoint-GUID: 8nt4y0KgQBqZKEQlxL7fhSleH6EvsGHF
X-Proofpoint-ORIG-GUID: 8nt4y0KgQBqZKEQlxL7fhSleH6EvsGHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140063

Add a second interrupt for LCP/SRP DDR DRAM ECC reporting and
interrupt-names ("llcc-ecc", "llcc-lcp-ecc") to the Shikra LLCC node,
as required by the updated DT binding.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..ff572c003b39 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1108,7 +1108,9 @@ llcc: system-cache-controller@e00000 {
 			reg-names = "llcc0_base",
 				    "llcc1_base",
 				    "llcc_broadcast_base";
-			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "llcc-ecc", "llcc-lcp-ecc";
 		};
 
 		gcc: clock-controller@1400000 {

-- 
2.34.1

