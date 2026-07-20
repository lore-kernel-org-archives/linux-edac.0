Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C2A3CFF69
	for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535631; cv=none; b=fWu+Q8m2JEhRqrZLvvy/vzdOdRM8htzWJ1NYozdwFezaH24m/Wfqa0lShsRV905rU+EvsCpGMYNO22VJ8AMf2+XkTQ5GoNLLqhYObXDXNca2sLDKi7LQD52l9aYUFzHOqpzSt5Geqyyirj1JhL8OfzePa+WT9laWqO+ocyqJYrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535631; c=relaxed/simple;
	bh=aiv0AD/suh5Q8DfpHWahqVpLMyb+b7u4U+TQtpkkaaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S2B8phBy4uEdWo66PcZpAZnLxdV/Nko1ogYT3z6mhBWZZp4s3ZCwGSMT11tkQPWSqT8zkkWAMYtAh14Czo5EjkqzsKPgvaAqYdQ+yRIbpVOkof2HYF6sDzSESpK9WOaorQ/ZlNZXOeTusZLy+0xGpPz3LDWwYt1UDrEexLRSny8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIKteCJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyrFnLv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIKteCJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyrFnLv4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76fj81713125
	for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 08:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AySNhEFQOTN
	/wXML7Im2LDtrkYAXvBDqSS652rSteso=; b=JIKteCJX8orE7wUxGG1lubywkxU
	FALVxjpDSMQVqIVSP9ni+w2B6tHuOHYHc/kCtGMBjdGA8LnIluT8WIZnkVmhSHZq
	pnk/PyPdcAlKRAiqbUUcKYjM8GaNBPnjtCzOCQENpd6FCwapIoy32gDfj9QRPXQO
	l0C51Wsj865NmqRz33R0kts1lPqUaiopCaTyy5zGD1pVBZ/Hc6m0rKSwLwJ9EWov
	oys9OPjkHFUSHVyVDQcKpK4WMBOG0gNeq+8NsJHQbg5RnYQvoPPrCFjwVqfR8dOI
	7H1kynKrkL2kDFV4z25X6KxSNUGgDgpw97n4jCMww3scxLQA16NwUALjwGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c08vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 08:20:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811d5ecf66so2974669a91.1
        for <linux-edac@vger.kernel.org>; Mon, 20 Jul 2026 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535624; x=1785140424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AySNhEFQOTN/wXML7Im2LDtrkYAXvBDqSS652rSteso=;
        b=LyrFnLv4EslrdWwHJ0mDX0x3etbVQPgwRRD00utL/eLe6OypPROCB+bPGm0geLSava
         IcEyhX8AR3cfhc9T25FN3zHvuZChVP4v6eMp5kbe9OHWHL8prXXbx8BnN4p7NEflUssI
         XWgkYS9h8lpT+aJ0z9B6soc5OuRFczfUU1CehQ/xi7hFu0NBZFIIn2xVT01Pnb2qMY/p
         LMe55fBOMr/FuYAiB1VhnQ2Kt2AywW/UwprphzfTS3XmAnDBSQaOKkqm6qvGYsuBYVVz
         EmmfTljZwsnuGPaWj+JXWSWY6iMj9jfMxwtTq/jX9/dDGvIbs7fv9SQBc9sPUsvomEDu
         pgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535624; x=1785140424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AySNhEFQOTN/wXML7Im2LDtrkYAXvBDqSS652rSteso=;
        b=cTSP4l0icTceZrxGP7VB+1Q/PFhRjjf1cyrVlpgVoWXxoNb2/EkcRgbp7jQ89FPlI6
         yLcLQ6+7M2mLdrS/iyBOCAtNBoe+Ms2kFANxM807EdOqrIXmrh6/eGgy0MYob4tOrc+W
         06e4FejSrs+y0RwIyNH1I4l3OXAuxT/iXMjXtV+A7N8G+SQ67wg4esvtuYZy/z1BVBIU
         z0i618njlETZRrJRGDxPe3H0ZghLoiFb7gug73R6dP/G3oMFRd5hh3kh2okDWif36RoD
         6UQ0oYD7ci8WKerRrlkS//C9sUUoA8+c0pXmtB4GqsXIwxUF+iBRRhUmSlkA1m0q79qM
         6Jmg==
X-Forwarded-Encrypted: i=1; AHgh+RqCWSAOVSDsjZ5sc2OfcwBePFCHo+zmTAq3hzu61xzmHTz1rfpxfXm20Fbs6kMIlaYzcn3/MWKv1Dpj@vger.kernel.org
X-Gm-Message-State: AOJu0YwDsJjcJeLhE+BUc76PIYFkTDUlvsG6Ynd+LxD5kgBL6LP2BuwX
	ajKg4Gg41fnCv7qN2LtSbwdqy/uTyNR+ktMciRJNgC2aW2ZUG4IsDv8N7F3VGimw/OlDBAVsM8T
	pBPWMCDexLeXch9rPxIOyQz/wOjgVr9ep9pLwlFlJScPPF2t7a2wszdF7Z32qBzaH
X-Gm-Gg: AfdE7clkys95eZs1Z0NeAvysJ2J4wYhc5BQWTF51AkrYhSmHC7+9UZDyUvPv70vGPgA
	fTMTcZ6YJfo+5mDHW5M9MzR3aCj527nvmJ6cRT1A6JPEzCdJgQn4Zrp3VqONLjSP++KCw1nszyb
	jvUZusV9Xs/x7mvq0mv+xXQXubU9bZZgLk+afyM2juSGbHea78MwVOJEL9xzeGrJ+Kbl/S8Vs8C
	PRAgEHIH7N7d6JLc2cLVkzFmP6e2RQw2pkZSBQ1oBOa4QTmPJwagKGmXW9DOX5d7ka3y/CtzX2o
	36Jz9akj9aw/Ptd3YuafswVNox3KCfXDxUGKT/dGUASRDZZgmvQUdyqPOUGwgtANhesWerM6q3B
	tOmhZ9pBaAzpG3/DR+ZsCo1aNXV6q4ds=
X-Received: by 2002:a17:90b:264a:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38e4b6044fcmr10163020a91.6.1784535623925;
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
X-Received: by 2002:a17:90b:264a:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38e4b6044fcmr10163000a91.6.1784535623504;
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7233688a91.5.2026.07.20.01.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64: dts: qcom: lemans: add RAS error source nodes
Date: Mon, 20 Jul 2026 13:49:54 +0530
Message-Id: <20260720081954.1858180-5-umang.chheda@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5dda48 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=isxhWOj3iQD9eQR5az0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: EgOeAcJfKi7XZ7gtTNK6SM7EjEPzjouF
X-Proofpoint-ORIG-GUID: EgOeAcJfKi7XZ7gtTNK6SM7EjEPzjouF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX9DJC42DmHzP5
 s7tZNoD43EmBiEn0RsugiImUvbgOUOLNqLqy8Wa8Tj8P/CxT6mYShlNsLRZZmU0lLm99hJNbryk
 2czL6jDV6Ey178EHz8GkOYmpZs0vpD4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfXyWY+on5c0V6p
 KQCAjgCVzada7GcLxGYmiju+iWOTDBUHu+ALd8d1UV+Y9eCfxlObkepxlHIAK/hR+pSFLkHdqSv
 VD+PQ69NnhHxk+huI+yfLNRAH0Zl9jXPTM+y7ccwEG0KxRP3ypc7w0/QeXOONE8/v2Lo2a4Gv2I
 qUsYSShPjOVZc+rTHSzsqFeU0Q6TOf3ujTnFpKduexm0yb3oGUjmJ/ekeVqF1XUOgWugvUoYzsA
 QhmZCDUoF2XbsVIqrDk+3s5Bqiigy7HEIjY9+feKze7CklNL9W3MfKfkAth3WTkWk5ql5rMnlPt
 IpNoSuNDOxDEnBv2ktFkp9BnVbECnF3qKv3M7UK0/UreZr6UMPix4adhoX2+TSGLR/owD6WSrjr
 GQM5pHhj4VaT1leq/8MkAqDTppSNwxtWhTbuP5e/gBz6OimrNaO4I8pzV0o5fk+Do9RbpKnIF8X
 qHKwvQTK9P+Q1TSYMPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200091

Add RAS error source nodes for the Lemans SoC.

Two processor error sources are described: a per-PE node covering
the L1/L2 cache hierarchy using a PPI, and two shared L3 cache
nodes for the two CPU clusters using SPIs.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b51..64d3370cba82 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -619,6 +619,36 @@ system_pd: power-domain-system {
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

