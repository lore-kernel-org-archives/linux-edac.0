Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF54E4418CB
	for <linux-edac@vger.kernel.org>; Tue,  5 May 2026 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983941; cv=none; b=YXSN3KHi3h3Y7h0r4SJJmYdONd2276SNHPP2SzQuldfYJAZTI2a9lA37xGUu5eAbh2eWVibyksdBI82qR5uJDqFXxBjvn5180qdqkqT47ubY8lWYizdIoAwX18KFdzWBh+ECDsKG52BdX49LKrQFH8uP10W27jdeLEeRIP7RjiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983941; c=relaxed/simple;
	bh=NLhQZWVqdvbCGj18sMVaKtq4ki84eZ97ltTwhZ8fSS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oFH8F68c4z14Si6u8/Vnt/aRu7wkK/X/Nk0r6TfHZLjN9yYA0kWPfhrzvc7k0BtRuC+FPLJmqwpTgz0Yk7fu+UMwkkHjhQVwvUq24nFjWibrtHQh95fF8mFCB71uqTIrKfkLRCpMWwx1lIvvB5+QvCDxaOSWegxqY3/txtwNuqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=allamCO0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ac6iDUM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="allamCO0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ac6iDUM5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457bwgt1187939
	for <linux-edac@vger.kernel.org>; Tue, 5 May 2026 12:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=; b=allamCO0vI7TADws
	VkmsVg/dDPUk5xTLfNNwGzjUMCPs99tz4e3s53RYkw7dTDwYAMhyNUD7wtfbrLkO
	+iyUD8p5NH9a6mLXqj8ibDCujaUSEvlLeX9CR5E+mfMLAXeCHSiL0WlA4hdCZhpW
	UkuJyayOxkbCeIZYNlpQKqkPA3WLBrJMNrjndH30ISHwuaTY8gmpT3GJF7225Zsr
	GyoCeZUTW5fLDtXNB9t3yk3P3aGYoqoxD//HckYLNbGzhwpje4SE7n8I7Tr+Iu99
	8YbvSCt2oIEXPgPMhYzhwMzM5gdkICUGILNHEMf2Dbkngce4wLrRBiv5tNyooZko
	M3a+LQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvgca0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 05 May 2026 12:25:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3586513febcso2528606a91.0
        for <linux-edac@vger.kernel.org>; Tue, 05 May 2026 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983938; x=1778588738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=;
        b=ac6iDUM5YGRyTDUf3D9xrybPUHDLpva9Y3L3VMspTgWFbs7NMtP3dUMX5nlMnyuyyn
         XJGg3MAPOa8KDFO9WFyO/yRBkQbePX/SiCWrbZZTWl8djSuLEM2GtAzhs/e14zAvRA+G
         V1G5BKJDTRoQdV++oDdlh1T/mH8LhjGy35cOT+c5KzGhGhD4zWMFxryUA/1C14+laBk2
         bnhNv0H7+tSaIt88toTzQtNHmL7zjZX2VmleQ3pjpKX7Zermue4f21Qzwv5EQJIzfN8q
         5jgVviiJD7d4jVc6InwBO7iZ+H9P8YBkuBhzSaWipoZi+7EPHDmycRF6fcfvkeY5EUib
         xDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983938; x=1778588738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=;
        b=efps1OMZmtQA4pvPpj0XIMzz2SSgonTlus7l21TKIL3w12ZVFYZ8IKH2whLB4OC7Ri
         WggXsV8gzQrC5sl69wjH34p6eqQqQxBtb8w5FpSTKvF1oGH0e+J0z8mtGQ5R0ZaCTtw5
         lxbx2jI9454H8AQZQEYx3d+MLfrVJAMWvQJ0K5dYzYViZzedsjGMzvarAliUJYshs8kg
         nZIPdrsXwTUoBhRTz925CONjblHQ+xd6z4xF1XULSJ4ZIeboV7aidjPw9fSv7yV9n577
         bMF5meQKpN+xAMVR+ykDA55W2dF8xoLF2qjo9tOgKlOBp87l5pjE84xUdmBtWSeba40F
         Qv6w==
X-Forwarded-Encrypted: i=1; AFNElJ/mfIJaE6morNW5xEzHS3nsi9Z1HRqFySCX0YySe9wztj8YgPZ0+j3V/9uiZdABHERyZEL6X1GGOTR3@vger.kernel.org
X-Gm-Message-State: AOJu0YzivcjsTARGCrNsL4OqGozoEC802/0jY+UUPqev20bj3cFYNx5z
	KJ8hl5YOiO63++UA9C9HCKPxr6AmixxUE6t64jwXEqoORJtdgrldfxD4ISJIt/aFd2oH043ayLb
	UgL5L1yIqNZAWlM0NhL6QI8jXSawep139GE5M/oUkgZTt3e7G/ozPkLL+EDmbDn5s
X-Gm-Gg: AeBDievCQDbcDzml1SHFb50y76m8WfsONOvtL712FkRbraAWtZLO9+RFYVLdOUEQe6K
	LCHjaHQbdtWEMuGSRnS+RAPhdXJtHcC0dPIDGhAMY5oKHyhG/KLxT7qMVUEWx3ZCbkqsIJGOtjy
	6ZOim+G7r3v8o7nc7O08NOVWsIhBv3pZdAf5AZN2C2BeDX0iexIgsZru1mnJNZYKqIV+xMKjNOJ
	AhAyFC+NMu4pBXF5VYfeLrFa0alDVPM6aaBlGCij5SEO79xMxrx7pCi8SIXxmTdUhFj2WfOUvz2
	a6eXgvsllK4qykbucSBDWaK7URpl6k1Cev+ncuxq+7q8ocXyiWYIlEOummKkUOCI9AFshLxPa6B
	uvz6j6Wa8SpQFAEZpYdnYokwHpuzeDIvDL0XygFlQvk6a266zlJ9po/w9O0nHf08=
X-Received: by 2002:a17:90b:4b11:b0:364:b4e7:6705 with SMTP id 98e67ed59e1d1-3650cd4b1cbmr8148872a91.1.1777983937602;
        Tue, 05 May 2026 05:25:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4b11:b0:364:b4e7:6705 with SMTP id 98e67ed59e1d1-3650cd4b1cbmr8148832a91.1.1777983937065;
        Tue, 05 May 2026 05:25:37 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:36 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:51 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: lemans: add AEST error nodes
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-7-d5d6ffacf0a5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=2483;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=NLhQZWVqdvbCGj18sMVaKtq4ki84eZ97ltTwhZ8fSS8=;
 b=AxeiR1PoOYSoH7YgiXOYSRmTYri6J2MZYpG/MV/d06jya9y2h7Kbv5MveGf0exaihAYq4bCo8
 76Uu1Oj72luDypcGDUDV8xei29hbuhNCmXFO8hpt2yop7HOiOOdTRqC
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-ORIG-GUID: z00y8XKCWkLo0a97ir6IKRoXScZUwynn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX9ZGr/tHGoSXC
 FFuQTeQQtKkvncDMFz+pdeHlaNvIu6MUXPPdFRkvmqhdQieFaw4HMLqvrigkgupfyZIHa2rAIyl
 tOzZZB4LtSsGfrPlSVpiK1o1DIqobReIEHLAFwgKkHpfGMCdtg0PaOUt613Ms+D3/OxiwPz6UbP
 SW/Q2fp3AFNtMPtAg6mJv4rWqbY91Z8alTXED/H8w2NlwDy+8BgiuGLBRkOgHuEorBNhrQOQKP3
 +aEAwD8lhQKu6AdTzBS4L3UW7YPXQyGIx6qd90lHK0UC2ONuzSFrU6VRjZ7OCqrLdFDzW72JaVW
 jT9FNqkz0CE/veFmZXZ8x5LQkznRn0JZXsgLtNk8WE0qOYENwAhMLCl+AwvQdOTqUY6YYvIz4J4
 HtJP9jxtaMQjzYqC1WMlEe5a7njoT4ZWo2DHY40tTer4CkmzCMQ5rhxn2MaXlWsr3DRAsEqFyY5
 FzTXjseW64LYPuegUfQ==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f9e1c2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FY89ualHrA3BDT43sc0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: z00y8XKCWkLo0a97ir6IKRoXScZUwynn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050117

Add AEST RAS error source nodes for the Lemans SoC.

The DT describes a processor error source covering all CPU cores and a
shared L3 cache error source for the cluster. These nodes model the
hardware error reporting blocks and associated interrupts as required
by the Arm AEST specification.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..199ea1f9a8d5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4,6 +4,7 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/arm/aest.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
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

