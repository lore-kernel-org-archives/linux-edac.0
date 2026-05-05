Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FDA42EEB7
	for <linux-edac@vger.kernel.org>; Tue,  5 May 2026 12:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983947; cv=none; b=N3Za8lr4sKSpsAoiFMaSnVV0TBoRgXqhFS2a6cNejHKtD3h1vwHeN6eqlNlP2zfexZcVYlbWOZjQUmiUoZh7U8R5k5bL5kq0EO4GnFyHKYJeR+5nxNIviA6h26eRE41adXgMA34hfdxr99Nxjo3+VUSAYm/vNTdcybv872SVGZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983947; c=relaxed/simple;
	bh=YOcZgnUU7aNUADZbewVlvFKcPy4NxigrSCC0vnQKVC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USfKvn44ueUVvy4WMjVZmCHcSojes//g5wDtTLHIu3vyUy1EE8tW8fDT4FW6YzYfEnNCMYZuuPgYfSIOs3Oig2RfVMOo7FiNuZRueDjk6gIJKn9JECn7MuLU1E8PwQy2GHVqTpwuMtD0bI4cGbFmk7OXstpYcoWpP+4/vzEjsjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elXwbKAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjY39Sqp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elXwbKAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjY39Sqp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64595WXF4028219
	for <linux-edac@vger.kernel.org>; Tue, 5 May 2026 12:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cezRDIDuuGgXSugZUDs0zZVIa3d2l+pmJWevmxHgvlI=; b=elXwbKASq3qWKy3v
	e4Npmt6BrwzXXhMyMhh8mMOfkCkGaa2hCjj9DdHm4ZHNhyPS/5nNEZphaOsBeAMP
	hya9Due/LQzDgnRGwcT5kieWSAqSpbCj/xWXVlr0c7NbhYkgvZ27AVLgAyqTrLAY
	bJ5EMqtI/thEr3G/LluNuy7EGovejlgM50GPfuzpMeOlCX8mtfCupYjbFLPRi1JK
	XmdIAAY+kFnEKTGkMbduOMFMw3DPfahp4ME50z27QQ85SXsmBGIeEMnFYnYReP+2
	vl1kl2hjRBn16/FflTPzhJFkVaVVyBIuPvMvZ/syTEJCJZxdKBFMxLac/pgK5WTy
	eFqcNg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6rrfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 05 May 2026 12:25:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8353f5242c1so442860b3a.3
        for <linux-edac@vger.kernel.org>; Tue, 05 May 2026 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983945; x=1778588745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cezRDIDuuGgXSugZUDs0zZVIa3d2l+pmJWevmxHgvlI=;
        b=hjY39Sqpci5KhWFzV5YMtKt2Wca7Y75nZa/k6Mikm9F9w8cnZ3TqZ7LnkrEazU72ly
         ciIyqCv1qvSk9wYa7cBRUCou5qmSRXcmDU+T37XgO+xZSwAWMAounojzDpKN16Z81HWL
         DEkTd3S2o3kFlWE5leX3f/OgCFYys09ukeCGPcvaePIWE9aCiVhznPA9rKT7sEsrYqmp
         UK80Ijs1i5glSWaFFXxgn3UB0RTnH7UDN4PtQ+6nPVYbXaPb/CqcjFEI9uK+SjV2mOCK
         ppVLpxU7gkJAs1TIXD1XDMbQwzddKuVHeZOnozGflqG0nXs0H3wTRFmv/mEgT31E+d4C
         RTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983945; x=1778588745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cezRDIDuuGgXSugZUDs0zZVIa3d2l+pmJWevmxHgvlI=;
        b=UguYpTCRh2RnspRymOi9K3a/m7wmYytwZ6n7zOX8wRxUJ+RHAwIYUR98WpbiLLTpFS
         Xuhx9JV2xr8+3qHDFvkPsbczaeBw6VLuA1g2DjfGIrm8rwOs3rpDpLpXxNoFXs9MGGnS
         tCDhlctvpZSx32qRtmfx//IiB30TyRkpAgI6L24oWHU1vTeyXimbghxTBGNi6JGQ9/O1
         a9kwiCudVDunRN4MZR0LxrEnf90yFXMM0d0RMKGt+JbOFt2rYVIPm49cRbCsY3hnIRcc
         VhZzxqyNS47djhZcOmdG3Tt8QTfozpbFbDjxJyJcLd+UTDa6elu8pPgRZt72ElFyph0i
         0Haw==
X-Forwarded-Encrypted: i=1; AFNElJ+0xwSf/Bk1Kfpi3mduItt3HoyPtmE6xPOUJEiAHgPfzJByYXj7mlBzzlO1Bswh87P/sx/0P1TlHI+P@vger.kernel.org
X-Gm-Message-State: AOJu0YwVGYIMFiaa2KHGX5BB00s38AJjRBis8Fs5rxgHqSyHShqCisak
	c3zT5nX/rTFZhfAo4DHTWeAg7UX5inFnv+wxruzCeQl4iaBRACEBMXgCAZUA2CNw4GBFJcc8MaH
	gxtI4y70I1F+ZZ82fD4lg9IpVpJgGnmcg8vGogLRTqivtWnrIj6RpLW3IyvZhkK3n
X-Gm-Gg: AeBDietLIKdL6Bv9VhI/DeLSYMamNxGBYDIU7M6SNhoi9aFT+Be+azPx+mCZAmbDhAy
	etrPISvWzB39lMozP+rlRWRIys5Ck9qJoBpoNffjYdq0U6SEiFmFutoRJiWX1hEeO0KYjbGMTDh
	oPt8/3AbEW4XxwFd/veUn3tkesItbOA7C+zmEpqe21dNz2wA/odBHaUkOLC1TtUZf7YDSOoWGIv
	ANeWl+hH8qV9qAj7bK0vk9q6nz1l7XkECtz2SATInvFxFkgp1whPOjL5BtRLFJwk0ZstrHaIMbk
	kzVk2zumGfEusGYOS6/dcBvlqlUZEY3V7nAUcK/1c47cveAnyEvHU6pwK4yIkf1gmRwxn6qVyhR
	8FBocGTefcg86lIzIO/VYSyfRL17MtkjOIl6hSOJP3/7/ZHs0xxjXQuabKE8AXF0=
X-Received: by 2002:a05:6a20:6f87:b0:39f:6343:c6e6 with SMTP id adf61e73a8af0-3a7f1d53191mr7943159637.7.1777983944527;
        Tue, 05 May 2026 05:25:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f87:b0:39f:6343:c6e6 with SMTP id adf61e73a8af0-3a7f1d53191mr7943130637.7.1777983943895;
        Tue, 05 May 2026 05:25:43 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:43 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:52 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: monaco: add AEST error nodes
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=2471;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=YOcZgnUU7aNUADZbewVlvFKcPy4NxigrSCC0vnQKVC0=;
 b=IHRZKVkkhxU9y02nDwnaD6SzrjQm04m+20HXWuq2/N4sWJObINqXltUQZ1/qyBP+tvKxUc5iD
 JMepAm3K+K8CN73vjyA6Efr0HTg9ztmpukLEzg04lLRt4vmu3gpMBMM
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExOCBTYWx0ZWRfXy/uveCV4iWOR
 YALofnLR9KrmMcySfSPjsb3Y1axqy2a8QZcjf8HYoHI94GzGcG1Yad9Pr5NkPCxGplx4EaVsRTh
 pMNSVT6B1uuaIry4iekuQ8LEJcdak6ZW32NM9WhfwvgFlC4OY91wsiJr2rZSiE9ysOJ9JOdifjo
 8h698dPQexWTLYg/C0AaNJdwa8FaBOr86KkTGSmypAZfTZ4Xg47KS7aGGumHlluNQNdRIR2OH2z
 pn11kx84i3Ki8J6QSW3K7m2eO/jZ8IwbZ4m3+C96bfrBz/tiVgQyElbuJT05Lj1NMl99Fe25AC9
 w+gqXifJ5KjiaWwns68bQTkEaEy1qoTZCDUHRxF4onJ7YQXZp/e1eVQVAfTi8uGrp3LsO7Wfdoy
 Y8CJOd2WuVOD5+j/fhZVdGD6GRXkoKpmf+bL/2JEAwLyRmK4fVk/K20FOorf+dS1/q88kV0FwOK
 QE/d/vOjTGCS2IApbfA==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69f9e1c9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JAhf3ahiasQHMHGiI4QA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: mSDD96OcJUAmP1TY0J0MenxjgFiIBZ5u
X-Proofpoint-ORIG-GUID: mSDD96OcJUAmP1TY0J0MenxjgFiIBZ5u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050118

Add AEST RAS error source nodes for the Monaco SoC.

The DT describes a processor error source covering all CPU cores and a
shared L3 cache error source for the cluster. These nodes model the
hardware error reporting blocks and associated interrupts as required
by the Arm AEST specification.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..8e43ceed7d84 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/arm/aest.h>
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -29,6 +30,46 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aest {
+		compatible = "arm,aest";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		aest-processor-0 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <1>;
+			arm,record-impl = /bits/ 64 <0x0>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_GLOBAL>;
+			interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "fhi";
+		};
+
+		aest-l3-cluster0 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <2>;
+			arm,record-impl = /bits/ 64 <0x1>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_SHARED>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fhi";
+		};
+
+		aest-l3-cluster1 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <2>;
+			arm,record-impl = /bits/ 64 <0x1>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_SHARED>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fhi";
+		};
+	};
+
 	clocks {
 		xo_board_clk: xo-board-clk {
 			compatible = "fixed-clock";

-- 
2.34.1

