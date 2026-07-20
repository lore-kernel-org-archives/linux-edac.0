Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123383CF1E6
	for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535625; cv=none; b=XsazEFBNULWE/MCMTZUD6q/XF+tOjbjkjm5AUgfBgQvwYly06ONTY3mWyMz3nMOlUeU04F+mNoWiRSehOXJxT716Yc+lYkxzzcieU3ioVs31HwGxLLSJqcyxAGxjl7SSES8UTgwc9B9Q+U0+nJPyr2aXSHOzxj9VvhIOdmbbE4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535625; c=relaxed/simple;
	bh=LguZjT7GKeUUgrj51jQx7Dm0HFaF/8/45Y0SLA/wlxc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rnlvyBg0zw0+/Jfpp4Ov70eFk5Oy/CkxXf2lCGp+hGP8YiiCUEbisvpQdv3z17zYmtyzTUr6Li7TS7vs7t7K2gcDUBDRlTniHSa+/ukk1ojG+28DFB0MeQbRytYSjQ99Z+q7vnt7m0D5ggTqv3k9e6UaGwXn9D8frW3D3GV4qyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgiQ0gpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3q6HSE3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgiQ0gpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3q6HSE3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76vPt1896152
	for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 08:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NfCf51RUqor
	XyFdsLGdUkQI+nh5Md50HAkZl5LCPKlQ=; b=TgiQ0gpRl1uVJFXlCuHqBR+t/kE
	0rcRDizbw6p1LpqnEqV16LB5z7n09pK3ru+4QI1V5TyFpm/9OO+DvLZuzq8uisDY
	WYQvxhhXuktnpHzXhIfczeHNAp/n46dyNqgZsUBum/TbZup0TW5LwFnEmRKajTCS
	bFRQ99ldAbk3h/jfRq6lMLZPWiHPOaQuhsNB7bsncDLASXJWnn0QVhUMrxLkxCta
	3CBV/WVqNiHhSumZq9E0o86l66JTG8wlIgMIkUoGI9hMvICIVLKldDJFVWRbWDZr
	DRU6TfBczFXMfKVG/9cQ0CJ/+9MjjfH6/fu0s4Wcmk8iywQqIe6YCRkYasA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0kr9an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 08:20:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3883dc4ad23so2835408a91.0
        for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535619; x=1785140419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfCf51RUqorXyFdsLGdUkQI+nh5Md50HAkZl5LCPKlQ=;
        b=A3q6HSE3n3Kf46HZFOcLEZbfuUhaDhUZYXbhV1gzJiFBXKPI7tcoatP5pjvldMts/3
         XbXZXS657x+SpTEAajf1jg1kAUI+T134fuDogiR2WDnfBdMmohk0dmBjTldRuhtdxWVA
         0/cI63ja8Sckkvkc8yf/Wl0ZfyWzs+cuyDzoiFPc81JFNgPGPol/0syZ1jKaPZuNwUzq
         pLLIAiOD1uHRwfwkAAU/IVCIL6I79nck/pTPlVQDHjSPsnFiXIwXbCqsyfsaLEQDKcx3
         2l5zC/iGy7QqlsXu83TnjXQffi1tZcqKtNC/4vnYGvIl4EF1ROQN3UAl4GsXdfxB8Dh7
         aE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535619; x=1785140419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfCf51RUqorXyFdsLGdUkQI+nh5Md50HAkZl5LCPKlQ=;
        b=MSYWpUoppUcnerZJFE7tU1N2idx7QfpmXUaOc5N1XJuGXMHSYbLKITd4K+tqxP3kHD
         WrfAN/7F5qpI4/akHtFZmHuIQRZq3yKmG03ekMLLzyQeWUdaF03aUkx2wWxwmb0ZAyKP
         xJI5cSYvIjBPT87bSVR/SwHCOgntci6DmG3rqbC1dQHBUE1lkY0D5SKl2JYstTFKeZ82
         WKeZTfp4k69PkS86joHdQFjt/ZiwDwzLOL739C2Ln1+C/MangNJIGeMYfePIsfYsvyEd
         +uJgLHuTlH6LN7PtHsWzMpLvZ1yGZ7ulYFDp1qnKbg5JQjkySZPfWKLBiKTGEE5iFG6h
         SOWw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8S0SLv8jlw7MdBuOLOiHvqwRIBkCH1+mPUU+zcYdn0SHOfGeDZdJX9k4tJ666VSxbaGzPFblsXW6I@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+cHo0IuvLJ7dyOu4WspEgF14NW0gtSeV/C0ItsL4Fk0ftfHo
	arQXT8IFi+bief9HTCxWKcUy7GY6Epvf1N8N1MZcaVzV5uRAaiealBHI0HZXm8YsYxkfqqfj+1V
	9kdR/lLRkomF3hWFVLkY80UKozJ5DoSEREZlbJSAFbWsSg8lNOdHGWKLUauFmNkR1
X-Gm-Gg: AfdE7ckR9BxdP/OfdsIJT1C+/QOUMibBjImHcBMJlHyiToP25pRy0/uQdPCIZxqjVen
	VYbb62CTXQl5yjXPHYoBWsXUBNJyxNUBNH+ma2ZPiwGUc0xQDyU6M5ZL2v+uGjFYodJwBDDqXNm
	2geBjIMDVzPAK6yff33oG5bYmDH+5ZGUoKaso2drrWs6Tep01uVpyYOwwDI18On+o5rFlGH7LPk
	QFN4nzyIHe85vx9TJ+fY51HL9QxROYBb6WzKhMYpsAbhVRuWRxQqk/sMHAUWOpvOgx2tz4qlemM
	VteWFi+5z7yRLGwOx2tcYw/VKO+U25cvGQrtMTHu0pADzXAzCMb5d5agKj+KNNI9i/gn9+8MTVS
	XITDz5DYgDJRw6cTaXsIY1kwmg9fayb0=
X-Received: by 2002:a17:90b:48cc:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38e4b45428bmr9482081a91.1.1784535618685;
        Mon, 20 Jul 2026 01:20:18 -0700 (PDT)
X-Received: by 2002:a17:90b:48cc:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38e4b45428bmr9482052a91.1.1784535618141;
        Mon, 20 Jul 2026 01:20:18 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7233688a91.5.2026.07.20.01.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:20:17 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v2 3/4] arm64: dts: qcom: monaco: add RAS error source nodes
Date: Mon, 20 Jul 2026 13:49:53 +0530
Message-Id: <20260720081954.1858180-4-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oPO0vNqXXXWwuZ20K0aysiI9XidIv7Fx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX/mBd2nIBrhbp
 QqGW+L+rFfLFD9PU72WY5wYVZJl4NDR6dhwkJ3RsUPFGNPhSf1aBH/pZbfFSuxbeNHKno5ZF97p
 WyONgs2lIcm3Ychf3TcjZ/7X7NHg5Ks=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5dda43 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hf7YQE2i2jH5Ah-ZJM4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX8J0V96VsXArJ
 MnubLRWIG8LnS3QpsL2l5uq1wRK6yxlDAQ5AF8KFUckkH+eZX6dCIV0a8tc0XxNq1NINUrmEQui
 ldk1IArxXx75IbuwgvL9JDhdKaHFNsp0wEiZKCCXy4YXrTlY/mQZDEyB8W5B8L4tB7M76vBciOc
 NXOjGrHPh9yatRJnbcUIDBeec27GQdQyW0R8uJHdwqRI0+QEq9krIx4cr3GjyG3/4DCc+iX7dn3
 FH4roLyq483TwwuNFKGJvqqqfga4dnwMyg92V409h+q4nCvh1XfzTdh4tWivKUKf9RCWrySq9wi
 MFyGDmNDYADmqBw5x7Gtp3IxVYaVgDH32yFEUUqAEsGnwR1h0matRyg3dxE49KqskYfEHMBPjq3
 hIy0pISjXcR08/aVUplgoZOv0Mx2b1tKc7WkoEWyl2YYL9qazlQTxk1rr/qScw6XeihG95jtvKG
 vuI3i1QdglGFI6bRKcA==
X-Proofpoint-GUID: oPO0vNqXXXWwuZ20K0aysiI9XidIv7Fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200091

Add RAS error source nodes for the Monaco SoC.

Two processor error sources are described: a per-PE node covering the
L1/L2 cache hierarchy using a PPI, and two shared L3 cache nodes for
the two CPU clusters using SPIs.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..4fbd1dc9a147 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -724,6 +724,36 @@ system_pd: power-domain-system {
 		};
 	};

+	ras-l1l2-0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		cache = <&l2_0>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster1 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
--
2.34.1

