Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943150;
	b=PB+zI+3idO5dJ+YkqoIiTCOmlxLXMC6DSCsbQaFPAlNaoPyU6yhb3W2mry999xQr9URK
	 z4QyC3noW5+N2uPtUhnLeaShsT/pQX/OeNldh5FSeyQb7rqRviGQomNwwzNpwkAuf9s3G
	 W7bGxYTdWXQC8l1Mfj+1gRJQkJJZEa4EMwYKRCP8Tm5g+Zwx3D/JJ3NM1VYpZW++lTTxw
	 6tOQOvhNZvB6dpwfQpg7fqJ90abS8rwvi0QuKm0krNwQ6utB/6+YxNzvVpWO0+uhZsYPi
	 FJDItewDNP2gxUHYHDOQ5OPY3LbOK1ohPNoa7Ccm9EnQHn7SN4bLBNqm4LzHYHY36+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943150;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P64yP0RrCxgP9qn5wf8Xtpf3P+cqpGU4XTo5fll5/sk=;
	b=oy44ESsJJBMLI3xgscUdcDtnTtRyFaAvYfcvrUuh00Y3iDKBzasIWJRlbIEp8rey3IiE
	 3DLnRpSpz4BfmLlS0+bEqDzMV1OVS6JKQg+wFKGrDljXDZ7mIKjpQk/0MEcgFoWOdpaMM
	 Tov3jcnKwJQ00jstfFWpAHuOkMQTR2d3stZZXAsKzv8IwMdr6G4FwW5v3Y60yQ54l1bdr
	 0OiDr/WNTOsuOzxF3s2bPFksmpVN/78fV0/C0PqNH96oQ3zfds2Tko+yfziDv1xs31UWC
	 mi+F1m1BoSzuJ3Y5c0+2KqEK45/WJqooc8mrUJ3QBdkJZ8vHVa+gt59bEsyZYIYEPuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hkXSH2lU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZ7o9Sh6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4422A606A32C
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 19:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4422A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hkXSH2lU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZ7o9Sh6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ5vpc1147387
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 19:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P64yP0RrCxgP9qn5wf8Xtpf3P+cqpGU4XTo5fll5/sk=; b=hkXSH2lUnTJOZgeo
	cw2HIU8tUsiI3jryBWqsAgMWzxIno/nxpSwM0W+PUou0vwlBNq2eik1MGWw+6D7u
	KfXYpcW2OmsHrTPlrrUA98z0/BzzRIjsDtyVBWVgYy3GKhsVSGqEuoEPW0Ug/WY/
	jKk3qiBuzqK8d5uznp+UvxlV5MEte8euEbmL3wiD9sigkUjeF3subD1RSotLkxTr
	pew1BMfDzEpY4si+fLOjC9mbpDFRvQ39mAZTS5Tqv6Dl2BWUpq0yxWxYqDg9oj21
	hxszz4pyS57oSXOLf7UW0LLYso55IBJGqy/BmP2OGI7Hdxd6QATtKZ8gCCgktBy3
	7dOW7w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0v1fg953-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 19:19:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-339628f2bbaso25597eec.1
        for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 11:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794943147; x=1795547947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P64yP0RrCxgP9qn5wf8Xtpf3P+cqpGU4XTo5fll5/sk=;
        b=dZ7o9Sh6Y3a4okWmZPl2nuoXKfCGLd3a7beYoH6pNZcuogpZ04BjsnYQqEdiwYg9He
         h+Ueqmxmc3F6yJZknJkk/nTHmcMpzkYzWgL+4CHeMGmV1UWDDdqskfRK55yb7KGUM1A8
         q/n5G8F/zwskgq3lj6uQ0ofbzgyiDlaY2XZNCjuDzTo60brdNmlKXAkYyUdML1o7AZW/
         vqgjbA5hYAmHV+G1NU2w80YdPrRSAiOvuPwwfU1jg7tbJuKMlGvvt9mZSQWJzE6A8gK3
         LjrHYQnNtl1BsiT1gtnBVh7q/7oyq7N/llpAdRz4AdzgoDROG1UyAIGcr0vs6RdYUxk6
         gKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943147; x=1795547947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P64yP0RrCxgP9qn5wf8Xtpf3P+cqpGU4XTo5fll5/sk=;
        b=trJza2Ptr/bL3G7rv5YtON7SZhMMqVXVEDgoRR2Dw4LYlSBzlw61Uo6hzjdqalZJS+
         ie5UC8+ITxQRx1k4/NEk9NDsQXrIO7f9bfVfDetY5If+Tl1jOIQsD2RQiaQbSByTqX+O
         RG789WxmjBP9CpBNN4RrC+VNL9HFiX9Mjr7xuCKWYeppHYxiGdTBUnWsrpPL366pIHd/
         mtcm39uiPEohfMTkJgndMtJHT6rslVRD2eves5NAuplC2Xi9YPbc6HFD/lt5X5kinyst
         cHdEbp2vOxCleGFrcBZIpu55tU5WQlGyAz3/amK4BRtR1XzJC9KFm7B1GIQzr1fZsZoN
         gJ4A==
X-Forwarded-Encrypted: i=1; AL+hErHZv8wvHXX722rLg/LotlLfkTARYHGcMKZs3BinzSLRkpwYYQH5VczP/BlBVoSeuhvzSm9RmYPQbSaA@vger.kernel.org
X-Gm-Message-State: APuU4Z8oiQ6bvU6qzoQUuy/D6z8eUQoI6hKfKDPULx1QVRmzEGfV0qbS
	KAW2lciflgcTmlPcUV4KMDVrle2FE+NdzI4+UCMtkQqHfAnO/Cph18nTyu1L5helYXhHl1+pKqX
	FZmfvy7wP5LXZYw8+K0hbxO3b9voeSUJRT3vFU4yQy6G4gC9Vmd/wZx6bs0ddp4kD
X-Gm-Gg: AZFdTZfldpOEKldLsPNJEF7WLVO0wExj/Wv4H/ZXdoW/HIjV95CtG3vUpyCqHMsFB0l
	WUKNgX0QirlV8/JxmqYC5m888jFqNdkXeYp2aBqMvgW/cAGhAtY4yjXVVVYY+jNHPglHqjBGIoq
	IdWmMTow6BvVW/ygDC3q+9YUVfabCrbozsV0t8ARXFod4zpB1/COEvUyzkjYeCevsnlJ2Ji3DR1
	CXTtP85XUhUIL3W63jfoNXPCh72+SKxyxaelccudYJlMayIDvwEV+eLgYZuHNVuEVSA95hIalW0
	OTDmrirC8oxebknoiwFn475ecdfBSy0q1NiPxwkLPK9oM2MZTDwVuBtFCEulf4SGBKJwPn5xoee
	AI6cqEzV+NKR1vaOvmZb3v8VzJdoUL2NA55XOEcGaT2UypCXvg9JLWD8teiUdxYss82nJtMxN9/
	zU9VyV
X-Received: by 2002:a05:7301:92c:b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3827afccfd8mr520361eec.0.1794943146966;
        Tue, 17 Nov 2026 11:19:06 -0800 (PST)
X-Received: by 2002:a05:7301:92c:b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3827afccfd8mr520311eec.0.1794943146404;
        Tue, 17 Nov 2026 11:19:06 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm32197eec.9.2026.11.17.11.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:19:06 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 00:48:22 +0530
Subject: [PATCH v4 3/5] arm64: dts: qcom: monaco: add RAS error source
 nodes
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-aest-devicetree-support-v4-3-936587251e8f@oss.qualcomm.com>
References: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
In-Reply-To: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        Avaneesh Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943110; l=2183;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=rzIMy+dr2O5MmVR74ypVHrojU5YGoqey7SSKaB74tcU=;
 b=Cqehjv7sxt8HmB6BRMDrXCbGAdNFBY66C3nTKtWUTzfRwuHm3f0cD+YCdB0dJs76q/VA4mOuW
 7W+AFJKELTqAy8VkBh5ve3jTuZ1w0NyNMOsCc8C4vxQBn2t7Cnxf+lG
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-ORIG-GUID: MDBHPCEG0UQ0NL0-yN6vAhgTB_1z_bzA
X-Proofpoint-GUID: MDBHPCEG0UQ0NL0-yN6vAhgTB_1z_bzA
X-Authority-Analysis: v=2.4 cv=IbgSymqa c=1 sm=1 tr=0 ts=6afca8ac cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KdVUwichBgNWhWzcVTwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfXypHPh96ZZTf1
 rXaQ9a9I3qyQPGdy45ZdDLjdVFTbwCpLo2NEAqF91vq0m+fW3tj3F8Gs2I+vhZwiDyLuHuX9XUz
 ZdVgv+oSZXZFifmqd7pP8JhjWGfcazMBHsZIYs+mC7ysz/DnHGg2CxPX2m4s7QSn5agWyNexx4N
 JURjt9+189yTTAsrJRl2F9CYSpKLaTu0MhSUjkBRkWQFu/hEPKDwkc8wzFw62C1mLT3Z+32njRd
 ggox3EdHyA+yopZ+aZKyQeTEPtM51eB1tODRz13hlgH76wtxVrfOur2k+LSQVTgcUKR91Y4/S64
 eC6XEjLgnvE7NwA2kO0LKKnTTdMswhrdUKvSpjT5mwRbZVrmLqXL1Id4fM3LOcE0nfw/1gZk70h
 kZPMAxmC63HcqNdGZKoWqVUsEtIvgn+hUVNmsyN1Nu4XegFZG1TWlkzovDk3k3LfKU4IIc0JRXs
 gIffjJD/vPvxllDeMSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfXwflsr9jc13OZ
 RlocwSqEBwhF1iF+7QNDGnGWzA9ikZ7wFEis3aDO/tAh3IbF+1Hd8jZj97wXMVaPxaZhoB6ksEZ
 haIKA8HtfzgmFJxTMdhUVC0xPvtP5Jk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170076

ARM Reliability, Availability and Serviceability (RAS) enables
processor components(for eg cache, tlb etc) to record and signal
hardware faults through architected error records and fault handling
interrupts. This allows software to detect, report and, where possible,
recover from hardware errors.

The Monaco CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..ea60d6ade02c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -617,6 +617,37 @@ scm: scm {
 		};
 	};
 
+	l2-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		arm,cache-ref = <&l2_0>, <&l2_1>, <&l2_2>, <&l2_3>,
+				<&l2_4>, <&l2_5>, <&l2_6>, <&l2_7>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster0-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster1-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */

-- 
2.34.1

